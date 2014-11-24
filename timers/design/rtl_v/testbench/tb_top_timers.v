// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: tb_top_timers.v
// Module Name: tb_top_timers
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description           Hour:
// 0.2      09/15/2010    Beta                  12:28
// -----------------------------------------------------------------------------                  
// Description
// Testbench for generate stimulus to the DUT.
// -----------------------------------------------------------------------------                  

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module tb_timer;

   parameter   PERIOD = 10 ;



   reg       top_timers_reset_i            ;
   reg       top_timers_clock_i            ;
   reg       top_timers_machine_cycle_i    ;
   reg       top_timers_pht_i              ;
   reg  [2:0]top_timers_sfr_tcon2_dfp_i    ;
   reg       top_timers_sfr_tcon2_dfsel_i  ;
   reg       top_timers_sfr_tcon2_edsel_i  ;
   reg       top_timers_sfr_tcon2_tr2_i    ;
   reg  [1:0]top_timers_sfr_tacph_i        ;
   reg  [7:0]top_timers_sfr_tacpl_i        ;
   reg       top_timers_sfr_tcon_tr0_i     ;
   reg       top_timers_sfr_tcon_tr1_i     ;
   reg       top_timers_sfr_tmod_gate_t0_i ;
   reg       top_timers_sfr_tmod_gate_t1_i ;
   reg       top_timers_sfr_tmod_m0_t0_i   ;
   reg       top_timers_sfr_tmod_m1_t0_i   ;
   reg       top_timers_sfr_tmod_m0_t1_i   ;
   reg       top_timers_sfr_tmod_m1_t1_i   ;
   reg  [7:0]top_timers_sfr_th0_i          ;
   reg  [7:0]top_timers_sfr_tm0_i          ;
   reg  [7:0]top_timers_sfr_tl0_i          ;
   reg  [7:0]top_timers_sfr_th1_i          ;
   reg  [7:0]top_timers_sfr_tm1_i          ;
   reg  [7:0]top_timers_sfr_tl1_i          ;
   reg       top_timers_int0_i             ;
   reg       top_timers_int1_i             ;
   reg       top_timers_sfr_tcon_tf0_i     ;
   reg       top_timers_sfr_tcon_tf1_i     ;
   reg       top_timers_sfr_tcon2_tf2_i    ;
      
   wire      top_timers_sfr_tcon_tf0_o     ;
   wire      top_timers_sfr_tcon_tf1_o     ;
   wire      top_timers_sfr_tcon2_tf2_o    ;
   wire [7:0]top_timers_sfr_acrh_o         ;
   wire [7:0]top_timers_sfr_acrm_o         ;
   wire [7:0]top_timers_sfr_acrl_o         ;
                     
top_timers DUT(
                  .top_timers_reset_i            ( top_timers_reset_i            ) ,
                  .top_timers_clock_i            ( top_timers_clock_i            ) ,
                  .top_timers_machine_cycle_i    ( top_timers_machine_cycle_i    ) ,
                  .top_timers_pht_i              ( top_timers_pht_i              ) ,
                  .top_timers_sfr_tcon2_dfp_i    ( top_timers_sfr_tcon2_dfp_i    ) ,
                  .top_timers_sfr_tcon2_dfsel_i  ( top_timers_sfr_tcon2_dfsel_i  ) ,
                  .top_timers_sfr_tcon2_edsel_i  ( top_timers_sfr_tcon2_edsel_i  ) ,
                  .top_timers_sfr_tcon2_tr2_i    ( top_timers_sfr_tcon2_tr2_i    ) ,
                  .top_timers_sfr_tacph_i        ( top_timers_sfr_tacph_i        ) ,
                  .top_timers_sfr_tacpl_i        ( top_timers_sfr_tacpl_i        ) ,
                  .top_timers_sfr_tcon_tr0_i     ( top_timers_sfr_tcon_tr0_i     ) ,
                  .top_timers_sfr_tcon_tr1_i     ( top_timers_sfr_tcon_tr1_i     ) ,
                  .top_timers_sfr_tmod_gate_t0_i ( top_timers_sfr_tmod_gate_t0_i ) ,
                  .top_timers_sfr_tmod_gate_t1_i ( top_timers_sfr_tmod_gate_t1_i ) ,
                  .top_timers_sfr_tmod_m0_t0_i   ( top_timers_sfr_tmod_m0_t0_i   ) ,
                  .top_timers_sfr_tmod_m1_t0_i   ( top_timers_sfr_tmod_m1_t0_i   ) ,
                  .top_timers_sfr_tmod_m0_t1_i   ( top_timers_sfr_tmod_m0_t1_i   ) ,
                  .top_timers_sfr_tmod_m1_t1_i   ( top_timers_sfr_tmod_m1_t1_i   ) ,
                  .top_timers_sfr_th0_i          ( top_timers_sfr_th0_i          ) ,
                  .top_timers_sfr_tm0_i          ( top_timers_sfr_tm0_i          ) ,
                  .top_timers_sfr_tl0_i          ( top_timers_sfr_tl0_i          ) ,
                  .top_timers_sfr_th1_i          ( top_timers_sfr_th1_i          ) ,
                  .top_timers_sfr_tm1_i          ( top_timers_sfr_tm1_i          ) ,
                  .top_timers_sfr_tl1_i          ( top_timers_sfr_tl1_i          ) ,
                  .top_timers_int0_i             ( top_timers_int0_i             ) ,
                  .top_timers_int1_i             ( top_timers_int1_i             ) ,
                  .top_timers_sfr_tcon_tf0_i     ( top_timers_sfr_tcon_tf0_i     ) ,
                  .top_timers_sfr_tcon_tf1_i     ( top_timers_sfr_tcon_tf1_i     ) ,
                  .top_timers_sfr_tcon2_tf2_i    ( top_timers_sfr_tcon2_tf2_i    ) ,
                     
                  .top_timers_sfr_th0_o          ( top_timers_sfr_th0_o          ) ,
                  .top_timers_sfr_tm0_o          ( top_timers_sfr_tm0_o          ) ,
                  .top_timers_sfr_tl0_o          ( top_timers_sfr_tl0_o          ) ,
                  .top_timers_sfr_th1_o          ( top_timers_sfr_th1_o          ) ,
                  .top_timers_sfr_tm1_o          ( top_timers_sfr_tm1_o          ) ,
                  .top_timers_sfr_tl1_o          ( top_timers_sfr_tl1_o          ) ,
                  .top_timers_sfr_tcon_tf0_o     ( top_timers_sfr_tcon_tf0_o     ) ,
                  .top_timers_sfr_tcon_tf1_o     ( top_timers_sfr_tcon_tf1_o     ) ,
                  .top_timers_sfr_tcon2_tf2_o    ( top_timers_sfr_tcon2_tf2_o    ) ,
                  .top_timers_sfr_acrh_o         ( top_timers_sfr_acrh_o         ) ,
                  .top_timers_sfr_acrm_o         ( top_timers_sfr_acrm_o         ) ,
                  .top_timers_sfr_acrl_o         ( top_timers_sfr_acrl_o         )
               );    

         integer i;
