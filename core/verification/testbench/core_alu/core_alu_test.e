<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_test.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      08-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: Sequences generated and tested
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: post_generate()
// Include Files: core_alu_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_config;

extend MAIN core_alu_seq_s {
   !seq_alu_disable : SEQ_ALU_DISABLE core_alu_seq_s;
   !seq_alu_none    : SEQ_ALU_NONE core_alu_seq_s;
   !seq_alu_add     : SEQ_ALU_ADD core_alu_seq_s;
   !seq_alu_inc     : SEQ_ALU_INC core_alu_seq_s;
   !seq_alu_addc    : SEQ_ALU_ADDC core_alu_seq_s;
   !seq_alu_sub     : SEQ_ALU_SUB core_alu_seq_s;
   !seq_alu_dec     : SEQ_ALU_DEC core_alu_seq_s;
   !seq_alu_mul     : SEQ_ALU_MUL core_alu_seq_s;
   !seq_alu_div     : SEQ_ALU_DIV core_alu_seq_s;
   !seq_alu_da      : SEQ_ALU_DA core_alu_seq_s;
   !seq_alu_and     : SEQ_ALU_AND core_alu_seq_s;
   !seq_alu_xor     : SEQ_ALU_XOR core_alu_seq_s;
   !seq_alu_or      : SEQ_ALU_OR core_alu_seq_s;
   !seq_alu_rl      : SEQ_ALU_RL core_alu_seq_s;
   !seq_alu_rlc     : SEQ_ALU_RLC core_alu_seq_s;
   !seq_alu_rr      : SEQ_ALU_RR core_alu_seq_s;
   !seq_alu_rrc     : SEQ_ALU_RRC core_alu_seq_s;
   !seq_alu_cpl     : SEQ_ALU_CPL core_alu_seq_s;
   !seq_alu_comp    : SEQ_ALU_COMP core_alu_seq_s;
   !seq_alu_swap    : SEQ_ALU_SWAP core_alu_seq_s;

   post_generate() is also {
      message(LOW, me, " " );
   }; 

   drain_cycles   : uint;
   cont           : uint;
   sequence_width : uint;
   rand           : uint;
   gen_width      : uint;

   keep soft drain_cycles   == 100;
   keep soft cont           == 0;
   keep soft sequence_width == 100;
   keep soft rand in [0..19];
   keep soft gen_width      == 0;

   body() @driver.clock is only {
   for gen_width from 0 to 10000 do {
      gen rand;
      case rand {
         0: {
         out ("ALU DISABLE");
         while (cont < sequence_width) {
            do seq_alu_disable;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         1: {
         out ("GENERATING NONE SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_none;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         2: {
         out ("GENERATING ADD SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_add;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         3: {
         out ("GENERATING INC SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_inc;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         4: {
         out ("GENERATING ADDC SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_addc;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         5: {
         out ("GENERATING SUB SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_sub;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         6: {
         out ("GENERATING DEC SEQUENCE");
         while (cont < sequence_width) {
         do seq_alu_dec;
         wait cycle;
         cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         7: {
         out ("GENERATING MUL SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_mul;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         8: {
         out ("GENERATING DIV SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_div;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         9: {
         out ("GENERATING DA SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_da;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         10: {
         out ("GENERATING AND SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_and;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         11: {
         out ("GENERATING XOR SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_xor;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         12: {
         out ("GENERATING OR SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_or;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         13: {
         out ("GENERATING RL SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_rl;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         14: {
         out ("GENERATING RLC SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_rlc;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         15: {
         out ("GENERATING RR SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_rr;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         16: {
         out ("GENERATING RRC SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_rrc;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         17: {
         out ("GENERATING CPL SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_cpl;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         18: {
         out ("GENERATING COMP SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_comp;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
         19: {
         out ("GENERATING SWAP SEQUENCE");
         while (cont < sequence_width) {
            do seq_alu_swap;
            wait cycle;
            cont = cont + 1;
         };
         cont = 0;
         };
         //--------------------------------------------------------------------
      };
   };
      //-----------------------------------------------------------------------
      out ("ALU DISABLE");
      while (cont < sequence_width) {
         do seq_alu_disable;
         wait cycle;
         cont = cont + 1;
      };
      cont = 0;
      //-----------------------------------------------------------------------
      wait cycle;
      stop_run();
   };
};

'>
