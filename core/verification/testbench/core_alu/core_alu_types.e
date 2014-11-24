<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_types.e
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
// Keywords: alu - aritmetic and logic unit
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

type core_alu_env_name_t: [CORE_ALU, CORE_ALU_IN, CORE_ALU_OUT];

type core_alu_signal_type_kind: [
   ALU_NONE    = 5'h00,
   ALU_ADD     = 5'h01,
   ALU_INC     = 5'h02,
   ALU_ADDC    = 5'h03,
   ALU_SUB     = 5'h04,
   ALU_DEC     = 5'h05,
   ALU_MUL     = 5'h06,
   ALU_DIV     = 5'h07,
   ALU_DA      = 5'h08,
   ALU_AND     = 5'h09, // inst anl
   ALU_XOR     = 5'h0A, // inst xrl
   ALU_OR      = 5'h0B, // inst orl
   ALU_RL      = 5'h0C,
   ALU_RLC     = 5'h0D,
   ALU_RR      = 5'h0E,
   ALU_RRC     = 5'h0F,
   ALU_CPL     = 5'h10,
   ALU_COMP    = 5'h11,// inst cjne
   ALU_SWAP    = 5'h12,
   ALU_DISABLE = 5'h13
] (bits:5);

'>
