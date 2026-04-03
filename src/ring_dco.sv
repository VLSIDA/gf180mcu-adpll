// SPDX-FileCopyrightText: © 2025 Authors
// SPDX-License-Identifier: Apache-2.0
//
// Ring Oscillator DCO
//
// Variable-length ring oscillator with configurable tap selection.
// Higher ctrl -> shorter ring -> higher frequency.
//
// Ring structure: NAND(enable, feedback) -> inv[0] -> inv[1] -> ... -> inv[MAX_INV-1]
// Feedback mux selects from even-indexed taps to maintain odd inversion count.

`default_nettype none

module ring_dco #(
    parameter CTRL_WIDTH = 8
)(
    input  wire                  enable,
    input  wire [CTRL_WIDTH-1:0] ctrl,
    output wire                  clk_out
);
    localparam NUM_TAPS = 1 << CTRL_WIDTH;
    localparam MAX_INV  = NUM_TAPS * 2;

    // Ring oscillator chain
    (* keep = 1, dont_touch = "true" *)
    wire [MAX_INV:0] ring;
    wire fb;

    // Enable gate: NAND provides 1 inversion + gating
    (* keep = 1, dont_touch = "true" *)
    gf180mcu_fd_sc_mcu7t5v0__nand2_1 u_nand (.A1(enable), .A2(fb), .ZN(ring[0]));

    // Inverter chain
    genvar gi;
    generate
        for (gi = 0; gi < MAX_INV; gi = gi + 1) begin : inv
            (* keep = 1, dont_touch = "true" *)
            gf180mcu_fd_sc_mcu7t5v0__inv_1 u_inv (.I(ring[gi]), .ZN(ring[gi + 1]));
        end
    endgenerate

    // Feedback tap mux
    // ctrl=MAX -> ring[2]  (3 stages, fastest)
    // ctrl=0   -> ring[MAX_INV] (MAX_INV+1 stages, slowest)
    reg fb_mux;
    integer j;
    always @(*) begin
        fb_mux = ring[MAX_INV];
        for (j = 0; j < NUM_TAPS; j = j + 1) begin
            if (ctrl == NUM_TAPS[CTRL_WIDTH-1:0] - 1'b1 - j[CTRL_WIDTH-1:0])
                fb_mux = ring[(j + 1) * 2];
        end
    end
    assign fb = fb_mux;

    assign clk_out = ring[0];
endmodule

`default_nettype wire
