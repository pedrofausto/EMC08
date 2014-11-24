
# NC-Sim Command File
# TOOL:	ncsim	06.20-s002
#
#
# You can restore this configuration with:
#
#     irun -access rwc -nbasync -snload mc_test.e -sntimescale 1ns/10ps -gui ../../../design/rtl_v/core_mem_ctrl_tb.v ../../../design/rtl_v/core_mem_ctrl.v ROM4096X8.v SPRAM128X8.v -snprerun {set check WARNING; test} -input ctrl_mem_restore.tcl +mpssession+SPECMAN15001 -input /home/student/EMC08/digital_A/core/verification/testbench/mem_ctrl/ctrl_mem_restore.tcl
#

set tcl_prompt1 {puts -nonewline "ncsim> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 0
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 0
set assert_report_incompletes 1
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves core_mem_ctrl_tb.DUT.mem_ctrl_clk_i core_mem_ctrl_tb.DUT.mem_ctrl_bit_byte_flag_i core_mem_ctrl_tb.DUT.mem_ctrl_ram_wr_b_i core_mem_ctrl_tb.DUT.mem_ctrl_ram_rd_b_i core_mem_ctrl_tb.DUT.mem_ctrl_ext_ram_i core_mem_ctrl_tb.DUT.mem_ctrl_ram_addr_i core_mem_ctrl_tb.DUT.mem_ctrl_ram_data_i core_mem_ctrl_tb.DUT.mem_ctrl_ram_data_o core_mem_ctrl_tb.DUT.internal_ram.RAM_matrix core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_ea_b_i core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_data_i core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_ext_ram_wr_b_o core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_ext_ram_rd_b_o core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_addr_o core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_data_o core_mem_ctrl_tb.DUT.mem_ctrl_bus_ctrl_ext_rom_rd_b_o core_mem_ctrl_tb.DUT.int_ram_data_i core_mem_ctrl_tb.DUT.mem_ctrl_rom_rd_b_i core_mem_ctrl_tb.DUT.mem_ctrl_rom_addr_i core_mem_ctrl_tb.DUT.mem_ctrl_rom_data_o core_mem_ctrl_tb.DUT.internal_rom.ROM_matrix
probe -create -database waves core_mem_ctrl_tb.DUT.ram_location core_mem_ctrl_tb.DUT.rom_location core_mem_ctrl_tb.DUT.internal_rom.ADR core_mem_ctrl_tb.DUT.internal_rom.ENB core_mem_ctrl_tb.DUT.internal_rom.OEB core_mem_ctrl_tb.DUT.internal_rom.Q

simvision -input /home/student/EMC08/digital_A/core/verification/testbench/mem_ctrl/ctrl_mem_restore.tcl.svcf
