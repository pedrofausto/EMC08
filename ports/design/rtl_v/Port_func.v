// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: Port_func.v
// Module Name: PORTS
// Author: Lizbeth Paredes and Julierme Silva
// E-mail: liz.paredes@gmail.com and julierme.silva@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 01/09/2010 Initial version
// 2.0 15/09/2010 Modified Version
// -------------------------------------------------------------------
// Description
// This file describes the coding functions to be used on rtl
// implementations.
// In this version file shows the Port 0 functions like part of the ports module
// -------------------------------------------------------------------
// Compilando:  ncvlog Port_TOP.v Port_func.v Port_func4.v Port_func_tb.v -messages
// ncelab tb_PORTS -access +rwc
// ncsim tb_PORTS -gui &
// -------------------------------------------------------------------


module PORTS
  (
  // input, Registers (8bits) responsible for enabling 
      input wire [7:0] ports_sfr_PXEN_i,
      
      input wire [7:0] ports_sfr_PX_i,
      output reg [7:0] ports_sfr_PX_o,
      
      input wire [7:0] y_portX_i,
      
      output reg [7:0] en_portX_o,
      output reg [7:0] a_portX_o
);
 
  integer i;
// ==========  PORTS ===========

 
  // ============= Funtionality for the port  ===================================
  // ==========  PORT =========== 
  always @ (ports_sfr_PXEN_i, ports_sfr_PX_i, y_portX_i)
  
  begin
   ports_sfr_PX_o =  y_portX_i;   // In the reading (input for the ports)
   a_portX_o = ports_sfr_PX_i;    // In the writing (output for the ports)
        
        
   // ==========  PORTX =========== 
   // Configuring bits of PORT  (P0EN[0]) register control 
   for (i = 0; i <= 7; i = i + 1)
   begin
      if (ports_sfr_PXEN_i[i] == 1'b0) // Pin configurating like input/reading 
      begin                     
         en_portX_o[i] = 1'b1; //EN configurating like input/reading 
      end  
      else
      begin
         en_portX_o[i] = 1'b0; //EN configurating like output/writing 
      end
   end
         
   end // end always
endmodule// END MODULO
      
 
