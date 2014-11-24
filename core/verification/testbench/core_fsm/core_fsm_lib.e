<' 
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_lib.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.core_fsm, diga19@emc08.core_fsm
// -----------------------------------------------------------------------------
// Review(s) : 02/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, seq - sequence
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

extend core_fsm_seq_s {
   !pkt: core_fsm_signal_type;
   verbose1: int;
   keep verbose1 == 0;
   
};

// sequence to generate the reset signals
extend core_fsm_seq_kind_t: [SEQ_RESET];
extend SEQ_RESET core_fsm_seq_s {
   body() @driver.clock is only {
      // wait [some_delay];
      if (verbose1 == 1) { out("A RESET signal occurs"); };
      do pkt keeping { .pkt_kind == RESET };
   };
};

//sequence with rand instruction and interrupt on
extend core_fsm_seq_kind_t: [SEQ_INST_INTERRUPT_ON]; // 8'h12
extend SEQ_INST_INTERRUPT_ON core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_data1: uint (bits:8);
   !opcode: core_fsm_signal_type_kind_t;
   !int_vect_rand: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
   gen rom_data1;   
   gen int_vect_rand;
   gen opcode;
   while (opcode == RESET) {gen opcode;}; 
   while (int_vect_rand == 3'b000) {gen int_vect_rand;}; 
      if (verbose1 == 1) { out("SEQ_INST_INTERRUPT_ON send"); };
      do pkt keeping { .rom_data_opcode    == opcode.as_a(instruction_set_t); 
                       .pkt_kind           == opcode;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;
                       .int_vect           == int_vect_rand //force a LCALL LCALL};
     };
   };
};

// sequence with rand instruction and rand interrupt
extend core_fsm_seq_kind_t: [SEQ_INST_INT_RAND]; // 8'h12
extend SEQ_INST_INT_RAND core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_data1: uint (bits:8);
   !opcode: core_fsm_signal_type_kind_t;
   !int_vect_rand: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
   gen rom_data1;   
   gen int_vect_rand;
   gen opcode;
   while (opcode == RESET) {gen opcode;}; 
      if (verbose1 == 1) { out("SEQ_INST_INT_RAND send"); };
      do pkt keeping { .rom_data_opcode    == opcode.as_a(instruction_set_t); 
                       .pkt_kind           == opcode;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;
                       .int_vect           == int_vect_rand //force a LCALL LCALL};
     };
   };
};

// sequence with random instruction with interrupt off
extend core_fsm_seq_kind_t: [SEQ_INST_RAND]; 
extend SEQ_INST_RAND core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_data1: uint (bits:8);
   !opcode: core_fsm_signal_type_kind_t;
   //!opcode_aux: uint(bits:8);
   body() @driver.clock is only {
   gen rom_data;
   gen rom_data1;
   gen opcode;
   while (opcode == RESET) {gen opcode;};    
      if (verbose1 == 1) { out("Instruction rand send - opcode ",opcode); };
      if (verbose1 == 1) { out("opcode ", opcode.as_a(instruction_set_t)); };
      if (verbose1 == 1) { out("opcode ",opcode); };
      do pkt keeping { .rom_data_opcode    == opcode.as_a(instruction_set_t); 
                       .pkt_kind           == opcode;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

///////////////////////// sequences to the feature 3 - to verify the interrupt treatment
extend core_fsm_seq_kind_t: [SEQ_INST_RAND_INST_RETI];
extend SEQ_INST_NOP core_fsm_seq_s {
   
   !seq_inst_rand: SEQ_INST_RAND core_fsm_seq_s;
   !seq_inst_reti: SEQ_INST_RETI core_fsm_seq_s;
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SEQ_INST_RAND_INST_RETI instruction send"); };
      do seq_inst_rand;
      do seq_inst_reti; 
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_TWO_CYCLES];
extend SEQ_INST_TWO_CYCLES core_fsm_seq_s {
   !opcode: inst_two_cycles;   
   !rom_data: uint(bits:8);
   !rom_data1: uint(bits:8);
   body() @driver.clock is only {
      gen opcode;
      gen rom_data;
      gen rom_data1;
      if (verbose1 == 1) { out("SEQ_INST_RAND_INST_RETI instruction send"); };
      do pkt keeping { .rom_data_opcode    == opcode.as_a(instruction_set_t); 
                       .pkt_kind           == opcode.as_a(core_fsm_signal_type_kind_t);
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;
                       .int_vect           == 3'd0 //avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_TWO_CYCLES_RAND_INTERRUPT];
extend SEQ_INST_TWO_CYCLES_RAND_INTERRUPT core_fsm_seq_s {
   !opcode: inst_two_cycles;   
   !rom_data: uint(bits:8);
   !rom_data1: uint(bits:8);
   !int_vect_rand: uint (bits:3);
   body() @driver.clock is only {
      gen opcode;
      gen rom_data;
      gen rom_data1;
      gen int_vect_rand;
      if (verbose1 == 1) { out("SEQ_INST_TWO_CYCLES_RAND_INTERRUPT instruction send"); };
      do pkt keeping { .rom_data_opcode    == opcode.as_a(instruction_set_t); 
                        .pkt_kind           == opcode.as_a(core_fsm_signal_type_kind_t);
                        .rom_data_byte1     == rom_data;
                        .rom_data_byte2     == rom_data1;
                        .int_vect           == int_vect_rand //avoid LCALL
      };
   };
};


///////////////////////// INSTRUCTION SET SEQUENCES ///////////
// this instrution need only the opcode. All other values
// are random 8'h00
extend core_fsm_seq_kind_t: [SEQ_INST_NOP];
extend SEQ_INST_NOP core_fsm_seq_s {
   body() @driver.clock is only {
         // wait [some_delay];
         if (verbose1 == 1) { out("NOP instruction send"); };
         do pkt keeping { .rom_data_opcode    == NOP; 
                       .pkt_kind           == NOP;
                       .int_vect           == 3'd0 //avoid LCALL
         };
      };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_1]; //8'h01
extend SEQ_INST_AJMP_1 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_1; 
                       .pkt_kind           == AJMP_1;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_LJMP]; //8'h02
extend SEQ_INST_LJMP core_fsm_seq_s {
   !rom_data: uint (bits:8);
   !rom_data1: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
   gen rom_data1;   
      if (verbose1 == 1) { out("AJMP_1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == LJMP; 
                       .pkt_kind           == LJMP;
                       //.inst_len           == 3;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_RR_A]; // 8'h3
extend SEQ_INST_RR_A core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("RR_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == RR_A; 
                       .pkt_kind           == RR_A;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_A]; // 8'h4
extend SEQ_INST_INC_A core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("INC_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_A; 
                       .pkt_kind           == INC_A;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_D]; // 8'h5
extend SEQ_INST_INC_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("INC_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_D; 
                       .pkt_kind           == INC_D;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_ATR0]; // 8'h6
extend SEQ_INST_INC_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_ATR0; 
                       .pkt_kind           == INC_ATR0;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_ATR1]; // 8'h7
extend SEQ_INST_INC_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_ATR1; 
                       .pkt_kind           == INC_ATR1;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R0]; // 8'h8
extend SEQ_INST_INC_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R0; 
                       .pkt_kind           == INC_R0;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R1]; // 8'h9
extend SEQ_INST_INC_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R1; 
                       .pkt_kind           == INC_R1;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R2]; // 8'hA
extend SEQ_INST_INC_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R2; 
                       .pkt_kind           == INC_R2;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R3]; // 8'hB
extend SEQ_INST_INC_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R3; 
                       .pkt_kind           == INC_R3;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R4]; // 8'hC
extend SEQ_INST_INC_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R4; 
                       .pkt_kind           == INC_R4;
                       //.inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R5]; // 8'hD
extend SEQ_INST_INC_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R5; 
                       .pkt_kind           == INC_R5;
                      // .inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R6]; // 8'hE
extend SEQ_INST_INC_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R6; 
                       .pkt_kind           == INC_R6;
                      // .inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_R7]; // 8'hF
extend SEQ_INST_INC_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_R7; 
                       .pkt_kind           == INC_R7;
                      // .inst_len           == 1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_JBC]; // 8'h10
extend SEQ_INST_JBC core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !bit_en: bit ;
   !offset: uint (bits:8);
   
   body() @driver.clock is only {
   gen rom_data;
   gen bit_en;
   gen offset;
      if (verbose1 == 1) { out("JBC instruction send"); };
      do pkt keeping { .rom_data_opcode    == JBC; //8'h10 
                       .pkt_kind           == JBC;
                      // .inst_len           == 3;
                       .rom_data_byte1     == %{rom_data[7:1],bit_en};
                       .rom_data_byte2     == offset;
                       .int_vect           == 3'd0 //avoid LCALL};
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_1]; // 8'h11
extend SEQ_INST_ACALL_1 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_1; //8'h11 
                       .pkt_kind           == ACALL_1;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_LCALL]; // 8'h12
extend SEQ_INST_LCALL core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_data1: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;
   gen rom_data1;   
      if (verbose1 == 1) { out("LCALL instruction send"); };
      do pkt keeping { .rom_data_opcode    == LCALL; 
                       .pkt_kind           == LCALL;
                       //.inst_len           == 3;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_RRC_A]; // 8'h13
extend SEQ_INST_RRC_A core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("RRC_A instruction send"); };
      do pkt keeping { .rom_data_opcode == RRC_A; 
                       .pkt_kind        == RRC_A;
                       //.inst_len        == 2;
                       .rom_data_byte1  == rom_data;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_A]; // 8'h14
extend SEQ_INST_DEC_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_A instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_A; 
                       .pkt_kind        == DEC_A;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_D]; // 8'h15
