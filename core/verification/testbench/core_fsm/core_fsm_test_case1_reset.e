<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_test.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.core_fsm, diga19@emc08.core_fsm
// -----------------------------------------------------------------------------
// Review(s) : o2/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: Sequences generated and tested
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
// Include Files: core_fsm_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_config;

extend MAIN core_fsm_seq_s {
   
   !seq_reset        : SEQ_RESET core_fsm_seq_s;
   !seq_nop          : SEQ_INST_NOP core_fsm_seq_s;
   !seq_add          : SEQ_INST_ADD_A_DATA core_fsm_seq_s;
   
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   drain_cycles: uint;
   keep soft drain_cycles == 100;
   body() @driver.clock is only {
      do seq_reset;
      do seq_nop;
      do seq_nop;
      do seq_add;
      do seq_nop;
      do seq_nop;
      
      do seq_reset;
      
      //wait [ 1 ];
      stop_run();
   };
};

'>
