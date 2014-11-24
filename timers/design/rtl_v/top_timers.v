// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: top_timers.v
// Module Name: top_timers
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description     Hour:
// 0.5      10/20/2010    Beta            14:28
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/timer0.v"
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/timer1.v"
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/top_timer2.v"
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/timers_timer2_pdcf.v"
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/timers_timer2_acg.v"
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/timers_timer2_pdf.v"

module top_timers (
                     top_timers_reset_i           ,
                     top_timers_clock_i           ,
                     top_timers_machine_cycle_i   ,
                     top_timers_pht_i             ,
                     top_timers_sfr_tcon2_dfp_i   ,
                     top_timers_sfr_tcon2_dfsel_i ,
                     top_timers_sfr_tcon2_edsel_i ,
                     top_timers_sfr_tacph_i       ,
                     top_timers_sfr_tacpm_i       ,
                     top_timers_sfr_tacpl_i       ,
                     top_timers_sfr_tcon_tr0_i    ,
                     top_timers_sfr_tcon_tr1_i    ,
                     top_timers_sfr_tmod_gate_t0_i,
                     top_timers_sfr_tmod_gate_t1_i,
                     top_timers_sfr_tmod_m0_t0_i  ,
                     top_timers_sfr_tmod_m1_t0_i  ,
                     top_timers_sfr_tmod_m0_t1_i  ,
                     top_timers_sfr_tmod_m1_t1_i  ,
                     top_timers_sfr_th0_i         ,
                     top_timers_sfr_tm0_i         ,
                     top_timers_sfr_tl0_i         ,
                     top_timers_sfr_th1_i         ,
                     top_timers_sfr_tm1_i         ,
                     top_timers_sfr_tl1_i         ,
                     top_timers_int0_i            ,
                     top_timers_int1_i            ,
                     top_timers_sfr_tcon_tf0_i    ,
                     top_timers_sfr_tcon_tf1_i    ,
                     top_timers_sfr_tcon2_tf2_i   ,
                     top_timers_sfr_tcon2_tr2_i   ,
                     
                     top_timers_sfr_tcon_tf0_o    ,
                     top_timers_sfr_tcon_tf1_o    ,
                     top_timers_sfr_tcon2_tf2_o   ,
                     top_timers_sfr_acrh_o        ,
                     top_timers_sfr_acrm_o        ,
                     top_timers_sfr_acrl_o        ,
                     top_timers_sfr_th0_o         ,
                     top_timers_sfr_tm0_o         ,
                     top_timers_sfr_tl0_o         ,
                     top_timers_sfr_th1_o         ,
                     top_timers_sfr_tm1_o         ,
                     top_timers_sfr_tl1_o
                  );

   input       top_timers_reset_i            ;
   input       top_timers_clock_i          ;
   input       top_timers_machine_cycle_i    ;
   input       top_timers_pht_i              ;
   input  [2:0]top_timers_sfr_tcon2_dfp_i    ;
   input       top_timers_sfr_tcon2_dfsel_i  ;
   input       top_timers_sfr_tcon2_edsel_i  ;
   input       top_timers_sfr_tcon2_tr2_i    ;
   input  [7:0]top_timers_sfr_tacph_i        ;
   input  [7:0]top_timers_sfr_tacpm_i        ;
   input  [7:0]top_timers_sfr_tacpl_i        ;
   input       top_timers_sfr_tcon_tr0_i     ;
   input       top_timers_sfr_tcon_tr1_i     ;
   input       top_timers_sfr_tmod_gate_t0_i ;
   input       top_timers_sfr_tmod_gate_t1_i ;
   input       top_timers_sfr_tmod_m0_t0_i   ;
   input       top_timers_sfr_tmod_m1_t0_i   ;
   input       top_timers_sfr_tmod_m0_t1_i   ;
   input       top_timers_sfr_tmod_m1_t1_i   ;
   input  [7:0]top_timers_sfr_th0_i          ;
   input  [7:0]top_timers_sfr_tm0_i          ;
   input  [7:0]top_timers_sfr_tl0_i          ;
   input  [7:0]top_timers_sfr_th1_i          ;
   input  [7:0]top_timers_sfr_tm1_i          ;
   input  [7:0]top_timers_sfr_tl1_i          ;
   input       top_timers_int0_i             ;
   input       top_timers_int1_i             ;
   input       top_timers_sfr_tcon_tf0_i     ;
   input       top_timers_sfr_tcon_tf1_i     ;
   input       top_timers_sfr_tcon2_tf2_i    ;
      
   output      top_timers_sfr_tcon_tf0_o     ;
   output      top_timers_sfr_tcon_tf1_o     ;
   output      top_timers_sfr_tcon2_tf2_o    ;
   output [7:0]top_timers_sfr_acrh_o         ;
   output [7:0]top_timers_sfr_acrm_o         ;
   output [7:0]top_timers_sfr_acrl_o         ;
   output [7:0]top_timers_sfr_th0_o          ;
   output [7:0]top_timers_sfr_tm0_o          ;
   output [7:0]top_timers_sfr_tl0_o          ;
   output [7:0]top_timers_sfr_th1_o          ;
   output [7:0]top_timers_sfr_tm1_o          ;
   output [7:0]top_timers_sfr_tl1_o          ;

   reg reset_aux;
   