extend SEQ_INST_DEC_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("DEC_D instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_D; 
                       .pkt_kind        == DEC_D;
                       .rom_data_byte1  == rom_data;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_ATR0]; // 8'h16
extend SEQ_INST_DEC_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_ATR0; 
                       .pkt_kind        == DEC_ATR0;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_ATR1]; // 8'h17
extend SEQ_INST_DEC_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_ATR1; 
                       .pkt_kind        == DEC_ATR1;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R0]; // 8'h18
extend SEQ_INST_DEC_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R0; 
                       .pkt_kind        == DEC_R0;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R1]; // 8'h19
extend SEQ_INST_DEC_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R1; 
                       .pkt_kind        == DEC_R1;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R2]; // 8'h1A
extend SEQ_INST_DEC_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R2; 
                       .pkt_kind        == DEC_R2;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R3]; // 8'h1B
extend SEQ_INST_DEC_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R3; 
                       .pkt_kind        == DEC_R3;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R4]; // 8'h1C
extend SEQ_INST_DEC_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R4; 
                       .pkt_kind        == DEC_R4;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R5]; // 8'h1D
extend SEQ_INST_DEC_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R5; 
                       .pkt_kind        == DEC_R5;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R6]; // 8'h1E
extend SEQ_INST_DEC_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R6; 
                       .pkt_kind        == DEC_R6;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DEC_R7]; // 8'h1F
extend SEQ_INST_DEC_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DEC_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode == DEC_R7; 
                       .pkt_kind        == DEC_R7;
                       .int_vect        == 3'd0 // avoid LCALL
      };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_JB]; // 8'h20
extend SEQ_INST_JB core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !offset: uint (bits:8);
   
   body() @driver.clock is only {
   gen rom_data;
   gen offset;
      if (verbose1 == 1) { out("JB instruction send"); };
      do pkt keeping { .rom_data_opcode    == JB; //8'h20 
                       .pkt_kind           == JB;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == offset;
                       .int_vect           == 3'd0 //avoid LCALL};
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_2]; //8'h21
extend SEQ_INST_AJMP_2 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_2; 
                       .pkt_kind           == AJMP_2;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_RET]; // 8'h22
extend SEQ_INST_RET core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("RET instruction send"); };
      do pkt keeping { .rom_data_opcode    == RET; 
                       .pkt_kind           == RET;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_RL_A]; // 8'h22
extend SEQ_INST_RL_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("RL_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == RL_A; 
                       .pkt_kind           == RL_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_DATA]; // 8'h24
extend SEQ_INST_ADD_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ADD_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_DATA; 
                       .pkt_kind           == ADD_A_DATA;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_D]; // 8'h25
extend SEQ_INST_ADD_A_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ADD_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_D; 
                       .pkt_kind           == ADD_A_D;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_ATR0]; // 8'h26
extend SEQ_INST_ADD_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_ATR0; 
                       .pkt_kind           == ADD_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_ATR1]; // 8'h27
extend SEQ_INST_ADD_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_ATR1; 
                       .pkt_kind           == ADD_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R0]; // 8'h28
extend SEQ_INST_ADD_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R0; 
                       .pkt_kind           == ADD_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R1]; // 8'h29
