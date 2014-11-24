// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_top.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 25/08/2010 Initial version
// 2.0 08/09/2001 Top serial is functional with some bugs
// 2.1 10/09/2010 Standard signals names
// 2.2 17/10/2010 Put the full path of the files
// -------------------------------------------------------------------
// Description
// Implements the serial top of serial block 
// -------------------------------------------------------------------/

`include "/home/student/EMC08/digital_A/serial/design/rtl_v/inputs_outputs_logic/serial_inputs_logic_control.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/inputs_outputs_logic/serial_outputs_logic_control.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/receiver/serial_rx.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/transmitter/serial_tx.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/receiver/detector/serial_rx_detector.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/receiver/rx_control/serial_rx_control.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/receiver/serial_input_shifter_reg/serial_rx_input_shifter_reg.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/transmitter/tx_control/serial_tx_control.v"
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/transmitter/serial_output_shifter_reg/serial_tx_output_shifter_reg.v"

module serial_top (
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

// Inputs and outputs - All are wires
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
input serial_p3_0_i;       

output serial_p3en_0_o;
output serial_p3en_1_o;
output serial_p3_0_o;
output serial_p3_1_o;
output serial_scon0_ri_o;
output serial_scon1_ti_o;
output serial_scon2_rb8_o;
output [7:0]serial_data_sbuf_o;
output serial_load_sbuf_o;

// Internal wires
wire CLOCK_INTERNAL;
wire RESET_INTERNAL;
wire BR_INTERNAL;
wire BR_TRANS_INTERNAL;
wire SCON0_RI_I_INTERNAL;
wire SCON1_TI_I_INTERNAL;
wire SCON3_TB8_INTERNAL;
wire SCON4_REN_INTERNAL;
wire SCON7_MODE_INTERNAL;
wire SERIAL_TX_INTERNAL;
wire [7:0]DATA_SBUF_INTERNAL;
wire RXD_DATA_INTERNAL;
wire DATA_MODE0_INTERNAL;

wire SCON0_RI_O_INTERNAL;
wire SCON1_TI_O_INTERNAL;
wire SCON2_RB8_INTERNAL; 
wire P3EN_0_INTERNAL;
wire P3EN_1_INTERNAL;
wire [7:0]SBUF_RX_INTERNAL;
wire SEND_INTERNAL;
wire DATA_EN_INTERNAL;
wire DATA_TX_INTERNAL;
wire CLEAR_COUNT_INTERNAL;
wire RECEIVE_INTERNAL;
wire LOAD_SBUF_INTERNAL;

wire  p3en_1_temp1;
wire  p3en_1_temp2;
wire  p3en_0_temp1;
wire  p3en_0_temp2;

// Internal block connections
serial_inputs_logic_control serial_inputs_logic_control (
                                    .serial_clock_i                   (serial_clock_i),
                                    .serial_reset_i_b                 (serial_reset_i_b),
                                    .serial_br_i                      (serial_br_i),
                                    .serial_br_trans_i                (serial_br_trans_i),
                                    .serial_scon0_ri_i                (serial_scon0_ri_i),
                                    .serial_scon1_ti_i                (serial_scon1_ti_i),
                                    .serial_scon3_tb8_i               (serial_scon3_tb8_i),
                                    .serial_scon4_ren_i               (serial_scon4_ren_i),
                                    .serial_scon7_sm0_i               (serial_scon7_sm0_i),
                                    .serial_serial_tx_i               (serial_serial_tx_i),
                                    .serial_data_sbuf_i               (serial_data_sbuf_i),
                                    .serial_p3_0_i                    (serial_p3_0_i),
                                    
                                    .serial_clock_i_internal_o        (CLOCK_INTERNAL),
                                    .serial_reset_i_b_internal_o      (RESET_INTERNAL),
                                    .serial_br_i_internal_o           (BR_INTERNAL),
                                    .serial_br_trans_i_internal_o     (BR_TRANS_INTERNAL),
                                    .serial_scon0_ri_i_internal_o     (SCON0_RI_I_INTERNAL),
                                    .serial_scon1_ti_i_internal_o     (SCON1_TI_I_INTERNAL),
                                    .serial_scon3_tb8_i_internal_o    (SCON3_TB8_INTERNAL),
                                    .serial_scon4_ren_i_internal_o    (SCON4_REN_INTERNAL),
                                    .serial_scon7_sm0_i_internal_o    (SCON7_MODE_INTERNAL),
                                    .serial_serial_tx_i_internal_o    (SERIAL_TX_INTERNAL),
                                    .serial_data_sbuf_i_internal_o    (DATA_SBUF_INTERNAL),
                                    .serial_rxd_data_internal_o       (RXD_DATA_INTERNAL),
                                    .serial_data_mode0_internal_o     (DATA_MODE0_INTERNAL)
                                   ); 

serial_outputs_logic_control serial_outputs_logic_control  (
                                    .serial_clock_internal_i          (CLOCK_INTERNAL),
                                    .serial_reset_internal_i_b        (RESET_INTERNAL),
                                    .serial_br_internal_i             (BR_INTERNAL),
                                    .serial_br_trans_internal_i       (BR_TRANS_INTERNAL),
                                    .serial_scon0_ri_o_internal_i     (SCON0_RI_O_INTERNAL),
                                    .serial_scon1_ti_o_internal_i     (SCON1_TI_O_INTERNAL),
                                    .serial_scon2_rb8_internal_i      (SCON2_RB8_INTERNAL),
                                    .serial_data_tx_internal_i        (DATA_TX_INTERNAL),
                                    .serial_scon7_sm0_internal_i      (SCON7_MODE_INTERNAL),
                                    .serial_p3en_0_internal_i         (P3EN_0_INTERNAL),
                                    .serial_p3en_1_internal_i         (P3EN_1_INTERNAL),
                                    .serial_receive_internal_i        (RECEIVE_INTERNAL),
                                    .serial_send_internal_i           (SEND_INTERNAL),
                                    .serial_data_en_internal_i        (DATA_EN_INTERNAL),
                                    .serial_sbuf_rx_internal_i        (SBUF_RX_INTERNAL),
                                    .serial_load_sbuf_internal_i      (LOAD_SBUF_INTERNAL),
				    
                                    .serial_p3en_0_o                  (serial_p3en_0_o),
                                    .serial_p3en_1_o                  (serial_p3en_1_o),
                                    .serial_p3_0_o                    (serial_p3_0_o),
                                    .serial_p3_1_o                    (serial_p3_1_o),
                                    .serial_scon0_ri_o                (serial_scon0_ri_o),
                                    .serial_scon1_ti_o                (serial_scon1_ti_o),
                                    .serial_scon2_rb8_o               (serial_scon2_rb8_o),
                                    .serial_data_sbuf_o               (serial_data_sbuf_o),
				    .serial_load_sbuf_o		      (serial_load_sbuf_o)
                                     ); 

serial_rx serial_rx_block (
                     .serial_clock_i         (CLOCK_INTERNAL),
                     .serial_reset_i_b       (RESET_INTERNAL),
                     .serial_br_i            (BR_INTERNAL),
                     .serial_br_trans_i      (BR_TRANS_INTERNAL),
                     .serial_rxd_data_i      (RXD_DATA_INTERNAL),
                     .serial_scon7_sm0_i     (SCON7_MODE_INTERNAL),
                     .serial_scon4_ren_i     (SCON4_REN_INTERNAL),
                     .serial_scon0_ri_i      (SCON0_RI_I_INTERNAL),
                     .serial_data_mode0_i    (DATA_MODE0_INTERNAL),
                  
                     .serial_p3en_0_o        (p3en_0_temp1),
                     .serial_p3en_1_o        (p3en_1_temp1),
                     .serial_scon0_ri_o      (SCON0_RI_O_INTERNAL),
                     .serial_scon2_rb8_o     (SCON2_RB8_INTERNAL),
                     .serial_sbuf_rx_o       (SBUF_RX_INTERNAL),
                     .serial_receive_o       (RECEIVE_INTERNAL),
		     .serial_load_sbuf_o     (LOAD_SBUF_INTERNAL)
                    );

serial_tx serial_tx_block (
                  .serial_br_i               (BR_INTERNAL),
                  .serial_clock_i            (CLOCK_INTERNAL),
                  .serial_reset_i_b          (RESET_INTERNAL),
                  .serial_scon7_sm0_i        (SCON7_MODE_INTERNAL),
                  .serial_scon1_ti_i         (SCON1_TI_I_INTERNAL),
                  .serial_serial_tx_i        (SERIAL_TX_INTERNAL),
                  .serial_data_sbuf_i        (DATA_SBUF_INTERNAL),
                  .serial_scon3_tb8_i        (SCON3_TB8_INTERNAL),
                  
                  .serial_p3en_0_o           (p3en_0_temp2),
                  .serial_p3en_1_o           (p3en_1_temp2), 
                  .serial_scon1_ti_o         (SCON1_TI_O_INTERNAL),
                  .serial_send_o             (SEND_INTERNAL),
                  .serial_data_en_o          (DATA_EN_INTERNAL),
                  .serial_data_tx_o          (DATA_TX_INTERNAL)
                 ); 

assign P3EN_0_INTERNAL = p3en_0_temp1 || p3en_0_temp2;
assign P3EN_1_INTERNAL = p3en_1_temp1 || p3en_1_temp2;

endmodule
