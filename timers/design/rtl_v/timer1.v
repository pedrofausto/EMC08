// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: Timer1.v
// Module Name: timer1
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description     Hour
// 1.4      10/26/2010    Beta            10:15
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  



`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module timer1 (
                     timers_clock_i            ,
                     timers_reset_i_b          ,
                     timers_int1_i             ,
                     timers_sfr_tmod_gate_t1_i ,
                     timers_sfr_tmod_m0t1_i    ,
                     timers_sfr_tmod_m1t1_i    ,
                     timers_sfr_tcon_tr1_i     ,
                     timers_sfr_th1_i          ,
                     timers_sfr_tm1_i          ,
                     timers_sfr_tl1_i          ,
                     timers_sfr_tcon_tf1_i     ,
                     
                     timers_sfr_tcon_tf1_o     ,
                     timers_sfr_th1_o          ,
                     timers_sfr_tm1_o          ,
                     timers_sfr_tl1_o
                     
                  );  
                     
                     
                     
input       timers_sfr_tcon_tf1_i      ;
input       timers_clock_i             ;
input       timers_reset_i_b           ;
input       timers_int1_i              ;
input       timers_sfr_tmod_gate_t1_i  ;
input       timers_sfr_tmod_m0t1_i     ;
input       timers_sfr_tmod_m1t1_i     ;
input       timers_sfr_tcon_tr1_i      ;
input [7:0] timers_sfr_th1_i           ;
input [7:0] timers_sfr_tm1_i           ;
input [7:0] timers_sfr_tl1_i           ;

output reg       timers_sfr_tcon_tf1_o ;
output reg [7:0] timers_sfr_th1_o      ;
output reg [7:0] timers_sfr_tm1_o      ;
output reg [7:0] timers_sfr_tl1_o      ;

//----------------------- REGISTRADORES INTERNOS ---------------------------

   reg       incr      ,
             decr      ;

//--------------------------------------------------------------------------

always @( timers_sfr_tcon_tf1_i or 
          timers_sfr_th1_i      or 
          timers_sfr_tm1_i      or 
          timers_sfr_tl1_i      or
          incr                  or
          decr)
begin
   if(incr)
      begin
         if ({timers_sfr_th1_i,timers_sfr_tm1_i,timers_sfr_tl1_i} == 24'd0)
            timers_sfr_tcon_tf1_o = 1'b1 ;
         else
            timers_sfr_tcon_tf1_o = timers_sfr_tcon_tf1_i ;

      end
   else 
      begin
         if(decr)
            begin
               if ({timers_sfr_th1_i,timers_sfr_tm1_i,timers_sfr_tl1_i} == 24'hffffff)
                  timers_sfr_tcon_tf1_o = 1'b1 ;
               else
                  timers_sfr_tcon_tf1_o = timers_sfr_tcon_tf1_i ;
               
            end
         else
         begin
               timers_sfr_tcon_tf1_o = timers_sfr_tcon_tf1_i ;
         end
      end
end


//--------------------------------------------------------------------------




//------------------------- RESET ------------------------------------------

always @(posedge timers_clock_i)
begin
   if(!timers_reset_i_b)
      begin
         
         {timers_sfr_th1_o,
          timers_sfr_tm1_o,
          timers_sfr_tl1_o}    <= 24'd0 ;
         
                                   
      end // if(!timers_reset_i_b)
   else
   begin
      if(incr)
         begin
         
            if ( timers_sfr_tcon_tr1_i && timers_sfr_tmod_gate_t1_i && !timers_int1_i )
               begin
                  {timers_sfr_th1_o,
                   timers_sfr_tm1_o,
                   timers_sfr_tl1_o} <= {timers_sfr_th1_i,
                                         timers_sfr_tm1_i,
                                         timers_sfr_tl1_i}  ;
               end
            else
            begin
               {timers_sfr_th1_o,
                timers_sfr_tm1_o,
                timers_sfr_tl1_o} <= {timers_sfr_th1_i,
                                      timers_sfr_tm1_i,
                                      timers_sfr_tl1_i} + 1'b1 ;
            end
            
/*            if ({timers_sfr_th1_i,timers_sfr_tm1_i,timers_sfr_tl1_i} == 24'hffffff)
               timers_sfr_tcon_tf1_o <= 1'b1 ;*/
//             else
//                timers_sfr_tcon_tf1_o <= timers_sfr_tcon_tf1_i ;

         end
      else 
         begin
            if(decr)
               begin
                  if ( timers_sfr_tcon_tr1_i && timers_sfr_tmod_gate_t1_i && !timers_int1_i )
                     begin
                        {timers_sfr_th1_o,
                        timers_sfr_tm1_o,
                        timers_sfr_tl1_o} <= {timers_sfr_th1_i,
                                             timers_sfr_tm1_i,
                                             timers_sfr_tl1_i}  ;
                     end
                  else
                  begin
                     {timers_sfr_th1_o,
                     timers_sfr_tm1_o,
                     timers_sfr_tl1_o} <= {timers_sfr_th1_i,
                                          timers_sfr_tm1_i,
                                          timers_sfr_tl1_i} - 1'b1 ;
                  end
               
               
/*                  if ({timers_sfr_th1_i,timers_sfr_tm1_i,timers_sfr_tl1_i} == 24'd0)
                     timers_sfr_tcon_tf1_o <= 1'b1 ;*/
/*                  else
                     timers_sfr_tcon_tf1_o <= timers_sfr_tcon_tf1_i ;*/
                  
               end
            else
            begin
//                  timers_sfr_tcon_tf1_o <= timers_sfr_tcon_tf1_i ;
                  
                  {timers_sfr_th1_o,
                   timers_sfr_tm1_o,
                   timers_sfr_tl1_o} <= {timers_sfr_th1_i,
                                         timers_sfr_tm1_i,
                                         timers_sfr_tl1_i}  ;
            end
         end
   end
end

//--------------------------------------------------------------------------



//------------------ DECODIFICADOR DAS SAIDAS ------------------------------

always @( timers_sfr_tmod_m0t1_i    or
          timers_sfr_tmod_m1t1_i    or
          timers_sfr_tcon_tr1_i     or
          timers_sfr_tmod_gate_t1_i or
          timers_int1_i             or
          timers_sfr_th1_i          or
          timers_sfr_tm1_i          or
          timers_sfr_tl1_i
        )
begin
//------------------ MODO DE OPERACAO 0 ------------------------------------
   
   incr = 1'b0;
   decr = 1'b0;
   
   if(timers_sfr_tmod_m0t1_i)
      begin
         if(timers_sfr_tmod_m1t1_i)
            begin
               if ( timers_sfr_tcon_tr1_i )
                  begin
                     if ( timers_sfr_tmod_gate_t1_i )
                        begin
                           if ( timers_int1_i )
                              begin
                                 incr = 1'b0;
                                 decr = 1'b1;
                              end // if ( timers_int1_i )
                           else
                           begin
                              incr = 1'b0;
                              decr = 1'b0;
                           end // if ( timers_int1_i )
                        end // if ( timers_sfr_tmod_gate_t1_i )
                     else
                     begin
                        incr = 1'b0;
                        decr = 1'b1;
                     end
                  end
               else
               begin
                  incr = 1'b0;
                  decr = 1'b0;
               end
            end // if(timers_sfr_tmod_m1t1_i)
         else
         begin
            incr = 1'b0;
            decr = 1'b0;
         end
      end // if(timers_sfr_tmod_m0t1_i)
   else
   begin
      if(timers_sfr_tmod_m1t1_i)
         begin
            incr = 1'b0;
            decr = 1'b0;
         end // if(timers_sfr_tmod_m1t1_i)
      else
      begin
         if ( timers_sfr_tcon_tr1_i )
            begin
               if ( timers_sfr_tmod_gate_t1_i )
                  begin
                     if ( timers_int1_i )
                        begin
                           incr = 1'b1;
                           decr = 1'b0;
                        end // if ( timers_int1_i )
                     else
                     begin
                        incr = 1'b0;
                        decr = 1'b0;
                     end // if ( timers_int1_i )
                  end // if ( timers_sfr_tmod_gate_t1_i )
               else
               begin
                  incr = 1'b1;
                  decr = 1'b0;
               end
            end
         else
         begin
            incr = 1'b0;
            decr = 1'b0;
         end
      end
   end
end
endmodule
