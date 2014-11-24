// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_tx_tb_mode2.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 30/08/2010 Initial version
// 2.0 10/09/2010 Standards signals names
// -------------------------------------------------------------------
// Description
// Implements the TX top basic testbench of serial block
// -------------------------------------------------------------------/

module serial_tx_tb_mode2 (); 


parameter PERIOD = 10;

reg  serial_br_i,
     serial_clock_i,
     serial_reset_i_b, 
     serial_scon7_sm0_i, 
     serial_scon1_ti_i,
     serial_serial_tx_i,
     serial_scon3_tb8_i; 
reg [7:0] serial_data_sbuf_i;
     
wire  serial_p3en_0_o,
      serial_p3en_1_o,
      serial_scon1_ti_o,
      serial_send_o,
      serial_data_en_o,
      serial_data_tx_o;

serial_tx serial_tx_tb_mode2 (
                  .serial_clock_i		(serial_clock_i),
                  .serial_reset_i_b		(serial_reset_i_b),
                  .serial_br_i			(serial_br_i),
                  .serial_scon7_sm0_i		(serial_scon7_sm0_i),
                  .serial_scon1_ti_i		(serial_scon1_ti_i),
                  .serial_serial_tx_i           (serial_serial_tx_i),
                  .serial_scon3_tb8_i           (serial_scon3_tb8_i),
                  .serial_data_sbuf_i		(serial_data_sbuf_i),
                  
                  .serial_p3en_0_o		(serial_p3en_0_o),
                  .serial_p3en_1_o		(serial_p3en_1_o),
                  .serial_scon1_ti_o	        (serial_scon1_ti_o),
                  .serial_send_o                (serial_send_o),
                  .serial_data_en_o             (serial_data_en_o),
                  .serial_data_tx_o		(serial_data_tx_o)
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
   serial_br_i <= 1'b0;
   #(PERIOD*4);
   serial_br_i <= 1'b1;
   #(PERIOD*4); 
end

initial
begin
   
   @(posedge serial_clock_i);
   serial_reset_i_b = 1'b0;

   serial_scon7_sm0_i            = 1'b1; 
   serial_scon1_ti_i             = 1'b0; 
   serial_serial_tx_i		 = 1'b0;
   serial_scon3_tb8_i            = 1'b0; 
   serial_data_sbuf_i            = 8'd0;

   ///////////////////////////////// MODE 0 /////////////////////////////////
   
   @(negedge serial_clock_i); 
   serial_reset_i_b = 1'b1;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   #1;serial_serial_tx_i            = 1'b1; // begins the reception
   #1;serial_scon1_ti_i           = 1'b0;
   #1;serial_data_sbuf_i            = 8'b00110011; 
 

   @(posedge serial_clock_i); 
   #1; serial_serial_tx_i = 1'b0;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
        
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i); 
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
        
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   
   
    @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i); 
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   
   #1;serial_serial_tx_i            = 1'b1; // begins the reception
   serial_scon3_tb8_i            = 1'b1;
   serial_scon1_ti_i           = 1'b0;
   serial_data_sbuf_i            = 8'b10100010; 
 

   @(posedge serial_clock_i); 
   #1; serial_serial_tx_i = 1'b0;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
        
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i); 
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
        
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   
   #1;serial_scon1_ti_i           = 1'b0;
   
      
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
  
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
  

   $finish(0);
   
 end  
   
endmodule

