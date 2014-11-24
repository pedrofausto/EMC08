// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_detector_tb.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 19/08/2010 Initial version
// 2.0 10/09/2010 Standard signals names
// 2.1 14/09/2010 Changed the Period to the projetc period
// -------------------------------------------------------------------
// Description
// This file implements a simple test bench to verify the rx_detector
// module
// -------------------------------------------------------------------


module serial_rx_detector_tb (); 

parameter PERIOD = 50;

//inputs of testbench
reg serial_rxd_data_i;
reg serial_br_trans_i;
reg serial_clear_count_i;
reg serial_clock_i;
reg serial_reset_i_b;

wire serial_sample_detected_o;
wire serial_transition_detected_o;
wire serial_shift_o;

serial_rx_detector serial_rx_detector_tb (
                                          .serial_rxd_data_i            (serial_rxd_data_i),
                                          .serial_br_trans_i            (serial_br_trans_i),
                                          .serial_clear_count_i         (serial_clear_count_i),
                                          .serial_clock_i               (serial_clock_i),
                                          .serial_reset_i_b             (serial_reset_i_b),
                                          
                                          .serial_sample_detected_o     (serial_sample_detected_o),
                                          .serial_transition_detected_o (serial_transition_detected_o),
                                          .serial_shift_o               (serial_shift_o)	
                                          ); 


always 
begin
   serial_clock_i <= 1'b1;
   #(PERIOD/2);
   serial_clock_i <= 1'b0;
   #(PERIOD/2); 
end


always
begin
   #1
  serial_br_trans_i <= 1'b1;
   #(4*PERIOD);
   serial_br_trans_i <= 1'b0;
   #(4*PERIOD-1); 
end

initial
begin
#2;
#(PERIOD);
   
   #(PERIOD);
   serial_reset_i_b = 1'b0;

   serial_rxd_data_i       = 1'b1;
   serial_clear_count_i    = 1'b0;
   
   
   #(2*PERIOD);

   serial_reset_i_b = 1'b1;
      
   #(PERIOD*4);
   serial_rxd_data_i = 1'b0;
   
   #(15*PERIOD);

   serial_clear_count_i = 1'b1;
      
   #(PERIOD);
   serial_clear_count_i = 1'b0; 
   
   #(12*PERIOD);

     serial_clear_count_i = 1'b1;
     
   #(PERIOD);
   serial_clear_count_i = 1'b0; 
   
   #(PERIOD*44); 

     serial_rxd_data_i = 1'b1;
    
   
   #(PERIOD*300);
    
   $finish (0); 
    
end


endmodule
