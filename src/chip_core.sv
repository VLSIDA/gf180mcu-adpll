// SPDX-FileCopyrightText: © 2025 Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module chip_core #(
    parameter NUM_INPUT_PADS,
    parameter NUM_BIDIR_PADS,
    parameter NUM_ANALOG_PADS
    )(
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif

    input  wire clk,       // clock (reference for ADPLL)
    input  wire rst_n,     // reset (active low)

    input  wire [NUM_INPUT_PADS-1:0] input_in,   // Input value
    output wire [NUM_INPUT_PADS-1:0] input_pu,   // Pull-up
    output wire [NUM_INPUT_PADS-1:0] input_pd,   // Pull-down

    input  wire [NUM_BIDIR_PADS-1:0] bidir_in,   // Input value
    output wire [NUM_BIDIR_PADS-1:0] bidir_out,  // Output value
    output wire [NUM_BIDIR_PADS-1:0] bidir_oe,   // Output enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_cs,   // Input type (0=CMOS Buffer, 1=Schmitt Trigger)
    output wire [NUM_BIDIR_PADS-1:0] bidir_sl,   // Slew rate (0=fast, 1=slow)
    output wire [NUM_BIDIR_PADS-1:0] bidir_ie,   // Input enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_pu,   // Pull-up
    output wire [NUM_BIDIR_PADS-1:0] bidir_pd,   // Pull-down

    inout  wire [NUM_ANALOG_PADS-1:0] analog  // Analog
);

    // Pad configuration
    assign input_pu = '0;
    assign input_pd = '0;
    assign bidir_oe = '1;
    assign bidir_cs = '0;
    assign bidir_sl = '0;
    assign bidir_ie = ~bidir_oe;
    assign bidir_pu = '0;
    assign bidir_pd = '0;

    logic _unused;
    assign _unused = &bidir_in;

    // -------------------------------------------------------
    // ADPLL instance
    //
    // Inputs:
    //   input_in[7:0] = multiplication factor N (2–255)
    //   input_in[8]   = PLL enable
    //
    // Outputs:
    //   bidir_out[0]    = PLL output clock (N × ref_clk)
    //   bidir_out[1]    = lock indicator
    //   bidir_out[9:2]  = loop filter control word (debug)
    //   bidir_out[10]   = reference clock passthrough (debug)
    // -------------------------------------------------------

    wire        pll_clk;
    wire        pll_locked;
    wire [7:0]  pll_ctrl;

    adpll #(
        .N_WIDTH    (8),
        .CTRL_WIDTH (8)
    ) u_adpll (
        .enable   (input_in[8]),
        .rst_n    (rst_n),
        .ref_clk  (clk),
        .n_val    (input_in[7:0]),
        .pll_clk  (pll_clk),
        .locked   (pll_locked),
        .ctrl_out (pll_ctrl)
    );

    // Drive bidir outputs
    assign bidir_out[0]    = pll_clk;
    assign bidir_out[1]    = pll_locked;
    assign bidir_out[9:2]  = pll_ctrl;
    assign bidir_out[10]   = clk;

    // Tie off remaining bidir outputs
    assign bidir_out[NUM_BIDIR_PADS-1:11] = '0;

endmodule

`default_nettype wire
