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

    logic [NUM_BIDIR_PADS-1:0] count;

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            count <= '0;
        end else begin
            if (&input_in) begin
                count <= count + 1;
            end
        end
    end

    logic [7:0] sram_v_256_out;
    logic [7:0] sram_v_512_out;
    logic [7:0] sram_v_1024_out;
    logic [7:0] sram_r_256_out;
    logic [7:0] sram_r_512_out;
    logic [7:0] sram_r_1024_out;

    // Shared SRAM control - driven by counter so signals toggle in simulation
    // and the SRAMs are not optimized away.
    logic        sram_cen;
    logic        sram_gwen;
    logic [7:0]  sram_wen;
    logic [9:0]  sram_addr;
    logic [7:0]  sram_din;

    assign sram_cen  = ~count[0];
    assign sram_gwen = count[1];
    assign sram_wen  = {8{count[2]}};
    assign sram_addr = count[9:0];
    assign sram_din  = count[7:0];

    // Vertical (N) orientation
    gf180mcu_ocd_ip_sram__sram256x8m8wm1 sram_v_256 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (sram_cen),
        .GWEN (sram_gwen),
        .WEN  (sram_wen),
        .A    (sram_addr[7:0]),
        .D    (sram_din),
        .Q    (sram_v_256_out)
    );

    gf180mcu_ocd_ip_sram__sram512x8m8wm1 sram_v_512 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (sram_cen),
        .GWEN (sram_gwen),
        .WEN  (sram_wen),
        .A    (sram_addr[8:0]),
        .D    (sram_din),
        .Q    (sram_v_512_out)
    );

    gf180mcu_ocd_ip_sram__sram1024x8m8wm1 sram_v_1024 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (sram_cen),
        .GWEN (sram_gwen),
        .WEN  (sram_wen),
        .A    (sram_addr),
        .D    (sram_din),
        .Q    (sram_v_1024_out)
    );

    // Rotated (E) orientation
    gf180mcu_ocd_ip_sram__sram256x8m8wm1 sram_r_256 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (sram_cen),
        .GWEN (sram_gwen),
        .WEN  (sram_wen),
        .A    (sram_addr[7:0]),
        .D    (sram_din),
        .Q    (sram_r_256_out)
    );

    gf180mcu_ocd_ip_sram__sram512x8m8wm1 sram_r_512 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (sram_cen),
        .GWEN (sram_gwen),
        .WEN  (sram_wen),
        .A    (sram_addr[8:0]),
        .D    (sram_din),
        .Q    (sram_r_512_out)
    );

    gf180mcu_ocd_ip_sram__sram1024x8m8wm1 sram_r_1024 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (sram_cen),
        .GWEN (sram_gwen),
        .WEN  (sram_wen),
        .A    (sram_addr),
        .D    (sram_din),
        .Q    (sram_r_1024_out)
    );

    logic [7:0] sram_xor;
    assign sram_xor = sram_v_256_out ^ sram_v_512_out ^ sram_v_1024_out
                    ^ sram_r_256_out ^ sram_r_512_out ^ sram_r_1024_out;

    assign bidir_out = count ^ {{(NUM_BIDIR_PADS-8){1'b0}}, sram_xor};

endmodule

`default_nettype wire
