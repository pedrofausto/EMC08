<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_mon.e
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
// Keywords: core_top - core top module, mon - monitor
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to aply to
// the DUT
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
// Include Files: core_top_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_mon_h;

extend core_top_mon_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   !p_core_reset_i: inout simple_port of bit ;
   !p_core_fsm_opcode: inout simple_port of uint(bits:8);
   !p_core_pc: inout simple_port of uint(bits:16);
   
   !p_core_timers_th0_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tm0_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tl0_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tf0_i: inout simple_port of bit ;
   !p_core_timers_th1_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tm1_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tl1_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tf1_i: inout simple_port of bit ;
   !p_core_timers_acrh_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_acrm_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_acrl_i: inout simple_port of uint(bits:8) ;
   
//   !core_timers_tacph_i: inout simple_port of uint(bits:2) ;
//   !core_timers_tacpl_i: inout simple_port of uint(bits:8) ;
   
   !p_core_timers_tf2_i: inout simple_port of bit ;
   
   !p_core_bus_ctrl_p0en_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p2en_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p3en_6_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p3en_7_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p2_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p3_6_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p3_7_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p4_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_ea_b_i: inout simple_port of bit ;
   !p_core_bus_ctrl_data_i: inout simple_port of uint(bits:8) ;
   
   !p_core_interrupt_clear_i: inout simple_port of bit ;
   !p_core_interrupt_tcon2_i: inout simple_port of uint(bits:2) ;
   !p_core_interrupt_tcon_i: inout simple_port of uint(bits:4) ;
   !p_core_interrupt_vect_i: inout simple_port of uint (bits:3) ;
   
   !p_core_serial_p3en_0_i: inout simple_port of bit ;
   !p_core_serial_p3en_1_i: inout simple_port of bit ;
   !p_core_serial_p3_0_i: inout simple_port of bit ;
   !p_core_serial_p3_1_i: inout simple_port of bit ;
   !p_core_serial_sbuf_rx_i: inout simple_port of uint(bits:8) ;
   !p_core_serial_rb8_i: inout simple_port of bit ;
   !p_core_serial_ti_i: inout simple_port of bit ;
   !p_core_serial_ri_i: inout simple_port of bit ;
   
   ///////////// INOUT /////////////////////////////
   !p_core_ports_p0_i: inout simple_port of uint(bits:8) ;
   !p_core_ports_p1_i: inout simple_port of uint(bits:8) ;
   !p_core_ports_p2_i: inout simple_port of uint(bits:8) ;
   !p_core_ports_p3_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p0_i: inout simple_port of uint(bits:8) ;
   
   !p_core_ports_p0_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p1_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p2_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p3_o: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p0_o: inout simple_port of uint(bits:8) ;
   
   ////////////// OUTPUTS /////////
   !p_core_baudrate_sm0_o: inout simple_port of bit ;
   !p_core_baudrate_sm1_o: inout simple_port of bit ;
   !p_core_baudrate_sm2_o: inout simple_port of bit ;
   !p_core_baudrate_smod_o: inout simple_port of bit ;
   !p_core_baudrate_rs232_o: inout simple_port of bit ;
   !p_core_reset_o: inout simple_port of bit ;
   
   !p_core_timers_th0_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_tm0_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_tl0_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_gate_t0_o: inout simple_port of bit ;
   !p_core_timers_m1_t0_o: inout simple_port of bit ;
   !p_core_timers_m0_t0_o: inout simple_port of bit ;
   !p_core_timers_tr0_o: inout simple_port of bit ;
   !p_core_timeres_tf0_o: inout simple_port of bit ;
   !p_core_timers_th1_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_tm1_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_tl1_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_gate_t1_o: inout simple_port of bit ;
   !p_core_timers_m1_t1_o: inout simple_port of bit ;
   !p_core_timers_m0_t1_o: inout simple_port of bit ;
   !p_core_timers_int0_o: inout simple_port of bit ;
   !p_core_timers_tr1_o: inout simple_port of bit ;
   !p_core_timeres_tf1_o: inout simple_port of bit ;
   !p_core_timers_int1_o: inout simple_port of bit ;
   !p_core_timers_tacph_o: inout simple_port of uint(bits:2) ;
   !p_core_timers_tacpl_o: inout simple_port of uint(bits:8) ;
   !p_core_timers_tr2_o: inout simple_port of bit ;
   !p_core_timeres_tf2_o: inout simple_port of bit ;
   !p_core_timers_dfsel_o: inout simple_port of bit ;
   !p_core_timers_edgsel_o: inout simple_port of bit ;
   !p_core_timers_dfp_o: inout simple_port of uint(bits:3) ;
   
   !p_core_interrupt_ip_o: inout simple_port of uint(bits:7) ;
   !p_core_interrupt_ie_o: inout simple_port of uint(bits:8) ;
   !p_core_interrupt_scon_o: inout simple_port of uint(bits:2) ;
   !p_core_interrupt_tcon_o: inout simple_port of uint(bits:6) ;
   !p_core_interrupt_tcon2_o: inout simple_port of uint(bits:2) ;
   !p_core_interrupt_na_o: inout simple_port of bit ;
   !p_core_interrupt_rdy_o: inout simple_port of bit ;
   !p_core_interrupt_intx_o: inout simple_port of uint(bits: 2) ;
   
   !p_core_ports_p4_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p0en_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p1en_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p2en_o: inout simple_port of uint(bits:8) ;
   !p_core_ports_p3en_o: inout simple_port of uint(bits:8) ;
   
   !p_core_serial_sm0_o: inout simple_port of bit ;
   !p_core_serial_ren_o: inout simple_port of bit ;
   !p_core_serial_p3_0_o: inout simple_port of bit ;
   !p_core_serial_sbuf_tx_o: inout simple_port of uint(bits:8) ;
   !p_core_serial_tb8_o: inout simple_port of bit ;
   !p_core_serial_ti_o: inout simple_port of bit ;
   !p_core_serial_ri_o: inout simple_port of bit ;
   !p_core_serial_tx_o: inout simple_port of bit ;
   
   !p_core_bus_ctrl_addr_o: inout simple_port of uint(bits:16) ;
   !p_core_bus_ctrl_data_o: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_ext_rom_rd_b_o: inout simple_port of bit ;
   !p_core_bus_ctrl_ext_ram_rd_b_o: inout simple_port of bit ;
   !p_core_bus_ctrl_ext_ram_wr_b_o: inout simple_port of bit ;
   
   
   
      
   when CORE_TOP_IN core_top_mon_u {
      //////////////////////// TCM METHODS /////////////////////
      watch_bus() @clock_e is also {
         while TRUE {   
            // calls the reference model to check the DUT
            reference_model();
          
            // the monitor detected a packet
            emit pkt_detected_e;
          }; 
       };
   };
   
   //when CORE_TOP_OUT core_top_mon_u {
   //};
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>