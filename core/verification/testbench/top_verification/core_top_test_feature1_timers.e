<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_test_feature1_timers.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core top module, seq - sequence
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
// Include Files: core_top_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_config;

extend core_top_mon_u {
   keep feature == feature_timers; 
};

extend MAIN core_top_seq_s {
   
   !seq_reset        : SEQ_RESET core_top_seq_s;
   !seq_nop          : SEQ_INST_NOP core_top_seq_s;
   !seq_mov_a_data   : SEQ_INST_MOV_A_DATA core_top_seq_s;
   !seq_mov_d_data   : SEQ_INST_MOV_D_DATA core_top_seq_s;
   !seq_mov_d_a      : SEQ_INST_MOV_D_A core_top_seq_s;
   !seq_mov_atr1_d   : SEQ_INST_MOV_ATR1_D core_top_seq_s;
   
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   body() @driver.clock is only {
      
      
      
      do seq_reset;
      do seq_nop;
      do seq_mov_a_data;
      //do seq_mov_d_data;
      do seq_mov_d_a;
      do seq_nop;
      do seq_mov_atr1_d;
      
      do seq_nop;
      //wait [ 1 ];
      stop_run();
   };
};

'>
