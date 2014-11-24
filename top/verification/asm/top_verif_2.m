%% main 
function top_verif_2()
    clear
    clc
    
    num_sequences = 100;

    ind = '1';
	jmp_flag = 0;
    sequences = gen_sequence(ind);
    rand_sequences(1,:) = sequences(2,:)

    for i = 2:num_sequences
        sequences = gen_sequence(num2str(i));
		num_seq = round(random('unif', 4, size(sequences, 1)));
		rand_sequences(i,:) = sequences(num_seq,:);
    end
	
	size(sequences, 1)
    rand_sequences(num_sequences+1,:) = sequences(3,:)

    str_sequences = char(rand_sequences');

    fid = fopen('t_behave.asm','w+');
    for i = 1:length(str_sequences)
       % if (strcmp(str_sequences(i,:), 'nnn'))
           fprintf(fid, '%s \n', str_sequences(i,:));
        %end
    end
    fclose(fid);

end

%% sequences
function sequences = gen_sequence(ind)

    s=0;   
    seq(1:40) = cellstr('');
    s=s+1;
    sequences(s,:) = seq;

%% begin
    i=0;
	data_1 = rand_hex8b; 
	
    i=i+1; seq(i) = cellstr(['ORG 0000H ; First ADDR']);
    i=i+1; seq(i) = cellstr(['JMP INITIAL']);
	% Interrupt IE0
	i=i+1; seq(i) = cellstr(['ORG 0003H ; Interrupt IE0']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['RETI']);
	
	% Interrupt TF0
	i=i+1; seq(i) = cellstr(['ORG 000BH ; Interrupt TF0']);
	i=i+1; seq(i) = cellstr(['JMP LABEL_TF0']);
   
	% Interrupt IE1
	i=i+1; seq(i) = cellstr(['ORG 0013H ; Interrupt IE1']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['RETI']);
	
	% Interrupt TF1
	i=i+1; seq(i) = cellstr(['ORG 001BH ; Interrupt TF1']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['RETI']);
	
	% Interrupt TF2
	i=i+1; seq(i) = cellstr(['ORG 0023H ; Interrupt TF2']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['SETB 00h ; set a bit in RAM to go out loop in program']);
	i=i+1; seq(i) = cellstr(['RETI']);
	
	% Interrupt RI_TI
	i=i+1; seq(i) = cellstr(['ORG 002BH ; Interrupt RI_TI']);
	i=i+1; seq(i) = cellstr(['JMP LABEL_RI_TI']);
		
	% Interrupt TXRX
	i=i+1; seq(i) = cellstr(['ORG 0033H ; Interrupt TXRX']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['RETI']);
	
	
	% Initial of program address
    i=i+1; seq(i) = cellstr(['ORG 003BH ; ADDR after interrupt space']);
	
	i=i+1; seq(i) = cellstr(['LABEL_TF0:']);
	i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['; time to verification stimulates INT1 input signal (as 2 cyles of CM)']);
	i=i+1; seq(i) = cellstr(['NOP']);
	i=i+1; seq(i) = cellstr(['NOP']);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1 ' ; P1 random, time to interrupt to be processed']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK from TF1 OK (verify it)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1 ' ; P1 random']);
	i=i+1; seq(i) = cellstr(['RETI']);
	
	i=i+1; seq(i) = cellstr(['LABEL_RI_TI:']);
	i=i+1; seq(i) = cellstr(['MOV P1, #0FFH ; inform Interrupt OK (verify it)']);
	i=i+1; seq(i) = cellstr(['CPL 00h ; set a bit in RAM to go out loop in program']);
	i=i+1; seq(i) = cellstr(['MOV SCON, #090H ; clear serial flags']);
    i=i+1; seq(i) = cellstr(['RETI']);
	
	
	i=i+1; seq(i) = cellstr(['INITIAL: MOV 0C8H, #0FFH ; Setting P1EN - output']);
    i=i+1; seq(i) = cellstr(['MOV PCON, #080H ; SMOD = 1']);
	i=i+1; seq(i) = cellstr(['MOV SCON, #080H ; Serial mode 2, and RI TI flags cleared']);
	s=s+1;
    sequences(s,:) = seq;
    
