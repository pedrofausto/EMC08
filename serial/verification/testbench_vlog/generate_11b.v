


//----------------------------- TASK PARA GERAR PACOTES DE 11 BIS --------------------------------------

task generate_11b ;
      output [10:0]data_11b ;
   
   begin
      data_11b     = $random % 11'd2045; // Bits gerados aleatoriamente de 0 a 255.
      {data_11b[0], data_11b[10]} = {1'b0, 1'b1} ;
//         data_11b = 11'b01110000111;
   end
endtask

//-----------------------------------------------------------------------------------------------------


