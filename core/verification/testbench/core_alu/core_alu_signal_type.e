<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_signal_type.e
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
// Keywords: alu - aritmetic and logic unit, phy - physical
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to aply to
// the DUT
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
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

// signal type 
// type core_alu_signal_type_kind: [BCB, MULT, ADD, SUB, DIV, BOOLEAN, DISABLE];
    
struct core_alu_signal_type like any_sequence_item {
   // enable input
   core_alu_enable: bit;

   // operator 1 input
   core_alu_oper1: uint(bits:8); 
   
   // operator 2 input
   core_alu_oper2: uint(bits:8);
   
   // selector input
   core_alu_opcode: uint(bits:5);
   
   // carry input
   core_alu_cy_in: bit;

   // acumulator input
   core_alu_ac_in: bit;
   
   // overflow input
   core_alu_ov_in: bit;

   // signal type
   pkt_kind: core_alu_signal_type_kind;

   keep  (pkt_kind == ALU_DISABLE) => (core_alu_enable == 0);
   keep  (pkt_kind == ALU_NONE)    => (core_alu_enable == 1 && 
                                       core_alu_opcode == 0);
   keep  (pkt_kind == ALU_ADD)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 1);
   keep  (pkt_kind == ALU_INC)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 2 && 
                                       core_alu_oper2  == 1);
   keep  (pkt_kind == ALU_ADDC)    => (core_alu_enable == 1 && 
                                       core_alu_opcode == 3);
   keep  (pkt_kind == ALU_SUB)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 4);
   keep  (pkt_kind == ALU_DEC)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 5 && 
                                       core_alu_oper2  == 1);
   keep  (pkt_kind == ALU_MUL)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 6);
   keep  (pkt_kind == ALU_DIV)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 7);
   keep  (pkt_kind == ALU_DA)      => (core_alu_enable == 1 && 
                                       core_alu_opcode == 8);
   keep  (pkt_kind == ALU_AND)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 9);
   keep  (pkt_kind == ALU_XOR)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 10);
   keep  (pkt_kind == ALU_OR)      => (core_alu_enable == 1 && 
                                       core_alu_opcode == 11);
   keep  (pkt_kind == ALU_RL)      => (core_alu_enable == 1 && 
                                       core_alu_opcode == 12);
   keep  (pkt_kind == ALU_RLC)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 13);
   keep  (pkt_kind == ALU_RR)      => (core_alu_enable == 1 && 
                                       core_alu_opcode == 14);
   keep  (pkt_kind == ALU_RRC)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 15);
   keep  (pkt_kind == ALU_CPL)     => (core_alu_enable == 1 && 
                                       core_alu_opcode == 16);
   keep  (pkt_kind == ALU_COMP)    => (core_alu_enable == 1 && 
                                       core_alu_opcode == 17);
   keep  (pkt_kind == ALU_SWAP)    => (core_alu_enable == 1 && 
                                       core_alu_opcode == 18);

//   when ALU_MUL core_alu_signal_type {
//      keep soft core_alu_oper1 in [0..255];
//      keep soft core_alu_oper2 in [0..255];
//   };
   
   when ALU_DISABLE core_alu_signal_type {
      keep soft core_alu_oper1 == select {
         50: 0;
         50: [1..255];
      };
      keep soft core_alu_oper2 == select {
         50: 0;
         50: [1..255];
      };
   };
   
   when ALU_DIV core_alu_signal_type {
      //keep soft core_alu_oper1 in [0..50];
      //keep soft core_alu_oper2 in [0..50];
      keep soft core_alu_oper2 == select {
         10: 0;
         90: [1..255];
      };
   };

   when ALU_XOR core_alu_signal_type {
      //keep soft core_alu_oper1 in [0..3];
      //keep soft core_alu_oper2 in [0..3];
      keep soft core_alu_oper1 == select {
         30: 0;
         70: [1..255];
      };
      keep soft core_alu_oper2 == select {
         30: 0;
         70: [1..255];
      };
   };
   
   when ALU_OR core_alu_signal_type {
      //keep soft core_alu_oper1 in [0..3];
      //keep soft core_alu_oper2 in [0..3];
      keep soft core_alu_oper1 == select {
         30: 0;
         70: [1..255];
      };
      keep soft core_alu_oper2 == select {
         30: 0;
         70: [1..255];
      };
   };
   
   when ALU_COMP core_alu_signal_type {
      //keep soft core_alu_oper1 in [0..3];
      //keep soft core_alu_oper2 in [0..3];
      keep soft core_alu_oper1 == select {
         30: 0;
         70: [1..255];
      };
      keep soft core_alu_oper2 == select {
         30: 0;
         70: [1..255];
      };
   };

   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
