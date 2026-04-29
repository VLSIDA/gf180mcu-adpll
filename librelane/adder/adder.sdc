# SDC for hardening the combinational `adder` block.
# A virtual clock is used so STA has a reference for I/O delays.

set ::env(CLOCK_PERIOD) 10

create_clock -name virtual_clk -period $::env(CLOCK_PERIOD)

set_input_delay  1 -clock virtual_clk [all_inputs]
set_output_delay 1 -clock virtual_clk [all_outputs]

set_max_delay [expr {$::env(CLOCK_PERIOD) - 2}] -from [all_inputs] -to [all_outputs]
