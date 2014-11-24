// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_tx.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 27/08/2010 Initial version
// 2.0 08/09/2010 Functional with some bugs
// 2.1 10/09/2010 Standards signals names 
// 2.2 04/10/2010 Bug in tranmitter mode 0 and 2 fixed 
// -------------------------------------------------------------------
// Description
// Implements the TX top of serial block
// -------------------------------------------------------------------/

/*
`include "./tx_control/serial_tx_control.v"
`include "./serial_output_shifter_reg/serial_tx_output_shifter_reg.v"
*/

module serial_tx (
                  serial_br_i,
                  serial_clock_i,
                  serial_reset_i_b,
                  serial_scon7_sm0_i,
                  serial_scon1_ti_i,
                  serial_serial_tx_i,
                  serial_data_sbuf_i,
                  serial_scon3_tb8_i,
                  
                  serial_p3en_0_o,
                  serial_p3en_1_o,
                  serial_scon1_ti_o,
                  serial_send_o,
                  serial_data_en_o,
                  serial_data_tx_o
                 ); 

/////////// Inputs and Outputs /////////////
input serial_br_i;
input serial_clock_i;
input serial_reset_i_b;
input serial_scon7_sm0_i;
input serial_scon1_ti_i;
input serial_serial_tx_i;
input [7:0]serial_data_sbuf_i;
input serial_scon3_tb8_i;

output serial_p3en_0_o;
output serial_p3en_1_o;
output serial_scon1_ti_o;
output serial_send_o;
output serial_data_en_o;
output serial_data_tx_o;

//////////  Internal Wires    /////////////
wire END_BIT;
wire SHIFT;
wire START_SHIFTER_REG;
wire STOP_BIT_GEN;
wire DO_IDLE;

wire START_OUTPUT;

/////////// Connections among blocks /////
serial_tx_output_shifter_reg serial_tx_output_shifter_reg (
                                    .serial_clock_i                 (serial_clock_i),
                                    .serial_reset_i_b               (serial_reset_i_b),
                                    .serial_start_shifter_reg_i     (START_OUTPUT),
                                    .serial_shift_i            	    (SHIFT),
                                    .serial_stop_bit_gen_i          (STOP_BIT_GEN),
                                    .serial_scon3_tb8_i		    (serial_scon3_tb8_i),
                                    .serial_data_sbuf_i             (serial_data_sbuf_i),
                                    .serial_scon7_sm0_i             (serial_scon7_sm0_i),
                                    .serial_start_idle_i            (DO_IDLE),
                                    
                                    .serial_data_tx_o		    (serial_data_tx_o),
                                    .serial_end_bit_o		    (END_BIT)
                                    ); 

assign START_OUTPUT = serial_scon7_sm0_i ? START_SHIFTER_REG :  serial_serial_tx_i;
                                    
serial_tx_control serial_tx_control  (
                                      .serial_br_i		    (serial_br_i),
                                      .serial_clock_i               (serial_clock_i), 
                                      .serial_reset_i_b             (serial_reset_i_b),
                                      .serial_scon7_sm0_i           (serial_scon7_sm0_i),
                                      .serial_scon1_ti_i            (serial_scon1_ti_i),
                                      .serial_end_bit_i             (END_BIT), 
                                      .serial_serial_tx_i           (serial_serial_tx_i),
                                      
                                      .serial_p3en_0_o              (serial_p3en_0_o),
                                      .serial_p3en_1_o              (serial_p3en_1_o),
                                      .serial_data_en_o		    (serial_data_en_o),
                                      .serial_scon1_ti_o            (serial_scon1_ti_o),
                                      .serial_send_o                (serial_send_o),
                                      .serial_shift_o               (SHIFT),                                      
                                      .serial_stop_bit_gen_o        (STOP_BIT_GEN),
                                      .serial_start_shifter_reg_o   (START_SHIFTER_REG),
                                      .serial_start_idle_o          (DO_IDLE)
                                      ); 



endmodule
