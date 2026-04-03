#!/usr/bin/env python3
"""Generate ring_dco.sp SPICE netlist for a given CTRL_WIDTH."""

import sys
from pathlib import Path

CTRL_WIDTH = 8
NUM_TAPS = 1 << CTRL_WIDTH   # 256
MAX_INV = NUM_TAPS * 2        # 512


def generate(ctrl_width=CTRL_WIDTH):
    num_taps = 1 << ctrl_width
    max_inv = num_taps * 2

    lines = []
    lines.append("* Ring Oscillator DCO - SPICE netlist using gf180mcu standard cells")
    lines.append(f"* Auto-generated for CTRL_WIDTH={ctrl_width}")
    lines.append(f"* {max_inv} inverters, {num_taps} taps, {ctrl_width}-level mux tree")
    lines.append("*")

    # Subcircuit ports
    ctrl_ports = " ".join(f"ctrl_{i}" for i in range(ctrl_width))
    lines.append(f".subckt ring_dco enable {ctrl_ports} clk_out vdd vss")
    lines.append("")

    # NAND gate
    lines.append("* Enable NAND gate: ring_0 = NAND(enable, fb)")
    lines.append("x_nand enable fb ring_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__nand2_1")
    lines.append("")

    # Inverter chain
    lines.append(f"* {max_inv}-stage inverter chain")
    for i in range(max_inv):
        lines.append(
            f"x_inv{i} ring_{i} ring_{i+1} vdd vdd vss vss "
            f"gf180mcu_fd_sc_mcu7t5v0__inv_1"
        )
    lines.append("")

    # Mux tree
    # Tap mapping: index k -> ring_{(num_taps - k) * 2}
    # So index 0 -> ring_{max_inv} (slowest), index num_taps-1 -> ring_2 (fastest)
    lines.append(f"* {num_taps}:1 feedback mux ({ctrl_width}-level binary tree of mux2 cells)")
    lines.append("* mux2 ports: I0 I1 S Z VDD VNW VPW VSS")
    lines.append("")

    # Build tap names: tap[k] = ring_{(num_taps - k) * 2}
    current_level = [f"ring_{(num_taps - k) * 2}" for k in range(num_taps)]

    for level in range(ctrl_width):
        lines.append(f"* Level {level}: select on ctrl_{level}")
        next_level = []
        for k in range(len(current_level) // 2):
            i0 = current_level[2 * k]
            i1 = current_level[2 * k + 1]
            if level < ctrl_width - 1:
                out = f"m{level}_{k}"
            else:
                out = "fb"
            lines.append(
                f"x_mux_{level}_{k} {i0} {i1} ctrl_{level} {out} "
                f"vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1"
            )
            next_level.append(out)
        current_level = next_level
        lines.append("")

    # Output buffer
    lines.append("* Output: clk_out = buffered ring_0")
    lines.append("x_outbuf ring_0 clk_out vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1")
    lines.append("")
    lines.append(".ends ring_dco")

    return "\n".join(lines) + "\n"


if __name__ == "__main__":
    ctrl_width = int(sys.argv[1]) if len(sys.argv) > 1 else CTRL_WIDTH
    out_path = Path(__file__).parent / "ring_dco.sp"
    out_path.write_text(generate(ctrl_width))
    print(f"Generated {out_path} (CTRL_WIDTH={ctrl_width})")
