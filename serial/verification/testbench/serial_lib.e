<' 
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_lib.e
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
// verificar sempre o signal type
extend serial_seq_s {
   !pkt: serial_signal_type;
};




   extend serial_seq_kind_t: [SEQ_RESET];
   extend SEQ_RESET serial_seq_s 
   {
      body() @driver.clock is only
      {
         message(LOW, ">> SEQ RESET:");
         do pkt keeping { .pkt_kind == RESET};
         
      };
   };

   extend serial_seq_kind_t: [SEQ_GEN_8B];
   extend SEQ_GEN_8B serial_seq_s 
   {
      body() @driver.clock is only
      {
         message(LOW, ">> SEQ GEN_8B:");
         do pkt keeping { .pkt_kind == GEN_8B};
         
      };
   };   
   
   extend serial_seq_kind_t: [SEQ_NO_RESET];
   extend SEQ_NO_RESET serial_seq_s 
   {
      body() @driver.clock is only
      {
         message(LOW, ">> SEQ NO_RESET:");
         do pkt keeping { .pkt_kind == NO_RESET};
      };
   };


'>
