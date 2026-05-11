// SPDX-FileCopyrightText: © 2026 Project Template Contributors
// SPDX-License-Identifier: Apache-2.0
//
// Blackbox for the area IO pad (no IO circuitry, just a wire-bondable
// metal bondpad).  PAD is a true inout because the pad is electrically
// just a piece of metal; whoever instantiates the cell decides whether
// to drive it, sample it, or both.

`ifndef GF180MCU_WS_IO__AREA_V
`define GF180MCU_WS_IO__AREA_V

(* blackbox *)
module gf180mcu_ws_io__area (
    inout wire PAD
);
endmodule

`endif
