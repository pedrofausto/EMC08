
# NC-Sim Command File
# TOOL:	ncsim	06.20-s002
#
#
# You can restore this configuration with:
#
#     irun -nbasync -gui -access +rwc -input {@source /home/student/EMC08/digital_A/core/verification/scripts/top/restore.tcl} -snprerun {set check WARNING; test -seed=3} -sntimescale 1ns/10ps testbench/top_verification/core_tb.v -snload testbench/top_verification/core_top_test_f1.e -run +mpssession+SPECMAN13751 -input /home/student/EMC08/digital_A/core/verification/scripts/top/restore.tcl
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
probe -create -database waves specman_wave -all -variables -depth all
probe -create -database waves core_tb.CORE.core_bus_ctrl_data_o core_tb.CORE.core_baudrate_rs232_o core_tb.CORE.core_baudrate_sm0_o core_tb.CORE.core_baudrate_sm1_o core_tb.CORE.core_baudrate_sm2_o core_tb.CORE.core_baudrate_smod_o core_tb.CORE.core_bus_ctrl_addr_o core_tb.CORE.core_bus_ctrl_data_i core_tb.CORE.core_bus_ctrl_ea_b_i core_tb.CORE.core_bus_ctrl_ext_ram_rd_b_o core_tb.CORE.core_bus_ctrl_ext_ram_wr_b_o core_tb.CORE.core_bus_ctrl_ext_rom_rd_b_o core_tb.CORE.core_bus_ctrl_p0_i core_tb.CORE.core_bus_ctrl_p0_o core_tb.CORE.core_bus_ctrl_p0en_i core_tb.CORE.core_bus_ctrl_p2_i core_tb.CORE.core_bus_ctrl_p2en_i core_tb.CORE.core_bus_ctrl_p3_6_i core_tb.CORE.core_bus_ctrl_p3_7_i core_tb.CORE.core_bus_ctrl_p3en_6_i core_tb.CORE.core_bus_ctrl_p3en_7_i core_tb.CORE.core_bus_ctrl_p4_i core_tb.CORE.core_clk_i core_tb.CORE.core_interrupt_clear_i core_tb.CORE.core_interrupt_ie_o core_tb.CORE.core_interrupt_intx_o core_tb.CORE.core_interrupt_ip_o core_tb.CORE.core_interrupt_na_o core_tb.CORE.core_interrupt_rdy_o core_tb.CORE.core_interrupt_scon_o core_tb.CORE.core_interrupt_tcon2_i core_tb.CORE.core_interrupt_tcon2_o core_tb.CORE.core_interrupt_tcon_i core_tb.CORE.core_interrupt_tcon_o core_tb.CORE.core_interrupt_vect_i core_tb.CORE.core_mem_clk_i core_tb.CORE.core_ports_p0_i core_tb.CORE.core_ports_p0_o core_tb.CORE.core_ports_p0en_o core_tb.CORE.core_ports_p1_i core_tb.CORE.core_ports_p1_o core_tb.CORE.core_ports_p1en_o core_tb.CORE.core_ports_p2_i core_tb.CORE.core_ports_p2_o core_tb.CORE.core_ports_p2en_o core_tb.CORE.core_ports_p3_i core_tb.CORE.core_ports_p3_o core_tb.CORE.core_ports_p3en_o core_tb.CORE.core_ports_p4_o core_tb.CORE.core_reset_i core_tb.CORE.core_reset_o core_tb.CORE.core_serial_p3_0_i core_tb.CORE.core_serial_p3_0_o core_tb.CORE.core_serial_p3_1_i core_tb.CORE.core_serial_p3en_0_i core_tb.CORE.core_serial_p3en_1_i core_tb.CORE.core_serial_rb8_i core_tb.CORE.core_serial_ren_o core_tb.CORE.core_serial_ri_i core_tb.CORE.core_serial_ri_o core_tb.CORE.core_serial_sbuf_rx_i core_tb.CORE.core_serial_sbuf_tx_o core_tb.CORE.core_serial_sm0_o core_tb.CORE.core_serial_tb8_o core_tb.CORE.core_serial_ti_i core_tb.CORE.core_serial_ti_o core_tb.CORE.core_serial_tx_o core_tb.CORE.core_timers_acrh_i core_tb.CORE.core_timers_acrl_i core_tb.CORE.core_timers_acrm_i core_tb.CORE.core_timers_dfp_o core_tb.CORE.core_timers_dfsel_o core_tb.CORE.core_timers_edgsel_o core_tb.CORE.core_timers_gate_t0_o core_tb.CORE.core_timers_gate_t1_o core_tb.CORE.core_timers_int0_o core_tb.CORE.core_timers_int1_o core_tb.CORE.core_timers_m0_t0_o core_tb.CORE.core_timers_m0_t1_o core_tb.CORE.core_timers_m1_t0_o core_tb.CORE.core_timers_m1_t1_o core_tb.CORE.core_timers_tacph_i core_tb.CORE.core_timers_tacph_o core_tb.CORE.core_timers_tacpl_i core_tb.CORE.core_timers_tacpl_o core_tb.CORE.core_timers_tf0_i core_tb.CORE.core_timers_tf0_o core_tb.CORE.core_timers_tf1_i core_tb.CORE.core_timers_tf1_o core_tb.CORE.core_timers_tf2_i core_tb.CORE.core_timers_tf2_o core_tb.CORE.core_timers_th0_i core_tb.CORE.core_timers_th0_o core_tb.CORE.core_timers_th1_i core_tb.CORE.core_timers_th1_o core_tb.CORE.core_timers_tl0_i core_tb.CORE.core_timers_tl0_o core_tb.CORE.core_timers_tl1_i core_tb.CORE.core_timers_tl1_o core_tb.CORE.core_timers_tm0_i core_tb.CORE.core_timers_tm0_o core_tb.CORE.core_timers_tm1_i core_tb.CORE.core_timers_tm1_o core_tb.CORE.core_timers_tr0_o core_tb.CORE.core_timers_tr1_o core_tb.CORE.core_timers_tr2_o
probe -create -database waves core_tb.CORE.fsm.fsm_opcode
probe -create -database waves core_tb.CORE.pcau.pcau_pc_o core_tb.CORE.mem_ctrl.internal_rom.Q core_tb.CORE.mem_ctrl.internal_rom.OEB core_tb.CORE.mem_ctrl.internal_rom.ADR
probe -create -database waves core_tb.CORE.fsm.fsm_state_o core_tb.CORE.mem_ctrl.rom_location core_tb.CORE.fsm.fsm_sfr_addr_o core_tb.CORE.fsm.fsm_sfr_data_i core_tb.CORE.fsm.fsm_sfr_data_o core_tb.CORE.mem_ctrl.internal_rom.ROM_matrix
probe -create -database waves core_tb.CORE.fsm.fsm_ram_addr_o core_tb.CORE.fsm.fsm_ram_data_i core_tb.CORE.fsm.fsm_ram_data_o

simvision -input /home/student/EMC08/digital_A/core/verification/scripts/top/restore.tcl.svcf
