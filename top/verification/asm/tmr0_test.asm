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


PORT_OUT	equ	0FFH

P1_BIT0     equ 090H

SEL_INPUT   equ 091H

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
        
              cjne    R0,#RAM_TOP,CLEAR_RAM              ; 127 + 1 = ram bottom 
		     


		      call	  PORT_CONFIG
		
              call    TMR0_CFG_01

; ****************************** MAIN LOOP ROUTINE **********************************************

MAIN_LOOP:

                setb     P1_BIT0            ; Set Pin P1.0
                        
                call     DELAY_T0           ; Delay 20 C
                
                call     DELAY_T1           ; Delay 40 C
                   
                clr	     P1_BIT0		    ; Clear Pin P1.0
                
                call     DELAY_T0
                
                call     DELAY_T1           

		        jmp		 MAIN_LOOP


; ****************************** INITIALIZATION ROUTINE ******************************************

PORT_CONFIG:

                 mov	P1EN,#PORT_OUT	; P1 Port Output
                 
				 	   		
		         ret

; ****************************** TIMER 0 CONFIGURATION 1 ROUTINE *********************************

TMR0_CFG_01:

                 mov    TMOD, 	#00110011B
                                ;||||||||______ M0T0     > TIMER 0 COUNT MODE SELECT BIT				-	UP  COUNT MODE
				 	   	        ;|||||||_______ M1T0     > TIMER 0 COUNT MODE SELECT BIT				
				 	   	        ;||||||________ -    	 > RESERVED 		
				 	   	        ;|||||_________ GATE T0	 > TIMER 0 EXTERNAL COUNT MODE SELECT BIT       -	INTERNAL COUNT MODE
				 	   	        ;||||__________ M0T1     > TIMER 1 COUNT MODE SELECT BIT      
				 	   	        ;|||___________ M1T1     > TIMER 1 COUNT MODE SELECT BIT                -	UP  COUNT MODE
				 	   	        ;||____________ -    	 > RESERVED									 	   				 	   
				 	   	        ;|_____________ GATE T1	 > TIMER 1 EXTERNAL COUNT MODE SELECT BIT       -	INTERNAL COUNT MODE

                 ret                                                                  

; ****************************** DELAY ROUTINE *********************************

; 20 CM DELAY ROUTINE

DELAY_T0:

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
					
		
		         mov	TL0,	#246	    ; Reload Counter 
		
                 mov	TM0,	#255		
		
		         mov	TH0,	#255
		
		         clr    TF0                 ; Clear Overflow Flag 
			
		         setb	TR0					; Enable Counting	 	   	

TEST_OVERFLOW:
        
                 jnb    TF0,TEST_OVERFLOW   ; Overflow ?

		         ret                        ; Yes, return
		         
		         
; ****************************** DELAY ROUTINE *********************************

; 40 CM DELAY ROUTINE

DELAY_T1:

; 2cm call
; 1cm clr
; 1cm mov
; 1cm mov
; 1cm mov
; 1cm setb
; 2cm jnb
; 2cm ret 

; total = 11 cm

                 clr	TR1                 ; Disable Counting
					
		
		         mov	TL1,	#226	    ; Reload Counter 
		
                 mov	TM1,	#255		
		
		         mov	TH1,	#255
		
		         clr    TF1                 ; Clear Overflow Flag 
			
		         setb	TR1					; Enable Counting	 	   	

TEST_OVERFLOW1:
        
                 jnb    TF1,TEST_OVERFLOW1   ; Overflow ?

		         ret                        ; Yes, return		         
		         
		
		
END
