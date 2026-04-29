// SPDX-FileCopyrightText: © 2025 XXX Authors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

// 8-bit adder with carry-in / carry-out. Hardened as its own block
// (LibreLane Classic flow) and instantiated four times in chip_core.
module adder (
    `ifdef USE_POWER_PINS
    inout  wire       VDD,
    inout  wire       VSS,
    `endif
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire       cin,
    output wire [7:0] sum,
    output wire       cout
);

    assign {cout, sum} = a + b + cin;

endmodule

`default_nettype wire
