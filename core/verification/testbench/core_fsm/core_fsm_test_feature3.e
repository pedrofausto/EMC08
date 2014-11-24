<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_test_feature3.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.core_fsm, diga19@emc08.core_fsm
// -----------------------------------------------------------------------------
// Review(s) : 13/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      17-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: Feature 3 to verify the LCALL instruction generating a random LCALL
// by softwares and hardwares
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
extend core_fsm_mon_u {
   keep feature == feature3;
};

extend MAIN core_fsm_seq_s {
   
   !seq_reset             : SEQ_RESET core_fsm_seq_s;
   !seq_inst_interrupt_on : SEQ_INST_INTERRUPT_ON core_fsm_seq_s;
   !seq_inst_rand         : SEQ_INST_RAND core_fsm_seq_s; //interrupt off
   //!seq_inst_int_rand     : SEQ_INST_INT_RAND core_fsm_seq_s;
   
   //////////////  INTRUCTION SET SEQUENCES ///////
   //!seq_nop          : SEQ_INST_NOP core_fsm_seq_s;
   
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   stimulus: int;
   keep soft stimulus == 2;
   !num_pkt: int;
   keep soft num_pkt == select {
      90 : 1; //do seq_inst_rand 70%
      10 : 2; //do seq_inst_int_rand 20%
    //  10 : 2; //do seq_inst_interrupt_on 10%
   };
   
   body() @driver.clock is only {
         
           do seq_reset;
          //// sequences to verify the LCALL instruction generating by hardware and by software
             
         for i from 1 to stimulus {
         gen num_pkt;
          case {
               num_pkt == 1 {do seq_inst_rand };
               num_pkt == 2 {do seq_inst_interrupt_on};
               //num_pkt == 2 {do seq_inst_int_rand}; 
               }; //end case
         }; //end for
   
      stop_run();
      }; // end body
}; //end MAIN

'>
