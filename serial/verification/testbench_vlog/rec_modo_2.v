
//------------------------ TASK PARA TESTAR A RECEPCAO NO MODO 2 --------------------------------------

task rec_modo_2;
begin
   

   
      generate_11b(dados_11)      ; // chamada da task para gerar um pacote aleatorio de 11 bits.
      PACOTE     = dados_11       ;
      PACOTE[0]  = 1'b0           ; 
      PACOTE[10] = 1'b1           ; 
      
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[0]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[1]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[2]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[3]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[4]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[5]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[6]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[7]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[8]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[9]  ;
      @(posedge br)           ;
      #300                    ;
      p3_0_i     = PACOTE[10] ;


end
endtask

//-----------------------------------------------------------------------------------------------------
