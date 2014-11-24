// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: timers_timer2_pdcf.v
// Module Name: timers_timer2_pdcf
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description     Hour
// 0.4      10/04/2010    Beta            14:36
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module timers_timer2_pdcf (
                              timers_timer2_pdcf_reset_i_b  ,
                              timers_timer2_pdcf_clock_i    ,
                              timers_sfr_tcon2_dfp_i        ,
                              
                              timers_timer2_pdcf_clkdiv_o
                           );

   input  timers_timer2_pdcf_reset_i_b ;
   input  timers_timer2_pdcf_clock_i   ;
   input  [2:0]timers_sfr_tcon2_dfp_i  ;
   
   output reg timers_timer2_pdcf_clkdiv_o  ;


// ----------------------- INTERNAL VARIABLES ----------------------------------                  

   reg [6:0]contador ;

// -----------------------------------------------------------------------------                  




// --------------- INTERNAL PARAMETERS -----------------------------------------                  

localparam [2:0]  DIV1   = 3'b000 ,
                  DIV2   = 3'b001 ,
                  DIV4   = 3'b010 ,
                  DIV8   = 3'b011 ,
                  DIV16  = 3'b100 ,
                  DIV32  = 3'b101 ,
                  DIV64  = 3'b110 ,
                  DIV128 = 3'b111 ;

// -----------------------------------------------------------------------------                  
   


// ---------------------- PREQUENCY DIVIDER ------------------------------------                  

always @(posedge timers_timer2_pdcf_clock_i)
begin
   if(!timers_timer2_pdcf_reset_i_b) 
      begin
         contador <= 7'd0 ;
      end
   else
   begin
   
      if ( timers_sfr_tcon2_dfp_i == DIV1 )
      begin
         timers_timer2_pdcf_clkdiv_o <= 1'b1;
      end
      else
      begin
         contador <= contador + 1'b1;
        
         case ( timers_sfr_tcon2_dfp_i ) 
            DIV2   : timers_timer2_pdcf_clkdiv_o <= contador[0];

            DIV4   : timers_timer2_pdcf_clkdiv_o <= contador[1];

            DIV8   : timers_timer2_pdcf_clkdiv_o <= contador[2];

            DIV16  : timers_timer2_pdcf_clkdiv_o <= contador[3];

            DIV32  : timers_timer2_pdcf_clkdiv_o <= contador[4];

            DIV64  : timers_timer2_pdcf_clkdiv_o <= contador[5];

            DIV128 : timers_timer2_pdcf_clkdiv_o <= contador[6];
         endcase
      end
   end
end            


endmodule