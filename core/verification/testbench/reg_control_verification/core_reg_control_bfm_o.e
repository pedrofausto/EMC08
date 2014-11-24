<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_bfm_o.e
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
// Keywords: core_reg_control - core register control module, bfm - bus 
// functional mode
// -----------------------------------------------------------------------------
// Purpose: Receive the DUT output packet of signal
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus()
// Include Files: core_reg_control_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_bfm_o_h;

extend core_reg_control_bfm_o_u {
   
   ///////////////////// INOUT PORTS /////////////////////////////
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
   
      
   drive_bus() @clock_e is only {
      
   };
};

'>
