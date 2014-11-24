<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_test_feature_ports.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.top
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author         Description
// 1.0      15-10-2010  Thiago Santos  TOP Verification - Serial Transmission
// -----------------------------------------------------------------------------
// Keywords: top - top module, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: test case to verify the ports
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
   keep feature == feature_serial;
   keep testcase == testcase3; 
};

extend MAIN top_seq_s {
   
   !seq_reset           : SEQ_RESET top_seq_s;
   !seq_reception_mode0 : SEQ_RECEPTION_MODE0 top_seq_s;
   
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   body() @driver.clock is only {
      do seq_reset;
      do seq_reception_mode0;
      stop_run();
   };
};

'>
