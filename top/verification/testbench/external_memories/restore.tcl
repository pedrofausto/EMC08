
# NC-Sim Command File
# TOOL:	ncsim	06.10-p001
#
#
# You can restore this configuration with:
#
#     irun -gui -debug -top emc_top_ext_ram_tb emc_top_ext_ram_tb.v emc_top.v ROM4096X8.v SPRAM65536X8.v -input restore.tcl
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
probe -create -database waves emc_top_ext_ram_tb.external_ram.CLK emc_top_ext_ram_tb.external_ram.ADR emc_top_ext_ram_tb.external_ram.D emc_top_ext_ram_tb.external_ram.OEB emc_top_ext_ram_tb.external_ram.ENB emc_top_ext_ram_tb.external_ram.WEB emc_top_ext_ram_tb.external_ram.Q emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.sfr emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.cycle_continue emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_alu_en_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_alu_op1_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_alu_op2_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_alu_opcode_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_alu_result_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_bit_byte_flag_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_clock_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ext_ram_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_int_na_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_int_rdy_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_int_vect_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op1 emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op2 emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op_aux_1 emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op_aux_1_2 emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_op_aux_2 emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_opcode emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_pc_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_pcau_direct_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_pcau_en_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_pcau_msb_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_pcau_offset_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_psw_rs_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_addr_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_data_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_data_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_rd_o_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_ram_wr_o_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_reset_core_o_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_reset_i_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_rom_addr_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_rom_data_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_rom_rd_o_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_addr_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_data_i emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_data_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_rd_o_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_sfr_wr_o_b emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.fsm_state_o emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.lcall_hardware_flag emc_top_ext_ram_tb.EMC_TOP_INSTANCE.CORE_INSTANCE.fsm.next_state
probe -create -database waves emc_top_ext_ram_tb.external_ram.RAM_matrix

simvision -input /home/student/EMC08/digital_A/top/design/rtl_v/restore.tcl.svcf
