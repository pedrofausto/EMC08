<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_mon.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt, mon - monitor
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
// Include Files: int_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_mon_h;

extend int_mon_u {
   // instance the ports used in monitor

   !RESET_i_p     : inout simple_port of bit         ;
   !INT_EXT_p     : inout simple_port of uint(bits:2);
   !INT_RDY_p     : inout simple_port of bit         ;
   !INT_NA_i_p    : inout simple_port of bit         ;
   !INT_CM_i_p    : inout simple_port of bit         ;
   !REG_IE_i_p    : inout simple_port of uint(bits:8);
   !REG_IP_i_p    : inout simple_port of uint(bits:7);
   !REG_SCON_i_p  : inout simple_port of uint(bits:2);
   !REG_TCON_i_p  : inout simple_port of uint(bits:6);
   !REG_TCON2_i_p : inout simple_port of uint(bits:2);
   !INT_VECT_o_p  : inout simple_port of uint(bits:3);
   !REG_TCON_o_p  : inout simple_port of uint(bits:4);
   !REG_TCON2_o_p : inout simple_port of uint(bits:2);
   !REG_CLR_o_p   : inout simple_port of bit         ;
   
   !FLAG_IE0_p    : inout simple_port of bit          ;
   !FLAG_TF0_p    : inout simple_port of bit          ;
   !FLAG_IE1_p    : inout simple_port of bit          ;
   !FLAG_TF1_p    : inout simple_port of bit          ;
   !FLAG_TF2_p    : inout simple_port of bit          ;
   !FLAG_RI_TI_p  : inout simple_port of uint(bits:2) ;
   !FLAG_TXRX_p   : inout simple_port of bit          ;
     
   // events to control the reset state

  
      
   when INT_IN int_mon_u {
      // event hit_rise is rise(reset_p$)@sim;
      
      watch_bus() @clock_e is also {
         while TRUE {   
            // calls the functional model to check the DUT
            functional_model();
               
            // the monitor detected a packet
            emit pkt_detected_e;
         }; 
      };
   };
   
   when INT_OUT int_mon_u {
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      //message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>