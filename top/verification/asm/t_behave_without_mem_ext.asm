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
MOV P1, #0F0H ; P1 random, time to interrupt to be processed                                  
MOV P1, #0FEH ; inform JMP BACK from TF1 OK (verify it)                                       
MOV P1, #0F0H ; P1 random                                                                     
RETI                                                                                          
LABEL_RI_TI:                                                                                  
MOV P1, #0FFH ; inform Interrupt OK (verify it)                                               
CPL 00h ; set a bit in RAM to go out loop in program                                          
MOV SCON, #090H ; clear serial flags                                                          
RETI                                                                                          
INITIAL: MOV 0C8H, #0FFH ; Setting P1EN - output                                              
MOV PCON, #080H ; SMOD = 1                                                                    
MOV SCON, #080H ; Serial mode 2, and RI TI flags cleared                                      





MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #0BDH                                                                                 
MOV P1, #03CH                                                                                 
MOV P1, #0BBH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0BDH ; P0EN <- data_1                                                              
MOV P0, #03CH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0BBH ; P1EN <- data_3                                                              
MOV P1, #03CH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0BDH ; P2EN <- data_1                                                              
MOV P2, #0BBH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #03CH ; P0EN <- data_2                                                              
MOV P3, #0BDH ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0BBH ; verify if p4_a == data_3                                                    
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
MOV P1, #0C5H ; data_1 to transmit                                                            
MOV P1, #034H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0C5H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_4: NOP ; loop until end of transmition                                               
JNB 00h, LABEL_TI_4                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_4: NOP ; loop until end of reception                                                 
JB 00h, LABEL_RI_4                                                                            
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
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
MOV P1, #06CH ; data_1 to transmit                                                            
MOV P1, #0A7H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #06CH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_10: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_10                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_10: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_10                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0EFH ; data_1 to transmit                                                            
MOV P1, #075H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0EFH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_18: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_18                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_18: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_18                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #05H                                                                                  
MOV P1, #0ECH                                                                                 
MOV P1, #0A7H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #05H ; P0EN <- data_1                                                               
MOV P0, #0ECH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0A7H ; P1EN <- data_3                                                              
MOV P1, #0ECH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #05H ; P2EN <- data_1                                                               
MOV P2, #0A7H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0ECH ; P0EN <- data_2                                                              
MOV P3, #05H ; verify if p3_a == data_1                                                       
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0A7H ; verify if p4_a == data_3                                                    
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
MOV P1, #0ABH ; data_1 to transmit                                                            
MOV P1, #0B6H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0ABH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_24: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_24                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_24: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_24                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #06H ; data_1 to transmit                                                             
MOV P1, #06BH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #06H ; start transmition.                                                           
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_27: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_27                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_27: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_27                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #073H                                                                                 
MOV P1, #03AH                                                                                 
MOV P1, #0CDH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #073H ; P0EN <- data_1                                                              
MOV P0, #03AH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0CDH ; P1EN <- data_3                                                              
MOV P1, #03AH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #073H ; P2EN <- data_1                                                              
MOV P2, #0CDH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #03AH ; P0EN <- data_2                                                              
MOV P3, #073H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0CDH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
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
MOV P1, #0F0H                                                                                 
MOV P1, #05AH                                                                                 
MOV P1, #069H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0F0H ; P0EN <- data_1                                                              
MOV P0, #05AH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #069H ; P1EN <- data_3                                                              
MOV P1, #05AH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0F0H ; P2EN <- data_1                                                              
MOV P2, #069H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #05AH ; P0EN <- data_2                                                              
MOV P3, #0F0H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #069H ; verify if p4_a == data_3                                                    
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #05AH                                                                                 
MOV P1, #0F8H                                                                                 
MOV P1, #058H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #05AH ; P0EN <- data_1                                                              
MOV P0, #0F8H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #058H ; P1EN <- data_3                                                              
MOV P1, #0F8H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #05AH ; P2EN <- data_1                                                              
MOV P2, #058H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0F8H ; P0EN <- data_2                                                              
MOV P3, #05AH ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #058H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #038H ; data_1 to transmit                                                            
MOV P1, #020H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #038H ; start transmition.                                                          
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
MOV P1, #0EBH ; data_1 to transmit                                                            
MOV P1, #0C5H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0EBH ; start transmition.                                                          
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0ACH ; data_1 to transmit                                                            
MOV P1, #07AH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0ACH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_40: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_40                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_40: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_40                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #019H                                                                                 
MOV P1, #07DH                                                                                 
MOV P1, #031H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #019H ; P0EN <- data_1                                                              
MOV P0, #07DH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #031H ; P1EN <- data_3                                                              
MOV P1, #07DH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #019H ; P2EN <- data_1                                                              
MOV P2, #031H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #07DH ; P0EN <- data_2                                                              
MOV P3, #019H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #031H ; verify if p4_a == data_3                                                    
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #023H                                                                                 
MOV P1, #063H                                                                                 
MOV P1, #0ECH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #023H ; P0EN <- data_1                                                              
MOV P0, #063H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0ECH ; P1EN <- data_3                                                              
MOV P1, #063H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #023H ; P2EN <- data_1                                                              
MOV P2, #0ECH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #063H ; P0EN <- data_2                                                              
MOV P3, #023H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0ECH ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #058H ; data_1 to transmit                                                            
MOV P1, #0EFH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #058H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_45: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_45                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_45: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_45                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #0E0H                                                                                 
MOV P1, #05AH                                                                                 
MOV P1, #073H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0E0H ; P0EN <- data_1                                                              
MOV P0, #05AH ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #073H ; P1EN <- data_3                                                              
MOV P1, #05AH ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0E0H ; P2EN <- data_1                                                              
MOV P2, #073H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #05AH ; P0EN <- data_2                                                              
MOV P3, #0E0H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #073H ; verify if p4_a == data_3                                                    
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
MOV P1, #0CH ; data_1 to transmit                                                             
MOV P1, #057H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0CH ; start transmition.                                                           
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_55: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_55                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_55: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_55                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #0A1H ; PORTS FUNCTIONALITY                                                           
MOV P1, #032H                                                                                 
MOV P1, #0B8H                                                                                 
MOV P1, #0B8H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #032H ; P0EN <- data_1                                                              
MOV P0, #0B8H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0B8H ; P1EN <- data_3                                                              
MOV P1, #0B8H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #032H ; P2EN <- data_1                                                              
MOV P2, #0B8H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0B8H ; P0EN <- data_2                                                              
MOV P3, #032H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0B8H ; verify if p4_a == data_3                                                    
MOV 0C8H, #0FFH ; Setting P1EN - output                                                       
NOP ; synchronization                                                                         
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0EBH ; data_1 to transmit                                                            
MOV P1, #0CCH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0EBH ; start transmition.                                                          
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #078H ; data_1 to transmit                                                            
MOV P1, #08FH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #078H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_58: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_58                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_58: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_58                                                                           
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
MOV P1, #0FAH                                                                                 
MOV P1, #049H                                                                                 
MOV P1, #0CCH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0FAH ; P0EN <- data_1                                                              
MOV P0, #049H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #0CCH ; P1EN <- data_3                                                              
MOV P1, #049H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0FAH ; P2EN <- data_1                                                              
MOV P2, #0CCH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #049H ; P0EN <- data_2                                                              
MOV P3, #0FAH ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #0CCH ; verify if p4_a == data_3                                                    
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0AAH ; data_1 to transmit                                                            
MOV P1, #035H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0AAH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_63: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_63                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_63: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_63                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #07CH ; data_1 to transmit                                                            
MOV P1, #0C1H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #07CH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_64: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_64                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_64: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_64                                                                           
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
MOV P1, #046H                                                                                 
MOV P1, #0B7H                                                                                 
MOV P1, #048H                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #046H ; P0EN <- data_1                                                              
MOV P0, #0B7H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #048H ; P1EN <- data_3                                                              
MOV P1, #0B7H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #046H ; P2EN <- data_1                                                              
MOV P2, #048H ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #0B7H ; P0EN <- data_2                                                              
MOV P3, #046H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #048H ; verify if p4_a == data_3                                                    
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #083H ; data_1 to transmit                                                            
MOV P1, #0A8H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #083H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_71: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_71                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_71: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_71                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #21H ; INTERRUPT FUNCIONALITY - TXRX                                                  
MOV IP, #000H ; All interrupts with low priority                                              
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 0DFH ; set interrupt flag(TXRX)                                                          
NOP ; time for interrupt to be processed                                                      
MOV P1, #0FEH ; inform JMP BACK OK (verify it)                                                
MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared                                         
MOV IE, #000H ; All interrupts disabled                                                       
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0BBH ; data_1 to transmit                                                            
MOV P1, #06EH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0BBH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_79: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_79                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_79: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_79                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
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
MOV P1, #0ABH ; data_1 to transmit                                                            
MOV P1, #080H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0ABH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_81: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_81                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_81: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_81                                                                           
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
MOV P1, #0A9H                                                                                 
MOV P1, #084H                                                                                 
MOV P1, #02CH                                                                                 
; PORT 0 VERIFICATION                                                                         
MOV 0C0H, #0A9H ; P0EN <- data_1                                                              
MOV P0, #084H ; verify if p0_a == data_2                                                      
; verification: stimulate p0_y <- data_3                                                      
; PORT 1 VERIFICATION                                                                         
MOV 0C8H, #02CH ; P1EN <- data_3                                                              
MOV P1, #084H ; verify if p1_a == data_2                                                      
; verification: stimulate p1_y <- data_1                                                      
; verify if P1 is a merge of data_1 and data_2, controled by data_3                           
; PORT 2 VERIFICATION                                                                         
MOV 0E8H, #0A9H ; P2EN <- data_1                                                              
MOV P2, #02CH ; verify if p2_a == data_3                                                      
; verification: stimulate p2_y <- data_2                                                      
; PORT 3 VERIFICATION                                                                         
MOV 0F8H, #084H ; P0EN <- data_2                                                              
MOV P3, #0A9H ; verify if p3_a == data_1                                                      
; verification: stimulate p3_y <- data_3                                                      
; PORT 4 VERIFICATION                                                                         
MOV 0AFH, #02CH ; verify if p4_a == data_3                                                    
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
MOV P1, #042H ; data_1 to transmit                                                            
MOV P1, #04CH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #042H ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_89: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_89                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_89: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_89                                                                           
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #0F5H ; data_1 to transmit                                                            
MOV P1, #0C2H ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #0F5H ; start transmition.                                                          
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
MOV P1, #81H ; SERIAL FUNCTIONALITY AND INTERRUPT                                             
MOV P1, #09FH ; data_1 to transmit                                                            
MOV P1, #08AH ; data_2 to receive                                                             
MOV IE, #0FFH ; All interrupts enabled                                                        
SETB 09CH ; REN active                                                                        
CLR 00h ; clear a bit in RAM                                                                  
MOV SBUF, #09FH ; start transmition.                                                          
; during transmition, verification must stimulate reception, with a start bit and then data_2 
LABEL_TI_99: NOP ; loop until end of transmition                                              
JNB 00h, LABEL_TI_99                                                                          
MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited                              
LABEL_RI_99: NOP ; loop until end of reception                                                
JB 00h, LABEL_RI_99                                                                           
MOV P1, #0FEH ; inform JMP BACK OK (RI)                                                       
MOV P1, SBUF ; check if SBUF == data_2                                                        
MOV SCON, #080H ; clear flags and disable REN                                                 
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
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
END                                                                                           
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
                                                                                              
