<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr0_signal.e
// Module Name : Timer 0
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
// Purpose: This class create the input signals and it constrainst to apply to
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
// Local Functions: post_generate()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

// DEFINE

	define t_over_up   	8'd250;
	define t_over_down   8'd5;
	
// signal type 

type tmr0_signal_type_kind: [	RESET, 
										STOP,
										START,
										UP_COUNT,
										UP_COUNT_OVER,
										UP_COUNT_EXT,
										UP_COUNT_EXT_OVER,
										UP_LOW_OVER,
										UP_MED_OVER,
										
										DOWN_COUNT,
										DOWN_COUNT_OVER,
										DOWN_COUNT_EXT,
										DOWN_COUNT_EXT_OVER,
										DOWN_MED_OVER,
										DOWN_HIGH_OVER
										];
    
struct tmr0_signal_type like any_sequence_item {


   gate0	: bit;						// External Source Input Select bit
	
	int0	: bit;						// External Input 0
  
   m0t0	: bit; 						// Counter Mode Select bit 0
	
	m1t0	: bit;						// Counter Mode Select bit	1
	
	tr0	: bit;						// Start/Stop Counter Select bit
    
   reset	: bit;						// Reset Input
 
   tl0_i	: uint(bits: 8);			// TL0 Register Input
	
	tm0_i	: uint(bits: 8);			// TM0 Register Input
	
	th0_i	: uint(bits: 8);			// TH0 Register Input
	
	tf0_i : bit;						// Flag overflow Intput
	
	
   pkt_kind: tmr0_signal_type_kind;
	
	//------------------------------- At Reset, Load TL0,TM0 and TH0 = 0  	
  
	keep (pkt_kind == RESET) 					=>	(reset == 0 && int0 == 0  && tf0_i == 0 && tl0_i == 0 && tm0_i == 0 && th0_i == 0 && tr0 == 0 && m0t0 == 0 && m1t0 == 0 && gate0 == 0 );
	
	keep (pkt_kind == STOP) 					=>	(reset == 1 && tr0 == 0);
	
	keep (pkt_kind == START) 					=>	(reset == 1 && tr0 == 1);
	
//--------------------------------SEQ UP------------------------------

	keep (pkt_kind == UP_COUNT) 				=>	(reset == 1 && m0t0 == 0 && m1t0 == 0);
	
	keep (pkt_kind == UP_COUNT_OVER) 		=>	(reset == 1 && m0t0 == 0 && m1t0 == 0 && th0_i == 255 && tm0_i == 255 && tl0_i > t_over_up);
	
	keep (pkt_kind == UP_COUNT_EXT) 			=>	(reset == 1 && gate0 == 1 && int0 == 1 && m0t0 == 0 && m1t0 == 0);
	
	keep (pkt_kind == UP_COUNT_EXT_OVER)	=>	(reset == 1 && gate0 == 1 && int0 == 1 && m0t0 == 0 && m1t0 == 0 && th0_i == 255 && tm0_i == 255 && tl0_i > t_over_up);
	
	keep (pkt_kind == UP_LOW_OVER)	=>	(reset == 1 && m0t0 == 0 && m1t0 == 0 && tl0_i > t_over_up);
	
	keep (pkt_kind == UP_MED_OVER)	=>	(reset == 1 && m0t0 == 0 && m1t0 == 0 && tm0_i == 255 && tm0_i > t_over_up);

//-------------------------------SEQ Down------------------------------
	
	keep (pkt_kind == DOWN_COUNT)				=>	(reset == 1&& m0t0 == 1 && m1t0 == 1);
	
	keep (pkt_kind == DOWN_COUNT_OVER)		=>	(reset == 1 && m0t0 == 1 && m1t0 == 1 && th0_i == 0 && tm0_i == 0 && tl0_i < t_over_down);
	
	keep (pkt_kind == DOWN_COUNT_EXT) 		=>	(reset == 1&& gate0 == 1 && int0 == 1 && m0t0 == 1 && m1t0 == 1);
	
	keep (pkt_kind == DOWN_COUNT_EXT_OVER)	=>	(reset == 1&& gate0 == 1 && int0 == 1 && m0t0 == 1 && m1t0 == 1 && th0_i == 0 && tm0_i == 0 && tl0_i < t_over_down);
	
  	keep (pkt_kind == DOWN_MED_OVER)		=>	(reset == 1 && m0t0 == 1 && m1t0 == 1 && tl0_i < t_over_down);
	
	keep (pkt_kind == DOWN_HIGH_OVER)	=>	(reset == 1 && m0t0 == 1 && m1t0 == 1 && tm0_i == 0 && tl0_i < t_over_down);
	
   post_generate() is also {
	
    // messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
		
   };
};

'>
