<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_test_feature2.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.core_fsm, diga19@emc08.core_fsm
// -----------------------------------------------------------------------------
// Review(s) : 13/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      13-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: test case to verify the core instruction set
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
// Include Files: core_fsm_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_config;
extend core_fsm_mon_u {
   keep feature == feature2;
};

extend MAIN core_fsm_seq_s {
   
   !seq_reset        : SEQ_RESET core_fsm_seq_s;
   !seq_rand         : SEQ_INST_RAND core_fsm_seq_s;
   
   //////////////  INTRUCTION SET SEQUENCES ///////
   !seq_nop          : SEQ_INST_NOP core_fsm_seq_s;
   !seq_ajmp_1       : SEQ_INST_AJMP_1 core_fsm_seq_s;
   !seq_ljpm         : SEQ_INST_LJMP core_fsm_seq_s;
   !seq_rr_a         : SEQ_INST_RR_A core_fsm_seq_s;
   !seq_inc_a        : SEQ_INST_INC_A core_fsm_seq_s;
   !seq_inc_d        : SEQ_INST_INC_D core_fsm_seq_s;
   !seq_atr0         : SEQ_INST_INC_ATR0 core_fsm_seq_s;
   !seq_atr1         : SEQ_INST_INC_ATR1 core_fsm_seq_s;
   !seq_inc_r0       : SEQ_INST_INC_R0 core_fsm_seq_s;
   !seq_inc_r1       : SEQ_INST_INC_R1 core_fsm_seq_s;
   !seq_inc_r2       : SEQ_INST_INC_R2 core_fsm_seq_s;
   !seq_inc_r3       : SEQ_INST_INC_R3 core_fsm_seq_s;
   !seq_inc_r4       : SEQ_INST_INC_R4 core_fsm_seq_s;
   !seq_inc_r5       : SEQ_INST_INC_R5 core_fsm_seq_s;
   !seq_inc_r6       : SEQ_INST_INC_R6 core_fsm_seq_s;
   !seq_inc_r7       : SEQ_INST_INC_R7 core_fsm_seq_s;
   !seq_jbc          : SEQ_INST_JBC core_fsm_seq_s;
   !seq_acall_1      : SEQ_INST_ACALL_1 core_fsm_seq_s;
   !seq_lcall        : SEQ_INST_LCALL core_fsm_seq_s;
   !seq_rrc_a        : SEQ_INST_RRC_A core_fsm_seq_s;
   !seq_dec_a        : SEQ_INST_DEC_A core_fsm_seq_s;
   !seq_dec_d        : SEQ_INST_DEC_D core_fsm_seq_s;
   !seq_dec_atr0     : SEQ_INST_DEC_ATR0 core_fsm_seq_s;
   !seq_dec_atr1     : SEQ_INST_DEC_ATR1 core_fsm_seq_s;
   !seq_dec_r0       : SEQ_INST_DEC_R0 core_fsm_seq_s;
   !seq_dec_r1       : SEQ_INST_DEC_R1 core_fsm_seq_s;
   !seq_dec_r2       : SEQ_INST_DEC_R2 core_fsm_seq_s;
   !seq_dec_r3       : SEQ_INST_DEC_R3 core_fsm_seq_s;
   !seq_dec_r4       : SEQ_INST_DEC_R4 core_fsm_seq_s;
   !seq_dec_r5       : SEQ_INST_DEC_R5 core_fsm_seq_s;
   !seq_dec_r6       : SEQ_INST_DEC_R6 core_fsm_seq_s;
   !seq_dec_r7       : SEQ_INST_DEC_R7 core_fsm_seq_s;
   !seq_jb           : SEQ_INST_JB core_fsm_seq_s;
   !seq_ajmp_2       : SEQ_INST_AJMP_2 core_fsm_seq_s;
   !seq_ret          : SEQ_INST_RET core_fsm_seq_s;
   !seq_rl_a         : SEQ_INST_RL_A core_fsm_seq_s;
   !seq_add_a_data   : SEQ_INST_ADD_A_DATA core_fsm_seq_s;
   !seq_add_a_d      : SEQ_INST_ADD_A_D core_fsm_seq_s;
   !seq_add_a_atr0   : SEQ_INST_ADD_A_ATR0 core_fsm_seq_s;
   !seq_add_a_atr1   : SEQ_INST_ADD_A_ATR1 core_fsm_seq_s;
   !seq_add_a_r0     : SEQ_INST_ADD_A_R0 core_fsm_seq_s;
   !seq_add_a_r1     : SEQ_INST_ADD_A_R1 core_fsm_seq_s;
   !seq_add_a_r2     : SEQ_INST_ADD_A_R2 core_fsm_seq_s;
   !seq_add_a_r3     : SEQ_INST_ADD_A_R3 core_fsm_seq_s;
   !seq_add_a_r4     : SEQ_INST_ADD_A_R4 core_fsm_seq_s;
   !seq_add_a_r5     : SEQ_INST_ADD_A_R5 core_fsm_seq_s;
   !seq_add_a_r6     : SEQ_INST_ADD_A_R6 core_fsm_seq_s;
   !seq_add_a_r7     : SEQ_INST_ADD_A_R7 core_fsm_seq_s;
   !seq_jnb          : SEQ_INST_JNB core_fsm_seq_s;
   !seq_acall_2      : SEQ_INST_ACALL_2 core_fsm_seq_s;
   !seq_rlc_a        : SEQ_INST_RLC_A core_fsm_seq_s;
   !seq_reti         : SEQ_INST_RETI core_fsm_seq_s;
   !seq_addc_a_data  : SEQ_INST_ADDC_A_DATA core_fsm_seq_s;
   !seq_addc_a_d     : SEQ_INST_ADDC_A_D core_fsm_seq_s;
   !seq_addc_a_atr0  : SEQ_INST_ADDC_A_ATR0 core_fsm_seq_s;
   !seq_addc_a_atr1  : SEQ_INST_ADDC_A_ATR1 core_fsm_seq_s;
   !seq_addc_a_r0     : SEQ_INST_ADDC_A_R0 core_fsm_seq_s;
   !seq_addc_a_r1     : SEQ_INST_ADDC_A_R1 core_fsm_seq_s;
   !seq_addc_a_r2     : SEQ_INST_ADDC_A_R2 core_fsm_seq_s;
   !seq_addc_a_r3     : SEQ_INST_ADDC_A_R3 core_fsm_seq_s;
   !seq_addc_a_r4     : SEQ_INST_ADDC_A_R4 core_fsm_seq_s;
   !seq_addc_a_r5     : SEQ_INST_ADDC_A_R5 core_fsm_seq_s;
   !seq_addc_a_r6     : SEQ_INST_ADDC_A_R6 core_fsm_seq_s;
   !seq_addc_a_r7     : SEQ_INST_ADDC_A_R7 core_fsm_seq_s;
   !seq_jc            : SEQ_INST_JC core_fsm_seq_s;
   !seq_ajmp_3        : SEQ_INST_AJMP_3 core_fsm_seq_s;
   !seq_orl_d_a       : SEQ_INST_ORL_D_A core_fsm_seq_s;
   !seq_orl_d_data    : SEQ_INST_ORL_D_DATA core_fsm_seq_s;
   !seq_orl_a_data    : SEQ_INST_ORL_A_DATA core_fsm_seq_s;
   !seq_orl_a_d       : SEQ_INST_ORL_A_D core_fsm_seq_s;
   !seq_orl_a_atr0    : SEQ_INST_ORL_A_ATR0 core_fsm_seq_s;
   !seq_orl_a_atr1    : SEQ_INST_ORL_A_ATR1 core_fsm_seq_s;
   !seq_orl_a_r0      : SEQ_INST_ORL_A_R0 core_fsm_seq_s;
   !seq_orl_a_r1      : SEQ_INST_ORL_A_R1 core_fsm_seq_s;
   !seq_orl_a_r2      : SEQ_INST_ORL_A_R2 core_fsm_seq_s;
   !seq_orl_a_r3      : SEQ_INST_ORL_A_R3 core_fsm_seq_s;
   !seq_orl_a_r4      : SEQ_INST_ORL_A_R4 core_fsm_seq_s;
   !seq_orl_a_r5      : SEQ_INST_ORL_A_R5 core_fsm_seq_s;
   !seq_orl_a_r6      : SEQ_INST_ORL_A_R6 core_fsm_seq_s;
   !seq_orl_a_r7      : SEQ_INST_ORL_A_R7 core_fsm_seq_s;
   !seq_jnc           : SEQ_INST_JNC core_fsm_seq_s;
   !seq_acall_3       : SEQ_INST_ACALL_3 core_fsm_seq_s;
   !seq_anl_d_a       : SEQ_INST_ANL_D_A core_fsm_seq_s;
   !seq_anl_d_data    : SEQ_INST_ANL_D_DATA core_fsm_seq_s;
   !seq_anl_a_data    : SEQ_INST_ANL_A_DATA core_fsm_seq_s;
   !seq_anl_a_d       : SEQ_INST_ANL_A_D core_fsm_seq_s;
   !seq_anl_a_atr0    : SEQ_INST_ANL_A_ATR0 core_fsm_seq_s;
   !seq_anl_a_atr1    : SEQ_INST_ANL_A_ATR1 core_fsm_seq_s;
   !seq_anl_a_r0      : SEQ_INST_ANL_A_R0 core_fsm_seq_s;
   !seq_anl_a_r1      : SEQ_INST_ANL_A_R1 core_fsm_seq_s;
   !seq_anl_a_r2      : SEQ_INST_ANL_A_R2 core_fsm_seq_s;
   !seq_anl_a_r3      : SEQ_INST_ANL_A_R3 core_fsm_seq_s;
   !seq_anl_a_r4      : SEQ_INST_ANL_A_R4 core_fsm_seq_s;
   !seq_anl_a_r5      : SEQ_INST_ANL_A_R5 core_fsm_seq_s;
   !seq_anl_a_r6      : SEQ_INST_ANL_A_R6 core_fsm_seq_s;
   !seq_anl_a_r7      : SEQ_INST_ANL_A_R7 core_fsm_seq_s;
   
   //////////////////////do dino /////
   !seq_jz            : SEQ_INST_JZ core_fsm_seq_s;
   !seq_jnz           : SEQ_INST_JNZ core_fsm_seq_s;
   !seq_orl_c_bit     : SEQ_INST_ORL_C_BIT core_fsm_seq_s;
   !seq_anl_c_bit     : SEQ_INST_ANL_C_BIT core_fsm_seq_s;
   !seq_movc_a_atpc   : SEQ_INST_MOVC_A_ATPC core_fsm_seq_s;
   !seq_jmp_a_dptr    : SEQ_INST_JMP_A_DPTR core_fsm_seq_s;
   !seq_anl_c_nbit    : SEQ_INST_ANL_C_BIT core_fsm_seq_s;
   !seq_orl_c_nbit    : SEQ_INST_ORL_C_NBIT core_fsm_seq_s;
   //////////////////////// end DIno
   
   !seq_ajmp_4        : SEQ_INST_AJMP_4 core_fsm_seq_s;
   !seq_ajmp_5        : SEQ_INST_AJMP_5 core_fsm_seq_s;
   !seq_ajmp_6        : SEQ_INST_AJMP_6 core_fsm_seq_s;
   !seq_ajmp_7        : SEQ_INST_AJMP_7 core_fsm_seq_s;
   !seq_ajmp_8        : SEQ_INST_AJMP_8 core_fsm_seq_s;
   
   !seq_acall_4       : SEQ_INST_ACALL_4 core_fsm_seq_s;
   !seq_acall_5       : SEQ_INST_ACALL_5 core_fsm_seq_s;
   !seq_acall_6       : SEQ_INST_ACALL_6 core_fsm_seq_s;
   !seq_acall_7       : SEQ_INST_ACALL_7 core_fsm_seq_s;
   !seq_acall_8       : SEQ_INST_ACALL_8 core_fsm_seq_s;
   
   
   
   !seq_xrl_d_a       : SEQ_INST_XRL_D_A core_fsm_seq_s;
   !seq_xrl_d_data    : SEQ_INST_XRL_D_DATA core_fsm_seq_s;
   !seq_xrl_a_data    : SEQ_INST_XRL_A_DATA core_fsm_seq_s;
   !seq_xrl_a_d       : SEQ_INST_XRL_A_D core_fsm_seq_s;
   !seq_xrl_a_atr0    : SEQ_INST_XRL_A_ATR0 core_fsm_seq_s;
   !seq_xrl_a_atr1    : SEQ_INST_XRL_A_ATR1 core_fsm_seq_s;
   !seq_xrl_a_r0      : SEQ_INST_XRL_A_R0 core_fsm_seq_s;
   !seq_xrl_a_r1      : SEQ_INST_XRL_A_R1 core_fsm_seq_s;
   !seq_xrl_a_r2      : SEQ_INST_XRL_A_R2 core_fsm_seq_s;
   !seq_xrl_a_r3      : SEQ_INST_XRL_A_R3 core_fsm_seq_s;
   !seq_xrl_a_r4      : SEQ_INST_XRL_A_R4 core_fsm_seq_s;
   !seq_xrl_a_r5      : SEQ_INST_XRL_A_R5 core_fsm_seq_s;
   !seq_xrl_a_r6      : SEQ_INST_XRL_A_R6 core_fsm_seq_s;
   !seq_xrl_a_r7      : SEQ_INST_XRL_A_R7 core_fsm_seq_s;
   
   !seq_mov_d_data    : SEQ_INST_MOV_D_DATA core_fsm_seq_s;
   !seq_mov_a_data    : SEQ_INST_MOV_A_DATA core_fsm_seq_s;
   !seq_mov_atr0_data : SEQ_INST_MOV_ATR0_DATA core_fsm_seq_s;
   !seq_mov_atr1_data : SEQ_INST_MOV_ATR1_DATA core_fsm_seq_s;
   !seq_mov_r0_data   : SEQ_INST_MOV_R0_DATA core_fsm_seq_s;
   !seq_mov_r1_data   : SEQ_INST_MOV_R1_DATA core_fsm_seq_s;
   !seq_mov_r2_data   : SEQ_INST_MOV_R2_DATA core_fsm_seq_s;
   !seq_mov_r3_data   : SEQ_INST_MOV_R3_DATA core_fsm_seq_s;
   !seq_mov_r4_data   : SEQ_INST_MOV_R4_DATA core_fsm_seq_s;
   !seq_mov_r5_data   : SEQ_INST_MOV_R5_DATA core_fsm_seq_s;
   !seq_mov_r6_data   : SEQ_INST_MOV_R6_DATA core_fsm_seq_s;
   !seq_mov_r7_data   : SEQ_INST_MOV_R7_DATA core_fsm_seq_s;
   
   !seq_subb_a_data   : SEQ_INST_SUBB_A_DATA core_fsm_seq_s;
   !seq_subb_a_d      : SEQ_INST_SUBB_A_D core_fsm_seq_s;
   !seq_subb_a_atr0   : SEQ_INST_SUBB_A_ATR0 core_fsm_seq_s;
   !seq_subb_a_atr1   : SEQ_INST_SUBB_A_ATR1 core_fsm_seq_s;
   !seq_subb_a_r0      : SEQ_INST_SUBB_A_R0 core_fsm_seq_s;
   !seq_subb_a_r1      : SEQ_INST_SUBB_A_R1 core_fsm_seq_s;
   !seq_subb_a_r2      : SEQ_INST_SUBB_A_R2 core_fsm_seq_s;
   !seq_subb_a_r3      : SEQ_INST_SUBB_A_R3 core_fsm_seq_s;
   !seq_subb_a_r4      : SEQ_INST_SUBB_A_R4 core_fsm_seq_s;
   !seq_subb_a_r5      : SEQ_INST_SUBB_A_R5 core_fsm_seq_s;
   !seq_subb_a_r6      : SEQ_INST_SUBB_A_R6 core_fsm_seq_s;
   !seq_subb_a_r7      : SEQ_INST_SUBB_A_R7 core_fsm_seq_s;
   
   !seq_mov_bit_c      : SEQ_INST_MOV_BIT_C core_fsm_seq_s;
   !seq_movc_a_atdptr  : SEQ_INST_MOVC_A_ATDPTR core_fsm_seq_s;
   !seq_mov_c_bit      : SEQ_INST_MOV_C_BIT core_fsm_seq_s;
   !seq_inc_dptr       : SEQ_INST_INC_DPTR core_fsm_seq_s;
   !seq_mul_ab         : SEQ_INST_MUL_AB core_fsm_seq_s;
   !seq_div_ab         : SEQ_INST_DIV_AB core_fsm_seq_s;
  
   ///////// THIAGO ///
   !seq_mov_atr0_d    : SEQ_INST_MOV_ATR0_D core_fsm_seq_s;
   !seq_mov_atr1_d    : SEQ_INST_MOV_ATR1_D core_fsm_seq_s;
   !seq_mov_r0_d      : SEQ_INST_MOV_R0_D core_fsm_seq_s;
   !seq_mov_r1_d      : SEQ_INST_MOV_R1_D core_fsm_seq_s;
   !seq_mov_r2_d      : SEQ_INST_MOV_R2_D core_fsm_seq_s;
   !seq_mov_r3_d      : SEQ_INST_MOV_R3_D core_fsm_seq_s;
   !seq_mov_r4_d      : SEQ_INST_MOV_R4_D core_fsm_seq_s;
   !seq_mov_r5_d      : SEQ_INST_MOV_R5_D core_fsm_seq_s;
   !seq_mov_r6_d      : SEQ_INST_MOV_R6_D core_fsm_seq_s;
   !seq_mov_r7_d      : SEQ_INST_MOV_R7_D core_fsm_seq_s;
   !seq_cpl_bit       : SEQ_INST_CPL_BIT core_fsm_seq_s;
   !seq_cpl_c         : SEQ_INST_CPL_C core_fsm_seq_s;
   
   !seq_cjne_a_d      : SEQ_INST_CJNE_A_D core_fsm_seq_s;
   !seq_cjne_a_data   : SEQ_INST_CJNE_A_DATA core_fsm_seq_s;
   !seq_cjne_atr0_data: SEQ_INST_CJNE_ATR0_DATA core_fsm_seq_s;
   !seq_cjne_atr1_data: SEQ_INST_CJNE_ATR1_DATA core_fsm_seq_s;
   !seq_cjne_r0_data  : SEQ_INST_CJNE_R0_DATA core_fsm_seq_s;
   !seq_cjne_r1_data  : SEQ_INST_CJNE_R1_DATA core_fsm_seq_s;
   !seq_cjne_r2_data  : SEQ_INST_CJNE_R2_DATA core_fsm_seq_s;
   !seq_cjne_r3_data  : SEQ_INST_CJNE_R3_DATA core_fsm_seq_s;
   !seq_cjne_r4_data  : SEQ_INST_CJNE_R4_DATA core_fsm_seq_s;
   !seq_cjne_r5_data  : SEQ_INST_CJNE_R5_DATA core_fsm_seq_s;
   !seq_cjne_r6_data  : SEQ_INST_CJNE_R6_DATA core_fsm_seq_s;
   !seq_cjne_r7_data  : SEQ_INST_CJNE_R7_DATA core_fsm_seq_s;
   !seq_swap_a        : SEQ_INST_SWAP_A core_fsm_seq_s;
   !seq_xch_a_d       : SEQ_INST_XCH_A_D core_fsm_seq_s;
   !seq_xch_a_r0      : SEQ_INST_XCH_A_R0 core_fsm_seq_s;
   !seq_xch_a_r1      : SEQ_INST_XCH_A_R1 core_fsm_seq_s;
   !seq_xch_a_r2      : SEQ_INST_XCH_A_R2 core_fsm_seq_s;
   !seq_xch_a_r3      : SEQ_INST_XCH_A_R3 core_fsm_seq_s;
   !seq_xch_a_r4      : SEQ_INST_XCH_A_R4 core_fsm_seq_s;
   !seq_xch_a_r5      : SEQ_INST_XCH_A_R5 core_fsm_seq_s;
   !seq_xch_a_r6      : SEQ_INST_XCH_A_R6 core_fsm_seq_s;
   !seq_xch_a_r7      : SEQ_INST_XCH_A_R7 core_fsm_seq_s;
   !seq_xch_a_atr0    : SEQ_INST_XCH_A_ATR0 core_fsm_seq_s;
   !seq_xch_a_atr1    : SEQ_INST_XCH_A_ATR1 core_fsm_seq_s;
   !seq_clr_bit       : SEQ_INST_CLR_BIT core_fsm_seq_s;
   !seq_clr_c         : SEQ_INST_CLR_C core_fsm_seq_s;
   !seq_setb_bit      : SEQ_INST_SETB_BIT core_fsm_seq_s;
   !seq_setb_c        : SEQ_INST_SETB_C core_fsm_seq_s;
   !seq_djnz_d        : SEQ_INST_DJNZ_D core_fsm_seq_s;
   !seq_xchd_a_atr0   : SEQ_INST_XCHD_A_ATR0 core_fsm_seq_s;
   !seq_xchd_a_atr1   : SEQ_INST_XCHD_A_ATR1 core_fsm_seq_s;
   !seq_djnz_r0       : SEQ_INST_DJNZ_R0 core_fsm_seq_s;
   !seq_djnz_r1       : SEQ_INST_DJNZ_R1 core_fsm_seq_s;
   !seq_djnz_r2       : SEQ_INST_DJNZ_R2 core_fsm_seq_s;
   !seq_djnz_r3       : SEQ_INST_DJNZ_R3 core_fsm_seq_s;
   !seq_djnz_r4       : SEQ_INST_DJNZ_R4 core_fsm_seq_s;
   !seq_djnz_r5       : SEQ_INST_DJNZ_R5 core_fsm_seq_s;
   !seq_djnz_r6       : SEQ_INST_DJNZ_R6 core_fsm_seq_s;
   !seq_djnz_r7       : SEQ_INST_DJNZ_R7 core_fsm_seq_s;
   !seq_movx_a_atdptr : SEQ_INST_MOVX_A_ATDPTR core_fsm_seq_s;
   //!seq_ajmp_8        : SEQ_INST_AJMP_8 core_fsm_seq_s;
   !seq_movx_a_atr0   : SEQ_INST_MOVX_A_ATR0 core_fsm_seq_s;
   !seq_movx_a_atr1   : SEQ_INST_MOVX_A_ATR1 core_fsm_seq_s;
   !seq_clr_a         : SEQ_INST_CLR_A core_fsm_seq_s;
   !seq_mov_a_d       : SEQ_INST_MOV_A_D core_fsm_seq_s;
   !seq_mov_a_atr0    : SEQ_INST_MOV_A_ATR0 core_fsm_seq_s;
   !seq_mov_a_atr1    : SEQ_INST_MOV_A_ATR1 core_fsm_seq_s;
   !seq_mov_d_d       : SEQ_INST_MOV_D_D core_fsm_seq_s;
   !seq_mov_d_atr0    : SEQ_INST_MOV_D_ATR0 core_fsm_seq_s;
   !seq_mov_d_atr1    : SEQ_INST_MOV_D_ATR1 core_fsm_seq_s;
   !seq_mov_d_r0      : SEQ_INST_MOV_D_R0 core_fsm_seq_s;
   !seq_mov_d_r1      : SEQ_INST_MOV_D_R1 core_fsm_seq_s;
   !seq_mov_d_r2      : SEQ_INST_MOV_D_R2 core_fsm_seq_s;
   !seq_mov_d_r3      : SEQ_INST_MOV_D_R3 core_fsm_seq_s;
   !seq_mov_d_r4      : SEQ_INST_MOV_D_R4 core_fsm_seq_s;
   !seq_mov_d_r5      : SEQ_INST_MOV_D_R5 core_fsm_seq_s;
   !seq_mov_d_r6      : SEQ_INST_MOV_D_R6 core_fsm_seq_s;
   !seq_mov_d_r7      : SEQ_INST_MOV_D_R7 core_fsm_seq_s;
   !seq_mov_dptr_data : SEQ_INST_MOV_DPTR_DATA core_fsm_seq_s;
   !seq_mov_a_r0      : SEQ_INST_MOV_A_R0 core_fsm_seq_s;
   !seq_mov_a_r1      : SEQ_INST_MOV_A_R1 core_fsm_seq_s;
   !seq_mov_a_r2      : SEQ_INST_MOV_A_R2 core_fsm_seq_s;
   !seq_mov_a_r3      : SEQ_INST_MOV_A_R3 core_fsm_seq_s;
   !seq_mov_a_r4      : SEQ_INST_MOV_A_R4 core_fsm_seq_s;
   !seq_mov_a_r5      : SEQ_INST_MOV_A_R5 core_fsm_seq_s;
   !seq_mov_a_r6      : SEQ_INST_MOV_A_R6 core_fsm_seq_s;
   !seq_mov_a_r7      : SEQ_INST_MOV_A_R7 core_fsm_seq_s;
   !seq_movx_atdptr_a : SEQ_INST_MOVX_ATDPTR_A core_fsm_seq_s;
   //!seq_acall_8       : SEQ_INST_ACALL_8 core_fsm_seq_s;
   !seq_movx_atr0_a   : SEQ_INST_MOVX_ATR0_A core_fsm_seq_s;
   !seq_movx_atr1_a   : SEQ_INST_MOVX_ATR1_A core_fsm_seq_s;
   !seq_cpl_a         : SEQ_INST_CPL_A core_fsm_seq_s;
   !seq_mov_d_a       : SEQ_INST_MOV_D_A core_fsm_seq_s;
   !seq_mov_atr0_a    : SEQ_INST_MOV_ATR0_A core_fsm_seq_s;
   !seq_mov_atr1_a    : SEQ_INST_MOV_ATR1_A core_fsm_seq_s;
   !seq_mov_r0_a      : SEQ_INST_MOV_R0_A core_fsm_seq_s;
   !seq_mov_r1_a      : SEQ_INST_MOV_R1_A core_fsm_seq_s;
   !seq_mov_r2_a      : SEQ_INST_MOV_R2_A core_fsm_seq_s;
   !seq_mov_r3_a      : SEQ_INST_MOV_R3_A core_fsm_seq_s;
   !seq_mov_r4_a      : SEQ_INST_MOV_R4_A core_fsm_seq_s;
   !seq_mov_r5_a      : SEQ_INST_MOV_R5_A core_fsm_seq_s;
   !seq_mov_r6_a      : SEQ_INST_MOV_R6_A core_fsm_seq_s;
   !seq_mov_r7_a      : SEQ_INST_MOV_R7_A core_fsm_seq_s;
   !seq_da_a          : SEQ_INST_DA_A core_fsm_seq_s;
   
   !seq_sjmp         : SEQ_INST_SJMP core_fsm_seq_s;
   !seq_push         : SEQ_INST_PUSH core_fsm_seq_s;
   !seq_pop          : SEQ_INST_POP core_fsm_seq_s;
   
   
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   stimulus: int;
   keep soft stimulus == 1000000;
   !num_pkt: int;
   keep num_pkt in [1..257];
    
   
   body() @driver.clock is only {
         
           do seq_reset;
           
//            for i from 1 to stimulus {
//            do seq_nop; // h00 - verified
           //do  seq_ajmp_1; // h01 - verified
           //do  seq_ljpm; //h02 - verified
           //do  seq_rr_a; //h03 - verified
           //do  seq_inc_a; //h04 - verified
           //do  seq_inc_d; //h05 - verified
           //do  seq_atr0; //h06 - verified
           //do  seq_atr1; //h07 - verified
           //do  seq_inc_r0; //h08 - verified
           //do  seq_inc_r1; //h09 - verified
           //do  seq_inc_r2; //h0A - verified
           //do  seq_inc_r3; //h0B - verified
           //do  seq_inc_r4; //h0C - verified
           //do  seq_inc_r5; //h0D - verified
           //do  seq_inc_r6; //h0E - verified
           //do  seq_inc_r7; //h0F - verified
           //do  seq_jbc; //h10 - verified
           //do  seq_acall_1; //h11 - verified
           //do  seq_lcall; // h12 - verified
           //o seq_rrc_a; //h13
           //do seq_dec_a; //h14
           //do seq_dec_d; //h15
           //do seq_dec_atr0; //h16
           //do seq_dec_atr1; //h17
           //do seq_dec_r0; //h18
           //do seq_dec_r1; //h19
           //do seq_dec_r2; //h1A
           //do seq_dec_r3; //h1B
           //do seq_dec_r4; //h1C
           //do seq_dec_r5; //h1D
           //do seq_dec_r6; //h1E
           //do seq_dec_r7; //h1F
           //do seq_jb; // h20 - BUGADO
           //do  seq_ajmp_2; // h21 - verified 
           //do  seq_ret;  //h22 - verified
           //do seq_rl_a;
           //do  seq_add_a_data; //h24 - verified
           //do seq_add_a_d;
           //do seq_add_a_atr0;
           //do seq_add_a_atr1;
           //do seq_add_a_r0;
           //do seq_add_a_r1;
           //do seq_add_a_r2;
           //do seq_add_a_r3;
           //do seq_add_a_r4;
           //do seq_add_a_r5;
           //do seq_add_a_r6;
           //do seq_add_a_r7;
           //do seq_jnb; //h30- 
           //do seq_acall_2;
           //do seq_rlc_a;
//           *** the next instruction after seq_reti will have the interrupt flag rise to treat a interrupt
           //do  seq_reti; //h32 - verified
           //do seq_addc_a_data;
           //do seq_addc_a_d;
           //do seq_addc_a_atr0;
           //do seq_addc_a_atr1;
           //do seq_addc_a_r0;
           //do seq_addc_a_r1;
           //do seq_addc_a_r2;
           //do seq_addc_a_r3;
           //do seq_addc_a_r4;
           //do seq_addc_a_r5;
           //do seq_addc_a_r6;
           //do seq_addc_a_r7;
           //do seq_jc; // h40 
           //do seq_ajmp_3;
           //do seq_orl_d_a;
           //do seq_orl_d_data;
           //do seq_orl_a_data;
           //do seq_orl_a_d;
           //do seq_orl_a_atr0;
           //do seq_orl_a_atr1;
           //do seq_orl_a_r0;
           //do seq_orl_a_r1;
           //do seq_orl_a_r2;
           //do seq_orl_a_r3;
           //do seq_orl_a_r4;
           //do seq_orl_a_r5;
           //do seq_orl_a_r6;
           //do seq_orl_a_r7;
           //do seq_jnc; // h40
           //do seq_acall_3;
           //do seq_anl_d_a;
           //do seq_anl_d_data;
           //do seq_anl_a_data;
           //do seq_anl_a_d;
           //do seq_anl_a_atr0;
           //do seq_anl_a_atr1;
           //do seq_anl_a_r0;
           //do seq_anl_a_r1;
           //do seq_anl_a_r2;
           //do seq_anl_a_r3;
           //do seq_anl_a_r4;
           //do seq_anl_a_r5;
           //do seq_anl_a_r6;
           //do seq_anl_a_r7;
           
           //do seq_xrl_d_a;
           //do seq_xrl_d_data;
//            do seq_xrl_a_data;
//            do seq_xrl_a_d;
//            do seq_xrl_a_atr0;
//            do seq_xrl_a_atr1;
//            do seq_xrl_a_r0;
//            do seq_xrl_a_r1;
//            do seq_xrl_a_r2;
//            do seq_xrl_a_r3;
//            do seq_xrl_a_r4;
//            do seq_xrl_a_r5;
//            do seq_xrl_a_r6;
//            do seq_xrl_a_r7;
           
//            do seq_subb_a_data; //h94 - verified
//            do seq_subb_a_d;
//            do seq_subb_a_atr0;
//            do seq_subb_a_atr1;
//            do seq_subb_a_r0;
//            do seq_subb_a_r1;
//            do seq_subb_a_r2;
//            do seq_subb_a_r3;
//            do seq_subb_a_r4;
//            do seq_subb_a_r5;
//            do seq_subb_a_r6;
             //do seq_subb_a_r7;
//            
             //do seq_mul_ab;

            // do seq_mov_atr0_data; 
            // do seq_mov_atr1_data; 
//              do seq_mov_r0_data; 
//              do seq_mov_r1_data; 
//              do seq_mov_r2_data; 
//              do seq_mov_r3_data; 
//              do seq_mov_r4_data; 
//              do seq_mov_r5_data; 
//              do seq_mov_r6_data; 
//              do seq_mov_r7_data; 
//              
//            //do  seq_sjmp; //h80 - verified
//            //do  seq_mov_a_data; //h74 - verified
//            //do  seq_subb_a_data; //94 - verified
//            //do seq_push; //hc0 - BUGADO
//            //do seq_pop; //hD0 - BUGADO
//            do seq_nop;
           
           //do seq_rand;
//           };
         
          ////// sequences to verify the LCALL instruction generating by hardware and by software
          
             
         for i from 1 to stimulus {
         gen num_pkt;
         case {
              num_pkt == 1 { do seq_nop };
              num_pkt == 2 {do seq_ajmp_1}; // h01 - verified
              num_pkt == 3 {do seq_ljpm}; //h02 - verified
              num_pkt == 4 {do seq_rr_a}; //h03 - verified
              num_pkt == 5 {do seq_inc_a}; //h04 - verified
              num_pkt == 6 {do seq_inc_d}; //h05 - verified
              num_pkt == 7 {do seq_atr0}; //h06 - verified
              num_pkt == 8 {do seq_atr1}; //h07 - verified
              num_pkt == 9 {do seq_inc_r0}; //h08 - verified
              num_pkt == 10 {do seq_inc_r1}; //h09 - verified
              num_pkt == 11 {do seq_inc_r2}; //h0A - verified
              num_pkt == 12 {do seq_inc_r3}; //h0B - verified
              num_pkt == 13 {do seq_inc_r4}; //h0C - verified
              num_pkt == 14 {do seq_inc_r5}; //h0D - verified
              num_pkt == 15 {do seq_inc_r6}; //h0E - verified
              num_pkt == 16 {do seq_inc_r7}; //h0F - verified
              num_pkt == 17 {do seq_jbc}; //h10 - verified
              num_pkt == 18 {do seq_acall_1}; //h11 - verified
              num_pkt == 19 {do seq_lcall}; // h12 - verified
              num_pkt == 20 {do seq_rrc_a}; // h13 - verified 
              num_pkt == 21 {do seq_dec_a};  //h14 - verified
              num_pkt == 22 {do seq_dec_d}; //h15 - verified
               // *** the next instruction after seq_reti will have the interrupt flag rise to treat a interrupt
              num_pkt == 23 {do seq_dec_atr0}; //h16 - verified
              num_pkt == 24 {do seq_dec_atr1}; //h17 - verified
              num_pkt == 25 {do seq_dec_r0}; //h18 - verified
              num_pkt == 26 {do seq_dec_r1}; //19 - verified
              num_pkt == 27 {do seq_dec_r2};
              num_pkt == 28 {do seq_dec_r3};
              num_pkt == 29 {do seq_dec_r4};
              num_pkt == 30 {do seq_dec_r5};
              num_pkt == 31 {do seq_dec_r6};
              num_pkt == 32 {do seq_dec_r7};
              num_pkt == 33 {do seq_jb};
              num_pkt == 34 {do seq_ajmp_2};
              num_pkt == 35 {do seq_ret};
              num_pkt == 36 {do seq_rl_a};
              num_pkt == 37 {do seq_add_a_data}; //h24
              num_pkt == 38 {do seq_add_a_d};
              num_pkt == 39 {do seq_add_a_atr0};
              num_pkt == 40 {do seq_add_a_atr1};
              num_pkt == 41 {do seq_add_a_r0};
              num_pkt == 42 {do seq_add_a_r1};
              num_pkt == 43 {do seq_add_a_r2}; //h2A
              num_pkt == 44 {do seq_add_a_r3};
              num_pkt == 45 {do seq_add_a_r4};
              num_pkt == 46 {do seq_add_a_r5};
              num_pkt == 47 {do seq_add_a_r6};
              num_pkt == 48 {do seq_add_a_r7};
              num_pkt == 49 {do seq_jnb}; //h30
              num_pkt == 50 {do seq_acall_2};
              num_pkt == 51 {do seq_reti};
              num_pkt == 52 {do seq_rlc_a};
              num_pkt == 53 {do seq_addc_a_data};
              num_pkt == 54 {do seq_addc_a_d}; //h35
              num_pkt == 55 {do seq_addc_a_atr0};
              num_pkt == 56 {do seq_addc_a_atr1};
              num_pkt == 57 {do seq_addc_a_r0};
              num_pkt == 58 {do seq_addc_a_r1};
              num_pkt == 59 {do seq_addc_a_r2}; //h3A
              num_pkt == 60 {do seq_addc_a_r3}; //h3B
              num_pkt == 61 {do seq_addc_a_r4}; 
              num_pkt == 62 {do seq_addc_a_r5}; 
              num_pkt == 63 {do seq_addc_a_r6}; 
              num_pkt == 64 {do seq_addc_a_r7}; 
              num_pkt == 65 {do seq_jc}; //h40
              num_pkt == 66 {do seq_ajmp_3}; 
              num_pkt == 67 {do seq_orl_d_a}; 
              num_pkt == 68 {do seq_orl_d_data};
              num_pkt == 69 {do seq_orl_a_data};
              num_pkt == 70 {do seq_orl_a_d}; //h45
              num_pkt == 71 {do seq_orl_a_atr0};
              num_pkt == 72 {do seq_orl_a_atr1};
              num_pkt == 73 {do seq_orl_a_r0};
              num_pkt == 74 {do seq_orl_a_r1};
              num_pkt == 75 {do seq_orl_a_r2}; //h4A
              num_pkt == 76 {do seq_orl_a_r3};
              num_pkt == 77 {do seq_orl_a_r4};
              num_pkt == 78 {do seq_orl_a_r5};
              num_pkt == 79 {do seq_orl_a_r6};
              num_pkt == 80 {do seq_orl_a_r7}; 
              num_pkt == 81 {do seq_jnc}; 
              num_pkt == 82 {do seq_acall_3}; 
              num_pkt == 83 {do seq_anl_d_a}; 
              num_pkt == 84 {do seq_anl_d_data}; 
              num_pkt == 85 {do seq_anl_a_data}; //h54 
              num_pkt == 86 {do seq_anl_a_d}; 
              num_pkt == 87 {do seq_anl_a_atr0}; 
              num_pkt == 88 {do seq_anl_a_atr1}; 
              num_pkt == 89 {do seq_anl_a_r0}; 
              num_pkt == 90 {do seq_anl_a_r1}; //h59 
              num_pkt == 91 {do seq_anl_a_r2}; //h5A 
              num_pkt == 92 {do seq_anl_a_r3}; //h5B 
              num_pkt == 93 {do seq_anl_a_r4}; //h5C 
              num_pkt == 94 {do seq_anl_a_r5}; //h5D 
              num_pkt == 95 {do seq_anl_a_r6}; //h5E 
              num_pkt == 96 {do seq_anl_a_r7}; //h5F 
              num_pkt == 97 {do seq_jz}; //h60 
              num_pkt == 98 {do seq_ajmp_4}; //h61 
              num_pkt == 99 {do seq_xrl_d_a}; //h62 
              num_pkt == 100 {do seq_xrl_d_data}; //h63
              num_pkt == 101 {do seq_xrl_a_data}; //h64
              num_pkt == 102 {do seq_xrl_a_d}; //h65
              num_pkt == 103 {do seq_xrl_a_atr0}; //h66
              num_pkt == 104 {do seq_xrl_a_atr1}; //h67
              num_pkt == 105 {do seq_xrl_a_r0}; //h68
              num_pkt == 106 {do seq_xrl_a_r1}; //h69
              num_pkt == 107 {do seq_xrl_a_r2}; //h6a
              num_pkt == 108 {do seq_xrl_a_r3}; //h6b
              num_pkt == 109 {do seq_xrl_a_r4}; //h6c
              num_pkt == 110 {do seq_xrl_a_r5}; //h6d
              num_pkt == 111 {do seq_xrl_a_r6}; //h6e
              num_pkt == 112 {do seq_xrl_a_r7}; //h6f
              num_pkt == 113 {do seq_jnz}; //h70
              num_pkt == 114 {do seq_acall_4}; //h71
              num_pkt == 115 {do seq_orl_c_bit}; //h72
              num_pkt == 116 {do seq_jmp_a_dptr}; //h73 
              num_pkt == 117 {do seq_mov_a_data}; //h74
              num_pkt == 118 {do seq_mov_d_data}; //h75
              num_pkt == 119 {do seq_mov_atr0_data}; //h76
              num_pkt == 120 {do seq_mov_atr1_data}; //h77
              num_pkt == 121 {do seq_mov_r0_data}; //h78
              num_pkt == 122 {do seq_mov_r1_data}; //h79
              num_pkt == 123 {do seq_mov_r2_data}; //h7a
              num_pkt == 124 {do seq_mov_r3_data}; //h7b
              num_pkt == 125 {do seq_mov_r4_data}; //h7c
              num_pkt == 126 {do seq_mov_r5_data}; //h7d
              num_pkt == 127 {do seq_mov_r6_data}; //h7e
              num_pkt == 128 {do seq_mov_r7_data}; //h7f
              num_pkt == 129 {do seq_sjmp}; //h80
              num_pkt == 130 {do seq_ajmp_5}; //h81
              num_pkt == 131 {do seq_anl_c_bit}; //h82 
              num_pkt == 132 {do seq_movc_a_atpc}; //h83 - BUGADA
              num_pkt == 133 {do seq_div_ab}; //h84
              num_pkt == 134 {do seq_mov_d_d}; //h85
              num_pkt == 135 {do seq_mov_d_atr0}; //h86
              num_pkt == 136 {do seq_mov_d_atr1}; //h87
              num_pkt == 137 {do seq_mov_d_r0}; //h88
              num_pkt == 138 {do seq_mov_d_r1}; //h89
              num_pkt == 139 {do seq_mov_d_r2}; //h8a
              num_pkt == 140 {do seq_mov_d_r3}; //h8b
              num_pkt == 141 {do seq_mov_d_r4}; //h8c
              num_pkt == 142 {do seq_mov_d_r5}; //h8d
              num_pkt == 143 {do seq_mov_d_r6}; //h8e
              num_pkt == 144 {do seq_mov_d_r7}; //h8f
              num_pkt == 145 {do seq_mov_dptr_data}; //h90
              num_pkt == 146 {do seq_acall_5}; //h91
              num_pkt == 147 {do seq_mov_bit_c}; //h92
              num_pkt == 148 {do seq_movc_a_atdptr}; //h93
              num_pkt == 149 {do seq_subb_a_data}; //h94
              num_pkt == 150 {do seq_subb_a_d}; //h95
              num_pkt == 151 {do seq_subb_a_atr0}; //h96
              num_pkt == 152 {do seq_subb_a_atr1}; //h97
              num_pkt == 153 {do seq_subb_a_r0}; //h98
              num_pkt == 154 {do seq_subb_a_r1}; //h99
              num_pkt == 155 {do seq_subb_a_r2}; //h9a
              num_pkt == 156 {do seq_subb_a_r3}; //h9b
              num_pkt == 157 {do seq_subb_a_r4}; //h9c
              num_pkt == 158 {do seq_subb_a_r5}; //h9d
              num_pkt == 159 {do seq_subb_a_r6}; //h9e
              num_pkt == 160 {do seq_subb_a_r7}; //h9f
              num_pkt == 161 {do seq_orl_c_nbit}; //hA0
              num_pkt == 162 {do seq_ajmp_6}; //hA1
              num_pkt == 163 {do seq_mov_c_bit}; //ha2
              num_pkt == 164 {do seq_inc_dptr}; //ha3 -- BUGADA
              num_pkt == 165 {do seq_mul_ab}; //ha4
              num_pkt == 166 {do seq_mov_atr0_d}; //ha6
              num_pkt == 167 {do seq_mov_atr1_d}; //ha7
              num_pkt == 169 {do seq_mov_r0_d};
              num_pkt == 170 {do seq_mov_r1_d};
              num_pkt == 171 {do seq_mov_r2_d};
              num_pkt == 172 {do seq_mov_r3_d};
              num_pkt == 173 {do seq_mov_r4_d};
              num_pkt == 174 {do seq_mov_r5_d};
              num_pkt == 175 {do seq_mov_r6_d};
              num_pkt == 176 {do seq_mov_r7_d};
              num_pkt == 177 {do seq_anl_c_nbit}; 
              num_pkt == 178 {do seq_acall_6};
              num_pkt == 179 {do seq_cpl_bit};
              num_pkt == 180 {do seq_cpl_c};
              num_pkt == 181 {do seq_cjne_a_data}; //hb4
              num_pkt == 182 {do seq_cjne_a_d}; //hb5
              num_pkt == 183 {do seq_cjne_atr0_data};
              num_pkt == 184 {do seq_cjne_atr1_data};
              num_pkt == 185 {do seq_cjne_r0_data};
              num_pkt == 186 {do seq_cjne_r1_data};
              num_pkt == 187 {do seq_cjne_r2_data};
              num_pkt == 188 {do seq_cjne_r3_data};
              num_pkt == 189 {do seq_cjne_r4_data};
              num_pkt == 190 {do seq_cjne_r5_data};
              num_pkt == 191 {do seq_cjne_r6_data};
              num_pkt == 192 {do seq_cjne_r7_data};
              num_pkt == 193 {do seq_push};
              num_pkt == 194 {do seq_ajmp_7};
              num_pkt == 195 {do seq_clr_bit};
              num_pkt == 196 {do seq_clr_c};
              num_pkt == 197 {do seq_swap_a};
              num_pkt == 198 {do seq_xch_a_d};
              num_pkt == 199 {do seq_xch_a_atr0};
              num_pkt == 200 {do seq_xch_a_atr1};
              num_pkt == 201 {do seq_xch_a_r0};
              num_pkt == 202 {do seq_xch_a_r1};
              num_pkt == 203 {do seq_xch_a_r2};
              num_pkt == 204 {do seq_xch_a_r3};
              num_pkt == 205 {do seq_xch_a_r4};
              num_pkt == 206 {do seq_xch_a_r5};
              num_pkt == 207 {do seq_xch_a_r6};
              num_pkt == 208 {do seq_xch_a_r7}; 
              num_pkt == 209 {do seq_pop}; //D0
              num_pkt == 210 {do seq_acall_7};
              num_pkt == 211 {do seq_setb_bit};
              num_pkt == 212 {do seq_setb_c};
              num_pkt == 213 {do seq_da_a};
              num_pkt == 214 {do seq_djnz_d};
              num_pkt == 215 {do seq_xchd_a_atr0};
              num_pkt == 216 {do seq_xchd_a_atr1};
              num_pkt == 217 {do seq_djnz_r0};
              num_pkt == 218 {do seq_djnz_r1};
              num_pkt == 219 {do seq_djnz_r2};
              num_pkt == 220 {do seq_djnz_r3};
              num_pkt == 221 {do seq_djnz_r4};
              num_pkt == 222 {do seq_djnz_r5};
              num_pkt == 223 {do seq_djnz_r6};
              num_pkt == 224 {do seq_djnz_r7};
              num_pkt == 226 {do seq_movx_a_atdptr};
              num_pkt == 227 {do seq_ajmp_8};
              num_pkt == 228 {do seq_movx_a_atr0 };
              num_pkt == 229 {do seq_movx_a_atr1};
              num_pkt == 230 {do seq_clr_a};
              num_pkt == 231 {do seq_mov_a_d};
              num_pkt == 232 {do seq_mov_a_atr0};
              num_pkt == 233 {do seq_mov_a_atr1};
              num_pkt == 234 {do seq_mov_a_r0};
              num_pkt == 235 {do seq_mov_a_r1};
              num_pkt == 236 {do seq_mov_a_r2};
              num_pkt == 237 {do seq_mov_a_r3};
              num_pkt == 238 {do seq_mov_a_r4};
              num_pkt == 239 {do seq_mov_a_r5};
              num_pkt == 240 {do seq_mov_a_r6};
              num_pkt == 241 {do seq_mov_a_r7};
              num_pkt == 242 {do seq_movx_atdptr_a}; 
              num_pkt == 243 {do seq_acall_8};
              num_pkt == 244 {do seq_movx_atr0_a};
              num_pkt == 245 {do seq_movx_atr1_a};
              num_pkt == 246 {do seq_cpl_a};
              num_pkt == 247 {do seq_mov_d_a};
              num_pkt == 248 {do seq_mov_atr0_a};
              num_pkt == 249 {do seq_mov_atr1_a};
              num_pkt == 250 {do seq_mov_r0_a};
              num_pkt == 251 {do seq_mov_r1_a};
              num_pkt == 252 {do seq_mov_r2_a};
              num_pkt == 253 {do seq_mov_r3_a};
              num_pkt == 254 {do seq_mov_r4_a};
              num_pkt == 255 {do seq_mov_r5_a};
              num_pkt == 256 {do seq_mov_r6_a};
              num_pkt == 257 {do seq_mov_r7_a};              
                            
             }; //end case
         }; //end for
   
      stop_run();
      }; // end body
}; //end MAIN

'>
