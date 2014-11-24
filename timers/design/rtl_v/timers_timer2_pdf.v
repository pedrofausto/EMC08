// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: timers_timer2_pdf.v
// Module Name: timers_timer2_pdf
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description     Hour
// 0.4      10/05/2010    Beta            13:26
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module timers_timer2_pdf (
                           timers_timer2_pdf_enable_i ,
                           timers_timer2_clock_i_b    ,
                           timers_timer2_pht_i        ,
                           timers_timer2_reset_i      ,
                           timers_sfr_tcon2_dfsel_i   ,
                           timers_sfr_tcon2_edsel_i   ,
                           
                           timers_timer2_pdfoutput_o
                        );  
                     
   input   timers_timer2_pdf_enable_i   ;
   input   timers_timer2_clock_i_b      ;
   input   timers_timer2_pht_i          ;
   input   timers_timer2_reset_i        ;
   input   timers_sfr_tcon2_dfsel_i     ;
   input   timers_sfr_tcon2_edsel_i     ;
      
   output reg timers_timer2_pdfoutput_o ;

//------------------------------------------------------------------------------



// ----------------- INTERNAL REGISTERS ----------------------------------------                  

   reg   [1:0] ff_sync     ;
   reg   [2:0] pdf_2sample ;
   reg         pdf_out     ,
               q_flop      ;

//------------------------------------------------------------------------------



// ----------------- SYNC BLOCK ------------------------------------------------                  

always @(posedge timers_timer2_clock_i_b)
begin
   if (!timers_timer2_reset_i)
      ff_sync <= 2'b00 ;
   else
   begin   
      ff_sync[0] <= timers_timer2_pht_i ; // signal shift by two flip-flops
      ff_sync[1] <= ff_sync[0]          ;
   end
end

//------------------------------------------------------------------------------


// ---------------------------- SAMPLES OF PDF ---------------------------------

always @(posedge timers_timer2_clock_i_b)
begin
   if (!timers_timer2_reset_i)
      pdf_2sample <= 3'b000  ;
   else
   begin   
      if(timers_timer2_pdf_enable_i)
         begin
            pdf_2sample[0] <= ff_sync[1]     ;
            pdf_2sample[1] <= pdf_2sample[0] ;
            pdf_2sample[2] <= pdf_2sample[1] ;
         end // if(timers_timer2_pdf_enable_i)
   end 
end
// -----------------------------------------------------------------------------                  



// ------------------------- VALIDATE SAMPLES ----------------------------------

always @(posedge timers_timer2_clock_i_b)
begin
   if (!timers_timer2_reset_i)
      pdf_out <= 1'b0 ;
   else
   begin
      if ( timers_timer2_pdf_enable_i )
         begin
            if ( timers_sfr_tcon2_dfsel_i )
               begin
                  if ( pdf_2sample[0] && pdf_2sample[1] && pdf_2sample[2] )
                     pdf_out <= 1'b1 ;
                  
                  else
                  begin
                     if ( !pdf_2sample[0] && !pdf_2sample[1] && !pdf_2sample[2] )
                        pdf_out <= 1'b0;
                        
                  end
               end
            else
            begin
               if ( pdf_2sample[0] && pdf_2sample[1] )
                  pdf_out <= 1'b1;
               else
               begin
                  if ( !pdf_2sample[0] && !pdf_2sample[1] )
                     pdf_out <= 1'b0;
               end
            end // else if ( timers_sfr_tcon2_dfsel_i )
         end // if ( timers_timer2_pdf_enable_i )
   end // else if (!timers_timer2_reset_i)
end

// -----------------------------------------------------------------------------                  



// --------------------------- EDGE DETECTOR------------------------------------

always @( posedge timers_timer2_clock_i_b )
begin
   if (!timers_timer2_reset_i)
      begin
         q_flop                      <= 1'b0 ; // output flop
         timers_timer2_pdfoutput_o   <= 1'b0 ; // rise detector
      end
   else
   begin
      q_flop <= pdf_out ; // output flop
      
      if ( timers_sfr_tcon2_edsel_i )
         timers_timer2_pdfoutput_o   <= pdf_out & ~q_flop ; // rise detector
      else
         timers_timer2_pdfoutput_o   <= ~pdf_out & q_flop ; // fall detector
  
  end
end

// -----------------------------------------------------------------------------                  

endmodule