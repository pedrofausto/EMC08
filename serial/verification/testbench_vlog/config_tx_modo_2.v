
//------------------------ TASK PARA CONFIGURAR A TRANSMISSAO NO MODO 2 ----------------------------------

task config_tx_modo_2 ;
begin
   @(posedge clock);
   #(PERIOD*2);
/*      $display("---------- Starting configuration for transmition in mode 2...----------------");*/
      reset        = 1'b0        ;
      scon7_mode   = 1'b1        ;
      scon4_ren    = 1'b0        ;
      scon0_ri_i   = 1'b0        ;
      PACOTE       = 11'd0       ;
      serial_tx    = 1'b0        ;
      data_sbuf_i  = 8'd0        ;
      scon1_ti_i   = 1'b0        ;
      cont_tx_m0   = 0           ;
      
   
   #(PERIOD*2);
   @(posedge clock);
      reset      = 1'b1  ;
/*      $display("");
      $display("scon7_mode = %b",scon7_mode);
      $display("scon4_ren  = %b",scon4_ren);
      $display("scon0_ri_i = %b",scon0_ri_i);
      $display("p3_1_o     = %b",p3_1_o);
      $display("serial_tx  = %b",serial_tx);
      $display("scon1_ti_i = %b",scon1_ti_i);
      $display("");
      $display("------------------------ Configuration finish...------------------------------");
      $display("");*/
   
end
endtask
//-----------------------------------------------------------------------------------------------------


