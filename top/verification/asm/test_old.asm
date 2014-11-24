ORG 0000H ; First ADDR                        
JMP 03BH                                      
ORG 003BH ; ADDR after interrupt space        
MOV 0C8H, #0FFH ; Setting P1EN - output       
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_2                                 
LABEL_JNB_2: MOV P1, #0FFH                    
JMP BACK_JNB_2                                
INI_JNB_2: MOV P1, #028H                      
CLR 028H                                      
JNB 028H, LABEL_JNB_2                         
BACK_JNB_2: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0A7H                                 
MOV A, #0A7H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #01BH                                 
MOV P1, #0A6H                                 
MOV R0, #01BH                                 
MOV 01BH, #0A6H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_7                                  
LABEL_JZ_7: MOV P1, #0FFH                     
JMP BACK_JZ_7                                 
INI_JZ_7: MOV P1, #0ABH                       
MOV A, #0ABH                                  
JZ LABEL_JZ_7                                 
BACK_JZ_7: MOV P1, #0FEH                      
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #0A6H                                 
MOV A, #0A6H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #049H                                 
MOV P1, #0A2H                                 
MOV R0, #049H                                 
MOV 049H, #0A2H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #088H                                 
MOV A, #088H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #01DH                                 
MOV A, #01DH                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_15                                
LABEL_JNB_15: MOV P1, #0FFH                   
JMP BACK_JNB_15                               
INI_JNB_15: MOV P1, #046H                     
CLR 046H                                      
JNB 046H, LABEL_JNB_15                        
BACK_JNB_15: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #05DH                                 
MOV P1, #07BH                                 
MOV R0, #05DH                                 
MOV 05DH, #07BH                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #0B0H                                 
JMP INI_JB_17                                 
LABEL_JB_17: MOV P1, #0FFH                    
JMP BACK_JB_17                                
INI_JB_17: MOV P1, #0B0H                      
SETB 0B0H                                     
JB 0B0H, LABEL_JB_17                          
BACK_JB_17: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #10H ; JBC                            
JMP INI_JBC_18                                
LABEL_JBC_18: MOV P1, #0FFH                   
JMP BACK_JBC_18                               
INI_JBC_18: MOV P1, #02CH                     
MOV P1, #064H                                 
MOV P1, #079H                                 
MOV 02CH, #079H                               
JBC 064H, LABEL_JBC_18                        
BACK_JBC_18: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_19                                
LABEL_JNB_19: MOV P1, #0FFH                   
JMP BACK_JNB_19                               
INI_JNB_19: MOV P1, #0B5H                     
CLR 0B5H                                      
JNB 0B5H, LABEL_JNB_19                        
BACK_JNB_19: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_20                                
LABEL_JNB_20: MOV P1, #0FFH                   
JMP BACK_JNB_20                               
INI_JNB_20: MOV P1, #09AH                     
CLR 09AH                                      
JNB 09AH, LABEL_JNB_20                        
BACK_JNB_20: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #70H ; JNZ                            
JMP INI_JNZ_21                                
LABEL_JNZ_21: MOV P1, #0FFH                   
JMP BACK_JNZ_21                               
INI_JNZ_21: MOV P1, #078H                     
MOV A, #078H                                  
JNZ LABEL_JNZ_21                              
BACK_JNZ_21: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_22                                
LABEL_JNB_22: MOV P1, #0FFH                   
JMP BACK_JNB_22                               
INI_JNB_22: MOV P1, #052H                     
CLR 052H                                      
JNB 052H, LABEL_JNB_22                        
BACK_JNB_22: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #70H ; JNZ                            
JMP INI_JNZ_23                                
LABEL_JNZ_23: MOV P1, #0FFH                   
JMP BACK_JNZ_23                               
INI_JNZ_23: MOV P1, #00H                      
MOV A, #00H                                   
JNZ LABEL_JNZ_23                              
BACK_JNZ_23: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0F5H                                 
MOV A, #0F5H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_25                                
LABEL_JNB_25: MOV P1, #0FFH                   
JMP BACK_JNB_25                               
INI_JNB_25: MOV P1, #05FH                     
CLR 05FH                                      
JNB 05FH, LABEL_JNB_25                        
BACK_JNB_25: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #057H                                 
MOV A, #057H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_27                                 
LABEL_JZ_27: MOV P1, #0FFH                    
JMP BACK_JZ_27                                
INI_JZ_27: MOV P1, #071H                      
MOV A, #071H                                  
JZ LABEL_JZ_27                                
BACK_JZ_27: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_28                                
LABEL_JNB_28: MOV P1, #0FFH                   
JMP BACK_JNB_28                               
INI_JNB_28: MOV P1, #04AH                     
CLR 04AH                                      
JNB 04AH, LABEL_JNB_28                        
BACK_JNB_28: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_29                                
LABEL_JNB_29: MOV P1, #0FFH                   
JMP BACK_JNB_29                               
INI_JNB_29: MOV P1, #05DH                     
CLR 05DH                                      
JNB 05DH, LABEL_JNB_29                        
BACK_JNB_29: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_30                                 
LABEL_JZ_30: MOV P1, #0FFH                    
JMP BACK_JZ_30                                
INI_JZ_30: MOV P1, #072H                      
MOV A, #072H                                  
JZ LABEL_JZ_30                                
BACK_JZ_30: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #074H                                 
MOV P1, #093H                                 
MOV R0, #074H                                 
MOV 074H, #093H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #035H                                 
MOV P1, #07BH                                 
MOV R0, #035H                                 
MOV 035H, #07BH                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_33                                 
LABEL_JZ_33: MOV P1, #0FFH                    
JMP BACK_JZ_33                                
INI_JZ_33: MOV P1, #088H                      
MOV A, #088H                                  
JZ LABEL_JZ_33                                
BACK_JZ_33: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #0E5H                                 
JMP INI_JB_34                                 
LABEL_JB_34: MOV P1, #0FFH                    
JMP BACK_JB_34                                
INI_JB_34: MOV P1, #0E5H                      
SETB 0E5H                                     
JB 0E5H, LABEL_JB_34                          
BACK_JB_34: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #017H                                 
MOV A, #017H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #70H ; JNZ                            
JMP INI_JNZ_36                                
LABEL_JNZ_36: MOV P1, #0FFH                   
JMP BACK_JNZ_36                               
INI_JNZ_36: MOV P1, #0B1H                     
MOV A, #0B1H                                  
JNZ LABEL_JNZ_36                              
BACK_JNZ_36: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_38                                 
LABEL_JZ_38: MOV P1, #0FFH                    
JMP BACK_JZ_38                                
INI_JZ_38: MOV P1, #00H                       
MOV A, #00H                                   
JZ LABEL_JZ_38                                
BACK_JZ_38: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #0CAH                                 
JMP INI_JB_39                                 
LABEL_JB_39: MOV P1, #0FFH                    
JMP BACK_JB_39                                
INI_JB_39: MOV P1, #0CAH                      
SETB 0CAH                                     
JB 0CAH, LABEL_JB_39                          
BACK_JB_39: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0CH                                  
MOV A, #0CH                                   
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #09H                                  
MOV A, #09H                                   
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #03H                                  
JMP INI_JB_44                                 
LABEL_JB_44: MOV P1, #0FFH                    
JMP BACK_JB_44                                
INI_JB_44: MOV P1, #03H                       
SETB 03H                                      
JB 03H, LABEL_JB_44                           
BACK_JB_44: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_45                                 
LABEL_JZ_45: MOV P1, #0FFH                    
JMP BACK_JZ_45                                
INI_JZ_45: MOV P1, #03CH                      
MOV A, #03CH                                  
JZ LABEL_JZ_45                                
BACK_JZ_45: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_46                                
LABEL_JNB_46: MOV P1, #0FFH                   
JMP BACK_JNB_46                               
INI_JNB_46: MOV P1, #0C7H                     
CLR 0C7H                                      
JNB 0C7H, LABEL_JNB_46                        
BACK_JNB_46: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0ADH                                 
MOV A, #0ADH                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #0BAH                                 
JMP INI_JB_48                                 
LABEL_JB_48: MOV P1, #0FFH                    
JMP BACK_JB_48                                
INI_JB_48: MOV P1, #0BAH                      
SETB 0BAH                                     
JB 0BAH, LABEL_JB_48                          
BACK_JB_48: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #014H                                 
MOV P1, #030H                                 
MOV R0, #014H                                 
MOV 014H, #030H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #042H                                 
MOV P1, #02EH                                 
MOV R0, #042H                                 
MOV 042H, #02EH                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_51                                
LABEL_JNB_51: MOV P1, #0FFH                   
JMP BACK_JNB_51                               
INI_JNB_51: MOV P1, #07DH                     
CLR 07DH                                      
JNB 07DH, LABEL_JNB_51                        
BACK_JNB_51: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #0F3H                                 
MOV A, #0F3H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #10H ; JBC                            
JMP INI_JBC_53                                
LABEL_JBC_53: MOV P1, #0FFH                   
JMP BACK_JBC_53                               
INI_JBC_53: MOV P1, #026H                     
MOV P1, #032H                                 
MOV P1, #01BH                                 
MOV 026H, #01BH                               
JBC 032H, LABEL_JBC_53                        
BACK_JBC_53: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_54                                
LABEL_JNB_54: MOV P1, #0FFH                   
JMP BACK_JNB_54                               
INI_JNB_54: MOV P1, #016H                     
CLR 016H                                      
JNB 016H, LABEL_JNB_54                        
BACK_JNB_54: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #02EH                                 
MOV P1, #0D4H                                 
MOV R0, #02EH                                 
MOV 02EH, #0D4H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_57                                
LABEL_JNB_57: MOV P1, #0FFH                   
JMP BACK_JNB_57                               
INI_JNB_57: MOV P1, #080H                     
CLR 080H                                      
JNB 080H, LABEL_JNB_57                        
BACK_JNB_57: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #044H                                 
MOV P1, #0A9H                                 
MOV R0, #044H                                 
MOV 044H, #0A9H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_59                                 
LABEL_JZ_59: MOV P1, #0FFH                    
JMP BACK_JZ_59                                
INI_JZ_59: MOV P1, #039H                      
MOV A, #039H                                  
JZ LABEL_JZ_59                                
BACK_JZ_59: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #077H                                 
MOV A, #077H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #020H                                 
MOV P1, #064H                                 
MOV R0, #020H                                 
MOV 020H, #064H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #0CEH                                 
MOV A, #0CEH                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #092H                                 
JMP INI_JB_64                                 
LABEL_JB_64: MOV P1, #0FFH                    
JMP BACK_JB_64                                
INI_JB_64: MOV P1, #092H                      
SETB 092H                                     
JB 092H, LABEL_JB_64                          
BACK_JB_64: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0B8H                                 
MOV A, #0B8H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_66                                
LABEL_JNB_66: MOV P1, #0FFH                   
JMP BACK_JNB_66                               
INI_JNB_66: MOV P1, #02CH                     
CLR 02CH                                      
JNB 02CH, LABEL_JNB_66                        
BACK_JNB_66: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #036H                                 
MOV A, #036H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #10H ; JBC                            
JMP INI_JBC_68                                
LABEL_JBC_68: MOV P1, #0FFH                   
JMP BACK_JBC_68                               
INI_JBC_68: MOV P1, #027H                     
MOV P1, #039H                                 
MOV P1, #0B5H                                 
MOV 027H, #0B5H                               
JBC 039H, LABEL_JBC_68                        
BACK_JBC_68: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_69                                
LABEL_JNB_69: MOV P1, #0FFH                   
JMP BACK_JNB_69                               
INI_JNB_69: MOV P1, #0A8H                     
CLR 0A8H                                      
JNB 0A8H, LABEL_JNB_69                        
BACK_JNB_69: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #0EH                                  
MOV A, #0EH                                   
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #01DH                                 
JMP INI_JB_71                                 
LABEL_JB_71: MOV P1, #0FFH                    
JMP BACK_JB_71                                
INI_JB_71: MOV P1, #01DH                      
SETB 01DH                                     
JB 01DH, LABEL_JB_71                          
BACK_JB_71: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #082H                                 
MOV A, #082H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0ECH                                 
MOV A, #0ECH                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_74                                 
LABEL_JZ_74: MOV P1, #0FFH                    
JMP BACK_JZ_74                                
INI_JZ_74: MOV P1, #00H                       
MOV A, #00H                                   
JZ LABEL_JZ_74                                
BACK_JZ_74: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #70H ; JNZ                            
JMP INI_JNZ_75                                
LABEL_JNZ_75: MOV P1, #0FFH                   
JMP BACK_JNZ_75                               
INI_JNZ_75: MOV P1, #05H                      
MOV A, #05H                                   
JNZ LABEL_JNZ_75                              
BACK_JNZ_75: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #023H                                 
MOV A, #023H                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #01CH                                 
MOV A, #01CH                                  
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #70H ; JNZ                            
JMP INI_JNZ_78                                
LABEL_JNZ_78: MOV P1, #0FFH                   
JMP BACK_JNZ_78                               
INI_JNZ_78: MOV P1, #040H                     
MOV A, #040H                                  
JNZ LABEL_JNZ_78                              
BACK_JNZ_78: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #02FH                                 
JMP INI_JB_81                                 
LABEL_JB_81: MOV P1, #0FFH                    
JMP BACK_JB_81                                
INI_JB_81: MOV P1, #02FH                      
SETB 02FH                                     
JB 02FH, LABEL_JB_81                          
BACK_JB_81: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #07EH                                 
MOV P1, #0A9H                                 
MOV R0, #07EH                                 
MOV 07EH, #0A9H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #10H ; JBC                            
JMP INI_JBC_83                                
LABEL_JBC_83: MOV P1, #0FFH                   
JMP BACK_JBC_83                               
INI_JBC_83: MOV P1, #026H                     
MOV P1, #035H                                 
MOV P1, #054H                                 
MOV 026H, #054H                               
JBC 035H, LABEL_JBC_83                        
BACK_JBC_83: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_84                                
LABEL_JNB_84: MOV P1, #0FFH                   
JMP BACK_JNB_84                               
INI_JNB_84: MOV P1, #0CAH                     
CLR 0CAH                                      
JNB 0CAH, LABEL_JNB_84                        
BACK_JNB_84: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #060H                                 
MOV P1, #04DH                                 
MOV R0, #060H                                 
MOV 060H, #04DH                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #02H                                  
MOV A, #02H                                   
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #043H                                 
MOV A, #043H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_89                                
LABEL_JNB_89: MOV P1, #0FFH                   
JMP BACK_JNB_89                               
INI_JNB_89: MOV P1, #052H                     
CLR 052H                                      
JNB 052H, LABEL_JNB_89                        
BACK_JNB_89: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #00H ; NOP                            
NOP                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #07BH                                 
MOV P1, #083H                                 
MOV R0, #07BH                                 
MOV 07BH, #083H                               
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #60H ; JZ                             
JMP INI_JZ_92                                 
LABEL_JZ_92: MOV P1, #0FFH                    
JMP BACK_JZ_92                                
INI_JZ_92: MOV P1, #0C5H                      
MOV A, #0C5H                                  
JZ LABEL_JZ_92                                
BACK_JZ_92: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_93                                
LABEL_JNB_93: MOV P1, #0FFH                   
JMP BACK_JNB_93                               
INI_JNB_93: MOV P1, #050H                     
CLR 050H                                      
JNB 050H, LABEL_JNB_93                        
BACK_JNB_93: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_94                                
LABEL_JNB_94: MOV P1, #0FFH                   
JMP BACK_JNB_94                               
INI_JNB_94: MOV P1, #0BBH                     
CLR 0BBH                                      
JNB 0BBH, LABEL_JNB_94                        
BACK_JNB_94: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #20H ; JB and SETB                    
MOV P1, #057H                                 
JMP INI_JB_95                                 
LABEL_JB_95: MOV P1, #0FFH                    
JMP BACK_JB_95                                
INI_JB_95: MOV P1, #057H                      
SETB 057H                                     
JB 057H, LABEL_JB_95                          
BACK_JB_95: MOV P1, #0FEH                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #30H ; JNB and CLR (bit)              
JMP INI_JNB_96                                
LABEL_JNB_96: MOV P1, #0FFH                   
JMP BACK_JNB_96                               
INI_JNB_96: MOV P1, #04H                      
CLR 04H                                       
JNB 04H, LABEL_JNB_96                         
BACK_JNB_96: MOV P1, #0FEH                    
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0A1H                                 
MOV A, #0A1H                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #05H ; INC_D                          
MOV P1, #00H                                  
MOV A, #00H                                   
INC A                                         
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #083H; MOVC_A_ATPC                    
MOV P1, #0EEH                                 
MOV A, #0EEH                                  
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah  
MOV P1, A                                     
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
MOV P1, #016H ; DEC_R0                        
MOV P1, #08H                                  
MOV P1, #022H                                 
MOV R0, #08H                                  
MOV 08H, #022H                                
DEC @R0                                       
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
END                                           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
