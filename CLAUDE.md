# CLAUDE.md

## Project Overview

All-digital PLL (ADPLL) targeting the GF180MCU process for tapeout via wafer.space. The design multiplies a 25 MHz reference clock by a programmable factor N (2–255) using a ring oscillator DCO built from standard cells.

## Architecture

```
ref_clk → [Bang-Bang PFD] → [Loop Filter] → [Ring Oscillator DCO] → pll_clk
               ↑                                       |
               └──────────── [÷N Divider] ◄────────────┘
```

- **PFD**: Samples feedback clock level at reference rising edge
- **Loop filter**: 8-bit saturating up/down counter
- **DCO**: Ring oscillator using `gf180mcu_fd_sc_mcu7t5v0__inv_1` and `__nand2_1` with mux tap selection (512 inverters, 256 frequency steps)
- **Divider**: Programmable ÷N counter

## Key Files

- `src/adpll.sv` — PFD, loop filter, lock detector, divider, top-level ADPLL
- `src/ring_dco.sv` — Ring oscillator DCO (uses GF180 standard cells for synthesis)
- `src/chip_core.sv` — Chip core instantiating the ADPLL
- `src/chip_top.sv` — Top-level with I/O pads (from template, rarely modified)
- `cocotb/chip_top_tb.py` — Testbench (RTL and mixed-signal modes)
- `cocotb/ring_dco_behavioral.sv` — Behavioral ring_dco model for RTL simulation
- `cocotb/ring_dco_stub.sv` — Stub for mixed-signal simulation (SPICE replaces it)
- `cocotb/ring_dco_test.sp` — ngspice standalone ring oscillator characterization
- `cocotb/ring_dco_loaded.sp` — ngspice ring oscillator with mux tap loading
- `librelane/config.yaml` — Synthesis and P&R configuration
- `librelane/pdn_cfg.tcl` — Power delivery network configuration
- `librelane/chip_top.sdc` — Timing constraints

## Pin Mapping

Inputs (active high):
- `input_PAD[7:0]` — Multiplication factor N
- `input_PAD[8]` — PLL enable

Outputs:
- `bidir_PAD[0]` — PLL output clock
- `bidir_PAD[1]` — Lock indicator
- `bidir_PAD[9:2]` — Loop filter control word (debug)
- `bidir_PAD[10]` — Reference clock passthrough (debug)

## Build Commands

```bash
make sim              # RTL simulation (Icarus Verilog + cocotb)
make sim-ams          # Mixed-signal simulation (ring_dco in SPICE)
make sim-gl           # Gate-level simulation (post-synthesis)
make sim-view         # View waveforms in GTKWave
make librelane        # Full synthesis + place & route
make librelane-nodrc  # Synthesis + P&R without DRC (faster iteration)
make librelane-openroad  # View layout in OpenROAD GUI
make librelane-klayout   # View layout in KLayout GUI
```

## Installation & Setup

### Nix Dev Shell

The `flake.nix` provides all tools: LibreLane 3.0, Icarus Verilog, Verilator, ngspice/libngspice, GTKWave, Surfer, cocotb, etc.

```bash
nix develop
make clone-pdk    # clone GF180MCU PDK into ./gf180mcu/
```

### Mixed-Signal (AMS) Simulation Dependencies

AMS simulation runs the ring oscillator DCO in SPICE (ngspice) while the rest runs in Verilog, using `cocotbext-ams` as the bridge.

**cocotbext-ams**: Installed automatically on first `make sim-ams` into `cocotb/.ams-deps/`, or manually:
```bash
pip install --target cocotb/.ams-deps --no-deps cocotbext-ams
```
Source: https://github.com/VLSIDA/cocotbext-ams

**libngspice**: The Nix dev shell provides `libngspice` and the Makefile auto-detects it from the Nix store. Without Nix, install from your system package manager and set `NGSPICE_LIB`:
```bash
# Debian/Ubuntu
sudo apt install libngspice0-dev
export NGSPICE_LIB=/usr/lib/x86_64-linux-gnu/libngspice.so

# macOS (Homebrew)
brew install ngspice
export NGSPICE_LIB=$(brew --prefix ngspice)/lib/libngspice.dylib

# Or pass directly
make sim-ams NGSPICE_LIB=/path/to/libngspice.so
```

### PDK Setup

- **Local clone** (default): `make clone-pdk` → `./gf180mcu/`
- **CIEL cache**: Set `PDK_ROOT=~/.ciel` to use `~/.ciel/gf180mcuD/`

## Development Notes

- The ring_dco module is split: `src/ring_dco.sv` instantiates actual GF180 standard cells for synthesis, while `cocotb/ring_dco_behavioral.sv` uses Verilog primitives with `#delay` for RTL simulation.
- Gate delay from lib (tt_025C_5v00, inv_1, light load): ~50 ps. With mux tap loading (fanout=2): ~110 ps/stage. Use these numbers when sizing the ring oscillator.
- The PDK is at `gf180mcu/` (cloned via `make clone-pdk`) or `~/.ciel/gf180mcuD/`.
- Slot size defaults to 1x1. Override with `SLOT=0p5x0p5 make librelane`.
- ngspice is used for transistor-level ring oscillator characterization. Run standalone: `ngspice -b cocotb/ring_dco_loaded.sp`
- The design must keep `chip_top.sv`, `chip_id`, and `wafer_space_logo` intact for tapeout.
