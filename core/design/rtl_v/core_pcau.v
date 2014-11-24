// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name: core_pcau.v
// Module Name: core
// Author: Pedro & Vinicius
// E-mail: pedrofausto at gmail com
// -----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 19/09/2010 Initial version
// -----------------------------------------------------------------------------
// Description
// This file encodes the FSM responsible to control the CORE module
// and its decisions.
// -----------------------------------------------------------------------------

`include "/home/student/EMC08/digital_A/core/design/rtl_v/time_scale.v" 


module core_pcau (
                 pcau_clock_mem_i,
                 pcau_reset_i_b,
                 pcau_offset_i,
                 pcau_en_i,
                 pcau_pc_o,
                 pcau_pc_direct_i,
                 pcau_pc_msb_i,
                 pcau_fsm_state_i
                );

input         pcau_clock_mem_i;
input         pcau_reset_i_b;
input  [7:0]  pcau_offset_i;
input         pcau_en_i;
input  [7:0]  pcau_pc_msb_i;
input         pcau_pc_direct_i;   
input  [2:0]  pcau_fsm_state_i;   

output reg [15:0] pcau_pc_o;
reg   [15:0]  pcau_o;
reg           carry;

`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 

// Combinational logic #########################################################
always @(pcau_en_i or pcau_pc_direct_i or pcau_offset_i or pcau_pc_msb_i or
         pcau_clock_mem_i)
begin
   carry = 1'b0;
   if (pcau_en_i == EN)
   begin
      if (pcau_pc_direct_i == EN)
      begin
         pcau_o = {pcau_pc_msb_i, pcau_offset_i};
      end 
      
      else
      begin 
         {carry, pcau_o[7:0]}  = pcau_pc_o[7:0] + pcau_offset_i[7:0];
          pcau_o[15:8] = pcau_pc_o[15:8] + carry - pcau_offset_i[7];
      end
   end
   
   else
   begin
      pcau_o = pcau_pc_o;
   end
   

end //always combinational

// Sequential logic ############################################################
always @(negedge pcau_clock_mem_i)
begin
   
   if (!pcau_reset_i_b)          // Checking reset condition on low.
   begin
      pcau_pc_o <= 16'd0;
   end
   
   else
   begin
      if (pcau_en_i == EN) 
      pcau_pc_o <= pcau_o;
      else
      pcau_pc_o <= pcau_pc_o;
   end 

end //end always sequential logic


endmodule