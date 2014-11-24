// -----------------------------------------------------------------------------                  
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------                  
// File Name: tb_serial_final.v
// Module Name: tb_serial_final
// Authors: Inacio Mendonca and Eloi Magalhaes
// E-mail: inacioms@gmail.com
// -----------------------------------------------------------------------------                  
// Release  History
// Version  Date          Description       Hour:
// 0.3      09/15/2010    Beta               08:56
// -----------------------------------------------------------------------------                  
// Description
// This file describes the coding style to be used on rtl
// implementations of timer / counter.
// -----------------------------------------------------------------------------                  


`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"

module tb_serial_final (); 

parameter   PERIOD          = 100     ,
            PERIOD_BR_2     = 200     ,
            PERIOD_BR_32    = 3200    ,
            PERIOD_BR_64    = 6400    ,
            BR_2            = 2'b00   ,
            BR_32           = 2'b01   ,
            BR_64           = 2'b10   , 
            BR_TRANS_32     = 1'b0    ,
            BR_TRANS_64     = 1'b1    ,
            MODE_0_TRANS    = 3'b000  ,
            MODE_0_REC      = 3'b001  ,
            MODE_1_TRANS    = 3'b010  ,
            MODE_1_REC      = 3'b011  ,
            MODE_INACTIVE   = 3'b100  ,
            REPETIR         = 10000   ;

reg clock             ,
    reset             ,
    br                ,
    br_trans          ,
    scon0_ri_i        ,
    scon1_ti_i        ,
    scon3_tb8         ,
    scon4_ren         ,
    scon7_mode        ,
    serial_tx         ,
    p3_0_i            ,
    load_sbuf_o       ;
    
reg [7:0]data_sbuf_i  ;


wire p3en_0           ,
     p3en_1           ,
     p3_0_o           ,
     p3_1_o           ,
     scon0_ri_o       ,
     scon1_ti_o       ,
     scon3_rb8        ,
     clear_count      ;
wire [7:0]data_sbuf_o ;

serial_top serial_top_tb (
                  .serial_clock_i         ( clock       ) ,
                  .serial_reset_i_b       ( reset       ) ,
                  .serial_br_i            ( br          ) ,
                  .serial_br_trans_i      ( br_trans    ) ,
                  .serial_scon0_ri_i      ( scon0_ri_i  ) ,
                  .serial_scon1_ti_i      ( scon1_ti_i  ) , 
                  .serial_scon3_tb8_i     ( scon3_tb8   ) ,
                  .serial_scon4_ren_i     ( scon4_ren   ) ,
                  .serial_scon7_sm0_i     ( scon7_mode  ) ,
                  .serial_serial_tx_i     ( serial_tx   ) ,
                  .serial_data_sbuf_i     ( data_sbuf_i ) ,
                  .serial_p3_0_i          ( p3_0_i      ) ,
                  
                  .serial_p3en_0_o        ( p3en_0      ) ,
                  .serial_p3en_1_o        ( p3en_1      ) ,
                  .serial_p3_0_o          ( p3_0_o      ) ,
                  .serial_p3_1_o          ( p3_1_o      ) ,
                  .serial_scon0_ri_o      ( scon0_ri_o  ) ,
                  .serial_scon1_ti_o      ( scon1_ti_o  ) ,
                  .serial_scon2_rb8_o     ( scon3_rb8   ) ,
                  .serial_data_sbuf_o     ( data_sbuf_o )
//                  .serial_clear_count_o   ( clear_count ) 
//                  .serial_load_sbuf_o     ( load_sbuf_o )
                  ); 

                  
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/variaveis.v"

//-----------------------------------------------------------------------------------------------------

`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/generate_8b.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/generate_11b.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/testa_recep_modo_0.v"   
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/testa_trans_modo_0.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/config_trans_modo_0.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/config_rec_modo_0.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/config_tx_modo_2.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/baud_rate.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/tras_modo_2.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/config_rx_modo_2.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/rec_modo_2.v"
//`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/recep_modo2.v"
//`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/transmit_modo2.v"
`include "/home/student/EMC08/digital_A/serial/verification/testbench_vlog/test_samples.v"

//-----------------------------------------------------------------------------------------------------



//---------------------- VALOR INICIAL DAS VARIAVEIS DE ENTRADA ---------------------------------------

initial
begin
      reset        = 1'b0          ;
      scon0_ri_i   = 1'b0          ;
      scon1_ti_i   = 1'b0          ;
      scon3_tb8    = 1'b0          ;
      rb8          = 1'b0          ;
      scon4_ren    = 1'b0          ;
      scon7_mode   = 1'b0          ;
      serial_tx    = 1'b0          ;
      data_sbuf_i  = 8'd0          ;
      p3_0_i       = 1'b0          ;
      dados_8      = 8'd0          ;
      PACOTE       = 11'd0         ;
      DADOS        = 8'd0          ;
      CONTROL_MODE = MODE_INACTIVE ;
      OPTION_TRANS = BR_TRANS_32   ;
      OPTION       = BR_2          ;
      cont_rx_m2   = 0             ;
end

//-----------------------------------------------------------------------------------------------------




//-----------------------------------------------------------------------------------------------------

always
begin
   if(!scon7_mode && (CONTROL_MODE == MODE_0_TRANS || CONTROL_MODE == MODE_0_REC))
      OPTION = BR_2 ;
   #1;
 end

//-----------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------

always@(posedge tb_serial_final.serial_top_tb.serial_rx_block.serial_rx_detector.serial_br_trans_i)
begin
   if (CONTROL_MODE == MODE_1_REC)
      test_samples;
end

//-----------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------

always @(negedge scon0_ri_o)
begin
   if(CONTROL_MODE == MODE_1_REC && scon7_mode)
   begin
      DADOS <= data_sbuf_o ;
      rb8   <= scon3_rb8   ;
   end
end

//-----------------------------------------------------------------------------------------------------



//--------------------- ALWAYS PARA VERIFICAR A RECEPCAO NO MODO 0 ------------------------------------

always @(negedge clock)
begin
      if(scon0_ri_o && !scon7_mode && CONTROL_MODE == MODE_0_REC)
         testa_recep_modo_0;
end

//-----------------------------------------------------------------------------------------------------



//--------------------- ALWAYS PARA VERIFICAR A TRANSMISSAO NO MODO 0 ---------------------------------

always @(posedge p3_1_o)
begin
   if(reset && (CONTROL_MODE == MODE_0_TRANS) && (j > 0 && j < 8))
      testa_trans_modo_0;
end

//-----------------------------------------------------------------------------------------------------



initial
begin
   $display(clock, reset, br, scon7_mode, scon4_ren, p3_0_i, scon0_ri_i);


//-------------------------- RESET - VARIAVEIS RECEBEM VALORES INICIAIS -------------------------------
   
   #(PERIOD*2);
      reset      = 1'b1            ;
   @(posedge clock)
//   #(PERIOD_BR_2 * 4)              ;
//-----------------------------------------------------------------------------------------------------

      $display("");
      $display("");
      $display("");
      $display("**********************************************************************************************");
      $display("********************************** STARTING TESTS ********************************************");
      $display("**********************************************************************************************");
      $display("");
      $display("");


//-------------------------- TESTE PARA RECEPCAO NO MODO 0 --------------------------------------------
         
   $display("------------------ START TEST FOR RECEPTION IN MODE 0 ------------------------");
   
   @(posedge clock)
   OPTION       = BR_2        ; // select the baud_rate.
   CONTROL_MODE = MODE_0_REC  ; // configure the operation mode of serial port.
   config_rec_modo_0          ; // call the task to config pins.
   
   for(i=0; i<=REPETIR; i=i+1)  // repeat N times of number packages to send the dut.
   begin
      
//      $write("test - Num %0d",i) ;
//      $write("%C",13) ; 
      
      
      
      cont_rx_m0 = cont_rx_m0 + 1 ;
      @(posedge br)
      #(PERIOD_BR_2 * 4)      ;
      generate_8b(dados_8)    ; // call the task to generate a random package of 8 bits.
      PACOTE[7:0] = dados_8   ;
      
      @(posedge br)
      #(PERIOD_BR_2 * 2)      ;
         scon4_ren  = 1'b1    ;
      @(posedge br)
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[7]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[6]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[5]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[4]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[3]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[2]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[1]  ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = dados_8[0]  ;
       
         scon4_ren  = 1'b0    ;
      #(PERIOD_BR_2 * 2)      ;
         p3_0_i = 1'b0        ;
         

   end 
   
   $display("");
   $display("               TEST FOR RECEPTION IN MODE 0 HAS FINISH.");
   $display("");
   $display( "               HAS SEND %d PACKETS FOR TEST.", cont_rx_m0 - 1 ) ;
   $display("");
   $display("------------------------------------------------------------------------------");
   $display("");

//-----------------------------------------------------------------------------------------------------
   
   
   
//-------------------------- TESTE PARA TRANSMISSAO NO MODO 0 ------------------------------------------
   
   $display("");
   $display("----------------- START TEST FOR TRANSMITION IN MODE 0 -----------------------");
   
   @(posedge br)
   #(BR_2*2)                      ;
   OPTION       = BR_2            ;
   config_trans_modo_0            ;
   CONTROL_MODE = MODE_0_TRANS    ;
      
   for(i=0; i<=REPETIR; i=i+1)
   begin
      cont_tx_m0 = cont_tx_m0 + 1 ;
      j           = 1'b0          ;
      generate_8b(dados_8)        ;
      PACOTE[7:0] = dados_8       ;
      
      
      @(posedge br)
      data_sbuf_i = PACOTE        ;
      
      
      serial_tx  = 1'b1           ;
      #(PERIOD * 2);
      serial_tx  = 1'b0           ;
      @(posedge br)
      
      #(PERIOD_BR_2 * 20)         ;
   end
      
   CONTROL_MODE = MODE_INACTIVE   ;
   
   $display("");
   $display("               TEST FOR TRANSMITION IN MODE 0 HAS FINISH.");
   $display("");
   $display( "               HAS SEND %d PACKETS FOR TEST.", cont_tx_m0 - 1 ) ;
   $display("");
   $display("------------------------------------------------------------------------------");
   $display("");
      
//-----------------------------------------------------------------------------------------------------



//-------------------------- TESTE PARA TRANSMISSAO NO MODO 2 ------------------------------------------
   
   $display("");
   $display("----------------- START TEST FOR TRANSMITION IN MODE 2 -----------------------");
   $display("");

   config_tx_modo_2     ;
   OPTION       = BR_32 ;
   cont_tx_m2   = 0     ;
   j = 0                ;
   
   @(posedge br)
   trans_modo_2;
   
   $display("               TEST COMPLETE FOR TRANSMITION IN MODE 2.");
   $display("");
   $display( "               HAS SEND %d PACKETS FOR TEST.", cont_tx_m2 - 1 ) ;
   $display("------------------------------------------------------------------------------");
   $display("");

//-----------------------------------------------------------------------------------------------------



//------------------------------TESTE PARA RECEPCAO NO MODO 2 -----------------------------------------

   
   $display("");
   $display("----------------- START TEST FOR RECEPTION IN MODE 2 -------------------------");
   $display("");

   OPTION       = BR_32       ;
   OPTION_TRANS = BR_TRANS_32 ;
   config_rx_modo_2           ;
   #(PERIOD_BR_64 * 4)        ;
   
   for(i=0; i<=REPETIR; i=i+1)
   begin
      
      CONTROL_MODE = MODE_1_REC  ;
   
      scon4_ren    = 1'b1        ;
      
      
      @(posedge br)
      rec_modo_2;

      scon4_ren    = 1'b0        ;
      
      @(posedge br)
      if ({PACOTE[9], 
           PACOTE[1], 
           PACOTE[2], 
           PACOTE[3], 
           PACOTE[4], 
           PACOTE[5], 
           PACOTE[6],
           PACOTE[7],
           PACOTE[8] } == {rb8, DADOS})   
      begin
/*         $display($time,,"PACOTE [%d] RECEBIDO COM SUCESSO, ESPERADO[  %b  ] RECEBIDO [  %b  ]",cont_rx_m2,{PACOTE[9], 
                                                                                            PACOTE[1], 
                                                                                            PACOTE[2], 
                                                                                            PACOTE[3], 
                                                                                            PACOTE[4], 
                                                                                            PACOTE[5], 
                                                                                            PACOTE[6],
                                                                                            PACOTE[7],
                                                                                            PACOTE[8] }, {rb8, DADOS});*/
         cont_rx_m2 = cont_rx_m2 + 1 ;
      end
      else
      begin
         $display("Reception in mode 2.");
         $display($time, ,"TEST FAILED EXPECTED IS %b BUT OUTPUT WAS %b", {PACOTE[9], 
                                                                           PACOTE[1], 
                                                                           PACOTE[2], 
                                                                           PACOTE[3], 
                                                                           PACOTE[4], 
                                                                           PACOTE[5], 
                                                                           PACOTE[6],
                                                                           PACOTE[7],
                                                                           PACOTE[8] }, {rb8, DADOS});
      end
      
      
      @(posedge br)
      CONTROL_MODE = MODE_INACTIVE ;
   
   #(PERIOD_BR_64 * 4);
   
   end
   

   $display("               TEST COMPLETE FOR RECEPTION IN MODE 2.");
   $display("");
   $display( "               HAS SEND %d PACKETS FOR TEST.", cont_rx_m2 - 1 ) ;
   $display("------------------------------------------------------------------------------");
   $display("");

//-----------------------------------------------------------------------------------------------------



      #(PERIOD_BR_64 * 20) ;
   
      $display("**********************************************************************************************");
      $display("********************************** ALL TESTS HAS FINISHED ************************************");
      $display("**********************************************************************************************");
      $display("");
      $display("");
      $finish;
   
end
endmodule