extend SEQ_INST_ADD_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R1; 
                       .pkt_kind           == ADD_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R2]; // 8'h2A
extend SEQ_INST_ADD_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R2; 
                       .pkt_kind           == ADD_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R3]; // 8'h2B
extend SEQ_INST_ADD_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R3; 
                       .pkt_kind           == ADD_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R4]; // 8'h2C
extend SEQ_INST_ADD_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R4; 
                       .pkt_kind           == ADD_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R5]; // 8'h2D
extend SEQ_INST_ADD_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R5; 
                       .pkt_kind           == ADD_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R6]; // 8'h2E
extend SEQ_INST_ADD_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R6; 
                       .pkt_kind           == ADD_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADD_A_R7]; // 8'h2F
extend SEQ_INST_ADD_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADD_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADD_A_R7; 
                       .pkt_kind           == ADD_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_JNB]; // 8'h30
extend SEQ_INST_JNB core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !bit_en: bit ;
   !offset: uint (bits:8);
   
   body() @driver.clock is only {
   gen rom_data;
   gen bit_en;
   gen offset;
      if (verbose1 == 1) { out("JNB instruction send"); };
      do pkt keeping { .rom_data_opcode    == JNB; //8'h10 
                       .pkt_kind           == JNB;
                       .rom_data_byte1     == %{rom_data[7:1],bit_en};
                       .rom_data_byte2     == offset;
                       .int_vect           == 3'd0 //avoid LCALL};
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_2]; // 8'h31
extend SEQ_INST_ACALL_2 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_2; //8'h11 
                       .pkt_kind           == ACALL_2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_RETI]; // 8'h32
extend SEQ_INST_RETI core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("RETI instruction send"); };
      do pkt keeping { .rom_data_opcode    == RETI; 
                       .pkt_kind           == RETI;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_RLC_A]; // 8'h33
extend SEQ_INST_RLC_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("RLC_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == RLC_A; 
                       .pkt_kind           == RLC_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_DATA]; // 8'h34
extend SEQ_INST_ADDC_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ADDC_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_DATA; 
                       .pkt_kind           == ADDC_A_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_D]; // 8'h35
extend SEQ_INST_ADDC_A_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ADDC_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_D; 
                       .pkt_kind           == ADDC_A_D;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_ATR0]; // 8'h36
extend SEQ_INST_ADDC_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_ATR0; 
                       .pkt_kind           == ADDC_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_ATR1]; // 8'h37
extend SEQ_INST_ADDC_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_ATR1; 
                       .pkt_kind           == ADDC_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R0]; // 8'h38
extend SEQ_INST_ADDC_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R0; 
                       .pkt_kind           == ADDC_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R1]; // 8'h39
extend SEQ_INST_ADDC_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R1; 
                       .pkt_kind           == ADDC_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R2]; // 8'h3A
extend SEQ_INST_ADDC_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R2; 
                       .pkt_kind           == ADDC_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R3]; // 8'h3B
extend SEQ_INST_ADDC_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R3; 
                       .pkt_kind           == ADDC_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R4]; // 8'h3C
extend SEQ_INST_ADDC_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R4; 
                       .pkt_kind           == ADDC_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R5]; // 8'h3D
extend SEQ_INST_ADDC_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R5; 
                       .pkt_kind           == ADDC_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R6]; // 8'h3E
extend SEQ_INST_ADDC_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R6; 
                       .pkt_kind           == ADDC_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ADDC_A_R7]; // 8'h3F
extend SEQ_INST_ADDC_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ADDC_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ADDC_A_R7; 
                       .pkt_kind           == ADDC_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_JC]; // 8'h40
extend SEQ_INST_JC core_fsm_seq_s {
   !offset: uint (bits:8);
   body() @driver.clock is only {
   gen offset;
      if (verbose1 == 1) { out("JC instruction send"); };
      do pkt keeping { .rom_data_opcode    == JC; //8'h10 
                       .pkt_kind           == JC;
                       .rom_data_byte1     == offset;
                       .int_vect           == 3'd0 //avoid LCALL};
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_3]; //8'h41
extend SEQ_INST_AJMP_3 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_3; 
                       .pkt_kind           == AJMP_3;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_D_A]; //8'h42
extend SEQ_INST_ORL_D_A core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ORL_D_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_D_A; 
                       .pkt_kind           == ORL_D_A;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_D_DATA]; //8'h43
extend SEQ_INST_ORL_D_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ORL_D_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_D_DATA; 
                       .pkt_kind           == ORL_D_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_DATA]; //8'h44
extend SEQ_INST_ORL_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ORL_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_DATA; 
                       .pkt_kind           == ORL_A_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_D]; //8'h45
extend SEQ_INST_ORL_A_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ORL_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_D; 
                       .pkt_kind           == ORL_A_D;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_ATR0]; //8'h46
extend SEQ_INST_ORL_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_ATR0; 
                       .pkt_kind           == ORL_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_ATR1]; //8'h47
extend SEQ_INST_ORL_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_ATR1; 
                       .pkt_kind           == ORL_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R0]; //8'h48
extend SEQ_INST_ORL_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R0; 
                       .pkt_kind           == ORL_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R1]; //8'h49
extend SEQ_INST_ORL_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R1; 
                       .pkt_kind           == ORL_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R2]; //8'h4A
extend SEQ_INST_ORL_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R2; 
                       .pkt_kind           == ORL_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R3]; //8'h4B
extend SEQ_INST_ORL_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R3; 
                       .pkt_kind           == ORL_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R4]; //8'h4C
extend SEQ_INST_ORL_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R4; 
                       .pkt_kind           == ORL_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R5]; //8'h4D
extend SEQ_INST_ORL_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R5; 
                       .pkt_kind           == ORL_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R6]; //8'h4E
extend SEQ_INST_ORL_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R6; 
                       .pkt_kind           == ORL_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ORL_A_R7]; //8'h4F
extend SEQ_INST_ORL_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ORL_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_A_R7; 
                       .pkt_kind           == ORL_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_JNC]; // 8'h50
extend SEQ_INST_JNC core_fsm_seq_s {
   !offset: uint (bits:8);
   body() @driver.clock is only {
   gen offset;
      if (verbose1 == 1) { out("JNC instruction send"); };
      do pkt keeping { .rom_data_opcode    == JNC; //8'h10 
                       .pkt_kind           == JNC;
                       .rom_data_byte1     == offset;
                       .int_vect           == 3'd0 //avoid LCALL};
      };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_3]; // 8'h51
extend SEQ_INST_ACALL_3 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_3; //8'h11 
                       .pkt_kind           == ACALL_3;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_D_A]; //8'h52
