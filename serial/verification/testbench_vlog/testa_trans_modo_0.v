

//----------------------- TASK PARA TESTAR A TRANSMISSAO NO MODO 0 ------------------------------------

task testa_trans_modo_0 ;
   begin

      if(PACOTE[j] == p3_0_o)
         begin
//            $display("Transmition in mode 0.");
//            $display($time, ,"EXPECTED = %d OUTPUT = %d",  PACOTE[j], p3_0_o);
            j=j+1;
         end
      else
      begin
         $display("Transmition in mode 0. J = %d",j);
         $display($time, ,"TEST FAILED EXPECTED IS %d BUT OUTPUT WAS %d", PACOTE[j], p3_0_o);
         j=0;
         #(PERIOD_BR_64);
      end
   end
endtask

//-----------------------------------------------------------------------------------------------------