<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_types.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.core_fsm, diga19@emc08.core_fsm
// -----------------------------------------------------------------------------
// Review(s) : 02/09/2010, reviwed by Harney. 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine
// -----------------------------------------------------------------------------
// Purpose: Create the types for environment
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

type core_fsm_env_name_t: [CORE_FSM, CORE_FSM_IN, CORE_FSM_OUT];

type feature_kind_t: [feature1, feature2, feature3];

type fsm_state_t: [STATE_RESET=3'd4,STATE_DECODE_1=3'd0,STATE_DECODE_2=3'd1, STATE_EXECUTION=3'd3, STATE_WRITE_BACK=3'd2];

type inst_two_cycles: [
LCALL           = 8'h12, 
ACALL_1         = 8'h11,  
RET             = 8'h22,  
RETI            = 8'h32,  
ACALL_2         = 8'h31, 
ACALL_3         = 8'h51, 
ACALL_4         = 8'h71, 
ACALL_5         = 8'h91, 
ACALL_6         = 8'hB1, 
ACALL_7         = 8'hD1, 
ACALL_8         = 8'hF1, 
MUL_AB          = 8'hA4, 
DIV_AB          = 8'h84, 
JMP_A_DPTR      = 8'h73, 
CJNE_ATR0_DATA  = 8'hB6, 
CJNE_ATR1_DATA  = 8'hB7, 
CJNE_R0_DATA    = 8'hB8,
CJNE_R1_DATA    = 8'hB9,
CJNE_R2_DATA    = 8'hBA,
CJNE_R3_DATA    = 8'hBB,
CJNE_R4_DATA    = 8'hBC,
CJNE_R5_DATA    = 8'hBD,
CJNE_R6_DATA    = 8'hBE,
CJNE_R7_DATA    = 8'hBF, 
DJNZ_D          = 8'hD5, 
DJNZ_R0         = 8'hD8,
DJNZ_R1         = 8'hD9,
DJNZ_R2         = 8'hDA,
DJNZ_R3         = 8'hDB,
DJNZ_R4         = 8'hDC,
DJNZ_R5         = 8'hDD,
DJNZ_R6         = 8'hDE,
DJNZ_R7         = 8'hDF,
MOVX_A_ATDPTR   = 8'hE0,
MOVX_ATDPTR_A   = 8'hF0,
MOVC_A_ATDPTR   = 8'h93,
CJNE_A_DATA     = 8'hB4, 
CJNE_A_D        = 8'hB5, 
MOVC_A_ATPC     = 8'h83, 
INC_DPTR        = 8'hA3];


type instruction_set_t:[
   NOP             = 8'h00, // implemented - verified
   AJMP_1          = 8'h01, // implemented - verified
   LJMP            = 8'h02, // implemented - verified
   RR_A            = 8'h03, // implemented - verified
   INC_A           = 8'h04, // implemented - verified
   INC_D           = 8'h05, // implemented - verified
   INC_ATR0        = 8'h06, // implemented - verified
   INC_ATR1        = 8'h07, // implemented - verified
   INC_R0          = 8'h08, // implemented - verified
   INC_R1          = 8'h09, // implemented - verified
   INC_R2          = 8'h0A, // implemented - verified
   INC_R3          = 8'h0B, // implemented - verified
   INC_R4          = 8'h0C, // implemented - verified
   INC_R5          = 8'h0D, // implemented - verified
   INC_R6          = 8'h0E, // implemented - verified
   INC_R7          = 8'h0F, // implemented - verified
   JBC             = 8'h10, // implemented - verified
   ACALL_1         = 8'h11, // implemented - verified
   LCALL           = 8'h12, // implemented - verified
   RRC_A           = 8'h13, // implemented - verified
   DEC_A           = 8'h14, // implemented 
   DEC_D           = 8'h15, // implemented
   DEC_ATR0        = 8'h16, // implemented
   DEC_ATR1        = 8'h17, // implemented
   DEC_R0          = 8'h18, // implemented
   DEC_R1          = 8'h19, // implemented
   DEC_R2          = 8'h1A, // implemented
   DEC_R3          = 8'h1B, // implemented
   DEC_R4          = 8'h1C, // implemented
   DEC_R5          = 8'h1D, // implemented
   DEC_R6          = 8'h1E, // implemented
   DEC_R7          = 8'h1F, // implemented
   JB              = 8'h20, // implemented
   AJMP_2          = 8'h21, // implemented - verified
   RET             = 8'h22, // implemented - verified
   RL_A            = 8'h23, // implemented
   ADD_A_DATA      = 8'h24, // implemented - verified
   ADD_A_D         = 8'h25, // implemented
   ADD_A_ATR0      = 8'h26, // implemented
   ADD_A_ATR1      = 8'h27, // implemented
   ADD_A_R0        = 8'h28, // implemented
   ADD_A_R1        = 8'h29, // implemented
   ADD_A_R2        = 8'h2A, // implemented
   ADD_A_R3        = 8'h2B, // implemented
   ADD_A_R4        = 8'h2C, // implemented
   ADD_A_R5        = 8'h2D, // implemented
   ADD_A_R6        = 8'h2E, // implemented
   ADD_A_R7        = 8'h2F, // implemented
   JNB             = 8'h30, // implemented
   ACALL_2         = 8'h31, // implemented
   RETI            = 8'h32, // implemented - verified
   RLC_A           = 8'h33, // implemented
   ADDC_A_DATA     = 8'h34, // implemented
   ADDC_A_D        = 8'h35, // implemented
   ADDC_A_ATR0     = 8'h36, // implemented
   ADDC_A_ATR1     = 8'h37, // implemented
   ADDC_A_R0       = 8'h38, // implemented 
   ADDC_A_R1       = 8'h39, // implemented
   ADDC_A_R2       = 8'h3A, // implemented
   ADDC_A_R3       = 8'h3B, // implemented
   ADDC_A_R4       = 8'h3C, // implemented
   ADDC_A_R5       = 8'h3D, // implemented
   ADDC_A_R6       = 8'h3E, // implemented
   ADDC_A_R7       = 8'h3F, // implemented
   JC              = 8'h40, // implemented
   AJMP_3          = 8'h41, // implemented
   ORL_D_A         = 8'h42, // implemented
   ORL_D_DATA      = 8'h43, // implemented
   ORL_A_DATA      = 8'h44, // implemented
   ORL_A_D         = 8'h45, // implemented
   ORL_A_ATR0      = 8'h46, // implemented
   ORL_A_ATR1      = 8'h47, // implemented
   ORL_A_R0        = 8'h48, // implemented
   ORL_A_R1        = 8'h49, // implemented
   ORL_A_R2        = 8'h4A, //implemented
   ORL_A_R3        = 8'h4B, //implemented
   ORL_A_R4        = 8'h4C, //implemented
   ORL_A_R5        = 8'h4D, //implemented
   ORL_A_R6        = 8'h4E, //implemented
   ORL_A_R7        = 8'h4F, //implemented
   JNC             = 8'h50, // implemented
   ACALL_3         = 8'h51, // implemented
   ANL_D_A         = 8'h52, // implemented
   ANL_D_DATA      = 8'h53, // implemented
   ANL_A_DATA      = 8'h54, // implemented
   ANL_A_D         = 8'h55, // implemented
   ANL_A_ATR0      = 8'h56, // implemented
   ANL_A_ATR1      = 8'h57, // implemented
   ANL_A_R0        = 8'h58, // implemented 
   ANL_A_R1        = 8'h59, // implemented
   ANL_A_R2        = 8'h5A, // implemented
   ANL_A_R3        = 8'h5B, // implemented
   ANL_A_R4        = 8'h5C, // implemented
   ANL_A_R5        = 8'h5D, // implemented
   ANL_A_R6        = 8'h5E, // implemented
   ANL_A_R7        = 8'h5F, // implemented
   JZ              = 8'h60, // implemented
   AJMP_4          = 8'h61, // implemented
   XRL_D_A         = 8'h62, // implemented
   XRL_D_DATA      = 8'h63, // implemented
   XRL_A_DATA      = 8'h64, // implemented
   XRL_A_D         = 8'h65, // implemented
   XRL_A_ATR0      = 8'h66, // implemented
   XRL_A_ATR1      = 8'h67, // implemented
   XRL_A_R0        = 8'h68, // implemented
   XRL_A_R1        = 8'h69, // implemented 
   XRL_A_R2        = 8'h6A, // implemented
   XRL_A_R3        = 8'h6B, // implemented
   XRL_A_R4        = 8'h6C, // implemented
   XRL_A_R5        = 8'h6D, // implemented
   XRL_A_R6        = 8'h6E, // implemented
   XRL_A_R7        = 8'h6F, // implemented
   JNZ             = 8'h70, // implemented
   ACALL_4         = 8'h71, // implemented
   ORL_C_BIT       = 8'h72, // implemented
   JMP_A_DPTR      = 8'h73, // implemented
   MOV_A_DATA      = 8'h74, // implemented - verified
   MOV_D_DATA      = 8'h75, // implemented - verified
   MOV_ATR0_DATA   = 8'h76, // implemented
   MOV_ATR1_DATA   = 8'h77, // implemented
   MOV_R0_DATA     = 8'h78, // implemented
   MOV_R1_DATA     = 8'h79, // implemented
   MOV_R2_DATA     = 8'h7A, // implemented
   MOV_R3_DATA     = 8'h7B, // implemented
   MOV_R4_DATA     = 8'h7C, // implemented
   MOV_R5_DATA     = 8'h7D, // implemented
   MOV_R6_DATA     = 8'h7E, // implemented
   MOV_R7_DATA     = 8'h7F, // implemented
   SJMP            = 8'h80, // implemented - verified
   AJMP_5          = 8'h81, // implemented
   ANL_C_BIT       = 8'h82, // implemented
   MOVC_A_ATPC     = 8'h83, // implemented
   DIV_AB          = 8'h84, // implemented
   MOV_D_D         = 8'h85, // implemented
   MOV_D_ATR0      = 8'h86, // implemented
   MOV_D_ATR1      = 8'h87, // implemented
   MOV_D_R0        = 8'h88, // implemented
   MOV_D_R1        = 8'h89, // implemented
   MOV_D_R2        = 8'h8A, // implemented
   MOV_D_R3        = 8'h8B, // implemented
   MOV_D_R4        = 8'h8C, // implemented
   MOV_D_R5        = 8'h8D, // implemented
   MOV_D_R6        = 8'h8E, // implemented
   MOV_D_R7        = 8'h8F, // implemented
   MOV_DPTR_DATA   = 8'h90, // implemented
   ACALL_5         = 8'h91, // implemented
   MOV_BIT_C       = 8'h92, // implemented
   MOVC_A_ATDPTR   = 8'h93, // implemented
   SUBB_A_DATA     = 8'h94, // implemented
   SUBB_A_D        = 8'h95, // implemented
   SUBB_A_ATR0     = 8'h96, // implemented
   SUBB_A_ATR1     = 8'h97, // implemented
   SUBB_A_R0       = 8'h98, // implemented
   SUBB_A_R1       = 8'h99, // implemented
   SUBB_A_R2       = 8'h9A, // implemented
   SUBB_A_R3       = 8'h9B, // implemented
   SUBB_A_R4       = 8'h9C, // implemented
   SUBB_A_R5       = 8'h9D, // implemented
   SUBB_A_R6       = 8'h9E, // implemented
   SUBB_A_R7       = 8'h9F, // implemented
   ORL_C_NBIT      = 8'hA0, // implemented
   AJMP_6          = 8'hA1, // implemented
   MOV_C_BIT       = 8'hA2, // implemented
   INC_DPTR        = 8'hA3, // implemented
   MUL_AB          = 8'hA4, // implemented
   MOV_ATR0_D      = 8'hA6, // implemented
   MOV_ATR1_D      = 8'hA7, // implemented
   MOV_R0_D        = 8'hA8, // implemented
   MOV_R1_D        = 8'hA9, // implemented
   MOV_R2_D        = 8'hAA, // implemented
   MOV_R3_D        = 8'hAB, // implemented
   MOV_R4_D        = 8'hAC, // implemented
   MOV_R5_D        = 8'hAD, // implemented
   MOV_R6_D        = 8'hAE, // implemented
   MOV_R7_D        = 8'hAF, // implemented
   ANL_C_NBIT      = 8'hB0, // implemented
   ACALL_6         = 8'hB1,  // implemented
   CPL_BIT         = 8'hB2,  // implemented
   CPL_C           = 8'hB3, // implemented
   CJNE_A_DATA     = 8'hB4, // implemented
   CJNE_A_D        = 8'hB5, // implemented
   CJNE_ATR0_DATA  = 8'hB6, // implemented
   CJNE_ATR1_DATA  = 8'hB7, // implemented
   CJNE_R0_DATA    = 8'hB8, // implemented
   CJNE_R1_DATA    = 8'hB9, // implemented
   CJNE_R2_DATA    = 8'hBA, // implemented
   CJNE_R3_DATA    = 8'hBB, // implemented
   CJNE_R4_DATA    = 8'hBC, // implemented
   CJNE_R5_DATA    = 8'hBD, // implemented
   CJNE_R6_DATA    = 8'hBE, // implemented
   CJNE_R7_DATA    = 8'hBF, // implemented
   PUSH            = 8'hC0, // implemented
   AJMP_7          = 8'hC1, // implemented
   CLR_BIT         = 8'hC2, // implemented
   CLR_C           = 8'hC3, // implemented
   SWAP_A          = 8'hC4, // implemented
   XCH_A_D         = 8'hC5, // implemented
   XCH_A_ATR0      = 8'hC6, // implemented
   XCH_A_ATR1      = 8'hC7, // implemented
   XCH_A_R0        = 8'hC8, // implemented
   XCH_A_R1        = 8'hC9, // implemented
   XCH_A_R2        = 8'hCA, // implemented
   XCH_A_R3        = 8'hCB, // implemented
   XCH_A_R4        = 8'hCC, // implemented
   XCH_A_R5        = 8'hCD, // implemented
   XCH_A_R6        = 8'hCE, // implemented
   XCH_A_R7        = 8'hCF, // implemented
   POP             = 8'hD0,  // implemented
   ACALL_7         = 8'hD1, // implemented
   SETB_BIT        = 8'hD2, // implemented
   SETB_C          = 8'hD3, // implemented
   DA_A            = 8'hD4, // implemented
   DJNZ_D          = 8'hD5, // implemented
   XCHD_A_ATR0     = 8'hD6, // implemented
   XCHD_A_ATR1     = 8'hD7, // implemented
   DJNZ_R0         = 8'hD8, // implemented
   DJNZ_R1         = 8'hD9, // implemented
   DJNZ_R2         = 8'hDA, // implemented
   DJNZ_R3         = 8'hDB, // implemented
   DJNZ_R4         = 8'hDC, // implemented
   DJNZ_R5         = 8'hDD, // implemented
   DJNZ_R6         = 8'hDE, // implemented
   DJNZ_R7         = 8'hDF, // implemented
   MOVX_A_ATDPTR   = 8'hE0, // implemented
   AJMP_8          = 8'hE1, // implemented
   MOVX_A_ATR0     = 8'hE2, // implemented
   MOVX_A_ATR1     = 8'hE3, // implemented
   CLR_A           = 8'hE4, // implemented
   MOV_A_D         = 8'hE5, // implemented
   MOV_A_ATR0      = 8'hE6, // implemented
   MOV_A_ATR1      = 8'hE7, // implemented
   MOV_A_R0        = 8'hE8, // implemented
   MOV_A_R1        = 8'hE9, // implemented
   MOV_A_R2        = 8'hEA, // implemented
   MOV_A_R3        = 8'hEB, // implemented
   MOV_A_R4        = 8'hEC, // implemented
   MOV_A_R5        = 8'hED, // implemented
   MOV_A_R6        = 8'hEE, // implemented
   MOV_A_R7        = 8'hEF, // implemented
   MOVX_ATDPTR_A   = 8'hF0, // implemented
   ACALL_8         = 8'hF1, // implemented
   MOVX_ATR0_A     = 8'hF2, // implemented
   MOVX_ATR1_A     = 8'hF3, // implemented
   CPL_A           = 8'hF4, // implemented
   MOV_D_A         = 8'hF5, // implemented
   MOV_ATR0_A      = 8'hF6, // implemented
   MOV_ATR1_A      = 8'hF7, // implemented
   MOV_R0_A        = 8'hF8, // implemented
   MOV_R1_A        = 8'hF9, // implemented
   MOV_R2_A        = 8'hFA, // implemented
   MOV_R3_A        = 8'hFB, // implemented
   MOV_R4_A        = 8'hFC, // implemented
   MOV_R5_A        = 8'hFD, // implemented
   MOV_R6_A        = 8'hFE, // implemented
   MOV_R7_A        = 8'hFF // implemented
] (bits:8);

'>