extend SEQ_INST_ANL_D_A core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ANL_D_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_D_A; 
                       .pkt_kind           == ANL_D_A;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_D_DATA]; //8'h53
extend SEQ_INST_ANL_D_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ANL_D_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_D_DATA; 
                       .pkt_kind           == ANL_D_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_DATA]; //8'h54
extend SEQ_INST_ANL_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ANL_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_DATA; 
                       .pkt_kind           == ANL_A_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_D]; //8'h45
extend SEQ_INST_ANL_A_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("ANL_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_D; 
                       .pkt_kind           == ANL_A_D;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_ATR0]; //8'h56
extend SEQ_INST_ANL_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_ATR0; 
                       .pkt_kind           == ANL_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_ATR1]; //8'h57
extend SEQ_INST_ANL_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_ATR1; 
                       .pkt_kind           == ANL_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R0]; //8'h58
extend SEQ_INST_ANL_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R0; 
                       .pkt_kind           == ANL_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R1]; //8'h59
extend SEQ_INST_ANL_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R1; 
                       .pkt_kind           == ANL_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R2]; //8'h5A
extend SEQ_INST_ANL_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R2; 
                       .pkt_kind           == ANL_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R3]; //8'h5B
extend SEQ_INST_ANL_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R3; 
                       .pkt_kind           == ANL_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R4]; //8'h5C
extend SEQ_INST_ANL_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R4; 
                       .pkt_kind           == ANL_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R5]; //8'h5D
extend SEQ_INST_ANL_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R5; 
                       .pkt_kind           == ANL_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R6]; //8'h5E
extend SEQ_INST_ANL_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R6; 
                       .pkt_kind           == ANL_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_A_R7]; //8'h5F
extend SEQ_INST_ANL_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("ANL_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_A_R7; 
                       .pkt_kind           == ANL_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_D_A]; //8'h62
extend SEQ_INST_XRL_D_A core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("XRL_D_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_D_A; 
                       .pkt_kind           == XRL_D_A;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_D_DATA]; //8'h63
extend SEQ_INST_XRL_D_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("XRL_D_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_D_DATA; 
                       .pkt_kind           == XRL_D_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_DATA]; //8'h64
extend SEQ_INST_XRL_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("XRL_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_DATA; 
                       .pkt_kind           == XRL_A_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_D]; //8'h65
extend SEQ_INST_XRL_A_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("XRL_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_D; 
                       .pkt_kind           == XRL_A_D;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_ATR0]; //8'h66
extend SEQ_INST_XRL_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_ATR0; 
                       .pkt_kind           == XRL_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_ATR1]; //8'h67
extend SEQ_INST_XRL_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_ATR1; 
                       .pkt_kind           == XRL_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R0]; //8'h68
extend SEQ_INST_XRL_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R0; 
                       .pkt_kind           == XRL_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R1]; //8'h69
extend SEQ_INST_XRL_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R1; 
                       .pkt_kind           == XRL_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R2]; //8'h6A
extend SEQ_INST_XRL_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R2; 
                       .pkt_kind           == XRL_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R3]; //8'h6B
extend SEQ_INST_XRL_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R3; 
                       .pkt_kind           == XRL_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R4]; //8'h6C
extend SEQ_INST_XRL_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R4; 
                       .pkt_kind           == XRL_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R5]; //8'h6D
extend SEQ_INST_XRL_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R5; 
                       .pkt_kind           == XRL_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R6]; //8'h6E
extend SEQ_INST_XRL_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R6; 
                       .pkt_kind           == XRL_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XRL_A_R7]; //8'h6F
extend SEQ_INST_XRL_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XRL_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XRL_A_R7; 
                       .pkt_kind           == XRL_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_4]; // 8'h71
extend SEQ_INST_ACALL_4 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_4; //8'h11 
                       .pkt_kind           == ACALL_4;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_5]; // 8'hB1
extend SEQ_INST_ACALL_5 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_5; //8'h11 
                       .pkt_kind           == ACALL_5;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_6]; // 8'hD1
extend SEQ_INST_ACALL_6 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_6; //8'h11 
                       .pkt_kind           == ACALL_6;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_7]; // 8'hD1
extend SEQ_INST_ACALL_7 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_7; //8'h11 
                       .pkt_kind           == ACALL_7;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ACALL_8]; // 8'hF1
extend SEQ_INST_ACALL_8 core_fsm_seq_s {
   !rom_data:  uint (bits:8);
   !rom_3bits_high: uint (bits:3);
   body() @driver.clock is only {
   gen rom_data;
      if (verbose1 == 1) { out("ACALL_8 instruction send"); };
      do pkt keeping { .rom_data_opcode    == ACALL_8; //8'h11 
                       .pkt_kind           == ACALL_8;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};



extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_DATA]; // 8'h94
extend SEQ_INST_SUBB_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("SUB_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_DATA; 
                       .pkt_kind           == SUBB_A_DATA;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_D]; // 8'h95
extend SEQ_INST_SUBB_A_D core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("SUB_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_D; 
                       .pkt_kind           == SUBB_A_D;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_ATR0]; //8'h96
extend SEQ_INST_SUBB_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_ATR0; 
                       .pkt_kind           == SUBB_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_ATR1]; //8'h97
extend SEQ_INST_SUBB_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_ATR1; 
                       .pkt_kind           == SUBB_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R0]; //8'h98
extend SEQ_INST_SUBB_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R0; 
                       .pkt_kind           == SUBB_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R1]; //8'h99
extend SEQ_INST_SUBB_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R1; 
                       .pkt_kind           == SUBB_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R2]; //8'h9A
extend SEQ_INST_SUBB_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R2; 
                       .pkt_kind           == SUBB_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R3]; //8'h9B
extend SEQ_INST_SUBB_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R3; 
                       .pkt_kind           == SUBB_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R4]; //8'h9C
extend SEQ_INST_SUBB_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R4; 
                       .pkt_kind           == SUBB_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R5]; //8'h9D
extend SEQ_INST_SUBB_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R5; 
                       .pkt_kind           == SUBB_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R6]; //8'h9E
extend SEQ_INST_SUBB_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R6; 
                       .pkt_kind           == SUBB_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SUBB_A_R7]; //8'h9F
extend SEQ_INST_SUBB_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SUBB_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == SUBB_A_R7; 
                       .pkt_kind           == SUBB_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_BIT_C]; //8'h92
