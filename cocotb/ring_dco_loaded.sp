* Ring Oscillator DCO - with mux tap loading (fanout = 2 per stage)
* Each ring node drives: next inverter + one mux input (~5 fF extra)

.param vdd_val=5.0

.lib '/home/mrg/.ciel/gf180mcuD/libs.tech/ngspice/sm141064.ngspice' typical
.include '/home/mrg/.ciel/gf180mcuD/libs.tech/ngspice/design.ngspice'
.include '/home/mrg/.ciel/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice'

Vdd VDD 0 dc vdd_val
Vss VSS 0 dc 0
Ven enable 0 PWL(0 0 1n 0 1.1n vdd_val)

* Model mux tap load: ~5 fF capacitor on each ring node
* (approximates one inv_1 gate input capacitance)

* ============================================================
* 5-stage ring (NAND + 4 inv), each node loaded with 5 fF
* ============================================================

Xnand5 enable ring5_4 ring5_0 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
C5_0 ring5_0 0 5f
Xinv5_0 ring5_0 ring5_1 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C5_1 ring5_1 0 5f
Xinv5_1 ring5_1 ring5_2 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C5_2 ring5_2 0 5f
Xinv5_2 ring5_2 ring5_3 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C5_3 ring5_3 0 5f
Xinv5_3 ring5_3 ring5_4 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C5_4 ring5_4 0 5f

* ============================================================
* 11-stage ring, each node loaded with 5 fF
* ============================================================

Xnand11 enable ring11_10 ring11_0 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
C11_0  ring11_0  0 5f
Xinv11_0  ring11_0  ring11_1  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_1  ring11_1  0 5f
Xinv11_1  ring11_1  ring11_2  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_2  ring11_2  0 5f
Xinv11_2  ring11_2  ring11_3  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_3  ring11_3  0 5f
Xinv11_3  ring11_3  ring11_4  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_4  ring11_4  0 5f
Xinv11_4  ring11_4  ring11_5  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_5  ring11_5  0 5f
Xinv11_5  ring11_5  ring11_6  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_6  ring11_6  0 5f
Xinv11_6  ring11_6  ring11_7  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_7  ring11_7  0 5f
Xinv11_7  ring11_7  ring11_8  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_8  ring11_8  0 5f
Xinv11_8  ring11_8  ring11_9  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_9  ring11_9  0 5f
Xinv11_9  ring11_9  ring11_10 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C11_10 ring11_10 0 5f

* ============================================================
* 33-stage ring, each node loaded with 5 fF
* ============================================================

Xnand33 enable ring33_32 ring33_0 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
C33_0  ring33_0  0 5f
Xinv33_0  ring33_0  ring33_1  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_1  ring33_1  0 5f
Xinv33_1  ring33_1  ring33_2  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_2  ring33_2  0 5f
Xinv33_2  ring33_2  ring33_3  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_3  ring33_3  0 5f
Xinv33_3  ring33_3  ring33_4  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_4  ring33_4  0 5f
Xinv33_4  ring33_4  ring33_5  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_5  ring33_5  0 5f
Xinv33_5  ring33_5  ring33_6  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_6  ring33_6  0 5f
Xinv33_6  ring33_6  ring33_7  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_7  ring33_7  0 5f
Xinv33_7  ring33_7  ring33_8  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_8  ring33_8  0 5f
Xinv33_8  ring33_8  ring33_9  VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_9  ring33_9  0 5f
Xinv33_9  ring33_9  ring33_10 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_10 ring33_10 0 5f
Xinv33_10 ring33_10 ring33_11 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_11 ring33_11 0 5f
Xinv33_11 ring33_11 ring33_12 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_12 ring33_12 0 5f
Xinv33_12 ring33_12 ring33_13 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_13 ring33_13 0 5f
Xinv33_13 ring33_13 ring33_14 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_14 ring33_14 0 5f
Xinv33_14 ring33_14 ring33_15 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_15 ring33_15 0 5f
Xinv33_15 ring33_15 ring33_16 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_16 ring33_16 0 5f
Xinv33_16 ring33_16 ring33_17 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_17 ring33_17 0 5f
Xinv33_17 ring33_17 ring33_18 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_18 ring33_18 0 5f
Xinv33_18 ring33_18 ring33_19 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_19 ring33_19 0 5f
Xinv33_19 ring33_19 ring33_20 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_20 ring33_20 0 5f
Xinv33_20 ring33_20 ring33_21 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_21 ring33_21 0 5f
Xinv33_21 ring33_21 ring33_22 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_22 ring33_22 0 5f
Xinv33_22 ring33_22 ring33_23 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_23 ring33_23 0 5f
Xinv33_23 ring33_23 ring33_24 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_24 ring33_24 0 5f
Xinv33_24 ring33_24 ring33_25 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_25 ring33_25 0 5f
Xinv33_25 ring33_25 ring33_26 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_26 ring33_26 0 5f
Xinv33_26 ring33_26 ring33_27 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_27 ring33_27 0 5f
Xinv33_27 ring33_27 ring33_28 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_28 ring33_28 0 5f
Xinv33_28 ring33_28 ring33_29 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_29 ring33_29 0 5f
Xinv33_29 ring33_29 ring33_30 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_30 ring33_30 0 5f
Xinv33_30 ring33_30 ring33_31 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_31 ring33_31 0 5f
Xinv33_31 ring33_31 ring33_32 VDD VDD VSS VSS gf180mcu_fd_sc_mcu7t5v0__inv_1
C33_32 ring33_32 0 5f

* ============================================================
* Simulation
* ============================================================

.control
    tran 0.01n 50n

    meas tran t5_rise1 WHEN v(ring5_0) = 2.5 RISE = 3
    meas tran t5_rise2 WHEN v(ring5_0) = 2.5 RISE = 4
    let period5 = t5_rise2 - t5_rise1
    let freq5_mhz = 1e-6 / period5
    let delay5_ps = period5 * 1e12 / (2 * 5)
    echo "=== 5-stage ring (loaded) ==="
    print period5 freq5_mhz delay5_ps

    meas tran t11_rise1 WHEN v(ring11_0) = 2.5 RISE = 3
    meas tran t11_rise2 WHEN v(ring11_0) = 2.5 RISE = 4
    let period11 = t11_rise2 - t11_rise1
    let freq11_mhz = 1e-6 / period11
    let delay11_ps = period11 * 1e12 / (2 * 11)
    echo "=== 11-stage ring (loaded) ==="
    print period11 freq11_mhz delay11_ps

    meas tran t33_rise1 WHEN v(ring33_0) = 2.5 RISE = 3
    meas tran t33_rise2 WHEN v(ring33_0) = 2.5 RISE = 4
    let period33 = t33_rise2 - t33_rise1
    let freq33_mhz = 1e-6 / period33
    let delay33_ps = period33 * 1e12 / (2 * 33)
    echo "=== 33-stage ring (loaded) ==="
    print period33 freq33_mhz delay33_ps

    quit
.endc

.end
