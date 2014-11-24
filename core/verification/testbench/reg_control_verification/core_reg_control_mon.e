<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_mon.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control, mon - monitor
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
// Include Files: core_reg_control_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_mon_h;

extend core_reg_control_mon_u {

   ///////////////// INPUTS ///////////////////////
   !p_reset:          inout simple_port of bit ;
   
   !p_fsm_wr_b_i:     inout simple_port of bit ;
   !p_fsm_rd_b_i:     inout simple_port of bit ;
   !p_fsm_byte_b_i:   inout simple_port of bit ;
   !p_fsm_addr_i:     inout simple_port of uint(bits:16) ; 
   !p_fsm_data_i:     inout simple_port of uint(bits:8) ; 
   !p_fsm_serial_tx_i:inout simple_port of bit ;
   
   !p_timers_th0_i:  inout simple_port of uint(bits:8) ; 
   !p_timers_tm0_i:  inout simple_port of uint(bits:8) ;
   !p_timers_tl0_i:  inout simple_port of uint(bits:8) ;
   !p_timers_tf0_i:  inout simple_port of bit ;
   !p_timers_th1_i:  inout simple_port of uint(bits:8) ;
   !p_timers_tm1_i:  inout simple_port of uint(bits:8) ;
   !p_timers_tl1_i:  inout simple_port of uint(bits:8) ;
   !p_timers_tf1_i:  inout simple_port of bit ;
   !p_timers_acrh_i: inout simple_port of uint(bits:8) ;
   !p_timers_acrm_i: inout simple_port of uint(bits:8) ;
   !p_timers_acrl_i: inout simple_port of uint(bits:8) ;
   !p_timers_tf2_i:  inout simple_port of bit ;
   
   !p_alu_cy_i: inout simple_port of bit ;
   !p_alu_ac_i: inout simple_port of bit ;
   !p_alu_ov_i: inout simple_port of bit ;
   
   !p_mem_ctrl_ext_mem_en_b_i: inout simple_port of bit ;
   
   !p_bus_control_p0en_i:   inout simple_port of uint(bits:8) ;
   !p_bus_control_p2en_i:   inout simple_port of uint(bits:8) ;
   !p_bus_control_p3en_6_i: inout simple_port of bit ;
   !p_bus_control_p3en_7_i: inout simple_port of bit ;
   !p_bus_control_p2_i:     inout simple_port of uint(bits:8) ;
   !p_bus_control_p3_6_i:   inout simple_port of bit ;
   !p_bus_control_p3_7_i:   inout simple_port of bit ;
   !p_bus_control_p4_i:     inout simple_port of uint(bits:8) ;
   
   !p_interrupt_ie0_i:   inout simple_port of bit ;  
   !p_interrupt_ie1_i:   inout simple_port of bit ;  
   !p_interrupt_ri_i:    inout simple_port of bit ;  
   !p_interrupt_ti_i:    inout simple_port of bit ;  
   !p_interrupt_tf0_i:   inout simple_port of bit ;   
   !p_interrupt_tf1_i:   inout simple_port of bit ;   
   !p_interrupt_tf2_i:   inout simple_port of bit ;   
   !p_interrupt_txrxf_i: inout simple_port of bit ;
   !p_interrupt_clear_i: inout simple_port of bit ;
   
   !p_serial_p3en_0_i:  inout simple_port of bit ;
   !p_serial_p3en_1_i:  inout simple_port of bit ;
   !p_serial_p3_0_i:    inout simple_port of bit ;
   !p_serial_p3_1_i:    inout simple_port of bit ;
   !p_serial_sbuf_rx_i: inout simple_port of uint(bits:8) ;
   !p_serial_rb8_i:     inout simple_port of bit ;
   !p_serial_ti_i:      inout simple_port of bit ;
   !p_serial_ri_i:      inout simple_port of bit ;
   
   ////////////////////// INOUT PORTS /////////////////////////////
   !p_ports_p0_io: inout simple_port of uint(bits:8) ;
   !p_ports_p1_io: inout simple_port of uint(bits:8) ;
   !p_ports_p2_io: inout simple_port of uint(bits:8) ;
   !p_ports_p3_io: inout simple_port of uint(bits:8) ;
   !p_bus_control_p0_io: inout simple_port of uint(bits:8) ; 
  
   ///////////////////// OUTPUTS  ////////////////////////////// /*
   !p_fsm_data_o: inout simple_port of uint(bits:8) ;
   
   !p_alu_cy_o: inout simple_port of bit ;
   !p_alu_ac_o: inout simple_port of bit ;
   !p_alu_ov_o: inout simple_port of bit ;
   
   !p_baudrate_sm0_o:  inout simple_port of bit ;
   !p_baudrate_sm1_o:  inout simple_port of bit ;
   !p_baudrate_sm2_o:  inout simple_port of bit ;
   !p_baudrate_smod_o: inout simple_port of bit ;
   !p_baudrate_bps_o:  inout simple_port of bit ;
   
   !p_timers_th0_o:     inout simple_port of uint(bits:8) ;
   !p_timers_tm0_o:     inout simple_port of uint(bits:8) ;
   !p_timers_tl0_o:     inout simple_port of uint(bits:8) ;
   !p_timers_gate_t0_o: inout simple_port of bit ;
   !p_timers_m1_t0_o:   inout simple_port of bit ;
   !p_timers_m0_t0_o:   inout simple_port of bit ;
   !p_timers_tr0_o:     inout simple_port of bit ; 
   !p_timers_th1_o:     inout simple_port of uint(bits:8) ;
   !p_timers_tm1_o:     inout simple_port of uint(bits:8) ;
   !p_timers_tl1_o:     inout simple_port of uint(bits:8) ;
   !p_timers_gate_t1_o: inout simple_port of bit ; 
   !p_timers_m1_t1_o:   inout simple_port of bit ; 
   !p_timers_m0_t1_o:   inout simple_port of bit ; 
   !p_timers_tr1_o:     inout simple_port of bit ; 
   !p_timers_tacph_o:   inout simple_port of uint(bits:2) ;
   !p_timers_tacpl_o:   inout simple_port of uint(bits:8) ;
   !p_timers_tr2_o:     inout simple_port of bit ; 
   !p_timers_dfsel_o:   inout simple_port of bit ; 
   !p_timers_edgsel_o:  inout simple_port of bit ; 
   !p_timers_dfp_o:     inout simple_port of uint(bits:3) ;
   !p_timers_int0_o:    inout simple_port of bit ; 
   !p_timers_int1_o:    inout simple_port of bit ; 
   
   
   !p_interrupt_ip_o:   inout simple_port of uint(bits:8) ;
   !p_interrupt_ie_o:   inout simple_port of uint(bits:8) ;
   !p_interrupt_int0_o: inout simple_port of bit ; 
   !p_interrupt_int1_o: inout simple_port of bit ; 
   !p_interrupt_ie0_o:  inout simple_port of bit ; 
   !p_interrupt_ie1_o:  inout simple_port of bit ; 
   !p_interrupt_ri_o:   inout simple_port of bit ; 
   !p_interrupt_ti_o:   inout simple_port of bit ; 
   !p_interrupt_tf0_o:  inout simple_port of bit ;
   !p_interrupt_tf1_o:  inout simple_port of bit ;
   !p_interrupt_tf2_o:  inout simple_port of bit ;
   !p_interrupt_txrxf_o:inout simple_port of bit ;
   
   !p_ports_p4_o:       inout simple_port of uint(bits:8) ;
   !p_ports_p0en_o:     inout simple_port of uint(bits:8) ;
   !p_ports_p1en_o:     inout simple_port of uint(bits:8) ;
   !p_ports_p2en_o:     inout simple_port of uint(bits:8) ;
   !p_ports_p3en_o:     inout simple_port of uint(bits:8) ;
   
   !p_serial_sm0_o:     inout simple_port of bit ;
   !p_serial_ren_o:     inout simple_port of bit ;
   !p_serial_p3_0_o:    inout simple_port of bit ;
   !p_serial_p3_1_o:    inout simple_port of bit ;
   !p_serial_sbuf_tx_o: inout simple_port of uint(bits:8) ;
   !p_serial_tb8_o:     inout simple_port of bit ;
   !p_serial_ti_o:      inout simple_port of bit ;
   !p_serial_ri_o:      inout simple_port of bit ; 
   
   
   
   ///////////////////////// EVENTS /////////////////////////
   // events to control the reset state
   event core_reg_control_reset_rise is rise(p_reset$)@sim;
   event core_reg_control_reset_fall is fall(p_reset$)@sim;

   
      
   when CORE_REG_CONTROL_IN core_reg_control_mon_u {
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
   
   when CORE_REG_CONTROL_OUT core_reg_control_mon_u {
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>