extend SEQ_INST_MOV_BIT_C core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
      gen rom_data;  
      if (verbose1 == 1) { out("MOV_BIT_C instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_BIT_C; 
                       .pkt_kind           == MOV_BIT_C;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_C_BIT]; //8'hA2
extend SEQ_INST_MOV_C_BIT core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
      gen rom_data;  
      if (verbose1 == 1) { out("MOV_C_BIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_C_BIT; 
                       .pkt_kind           == MOV_C_BIT;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_INC_DPTR]; //8'hA3
extend SEQ_INST_INC_DPTR core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("INC_DPTR instruction send"); };
      do pkt keeping { .rom_data_opcode    == INC_DPTR; 
                       .pkt_kind           == INC_DPTR;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MUL_AB]; //8'hA4
extend SEQ_INST_MUL_AB core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
      gen rom_data;  
      if (verbose1 == 1) { out("MUL_AB instruction send"); };
      do pkt keeping { .rom_data_opcode    == MUL_AB; 
                       .pkt_kind           == MUL_AB;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DIV_AB]; //8'hA4
extend SEQ_INST_DIV_AB core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
      gen rom_data;  
      if (verbose1 == 1) { out("DIV_AB instruction send"); };
      do pkt keeping { .rom_data_opcode    == DIV_AB; 
                       .pkt_kind           == DIV_AB;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};



extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_DATA]; // 8'h74
extend SEQ_INST_MOV_A_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);

   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_DATA; 
                       .pkt_kind           == MOV_A_DATA;
                      // .inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_DATA]; // 8'h75
extend SEQ_INST_MOV_D_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);

   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_DATA; 
                       .pkt_kind           == MOV_D_DATA;
                      // .inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_ATR0_DATA]; // 8'h76
extend SEQ_INST_MOV_ATR0_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_ATR0_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_ATR0_DATA; 
                       .pkt_kind           == MOV_ATR0_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_ATR1_DATA]; // 8'h77
extend SEQ_INST_MOV_ATR1_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_ATR1_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_ATR1_DATA; 
                       .pkt_kind           == MOV_ATR1_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R0_DATA]; // 8'h78
extend SEQ_INST_MOV_R0_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R0_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R0_DATA; 
                       .pkt_kind           == MOV_R0_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R1_DATA]; // 8'h79
extend SEQ_INST_MOV_R1_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R1_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R1_DATA; 
                       .pkt_kind           == MOV_R1_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};
extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R2_DATA]; // 8'h7A
extend SEQ_INST_MOV_R2_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R2_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R2_DATA; 
                       .pkt_kind           == MOV_R2_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R3_DATA]; // 8'h7B
extend SEQ_INST_MOV_R3_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R3_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R3_DATA; 
                       .pkt_kind           == MOV_R3_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R4_DATA]; // 8'h7C
extend SEQ_INST_MOV_R4_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R4_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R4_DATA; 
                       .pkt_kind           == MOV_R4_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R5_DATA]; // 8'h7D
extend SEQ_INST_MOV_R5_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R5_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R5_DATA; 
                       .pkt_kind           == MOV_R5_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R6_DATA]; // 8'h7E
extend SEQ_INST_MOV_R6_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R6_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R6_DATA; 
                       .pkt_kind           == MOV_R6_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R7_DATA]; // 8'h7F
extend SEQ_INST_MOV_R7_DATA core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("MOV_R7_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R7_DATA; 
                       .pkt_kind           == MOV_R7_DATA;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_4]; //8'h61
extend SEQ_INST_AJMP_4 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_4; 
                       .pkt_kind           == AJMP_4;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_5]; //8'h81
extend SEQ_INST_AJMP_5 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_5; 
                       .pkt_kind           == AJMP_5;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_6]; //8'hA1
extend SEQ_INST_AJMP_6 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_6; 
                       .pkt_kind           == AJMP_6;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_7]; //8'hC1
extend SEQ_INST_AJMP_7 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_7; 
                       .pkt_kind           == AJMP_7;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_AJMP_8]; //8'hE1
extend SEQ_INST_AJMP_8 core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("AJMP_8 instruction send"); };
      do pkt keeping { .rom_data_opcode    == AJMP_8; 
                       .pkt_kind           == AJMP_8;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};



extend core_fsm_seq_kind_t: [SEQ_INST_SJMP]; // 8'h80
extend SEQ_INST_SJMP core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("SJMP instruction send"); };
      do pkt keeping { .rom_data_opcode    == SJMP; 
                       .pkt_kind           == SJMP;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_PUSH]; // 8'hC0
