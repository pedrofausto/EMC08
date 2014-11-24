<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_test.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core top module, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: Sequences to be generated.
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
// Include Files: core_reg_control_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_config;

extend MAIN core_reg_control_seq_s {
   
   !seq_reset        : SEQ_RESET core_reg_control_seq_s;
  
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   drain_cycles: uint;
   keep soft drain_cycles == 100;
   body() @driver.clock is only {
      do seq_reset;
      
      wait [ 10 ];
      stop_run();
   };
};

'>
