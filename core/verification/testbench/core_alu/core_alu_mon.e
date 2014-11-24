<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_mon.e
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
// Keywords: alu - aritmetic and logic unit, mon - monitor
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
// Local Functions: none
// Include Files: core_alu_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_mon_h;

extend core_alu_mon_u {
   // instance the ports used in monitor
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

   // events to control the on/off state
   event disable is fall(CORE_ALU_ENABLE_p$)@sim;
   event enable  is rise(CORE_ALU_ENABLE_p$)@sim;

//   event for inputs mapping
//   event coverALU;
//   cover coverALU is {
//      item CORE_ALU_OPER1_p$;
//      item CORE_ALU_OPER1_p$;
//      item CORE_ALU_OPER2_p$;
//      item CORE_ALU_OPCODE_p$;
//      item CORE_ALU_CY_IN_p$;
//      item CORE_ALU_AC_IN_p$;
//      item CORE_ALU_OV_IN_p$;
//      item CORE_ALU_CY_OUT_p$;
//      item CORE_ALU_AC_OUT_p$;
//      item CORE_ALU_OV_OUT_p$;
//      item CORE_ALU_RESULT_p$;

      //cross add_dealer, add_player;
//   };
   
   //put block events here
  
   when CORE_ALU_IN core_alu_mon_u {
      watch_bus() @clock_e is also {
         while TRUE {
            // calls the reference model to check the DUT
            reference_model();

            // the monitor detected a packet
            emit pkt_detected_e;
         };
      };
   };
   
   when CORE_ALU_OUT core_alu_mon_u {
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>