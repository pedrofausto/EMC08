;########################DISPLAY ASSEMBLY CODE TEST ############################
;
;-----------------------------------------------------------------------------
; CI Brasil - CT2 Campinas
; Phase II Project Project
; EMC08 - 8 Bit Microcontroller for Automotive Engine Application
; -----------------------------------------------------------------------------
; File Name : rs232_async_tx_00.asm
; Module Name : RS 232 / Baud Rate
; Author : Hugo Kakisaka, Marcelo Mamoru Ono
; E-mail : diga21@emc8.br, diga20@emc08.br
; -----------------------------------------------------------------------------
; Review(s) : 05/08/2010, reviwed by Harney. First Environment version
; -----------------------------------------------------------------------------
; Release History
; Version  Date        Author Description
; 1.0      05-08-2010  Initial version
; -----------------------------------------------------------------------------
;
;
;
;
;
;
;
; TACPH 0xBB	
; TACPH	0xBA	
; ACRH	0x86 	
; ACRM	0x85	
; ACRL 	0x84	
; TCON2	0xD8

; ****************************** DEFINITIONS ***********************************


; ************************** RAM BYTE SEGMENT DEFINES **************************

P0EN        DATA      0C0H

P1EN        DATA      0C8H

P2EN        DATA      0E8H

P3EN        DATA      0F8H

TM0         DATA      08EH

TM1         DATA      08FH		

TACPH		DATA      0BBH		

TACPL		DATA      0BAH

ACRH		DATA      086H

ACRM		DATA      085H

ACRL		DATA      084H

TCON2		DATA      0D8H


; ************************** CODE SEGMENT DEFINES ******************************


SERIAL      CODE      002BH     ; Serial Interrupt Vector

TIMER2		CODE      0023H     ; Timer 2 Interrupt Vector


; ************************** RAM BIT SEGMENT DEFINES ***************************


EDGESEL		BIT       0D8H

DFSEL		BIT       0D9H

DFP0		BIT       0DAH

DFP1		BIT       0DBH

DFP2		BIT       0DCH

TR2			BIT       0DEH



SNC         BIT       078H     ; Bit 0 of <FLAG_0> Variable


; ************************ CONSTANT DEFINES ************************************


RAM_BOTTOM  equ       000H

RAM_TOP     equ       080H

EOT         equ       004H     ; End Of Transmission Character


PORT_OUT	equ	      0FFH




DELAY_MULT  equ       5



; ****************************** MAIN CODE *************************************

ORG		RESET					; RESET VECTOR

			jmp		START
			
				
				
; ****************************** INTERRUPT VECTORS *****************************


ORG		TIMER0					; TIMER 0 OVERFLOW INTERRUPT VECTOR

			jmp		TMR0_OVFL_INT
			

			
ORG		SERIAL					; SERIAL COMMUNICATION INTERRUPT VECTOR

			jmp		SERIAL_INT			



			
ORG		003BH		


; ************** TIMER 0 INTERRUPT SERVICE ROUTINE *****************************
			
TMR0_OVFL_INT:
		
              push	PSW              ; save PSW 		
		      push	ACC              ; save ACC 			
		      push	000H             ; save R0
		
		
		
		
		
		      pop	000H             ; restore R0  		
		      pop	ACC              ; restore ACC 
		      pop   PSW              ; restore PSW 
			
		      reti

; ************** SERIAL PORT INTERRUPT SERVICE ROUTINE ************************* 
              
SERIAL_INT:
		
              push	PSW              ; save PSW 		
		      push	ACC              ; save ACC 
		      push	000H             ; save R0
		      
		
		      clr   TI               ; Clear TX Interrupt Flag
		
		      clr   SNC              ; Enable Next Character To Be Sent
		      
		
		      pop	000H             ; restore R0  		
		      pop	ACC              ; restore ACC 		
		      pop   PSW              ; restore PSW 
			
		      reti					              
              					
			
; ****************************** INITIALIZATION ROUTINES *****************************************

START:

                                                         ; ------------ Clear RAM Memory
                                  
              mov     R0,A                               ; First Adress = 00H

CLEAR_RAM:        
              mov     @R0,A                              ; Clear Adressed RAM
                 
              inc     R0
        
              cjne    R0,#RAM_TOP,CLEAR_RAM              ; 127 + 1 = ram bottom 
              
		     
		      call	  PORT_CONFIG
		      
		      call    DELAY_100MS
		      
		      call    RS232_CONFIG
		
              call    TMR0_CONFIG
              
              call    INTERRUPT_CONFIG
              
       ;       call    DISPLAY_TEST

