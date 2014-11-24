
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     ncsim tb_PORTS -gui -input port0.tcl
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
database -open -shm -into waves.shm waves -default
probe -create -database waves tb_PORTS.a_port4_o tb_PORTS.ports_sfr_P4_i
probe -create -database waves tb_PORTS.p0_pin tb_PORTS.ports_sfr_P0EN_i tb_PORTS.ports_sfr_P0_i tb_PORTS.ports_sfr_P0_o tb_PORTS.en_port0_o tb_PORTS.y_port0_i tb_PORTS.a_port0_o

simvision -input /home/student/EMC08/digital_A/ports/design/rtl_v/port0.tcl.svcf
