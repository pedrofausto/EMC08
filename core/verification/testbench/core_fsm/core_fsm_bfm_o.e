<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_bfm_o.e
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
// Keywords: core_fsm - core finite state machine, bfm - bus functional mode
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
// Include Files: core_fsm_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_bfm_o_h;

extend core_fsm_bfm_o_u {
   // -------------------------------------------------------------------------
   // INPUT PORTS  INPUT PORTS  INPUT PORTS  INPUT PORTS  INPUT PORTS  INPUT PO
   // -------------------------------------------------------------------------
   //general signals
   !p_reset           : inout simple_port of bit;
   !p_psw_i           : inout simple_port of uint(bits:2);  
   
   !p_sfr_data_i      : inout simple_port of uint(bits:8);
   !p_ram_data_i      : inout simple_port of uint(bits:8);
   !p_rom_data_i      : inout simple_port of uint(bits:8);
   
   // from interrupt block
   !p_int_vect_i      : inout simple_port of uint(bits:3);
   !p_int_vect_i_0    : inout simple_port of bit;
   !p_int_vect_i_1    : inout simple_port of bit;
   !p_int_vect_i_2    : inout simple_port of bit;

   // from ALU
   !core_alu_cy_i_p   : inout simple_port of bit;

   // pcau ports
   //p_pc_i             : inout simple_port of uint (bits:16) is instance;
   // -------------------------------------------------------------------------
   // OUTPUT PORTS  OUTPUT PORTS  OUTPUT PORTS  OUTPUT PORTS  OUTPUT PORTS  OUT
   // -------------------------------------------------------------------------
   !p_sfr_addr_o      : inout simple_port of uint(bits:8);
   !p_rom_addr_o      : inout simple_port of uint(bits:16);
   !p_ram_addr_o      : inout simple_port of uint(bits:8);
   
   // to ALU
   !p_alu_op1_o       : inout simple_port of uint(bits:8);
   !p_alu_op2_o       : inout simple_port of uint(bits:8);
   !p_alu_opcode_o    : inout simple_port of uint(bits:5);
   !p_alu_en_o        : inout simple_port of bit;
   !core_alu_cy_o_p   : inout simple_port of bit;

   !p_sfr_data_o      : inout simple_port of uint(bits:8);
   !p_ram_data_o      : inout simple_port of uint(bits:8);
   !p_fsm_ext_ram_o   : inout simple_port of bit;

   // pcau ports
   //p_pcau_offset_o  : inout simple_port of uint (bits:8) is instance;
   //p_pcau_msb_o     : inout simple_port of uint (bits:8) is instance;
   //p_pcau_en_o      : inout simple_port of bit is instance;
   //p_pcau_direct_o  : inout simple_port of bit is instance;
   //p_state_o        : inout simple_port of uint (bits:3) is instance;

   !p_bit_byte_flag_o : inout simple_port of bit;
   !p_rom_rd_o        : inout simple_port of bit;
   !p_ram_rd_o        : inout simple_port of bit;
   !p_sfr_rd_o        : inout simple_port of bit;
   !p_ram_wr_o        : inout simple_port of bit;
   !p_sfr_wr_o        : inout simple_port of bit;
   
   // interrupt block
   !p_int_na_o        : inout simple_port of bit;
   !p_int_rdy         : inout simple_port of bit;

   // internal port
   //!p_state       : inout simple_port of uint(bits:2);
   // -------------------------------------------------------------------------

   drive_bus() @clock_e is only {
   };
};

'>
