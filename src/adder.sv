// SPDX-FileCopyrightText: © 2025 XXX Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

// Parameterized N-bit adder with carry-in and carry-out.
// Used as a hierarchy example: chip_core instantiates several copies
// of this module and chains them via cin/cout to form a wider adder.
module adder #(
    parameter int WIDTH = 8
)(
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire             cin,
    output wire [WIDTH-1:0] sum,
    output wire             cout
);

    assign {cout, sum} = a + b + cin;

endmodule

`default_nettype wire
