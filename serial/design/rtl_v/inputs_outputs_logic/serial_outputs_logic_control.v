// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_outputs_logic_control.v
// Module Name: serial
// Author: Harney Abrhaim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 31/08/2010 Initial version
// 2.0 08/09/2010 Output logic fixed to generate shift clock
// 2.1 10/09/2010 Standard signals names
// 2.1 24/10/2010 Bug fixed with scon1_ti_o output
// -------------------------------------------------------------------
// Description
// Implements the serial logic outputs to top of serial block
// -------------------------------------------------------------------/


module serial_outputs_logic_control (
                                    serial_clock_internal_i,
                                    serial_reset_internal_i_b,
                                    serial_br_internal_i,
                                    serial_br_trans_internal_i,
                                    serial_scon0_ri_o_internal_i,
                                    serial_scon1_ti_o_internal_i,
                                    serial_scon2_rb8_internal_i,
                                    serial_data_tx_internal_i,
                                    serial_scon7_sm0_internal_i,
                                    serial_p3en_0_internal_i,
                                    serial_p3en_1_internal_i,
                                    serial_receive_internal_i,
                                    serial_send_internal_i,
                                    serial_data_en_internal_i,
                                    serial_sbuf_rx_internal_i,
				    serial_load_sbuf_internal_i,
                                    
                                    serial_p3en_0_o,
                                    serial_p3en_1_o,
                                    serial_p3_0_o,
                                    serial_p3_1_o,
                                    serial_scon0_ri_o,
                                    serial_scon1_ti_o,
                                    serial_scon2_rb8_o,
                                    serial_data_sbuf_o,
				    serial_load_sbuf_o
                                     ); 

////////// inputs and outputs ////////////////////
input serial_clock_internal_i;
input serial_reset_internal_i_b;
input serial_br_internal_i;
input serial_br_trans_internal_i;
input serial_scon0_ri_o_internal_i;
input serial_scon1_ti_o_internal_i;
input serial_scon2_rb8_internal_i;
input serial_scon7_sm0_internal_i;
input serial_data_tx_internal_i;
input serial_p3en_0_internal_i;
input serial_p3en_1_internal_i;
input serial_receive_internal_i;
input serial_send_internal_i;
input serial_data_en_internal_i;
input [7:0]serial_sbuf_rx_internal_i;
input serial_load_sbuf_internal_i;

output serial_p3en_0_o;
output serial_p3en_1_o;
output serial_p3_0_o;
output serial_p3_1_o;
output serial_scon0_ri_o;
output serial_scon1_ti_o;
output serial_scon2_rb8_o;
output [7:0]serial_data_sbuf_o;
output serial_load_sbuf_o;
////// internal variables to control the logic ////
wire mode0_tx;
wire transmitting_mode0;

wire not_send;
wire temp_mode2;
wire mode2_tx;
wire transmitting_mode2;
wire txd_mode2;
wire temp_mode0;
wire txd_mode0;



wire shift_clock; //generate the shift clock to mode0

////////// Logic controls ////////////////////////
// if the transmiti is enable than send a signal to the port 3.0 in mode0
// if trnasmit disable then sends a 1'b0 (considering that the core controls
assign mode0_tx           = serial_data_tx_internal_i && serial_send_internal_i;
assign transmitting_mode0 = serial_send_internal_i ? 1'b1 : 1'b0;
assign serial_p3_0_o               = transmitting_mode0 ? mode0_tx : 1'b0;  

// logic to mode 2 output
assign temp_mode2         = serial_data_en_internal_i && serial_data_tx_internal_i;
assign not_send           = !serial_send_internal_i;
assign mode2_tx           = not_send || temp_mode2;
//assign transmitting_mode2 = serial_receive_internal_i ? 1'b1 : 1'b0; 
assign transmitting_mode2 = serial_send_internal_i ? 1'b1 : 1'b0;
assign txd_mode2          = transmitting_mode2 ? mode2_tx : 1'b0; 

// logic to mode 0 shift clock
assign temp_mode0         = serial_send_internal_i || serial_receive_internal_i;
assign txd_mode0          = !(shift_clock && temp_mode0);

// port 3_1 logic
assign serial_p3_1_o               = serial_scon7_sm0_internal_i ? txd_mode2 : txd_mode0;


// other outputs logics
assign serial_p3en_0_o      = serial_p3en_0_internal_i;
assign serial_p3en_1_o      = serial_p3en_1_internal_i;
assign serial_scon0_ri_o  = serial_scon0_ri_o_internal_i;
assign serial_scon1_ti_o  = serial_scon1_ti_o_internal_i;
assign serial_scon2_rb8_o   = serial_scon2_rb8_internal_i;
assign serial_data_sbuf_o   = serial_sbuf_rx_internal_i;
assign serial_load_sbuf_o   = serial_load_sbuf_internal_i;

assign shift_clock = serial_receive_internal_i ? serial_br_internal_i : !serial_br_internal_i;



endmodule
