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

import tmr0_bfm_o_h;

extend tmr0_bfm_o_u {
   //------------------------------- Instance the ports used in bfm out
  
	//------------------------------- Signal to DUT
								
   !reset_p    		: inout simple_port of bit ; 				// Reset
   !int0_p      		: inout simple_port of bit ;  			// External Input 0
   !tmod_gate_t0_p   : inout simple_port of bit ; 				// Source Select bit  
   !tmod_m0t0_p 		: inout simple_port of bit ; 				// UP/DOWN Counter Select bit 
   !tmod_m1t0_p    	: inout simple_port of bit ;  
	!tcon_tr0_p       : inout simple_port of bit ; 				// START/STOP Counter Select bit
	!tl0_i_p				: inout simple_port of uint(bits:8) ;	// TL0 Input Register
	!tm0_i_p				: inout simple_port of uint(bits:8) ;	// TM0 Input Register
	!th0_i_p				: inout simple_port of uint(bits:8) ;	// TH0 Input Register
   !tcon_tf0_i_p 		: inout simple_port of bit ; 				// Timer
	
	//------------------------------- Signal from DUT
    
   !tcon_tf0_o_p 		: inout simple_port of bit ; 				// Timer Overflow Flag
	!tl0_o_p				: inout simple_port of uint(bits:8) ;	// TH0 Output Register
	!tm0_o_p				: inout simple_port of uint(bits:8) ;	// TH0 Output Register
	!th0_o_p				: inout simple_port of uint(bits:8) ; 	// TH0 Output Register
  
   drive_bus() @clock_e is only {
	
   //   while TRUE {
         // if wanted, see some output
  //    };
  
  	out ("TEST BFM OUT ...\n");
		
   };
};

'>
