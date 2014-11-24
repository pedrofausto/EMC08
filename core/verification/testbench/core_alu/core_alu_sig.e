<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_sig.e
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
// Keywords: alu - aritmetic and logic unit, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Map the external signals to the verification environment
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
// Include Files: core_alu_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_sig_h;

extend core_alu_sig_u {
   // input ports
   CORE_ALU_ENABLE_p : inout simple_port of bit is instance;
   CORE_ALU_OPER1_p  : inout simple_port of uint(bits:8) is instance;
   CORE_ALU_OPER2_p  : inout simple_port of uint(bits:8) is instance;
   CORE_ALU_OPCODE_p : inout simple_port of uint(bits:5) is instance;
   CORE_ALU_CY_IN_p  : inout simple_port of bit is instance;
   CORE_ALU_AC_IN_p  : inout simple_port of bit is instance;
   CORE_ALU_OV_IN_p  : inout simple_port of bit is instance;

   // output ports
   CORE_ALU_RESULT_p : inout simple_port of uint(bits:16) is instance;
   CORE_ALU_CY_OUT_p : inout simple_port of bit is instance;
   CORE_ALU_AC_OUT_p : inout simple_port of bit is instance;
   CORE_ALU_OV_OUT_p : inout simple_port of bit is instance;

   // Connect the ports to the external design
   keep bind(CORE_ALU_ENABLE_p,external);
   keep bind(CORE_ALU_OPER1_p,external);
   keep bind(CORE_ALU_OPER2_p,external);
   keep bind(CORE_ALU_OPCODE_p,external);
   keep bind(CORE_ALU_CY_IN_p,external);
   keep bind(CORE_ALU_AC_IN_p,external);
   keep bind(CORE_ALU_OV_IN_p,external);
   keep bind(CORE_ALU_CY_OUT_p,external);
   keep bind(CORE_ALU_AC_OUT_p,external);
   keep bind(CORE_ALU_OV_OUT_p,external);
   keep bind(CORE_ALU_RESULT_p,external);

   when CORE_ALU_IN core_alu_sig_u {
      // Path specification to the CORE ALU IN signals
      keep CORE_ALU_ENABLE_p.hdl_path() == "core_alu_enable_o";
      keep CORE_ALU_OPER1_p.hdl_path()  == "core_alu_operand1_o";
      keep CORE_ALU_OPER2_p.hdl_path()  == "core_alu_operand2_o";
      keep CORE_ALU_OPCODE_p.hdl_path() == "core_alu_opcode_o";
      keep CORE_ALU_CY_IN_p.hdl_path()  == "core_alu_cy_o";
      keep CORE_ALU_AC_IN_p.hdl_path()  == "core_alu_ac_o";
      keep CORE_ALU_OV_IN_p.hdl_path()  == "core_alu_ov_o";
      keep CORE_ALU_CY_OUT_p.hdl_path() == "core_alu_cy_i";
      keep CORE_ALU_AC_OUT_p.hdl_path() == "core_alu_ac_i";
      keep CORE_ALU_OV_OUT_p.hdl_path() == "core_alu_ov_i";
      keep CORE_ALU_RESULT_p.hdl_path() == "core_alu_result_i";
   };
  
   when CORE_ALU_OUT core_alu_sig_u {
      // Path specification to the CORE ALU OUT signals
      keep CORE_ALU_ENABLE_p.hdl_path() == "core_alu_enable_o";
      keep CORE_ALU_OPER1_p.hdl_path()  == "core_alu_operand1_o";
      keep CORE_ALU_OPER2_p.hdl_path()  == "core_alu_operand2_o";
      keep CORE_ALU_OPCODE_p.hdl_path() == "core_alu_opcode_o";
      keep CORE_ALU_CY_IN_p.hdl_path()  == "core_alu_cy_o";
      keep CORE_ALU_AC_IN_p.hdl_path()  == "core_alu_ac_o";
      keep CORE_ALU_OV_IN_p.hdl_path()  == "core_alu_ov_o";
      keep CORE_ALU_CY_OUT_p.hdl_path() == "core_alu_cy_i";
      keep CORE_ALU_AC_OUT_p.hdl_path() == "core_alu_ac_i";
      keep CORE_ALU_OV_OUT_p.hdl_path() == "core_alu_ov_i";
      keep CORE_ALU_RESULT_p.hdl_path() == "core_alu_result_i";
   };
};

'>
