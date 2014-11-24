<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_signal_type.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - baud rate, phy - physical
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
type core_fsm_signal_type_kind_t: [
   RESET, NOP, 
   RR_A, RRC_A, RL_A, RLC_A,
   DEC_A, DEC_D, DEC_ATR0, DEC_ATR1, DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7,
   INC_A, INC_D, INC_ATR0, INC_ATR1, INC_DPTR,
   INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7, 
   JBC, JNB, JB, JC, JNC, AJMP_1, AJMP_2, AJMP_3, AJMP_4, AJMP_5, AJMP_6, AJMP_7, AJMP_8, LJMP,  
   ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8, LCALL, 
   RET, RETI, 
   ADD_A_DATA, ADDC_A_DATA, ADD_A_D, ADDC_A_D, ADD_A_ATR0, ADDC_A_ATR0, ADD_A_ATR1, ADDC_A_ATR1,
   ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6, ADD_A_R7,
   ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5, ADDC_A_R6, ADDC_A_R7,
   ORL_D_A, ORL_D_DATA, ORL_A_DATA, ORL_A_D, ORL_A_ATR0, ORL_A_ATR1,
   ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6, ORL_A_R7, 
   ANL_D_A, ANL_D_DATA, ANL_A_DATA, ANL_A_D, ANL_A_ATR0, ANL_A_ATR1,
   ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6, ANL_A_R7,
   XRL_D_A, XRL_D_DATA, XRL_A_DATA, XRL_A_D, XRL_A_ATR0, XRL_A_ATR1,
   XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6, XRL_A_R7,    
    SUBB_A_D, SUBB_A_ATR0, SUBB_A_ATR1,
   SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5, SUBB_A_R6, SUBB_A_R7, 
   MOV_A_DATA, MOV_ATR0_DATA, MOV_ATR1_DATA,
   MOV_R0_DATA, MOV_R1_DATA, MOV_R2_DATA, MOV_R3_DATA, MOV_R4_DATA, MOV_R5_DATA, MOV_R6_DATA, MOV_R7_DATA,
   MOV_C_BIT, MOV_BIT_C,
   MOV_DPTR_DATA, MOVC_A_ATDPTR, MOVC_A_ATPC,
   MUL_AB, 
   DIV_AB,
   CJNE_A_DATA, CJNE_A_D,
   /// DINO
   JZ, JNZ, 
   MOV_D_DATA, 
   SJMP, JMP_A_DPTR, 
   SUBB_A_DATA, 
   ORL_C_BIT, ORL_C_NBIT, ANL_C_BIT, ANL_C_NBIT,
   //THIAGO
   PUSH, POP, MOV_ATR0_D, MOV_ATR1_D, MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D, MOV_R4_D, MOV_R5_D, MOV_R6_D, MOV_R7_D, CPL_BIT, CPL_C, CJNE_ATR0_DATA, CJNE_ATR1_DATA, CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA, CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA, SWAP_A, XCH_A_D, XCH_A_R0, XCH_A_R1, XCH_A_R2, XCH_A_R3, XCH_A_R4, XCH_A_R5, XCH_A_R6, XCH_A_R7, XCH_A_ATR0, XCH_A_ATR1, CLR_BIT, CLR_C, SETB_BIT, SETB_C, DJNZ_D, XCHD_A_ATR0, XCHD_A_ATR1, DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7, MOVX_A_ATDPTR, CLR_A, MOVX_A_ATR0, MOVX_A_ATR1, MOV_A_D, MOV_A_ATR0, MOV_A_ATR1, MOV_D_D, MOV_D_ATR0, MOV_D_ATR1, MOV_D_R0, MOV_D_R1, MOV_D_R2, MOV_D_R3, MOV_D_R4, MOV_D_R5, MOV_D_R6, MOV_D_R7, MOV_A_R0, MOV_A_R1, MOV_A_R2, MOV_A_R3, MOV_A_R4, MOV_A_R5, MOV_A_R6, MOV_A_R7, MOVX_ATDPTR_A, MOVX_ATR0_A, MOVX_ATR1_A, CPL_A, MOV_D_A, MOV_ATR0_A, MOV_ATR1_A, MOV_R0_A, MOV_R1_A, MOV_R2_A, MOV_R3_A, MOV_R4_A, MOV_R5_A, MOV_R6_A, MOV_R7_A, DA_A
];

//type instruction_set_t defined on fsm_types.e

struct core_fsm_signal_type like any_sequence_item {
   
   // input reset
   reset: bit;
  
