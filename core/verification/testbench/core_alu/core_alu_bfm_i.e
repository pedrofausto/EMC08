<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_bfm_i.e
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
// Purpose: This unit will drive the interface signals of the router DUT. 
// It will get an instance of a packet it is to drive from the sequence driver
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus(), send_pkt()
// Include Files: core_alu_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_bfm_i_h;

extend core_alu_bfm_i_u {
   // instance the ports used in bfm in
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
  
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: core_alu_signal_type;

      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();

         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);

         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
  
   // function to send signal packets to the DUT
   send_pkt(in_pkt: core_alu_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences
      if (in_pkt.pkt_kind == ALU_DISABLE) {
         //out("ALU IN DISABLE MODE");
         CORE_ALU_ENABLE_p$ = 0;
         CORE_ALU_OPER1_p$  = in_pkt.core_alu_oper1;
         CORE_ALU_OPER2_p$  = in_pkt.core_alu_oper2;
         CORE_ALU_OPCODE_p$ = in_pkt.core_alu_opcode;
         CORE_ALU_CY_IN_p$  = in_pkt.core_alu_cy_in;
         CORE_ALU_AC_IN_p$  = in_pkt.core_alu_ac_in;
         CORE_ALU_OV_IN_p$  = in_pkt.core_alu_ov_in;
      } else {
         //out("ALU IN OPERATION");
         CORE_ALU_ENABLE_p$ = in_pkt.core_alu_enable;
         CORE_ALU_OPER1_p$  = in_pkt.core_alu_oper1;
         CORE_ALU_OPER2_p$  = in_pkt.core_alu_oper2;
         CORE_ALU_OPCODE_p$ = in_pkt.core_alu_opcode;
         CORE_ALU_CY_IN_p$  = in_pkt.core_alu_cy_in;
         CORE_ALU_AC_IN_p$  = in_pkt.core_alu_ac_in;
         CORE_ALU_OV_IN_p$  = in_pkt.core_alu_ov_in;
         //wait [400] * cycle;
         //out("OUT ALU OPERATION");
      };
   };
};

'>
