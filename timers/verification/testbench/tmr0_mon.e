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

import tmr0_mon_h;

extend tmr0_mon_u {

   //------------------------------- Instance the ports used in monitor
  
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
	
	
	
   //------------------------------- Events to Control The Reset State
	
   event reset_rise is rise(reset_p$)@sim;
	
   event reset_fall is fall(reset_p$)@sim;
	
	event clk_rise is @clock_e;
	
//	event clk_fall is fall(clk_p$)@sim;

   // event that wait for a sm0 rise and a smod rise
//   event sm0_rise_smod_rise is (rise(SM0_p$)@sim and rise(SMOD_p$)@sim);
  
   // event that wait for a sm0 rise and a smod fall
//   event sm0_rise_smod_fall is (rise(SM0_p$)@sim and fall(SMOD_p$)@sim);
  
   // event that see the rise fall of sm0
//   event sm0_fall is (fall(SM0_p$)@sim);
  
   // event to BR_START rise
//   event tmr0_start_rise is rise(CM_START_p$)@sim;
      
   when TMR0_IN tmr0_mon_u {
      // event hit_rise is rise(reset_p$)@sim;
		watch_bus() @clock_e is also {
			while (TRUE) {   
				// calls the reference model to check the DUT
				reference_model();
	
				// the monitor detected a packet
       	 emit pkt_detected_e;
			}; 
		};
   };
   
   when TMR0_OUT tmr0_mon_u {
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
    //  message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>