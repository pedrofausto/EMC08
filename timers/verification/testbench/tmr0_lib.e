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

extend tmr0_seq_s {
   !pkt: tmr0_signal_type;

};

// sequence to generate the reset signals

extend tmr0_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET tmr0_seq_s {

   delay_var : int;
	
	keep soft delay_var == 2;
	
   body() @driver.clock is only {
      // wait [some_delay];
		out("-----------------------------------------\n");
      out("Generating RESET sequence...\n");
		print sys.time;
      do pkt keeping {	.pkt_kind == RESET};
		out("\n");
		
   };
};

extend tmr0_seq_kind_t: [SEQ_STOP];
extend SEQ_STOP tmr0_seq_s {   
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
      out("Generating STOP sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == STOP };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_START];
extend SEQ_START tmr0_seq_s {   
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
      out("Generating STOP sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == START };
		out("\n");
   };
};

//--------------------------------SEQ UP------------------------------

extend tmr0_seq_kind_t: [SEQ_UP_COUNT];
extend SEQ_UP_COUNT tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating UP COUNT sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == UP_COUNT };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_UP_OVER_COUNT];
extend SEQ_UP_OVER_COUNT tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating UP OVER sequence...\n");	
		print sys.time;
      do pkt keeping { .pkt_kind == UP_COUNT_OVER };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_UP_COUNT_EXT];
extend SEQ_UP_COUNT_EXT tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating EXTERNAL UP COUNT sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == UP_COUNT_EXT };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_UP_COUNT_EXT_OVER];
extend SEQ_UP_COUNT_EXT_OVER tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating EXTERNAL UP COUNT OVER sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == UP_COUNT_EXT_OVER };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_UP_LOW_OVER];
extend SEQ_UP_LOW_OVER tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating UP LOW OVER sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == UP_LOW_OVER };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_UP_MED_OVER];
extend SEQ_UP_MED_OVER tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating UP COUNT MEDIUM sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == UP_MED_OVER };
		out("\n");
   };
};

//--------------------------------SEQ UP------------------------------

extend tmr0_seq_kind_t: [SEQ_DOWN_COUNT];
extend SEQ_DOWN_COUNT tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating DOWN COUNT sequence...\n");
		print sys.time;	
      do pkt keeping { .pkt_kind == DOWN_COUNT };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_DOWN_OVER_COUNT];
extend SEQ_DOWN_OVER_COUNT tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating DOWN OVER sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == DOWN_COUNT_OVER };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_DOWN_COUNT_EXT];
extend SEQ_DOWN_COUNT_EXT tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating EXTERNAL DOWN COUNT sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == DOWN_COUNT_EXT };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_DOWN_COUNT_EXT_OVER];
extend SEQ_DOWN_COUNT_EXT_OVER tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating EXTERNAL DOWN COUNT OVER sequence...\n");
		print sys.time;	
       do pkt keeping { .pkt_kind == DOWN_COUNT_EXT_OVER };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_DOWN_MED_OVER];
extend SEQ_UP_MED_OVER tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating DOWN LOW MED sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == DOWN_MED_OVER };
		out("\n");
   };
};

extend tmr0_seq_kind_t: [SEQ_DOWN_HIGH_OVER];
extend SEQ_DOWN_HIGH_OVER tmr0_seq_s {
   // behavior
   body() @driver.clock is only {
		out("-----------------------------------------\n");
		out("Generating  DOWN COUNT HIGH sequence...\n");
		print sys.time;
      do pkt keeping { .pkt_kind == DOWN_HIGH_OVER };
		out("\n");
   };
};
'>
