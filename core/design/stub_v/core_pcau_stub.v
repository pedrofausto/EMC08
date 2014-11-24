// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_pcau_stub.v
// Module Name: core_pcau
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      27/09/2010  Completely Verified Version
// -------------------------------------------------------------------
// Description
// PCAU Submodule Stub File
// -------------------------------------------------------------------

module core_pcau (
                 pcau_clock_mem_i,
                 pcau_clock_i,
                 pcau_reset_i_b,
                 pcau_offset_i,
                 pcau_en_i,
                 pcau_pc_o,
                 pcau_pc_direct_i,
                 pcau_pc_msb_i,
                 pcau_fsm_state_i
                );

input         pcau_clock_mem_i;
input         pcau_clock_i;
input         pcau_reset_i_b;
input  [7:0]  pcau_offset_i;
input         pcau_en_i;
input  [7:0]  pcau_pc_msb_i;
input         pcau_pc_direct_i;   
input  [2:0]  pcau_fsm_state_i;   

output reg [15:0] pcau_pc_o;

endmodule