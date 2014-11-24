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
// 2.0 10/09/2010 Standards signals names
// -------------------------------------------------------------------
// Description
// Implements a simple test bench to the FSM that controls the 
// RX_transceiver in serial. 
// -------------------------------------------------------------------


module serial_tx_control_tb_mode2 (); 

reg  serial_br_i,
     serial_clock_i, 
     serial_reset_i_b, 
     serial_scon7_sm0_i, 
     serial_scon1_ti_i, 
     serial_end_bit_i, 
     serial_serial_tx_i;

wire serial_data_en_o, 
     serial_p3en_0_o, 
     serial_p3en_1_o, 
     serial_scon1_ti_o,
     serial_send_o, 
     serial_shift_o, 
     serial_stop_bit_gen_o,
     serial_start_shifter_reg_o;

parameter PERIOD = 10;

serial_tx_control serial_tx_control_tb_mode2  (
                                      .serial_br_i	     (serial_br_i),
                                      .serial_clock_i        (serial_clock_i), 
                                      .serial_reset_i_b      (serial_reset_i_b),
                                      .serial_scon7_sm0_i    (serial_scon7_sm0_i),
                                      .serial_scon1_ti_i     (serial_scon1_ti_i),
                                      .serial_end_bit_i      (serial_end_bit_i), 
                                      .serial_serial_tx_i    (serial_serial_tx_i),
                                      
                                      .serial_p3en_0_o                (serial_p3en_0_o),
                                      .serial_p3en_1_o                (serial_p3en_1_o),
                                      .serial_data_en_o		     (serial_data_en_o),
                                      .serial_scon1_ti_o            (serial_scon1_ti_o),
                                      .serial_send_o                  (serial_send_o),
                                      .serial_shift_o                 (serial_shift_o),                                      
                                      .serial_stop_bit_gen_o          (serial_stop_bit_gen_o),
                                      .serial_start_shifter_reg_o     (serial_start_shifter_reg_o)
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
   #(PERIOD*16);
   serial_br_i <= 1'b0;
   #(PERIOD*16); 
end


initial
begin
   
   @(posedge serial_clock_i);
   serial_reset_i_b = 1'b0;

   serial_scon7_sm0_i           = 1'b1; 
   serial_scon1_ti_i           = 1'b0; 
   serial_end_bit_i              = 1'b0; 
   serial_serial_tx_i		    = 1'b0; 
   ///////////////////////////////// MODE 0 /////////////////////////////////
   
   @(negedge serial_clock_i); 
   serial_reset_i_b = 1'b1;
   
   
   ///////////////////////////////// MODE 2 /////////////////////////////////
  
   
  @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   #1;serial_scon7_sm0_i           = 1'b1; 
   serial_scon1_ti_i           = 1'b0; 
   serial_end_bit_i              = 1'b0; 
   serial_serial_tx_i		    = 1'b0; 


   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
  #1;serial_scon1_ti_i   = 1'b0;
   serial_serial_tx_i       = 1'b1; 
   serial_end_bit_i         = 1'b0;
   
   @(posedge serial_clock_i);
   #1;serial_serial_tx_i    = 1'b0; 
  
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i); 
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   #1;serial_end_bit_i     = 1'b1;
   serial_scon1_ti_i  = 1'b1;
       
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   
   
   
    $finish (0); 
   
end


endmodule
