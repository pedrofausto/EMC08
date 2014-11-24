<' 
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_lib.e
// Module Name : top
// Author : Harney Acore_topahin
// E-mail : diga19@emc08.core_top
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, seq - sequence
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

extend top_seq_s {
   !pkt: top_signal_type;
   
   write_mem_rom (opcode:list of bit) is {
   //write_mem_rom (opcode:uint(bits:8)) is {
      
      //var test1: string;
      //unpack(packing.low, opcode, test1);
      
      var rom_file: file;
      var rom_line: string = append (opcode);
      rom_file=files.open("ROM4096X8.bin","w", "Rom Data");
      files.write (rom_file, rom_line);
      //files.write (rom_file, test1);
      files.close (rom_file);
   };
   
};

// sequence to generate the reset signals
extend top_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET top_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      out("A RESET signal occurs");
      do pkt keeping { .pkt_kind == RESET };
   };
};

extend top_seq_kind_t: [SEQ_DEFAULT];
extend SEQ_DEFAULT top_seq_s {
   body() @driver.clock is only {
      //out("A SEQ DEFAULT has been sent to DUT");
      do pkt keeping { .pkt_kind == DEFAULT };
   };
};

extend top_seq_kind_t: [SEQ_TRANSMISSION];
extend SEQ_TRANSMISSION top_seq_s {
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == TRANSMISSION };
   };
};

extend top_seq_kind_t: [SEQ_RECEPTION_MODE0];
extend SEQ_RECEPTION_MODE0 top_seq_s {
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == RECEPTION_MODE0 };
   };
};

extend top_seq_kind_t: [SEQ_RECEPTION_MODE2];
extend SEQ_RECEPTION_MODE2 top_seq_s {
   body() @driver.clock is only {
      do pkt keeping { .pkt_kind == RECEPTION_MODE2 };
   };
};

'>
