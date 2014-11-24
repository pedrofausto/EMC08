ORG 0000H ; First ADDR                                                                        
JMP INITIAL                                                                                   
ORG 0003H ; Interrupt IE0                                                                     
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
RETI                                                                                          
ORG 000BH ; Interrupt TF0                                                                     
JMP LABEL_TF0                                                                                 
ORG 0013H ; Interrupt IE1                                                                     
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
RETI                                                                                          
ORG 001BH ; Interrupt TF1                                                                     
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
RETI                                                                                          
ORG 0023H ; Interrupt TF2                                                                     
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
SETB 00h ; set a bit in RAM to go out loop in program                                         
RETI                                                                                          
ORG 002BH ; Interrupt RI_TI                                                                   
JMP LABEL_RI_TI                                                                               
ORG 0033H ; Interrupt TXRX                                                                    
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
RETI                                                                                          
ORG 003BH ; ADDR after interrupt space                                                        
LABEL_TF0:                                                                                    
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
; time to verification stimulates INT1 input signal (as 2 cyles of CM)                        
NOP                                                                                           
NOP                                                                                           
MOV P1, #0D0H ; P1 random, time to interrupt to be processed                                  
MOV P1, #0FEH ; inform JMP BACK from TF1 OK (verify it)                                       
MOV P1, #0D0H ; P1 random                                                                     
RETI                                                                                          
LABEL_RI_TI:                                                                                  
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
CPL 00h ; set a bit in RAM to go out loop in program                                          
MOV SCON, #090H ; clear serial flags                                                          
RETI                                                                                          
INITIAL: MOV 0C8H, #0FFH ; Setting P1EN - output                                              
MOV PCON, #080H ; SMOD = 1                                                                    
MOV SCON, #080H ; Serial mode 2, and RI TI flags cleared                                      
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #01EH                                                                                 
MOV P1, #07FH                                                                                 
MOV P1, #0F5H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #01EH ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #07FH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0F5H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #07FH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #01EH ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #0F5H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #07FH ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #01EH ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0F5H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #041H                                                                                 
MOV P1, #0D0H                                                                                 
MOV P1, #03EH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #041H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #0D0H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #03EH ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #0D0H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #041H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #03EH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0D0H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #041H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #03EH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #01H ; TIMER 0 and 1 FUNCTIONALITY AND INTERRUPT                                      
MOV IP, #008H ; Timer 1 with high priority and others with low priority                       
MOV IE, #0FAH ; All interrupts enabled, except external interrupts                            
; moving FFFFFDh to 24bits Timer 0 counter                                                    
MOV 08CH, #0FFH ; move FFh to TH0                                                             
MOV 08EH, #0FFH ; move FFh to TM0                                                             
MOV 08AH, #0FDH ; move FDh to TL0                                                             
; moving 000002h to 24bits Timer 1 counter                                                    
MOV 08DH, #000H ; move 00h to TH0                                                             
MOV 08FH, #000H ; move 00h to TM0                                                             
MOV 08BH, #002H ; move 02h to TL0                                                             
MOV TMOD, #0B0H ; timer0: mode 0 | timer1: mode 3 and controlled by external input INT1       
MOV TCON, #50H ; run timer 0 and 1 (TR0 and TR1 in TCON)                                      
NOP ; time to timer 0 overflow                                                                
NOP ; time to timer 0 overflow                                                                
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if TF1 (bit 7) and TF0 (bit 5) are cleared                              
MOV TMOD, #00H ; reset TMOD                                                                   
MOV TCON, #00H ; reset TCON                                                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #056H                                                                                 
MOV P1, #0E6H                                                                                 
MOV P1, #05EH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #056H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #0E6H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #05EH ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #0E6H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #056H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #05EH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0E6H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #056H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #05EH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0EFH ; data_1 to transmit                                                            
MOV P1, #0DFH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0EFH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_13: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_13                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_13: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_13                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #0D0H                                                                                 
MOV P1, #0CBH                                                                                 
MOV A, #0D0H                                                                                  
MOV B, #0CBH                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #070H; data_1                                                                         
MOV P1, #061H; data_2                                                                         
MOV R1, #0CBH                                                                                 
MOV DPTR, #02FD7H                                                                             
MOV A, #070H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #061H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #0D3H                                                                                 
MOV P1, #089H                                                                                 
MOV A, #0D3H                                                                                  
MOV B, #089H                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #07AH                                                                                 
MOV P1, #0E7H                                                                                 
MOV A, #07AH                                                                                  
MOV B, #0E7H                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #0E2H                                                                                 
MOV P1, #07H                                                                                  
MOV P1, #07DH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0E2H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #07H ; verify if p0_a == data_2                                                       
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #07DH ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #07H ; verify if p1_a == data_2                                                       
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0E2H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #07DH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #07H ; P0EN <- data_2                                                               
MOV P3, #00H ; clear P3                                                                       
MOV P3, #0E2H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #07DH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0D0H ; data_1 to transmit                                                            
MOV P1, #0B8H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0D0H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_19: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_19                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_19: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_19                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0FH ; data_1 to transmit                                                             
MOV P1, #066H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0FH ; start transmition.                                                           
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_20: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_20                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_20: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_20                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #08CH; data_1                                                                         
MOV P1, #0F0H; data_2                                                                         
MOV R1, #0FBH                                                                                 
MOV DPTR, #04D2CH                                                                             
MOV A, #08CH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0F0H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #098H                                                                                 
MOV P1, #06H                                                                                  
MOV P1, #06CH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #098H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #06H ; verify if p0_a == data_2                                                       
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #06CH ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #06H ; verify if p1_a == data_2                                                       
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #098H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #06CH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #06H ; P0EN <- data_2                                                               
MOV P3, #00H ; clear P3                                                                       
MOV P3, #098H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #06CH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #09AH; data_1                                                                         
MOV P1, #063H; data_2                                                                         
MOV R1, #00H                                                                                  
MOV DPTR, #07663H                                                                             
MOV A, #09AH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #063H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #0A2H; data_1                                                                         
MOV P1, #0F1H; data_2                                                                         
MOV R1, #0B5H                                                                                 
MOV DPTR, #03C79H                                                                             
MOV A, #0A2H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0F1H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0A9H ; data_1 to transmit                                                            
MOV P1, #06AH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0A9H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_30: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_30                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_30: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_30                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #038H; data_1                                                                         
MOV P1, #01BH; data_2                                                                         
MOV R1, #010H                                                                                 
MOV DPTR, #06792H                                                                             
MOV A, #038H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #01BH                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #0B2H                                                                                 
MOV P1, #018H                                                                                 
MOV P1, #086H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0B2H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #018H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #086H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #018H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0B2H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #086H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #018H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #0B2H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #086H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #0C1H; data_1                                                                         
MOV P1, #060H; data_2                                                                         
MOV R1, #0CAH                                                                                 
MOV DPTR, #0F305H                                                                             
MOV A, #0C1H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #060H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #026H                                                                                 
MOV P1, #0EH                                                                                  
MOV P1, #0D9H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #026H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #0EH ; verify if p0_a == data_2                                                       
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0D9H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #0EH ; verify if p1_a == data_2                                                       
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #026H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #0D9H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0EH ; P0EN <- data_2                                                               
MOV P3, #00H ; clear P3                                                                       
MOV P3, #026H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0D9H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #093H; data_1                                                                         
MOV P1, #0D8H; data_2                                                                         
MOV R1, #095H                                                                                 
MOV DPTR, #03F2AH                                                                             
MOV A, #093H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0D8H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0C4H ; data_1 to transmit                                                            
MOV P1, #094H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0C4H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_38: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_38                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_38: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_38                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #031H ; data_1 to transmit                                                            
MOV P1, #01FH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #031H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_39: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_39                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_39: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_39                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #092H                                                                                 
MOV P1, #0DH                                                                                  
MOV A, #092H                                                                                  
MOV B, #0DH                                                                                   
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #072H; data_1                                                                         
MOV P1, #0EH; data_2                                                                          
MOV R1, #0A9H                                                                                 
MOV DPTR, #054B1H                                                                             
MOV A, #072H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0EH                                                                                   
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #06AH ; data_1 to transmit                                                            
MOV P1, #077H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #06AH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_43: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_43                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_43: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_43                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #03EH                                                                                 
MOV P1, #0EH                                                                                  
MOV A, #03EH                                                                                  
MOV B, #0EH                                                                                   
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #04CH; data_1                                                                         
MOV P1, #010H; data_2                                                                         
MOV R1, #0CH                                                                                  
MOV DPTR, #08163H                                                                             
MOV A, #04CH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #010H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #03H; data_1                                                                          
MOV P1, #0CH; data_2                                                                          
MOV R1, #09AH                                                                                 
MOV DPTR, #086AEH                                                                             
MOV A, #03H                                                                                   
MOVX @R1, A                                                                                   
MOV A, #0CH                                                                                   
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #0BDH                                                                                 
MOV P1, #03CH                                                                                 
MOV A, #0BDH                                                                                  
MOV B, #03CH                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #04BH ; data_1 to transmit                                                            
MOV P1, #03DH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #04BH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_50: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_50                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_50: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_50                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #040H                                                                                 
MOV P1, #0E4H                                                                                 
MOV P1, #0B3H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #040H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #0E4H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0B3H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #0E4H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #040H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #0B3H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0E4H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #040H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0B3H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #0FBH; data_1                                                                         
MOV P1, #067H; data_2                                                                         
MOV R1, #027H                                                                                 
MOV DPTR, #0619FH                                                                             
MOV A, #0FBH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #067H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #084H ; data_1 to transmit                                                            
MOV P1, #0B3H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #084H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_57: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_57                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_57: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_57                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #0EBH; data_1                                                                         
MOV P1, #0CBH; data_2                                                                         
MOV R1, #070H                                                                                 
MOV DPTR, #041F3H                                                                             
MOV A, #0EBH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0CBH                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #06H                                                                                  
MOV P1, #0E8H                                                                                 
MOV A, #06H                                                                                   
MOV B, #0E8H                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #0FCH                                                                                 
MOV P1, #011H                                                                                 
MOV A, #0FCH                                                                                  
MOV B, #011H                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #05AH                                                                                 
MOV P1, #069H                                                                                 
MOV A, #05AH                                                                                  
MOV B, #069H                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #056H                                                                                 
MOV P1, #0A9H                                                                                 
MOV P1, #03EH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #056H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #0A9H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #03EH ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #0A9H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #056H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #03EH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0A9H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #056H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #03EH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #0B9H                                                                                 
MOV P1, #0C8H                                                                                 
MOV A, #0B9H                                                                                  
MOV B, #0C8H                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #08DH; data_1                                                                         
MOV P1, #0FAH; data_2                                                                         
MOV R1, #054H                                                                                 
MOV DPTR, #09E95H                                                                             
MOV A, #08DH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0FAH                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0D6H ; data_1 to transmit                                                            
MOV P1, #0BCH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0D6H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_70: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_70                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_70: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_70                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #05AH                                                                                 
MOV P1, #073H                                                                                 
MOV A, #05AH                                                                                  
MOV B, #073H                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #01H ; TIMER 0 and 1 FUNCTIONALITY AND INTERRUPT                                      
MOV IP, #008H ; Timer 1 with high priority and others with low priority                       
MOV IE, #0FAH ; All interrupts enabled, except external interrupts                            
; moving FFFFFDh to 24bits Timer 0 counter                                                    
MOV 08CH, #0FFH ; move FFh to TH0                                                             
MOV 08EH, #0FFH ; move FFh to TM0                                                             
MOV 08AH, #0FDH ; move FDh to TL0                                                             
; moving 000002h to 24bits Timer 1 counter                                                    
MOV 08DH, #000H ; move 00h to TH0                                                             
MOV 08FH, #000H ; move 00h to TM0                                                             
MOV 08BH, #002H ; move 02h to TL0                                                             
MOV TMOD, #0B0H ; timer0: mode 0 | timer1: mode 3 and controlled by external input INT1       
MOV TCON, #50H ; run timer 0 and 1 (TR0 and TR1 in TCON)                                      
NOP ; time to timer 0 overflow                                                                
NOP ; time to timer 0 overflow                                                                
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if TF1 (bit 7) and TF0 (bit 5) are cleared                              
MOV TMOD, #00H ; reset TMOD                                                                   
MOV TCON, #00H ; reset TCON                                                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #032H ; data_1 to transmit                                                            
MOV P1, #0B8H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #032H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_74: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_74                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_74: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_74                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #08FH                                                                                 
MOV P1, #04DH                                                                                 
MOV A, #08FH                                                                                  
MOV B, #04DH                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #0A5H                                                                                 
MOV P1, #085H                                                                                 
MOV A, #0A5H                                                                                  
MOV B, #085H                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #0C1H                                                                                 
MOV P1, #06AH                                                                                 
MOV A, #0C1H                                                                                  
MOV B, #06AH                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #073H                                                                                 
MOV P1, #034H                                                                                 
MOV A, #073H                                                                                  
MOV B, #034H                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0E2H ; data_1 to transmit                                                            
MOV P1, #0B8H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0E2H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_80: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_80                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_80: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_80                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #0FEH                                                                                 
MOV P1, #08DH                                                                                 
MOV P1, #083H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0FEH ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #08DH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #083H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #08DH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0FEH ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #083H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #08DH ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #0FEH ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #083H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #080H; data_1                                                                         
MOV P1, #09CH; data_2                                                                         
MOV R1, #088H                                                                                 
MOV DPTR, #033BBH                                                                             
MOV A, #080H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #09CH                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #06DH; data_1                                                                         
MOV P1, #0D5H; data_2                                                                         
MOV R1, #05CH                                                                                 
MOV DPTR, #07447H                                                                             
MOV A, #06DH                                                                                  
MOVX @R1, A                                                                                   
MOV A, #0D5H                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #063H                                                                                 
MOV P1, #097H                                                                                 
MOV P1, #075H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #063H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #097H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #075H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #097H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #063H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #075H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #097H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #063H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #075H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #084H                                                                                 
MOV P1, #02CH                                                                                 
MOV A, #084H                                                                                  
MOV B, #02CH                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E0H ; EXTERNAL RAM                                                                  
MOV P1, #016H; data_1                                                                         
MOV P1, #06DH; data_2                                                                         
MOV R1, #04CH                                                                                 
MOV DPTR, #06CC3H                                                                             
MOV A, #016H                                                                                  
MOVX @R1, A                                                                                   
MOV A, #06DH                                                                                  
MOVX @DPTR, A                                                                                 
MOVX A, @R1                                                                                   
MOV P1, A ; verify if P1 == data_1                                                            
MOVX A, @DPTR                                                                                 
MOV P1, A ; verify if P1 == data_2                                                            
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #00H                                                                                  
MOV P1, #030H                                                                                 
MOV P1, #024H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #00H ; P0EN <- data_1                                                               
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #030H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #024H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #030H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #00H ; P2EN <- data_1                                                               
MOV P2, #00H ; clear p2                                                                       
MOV P2, #024H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #030H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #00H ; verify if p3_a == data_1                                                       
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #024H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #052H ; data_1 to transmit                                                            
MOV P1, #067H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #052H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_93: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_93                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_93: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_93                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E3H ; EXTERNAL ROM BY ADDRESS                                                       
MOV P1, #0ABH                                                                                 
MOV P1, #0D5H                                                                                 
MOV A, #0ABH                                                                                  
MOV B, #0D5H                                                                                  
CALL 2000H                                                                                    
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #41H ; INTERRUPT FUNCIONALITY - External interrupts                                   
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
MOV TCON, #001H ; External int. 0: by edge | External int 1: by level                         
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
NOP ; verification must stimulate external interrupt 0                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
NOP ; verification must stimulate external interrupt 1                                        
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared                              
MOV IE, #000H ; All interrupts disabled                                                       
MOV TCON, #00H ; reset TCON                                                                   
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #027H                                                                                 
MOV P1, #065H                                                                                 
MOV P1, #060H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #027H ; P0EN <- data_1                                                              
MOV P0, #00H ; to clean p0                                                                    
MOV P0, #065H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #060H ; P1EN <- data_3                                                              
MOV P1, #00H ; clean P1                                                                       
MOV P1, #065H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #027H ; P2EN <- data_1                                                              
MOV P2, #00H ; clear p2                                                                       
MOV P2, #060H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #065H ; P0EN <- data_2                                                              
MOV P3, #00H ; clear P3                                                                       
MOV P3, #027H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #060H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0E2H ; EXTERNAL ROM BY EA                                                            
MOV P1, #0FH                                                                                  
MOV P1, #0B9H                                                                                 
MOV A, #0FH                                                                                   
MOV B, #0B9H                                                                                  
CALL 0050H                                                                                    
; active EA here - it enables external ROM access                                             
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
END                                                                                           
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
