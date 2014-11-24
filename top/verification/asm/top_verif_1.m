%% main 
function top_verif_1()
    clear
    clc
    
    num_sequences = 200;

    ind = '1';
	jmp_flag = 0;
    sequences = gen_sequence(ind);
    rand_sequences(1,:) = sequences(2,:)

    for i = 2:num_sequences
        sequences = gen_sequence(num2str(i));
		num_seq = round(random('unif', 4, size(sequences, 1)));
		if (num_seq == 13) % creating just one jmp sequence
			if (jmp_flag == 0)
				jmp_flag = 1;
			else
				while (num_seq == 13)
					num_seq = round(random('unif', 4, size(sequences, 1)));
				end
			end
		end
			
        rand_sequences(i,:) = sequences(num_seq,:);
    end
    size(sequences, 1)
    rand_sequences(num_sequences+1,:) = sequences(3,:)

    str_sequences = char(rand_sequences');

    fid = fopen('t_inst.asm','w+');
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
    i=i+1; seq(i) = cellstr(['JMP INI']);
		
    i=i+1; seq(i) = cellstr(['ORG 003BH ; ADDR after interrupt space']);
    i=i+1; seq(i) = cellstr(['INITIAL: MOV P1, #0FFH ; inform JMP OK (verify it)']);
    i=i+1; seq(i) = cellstr(['NOP']);
    i=i+1; seq(i) = cellstr(['NOP']);
    i=i+1; seq(i) = cellstr(['NOP']);
    i=i+1; seq(i) = cellstr(['JMP JMP_BACK; backing of JMP']);
	
	% LABEL_CALL  
	i=i+1; seq(i) = cellstr(['LABEL_CALL: ']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FFH']);
    i=i+1; seq(i) = cellstr(['RET']);
    
    i=i+1; seq(i) = cellstr(['INI: MOV 0C8H, #0FFH ; Setting P1EN - output']);
    s=s+1;
    sequences(s,:) = seq;
    
%% end
    i=0;
    seq(:) =  cellstr('');
    i=i+1; seq(i) = cellstr(['END']);
    s=s+1;
    sequences(s,:) = seq;
    
%% JBC
    opcode = '10H ; JBC'; 
    data_1 = rand_hex8b; 
    auxi_1 = round(random('unif', 32, 47));
    addr_1 = ['0' dec2hex(auxi_1), 'H'];
    addr_2 = ['0' dec2hex((auxi_1 - 32)*8 +  round(random('unif', 0, 7))), 'H'];
    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['JMP INI_JBC_' ind]);
    i=i+1; seq(i) = cellstr(['LABEL_JBC_' ind ': MOV P1, #0FFH ; inform JMP OK']); %JMP OK
    i=i+1; seq(i) = cellstr(['JMP BACK_JBC_' ind]);

    i=i+1; seq(i) = cellstr(['INI_JBC_' ind ': MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, #'  data_1]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1 ', #' data_1]);
    i=i+1; seq(i) = cellstr(['JBC ' addr_2 ', LABEL_JBC_' ind]);
    i=i+1; seq(i) = cellstr(['BACK_JBC_' ind ': MOV P1, #0FEH ; inform JMP BACK OK']); %JMP BACK
    
    s=s+1; sequences(s,:) = seq;

%% INC_D
    opcode = '05H ; INC_D'; 
    data_1 = rand_hex8b; data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV A, #'  data_1]);
    i=i+1; seq(i) = cellstr(['INC A ']);
    i=i+1; seq(i) = cellstr(['MOV P1, A']);
    
    s=s+1;
    sequences(s,:) = seq;
    
%% NOP

    opcode = '00H ; NOP'; 
    i=0; seq(:) =  cellstr('');  %initialization

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['NOP']);
  
    s=s+1; sequences(s,:) = seq;
    
%% MOVC_A_ATPC
    opcode = '083H; MOVC_A_ATPC'; 
    data_1 = rand_hex8b; data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV A, #'  data_1]);
    i=i+1; seq(i) = cellstr(['MOVC A, @A+PC ; Check A+PC = 01h + 09h = 0Ah']);
    i=i+1; seq(i) = cellstr(['MOV P1, A']);
    
    s=s+1;
    sequences(s,:) = seq;

