// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_fsm_stub.v
// Module Name: core_fsm
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      14/09/2010  Initial Version
// 2.0      27/09/2010  Completely Verified Version
// -------------------------------------------------------------------
// Description
// FSM Submodule Stub File
// -------------------------------------------------------------------

module core_fsm (
                 fsm_clock_i,
                 fsm_reset_i_b,
                 fsm_reset_core_o_b,
                 fsm_alu_result_i,
                 fsm_sfr_addr_o,
                 fsm_bit_byte_flag_o,
                 fsm_rom_addr_o,
                 fsm_ram_addr_o,
                 fsm_rom_rd_o_b,
                 fsm_ram_rd_o_b,
                 fsm_sfr_rd_o_b,
                 fsm_ram_wr_o_b,
                 fsm_sfr_wr_o_b,
                 fsm_alu_op1_o,
                 fsm_alu_op2_o,
                 fsm_alu_opcode_o,
                 fsm_alu_en_o,
                 fsm_sfr_data_i,
                 fsm_sfr_data_o,
                 fsm_ram_data_i,
                 fsm_ram_data_o,
                 fsm_rom_data_i,
                 fsm_psw_rs_i,
                 fsm_pcau_offset_o,
                 fsm_pcau_en_o,
                 fsm_pcau_msb_o,
                 fsm_pcau_direct_o,
                 fsm_pc_i,
                 fsm_int_vect_i,
                 fsm_int_na_o,
                 fsm_int_rdy_o,
                 fsm_ext_ram_o,
                 fsm_state_o
                );

input             fsm_clock_i;
input             fsm_reset_i_b;
input      [1:0]  fsm_psw_rs_i;
   
output reg [7:0]  fsm_sfr_addr_o;
output     [15:0] fsm_rom_addr_o;
output reg [7:0]  fsm_ram_addr_o;
output reg        fsm_reset_core_o_b;

output reg        fsm_bit_byte_flag_o;
output reg        fsm_rom_rd_o_b;
output reg        fsm_ram_rd_o_b;
output reg        fsm_sfr_rd_o_b;
output reg        fsm_ram_wr_o_b;
output reg        fsm_sfr_wr_o_b;

output reg [7:0]  fsm_pcau_offset_o;
output reg        fsm_pcau_en_o;
output reg [7:0]  fsm_pcau_msb_o;
output reg        fsm_pcau_direct_o;
input      [15:0] fsm_pc_i;

output reg [7:0]  fsm_alu_op1_o;
output reg [7:0]  fsm_alu_op2_o;
output reg [4:0]  fsm_alu_opcode_o;
output reg        fsm_alu_en_o;
input      [15:0] fsm_alu_result_i;
   
input      [7:0]  fsm_rom_data_i;
input      [7:0]  fsm_ram_data_i;
output reg [7:0]  fsm_ram_data_o;
input      [7:0]  fsm_sfr_data_i;
output reg [7:0]  fsm_sfr_data_o;

input      [2:0]  fsm_int_vect_i;
output reg        fsm_int_na_o;
output reg        fsm_int_rdy_o;
output reg        fsm_ext_ram_o;
output reg [2:0]  fsm_state_o;

endmodule
