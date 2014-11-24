<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_bfm_i.e
// Module Name : Core fsm
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control module, bfm - bus functional 
// mode
// -----------------------------------------------------------------------------
// Purpose: This unit will drive the interface signals of the router DUT. 
// It will get an instance of a packet it is to drive from the sequence driver
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus(), send_pkt()
// Include Files: core_reg_control_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_bfm_i_h;

extend core_reg_control_bfm_i_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   
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
   
         
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: core_reg_control_signal_type;

      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
  
   // function to send signal packets to the DUT
   send_pkt(in_pkt: core_reg_control_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences
      if (in_pkt.pkt_kind == RESET) {
         out("in reset");
         p_reset$    = 0;
         wait [1] * cycle;
         p_reset$    = 1;
                  
         out("out reset");
      } else {
         wait [1];
         p_reset$        = in_pkt.reset;
         
          
         wait [20] * cycle;
      };
      
      wait cycle;
   };
};

'>