%% DEC_ATR0
    opcode = '016H ; DEC_R0'; 
    data_1 = rand_hex8b;
    addr_1 = rand_hex_ram;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV R0, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1 ', #' data_1]);
    i=i+1; seq(i) = cellstr(['DEC @R0']);
    i=i+1; seq(i) = cellstr(['MOV P1, @R0 ;check (operand2 - 1) -> 7 cycles']); 
    
    s=s+1;
    sequences(s,:) = seq;
    
%% JB and SETB
    opcode = '20H ; JB and SETB'; 
    data_1 = rand_hex8b;
    [addr_bit addr_byte] = rand_hex_bit();
    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['JMP INI_JB_' ind]);
    i=i+1; seq(i) = cellstr(['LABEL_JB_' ind ': MOV P1, #0FFH']); %JMP OK
    i=i+1; seq(i) = cellstr(['JMP BACK_JB_' ind]);

    i=i+1; seq(i) = cellstr(['INI_JB_' ind ': MOV P1, #' addr_bit]);
    i=i+1; seq(i) = cellstr(['SETB ' addr_bit]);
    i=i+1; seq(i) = cellstr(['JB ' addr_bit ', LABEL_JB_' ind]);
    i=i+1; seq(i) = cellstr(['BACK_JB_' ind ': MOV P1, #0FEH']); %JMP BACK
    
    s=s+1; sequences(s,:) = seq;    

%% JNB and CLR_BIT
    opcode = '30H ; JNB and CLR (bit)'; 
    data_1 = rand_hex8b; 
    [addr_bit addr_byte] = rand_hex_bit(); % RAM bit address
    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['JMP INI_JNB_' ind]);
    i=i+1; seq(i) = cellstr(['LABEL_JNB_' ind ': MOV P1, #0FFH']); %JMP OK
    i=i+1; seq(i) = cellstr(['JMP BACK_JNB_' ind]);

    i=i+1; seq(i) = cellstr(['INI_JNB_' ind ': MOV P1, #' addr_bit]);
    i=i+1; seq(i) = cellstr(['CLR ' addr_bit]);
    i=i+1; seq(i) = cellstr(['JNB ' addr_bit ', LABEL_JNB_' ind]);
    i=i+1; seq(i) = cellstr(['BACK_JNB_' ind ': MOV P1, #0FEH']); %JMP BACK
    
    s=s+1; sequences(s,:) = seq;

