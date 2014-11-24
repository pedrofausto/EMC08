<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_agent.e
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
// Keywords: core_top - core top module, sig - signal map, mon - monitor
// -----------------------------------------------------------------------------
// Purpose: Class that connect the monitor at signal map, and BFM`s signals
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: connect_pointers()
// Include Files: core_top_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_agent_h;

extend core_top_agent_u {
   connect_pointers() is also {    
  
   mon.p_core_reset_i                      = sig.p_core_reset_i;
   mon.p_core_fsm_opcode                   = sig.p_core_fsm_opcode; 
   mon.p_core_pc                           = sig.p_core_pc;                               
   
   mon.p_core_timers_th0_i                 = sig.p_core_timers_th0_i;
   mon.p_core_timers_tm0_i                 = sig.p_core_timers_tm0_i;
   mon.p_core_timers_tl0_i                 = sig.p_core_timers_tl0_i;
   mon.p_core_timers_tf0_i                 = sig.p_core_timers_tf0_i ;
   mon.p_core_timers_th1_i                 = sig.p_core_timers_th1_i;
   mon.p_core_timers_tm1_i                 = sig.p_core_timers_tm1_i; 
   mon.p_core_timers_tl1_i                 = sig.p_core_timers_tl1_i; 
   mon.p_core_timers_tf1_i                 = sig.p_core_timers_tf1_i;  
   mon.p_core_timers_acrh_i                = sig.p_core_timers_acrh_i;
   mon.p_core_timers_acrm_i                = sig.p_core_timers_acrm_i;  
   mon.p_core_timers_acrl_i                = sig.p_core_timers_acrl_i;  
   
//   mon.core_timers_tacph_i                = sig.core_timers_tacph_i;  
//   mon.core_timers_tacpl_i                = sig.core_timers_tacpl_i;     
   mon.p_core_timers_tf2_i                 = sig.p_core_timers_tf2_i;  
   
   mon.p_core_bus_ctrl_p0en_i              = sig.p_core_bus_ctrl_p0en_i;  
   mon.p_core_bus_ctrl_p2en_i              = sig.p_core_bus_ctrl_p2en_i;  
   mon.p_core_bus_ctrl_p3en_6_i            = sig.p_core_bus_ctrl_p3en_6_i;  
   mon.p_core_bus_ctrl_p3en_7_i            = sig.p_core_bus_ctrl_p3en_7_i;  
   mon.p_core_bus_ctrl_p2_i                = sig.p_core_bus_ctrl_p2_i;  
   mon.p_core_bus_ctrl_p3_6_i              = sig.p_core_bus_ctrl_p3_6_i;  
   mon.p_core_bus_ctrl_p3_7_i              = sig.p_core_bus_ctrl_p3_7_i;  
   mon.p_core_bus_ctrl_p4_i                = sig.p_core_bus_ctrl_p4_i;  
   mon.p_core_bus_ctrl_ea_b_i              = sig.p_core_bus_ctrl_ea_b_i;  
   mon.p_core_bus_ctrl_data_i              = sig.p_core_bus_ctrl_data_i;  
   
   mon.p_core_interrupt_clear_i            = sig.p_core_interrupt_clear_i;  
   mon.p_core_interrupt_tcon2_i            = sig.p_core_interrupt_tcon2_i; 
   mon.p_core_interrupt_tcon_i             = sig.p_core_interrupt_tcon_i; 
   mon.p_core_interrupt_vect_i             = sig.p_core_interrupt_vect_i; 
   
   mon.p_core_serial_p3en_0_i              = sig.p_core_serial_p3en_0_i;  
   mon.p_core_serial_p3en_1_i              = sig.p_core_serial_p3en_1_i;  
   mon.p_core_serial_p3_0_i                = sig.p_core_serial_p3_0_i;  
   mon.p_core_serial_p3_1_i                = sig.p_core_serial_p3_1_i;  
   mon.p_core_serial_sbuf_rx_i             = sig.p_core_serial_sbuf_rx_i;  
   mon.p_core_serial_rb8_i                 = sig.p_core_serial_rb8_i;  
   mon.p_core_serial_ti_i                  = sig.p_core_serial_ti_i;  
   mon.p_core_serial_ri_i                  = sig.p_core_serial_ri_i;  
   
   ///////////// INOUT /////////////////////////////
   mon.p_core_ports_p0_i                  = sig.p_core_ports_p0_i;  
   mon.p_core_ports_p1_i                  = sig.p_core_ports_p1_i;  
   mon.p_core_ports_p2_i                  = sig.p_core_ports_p2_i;  
   mon.p_core_ports_p3_i                  = sig.p_core_ports_p3_i;  
   mon.p_core_bus_ctrl_p0_i               = sig.p_core_bus_ctrl_p0_i;    
   
   mon.p_core_ports_p0_o                  = sig.p_core_ports_p0_o;  
   mon.p_core_ports_p1_o                  = sig.p_core_ports_p1_o;  
   mon.p_core_ports_p2_o                  = sig.p_core_ports_p2_o;  
   mon.p_core_ports_p3_o                  = sig.p_core_ports_p3_o;  
   mon.p_core_bus_ctrl_p0_o               = sig.p_core_bus_ctrl_p0_o; 
   
   ////////////// OUTPUTS /////////
   mon.p_core_baudrate_sm0_o               = sig.p_core_baudrate_sm0_o;  
   mon.p_core_baudrate_sm1_o               = sig.p_core_baudrate_sm1_o;  
   mon.p_core_baudrate_sm2_o               = sig.p_core_baudrate_sm2_o;  
   mon.p_core_baudrate_smod_o              = sig.p_core_baudrate_smod_o;  
   mon.p_core_baudrate_rs232_o             = sig.p_core_baudrate_rs232_o;  
   mon.p_core_reset_o                      = sig.p_core_reset_o;  
   
   mon.p_core_timers_th0_o                 = sig.p_core_timers_th0_o;  
   mon.p_core_timers_tm0_o                 = sig.p_core_timers_tm0_o;  
   mon.p_core_timers_tl0_o                 = sig.p_core_timers_tl0_o;  
   mon.p_core_timers_gate_t0_o             = sig.p_core_timers_gate_t0_o;  
   mon.p_core_timers_m1_t0_o               = sig.p_core_timers_m1_t0_o;  
   mon.p_core_timers_m0_t0_o               = sig.p_core_timers_m0_t0_o;  
   mon.p_core_timers_tr0_o                 = sig.p_core_timers_tr0_o;  
   mon.p_core_timeres_tf0_o                = sig.p_core_timeres_tf0_o;  
   mon.p_core_timers_th1_o                 = sig.p_core_timers_th1_o;  
   mon.p_core_timers_tm1_o                 = sig.p_core_timers_tm1_o;  
   mon.p_core_timers_tl1_o                 = sig.p_core_timers_tl1_o;  
   mon.p_core_timers_gate_t1_o             = sig.p_core_timers_gate_t1_o;  
   mon.p_core_timers_m1_t1_o               = sig.p_core_timers_m1_t1_o;  
   mon.p_core_timers_m0_t1_o               = sig.p_core_timers_m0_t1_o;  
   mon.p_core_timers_int0_o                = sig.p_core_timers_int0_o;  
   mon.p_core_timers_tr1_o                 = sig.p_core_timers_tr1_o;  
   mon.p_core_timeres_tf1_o                = sig.p_core_timeres_tf1_o;  
   mon.p_core_timers_int1_o                = sig.p_core_timers_int1_o;  
   mon.p_core_timers_tacph_o               = sig.p_core_timers_tacph_o; 
   mon.p_core_timers_tacpl_o               = sig.p_core_timers_tacpl_o;  
   mon.p_core_timers_tr2_o                 = sig.p_core_timers_tr2_o;  
   mon.p_core_timeres_tf2_o                = sig.p_core_timeres_tf2_o;  
   mon.p_core_timers_dfsel_o               = sig.p_core_timers_dfsel_o;  
   mon.p_core_timers_edgsel_o              = sig.p_core_timers_edgsel_o;  
   mon.p_core_timers_dfp_o                 = sig.p_core_timers_dfp_o; 
   
   mon.p_core_interrupt_ip_o               = sig.p_core_interrupt_ip_o; 
   mon.p_core_interrupt_ie_o               = sig.p_core_interrupt_ie_o;  
   mon.p_core_interrupt_scon_o             = sig.p_core_interrupt_scon_o; 
   mon.p_core_interrupt_tcon_o             = sig.p_core_interrupt_tcon_o; 
   mon.p_core_interrupt_tcon2_o            = sig.p_core_interrupt_tcon2_o;
   mon.p_core_interrupt_na_o               = sig.p_core_interrupt_na_o;  
   mon.p_core_interrupt_rdy_o              = sig.p_core_interrupt_rdy_o;  
   mon.p_core_interrupt_intx_o             = sig.p_core_interrupt_intx_o; 
   
   mon.p_core_ports_p4_o                   = sig.p_core_ports_p4_o;  
   mon.p_core_ports_p0en_o                 = sig.p_core_ports_p0en_o;  
   mon.p_core_ports_p1en_o                 = sig.p_core_ports_p1en_o;  
   mon.p_core_ports_p2en_o                 = sig.p_core_ports_p2en_o;  
   mon.p_core_ports_p3en_o                 = sig.p_core_ports_p3en_o;  
      
   mon.p_core_serial_sm0_o                 = sig.p_core_serial_sm0_o;  
   mon.p_core_serial_ren_o                 = sig.p_core_serial_ren_o;  
   mon.p_core_serial_p3_0_o                = sig.p_core_serial_p3_0_o;  
   mon.p_core_serial_sbuf_tx_o             = sig.p_core_serial_sbuf_tx_o;  
   mon.p_core_serial_tb8_o                 = sig.p_core_serial_tb8_o;  
   mon.p_core_serial_ti_o                  = sig.p_core_serial_ti_o;  
   mon.p_core_serial_ri_o                  = sig.p_core_serial_ri_o;  
   mon.p_core_serial_tx_o                  = sig.p_core_serial_tx_o;  
   
   mon.p_core_bus_ctrl_addr_o              = sig.p_core_bus_ctrl_addr_o; 
   mon.p_core_bus_ctrl_data_o              = sig.p_core_bus_ctrl_data_o;  
   mon.p_core_bus_ctrl_ext_rom_rd_b_o      = sig.p_core_bus_ctrl_ext_rom_rd_b_o;  
   mon.p_core_bus_ctrl_ext_ram_rd_b_o      = sig.p_core_bus_ctrl_ext_ram_rd_b_o;  
   mon.p_core_bus_ctrl_ext_ram_wr_b_o      = sig.p_core_bus_ctrl_ext_ram_wr_b_o;  
 
   };

   // when CORE_FSM_IN than map the signal between signal map and monitor
   when ACTIVE CORE_TOP_IN core_top_agent_u {
      connect_pointers() is also {    
      
         bfm.p_core_reset_i                      = sig.p_core_reset_i;
         bfm.p_core_fsm_opcode                   = sig.p_core_fsm_opcode;
         bfm.p_core_pc                           = sig.p_core_pc;   
         
         bfm.p_core_timers_th0_i                 = sig.p_core_timers_th0_i;
         bfm.p_core_timers_tm0_i                 = sig.p_core_timers_tm0_i;
         bfm.p_core_timers_tl0_i                 = sig.p_core_timers_tl0_i;
         bfm.p_core_timers_tf0_i                 = sig.p_core_timers_tf0_i ;
         bfm.p_core_timers_th1_i                 = sig.p_core_timers_th1_i;
         bfm.p_core_timers_tm1_i                 = sig.p_core_timers_tm1_i; 
         bfm.p_core_timers_tl1_i                 = sig.p_core_timers_tl1_i; 
         bfm.p_core_timers_tf1_i                 = sig.p_core_timers_tf1_i;  
         bfm.p_core_timers_acrh_i                = sig.p_core_timers_acrh_i;
         bfm.p_core_timers_acrm_i                = sig.p_core_timers_acrm_i;  
         bfm.p_core_timers_acrl_i                = sig.p_core_timers_acrl_i;     
         
//         bfm.core_timers_tacph_i                 = sig.core_timers_tacph_i;  
//         bfm.core_timers_tacpl_i                 = sig.core_timers_tacpl_i;  
         bfm.p_core_timers_tf2_i                 = sig.p_core_timers_tf2_i;  
         
         bfm.p_core_bus_ctrl_p0en_i              = sig.p_core_bus_ctrl_p0en_i;  
         bfm.p_core_bus_ctrl_p2en_i              = sig.p_core_bus_ctrl_p2en_i;  
         bfm.p_core_bus_ctrl_p3en_6_i            = sig.p_core_bus_ctrl_p3en_6_i;  
         bfm.p_core_bus_ctrl_p3en_7_i            = sig.p_core_bus_ctrl_p3en_7_i;  
         bfm.p_core_bus_ctrl_p2_i                = sig.p_core_bus_ctrl_p2_i;  
         bfm.p_core_bus_ctrl_p3_6_i              = sig.p_core_bus_ctrl_p3_6_i;  
         bfm.p_core_bus_ctrl_p3_7_i              = sig.p_core_bus_ctrl_p3_7_i;  
         bfm.p_core_bus_ctrl_p4_i                = sig.p_core_bus_ctrl_p4_i;  
         bfm.p_core_bus_ctrl_ea_b_i              = sig.p_core_bus_ctrl_ea_b_i;  
         bfm.p_core_bus_ctrl_data_i              = sig.p_core_bus_ctrl_data_i;  
         
         bfm.p_core_interrupt_clear_i            = sig.p_core_interrupt_clear_i;  
         bfm.p_core_interrupt_tcon2_i            = sig.p_core_interrupt_tcon2_i; 
         bfm.p_core_interrupt_tcon_i             = sig.p_core_interrupt_tcon_i; 
         bfm.p_core_interrupt_vect_i             = sig.p_core_interrupt_vect_i; 
         
         bfm.p_core_serial_p3en_0_i              = sig.p_core_serial_p3en_0_i;  
         bfm.p_core_serial_p3en_1_i              = sig.p_core_serial_p3en_1_i;  
         bfm.p_core_serial_p3_0_i                = sig.p_core_serial_p3_0_i;  
         bfm.p_core_serial_p3_1_i                = sig.p_core_serial_p3_1_i;  
         bfm.p_core_serial_sbuf_rx_i             = sig.p_core_serial_sbuf_rx_i;  
         bfm.p_core_serial_rb8_i                 = sig.p_core_serial_rb8_i;  
         bfm.p_core_serial_ti_i                  = sig.p_core_serial_ti_i;  
         bfm.p_core_serial_ri_i                  = sig.p_core_serial_ri_i;  
         
         ///////////// INOUT /////////////////////////////
         bfm.p_core_ports_p0_i                  = sig.p_core_ports_p0_i;  
         bfm.p_core_ports_p1_i                  = sig.p_core_ports_p1_i;  
         bfm.p_core_ports_p2_i                  = sig.p_core_ports_p2_i;  
         bfm.p_core_ports_p3_i                  = sig.p_core_ports_p3_i;  
         bfm.p_core_bus_ctrl_p0_i               = sig.p_core_bus_ctrl_p0_i;   
         
         ////////////// OUTPUTS /////////
         //bfm.p_core_baudrate_sm0_o               = sig.p_core_baudrate_sm0_o;  
         //bfm.p_core_baudrate_sm1_o               = sig.p_core_baudrate_sm1_o;  
         //bfm.p_core_baudrate_sm2_o               = sig.p_core_baudrate_sm2_o;  
         //bfm.p_core_baudrate_smod_o              = sig.p_core_baudrate_smod_o;  
         //bfm.p_core_baudrate_rs232_o             = sig.p_core_baudrate_rs232_o;  
         //bfm.p_core_reset_o          = sig.p_core_reset_o;  
         
         //bfm.p_core_timers_th0_o                 = sig.p_core_timers_th0_o;  
         //bfm.p_core_timers_tm0_o                 = sig.p_core_timers_tm0_o;  
         //bfm.p_core_timers_tl0_o                 = sig.p_core_timers_tl0_o;  
         //bfm.p_core_timers_gate_t0_o             = sig.p_core_timers_gate_t0_o;  
         //bfm.p_core_timers_m1_t0_o               = sig.p_core_timers_m1_t0_o;  
         //bfm.p_core_timers_m0_t0_o               = sig.p_core_timers_m0_t0_o;  
         //bfm.p_core_timers_tr0_o                 = sig.p_core_timers_tr0_o;  
         //bfm.p_core_timeres_tf0_i                = sig.p_core_timeres_tf0_i;  
         //bfm.p_core_timers_th1_o                 = sig.p_core_timers_th1_o;  
         //bfm.p_core_timers_tm1_o                 = sig.p_core_timers_tm1_o;  
         //bfm.p_core_timers_tl1_o                 = sig.p_core_timers_tl1_o;  
         //bfm.p_core_timers_gate_t1_o             = sig.p_core_timers_gate_t1_o;  
         //bfm.p_core_timers_m1_t1_o               = sig.p_core_timers_m1_t1_o;  
         //bfm.p_core_timers_m0_t1_o               = sig.p_core_timers_m0_t1_o;  
         //bfm.p_core_timers_int0_o                = sig.p_core_timers_int0_o;  
         //bfm.p_core_timers_tr1_o                 = sig.p_core_timers_tr1_o;  
         //bfm.p_core_timeres_tf1_i                = sig.p_core_timeres_tf1_i;  
         //bfm.p_core_timers_int1_o                = sig.p_core_timers_int1_o;  
         //bfm.p_core_timers_tacph_o               = sig.p_core_timers_tacph_o; 
         //bfm.p_core_timers_tacpl_o               = sig.p_core_timers_tacpl_o;  
         //bfm.p_core_timers_tr2_o                 = sig.p_core_timers_tr2_o;  
         //bfm.p_core_timeres_tf2_i                = sig.p_core_timeres_tf2_i;  
         //bfm.p_core_timers_dfsel_o               = sig.p_core_timers_dfsel_o;  
         //bfm.p_core_timers_edgsel_o              = sig.p_core_timers_edgsel_o;  
         //bfm.p_core_timers_dfp_o                 = sig.p_core_timers_dfp_o; 
         
         //bfm.p_core_interrupt_ip_o               = sig.p_core_interrupt_ip_o; 
         //bfm.p_core_interrupt_ie_o               = sig.p_core_interrupt_ie_o;  
         //bfm.p_core_interrupt_scon_o             = sig.p_core_interrupt_scon_o; 
         //bfm.p_core_interrupt_tcon_o             = sig.p_core_interrupt_tcon_o; 
         //bfm.p_core_interrupt_tcon2_i            = sig.p_core_interrupt_tcon2_i;
         //bfm.p_core_interrupt_na_o               = sig.p_core_interrupt_na_o;  
         //bfm.p_core_interrupt_rdy_o              = sig.p_core_interrupt_rdy_o;  
         //bfm.p_core_interrupt_intx_o             = sig.p_core_interrupt_intx_o; 
         
         //bfm.p_core_ports_p4_o                   = sig.p_core_ports_p4_o;  
         //bfm.p_core_ports_p0en_o                 = sig.p_core_ports_p0en_o;  
         //bfm.p_core_ports_p1en_o                 = sig.p_core_ports_p1en_o;  
         //bfm.p_core_ports_p2en_o                 = sig.p_core_ports_p2en_o;  
         //bfm.p_core_ports_p3en_o                 = sig.p_core_ports_p3en_o;  
            
         //bfm.p_core_serial_sm0_o                 = sig.p_core_serial_sm0_o;  
         //bfm.p_core_serial_ren_o                 = sig.p_core_serial_ren_o;  
         //bfm.p_core_serial_p3_0_o                = sig.p_core_serial_p3_0_o;  
         //bfm.p_core_serial_sbuf_tx_o             = sig.p_core_serial_sbuf_tx_o;  
         //bfm.p_core_serial_tb8_o                 = sig.p_core_serial_tb8_o;  
         //bfm.p_core_serial_ti_o                  = sig.p_core_serial_ti_o;  
         //bfm.p_core_serial_ri_o                  = sig.p_core_serial_ri_o;  
         //bfm.p_core_serial_tx_o                  = sig.p_core_serial_tx_o;  
         
         //bfm.p_core_bus_ctrl_addr_o              = sig.p_core_bus_ctrl_addr_o; 
         //bfm.p_core_bus_ctrl_data_o              = sig.p_core_bus_ctrl_data_o;  
         //bfm.p_core_bus_ctrl_ext_rom_rd_b_o      = sig.p_core_bus_ctrl_ext_rom_rd_b_o;  
         //bfm.p_core_bus_ctrl_ext_ram_rd_b_o      = sig.p_core_bus_ctrl_ext_ram_rd_b_o;  
         //bfm.p_core_bus_ctrl_ext_ram_wr_b_o      = sig.p_core_bus_ctrl_ext_ram_wr_b_o;
      
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   //when ACTIVE CORE_TOP_OUT core_top_agent_u {
   //   connect_pointers() is also {
    
   //   };
   //};
};

'>