%% end
    i=0;
    seq(:) =  cellstr('');
    i=i+1; seq(i) = cellstr(['END']);
    s=s+1;
    sequences(s,:) = seq;
    
%% TIMER 0 and 1 FUNCTIONALITY AND INTERRUPT
	opcode = '01H ; TIMER 0 and 1 FUNCTIONALITY AND INTERRUPT'; 

    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV IP, #008H ; Timer 1 with high priority and others with low priority ']);
    i=i+1; seq(i) = cellstr(['MOV IE, #0FAH ; All interrupts enabled, except external interrupts']);
	
	i=i+1; seq(i) = cellstr(['; moving FFFFFDh to 24bits Timer 0 counter']);
	i=i+1; seq(i) = cellstr(['MOV 08CH, #0FFH ; move FFh to TH0']);
	i=i+1; seq(i) = cellstr(['MOV 08EH, #0FFH ; move FFh to TM0']);
	i=i+1; seq(i) = cellstr(['MOV 08AH, #0FDH ; move FDh to TL0']);
	i=i+1; seq(i) = cellstr(['; moving 000002h to 24bits Timer 1 counter']);
	i=i+1; seq(i) = cellstr(['MOV 08DH, #000H ; move 00h to TH0']);
	i=i+1; seq(i) = cellstr(['MOV 08FH, #000H ; move 00h to TM0']);
	i=i+1; seq(i) = cellstr(['MOV 08BH, #002H ; move 02h to TL0']);
	
	i=i+1; seq(i) = cellstr(['MOV TMOD, #0B0H ; timer0: mode 0 | timer1: mode 3 and controlled by external input INT1']);
	i=i+1; seq(i) = cellstr(['MOV TCON, #50H ; run timer 0 and 1 (TR0 and TR1 in TCON)']);
	i=i+1; seq(i) = cellstr(['NOP ; time to timer 0 overflow']);
	i=i+1; seq(i) = cellstr(['NOP ; time to timer 0 overflow']);
	i=i+1; seq(i) = cellstr(['NOP ; time for interrupt to be processed']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (verify it)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['MOV P1, TCON ; verify if TF1 (bit 7) and TF0 (bit 5) are cleared']);
	i=i+1; seq(i) = cellstr(['MOV TMOD, #00H ; reset TMOD']);
	i=i+1; seq(i) = cellstr(['MOV TCON, #00H ; reset TCON']);
	i=i+1; seq(i) = cellstr(['MOV IP, #000H ; All interrupts with low priority']);
	i=i+1; seq(i) = cellstr(['MOV IE, #000H ; All interrupts disabled']);
    
    s=s+1; sequences(s,:) = seq;
	
%% INTERRUPT FUNCTIONALITY - External interrupts
	opcode = '41H ; INTERRUPT FUNCIONALITY - External interrupts'; 
	data_1 = rand_hex8b;

    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV IP, #000H ; All interrupts with low priority ']);
    i=i+1; seq(i) = cellstr(['MOV IE, #0FFH ; All interrupts enabled']);
	i=i+1; seq(i) = cellstr(['MOV TCON, #001H ; External int. 0: by edge | External int 1: by level']);
	i=i+1; seq(i) = cellstr(['NOP ; verification must stimulate external interrupt 0']);
	i=i+1; seq(i) = cellstr(['NOP ; verification must stimulate external interrupt 0']);
	i=i+1; seq(i) = cellstr(['NOP ; verification must stimulate external interrupt 0']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (verify it)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['NOP ; verification must stimulate external interrupt 1']);
	i=i+1; seq(i) = cellstr(['NOP ; verification must stimulate external interrupt 1']);
	i=i+1; seq(i) = cellstr(['NOP ; verification must stimulate external interrupt 1']);
	i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (verify it)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['MOV P1, TCON ; verify if IE1 (bit 3) and IE0 (bit 1) are cleared']);
	i=i+1; seq(i) = cellstr(['MOV IE, #000H ; All interrupts disabled']);
	i=i+1; seq(i) = cellstr(['MOV TCON, #00H ; reset TCON']);
	
    
	s=s+1; sequences(s,:) = seq;
	
	
