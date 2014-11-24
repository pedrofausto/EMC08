// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name: core_fsm.v
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
output reg        fsm_reset_core_o_b;
input      [1:0]  fsm_psw_rs_i;
   
output reg [7:0]  fsm_sfr_addr_o;
output     [15:0] fsm_rom_addr_o;
output reg [7:0]  fsm_ram_addr_o;

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

reg        [2:0]  next_state;           // next state of FSM
reg        [7:0]  fsm_opcode;           // instruction register 
reg        [7:0]  fsm_op1;              // operand 1
reg        [7:0]  fsm_op2;              // operand 2
reg               cycle_continue;
reg               lcall_hardware_flag;
reg        [7:0]  fsm_op_aux_1;
reg        [7:0]  fsm_op_aux_1_2;
reg        [7:0]  fsm_op_aux_2;
  
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_tasks.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 

assign fsm_rom_addr_o = fsm_pc_i;

// Current State Sequential logic ##############################################
always @(posedge fsm_clock_i)
begin
   
   if (!fsm_reset_core_o_b)           // Checking reset condition on low.
   begin
      fsm_state_o[2] <= 1'b1;          // reset state bit
   end
   
   else
   begin
     fsm_state_o[2] <= next_state[2];  // State receive next state
   end 
   fsm_state_o[1] <= next_state[1];
end //end always posedge current state sequential logic

always @(negedge fsm_clock_i)
begin

     fsm_state_o[0] <= next_state[0];

end //end always negedge current state sequential logic

// Next State Combinational logic ##############################################
always @(fsm_state_o)
begin
   
   case (fsm_state_o)
   
     STATE_RESET:       next_state = STATE_DECODE_1; 
     STATE_DECODE_1:    next_state = STATE_DECODE_2;
     STATE_DECODE_2:    next_state = STATE_EXECUTION;
     STATE_EXECUTION:   next_state = STATE_WRITE_BACK;
     STATE_WRITE_BACK:  next_state = STATE_DECODE_1;
     default:           next_state = STATE_RESET;
 
  endcase
   
end //end always current state sequential logic

// Combinational logic #########################################################
always @(fsm_state_o)
begin

   case (fsm_state_o)
   
     STATE_RESET:       reset_combinational_task;
     STATE_DECODE_1:    decode_1_combinational_task;
     STATE_DECODE_2:    decode_2_combinational_task;
     STATE_EXECUTION:   execution_combinational_task;
     STATE_WRITE_BACK:  write_back_combinational_task;
     default:           reset_combinational_task;
     
   endcase
   
end //end always combinational logic


// Sequential logic ############################################################
always @(posedge fsm_clock_i)
begin
   
   case (fsm_state_o)
     STATE_RESET:       reset_sequential_task;
     STATE_DECODE_2:    decode_2_sequential_task;   
     STATE_WRITE_BACK:  write_back_sequential_task;
     default:           
     begin
     end

  endcase
   
end //end always posedge current state sequential logic

always @(negedge fsm_clock_i)
begin
   //internal synchronous reset
   fsm_reset_core_o_b  <= fsm_reset_i_b;
   case (fsm_state_o)
     STATE_DECODE_1:    decode_1_sequential_task;
     STATE_EXECUTION:   execution_sequential_task;
     default:            
     begin
        cycle_continue <= DIS;
        fsm_op1        <= 8'h0;
        fsm_op_aux_1   <= 8'h0;
        fsm_op_aux_1_2 <= 8'h0;
     end
  
  endcase
   
end //end always current state sequential logic
endmodule //End of module