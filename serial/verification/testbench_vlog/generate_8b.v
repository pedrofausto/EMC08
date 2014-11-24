//----------------------------- TASK PARA GERAR PACOTES DE 8 BIS --------------------------------------

task generate_8b ;
      output [7:0]data_8b ;
   
   begin
      data_8b     = $random % 8'd255; // Bits gerados aleatoriamente de 0 a 255.

   end
endtask

//-----------------------------------------------------------------------------------------------------