/*initial
begin
  top_timers_clock_i         <= 1 ;
  top_timers_machine_cycle_i <= 1 ;
end
*/

always
begin
  top_timers_clock_i <= 1'b1;
  #(PERIOD) ;
  top_timers_clock_i <= 1'b0;
  #(PERIOD) ;
end

always
begin
  top_timers_machine_cycle_i <= 1'b0;
  #(PERIOD * 2) ;
  top_timers_machine_cycle_i <= 1'b1;
  #(PERIOD * 2) ;
end

// always @(negedge top_timers_machine_cycle_i)
// begin
//    if(top_timers_sfr_tcon_tf0_o)
//    begin
//       top_timers_sfr_tcon_tf0_i = 1'b1 ;
//       #(PERIOD * 40);
//       top_timers_sfr_tcon_tf0_i = 1'b0 ;
//       #(PERIOD * 40);
//    end
// end


// -----------------------------------------------------------------------------                  

/*always
begin
#(PERIOD * 400)
      top_timers_pht_i = 1'b1 ;
#(PERIOD * 88)
      top_timers_pht_i = 1'b0 ;
end*/
   
initial
begin
  $display(
            top_timers_reset_i           ,
            top_timers_clock_i           ,
            top_timers_machine_cycle_i   ,
            top_timers_sfr_tcon2_dfp_i   ,
            top_timers_sfr_tcon2_dfsel_i ,
            top_timers_sfr_tcon2_edsel_i ,
            top_timers_sfr_tcon2_tr2_i   ,
            top_timers_sfr_tacph_i       ,
            top_timers_sfr_tacpl_i       ,
            top_timers_sfr_acrh_o        ,
            top_timers_sfr_acrm_o        ,
            top_timers_sfr_acrl_o        ,
            top_timers_pht_i
          );
   
          
//---------------- TESTES PARA O TIMER 2 -----------------------

