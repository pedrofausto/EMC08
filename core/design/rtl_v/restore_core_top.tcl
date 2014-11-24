
# NC-Sim Command File
# TOOL:	ncsim	06.20-s002
#
#
# You can restore this configuration with:
#
#     irun -gui -access rwc -top core_tb core_tb.v core_fsm.v core_pcau.v core_alu.v core_reg_ctrl.v core_mem_ctrl.v SPRAM128X8.v ROM4096X8.v -input /home/student/EMC08/digital_A/core/design/rtl_v/restore_core_top.tcl
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
probe -create -database waves core_tb.CORE.core_reset_i core_tb.CORE.core_clk_i core_tb.CORE.core_mem_clk_i core_tb.CORE.fsm.fsm_state_o core_tb.CORE.fsm.fsm_pc_i core_tb.CORE.fsm.fsm_opcode core_tb.CORE.fsm.fsm_op1 core_tb.CORE.fsm.fsm_op2 core_tb.CORE.fsm.fsm_op_aux_1 core_tb.CORE.fsm.fsm_op_aux_1_2 core_tb.CORE.fsm.fsm_op_aux_2 core_tb.CORE.fsm.fsm_int_vect_i core_tb.CORE.fsm.fsm_int_rdy_o core_tb.CORE.fsm.fsm_int_na_o core_tb.CORE.fsm.lcall_hardware_flag core_tb.CORE.mem_ctrl.mem_ctrl_rom_addr_i core_tb.CORE.mem_ctrl.mem_ctrl_rom_data_o core_tb.CORE.mem_ctrl.mem_ctrl_rom_rd_b_i core_tb.CORE.fsm.fsm_sfr_data_o core_tb.CORE.fsm.fsm_sfr_addr_o core_tb.CORE.reg_ctrl.sfr core_tb.CORE.pcau.pcau_o core_tb.CORE.pcau.pcau_offset_i core_tb.CORE.pcau.pcau_pc_o core_tb.CORE.pcau.pcau_pc_msb_i core_tb.CORE.pcau.pcau_pc_direct_i core_tb.CORE.pcau.pcau_en_i core_tb.CORE.mem_ctrl.mem_ctrl_ram_addr_i core_tb.CORE.mem_ctrl.mem_ctrl_ram_data_i core_tb.CORE.mem_ctrl.mem_ctrl_ram_data_o core_tb.CORE.mem_ctrl.mem_ctrl_ram_rd_b_i core_tb.CORE.mem_ctrl.mem_ctrl_ram_wr_b_i core_tb.CORE.mem_ctrl.mem_ctrl_bit_byte_flag_i core_tb.CORE.mem_ctrl.mem_ctrl_ext_ram_i core_tb.CORE.alu.alu_en_i core_tb.CORE.alu.alu_opcode_i core_tb.CORE.alu.alu_operand1_i core_tb.CORE.alu.alu_operand2_i core_tb.CORE.alu.alu_cy_i core_tb.CORE.alu.alu_ov_i core_tb.CORE.alu.alu_ac_i core_tb.CORE.alu.alu_result_o core_tb.CORE.alu.alu_ac_o core_tb.CORE.alu.alu_cy_o core_tb.CORE.alu.alu_ov_o core_tb.CORE.reg_ctrl.reg_ctrl_fsm_addr_i core_tb.CORE.reg_ctrl.reg_ctrl_fsm_data_i core_tb.CORE.reg_ctrl.reg_ctrl_fsm_data_o core_tb.CORE.reg_ctrl.reg_ctrl_fsm_rd_b_i core_tb.CORE.reg_ctrl.reg_ctrl_fsm_wr_b_i core_tb.CORE.reg_ctrl.reg_ctrl_fsm_bit_byte_flag_i core_tb.CORE.reg_ctrl.reg_ctrl_alu_cy_i core_tb.CORE.reg_ctrl.reg_ctrl_alu_cy_o core_tb.CORE.reg_ctrl.reg_ctrl_interrupt_clear_i

simvision -input /home/student/EMC08/digital_A/core/design/rtl_v/restore_core_top.tcl.svcf
