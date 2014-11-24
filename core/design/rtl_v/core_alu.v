// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: alu.v
// Module Name: CORE
// Author: Valeria Aparecida Pereira
// E-mail: valeriapereira85@yahoo.com.br
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 - 23/08/2010 - Initial version
// 1.1 - 09/08/2010 - Removed some inferred latches
// -------------------------------------------------------------------
// Description
// This file will be used to describe the Add/Sub block. 
// -------------------------------------------------------------------

`timescale 1ns / 10ps

// -------------------------------------------------------------------
// Module Declaration     
// -------------------------------------------------------------------
module core_alu (
                      alu_en_i       ,
                      alu_operand1_i , 
                      alu_operand2_i ,
                      alu_opcode_i   ,
                      alu_cy_i       ,
                      alu_ac_i       ,
                      alu_ov_i       ,
                      alu_result_o   ,
                      alu_cy_o       ,
                      alu_ac_o       ,
                      alu_ov_o
                    );
                    
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v"                               
                            
// -------------------------------------------------------------------
// Input Ports Declaration     
// -------------------------------------------------------------------
input            alu_en_i            ;
input      [7:0] alu_operand1_i      ;
input      [7:0] alu_operand2_i      ;
input      [4:0] alu_opcode_i        ;
input            alu_cy_i            ;
input            alu_ac_i            ;
input            alu_ov_i            ;

// -------------------------------------------------------------------
// Output Ports Declaration     
// -------------------------------------------------------------------
output reg [15:0] alu_result_o        ;
output reg        alu_cy_o            ;
output reg        alu_ac_o            ;
output reg        alu_ov_o            ;

// -------------------------------------------------------------------
// Internal Pins Declaration     
// -------------------------------------------------------------------
reg alu_cin;
// reg alu_c3;
// reg alu_c5;
reg alu_c6;
// reg alu_c7;

// -------------------------------------------------------------------
// Combinational Block    
// -------------------------------------------------------------------        
always @ (alu_en_i or alu_opcode_i or alu_operand1_i or alu_operand2_i or
         alu_cy_i or alu_ac_i or alu_ov_i)
begin
   
   alu_cin  = 1'b0; 
   alu_c6   = 1'b0;
   if (alu_en_i == 1'b0)
   begin 
      alu_result_o = 16'd0 ;
      alu_cy_o = alu_cy_i;
      alu_ac_o = alu_ac_i;
      alu_ov_o = alu_ov_i;
   end 
   
   else 
   begin
   
    
      case (alu_opcode_i)
      
// ADD_ADDC_SUBB ########################################################
         ALU_ADD, ALU_INC, ALU_ADDC:
         begin
      
            if (alu_opcode_i == ALU_ADDC)
            begin
               alu_cin    = alu_cy_i;
            end 
            else
            begin
               alu_cin      = 1'b0  ;
            end 
               
            {alu_ac_o, alu_result_o[3:0]} =
            alu_operand1_i[3:0] + alu_operand2_i[3:0] +
            {3'd0,alu_cin};
               
            {alu_c6, alu_result_o[6:4]} =
            alu_operand1_i[6:4] + alu_operand2_i[6:4] + 
            {2'd0,alu_ac_o};
               
            {alu_cy_o, alu_result_o[7]} =
            alu_operand1_i[7] + alu_operand2_i[7] +
            alu_c6;
               
            alu_result_o[15:8] = 8'd0; 
               
            alu_ov_o = alu_c6 ^ alu_cy_o;

            if (alu_opcode_i == ALU_INC)
            begin
               alu_cy_o = alu_cy_i;
               alu_ac_o = alu_ac_i;
               alu_ov_o = alu_ov_i;
            end 
         end       
      
         ALU_SUB, ALU_DEC:
         begin
         
            if (alu_opcode_i == ALU_DEC)
            begin
               alu_result_o = alu_operand1_i - alu_operand2_i;
               alu_cy_o = alu_cy_i;
               alu_ac_o = alu_ac_i;
               alu_ov_o = alu_ov_i;
            end
            else
            begin           
               alu_cin = alu_cy_i;    
               {alu_ac_o, alu_result_o[3:0]} = alu_operand1_i[3:0] - alu_cin  -
               alu_operand2_i[3:0];
              
               {alu_c6, alu_result_o[6:4]}     = alu_operand1_i[6:4]   -
               alu_ac_o - alu_operand2_i[6:4];
                           
               {alu_cy_o, alu_result_o[7]} = alu_operand1_i[7] - alu_c6 -
               alu_operand2_i[7];
                
               alu_result_o[15:8] = 8'd0;
               alu_ov_o = alu_c6 ^ alu_cy_o;
            end 
         end 

// BCD #########################################################################  
         ALU_DA:
         begin 
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
            alu_result_o[15:8] = 8'd0;
               
            if (alu_operand1_i[3:0] > 8'd9) 
            begin
               {alu_ac_o, alu_result_o[3:0]} = alu_operand1_i[3:0] + 4'h6;
            end 
            else
            begin
               if (alu_ac_i == 1'd1)
               begin
                  alu_result_o[3:0] = alu_operand1_i[3:0] + 4'h6;
               end 
               else 
               begin
               alu_result_o[3:0] = alu_operand1_i[3:0];
               end     
            end       
           
            if (alu_operand1_i[7:4] > 8'd9)
            begin
               {alu_cy_o, alu_result_o[7:4]} = alu_operand1_i[7:4] + 4'h6 + alu_ac_o;
            end 
            else
            begin 
               if  (alu_cy_i == 1'd1)
               begin   
                  alu_result_o[7:4] = alu_operand1_i[7:4] + 4'h6 + alu_ac_o;
               end 
               else
               begin
                 {alu_cy_o, alu_result_o[7:4]} = alu_operand1_i[7:4] + alu_ac_o;
               end 
            end
         end 
         
// BOOL ########################################################################  
         ALU_RR:
         begin
            alu_result_o = {8'd0, alu_operand1_i[0] , alu_operand1_i[7:1]};
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of RR_A instruction
         
         ALU_RRC:
         begin
            alu_result_o = {8'd0, alu_cy_i, alu_operand1_i[7:1]};
            alu_cy_o     = alu_operand1_i[0];
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of RRC_A instruction
            
         ALU_RL:
         begin
            alu_result_o = {8'd0, alu_operand1_i[6:0], alu_operand1_i[7]};
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of RL_A instruction
         
         ALU_RLC:
         begin
            alu_result_o = {8'd0, alu_operand1_i[6:0], alu_cy_i};
            alu_cy_o = alu_operand1_i[7];
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of RLC_A instruction
         
         ALU_OR:
         begin
            alu_result_o = {8'd0, alu_operand1_i | alu_operand2_i};
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of ORL instructions
         
         ALU_AND:
         begin
            alu_result_o = {8'd0, alu_operand1_i & alu_operand2_i};
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of ANL instructions
       
         ALU_XOR: 
         begin
            alu_result_o = {8'd0, alu_operand1_i ^ alu_operand2_i};
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of XRL instructions
         
         ALU_SWAP:
         begin
            alu_result_o[3:0]  = alu_operand1_i[7:4];
            alu_result_o[7:4]  = alu_operand1_i[3:0];
            alu_result_o[15:8] = 8'd0 ;
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;         
         end //end of SWAP_A instruction
         
         ALU_CPL:
         begin
            alu_result_o[7 :0] = ~alu_operand1_i;
            alu_result_o[15:8] = 8'd0 ;
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //end of CPL_A instruction
         
         ALU_COMP:
         begin
            if (alu_operand1_i == alu_operand2_i)
            begin
               alu_result_o = 16'd1;
               alu_cy_o = alu_cy_i;
               alu_ac_o = alu_ac_i;
               alu_ov_o = alu_ov_i;
            end //if (alu_operand1_i == alu_operand2_i)
            
            else
            begin 
               if (alu_operand1_i < alu_operand2_i)
               begin
                  alu_result_o = 16'd0 ;
                  alu_ac_o = alu_ac_i;
                  alu_ov_o = alu_ov_i;
                  alu_cy_o     = 1'd1  ;
               end //if (alu_operand1_i < alu_operand2_i)
                
               else
               begin 
                  alu_result_o = 16'd0 ;
                  alu_cy_o = 1'd0    ;
                  alu_ac_o = alu_ac_i;
                  alu_ov_o = alu_ov_i;
               end //if (alu_operand1_i >= alu_operand2_i) 
            end //if (alu_operand1_i != alu_operand2_i)
            
            
               
         end //end of CJNE instruction
         
// MULT ########################################################################  
         ALU_MUL:
         begin
            alu_result_o = alu_operand1_i * alu_operand2_i;
            alu_cy_o = 1'd0;
            alu_ac_o = 1'd0;
            alu_ov_o = alu_ov_i;
            
            if (alu_result_o > 16'd255)
            begin
               alu_ov_o = 1'd1;
            end //if (alu_result_o > 16'd255)
            
            else 
            begin
               alu_ov_o = 1'd0;
            end //if (alu_result_o <= 16'd255)
         end 
         
// DIV ######################################################################## 
         ALU_DIV:
         begin
            alu_cy_o = 1'd0;
            alu_ac_o = 1'd0;
            if (alu_operand2_i == 8'h00)
            begin
               alu_result_o = 16'd0 ;
               alu_ov_o     = 1'd1  ;     
            end
            else
            begin
               alu_result_o[15 :8] = alu_operand1_i / alu_operand2_i;
               alu_result_o[7:0]   = alu_operand1_i % alu_operand2_i;
               alu_ov_o = 1'd0;
            end 
         end 


// DEFAULT ##################################################################### 

        default:
         begin
            alu_result_o = 16'd0 ;
            alu_cy_o = alu_cy_i;
            alu_ac_o = alu_ac_i;
            alu_ov_o = alu_ov_i;
         end //default
         
      endcase
   end 
end //always

endmodule
   