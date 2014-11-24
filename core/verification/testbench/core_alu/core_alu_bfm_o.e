<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_bfm_o.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: Receive the DUT output packet of signal
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus()
// Include Files: core_alu_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_bfm_o_h;

extend core_alu_bfm_o_u {
   // create the instance of the output ports
   !CORE_ALU_ENABLE_p : inout simple_port of bit;
   !CORE_ALU_OPER1_p  : inout simple_port of uint(bits:8);
   !CORE_ALU_OPER2_p  : inout simple_port of uint(bits:8);
   !CORE_ALU_OPCODE_p : inout simple_port of uint(bits:5);
   !CORE_ALU_CY_IN_p  : inout simple_port of bit;
   !CORE_ALU_AC_IN_p  : inout simple_port of bit;
   !CORE_ALU_OV_IN_p  : inout simple_port of bit;
   !CORE_ALU_RESULT_p : inout simple_port of uint(bits:16);
   !CORE_ALU_CY_OUT_p : inout simple_port of bit;
   !CORE_ALU_AC_OUT_p : inout simple_port of bit;
   !CORE_ALU_OV_OUT_p : inout simple_port of bit;
  
   drive_bus() @clock_e is only {
      //while TRUE {
      //   if wanted, see some output
      //};
   };
};

'>
