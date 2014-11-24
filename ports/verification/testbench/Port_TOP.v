// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: Port_TOP.v
// Module Name: PORT_TOP
// Author: Lizbeth Paredes and Julierme Silva
// E-mail: liz.paredes@gmail.com and julierme.silva@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 01/09/2010 Initial version
// 2.0 15/09/2010 Modified Version
// -------------------------------------------------------------------
// Description
// In this version file shows the Top Port interconections of the 
// all modules
// -------------------------------------------------------------------
// Compilando:  ncvlog Port_TOP.v Port_func.v Port_func4.v Port_func_tb.v -messages
// ncelab tb_PORTS -access +rwc
// ncsim tb_PORTS -gui &
// -------------------------------------------------------------------

`timescale 1ns/10ps
`include "Port_func.v"

module PORT_TOP
(
   input  wire [7:0] ports_sfr_P0EN_i,   
   input  wire [7:0] ports_sfr_P1EN_i,   
   input  wire [7:0] ports_sfr_P2EN_i,   
   input  wire [7:0] ports_sfr_P3EN_i,     
   
   input   wire [7:0] ports_sfr_P0_i,
   input   wire [7:0] ports_sfr_P1_i,
   input   wire [7:0] ports_sfr_P2_i,
   input   wire [7:0] ports_sfr_P3_i,   
   input   wire [7:0] ports_sfr_P4_i,
   
   output   [7:0] ports_sfr_P0_o,
   output   [7:0] ports_sfr_P1_o,
   output   [7:0] ports_sfr_P2_o,
   output   [7:0] ports_sfr_P3_o,
   
   input  wire [7:0] y_port0_i,
   input  wire [7:0] y_port1_i,
   input  wire [7:0] y_port2_i,
   input  wire [7:0] y_port3_i,
 
   output   [7:0] en_port0_o,
   output   [7:0] en_port1_o,
   output   [7:0] en_port2_o,
   output   [7:0] en_port3_o,

   output   [7:0] a_port0_o,
   output   [7:0] a_port1_o,
   output   [7:0] a_port2_o,
   output   [7:0] a_port3_o,
   output   [7:0] a_port4_o
);


      PORTS port0(
         .ports_sfr_PXEN_i(ports_sfr_P0EN_i),
         .ports_sfr_PX_i (ports_sfr_P0_i),
         .ports_sfr_PX_o (ports_sfr_P0_o),
         .en_portX_o (en_port0_o),
         .a_portX_o (a_port0_o),
         .y_portX_i(y_port0_i)
      );
      
      PORTS port1(
         .ports_sfr_PXEN_i(ports_sfr_P1EN_i),
         .ports_sfr_PX_i (ports_sfr_P1_i),
         .ports_sfr_PX_o (ports_sfr_P1_o),
         .en_portX_o (en_port1_o),
         .a_portX_o (a_port1_o),
         .y_portX_i(y_port1_i)

      );
      
      PORTS port2(
         .ports_sfr_PXEN_i(ports_sfr_P2EN_i),
         .ports_sfr_PX_i (ports_sfr_P2_i),
         .ports_sfr_PX_o (ports_sfr_P2_o),
         .en_portX_o (en_port2_o),
         .a_portX_o (a_port2_o),
         .y_portX_i(y_port2_i)
      );
      
      PORTS port3(
         .ports_sfr_PXEN_i(ports_sfr_P3EN_i),
         .ports_sfr_PX_i (ports_sfr_P3_i),
         .ports_sfr_PX_o (ports_sfr_P3_o),
         .en_portX_o (en_port3_o),
         .a_portX_o (a_port3_o),
         .y_portX_i(y_port3_i)   
      );

  
      assign a_port4_o = ports_sfr_P4_i;  
      
         
endmodule// END MODULE