// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_tb.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 26/08/2010 Initial version
// 2.0 10/10/2010 Standard signals names
// -------------------------------------------------------------------
// Description
// Implements the RX top of serial block
// -------------------------------------------------------------------/


module serial_rx_tb_mode2 (); 

parameter PERIOD = 10;

reg  serial_br_i,
     serial_clock_i,
     serial_br_trans_i, 
     serial_reset_i_b, 
     serial_scon7_sm0_i, 
     serial_scon4_ren_i,
     serial_scon0_ri_i, 
     serial_rxd_data_i, 
     serial_data_mode0_i;
     
wire serial_p3en_0_o,
     serial_p3en_1_o,
     serial_scon0_ri_o,
     serial_scon2_rb8_o,
     serial_clear_count_o,
     serial_receive_o;
wire [7:0]	 serial_sbuf_rx_o; 

serial_rx serial_rx_tb_mode2 (
                  .serial_clock_i				(serial_clock_i),
                  .serial_reset_i_b				(serial_reset_i_b),
                  .serial_br_i					(serial_br_i),
                  .serial_br_trans_i		   	        (serial_br_trans_i),
                  .serial_rxd_data_i				(serial_rxd_data_i),
                  .serial_scon7_sm0_i				(serial_scon7_sm0_i),
                  .serial_scon4_ren_i				(serial_scon4_ren_i),
                  .serial_scon0_ri_i				(serial_scon0_ri_i),
                  .serial_data_mode0_i				(serial_data_mode0_i),
                  
                  .serial_p3en_0_o				(serial_p3en_0_o),
                  .serial_p3en_1_o				(serial_p3en_1_o),
                  .serial_scon0_ri_o				(serial_scon0_ri_o),
                  .serial_scon2_rb8_o				(scon2_ri_rb8),
                  .serial_sbuf_rx_o				(serial_sbuf_rx_o),
                  .serial_clear_count_o                         (serial_clear_count_o),
                  .serial_receive_o                             (serial_receive_o)
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
   serial_br_trans_i <= 1'b1;
   #(PERIOD*2);
   serial_br_trans_i <= 1'b0;
   #(PERIOD*2); 
end

always 
begin
   serial_br_i <= 1'b0;
   #(PERIOD*32);
   serial_br_i <= 1'b1;
   #(PERIOD*32); 
end




initial
begin
   
   @(posedge serial_clock_i);
   serial_reset_i_b = 1'b0;

   serial_br_trans_i				= 1'b0;
   serial_scon7_sm0_i           = 1'b1; 
   serial_scon4_ren_i            = 1'b0;
   serial_scon0_ri_i           = 1'b0; 
   serial_rxd_data_i				= 1'b1;
   serial_data_mode0_i           = 1'b0; 

   ///////////////// MODE 2 - TEST OUTPUT SBUF_RX = 00010111 and rb8 = 1/////
   
   @(negedge serial_clock_i); 
   serial_reset_i_b = 1'b1;
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   #1;serial_scon4_ren_i            = 1'b1; // begins the reception
   #1;serial_scon0_ri_i           = 1'b0;
   #1;serial_data_mode0_i           = 1'b1; 
 
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b1;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
    

    
   serial_rxd_data_i = 1'b1;      
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b0;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b1;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_scon4_ren_i            = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
  //////////////////////// TEST CASE 2 - output 00000000 - rb8 0 /////
  
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   #1;serial_scon4_ren_i            = 1'b1; // begins the reception
   #1;serial_scon0_ri_i           = 1'b0;
 
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b1;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
      serial_rxd_data_i = 1'b0;      
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b0;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_scon4_ren_i            = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
   //////////////////////// TEST CASE 3 - output 11111111 - rb8 1 /////
  
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   #1;serial_scon4_ren_i            = 1'b1; // begins the reception
   #1;serial_scon0_ri_i           = 1'b0;
 
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b1;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b1;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
   
      serial_rxd_data_i = 1'b1;      
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  @(posedge serial_clock_i); @(posedge serial_clock_i); 
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b1;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b1;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_scon4_ren_i            = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
  
   //////////////////////// TEST CASE 4 - output 10101010 - rb8 1 /////
  
   @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);     @(posedge serial_clock_i);   @(posedge serial_clock_i);   @(posedge serial_clock_i);

   #1;serial_scon4_ren_i            = 1'b1; // begins the reception
   #1;serial_scon0_ri_i           = 1'b0;
 
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 

   serial_rxd_data_i = 1'b1;
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_rxd_data_i = 1'b0; //start bit
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_rxd_data_i = 1'b1; // data 1
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
      
   #1;serial_rxd_data_i = 1'b0; // data 2  
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_rxd_data_i = 1'b1; //data 3
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_rxd_data_i = 1'b0; //data 4
   
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i); 
  
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b1; //data 5
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b0; //data 6
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b1; //data 7
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
    
   serial_rxd_data_i = 1'b0; //data 8 
      
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);     

   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   serial_rxd_data_i = 1'b1; //RB8
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   #1;serial_scon4_ren_i            = 1'b0;
   
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
   
   @(posedge serial_clock_i);   @(posedge serial_clock_i);  
  
  
   
   //`include "test_case_mode2.v"
   
   $finish(0);
   
 end  
   
endmodule
