<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_agent.e
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
// Keywords: alu - aritmetic and logic unit, sig - signal map, mon - monitor
// -----------------------------------------------------------------------------
// Purpose: Class that connect the monitor at signal map, and BFM`s signals
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: connect_pointers()
// Include Files: core_alu_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_agent_h;

extend core_alu_agent_u {
   connect_pointers() is also {    
      mon.CORE_ALU_ENABLE_p = sig.CORE_ALU_ENABLE_p;
      mon.CORE_ALU_OPER1_p  = sig.CORE_ALU_OPER1_p;
      mon.CORE_ALU_OPER2_p  = sig.CORE_ALU_OPER2_p;
      mon.CORE_ALU_OPCODE_p = sig.CORE_ALU_OPCODE_p;
      mon.CORE_ALU_CY_IN_p  = sig.CORE_ALU_CY_IN_p;
      mon.CORE_ALU_AC_IN_p  = sig.CORE_ALU_AC_IN_p;
      mon.CORE_ALU_OV_IN_p  = sig.CORE_ALU_OV_IN_p;
      mon.CORE_ALU_CY_OUT_p = sig.CORE_ALU_CY_OUT_p;
      mon.CORE_ALU_AC_OUT_p = sig.CORE_ALU_AC_OUT_p;
      mon.CORE_ALU_OV_OUT_p = sig.CORE_ALU_OV_OUT_p;
      mon.CORE_ALU_RESULT_p = sig.CORE_ALU_RESULT_p;
   };

   // when CORE_ALU_IN than map the signal between signal map and monitor
   when ACTIVE CORE_ALU_IN core_alu_agent_u {
      connect_pointers() is also {    
         bfm.CORE_ALU_ENABLE_p = sig.CORE_ALU_ENABLE_p;
         bfm.CORE_ALU_OPER1_p  = sig.CORE_ALU_OPER1_p;
         bfm.CORE_ALU_OPER2_p  = sig.CORE_ALU_OPER2_p;
         bfm.CORE_ALU_OPCODE_p = sig.CORE_ALU_OPCODE_p;
         bfm.CORE_ALU_CY_IN_p  = sig.CORE_ALU_CY_IN_p;
         bfm.CORE_ALU_AC_IN_p  = sig.CORE_ALU_AC_IN_p;
         bfm.CORE_ALU_OV_IN_p  = sig.CORE_ALU_OV_IN_p;
         bfm.CORE_ALU_CY_OUT_p = sig.CORE_ALU_CY_OUT_p;
         bfm.CORE_ALU_AC_OUT_p = sig.CORE_ALU_AC_OUT_p;
         bfm.CORE_ALU_OV_OUT_p = sig.CORE_ALU_OV_OUT_p;
         bfm.CORE_ALU_RESULT_p = sig.CORE_ALU_RESULT_p;
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE CORE_ALU_OUT core_alu_agent_u {
      connect_pointers() is also {
         bfm.CORE_ALU_ENABLE_p = sig.CORE_ALU_ENABLE_p;
         bfm.CORE_ALU_OPER1_p  = sig.CORE_ALU_OPER1_p;
         bfm.CORE_ALU_OPER2_p  = sig.CORE_ALU_OPER2_p;
         bfm.CORE_ALU_OPCODE_p = sig.CORE_ALU_OPCODE_p;
         bfm.CORE_ALU_CY_IN_p  = sig.CORE_ALU_CY_IN_p;
         bfm.CORE_ALU_AC_IN_p  = sig.CORE_ALU_AC_IN_p;
         bfm.CORE_ALU_OV_IN_p  = sig.CORE_ALU_OV_IN_p;
         bfm.CORE_ALU_CY_OUT_p = sig.CORE_ALU_CY_OUT_p;
         bfm.CORE_ALU_AC_OUT_p = sig.CORE_ALU_AC_OUT_p;
         bfm.CORE_ALU_OV_OUT_p = sig.CORE_ALU_OV_OUT_p;
         bfm.CORE_ALU_RESULT_p = sig.CORE_ALU_RESULT_p;
      };
   };
};

'>
