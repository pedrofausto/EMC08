ORG 0000H ; First ADDR                                                     
JMP INI                                                                    
ORG 003BH ; ADDR after interrupt space                                     
INITIAL: MOV P1, #0FFH ; inform JMP OK (verify it)                         
NOP                                                                        
NOP                                                                        
NOP                                                                        
JMP JMP_BACK; backing of JMP                                               
LABEL_CALL:                                                                
MOV P1, #0FFH                                                              
RET                                                                        
INI: MOV 0C8H, #0FFH ; Setting P1EN - output                               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #02H ; JMP (long jmp, short jmp, depends..)                        
JMP INITIAL ; jmp to begin of code, 3xNOP and JMP BACK to next line        
JMP_BACK: MOV P1, #0FEH ; inform JMP BACK OK (verify it)                   
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_3                                                               
LABEL_JB_3: MOV P1, #0FFH                                                  
JMP BACK_JB_3                                                              
INI_JB_3: MOV P1, #03EH                                                    
SETB 03EH                                                                  
JB 03EH, LABEL_JB_3                                                        
BACK_JB_3: MOV P1, #0FEH                                                   
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #056H                                                              
MOV P1, #0D9H                                                              
MOV 056H, #0D9H                                                            
LABEL_DJNZ_4: NOP                                                          
DJNZ 056H, LABEL_DJNZ_4; loop nop data_1 times                             
MOV P1, 056H ; Check in 10 cycles - P1 must have previous P1 -1            
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_5                                                               
LABEL_JB_5: MOV P1, #0FFH                                                  
JMP BACK_JB_5                                                              
INI_JB_5: MOV P1, #072H                                                    
SETB 072H                                                                  
JB 072H, LABEL_JB_5                                                        
BACK_JB_5: MOV P1, #0FEH                                                   
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #05H ; INC_D                                                       
MOV P1, #078H                                                              
MOV A, #078H                                                               
INC A                                                                      
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #020H                                                              
MOV A,  #020H                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #029H                                                              
MOV P1, #06H                                                               
MOV A,  #029H                                                              
MOV B,  #06H                                                               
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #06AH                                                              
MOV P1, #08CH                                                              
MOV R0, #06AH                                                              
MOV 06AH, #08CH                                                            
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D0H ; POP                                                        
MOV P1, #055H                                                              
MOV P1, #0A7H                                                              
MOV P1, SP             ; get actual SP                                     
POP 055H                                                                   
MOV P1, SP             ; Check SP - 5 cycles - SP anterior - 1             
MOV R0, SP                                                                 
MOV @R0, #0A7H                                                             
MOV P1, @R0            ; get actual value                                  
MOV P1, 055H; compare values - 8 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #053H ; ANL_D_DATA                                                 
MOV P1, #064H                                                              
MOV P1, #064H                                                              
MOV P1, #0C0H                                                              
MOV 064H, #064H                                                            
ANL 064H, #0C0H                                                            
MOV P1, 064H  ;check P1 (operand3 and operand4) -> 7 cycles                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #0E8H                                                              
JMP INI_JNZ_12                                                             
LABEL_JNZ_12: MOV P1, #0FFH                                                
JMP BACK_JNZ_12                                                            
INI_JNZ_12: MOV P1, #0E8H                                                  
MOV A, #0E8H                                                               
JNZ LABEL_JNZ_12                                                           
BACK_JNZ_12: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #10H ; JBC                                                         
JMP INI_JBC_13                                                             
LABEL_JBC_13: MOV P1, #0FFH ; inform JMP OK                                
JMP BACK_JBC_13                                                            
INI_JBC_13: MOV P1, #027H                                                  
MOV P1, #03BH                                                              
MOV P1, #034H                                                              
MOV 027H, #034H                                                            
JBC 03BH, LABEL_JBC_13                                                     
BACK_JBC_13: MOV P1, #0FEH ; inform JMP BACK OK                            
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0B2H ; CPL_BIT                                                    
MOV P1, #028H                                                              
MOV P1, #0BAH                                                              
MOV P1, #041H                                                              
MOV 028H, #0BAH                                                            
CPL 041H ; addr_2 must change to b1                                        
MOV  P1, 028H           ; Check in 6 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #03FH                                                              
MOV P1, #09DH                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 03FH, #09DH                                                            
PUSH 03FH                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0F4H ; CPL_A                                                      
MOV P1, A                                                                  
CPL A                                                                      
MOV P1,  A ; Check in 4 cycles - P1 must have NOT A                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #077H                                                              
MOV A,  #077H                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #0ABH                                                              
MOV P1, #021H                                                              
MOV P1, #033H                                                              
MOV  A,  #0ABH                                                             
MOV 033H, #021H                                                            
ORL  A,  033H                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #00H ; NOP                                                         
NOP                                                                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D0H ; POP                                                        
MOV P1, #06CH                                                              
MOV P1, #048H                                                              
MOV P1, SP             ; get actual SP                                     
POP 06CH                                                                   
MOV P1, SP             ; Check SP - 5 cycles - SP anterior - 1             
MOV R0, SP                                                                 
MOV @R0, #048H                                                             
MOV P1, @R0            ; get actual value                                  
MOV P1, 06CH; compare values - 8 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #040H                                                              
MOV P1, #01H                                                               
MOV 040H, #01H                                                             
LABEL_DJNZ_21: NOP                                                         
DJNZ 040H, LABEL_DJNZ_21; loop nop data_1 times                            
MOV P1, 040H ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #0E9H                                                              
MOV P1, #062H                                                              
MOV A,  #0E9H                                                              
MOV B,  #062H                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #063H                                                              
MOV A, #063H                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #015H                                                              
MOV P1, #028H                                                              
MOV P1, #060H                                                              
MOV A, #015H                                                               
MOV R0, #028H                                                              
MOV 028H, #060H                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #10H ; JBC                                                         
JMP INI_JBC_25                                                             
LABEL_JBC_25: MOV P1, #0FFH ; inform JMP OK                                
JMP BACK_JBC_25                                                            
INI_JBC_25: MOV P1, #02CH                                                  
MOV P1, #067H                                                              
MOV P1, #045H                                                              
MOV 02CH, #045H                                                            
JBC 067H, LABEL_JBC_25                                                     
BACK_JBC_25: MOV P1, #0FEH ; inform JMP BACK OK                            
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #10H ; JBC                                                         
JMP INI_JBC_26                                                             
LABEL_JBC_26: MOV P1, #0FFH ; inform JMP OK                                
JMP BACK_JBC_26                                                            
INI_JBC_26: MOV P1, #026H                                                  
MOV P1, #033H                                                              
MOV P1, #069H                                                              
MOV 026H, #069H                                                            
JBC 033H, LABEL_JBC_26                                                     
BACK_JBC_26: MOV P1, #0FEH ; inform JMP BACK OK                            
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #05H ; INC_D                                                       
MOV P1, #06CH                                                              
MOV A, #06CH                                                               
INC A                                                                      
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #047H                                                              
MOV A,  #047H                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #60H ; JZ                                                          
MOV P1, #00H                                                               
JMP INI_JZ_29                                                              
LABEL_JZ_29: MOV P1, #0FFH                                                 
JMP BACK_JZ_29                                                             
INI_JZ_29: MOV P1, #00H                                                    
MOV A, #00H                                                                
JZ LABEL_JZ_29                                                             
BACK_JZ_29: MOV P1, #0FEH                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #04BH                                                              
MOV P1, #06FH                                                              
MOV 04BH, #06FH                                                            
LABEL_DJNZ_30: NOP                                                         
DJNZ 04BH, LABEL_DJNZ_30; loop nop data_1 times                            
MOV P1, 04BH ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #05FH                                                              
MOV P1, #0C3H                                                              
MOV P1, #070H                                                              
MOV  A,  #05FH                                                             
MOV 070H, #0C3H                                                            
ORL  A,  070H                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #06AH                                                              
MOV P1, #09EH                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 06AH, #09EH                                                            
PUSH 06AH                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #064H                                                              
MOV A,  #064H                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #08FH                                                              
MOV P1, #0D9H                                                              
MOV A,  #08FH                                                              
MOV B,  #0D9H                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #070H                                                              
MOV A, #070H                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #034H ; ADDC_A_DATA                                                
MOV P1, #0EFH                                                              
MOV P1, #0ABH                                                              
MOV  A,  #0EFH                                                             
ADDC  A,  #0ABH                                                            
MOV P1, A               ; check A - 6 cycles                               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #039H                                                              
MOV P1, #08AH                                                              
MOV P1, #0F2H                                                              
MOV  A,  #039H                                                             
MOV 0F2H, #08AH                                                            
ORL  A,  0F2H                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #053H ; ANL_D_DATA                                                 
MOV P1, #0A5H                                                              
MOV P1, #08BH                                                              
MOV P1, #058H                                                              
MOV 0A5H, #08BH                                                            
ANL 0A5H, #058H                                                            
MOV P1, 0A5H  ;check P1 (operand3 and operand4) -> 7 cycles                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #085H ; MOV_D_D                                                    
MOV P1, #060H                                                              
MOV P1, #033H                                                              
MOV P1, #0BEH                                                              
MOV 060H, #033H                                                            
MOV 0BEH, 060H ; addr must have data_1                                     
MOV P1, 0BEH        ; Check in 7 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #064H                                                              
MOV P1, #0CH                                                               
MOV R0, #064H                                                              
MOV 064H, #0CH                                                             
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #00H                                                               
JMP INI_JNZ_41                                                             
LABEL_JNZ_41: MOV P1, #0FFH                                                
JMP BACK_JNZ_41                                                            
INI_JNZ_41: MOV P1, #00H                                                   
MOV A, #00H                                                                
JNZ LABEL_JNZ_41                                                           
BACK_JNZ_41: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #0B8H                                                              
MOV P1, #0CDH                                                              
MOV P1, #0BDH                                                              
MOV  A,  #0B8H                                                             
MOV 0BDH, #0CDH                                                            
ORL  A,  0BDH                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #0DBH                                                              
MOV A, #0DBH                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #072H ; ORL_C_BIT                                                  
MOV P1, #026H                                                              
MOV P1, #0D8H                                                              
MOV P1, #033H                                                              
MOV P1, PSW                                                                
MOV 026H,  #0D8H                                                           
ORL  C,  033H                                                              
MOV P1,  0D0H ;check (C or operand2) -> 7 cycles                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #034H ; ADDC_A_DATA                                                
MOV P1, #09DH                                                              
MOV P1, #04EH                                                              
MOV  A,  #09DH                                                             
ADDC  A,  #04EH                                                            
MOV P1, A               ; check A - 6 cycles                               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #0FCH                                                              
MOV A, #0FCH                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #09AH                                                              
MOV P1, #026H                                                              
MOV P1, #0B6H                                                              
MOV A, #09AH                                                               
MOV R1, #026H                                                              
MOV 026H, #0B6H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #0A5H                                                              
MOV P1, #0FEH                                                              
MOV DPTR,  #0FEA5H                                                         
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #06EH                                                              
MOV P1, #071H                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 06EH, #071H                                                            
PUSH 06EH                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #024H ; ADD_A_DATA                                                 
MOV P1, #0F3H                                                              
MOV P1, #011H                                                              
MOV  A,  #0F3H                                                             
ADD  A,  #011H                                                             
MOV P1, A; check (operand2 + operand3) -> 6 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_51                                                              
LABEL_JB_51: MOV P1, #0FFH                                                 
JMP BACK_JB_51                                                             
INI_JB_51: MOV P1, #0AH                                                    
SETB 0AH                                                                   
JB 0AH, LABEL_JB_51                                                        
BACK_JB_51: MOV P1, #0FEH                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #068H ; XRL_A_R0                                                   
MOV P1, #0C8H                                                              
MOV P1, #079H                                                              
MOV  A,  #0C8H                                                             
MOV  R0,  #079H                                                            
XRL  A, R0             ; A or R0                                           
MOV  P1, A             ; Check A - 7 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #061H                                                              
MOV P1, #0CCH                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 061H, #0CCH                                                            
PUSH 061H                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #021H                                                              
MOV A, #021H                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #019H                                                              
MOV A, #019H                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #0A6H                                                              
MOV P1, #02CH                                                              
MOV P1, #0F9H                                                              
MOV A, #0A6H                                                               
MOV R1, #02CH                                                              
MOV 02CH, #0F9H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #0C7H                                                              
MOV A, #0C7H                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #094H ; SUBB_A_DATA                                                
MOV P1, #087H                                                              
MOV P1, #0D7H                                                              
MOV A,  #087H                                                              
SUBB A,  #0D7H                                                             
MOV P1, A               ; Check P1 - 6 cycles - operand2 - operand3        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #0B2H                                                              
MOV P1, #011H                                                              
MOV A,  #0B2H                                                              
MOV B,  #011H                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D4H ; DA_A                                                       
MOV P1, #015H                                                              
MOV P1, PSW                                                                
MOV A, #015H                                                               
DA A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #0CEH                                                              
MOV P1, #0BFH                                                              
MOV A,  #0CEH                                                              
MOV B,  #0BFH                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0F4H ; CPL_A                                                      
MOV P1, A                                                                  
CPL A                                                                      
MOV P1,  A ; Check in 4 cycles - P1 must have NOT A                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #0FDH                                                              
MOV P1, #054H                                                              
MOV P1, #045H                                                              
MOV A, #0FDH                                                               
MOV R0, #054H                                                              
MOV 054H, #045H                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #0C0H                                                              
MOV A, #0C0H                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0B2H ; CPL_BIT                                                    
MOV P1, #026H                                                              
MOV P1, #01BH                                                              
MOV P1, #034H                                                              
MOV 026H, #01BH                                                            
CPL 034H ; addr_2 must change to b1                                        
MOV  P1, 026H           ; Check in 6 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #03AH                                                              
MOV P1, #07CH                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 03AH, #07CH                                                            
PUSH 03AH                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #06CH                                                               
MOV P1, #06CH                                                              
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #0B7H                                                              
MOV P1, #02DH                                                              
MOV P1, #036H                                                              
MOV A, #0B7H                                                               
MOV R1, #02DH                                                              
MOV 02DH, #036H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #084H ; DIV_A_B                                                    
MOV P1, #08FH                                                              
MOV P1, #0A7H                                                              
MOV A,  #08FH                                                              
MOV B,  #0A7H                                                              
DIV AB                                                                     
MOV P1, A               ; check A = quociente - 8 cycles                   
MOV P1, B               ; check B = rest - 1 cycle                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #05DH                                                              
MOV A,  #05DH                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #30H ; JNB and CLR (bit)                                           
MOV P1, #0D0H                                                              
JMP INI_JNB_71                                                             
LABEL_JNB_71: MOV P1, #0FFH                                                
JMP BACK_JNB_71                                                            
INI_JNB_71: MOV P1, #061H                                                  
CLR 061H                                                                   
JNB 061H, LABEL_JNB_71                                                     
BACK_JNB_71: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #0B5H                                                              
MOV P1, #051H                                                              
MOV P1, #053H                                                              
MOV A, #0B5H                                                               
MOV R1, #051H                                                              
MOV 051H, #053H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #00H                                                               
JMP INI_JNZ_73                                                             
LABEL_JNZ_73: MOV P1, #0FFH                                                
JMP BACK_JNZ_73                                                            
INI_JNZ_73: MOV P1, #00H                                                   
MOV A, #00H                                                                
JNZ LABEL_JNZ_73                                                           
BACK_JNZ_73: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #053H ; ANL_D_DATA                                                 
MOV P1, #07FH                                                              
MOV P1, #0E9H                                                              
MOV P1, #0BAH                                                              
MOV 07FH, #0E9H                                                            
ANL 07FH, #0BAH                                                            
MOV P1, 07FH  ;check P1 (operand3 and operand4) -> 7 cycles                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #05H ; INC_D                                                       
MOV P1, #08H                                                               
MOV A, #08H                                                                
INC A                                                                      
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_76                                                              
LABEL_JB_76: MOV P1, #0FFH                                                 
JMP BACK_JB_76                                                             
INI_JB_76: MOV P1, #069H                                                   
SETB 069H                                                                  
JB 069H, LABEL_JB_76                                                       
BACK_JB_76: MOV P1, #0FEH                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #07BH                                                              
MOV P1, #03EH                                                              
MOV P1, #035H                                                              
MOV A, #07BH                                                               
MOV R0, #03EH                                                              
MOV 03EH, #035H                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #0ABH                                                              
MOV P1, #05EH                                                              
MOV P1, #0F1H                                                              
MOV A, #0ABH                                                               
MOV R1, #05EH                                                              
MOV 05EH, #0F1H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A8H ; MOV_R0_D                                                   
MOV P1, #05CH                                                              
MOV P1, #062H                                                              
MOV 05CH, #062H                                                            
MOV R0,  #05CH ; R0 must have 01h                                          
MOV P1, R0             ; Check in 6 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #068H ; XRL_A_R0                                                   
MOV P1, #072H                                                              
MOV P1, #0D8H                                                              
MOV  A,  #072H                                                             
MOV  R0,  #0D8H                                                            
XRL  A, R0             ; A or R0                                           
MOV  P1, A             ; Check A - 7 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #60H ; JZ                                                          
MOV P1, #00H                                                               
JMP INI_JZ_81                                                              
LABEL_JZ_81: MOV P1, #0FFH                                                 
JMP BACK_JZ_81                                                             
INI_JZ_81: MOV P1, #00H                                                    
MOV A, #00H                                                                
JZ LABEL_JZ_81                                                             
BACK_JZ_81: MOV P1, #0FEH                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #057H                                                              
MOV P1, #03H                                                               
MOV DPTR,  #0357H                                                          
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D0H ; POP                                                        
MOV P1, #0BFH                                                              
MOV P1, #0CEH                                                              
MOV P1, SP             ; get actual SP                                     
POP 0BFH                                                                   
MOV P1, SP             ; Check SP - 5 cycles - SP anterior - 1             
MOV R0, SP                                                                 
MOV @R0, #0CEH                                                             
MOV P1, @R0            ; get actual value                                  
MOV P1, 0BFH; compare values - 8 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D4H ; DA_A                                                       
MOV P1, #0AH                                                               
MOV P1, PSW                                                                
MOV A, #0AH                                                                
DA A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #084H ; DIV_A_B                                                    
MOV P1, #04DH                                                              
MOV P1, #0FBH                                                              
MOV A,  #04DH                                                              
MOV B,  #0FBH                                                              
DIV AB                                                                     
MOV P1, A               ; check A = quociente - 8 cycles                   
MOV P1, B               ; check B = rest - 1 cycle                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A8H ; MOV_R0_D                                                   
MOV P1, #06AH                                                              
MOV P1, #0C1H                                                              
MOV 06AH, #0C1H                                                            
MOV R0,  #06AH ; R0 must have 01h                                          
MOV P1, R0             ; Check in 6 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0F4H ; CPL_A                                                      
MOV P1, A                                                                  
CPL A                                                                      
MOV P1,  A ; Check in 4 cycles - P1 must have NOT A                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0B2H ; CPL_BIT                                                    
MOV P1, #020H                                                              
MOV P1, #024H                                                              
MOV P1, #06H                                                               
MOV 020H, #024H                                                            
CPL 06H ; addr_2 must change to b1                                         
MOV  P1, 020H           ; Check in 6 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #084H ; DIV_A_B                                                    
MOV P1, #036H                                                              
MOV P1, #096H                                                              
MOV A,  #036H                                                              
MOV B,  #096H                                                              
DIV AB                                                                     
MOV P1, A               ; check A = quociente - 8 cycles                   
MOV P1, B               ; check B = rest - 1 cycle                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #047H                                                              
MOV P1, #0E8H                                                              
MOV 047H, #0E8H                                                            
LABEL_DJNZ_90: NOP                                                         
DJNZ 047H, LABEL_DJNZ_90; loop nop data_1 times                            
MOV P1, 047H ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
MOV P1, #0E0H ; MOVX_A_ATDPTR                                              
MOV P1, DPL                                                                
MOV P1, DPH                                                                
MOVX A, @DPTR                                                              
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #06H                                                                
MOV P1, #06H                                                               
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0B2H ; CPL_BIT                                                    
MOV P1, #02CH                                                              
MOV P1, #06H                                                               
MOV P1, #061H                                                              
MOV 02CH, #06H                                                             
CPL 061H ; addr_2 must change to b1                                        
MOV  P1, 02CH           ; Check in 6 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #07CH                                                              
MOV P1, #0E5H                                                              
MOV DPTR,  #0E57CH                                                         
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #00H                                                               
JMP INI_JNZ_94                                                             
LABEL_JNZ_94: MOV P1, #0FFH                                                
JMP BACK_JNZ_94                                                            
INI_JNZ_94: MOV P1, #00H                                                   
MOV A, #00H                                                                
JNZ LABEL_JNZ_94                                                           
BACK_JNZ_94: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #092H                                                              
MOV P1, #030H                                                              
MOV P1, #0FEH                                                              
MOV A, #092H                                                               
MOV R0, #030H                                                              
MOV 030H, #0FEH                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #03CH                                                              
MOV P1, #038H                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 03CH, #038H                                                            
PUSH 03CH                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #048H                                                              
MOV P1, #0BCH                                                              
MOV 048H, #0BCH                                                            
LABEL_DJNZ_97: NOP                                                         
DJNZ 048H, LABEL_DJNZ_97; loop nop data_1 times                            
MOV P1, 048H ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #094H ; SUBB_A_DATA                                                
MOV P1, #052H                                                              
MOV P1, #0ECH                                                              
MOV A,  #052H                                                              
SUBB A,  #0ECH                                                             
MOV P1, A               ; Check P1 - 6 cycles - operand2 - operand3        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #034H ; ADDC_A_DATA                                                
MOV P1, #0D7H                                                              
MOV P1, #068H                                                              
MOV  A,  #0D7H                                                             
ADDC  A,  #068H                                                            
MOV P1, A               ; check A - 6 cycles                               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #05H                                                               
MOV A,  #05H                                                               
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #05AH                                                              
MOV P1, #0A1H                                                              
MOV A,  #05AH                                                              
MOV B,  #0A1H                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #08AH                                                               
MOV P1, #08AH                                                              
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #043H                                                              
MOV A, #043H                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #07CH                                                              
MOV P1, #02H                                                               
MOV R0, #07CH                                                              
MOV 07CH, #02H                                                             
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #30H ; JNB and CLR (bit)                                           
MOV P1, #0F7H                                                              
JMP INI_JNB_105                                                            
LABEL_JNB_105: MOV P1, #0FFH                                               
JMP BACK_JNB_105                                                           
INI_JNB_105: MOV P1, #01EH                                                 
CLR 01EH                                                                   
JNB 01EH, LABEL_JNB_105                                                    
BACK_JNB_105: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #084H ; DIV_A_B                                                    
MOV P1, #04CH                                                              
MOV P1, #0A7H                                                              
MOV A,  #04CH                                                              
MOV B,  #0A7H                                                              
DIV AB                                                                     
MOV P1, A               ; check A = quociente - 8 cycles                   
MOV P1, B               ; check B = rest - 1 cycle                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0F4H ; CPL_A                                                      
MOV P1, A                                                                  
CPL A                                                                      
MOV P1,  A ; Check in 4 cycles - P1 must have NOT A                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #077H                                                              
MOV P1, #03BH                                                              
MOV P1, #0B6H                                                              
MOV A, #077H                                                               
MOV R0, #03BH                                                              
MOV 03BH, #0B6H                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #094H ; SUBB_A_DATA                                                
MOV P1, #08EH                                                              
MOV P1, #0B1H                                                              
MOV A,  #08EH                                                              
SUBB A,  #0B1H                                                             
MOV P1, A               ; Check P1 - 6 cycles - operand2 - operand3        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #0BAH                                                              
MOV P1, #0A2H                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 0BAH, #0A2H                                                            
PUSH 0BAH                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A8H ; MOV_R0_D                                                   
MOV P1, #020H                                                              
MOV P1, #04H                                                               
MOV 020H, #04H                                                             
MOV R0,  #020H ; R0 must have 01h                                          
MOV P1, R0             ; Check in 6 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #028H                                                              
MOV P1, #036H                                                              
MOV R0, #028H                                                              
MOV 028H, #036H                                                            
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A8H ; MOV_R0_D                                                   
MOV P1, #09BH                                                              
MOV P1, #01EH                                                              
MOV 09BH, #01EH                                                            
MOV R0,  #09BH ; R0 must have 01h                                          
MOV P1, R0             ; Check in 6 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #053H ; ANL_D_DATA                                                 
MOV P1, #055H                                                              
MOV P1, #077H                                                              
MOV P1, #0F3H                                                              
MOV 055H, #077H                                                            
ANL 055H, #0F3H                                                            
MOV P1, 055H  ;check P1 (operand3 and operand4) -> 7 cycles                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #30H ; JNB and CLR (bit)                                           
MOV P1, #0D1H                                                              
JMP INI_JNB_115                                                            
LABEL_JNB_115: MOV P1, #0FFH                                               
JMP BACK_JNB_115                                                           
INI_JNB_115: MOV P1, #054H                                                 
CLR 054H                                                                   
JNB 054H, LABEL_JNB_115                                                    
BACK_JNB_115: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #30H ; JNB and CLR (bit)                                           
MOV P1, #084H                                                              
JMP INI_JNB_116                                                            
LABEL_JNB_116: MOV P1, #0FFH                                               
JMP BACK_JNB_116                                                           
INI_JNB_116: MOV P1, #075H                                                 
CLR 075H                                                                   
JNB 075H, LABEL_JNB_116                                                    
BACK_JNB_116: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #034H ; ADDC_A_DATA                                                
MOV P1, #0AAH                                                              
MOV P1, #0EBH                                                              
MOV  A,  #0AAH                                                             
ADDC  A,  #0EBH                                                            
MOV P1, A               ; check A - 6 cycles                               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #024H ; ADD_A_DATA                                                 
MOV P1, #071H                                                              
MOV P1, #063H                                                              
MOV  A,  #071H                                                             
ADD  A,  #063H                                                             
MOV P1, A; check (operand2 + operand3) -> 6 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #0B5H                                                              
MOV P1, #096H                                                              
MOV P1, #01CH                                                              
MOV  A,  #0B5H                                                             
MOV 01CH, #096H                                                            
ORL  A,  01CH                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #01H                                                                
MOV P1, #01H                                                               
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #068H ; XRL_A_R0                                                   
MOV P1, #0DH                                                               
MOV P1, #0A3H                                                              
MOV  A,  #0DH                                                              
MOV  R0,  #0A3H                                                            
XRL  A, R0             ; A or R0                                           
MOV  P1, A             ; Check A - 7 cycles                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #070H                                                              
MOV P1, #04CH                                                              
MOV P1, #059H                                                              
MOV A, #070H                                                               
MOV R0, #04CH                                                              
MOV 04CH, #059H                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #05H ; INC_D                                                       
MOV P1, #08FH                                                              
MOV A, #08FH                                                               
INC A                                                                      
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #010H                                                               
MOV P1, #010H                                                              
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #020H                                                              
MOV A,  #020H                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #00H ; NOP                                                         
NOP                                                                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D4H ; DA_A                                                       
MOV P1, #085H                                                              
MOV P1, PSW                                                                
MOV A, #085H                                                               
DA A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #05CH                                                              
MOV P1, #029H                                                              
MOV P1, #04AH                                                              
MOV A, #05CH                                                               
MOV R1, #029H                                                              
MOV 029H, #04AH                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_129                                                             
LABEL_JB_129: MOV P1, #0FFH                                                
JMP BACK_JB_129                                                            
INI_JB_129: MOV P1, #07BH                                                  
SETB 07BH                                                                  
JB 07BH, LABEL_JB_129                                                      
BACK_JB_129: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A8H ; MOV_R0_D                                                   
MOV P1, #0DFH                                                              
MOV P1, #0D1H                                                              
MOV 0DFH, #0D1H                                                            
MOV R0,  #0DFH ; R0 must have 01h                                          
MOV P1, R0             ; Check in 6 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #057H                                                              
MOV P1, #094H                                                              
MOV 057H, #094H                                                            
LABEL_DJNZ_131: NOP                                                        
DJNZ 057H, LABEL_DJNZ_131; loop nop data_1 times                           
MOV P1, 057H ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #085H ; MOV_D_D                                                    
MOV P1, #069H                                                              
MOV P1, #048H                                                              
MOV P1, #0DAH                                                              
MOV 069H, #048H                                                            
MOV 0DAH, 069H ; addr must have data_1                                     
MOV P1, 0DAH        ; Check in 7 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #085H ; MOV_D_D                                                    
MOV P1, #054H                                                              
MOV P1, #056H                                                              
MOV P1, #037H                                                              
MOV 054H, #056H                                                            
MOV 037H, 054H ; addr must have data_1                                     
MOV P1, 037H        ; Check in 7 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #0A4H                                                              
MOV P1, #020H                                                              
MOV P1, #0AEH                                                              
MOV  A,  #0A4H                                                             
MOV 0AEH, #020H                                                            
ORL  A,  0AEH                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #085H ; MOV_D_D                                                    
MOV P1, #0D3H                                                              
MOV P1, #0B3H                                                              
MOV P1, #077H                                                              
MOV 0D3H, #0B3H                                                            
MOV 077H, 0D3H ; addr must have data_1                                     
MOV P1, 077H        ; Check in 7 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #053H ; ANL_D_DATA                                                 
MOV P1, #0C0H                                                              
MOV P1, #08AH                                                              
MOV P1, #087H                                                              
MOV 0C0H, #08AH                                                            
ANL 0C0H, #087H                                                            
MOV P1, 0C0H  ;check P1 (operand3 and operand4) -> 7 cycles                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #031H                                                              
MOV P1, #091H                                                              
MOV 031H, #091H                                                            
LABEL_DJNZ_137: NOP                                                        
DJNZ 031H, LABEL_DJNZ_137; loop nop data_1 times                           
MOV P1, 031H ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #0FBH                                                              
MOV A, #0FBH                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #084H ; DIV_A_B                                                    
MOV P1, #048H                                                              
MOV P1, #0BEH                                                              
MOV A,  #048H                                                              
MOV B,  #0BEH                                                              
DIV AB                                                                     
MOV P1, A               ; check A = quociente - 8 cycles                   
MOV P1, B               ; check B = rest - 1 cycle                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #0F5H                                                              
MOV P1, #04FH                                                              
MOV P1, #0EDH                                                              
MOV A, #0F5H                                                               
MOV R0, #04FH                                                              
MOV 04FH, #0EDH                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #07FH                                                              
JMP INI_JNZ_141                                                            
LABEL_JNZ_141: MOV P1, #0FFH                                               
JMP BACK_JNZ_141                                                           
INI_JNZ_141: MOV P1, #07FH                                                 
MOV A, #07FH                                                               
JNZ LABEL_JNZ_141                                                          
BACK_JNZ_141: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #0D3H                                                              
MOV P1, #057H                                                              
MOV P1, #091H                                                              
MOV A, #0D3H                                                               
MOV R1, #057H                                                              
MOV 057H, #091H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #085H ; MOV_D_D                                                    
MOV P1, #047H                                                              
MOV P1, #044H                                                              
MOV P1, #0C0H                                                              
MOV 047H, #044H                                                            
MOV 0C0H, 047H ; addr must have data_1                                     
MOV P1, 0C0H        ; Check in 7 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #04BH                                                              
MOV A, #04BH                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #024H ; ADD_A_DATA                                                 
MOV P1, #0C2H                                                              
MOV P1, #03FH                                                              
MOV  A,  #0C2H                                                             
ADD  A,  #03FH                                                             
MOV P1, A; check (operand2 + operand3) -> 6 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #076H                                                              
MOV P1, #0FCH                                                              
MOV R0, #076H                                                              
MOV 076H, #0FCH                                                            
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #02EH                                                              
MOV A,  #02EH                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #09CH                                                              
MOV P1, #062H                                                              
MOV P1, #043H                                                              
MOV A, #09CH                                                               
MOV R1, #062H                                                              
MOV 062H, #043H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #0B6H                                                              
MOV P1, #036H                                                              
MOV DPTR,  #036B6H                                                         
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #080H                                                              
MOV P1, #028H                                                              
MOV P1, #072H                                                              
MOV  A,  #080H                                                             
MOV 072H, #028H                                                            
ORL  A,  072H                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #10H ; JBC                                                         
JMP INI_JBC_151                                                            
LABEL_JBC_151: MOV P1, #0FFH ; inform JMP OK                               
JMP BACK_JBC_151                                                           
INI_JBC_151: MOV P1, #025H                                                 
MOV P1, #02EH                                                              
MOV P1, #0BDH                                                              
MOV 025H, #0BDH                                                            
JBC 02EH, LABEL_JBC_151                                                    
BACK_JBC_151: MOV P1, #0FEH ; inform JMP BACK OK                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_152                                                             
LABEL_JB_152: MOV P1, #0FFH                                                
JMP BACK_JB_152                                                            
INI_JB_152: MOV P1, #07AH                                                  
SETB 07AH                                                                  
JB 07AH, LABEL_JB_152                                                      
BACK_JB_152: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #050H                                                              
MOV P1, #0C9H                                                              
MOV DPTR,  #0C950H                                                         
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #60H ; JZ                                                          
MOV P1, #00H                                                               
JMP INI_JZ_154                                                             
LABEL_JZ_154: MOV P1, #0FFH                                                
JMP BACK_JZ_154                                                            
INI_JZ_154: MOV P1, #00H                                                   
MOV A, #00H                                                                
JZ LABEL_JZ_154                                                            
BACK_JZ_154: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #20H ; JB and SETB                                                 
JMP INI_JB_155                                                             
LABEL_JB_155: MOV P1, #0FFH                                                
JMP BACK_JB_155                                                            
INI_JB_155: MOV P1, #018H                                                  
SETB 018H                                                                  
JB 018H, LABEL_JB_155                                                      
BACK_JB_155: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #095H                                                              
MOV P1, #07BH                                                              
MOV A,  #095H                                                              
MOV B,  #07BH                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D0H ; POP                                                        
MOV P1, #076H                                                              
MOV P1, #0AEH                                                              
MOV P1, SP             ; get actual SP                                     
POP 076H                                                                   
MOV P1, SP             ; Check SP - 5 cycles - SP anterior - 1             
MOV R0, SP                                                                 
MOV @R0, #0AEH                                                             
MOV P1, @R0            ; get actual value                                  
MOV P1, 076H; compare values - 8 cycles                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C7H ; XCH_A_ATR1                                                 
MOV P1, #0B7H                                                              
MOV P1, #02BH                                                              
MOV P1, #0E5H                                                              
MOV A, #0B7H                                                               
MOV R1, #02BH                                                              
MOV 02BH, #0E5H                                                            
XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A                        
MOV P1, A          ; Check in 9 cycles - A with previous value of @R1      
MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #04AH                                                              
MOV P1, #0CFH                                                              
MOV R0, #04AH                                                              
MOV 04AH, #0CFH                                                            
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #0D8H                                                               
MOV P1, #0D8H                                                              
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #03FH                                                              
MOV P1, #03EH                                                              
MOV 03FH, #03EH                                                            
LABEL_DJNZ_161: NOP                                                        
DJNZ 03FH, LABEL_DJNZ_161; loop nop data_1 times                           
MOV P1, 03FH ; Check in 10 cycles - P1 must have previous P1 -1            
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #023H ; RL_A                                                       
MOV P1, #06CH                                                              
MOV A, #06CH                                                               
RL A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left          
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #05H ; INC_D                                                       
MOV P1, #064H                                                              
MOV A, #064H                                                               
INC A                                                                      
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #094H ; SUBB_A_DATA                                                
MOV P1, #090H                                                              
MOV P1, #04BH                                                              
MOV A,  #090H                                                              
SUBB A,  #04BH                                                             
MOV P1, A               ; Check P1 - 6 cycles - operand2 - operand3        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #067H                                                              
MOV A,  #067H                                                              
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #016H ; DEC_R0                                                     
MOV P1, #03BH                                                              
MOV P1, #01DH                                                              
MOV R0, #03BH                                                              
MOV 03BH, #01DH                                                            
DEC @R0                                                                    
MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles                              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #30H ; JNB and CLR (bit)                                           
MOV P1, #0BBH                                                              
JMP INI_JNB_167                                                            
LABEL_JNB_167: MOV P1, #0FFH                                               
JMP BACK_JNB_167                                                           
INI_JNB_167: MOV P1, #024H                                                 
CLR 024H                                                                   
JNB 024H, LABEL_JNB_167                                                    
BACK_JNB_167: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C4H ; SWAP_A                                                     
MOV P1, #01H                                                               
MOV A,  #01H                                                               
SWAP A                                                                     
MOV P1, A               ; check A - 5 cycle - change nibbles               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D5H ; DJNZ_D                                                     
MOV P1, #048H                                                              
MOV P1, #060H                                                              
MOV 048H, #060H                                                            
LABEL_DJNZ_169: NOP                                                        
DJNZ 048H, LABEL_DJNZ_169; loop nop data_1 times                           
MOV P1, 048H ; Check in 10 cycles - P1 must have previous P1 -1            
MOV P1, #012H ; CALL                                                       
CALL LABEL_CALL                                                            
MOV P1, #0FEH ; RET - back from ACALL                                      
MOV P1, #0E0H ; MOVX_A_ATDPTR                                              
MOV P1, DPL                                                                
MOV P1, DPH                                                                
MOVX A, @DPTR                                                              
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #10H ; JBC                                                         
JMP INI_JBC_170                                                            
LABEL_JBC_170: MOV P1, #0FFH ; inform JMP OK                               
JMP BACK_JBC_170                                                           
INI_JBC_170: MOV P1, #02EH                                                 
MOV P1, #073H                                                              
MOV P1, #03H                                                               
MOV 02EH, #03H                                                             
JBC 073H, LABEL_JBC_170                                                    
BACK_JBC_170: MOV P1, #0FEH ; inform JMP BACK OK                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A4H ; MUL_A_B                                                    
MOV P1, #0CEH                                                              
MOV P1, #018H                                                              
MOV A,  #0CEH                                                              
MOV B,  #018H                                                              
MUL AB                                                                     
MOV P1, A               ; Check A = lsb - 8 cycles                         
MOV P1, B               ; Check B = msb - 1 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #094H ; SUBB_A_DATA                                                
MOV P1, #060H                                                              
MOV P1, #088H                                                              
MOV A,  #060H                                                              
SUBB A,  #088H                                                             
MOV P1, A               ; Check P1 - 6 cycles - operand2 - operand3        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D4H ; DA_A                                                       
MOV P1, #01CH                                                              
MOV P1, PSW                                                                
MOV A, #01CH                                                               
DA A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #038H                                                              
MOV P1, #047H                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 038H, #047H                                                            
PUSH 038H                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #024H ; ADD_A_DATA                                                 
MOV P1, #01BH                                                              
MOV P1, #04AH                                                              
MOV  A,  #01BH                                                             
ADD  A,  #04AH                                                             
MOV P1, A; check (operand2 + operand3) -> 6 cycles                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0F4H ; CPL_A                                                      
MOV P1, A                                                                  
CPL A                                                                      
MOV P1,  A ; Check in 4 cycles - P1 must have NOT A                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #10H ; JBC                                                         
JMP INI_JBC_177                                                            
LABEL_JBC_177: MOV P1, #0FFH ; inform JMP OK                               
JMP BACK_JBC_177                                                           
INI_JBC_177: MOV P1, #022H                                                 
MOV P1, #014H                                                              
MOV P1, #097H                                                              
MOV 022H, #097H                                                            
JBC 014H, LABEL_JBC_177                                                    
BACK_JBC_177: MOV P1, #0FEH ; inform JMP BACK OK                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #057H                                                              
JMP INI_JNZ_178                                                            
LABEL_JNZ_178: MOV P1, #0FFH                                               
JMP BACK_JNZ_178                                                           
INI_JNZ_178: MOV P1, #057H                                                 
MOV A, #057H                                                               
JNZ LABEL_JNZ_178                                                          
BACK_JNZ_178: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #0BDH                                                              
MOV P1, #05EH                                                              
MOV P1, #06H                                                               
MOV A, #0BDH                                                               
MOV R0, #05EH                                                              
MOV 05EH, #06H                                                             
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #30H ; JNB and CLR (bit)                                           
MOV P1, #0CBH                                                              
JMP INI_JNB_180                                                            
LABEL_JNB_180: MOV P1, #0FFH                                               
JMP BACK_JNB_180                                                           
INI_JNB_180: MOV P1, #055H                                                 
CLR 055H                                                                   
JNB 055H, LABEL_JNB_180                                                    
BACK_JNB_180: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #60H ; JZ                                                          
MOV P1, #00H                                                               
JMP INI_JZ_181                                                             
LABEL_JZ_181: MOV P1, #0FFH                                                
JMP BACK_JZ_181                                                            
INI_JZ_181: MOV P1, #00H                                                   
MOV A, #00H                                                                
JZ LABEL_JZ_181                                                            
BACK_JZ_181: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #08H                                                               
MOV A, #08H                                                                
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #067H                                                              
MOV A, #067H                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D6H ; XCHD_A_ATR0                                                
MOV P1, #08EH                                                              
MOV P1, #039H                                                              
MOV P1, #0CBH                                                              
MOV A, #08EH                                                               
MOV R0, #039H                                                              
MOV 039H, #0CBH                                                            
XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]      
MOV P1, A                ; Check in 9 cycles                               
MOV P1, @R0           ; Check in 10 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #082H                                                              
MOV A, #082H                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #072H ; ORL_C_BIT                                                  
MOV P1, #028H                                                              
MOV P1, #034H                                                              
MOV P1, #044H                                                              
MOV P1, PSW                                                                
MOV 028H,  #034H                                                           
ORL  C,  044H                                                              
MOV P1,  0D0H ;check (C or operand2) -> 7 cycles                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #003H ; RR_A                                                       
MOV A, #067H                                                               
MOV P1, #067H                                                              
RR A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D4H ; DA_A                                                       
MOV P1, #0F9H                                                              
MOV P1, PSW                                                                
MOV A, #0F9H                                                               
DA A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #076H                                                              
MOV P1, #07H                                                               
MOV DPTR,  #0776H                                                          
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #00H ; NOP                                                         
NOP                                                                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0C0H ; PUSH                                                       
MOV P1, #042H                                                              
MOV P1, #0AFH                                                              
MOV P1, SP             ; get actual SP                                     
MOV R1, SP             ; save actual SP                                    
MOV 042H, #0AFH                                                            
PUSH 042H                                                                  
MOV P1, SP             ; check SP - 8 cycles - tem que ser SP anterior + 1 
MOV P1, @R1                                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #083H; MOVC_A_ATPC                                                 
MOV P1, #0A4H                                                              
MOV A, #0A4H                                                               
MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah                               
MOV P1, A                                                                  
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #045H ; ORL_A_D                                                    
MOV P1, #05CH                                                              
MOV P1, #044H                                                              
MOV P1, #0E3H                                                              
MOV  A,  #05CH                                                             
MOV 0E3H, #044H                                                            
ORL  A,  0E3H                                                              
MOV P1,  A ;check (operand2 or operand3) -> 8 cycles                       
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #090H ; MOV_DPTR_DATA                                              
MOV P1, #08CH                                                              
MOV P1, #09AH                                                              
MOV DPTR,  #09A8CH                                                         
MOV P1, DPL ; Check in 5 cycles - P1 must have data_1                      
MOV P1, DPH ; Check in 5 cycles - P1 must have data_2                      
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #084H ; DIV_A_B                                                    
MOV P1, #0D8H                                                              
MOV P1, #021H                                                              
MOV A,  #0D8H                                                              
MOV B,  #021H                                                              
DIV AB                                                                     
MOV P1, A               ; check A = quociente - 8 cycles                   
MOV P1, B               ; check B = rest - 1 cycle                         
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #60H ; JZ                                                          
MOV P1, #00H                                                               
JMP INI_JZ_196                                                             
LABEL_JZ_196: MOV P1, #0FFH                                                
JMP BACK_JZ_196                                                            
INI_JZ_196: MOV P1, #00H                                                   
MOV A, #00H                                                                
JZ LABEL_JZ_196                                                            
BACK_JZ_196: MOV P1, #0FEH                                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #034H ; ADDC_A_DATA                                                
MOV P1, #0A9H                                                              
MOV P1, #0BBH                                                              
MOV  A,  #0A9H                                                             
ADDC  A,  #0BBH                                                            
MOV P1, A               ; check A - 6 cycles                               
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #70H ; JNZ                                                         
MOV P1, #070H                                                              
JMP INI_JNZ_198                                                            
LABEL_JNZ_198: MOV P1, #0FFH                                               
JMP BACK_JNZ_198                                                           
INI_JNZ_198: MOV P1, #070H                                                 
MOV A, #070H                                                               
JNZ LABEL_JNZ_198                                                          
BACK_JNZ_198: MOV P1, #0FEH                                                
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0D4H ; DA_A                                                       
MOV P1, #019H                                                              
MOV P1, PSW                                                                
MOV A, #019H                                                               
DA A                                                                       
MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format              
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
MOV P1, #0A8H ; MOV_R0_D                                                   
MOV P1, #02H                                                               
MOV P1, #06DH                                                              
MOV 02H, #06DH                                                             
MOV R0,  #02H ; R0 must have 01h                                           
MOV P1, R0             ; Check in 6 cycles                                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
END                                                                        
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
