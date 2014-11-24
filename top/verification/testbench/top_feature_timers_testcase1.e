<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_feature_timers_testcase1.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.top
// -----------------------------------------------------------------------------
// Review(s) : 26/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: test case to verify the timers
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
// Include Files: top_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_config;

extend sys {
   keep feature == feature_timers;
   keep testcase == testcase1; 
};


extend MAIN top_seq_s {
   

   !seq_reset        : SEQ_RESET top_seq_s;
   
   !seq_default      : SEQ_DEFAULT top_seq_s;

   
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   body() @driver.clock is only {
      var interations: int = 5000;   
   
      do seq_reset;
      
      
      for i from 1 to interations {
         do seq_default;
     
      };
      
      stop_run();
   };
};

'>
