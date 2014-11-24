<' 
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_lib.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 12/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, seq - sequence
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

extend tmr2_seq_s {
   !pkt: tmr2_signal_type;
};

// sequence to generate the reset signals

extend tmr2_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET tmr2_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      out("Generating RESET sequence...\n");
      do pkt keeping { .pkt_kind == RESET };
   };
};

extend tmr2_seq_kind_t: [SEQ_FILTER_S2];
extend SEQ_FILTER_S2 tmr2_seq_s {   
   // behavior
   body() @driver.clock is only {
      out("Generating FILTER S2 sequence...\n");
      do pkt keeping { .pkt_kind == FILTER_S2 };
   };
};

extend tmr2_seq_kind_t: [SEQ_FILTER_S3];
extend SEQ_FILTER_S3 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating FILTER S3 sequence...\n");
      do pkt keeping { .pkt_kind == FILTER_S3 };
   };
};

extend tmr2_seq_kind_t: [SEQ_FALL_EDGE];
extend SEQ_FALL_EDGE tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating FALL EDGE sequence...\n");
      do pkt keeping { .pkt_kind == FALL_EDGE };
   };
};


extend tmr2_seq_kind_t: [SEQ_RISE_EDGE];
extend SEQ_RISE_EDGE tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating RISE EDGE sequence...\n");	
      do pkt keeping { .pkt_kind == RISE_EDGE };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_001];
extend SEQ_DFDIV_001 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:1 sequence...\n");
      do pkt keeping { .pkt_kind == DFDIV_001 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_002];
extend SEQ_DFDIV_002 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:2 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_002 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_004];
extend SEQ_DFDIV_004 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:4 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_004 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_008];
extend SEQ_DFDIV_008 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:8 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_008 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_016];
extend SEQ_DFDIV_016 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:16 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_016 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_032];
extend SEQ_DFDIV_032 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:32 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_032 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_064];
extend SEQ_DFDIV_064 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:64 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_064 };
   };
};


extend tmr2_seq_kind_t: [SEQ_DFDIV_128];
extend SEQ_DFDIV_128 tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
		out("Generating DIVISOR 1:128 sequence...\n");	
      do pkt keeping { .pkt_kind == DFDIV_128 };
   };
};



extend tmr2_seq_kind_t: [SEQ_SENSOR_MTS];
extend SEQ_SENSOR_MTS tmr2_seq_s {

//   !pht_period					: uint;
	
//   keep  pht_period	 in [8..150];
   
   body() @driver.clock is only {
		out("Generating MTS INPUT SENSOR sequence...\n");	
      do pkt keeping { .pkt_kind == SENSOR_MTS_ON };
     
      
  //    do pkt keeping { .pkt_kind == SENSOR_MTS_OFF };

      
   };
};


extend tmr2_seq_kind_t: [SEQ_TACPH];
extend SEQ_TACPH tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
      out("Generating TACP HIGH sequence...\n");  
      do pkt keeping { .pkt_kind == TACPH };
   };
};


extend tmr2_seq_kind_t: [SEQ_TACPL];
extend SEQ_TACPL tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
      out("Generating TACP LOW sequence...\n");  
      do pkt keeping { .pkt_kind == TACPL };
   };
};


extend tmr2_seq_kind_t: [SEQ_ACR_INC];
extend SEQ_ACR_INC tmr2_seq_s {
   // behavior
   body() @driver.clock is only {
      out("Generating ACR INCREMENT FLAG sequence...\n");  
      do pkt keeping { .pkt_kind == ACR_INC };
   };
};


'>
