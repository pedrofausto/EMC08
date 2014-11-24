// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_control_tb.v
// Module Name: serial
// Author: Harney Abrhaim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 25/08/2010 Initial version
// 2.1 10/09/2010 Standard signals names
// -------------------------------------------------------------------
// Description
// Implements a simple test bench to the FSM that controls the 
// RX_transceiver in serial. 
// -------------------------------------------------------------------


module serial_rx_control_tb_mode0 (); 

reg  serial_br_i,
     serial_clock_i, 
     serial_reset_i_b, 
     serial_scon7_sm0_i, 
     serial_scon4_ren_i,
     serial_scon0_ri_i, 
     serial_end_bit_i, 
     serial_data_mode2_i, 
     serial_transition_detected_i;

wire serial_clear_count_o, 
     serial_p3en_0_o, 
     serial_p3en_1_o, 
     serial_scon0_ri_o,
     serial_receive_o, 
     serial_load_sbuf_o, 
     serial_shift_input_shift_reg_o,
     serial_start_input_shift_reg_o;

parameter PERIOD = 10;

serial_rx_control serial_rx_control_tb_mode0  (
                                      .serial_br_i		      (serial_br_i),
                                      .serial_clock_i                 (serial_clock_i), 
                                      .serial_reset_i_b               (serial_reset_i_b),
                                      .serial_scon7_sm0_i             (serial_scon7_sm0_i),
                                      .serial_scon4_ren_i             (serial_scon4_ren_i),
                                      .serial_scon0_ri_i              (serial_scon0_ri_i),
                                      .serial_end_bit_i               (serial_end_bit_i), 
                                      .serial_data_mode2_i            (serial_data_mode2_i),
                                      .serial_transition_detected_i   (serial_transition_detected_i),
                                      
                                      .serial_clear_count_o           (serial_clear_count_o),
                                      .serial_p3en_0_o                (serial_p3en_0_o),
                                      .serial_p3en_1_o                (serial_p3en_1_o),
                                      .serial_scon0_ri_o              (serial_scon0_ri_o),
                                      .serial_receive_o               (serial_receive_o),
                                      .serial_load_sbuf_o             (serial_load_sbuf_o),                                      
                                      .serial_shift_input_shift_reg_o (serial_shift_input_shift_reg_o),
                                      .serial_start_input_shift_reg_o (serial_start_input_shift_reg_o)
                                      ); 

always 
begin
   serial_clock_i <= 1'b1;
   #(PERIOD);
   serial_clock_i <= 1'b0;
   #(PERIOD); 
end

always 
begin
   serial_br_i <= 1'b1;
   #(PERIOD*2);
   serial_br_i <= 1'b0;
   #(PERIOD*2); 
end


initial
begin
   
   @(posedge serial_clock_i);
   serial_reset_i_b = 1'b0;

   serial_scon7_sm0_i           = 1'b0; 
   serial_scon4_ren_i            = 1'b0;
   serial_scon0_ri_i           = 1'b0; 
   serial_end_bit_i              = 1'b1; 
   serial_data_mode2_i           = 1'b0; 
   serial_transition_detected_i  = 1'b0;

   ///////////////////////////////// MODE 0 /////////////////////////////////
   
   @(negedge serial_clock_i); 
   serial_reset_i_b = 1'b1;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   #1;serial_scon4_ren_i         = 1'b1; // begins the reception
   serial_scon0_ri_i           = 1'b0;
   serial_end_bit_i = 1'b1;


   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);       
   
   #1;serial_end_bit_i = 1'b0;
   serial_scon4_ren_i            = 1'b0; 
   serial_scon0_ri_i           = 1'b1;
   
      
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   
   
    $finish (0); 
   
end


endmodule