extend SEQ_INST_PUSH core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("PUSH instruction send"); };
      do pkt keeping { .rom_data_opcode    == PUSH; 
                       .pkt_kind           == PUSH;
                       ///.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_POP]; // 8'hD0
extend SEQ_INST_POP core_fsm_seq_s {
   !rom_data: uint (bits:8);
   body() @driver.clock is only {
   gen rom_data;   
      if (verbose1 == 1) { out("POP instruction send"); };
      do pkt keeping { .rom_data_opcode    == POP; 
                       .pkt_kind           == POP;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_JZ]; // 8'h60
extend SEQ_INST_JZ core_fsm_seq_s {
   !rom_data : uint (bits:8);
   !ac_data  : uint (bits:8);
   keep soft rom_data in [4..20];
   keep soft ac_data == select {
      40: 0;
      60: [0..200];
   };

   body() @driver.clock is only {
      gen rom_data;
      gen ac_data;
      if (verbose1 == 1) { out("SEQ_INST_JZ instruction send"); };
      do pkt keeping { .rom_data_opcode    == JZ; 
                       .pkt_kind           == JZ;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .sfr_data           == ac_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};
// ----------------------------------------------------------------------------
extend core_fsm_seq_kind_t: [SEQ_INST_JNZ]; // 8'h70
extend SEQ_INST_JNZ core_fsm_seq_s {
   !rom_data : uint (bits:8);
   !ac_data  : uint (bits:8);
   keep soft rom_data in [4..20];
   keep soft ac_data == select {
      40: 0;
      60: [0..200];
   };

   body() @driver.clock is only {
      gen rom_data;
      gen ac_data;
      if (verbose1 == 1) { out("SEQ_INST_JNZ instruction send"); };
      do pkt keeping { .rom_data_opcode    == JNZ; 
                       .pkt_kind           == JNZ;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .sfr_data           == ac_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};
// ----------------------------------------------------------------------------
extend core_fsm_seq_kind_t: [SEQ_INST_ORL_C_BIT]; // 8'h72
extend SEQ_INST_ORL_C_BIT core_fsm_seq_s {
   !rom_data : uint (bits:8);

   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("ORL_C_BIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_C_BIT; 
                       .pkt_kind           == ORL_C_BIT;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .core_alu_cy_i      == .sfr_data[7:7];
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};
// ----------------------------------------------------------------------------
extend core_fsm_seq_kind_t: [SEQ_INST_JMP_A_DPTR]; // 8'h73
extend SEQ_INST_JMP_A_DPTR core_fsm_seq_s {
   !rom_data : uint (bits:8);

   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("JMP_A_DPTR instruction send"); };
      do pkt keeping { .rom_data_opcode    == JMP_A_DPTR; 
                       .pkt_kind           == JMP_A_DPTR;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};
// ----------------------------------------------------------------------------
extend core_fsm_seq_kind_t: [SEQ_INST_ANL_C_BIT]; // 8'h82
extend SEQ_INST_ANL_C_BIT core_fsm_seq_s {
   !rom_data : uint (bits:8);

   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("ANL_C_BIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_C_BIT;
                       .pkt_kind           == ANL_C_BIT;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .core_alu_cy_i      == .sfr_data[7:7];
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOVC_A_ATPC]; // 8'h83
extend SEQ_INST_MOVC_A_ATPC core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVC_A_ATPC instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVC_A_ATPC; 
                       .pkt_kind           == MOVC_A_ATPC;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

// ----------------------------------------------------------------------------
extend core_fsm_seq_kind_t: [SEQ_INST_ORL_C_NBIT]; // 8'hA0
extend SEQ_INST_ORL_C_NBIT core_fsm_seq_s {
   !rom_data : uint (bits:8);

   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("ORL_C_NBIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == ORL_C_NBIT; 
                       .pkt_kind           == ORL_C_NBIT;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .core_alu_cy_i      == .sfr_data[7:7];
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_ANL_C_NBIT]; // 8'hA0
extend SEQ_INST_ANL_C_NBIT core_fsm_seq_s {
   !rom_data : uint (bits:8);

   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("ANL_C_NBIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == ANL_C_NBIT; 
                       .pkt_kind           == ANL_C_NBIT;
                       //.inst_len           == 2;
                       .rom_data_byte1     == rom_data;
                       .core_alu_cy_i      == .sfr_data[7:7];
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


/////////////////////////////////////////////////////////////////////////////
//////////////////////////////// DAQUI //////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
extend core_fsm_seq_kind_t: [SEQ_INST_MOV_ATR0_D];
extend SEQ_INST_MOV_ATR0_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_ATR0_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_ATR0_D; 
                       .pkt_kind           == MOV_ATR0_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_ATR1_D];
extend SEQ_INST_MOV_ATR1_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_ATR1_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_ATR1_D; 
                       .pkt_kind           == MOV_ATR1_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R0_D];
extend SEQ_INST_MOV_R0_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R0_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R0_D; 
                       .pkt_kind           == MOV_R0_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R1_D];
extend SEQ_INST_MOV_R1_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R1_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R1_D; 
                       .pkt_kind           == MOV_R1_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R2_D]; // 8'h8
extend SEQ_INST_MOV_R2_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R2_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R2_D; 
                       .pkt_kind           == MOV_R2_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R3_D]; // 8'h8
extend SEQ_INST_MOV_R3_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R3_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R3_D; 
                       .pkt_kind           == MOV_R3_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R4_D]; // 8'h8
extend SEQ_INST_MOV_R4_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R4_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R4_D; 
                       .pkt_kind           == MOV_R4_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R5_D]; // 8'h8
extend SEQ_INST_MOV_R5_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R5_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R5_D; 
                       .pkt_kind           == MOV_R5_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R6_D]; // 8'h8
extend SEQ_INST_MOV_R6_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R6_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R6_D; 
                       .pkt_kind           == MOV_R6_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R7_D]; // 8'h8
extend SEQ_INST_MOV_R7_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R7_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R7_D; 
                       .pkt_kind           == MOV_R7_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_CPL_BIT];
extend SEQ_INST_CPL_BIT core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CPL_BIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == CPL_BIT; 
                       .pkt_kind           == CPL_BIT;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CPL_C];
extend SEQ_INST_CPL_C core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CPL_C instruction send"); };
      do pkt keeping { .rom_data_opcode    == CPL_C; 
                       .pkt_kind           == CPL_C;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_A_DATA]; // 8'B4
extend SEQ_INST_CJNE_A_DATA core_fsm_seq_s {
   !rom_data: uint(bits:8);
   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("CJNE_A_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_A_DATA; 
                       .pkt_kind           == CJNE_A_DATA;
                       .rom_data_byte1     == rom_data; 
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_A_D]; // 8'B5
extend SEQ_INST_CJNE_A_D core_fsm_seq_s {
   !rom_data: uint(bits:8);
   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("CJNE_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_A_D; 
                       .pkt_kind           == CJNE_A_D;
                       .rom_data_byte1     == rom_data; 
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_ATR0_DATA]; // 8'h8
extend SEQ_INST_CJNE_ATR0_DATA core_fsm_seq_s {
   !rom_data: uint(bits:8);
   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("CJNE_ATR0_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_ATR0_DATA; 
                       .pkt_kind           == CJNE_ATR0_DATA;
                       .rom_data_byte1     == rom_data; 
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_ATR1_DATA]; // 8'h8
extend SEQ_INST_CJNE_ATR1_DATA core_fsm_seq_s {
   !rom_data: uint(bits:8);
   body() @driver.clock is only {
      gen rom_data;
      if (verbose1 == 1) { out("CJNE_ATR1_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_ATR1_DATA; 
                       .pkt_kind           == CJNE_ATR1_DATA;
                       .rom_data_byte1     == rom_data; 
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R0_DATA]; // 8'h8
extend SEQ_INST_CJNE_R0_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R0_DATAXCH_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R0_DATA; 
                       .pkt_kind           == CJNE_R0_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R1_DATA]; // 8'h8
extend SEQ_INST_CJNE_R1_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R1_DATAXCH_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R1_DATA; 
                       .pkt_kind           == CJNE_R1_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R2_DATA]; // 8'h8
extend SEQ_INST_CJNE_R2_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R2_DATAXCH_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R2_DATA; 
                       .pkt_kind           == CJNE_R2_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R3_DATA]; // 8'h8
extend SEQ_INST_CJNE_R3_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R3_DATAXCH_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R3_DATA; 
                       .pkt_kind           == CJNE_R3_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R4_DATA]; // 8'h8
extend SEQ_INST_CJNE_R4_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R4_DATAXCH_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R4_DATA; 
                       .pkt_kind           == CJNE_R4_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R5_DATA]; // 8'h8
extend SEQ_INST_CJNE_R5_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R5_DATAXCH_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R5_DATA; 
                       .pkt_kind           == CJNE_R5_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R6_DATA]; // 8'h8
extend SEQ_INST_CJNE_R6_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R6_DATAXCH_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R6_DATA; 
                       .pkt_kind           == CJNE_R6_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CJNE_R7_DATA]; // 8'h8
