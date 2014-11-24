
# NC-Sim Command File
# TOOL:	ncsim	06.20-s002
#
#
# You can restore this configuration with:
#
#     irun -access rwc -gui bus_control_tb.v bus_control.v -input restore.tcl
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
probe -create -database waves bus_control_tb.dut.bus_control_ea_b_i bus_control_tb.dut.bus_control_mem_ctrl_ea_b_o bus_control_tb.dut.bus_control_mem_ctrl_ext_addr_i bus_control_tb.dut.bus_control_mem_ctrl_ext_data_i bus_control_tb.dut.bus_control_mem_ctrl_ext_data_o bus_control_tb.dut.bus_control_mem_ctrl_ext_ram_rd_b_i bus_control_tb.dut.bus_control_mem_ctrl_ext_ram_wr_b_i bus_control_tb.dut.bus_control_mem_ctrl_ext_rom_rd_b_i bus_control_tb.dut.bus_control_psen_b_o bus_control_tb.dut.bus_control_reg_ctrl_p0_io bus_control_tb.dut.bus_control_reg_ctrl_p0en_o bus_control_tb.dut.bus_control_reg_ctrl_p2_o bus_control_tb.dut.bus_control_reg_ctrl_p2en_o bus_control_tb.dut.bus_control_reg_ctrl_p3_6_o bus_control_tb.dut.bus_control_reg_ctrl_p3_7_o bus_control_tb.dut.bus_control_reg_ctrl_p3en_6_o bus_control_tb.dut.bus_control_reg_ctrl_p3en_7_o bus_control_tb.dut.bus_control_reg_ctrl_p4_o bus_control_tb.dut.read bus_control_tb.dut.write_p0

simvision -input /home/student/DFund-VlogWrkShp_6_2/Data/VlogWrkShp_6_2/restore.tcl.svcf
