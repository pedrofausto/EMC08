



//------------------------------ GERADORES DE CLOCK E BAUD RATE ---------------------------------------


always
begin
   clock <= 1'b0 ;
   #( PERIOD )   ;
   clock <= 1'b1 ;
   #( PERIOD )   ;
end

initial
begin
   OPTION       = BR_2        ;
   OPTION_TRANS = BR_TRANS_32 ;
end

always 
begin
   case(OPTION)
      BR_2        : begin
                        br = 1'b0        ;
                        #( PERIOD_BR_2 ) ;
                        br = 1'b1        ;
                        #( PERIOD_BR_2 ) ;
                    end
                 
      BR_32       : begin
                        br = 1'b0         ;
                        #( PERIOD_BR_32 ) ;
                        br = 1'b1         ;
                        #( PERIOD_BR_32 ) ;
                    end
                 
      BR_64       : begin
                        br = 1'b0         ;
                        #( PERIOD_BR_64 ) ;
                        br = 1'b1         ;
                        #( PERIOD_BR_64 ) ;
                    end
   endcase
end

always
begin   
   case(OPTION_TRANS)
                    
      BR_TRANS_32 : begin
                        br_trans <= 1'b1 ;
                        #( PERIOD_BR_2 ) ;
                        br_trans <= 1'b0 ;
                        #( PERIOD_BR_2 ) ; 
                    end
                 
      BR_TRANS_64 : begin
                        br_trans <= 1'b1    ;
                        #( PERIOD_BR_2* 2 ) ;
                        br_trans <= 1'b0    ;
                        #( PERIOD_BR_2* 2 ) ; 
                    end
                 
   endcase
end