   // input psw
   psw: uint (bits:2); 
    
   // sfr_data_i input
   sfr_data: uint (bits: 8);
   sfr_data1: uint (bits: 8);
   sfr_data2: uint (bits: 8);
   sfr_data3: uint (bits: 8);
   sfr_data4: uint (bits: 8);
   // ram_data_i input
   ram_data: uint (bits: 8);
   
   // rom_data_i input
   rom_data_opcode: instruction_set_t;
   rom_data_byte1: uint (bits: 8);
   rom_data_byte2: uint (bits: 8);
   rom_data_byte3: uint (bits: 8);

   inst_len: uint(bits:3);
   keep inst_len in [1..3];
   
   // int_vect_i input
   int_vect: uint (bits: 3);
   
   // carry
   core_alu_cy_i : bit;
   
   // signal type
   pkt_kind: core_fsm_signal_type_kind_t;

   keep (pkt_kind != RESET) => (reset == 1);
   
   //////////////////////  INSTRUCTION CM LENGHT ///////////// ADD HERE
     
   keep ((pkt_kind == NOP)    || (pkt_kind == INC_ATR0) || (pkt_kind == INC_ATR1) || (pkt_kind == INC_R0) || (pkt_kind == INC_R1) ||
         (pkt_kind == INC_R2) || (pkt_kind == INC_R3)   || (pkt_kind == INC_R4)   || (pkt_kind == INC_R5) || (pkt_kind == INC_R6) || 
         (pkt_kind == INC_R7) || (pkt_kind == RRC_A)    || (pkt_kind == DEC_A)    || (pkt_kind == DEC_R0) || (pkt_kind == DEC_R1) ||
         (pkt_kind == DEC_R2) || (pkt_kind == DEC_R3)   || (pkt_kind == DEC_R4)   || (pkt_kind == DEC_R5) || (pkt_kind == DEC_R6) ||
         (pkt_kind == DEC_R7) || (pkt_kind == RL_A)     || (pkt_kind == ADD_A_ATR0)||(pkt_kind == ADD_A_ATR1)||(pkt_kind == ADD_A_R0)||
         (pkt_kind == ADD_A_R1)||(pkt_kind == ADD_A_R2) || (pkt_kind == ADD_A_R3) || (pkt_kind == ADD_A_R4)||(pkt_kind == ADD_A_R5)||
         (pkt_kind == ADD_A_R6)||(pkt_kind == ADD_A_R7) || (pkt_kind == RLC_A)    ||(pkt_kind == ADDC_A_ATR0)||(pkt_kind == ADDC_A_ATR1)||
         (pkt_kind == ADD_A_R0)||(pkt_kind == ADD_A_R1) ||(pkt_kind == ADD_A_R2)  || (pkt_kind == ADD_A_R3)||(pkt_kind == ADD_A_R4)||
         (pkt_kind == ADD_A_R5)|| (pkt_kind == ADD_A_R6)||(pkt_kind == ADD_A_R7)  || (pkt_kind == ORL_A_ATR0)||(pkt_kind == ORL_A_ATR1)||
         (pkt_kind == ORL_A_R0)|| (pkt_kind == ORL_A_R1)||(pkt_kind == ORL_A_R2)||(pkt_kind == ORL_A_R3)||(pkt_kind == ORL_A_R4)||
         (pkt_kind == ORL_A_R5)||(pkt_kind == ORL_A_R6)||(pkt_kind == ORL_A_R7)   || (pkt_kind == ANL_A_ATR0)||(pkt_kind == ANL_A_ATR1)||
         (pkt_kind == ANL_A_R0)|| (pkt_kind == ANL_A_R1)||(pkt_kind == ANL_A_R2)||(pkt_kind == ANL_A_R3)||(pkt_kind == ANL_A_R4)||
         (pkt_kind == ANL_A_R5)||(pkt_kind == ANL_A_R6)||(pkt_kind == ANL_A_R7)   || (pkt_kind == XRL_D_A) || (pkt_kind == XRL_A_ATR0)||
         (pkt_kind == XRL_A_ATR1)||(pkt_kind == XRL_A_R0)||(pkt_kind == XRL_A_R1) ||(pkt_kind == XRL_A_R2)||(pkt_kind == XRL_A_R3)||
         (pkt_kind == XRL_A_R4)||(pkt_kind == XRL_A_R5) ||(pkt_kind == XRL_A_R6)  ||(pkt_kind == XRL_A_R7) ||(pkt_kind == SUBB_A_ATR0)||
         (pkt_kind == SUBB_A_ATR1)||(pkt_kind == SUBB_A_R0)||(pkt_kind == SUBB_A_R1) ||(pkt_kind == SUBB_A_R2)||(pkt_kind == SUBB_A_R3)||
         (pkt_kind == SUBB_A_R4)||(pkt_kind == SUBB_A_R5) ||(pkt_kind == SUBB_A_R6)  ||(pkt_kind == SUBB_A_R7)  ||(pkt_kind == DA_A) ||
         (pkt_kind == DIV_AB) || (pkt_kind == INC_DPTR)
         ) => (inst_len == 1);
         
   
   keep ((pkt_kind == AJMP_1)|| (pkt_kind == RR_A)       || (pkt_kind == INC_A)   || (pkt_kind == INC_D)  || (pkt_kind == AJMP_2) || 
         (pkt_kind == DEC_D) || (pkt_kind == DEC_ATR0)   || (pkt_kind == DEC_ATR1)|| (pkt_kind == RET)    || (pkt_kind == ADD_A_DATA)||
         (pkt_kind == ADD_A_D)|| (pkt_kind == RETI)      || (pkt_kind == MOV_A_DATA)|| (pkt_kind == ADD_A_DATA) ||
         (pkt_kind == PUSH) || (pkt_kind == POP)     ||(pkt_kind == ADDC_A_DATA)||(pkt_kind == ADDC_A_D) ||
         (pkt_kind == JC)    || (pkt_kind == AJMP_3)     || (pkt_kind == ORL_D_A) ||(pkt_kind == ORL_D_DATA)||(pkt_kind == ORL_A_DATA)||
         (pkt_kind == ORL_A_D)||(pkt_kind == JNC)        || (pkt_kind == ANL_D_A) ||(pkt_kind == ANL_D_DATA)||(pkt_kind == ANL_A_DATA)||
         (pkt_kind == ANL_A_D)||(pkt_kind == XRL_D_DATA) ||(pkt_kind == XRL_A_DATA)||(pkt_kind == XRL_A_D)||(pkt_kind == SUBB_A_D) ||
         (pkt_kind == MUL_AB) ||(pkt_kind == MOV_ATR0_DATA)||(pkt_kind == MOV_ATR1_DATA)||(pkt_kind == MOV_R0_DATA)||(pkt_kind == MOV_R1_DATA)||
         (pkt_kind == MOV_R2_DATA)||(pkt_kind == MOV_R3_DATA)||(pkt_kind == MOV_R4_DATA)||(pkt_kind == MOV_R5_DATA)||(pkt_kind == MOV_R6_DATA)||
         (pkt_kind == MOV_R7_DATA)||(pkt_kind == AJMP_4) || (pkt_kind == AJMP_5)  || (pkt_kind == AJMP_6) || (pkt_kind == AJMP_7) ||
         (pkt_kind == AJMP_8) || (pkt_kind == MOV_C_BIT) ||(pkt_kind == MOV_BIT_C)||(pkt_kind == MOV_DPTR_DATA) ||(pkt_kind == MOVC_A_ATDPTR) ||
         (pkt_kind == MOVC_A_ATPC) 
         ) => (inst_len == 2);         
           