always @(negedge top_timers_clock_i)
begin
   if (top_timers_reset_i == 1'b0)
   begin
      reset_aux <= 1'b0;
   end
   else if (top_timers_machine_cycle_i == 1'b1)
   begin
      reset_aux <= 1'b1;
   end 
   else
   begin
      reset_aux <= reset_aux;
   end 
end
   

// ------------------- INSTANCES -----------------------------------------------


timer0 dut_timer0(
                        .timers_clock_i           ( top_timers_machine_cycle_i    ) ,
                        .timers_reset_i_b         ( reset_aux                     ) ,
                        .timers_int0_i            ( top_timers_int0_i             ) ,
                        .timers_sfr_tmod_gate_t0_i( top_timers_sfr_tmod_gate_t0_i ) ,
                        .timers_sfr_tmod_m0t0_i   ( top_timers_sfr_tmod_m0_t0_i   ) ,
                        .timers_sfr_tmod_m1t0_i   ( top_timers_sfr_tmod_m1_t0_i   ) ,
                        .timers_sfr_tcon_tr0_i    ( top_timers_sfr_tcon_tr0_i     ) ,
                        .timers_sfr_th0_i         ( top_timers_sfr_th0_i          ) ,
                        .timers_sfr_tm0_i         ( top_timers_sfr_tm0_i          ) ,
                        .timers_sfr_tl0_i         ( top_timers_sfr_tl0_i          ) ,
                        .timers_sfr_tcon_tf0_i    ( top_timers_sfr_tcon_tf0_i     ) ,
                        
                        .timers_sfr_tcon_tf0_o    ( top_timers_sfr_tcon_tf0_o     ) ,
                        .timers_sfr_th0_o         ( top_timers_sfr_th0_o          ) ,
                        .timers_sfr_tm0_o         ( top_timers_sfr_tm0_o          ) ,
                        .timers_sfr_tl0_o         ( top_timers_sfr_tl0_o          ) 
                     );

timer1 dut_timer1 (
                        .timers_clock_i           ( top_timers_machine_cycle_i    ) ,
                        .timers_reset_i_b         ( reset_aux                     ) ,
                        .timers_int1_i            ( top_timers_int1_i             ) ,
                        .timers_sfr_tmod_gate_t1_i( top_timers_sfr_tmod_gate_t1_i ) ,
                        .timers_sfr_tmod_m0t1_i   ( top_timers_sfr_tmod_m0_t1_i   ) ,
                        .timers_sfr_tmod_m1t1_i   ( top_timers_sfr_tmod_m1_t1_i   ) ,
                        .timers_sfr_tcon_tr1_i    ( top_timers_sfr_tcon_tr1_i     ) ,
                        .timers_sfr_th1_i         ( top_timers_sfr_th1_i          ) ,
                        .timers_sfr_tm1_i         ( top_timers_sfr_tm1_i          ) ,
                        .timers_sfr_tl1_i         ( top_timers_sfr_tl1_i          ) ,
                        .timers_sfr_tcon_tf1_i    ( top_timers_sfr_tcon_tf1_i     ) ,
                        
                        .timers_sfr_tcon_tf1_o    ( top_timers_sfr_tcon_tf1_o     ) ,
                        .timers_sfr_th1_o         ( top_timers_sfr_th1_o          ) ,
                        .timers_sfr_tm1_o         ( top_timers_sfr_tm1_o          ) ,
                        .timers_sfr_tl1_o         ( top_timers_sfr_tl1_o          ) 
                     );

top_timer2 dut_timer2 (
                        .top_timer2_reset_i           ( reset_aux                    ) ,
                        .top_timer2_clock_i_d         ( top_timers_clock_i           ) ,
                        .top_timer2_pht_i             ( top_timers_pht_i             ) ,
                        .top_timer2_sfr_tcon2_dfp_i   ( top_timers_sfr_tcon2_dfp_i   ) ,
                        .top_timer2_sfr_tcon2_dfsel_i ( top_timers_sfr_tcon2_dfsel_i ) ,
                        .top_timer2_sfr_tcon2_edsel_i ( top_timers_sfr_tcon2_edsel_i ) ,
                        .top_timer2_sfr_tacph_i       ( top_timers_sfr_tacph_i       ) ,
                        .top_timer2_sfr_tacpm_i       ( top_timers_sfr_tacpm_i       ) ,
                        .top_timer2_sfr_tacpl_i       ( top_timers_sfr_tacpl_i       ) ,
                        .top_timer2_sfr_tcon2_tf2_i   ( top_timers_sfr_tcon2_tf2_i   ) ,
                        .timers_sfr_tcon2_tr2_i       ( top_timers_sfr_tcon2_tr2_i   ) ,
                        
                        .top_timer2_sfr_tcon2_tf2_o   ( top_timers_sfr_tcon2_tf2_o   ) ,
                        .top_timer2_sfr_acrh_o        ( top_timers_sfr_acrh_o        ) ,
                        .top_timer2_sfr_acrm_o        ( top_timers_sfr_acrm_o        ) ,
                        .top_timer2_sfr_acrl_o        ( top_timers_sfr_acrl_o        )
                      );                     

                      
// -----------------------------------------------------------------------------                  

endmodule
