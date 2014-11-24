// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 25/08/2010 Initial version
// 2.0 08/09/2010 Functional with some bugs
// 2.1 09/09/2010 Unused signal removed
// 2.2 10/09/2010 Standard signals names
// 2.3 06/10/2010 bug with br sync in mode 2 fixed
// -------------------------------------------------------------------
// Description
// Implements the RX top of serial block
// -------------------------------------------------------------------/

//`include "detector/serial_rx_detector.v"
//`include "rx_control/serial_rx_control.v"
//`include "serial_input_shifter_reg/serial_rx_input_shifter_reg.v"

module serial_rx (
                  serial_clock_i,
                  serial_reset_i_b,
                  serial_br_i,
                  serial_br_trans_i,
                  serial_rxd_data_i,
                  serial_scon7_sm0_i,
                  serial_scon4_ren_i,
                  serial_scon0_ri_i,
                  serial_data_mode0_i,
                  
                  serial_p3en_0_o,
                  serial_p3en_1_o,
                  serial_scon0_ri_o,
                  serial_scon2_rb8_o,
                  serial_sbuf_rx_o,
                  serial_receive_o,
		  serial_load_sbuf_o
				 ); 

///// Inputs and outputs ///////
input  serial_clock_i;
input  serial_reset_i_b;
input  serial_br_i;
input  serial_br_trans_i;
input  serial_rxd_data_i;
input  serial_scon7_sm0_i;
input  serial_scon4_ren_i;
input  serial_scon0_ri_i;
input  serial_data_mode0_i;

output serial_p3en_0_o;
output serial_p3en_1_o;
output serial_scon0_ri_o;
output serial_scon2_rb8_o;
output [7:0]serial_sbuf_rx_o;
output serial_receive_o;
output serial_load_sbuf_o;

///// Wire Connect modules ////////////////////
wire CLEAR_COUNT;
wire RECEIVE;
wire LOAD_SBUF;
wire SHIFT_INPUT_SHIFT_REG;
wire START_INPUT_SHIFT_REG;
wire DATA_MODE2;
wire TRANSITION_DETECTED;
wire END_BIT;
wire SHIFT_BR; // shift to mode2 and br to mode 0
wire SERIAL_SHIFT;
wire data_mode;

/////// connect rx_control /////////
serial_rx_control serial_rx_control (
                                      .serial_br_i			(SHIFT_BR), //based on br_trans and not br
                                      .serial_clock_i 			(serial_clock_i),
                                      .serial_reset_i_b			(serial_reset_i_b),			
                                      .serial_scon7_sm0_i		(serial_scon7_sm0_i),
                                      .serial_scon4_ren_i		(serial_scon4_ren_i),
                                      .serial_scon0_ri_i		(serial_scon0_ri_i),
                                      .serial_end_bit_i  		(END_BIT),
                                      .serial_data_mode2_i      	(DATA_MODE2),
                                      .serial_transition_detected_i     (TRANSITION_DETECTED),
                                      
                                      .serial_clear_count_o		(CLEAR_COUNT),
                                      .serial_p3en_0_o			(serial_p3en_0_o),
                                      .serial_p3en_1_o			(serial_p3en_1_o),
                                      .serial_scon0_ri_o		(serial_scon0_ri_o),
                                      .serial_receive_o			(RECEIVE),
                                      .serial_load_sbuf_o		(LOAD_SBUF),                                      
                                      .serial_shift_input_shift_reg_o   (SHIFT_INPUT_SHIFT_REG),
                                      .serial_start_input_shift_reg_o   (START_INPUT_SHIFT_REG)
                                      ); 

serial_rx_detector serial_rx_detector (
                                          .serial_rxd_data_i            (serial_rxd_data_i),
                                          .serial_br_trans_i            (serial_br_trans_i),
                                          .serial_clear_count_i         (CLEAR_COUNT),
                                          .serial_clock_i               (serial_clock_i),
                                          .serial_reset_i_b             (serial_reset_i_b),
                                          
                                          .serial_sample_detected_o     (DATA_MODE2),    
                                          .serial_transition_detected_o (TRANSITION_DETECTED),
                                          .serial_shift_o 	        (SERIAL_SHIFT)
                                          ); 

/////////// Connect serial_rx_input_shifter_reg //////////////////////////////
serial_rx_input_shifter_reg serial_rx_input_shifter_reg (
                                    .serial_clock_i                  	(serial_clock_i) ,
                                    .serial_reset_i_b                  	(serial_reset_i_b),
                                    .serial_load_sbuf_i       	        (LOAD_SBUF),
                                    .serial_data_i		        (data_mode), 
                                    .serial_start_input_shift_reg_i     (START_INPUT_SHIFT_REG),
                                    .serial_shift_input_shift_reg_i     (SHIFT_INPUT_SHIFT_REG),
                                    .serial_receive_i			(RECEIVE),
                                    .serial_scon7_sm0_i			(serial_scon7_sm0_i),
                                    
                                    .serial_sbuf_rx_o			(serial_sbuf_rx_o),					
                                    .serial_end_bit_o    	        (END_BIT),					
                                    .serial_scon2_rb8_o			(serial_scon2_rb8_o)
                                    ); 


// logic to decide that is the input of serial_rx_input_shifter_reg
assign data_mode = serial_scon7_sm0_i ? DATA_MODE2 : serial_data_mode0_i;
assign SHIFT_BR = serial_scon7_sm0_i ? SERIAL_SHIFT : serial_br_i;
assign serial_receive_o     = RECEIVE;
assign serial_load_sbuf_o   = LOAD_SBUF;

endmodule
