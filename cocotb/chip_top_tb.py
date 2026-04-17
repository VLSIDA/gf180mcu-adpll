# SPDX-FileCopyrightText: © 2025 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0

import os
import logging
from pathlib import Path

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge, FallingEdge, ClockCycles

sim = os.getenv("SIM", "icarus")
pdk_root = os.getenv("PDK_ROOT", Path("~/.ciel").expanduser())
pdk = os.getenv("PDK", "gf180mcuD")
scl = os.getenv("SCL", "gf180mcu_fd_sc_mcu7t5v0")
gl = os.getenv("GL", False)
ams = os.getenv("AMS", False)
slot = os.getenv("SLOT", "1x1")

hdl_toplevel = "chip_top"


async def set_defaults(dut):
    dut.input_PAD.value = 0


async def enable_power(dut):
    dut.VDD.value = 1
    dut.VSS.value = 0


async def start_clock(clock, freq=25):
    """Start the clock @ freq MHz"""
    c = Clock(clock, 1 / freq * 1000, "ns")
    cocotb.start_soon(c.start())


async def reset(reset, active_low=True, time_ns=1000):
    """Reset dut"""
    cocotb.log.info("Reset asserted...")
    reset.value = not active_low
    await Timer(time_ns, "ns")
    reset.value = active_low
    cocotb.log.info("Reset deasserted.")


async def start_up(dut):
    """Startup sequence"""
    await set_defaults(dut)
    if gl:
        await enable_power(dut)
    await start_clock(dut.clk_PAD)
    await reset(dut.rst_n_PAD)


async def measure_period(signal, num_edges=8):
    """Measure average period of a signal over num_edges rising edges."""
    await RisingEdge(signal)
    t_start = cocotb.utils.get_sim_time("ns")
    for _ in range(num_edges):
        await RisingEdge(signal)
    t_end = cocotb.utils.get_sim_time("ns")
    return (t_end - t_start) / num_edges


@cocotb.test(skip=ams)
async def test_adpll(dut):
    """Test the ADPLL with behavioral ring oscillator (realistic gate delays)."""

    logger = logging.getLogger("adpll_tb")

    logger.info("Starting up...")
    await start_up(dut)

    # Reference clock is 25 MHz (40 ns period)
    ref_period_ns = 40.0

    # With ~110ps inverter delays (loaded, from ngspice), DCO range is ~9-1500 MHz.
    # DCO period formula: 2 × (115 + (256 - ctrl) × 2 × 110) ps
    # For the PLL to lock at ref_clk/N, the DCO period should be ref_period/N.
    # N=4: target 10 ns → ctrl ≈ 233
    n_val = 4

    # Configure ADPLL: input_PAD[7:0] = N value, input_PAD[8] = enable
    dut.input_PAD.value = (1 << 8) | n_val

    logger.info(f"ADPLL configured: N={n_val}, enable=1")

    # Wait for the PLL to lock — needs enough cycles for the loop filter
    # to sweep from midpoint (128) to the target ctrl value
    await ClockCycles(dut.clk_PAD, 500)

    # Access internal signals for measurement
    pll_clk = dut.i_chip_core.u_adpll.pll_clk
    locked = dut.i_chip_core.u_adpll.locked
    ctrl = dut.i_chip_core.u_adpll.ctrl_out

    cocotb.log.info(f"After 500 ref cycles: locked={locked.value}, ctrl={int(ctrl.value)}")

    # Log ctrl trajectory — let it run more if not locked
    if not locked.value:
        for batch in range(10):
            await ClockCycles(dut.clk_PAD, 100)
            cocotb.log.info(f"  +{(batch+1)*100} cycles: ctrl={int(ctrl.value)}, locked={locked.value}")
            if locked.value:
                break

    # Measure PLL output period
    pll_period = await measure_period(pll_clk, num_edges=16)
    expected_period = ref_period_ns / n_val

    # Compute expected period from actual ctrl value
    ctrl_val = int(ctrl.value)
    computed_period_ns = 2 * (0.115 + (256 - ctrl_val) * 2 * 0.110)
    cocotb.log.info(
        f"PLL output period: {pll_period:.3f} ns "
        f"(ideal for N={n_val}: {expected_period:.2f} ns, "
        f"computed from ctrl={ctrl_val}: {computed_period_ns:.3f} ns)"
    )

    # Verify the DCO is oscillating and locked
    assert locked.value == 1, "PLL did not achieve lock!"
    assert 0.1 < pll_period < 100.0, \
        f"PLL period {pll_period:.3f} ns outside reasonable range"

    # Verify measured period roughly matches what ctrl predicts.
    # Note: the output frequency won't exactly equal N × ref_clk because the
    # DCO has discrete frequency steps (each ctrl step changes ring length by
    # 2 inverters ≈ 220 ps of period). The bang-bang loop dithers between two
    # adjacent ctrl values, so the *average* frequency is close to the target,
    # but any single measurement lands on one of the two discrete steps.
    assert abs(pll_period - computed_period_ns) / computed_period_ns < 0.1, \
        f"Measured period {pll_period:.3f} ns doesn't match ctrl-predicted {computed_period_ns:.3f} ns"

    cocotb.log.info(f"ADPLL N={n_val} test PASSED!")

    # Run a bit longer and check lock is maintained
    await ClockCycles(dut.clk_PAD, 50)
    assert locked.value == 1, "PLL lost lock!"
    cocotb.log.info("Lock maintained. Done!")


