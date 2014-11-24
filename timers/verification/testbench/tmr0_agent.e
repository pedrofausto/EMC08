<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_agent.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, sig - signal map, mon - monitor
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
// Include Files: br_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------


import tmr0_agent_h;

extend tmr0_agent_u {

   connect_pointers() is also {   
	 
      mon.reset_p    		= sig.reset_p;
      mon.tmod_gate_t0_p	= sig.tmod_gate_t0_p;
      mon.tmod_m0t0_p     	= sig.tmod_m0t0_p;
      mon.tmod_m1t0_p 		= sig.tmod_m1t0_p;
      mon.tcon_tr0_p    	= sig.tcon_tr0_p;
		mon.int0_p				= sig.int0_p;
      mon.tl0_i_p       	= sig.tl0_i_p;
      mon.tm0_i_p 			= sig.tm0_i_p;
		mon.th0_i_p 			= sig.th0_i_p;
		mon.tcon_tf0_i_p    	= sig.tcon_tf0_i_p;
		
		mon.tcon_tf0_o_p    	= sig.tcon_tf0_o_p;
      mon.tl0_o_p       	= sig.tl0_o_p;
      mon.tm0_o_p 			= sig.tm0_o_p;
		mon.th0_o_p 			= sig.th0_o_p;
		
   };

   // when BR_IN than map the signal between signal map and monitor
	
   when ACTIVE TMR0_IN tmr0_agent_u {
	
      connect_pointers() is also {  
		  
      bfm.reset_p    		= sig.reset_p;
      bfm.tmod_gate_t0_p	= sig.tmod_gate_t0_p;
      bfm.tmod_m0t0_p     	= sig.tmod_m0t0_p;
      bfm.tmod_m1t0_p 		= sig.tmod_m1t0_p;
      bfm.tcon_tr0_p    	= sig.tcon_tr0_p;
		bfm.int0_p       		= sig.int0_p;
      bfm.tl0_i_p       	= sig.tl0_i_p;
      bfm.tm0_i_p 			= sig.tm0_i_p;
		bfm.th0_i_p 			= sig.th0_i_p;
		bfm.tcon_tf0_i_p    	= sig.tcon_tf0_i_p;
		
		bfm.tcon_tf0_o_p    	= sig.tcon_tf0_o_p;
      bfm.tl0_o_p       	= sig.tl0_o_p;
      bfm.tm0_o_p 			= sig.tm0_o_p;
		bfm.th0_o_p 			= sig.th0_o_p;
		
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE TMR0_OUT tmr0_agent_u {
	
      connect_pointers() is also {
		
      bfm.reset_p    		= sig.reset_p;
      bfm.tmod_gate_t0_p	= sig.tmod_gate_t0_p;
      bfm.tmod_m0t0_p     	= sig.tmod_m0t0_p;
      bfm.tmod_m1t0_p 		= sig.tmod_m1t0_p;
      bfm.tcon_tr0_p    	= sig.tcon_tr0_p;
		bfm.int0_p       		= sig.int0_p;
      bfm.tl0_i_p       	= sig.tl0_i_p;
      bfm.tm0_i_p 			= sig.tm0_i_p;
		bfm.th0_i_p 			= sig.th0_i_p;
		bfm.tcon_tf0_i_p    	= sig.tcon_tf0_i_p;
		
		bfm.tcon_tf0_o_p    	= sig.tcon_tf0_o_p;
      bfm.tl0_o_p       	= sig.tl0_o_p;
      bfm.tm0_o_p 			= sig.tm0_o_p;
		bfm.th0_o_p 			= sig.th0_o_p;
			
      };
   };
};

'>
