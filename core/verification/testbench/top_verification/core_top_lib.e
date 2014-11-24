<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_lib.e
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
// Purpose: Create the sequences of stimulus
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: get_pkt(), its_done()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend core_top_seq_s {
   !pkt: core_top_signal_type;
   
   
};

// sequence to generate the reset signals
extend core_top_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET core_top_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      message (LOW, "A RESET signal occurs");
      do pkt keeping { .pkt_kind == RESET };
   };
};

////////  INSTRUCTION SET ////////////////////

extend core_top_seq_kind_t: [SEQ_INST_DEFAULT]; 
extend SEQ_INST_DEFAULT core_top_seq_s {
   body() @driver.clock is only {
      message (LOW, "SEQ_INST_DEFAULT instruction send");
      do pkt keeping { .pkt_kind           == NOP };
   };
};


'>
