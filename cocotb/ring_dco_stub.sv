// Ring Oscillator DCO - black-box stub for mixed-signal cosimulation.
// The analog behavior is provided by ngspice via cocotbext-ams;
// this module only declares the ports so the digital simulator can
// resolve the hierarchy.

`default_nettype none

module ring_dco #(
    parameter CTRL_WIDTH = 8
)(
    input  wire                  enable,
    input  wire [CTRL_WIDTH-1:0] ctrl,
    output reg                   clk_out  // reg so bridge can Force
);
    // cocotbext-ams forces clk_out from SPICE; start unknown.
    initial clk_out = 1'bx;
endmodule

`default_nettype wire
