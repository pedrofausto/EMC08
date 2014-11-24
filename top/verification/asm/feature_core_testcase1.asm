; inst NOP --
START: CALL CONFIG_P1_OUT
       MOV P1, #00000000B	; Condition to sync
       NOP

; inst MOVC_A_ATPC --      ; PC esta em 6
       MOV P1, #083H            ; Condition to sync
       MOV P1, #001H            
       MOV  A, #001H            ; PC 
       MOVC A, @A+PC       ; Check A+PC = 01h + 09h = 0Ah
       MOV P1, A               
       MOV P1, 00AH             ; Check A = P1

; inst INC_D --       
       MOV P1, #005H            ; Condition to sync 
       MOV P1, #9
       MOV A, #9
       INC A
       MOV P1, A               ; check operand + 1 - 5 cycles
       

; inst JBC  --
       MOV P1, #010H            ; Condition to sync
       MOV P1, #023H
       MOV P1, #004H
       MOV P1, #01AH
             
       MOV 023H, #004H       
       JBC 01AH, LOCAL1
TURN1: MOV P1, A             ;check A em P1 - 10 cycles
       

; inst DEC_ATR0 --
       MOV P1, #016H            ; Condition to sync
       MOV P1, #023H
       MOV P1, #001H
       
       MOV  R0, #023H
       MOV 023H, #001H       
       DEC @R0
       MOV P1, @R0            ; check (operand2 - 1) -> 7 cycles
       
       
; inst JB --
       MOV P1, #020H            ; Condition to sync
       MOV P1, #023H
       MOV P1, #004H
       MOV P1, #01AH
       
       MOV 023H, #004H       
       JB  01AH, LOCAL2
TURN2: MOV P1, A             ;check A em P1 - 10 cycles
       

; inst ADD_A_DATA -- 
       MOV P1, #024H            ; Condition to sync
       MOV P1, #001H
       MOV P1, #003H
       
       MOV A, #001H
       ADD A, #003H
       MOV P1, A              ;check A (operand2 + operand3) em P1 - 6 cycles
       

; inst ORL_A_D --
       MOV P1, #045H            ; Condition to sync
       MOV P1, #000H
       MOV P1, #001H
       MOV P1, #023H
       
       MOV A, #000H
       MOV 023H, #001H
       ORL A, 023H
       MOV P1, A              ;check A em P1 - 8 cycles -  operand2 or operand3
       
       
; inst ANL_D_DATA --
       MOV P1, #053H            ; Condition to sync
       MOV P1, #023H
       MOV P1, #001H
       MOV P1, #000H
       
       MOV 023H, #001H
       ANL 023H, #000H
       MOV P1, 023H            ;check P1 - 7 cycles -  operand3 and operand4
       

; inst DIV_A_B --
       MOV P1, #084H            ; Condition to sync
       MOV P1, #020
       MOV P1, #020
       
       MOV A, #020H
       MOV B, #020H
       DIV AB
       MOV P1, A               ; check A = quociente - 8 cycles
       MOV P1, B               ; check B = rest - 1 cycle
       
; inst SUBB_A_DATA --
       MOV P1, #094H            ; Condition to sync
       MOV P1, #00AH
       MOV P1, #001H
       
       MOV A, #00AH
       SUBB A, #001H
       MOV P1, A               ;Check P1 - 6 cycles - operand2 - operand3
       
       
; inst MUL_A_B --
       MOV P1, #0A4H            ; Condition to sync
       MOV P1, #001H
       MOV P1, #008H
       
       MOV A, #001H
       MOV B, #008H
       MUL AB
       MOV P1, A              ; Check A = lsb - 8 cycles
       MOV P1, B              ; Check B = msb - 1 cycles
       
       
; inst PUSH --
       MOV P1, #C0H            ; Condition to sync
       MOV P1, #23H
       MOV P1, #0AH
       
       MOV 023H, #0AH
       PUSH 023H
       MOV P1, SP             ; check SP - 6 cycles - tem que ser 9
       MOV P1, 008H          ; check first data in SP pointer - 1 cycle
       
; inst POP --
       MOV P1, #0D0H            ; Condition to sync
       MOV P1, #023H
       
       MOV P1, SP             ; get actual SP
       POP 023H       
       MOV P1, SP             ; Check SP - 5 cycles - SP anterior - 1
       MOV R0, SP
       MOV P1, @R0            ; get actual value 
       MOV P1, 023H            ; compare values - 8 cycles
       
       