extend SEQ_INST_CJNE_R7_DATA core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CJNE_R7_DATAXCH_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == CJNE_R7_DATA; 
                       .pkt_kind           == CJNE_R7_DATA;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SWAP_A]; // 8'h8
extend SEQ_INST_SWAP_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SWAP_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == SWAP_A; 
                       .pkt_kind           == SWAP_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_D]; // 8'h8
extend SEQ_INST_XCH_A_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_D; 
                       .pkt_kind           == XCH_A_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R0]; // 8'h8
extend SEQ_INST_XCH_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R0; 
                       .pkt_kind           == XCH_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R1]; // 8'h8
extend SEQ_INST_XCH_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R1; 
                       .pkt_kind           == XCH_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R2]; // 8'h8
extend SEQ_INST_XCH_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R2; 
                       .pkt_kind           == XCH_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R3]; // 8'h8
extend SEQ_INST_XCH_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R3; 
                       .pkt_kind           == XCH_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R4]; // 8'h8
extend SEQ_INST_XCH_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R4; 
                       .pkt_kind           == XCH_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R5]; // 8'h8
extend SEQ_INST_XCH_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R5; 
                       .pkt_kind           == XCH_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R6]; // 8'h8
extend SEQ_INST_XCH_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R6; 
                       .pkt_kind           == XCH_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_R7]; // 8'h8
extend SEQ_INST_XCH_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_R7; 
                       .pkt_kind           == XCH_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_ATR0]; // 8'h8
extend SEQ_INST_XCH_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_ATR0; 
                       .pkt_kind           == XCH_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCH_A_ATR1]; // 8'h8
extend SEQ_INST_XCH_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCH_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCH_A_ATR1; 
                       .pkt_kind           == XCH_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};



extend core_fsm_seq_kind_t: [SEQ_INST_CLR_BIT]; // 8'h8
extend SEQ_INST_CLR_BIT core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CLR_BIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == CLR_BIT; 
                       .pkt_kind           == CLR_BIT;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CLR_C]; // 8'h8
extend SEQ_INST_CLR_C core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CLR_C instruction send"); };
      do pkt keeping { .rom_data_opcode    == CLR_C; 
                       .pkt_kind           == CLR_C;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SETB_BIT]; // 8'h8
extend SEQ_INST_SETB_BIT core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SETB_BIT instruction send"); };
      do pkt keeping { .rom_data_opcode    == SETB_BIT; 
                       .pkt_kind           == SETB_BIT;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_SETB_C]; // 8'h8
extend SEQ_INST_SETB_C core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("SETB_C instruction send"); };
      do pkt keeping { .rom_data_opcode    == SETB_C; 
                       .pkt_kind           == SETB_C;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_D]; // 8'h8
extend SEQ_INST_DJNZ_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_D; 
                       .pkt_kind           == DJNZ_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_XCHD_A_ATR0]; // 8'h8
extend SEQ_INST_XCHD_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCHD_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCHD_A_ATR0; 
                       .pkt_kind           == XCHD_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_XCHD_A_ATR1]; // 8'h8
extend SEQ_INST_XCHD_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("XCHD_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == XCHD_A_ATR1; 
                       .pkt_kind           == XCHD_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R0]; // 8'h8
extend SEQ_INST_DJNZ_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R0; 
                       .pkt_kind           == DJNZ_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R1]; // 8'h8
extend SEQ_INST_DJNZ_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R1; 
                       .pkt_kind           == DJNZ_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R2]; // 8'h8
extend SEQ_INST_DJNZ_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R2; 
                       .pkt_kind           == DJNZ_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R3]; // 8'h8
extend SEQ_INST_DJNZ_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R3; 
                       .pkt_kind           == DJNZ_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R4]; // 8'h8
extend SEQ_INST_DJNZ_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R4; 
                       .pkt_kind           == DJNZ_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R5]; // 8'h8
extend SEQ_INST_DJNZ_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R5; 
                       .pkt_kind           == DJNZ_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R6]; // 8'h8
extend SEQ_INST_DJNZ_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R6; 
                       .pkt_kind           == DJNZ_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DJNZ_R7]; // 8'h8
extend SEQ_INST_DJNZ_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DJNZ_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == DJNZ_R7; 
                       .pkt_kind           == DJNZ_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOVX_A_ATDPTR]; // 8'h8
extend SEQ_INST_MOVX_A_ATDPTR core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVX_A_ATDPTR instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVX_A_ATDPTR; 
                       .pkt_kind           == MOVX_A_ATDPTR;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOVX_A_ATR0]; // 8'h8
extend SEQ_INST_MOVX_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVX_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVX_A_ATR0; 
                       .pkt_kind           == MOVX_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOVX_A_ATR1]; // 8'h8
extend SEQ_INST_MOVX_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVX_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVX_A_ATR1; 
                       .pkt_kind           == MOVX_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_CLR_A]; // 8'h8
extend SEQ_INST_CLR_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CLR_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == CLR_A; 
                       .pkt_kind           == CLR_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_D]; // 8'h8
extend SEQ_INST_MOV_A_D core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_D; 
                       .pkt_kind           == MOV_A_D;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_ATR0]; // 8'h8
extend SEQ_INST_MOV_A_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_ATR0; 
                       .pkt_kind           == MOV_A_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_ATR1]; // 8'h8
extend SEQ_INST_MOV_A_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_ATR1; 
                       .pkt_kind           == MOV_A_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_D]; // 8'h86
