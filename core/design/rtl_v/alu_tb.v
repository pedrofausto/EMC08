// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: alu_tb.v
// Module Name: CORE
// Author: Valeria Ap Pereira
// E-mail: valeriapereira85@yahoo.com.br
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 - 25/08/2010 - Initial version
// -------------------------------------------------------------------
// Description
// This file will be used to describe the Testbench of ALU block. 
// -------------------------------------------------------------------

`timescale 1ns / 10ps

// -------------------------------------------------------------------
// Module Declaration     
// -------------------------------------------------------------------
module alu_tb ;

`include "inst_set_define.v"

reg  [7:0] alu_operand1_i ;
reg  [7:0] alu_operand2_i ;
reg  [4:0] alu_opcode_i   ;
reg        alu_cy_i       ;
reg        alu_ac_i       ;
reg        alu_en_i       ;

wire [15:0] alu_result_o  ;
wire        alu_cy_o      ;
wire        alu_ov_o      ;
wire        alu_ac_o      ;

// -------------------------------------------------------------------
// Blocks Instantiation    
// -------------------------------------------------------------------  
core_alu DUT (  
                   .alu_en_i       (alu_en_i      ) ,
                   .alu_operand1_i (alu_operand1_i) , 
                   .alu_operand2_i (alu_operand2_i) , 
                   .alu_opcode_i   (alu_opcode_i  ) ,
                   .alu_cy_i       (alu_cy_i      ) ,
                   .alu_ac_i       (alu_ac_i      ) ,
                   .alu_result_o   (alu_result_o  ) ,
                   .alu_cy_o       (alu_cy_o      ) ,
                   .alu_ov_o       (alu_ov_o      ) ,
                   .alu_ac_o       (alu_ac_o      )
                 );

               
                 
initial
begin

    // ADD/SUB block
    
    #1
    alu_en_i = 1'b0;
    alu_opcode_i = ALU_ADD; //Add
    alu_operand1_i = 8'h20;
    alu_operand2_i = 8'h35;
    
    #4
    alu_en_i = 1'b1;
    alu_opcode_i = ALU_ADD; //Add
    alu_operand1_i = 8'hC3;
    alu_operand2_i = 8'hAA;
    
    #4
    alu_opcode_i = ALU_ADDC; //Add with Carry
    alu_operand1_i = 8'hC3;
    alu_operand2_i = 8'hAA;
    alu_cy_i       = 1'b1 ;
    
    #4
    alu_opcode_i = ALU_INC; //Increment
    alu_operand1_i = 8'h7E;
    alu_operand2_i = 8'h01;
    
    #4
    alu_opcode_i = ALU_INC; //Increment
    alu_operand1_i = 8'hFF;
    alu_operand2_i = 8'h01;
    
    #4
    alu_opcode_i = ALU_INC; //Increment
    alu_operand1_i = 8'h40;
    alu_operand2_i = 8'h01;
    
    #4
    alu_opcode_i = ALU_DEC; //Decrement
    alu_operand1_i = 8'h7F;
    alu_operand2_i = 8'h01;
    
    #4
    alu_opcode_i = ALU_DEC; //Decrement
    alu_operand1_i = 8'h00;
    alu_operand2_i = 8'h01;
    
    #4
    alu_opcode_i = ALU_DEC; //Decrement
    alu_operand1_i = 8'h40;
    alu_operand2_i = 8'h01;
    
    #4
    alu_opcode_i = ALU_SUB; //Sub
    alu_operand1_i = 8'hC9;
    alu_operand2_i = 8'h54;
    alu_cy_i       = 1'b1 ;
    
    #4
    alu_opcode_i = ALU_ADDC; //Add with Carry
    alu_operand1_i = 8'h56;
    alu_operand2_i = 8'h67;
    alu_cy_i       = 1'b1 ;
    
    #4
    alu_opcode_i = ALU_DA; //Decimal Adjust
    alu_operand1_i = 8'hBE;
    
    #4
    alu_opcode_i = ALU_RR; //Shift Right
    alu_operand1_i = 8'hC5;
    
    #4
    alu_opcode_i = ALU_RRC; //Shift Right with Carry
    alu_operand1_i = 8'hC5;
    alu_cy_i       = 1'b0;
    
    #4
    alu_opcode_i = ALU_RL; //Shift Left
    alu_operand1_i = 8'hC5;
    
    #4
    alu_opcode_i = ALU_RLC; //Shift Left with Carry
    alu_operand1_i = 8'hC5;
    alu_cy_i       = 1'b0;
    
    #4
    alu_opcode_i = ALU_OR; //Logic OR
    alu_operand1_i = 8'hC3;
    alu_operand2_i = 8'h55;
    
    #4
    alu_opcode_i = ALU_AND; //Logic AND
    alu_operand1_i = 8'hC3;
    alu_operand2_i = 8'h55;
    
    #4
    alu_opcode_i = ALU_XOR; //Logic XOR
    alu_operand1_i = 8'hC3;
    alu_operand2_i = 8'hAA;
    
    #4
    alu_opcode_i = ALU_SWAP; //SWAP 
    alu_operand1_i = 8'hC5;
    
    #4
    alu_opcode_i = ALU_CPL; //Complement 
    alu_operand1_i = 8'h5C;
    
    #4
    alu_opcode_i = ALU_COMP; //Comparation
    alu_operand1_i = 8'h34;
    alu_operand2_i = 8'h56;
    
    #4
    alu_opcode_i = ALU_MUL; //Mult
    alu_operand1_i = 8'h50;
    alu_operand2_i = 8'hA0;
    
    #4
    alu_opcode_i = ALU_DIV; //Div
    alu_operand1_i = 8'hB3;
    alu_operand2_i = 8'h00;
    
    #4
    alu_opcode_i = ALU_DIV; //Div
    alu_operand1_i = 8'hFB;
    alu_operand2_i = 8'h12;
               
    #4
    alu_opcode_i = ALU_DIV; //Div
    alu_operand1_i = 8'hFB;
    alu_operand2_i = 8'h12;
    
    $finish; 
    
end 

endmodule
              