
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -nbasync -gui -snload top_feature_serial_testcase2.e emc_top_tb.v /home/student/EMC08/digital_A/top/design/rtl_v/emc_top.v -access r -timescale 1ns/10ps -snprerun {set check WARNING} -input restore.tcl +mpssession+SPECMAN31489 -input restore3.tcl
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
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.top_clock_i emc_top_tb.EMC_TOP_INSTANCE.top_clock_mem_i emc_top_tb.EMC_TOP_INSTANCE.top_cycle_machine emc_top_tb.EMC_TOP_INSTANCE.top_ea_b_i emc_top_tb.EMC_TOP_INSTANCE.top_p0_a_o emc_top_tb.EMC_TOP_INSTANCE.top_p0_en_o emc_top_tb.EMC_TOP_INSTANCE.top_p0_y_i emc_top_tb.EMC_TOP_INSTANCE.top_p1_a_o emc_top_tb.EMC_TOP_INSTANCE.top_p1_en_o emc_top_tb.EMC_TOP_INSTANCE.top_p1_y_i emc_top_tb.EMC_TOP_INSTANCE.top_p2_a_o emc_top_tb.EMC_TOP_INSTANCE.top_p2_en_o emc_top_tb.EMC_TOP_INSTANCE.top_p2_y_i emc_top_tb.EMC_TOP_INSTANCE.top_p3_a_o emc_top_tb.EMC_TOP_INSTANCE.top_p3_en_o emc_top_tb.EMC_TOP_INSTANCE.top_p3_y_i emc_top_tb.EMC_TOP_INSTANCE.top_p4_a_o emc_top_tb.EMC_TOP_INSTANCE.top_pht_i emc_top_tb.EMC_TOP_INSTANCE.top_psen_b_o emc_top_tb.EMC_TOP_INSTANCE.top_reset_i emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.mem_ctrl.internal_rom.ROM_matrix
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_alu_opcode_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_data_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_data_i emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_addr_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_rd_o_b emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_wr_o_b emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_state_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.mem_ctrl.internal_rom.ADR emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.mem_ctrl.internal_rom.ENB emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.mem_ctrl.internal_rom.OEB emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.mem_ctrl.internal_rom.Q emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_rom_addr_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_rom_data_i emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_rom_rd_o_b
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_opcode
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_int_vect_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.BAUD_RATE_INSTANCE.baud_rate_br_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.reg_ctrl_serial_tx_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.sfr
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_scon1_ti_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_scon1_ti_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_clock_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_tx_block.serial_tx_control.state_tx emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_tx_block.serial_tx_control.serial_p3en_0_o emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_tx_block.serial_tx_control.serial_p3en_1_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.core_serial_tx_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm_reg_ctrl_data emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_p3_0_o emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_p3_1_o emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_p3en_0_o emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_p3en_1_o

simvision -input /home/student/EMC08/digital_A/top/verification/testbench/thiago/restore3.tcl.svcf
