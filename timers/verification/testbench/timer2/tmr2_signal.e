<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_signal.e
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

// signal type 

type tmr2_signal_type_kind: [	RESET				, 
										FILTER_S2		, 
										FILTER_S3		, 
										FALL_EDGE		, 
										RISE_EDGE		, 
										DFDIV_001		,
										DFDIV_002		,
										DFDIV_004		,
										DFDIV_008		,
										DFDIV_016		,
										DFDIV_032		,
										DFDIV_064		,
										DFDIV_128		, 
										SENSOR_MTS		,
                              SENSOR_MTS_ON  ,
                              
                //              STOP           ,
                //              START          ,
                              SENSOR_MTS_OFF,
                              TACPH,
                              TACPL,
                              ACR_INC                            										
															];
    
struct tmr2_signal_type like any_sequence_item {

  
   dfsel	: bit					; 			// Digital Filter Sample Mode
	
	edsel	: bit					;			// Edge Select
	
	pht	: bit					;			// Missing Tooth Sensor Input
	
	reset	: bit					;			// Reset Input
   
 //  tr2   : bit             ;        // Run/Stop Select Bit
	
	dfp	: uint(bits:3)		;			// Digital Filter Prescaler 
	
	tacph	: uint(bits:2)		;			// Max Angle Clock Period High
	
	tacpl	: uint(bits:8)		;			// Max Angle Clock Period Low
 
   acr_incf : bit          ;        // Reset Input
   
   

   pkt_kind: tmr2_signal_type_kind;
	
	
  
   keep  (pkt_kind == RESET) 			=>	(reset == 0 && dfp == 0 && dfsel == 0 && edsel == 0 && pht == 0 && tacph == 0 && tacpl == 0 && acr_incf==0);	

	
//----------------------------- 2 SAMPLE MODE  	
	
	keep  (pkt_kind == FILTER_S2) 	=>	(reset == 1 && dfsel == 0);
	
	
//----------------------------- 3 SAMPLE MODE 	
	
	keep  (pkt_kind == FILTER_S3) 	=>	(reset == 1 && dfsel == 1);
	
	
//----------------------------- FALL EDGE MODE 	
	
   keep  (pkt_kind == FALL_EDGE) 	=>	(reset == 1 && edsel == 0);
	

//----------------------------- RISE EDGE MODE 
	
	keep  (pkt_kind == RISE_EDGE) 	=>	(reset == 1 && edsel == 1);
	
	
//----------------------------- DFP DIVIDER 1:1 

	keep  (pkt_kind == DFDIV_001) 	=>	(reset == 1 && dfp == 0);
	
	
//----------------------------- DFP DIVIDER 1:2

	keep  (pkt_kind == DFDIV_002) 	=>	(reset == 1 && dfp == 1);
	
	
//----------------------------- DFP DIVIDER 1:4

	keep  (pkt_kind == DFDIV_004) 	=>	(reset == 1 && dfp == 2);
	
	
//----------------------------- DFP DIVIDER 1:8

	keep  (pkt_kind == DFDIV_008) 	=>	(reset == 1 && dfp == 3);
	
	
//----------------------------- DFP DIVIDER 1:16

	keep  (pkt_kind == DFDIV_016) 	=>	(reset == 1 && dfp == 4);
	
	
//----------------------------- DFP DIVIDER 1:32

	keep  (pkt_kind == DFDIV_032) 	=>	(reset == 1 && dfp == 5);
	
	
//----------------------------- DFP DIVIDER 1:64

	keep  (pkt_kind == DFDIV_064) 	=>	(reset == 1 && dfp == 6);

	
//----------------------------- DFP DIVIDER 1:128

	keep  (pkt_kind == DFDIV_128) 	=>	(reset == 1 && dfp == 7);
	
	
//----------------------------- MTS SENSOR 

	keep  (pkt_kind == SENSOR_MTS_ON) 	=>	(reset == 1 && pht == 1);				
   
   
//----------------------------- TACP HIGH 
   
	keep  (pkt_kind == TACPH) 	 => (reset == 1 && tacph == 0 && tacpl in [ 90 .. 110 ] );				
   
   
//----------------------------- TACP LOW
   
   keep  (pkt_kind == TACPL)   => (reset == 1 && tacph == 0 && tacpl in [ 90 .. 110 ] );           
   
   
//----------------------------- STOP MODE   
   
   
//   	keep  (pkt_kind == STOP) 	=>	(reset == 1 && tr2 == 0);
      
      
//----------------------------- START MODE   
   
   
//   	keep  (pkt_kind ==  START) =>	(reset == 1 && tr2 == 1);


//----------------------------- ACR INCREMENT FLAG
   
   keep  (pkt_kind == ACR_INC)   => (reset == 1 && dfp == 0 && dfsel == 0 && edsel == 0 && pht == 0 && tacph == 0 && tacpl == 0);          

   
   
   
  
   post_generate() is also {
	
    // messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
		
   };
};

'>
