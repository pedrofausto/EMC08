<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr0_sig.e
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

import tmr0_sig_h;

extend tmr0_sig_u {
  
  //------------------------------- Signal to DUT
								
   reset_p    			: inout simple_port of bit is instance; 				// Reset
   int0_p      		: inout simple_port of bit is instance;  				// External Input 0
   tmod_gate_t0_p    : inout simple_port of bit is instance; 				// Source Select bit  
   tmod_m0t0_p 		: inout simple_port of bit is instance; 				// UP/DOWN Counter Select bit 
   tmod_m1t0_p    	: inout simple_port of bit is instance;  
	tcon_tr0_p       	: inout simple_port of bit is instance; 				// START/STOP Counter Select bit
	tl0_i_p				: inout simple_port of uint(bits:8) is instance;	// TL0 Input Register
	tm0_i_p				: inout simple_port of uint(bits:8) is instance;	// TM0 Input Register
	th0_i_p				: inout simple_port of uint(bits:8) is instance;	// TH0 Input Register
	
	tcon_tf0_i_p 		: inout simple_port of bit is instance; 				// Timer Overflow Flag
   
	//------------------------------- Signal from DUT
    
   tcon_tf0_o_p 		: inout simple_port of bit is instance; 				// Timer Overflow Flag
	tl0_o_p				: inout simple_port of uint(bits:8) is instance;	// TH0 Output Register
	tm0_o_p				: inout simple_port of uint(bits:8) is instance;	// TH0 Output Register
	th0_o_p				: inout simple_port of uint(bits:8) is instance; 	// TH0 Output Register

   //------------------------------ Connect Ports to DUT
	
   keep bind(reset_p,external)				;
   keep bind(int0_p,external)					;
   keep bind(tmod_gate_t0_p,external)		;
   keep bind(tmod_m0t0_p,external)			;
   keep bind(tmod_m1t0_p,external)			;
   keep bind(tcon_tr0_p,external)			;
   keep bind(tl0_i_p,external)				;
	keep bind(tm0_i_p,external)				;
	keep bind(th0_i_p,external)				;
	keep bind(tcon_tf0_i_p,external)			;
	
	keep bind(tcon_tf0_o_p,external)			;
	keep bind(tl0_o_p,external)				;
	keep bind(tm0_o_p,external)				;
	keep bind(th0_o_p,external)				;

	
   when TMR0_IN tmr0_sig_u {
	
   //------------------------------- Path Specification to TMR0 IN signals
		
      keep reset_p.hdl_path()    		== "reset"			;
      keep int0_p.hdl_path()      		== "int0"			;
      keep tmod_gate_t0_p.hdl_path()   == "tmod_gate_t0"	;
      keep tmod_m0t0_p.hdl_path() 		== "tmod_m0t0"		;
      keep tmod_m1t0_p.hdl_path()    	== "tmod_m1t0"		;
      keep tcon_tr0_p.hdl_path()       == "tcon_tr0"		;
      keep tl0_i_p.hdl_path() 			== "tl0_i"			;
		keep tm0_i_p.hdl_path() 			== "tm0_i"			;
		keep th0_i_p.hdl_path() 			== "th0_i"			;
		keep tcon_tf0_i_p.hdl_path()		== "tcon_tf0_i"	;
		
		keep tcon_tf0_o_p.hdl_path() 		== "tcon_tf0_o"	;
		keep tl0_o_p.hdl_path() 			== "tl0_o"			;
		keep tm0_o_p.hdl_path() 			== "tm0_o"			;
		keep th0_o_p.hdl_path() 			== "th0_o"			;
   };
  
   when TMR0_OUT tmr0_sig_u {
	
    //------------------------------- Path Specification to TMR0 OUT signals
		
      keep reset_p.hdl_path()    		== "reset"			;
      keep int0_p.hdl_path()      		== "int0"			;
      keep tmod_gate_t0_p.hdl_path()   == "tmod_gate_t0"	;
      keep tmod_m0t0_p.hdl_path() 		== "tmod_m0t0"		;
      keep tmod_m1t0_p.hdl_path()    	== "tmod_m1t0"		;
      keep tcon_tr0_p.hdl_path()       == "tcon_tr0"		;
      keep tl0_i_p.hdl_path() 			== "tl0_i"			;
		keep tm0_i_p.hdl_path() 			== "tm0_i"			;
		keep th0_i_p.hdl_path() 			== "th0_i"			;
		keep tcon_tf0_i_p.hdl_path()			== "tcon_tf0_i"	;
		
		keep tcon_tf0_o_p.hdl_path() 		== "tcon_tf0_o"	;
		keep tl0_o_p.hdl_path() 			== "tl0_o"			;
		keep tm0_o_p.hdl_path() 			== "tm0_o"			;
		keep th0_o_p.hdl_path() 			== "th0_o"			;
   };
};

'>
