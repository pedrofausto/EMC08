<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_bfm_o.e
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
// Keywords: br - baud rate, bfm - bus functional mode
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
// Include Files: br_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr2_bfm_o_h;

extend tmr2_bfm_o_u {
   //------------------------------- Instance the ports used in bfm out
  
  //------------------------------- Signal to DUT
								
   !reset_p    		: inout simple_port of bit 			; 	// Reset
   !pht_i_p      		: inout simple_port of bit 			;  // Missing Tooth Sensor Input
   !tcon2_dfsel_i_p 	: inout simple_port of bit 			; 	// Digital Filter Sample Mode 
   !tcon2_edsel_i_p  : inout simple_port of bit 			;  // Edge Select Bit
//  !tcon2_tr2_i_p    : inout simple_port of bit 			;  // Run/Stop Select Bit 
	!tcon2_dfp_i_p    : inout simple_port of uint(bits:3) ; 	// Digital Filter Prescaler    
	!tacph_i_p       	: inout simple_port of uint(bits:2) ; 	// Max Angle Clock Period High
	!tacpl_i_p			: inout simple_port of uint(bits:8) ;	// Max Angle Clock Period Low

   
	//------------------------------- Signal from DUT
    
   !tcon2_tf2_o_p 		: inout simple_port of bit 			; 	// Timer 2 Flag Overflow
	!acrh_o_p				: inout simple_port of uint(bits:8) ;	// Angle Counter Register High
	!acrm_o_p				: inout simple_port of uint(bits:8) ;	// Angle Counter Register Medium
	!acrl_o_p				: inout simple_port of uint(bits:8) ; 	// Angle Counter Register Low
   
   
   //------------------------------- DUT Internal Connections
   
   
   
   !pdf_o_p          : inout simple_port of bit          ;  // PDF Output
   
   !prsc_o_p         : inout simple_port of bit          ;  // Prescaler Output
   
   !acr_inc_reg_p    : inout simple_port of bit          ;  // ACR Increment Flag   
	
  
   drive_bus() @clock_e is only {
	
   //   while TRUE {
         // if wanted, see some output
  //    };
  
  	out ("TEST BFM OUT ...\n");
		
   };
};

'>