%% JZ
    opcode = '60H ; JZ'; 
    data_1 = rand_hex8b; 
    if (rand > 0.5)
        data_1 = '00H';
    end
    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['JMP INI_JZ_' ind]);
    i=i+1; seq(i) = cellstr(['LABEL_JZ_' ind ': MOV P1, #0FFH']); %JMP OK
    i=i+1; seq(i) = cellstr(['JMP BACK_JZ_' ind]);

    i=i+1; seq(i) = cellstr(['INI_JZ_' ind ': MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['JZ LABEL_JZ_' ind]);
    i=i+1; seq(i) = cellstr(['BACK_JZ_' ind ': MOV P1, #0FEH']); %JMP BACK
    
    s=s+1; sequences(s,:) = seq;

%% JNZ
    opcode = '70H ; JNZ'; 
    data_1 = rand_hex8b; 
    if (rand > 0.5)
        data_1 = '00H';
    end
    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['JMP INI_JNZ_' ind]);
    i=i+1; seq(i) = cellstr(['LABEL_JNZ_' ind ': MOV P1, #0FFH']); %JMP OK
    i=i+1; seq(i) = cellstr(['JMP BACK_JNZ_' ind]);

    i=i+1; seq(i) = cellstr(['INI_JNZ_' ind ': MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['JNZ LABEL_JNZ_' ind]);
    i=i+1; seq(i) = cellstr(['BACK_JNZ_' ind ': MOV P1, #0FEH']); %JMP BACK
    
    s=s+1; sequences(s,:) = seq;

%% JMP
    opcode = '02H ; JMP (long jmp, short jmp, depends..)'; 

    i=0;  seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['JMP INITIAL ; jmp to begin of code, 3xNOP and JMP BACK to next line']);
    i=i+1; seq(i) = cellstr(['JMP_BACK: MOV P1, #0FEH ; inform JMP BACK OK (verify it)']); %JMP BACK
    
    s=s+1; sequences(s,:) = seq;
	
	
%% ADD_A_DATA
    opcode = '024H ; ADD_A_DATA'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV  A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['ADD  A,  #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, A; check (operand2 + operand3) -> 6 cycles']); 
	
	s=s+1; sequences(s,:) = seq;

%% ORL_A_D
    opcode = '045H ; ORL_A_D'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    addr_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV  A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1,  ', #' data_2]);
    i=i+1; seq(i) = cellstr(['ORL  A,  ' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1,  A ;check (operand2 or operand3) -> 8 cycles']); 
	
	s=s+1; sequences(s,:) = seq;

%% ANL_D_DATA
    opcode = '053H ; ANL_D_DATA'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    addr_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1,  ', #' data_1]);
    i=i+1; seq(i) = cellstr(['ANL ' addr_1 ', #' data_2 ]);
    i=i+1; seq(i) = cellstr(['MOV P1, ' addr_1 '  ;check P1 (operand3 and operand4) -> 7 cycles']); 

	s=s+1; sequences(s,:) = seq;    
 
%% DIV_A_B
    opcode = '084H ; DIV_A_B'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV B,  #' data_2]);
    i=i+1; seq(i) = cellstr(['DIV AB']);
    i=i+1; seq(i) = cellstr(['MOV P1, A               ; check A = quociente - 8 cycles']); 
    i=i+1; seq(i) = cellstr(['MOV P1, B               ; check B = rest - 1 cycle']);

	s=s+1; sequences(s,:) = seq;
    
%% MUL_A_B
    opcode = '0A4H ; MUL_A_B'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV B,  #' data_2]);
    i=i+1; seq(i) = cellstr(['MUL AB']);
    i=i+1; seq(i) = cellstr(['MOV P1, A               ; Check A = lsb - 8 cycles']); 
    i=i+1; seq(i) = cellstr(['MOV P1, B               ; Check B = msb - 1 cycles']);
	
	s=s+1; sequences(s,:) = seq;
    
%% SUBB_A_DATA
    opcode = '094H ; SUBB_A_DATA'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['SUBB A,  #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, A               ; Check P1 - 6 cycles - operand2 - operand3']);    

	s=s+1; sequences(s,:) = seq;	
    
