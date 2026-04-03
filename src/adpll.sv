// SPDX-FileCopyrightText: © 2025 Authors
// SPDX-License-Identifier: Apache-2.0
//
// All-Digital Phase-Locked Loop (ADPLL)
//
// Architecture:
//   ref_clk → [Bang-Bang PFD] → [Loop Filter] → [Ring Oscillator DCO] → pll_clk
//                  ↑                                       |
//                  └──────────── [÷N Divider] ◄────────────┘
//
// The ring oscillator (ring_dco) is defined in ring_dco.sv.
// In synthesis, physical gate delays determine the oscillation frequency.

`default_nettype none

// ============================================================
// All-Digital PLL Top
// ============================================================

module adpll #(
    parameter N_WIDTH    = 4,
    parameter CTRL_WIDTH = 4
)(
    input  wire                 enable,
    input  wire                 rst_n,
    input  wire                 ref_clk,
    input  wire [N_WIDTH-1:0]   n_val,      // multiplication factor (2–15)
    output wire                 pll_clk,    // output clock = n_val × ref_clk
    output wire                 locked,     // lock indicator
    output wire [CTRL_WIDTH-1:0] ctrl_out   // loop filter value (debug)
);

    wire dco_clk;

    // ---------------------------------------------------------
    // Feedback divider: divide DCO clock by n_val
    // At lock: dco_freq / n_val = ref_freq → dco_freq = n_val × ref_freq
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

    // fb_clk high for first half of N-cycle period, low for second half
    // Period = n_val × T_dco.  PFD uses rising edge.
    assign fb_clk = (div_count < (n_val >> 1));

    // ---------------------------------------------------------
    // Bang-bang phase/frequency detector
    // Samples fb_clk level on ref_clk rising edge.
    //   fb_clk = 0 at ref edge → feedback lagging → speed up  (up=1)
    //   fb_clk = 1 at ref edge → feedback leading → slow down (up=0)
    // ---------------------------------------------------------
    reg phase_up;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n)
            phase_up <= 1'b1;   // start by speeding up
        else
            phase_up <= ~fb_clk;
    end

    // ---------------------------------------------------------
    // Digital loop filter: saturating up/down counter
    // Integrates the bang-bang phase error into a DCO control word.
    // ---------------------------------------------------------
    localparam [CTRL_WIDTH-1:0] CTRL_MAX = {CTRL_WIDTH{1'b1}};
    localparam [CTRL_WIDTH-1:0] CTRL_MID = CTRL_MAX >> 1;

    reg [CTRL_WIDTH-1:0] ctrl;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n)
            ctrl <= CTRL_MID;
        else if (phase_up && ctrl < CTRL_MAX)
            ctrl <= ctrl + 1'b1;
        else if (!phase_up && ctrl > '0)
            ctrl <= ctrl - 1'b1;
    end

    assign ctrl_out = ctrl;

    // ---------------------------------------------------------
    // Lock detector
    // In a bang-bang PLL, lock means the phase error alternates
    // direction each cycle (dithering ±1 around the target).
    // Count consecutive alternations; declare lock after 8.
    // ---------------------------------------------------------
    reg [3:0]  lock_cnt;
    reg        prev_up;

    always @(posedge ref_clk or negedge rst_n) begin
        if (!rst_n) begin
            lock_cnt <= '0;
            prev_up  <= 1'b0;
        end else begin
            prev_up <= phase_up;
            if (phase_up != prev_up) begin
                if (lock_cnt < 4'hF)
                    lock_cnt <= lock_cnt + 1'b1;
            end else begin
                if (lock_cnt > '0)
                    lock_cnt <= lock_cnt - 1'b1;
            end
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
