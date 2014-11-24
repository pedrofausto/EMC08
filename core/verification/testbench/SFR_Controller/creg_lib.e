<' 
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_lib.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, seq - sequence
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

extend creg_seq_s {
   !pkt: creg_signal_type;
};

//...0 
// sequence to generate the reset signals
extend creg_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET creg_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      out(">> A RESET signal occurs");
      do pkt keeping { .pkt_kind == RESET };
   };
};

//...1  
extend creg_seq_kind_t: [SEQ_ACC_CORE];
extend SEQ_ACC_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      out("In seq mode0");
      do pkt keeping { .pkt_kind == SEQ_ACC_CORE };
   };
};

//...2  
extend creg_seq_kind_t: [SEQ_B_CORE];
extend SEQ_B_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_B_CORE");
      do pkt keeping { .pkt_kind == SEQ_B_CORE };
   };
};

//...3  
extend creg_seq_kind_t: [SEQ_PSW_CORE];
extend SEQ_PSW_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_PSW_CORE");
      do pkt keeping { .pkt_kind == SEQ_PSW_CORE };
  };
};

//...4
extend creg_seq_kind_t: [SEQ_IP_CORE];
extend SEQ_IP_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_IP_CORE");
      do pkt keeping { .pkt_kind == SEQ_IP_CORE };
   };
};

//...5
extend creg_seq_kind_t: [SEQ_IE_CORE];
extend SEQ_IE_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_IE_CORE");
      do pkt keeping { .pkt_kind == SEQ_IE_CORE };
  };
};     

//...6
extend creg_seq_kind_t: [SEQ_RX0_CORE];
extend SEQ_RX0_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_RX0_CORE");
      do pkt keeping { .pkt_kind == SEQ_RX0_CORE };
   };
};

//...7
extend creg_seq_kind_t: [SEQ_RX1_CORE];
extend SEQ_RX1_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_RX1_CORE");
      do pkt keeping { .pkt_kind == SEQ_RX1_CORE };
  };
};

//...8
extend creg_seq_kind_t: [SEQ_TX0_CORE];
extend SEQ_TX0_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_TX0_CORE");
      do pkt keeping { .pkt_kind == SEQ_TX0_CORE };
   };
};

//...9
extend creg_seq_kind_t: [SEQ_TX1_CORE];
extend SEQ_TX1_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_TX1_CORE");
      do pkt keeping { .pkt_kind == SEQ_TX1_CORE };
  };
};

//...10  
extend creg_seq_kind_t: [SEQ_SMAP8_CORE];
extend SEQ_SMAP8_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_SMAP8_CORE");
      do pkt keeping { .pkt_kind == SEQ_SMAP8_CORE };
   };
};

//...11  
extend creg_seq_kind_t: [SEQ_DPH_CORE];
extend SEQ_DPH_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_DPH_CORE");
      do pkt keeping { .pkt_kind == SEQ_DPH_CORE };
   };
};

//...12  
extend creg_seq_kind_t: [SEQ_DPL_CORE];
extend SEQ_DPL_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_DPL_CORE");
      do pkt keeping { .pkt_kind == SEQ_DPL_CORE };
  };
};

//...13
extend creg_seq_kind_t: [SEQ_SP_CORE];
extend SEQ_SP_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_SP_CORE");
      do pkt keeping { .pkt_kind == SEQ_SP_CORE };
   };
};

//...14
extend creg_seq_kind_t: [SEQ_TH0_CORE];
extend SEQ_TH0_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_TH0_CORE");
      do pkt keeping { .pkt_kind == SEQ_TH0_CORE };
  };
};     

//...15
extend creg_seq_kind_t: [SEQ_TH1_CORE];
extend SEQ_TH1_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_TH1_CORE");
      do pkt keeping { .pkt_kind == SEQ_TH1_CORE };
   };
};

//...16
extend creg_seq_kind_t: [SEQ_TM0_CORE];
extend SEQ_TM0_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_TM0_CORE");
      do pkt keeping { .pkt_kind == SEQ_TM0_CORE };
  };
};

//...17
extend creg_seq_kind_t: [SEQ_TM1_CORE];
extend SEQ_TM1_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_TM1_CORE");
      do pkt keeping { .pkt_kind == SEQ_TM1_CORE };
   };
};

//...18
extend creg_seq_kind_t: [SEQ_TL0_CORE];
extend SEQ_TL0_CORE creg_seq_s {   
// behavior
  body() @driver.clock is only {
     message(LOW, ">> SEQ_TL0_CORE");
      do pkt keeping { .pkt_kind == SEQ_TL0_CORE };
  };
};

//...19
extend creg_seq_kind_t: [SEQ_TL1_CORE];
extend SEQ_TL1_CORE creg_seq_s {   
   // behavior
   body() @driver.clock is only {
      message(LOW, ">> SEQ_TL1_CORE");
      do pkt keeping { .pkt_kind == SEQ_TL1_CORE };
   };
};


'>