%% PUSH
    opcode = '0C0H ; PUSH'; 
    data_1 = rand_hex8b;
    addr_1 = rand_hex_ram_sfr;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, SP             ; get actual SP']);
    i=i+1; seq(i) = cellstr(['MOV R1, SP             ; save actual SP']);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1,  ', #' data_1]);
    i=i+1; seq(i) = cellstr(['PUSH ' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, SP             ; check SP - 4 cycles - tem que ser SP anterior + 1']);
    i=i+1; seq(i) = cellstr(['MOV P1, @R1']);
	
	s=s+1; sequences(s,:) = seq;
    
%% POP
    opcode = '0D0H ; POP'; 
    addr_1 = rand_hex_ram_sfr;
	data_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, SP             ; get actual SP']);
    i=i+1; seq(i) = cellstr(['POP ' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, SP             ; Check SP - 5 cycles - SP anterior - 1']);
    i=i+1; seq(i) = cellstr(['MOV R0, SP']);
	i=i+1; seq(i) = cellstr(['MOV @R0, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, @R0            ; get actual value ']);
    i=i+1; seq(i) = cellstr(['MOV P1, ' addr_1,  '; compare values - 8 cycles']);   

	s=s+1; sequences(s,:) = seq;	

%% SWAP_A
    opcode = '0C4H ; SWAP_A'; 
    data_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['SWAP A']);
    i=i+1; seq(i) = cellstr(['MOV P1, A               ; check A - 5 cycle - change nibbles']);
	
	s=s+1; sequences(s,:) = seq;
    
%% ADDC_A_DATA
    opcode = '034H ; ADDC_A_DATA'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV  A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['ADDC  A,  #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, A               ; check A - 6 cycles']);   

	s=s+1; sequences(s,:) = seq;
 
%% XRL_A_R0
    opcode = '068H ; XRL_A_R0'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV  A,  #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV  R0,  #' data_2]);
    i=i+1; seq(i) = cellstr(['XRL  A, R0             ; A or R0']);
    i=i+1; seq(i) = cellstr(['MOV  P1, A             ; Check A - 7 cycles']);
	
	s=s+1; sequences(s,:) = seq;
    
%% MOV_D_D
    opcode = '085H ; MOV_D_D'; 
    data_1 = rand_hex8b;
    addr_1 = rand_hex8b;
    addr_2 = rand_hex8b;
    
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1  ', #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_2  ', ' addr_1 ' ; addr must have data_1']);
    i=i+1; seq(i) = cellstr(['MOV P1, ' addr_2 '        ; Check in 7 cycles']);   

    s=s+1; sequences(s,:) = seq;	

%% MOV_R0_D
    opcode = '0A8H ; MOV_R0_D'; 
    data_1 = rand_hex8b;
    addr_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1  ', #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV R0,  #' addr_1 ' ; R0 must have 01h']);
    i=i+1; seq(i) = cellstr(['MOV P1, R0             ; Check in 6 cycles']);
	
	s=s+1; sequences(s,:) = seq;
    
%% CPL_BIT
    opcode = '0B2H ; CPL_BIT'; 
    data_1 = rand_hex8b;
    [addr_2 addr_1] = rand_hex_bit();
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_2]);    
    i=i+1; seq(i) = cellstr(['MOV ' addr_1  ', #' data_1]);
    i=i+1; seq(i) = cellstr(['CPL ' addr_2 ' ; addr_2 must change to b1']);
    i=i+1; seq(i) = cellstr(['MOV  P1, ' addr_1  '           ; Check in 6 cycles']);  

	s=s+1; sequences(s,:) = seq;
	
%% XCH_A_ATR1
    opcode = '0C7H ; XCH_A_ATR1'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    addr_2 = rand_hex_ram;

    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    
    i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV R1, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_2  ', #' data_2]);
    i=i+1; seq(i) = cellstr(['XCH  A, @R1      ; A = dado de @R1, @R1 = dado de A']);
    i=i+1; seq(i) = cellstr(['MOV P1, A          ; Check in 9 cycles - A with previous value of @R1']);
    i=i+1; seq(i) = cellstr(['MOV P1, @R1     ; Check in 10 cycles - @R1 with previous value of A ']);    
    
    s=s+1; sequences(s,:) = seq;

%% XCHD_A_ATR0
    opcode = '0D6H ; XCHD_A_ATR0'; 
    data_1 = rand_hex8b;
    data_2 = rand_hex8b;
    addr_2 = rand_hex_ram;
	
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    
    i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV R0, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_2  ', #' data_2]);
    i=i+1; seq(i) = cellstr(['XCHD  A, @R0         ; A[3:0] = dado @R0[3:0], @R0[3:0] = dado A[3:0]']);
    i=i+1; seq(i) = cellstr(['MOV P1, A                ; Check in 9 cycles']);
    i=i+1; seq(i) = cellstr(['MOV P1, @R0           ; Check in 10 cycles']);    
    
    s=s+1;  sequences(s,:) = seq;


