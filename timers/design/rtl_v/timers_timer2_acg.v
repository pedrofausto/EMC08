// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: timers_timer2_acg.v
// Module Name: timers_timer2_acg
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description     Hour
// 0.6      10/18/2010    Beta            17:03
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module timers_timer2_acg (
                           timers_timer2_acg_clock_i   ,
                           timers_timer2_acg_reset_i_b ,
                           timers_timer2_acg_pdf_pht_i ,
                           timers_sfr_tacpl_i          ,
                           timers_sfr_tacpm_i          ,
                           timers_sfr_tacph_i          ,
                           timers_sfr_tcon2_tf2_i      ,
                           timers_sfr_tcon2_tr2_i      ,
                           
                           timers_sfr_acrh_o           ,
                           timers_sfr_acrm_o           ,
                           timers_sfr_acrl_o           ,
                           timers_sfr_tcon2_tf2_o
                        );  
                     
                     
                     
input            timers_timer2_acg_clock_i   ;
input            timers_timer2_acg_reset_i_b ;
input            timers_timer2_acg_pdf_pht_i ;
input      [7:0] timers_sfr_tacpl_i          ;
input      [7:0] timers_sfr_tacpm_i          ;
input      [7:0] timers_sfr_tacph_i          ;
input            timers_sfr_tcon2_tf2_i      ;
input            timers_sfr_tcon2_tr2_i      ;
   
output reg [7:0] timers_sfr_acrh_o           ;
output reg [7:0] timers_sfr_acrm_o           ;
output reg [7:0] timers_sfr_acrl_o           ;
output reg       timers_sfr_tcon2_tf2_o      ;
                 

// ------------------------- INTERNAL VARIABLES --------------------------------

reg [23:0]  angle_clk        ;
reg [23:0]  angle_clk_period ;
reg         acr_inc          ; // enable variable from ACR.
reg         incre            ,
            decre            ,
            update_inc       ,
            update_dec       ;

// ------------------------- STATE DEFINITION ----------------------------------

   localparam [1:0]  IDLE = 2'b00,
                     PHY  = 2'b01,
                     DEC  = 2'b10,
                     INC  = 2'b11;
                           
   reg [1:0] state          ,
             next_state     ;

// ----------- RESET VALUES (Sequential Procedures for state)-------------------
                      
