<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_lib.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, seq - sequence
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

extend core_alu_seq_s {
   !pkt: core_alu_signal_type;
};

extend core_alu_seq_kind_t: [SEQ_ALU_DISABLE];
extend SEQ_ALU_DISABLE core_alu_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      //out("The ALU is disable");
      do pkt keeping { .pkt_kind == ALU_DISABLE };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_NONE];
extend SEQ_ALU_NONE core_alu_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      //out("In NONE sequence...");
      do pkt keeping { .pkt_kind == ALU_NONE };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_ADD];
extend SEQ_ALU_ADD core_alu_seq_s {   
   // behavior
   body() @driver.clock is only {
      //out("In BCB seq...");
      do pkt keeping { .pkt_kind == ALU_ADD };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_INC];
extend SEQ_ALU_INC core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      //out("In INC seq...");
      do pkt keeping { .pkt_kind == ALU_INC };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_ADDC];
extend SEQ_ALU_ADDC core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_ADDC };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_SUB];
extend SEQ_ALU_SUB core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_SUB };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_DEC];
extend SEQ_ALU_DEC core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_DEC };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_MUL];
extend SEQ_ALU_MUL core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_MUL };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_DIV];
extend SEQ_ALU_DIV core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_DIV };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_DA];
extend SEQ_ALU_DA core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_DA };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_AND];
extend SEQ_ALU_AND core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_AND };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_XOR];
extend SEQ_ALU_XOR core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_XOR };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_OR];
extend SEQ_ALU_OR core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_OR };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_RL];
extend SEQ_ALU_RL core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_RL };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_RLC];
extend SEQ_ALU_RLC core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_RLC };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_RR];
extend SEQ_ALU_RR core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_RR };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_RRC];
extend SEQ_ALU_RRC core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_RRC };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_CPL];
extend SEQ_ALU_CPL core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_CPL };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_COMP];
extend SEQ_ALU_COMP core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_COMP };
   };
};

extend core_alu_seq_kind_t: [SEQ_ALU_SWAP];
extend SEQ_ALU_SWAP core_alu_seq_s {
   // behavior
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == ALU_SWAP };
   };
};

'>
