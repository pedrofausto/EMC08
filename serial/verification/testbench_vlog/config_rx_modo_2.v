
//------------------------ TASK PARA CONFIGURAR A RECEPCAO NO MODO 2 ----------------------------------

task config_rx_modo_2 ;
begin
   @(posedge clock);
   #(PERIOD*2);
      
      reset        = 1'b0  ;
      scon7_mode   = 1'b1  ;
      scon4_ren    = 1'b0  ;
      scon0_ri_i   = 1'b0  ;
      PACOTE       = 11'd0 ;
      serial_tx    = 1'b0  ;
      data_sbuf_i  = 8'd0  ;
      scon1_ti_i   = 1'b0  ;
      cont_rx_m0   = 0     ;
      p3_0_i       = 1'b1  ;
      
   
   #(PERIOD*2);
   @(posedge clock);
      reset        = 1'b1  ;
   
end
endtask
//-----------------------------------------------------------------------------------------------------