   keep ((pkt_kind == LJMP) || (pkt_kind == JBC) || (pkt_kind == ACALL_1) || (pkt_kind == ACALL_2) || (pkt_kind == LCALL) || 
         (pkt_kind == JB)   || (pkt_kind == JNB) || (pkt_kind == ACALL_3)|| (pkt_kind == ACALL_4) ||
         (pkt_kind == ACALL_5)||(pkt_kind == ACALL_6)||(pkt_kind == ACALL_7)|| (pkt_kind == ACALL_8)
         ) => (inst_len == 3);
    
         ////////////////////  DINO //////////////////////
         
   keep ((pkt_kind == JMP_A_DPTR)) => (inst_len == 1);

   keep ((pkt_kind == JZ)          || (pkt_kind == JNZ)        || 
         (pkt_kind == SJMP)        ||
         (pkt_kind == SUBB_A_DATA) ||
         (pkt_kind == ORL_C_BIT)   || (pkt_kind == ORL_C_NBIT) || (pkt_kind == ANL_C_BIT) || (pkt_kind == ANL_C_NBIT)
        ) => (inst_len == 2);

   keep ((pkt_kind == MOV_D_DATA)
        ) => (inst_len == 3);
         
   keep (pkt_kind == DIV_AB) => sfr_data!=0;
         /////////////////////// THIAGO ///////////////
         
