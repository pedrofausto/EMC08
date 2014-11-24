// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: top_timer2.v
// Module Name: top_timer2
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description     Hour
// 0.3      10/14/2010    Beta            16:32
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module top_timer2 (
                     top_timer2_reset_i           ,
                     top_timer2_clock_i_d         ,
                     top_timer2_pht_i             ,
                     top_timer2_sfr_tcon2_dfp_i   ,
                     top_timer2_sfr_tcon2_dfsel_i ,
                     top_timer2_sfr_tcon2_edsel_i ,
                     top_timer2_sfr_tacph_i       ,
                     top_timer2_sfr_tacpm_i       ,
                     top_timer2_sfr_tacpl_i       ,
                     top_timer2_sfr_tcon2_tf2_i   ,
                     timers_sfr_tcon2_tr2_i       ,
                     
                     top_timer2_sfr_tcon2_tf2_o   ,
                     top_timer2_sfr_acrh_o        ,
                     top_timer2_sfr_acrm_o        ,
                     top_timer2_sfr_acrl_o
                  );

   input        top_timer2_reset_i           ;
   input        top_timer2_clock_i_d         ;
   input        top_timer2_pht_i             ;
   input  [2:0] top_timer2_sfr_tcon2_dfp_i   ;
   input        top_timer2_sfr_tcon2_dfsel_i ;
   input        top_timer2_sfr_tcon2_edsel_i ;
   input  [7:0] top_timer2_sfr_tacph_i       ;
   input  [7:0] top_timer2_sfr_tacpm_i       ;
   input  [7:0] top_timer2_sfr_tacpl_i       ;
   input        top_timer2_sfr_tcon2_tf2_i   ;
   input        timers_sfr_tcon2_tr2_i       ;
   
   output       top_timer2_sfr_tcon2_tf2_o   ;
   output [7:0] top_timer2_sfr_acrh_o        ;
   output [7:0] top_timer2_sfr_acrm_o        ;
   output [7:0] top_timer2_sfr_acrl_o        ;
   
   wire         pdcf_out_tmp                 ;
   wire         pdf_out_tmp                  ;

// -----------------------------------------------------------------------------                  
      
   
   
   timers_timer2_pdcf   top_pdcf(
                                    .timers_timer2_pdcf_clock_i   ( top_timer2_clock_i_d         ),
                                    .timers_timer2_pdcf_reset_i_b ( top_timer2_reset_i           ),
                                    .timers_sfr_tcon2_dfp_i       ( top_timer2_sfr_tcon2_dfp_i   ),
                                    .timers_timer2_pdcf_clkdiv_o  ( pdcf_out_tmp                 )
                                );

   timers_timer2_pdf    top_pdf(
                                    .timers_timer2_clock_i_b      ( top_timer2_clock_i_d         ),
                                    .timers_timer2_reset_i        ( top_timer2_reset_i           ),
                                    .timers_sfr_tcon2_dfsel_i     ( top_timer2_sfr_tcon2_dfsel_i ),
                                    .timers_sfr_tcon2_edsel_i     ( top_timer2_sfr_tcon2_edsel_i ),
                                    .timers_timer2_pht_i          ( top_timer2_pht_i             ),
                                    .timers_timer2_pdf_enable_i   ( pdcf_out_tmp                 ),
                                    .timers_timer2_pdfoutput_o    ( pdf_out_tmp                  )
                               );
                                
   timers_timer2_acg    top_acg(
                                    .timers_timer2_acg_clock_i    ( top_timer2_clock_i_d         ),
                                    .timers_timer2_acg_reset_i_b  ( top_timer2_reset_i           ),
                                    .timers_sfr_tacpl_i           ( top_timer2_sfr_tacpl_i       ),
                                    .timers_sfr_tacpm_i           ( top_timer2_sfr_tacpm_i       ),
                                    .timers_sfr_tacph_i           ( top_timer2_sfr_tacph_i       ),
                                    .timers_timer2_acg_pdf_pht_i  ( pdf_out_tmp                  ),
                                    .timers_sfr_tcon2_tf2_i       ( top_timer2_sfr_tcon2_tf2_i   ),
                                    .timers_sfr_acrh_o            ( top_timer2_sfr_acrh_o        ),
                                    .timers_sfr_acrm_o            ( top_timer2_sfr_acrm_o        ),
                                    .timers_sfr_acrl_o            ( top_timer2_sfr_acrl_o        ),
                                    .timers_sfr_tcon2_tf2_o       ( top_timer2_sfr_tcon2_tf2_o   ),
                                    .timers_sfr_tcon2_tr2_i       ( timers_sfr_tcon2_tr2_i       )
                               
                               );                              
endmodule