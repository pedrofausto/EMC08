// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : baud_rate_tb.v
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      13-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit
// -----------------------------------------------------------------------------
// Purpose: Test bench to instanciate and generate the clock to the alu of core
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

`timescale 1 ns / 10 ps

module core_alu_tb;

parameter PERIOD = 50;

reg         system_clk;
reg         core_alu_enable_o;
reg  [7:0]  core_alu_operand1_o;
reg  [7:0]  core_alu_operand2_o;
reg  [4:0]  core_alu_opcode_o;
reg         core_alu_cy_o;
reg         core_alu_ac_o;
reg         core_alu_ov_o;
wire [15:0] core_alu_result_i;
wire        core_alu_cy_i;
wire        core_alu_ac_i;
wire        core_alu_ov_i;

core_alu DUT (
              .alu_en_i       (core_alu_enable_o),
              .alu_operand1_i (core_alu_operand1_o),
              .alu_operand2_i (core_alu_operand2_o),
              .alu_opcode_i   (core_alu_opcode_o),
              .alu_cy_i       (core_alu_cy_o),
              .alu_ac_i       (core_alu_ac_o),
              .alu_ov_i       (core_alu_ov_o),
              .alu_result_o   (core_alu_result_i),
              .alu_cy_o       (core_alu_cy_i),
              .alu_ac_o       (core_alu_ac_i),
              .alu_ov_o       (core_alu_ov_i)
             );

always
begin
   system_clk <= 1'b1;
   #(PERIOD/2);
   system_clk <= 1'b0;
   #(PERIOD/2);
end

endmodule