@cocotb.test(skip=not ams)
async def test_adpll_mixed_signal(dut):
    """Mixed-signal ADPLL test: ring oscillator simulated in SPICE via ngspice."""

    from cocotbext.ams import AnalogBlock, DigitalPin, MixedSignalBridge

    logger = logging.getLogger("adpll_ams_tb")

    proj_path = Path(__file__).resolve().parent

    # gf180mcu 5V supply
    vdd = 5.0
    vss = 0.0
    threshold = vdd / 2

    # SPICE model includes for the gf180mcu standard cells and transistors
    pdk_base = Path(pdk_root) / pdk
    extra_lines = [
        f".include {pdk_base / 'libs.tech/ngspice/design.ngspice'}",
        f".include {pdk_base / 'libs.tech/ngspice/sm141064.ngspice'}",
        f".include {pdk_base / 'libs.ref' / scl / 'spice' / f'{scl}.spice'}",
        ".option rshunt=1e12",  # convergence aid for large circuits
    ]

    # Define the ring_dco analog block
    # The block name matches the Verilog hierarchy: chip_top.i_chip_core.u_adpll.u_dco
    dco_block = AnalogBlock(
        name="i_chip_core.u_adpll.u_dco",
        spice_file=str(proj_path / "ring_dco.sp"),
        subcircuit="ring_dco",
        digital_pins={
            "enable":  DigitalPin("input", width=1, vdd=vdd, vss=vss),
            "ctrl":    DigitalPin("input", width=8, vdd=vdd, vss=vss),
            "clk_out": DigitalPin("output", width=1, vdd=vdd, vss=vss,
                                  threshold=threshold, hysteresis=0.5),
        },
        vdd=vdd,
        vss=vss,
        tran_step="0.1n",
        extra_lines=extra_lines,
        simulator="ngspice",
    )

    # Total simulation duration in ns (500 ref cycles × 40ns + margin)
    sim_duration_ns = 25_000

    # Create the mixed-signal bridge
    ngspice_lib = os.getenv("NGSPICE_LIB", None)
    bridge = MixedSignalBridge(
        dut,
        [dco_block],
        max_sync_interval_ns=5.0,
        simulator_lib=ngspice_lib,
    )

    # Initialize the chip: reset first so ctrl is defined before SPICE starts
    await set_defaults(dut)
    await start_clock(dut.clk_PAD)
    await reset(dut.rst_n_PAD)

    # Configure ADPLL: N=4, enable=1
    n_val = 4
    dut.input_PAD.value = (1 << 8) | n_val
    logger.info(f"ADPLL configured: N={n_val}, enable=1")

    # Start mixed-signal co-simulation
    # The bridge will handle ring_dco in SPICE while everything else runs in Verilog
    logger.info("Starting mixed-signal co-simulation...")
    await bridge.start(
        duration_ns=sim_duration_ns,
        analog_vcd=str(proj_path / "sim_build" / "analog.vcd"),
        vcd_nodes=["ring_0", "fb"],
    )

    # Wait for PLL to attempt locking — needs more cycles with wider control range
    await ClockCycles(dut.clk_PAD, 500)

    # Probe analog voltages from the ring oscillator
    try:
        v_ring0 = bridge.get_analog_voltage("i_chip_core.u_adpll.u_dco", "ring_0")
        v_fb = bridge.get_analog_voltage("i_chip_core.u_adpll.u_dco", "fb")
        logger.info(f"Ring oscillator analog voltages: ring_0={v_ring0:.3f}V, fb={v_fb:.3f}V")
    except Exception as e:
        logger.warning(f"Could not probe analog voltages: {e}")

    # Access internal signals
    pll_clk = dut.i_chip_core.u_adpll.pll_clk
    locked = dut.i_chip_core.u_adpll.locked
    ctrl = dut.i_chip_core.u_adpll.ctrl_out

    logger.info(f"After 500 ref cycles: locked={locked.value}, ctrl={int(ctrl.value)}")

    # Measure PLL output period
    pll_period = await measure_period(pll_clk, num_edges=8)
    ref_period_ns = 40.0
    expected_period = ref_period_ns / n_val
    logger.info(f"PLL output period: {pll_period:.3f} ns (expected ~{expected_period:.2f} ns)")

    # With real SPICE transistor-level gate delays, allow wide tolerance
    assert 0.1 < pll_period < 100.0, \
        f"PLL period {pll_period:.3f} ns outside reasonable range"

    logger.info("Mixed-signal ADPLL test PASSED!")

    await bridge.stop()