extend SEQ_INST_MOV_D_D core_fsm_seq_s {
   !rom1 : uint (bits:8);
   !rom2 : uint (bits:8);
   body() @driver.clock is only {
      gen rom1;
      gen rom2;
      if (verbose1 == 1) { out("MOV_D_D instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_D; 
                       .pkt_kind           == MOV_D_D;
                       .rom_data_byte1     == rom1;
                       .rom_data_byte2     == rom2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_ATR0]; // 8'h86
extend SEQ_INST_MOV_D_ATR0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_ATR0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_ATR0; 
                       .pkt_kind           == MOV_D_ATR0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_ATR1]; // 8'h87
extend SEQ_INST_MOV_D_ATR1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_ATR1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_ATR1; 
                       .pkt_kind           == MOV_D_ATR1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R0]; // 8'h8
extend SEQ_INST_MOV_D_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R0; 
                       .pkt_kind           == MOV_D_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R1]; // 8'h8
extend SEQ_INST_MOV_D_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R1; 
                       .pkt_kind           == MOV_D_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R2]; // 8'h8
extend SEQ_INST_MOV_D_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R2; 
                       .pkt_kind           == MOV_D_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R3]; // 8'h8
extend SEQ_INST_MOV_D_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R3; 
                       .pkt_kind           == MOV_D_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R4]; // 8'h8
extend SEQ_INST_MOV_D_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R4; 
                       .pkt_kind           == MOV_D_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R5]; // 8'h8
extend SEQ_INST_MOV_D_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R5; 
                       .pkt_kind           == MOV_D_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R6]; // 8'h8
extend SEQ_INST_MOV_D_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R6; 
                       .pkt_kind           == MOV_D_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_R7]; // 8'h8
extend SEQ_INST_MOV_D_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_R7; 
                       .pkt_kind           == MOV_D_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_DPTR_DATA]; // 8'h90
extend SEQ_INST_MOV_DPTR_DATA core_fsm_seq_s {
   !rom_data : uint (bits:8);
   !rom_data1 : uint (bits:8);
   body() @driver.clock is only {
      gen rom_data;
      gen rom_data1;
      if (verbose1 == 1) { out("MOV_DPTR_DATA instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_DPTR_DATA; 
                       .pkt_kind           == MOV_DPTR_DATA;
                       .rom_data_byte1     == rom_data;
                       .rom_data_byte2     == rom_data1;                       
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOVC_A_ATDPTR]; // 8'h93
extend SEQ_INST_MOVC_A_ATDPTR core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVC_A_ATDPTR instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVC_A_ATDPTR; 
                       .pkt_kind           == MOVC_A_ATDPTR;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R0]; // 8'h8
extend SEQ_INST_MOV_A_R0 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R0 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R0; 
                       .pkt_kind           == MOV_A_R0;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R1]; // 8'h8
extend SEQ_INST_MOV_A_R1 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R1 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R1; 
                       .pkt_kind           == MOV_A_R1;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R2]; // 8'h8
extend SEQ_INST_MOV_A_R2 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R2 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R2; 
                       .pkt_kind           == MOV_A_R2;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R3]; // 8'h8
extend SEQ_INST_MOV_A_R3 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R3 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R3; 
                       .pkt_kind           == MOV_A_R3;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R4]; // 8'h8
extend SEQ_INST_MOV_A_R4 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R4 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R4; 
                       .pkt_kind           == MOV_A_R4;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R5]; // 8'h8
extend SEQ_INST_MOV_A_R5 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R5 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R5; 
                       .pkt_kind           == MOV_A_R5;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R6]; // 8'h8
extend SEQ_INST_MOV_A_R6 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R6 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R6; 
                       .pkt_kind           == MOV_A_R6;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_A_R7]; // 8'h8
extend SEQ_INST_MOV_A_R7 core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_A_R7 instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_A_R7; 
                       .pkt_kind           == MOV_A_R7;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOVX_ATDPTR_A];
extend SEQ_INST_MOVX_ATDPTR_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVX_ATDPTR_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVX_ATDPTR_A; 
                       .pkt_kind           == MOVX_ATDPTR_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_MOVX_ATR0_A];
extend SEQ_INST_MOVX_ATR0_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVX_ATR0_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVX_ATR0_A; 
                       .pkt_kind           == MOVX_ATR0_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOVX_ATR1_A];
extend SEQ_INST_MOVX_ATR1_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOVX_ATR1_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOVX_ATR1_A; 
                       .pkt_kind           == MOVX_ATR1_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};


extend core_fsm_seq_kind_t: [SEQ_INST_CPL_A];
extend SEQ_INST_CPL_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("CPL_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == CPL_A; 
                       .pkt_kind           == CPL_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_D_A];
extend SEQ_INST_MOV_D_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_D_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_D_A; 
                       .pkt_kind           == MOV_D_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_ATR0_A];
extend SEQ_INST_MOV_ATR0_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_ATR0_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_ATR0_A; 
                       .pkt_kind           == MOV_ATR0_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_ATR1_A];
extend SEQ_INST_MOV_ATR1_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_ATR1_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_ATR1_A; 
                       .pkt_kind           == MOV_ATR1_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R0_A];
extend SEQ_INST_MOV_R0_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R0_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R0_A; 
                       .pkt_kind           == MOV_R0_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R1_A];
extend SEQ_INST_MOV_R1_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R1_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R1_A; 
                       .pkt_kind           == MOV_R1_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R2_A]; // 8'h8
extend SEQ_INST_MOV_R2_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R2_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R2_A; 
                       .pkt_kind           == MOV_R2_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R3_A]; // 8'h8
extend SEQ_INST_MOV_R3_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R3_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R3_A; 
                       .pkt_kind           == MOV_R3_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R4_A]; // 8'h8
extend SEQ_INST_MOV_R4_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R4_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R4_A; 
                       .pkt_kind           == MOV_R4_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R5_A]; // 8'h8
extend SEQ_INST_MOV_R5_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R5_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R5_A; 
                       .pkt_kind           == MOV_R5_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R6_A]; // 8'h8
extend SEQ_INST_MOV_R6_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R6_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R6_A; 
                       .pkt_kind           == MOV_R6_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_MOV_R7_A]; // 8'h8
extend SEQ_INST_MOV_R7_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("MOV_R7_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == MOV_R7_A; 
                       .pkt_kind           == MOV_R7_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};

extend core_fsm_seq_kind_t: [SEQ_INST_DA_A]; // 8'h8
extend SEQ_INST_DA_A core_fsm_seq_s {
   body() @driver.clock is only {
      if (verbose1 == 1) { out("DA_A instruction send"); };
      do pkt keeping { .rom_data_opcode    == DA_A; 
                       .pkt_kind           == DA_A;
                       .int_vect           == 3'd0 //avoid LCALL};
     };
   };
};






'>
