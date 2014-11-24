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
// Keywords:
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


import tmr2_agent_h;

extend tmr2_agent_u {

   connect_pointers() is also {   
	 
      mon.reset_p    		= sig.reset_p				;
      mon.pht_i_p				= sig.pht_i_p				;
      mon.tcon2_dfp_i_p    = sig.tcon2_dfp_i_p		;
      mon.tcon2_dfsel_i_p 	= sig.tcon2_dfsel_i_p	;
      mon.tcon2_edsel_i_p  = sig.tcon2_edsel_i_p	;
 //     mon.tcon2_tr2_i_p    = sig.tcon2_tr2_i_p	   ;
      mon.tacph_i_p       	= sig.tacph_i_p			;
      mon.tacpl_i_p 			= sig.tacpl_i_p			;
		
		mon.tcon2_tf2_o_p 	= sig.tcon2_tf2_o_p		;
		mon.acrh_o_p    		= sig.acrh_o_p				;
      mon.acrm_o_p       	= sig.acrm_o_p				;
      mon.acrl_o_p 			= sig.acrl_o_p				;
      
      mon.pdf_o_p          = sig.pdf_o_p           ; // Internal
      
      mon.prsc_o_p         = sig.prsc_o_p          ; // Internal
      
      mon.acr_inc_reg_p    = sig.acr_inc_reg_p     ; // Internal
		
   };

   // when BR_IN than map the signal between signal map and monitor
	
   when ACTIVE TMR2_IN tmr2_agent_u {
	
      connect_pointers() is also {  
		  
      bfm.reset_p    		= sig.reset_p				;
      bfm.pht_i_p				= sig.pht_i_p				;
      bfm.tcon2_dfp_i_p    = sig.tcon2_dfp_i_p		;
      bfm.tcon2_dfsel_i_p 	= sig.tcon2_dfsel_i_p	;
      bfm.tcon2_edsel_i_p  = sig.tcon2_edsel_i_p	;
//     bfm.tcon2_tr2_i_p    = sig.tcon2_tr2_i_p	   ;
      bfm.tacph_i_p       	= sig.tacph_i_p			;
      bfm.tacpl_i_p 			= sig.tacpl_i_p			;
		
		bfm.tcon2_tf2_o_p 	= sig.tcon2_tf2_o_p		;
		bfm.acrh_o_p    		= sig.acrh_o_p				;
      bfm.acrm_o_p       	= sig.acrm_o_p				;
      bfm.acrl_o_p 			= sig.acrl_o_p				;
      
      bfm.pdf_o_p          = sig.pdf_o_p           ; // Internal      
      bfm.prsc_o_p         = sig.prsc_o_p          ; // Internal
      bfm.acr_inc_reg_p    = sig.acr_inc_reg_p     ; // Internal
		
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE TMR2_OUT tmr2_agent_u {
	
      connect_pointers() is also {
		
      bfm.reset_p    		= sig.reset_p				;
      bfm.pht_i_p				= sig.pht_i_p				;
      bfm.tcon2_dfp_i_p    = sig.tcon2_dfp_i_p		;
      bfm.tcon2_dfsel_i_p 	= sig.tcon2_dfsel_i_p	;
      bfm.tcon2_edsel_i_p  = sig.tcon2_edsel_i_p	;
//     bfm.tcon2_tr2_i_p    = sig.tcon2_tr2_i_p	   ;
      bfm.tacph_i_p       	= sig.tacph_i_p			;
      bfm.tacpl_i_p 			= sig.tacpl_i_p			;
		
		bfm.tcon2_tf2_o_p 	= sig.tcon2_tf2_o_p		;
		bfm.acrh_o_p    		= sig.acrh_o_p				;
      bfm.acrm_o_p       	= sig.acrm_o_p				;
      bfm.acrl_o_p 			= sig.acrl_o_p				;
      
      bfm.pdf_o_p          = sig.pdf_o_p           ; // Internal
      bfm.prsc_o_p         = sig.prsc_o_p          ; // Internal
      bfm.acr_inc_reg_p    = sig.acr_inc_reg_p     ; // Internal
			
      };
   };
};

'>
