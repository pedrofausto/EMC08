// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: Port_func_tb.v
// Module Name: tb_PORTS
// Author: Lizbeth Paredes and Julierme Silva
// E-mail: liz.paredes@gmail.com and julierme.silva@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 01/09/2010 Initial version
// 2.0 15/09/2010 New version, integer the IP module 
// -------------------------------------------------------------------
// Description
// This file describes the coding testing to be used on rtl
// testing.
// -------------------------------------------------------------------
// ncvlog Port_TOP.v Port_func.v Port_func_tb.v -messages
// ncelab tb_PORTS -access +rwc
// ncsim tb_PORTS -gui &
// -------------------------------------------------------------------
// -------------------------------------------------------------------


`timescale 1 ns / 1 ns

module tb_PORTS;
 
   reg  ports_test_mode_i;
   
   reg  [7:0] ports_sfr_P0EN_i = 8'bzzzzzzzz;   
   reg  [7:0] ports_sfr_P1EN_i = 8'bzzzzzzzz;   
   reg  [7:0] ports_sfr_P2EN_i = 8'bzzzzzzzz;   
   reg  [7:0] ports_sfr_P3EN_i = 8'bzzzzzzzz;   
   
   reg  [7:0] ports_sfr_P0_i;
   reg  [7:0] ports_sfr_P1_i;
   reg  [7:0] ports_sfr_P2_i;
   reg  [7:0] ports_sfr_P3_i;
   reg  [7:0] ports_sfr_P4_i;
   
   wire  [7:0] ports_sfr_P0_o;
   wire  [7:0] ports_sfr_P1_o;
   wire  [7:0] ports_sfr_P2_o;
   wire  [7:0] ports_sfr_P3_o;
     
   reg  [7:0] y_port0_i;
   reg  [7:0] y_port1_i;
   reg  [7:0] y_port2_i;
   reg  [7:0] y_port3_i;
  
 
   wire   [7:0] en_port0_o;
   wire   [7:0] en_port1_o;
   wire   [7:0] en_port2_o;
   wire   [7:0] en_port3_o;

   wire   [7:0] a_port0_o;
   wire   [7:0] a_port1_o;
   wire   [7:0] a_port2_o;
   wire   [7:0] a_port3_o;
   wire   [7:0] a_port4_o;
   
      
   
   
   reg    [7:0] temp;
   reg    [7:0] temp1;
   reg    [2:0] p0_pin = 3'bz;
   reg    [2:0] p1_pin = 3'bz; 
   reg    [2:0] p2_pin = 3'bz; 
   reg    [2:0] p3_pin = 3'bz;
   
   
   
// ------ INSTANCIA --------------------------------------------------------
	
   PORT_TOP DUT (
   
      .ports_test_mode_i(ports_test_mode_i),   
      .ports_sfr_P0EN_i (ports_sfr_P0EN_i), 
      .ports_sfr_P1EN_i (ports_sfr_P1EN_i),
      .ports_sfr_P2EN_i (ports_sfr_P2EN_i), 
      .ports_sfr_P3EN_i (ports_sfr_P3EN_i), 
                  
      .ports_sfr_P0_i  (ports_sfr_P0_i),
      .ports_sfr_P1_i  (ports_sfr_P1_i),
      .ports_sfr_P2_i  (ports_sfr_P2_i),
      .ports_sfr_P3_i  (ports_sfr_P3_i),
      .ports_sfr_P4_i  (ports_sfr_P4_i),
      
      .ports_sfr_P0_o  (ports_sfr_P0_o),
      .ports_sfr_P1_o  (ports_sfr_P1_o),
      .ports_sfr_P2_o  (ports_sfr_P2_o),
      .ports_sfr_P3_o  (ports_sfr_P3_o),
      
      .y_port0_i        (y_port0_i),
      .y_port1_i        (y_port1_i),
      .y_port2_i        (y_port2_i),
      .y_port3_i        (y_port3_i),
      
      
      .en_port0_o       (en_port0_o),
      .en_port1_o       (en_port1_o),
      .en_port2_o       (en_port2_o),
      .en_port3_o       (en_port3_o),
      
      .a_port0_o        (a_port0_o),
      .a_port1_o        (a_port1_o),
      .a_port2_o        (a_port2_o),
      .a_port3_o        (a_port3_o),
      .a_port4_o        (a_port4_o)
   );



task Checker_PXEN;
   input sfr_pXen;
   input en;
   
   begin
      
      if (sfr_pXen == 1'b0)//Leitura
      begin
         
         if (en == 1'b1)
         begin
            $display ("EN read = 1: OK");
         end
         else
         begin 
            $display ("EN read: ERRO");
         end 
      end 
      
      else //Escrita
      begin         
         if (en == 1'b0)
         begin
            $display ("EN write = 0: OK");
         end
         else
         begin 
            $display ("EN write: ERROR");
         end 
      end 
   end 
endtask   
   

 
// ------ Random Generation of the PXEN bits ------------------------------         
 always
  begin
    temp = $random;
    if (temp > 8'd0 && temp < 8'd255)
    begin      
      ports_sfr_P0EN_i = temp;
      ports_sfr_P1EN_i = temp;
      ports_sfr_P2EN_i = temp;
      ports_sfr_P3EN_i = temp;
   end
  
   temp1 = $random;
    if (temp1 > 8'd0 && temp1 < 8'd255)
    begin  
      y_port0_i = temp1;    
      y_port1_i = temp1;    
      y_port2_i = temp1;    
      y_port3_i = temp1;
     
      ports_sfr_P0_i = temp1;
      ports_sfr_P1_i = temp1;
      ports_sfr_P2_i = temp1;
      ports_sfr_P3_i = temp1;
      ports_sfr_P4_i = temp1;


   end //fim do if 
   
   
   
      
// ------------------ P0EN Test -------------------------------------------

     #1
    p0_pin = 3'd0;       
    Checker_PXEN (ports_sfr_P0EN_i[0], DUT.port0.en_portX_o[0]);
  
     #1
    p0_pin = 3'd1;       
    Checker_PXEN (ports_sfr_P0EN_i[1], DUT.port0.en_portX_o[1]);
    
     #1
    p0_pin = 3'd2;       
    Checker_PXEN (ports_sfr_P0EN_i[2], DUT.port0.en_portX_o[2]);
    
     #1
    p0_pin = 3'd3;       
    Checker_PXEN (ports_sfr_P0EN_i[3], DUT.port0.en_portX_o[3]);
    
     #1
    p0_pin = 3'd4;       
    Checker_PXEN (ports_sfr_P0EN_i[4], DUT.port0.en_portX_o[4]);
    
     #1
    p0_pin = 3'd5;       
    Checker_PXEN (ports_sfr_P0EN_i[5], DUT.port0.en_portX_o[5]);
    
     #1
    p0_pin = 3'd6;       
    Checker_PXEN (ports_sfr_P0EN_i[6], DUT.port0.en_portX_o[6]);
    
     #1
    p0_pin = 3'd7;       
    Checker_PXEN (ports_sfr_P0EN_i[7], DUT.port0.en_portX_o[7]);
    
     //#1
    p0_pin = 3'bz;
   
      
    
    
// ------------------ P1EN Test -------------------------------------------  
    
     #1
    p1_pin = 3'd0;       
    Checker_PXEN (ports_sfr_P1EN_i[0], DUT.port1.en_portX_o[0]);

     #1
    p1_pin = 3'd1;       
    Checker_PXEN (ports_sfr_P1EN_i[1], DUT.port1.en_portX_o[1]);
    
     #1
    p1_pin = 3'd2;       
    Checker_PXEN (ports_sfr_P1EN_i[2], DUT.port1.en_portX_o[2]);
    
     #1
    p1_pin = 3'd3;       
    Checker_PXEN (ports_sfr_P1EN_i[3], DUT.port1.en_portX_o[3]);
    
     #1
    p1_pin = 3'd4;       
    Checker_PXEN (ports_sfr_P1EN_i[4], DUT.port1.en_portX_o[4]);
    
     #1
    p1_pin = 3'd5;       
    Checker_PXEN (ports_sfr_P1EN_i[5], DUT.port1.en_portX_o[5]);
    
     #1
    p1_pin = 3'd6;       
    Checker_PXEN (ports_sfr_P1EN_i[6], DUT.port1.en_portX_o[6]);
    
     #1
    p1_pin = 3'd7;       
    Checker_PXEN (ports_sfr_P1EN_i[7], DUT.port1.en_portX_o[7]);
    
     //#1
    p1_pin = 3'bz;
    
    
    

    
// ------------------ P2EN Test -------------------------------------------
    
     #1 
    p2_pin = 3'd0;       
    Checker_PXEN (ports_sfr_P2EN_i[0], DUT.port2.en_portX_o[0]);

     #1
    p2_pin = 3'd1;       
    Checker_PXEN (ports_sfr_P2EN_i[1], DUT.port2.en_portX_o[1]);
    
     #1
    p2_pin = 3'd2;       
    Checker_PXEN (ports_sfr_P2EN_i[2], DUT.port2.en_portX_o[2]);
    
     #1
    p2_pin = 3'd3;       
    Checker_PXEN (ports_sfr_P2EN_i[3], DUT.port2.en_portX_o[3]);
    
     #1
    p2_pin = 3'd4;       
    Checker_PXEN (ports_sfr_P2EN_i[4], DUT.port2.en_portX_o[4]);
    
     #1
    p2_pin = 3'd5;       
    Checker_PXEN (ports_sfr_P2EN_i[5], DUT.port2.en_portX_o[5]);
    
     #1
    p2_pin = 3'd6;       
    Checker_PXEN (ports_sfr_P2EN_i[6], DUT.port2.en_portX_o[6]);
    
     #1
    p2_pin = 3'd7;       
    Checker_PXEN (ports_sfr_P2EN_i[7], DUT.port2.en_portX_o[7]);
    
     //#1
    p2_pin = 3'bz;
      
    
    
    
    
// ------------------ P3EN Test -------------------------------------------
    
     #1
    p3_pin = 3'd0;       
    Checker_PXEN (ports_sfr_P3EN_i[0], DUT.port3.en_portX_o[0]);

     #1
    p3_pin = 3'd1;       
    Checker_PXEN (ports_sfr_P3EN_i[1], DUT.port3.en_portX_o[1]);
    
     #1
    p3_pin = 3'd2;       
    Checker_PXEN (ports_sfr_P3EN_i[2], DUT.port3.en_portX_o[2]);
    
     #1
    p3_pin = 3'd3;       
    Checker_PXEN (ports_sfr_P3EN_i[3], DUT.port3.en_portX_o[3]);
    
     #1
    p3_pin = 3'd4;       
    Checker_PXEN (ports_sfr_P3EN_i[4], DUT.port3.en_portX_o[4]);
    
     #1
    p3_pin = 3'd5;       
    Checker_PXEN (ports_sfr_P3EN_i[5], DUT.port3.en_portX_o[5]);
    
     #1
    p3_pin = 3'd6;       
    Checker_PXEN (ports_sfr_P3EN_i[6], DUT.port3.en_portX_o[6]);
    
     #1
    p3_pin = 3'd7;       
    Checker_PXEN (ports_sfr_P3EN_i[7], DUT.port3.en_portX_o[7]);
    
     //#1
    p3_pin = 3'bz;
    
   
 end //fim do always
 
endmodule
	
