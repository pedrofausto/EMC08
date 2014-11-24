<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_bfm_i.e
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
// Include Files: br_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr0_bfm_i_h;

extend tmr0_bfm_i_u {

   //------------------------------- Instance the ports used in bfm in
  
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
   !tcon_tf0_i_p 		: inout simple_port of bit ; 				// Timer Overflow Flag
	//------------------------------- Signal from DUT
    
   !tcon_tf0_o_p 		: inout simple_port of bit ; 				// Timer Overflow Flag
	!tl0_o_p				: inout simple_port of uint(bits:8) ;	// TH0 Output Register
	!tm0_o_p				: inout simple_port of uint(bits:8) ;	// TH0 Output Register
	!th0_o_p				: inout simple_port of uint(bits:8) ; 	// TH0 Output Register
  
	
	tl0_var	: uint(bits: 8);			// TL0 Register Input
	
	tm0_var	: uint(bits: 8);			// TM0 Register Input
	
	th0_var	: uint(bits: 8);			// TH0 Register Input
	
	tf_var	:bit;
	
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: tmr0_signal_type;

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
	
   send_pkt(in_pkt: tmr0_signal_type) @clock_e is only {
	
	wait delay(4500); 

				
	if (in_pkt.pkt_kind == RESET) 
		{
			reset_p$   			= in_pkt.reset ;
			tl0_i_p$      		= in_pkt.tl0_i	;
			tm0_i_p$      		= in_pkt.tm0_i	;
			th0_i_p$      		= in_pkt.th0_i	;
			tcon_tr0_p$			= in_pkt.tr0	;
			tmod_gate_t0_p$  	= in_pkt.gate0	;
			tmod_m1t0_p$  		= in_pkt.m1t0	;
			tmod_m0t0_p$  		= in_pkt.m0t0	;
			int0_p$		  		= in_pkt.int0	;
			tcon_tf0_i_p$		= in_pkt.tf0_i	;
			
		//	wait delay(5000);
		//	wait [1] *cycle;
		//	reset_p$				= 1;
		}
		else{

		
	// ports receive the signal from bfm according to the generated sequences
			reset_p$   			= in_pkt.reset ;
			tl0_i_p$      		= in_pkt.tl0_i	;
			tm0_i_p$      		= in_pkt.tm0_i	;
			th0_i_p$      		= in_pkt.th0_i	;
			tcon_tr0_p$			= in_pkt.tr0	;
			tmod_gate_t0_p$  	= in_pkt.gate0	;
			tmod_m1t0_p$  		= in_pkt.m1t0	;
			tmod_m0t0_p$  		= in_pkt.m0t0	;
			int0_p$		  		= in_pkt.int0	;
			tcon_tf0_i_p$		= in_pkt.tf0_i	;	//test without fl0_in
			
		//	tmod_m1t0_p$  		= 1	;
		//	tmod_m0t0_p$  		= 1	;
		//	tmod_gate_t0_p$  	= 0	;
		//	int0_p$		  		= 0	;
		
		
		if (in_pkt.pkt_kind == STOP) 
		{
			for i from 1 to 5 {
				gen tl0_var;
				gen tm0_var;
				gen th0_var;
			//	wait [1] *cycle;
				wait delay(5000);
				tl0_i_p$      		= tl0_var ;
				tm0_i_p$      		= tm0_var ;
				th0_i_p$      		= th0_var ;
			};
		};
		
		if (in_pkt.pkt_kind != STOP && in_pkt.pkt_kind != RESET ) 
		{
			
			if (in_pkt.tr0 == 0)
			{
			//	wait [1] *cycle;
				wait delay(5000);
				tcon_tr0_p$			= 1;
			};

			for i from 1 to 7 {
				gen tf_var;
			//	wait [1] *cycle;
				wait delay(5000);
				tcon_tf0_i_p$		= tf_var ;
			};
		};
   };
	};
};

'>
