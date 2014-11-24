
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -nbasync -gui -access +rwc -input {@source restore.tcl} -snprerun {set check WARNING; test -seed=2; wave -event sys.env.agent_in.mon} /home/student/EMC08/digital_A/interrupt/verification/testbench/interrupt_tb.v /home/student/EMC08/digital_A/interrupt/design/rtl_v/interrupt.v -snload testbench/int_test_f3_v1.e -run +mpssession+SPECMAN7104 -input restore.tcl
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
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves specman_wave -all -variables -depth all
probe -create -database waves interrupt_tb.UUT.int_rst_sync_b_i interrupt_tb.UUT.clk interrupt_tb.UUT.int_cm_i interrupt_tb.UUT.int_intx_b_i interrupt_tb.UUT.int_na_i interrupt_tb.UUT.int_rdy_i interrupt_tb.UUT.reg_ie_i interrupt_tb.UUT.reg_ip_i interrupt_tb.UUT.reg_scon_i interrupt_tb.UUT.reg_tcon_i interrupt_tb.UUT.reg_tcon2_i interrupt_tb.UUT.int_reg_clr_o interrupt_tb.UUT.int_vect_o interrupt_tb.UUT.reg_tcon2_o interrupt_tb.UUT.reg_tcon_o
probe -create -database waves specman_wave -all -variables -depth all
probe -create -database waves specman_wave -all -variables -depth all
probe -create -database waves specman_wave -all -variables -depth all
probe -create -database waves specman_wave -all -variables -depth all
probe -create -database waves specman_wave -all -variables -depth all

simvision -input /home/student/EMC08/digital_A/interrupt/verification/restore.tcl.svcf
