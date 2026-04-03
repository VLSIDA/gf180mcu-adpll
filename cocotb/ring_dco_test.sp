* Ring Oscillator DCO - ngspice transistor-level simulation
* Tests ring oscillators of various lengths to characterize frequency vs stage count

.param vdd_val=5.0

* Include transistor models and standard cell subcircuits
.lib '/home/mrg/.ciel/gf180mcuD/libs.tech/ngspice/sm141064.ngspice' typical
.include '/home/mrg/.ciel/gf180mcuD/libs.tech/ngspice/design.ngspice'
.include '/home/mrg/.ciel/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice'

* Power supplies
Vdd VDD 0 dc vdd_val
Vss VSS 0 dc 0

* Enable signal: goes high at 1ns
Ven enable 0 PWL(0 0 1n 0 1.1n vdd_val)

* ============================================================
* 5-stage ring oscillator (NAND + 4 inverters)
* Expected: ~100-200 ps/gate -> period ~1-2 ns
* ============================================================

Xnand5 enable ring5_4 ring5_0 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
Xinv5_0 ring5_0 ring5_1 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv5_1 ring5_1 ring5_2 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv5_2 ring5_2 ring5_3 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv5_3 ring5_3 ring5_4 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1

* ============================================================
* 11-stage ring oscillator (NAND + 10 inverters)
* ============================================================

Xnand11 enable ring11_10 ring11_0 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
Xinv11_0  ring11_0  ring11_1  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_1  ring11_1  ring11_2  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_2  ring11_2  ring11_3  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_3  ring11_3  ring11_4  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_4  ring11_4  ring11_5  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_5  ring11_5  ring11_6  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_6  ring11_6  ring11_7  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_7  ring11_7  ring11_8  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_8  ring11_8  ring11_9  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv11_9  ring11_9  ring11_10 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1

* ============================================================
* 33-stage ring oscillator (NAND + 32 inverters)
* ============================================================

Xnand33 enable ring33_32 ring33_0 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
Xinv33_0  ring33_0  ring33_1  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_1  ring33_1  ring33_2  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_2  ring33_2  ring33_3  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_3  ring33_3  ring33_4  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_4  ring33_4  ring33_5  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_5  ring33_5  ring33_6  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_6  ring33_6  ring33_7  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_7  ring33_7  ring33_8  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_8  ring33_8  ring33_9  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_9  ring33_9  ring33_10 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_10 ring33_10 ring33_11 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_11 ring33_11 ring33_12 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_12 ring33_12 ring33_13 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_13 ring33_13 ring33_14 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_14 ring33_14 ring33_15 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_15 ring33_15 ring33_16 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_16 ring33_16 ring33_17 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_17 ring33_17 ring33_18 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_18 ring33_18 ring33_19 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_19 ring33_19 ring33_20 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_20 ring33_20 ring33_21 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_21 ring33_21 ring33_22 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_22 ring33_22 ring33_23 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_23 ring33_23 ring33_24 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_24 ring33_24 ring33_25 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_25 ring33_25 ring33_26 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_26 ring33_26 ring33_27 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_27 ring33_27 ring33_28 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_28 ring33_28 ring33_29 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_29 ring33_29 ring33_30 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_30 ring33_30 ring33_31 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
Xinv33_31 ring33_31 ring33_32 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1

* ============================================================
* Simulation control
* ============================================================

.control
    tran 0.01n 50n

    * Measure 5-stage ring oscillator period
    meas tran t5_rise1 WHEN v(ring5_0) = 2.5 RISE = 3
    meas tran t5_rise2 WHEN v(ring5_0) = 2.5 RISE = 4
    let period5 = t5_rise2 - t5_rise1
    let freq5 = 1 / period5
    let delay5 = period5 / (2 * 5)
    echo "=== 5-stage ring oscillator ==="
    print period5 freq5 delay5

    * Measure 11-stage ring oscillator period
    meas tran t11_rise1 WHEN v(ring11_0) = 2.5 RISE = 3
    meas tran t11_rise2 WHEN v(ring11_0) = 2.5 RISE = 4
    let period11 = t11_rise2 - t11_rise1
    let freq11 = 1 / period11
    let delay11 = period11 / (2 * 11)
    echo "=== 11-stage ring oscillator ==="
    print period11 freq11 delay11

    * Measure 33-stage ring oscillator period
    meas tran t33_rise1 WHEN v(ring33_0) = 2.5 RISE = 3
    meas tran t33_rise2 WHEN v(ring33_0) = 2.5 RISE = 4
    let period33 = t33_rise2 - t33_rise1
    let freq33 = 1 / period33
    let delay33 = period33 / (2 * 33)
    echo "=== 33-stage ring oscillator ==="
    print period33 freq33 delay33

    echo "=== Summary ==="
    echo "Stages | Period (ns) | Freq (MHz) | Delay/stage (ps)"
    * Print summary using let variables
    print period5 period11 period33
    print freq5 freq11 freq33
    print delay5 delay11 delay33

    * Save waveforms
    wrdata /home/mrg/cse127/gf180mcu-project-template/cocotb/sim_build/ring_dco_waves.txt v(ring5_0) v(ring11_0) v(ring33_0) v(enable)

    quit
.endc

.end
