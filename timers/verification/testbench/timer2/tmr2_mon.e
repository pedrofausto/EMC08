<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_mon.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 06/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      06-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, mon - monitor
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
// Include Files: br_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr2_mon_h;

extend tmr2_mon_u {

   //------------------------------- Instance the ports used in monitor
  
  //------------------------------- Signal to DUT
								
   !reset_p    		: inout simple_port of bit 				; 	// Reset
   !pht_i_p      		: inout simple_port of bit 				;  // Missing Tooth Sensor Input
   !tcon2_dfp_i_p    : inout simple_port of uint(bits:3) 	; 	// Digital Filter Prescaler    
   !tcon2_dfsel_i_p 	: inout simple_port of bit 				; 	// Digital Filter Sample Mode 
   !tcon2_edsel_i_p  : inout simple_port of bit 				;  // Edge Select Bit
   //  !tcon2_tr2_i_p    : inout simple_port of bit 			;  // Run/Stop Select Bit 
	!tacph_i_p       	: inout simple_port of uint(bits:2) 	; 	// Max Angle Clock Period High
	!tacpl_i_p			: inout simple_port of uint(bits:8) 	;	// Max Angle Clock Period Low

   
	//------------------------------- Signal from DUT
    
   !tcon2_tf2_o_p 		: inout simple_port of bit 				; 	// Timer 2 Flag Overflow
	!acrh_o_p				: inout simple_port of uint(bits:8) 	;	// Angle Counter Register High
	!acrm_o_p				: inout simple_port of uint(bits:8) 	;	// Angle Counter Register Medium
	!acrl_o_p				: inout simple_port of uint(bits:8) 	; 	// Angle Counter Register Low

   
	//------------------------------- DUT Internal Connections
   
      
   !pdf_o_p          : inout simple_port of bit          ;  // PDF Output   
   !prsc_o_p         : inout simple_port of bit          ;  // Prescaler Output
   !acr_inc_reg_p    : inout simple_port of bit          ;  // ACR Increment Flag
	
	
   //------------------------------- Events to Control The Reset State
	
   event reset_rise is rise(reset_p$)@sim;
	
   event reset_fall is fall(reset_p$)@sim;
   
   
   //------------------------------- Events From MTS Sensor Input
   
      
   event pht_rise is rise(pht_i_p$)@sim;
   
   event pht_fall is fall(pht_i_p$)@sim;
   
//   event reset_rise_pht_rise is (rise(reset_p$)@sim and rise(pht_i_p$)@sim);
   
//	event clk_rise  is @clock_e;

 
      
   when TMR2_IN tmr2_mon_u {
   
   watch_bus() @clock_e is also {
      while (TRUE) {   
        // calls the reference model to check the DUT
           reference_model();
         
           out("MONITOR ");
          
        // the monitor detected a packet
        emit pkt_detected_e;
     };
      
   };
      // event hit_rise is rise(reset_p$)@sim;
   };
   
   when TMR2_OUT tmr2_mon_u {
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>