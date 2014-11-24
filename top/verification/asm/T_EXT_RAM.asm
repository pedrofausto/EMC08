ORG 0000
	JMP START
	
; =========================================================================	
;							BEGIN MAIN PROGRAM 
; _________________________________________________________________________


START:	CALL INITIAL 	;Initialize the Accumulator
		CALL WRITE_RAM	;writes in dprt the acc value
		CALL READ_RAM	;reads from ram the dptr value (acc)
		JMP  START		;repeat

; _________________________________________________________________________		
;							END MAIN PROGRAM 	
;==========================================================================


	INITIAL:	MOV A, #00H 		;INITIALIZE THE ACC
				MOV DPL, #00H	;INITIALIZE DPL
				MOV DPH, #00H	;INITIALIZE DPH
				RET

	WRITE_RAM:	MOVX @DPTR, A
				INC A
				INC DPL
				CJNE A, #50H, WRITE_RAM
				RET

	READ_RAM:   CALL INITIAL
	LOOPING:	MOVX A, @DPTR
				INC DPL
				MOV R0, DPL
				CJNE R0, #50H, LOOPING
				RET
				
END