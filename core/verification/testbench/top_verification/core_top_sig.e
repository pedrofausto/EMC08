<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_sig.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core top module, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Map the external signals to the verification environment
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: core_top_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_sig_h;

extend core_top_sig_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   p_core_reset_i: inout simple_port of bit is instance;
   p_core_fsm_opcode: inout simple_port of uint(bits:8) is instance;
   p_core_pc: inout simple_port of uint(bits:16) is instance;
   
   p_core_timers_th0_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tm0_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tl0_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tf0_i: inout simple_port of bit is instance;
   p_core_timers_th1_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tm1_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tl1_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tf1_i: inout simple_port of bit is instance;
   p_core_timers_acrh_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_acrm_i: inout simple_port of uint(bits:8) is instance;
   p_core_timers_acrl_i: inout simple_port of uint(bits:8) is instance;
   
//   core_timers_tacph_i: inout simple_port of uint(bits:2) is instance;
//   core_timers_tacpl_i: inout simple_port of uint(bits:8) is instance;
   
   p_core_timers_tf2_i: inout simple_port of bit is instance;
   
   p_core_bus_ctrl_p0en_i: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_p2en_i: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_p3en_6_i: inout simple_port of bit is instance;
   p_core_bus_ctrl_p3en_7_i: inout simple_port of bit is instance;
   p_core_bus_ctrl_p2_i: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_p3_6_i: inout simple_port of bit is instance;
   p_core_bus_ctrl_p3_7_i: inout simple_port of bit is instance;
   p_core_bus_ctrl_p4_i: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_ea_b_i: inout simple_port of bit is instance;
   p_core_bus_ctrl_data_i: inout simple_port of uint(bits:8) is instance;
   
   p_core_interrupt_clear_i: inout simple_port of bit is instance;
   p_core_interrupt_tcon2_i: inout simple_port of uint(bits:2) is instance;
   p_core_interrupt_tcon_i: inout simple_port of uint(bits:4) is instance;
   p_core_interrupt_vect_i: inout simple_port of uint (bits:3) is instance;
   
   p_core_serial_p3en_0_i: inout simple_port of bit is instance;
   p_core_serial_p3en_1_i: inout simple_port of bit is instance;
   p_core_serial_p3_0_i: inout simple_port of bit is instance;
   p_core_serial_p3_1_i: inout simple_port of bit is instance;
   p_core_serial_sbuf_rx_i: inout simple_port of uint(bits:8) is instance;
   p_core_serial_rb8_i: inout simple_port of bit is instance;
   p_core_serial_ti_i: inout simple_port of bit is instance;
   p_core_serial_ri_i: inout simple_port of bit is instance;
   
   ///////////// INOUT /////////////////////////////
   p_core_ports_p0_i: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p1_i: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p2_i: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p3_i: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_p0_i: inout simple_port of uint(bits:8) is instance;
   
   p_core_ports_p0_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p1_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p2_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p3_o: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_p0_o: inout simple_port of uint(bits:8) is instance;
   
   ////////////// OUTPUTS /////////
   p_core_baudrate_sm0_o: inout simple_port of bit is instance;
   p_core_baudrate_sm1_o: inout simple_port of bit is instance;
   p_core_baudrate_sm2_o: inout simple_port of bit is instance;
   p_core_baudrate_smod_o: inout simple_port of bit is instance;
   p_core_baudrate_rs232_o: inout simple_port of bit is instance;
   p_core_reset_o: inout simple_port of bit is instance;
   
   p_core_timers_th0_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tm0_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tl0_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_gate_t0_o: inout simple_port of bit is instance;
   p_core_timers_m1_t0_o: inout simple_port of bit is instance;
   p_core_timers_m0_t0_o: inout simple_port of bit is instance;
   p_core_timers_tr0_o: inout simple_port of bit is instance;
   p_core_timeres_tf0_o: inout simple_port of bit is instance;
   p_core_timers_th1_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tm1_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tl1_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_gate_t1_o: inout simple_port of bit is instance;
   p_core_timers_m1_t1_o: inout simple_port of bit is instance;
   p_core_timers_m0_t1_o: inout simple_port of bit is instance;
   p_core_timers_int0_o: inout simple_port of bit is instance;
   p_core_timers_tr1_o: inout simple_port of bit is instance;
   p_core_timeres_tf1_o: inout simple_port of bit is instance;
   p_core_timers_int1_o: inout simple_port of bit is instance;
   p_core_timers_tacph_o: inout simple_port of uint(bits:2) is instance;
   p_core_timers_tacpl_o: inout simple_port of uint(bits:8) is instance;
   p_core_timers_tr2_o: inout simple_port of bit is instance;
   p_core_timeres_tf2_o: inout simple_port of bit is instance;
   p_core_timers_dfsel_o: inout simple_port of bit is instance;
   p_core_timers_edgsel_o: inout simple_port of bit is instance;
   p_core_timers_dfp_o: inout simple_port of uint(bits:3) is instance;
   
   p_core_interrupt_ip_o: inout simple_port of uint(bits:7) is instance;
   p_core_interrupt_ie_o: inout simple_port of uint(bits:8) is instance;
   p_core_interrupt_scon_o: inout simple_port of uint(bits:2) is instance;
   p_core_interrupt_tcon_o: inout simple_port of uint(bits:6) is instance;
   p_core_interrupt_tcon2_o: inout simple_port of uint(bits:2) is instance;
   p_core_interrupt_na_o: inout simple_port of bit is instance;
   p_core_interrupt_rdy_o: inout simple_port of bit is instance;
   p_core_interrupt_intx_o: inout simple_port of uint(bits: 2) is instance;
   
   p_core_ports_p4_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p0en_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p1en_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p2en_o: inout simple_port of uint(bits:8) is instance;
   p_core_ports_p3en_o: inout simple_port of uint(bits:8) is instance;
   
   p_core_serial_sm0_o: inout simple_port of bit is instance;
   p_core_serial_ren_o: inout simple_port of bit is instance;
   p_core_serial_p3_0_o: inout simple_port of bit is instance;
   p_core_serial_sbuf_tx_o: inout simple_port of uint(bits:8) is instance;
   p_core_serial_tb8_o: inout simple_port of bit is instance;
   p_core_serial_ti_o: inout simple_port of bit is instance;
   p_core_serial_ri_o: inout simple_port of bit is instance;
   p_core_serial_tx_o: inout simple_port of bit is instance;
   
   p_core_bus_ctrl_addr_o: inout simple_port of uint(bits:16) is instance;
   p_core_bus_ctrl_data_o: inout simple_port of uint(bits:8) is instance;
   p_core_bus_ctrl_ext_rom_rd_b_o: inout simple_port of bit is instance;
   p_core_bus_ctrl_ext_ram_rd_b_o: inout simple_port of bit is instance;
   p_core_bus_ctrl_ext_ram_wr_b_o: inout simple_port of bit is instance;
   
    ///////// Connect the ports to the external design
   keep bind (p_core_reset_i, external); 
   keep bind (p_core_fsm_opcode, external);
   keep bind (p_core_pc, external);
   
   keep bind (p_core_timers_th0_i, external); 
   keep bind (p_core_timers_tm0_i, external); 
   keep bind (p_core_timers_tl0_i, external); 
   keep bind (p_core_timers_tf0_i, external); 
   keep bind (p_core_timers_th1_i, external); 
   keep bind (p_core_timers_tm1_i, external); 
   keep bind (p_core_timers_tl1_i, external); 
   keep bind (p_core_timers_tf1_i, external); 
   keep bind (p_core_timers_acrh_i, external); 
   keep bind (p_core_timers_acrm_i, external); 
   keep bind (p_core_timers_acrl_i, external); 
   
