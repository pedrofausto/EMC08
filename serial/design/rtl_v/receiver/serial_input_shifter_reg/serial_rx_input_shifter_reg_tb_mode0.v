// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_input_shifter_reg_tb.v
// Module Name: serial
// Author: Harney Abrhaim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 23/08/2010 Initial version
// 2.0 10/09/2010 Standard names of variables
// -------------------------------------------------------------------
// Description
// This file implements a simple test bench to verify the rx_input_shifter_reg
// module
// -------------------------------------------------------------------



module serial_rx_input_shifter_reg_tb_mode0 (); 


parameter PERIOD = 10;

// inputs of testbench
reg serial_load_sbuf_i;
reg serial_data_i;
reg serial_start_input_shift_reg_i;
reg serial_shift_input_shift_reg_i;
reg serial_scon7_sm0_i;
reg serial_receive_i;
reg serial_clock_i;
reg serial_reset_i_b;

// outputs of tstbench
wire [7:0] serial_sbuf_rx_o;
wire serial_end_bit_o;
wire serial_scon2_rb8_o;

serial_rx_input_shifter_reg serial_rx_input_shifter_reg_tb_mode0 (
                                    .serial_clock_i                     (serial_clock_i) ,
                                    .serial_reset_i_b                   (serial_reset_i_b),
                                    .serial_load_sbuf_i                 (serial_load_sbuf_i),
                                    .serial_data_i		        (serial_data_i),
                                    .serial_start_input_shift_reg_i     (serial_start_input_shift_reg_i),
                                    .serial_shift_input_shift_reg_i	(serial_shift_input_shift_reg_i),
                                    .serial_receive_i			(serial_receive_i),
                                    .serial_scon7_sm0_i			(serial_scon7_sm0_i),
                                    .serial_sbuf_rx_o			(serial_sbuf_rx_o),
                                    .serial_end_bit_o			(serial_end_bit_o),
                                    .serial_scon2_rb8_o			(serial_scon2_rb8_o)
                                    ); 

always 
begin
   serial_clock_i <= 1'b1;
   #(PERIOD);
   serial_clock_i <= 1'b0;
   #(PERIOD); 
end

initial
begin@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);
   serial_reset_i_b                     = 1'b0;
   serial_load_sbuf_i	  		= 1'b0;
   serial_start_input_shift_reg_i 	= 1'b0;
   serial_shift_input_shift_reg_i 	= 1'b0;
   serial_scon7_sm0_i     		= 1'b0;
   serial_receive_i       		= 1'b0;
   serial_data_i			= 1'b1;
   
   
   @(negedge serial_clock_i); 
   serial_reset_i_b = 1'b1;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   #1; serial_start_input_shift_reg_i 	= 1'b1;
       
   @(posedge serial_clock_i);
   
   #1; serial_start_input_shift_reg_i 	= 1'b0;
   
   serial_data_i = 1'b1;
   #1; serial_receive_i = 1'b1;
    
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
      
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
    
   @(posedge serial_clock_i);   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
   @(posedge serial_clock_i);     
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
    
   @(posedge serial_clock_i);      
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
    @(posedge serial_clock_i);    
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
    @(posedge serial_clock_i);      
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
    @(posedge serial_clock_i);       
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
   @(posedge serial_clock_i);  
    
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
   serial_load_sbuf_i = 1'b1;
   serial_receive_i   = 1'b0; 
    
        
    
   @(posedge serial_clock_i);
   #1 serial_load_sbuf_i = 1'b0;
    
    @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   #1; serial_start_input_shift_reg_i 	= 1'b1;
        
   @(posedge serial_clock_i);
   
   #1; serial_start_input_shift_reg_i 	= 1'b0;
   
   serial_data_i = 1'b0;
   #1; serial_receive_i = 1'b1;
    
   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
      
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
    
   @(posedge serial_clock_i);   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
   @(posedge serial_clock_i);     
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b0;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
    
   @(posedge serial_clock_i);      
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
    @(posedge serial_clock_i);    
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b0;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
    @(posedge serial_clock_i);      
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
    @(posedge serial_clock_i);       
   
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
   @(posedge serial_clock_i);  
    
   #1;serial_shift_input_shift_reg_i 	= 1'b1;
   #1;serial_data_i = 1'b1;
   
   @(posedge serial_clock_i);
   #1;serial_shift_input_shift_reg_i 	= 1'b0;
   
   serial_load_sbuf_i = 1'b1;
   serial_receive_i   = 1'b0; 
   
    
   @(posedge serial_clock_i);  
   #1; serial_load_sbuf_i = 1'b0;
   
    @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
       
   $finish (0); 
    
end

endmodule
