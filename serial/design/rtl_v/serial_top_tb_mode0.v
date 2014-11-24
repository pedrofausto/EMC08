// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_top_tb_mode0.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 01/09/2010 Initial version
// 2.0 08/09/2010 Testbench to mode 0 to serial Top
// 2.1 10/10/2010 Standard signals names
// -------------------------------------------------------------------
// Description
// Implements the serial top mode0 testbench of serial block 
// -------------------------------------------------------------------/
module serial_top_tb_mode0 (); 

parameter PERIOD = 10;

reg serial_clock_i,
    serial_reset_i_b,
    serial_br_i,
    serial_br_trans_i,
    serial_scon0_ri_i,
    serial_scon1_ti_i,
    serial_scon3_tb8_i,
    serial_scon4_ren_i,
    serial_scon7_sm0_i,
    serial_serial_tx_i,
    serial_p3_0_i;
reg [7:0]serial_data_sbuf_i;

wire serial_p3en_0_o,
     serial_p3en_1_o,
     serial_p3_0_o,
     serial_p3_1_o,
     serial_scon0_ri_o,
     serial_scon1_ti_o,
     serial_scon2_rb8_o;
wire [7:0]serial_data_sbuf_o;

serial_top serial_top_tb_mode0 (
                  .serial_clock_i           (serial_clock_i),
                  .serial_reset_i_b         (serial_reset_i_b),
                  .serial_br_i              (serial_br_i),
                  .serial_br_trans_i        (serial_br_trans_i),
                  .serial_scon0_ri_i        (serial_scon0_ri_i),
                  .serial_scon1_ti_i        (serial_scon1_ti_i),
                  .serial_scon3_tb8_i       (serial_scon3_tb8_i),
                  .serial_scon4_ren_i       (serial_scon4_ren_i),
                  .serial_scon7_sm0_i       (serial_scon7_sm0_i),
                  .serial_serial_tx_i       (serial_serial_tx_i),
                  .serial_data_sbuf_i       (serial_data_sbuf_i),
                  .serial_p3_0_i            (serial_p3_0_i),
                  
                  .serial_p3en_0_o          (serial_p3en_0_o),
                  .serial_p3en_1_o          (serial_p3en_1_o),
                  .serial_p3_0_o            (serial_p3_0_o),
                  .serial_p3_1_o            (serial_p3_1_o),
                  .serial_scon0_ri_o        (serial_scon0_ri_o),
                  .serial_scon1_ti_o        (serial_scon1_ti_o),
                  .serial_scon2_rb8_o       (serial_scon2_rb8_o),
                  .serial_data_sbuf_o       (serial_data_sbuf_o)
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
   #(PERIOD*2);
   serial_br_i <= 1'b1;
   #(PERIOD*2); 
end

always 
begin
   serial_br_trans_i <= 1'b0;
   #(PERIOD*2);
   serial_br_trans_i <= 1'b1;
   #(PERIOD*2); 
end


initial
begin
    
    @(posedge serial_clock_i);
    serial_reset_i_b = 1'b0;
    
    serial_scon0_ri_i         = 1'b0;
    serial_scon1_ti_i         = 1'b0;
    serial_scon3_tb8_i          = 1'b0;
    serial_scon4_ren_i          = 1'b0;
    serial_scon7_sm0_i         = 1'b0;
    serial_serial_tx_i          = 1'b0;
    serial_p3_0_i             = 1'b0;
    serial_data_sbuf_i        = 8'd0;
    
    @(negedge serial_clock_i);
    serial_reset_i_b = 1'b1;
    
    /////////////// test case 1 - RECEIVING 10101010 ///////////
    
    @(posedge serial_clock_i); @(posedge serial_clock_i); @(posedge serial_clock_i); @(posedge serial_clock_i); 
    
    @(posedge serial_clock_i);
    serial_scon4_ren_i = 1'b1; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0; 
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    serial_scon4_ren_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i); serial_scon0_ri_i         = 1'b1; @(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    serial_scon0_ri_i         = 1'b0; 
     @(posedge serial_clock_i); @(posedge serial_clock_i); @(posedge serial_clock_i); @(posedge serial_clock_i); 
    
    ////////// test case 2 - RECEIVING  11111111  ////////
    
    @(posedge serial_clock_i);
    #2;serial_scon4_ren_i = 1'b1; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    serial_scon4_ren_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i); 
     
    ////////// test case 3 - RECEIVING 00000000  ////////
    
    @(posedge serial_clock_i);
    #2;serial_scon4_ren_i = 1'b1; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    serial_scon4_ren_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i); 
    
    ////////// test case 4 - RECEIVING 01010101  ////////
    
    @(posedge serial_clock_i);
    serial_scon4_ren_i = 1'b1; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #1;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b1;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #13;serial_p3_0_i = 1'b0;
    
    serial_scon4_ren_i = 1'b0;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i); 
    
     
    ////////// test case 5 - TRANSMITING 01010101  ////////
    
    @(posedge serial_clock_i);
    
    serial_data_sbuf_i  = 8'b01010101;
    
    @(posedge serial_clock_i); @(posedge serial_clock_i);
    serial_serial_tx_i = 1'b1; // actives receive 
    
    @(posedge serial_clock_i); serial_serial_tx_i = 1'b0; 
    // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    serial_scon1_ti_i = 1'b1;
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);  
    serial_scon1_ti_i = 1'b0; 
    
    ////////// test case 5 - TRANSMITING 01000110  ////////
    
    @(posedge serial_clock_i);
    
    serial_data_sbuf_i  = 8'b01000110;
    
    @(posedge serial_clock_i);
    @(posedge serial_clock_i); serial_serial_tx_i = 1'b1; // actives receive 
    
    @(posedge serial_clock_i); serial_serial_tx_i = 1'b0; 
    // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    serial_scon1_ti_i = 1'b1;
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);  
    serial_scon1_ti_i = 1'b0; 
    
    ////////// test case 6 - TRANSMITING 11111111  ////////
    
    @(posedge serial_clock_i);
    #2;serial_serial_tx_i = 1'b1; // actives receive
    serial_data_sbuf_i  = 8'b11111111;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);@(posedge serial_clock_i);
    #2;serial_serial_tx_i = 1'b0; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);

    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);  
     
    ////////// test case 6 - TRANSMITING 00000000  ////////
    
    @(posedge serial_clock_i);
    #2;serial_serial_tx_i = 1'b1; // actives receive
    serial_data_sbuf_i  = 8'b00000000;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #2;serial_serial_tx_i = 1'b0; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);

    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i); 
    
     ////////// test case 7 - TRANSMITING 10101010  ////////
    
    @(posedge serial_clock_i);
    #2;serial_serial_tx_i = 1'b1; // actives receive
    serial_data_sbuf_i  = 8'b10101010;
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    #2;serial_serial_tx_i = 1'b0; // actives receive
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);

    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    @(posedge serial_clock_i);@(posedge serial_clock_i);
    
        
    $finish(0);    
        
end




endmodule
