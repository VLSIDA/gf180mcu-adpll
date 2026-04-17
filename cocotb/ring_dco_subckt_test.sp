* Test the ring_dco subcircuit from ring_dco.sp
* Verifies the generated subcircuit oscillates correctly

.param vdd_val=5.0

.lib '/home/mrg/.ciel/gf180mcuD/libs.tech/ngspice/sm141064.ngspice' typical
.include '/home/mrg/.ciel/gf180mcuD/libs.tech/ngspice/design.ngspice'
.include '/home/mrg/.ciel/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice'

* Include the ring_dco subcircuit
.include '../src/ring_dco.sp'

* Power supplies
Vdd VDD 0 dc vdd_val
Vss VSS 0 dc 0

* Enable: goes high at 1ns
Ven enable 0 PWL(0 0 1n 0 1.1n vdd_val)

* Control bits: set ctrl=128 (binary 10000000)
* ctrl_7=1, ctrl_6..0=0
* This selects tap 128 -> ring_{(256-128)*2} = ring_256
* Expected: 257 stages, half_period ~ 115 + 256*110 = 28275 ps
Vctrl7 ctrl_7 0 dc vdd_val
Vctrl6 ctrl_6 0 dc 0
Vctrl5 ctrl_5 0 dc 0
Vctrl4 ctrl_4 0 dc 0
Vctrl3 ctrl_3 0 dc 0
Vctrl2 ctrl_2 0 dc 0
Vctrl1 ctrl_1 0 dc 0
Vctrl0 ctrl_0 0 dc 0

* Instantiate the ring_dco
x1 enable ctrl_0 ctrl_1 ctrl_2 ctrl_3 ctrl_4 ctrl_5 ctrl_6 ctrl_7 clk_out VDD VSS ring_dco

.control
    tran 0.1n 200n

    meas tran t_rise1 WHEN v(clk_out) = 2.5 RISE = 3
    meas tran t_rise2 WHEN v(clk_out) = 2.5 RISE = 4
    let period = t_rise2 - t_rise1
    let freq_mhz = 1e-6 / period
    echo "=== ring_dco subcircuit test (ctrl=128) ==="
    print period freq_mhz

    quit
.endc

.end
