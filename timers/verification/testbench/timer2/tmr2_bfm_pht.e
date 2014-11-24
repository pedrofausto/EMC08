
<'

// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_pht_bfm.e
// Module Name : Timer 2 Module
// Author : Hugo Kakisaka, Marcelo Mamoru Ono
// E-mail : diga21@emc8.br, diga20@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 12/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords:
// -----------------------------------------------------------------------------
// Purpose: Create the types for environment
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
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------


//import tmr2_define.e ;

extend tmr2_bfm_i_u {
   
     pht_interval: uint;                     // Missing Tooth Set Interval
        
  //   keep soft pht_interval in [150000..3000000];
  
     keep soft pht_interval == 1500 ;
       
     random_pht() @clock_e is {
     
    //   var pht_count: uint;
    
       out ("MTS SIGNAL Asserted\n")    ;
       
       while TRUE {
       
         pht_i_p$ = 0                  ; // Clear PHT Input
       
         wait [pht_interval]           ;

         pht_i_p$ = 1                  ; // Set PHT Input
           
  //       for i from 1 to `GLITCH_PULSES {        // Random Glitch Pulse Generator 
         
  //          wait [1]                    ;
         
  //          pht_i_p$ = 0                ;
            
  //          wait [1]                    ;
         
  //          pht_i_p$ = 1                ;
                        
  //       };
   
         wait [`WIDTH_PHT_H] ;
         
         pht_i_p$ = 0                  ;
   
         gen pht_interval;   
                                                   
    //     message(LOW, "Asserting reset in ", dec(pht_interval), " cycles.");
    
       };
     };

     run() is also {start random_pht(); };
};
'>
