// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_input_serial_shift_ier_reg_tb.v
// Module Name: serial
// Author: Harney Abrhaim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 27/08/2010 Initial version
// 2.0 10/09/2010 Renamed variables to standard
// -------------------------------------------------------------------
// Description
// This file implements a simple test bench to verify the tx_input_serial_shift_ier_reg
// module
// -------------------------------------------------------------------


module serial_tx_output_shifter_reg_tb_mode0 (); 


parameter PERIOD = 10;

// inputs of testbench
reg serial_clock_i;
reg serial_reset_i_b;
reg [7:0] serial_data_sbuf_i;
reg serial_start_shifter_reg_i;
reg serial_shift_i;
reg serial_stop_bit_gen_i;
reg serial_scon3_tb8_i;
reg serial_scon7_sm0_i;

// outputs of tstbench
wire serial_data_tx_o;
wire serial_end_bit_o;

serial_tx_output_shifter_reg serial_tx_output_serial_shifter_reg_tb_mode0 (
                                    .serial_clock_i             (serial_clock_i),
                                    .serial_reset_i_b          	(serial_reset_i_b),
                                    .serial_start_shifter_reg_i (serial_start_shifter_reg_i),
                                    .serial_shift_i             (serial_shift_i),
                                    .serial_stop_bit_gen_i	(serial_stop_bit_gen_i),
                                    .serial_scon3_tb8_i		(serial_scon3_tb8_i),
                                    .serial_data_sbuf_i         (serial_data_sbuf_i),
                                    .serial_scon7_sm0_i         (serial_scon7_sm0_i),
                                    
                                    .serial_data_tx_o		(serial_serial_data_tx_o_o),
                                    .serial_end_bit_o		(serial_end_bit_o)
                                    ); 


initial
begin@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);
   serial_reset_i_b = 1'b0;
 
   serial_start_shifter_reg_i = 1'b0;
   serial_shift_i             = 1'b0;
   serial_stop_bit_gen_i      = 1'b0;
   serial_scon3_tb8_i         = 1'b0;
   serial_data_sbuf_i         = 8'dz;
   serial_scon7_sm0_i        = 1'b0;
   
   @(negedge serial_clock_i); 
   serial_reset_i_b = 1'b1;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   #1; serial_start_shifter_reg_i = 1'b1;
       serial_data_sbuf_i = 8'b11010101;
       
   @(posedge serial_clock_i);
   
   #1; serial_start_shifter_reg_i = 1'b0;
   
   
  
    
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
      
   #1;serial_shift_i 	= 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_i 	= 1'b0;
    
   @(posedge serial_clock_i);   
   #1;serial_shift_i 	= 1'b1;
      
   @(posedge serial_clock_i);
   
   #1;serial_shift_i 	= 1'b0;
   
   @(posedge serial_clock_i);     
   
   #1;serial_shift_i 	= 1'b1;
      
   @(posedge serial_clock_i);
   
   #1;serial_shift_i 	= 1'b0;
    
   @(posedge serial_clock_i);      
   
   #1;serial_shift_i 	= 1'b1;
     
   @(posedge serial_clock_i);
   
   #1;serial_shift_i 	= 1'b0;
   
    @(posedge serial_clock_i);    
   
   #1;serial_shift_i 	= 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_i 	= 1'b0;
   
    @(posedge serial_clock_i);      
   
   #1;serial_shift_i 	= 1'b1;
     
   @(posedge serial_clock_i);
   
   #1;serial_shift_i 	= 1'b0;
   
    @(posedge serial_clock_i);       
   
   #1;serial_shift_i 	= 1'b1;
    
   @(posedge serial_clock_i);
   #1;serial_shift_i 	= 1'b0;
   
   @(posedge serial_clock_i);  
    
   #1;serial_shift_i 	= 1'b1;
    
   @(posedge serial_clock_i);
   #1;serial_shift_i 	= 1'b0;
   


    
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
    
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
       
   $finish (0); 
    
end


always 
begin
   serial_clock_i <= 1'b1;
   #(PERIOD);
   serial_clock_i <= 1'b0;
   #(PERIOD); 
end
    


endmodule
