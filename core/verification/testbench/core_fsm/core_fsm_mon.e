<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_mon.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 02/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core inite state machine, mon - monitor
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
// Include Files: core_fsm_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_mon_h;

extend core_fsm_mon_u {
   //general signals
   !p_reset      : inout simple_port of bit; 
   !p_psw_i      : inout simple_port of uint(bits:2);  

   !p_sfr_data_i : inout simple_port of uint(bits:8);
   !p_ram_data_i : inout simple_port of uint(bits:8);
   !p_rom_data_i : inout simple_port of uint(bits:8);

   // from interrupt block
   !p_int_vect_i   : inout simple_port of uint(bits:3);
   !p_int_vect_i_0 : inout simple_port of bit;
   !p_int_vect_i_1 : inout simple_port of bit;
   !p_int_vect_i_2 : inout simple_port of bit;

   // from ALU
   !core_alu_cy_i_p : inout simple_port of bit;

   //pcau ports
   //p_pc_i        : inout simple_port of uint (bits:16) is instance;
   
   ////////////////// OUTPUTS PORTS///////////////////////////////
   !p_sfr_addr_o  : inout simple_port of uint(bits:8);
   !p_rom_addr_o  : inout simple_port of uint(bits:16);
   !p_ram_addr_o  : inout simple_port of uint(bits:8);
   
   // to ALU
   !p_alu_op1_o   : inout simple_port of uint(bits:8);
   !p_alu_op2_o   : inout simple_port of uint(bits:8);
   !p_alu_opcode_o: inout simple_port of uint(bits:5);
   !p_alu_en_o    : inout simple_port of bit;
   
   !p_sfr_data_o  : inout simple_port of uint(bits:8);
   
   !p_ram_data_o  : inout simple_port of uint(bits:8);
   
   !p_fsm_ext_ram_o: inout simple_port of bit;
      
   !p_bit_byte_flag_o: inout simple_port of bit;
   !p_rom_rd_o       : inout simple_port of bit;
   !p_ram_rd_o       : inout simple_port of bit;
   !p_sfr_rd_o       : inout simple_port of bit;
   !p_ram_wr_o       : inout simple_port of bit;
   !p_sfr_wr_o       : inout simple_port of bit;
   
   // interrupt block
   !p_int_na_o       : inout simple_port of bit;
   !p_int_rdy        : inout simple_port of bit;
   
   //internal port
   !p_state       : inout simple_port of uint(bits:3);
   
   when CORE_FSM_IN core_fsm_mon_u {
      //////////////////////// TCM METHODS /////////////////////
      watch_bus() @clock_e is also {
         while TRUE {   
           // calls the reference model to check the DUT
           reference_model();
          
           // the monitor detected a packet
           emit pkt_detected_e;
         }; 
      };
   };
   
   when CORE_FSM_OUT core_fsm_mon_u {
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>