%% INTERRUPT FUNCTIONALITY - TXRX 
	opcode = '21H ; INTERRUPT FUNCIONALITY - TXRX'; 

    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV IP, #000H ; All interrupts with low priority ']);
    i=i+1; seq(i) = cellstr(['MOV IE, #0FFH ; All interrupts enabled']);
	i=i+1; seq(i) = cellstr(['SETB 0DFH ; set interrupt flag(TXRX)']);
	i=i+1; seq(i) = cellstr(['NOP ; time for interrupt to be processed']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (verify it)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['MOV P1, 0D8H ; verify if TXRX flag (bit 7) is cleared']);
	i=i+1; seq(i) = cellstr(['MOV IE, #000H ; All interrupts disabled']);
 
	s=s+1; sequences(s,:) = seq;
	
%% TIMER 2 FUNCTIONALITY AND INTERRUPT
	opcode = '61H ; TIMER 2 FUNCTIONALITY AND INTERRUPT'; 

    i=0;  seq(:) =  cellstr('');
	
    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV IE, #0FFH ; All interrupts enabled']);
	
	i=i+1; seq(i) = cellstr(['; moving FFFFFDh to 24bits Timer 2 counter']);
	i=i+1; seq(i) = cellstr(['MOV 086H, #0FFH ; move FFh to TH0']);
	i=i+1; seq(i) = cellstr(['MOV 085H, #0FFH ; move FFh to TM0']);
	i=i+1; seq(i) = cellstr(['MOV 084H, #0FDH ; move FDh to TL0']);
	
	i=i+1; seq(i) = cellstr(['CLR 00h ; clear a bit in RAM']);	
	i=i+1; seq(i) = cellstr(['MOV 0D8H, #043H ; TCON2: Rise edge, 3 samples (mode S3) and run timer 2']);
	
	i=i+1; seq(i) = cellstr(['LABEL_TF2_' ind ': NOP ; loop until timer 2 overflow (verification must stimulate PHT)']);
	i=i+1; seq(i) = cellstr(['JNB 00h, LABEL_TF2_' ind]);
	
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (verify it)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['MOV P1, 0D8H ; TCON2: verify if TF2 flag (bit 5) is cleared']);
	i=i+1; seq(i) = cellstr(['MOV 0D8H, #000H ; TCON2 reset']);
	i=i+1; seq(i) = cellstr(['MOV IE, #000H ; All interrupts disabled']);
    
    %s=s+1; sequences(s,:) = seq;
	
	
%% SERIAL FUNCTIONALITY AND INTERRUPT
	opcode = '81H ; SERIAL FUNCTIONALITY AND INTERRUPT'; 
	data_1 = rand_hex8b; data_2 = rand_hex8b;

    i=0;  seq(:) =  cellstr('');
	
    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1 ' ; data_1 to transmit']);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2 ' ; data_2 to receive']);
	
    i=i+1; seq(i) = cellstr(['MOV IE, #0FFH ; All interrupts enabled']);
	%i=i+1; seq(i) = cellstr(['MOV PCON, #080H ; SMOD = 1']);
	i=i+1; seq(i) = cellstr(['SETB 09CH ; REN active']);
	i=i+1; seq(i) = cellstr(['CLR 00h ; clear a bit in RAM']);
	
	i=i+1; seq(i) = cellstr(['MOV SBUF, #' data_1 ' ; start transmition.']);
	i=i+1; seq(i) = cellstr(['; during transmition, verification must stimulate reception, with a start bit and then data_2	']);

	i=i+1; seq(i) = cellstr(['LABEL_TI_' ind ': NOP ; loop until end of transmition']);
	i=i+1; seq(i) = cellstr(['JNB 00h, LABEL_TI_' ind]);
	i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (TI) - verify bits transmited']); %JMP BACK
	
	i=i+1; seq(i) = cellstr(['LABEL_RI_' ind ': NOP ; loop until end of reception']);
	i=i+1; seq(i) = cellstr(['JB 00h, LABEL_RI_' ind]);
	
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; inform JMP BACK OK (RI)']); %JMP BACK
	i=i+1; seq(i) = cellstr(['MOV P1, SBUF ; check if SBUF == data_2']);
	%i=i+1; seq(i) = cellstr(['MOV PCON, #000H ; reset PCON']);
	i=i+1; seq(i) = cellstr(['MOV SCON, #080H ; clear flags and disable REN']);
	i=i+1; seq(i) = cellstr(['MOV IE, #000H ; All interrupts disabled']);
    
    s=s+1; sequences(s,:) = seq;
	
	
