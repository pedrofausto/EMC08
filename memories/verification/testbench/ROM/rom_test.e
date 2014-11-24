// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: rom_test.e
// Module Name: Memories
// Author: Thiago Santos
// E-mail: diga7@emc08.br
// -------------------------------------------------------------------
// Release History
// Version Date       Description
// 1.0     16/08/2010 Initial Version
// -------------------------------------------------------------------
// Keywords: rom, memory, tests
// -------------------------------------------------------------------
// Purpose:
// Class that instantiates tests that are gonna be applied
// -------------------------------------------------------------------
// Parameters:
// none
// -------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: none
// Other: none
// -------------------------------------------------------------------
// Features Tested: ROM Memory read operation
// -------------------------------------------------------------------
// Detailed Test Description:
// Loads a binary file into the ROM Functional Model and into the Re-
// ference Model and makes successive reads
// -------------------------------------------------------------------

<'
import pkt_config;

extend MAIN pkt_seq_s {
   !seq_read:  READ_ALL pkt_seq_s;
   
   post_generate() is also {
      message(LOW, me, " ");
   }; 
   
   body() @driver.clock is only  {
      do seq_read;
      stop_run();
   };
};
'>
