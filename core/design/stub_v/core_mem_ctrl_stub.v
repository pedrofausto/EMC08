// --------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// --------------------------------------------------------------------
// File Name: core_mem_ctrl_stub.v
// Module Name: core_mem_ctrl
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// --------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 2.0      27/09/2010  Completely Verified Version
// --------------------------------------------------------------------
// Description
// Core Submodule responsible for access internal and external memories
// --------------------------------------------------------------------

module core_mem_ctrl(
                     mem_ctrl_clk_i,
                     mem_ctrl_rom_rd_b_i,
                     mem_ctrl_ram_rd_b_i,
                     mem_ctrl_ram_wr_b_i,
                     mem_ctrl_bit_byte_flag_i,
                     mem_ctrl_rom_addr_i,
                     mem_ctrl_ram_addr_i,
                     mem_ctrl_ram_data_i,
                     mem_ctrl_bus_ctrl_ea_b_i,
                     mem_ctrl_bus_ctrl_data_i,
                     mem_ctrl_bus_ctrl_data_o,
                     mem_ctrl_bus_ctrl_addr_o,
                     mem_ctrl_bus_ctrl_ext_rom_rd_b_o,
                     mem_ctrl_bus_ctrl_ext_ram_rd_b_o,
                     mem_ctrl_bus_ctrl_ext_ram_wr_b_o,
                     mem_ctrl_reg_ctrl_ext_mem_en_b_o,
                     mem_ctrl_rom_data_o,
                     mem_ctrl_ram_data_o
                     );

input          mem_ctrl_clk_i;
input          mem_ctrl_rom_rd_b_i;
input          mem_ctrl_ram_rd_b_i;
input          mem_ctrl_ram_wr_b_i;
input          mem_ctrl_bit_byte_flag_i;
input [15:0]   mem_ctrl_rom_addr_i;
input [7:0]    mem_ctrl_ram_addr_i;
input [7:0]    mem_ctrl_ram_data_i;
input          mem_ctrl_bus_ctrl_ea_b_i;
input [7:0]    mem_ctrl_bus_ctrl_data_i;
output [15:0]  mem_ctrl_bus_ctrl_addr_o;
output [7:0]   mem_ctrl_bus_ctrl_data_o;
output         mem_ctrl_bus_ctrl_ext_rom_rd_b_o;
output         mem_ctrl_bus_ctrl_ext_ram_rd_b_o;
output         mem_ctrl_bus_ctrl_ext_ram_wr_b_o;
output         mem_ctrl_reg_ctrl_ext_mem_en_b_o;
output [7:0]   mem_ctrl_rom_data_o;
output [7:0]   mem_ctrl_ram_data_o;

endmodule


