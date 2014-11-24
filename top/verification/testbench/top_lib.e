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
   verbose: int;
   keep verbose == 0;
   
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

// sequence to generate the reset signals
extend top_seq_kind_t: [SEQ_DEFAULT];
extend SEQ_DEFAULT top_seq_s {
   body() @driver.clock is only {
      if (verbose == 1) {out("A SEQ DEFAULT has send to DUT");};
      do pkt keeping { .pkt_kind == DEFAULT };
   };
};

/////////////////////////  INTERRUPT Sequences ////////////////
extend top_seq_kind_t: [SEQ_NONE];
extend SEQ_NONE top_seq_s {
   body() @driver.clock is only {
      out("A SEQ_NONE has send");
      do pkt keeping {  .pkt_kind   == NONE 
      };
   };
};

extend top_seq_kind_t: [SEQ_INT_0_high];
extend SEQ_INT_0_high top_seq_s {
   body() @driver.clock is only {
      out("A SEQ_INT_0_high has send");
      do pkt keeping {  .pkt_kind   == SEQ_INT_0_high; 
                        .int_0      == 1'b1          
      };
   };
};

extend top_seq_kind_t: [SEQ_INT_0_low];
extend SEQ_INT_0_low top_seq_s {
   body() @driver.clock is only {
      out("A SEQ_INT_0_low has send");
      do pkt keeping { .pkt_kind == SEQ_INT_0_low; 
                       .int_0      == 1'b0          
      };
   };
};

extend top_seq_kind_t: [SEQ_INT_1_high];
extend SEQ_INT_1_high top_seq_s {
   body() @driver.clock is only {
      out("A SEQ_INT_1_high has send");
      do pkt keeping { .pkt_kind == SEQ_INT_1_high; 
                       .int_1      == 1'b1          
      };
   };
};

extend top_seq_kind_t: [SEQ_INT_1_low];
extend SEQ_INT_1_low top_seq_s {
   body() @driver.clock is only {
      out("A SEQ_INT_1_low has send");
      do pkt keeping { .pkt_kind == SEQ_INT_1_low; 
                       .int_0      == 1'b0          
      };
   };
};

extend top_seq_kind_t: [SEQ_INT_0_LEVEL];
extend SEQ_INT_0_LEVEL top_seq_s {
   !seq_int_0_low :SEQ_INT_0_low top_seq_s;
   !seq_int_0_high :SEQ_INT_0_high top_seq_s;
   body() @driver.clock is only {
      out("A SEQ_INT_0_LEVEL has send");
      do pkt keeping { .pkt_kind == SEQ_INT_0_LEVEL  };
      
      do seq_int_0_high;
      do seq_int_0_high;
      do seq_int_0_low;
      do seq_int_0_low;
      do seq_int_0_high;
      do seq_int_0_high;
      
   };
};

extend top_seq_kind_t: [SEQ_INT_0_TRAN];
extend SEQ_INT_0_TRAN top_seq_s {
   !seq_int_0_low :SEQ_INT_0_low top_seq_s;
   !seq_int_0_high :SEQ_INT_0_high top_seq_s;
   body() @driver.clock is only {
      out("A SEQ_INT_0_TRAN has send");
      do pkt keeping { .pkt_kind == SEQ_INT_0_TRAN  };
      
      do seq_int_0_high;
      do seq_int_0_low;
      do seq_int_0_high;
      
   };
};











'>