//       top_timers_sfr_tcon2_dfp_i   = 3'b010 ;
//       top_timers_sfr_tcon2_dfsel_i = 1'b0   ;
//       top_timers_sfr_tcon2_edsel_i = 1'b1   ;
//       top_timers_sfr_tcon2_tr2_i   = 1'b0   ;
//       top_timers_sfr_tacph_i       = 2'b11  ;
//       top_timers_sfr_tacpl_i       = 8'd255 ;
//       top_timers_sfr_tcon_tr0_i    = 1'b0   ;
//       top_timers_sfr_tmod_gate_t0_i= 1'b0   ;
//       top_timers_int0_i            = 1'b0   ;
//       top_timers_sfr_th0_i         = 8'd0   ;
//       top_timers_sfr_tm0_i         = 8'd0   ;
//       top_timers_sfr_tl0_i         = 8'd0   ;
//       top_timers_sfr_tmod_m0_t0_i  = 1'b0   ;
//       top_timers_sfr_tmod_m1_t0_i  = 1'b0   ;
//       
// #2
//       top_timers_reset_i           = 1'b0   ;
// #2
//       top_timers_reset_i           = 1'b1   ;
//       
// #10
//       top_timers_sfr_tcon_tr0_i    = 1'b1   ;
//       
// #500
//       top_timers_sfr_tcon_tr0_i    = 1'b0   ;
//       top_timers_sfr_th0_i         = 8'd255 ;
//       top_timers_sfr_tm0_i         = 8'd255 ;
//       top_timers_sfr_tl0_i         = 8'd0   ;
// #10
//       top_timers_sfr_tcon_tr0_i    = 1'b1   ;
//       

//---------------- TESTES PARA O TIMER 0 -----------------------


//---------------- TRATAMENTO DO RESET -------------------------
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   top_timers_reset_i            = 1'b0 ;
   top_timers_int0_i             = 1'b0 ;
   top_timers_sfr_tmod_gate_t0_i = 1'b0 ;
   top_timers_sfr_tmod_m0_t0_i   = 1'b0 ;
   top_timers_sfr_tmod_m1_t0_i   = 1'b0 ;
   top_timers_sfr_tcon_tr0_i     = 1'b0 ;
   top_timers_sfr_th0_i          = 8'd0 ;
   top_timers_sfr_tm0_i          = 8'd0 ;
   top_timers_sfr_tl0_i          = 8'd0 ;

//------------- ESTIMULOS ENVIADOS A DUT -----------------------
   

    #(PERIOD * 2)
      top_timers_reset_i            = 1'b1 ;
    #(PERIOD * 2)
      top_timers_sfr_tcon_tr0_i     = 1'b1 ;














//    #(PERIOD * 2)
//       top_timers_sfr_tmod_gate_t0_i = 1'b1   ;
//       top_timers_reset_i            = 1'b1   ;
//      
//    #(PERIOD * 20)
//    top_timers_sfr_tmod_m0_t0_i   = 1'b1 ;
//    top_timers_sfr_tmod_m1_t0_i   = 1'b1 ;
// 
//    #(PERIOD * 20)
//    top_timers_reset_i            = 1'b1 ;
//    top_timers_sfr_tmod_m0_t0_i   = 1'b0 ;
//    top_timers_sfr_tmod_m1_t0_i   = 1'b0 ;
//    top_timers_sfr_tcon_tr0_i     = 1'b1   ;
//    
//    for (i=0;i<20;i=i+1)
//    begin   
//       #(PERIOD * 70)
//    top_timers_reset_i            = 1'b0 ;
//       #(PERIOD * 4)
//    
//       top_timers_sfr_tmod_m0_t0_i   = 1'b1 ;
//       top_timers_sfr_tmod_m1_t0_i   = 1'b1 ;
//       #(PERIOD * 4)
//    top_timers_reset_i            = 1'b1 ;
//       #(PERIOD * 50)
//    top_timers_reset_i            = 1'b0 ;
//       #(PERIOD * 4)
//       top_timers_sfr_tmod_m0_t0_i   = 1'b0 ;
//       top_timers_sfr_tmod_m1_t0_i   = 1'b0 ;
//       #(PERIOD * 4)
//    top_timers_reset_i            = 1'b1 ;
//    end





/*   #(PERIOD * 2)
      top_timers_sfr_tcon_tr0_i     = 1'b1   ;
      
   #(PERIOD * 100)
      top_timers_sfr_tcon_tr0_i     = 1'b0   ;
   #(PERIOD * 100)
      top_timers_sfr_tcon_tr0_i     = 1'b1   ;
   #(PERIOD * 100)*/
/*      top_timers_sfr_tcon_tr0_i     = 1'b0   ;
      top_timers_sfr_th0_i          = 8'd0 ;
      top_timers_sfr_tm0_i          = 8'd0 ;
      top_timers_sfr_tl0_i          = 8'd40  ;
   #(PERIOD * 4)
      top_timers_sfr_tcon_tr0_i     = 1'b1   ;
      top_timers_int0_i             = 1'b0   ;
//      top_timers_sfr_tmod_gate_t0_i = 1'b0   ;

   #(PERIOD * 200)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   
   #(PERIOD * 8)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   #(PERIOD * 8)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   #(PERIOD * 8)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   #(PERIOD * 8)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   #(PERIOD * 8)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;
   #(PERIOD * 8)
   top_timers_sfr_tcon_tf0_i     = 1'b1 ;
   #(PERIOD * 4)
   top_timers_sfr_tcon_tf0_i     = 1'b0 ;*/
   
/*   #(PERIOD * 200)
   top_timers_int0_i             = 1'b1 ;*/
      
      
   #(PERIOD * 500)
      
      
      $finish;
      
 end   
endmodule                  