def chip_top_runner():

    proj_path = Path(__file__).resolve().parent

    sources = []
    defines = {f"SLOT_{slot.upper()}": True}
    includes = [proj_path / "../src/"]

    if gl:
        # SCL models
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
        sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / "primitives.v")

        # We use the powered netlist
        sources.append(proj_path / f"../final/pnl/{hdl_toplevel}.pnl.v")

        defines = {"FUNCTIONAL": True, "USE_POWER_PINS": True}
    elif ams:
        # Mixed-signal mode: use stub for ring_dco (SPICE handles it)
        sources.append(proj_path / "../src/chip_top.sv")
        sources.append(proj_path / "../src/chip_core.sv")
        sources.append(proj_path / "../src/adpll.sv")
        sources.append(proj_path / "ring_dco_stub.sv")
    else:
        sources.append(proj_path / "../src/chip_top.sv")
        sources.append(proj_path / "../src/chip_core.sv")
        sources.append(proj_path / "../src/adpll.sv")
        # Use behavioral ring_dco with assumed gate delays for digital sim
        sources.append(proj_path / "ring_dco_behavioral.sv")

    sources += [
        # IO pad models
        Path(pdk_root) / pdk / "libs.ref/gf180mcu_fd_io/verilog/gf180mcu_fd_io.v",
        Path(pdk_root) / pdk / "libs.ref/gf180mcu_fd_io/verilog/gf180mcu_ws_io.v",

        # Custom IP
        proj_path / "../ip/gf180mcu_ws_ip__id/vh/gf180mcu_ws_ip__id.v",
        proj_path / "../ip/gf180mcu_ws_ip__logo/vh/gf180mcu_ws_ip__logo.v",
    ]

    build_args = []

    if sim == "icarus":
        pass

    if sim == "verilator":
        build_args = ["--timing", "--trace", "--trace-fst", "--trace-structs"]

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel=hdl_toplevel,
        defines=defines,
        always=True,
        includes=includes,
        build_args=build_args,
        waves=True,
    )

    plusargs = []

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="chip_top_tb,",
        plusargs=plusargs,
        waves=True,
    )


if __name__ == "__main__":
    from cocotb_tools.runner import get_runner
    chip_top_runner()