; ****************************** MAIN LOOP ROUTINE **********************************************

MAIN_LOOP:

             ;   call    SEND_MESSAGE 
                
                call    DELAY_100MS 
                 
                mov     A,#'T'
                 
                mov	    SBUF,A	                 

		        jmp		MAIN_LOOP


; ****************************** INITIALIZATION ROUTINE ******************************************

PORT_CONFIG:

    ;             mov	 P0EN,  #PORT_OUT	    ; P0 Port Output
                 
    ;             mov	 P1EN,  #PORT_OUT	    ; P1 Port Output
                 
    ;             mov	 P2EN,  #PORT_OUT	    ; P2 Port Output

                 mov	 P3EN,  #00000010B
                                ;||||||||______ P3.0     > Input
				 	   	        ;|||||||_______ P3.1     > Output				
				 	   	        ;||||||________ P3.2  	 > Input		
				 	   	        ;|||||_________ P3.3	 > Input
				 	   	        ;||||__________ P3.4     > Input      
				 	   	        ;|||___________ P3.5     > Input
				 	   	        ;||____________ P3.6     > Input									 	   				 	   
				 	   	        ;|_____________ P3.7	 > Input
				 	   	        
				 setb    P3.1 	   	        
                        				 	   		
		         ret

; ****************************** TIMER 0 CONFIGURATION 1 ROUTINE *********************************

TMR0_CONFIG:

                 mov    TMOD, 	#00000000B
                                ;||||||||______ M0T0     > TIMER 0 COUNT MODE SELECT BIT				-	UP  COUNT MODE
				 	   	        ;|||||||_______ M1T0     > TIMER 0 COUNT MODE SELECT BIT				
				 	   	        ;||||||________ -    	 > RESERVED 		
				 	   	        ;|||||_________ GATE T0	 > TIMER 0 EXTERNAL COUNT MODE SELECT BIT       -	INTERNAL COUNT MODE
				 	   	        ;||||__________ M0T1     > TIMER 1 COUNT MODE SELECT BIT      
				 	   	        ;|||___________ M1T1     > TIMER 1 COUNT MODE SELECT BIT                -	UP  COUNT MODE
				 	   	        ;||____________ -    	 > RESERVED									 	   				 	   
				 	   	        ;|_____________ GATE T1	 > TIMER 1 EXTERNAL COUNT MODE SELECT BIT       -	INTERNAL COUNT MODE

                 ret
                 
                 
; ********************* RS232 CONFIGURATION ROUTINE *********************************

; Configure asynchronous mode 9 bit data (MODE 2)

; Baud rate = 115200 bps

RS232_CONFIG:

                mov    PCON, 	#00000100B
                                ;||||||||______ -      >
				 	   	        ;|||||||_______ -      >				
				 	   	        ;||||||________ BPS    > STANDARD BAUD RATE SELECTOR BIT 		
				 	   	        ;|||||_________ -      > 9TH BIT TX
				 	   	        ;||||__________ -      > RX ENABLE    
				 	   	        ;|||___________ -      > MODE
				 	   	        ;||____________ -      > MODE								 	   				 	   
				 	   	        ;|_____________ SMOD   > DOUBLE BIT RATE MODE
         

                 mov    SCON, 	#11100000B
                                ;||||||||______ RI     > RS232 RECEPTION INTERRUPT FLAG
				 	   	        ;|||||||_______ TI     > RS232 TRANSMISSION INTERRUPT FLAG				
				 	   	        ;||||||________ RB8    > 9TH BIT RX 		
				 	   	        ;|||||_________ TB8    > 9TH BIT TX
				 	   	        ;||||__________ REN    > RX ENABLE    
				 	   	        ;|||___________ SM2    > MODE
				 	   	        ;||____________ SM1    > MODE								 	   				 	   
				 	   	        ;|_____________ SM0    > MODE

                 ret                  



; ********************* INTERRUPT CONFIGURATION ROUTINE *********************************

; Configure serial port interrupt 

