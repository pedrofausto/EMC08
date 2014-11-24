// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: baud_rate_stub.v
// Module Name: Baud Rate
// Author: Dino Cassel
// E-mail: dino.diga8@emc08.br
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 20/08/2010 Initial version
// 1.1 27/08/2010 New entries added
// -------------------------------------------------------------------
// Description
// This file contain the inputs and outputs of baud rate module.
// -------------------------------------------------------------------
// NAME: baud rate stub
// TYPE: stub file
// -------------------------------------------------------------------
// PURPOSE: inputs and outputs declaration of baud rate module.
// -------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME : RANGE : DESCRIPTION : DEFAULT : UNITS :
// n.a.       : n.a.  : n.a.        : n.a.    : n.a.  :
// -------------------------------------------------------------------

module baud_rate (
                  system_clk_i,
                  system_rst_i_b,
                  baud_rate_scon_sm0_i,
                  baud_rate_scon_sm1_i,
                  baud_rate_scon_sm2_i,
                  baud_rate_pcon_smod_i,
                  baud_rate_pcon_bps_i,
                  baud_rate_start_cm_i,
                  baud_rate_start_clean_counter_i,
                  baud_rate_cm_o,
                  baud_rate_br_trans_o,
                  baud_rate_br_o
                 );

input  wire system_clk_i;                    // main system clock
input  wire system_rst_i_b;                  // system reset
input  wire baud_rate_scon_sm0_i;            // serial mode
input  wire baud_rate_scon_sm1_i;            // communication rate in RS232 mode
input  wire baud_rate_scon_sm2_i;            // communication rate in RS232 mode
input  wire baud_rate_pcon_smod_i;           // baud rate duplicator
input  wire baud_rate_pcon_bps_i;            // RS232 mode
input  wire baud_rate_start_cm_i;            // start cycle machine
input  wire baud_rate_start_clean_counter_i; // reset baud-rate in mode 2
output reg  baud_rate_cm_o;                  // cycle machine output
output reg  baud_rate_br_trans_o;            // output baud rate 16 times faster of br output, in mode 2
output reg  baud_rate_br_o;                  // output baud rate

endmodule