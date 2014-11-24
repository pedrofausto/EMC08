<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_bfm_o.e
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
// Purpose: Create output instance of signals from dut to the BFM output.
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
// Include Files: mc_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_bfm_o_h;

extend mc_bfm_o_u {
   // create the instance of the output ports
   !rom_rd_i_b_p              : inout simple_port of bit; // read from rom
   !ram_rd_i_b_p              : inout simple_port of bit; // read from ram
   !ram_wr_i_b_p              : inout simple_port of bit; // write in ram
   !bit_byte_flag_i_p         : inout simple_port of bit; // bit or byte operation
   !ext_ram_i_p               : inout simple_port of bit; // external ram access
   !rom_addr_i_p              : inout simple_port of uint(bits:16); // rom address
   !ram_addr_i_p              : inout simple_port of uint(bits:8 ); // ram address
   !ram_data_i_p              : inout simple_port of uint(bits:8 ); // ram data
   !bus_ctrl_ea_b_i_p         : inout simple_port of bit; // bus control external 
   !bus_ctrl_data_i_p         : inout simple_port of uint(bits:8 ); // bus control data for external access
   
   // output ports
   !bus_ctrl_data_o_p         : inout simple_port of uint(bits:8 ); // data to bus control
   !bus_ctrl_addr_o_p         : inout simple_port of uint(bits:16); // address to control bus
   !bus_ctrl_ext_rom_rd_o_b_p : inout simple_port of bit; // rom external ctrl bus read 
   !bus_ctrl_ext_ram_rd_o_b_p : inout simple_port of bit; // ram external ctrl bus read
   !bus_ctrl_ext_ram_wr_o_b_p : inout simple_port of bit; // write enable external ram through cbus
   !rom_data_o_p              : inout simple_port of uint(bits:8); // rom data output
   !ram_data_o_p              : inout simple_port of uint(bits:8); // rom data output
   
   !int_ram_data_i_p          : inout simple_port of uint(bits:8); // Added by Pedro
   
   !dut_ram_data_i_p          : inout simple_port of uint(bits:8);
  
   drive_bus() @clock_e is only {
      --out("---------------------------------------------------> inside drive_bus()... @mc_bfm_o.e");
   };
};

'>