%% PORTS FUNCTIONALITY
	opcode = '0A1H ; PORTS FUNCTIONALITY'; 
	data_1 = rand_hex8b; data_2 = rand_hex8b; data_3 = rand_hex8b;

    i=0;  seq(:) =  cellstr('');
	clear addr_bit;

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_3]);
	
	i=i+1; seq(i) = cellstr(['; PORT 0 VERIFICATION']);
	i=i+1; seq(i) = cellstr(['MOV 0C0H, #' data_1 ' ; P0EN <- data_1']);
    i=i+1; seq(i) = cellstr(['MOV P0, #' data_2 ' ; verify if p0_a == data_2']);
	i=i+1; seq(i) = cellstr(['; verification: stimulate p0_y <- data_3']);
	%i=i+1; seq(i) = cellstr(['MOV P1, P0 ; verify if P0 is a merge of data_2 and data_3, controled by data_1']);
	
	i=i+1; seq(i) = cellstr(['; PORT 1 VERIFICATION']);
	i=i+1; seq(i) = cellstr(['MOV 0C8H, #' data_3 ' ; P1EN <- data_3']);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2 ' ; verify if p1_a == data_2']);
	i=i+1; seq(i) = cellstr(['; verification: stimulate p1_y <- data_1']);
	i=i+1; seq(i) = cellstr(['; verify if P1 is a merge of data_1 and data_2, controled by data_3']);
	
	i=i+1; seq(i) = cellstr(['; PORT 2 VERIFICATION']);
	i=i+1; seq(i) = cellstr(['MOV 0E8H, #' data_1 ' ; P2EN <- data_1']);
    i=i+1; seq(i) = cellstr(['MOV P2, #' data_3 ' ; verify if p2_a == data_3']);
	i=i+1; seq(i) = cellstr(['; verification: stimulate p2_y <- data_2']);
	%i=i+1; seq(i) = cellstr(['MOV P1, P2 ; verify if P2 is a merge of data_3 and data_2, controled by data_1']);
	
	i=i+1; seq(i) = cellstr(['; PORT 3 VERIFICATION']);
	i=i+1; seq(i) = cellstr(['MOV 0F8H, #' data_2 ' ; P0EN <- data_2']);
    i=i+1; seq(i) = cellstr(['MOV P3, #' data_1 ' ; verify if p3_a == data_1']);
	i=i+1; seq(i) = cellstr(['; verification: stimulate p3_y <- data_3']);
	%i=i+1; seq(i) = cellstr(['MOV P1, P3 ; verify if P3 is a merge of data_1 and data_3, controled by data_2']);
	
	i=i+1; seq(i) = cellstr(['; PORT 4 VERIFICATION']);
    i=i+1; seq(i) = cellstr(['MOV 0AFH, #' data_3 ' ; verify if p4_a == data_3']);
	
	i=i+1; seq(i) = cellstr(['MOV 0C8H, #0FFH ; Setting P1EN - output']);
	i=i+1; seq(i) = cellstr(['NOP ; synchronization']);
    
    s=s+1; sequences(s,:) = seq;

end

