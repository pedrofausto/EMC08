// ------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// ------------------------------------------------------------------------
// File Name: core_mem_ctrl.v
// Module Name: core_mem_ctrl
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// ------------------------------------------------------------------------
// Release History                                                         
// Version  Date        Description                                        
// 1.0      02/09/2010  Initial Version                                    
// 1.1      02/09/2010  Corrected some signals naming mistakes and included
//                      a new port "mem_ctrl_reg_ctrl_ext_mem_en_b_o"      
// ------------------------------------------------------------------------
// Description
// Core Submodule responsible for access internal and external memories
// ------------------------------------------------------------------------

`timescale 1ns/10ps

module core_mem_ctrl(
                     mem_ctrl_clk_i,
                     mem_ctrl_rom_rd_b_i,
                     mem_ctrl_ram_rd_b_i,
                     mem_ctrl_ram_wr_b_i,
                     mem_ctrl_bit_byte_flag_i,
                     mem_ctrl_ext_ram_i,
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
                     mem_ctrl_rom_data_o,
                     mem_ctrl_ram_data_o
                     );

input          mem_ctrl_clk_i;
input          mem_ctrl_rom_rd_b_i;
input          mem_ctrl_ram_rd_b_i;
input          mem_ctrl_ram_wr_b_i;
input          mem_ctrl_bit_byte_flag_i;
input          mem_ctrl_ext_ram_i;
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
output [7:0]   mem_ctrl_rom_data_o;
output [7:0]   mem_ctrl_ram_data_o;


reg [11:0]  int_rom_addr;
reg         int_rom_en_b;
reg         int_rom_rd_b;

reg [7:0]   int_ram_data_i;
reg [6:0]   int_ram_addr;
reg         int_ram_en_b;
reg         int_ram_rd_b;
reg         int_ram_wr_b;

reg [15:0]  ext_addr;
reg [7:0]   ext_data_i;
reg         ext_rom_rd_b;
reg         ext_ram_rd_b;
reg         ext_ram_wr_b;


wire [7:0]  int_rom_data_o;
wire [7:0]  int_ram_data_o;


wire        ram_selection;
wire        rom_selection;

SPRAM128X8 internal_ram(
                        .Q(int_ram_data_o),
                        .D(int_ram_data_i),
                        .ADR(int_ram_addr),
                        .CLK(mem_ctrl_clk_i),
                        .ENB(int_ram_en_b),
                        .WEB(int_ram_wr_b),
                        .OEB(int_ram_rd_b),
                        .ramvdd(1'b1),
                        .ramgnd(1'b0)
                        );

ROM4096X8 internal_rom(
                     .Q(int_rom_data_o), 
                     .ADR(int_rom_addr), 
                     .CLK(mem_ctrl_clk_i),
                     .ENB(int_rom_en_b),
                     .OEB(int_rom_rd_b),
                     .romvdd(1'b1),
                     .romgnd(1'b0)
                     );


assign mem_ctrl_rom_data_o=(rom_selection)?mem_ctrl_bus_ctrl_data_i:int_rom_data_o;
assign mem_ctrl_ram_data_o=(ram_selection)?mem_ctrl_bus_ctrl_data_i:int_ram_data_o;

assign mem_ctrl_bus_ctrl_data_o=ext_data_i;
assign mem_ctrl_bus_ctrl_addr_o=ext_addr;
assign mem_ctrl_bus_ctrl_ext_rom_rd_b_o=ext_rom_rd_b;
assign mem_ctrl_bus_ctrl_ext_ram_rd_b_o=ext_ram_rd_b;
assign mem_ctrl_bus_ctrl_ext_ram_wr_b_o=ext_ram_wr_b;


assign rom_selection=((!mem_ctrl_bus_ctrl_ea_b_i) || (mem_ctrl_rom_addr_i > 16'h0FFF));
assign ram_selection=mem_ctrl_ext_ram_i;


always @(*)
begin
   // ROM Read
   if(!mem_ctrl_rom_rd_b_i)
   begin
      // External Read
      if(rom_selection)
      begin
         int_rom_en_b=1'b1;
         int_rom_rd_b=1'b1;

         ext_addr=mem_ctrl_rom_addr_i;
         ext_rom_rd_b=1'b0;
         ext_ram_rd_b=1'b1;
         ext_ram_wr_b=1'b1;
      end
      else
      // Internal Read
      begin
         int_rom_en_b=1'b0;
         int_rom_rd_b=1'b0;
         int_rom_addr=mem_ctrl_rom_addr_i[11:0];

         ext_rom_rd_b=1'b1;
      end
   end
   else
   begin
      int_rom_en_b=1'b1;
      int_rom_rd_b=1'b1;
      ext_rom_rd_b=1'b1;
   end
   
   if(!mem_ctrl_ram_rd_b_i)
   begin
      if(ram_selection)
      begin
         int_ram_en_b=1'b1;
         int_ram_wr_b=1'b1;

         ext_addr=mem_ctrl_ram_addr_i;
         ext_rom_rd_b=1'b1;
         ext_ram_rd_b=1'b0;
         ext_ram_wr_b=1'b1;
      end
      else
      begin
         int_ram_en_b=1'b0;
         if(mem_ctrl_bit_byte_flag_i)
         begin
            int_ram_rd_b=1'b0;
            int_ram_wr_b=1'b1;
            int_ram_data_i=mem_ctrl_ram_data_i;
            int_ram_addr=7'h20+mem_ctrl_ram_addr_i[6:3];

            ext_ram_rd_b=1'b1;
            ext_ram_wr_b=1'b1;
         end
         else
         begin
            int_ram_en_b=1'b0;
            int_ram_rd_b=1'b0;
            int_ram_wr_b=1'b1;
            int_ram_data_i=mem_ctrl_ram_data_i;
            int_ram_addr=mem_ctrl_ram_addr_i[6:0];

            ext_ram_rd_b=1'b1;
            ext_ram_wr_b=1'b1;
         end
      end
   end
   else if(!mem_ctrl_ram_wr_b_i)
   begin
      if(ram_selection)
      begin
         int_ram_en_b=1'b1;
         int_ram_rd_b=1'b1;
         int_ram_wr_b=1'b1;
         int_ram_data_i=8'h00;
         int_ram_addr=7'b0000000;

         ext_addr=mem_ctrl_ram_addr_i;
         ext_data_i=mem_ctrl_ram_data_i;
         ext_rom_rd_b=1'b1;
         ext_ram_rd_b=1'b1;
         ext_ram_wr_b=1'b0;
      end
      else
      begin
         int_ram_en_b=1'b0;
         if(mem_ctrl_bit_byte_flag_i)
         begin  
            int_ram_rd_b=1'b1;
            int_ram_wr_b=1'b0;
            int_ram_data_i=mem_ctrl_ram_data_i;
            int_ram_addr=7'h20+mem_ctrl_ram_addr_i[6:3];

            ext_ram_rd_b=1'b1;
            ext_ram_wr_b=1'b1;
         end
         else 
         begin
            int_ram_rd_b=1'b1;
            int_ram_wr_b=1'b0;
            int_ram_data_i=mem_ctrl_ram_data_i;
            int_ram_addr=mem_ctrl_ram_addr_i[6:0];

            ext_ram_rd_b=1'b1;
            ext_ram_wr_b=1'b1;
         end
      end
   end
   else
   begin
      int_ram_en_b=1'b1;
      int_ram_rd_b=1'b1;
      int_ram_wr_b=1'b1;

      ext_ram_rd_b=1'b1;
      ext_ram_wr_b=1'b1;
   end
end

endmodule