INTERRUPT_CONFIG:

                 mov    IE, 	#10010000B
                                ;||||||||______ EX0    > EXTERNAL INTERRUPT 0 ENABLE BIT
				 	   	        ;|||||||_______ ET0    > TIMER 0 INTERRUPT ENABLE BIT			
				 	   	        ;||||||________ EX1    > EXTERNAL INTERRUPT 1 ENABLE BIT		
				 	   	        ;|||||_________ ET1    > TIMER 1 INTERRUPT ENABLE BIT
				 	   	        ;||||__________ ES     > SERIAL PORT INTERRUPT ENABLE BIT    
				 	   	        ;|||___________ ET2    > TIMER 2 INTERRUPT ENABLE BIT
				 	   	        ;||____________ ETXRX  > TRANSCEIVER INTERRUPT ENABLE BIT								 	   				 	   
				 	   	        ;|_____________ EA     > ENABLE ALL INTERRUPT BIT

                 ret                  

                                                                                   

; ****************************** 100 ms DELAY ROUTINE *********************************

; 20 CM DELAY ROUTINE

; f = 10 MHz => T= 100 ns

; 1CM = 2 clock cycle = 200 ns

; counts = 100 ms / 200 ns = 500.000 = F85DEF

DELAY_100MS:

; 2cm call
; 1cm clr
; 1cm mov
; 1cm mov
; 1cm mov
; 1cm setb
; 2cm jnb
; 2cm ret 

; total = 11 cm

                 clr	TR0                 ; Disable Counting
					
		
		         mov	TL0,	#223	    ; Reload Counter 
		
                 mov	TM0,	#94		
		
		         mov	TH0,	#248
		
		         clr    TF0                 ; Clear Overflow Flag 
			
		         setb	TR0					; Enable Counting	 	   	

TEST_OVERFLOW:
        
                 jnb    TF0,TEST_OVERFLOW   ; Overflow ?

		         ret                        ; Yes, return




; ****************************** 1000 ms DELAY ROUTINE *************************


DELAY_1000MS:

                mov     R1,#DELAY_MULT

 REPEAT:               
                call    DELAY_100MS                  
   
                djnz    R1,REPEAT

                ret                        ; Yes, return
		         
		         
; ****************************** DELAY ROUTINE *********************************

; 40 CM DELAY ROUTINE

; 2cm call
; 1cm clr
; 1cm mov
; 1cm mov
; 1cm mov
; 1cm setb
; 2cm jnb
; 2cm ret 

; total = 11 cm

DELAY_T1:



                 clr	TR1                 ; Disable Counting
					
		
		         mov	TL1,	#226	    ; Reload Counter 
		
                 mov	TM1,	#255		
		
		         mov	TH1,	#255
		
		         clr    TF1                 ; Clear Overflow Flag 
			
		         setb	TR1					; Enable Counting	 	   	

TEST_OVERFLOW1:
        
                 jnb    TF1,TEST_OVERFLOW1   ; Overflow ?

		         ret                        ; Yes, return

                 
; ****************************** SEND MESSAGE ROUTINE **************************

; This routine send the message stored on table .


SEND_MESSAGE:

                 jb      SNC,SEND_MESSAGE_END ; Execute Routine ?
                 
                 
                 setb    SNC                 ; Yes, disable till next interrupt
                             
                                                                                                 
                 mov     DPTR,#MESSAGE       ; Load Adress Look Up Table                        
                 
                 mov     A,R2                ; Table Index
                 
                 movc    A,@A+DPTR           ; Read Data From Table

                 cjne    A,#EOT,SEND         ; End Of Transmission Character ?
                 
                 clr     A                   ; Yes
                 
                 mov     R2,A                ; Set Data Pointer To Start Of Table
                 
                 jmp     SEND_MESSAGE_END    
                          
SEND:
                 mov	 SBUF,A	             ; No, Load Data To be Sent 
                                  
                 inc     R2                  ; Set Data Pointer To Next Character
                                  
SEND_MESSAGE_END:                        				 	   		
		         ret                 		         
		         

; ****************************** MESSAGE DATA TABLE ****************************

; This table stores message to be sent to computer over RS232 protocol
 
ORG		0300H                              

MESSAGE:

DB  	'* DIGITAL A Team * - EMC08 Microcontroller Demonstration > Serial Communication Test : MODE 2 => Asynchronous 9 bit '
DB  	'Firmware Version : 1.0, Coder : Lizbeth Paredes,19/11/2010, THANKS =) <END OF TRANSMISSION>',EOT                                                                    


		
END
