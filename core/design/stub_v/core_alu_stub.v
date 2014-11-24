// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_alu_stub.v
// Module Name: core_alu
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 2.0      27/09/2010  Completely Verified Version
// -------------------------------------------------------------------
// Description
// ALU Submodule Stub File
// -------------------------------------------------------------------

module core_alu (
                  alu_en_i,
                  alu_operand1_i, 
                  alu_operand2_i,
                  alu_opcode_i,
                  alu_cy_i,
                  alu_ac_i,
                  alu_ov_i,
                  alu_result_o,
                  alu_cy_o,
                  alu_ac_o,
                  alu_ov_o
                  );

input             alu_en_i;
input      [7:0]  alu_operand1_i;
input      [7:0]  alu_operand2_i;
input      [4:0]  alu_opcode_i;
input             alu_cy_i;
input             alu_ac_i;
input             alu_ov_i;
output reg [15:0] alu_result_o;
output reg        alu_cy_o;
output reg        alu_ac_o;
output reg        alu_ov_o;

endmodule