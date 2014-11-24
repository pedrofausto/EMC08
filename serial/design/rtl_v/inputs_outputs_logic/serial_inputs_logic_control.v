// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_inputs_logic_control.v
// Module Name: serial
// Author: Harney Abrhaim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 31/08/2010 Initial version
// 2.0 08/09/2010 Connections fixed
// 2.1 10/09/2010 Standard signal names
// -------------------------------------------------------------------
// Description
// Implements the serial logic inputs to top of serial block
// -------------------------------------------------------------------/


module serial_inputs_logic_control (
                                    serial_clock_i,
                                    serial_reset_i_b,
                                    serial_br_i,
                                    serial_br_trans_i,
                                    serial_scon0_ri_i,
                                    serial_scon1_ti_i,
                                    serial_scon3_tb8_i,
                                    serial_scon4_ren_i,
                                    serial_scon7_sm0_i,
                                    serial_serial_tx_i,
                                    serial_data_sbuf_i,
                                    serial_p3_0_i,
                                    
                                    serial_clock_i_internal_o,
                                    serial_reset_i_b_internal_o,
                                    serial_br_i_internal_o,
                                    serial_br_trans_i_internal_o,
                                    serial_scon0_ri_i_internal_o,
                                    serial_scon1_ti_i_internal_o,
                                    serial_scon3_tb8_i_internal_o,
                                    serial_scon4_ren_i_internal_o,
                                    serial_scon7_sm0_i_internal_o,
                                    serial_serial_tx_i_internal_o,
                                    serial_data_sbuf_i_internal_o,
                                    serial_rxd_data_internal_o,
                                    serial_data_mode0_internal_o
                                   ); 

//////////  Inputs and outputs /////////////
input serial_clock_i;
input serial_reset_i_b;
input serial_br_i;
input serial_br_trans_i;
input serial_scon0_ri_i;
input serial_scon1_ti_i;
input serial_scon3_tb8_i;
input serial_scon4_ren_i;
input serial_scon7_sm0_i;
input serial_serial_tx_i;
input [7:0]serial_data_sbuf_i;
input serial_p3_0_i;       // data from port 3.0

output serial_clock_i_internal_o;
output serial_reset_i_b_internal_o;
output serial_br_i_internal_o;
output serial_br_trans_i_internal_o;
output serial_scon0_ri_i_internal_o;
output serial_scon1_ti_i_internal_o;
output serial_scon3_tb8_i_internal_o;
output serial_scon4_ren_i_internal_o;
output serial_scon7_sm0_i_internal_o;
output serial_serial_tx_i_internal_o;
output [7:0]serial_data_sbuf_i_internal_o;
output serial_rxd_data_internal_o;
output serial_data_mode0_internal_o;

/////// Connectcions betwenn external inputs and internal signals ///

assign serial_clock_i_internal_o      = serial_clock_i;
assign serial_reset_i_b_internal_o      = serial_reset_i_b;
assign serial_br_i_internal_o         = serial_br_i;
assign serial_br_trans_i_internal_o   = serial_br_trans_i;
assign serial_scon0_ri_i_internal_o = serial_scon0_ri_i;
assign serial_scon1_ti_i_internal_o = serial_scon1_ti_i;
assign serial_scon3_tb8_i_internal_o  = serial_scon3_tb8_i;
assign serial_scon4_ren_i_internal_o  = serial_scon4_ren_i;
assign serial_scon7_sm0_i_internal_o = serial_scon7_sm0_i;
assign serial_serial_tx_i_internal_o  = serial_serial_tx_i;
assign serial_data_sbuf_i_internal_o  = serial_data_sbuf_i;
assign serial_rxd_data_internal_o   = serial_p3_0_i;
assign serial_data_mode0_internal_o = serial_p3_0_i;



endmodule
