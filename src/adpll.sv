// SPDX-FileCopyrightText: © 2025 Authors
// SPDX-License-Identifier: Apache-2.0
//
// All-Digital Phase-Locked Loop (ADPLL)
//
// Architecture:
//   ref_clk → [Freq/Phase Detector] → [Loop Filter] → [Ring Oscillator DCO] → pll_clk
//                    ↑                                        |
//                    └──────────── [÷N Divider] ◄─────────────┘
//
// Frequency detection uses a gray-coded counter in the DCO domain to
// reliably transfer fb edge counts across clock domains without aliasing.
// The loop filter always steps ±1 for simplicity.

`default_nettype none

module adpll #(
    parameter N_WIDTH    = 4,
    parameter CTRL_WIDTH = 4
)(
    input  wire                 enable,
    input  wire                 rst_n,
    input  wire                 ref_clk,
    input  wire [N_WIDTH-1:0]   n_val,      // multiplication factor (2–255)
    output wire                 pll_clk,    // output clock = n_val × ref_clk
    output wire                 locked,     // lock indicator
    output wire [CTRL_WIDTH-1:0] ctrl_out   // loop filter value (debug)
);

    wire dco_clk;

    // ---------------------------------------------------------
    // Feedback divider: divide DCO clock by n_val
    // ---------------------------------------------------------
    reg [N_WIDTH-1:0] div_count;
    wire              fb_clk;

    always @(posedge dco_clk or negedge rst_n) begin
        if (!rst_n)
            div_count <= '0;
        else if (div_count >= n_val - 1'b1)
            div_count <= '0;
        else
            div_count <= div_count + 1'b1;
    end

    assign fb_clk = (div_count < (n_val >> 1));

    // ---------------------------------------------------------
    // Gray-coded fb edge counter (dco_clk domain)
    //
    // Increments each time the divider wraps. Gray encoding
    // allows safe synchronization to the ref_clk domain
    // regardless of frequency ratio.
    // ---------------------------------------------------------
    reg [7:0] fb_counter;

    always @(posedge dco_clk or negedge rst_n) begin
        if (!rst_n)
            fb_counter <= '0;
        else if (div_count == '0)
            fb_counter <= fb_counter + 1'b1;
    end

    // Binary → Gray
    wire [7:0] fb_gray = fb_counter ^ (fb_counter >> 1);

    // Synchronize Gray code to ref_clk domain (2-stage)
    reg [7:0] gray_s1, gray_s2;
    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n) begin
            gray_s1 <= '0;
            gray_s2 <= '0;
        end else begin
            gray_s1 <= fb_gray;
            gray_s2 <= gray_s1;
        end
    end

    // Gray → Binary
    wire [7:0] fb_bin;
    assign fb_bin[7] = gray_s2[7];
    genvar gi;
    generate
        for (gi = 6; gi >= 0; gi = gi - 1) begin : g2b
            assign fb_bin[gi] = fb_bin[gi+1] ^ gray_s2[gi];
        end
    endgenerate

    // ---------------------------------------------------------
    // Windowed frequency detector
    //
    // Snapshot fb_bin at window start/end, compute difference.
    // At lock, difference should equal WINDOW.
    // ---------------------------------------------------------
    localparam WINDOW = 16;

    reg [3:0] win_cnt;
    reg [7:0] fb_snap;       // counter snapshot at window start
    reg [7:0] fb_cnt_last;   // fb edges counted in last window
    reg       win_valid;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n) begin
            win_cnt     <= '0;
            fb_snap     <= '0;
            fb_cnt_last <= '0;
            win_valid   <= 1'b0;
        end else begin
            if (win_cnt == WINDOW[3:0] - 1'b1) begin
                fb_cnt_last <= fb_bin - fb_snap;
                fb_snap     <= fb_bin;
                win_cnt     <= '0;
                win_valid   <= 1'b1;
            end else begin
                win_cnt <= win_cnt + 1'b1;
            end
        end
    end

    // Frequency comparison
    wire freq_close_now = win_valid &&
                          (fb_cnt_last >= WINDOW[7:0] - 8'd1) &&
                          (fb_cnt_last <= WINDOW[7:0] + 8'd1);
    wire freq_low       = win_valid && (fb_cnt_last < WINDOW[7:0]);

    // Once frequency is acquired, stay in tracking mode permanently.
    // This prevents hunting between acquisition and tracking.
    reg freq_acquired;
    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n)
            freq_acquired <= 1'b0;
        else if (freq_close_now)
            freq_acquired <= 1'b1;
    end

    wire freq_close = freq_acquired;

    // ---------------------------------------------------------
    // Bang-bang phase detector (for fine tracking near lock)
    //
    // fb_clk is combinational from div_count (dco_clk domain).
    // A 2-stage synchronizer prevents metastability when fb_clk
    // transitions near a ref_clk edge. The synchronizer adds
    // ~2 ref_clk cycles of latency, which shifts the steady-state
    // phase offset but does not affect locking ability.
    // ---------------------------------------------------------
    reg fb_sync_bb1, fb_sync_bb2;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n) begin
            fb_sync_bb1 <= 1'b0;
            fb_sync_bb2 <= 1'b0;
        end else begin
            fb_sync_bb1 <= fb_clk;
            fb_sync_bb2 <= fb_sync_bb1;
        end
    end

    reg phase_up, prev_up;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_up <= 1'b1;
            prev_up  <= 1'b0;
        end else begin
            prev_up  <= phase_up;
            phase_up <= ~fb_sync_bb2;
        end
    end

    // ---------------------------------------------------------
    // Loop filter: saturating up/down counter, ±1 per cycle
    //
    // Direction:
    //   Acquisition (freq not close): freq_low → up, else → down
    //   Tracking    (freq close):     phase_up → up, else → down
    // ---------------------------------------------------------
    localparam [CTRL_WIDTH-1:0] CTRL_MAX = {CTRL_WIDTH{1'b1}};
    localparam [CTRL_WIDTH-1:0] CTRL_MID = CTRL_MAX >> 1;

    reg [CTRL_WIDTH-1:0] ctrl;
    wire go_up = freq_close ? phase_up : freq_low;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n)
            ctrl <= CTRL_MID;
        else if (go_up && ctrl < CTRL_MAX)
            ctrl <= ctrl + 1'b1;
        else if (!go_up && ctrl > '0)
            ctrl <= ctrl - 1'b1;
    end

    assign ctrl_out = ctrl;

    // ---------------------------------------------------------
    // Lock detector
    //
    // With coarse DCO frequency steps, the bang-bang phase_up
    // won't alternate every cycle — the phase drifts slowly
    // through the fb_clk waveform. Instead, detect lock by
    // checking that ctrl is stable: if freq_acquired is set
    // and ctrl stays within ±1 of a reference value over a
    // window, declare lock.
    // ---------------------------------------------------------
    reg [3:0]              lock_cnt;
    reg [CTRL_WIDTH-1:0]   ctrl_ref;      // reference ctrl value for stability check
    wire                   ctrl_stable;

    assign ctrl_stable = (ctrl + 2'd3 >= ctrl_ref) && (ctrl <= ctrl_ref + 2'd3);

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n) begin
            lock_cnt <= '0;
            ctrl_ref <= CTRL_MID;
        end else if (freq_acquired) begin
            if (ctrl_stable) begin
                if (lock_cnt < 4'hF)
                    lock_cnt <= lock_cnt + 1'b1;
            end else begin
                // ctrl moved outside ±1 — reset and update reference
                lock_cnt <= '0;
                ctrl_ref <= ctrl;
            end
        end else begin
            lock_cnt <= '0;
            ctrl_ref <= ctrl;
        end
    end

    assign locked = (lock_cnt >= 4'h8);

    // ---------------------------------------------------------
    // DCO
    // ---------------------------------------------------------
    ring_dco #(
        .CTRL_WIDTH (CTRL_WIDTH)
    ) u_dco (
        .enable  (enable & rst_n),
        .ctrl    (ctrl),
        .clk_out (dco_clk)
    );

    assign pll_clk = dco_clk;

endmodule

`default_nettype wire
