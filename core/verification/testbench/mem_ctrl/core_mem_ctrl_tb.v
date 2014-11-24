// --------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// --------------------------------------------------------------------
// File Name: core_mem_ctrl_tb.v
// Module Name: core_mem_ctrl_tb
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// --------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      02/09/2010  Initial Version
// 1.1      02/09/2010  Updated tests to verify the port reg_ctrl_ext_mem_en_b_o
// --------------------------------------------------------------------
// Description
// Core Submodule responsible for access internal and external memories
// --------------------------------------------------------------------

`timescale 1ns/10ps

module core_mem_ctrl_tb();

reg          clk_i;
reg          rom_rd_i;
reg          ram_rd_i;
reg          ram_wr_i;
reg          bit_byte_flag_i;
reg          ext_ram_i;
reg [15:0]   rom_addr_i;
reg [7:0]    ram_addr_i;
reg [7:0]    ram_data_i;
reg          bus_ctrl_ea_b_i;
reg [7:0]    bus_ctrl_data_i;
wire         bus_ctrl_ext_rom_rd_b_o;
wire         bus_ctrl_ext_ram_rd_b_o;
wire         bus_ctrl_ext_ram_wr_b_o;
wire [15:0]  bus_ctrl_addr_o;
wire [7:0]   bus_ctrl_data_o;
wire [7:0]   rom_data_o;
wire [7:0]   ram_data_o;

core_mem_ctrl DUT(
                     .mem_ctrl_clk_i(clk_i),
                     .mem_ctrl_rom_rd_b_i(rom_rd_i),
                     .mem_ctrl_ram_rd_b_i(ram_rd_i),
                     .mem_ctrl_ram_wr_b_i(ram_wr_i),
                     .mem_ctrl_bit_byte_flag_i(bit_byte_flag_i),
                     .mem_ctrl_ext_ram_i(ext_ram_i),
                     .mem_ctrl_rom_addr_i(rom_addr_i),
                     .mem_ctrl_ram_addr_i(ram_addr_i),
                     .mem_ctrl_ram_data_i(ram_data_i),
                     .mem_ctrl_bus_ctrl_ea_b_i(bus_ctrl_ea_b_i),
                     .mem_ctrl_bus_ctrl_data_i(bus_ctrl_data_i),
                     .mem_ctrl_bus_ctrl_data_o(bus_ctrl_data_o),
                     .mem_ctrl_bus_ctrl_addr_o(bus_ctrl_addr_o),
                     .mem_ctrl_bus_ctrl_ext_rom_rd_b_o(bus_ctrl_ext_rom_rd_b_o),
                     .mem_ctrl_bus_ctrl_ext_ram_rd_b_o(bus_ctrl_ext_ram_rd_b_o),
                     .mem_ctrl_bus_ctrl_ext_ram_wr_b_o(bus_ctrl_ext_ram_wr_b_o),
                     .mem_ctrl_rom_data_o(rom_data_o),
                     .mem_ctrl_ram_data_o(ram_data_o)
                     );


initial 
   clk_i=1'b0;
   
   always
   begin 
      #(25.0/2.0) 
      clk_i=~clk_i;
   end

endmodule
