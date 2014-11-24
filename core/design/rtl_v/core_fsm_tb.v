// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name: core_fsm_tb.v
// Module Name: core
// Author: Pedro & Vinicius
// E-mail: pedrofausto at gmail com
// -----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 20/09/2010 Initial version
// -----------------------------------------------------------------------------
// Description
// This file encodes the FSM responsible to control the CORE module
// and its decisions.
//
//-----------------------------------------------------------------------------

`include "time_scale.v" 

module core_fsm_tb;

reg           fsm_clock_i;
reg           fsm_reset_i_b;
reg    [1:0]  fsm_psw_rs_i;
   
wire   [7:0]  fsm_sfr_addr_o;
wire   [15:0] fsm_rom_addr_o;
wire   [7:0]  fsm_ram_addr_o;

wire         fsm_bit_byte_flag_o;
wire         fsm_rom_rd_o_b;
wire         fsm_ram_rd_o_b;
wire         fsm_sfr_rd_o_b;
wire         fsm_ram_wr_o_b;
wire         fsm_sfr_wr_o_b;

wire   [7:0] fsm_pcau_offset_o;
wire         fsm_pcau_en_o;
//reg   [15:0] fsm_pc_i;

reg    [15:0] fsm_alu_result_i;
wire   [7:0]  fsm_alu_op1_o;
wire   [7:0]  fsm_alu_op2_o;
wire   [4:0]  fsm_alu_opcode_o;
wire          fsm_alu_en_o;
                 

reg    [7:0]  fsm_rom_data_i;
reg    [7:0]  fsm_ram_data_i;
wire   [7:0]  fsm_ram_data_o;
reg    [7:0]  fsm_sfr_data_i;
wire   [7:0]  fsm_sfr_data_o;

reg           pcau_clock_mem_i;
reg           pcau_reset_i_b;
reg    [7:0]  pcau_offset_i;
reg           pcau_en_i;
wire   [15:0] pcau_pc_o;
wire          fsm_pcau_direct_o;
wire   [7:0]  fsm_pcau_msb_o;

reg           reset;

reg    [2:0]  fsm_int_vect_i;
wire   [2:0]  fsm_state_o;
wire          fsm_int_na_o;
wire          fsm_int_rdy_o;

reg           alu_cy_i;
reg           alu_ac_i;
reg           alu_ov_i;
wire          alu_cy_o;
wire          alu_ac_o;
wire          alu_ov_o;
wire          fsm_ext_ram_o;
wire   [15:0] alu_result_o;
wire          fsm_reset_core_o_b;

   core_fsm FSM (
                 .fsm_clock_i         (fsm_clock_i        ),
                 .fsm_reset_i_b       (reset              ),
                 .fsm_reset_core_o_b  (fsm_reset_core_o_b ),
                 .fsm_alu_result_i    (alu_result_o       ),
                 .fsm_bit_byte_flag_o (fsm_bit_byte_flag_o),
                 .fsm_sfr_addr_o      (fsm_sfr_addr_o     ),
                 .fsm_rom_addr_o      (fsm_rom_addr_o     ),
                 .fsm_ram_addr_o      (fsm_ram_addr_o     ),
                 .fsm_rom_rd_o_b      (fsm_rom_rd_o_b     ),
                 .fsm_ram_rd_o_b      (fsm_ram_rd_o_b     ),
                 .fsm_sfr_rd_o_b      (fsm_sfr_rd_o_b     ),
                 .fsm_ram_wr_o_b      (fsm_ram_wr_o_b     ),
                 .fsm_sfr_wr_o_b      (fsm_sfr_wr_o_b     ),
                 .fsm_alu_op1_o       (fsm_alu_op1_o      ),
                 .fsm_alu_op2_o       (fsm_alu_op2_o      ),
                 .fsm_alu_opcode_o    (fsm_alu_opcode_o   ),
                 .fsm_alu_en_o        (fsm_alu_en_o       ),
                 .fsm_sfr_data_i      (fsm_sfr_data_i     ),
                 .fsm_sfr_data_o      (fsm_sfr_data_o     ),
                 .fsm_ram_data_i      (fsm_ram_data_i     ),
                 .fsm_ram_data_o      (fsm_ram_data_o     ),
                 .fsm_rom_data_i      (fsm_rom_data_i     ),
                 .fsm_psw_rs_i        (fsm_psw_rs_i       ),
                 .fsm_pcau_offset_o   (fsm_pcau_offset_o  ),
                 .fsm_pcau_en_o       (fsm_pcau_en_o      ),
                 .fsm_pc_i            (pcau_pc_o          ),
                 .fsm_int_vect_i      (fsm_int_vect_i     ),
                 .fsm_int_na_o        (fsm_int_na_o       ),
                 .fsm_int_rdy_o       (fsm_int_rdy_o      ),
                 .fsm_ext_ram_o       (fsm_ext_ram_o      ),
                 .fsm_pcau_direct_o   (fsm_pcau_direct_o  ),
                 .fsm_pcau_msb_o      (fsm_pcau_msb_o     ),  
                 .fsm_state_o         (fsm_state_o        ) 
                 );
                 
   core_pcau PCAU (
                 .pcau_clock_mem_i   (pcau_clock_mem_i    ),
                 .pcau_reset_i_b     (fsm_reset_core_o_b  ),
                 .pcau_offset_i      (fsm_pcau_offset_o   ),
                 .pcau_en_i          (fsm_pcau_en_o       ),
                 .pcau_pc_o          (pcau_pc_o           ),
                 .pcau_pc_direct_i   (fsm_pcau_direct_o   ),
                 .pcau_pc_msb_i      (fsm_pcau_msb_o      ),
                 .pcau_fsm_state_i   (fsm_state_o         )
                  );

   core_alu ALU  (
                 .alu_en_i           (fsm_alu_en_o        ),
                 .alu_operand1_i     (fsm_alu_op1_o       ),
                 .alu_operand2_i     (fsm_alu_op2_o       ),
                 .alu_opcode_i       (fsm_alu_opcode_o    ),
                 .alu_cy_i           (alu_cy_i            ),
                 .alu_ac_i           (alu_ac_i            ),
                 .alu_ov_i           (alu_ov_i            ),
                 .alu_result_o       (alu_result_o        ),
                 .alu_cy_o           (alu_cy_o            ),
                 .alu_ac_o           (alu_ac_o            ),
                 .alu_ov_o           (alu_ov_o            )
                  );
 
 localparam integer PERIOD = 50;
   
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
   
// Creating clock
always 
begin
  fsm_clock_i = 1'b0;
  #(PERIOD/2.0);
  fsm_clock_i = 1'b1;
  #(PERIOD/2.0);
end

always
begin
  pcau_clock_mem_i = 1'b0;
  #(PERIOD/4.0);
  pcau_clock_mem_i = 1'b1;
  #(PERIOD/4.0);
end

initial 
begin

  #1;                // start stimulus
  reset  = 1'b1;
  #(1*PERIOD);
  reset = 1'b0;    
  #(5*PERIOD);      
  reset = 1'b1; 
  fsm_psw_rs_i = 2'b00;
  fsm_int_vect_i = 3'd0;
  alu_cy_i = 1'b0;
  alu_ac_i = 1'b0;
  #(1*PERIOD); 
   
//   #(PERIOD/4.0);
//   fsm_rom_data_i = MOV_A_DATA;
//   #(PERIOD/2.0);
//   fsm_rom_data_i = 8'h33; // immediate 
//   #(3.0/2.0*PERIOD);
//   
//   fsm_rom_data_i = NOP;
//   #(2*PERIOD);
//   
//   fsm_rom_data_i = SJMP;
//   #(PERIOD/2.0);
//   fsm_rom_data_i = 8'h40; // immediate 
//   #(3.0/2.0*PERIOD);
//   
//   fsm_rom_data_i = MOV_R0_D;
//   #(PERIOD/2.0);
//   fsm_rom_data_i = 8'hFA; // direct to SFR
//   fsm_sfr_data_i = 8'hD1; // data in SFR
//   #(3.0/2.0*PERIOD);
    
//--------------OPCODE         LEN   ROM-1  ROM-2  RAM    SFR

// instruction_task (MOVC_A_ATDPTR,   2'd1, 8'h22, 8'h67, 8'h20, 8'h54);
// #(2*PERIOD);
// instruction_task (MOVX_ATDPTR_A,  2'd1, 8'h0E, 8'h1A, 8'h03, 8'h11);
// #(2*PERIOD);
// instruction_task (CPL_A, 2'd1, 8'h05, 8'h30, 8'h11, 8'h0F);
// #(2*PERIOD);
// instruction_task (MOV_DPTR_DATA,  2'd3, 8'hFE, 8'h25, 8'h00, 8'h29);
instruction_task (ADDC_A_DATA,         2'd2, 8'h01, 8'h03, 8'h02, 8'hFF);
instruction_task (JB,                2'd3, 8'hB5, 8'h03, 8'h32, 8'h00);
instruction_task (ORL_A_R2,          2'd3, 8'h70, 8'h20, 8'hD0, 8'h0F);
instruction_task (ADDC_A_D,          2'd2, 8'h7A, 8'h00, 8'hFF, 8'hFE);
instruction_task (MOV_R3_D,          2'd2, 8'h11, 8'h00, 8'h00, 8'hD3);
// fsm_int_vect_i = 3'd5;
instruction_task (JB,         2'd3, 8'h13, 8'h7A, 8'h31, 8'hF3);
 instruction_task (DEC_ATR1,    2'd1, 8'h17, 8'h00, 8'h65,8'hE3);
//  instruction_task (INC_R0,      2'd1, 8'h00, 8'h00, 8'h23, 8'h00);
// //  instruction_task (INC_R1,        2'd1, 8'h00, 8'h00, 8'h12, 8'h00);
// //  instruction_task (INC_R2,        2'd1, 8'h00, 8'h00, 8'hFE, 8'h00);
//  instruction_task (INC_R3,      2'd1, 8'h00, 8'h00, 8'hFF, 8'h00);
//  //fsm_int_vect_i = 3'd5;
 instruction_task (RETI,         2'd1, 8'h00, 8'h00, 8'hAA, 8'h09);
  #(2*PERIOD);
//   fsm_int_vect_i = 3'd0;
//   instruction_task (RET,         2'd1, 8'h00, 8'h00, 8'hAA, 8'h09);     
 instruction_task (NOP,          2'd1, 8'h00, 8'h00, 8'h00, 8'h00);
 instruction_task (MOV_D_DATA,   2'd3, 8'h22, 8'hD4, 8'h00, 8'h00);
 instruction_task (SETB_BIT,     2'd2, SFR_IP_5, 8'hD5, 8'h00, 8'h00);
 instruction_task (ACALL_1,        2'd2, 8'h45, 8'h00, 8'h00, 8'h07);
 #(2*PERIOD);
//   instruction_task (AJMP_1,       2'd2, 8'h45, 8'h00, 8'h00, 8'h07);
instruction_task (LJMP,          2'd3, 8'h89, 8'hD3, 8'hF0, 8'h00);
instruction_task (JBC,          2'd3, 8'h05, 8'hF4, 8'hff, 8'hff);

instruction_task (LJMP,          2'd3, 8'h10, 8'h10, 8'hF0, 8'h00);
instruction_task (JBC,          2'd3, 8'h05, 8'h6F, 8'hff, 8'hff);

  #(2*PERIOD);  
//   #(2*PERIOD);
//   fsm_int_vect_i = 3'd0;  

  instruction_task (MOV_R4_D,     2'd2, 8'h0A, 8'h00, 8'hD2, 8'h00);

  instruction_task (NOP,          2'd1, 8'h00, 8'h00, 8'hDD, 8'h00);
  #(2*PERIOD);

//   fsm_int_vect_i = 3'd5;
//  instruction_task (NOP,          2'd1, 8'h00, 8'h00, 8'hBB, 8'h0A);
//   fsm_int_vect_i = 3'd0; 
//  instruction_task (MOV_R4_D,     2'd2, 8'h0A, 8'h00, 8'hD2, 8'h00); 
  
//   fsm_rom_data_i = NOP;
//   #(2*PERIOD);

  
  $finish;
  
end   


task  instruction_task; //######################################################

   input  [7:0] opcode;
   input  [1:0] inst_len;
   input  [7:0] rom_op1;
   input  [7:0] rom_op2;
   input  [7:0] data_ram;
   input  [7:0] data_sfr;

   begin   
     fsm_rom_data_i = opcode;
     #(PERIOD/2.0);
     
     if (inst_len > 1)
      fsm_rom_data_i = rom_op1;
     
     fsm_ram_data_i  = data_ram; // data in RAM
     fsm_sfr_data_i  = data_sfr; // data in SFR
     
     #(PERIOD/2.0);
     
     if (inst_len > 2)
     begin
      fsm_rom_data_i = rom_op2;
      fsm_sfr_data_i  = data_sfr; // data in SFR
     end
     #(PERIOD);
     
   end
   
endtask        

   
endmodule
   
   
   