   keep  ((pkt_kind == CPL_C) || (pkt_kind == CLR_C) || (pkt_kind == SETB_C) || (pkt_kind == SWAP_A) || (pkt_kind == XCH_A_R0) || (pkt_kind == XCH_A_R1) || (pkt_kind == XCH_A_R2) || (pkt_kind == XCH_A_R3) || (pkt_kind == XCH_A_R4) || (pkt_kind == XCH_A_R5) || (pkt_kind == XCH_A_R6) || (pkt_kind == XCH_A_R7) || (pkt_kind == XCH_A_ATR0) || (pkt_kind == XCH_A_ATR1) || (pkt_kind == XCHD_A_ATR0) || (pkt_kind == XCHD_A_ATR1) || (pkt_kind == MOVX_A_ATDPTR) || (pkt_kind == MOVX_A_ATR0) || (pkt_kind == MOVX_A_ATR1)  || (pkt_kind == CLR_A) || (pkt_kind == MOV_A_ATR0) || (pkt_kind == MOV_A_ATR1) || (pkt_kind == MOV_A_R0) || (pkt_kind == MOV_A_R1) || (pkt_kind == MOV_A_R2) || (pkt_kind == MOV_A_R3) || (pkt_kind == MOV_A_R4) || (pkt_kind == MOV_A_R5) || (pkt_kind == MOV_A_R6) || (pkt_kind == MOV_A_R7) || (pkt_kind == MOVX_ATDPTR_A) || (pkt_kind == MOVX_ATR0_A) || (pkt_kind == MOVX_ATR1_A)  || (pkt_kind == CPL_A) || (pkt_kind == MOV_ATR0_A) || (pkt_kind == MOV_ATR1_A) || (pkt_kind == MOV_R0_A) || (pkt_kind == MOV_R1_A) || (pkt_kind == MOV_R2_A) || (pkt_kind == MOV_R3_A) || (pkt_kind == MOV_R4_A) || (pkt_kind == MOV_R5_A) || (pkt_kind == MOV_R6_A) || (pkt_kind == MOV_R7_A)) => (inst_len == 1);
   
   keep ((pkt_kind == XCH_A_D) || (pkt_kind == CPL_BIT) || (pkt_kind == CLR_BIT) || (pkt_kind == SETB_BIT)  || (pkt_kind == DJNZ_R0) || (pkt_kind == DJNZ_R1) || (pkt_kind == DJNZ_R2) || (pkt_kind == DJNZ_R3) || (pkt_kind == DJNZ_R4) || (pkt_kind == DJNZ_R5) || (pkt_kind == DJNZ_R6) || (pkt_kind == DJNZ_R7) || (pkt_kind == AJMP_8) || (pkt_kind == MOV_D_A) || (pkt_kind == MOV_A_D) || (pkt_kind == MOV_R0_D) || (pkt_kind == MOV_R1_D) || (pkt_kind == MOV_R2_D) || (pkt_kind == MOV_R3_D) || (pkt_kind == MOV_R4_D) || (pkt_kind == MOV_R5_D) || (pkt_kind == MOV_R6_D) || (pkt_kind == MOV_R7_D) || (pkt_kind == MOV_ATR0_D) || (pkt_kind == MOV_ATR1_D) || (pkt_kind == MOV_D_ATR0) || (pkt_kind == MOV_D_ATR1) ||(pkt_kind == MOV_D_R0) || (pkt_kind == MOV_D_R1) || (pkt_kind == MOV_D_R2) || (pkt_kind == MOV_D_R3) || (pkt_kind == MOV_D_R4) || (pkt_kind == MOV_D_R5) || (pkt_kind == MOV_D_R6) || (pkt_kind == MOV_D_R7) ) => (inst_len == 2);        
           
           
   keep  ((pkt_kind == CJNE_R0_DATA) || (pkt_kind == CJNE_R1_DATA) || (pkt_kind == CJNE_R2_DATA) || (pkt_kind == CJNE_R3_DATA) || (pkt_kind == CJNE_R4_DATA) || (pkt_kind == CJNE_R5_DATA) || (pkt_kind == CJNE_R6_DATA) || (pkt_kind == CJNE_R7_DATA) || (pkt_kind == CJNE_ATR0_DATA) ||
   (pkt_kind == CJNE_ATR1_DATA) || (pkt_kind == MOV_D_D) || (pkt_kind == CJNE_A_DATA)|| (pkt_kind == CJNE_A_D)
   ) => (inst_len == 3);
         
         
         
         
   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
