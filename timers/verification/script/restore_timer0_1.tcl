
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -nbasync -gui -snload tmr0_test.e {./rtl_t0/link to timer0.v} ./rtl_t0/tmr0_tb.v -access r +mpssession+SPECMAN32065 -input restore.tcl
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
probe -create -database waves timer0_tb.clock timer0_tb.reset timer0_tb.th0_i timer0_tb.tm0_i timer0_tb.tl0_i timer0_tb.th0_o timer0_tb.tm0_o timer0_tb.tl0_o timer0_tb.tcon_tf0 timer0_tb.tcon_tr0 timer0_tb.tmod_gate_t0 timer0_tb.int0 timer0_tb.tmod_m0t0 timer0_tb.tmod_m1t0
probe -create -database waves timer0_tb.tcon_tf0_i timer0_tb.tcon_tf0_o

simvision -input /home/student/Desktop/Timer/restore_timer0_1.tcl.svcf
