// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: baud_rate_tb.v
// Module Name: Baud Rate
// Author: Dino Cassel
// E-mail: dino.diga8@emc08.br
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 0.1 20/08/2010 Initial version
// 0.2 23/08/2010 Cycle start bit logic modified
// 0.3 24/08/2010 Baud-rate output inverted
// 0.4 27/08/2010 Four rates for mode RS232 communication added and
//                entry for reset baud-rate in mode 2
// -------------------------------------------------------------------
// Description
// Testebench of the file that implements the basic functions of baud
// rate module
// -------------------------------------------------------------------
// NAME: baud rate module
// TYPE: function file
// -------------------------------------------------------------------
// PURPOSE: baud rate generation for serial module.
// -------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME : RANGE : DESCRIPTION : DEFAULT : UNITS :
// n.a.       : n.a.  : n.a.        : n.a.    : n.a.  :
// -------------------------------------------------------------------

`timescale 1 ns / 10 ps

module baud_rate_tb;

`include "/home/student/EMC08/digital_A/baud_rate/design/rtl_v/baud_rate_defines.def"

reg  system_clk_o;
reg  system_rst_o_b;
reg  baud_rate_scon_sm0_o;
reg  baud_rate_scon_sm1_o;
reg  baud_rate_scon_sm2_o;
reg  baud_rate_pcon_smod_o;
reg  baud_rate_pcon_rs232_o;
reg  baud_rate_start_cm_o;
// reg  baud_rate_clear_counter_o;
wire baud_rate_cm_i;
wire baud_rate_br_trans_i;
wire baud_rate_br_i;

baud_rate DUT (
                  .system_clk_i              (system_clk_o),
                  .system_rst_i_b            (system_rst_o_b),
                  .baud_rate_scon_sm0_i      (baud_rate_scon_sm0_o),
                  .baud_rate_scon_sm1_i      (baud_rate_scon_sm1_o),
                  .baud_rate_scon_sm2_i      (baud_rate_scon_sm2_o),
                  .baud_rate_pcon_smod_i     (baud_rate_pcon_smod_o),
                  .baud_rate_pcon_rs232_i    (baud_rate_pcon_rs232_o),
//                   .baud_rate_clear_counter_i (baud_rate_clear_counter_o),
                  .baud_rate_cm_o            (baud_rate_cm_i),
                  .baud_rate_br_trans_o      (baud_rate_br_trans_i),
                  .baud_rate_br_o            (baud_rate_br_i)
                 );

always
begin
   system_clk_o <= 1;
   #(PERIOD/2);
   system_clk_o <= 0;
   #(PERIOD/2);
end

initial
begin
   $monitor("%b, %b, %b, %b", system_clk_o, baud_rate_cm_i, baud_rate_br_i, baud_rate_br_trans_i);

   @(posedge system_clk_o);

   @(posedge system_clk_o);
   system_rst_o_b = 1'b0;

   @(posedge system_clk_o);
   @(posedge system_clk_o);
   baud_rate_scon_sm0_o      = 1'b0;
   baud_rate_pcon_smod_o     = 1'b0;
   baud_rate_scon_sm1_o      = 1'b0;
   baud_rate_scon_sm2_o      = 1'b0;
//    baud_rate_clear_counter_o = 1'b0;
   baud_rate_pcon_rs232_o    = 1'b0;

   @(posedge system_clk_o);
   #10;
   system_rst_o_b            = 1'b1;
   
   #(PERIOD*3);
   @(posedge system_clk_o);
   
   @(posedge system_clk_o);
   #10;
   baud_rate_scon_sm0_o      = 1'b1;
   baud_rate_pcon_smod_o     = 1'b0;
   baud_rate_pcon_rs232_o    = 1'b1;
   
   #(PERIOD*2);

   @(posedge system_clk_o);
   #10;
//    baud_rate_clear_counter_o = 1'b1;
   
   @(posedge system_clk_o);
   #10;
//    baud_rate_clear_counter_o = 1'b0;
   
   #(PERIOD*10000000);
   
   @(posedge system_clk_o);
   #10;
   system_rst_o_b = 1'b0;
   
   #(PERIOD*1000);

   $finish;
   
end

endmodule
