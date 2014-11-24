<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_agent.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Map the monitor with sig and bfm in, bfm out with sig instances to the verification environment
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
// Include Files: mc_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_agent_h;

extend mc_agent_u {
   connect_pointers() is also {
      mon.rom_rd_i_b_p                 = sig.rom_rd_i_b_p;
      mon.ram_rd_i_b_p                 = sig.ram_rd_i_b_p;
      mon.ram_wr_i_b_p                 = sig.ram_wr_i_b_p;
      mon.bit_byte_flag_i_p            = sig.bit_byte_flag_i_p;
      mon.ext_ram_i_p                  = sig.ext_ram_i_p;
      mon.rom_addr_i_p                 = sig.rom_addr_i_p;
      mon.ram_addr_i_p                 = sig.ram_addr_i_p;
      mon.ram_data_i_p                 = sig.ram_data_i_p;
      mon.bus_ctrl_ea_b_i_p            = sig.bus_ctrl_ea_b_i_p;
      mon.bus_ctrl_data_i_p            = sig.bus_ctrl_data_i_p;
      mon.bus_ctrl_data_o_p            = sig.bus_ctrl_data_o_p;
      mon.bus_ctrl_addr_o_p            = sig.bus_ctrl_addr_o_p;
      mon.bus_ctrl_ext_rom_rd_o_b_p    = sig.bus_ctrl_ext_rom_rd_o_b_p;
      mon.bus_ctrl_ext_ram_rd_o_b_p    = sig.bus_ctrl_ext_ram_rd_o_b_p;
      mon.bus_ctrl_ext_ram_wr_o_b_p    = sig.bus_ctrl_ext_ram_wr_o_b_p;
      mon.rom_data_o_p                 = sig.rom_data_o_p;
      mon.ram_data_o_p                 = sig.ram_data_o_p;
      
      mon.int_ram_data_i_p	            = sig.int_ram_data_i_p;
      mon.dut_ram_data_i_p             = sig.dut_ram_data_i_p;
   };

   // when BR_IN than map the signal between signal map and monitor
   when ACTIVE MC_IN mc_agent_u {
      connect_pointers() is also {    
        bfm.rom_rd_i_b_p               = sig.rom_rd_i_b_p;
        bfm.ram_rd_i_b_p               = sig.ram_rd_i_b_p;
        bfm.ram_wr_i_b_p               = sig.ram_wr_i_b_p;
        bfm.bit_byte_flag_i_p          = sig.bit_byte_flag_i_p;
        bfm.ext_ram_i_p                = sig.ext_ram_i_p;
        bfm.rom_addr_i_p               = sig.rom_addr_i_p;
        bfm.ram_addr_i_p               = sig.ram_addr_i_p;
        bfm.ram_data_i_p               = sig.ram_data_i_p;
        bfm.bus_ctrl_ea_b_i_p          = sig.bus_ctrl_ea_b_i_p;
        bfm.bus_ctrl_data_i_p          = sig.bus_ctrl_data_i_p;
        bfm.bus_ctrl_data_o_p          = sig.bus_ctrl_data_o_p;
        bfm.bus_ctrl_addr_o_p          = sig.bus_ctrl_addr_o_p;
        bfm.bus_ctrl_ext_rom_rd_o_b_p  = sig.bus_ctrl_ext_rom_rd_o_b_p;
        bfm.bus_ctrl_ext_ram_rd_o_b_p  = sig.bus_ctrl_ext_ram_rd_o_b_p;
        bfm.bus_ctrl_ext_ram_wr_o_b_p  = sig.bus_ctrl_ext_ram_wr_o_b_p;
        bfm.rom_data_o_p               = sig.rom_data_o_p;
        bfm.ram_data_o_p               = sig.ram_data_o_p;
        
        bfm.int_ram_data_i_p	         = sig.int_ram_data_i_p;
	     bfm.dut_ram_data_i_p           = sig.dut_ram_data_i_p;
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE MC_OUT mc_agent_u {
      connect_pointers() is also {
        bfm.rom_rd_i_b_p               = sig.rom_rd_i_b_p;
        bfm.ram_rd_i_b_p               = sig.ram_rd_i_b_p;
        bfm.ram_wr_i_b_p               = sig.ram_wr_i_b_p;
        bfm.bit_byte_flag_i_p          = sig.bit_byte_flag_i_p;
        bfm.ext_ram_i_p                = sig.ext_ram_i_p;
        bfm.rom_addr_i_p               = sig.rom_addr_i_p;
        bfm.ram_addr_i_p               = sig.ram_addr_i_p;
        bfm.ram_data_i_p               = sig.ram_data_i_p;
        bfm.bus_ctrl_ea_b_i_p          = sig.bus_ctrl_ea_b_i_p;
        bfm.bus_ctrl_data_i_p          = sig.bus_ctrl_data_i_p;
        bfm.bus_ctrl_data_o_p          = sig.bus_ctrl_data_o_p;
        bfm.bus_ctrl_addr_o_p          = sig.bus_ctrl_addr_o_p;
        bfm.bus_ctrl_ext_rom_rd_o_b_p  = sig.bus_ctrl_ext_rom_rd_o_b_p;
        bfm.bus_ctrl_ext_ram_rd_o_b_p  = sig.bus_ctrl_ext_ram_rd_o_b_p;
        bfm.bus_ctrl_ext_ram_wr_o_b_p  = sig.bus_ctrl_ext_ram_wr_o_b_p;
        bfm.rom_data_o_p               = sig.rom_data_o_p;
        bfm.ram_data_o_p               = sig.ram_data_o_p;
        
	     bfm.int_ram_data_i_p	         = sig.int_ram_data_i_p;
        bfm.dut_ram_data_i_p           = sig.dut_ram_data_i_p;
      };
   };
};

'>
