
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -nbasync -gui -snload top_feature_behave_testcase1.e emc_top_tb.v /home/student/EMC08/digital_A/top/design/rtl_v/emc_top.v -access rwc -timescale 1ns/10ps -snprerun {set check WARNING; test} -input restore2.tcl +mpssession+SPECMAN30263 -input restore_interrupt.tcl
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
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.reg_ctrl_serial_tx_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_addr_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_data_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_data_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.sfr emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.ier_ctr emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.ier emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.int_rdy_i emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.int_na_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.reg_ctrl_fsm_rd_b_i emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.reg_ctrl_fsm_wr_b_i emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.reg_tcon_o emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.int_reg_clr_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.TIMERS_INSTANCE.top_timers_sfr_tcon_tf0_i emc_top_tb.EMC_TOP_INSTANCE.TIMERS_INSTANCE.top_timers_sfr_tcon_tf0_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.TIMERS_INSTANCE.top_timers_sfr_tcon_tf1_i emc_top_tb.EMC_TOP_INSTANCE.TIMERS_INSTANCE.top_timers_sfr_tcon_tf1_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.mem_ctrl.internal_ram.RAM_matrix
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.reg_tcon2_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.flag_in_comp emc_top_tb.EMC_TOP_INSTANCE.INTERRUPT_INSTANCE.flag_out
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.BAUD_RATE_INSTANCE.baud_rate_br_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_scon1_ti_i emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_scon1_ti_o emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_scon0_ri_i emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_scon0_ri_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_p3en_0_o emc_top_tb.EMC_TOP_INSTANCE.SERIAL_INSTANCE.serial_p3_0_o
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.BUS_CONTROL_INSTANCE.bus_control_core_ext_ram_rd_b_i emc_top_tb.EMC_TOP_INSTANCE.BUS_CONTROL_INSTANCE.bus_control_core_ext_ram_wr_b_i emc_top_tb.EMC_TOP_INSTANCE.BUS_CONTROL_INSTANCE.bus_control_core_ext_rom_rd_b_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op1 emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op2 emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op_aux_1 emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op_aux_1_2 emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op_aux_2 emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_pc_i
probe -create -database waves emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_int_na_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_int_rdy_o emc_top_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.lcall_hardware_flag

simvision -input /home/student/EMC08/digital_A/top/verification/testbench/restore_interrupt.tcl.svcf
