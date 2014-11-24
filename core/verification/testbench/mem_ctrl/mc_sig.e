<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_sig.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : Pedro
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: instantiates all ports of dut, bind them and connect
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
// Include Files: mc_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_sig_h;

extend mc_sig_u {
   // input ports
   rom_rd_i_b_p         : inout simple_port of bit is instance; // read from rom
   ram_rd_i_b_p         : inout simple_port of bit is instance; // read from ram
   ram_wr_i_b_p         : inout simple_port of bit is instance; // write in ram
   bit_byte_flag_i_p    : inout simple_port of bit is instance; // bit or byte operation
   ext_ram_i_p          : inout simple_port of bit is instance; // external ram access
   rom_addr_i_p         : inout simple_port of uint(bits:16) is instance; // rom address
   ram_addr_i_p         : inout simple_port of uint(bits:8 ) is instance; // ram address
   ram_data_i_p         : inout simple_port of uint(bits:8 ) is instance; // ram data
   bus_ctrl_ea_b_i_p    : inout simple_port of bit is instance; // bus control external 
   bus_ctrl_data_i_p    : inout simple_port of uint(bits:8 ) is instance; // bus control data for external access
   
   // output ports
   bus_ctrl_data_o_p         : inout simple_port of uint(bits:8 ) is instance; // data to bus control
   bus_ctrl_addr_o_p         : inout simple_port of uint(bits:16) is instance; // address to control bus
   bus_ctrl_ext_rom_rd_o_b_p : inout simple_port of bit is instance; // rom external ctrl bus read 
   bus_ctrl_ext_ram_rd_o_b_p : inout simple_port of bit is instance; // ram external ctrl bus read
   bus_ctrl_ext_ram_wr_o_b_p : inout simple_port of bit is instance; // write enable external ram through cbus
   rom_data_o_p              : inout simple_port of uint(bits:8) is instance; // rom data output
   ram_data_o_p              : inout simple_port of uint(bits:8) is instance; // rom data output
   
   
   int_ram_data_i_p	        : inout simple_port of uint(bits:8) is instance;
   //dut ports
   dut_ram_data_i_p          : inout simple_port of uint(bits:8) is instance;
   
   // Connect the ports to the external design
   keep bind(rom_rd_i_b_p              ,external);
   keep bind(ram_rd_i_b_p              ,external);
   keep bind(ram_wr_i_b_p              ,external);
   keep bind(bit_byte_flag_i_p         ,external);
   keep bind(ext_ram_i_p               ,external);
   keep bind(rom_addr_i_p              ,external);
   keep bind(ram_addr_i_p              ,external);
   keep bind(ram_data_i_p              ,external);
   keep bind(bus_ctrl_ea_b_i_p         ,external);
   keep bind(bus_ctrl_data_i_p         ,external);
   //out
   keep bind(bus_ctrl_data_o_p         ,external);
   keep bind(bus_ctrl_addr_o_p         ,external);
   keep bind(bus_ctrl_ext_rom_rd_o_b_p ,external);
   keep bind(bus_ctrl_ext_ram_rd_o_b_p ,external);
   keep bind(bus_ctrl_ext_ram_wr_o_b_p ,external);
   keep bind(rom_data_o_p              ,external);
   keep bind(ram_data_o_p              ,external);
   
   keep bind(int_ram_data_i_p	         ,external); // Added by Pedro
   //dut
   keep bind(dut_ram_data_i_p          ,external);
   
   
   when MC_IN mc_sig_u {
      // Path specification to the BR IN signals
      keep rom_rd_i_b_p.hdl_path()              == "rom_rd_i";
      keep ram_rd_i_b_p.hdl_path()              == "ram_rd_i";
      keep ram_wr_i_b_p.hdl_path()              == "ram_wr_i";
      keep bit_byte_flag_i_p.hdl_path()         == "bit_byte_flag_i";
      keep ext_ram_i_p.hdl_path()               == "ext_ram_i";
      keep rom_addr_i_p.hdl_path()              == "rom_addr_i";
      keep ram_addr_i_p.hdl_path()              == "ram_addr_i";
      keep ram_data_i_p.hdl_path()              == "ram_data_i";
      keep bus_ctrl_ea_b_i_p.hdl_path()         == "bus_ctrl_ea_b_i";
      keep bus_ctrl_data_i_p.hdl_path()         == "bus_ctrl_data_i";
      
      keep bus_ctrl_data_o_p.hdl_path()         == "bus_ctrl_data_o";
      keep bus_ctrl_addr_o_p.hdl_path()         == "bus_ctrl_addr_o";
      keep bus_ctrl_ext_rom_rd_o_b_p.hdl_path() == "bus_ctrl_ext_rom_rd_b_o";
      keep bus_ctrl_ext_ram_rd_o_b_p.hdl_path() == "bus_ctrl_ext_ram_rd_b_o";
      keep bus_ctrl_ext_ram_wr_o_b_p.hdl_path() == "bus_ctrl_ext_ram_wr_b_o";
      keep rom_data_o_p.hdl_path()              == "rom_data_o";
      keep ram_data_o_p.hdl_path()              == "ram_data_o";
      
      keep int_ram_data_i_p.hdl_path()    		== "DUT/int_ram_data_i";	// Added by Pedro
      keep dut_ram_data_i_p.hdl_path()          == "DUT/internal_ram/D";
   };
  
   when MC_OUT mc_sig_u {
      // Path specification to the BR OUT signals
      keep rom_rd_i_b_p.hdl_path()              == "rom_rd_i";
      keep ram_rd_i_b_p.hdl_path()              == "ram_rd_i";
      keep ram_wr_i_b_p.hdl_path()              == "ram_wr_i";
      keep bit_byte_flag_i_p.hdl_path()         == "bit_byte_flag_i";
      keep ext_ram_i_p.hdl_path()               == "ext_ram_i";
      keep rom_addr_i_p.hdl_path()              == "rom_addr_i";
      keep ram_addr_i_p.hdl_path()              == "ram_addr_i";
      keep ram_data_i_p.hdl_path()              == "ram_data_i";
      keep bus_ctrl_ea_b_i_p.hdl_path()         == "bus_ctrl_ea_b_i";
      keep bus_ctrl_data_i_p.hdl_path()         == "bus_ctrl_data_i";
      
      keep bus_ctrl_data_o_p.hdl_path()         == "bus_ctrl_data_o";
      keep bus_ctrl_addr_o_p.hdl_path()         == "bus_ctrl_addr_o";
      keep bus_ctrl_ext_rom_rd_o_b_p.hdl_path() == "bus_ctrl_ext_rom_rd_b_o";
      keep bus_ctrl_ext_ram_rd_o_b_p.hdl_path() == "bus_ctrl_ext_ram_rd_b_o";
      keep bus_ctrl_ext_ram_wr_o_b_p.hdl_path() == "bus_ctrl_ext_ram_wr_b_o";
      keep rom_data_o_p.hdl_path()              == "rom_data_o";
      keep ram_data_o_p.hdl_path()              == "ram_data_o";
      
      keep int_ram_data_i_p.hdl_path()    		== "DUT/int_ram_data_i";	// Added by Pedro
      
      keep dut_ram_data_i_p.hdl_path()          == "DUT/internal_ram/D";
   };
};

'>
