
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -access rwc /home/student/EMC08/digital_A/serial/design/rtl_v/serial_top.v tb_serial_final.v -timescale 1ns/10ps -gui -input tx_mode_2.tcl -input /home/student/EMC08/digital_A/serial/verification/testbench_vlog/tx_mode_2.tcl
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
probe -create -database waves tb_serial_final.serial_top_tb.serial_tx_block.serial_reset_i_b tb_serial_final.serial_top_tb.serial_tx_block.serial_send_o tb_serial_final.PACOTE tb_serial_final.serial_top_tb.serial_tx_block.serial_data_sbuf_i tb_serial_final.br_trans tb_serial_final.br tb_serial_final.serial_top_tb.serial_tx_block.serial_serial_tx_i tb_serial_final.serial_top_tb.serial_p3_0_o tb_serial_final.serial_top_tb.serial_p3_1_o tb_serial_final.serial_top_tb.serial_tx_block.serial_clock_i tb_serial_final.serial_top_tb.serial_tx_block.serial_scon3_tb8_i
probe -create -database waves tb_serial_final.scon0_ri_o tb_serial_final.scon1_ti_o
probe -create -database waves tb_serial_final.serial_top_tb.serial_p3en_0_o

simvision -input /home/student/EMC08/digital_A/serial/verification/testbench_vlog/tx_mode_2.tcl.svcf
