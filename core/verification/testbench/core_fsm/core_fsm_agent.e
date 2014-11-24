<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_agent.e
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
// Keywords: core_fsm - core finite state machine, sig - signal map, mon - monitor
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
// Include Files: core_fsm_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_agent_h;

extend core_fsm_agent_u {
   connect_pointers() is also {    
      // INPUTS
      mon.p_reset         = sig.p_reset;
      mon.p_psw_i         = sig.p_psw_i;
      mon.p_sfr_data_i    = sig.p_sfr_data_i;
      mon.p_ram_data_i    = sig.p_ram_data_i;
      mon.p_rom_data_i    = sig.p_rom_data_i;
      mon.p_int_vect_i    = sig.p_int_vect_i;
      mon.p_int_vect_i_0  = sig.p_int_vect_i_0;
      mon.p_int_vect_i_1  = sig.p_int_vect_i_1;
      mon.p_int_vect_i_2  = sig.p_int_vect_i_2;
      mon.p_state         = sig.p_state;
      mon.core_alu_cy_i_p = sig.core_alu_cy_i_p;
      
      // OUTPUTS
      mon.p_sfr_addr_o      = sig.p_sfr_addr_o;
      mon.p_rom_addr_o      = sig.p_rom_addr_o;
      mon.p_ram_addr_o      = sig.p_ram_addr_o;
      mon.p_alu_op1_o       = sig.p_alu_op1_o;
      mon.p_alu_op2_o       = sig.p_alu_op2_o;
      mon.p_alu_opcode_o    = sig.p_alu_opcode_o;
      mon.p_alu_en_o        = sig.p_alu_en_o;
      mon.p_sfr_data_o      = sig.p_sfr_data_o;
      mon.p_ram_data_o      = sig.p_ram_data_o;
      mon.p_bit_byte_flag_o = sig.p_bit_byte_flag_o;
      mon.p_rom_rd_o        = sig.p_rom_rd_o;
      mon.p_ram_rd_o        = sig.p_ram_rd_o;
      mon.p_sfr_rd_o        = sig.p_sfr_rd_o;
      mon.p_ram_wr_o        = sig.p_ram_wr_o;
      mon.p_sfr_wr_o        = sig.p_sfr_wr_o;
      mon.p_int_na_o        = sig.p_int_na_o;
      mon.p_int_rdy         = sig.p_int_rdy;
      mon.p_fsm_ext_ram_o   = sig.p_fsm_ext_ram_o;
      
   };

   // when CORE_FSM_IN than map the signal between signal map and monitor
   when ACTIVE CORE_FSM_IN core_fsm_agent_u {
      connect_pointers() is also {    
         // INPUTS
      bfm.p_reset         = sig.p_reset;
      bfm.p_psw_i         = sig.p_psw_i;
      bfm.p_sfr_data_i    = sig.p_sfr_data_i;
      bfm.p_ram_data_i    = sig.p_ram_data_i;
      bfm.p_rom_data_i    = sig.p_rom_data_i;
      bfm.p_int_vect_i    = sig.p_int_vect_i;
      bfm.p_int_vect_i_0  = sig.p_int_vect_i_0;
      bfm.p_int_vect_i_1  = sig.p_int_vect_i_1;
      bfm.p_int_vect_i_2  = sig.p_int_vect_i_2;
      bfm.core_alu_cy_i_p = sig.core_alu_cy_i_p;
            
      // OUTPUTS
      bfm.p_sfr_addr_o      = sig.p_sfr_addr_o;
      bfm.p_rom_addr_o      = sig.p_rom_addr_o;
      bfm.p_ram_addr_o      = sig.p_ram_addr_o;
      bfm.p_alu_op1_o       = sig.p_alu_op1_o;
      bfm.p_alu_op2_o       = sig.p_alu_op2_o;
      bfm.p_alu_opcode_o    = sig.p_alu_opcode_o;
      bfm.p_alu_en_o        = sig.p_alu_en_o;
      bfm.p_sfr_data_o      = sig.p_sfr_data_o;
      bfm.p_ram_data_o      = sig.p_ram_data_o;
      bfm.p_bit_byte_flag_o = sig.p_bit_byte_flag_o;
      bfm.p_rom_rd_o        = sig.p_rom_rd_o;
      bfm.p_ram_rd_o        = sig.p_ram_rd_o;
      bfm.p_sfr_rd_o        = sig.p_sfr_rd_o;
      bfm.p_ram_wr_o        = sig.p_ram_wr_o;
      bfm.p_sfr_wr_o        = sig.p_sfr_wr_o;
      bfm.p_int_na_o        = sig.p_int_na_o;
      bfm.p_int_rdy         = sig.p_int_rdy;
      bfm.p_fsm_ext_ram_o   = sig.p_fsm_ext_ram_o;
            
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE CORE_FSM_OUT core_fsm_agent_u {
      connect_pointers() is also {
         // INPUTS
      bfm.p_reset         = sig.p_reset;
      bfm.p_psw_i         = sig.p_psw_i;
      bfm.p_sfr_data_i    = sig.p_sfr_data_i;
      bfm.p_ram_data_i    = sig.p_ram_data_i;
      bfm.p_rom_data_i    = sig.p_rom_data_i;
      bfm.p_int_vect_i    = sig.p_int_vect_i;
      bfm.p_int_vect_i_0  = sig.p_int_vect_i_0;
      bfm.p_int_vect_i_1  = sig.p_int_vect_i_1;
      bfm.p_int_vect_i_2  = sig.p_int_vect_i_2;
      bfm.core_alu_cy_i_p = sig.core_alu_cy_i_p;
            
      // OUTPUTS
      bfm.p_sfr_addr_o      = sig.p_sfr_addr_o;
      bfm.p_rom_addr_o      = sig.p_rom_addr_o;
      bfm.p_ram_addr_o      = sig.p_ram_addr_o;
      bfm.p_alu_op1_o       = sig.p_alu_op1_o;
      bfm.p_alu_op2_o       = sig.p_alu_op2_o;
      bfm.p_alu_opcode_o    = sig.p_alu_opcode_o;
      bfm.p_alu_en_o        = sig.p_alu_en_o;
      bfm.p_sfr_data_o      = sig.p_sfr_data_o;
      bfm.p_ram_data_o      = sig.p_ram_data_o;
      bfm.p_bit_byte_flag_o = sig.p_bit_byte_flag_o;
      bfm.p_rom_rd_o        = sig.p_rom_rd_o;
      bfm.p_ram_rd_o        = sig.p_ram_rd_o;
      bfm.p_sfr_rd_o        = sig.p_sfr_rd_o;
      bfm.p_ram_wr_o        = sig.p_ram_wr_o;
      bfm.p_sfr_wr_o        = sig.p_sfr_wr_o;
      bfm.p_int_na_o        = sig.p_int_na_o;
      bfm.p_int_rdy         = sig.p_int_rdy;
      bfm.p_fsm_ext_ram_o   = sig.p_fsm_ext_ram_o;
            
      };
   };
};

'>