%% MOV_DPTR_DATA
    opcode = '090H ; MOV_DPTR_DATA'; 
    data_1 = rand_hex8b;		%%lsb
    data_2 = rand_hex8b;		%%msb
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_2]);
    i=i+1; seq(i) = cellstr(['MOV DPTR,  #' data_2(1:length(data_2)-1) data_1(2:length(data_1))]);
    i=i+1; seq(i) = cellstr(['MOV P1, DPL ; Check in 5 cycles - P1 must have data_1']);
    i=i+1; seq(i) = cellstr(['MOV P1, DPH ; Check in 5 cycles - P1 must have data_2']);
	
	s=s+1;  sequences(s,:) = seq;
	
%% DJNZ_D
    opcode = '0D5H ; DJNZ_D'; 
    data_1 = rand_hex8b;
    addr_1 = rand_hex_ram_sfr;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV ' addr_1  ', #' data_1]);
	
	i=i+1; seq(i) = cellstr(['LABEL_DJNZ_' ind ': NOP']);
    i=i+1; seq(i) = cellstr(['DJNZ ' addr_1  ', LABEL_DJNZ_' ind '; loop nop data_1 times']);
    i=i+1; seq(i) = cellstr(['MOV P1, ' addr_1 ' ; Check in 10 cycles - P1 must have previous P1 -1']);
	
	s=s+1; sequences(s,:) = seq;

%% CALL
    opcode = '012H ; CALL'; 

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['CALL LABEL_CALL']);
    i=i+1; seq(i) = cellstr(['MOV P1, #0FEH ; RET - back from ACALL']); %RET
    
    s=s+1; sequences(s,:) = seq;


%% MOVX_A_ATDPTR
    opcode = '0E0H ; MOVX_A_ATDPTR'; 

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, DPL']);
    i=i+1; seq(i) = cellstr(['MOV P1, DPH']);    
    i=i+1; seq(i) = cellstr(['MOVX A, @DPTR']);
    i=i+1; seq(i) = cellstr(['MOV P1, A']);
    
    s=s+1; sequences(s,:) = seq;

%% RR_A
    opcode = '003H ; RR_A'; 
    data_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['RR A ']);
    i=i+1; seq(i) = cellstr(['MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated']);
	
	s=s+1; sequences(s,:) = seq;

%% RL_A
    opcode = '023H ; RL_A'; 
    data_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
	i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['RL A ']);
    i=i+1; seq(i) = cellstr(['MOV P1,  A ; Check in 4 cycles - P1 must have A byte rotated left']);
	
	s=s+1; sequences(s,:) = seq;

%% ORL_C_BIT
    opcode = '072H ; ORL_C_BIT'; 
    data_1 = rand_hex8b;
    [addr_1 addr_2] = rand_hex_bit();;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_2]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' addr_1]);    
    i=i+1; seq(i) = cellstr(['MOV P1, PSW']);
    i=i+1; seq(i) = cellstr(['MOV ' addr_2 ',  #' data_1]);
    i=i+1; seq(i) = cellstr(['ORL  C,  ' addr_1]);
    i=i+1; seq(i) = cellstr(['MOV P1,  0D0H ;check (C or operand2) -> 7 cycles']);
	
	s=s+1; sequences(s,:) = seq;

%% DA_A
    opcode = '0D4H ; DA_A'; 
    data_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, #' data_1]);
    i=i+1; seq(i) = cellstr(['MOV P1, PSW']);
    i=i+1; seq(i) = cellstr(['MOV A, #' data_1]);
    i=i+1; seq(i) = cellstr(['DA A ']);
    i=i+1; seq(i) = cellstr(['MOV P1,  A ; Check in 4 cycles - P1 must have A in BCD format']);
	
	s=s+1; sequences(s,:) = seq;

%% CPL_A
    opcode = '0F4H ; CPL_A'; 
    data_1 = rand_hex8b;
    i=0;
    seq(:) =  cellstr('');

    i=i+1; seq(i) = cellstr(['MOV P1, #' opcode]);
    i=i+1; seq(i) = cellstr(['MOV P1, A']);
    i=i+1; seq(i) = cellstr(['CPL A']);
    i=i+1; seq(i) = cellstr(['MOV P1,  A ; Check in 4 cycles - P1 must have NOT A']);
	
	s=s+1; sequences(s,:) = seq;

end

