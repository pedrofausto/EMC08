`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module tb_timer0 ;

   parameter   PERIOD = 10 ;

                     
   reg        timers_clock_i            ;
   reg        timers_reset_i_b          ;
   reg        timers_int0_i             ;
   reg        timers_sfr_tmod_gate_t0_i ;
   reg        timers_sfr_tmod_m0t0_i    ;
   reg        timers_sfr_tmod_m1t0_i    ;
   reg        timers_sfr_tcon_tr0_i     ;
   reg  [7:0] timers_sfr_th0_i          ;
   reg  [7:0] timers_sfr_tm0_i          ;
   reg  [7:0] timers_sfr_tl0_i          ;
   reg        timers_sfr_tcon_tf0_i     ;
   
   wire       timers_sfr_tcon_tf0_o     ;
   wire [7:0] timers_sfr_th0_o          ;
   wire [7:0] timers_sfr_tm0_o          ;
   wire [7:0] timers_sfr_tl0_o          ;
                     

timer0 tb_timer0 (   
                     .timers_clock_i            ( timers_clock_i )            ,
                     .timers_reset_i_b          ( timers_reset_i_b )          ,
                     .timers_int0_i             ( timers_int0_i )             ,
                     .timers_sfr_tmod_gate_t0_i ( timers_sfr_tmod_gate_t0_i ) ,
                     .timers_sfr_tmod_m0t0_i    ( timers_sfr_tmod_m0t0_i )    ,
                     .timers_sfr_tmod_m1t0_i    ( timers_sfr_tmod_m1t0_i )    ,
                     .timers_sfr_tcon_tr0_i     ( timers_sfr_tcon_tr0_i )     ,
                     .timers_sfr_th0_i          ( timers_sfr_th0_i )          ,
                     .timers_sfr_tm0_i          ( timers_sfr_tm0_i )          ,
                     .timers_sfr_tl0_i          ( timers_sfr_tl0_i )          ,
                     .timers_sfr_tcon_tf0_i     ( timers_sfr_tcon_tf0_i )     ,
                     
                     .timers_sfr_tcon_tf0_o     ( timers_sfr_tcon_tf0_o )     ,
                     .timers_sfr_th0_o          ( timers_sfr_th0_o )          ,
                     .timers_sfr_tm0_o          ( timers_sfr_tm0_o )          ,
                     .timers_sfr_tl0_o          ( timers_sfr_tl0_o )
                  );
                  
always
begin
  timers_clock_i <= 1'b0;
  #(PERIOD * 2) ;
  timers_clock_i <= 1'b1;
  #(PERIOD * 2) ;
end

initial
begin
   $display (
               timers_clock_i            ,
               timers_reset_i_b          ,
               timers_int0_i             ,
               timers_sfr_tmod_gate_t0_i ,
               timers_sfr_tmod_m0t0_i    ,
               timers_sfr_tmod_m1t0_i    ,
               timers_sfr_tcon_tr0_i     ,
               timers_sfr_th0_i          ,
               timers_sfr_tm0_i          ,
               timers_sfr_tl0_i          ,
               timers_sfr_tcon_tf0_i     ,
               
               timers_sfr_tcon_tf0_o     ,
               timers_sfr_th0_o          ,
               timers_sfr_tm0_o          ,
               timers_sfr_tl0_o
            );
            
            
   @(posedge timers_clock_i)                          
      
      timers_clock_i            = 1'b0 ;
      timers_reset_i_b          = 1'b0 ;
      timers_int0_i             = 1'b0 ;
      timers_sfr_tmod_gate_t0_i = 1'b0 ;
      timers_sfr_tmod_m0t0_i    = 1'b1 ;
      timers_sfr_tmod_m1t0_i    = 1'b1 ;
      timers_sfr_tcon_tr0_i     = 1'b0 ;
      timers_sfr_th0_i          = 8'd255 ;
      timers_sfr_tm0_i          = 8'd50 ;
      timers_sfr_tl0_i          = 8'd100 ;
      timers_sfr_tcon_tf0_i     = 1'b0 ;
            
   @(posedge timers_clock_i)                          
//   #1                                  ;
   #(PERIOD * 4)                       ;
      timers_reset_i_b          = 1'b1 ;
   @(posedge timers_clock_i)                          
//   #1                                  ;
   #(PERIOD * 4)                       ;
      timers_sfr_tcon_tr0_i     = 1'b1 ;
   
//   #1                                  ;
   #(PERIOD * 100)                       ;
      timers_sfr_tmod_m0t0_i    = 1'b0 ;
      timers_sfr_tmod_m1t0_i    = 1'b0 ;
   
   @(posedge timers_clock_i)                          
   #(PERIOD * 20)                       ;
      timers_sfr_tcon_tr0_i     = 1'b0 ;
   #(PERIOD * 4)                       ;
      timers_sfr_th0_i          = 8'd255 ;
      timers_sfr_tm0_i          = 8'd254 ;
      timers_sfr_tl0_i          = 8'd70 ;
   #(PERIOD * 4)                       ;
      timers_sfr_th0_i          = 8'd10 ;
      timers_sfr_tm0_i          = 8'd10 ;
      timers_sfr_tl0_i          = 8'd10 ;
   #(PERIOD * 4)                       ;
      timers_sfr_th0_i          = 8'd50 ;
      timers_sfr_tm0_i          = 8'd60 ;
      timers_sfr_tl0_i          = 8'd70 ;
   @(posedge timers_clock_i)                          
   #(PERIOD * 4)                       ;
      timers_sfr_tcon_tr0_i     = 1'b1 ;
      timers_sfr_th0_i          = 8'd100 ;
      timers_sfr_tm0_i          = 8'd100 ;
      timers_sfr_tl0_i          = 8'd100 ;
   
   
   @(posedge timers_clock_i)
//   #1                                  ;
   #(PERIOD * 200000)                    ;
      $finish;         
            
end
endmodule