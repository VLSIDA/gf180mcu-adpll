// SPDX-FileCopyrightText: © 2025 XXX Authors
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
    
    input  wire clk,       // clock
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

    // See here for usage: https://gf180mcu-pdk.readthedocs.io/en/latest/IPs/IO/gf180mcu_fd_io/digital.html
    
    // Disable pull-up and pull-down for input
    assign input_pu = '0;
    assign input_pd = '0;

    // Set the bidir as output
    assign bidir_oe = '1;
    assign bidir_cs = '0;
    assign bidir_sl = '0;
    assign bidir_ie = ~bidir_oe;
    assign bidir_pu = '0;
    assign bidir_pd = '0;
    
    logic _unused;
    assign _unused = &bidir_in;

    // 32-bit counter. Its next value is computed by chaining four
    // hardened 8-bit `adder` macros via cin/cout to form a 32-bit
    // ripple-carry incrementer (cin of the lowest adder = 1).
    localparam int CNT_WIDTH = 32;

    logic [CNT_WIDTH-1:0] count;
    wire  [CNT_WIDTH-1:0] next_count;
    wire  [4:0]           carry;

    assign carry[0] = 1'b1;

    adder u_adder_0 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif
        .a    (count[7:0]),
        .b    (8'b0),
        .cin  (carry[0]),
        .sum  (next_count[7:0]),
        .cout (carry[1])
    );

    adder u_adder_1 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif
        .a    (count[15:8]),
        .b    (8'b0),
        .cin  (carry[1]),
        .sum  (next_count[15:8]),
        .cout (carry[2])
    );

    adder u_adder_2 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif
        .a    (count[23:16]),
        .b    (8'b0),
        .cin  (carry[2]),
        .sum  (next_count[23:16]),
        .cout (carry[3])
    );

    adder u_adder_3 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif
        .a    (count[31:24]),
        .b    (8'b0),
        .cin  (carry[3]),
        .sum  (next_count[31:24]),
        .cout (carry[4])
    );

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            count <= '0;
        end else if (&input_in) begin
            count <= next_count;
        end
    end

    assign bidir_out = {{(NUM_BIDIR_PADS - CNT_WIDTH){1'b0}}, count};

endmodule

`default_nettype wire
