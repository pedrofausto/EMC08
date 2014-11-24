
# NC-Sim Command File
# TOOL:	ncsim	06.20-s002
#
#
# You can restore this configuration with:
#
#     irun -gui -debug -top core_fsm_tb core_fsm_tb.v core_fsm.v core_pcau.v -s -input restore.tcl
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
probe -create -database waves core_fsm_tb.FSM.fsm_reset_i_b core_fsm_tb.FSM.state core_fsm_tb.PCAU.pcau_clock_mem_i core_fsm_tb.FSM.fsm_clock_i core_fsm_tb.FSM.fsm_opcode core_fsm_tb.FSM.fsm_op1 core_fsm_tb.FSM.fsm_op2 core_fsm_tb.FSM.fsm_pcau_en_o core_fsm_tb.FSM.fsm_pcau_offset_o core_fsm_tb.FSM.fsm_pc_i core_fsm_tb.FSM.fsm_rom_data_i core_fsm_tb.FSM.fsm_rom_rd_o_b core_fsm_tb.FSM.fsm_ram_addr_o core_fsm_tb.FSM.fsm_ram_data_o core_fsm_tb.FSM.fsm_ram_data_i core_fsm_tb.FSM.fsm_ram_rd_o_b core_fsm_tb.FSM.fsm_ram_wr_o_b core_fsm_tb.FSM.fsm_sfr_addr_o core_fsm_tb.FSM.fsm_sfr_data_i core_fsm_tb.FSM.fsm_sfr_data_o core_fsm_tb.FSM.fsm_sfr_rd_o_b core_fsm_tb.FSM.fsm_sfr_wr_o_b core_fsm_tb.FSM.fsm_alu_op1_o core_fsm_tb.FSM.fsm_alu_op2_o core_fsm_tb.FSM.fsm_alu_opcode_o core_fsm_tb.FSM.fsm_alu_result_i core_fsm_tb.FSM.fsm_bit_byte_flag_o core_fsm_tb.FSM.next_state core_fsm_tb.FSM.fsm_psw_i core_fsm_tb.fsm_alu_op1_o core_fsm_tb.fsm_alu_op2_o core_fsm_tb.fsm_alu_opcode_o core_fsm_tb.fsm_alu_result_i core_fsm_tb.fsm_bit_byte_flag_o core_fsm_tb.pcau_clock_mem_i core_fsm_tb.fsm_clock_i core_fsm_tb.fsm_pcau_en_o core_fsm_tb.fsm_pcau_offset_o core_fsm_tb.fsm_ram_addr_o core_fsm_tb.fsm_ram_data_i core_fsm_tb.fsm_ram_data_o core_fsm_tb.fsm_ram_rd_o_b core_fsm_tb.fsm_ram_wr_o_b core_fsm_tb.fsm_reset_i_b core_fsm_tb.fsm_rom_addr_o core_fsm_tb.fsm_rom_data_i core_fsm_tb.fsm_rom_rd_o_b core_fsm_tb.fsm_sfr_addr_o core_fsm_tb.fsm_sfr_data_i core_fsm_tb.fsm_sfr_data_o core_fsm_tb.fsm_sfr_rd_o_b core_fsm_tb.fsm_sfr_wr_o_b core_fsm_tb.pcau_en_i core_fsm_tb.pcau_offset_i core_fsm_tb.pcau_pc_o core_fsm_tb.pcau_reset_i_b core_fsm_tb.reset core_fsm_tb.FSM.fsm_rom_addr_o

simvision -input /home/student/EMC08/digital_A/core/design/rtl_v/restore.tcl.svcf
