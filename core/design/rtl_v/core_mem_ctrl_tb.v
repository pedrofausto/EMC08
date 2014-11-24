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

reg [15:0] addr_tmp;

parameter   ENABLE=1'b0,
            DISABLE=1'b1;

parameter   BYTE=1'b0,
            BIT=1'b1;

initial clk_i=1'b0;
always #(25/2) clk_i=~clk_i;

initial
begin
   rom_rd_i=1'b1;
   ram_rd_i=1'b1;
   ram_wr_i=1'b1;
   bit_byte_flag_i=1'b0;
   ext_ram_i=1'b0;
   rom_addr_i=16'h0000;
   ram_addr_i=16'h0000;
   ram_data_i=8'h00;
   bus_ctrl_ea_b_i=1'b1;
   bus_ctrl_data_i=8'h00;
   #500
   // Internal RAM Write
   addr_tmp=16'h0000;
   ram_wr_i=1'b0;
   ext_ram_i=1'b0;
   ram_addr_i=addr_tmp;
   ram_data_i=$random%256;
   repeat(127)
      begin
      @(negedge clk_i)
         ram_wr_i=1'b0;
         ext_ram_i=1'b0;
         addr_tmp=addr_tmp+1;
         ram_addr_i=addr_tmp;
         ram_data_i=$random%256;
      end
   @(negedge clk_i)
   // Internal RAM Read
   ram_rd_i=1'b0;
   ram_wr_i=1'b1;
   addr_tmp=16'h0000;
   ext_ram_i=1'b0;
   ram_addr_i=addr_tmp;
   bit_byte_flag_i=1'b1;
   repeat(127)
      begin
      @(negedge clk_i)
         ram_rd_i=1'b0;
         ext_ram_i=1'b0;
         addr_tmp=addr_tmp+1;
         ram_addr_i=addr_tmp;
      end
   @(posedge clk_i)
   #500
   // External RAM Write
   ram_rd_i=1'b1;
   addr_tmp=16'h0000;
   ram_wr_i=1'b0;
   ext_ram_i=1'b1;
   ram_addr_i=addr_tmp;
   ram_data_i=$random%256;
   repeat(127)
      begin
      @(negedge clk_i)
         ram_wr_i=1'b0;
         ext_ram_i=1'b1;
         addr_tmp=addr_tmp+1;
         ram_addr_i=addr_tmp;
         ram_data_i=$random%256;
      end
   @(negedge clk_i)
   // External RAM Read
   ram_rd_i=1'b0;
   ram_wr_i=1'b1;
   addr_tmp=16'h0000;
   ext_ram_i=1'b1;
   ram_addr_i=addr_tmp;
   repeat(127)
      begin
      @(negedge clk_i)
         ram_rd_i=1'b0;
         ext_ram_i=1'b1;
         addr_tmp=addr_tmp+1;
         ram_addr_i=addr_tmp;
         bus_ctrl_data_i=$random%256;
      end
   @(negedge clk_i)
   // Internal ROM Read
   bus_ctrl_ea_b_i=1'b1;
   rom_rd_i=1'b0;
   ram_rd_i=1'b1;
   ram_wr_i=1'b1;
   addr_tmp=16'h0000;
   ext_ram_i=1'b1;
   rom_addr_i=addr_tmp;
   repeat(65535)
      begin
      @(negedge clk_i)
         addr_tmp=addr_tmp+1;
         rom_addr_i=addr_tmp;
      end
   @(posedge clk_i)
   #500
   @(negedge clk_i)
   // Internal ROM Read
   bus_ctrl_ea_b_i=1'b0;
   rom_rd_i=1'b0;
   ram_rd_i=1'b1;
   ram_wr_i=1'b1;
   addr_tmp=16'h0000;
   ext_ram_i=1'b1;
   rom_addr_i=addr_tmp;
   repeat(65535)
      begin
      @(negedge clk_i)
         addr_tmp=addr_tmp+1;
         rom_addr_i=addr_tmp;
      end
   @(posedge clk_i)
   // Internal RAM Write
   #250
   bit_byte_flag_i=1'b1;
   addr_tmp=16'h0000;
   ram_wr_i=1'b1;
   ext_ram_i=1'b0;
   ram_addr_i=addr_tmp;
   ram_data_i=$random%256;
   repeat(127)
      begin
      @(negedge clk_i)
         ram_wr_i=1'b1;
         ext_ram_i=1'b0;
         addr_tmp=addr_tmp+1;
         ram_addr_i=addr_tmp;
         ram_data_i=$random%256;
      end
   @(negedge clk_i)
   // Internal RAM Read
   bit_byte_flag_i=1'b1;
   ram_rd_i=1'b1;
   ram_wr_i=1'b0;
   addr_tmp=16'h0000;
   ext_ram_i=1'b0;
   ram_addr_i=addr_tmp;
   repeat(127)
      begin
      @(negedge clk_i)
         ram_rd_i=1'b1;
         ext_ram_i=1'b0;
         addr_tmp=addr_tmp+1;
         ram_addr_i=addr_tmp;
      end
//    rom_rd_i=DISABLE;
//    ram_rd_i=DISABLE;
//    ram_wr_i=DISABLE;
//    bit_byte_flag_i=BYTE;
//    ext_ram_i=1'b0;
//    rom_addr_i=16'b000000000000;
//    ram_addr_i=16'b000000000000;
//    ram_data_i=$random%256;
//    bus_ctrl_data_i=$random%256;
//    #175
//    rom_rd_i=ENABLE;
//    #250
//    rom_rd_i=DISABLE;
//    #175
//    rom_rd_i=ENABLE;
//    rom_addr_i=16'b000000000001;
//    #25
//    rom_rd_i=DISABLE;
//    #500   
   $finish;
end

endmodule
