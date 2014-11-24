<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_test.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Generates the sequence many times
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
// Include Files: mc_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_config;

extend MAIN mc_seq_s {
 
   !seq_random            : RAND               mc_seq_s;
     
   
   post_generate() is also {
      --out("-----------------------------> START POST_GENERATE... @mc_test.e");
      --message(LOW, me, " " );
   }; 
 
   pre_generate() is also{
      --out("-----------------------------> START PRE_GENERATE... @mc_test.e");
   };
   
   body() @driver.clock is only {
   var counter: int = 0;
      
     --out("-----------------------------> Generating sequences (Gerando sequencias)... @mc_test.e");      

        wait delay (250);
        message(LOW, "########### > RAND_MODE: ", counter);
        for i from 1 to 10000
        {
           do seq_random
           
        };  

      
      stop_run();
   };
};

'>