always @(posedge timers_timer2_acg_clock_i)
begin
   if ( !timers_timer2_acg_reset_i_b )
      begin
         state                  <= IDLE                   ;
         acr_inc                <= 1'b0                   ;
         angle_clk              <= { timers_sfr_tacph_i, 
                                     timers_sfr_tacpm_i,
                                     timers_sfr_tacpl_i } ;
         
         angle_clk_period       <= { timers_sfr_tacph_i, 
                                     timers_sfr_tacpm_i,
                                     timers_sfr_tacpl_i } ;
         
      end // if ( !reset )
      
   else// else if ( !reset )
   begin
      state <= next_state ;

      if ( incre )
      begin
            angle_clk_period <= angle_clk_period + 1'b1 ;
            
            acr_inc <= 1'b0 ;
      end
      else 
      begin
         if ( decre )
            begin
               angle_clk <= angle_clk - 1'b1 ;
               
               if ((angle_clk - 1'b1) == 10'd0)
                  acr_inc <= 1'b0 ;
               else
                  acr_inc <= 1'b1 ;
               
            end
         else
         begin
            if ( update_dec )
               begin
                  angle_clk   <= angle_clk_period - angle_clk ;
                  

               end
            else
            begin
               if( next_state == DEC )
                  acr_inc <= 1'b1 ;
                  
               if ( update_inc )
               begin
                  if ( angle_clk == 24'd0 )
                     begin
                        angle_clk        <= angle_clk_period ;
//                        angle_clk_period <= angle_clk_period ;
                     
                     end
                  else
                  begin
                        angle_clk        <= angle_clk_period - 1'b1 ;
                        angle_clk_period <= angle_clk_period - 1'b1 ;
                     
                  end  
                  
                  
               end
            end
         end
      end
   end // else if ( !reset )
end
// -----------------------------------------------------------------------------                  


// ------- STATES DEFINITION (Combinational Procedure for next state)-----------

always @(state, timers_timer2_acg_pdf_pht_i, angle_clk )
begin
   next_state = state          ;
   
   case( state )
   
      IDLE  :  begin
                  decre       = 1'b0    ;
                  incre       = 1'b0    ;
                  update_inc  = 1'b0    ;
                  update_dec  = 1'b0    ;
                  next_state  = PHY     ;
               end // IDLE
               
      PHY   :  begin
                  decre       = 1'b0    ;
                  incre       = 1'b0    ;
                  update_inc  = 1'b0    ;
                  update_dec  = 1'b0    ;
                  
                  if( timers_timer2_acg_pdf_pht_i )
                     begin
                        next_state  = DEC     ;
                     end
                  else
                  begin
                     next_state  = PHY     ;
                  end
               end // PHY
                  
      INC   :  begin
                  decre       = 1'b0    ;
                  update_dec  = 1'b0    ;
                  
                  if( timers_timer2_acg_pdf_pht_i )
                     begin
                        incre       = 1'b0    ;
                        update_inc  = 1'b1    ;
                        next_state  = DEC     ;
                     end // if( timers_timer2_acg_pdf_pht_i )
                  else
                  begin
                     incre       = 1'b1    ;
                     update_inc  = 1'b0    ;
                     next_state  = INC     ;
                  end
               end // INC
      
      DEC   :  begin
                  if ( angle_clk == 24'd0 )
                     begin
                        decre       = 1'b0 ;
                        update_dec  = 1'b0 ;
                        
                        if( timers_timer2_acg_pdf_pht_i)
                           begin
                              incre       = 1'b0 ;
                              update_inc  = 1'b1 ;
                              next_state  = DEC  ;
                           end
                        else
                        begin
                              incre       = 1'b1 ;
                              update_inc  = 1'b0 ;
                              next_state  = INC  ;
                        end
                     end
                  else
                  begin
                     incre       = 1'b0    ;
                     update_inc  = 1'b0    ;
                     next_state  = DEC     ;
                     
                     if( timers_timer2_acg_pdf_pht_i )
                        begin
                           decre       = 1'b0    ;
                           update_dec  = 1'b1    ;
                        end
                     else
                     begin
                        decre       = 1'b1    ;
                        update_dec  = 1'b0    ;
                     end
                  end
               end // DEC
   
      default :   begin
                     decre       = 1'b0    ;
                     incre       = 1'b0    ;
                     update_inc  = 1'b0    ;
                     update_dec  = 1'b0    ;
                     next_state  = IDLE    ;
                  end
   endcase

end


// -----------------------------------------------------------------------------                  




// -------------------- ACR BLOCK ( COUNTER ) ----------------------------------                  

always @(posedge timers_timer2_acg_clock_i)
begin
   if ( !timers_timer2_acg_reset_i_b )
      begin
         {timers_sfr_acrh_o ,
          timers_sfr_acrm_o ,
          timers_sfr_acrl_o } <= 24'd0;

         timers_sfr_tcon2_tf2_o <= 1'b0 ;
      end
   else
   begin
      if ( acr_inc && timers_sfr_tcon2_tr2_i )
      begin
         {timers_sfr_acrh_o ,
          timers_sfr_acrm_o ,
          timers_sfr_acrl_o}  <= {timers_sfr_acrh_o ,
                                  timers_sfr_acrm_o ,
                                  timers_sfr_acrl_o } +1'b1;
      end
   
      if ( {timers_sfr_acrh_o, timers_sfr_acrm_o, timers_sfr_acrl_o} == 24'hffffff )
         timers_sfr_tcon2_tf2_o <= 1'b1 ;
      else
         timers_sfr_tcon2_tf2_o <= timers_sfr_tcon2_tf2_i ;
   end

end

// -----------------------------------------------------------------------------                  

endmodule
