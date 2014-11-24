;########################TIMER 2 ASSEMBLY CODE TEST ############################
;
;-----------------------------------------------------------------------------
; CI Brasil - CT2 Campinas
; Phase II Project Project
; EMC08 - 8 Bit Microcontroller for Automotive Engine Application
; -----------------------------------------------------------------------------
; File Name : tmr2_test1.asm
; Module Name : Timer 0
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

; ****************************** DEFINITIONS ******************************************************


PORT_CFG	equ	0FDH

P1_BIT0     equ 090H

SWITCH      equ 091H

P1_BIT2     equ 092H

P1EN        equ 0C8H

TM0         equ 08EH

TM1         equ 08FH		

TACPH		equ	0BBH		

TACPL		equ	0BAH

ACRH		equ	086H

ACRM		equ	085H

ACRL		equ	084H

TCON2		equ	0D8H

TIMER2		equ	0023H

EDGESEL		equ	0D8H

DFSEL		equ	0D9H

DFP0		equ	0DAH

DFP1		equ	0DBH

DFP2		equ	0DCH

TR2			equ	0DEH

RAM_BOTTOM  equ 000H

RAM_TOP     equ 080H

DBNC_CNT    equ 29


; ****************************** MAIN CODE *******************************************************

ORG		RESET					; RESET VECTOR

			jmp		START
			
				
				
; ****************************** INTERRUPT ROUTINES **********************************************


ORG		TIMER0					; TIMER 0 OVERFLOW INTERRUPT VECTOR

			jmp		TMR0_OVFL_INT
			
			
			



			
ORG		003BH		

			
TMR0_OVFL_INT:
		
              push	PSW              ; save PSW 
		
		      push	ACC              ; save ACC 
			
		      push	000H             ; save R0
		
		
		
		
		
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
        
              cjne    R0,#RAM_TOP,CLEAR_RAM              
		     


		      call	  PORT_CONFIG
		
              call    TMR0_CFG_01

; ****************************** MAIN LOOP ROUTINE **********************************************

MAIN_LOOP:
                call    CHECK_SWITCH 
                
		        jmp		MAIN_LOOP


; ************************* PORT CONFIGURATION ROUTINE ******************************************

PORT_CONFIG:

                 mov	P1EN,#PORT_CFG	; P1 Port Configuration Bits
                                ;||||||||______ OUTPUT   > 
				 	   	        ;|||||||_______ INPUT    > 	PULL UP ENABLED			
				 	   	        ;||||||________ OUTPUT	 >		
				 	   	        ;|||||_________ OUTPUT	 >
				 	   	        ;||||__________ OUTPUT   >   
				 	   	        ;|||___________ OUTPUT   >
				 	   	        ;||____________ OUTPUT	 >								 	   				 	   
				 	   	        ;|_____________ OUTPUT	 > 
				 	   	        
				 	   	        
				 clr     P1_BIT2		    ; Clear Pin P1.2	   	        
                 				 	   		
		         ret

; ****************************** TIMER 0 CONFIGURATION 1 ROUTINE *********************************

TMR0_CFG_01:

                 mov    TMOD, 	#00110000B
                                ;||||||||______ M0T0     > TIMER 0 COUNT MODE SELECT BIT				-	DOWN  COUNT MODE
				 	   	        ;|||||||_______ M1T0     > TIMER 0 COUNT MODE SELECT BIT				
				 	   	        ;||||||________ -    	 > RESERVED 		
				 	   	        ;|||||_________ GATE T0	 > TIMER 0 EXTERNAL COUNT MODE SELECT BIT       -	INTERNAL COUNT MODE
				 	   	        ;||||__________ M0T1     > TIMER 1 COUNT MODE SELECT BIT      
				 	   	        ;|||___________ M1T1     > TIMER 1 COUNT MODE SELECT BIT                -	UP  COUNT MODE
				 	   	        ;||____________ -    	 > RESERVED									 	   				 	   
				 	   	        ;|_____________ GATE T1	 > TIMER 1 EXTERNAL COUNT MODE SELECT BIT       -	INTERNAL COUNT MODE

                 ret                                                                  

; ****************************** DEBOUNCE ROUTINE ******************************



DEBOUNCE:

; 2cm call
; 1cm clr
; 1cm mov
; 1cm mov
; 1cm mov
; 1cm setb
; 2cm jnb
; 2cm ret 

; total = 11 + DEBOUNCE COUNTER CM

                 clr	TR0                 ; Disable Counting
					
		
		         mov	TL0,	#DBNC_CNT   ; Reload Counter 
		
                 mov	TM0,	#0		
		
		         mov	TH0,	#0
		
		         clr    TF0                 ; Clear Overflow Flag 
			
		         setb	TR0					; Enable Counting	 	   	

TEST_OVERFLOW:
        
                 jnb    TF0,TEST_OVERFLOW   ; Overflow ?

		         ret                        ; Yes, return
		         
		         
; ****************************** CHECK SWITCH ROUTINE **************************



CHECK_SWITCH:


                 jb     SWITCH,CHECK_SWITCH_ESC   ; Switch Pressed ?
							
		         call   DEBOUNCE                  ; Yes, debounce
		
                 jb     SWITCH,CHECK_SWITCH_ESC   ; Switch Remains Pressed ?		
				        			
		         setb   P1_BIT2		              ; Set Pin P1.2 (CHECK HERE)	 	   	
        
                
CHECK_SWITCH_ESC:                                 ; Escape Routine
		         ret                                       
		         
		
		
END
