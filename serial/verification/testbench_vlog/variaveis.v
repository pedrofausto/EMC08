
//----------------------------------- VARIAVEIS DE USO INTERNO ----------------------------------------
                  
integer     i            ,
            j            ,
            cont_rx_m0   ,
            cont_tx_m0   ,
            cont_rx_m2   ,
            cont_tx_m2   ;

reg         br_2         ,
            br_trans_32  ,
            br_trans_64  ,
            period_br_32 ,
            period_br_64 ,
            rb8          ;

reg [10:0]  PACOTE       ;
reg [0:7]   DADOS        ;
reg [1:0]   OPTION       ;
reg         OPTION_TRANS ;
reg [2:0]   CONTROL_MODE ;
reg [7:0]   dados_8      ;
reg [10:0]  dados_11     ;

//-----------------------------------------------------------------------------------------------------
