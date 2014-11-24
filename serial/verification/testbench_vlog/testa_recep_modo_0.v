

//------------------------ TASK PARA TESTAR A RECEPCAO NO MODO 0 --------------------------------------

task testa_recep_modo_0 ;
   begin
   #3
      if(data_sbuf_o != PACOTE)
/*         begin
            $display("Reception in mode 0.");
            $display($time, ,"EXPECTED = %d OUTPUT = %d",  PACOTE, data_sbuf_o);
         end
      else*/
      begin
         $display("Reception in mode 0.");
         $display($time, ,"TEST FAILED EXPECTED IS %d BUT OUTPUT WAS %d", dados_8, data_sbuf_o);
         #(PERIOD_BR_64);
      end
   end
endtask

//-----------------------------------------------------------------------------------------------------


