<' 
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_lib.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010  Initial version
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
// Local Functions: 
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend mc_seq_s {
   !pkt: mc_packet_type;
};

extend mc_seq_kind_t: [ RAND ];
extend RAND mc_seq_s {
   // behavior
   rand: uint (bits:2);

   keep soft rand == select {
     33: 2'b10;
     33: 2'b01;
     34: 2'b11;
   };
   

   body() @driver.clock is only {
      --message(LOW, ":: RANDOM_MODE - RANDOM_MODE signal occurs");
      do pkt keeping { .pkt_kind == RAND;
      			.ram_rd_i_b == rand[0:0];
			      .ram_wr_i_b == rand[1:1];
      		     };
      
   };
};
'>
