<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_lib.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt, seq - sequence
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

extend int_seq_s {
   !pkt: int_signal_type;
};

// sequence to generate the reset signals
extend int_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET int_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      message(HIGH, ":: SEQ_RESET - A RESET signal occurs");
      do pkt keeping { .pkt_bit_kind == PKT_RESET };
   };
};

//Generates random values to input, keeping a low rate of changes:
//IP
extend int_seq_kind_t: [SEQ_RAND_IP];
extend SEQ_RAND_IP int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_IP");
      do pkt keeping { .pkt_kind == PKT_RAND_IP && .pkt_bit_kind == PKT_BIT_NOP};
   };
};

//Generates random values to input, keeping a low rate of changes:
//IE
extend int_seq_kind_t: [SEQ_RAND_IE];
extend SEQ_RAND_IE int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_IE");
      do pkt keeping { .pkt_kind == PKT_RAND_IE && .pkt_bit_kind == PKT_BIT_NOP};
   };
};
//Generates random values to input, keeping a low rate of changes:
//SCON
extend int_seq_kind_t: [SEQ_RAND_SCON];
extend SEQ_RAND_SCON int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_SCON");
      do pkt keeping { .pkt_kind == PKT_RAND_SCON && .pkt_bit_kind == PKT_BIT_NOP};
   };
};

//Generates random values to input, keeping a low rate of changes:
//TCON
extend int_seq_kind_t: [SEQ_RAND_TCON];
extend SEQ_RAND_TCON int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_TCON");
      do pkt keeping { .pkt_kind == PKT_RAND_TCON && .pkt_bit_kind == PKT_BIT_NOP};
   };
};

//Generates random values to input, keeping a low rate of changes:
//TCON2
extend int_seq_kind_t: [SEQ_RAND_TCON2];
extend SEQ_RAND_TCON2 int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_TCON2");
      do pkt keeping { .pkt_kind == PKT_RAND_TCON2 && .pkt_bit_kind == PKT_BIT_NOP};
   };
};

//Generates random values to input, keeping a low rate of changes:
//RDY
extend int_seq_kind_t: [SEQ_RAND_RDY];
extend SEQ_RAND_RDY int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_RDY");
      do pkt keeping { .pkt_bit_kind == PKT_RAND_RDY };
   };
};

//Generates random values to input, keeping a low rate of changes:
//NA
extend int_seq_kind_t: [SEQ_RAND_NA];
extend SEQ_RAND_NA int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_NA");
      do pkt keeping { .pkt_bit_kind == PKT_RAND_NA };
   };
};
   
//Generates random values to input, keeping a low rate of changes:
//INTEXT
extend int_seq_kind_t: [SEQ_RAND_INTEXT];
extend SEQ_RAND_INTEXT int_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_RAND_INTEXT");
      do pkt keeping { .pkt_bit_kind == PKT_RAND_INTEXT };
    };  
};

// Wait a machine cycle without change inputs
extend int_seq_kind_t: [SEQ_NOP];
extend SEQ_NOP int_seq_s {
   // behavior
   body() @driver.clock is only {
      message(HIGH, ":: SEQ_NOP - Wait a machine cycle without change inputs");
      do pkt keeping { .pkt_kind == PKT_NOP && .pkt_bit_kind == PKT_BIT_NOP};
   };
};


'>
