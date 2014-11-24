         LJMP 003B

@0003h:  CLR TI
         MOV A, P1
         MOV SBUF, A
         RETI

@003B:   SETB SM0
         SETB EA
         SETB ES
         MOV A, P1
         MOV SBUF, A
@0045:   LJMP 0045