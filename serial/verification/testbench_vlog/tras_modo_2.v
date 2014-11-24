   
task trans_modo_2;
begin   
   @(posedge br)

   for(i=0; i<=REPETIR; i=i+1)
   begin
   
      cont_tx_m2 = cont_tx_m2 + 1;
      
      generate_11b(dados_11)    ; // chamada da task para gerar um pacote aleatorio de 8 bits.
      PACOTE    = dados_11      ;
      scon3_tb8 = PACOTE[9]     ;
      
      data_sbuf_i = PACOTE[8:1] ;
      
      #(PERIOD_BR_32 * 2);
      @(posedge br);
      #50
      serial_tx  = 1'b1       ;
      #(PERIOD * 2);
      serial_tx  = 1'b0       ;
      
      @(posedge br );
      @(negedge p3_1_o );
      @(posedge br );
//      $display($time,,"-------------- borda de descida do p3_1_o----------------");
     
     for(j=0; j<=10; j=j+1)
     begin    
//      $display($time,,"-------------- j == %d ----------------",j);
         
         if(j == 0)
            begin
               
               if(p3_1_o == 1'b0)
                  begin
                  #(PERIOD_BR_32 * 2);
                  end
               else 
               begin
                  $display($time, ,"TEST FAILED IN TRANMITION IN MODE 2, START BIT IS 0 BUT OUTPUT WAS %d", p3_1_o);
               end
            end
            
         if( (j > 0) && (j < 9))
            begin
               if ( PACOTE[j] == p3_1_o )
                  begin
                      #(PERIOD_BR_32 * 2);
                  end
               else
               begin
                  $display($time, ,"TEST FAILED IN TRANMITION IN MODE 2 EXPECTED DATA IS %d BUT OUTPUT WAS %d", PACOTE[j], p3_0_o);
                  #(PERIOD_BR_32 * 2);
               end
            end
         else
         begin
   
            if ( j == 9 )
               begin
                  if ( scon3_tb8 == p3_1_o )
                     begin
                        #(PERIOD_BR_32 * 2);
                     end
                  else
                  begin
                     $display($time, ,"TEST FAILED IN TRANMITION IN MODE 2 EXPECTED 9 BIT IS %d BUT OUTPUT WAS %d", scon3_tb8, p3_1_o);
                     #(PERIOD_BR_32 * 2);
                  end
               end
            else
            begin
               CONTROL_MODE = MODE_INACTIVE   ;
               if ( j == 10 )
               begin
               
                  if ( p3_0_o == 1'b1 )
                     begin
                       
                        #(PERIOD_BR_32 * 10) ;
                     end
                  else
                  begin
                     CONTROL_MODE = MODE_INACTIVE   ;
                     $display($time, ,"TEST FAILED IN TRANMITION IN MODE 2, STOP BIT IS 1 BUT OUTPUT WAS %d", p3_1_o);
                     #(PERIOD_BR_32 * 10) ;
                  end
               end
            end
         end
      end
   end
end
endtask      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
/*      
      $display($time,,"sincronismo");
//      testa_trans_modo_2;
      CONTROL_MODE = MODE_1_TRANS  ;
      $display($time,,"sincronismo mode 1 trans j = %d",j);
      
      
//      case ( OPTION )
         
//         BR_64 :  #(PERIOD_BR_64 * 20) ;
//      endcase
      
   end*/
