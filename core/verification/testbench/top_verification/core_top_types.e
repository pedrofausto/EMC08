<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_types.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core finite state machine
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

extend sys {
   vect_rom         : list of instruction_set_t;
   vect_opcodes      : list of instruction_set_t;
   ind: int;
   lcall: bool;
   lcall_hdw: bool;
   jmp_begin: bool;
   ind_interrupt: int;
};

type core_top_env_name_t: [CORE_TOP, CORE_TOP_IN, CORE_TOP_OUT];

type feature_kind_t: [feature_timers, feature_mem_ram, feature_serial, feature_interrupt];

type core_top_signal_type_kind_t: [RESET, NOP, AJMP_1, LJMP, RR_A, INC_A, INC_D, INC_ATR0, INC_ATR1, INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7, JBC, ACALL_1, LCALL, JB, AJMP_2, RET, ADD_A_DATA, JNB, RETI, MOV_A_DATA, MOV_D_DATA, SJMP, SUBB_A_DATA, PUSH, POP,MOV_D_A, MOV_ATR1_D];


type instruction_set_t:[
    RESET           = 8'hA5,
    NOP             = 8'h00,
    AJMP_1          = 8'h01,
    LJMP            = 8'h02,
    RR_A            = 8'h03,
    INC_A           = 8'h04,
    INC_D           = 8'h05,
    INC_ATR0        = 8'h06,
    INC_ATR1        = 8'h07,
    INC_R0          = 8'h08,
    INC_R1          = 8'h09,
    INC_R2          = 8'h0A,
    INC_R3          = 8'h0B,
    INC_R4          = 8'h0C,
    INC_R5          = 8'h0D,
    INC_R6          = 8'h0E,
    INC_R7          = 8'h0F,
    JBC             = 8'h10,
    ACALL_1         = 8'h11,
    LCALL           = 8'h12,
    RRC_A           = 8'h13,
    DEC_A           = 8'h14,
    DEC_D           = 8'h15,
    DEC_ATR0        = 8'h16,
    DEC_ATR1        = 8'h17,
    DEC_R0          = 8'h18,
    DEC_R1          = 8'h19,
    DEC_R2          = 8'h1A,
    DEC_R3          = 8'h1B,
    DEC_R4          = 8'h1C,
    DEC_R5          = 8'h1D,
    DEC_R6          = 8'h1E,
    DEC_R7          = 8'h1F,
    JB              = 8'h20,
    AJMP_2          = 8'h21,
    RET             = 8'h22,
    RL_A            = 8'h23,
    ADD_A_DATA      = 8'h24,
    ADD_A_D         = 8'h25,
    ADD_A_ATR0      = 8'h26,
    ADD_A_ATR1      = 8'h27,
    ADD_A_R0        = 8'h28,
    ADD_A_R1        = 8'h29,
    ADD_A_R2        = 8'h2A,
    ADD_A_R3        = 8'h2B,
    ADD_A_R4        = 8'h2C,
    ADD_A_R5        = 8'h2D,
    ADD_A_R6        = 8'h2E,
    ADD_A_R7        = 8'h2F,
    JNB             = 8'h30,
    ACALL_2         = 8'h31,
    RETI            = 8'h32,
    RLC_A           = 8'h33,
    ADDC_A_DATA     = 8'h34,
    ADDC_A_D        = 8'h35,
    ADDC_A_ATR0     = 8'h36,
    ADDC_A_ATR1     = 8'h37,
    ADDC_A_R0       = 8'h38,
    ADDC_A_R1       = 8'h39,
    ADDC_A_R2       = 8'h3A,
    ADDC_A_R3       = 8'h3B,
    ADDC_A_R4       = 8'h3C,
    ADDC_A_R5       = 8'h3D,
    ADDC_A_R6       = 8'h3E,
    ADDC_A_R7       = 8'h3F,
    JC              = 8'h40,
    AJMP_3          = 8'h41,
    ORL_D_A         = 8'h42,
    ORL_D_DATA      = 8'h43,
    ORL_A_DATA      = 8'h44,
    ORL_A_D         = 8'h45,
    ORL_A_ATR0      = 8'h46,
    ORL_A_ATR1      = 8'h47,
    ORL_A_R0        = 8'h48,
    ORL_A_R1        = 8'h49,
    ORL_A_R2        = 8'h4A,
    ORL_A_R3        = 8'h4B,
    ORL_A_R4        = 8'h4C,
    ORL_A_R5        = 8'h4D,
    ORL_A_R6        = 8'h4E,
    ORL_A_R7        = 8'h4F,
    JNC             = 8'h50,
    ACALL_3         = 8'h51,
    ANL_D_A         = 8'h52,
    ANL_D_DATA      = 8'h53,
    ANL_A_DATA      = 8'h54,
    ANL_A_D         = 8'h55,
    ANL_A_ATR0      = 8'h56,
    ANL_A_ATR1      = 8'h57,
    ANL_A_R0        = 8'h58,
    ANL_A_R1        = 8'h59,
    ANL_A_R2        = 8'h5A,
    ANL_A_R3        = 8'h5B,
    ANL_A_R4        = 8'h5C,
    ANL_A_R5        = 8'h5D,
    ANL_A_R6        = 8'h5E,
    ANL_A_R7        = 8'h5F,
    JZ              = 8'h60,
    AJMP_4          = 8'h61,
    XRL_D_A         = 8'h62,
    XRL_D_DATA      = 8'h63,
    XRL_A_DATA      = 8'h64,
    XRL_A_D         = 8'h65,
    XRL_A_ATR0      = 8'h66,
    XRL_A_ATR1      = 8'h67,
    XRL_A_R0        = 8'h68,
    XRL_A_R1        = 8'h69,
    XRL_A_R2        = 8'h6A,
    XRL_A_R3        = 8'h6B,
    XRL_A_R4        = 8'h6C,
    XRL_A_R5        = 8'h6D,
    XRL_A_R6        = 8'h6E,
    XRL_A_R7        = 8'h6F,
    JNZ             = 8'h70,
    ACALL_4         = 8'h71,
    ORL_C_BIT       = 8'h72,
    JMP_A_DPTR      = 8'h73,
    MOV_A_DATA      = 8'h74,
    MOV_D_DATA      = 8'h75,
    MOV_ATR0_DATA   = 8'h76,
    MOV_ATR1_DATA   = 8'h77,
    MOV_R0_DATA     = 8'h78,
    MOV_R1_DATA     = 8'h79,
    MOV_R2_DATA     = 8'h7A,
    MOV_R3_DATA     = 8'h7B,
    MOV_R4_DATA     = 8'h7C,
    MOV_R5_DATA     = 8'h7D,
    MOV_R6_DATA     = 8'h7E,
    MOV_R7_DATA     = 8'h7F,
    SJMP            = 8'h80,
    AJMP_5          = 8'h81,
    ANL_C_BIT       = 8'h82,
    MOVC_A_ATPC     = 8'h83,
    DIV_AB          = 8'h84,
    MOV_D_D         = 8'h85,
    MOV_D_ATR0      = 8'h86,
    MOV_D_ATR1      = 8'h87,
    MOV_D_R0        = 8'h88,
    MOV_D_R1        = 8'h89,
    MOV_D_R2        = 8'h8A,
    MOV_D_R3        = 8'h8B,
    MOV_D_R4        = 8'h8C,
    MOV_D_R5        = 8'h8D,
    MOV_D_R6        = 8'h8E,
    MOV_D_R7        = 8'h8F,
    MOV_DPTR_DATA   = 8'h90,
    ACALL_5         = 8'h91,
    MOV_BIT_C       = 8'h92,
    MOVC_A_ATDPTR   = 8'h93,
    SUBB_A_DATA     = 8'h94,
    SUBB_A_D        = 8'h95,
    SUBB_A_ATR0     = 8'h96,
    SUBB_A_ATR1     = 8'h97,
    SUBB_A_R0       = 8'h98,
    SUBB_A_R1       = 8'h99,
    SUBB_A_R2       = 8'h9A,
    SUBB_A_R3       = 8'h9B,
    SUBB_A_R4       = 8'h9C,
    SUBB_A_R5       = 8'h9D,
    SUBB_A_R6       = 8'h9E,
    SUBB_A_R7       = 8'h9F,
    ORL_C_NBIT      = 8'hA0,
    AJMP_6          = 8'hA1,
    MOV_C_BIT       = 8'hA2,
    INC_DPTR        = 8'hA3,
    MUL_AB          = 8'hA4,
    MOV_ATR0_D      = 8'hA6,
    MOV_ATR1_D      = 8'hA7,
    MOV_R0_D        = 8'hA8,
    MOV_R1_D        = 8'hA9,
    MOV_R2_D        = 8'hAA,
    MOV_R3_D        = 8'hAB,
    MOV_R4_D        = 8'hAC,
    MOV_R5_D        = 8'hAD,
    MOV_R6_D        = 8'hAE,
    MOV_R7_D        = 8'hAF,
    ANL_C_NBIT      = 8'hB0,
    ACALL_6         = 8'hB1,
    CPL_BIT         = 8'hB2,
    CPL_C           = 8'hB3,
    CJNE_A_DATA     = 8'hB4,
    CJNE_A_D        = 8'hB5,
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
    PUSH            = 8'hC0,
    AJMP_7          = 8'hC1,
    CLR_BIT         = 8'hC2,
    CLR_C           = 8'hC3,
    SWAP_A          = 8'hC4,
    XCH_A_D         = 8'hC5,
    XCH_A_ATR0      = 8'hC6,
    XCH_A_ATR1      = 8'hC7,
    XCH_A_R0        = 8'hC8,
    XCH_A_R1        = 8'hC9,
    XCH_A_R2        = 8'hCA,
    XCH_A_R3        = 8'hCB,
    XCH_A_R4        = 8'hCC,
    XCH_A_R5        = 8'hCD,
    XCH_A_R6        = 8'hCE,
    XCH_A_R7        = 8'hCF,
    POP             = 8'hD0,
    ACALL_7         = 8'hD1,
    SETB_BIT        = 8'hD2,
    SETB_C          = 8'hD3,
    DA_A            = 8'hD4,
    DJNZ_D          = 8'hD5,
    XCHD_A_ATR0     = 8'hD6,
    XCHD_A_ATR1     = 8'hD7,
    DJNZ_R0         = 8'hD8,
    DJNZ_R1         = 8'hD9,
    DJNZ_R2         = 8'hDA,
    DJNZ_R3         = 8'hDB,
    DJNZ_R4         = 8'hDC,
    DJNZ_R5         = 8'hDD,
    DJNZ_R6         = 8'hDE,
    DJNZ_R7         = 8'hDF,
    MOVX_A_ATDPTR   = 8'hE0,
    AJMP_8          = 8'hE1,
    MOVX_A_ATR0     = 8'hE2,
    MOVX_A_ATR1     = 8'hE3,
    CLR_A           = 8'hE4,
    MOV_A_D         = 8'hE5,
    MOV_A_ATR0      = 8'hE6,
    MOV_A_ATR1      = 8'hE7,
    MOV_A_R0        = 8'hE8,
    MOV_A_R1        = 8'hE9,
    MOV_A_R2        = 8'hEA,
    MOV_A_R3        = 8'hEB,
    MOV_A_R4        = 8'hEC,
    MOV_A_R5        = 8'hED,
    MOV_A_R6        = 8'hEE,
    MOV_A_R7        = 8'hEF,
    MOVX_ATDPTR_A   = 8'hF0,
    ACALL_8         = 8'hF1,
    MOVX_ATR0_A     = 8'hF2,
    MOVX_ATR1_A     = 8'hF3,
    CPL_A           = 8'hF4,
    MOV_D_A         = 8'hF5,
    MOV_ATR0_A      = 8'hF6,
    MOV_ATR1_A      = 8'hF7,
    MOV_R0_A        = 8'hF8,
    MOV_R1_A        = 8'hF9,
    MOV_R2_A        = 8'hFA,
    MOV_R3_A        = 8'hFB,
    MOV_R4_A        = 8'hFC,
    MOV_R5_A        = 8'hFD,
    MOV_R6_A        = 8'hFE,
    MOV_R7_A        = 8'hFF](bits:8);










'>