//   keep bind (core_timers_tacph_i, external); 
//   keep bind (core_timers_tacpl_i, external); 
   
   keep bind (p_core_timers_tf2_i, external); 
   
   keep bind (p_core_bus_ctrl_p0en_i, external); 
   keep bind (p_core_bus_ctrl_p2en_i, external); 
   keep bind (p_core_bus_ctrl_p3en_6_i, external); 
   keep bind (p_core_bus_ctrl_p3en_7_i, external); 
   keep bind (p_core_bus_ctrl_p2_i, external); 
   keep bind (p_core_bus_ctrl_p3_6_i, external); 
   keep bind (p_core_bus_ctrl_p3_7_i, external); 
   keep bind (p_core_bus_ctrl_p4_i, external); 
   keep bind (p_core_bus_ctrl_ea_b_i, external); 
   keep bind (p_core_bus_ctrl_data_i, external); 
   
   keep bind (p_core_interrupt_clear_i, external); 
   keep bind (p_core_interrupt_tcon2_i, external); 
   keep bind (p_core_interrupt_tcon_i, external); 
   keep bind (p_core_interrupt_vect_i, external); 
   
   keep bind (p_core_serial_p3en_0_i, external); 
   keep bind (p_core_serial_p3en_1_i, external); 
   keep bind (p_core_serial_p3_0_i, external); 
   keep bind (p_core_serial_p3_1_i, external); 
   keep bind (p_core_serial_sbuf_rx_i, external); 
   keep bind (p_core_serial_rb8_i, external); 
   keep bind (p_core_serial_ti_i, external); 
   keep bind (p_core_serial_ri_i, external); 
   
   ///////////// INOUT /////////////////////////////
   keep bind (p_core_ports_p0_i, external); 
   keep bind (p_core_ports_p1_i, external); 
   keep bind (p_core_ports_p2_i, external); 
   keep bind (p_core_ports_p3_i, external); 
   keep bind (p_core_bus_ctrl_p0_i, external); 
   
   keep bind (p_core_ports_p0_o, external); 
   keep bind (p_core_ports_p1_o, external); 
   keep bind (p_core_ports_p2_o, external); 
   keep bind (p_core_ports_p3_o, external); 
   keep bind (p_core_bus_ctrl_p0_o, external); 
   
   ////////////// OUTPUTS /////////
   
   keep bind (p_core_baudrate_sm0_o, external); 
   keep bind (p_core_baudrate_sm1_o, external); 
   keep bind (p_core_baudrate_sm2_o, external); 
   keep bind (p_core_baudrate_smod_o, external); 
   keep bind (p_core_baudrate_rs232_o, external); 
   keep bind (p_core_reset_o, external); 
   
   keep bind (p_core_timers_th0_o, external); 
   keep bind (p_core_timers_tm0_o, external); 
   keep bind (p_core_timers_tl0_o, external); 
   keep bind (p_core_timers_gate_t0_o, external); 
   keep bind (p_core_timers_m1_t0_o, external); 
   keep bind (p_core_timers_m0_t0_o, external); 
   keep bind (p_core_timers_tr0_o, external); 
   keep bind (p_core_timeres_tf0_o, external); 
   keep bind (p_core_timers_th1_o, external); 
   keep bind (p_core_timers_tm1_o, external); 
   keep bind (p_core_timers_tl1_o, external); 
   keep bind (p_core_timers_gate_t1_o, external); 
   keep bind (p_core_timers_m1_t1_o, external); 
   keep bind (p_core_timers_m0_t1_o, external); 
   keep bind (p_core_timers_int0_o, external); 
   keep bind (p_core_timers_tr1_o, external); 
   keep bind (p_core_timeres_tf1_o, external); 
   keep bind (p_core_timers_int1_o, external); 
   keep bind (p_core_timers_tacph_o, external); 
   keep bind (p_core_timers_tacpl_o, external); 
   keep bind (p_core_timers_tr2_o, external); 
   keep bind (p_core_timeres_tf2_o, external); 
   keep bind (p_core_timers_dfsel_o, external); 
   keep bind (p_core_timers_edgsel_o, external); 
   keep bind (p_core_timers_dfp_o, external); 
   
   keep bind (p_core_interrupt_ip_o, external); 
   keep bind (p_core_interrupt_ie_o, external); 
   keep bind (p_core_interrupt_scon_o, external); 
   keep bind (p_core_interrupt_tcon_o, external); 
   keep bind (p_core_interrupt_tcon2_o, external); 
   keep bind (p_core_interrupt_na_o, external); 
   keep bind (p_core_interrupt_rdy_o, external); 
   keep bind (p_core_interrupt_intx_o, external);
   
   keep bind (p_core_ports_p4_o, external); 
   keep bind (p_core_ports_p0en_o, external); 
   keep bind (p_core_ports_p1en_o, external); 
   keep bind (p_core_ports_p2en_o, external); 
   keep bind (p_core_ports_p3en_o, external); 
   
   keep bind (p_core_serial_sm0_o, external); 
   keep bind (p_core_serial_ren_o, external); 
   keep bind (p_core_serial_p3_0_o, external); 
   keep bind (p_core_serial_sbuf_tx_o, external); 
   keep bind (p_core_serial_tb8_o, external); 
   keep bind (p_core_serial_ti_o, external); 
   keep bind (p_core_serial_ri_o, external); 
   keep bind (p_core_serial_tx_o, external); 
   
   keep bind (p_core_bus_ctrl_addr_o, external); 
   keep bind (p_core_bus_ctrl_data_o, external); 
   keep bind (p_core_bus_ctrl_ext_rom_rd_b_o, external); 
   keep bind (p_core_bus_ctrl_ext_ram_rd_b_o, external); 
   keep bind (p_core_bus_ctrl_ext_ram_wr_b_o, external); 
    

   when CORE_TOP_IN core_top_sig_u {
   // Path specification to the CORE_TOP IN signals INPUTS
      //////////////////// INPUT PORTS  ///////////////////////////////
   keep p_core_reset_i.hdl_path()              == "core_reset_i"; 
   keep p_core_fsm_opcode.hdl_path()           == "CORE/fsm/fsm_opcode";
   keep p_core_pc.hdl_path()                   == "CORE/pcau_fsm_pc";
   
   keep p_core_timers_th0_i.hdl_path()         == "core_timers_th0_i"; 
   keep p_core_timers_tm0_i.hdl_path()         == "core_timers_tm0_i"; 
   keep p_core_timers_tl0_i.hdl_path()         == "core_timers_tl0_i"; 
   keep p_core_timers_tf0_i.hdl_path()         == "core_timers_tf0_i"; 
   keep p_core_timers_th1_i.hdl_path()         == "core_timers_th1_i"; 
   keep p_core_timers_tm1_i.hdl_path()         == "core_timers_tm1_i"; 
   keep p_core_timers_tl1_i.hdl_path()         == "core_timers_tl1_i"; 
   keep p_core_timers_tf1_i.hdl_path()         == "core_timers_tf1_i"; 
   keep p_core_timers_acrh_i.hdl_path()        == "core_timers_acrh_i"; 

   keep p_core_timers_acrm_i.hdl_path()        == "core_timers_acrm_i"; 
   keep p_core_timers_acrl_i.hdl_path()        == "core_timers_acrl_i"; 
   
//   keep core_timers_tacph_i.hdl_path()        == "core_timers_tacph_i"; 
//   keep core_timers_tacpl_i.hdl_path()        == "core_timers_tacpl_i"; 
   
   keep p_core_timers_tf2_i.hdl_path()         == "core_timers_tf2_i"; 
   
   keep p_core_bus_ctrl_p0en_i.hdl_path()      == "core_bus_ctrl_p0en"; 
   keep p_core_bus_ctrl_p2en_i.hdl_path()      == "core_bus_ctrl_p2en"; 
   keep p_core_bus_ctrl_p3en_6_i.hdl_path()    == "core_bus_ctrl_p3en_6"; 
   keep p_core_bus_ctrl_p3en_7_i.hdl_path()    == "core_bus_ctrl_p3en_7"; 
   keep p_core_bus_ctrl_p2_i.hdl_path()        == "core_bus_ctrl_p2"; 
   keep p_core_bus_ctrl_p3_6_i.hdl_path()      == "core_bus_ctrl_p3_6"; 
   keep p_core_bus_ctrl_p3_7_i.hdl_path()      == "core_bus_ctrl_p3_7"; 
   keep p_core_bus_ctrl_p4_i.hdl_path()        == "core_bus_ctrl_p4"; 
   keep p_core_bus_ctrl_ea_b_i.hdl_path()      == "core_bus_ctrl_ea_b"; 
   keep p_core_bus_ctrl_data_i.hdl_path()      == "core_bus_ctrl_data_i"; 
   
   keep p_core_interrupt_clear_i.hdl_path()    == "core_interrupt_clear_i"; 
   keep p_core_interrupt_tcon2_i.hdl_path()    == "core_interrupt_tcon2_i"; 
   keep p_core_interrupt_tcon_i.hdl_path()     == "core_interrupt_tcon_i"; 
   keep p_core_interrupt_vect_i.hdl_path()     == "core_interrupt_vect_i"; 
   
   keep p_core_serial_p3en_0_i.hdl_path()      == "core_serial_p3en_0_i"; 
   keep p_core_serial_p3en_1_i.hdl_path()      == "core_serial_p3en_1_i"; 
   keep p_core_serial_p3_0_i.hdl_path()        == "core_serial_p3_0_i"; 
   keep p_core_serial_p3_1_i.hdl_path()        == "core_serial_p3_1_i"; 
   keep p_core_serial_sbuf_rx_i.hdl_path()     == "core_serial_sbuf_rx_i"; 
   keep p_core_serial_rb8_i.hdl_path()         == "core_serial_rb8_i"; 
   keep p_core_serial_ti_i.hdl_path()          == "core_serial_ti_i"; 
   keep p_core_serial_ri_i.hdl_path()          == "core_serial_ri_i"; 
   
   ///////////// INOUT /////////////////////////////
   keep p_core_ports_p0_i.hdl_path()          == "core_ports_p0_i"; 
   keep p_core_ports_p1_i.hdl_path()          == "core_ports_p1_i"; 
   keep p_core_ports_p2_i.hdl_path()          == "core_ports_p2_i"; 
   keep p_core_ports_p3_i.hdl_path()          == "core_ports_p3_i"; 
   keep p_core_bus_ctrl_p0_i.hdl_path()       == "core_bus_ctrl_p0_i"; 
   
   keep p_core_ports_p0_o.hdl_path()          == "core_ports_p0_o"; 
   keep p_core_ports_p1_o.hdl_path()          == "core_ports_p1_o"; 
   keep p_core_ports_p2_o.hdl_path()          == "core_ports_p2_o"; 
   keep p_core_ports_p3_o.hdl_path()          == "core_ports_p3_o"; 
   keep p_core_bus_ctrl_p0_o.hdl_path()       == "core_bus_ctrl_p0_o"; 
   
   ////////////// OUTPUTS /////////
   
   keep p_core_baudrate_sm0_o.hdl_path()       == "core_baudrate_sm0"; 
   keep p_core_baudrate_sm1_o.hdl_path()       == "core_baudrate_sm1"; 
   keep p_core_baudrate_sm2_o.hdl_path()       == "core_baudrate_sm2"; 
   keep p_core_baudrate_smod_o.hdl_path()      == "core_baudrate_smod"; 
   keep p_core_baudrate_rs232_o.hdl_path()     == "core_baudrate_rs232"; 
   keep p_core_reset_o.hdl_path()              == "core_reset_o"; 
   
   keep p_core_timers_th0_o.hdl_path()         == "core_timers_th0_o"; 
   keep p_core_timers_tm0_o.hdl_path()         == "core_timers_tm0_o"; 
   keep p_core_timers_tl0_o.hdl_path()         == "core_timers_tl0_o"; 
   keep p_core_timers_gate_t0_o.hdl_path()     == "core_timers_gate_t0_o"; 
   keep p_core_timers_m1_t0_o.hdl_path()       == "core_timers_m1_t0_o"; 
   keep p_core_timers_m0_t0_o.hdl_path()       == "core_timers_m0_t0_o"; 
   keep p_core_timers_tr0_o.hdl_path()         == "core_timers_tr0_o"; 
   keep p_core_timeres_tf0_o.hdl_path()        == "core_timers_tf0_o"; 
   keep p_core_timers_th1_o.hdl_path()         == "core_timers_th1_o"; 
   keep p_core_timers_tm1_o.hdl_path()         == "core_timers_tm1_o"; 
   keep p_core_timers_tl1_o.hdl_path()         == "core_timers_tl1_o"; 
   keep p_core_timers_gate_t1_o.hdl_path()     == "core_timers_gate_t1_o"; 
   keep p_core_timers_m1_t1_o.hdl_path()       == "core_timers_m1_t1_o"; 
   keep p_core_timers_m0_t1_o.hdl_path()       == "core_timers_m0_t1_o"; 
   keep p_core_timers_int0_o.hdl_path()        == "core_timers_int0_o"; 
   keep p_core_timers_tr1_o.hdl_path()         == "core_timers_tr1_o"; 
   keep p_core_timeres_tf1_o.hdl_path()        == "core_timers_tf1_o"; 
   keep p_core_timers_int1_o.hdl_path()        == "core_timers_int1_o"; 
   keep p_core_timers_tacph_o.hdl_path()       == "core_timers_tacph_o"; 
   keep p_core_timers_tacpl_o.hdl_path()       == "core_timers_tacpl_o"; 
   keep p_core_timers_tr2_o.hdl_path()         == "core_timers_tr2_o"; 
   keep p_core_timeres_tf2_o.hdl_path()        == "core_timers_tf2_o"; 
   keep p_core_timers_dfsel_o.hdl_path()       == "core_timers_dfsel_o"; 
   keep p_core_timers_edgsel_o.hdl_path()      == "core_timers_edgsel_o"; 
   keep p_core_timers_dfp_o.hdl_path()         == "core_timers_dfp_o"; 
   
   keep p_core_interrupt_ip_o.hdl_path()       == "core_interrupt_ip_o"; 
   keep p_core_interrupt_ie_o.hdl_path()       == "core_interrupt_ie_o"; 
   keep p_core_interrupt_scon_o.hdl_path()     == "core_interrupt_scon_o"; 
   keep p_core_interrupt_tcon_o.hdl_path()     == "core_interrupt_tcon_o"; 
   keep p_core_interrupt_tcon2_o.hdl_path()    == "core_interrupt_tcon2_o"; 
   keep p_core_interrupt_na_o.hdl_path()       == "core_interrupt_na_o"; 
   keep p_core_interrupt_rdy_o.hdl_path()      == "core_interrupt_rdy_o"; 
   keep p_core_interrupt_intx_o.hdl_path()     == "core_interrupt_intx_o";
   
   keep p_core_ports_p4_o.hdl_path()           == "core_ports_p4_o"; 
   keep p_core_ports_p0en_o.hdl_path()         == "core_ports_p0en_o"; 
   keep p_core_ports_p1en_o.hdl_path()         == "core_ports_p1en_o"; 
   keep p_core_ports_p2en_o.hdl_path()         == "core_ports_p2en_o"; 
   keep p_core_ports_p3en_o.hdl_path()         == "core_ports_p3en_o"; 
   
   keep p_core_serial_sm0_o.hdl_path()         == "core_serial_sm0_o"; 
   keep p_core_serial_ren_o.hdl_path()         == "core_serial_ren_o"; 
   keep p_core_serial_p3_0_o.hdl_path()        == "core_serial_p3_0_o"; 
   keep p_core_serial_sbuf_tx_o.hdl_path()     == "core_serial_sbuf_tx_o"; 
   keep p_core_serial_tb8_o.hdl_path()         == "core_serial_tb8_o"; 
   keep p_core_serial_ti_o.hdl_path()          == "core_serial_ti_o"; 
   keep p_core_serial_ri_o.hdl_path()          == "core_serial_ri_o"; 
   keep p_core_serial_tx_o.hdl_path()          == "core_serial_tx_o"; 
   
   keep p_core_bus_ctrl_addr_o.hdl_path()           == "core_bus_ctrl_addr"; 
   keep p_core_bus_ctrl_data_o.hdl_path()           == "core_bus_ctrl_data_o"; 
   keep p_core_bus_ctrl_ext_rom_rd_b_o.hdl_path()   == "core_bus_ctrl_ext_rom_rd_b"; 
   keep p_core_bus_ctrl_ext_ram_rd_b_o.hdl_path()   == "core_bus_ctrl_ext_ram_rd_b"; 
   keep p_core_bus_ctrl_ext_ram_wr_b_o.hdl_path()   == "core_bus_ctrl_ext_ram_wr_b"; 
      
      
   };
  
   when CORE_TOP_OUT core_top_sig_u {
      // Path specification to the CORE_TOP IN signals INPUTS
      //////////////////// INPUT PORTS  ///////////////////////////////
   
      
   };
};

'>
