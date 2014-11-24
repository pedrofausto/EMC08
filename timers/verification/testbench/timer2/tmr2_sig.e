<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_sig.e
// Module Name : Timer 0 Module
// Author : Hugo Kakisaka, Marcelo Mamoru Ono
// E-mail : diga21@emc8.br, diga20@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords:
// -----------------------------------------------------------------------------
// Purpose: Map the external signals to the verification environment
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
// Include Files: br_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr2_sig_h;

extend tmr2_sig_u {
  
  //------------------------------- Signal to DUT
								
   reset_p    			: inout simple_port of bit is instance				; 	// Reset
   pht_i_p      		: inout simple_port of bit is instance				;  // Missing Tooth Sensor Input
   tcon2_dfp_i_p    	: inout simple_port of uint(bits:3) is instance	; 	// Digital Filter Prescaler    
   tcon2_dfsel_i_p 	: inout simple_port of bit is instance				; 	// Digital Filter Sample Mode 
   tcon2_edsel_i_p  	: inout simple_port of bit is instance				;  // Edge Select Bit
// tcon2_tr2_i_p    : inout simple_port of bit 			               ;  // Run/Stop Select Bit 
	tacph_i_p       	: inout simple_port of uint(bits:2) is instance	; 	// Max Angle Clock Period High
	tacpl_i_p			: inout simple_port of uint(bits:8) is instance	;	// Max Angle Clock Period Low

   
	//------------------------------- Signal from DUT
    
   tcon2_tf2_o_p 		: inout simple_port of bit is instance				; 	// Timer 2 Flag Overflow
	acrh_o_p				: inout simple_port of uint(bits:8) is instance	;	// Angle Counter Register High
	acrm_o_p				: inout simple_port of uint(bits:8) is instance	;	// Angle Counter Register Medium
	acrl_o_p				: inout simple_port of uint(bits:8) is instance	; 	// Angle Counter Register Low
   
   
   //------------------------------- DUT Internal Variables / Connections
   
   pdf_o_p            : inout simple_port of bit is instance          ;  // PDF Output  
   
   prsc_o_p           : inout simple_port of bit is instance          ;  // Prescaler Output 

   acr_inc_reg_p      : inout simple_port of bit is instance          ;  // ACR Increment Flag  
   
   //------------------------------ Connect Ports to DUT
	
   keep bind(reset_p,external)				;
   keep bind(pht_i_p,external)				;
   keep bind(tcon2_dfp_i_p,external)		;
   keep bind(tcon2_dfsel_i_p,external)		;
   keep bind(tcon2_edsel_i_p,external)		;
//   keep bind(tcon2_tr2_i_p,external)		;
   keep bind(tacph_i_p,external)				;
   keep bind(tacpl_i_p,external)				;
	
	
	keep bind(tcon2_tf2_o_p,external)		;
	keep bind(acrh_o_p,external)				;
	keep bind(acrm_o_p,external)				;
	keep bind(acrl_o_p,external)				;
   
   
   keep bind(pdf_o_p,external)            ;  // internal
   keep bind(prsc_o_p,external)           ;  // internal
   keep bind(acr_inc_reg_p,external)      ;  // internal
   
   	
   when TMR2_IN tmr2_sig_u {
	
   //------------------------------- Path Specification to TMR2 IN signals
		
      keep reset_p.hdl_path()    		== "reset"			;
      keep pht_i_p.hdl_path()      		== "pht_i"			;
      keep tcon2_dfp_i_p.hdl_path()    == "dfp_i"			;
      keep tcon2_dfsel_i_p.hdl_path() 	== "dfsel_i"		;
      keep tcon2_edsel_i_p.hdl_path()  == "edsel_i"		;
 //     keep tcon2_tr2_i_p.hdl_path()  == "tr2_i"		;
      keep tacph_i_p.hdl_path()        == "tacph_i"		;
      keep tacpl_i_p.hdl_path() 			== "tacpl_i"		;

		keep tcon2_tf2_o_p.hdl_path() 	== "tf2_o"			;
		keep acrh_o_p.hdl_path() 			== "acrh_o"			;
		keep acrm_o_p.hdl_path() 			== "acrm_o"			;
		keep acrl_o_p.hdl_path() 			== "acrl_o"			;
      
      
      keep pdf_o_p.hdl_path()          == "UUT/top_pdf/timers_timer2_pdfoutput_o"       ;
      
      keep prsc_o_p.hdl_path()         == "UUT/top_pdcf/timers_timer2_pdcf_clkdiv_o"    ;
      
      keep acr_inc_reg_p.hdl_path()    == "UUT/top_acg/acr_inc"                         ;
   };
  
   when TMR2_OUT tmr2_sig_u {
	
    //------------------------------- Path Specification to TMR2 OUT signals
		
     	
      keep reset_p.hdl_path()    		== "reset"		;
      keep pht_i_p.hdl_path()      		== "pht_i"		;
      keep tcon2_dfp_i_p.hdl_path()    == "dfp_i"		;
      keep tcon2_dfsel_i_p.hdl_path() 	== "dfsel_i"	;
      keep tcon2_edsel_i_p.hdl_path()  == "edsel_i"	;
 //     keep tcon2_tr2_i_p.hdl_path()  == "tr2_i"		;
      keep tacph_i_p.hdl_path()        == "tacph_i"	;
      keep tacpl_i_p.hdl_path() 			== "tacpl_i"	;

		keep tcon2_tf2_o_p.hdl_path() 	== "tf2_o"		;
		keep acrh_o_p.hdl_path() 			== "acrh_o"		;
		keep acrm_o_p.hdl_path() 			== "acrm_o"		;
		keep acrl_o_p.hdl_path() 			== "acrl_o"		;
      
            
      keep pdf_o_p.hdl_path()          == "UUT/top_pdf/timers_timer2_pdfoutput_o"       ;
      
      keep prsc_o_p.hdl_path()         == "UUT/top_pdcf/timers_timer2_pdcf_clkdiv_o"    ;
      
      keep acr_inc_reg_p.hdl_path()    == "UUT/top_acg/acr_inc"                         ;
   };
};

'>
