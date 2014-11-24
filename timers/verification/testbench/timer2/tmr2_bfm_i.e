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

import tmr2_bfm_i_h;

extend tmr2_bfm_i_u {

   //------------------------------- Instance the ports used in bfm in
  
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
    
   !tcon2_tf2_o_p 	: inout simple_port of bit 			; 	// Timer 2 Flag Overflow
	!acrh_o_p			: inout simple_port of uint(bits:8) ;	// Angle Counter Register High
	!acrm_o_p			: inout simple_port of uint(bits:8) ;	// Angle Counter Register Medium
	!acrl_o_p			: inout simple_port of uint(bits:8) ; 	// Angle Counter Register Low

  
   
   //------------------------------- DUT Internal Connections
   
   
   
   !pdf_o_p          : inout simple_port of bit               ;  // PDF Output
   
   !prsc_o_p         : inout simple_port of bit               ;  // Prescaler Output
   
   !acr_inc_reg_p    : inout simple_port of bit               ;  // ACR Increment Flag 
   

   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: tmr2_signal_type;

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
	
   send_pkt(in_pkt: tmr2_signal_type) @clock_e is only {
	
      // ports receive the signal from bfm according to the generated sequences
		
      if (in_pkt.pkt_kind == RESET) {
		
         out("TIMER 2 in RESET state ...\n");
			
			out("Initializing Input Stimulus ...\n");
			
         reset_p$    		= in_pkt.reset	;
			
//			pht_i_p$      		= in_pkt.pht	;
			
			tcon2_dfsel_i_p$  = in_pkt.dfsel	;
			
			tcon2_edsel_i_p$  = in_pkt.edsel	;
			
			tcon2_dfp_i_p$		= in_pkt.dfp	;
         
//         tcon2_tr2_i_p$    = in_pkt.tr2	;
			
			tacph_i_p$  		= in_pkt.tacph	;
			
			tacpl_i_p$  		= in_pkt.tacpl	;
         
         acr_inc_reg_p$    =in_pkt.acr_incf;
			
         wait [2] * cycle;
	  
         reset_p$    = 1;
			 	
         out("TIMER 2 in normal operation...\n");
			
      } else {
      
              if (in_pkt.pkt_kind == ACR_INC) {
              
                     tcon2_dfsel_i_p$  = in_pkt.dfsel ;
         
                     tcon2_edsel_i_p$  = in_pkt.edsel ;
         
                     tcon2_dfp_i_p$    = in_pkt.dfp   ;
         
          //         tcon2_tr2_i_p$    = in_pkt.tr2 ;
         
                     tacph_i_p$        = in_pkt.tacph ;
         
                     tacpl_i_p$        = in_pkt.tacpl ;
                  
                     acr_inc_reg_p$    =in_pkt.acr_incf;
  
  
                  }else {
		

                     //      tcon2_dfsel_i_p$  = 0 ;
			
			            tcon2_edsel_i_p$  = in_pkt.edsel	;
   
   
                      //       tcon2_edsel_i_p$  = 1	;
			
			            tcon2_dfp_i_p$		= in_pkt.dfp	;
   
                     //      tcon2_dfp_i_p$		= 007	;
         
                     //    tcon2_tr2_i_p$    = in_pkt.tr2	;
			
			            tacph_i_p$  		= in_pkt.tacph	;
			
			            tacpl_i_p$  		= in_pkt.tacpl	;
   
   
                     //      tacph_i_p$  		= 0    ;
         
                     //       tacpl_i_p$  		= 50   ;
  
                     };        
         
         };
   
         wait [`PACKET_LENGTH]                     ; // Packet Length
};

};

'>
