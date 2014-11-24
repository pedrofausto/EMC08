# EMC08 Microcontroller Static Timing Analysis
# Needs: Duty Cycle, Clock Slew, Clock Jitter, Clock skew (slide 69), Setup and Hold Time.


#set_operating_conditions slow_1_62V_125C -library D_CELLS_MOSLP_slow_1_62V_125C
#set_wire_load_mode enclosed
# set_wire_load_model -name custom_high -library D_CELLS_MOSLP_typ_1_80V_25C
# set_driving_cell -lib_cell INVX1 -library slow -pin Y [all_inputs]


create_clock -name CLK -period 50.0 -waveform {0 25.0} [get_ports {CLOCK}]
create_clock -name CLK_MEM -period 25.0 -waveform {0 12.5} [get_ports {CLOCK_MEM}]

#set_dont_touch_network [get_clocks "CLK"]
#set_dont_touch_network [get_clocks "CLK_MEM"]

#Main Clock definitions
set_clock_transition -rise 1 [get_clocks "CLK"]
set_clock_transition -fall 1 [get_clocks "CLK"]

set_clock_uncertainty -setup 0.1 [get_clocks "CLK"]
set_clock_uncertainty -hold 0.1 [get_clocks "CLK"]

set_clock_latency -early -late -source 5.0 [get_clocks "CLK"]
set_clock_latency -early -late -source 5.0 [get_clocks "CLK_MEM"]

#Memory Clock definitions
set_clock_transition -rise 1 [get_clocks "CLK_MEM"]
set_clock_transition -fall 1 [get_clocks "CLK_MEM"]

set_clock_uncertainty -hold 0.1 [get_clocks "CLK_MEM"]
set_clock_uncertainty -setup 0.1 [get_clocks "CLK_MEM"]

set_max_capacitance 1000 [get_ports *]
set_max_fanout 20 [all_inputs]
set_input_transition -min 10 -rise [get_ports {RESET_B P0 P1 P2 P3 PHT EA_B TM}]
set_input_transition -max 100 -rise [get_ports {RESET_B P0 P1 P2 P3 PHT EA_B TM}]
set_input_transition -min 10 -fall [get_ports {RESET_B P0 P1 P2 P3 PHT EA_B TM}]
set_input_transition -max 100 -fall [get_ports {RESET_B P0 P1 P2 P3 PHT EA_B TM}]

#set_load -pin_load 1.5 [all_inputs]
set_load -pin_load 1.5 [all_outputs]


#set_input_delay -clock [get_clocks "CLK"] 1000 [get_ports {RESET_B P0 P1 P2 P3 PHT EA_B TM}]
#set_input_delay -network_latency_included -clock CLK_MEM 1000 [all_inputs]
#set_output_delay -network_latency_included -clock CLK 1000 [all_outputs]
#set_output_delay -network_latency_included -clock CLK_MEM 1000 [all_outputs]