; inst SWAP_A --
       MOV P1, #0C4H            ; Condition to sync
       MOV P1, #001H
       
       MOV A, #001H
       SWAP A
       MOV P1, A               ; check A - 5 cycle - change nibble bits - 10H

; inst ADDC_A_DATA --
       MOV P1, #034H            ; Condition to sync
       MOV P1, #001H
       MOV P1, #002H
       
       MOV  A, #001H
       ADDC A, #002H 
       MOV P1, A               ; check A - 6 cycles
       
; inst JNC
       MOV P1, #050H            ; Condition to sync
       MOV P1, C               ; Jump if carry is zero.
       JNC LOCAL3
TURN3: MOV P1, A                ; Check A - 7 cycles 

; inst XRL_A_R0 --
       MOV P1, #068H            ; Condition to sync
       MOV P1, #001H
       MOV P1, #000H
       
       MOV  A, #001H
       MOV R0, #000H 
       XRL  A, R0             ; A or R0
       MOV  P1, A             ; Check A - 7 cycles

; inst MOV_D_D --
       MOV P1, #085H           ; Condition to sync
       MOV P1, #023H
       MOV P1, #001H
       MOV P1, #024H
       
       MOV 023H, #001H
       MOV 024H, 023H        ; 24h must have 01h
       MOV P1, 024H            ; Check in 7 cycles

; inst MOV_R0_D -- 
       MOV P1, #0A8H           ; Condition to sync
       MOV P1, #023H
       MOV P1, #001H
       
       MOV 023H, #001H
       MOV R0, 23H           ; R0 must have 01h
       MOV P1, R0             ; Check in 6 cycles

; inst CPL_BIT -- 
       MOV P1, #0B2H           ; Condition to sync
       MOV P1, #023H
       MOV P1, #001H
       MOV P1, #01FH
       
       MOV 023H, #001H
       CPL 01F                    ; 1F must change to 1'b1 and 23h change to 81h
       MOV P1, 023H           ; Check in 6 cycles

; inst XCH_A_ATR1 --
       MOV P1, #C7H          ; Condition to sync
       MOV P1, #01H
       MOV P1, #23H
       MOV P1, #00H
       
       MOV  A, #001H
       MOV R1, #023H
       MOV 023H, #000H
       XCH  A, @R1           ; A = 00h, @R1 = 01h
       MOV P1, A             ; Check in 9 cycles - A with previous value of @R1
       MOV P1, @R1           ; Check in 10 cycles - @R1 with previous value of A  
       
; inst XCHD_A_ATR0 --
       MOV P1, #0D6H          ; Condition to sync
       MOV P1, #001H
       MOV P1, #023H
       MOV P1, #000H
       
       MOV  A, #001H
       MOV R0, #023H
       MOV 023H, #000H
       XCHD  A, @R0         ; A [3:0] = 0h, @R1[3:0] = 1h
       MOV P1, A                ; Check in 9 cycles
       MOV P1, @R0           ; Check in 10 cycles
       
; inst DJNZ_D --
       MOV P1, #0D6H          ; Condition to sync
       MOV P1, #023H
       MOV P1, #002H
       
       MOV 23H, #002H
       DJNZ  023H, LOCAL4     ; 02h - 01h => branch to LOCAL4
TURN4: MOV P1, 023H           ; Check in 10 cycles - P1 must have 01h

; inst MOV_DPTR_DATA --
       MOV P1, #090H          ; Condition to sync
       MOV P1, #023H
       MOV P1, #022H
       
       MOV DPTR, #2322H
       MOV P1, 082H           ; Check in 5 cycles - P1 must have 22h
       MOV P1, 083H           ; Check in 6 cycles - P1 must have 23h
                                              
;=======================================

		CONFIG_P0_OUT:	MOV P1EN, #11111111B	; Configures port0 as output
		RET

                LOCAL1:MOV A, #01H
                JMP TURN1       

                LOCAL2:MOV A, #02H
                JMP TURN2
                
                LOCAL3:MOV A, #03H
                JMP TURN3
                
                LOCAL4:MOV A, #04H
                JMP TURN4
;=======================================
END
