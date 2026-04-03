// Ring Oscillator DCO - behavioral model for digital simulation.
//
// Instead of instantiating hundreds of gates (which overwhelms
// event-driven simulators), this model computes the oscillation
// period analytically from the ctrl value and assumed gate delays,
// then generates a clock at that frequency.
//
// Gate delays match approximate gf180mcu 5V TT corner values.

`default_nettype none
`timescale 1ps/1ps

module ring_dco #(
    parameter CTRL_WIDTH = 8
)(
    input  wire                  enable,
    input  wire [CTRL_WIDTH-1:0] ctrl,
    output reg                   clk_out
);
    localparam NUM_TAPS = 1 << CTRL_WIDTH;

    // Approximate gf180mcu 5V TT corner gate delays (in ps)
    localparam integer NAND_DELAY_PS = 50;
    localparam integer INV_DELAY_PS  = 30;

    // Compute number of inverter stages from ctrl:
    //   ctrl = NUM_TAPS-1  →  2 inverters  (3 stages total with NAND)
    //   ctrl = 0           →  NUM_TAPS*2 inverters  (NUM_TAPS*2+1 stages)
    // Number of inverters in the feedback path = (NUM_TAPS - ctrl) * 2
    // Total stages = 1 (NAND) + num_inverters
    // Half period = NAND_DELAY + num_inverters * INV_DELAY

    reg osc_running;
    integer half_period_ps;

    initial begin
        clk_out = 1'b0;
        osc_running = 1'b0;
    end

    // Recompute half-period whenever ctrl or enable changes
    always @(ctrl or enable) begin
        if (enable) begin
            half_period_ps = NAND_DELAY_PS + (NUM_TAPS - ctrl) * 2 * INV_DELAY_PS;
            if (!osc_running) begin
                osc_running = 1'b1;
            end
        end else begin
            osc_running = 1'b0;
            clk_out = 1'b0;
        end
    end

    // Oscillator process
    always begin
        if (osc_running) begin
            #(half_period_ps);
            if (osc_running)
                clk_out = ~clk_out;
        end else begin
            @(posedge osc_running);
        end
    end

endmodule

`default_nettype wire
