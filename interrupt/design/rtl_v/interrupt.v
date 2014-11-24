// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: interrupt.v
// Module Name: Interrupt Block
// Author:	Hugo Kakisaka
//				Marcelo Mamoru Ono
// E-mail:
// -------------------------------------------------------------------
// Release	History
// Version	2.01
// Date		26/10/2010
//
// -------------------------------------------------------------------
// Description
//
// This code implements the interrupt control.
// 
// External interrupt modified
// Final version, change S1 and S2
// add  register "vect_register", used in state s4
// External interrupt is only executed when EA = 1,
// Fix when EA =1 and register IE is set,
// Fix when IE[x] = 0, don`t change the output value, 
// Disable flag_out[x] when IE[x] == 0,
// When EA = 0 -- flag_out = 0,
// Fix bugs interrupt enable, int_vect_o, flag_out
// External interrupt, level mode, flag_out[0] == flag_intx[0][0] 
//		and flag_out[2] == flag_intx[1][0]
// External interrupt, level mode, flag_out == flag_intx || flag_intx_next 
// Add register, store flag_out[0] and [2] to next state
// Change list of priority, include task.
// Change IE0 and IE1
// Change flag_ier_nor[3:2]
// -------------------------------------------------------------------

`timescale 1ns/1ns

module INTERRUPT 

//---------------------------------------------------------------------------//
//---------------------------------Parameter---------------------------------//
//---------------------------------------------------------------------------//
#(
parameter 	
	NUMBER_INTX = 2,			// [NUMBER_INTX-1:0]int_intx_b_i
	NUMBER_VECT = 3,			// [NUMBER_VECT-3:0]int_vect_o

	NUMBER_S_BITS = 1,		// signal sample, bits
	NUMBER_S_VAL = 1'd1,	// signal sample, value

//---IE register

	EX0 				= 3'd0	,
	ET0 				= 3'd1	,
	EX1 				= 3'd2	,
	ET1 				= 3'd3	,
	ES 				= 3'd4	,
	ET2 				= 3'd5	,
	ETXRX				= 3'd6	,
	EA 				= 3'd7	,

//---IP register

	PX0 				= 3'd0	, 
	PT0 				= 3'd1	,
	PX1 				= 3'd2	,
	PT1 				= 3'd3	,
	PS 				= 3'd4	,
	PT2 				= 3'd5	,
	PTXRX				= 3'd6	,
// not used [reserved]

//---SCON IN register

	RI_IN 			= 3'd0	,
	TI_IN 			= 3'd1	,
// not used [RB8]
// not used [TB8]
// not used [REN]
// not used [SM2]
// not used [SM1]
// not used [SM0]

//---TCON IN register

	IT0_IN			= 3'd0	, 
	IE0_IN			= 3'd1	,
	IT1_IN			= 3'd2	,
	IE1_IN			= 3'd3	,
// not used [TR0]
	TF0_IN 			= 3'd4	,
// not used [TR1]
	TF1_IN			= 3'd5	,
	
//---TCON2 IN register

// not used [EDGSEL]
// not used [DFSEL]
// not used [DFP[0]]
// not used [DFP[1]]
// not used [DFP[2]]
	TF2_IN 			= 3'd0	,
// not used [TR2]
	TXRXF_IN			= 3'd1	,

//---TCON OUT register

// not used [IT0] 
	IE0_OUT 			= 3'd0	,
// not used [IT1]
	IE1_OUT 			= 3'd1	,
// not used [TR0]
	TF0_OUT 			= 3'd2	,
// not used [TR1]
	TF1_OUT			= 3'd3	,

//---TCON2 OUT register

// not used [EDGSEL]
// not used [DFSEL]
// not used [DFP[0]]
// not used [DFP[1]]
// not used [DFP[2]]
	TF2_OUT 			= 3'd0	,
// not used [TR2]
	TXRXF_OUT		= 3'd1	,

//---PRIORITY TABLE

											// PRIORITY LEVEL
	PL_0 			= 3'd0	,		// IE0	= 0			1
	PL_1 			= 3'd1	,		// TF0	= 1			2
	PL_2 			= 3'd2	,		// IE1	= 2			3
	PL_3 			= 3'd3	,		// TF1	= 3			4
	PL_4 			= 3'd5	,		// TF2	= 5			5
	PL_5 			= 3'd4	,		// RITI	= 4			6
	PL_6			= 3'd6			// TXRXF	= 6			7

)
	
//---------------------------------------------------------------------------//
//-----------------------------------Input-----------------------------------//
//---------------------------------------------------------------------------//

(
//---External Interrupt
input [NUMBER_INTX-1:0]int_intx_b_i,

//---Controler
input int_rst_sync_b_i,
input clk,
input int_rdy_i,
input int_na_i,
input int_cm_i,

//---SFR_IE
input [7:0]reg_ie_i,				//[0] = EX0, [1] = ET0, [2] = EX1, [3] = ET1,
										//[4] = ES, [5] = ET2, [6] = ETXRX, [7] = EA

//---SFR_IP
input [6:0]reg_ip_i,				//[0] = PX0, [1] = PT0, [2] = PX1, [3] = PT1,
										//[4] = PS, [5] = PT2, [6] = PTXRX

//---SFR_SCON
input [1:0]reg_scon_i,			//[0] = R1, [1] = T1

//---SFR_TCON
input [5:0]reg_tcon_i,			//[0] = IT0, [1] = IE0, [2] = IT1, [3] = IE1,
										//[4] = TF0, [5] = TF1

//---SFR_TCON2
input [1:0]reg_tcon2_i,			//[0] = TF2, [1] = TXRXF

//---------------------------------------------------------------------------//
//----------------------------------Output-----------------------------------//
//---------------------------------------------------------------------------//

//---Vector Interrupt
output reg [NUMBER_VECT-1:0]int_vect_o,


//---SFR_TCON
output [3:0]reg_tcon_o,		//[0] = IE0, [1] = IE1,[2] = TF0, [3] = TF1


//---SFR_TCON2
output [1:0]reg_tcon2_o,		//[0] = TF2, [1] = TXRXF

output reg int_reg_clr_o
);


//---------------------------------------------------------------------------//
//------------------------------------REG------------------------------------//
//---------------------------------------------------------------------------//

reg [1:0]flag_intx[NUMBER_INTX-1:0];				// when the external interrupt is valided

reg [NUMBER_S_BITS-1:0]hi_ok[NUMBER_INTX-1:0];	// if hi_ok = 0, signal hi is ok
reg [NUMBER_S_BITS-1:0]lo_ok[NUMBER_INTX-1:0];	// if lo_ok = 0, signal lo is ok

reg [1:0]flag_intx_next[NUMBER_INTX-1:0];			// when the external interrupt is valided

reg [NUMBER_S_BITS-1:0]hi_ok_next[NUMBER_INTX-1:0]; // if hi_ok = 0, signal hi is ok
reg [NUMBER_S_BITS-1:0]lo_ok_next[NUMBER_INTX-1:0]; // if lo_ok = 0, signal lo is ok

reg [6:0]ier;
reg [6:0]ier_ctr;

reg [6:0]ier_next;
reg [6:0]ier_ctr_next;

reg state;

integer i;

reg [NUMBER_VECT-1:0]vect_register;

reg [1:0]flag_out_reg;
reg [1:0]flag_out_reg_next;
reg reset;

//---------------------------------------------------------------------------//
//----------------------------------ASSIGN-----------------------------------//

wire [6:0]flag_in;

assign flag_in[0] = reg_tcon_i[IE0_IN];
assign flag_in[1] = reg_tcon_i[TF0_IN];
assign flag_in[2] = reg_tcon_i[IE1_IN];
assign flag_in[3] = reg_tcon_i[TF1_IN];
assign flag_in[4] = (reg_scon_i[TI_IN] | reg_scon_i[RI_IN]);
assign flag_in[5] = reg_tcon2_i[TF2_IN];
assign flag_in[6] = reg_tcon2_i[TXRXF_IN];

reg [5:0]flag_out;

assign reg_tcon_o[IE0_OUT] = flag_out[0];
assign reg_tcon_o[TF0_OUT] = flag_out[1];
assign reg_tcon_o[IE1_OUT] = flag_out[2];
assign reg_tcon_o[TF1_OUT] = flag_out[3];
assign reg_tcon2_o[TF2_OUT] = flag_out[4];
assign reg_tcon2_o[TXRXF_OUT] = flag_out[5];


wire [5:0]flag_in_comp;

assign flag_in_comp[0] = reg_tcon_i[IE0_IN];
assign flag_in_comp[1] = reg_tcon_i[TF0_IN];
assign flag_in_comp[2] = reg_tcon_i[IE1_IN];
assign flag_in_comp[3] = reg_tcon_i[TF1_IN];
assign flag_in_comp[4] = reg_tcon2_i[TF2_IN];
assign flag_in_comp[5] = reg_tcon2_i[TXRXF_IN];


wire [3:0]flag_ier_nor;

assign flag_ier_nor[0] = ~(ier_next[1] | ier_ctr_next[1]);
assign flag_ier_nor[1] = ~(ier_next[3] | ier_ctr_next[3]);
assign flag_ier_nor[2] = ~(ier_next[5] | ier_ctr_next[5]);
assign flag_ier_nor[3] = ~(ier_next[6] | ier_ctr_next[6]);


wire [3:0]flag_in_and_iernor;

assign flag_in_and_iernor[0] = flag_in_comp[1] & flag_ier_nor[0]; 
assign flag_in_and_iernor[1] = flag_in_comp[3] & flag_ier_nor[1];
assign flag_in_and_iernor[2] = flag_in_comp[4] & flag_ier_nor[2];
assign flag_in_and_iernor[3] = flag_in_comp[5] & flag_ier_nor[3];

wire [6:0]flag_and_ie_in;

assign flag_and_ie_in[PL_0] = (reg_ie_i[PL_0] & flag_in[PL_0]);
assign flag_and_ie_in[PL_1] = (reg_ie_i[PL_1] & flag_in[PL_1]);
assign flag_and_ie_in[PL_2] = (reg_ie_i[PL_2] & flag_in[PL_2]);
assign flag_and_ie_in[PL_3] = (reg_ie_i[PL_3] & flag_in[PL_3]);
assign flag_and_ie_in[PL_4] = (reg_ie_i[PL_4] & flag_in[PL_4]);
assign flag_and_ie_in[PL_5] = (reg_ie_i[PL_5] & flag_in[PL_5]);
assign flag_and_ie_in[PL_6] = (reg_ie_i[PL_6] & flag_in[PL_6]);

wire [6:0]flag_and_ie_in_ip;

assign flag_and_ie_in_ip[PL_0] = (reg_ip_i[PL_0] & flag_and_ie_in[PL_0]);
assign flag_and_ie_in_ip[PL_1] = (reg_ip_i[PL_1] & flag_and_ie_in[PL_1]);
assign flag_and_ie_in_ip[PL_2] = (reg_ip_i[PL_2] & flag_and_ie_in[PL_2]);
assign flag_and_ie_in_ip[PL_3] = (reg_ip_i[PL_3] & flag_and_ie_in[PL_3]);
assign flag_and_ie_in_ip[PL_4] = (reg_ip_i[PL_4] & flag_and_ie_in[PL_4]);
assign flag_and_ie_in_ip[PL_5] = (reg_ip_i[PL_5] & flag_and_ie_in[PL_5]);
assign flag_and_ie_in_ip[PL_6] = (reg_ip_i[PL_6] & flag_and_ie_in[PL_6]);

//---------------------------------------------------------------------------//
//-----------------------------------State-----------------------------------//
//---------------------------------------------------------------------------//

parameter	S1		= 1'b0,
				S2		= 1'b1;

//---------------------------------------------------------------------------//
//------------------------------Sequencial Block-----------------------------//
//---------------------------------------------------------------------------//

always @ (negedge clk)
begin
	if (!int_rst_sync_b_i)
	begin
		ier <= 'b0;
		ier_ctr <= 'b0;
		
		hi_ok[0] <= NUMBER_S_VAL;
		hi_ok[1] <= NUMBER_S_VAL;
		lo_ok[0] <= NUMBER_S_VAL;
		lo_ok[1] <= NUMBER_S_VAL;
		flag_intx[0] <= 2'b0;
		flag_intx[1] <= 2'b0;
		
		vect_register <= 3'b0;
		reset <= 1'b0;

	end
	else
	begin
		ier <= ier_next;
		ier_ctr <= ier_ctr_next;
		
		hi_ok[0] <= hi_ok_next[0];
		hi_ok[1] <= hi_ok_next[1];
		lo_ok[0] <= lo_ok_next[0];
		lo_ok[1] <= lo_ok_next[1];
		flag_intx[0] <= flag_intx_next[0];
		flag_intx[1] <= flag_intx_next[1];
		
		vect_register <= int_vect_o;
		reset <= 1'b1;
	end
	
	if (int_cm_i == 1)
	begin
		state <= S1;
	end
	else
	begin
		state <= S2;
	end
end

always @ (posedge clk)
begin
	if (!reset)
	begin
		flag_out_reg <= 2'd0;	
	end
	else
	begin
		flag_out_reg <= flag_out_reg_next;
	end
end

//---------------------------------------------------------------------------//
//----------------------------Combination Block------------------------------//
//---------------------------------------------------------------------------//
always @(flag_intx[0],
			hi_ok[0],
			lo_ok[0],
			flag_intx[1],
			hi_ok[1],
			lo_ok[1],
			ier, ier_ctr, flag_in_comp, state, int_cm_i, 
			flag_in_and_iernor, reg_ie_i, int_na_i, int_rdy_i, vect_register, 
			int_reg_clr_o, int_intx_b_i, reg_tcon_i, reg_ip_i, flag_in,flag_out_reg,
			flag_and_ie_in, flag_and_ie_in_ip)
begin
	TASK_DEFAULT;

	if (reg_ie_i[7] == 1'b1)
	begin
		flag_out = flag_in_comp;
	
		if (state == S1)
		begin
			if (int_cm_i)
			begin
				TASK_STATE_2;
			end
			else
			begin
				TASK_STATE_3;
			end
		end
		else
		begin
			if (int_cm_i)
			begin
				TASK_STATE_1;
			end
			else
			begin
				TASK_STATE_4;
			end
		end
	end
end

//---------------------------------------------------------------------------//
//-----------------------------------Task------------------------------------//
//---------------------------------------------------------------------------//
task TASK_DEFAULT;
begin
	for (i=0; i<NUMBER_INTX; i = i + 1)
		begin
			hi_ok_next[i] = hi_ok[i];
			lo_ok_next[i] = lo_ok[i];
			flag_intx_next[i] = flag_intx[i];
		end

	flag_out = 6'd0;
	int_reg_clr_o = 1'b0;

	ier_next = ier;
	ier_ctr_next = ier_ctr;
	int_vect_o = 'b0;
	flag_out_reg_next[1:0] = 2'b00;

end
endtask


//----------------------------------STATE 1------------------------------------
task TASK_STATE_1;
begin
	TASK_VECT_GENERATOR (7);
	TASK_EXT_INT(1'd0, 2'd0, 2'd0);	//lo_ok and hi_ok[0], flag_in[0] = IE0
	TASK_EXT_INT(1'd0, 2'd1, 2'd2);	//lo_ok and hi_ok[1], flag_in[2] = IE1
	int_vect_o		= 3'b0;
	ier_next			= ier;
	ier_ctr_next	= ier_ctr;			
	
		flag_out[5:0]	= flag_in_comp[5:0];

		if ( reg_ie_i[3] == 1'b1)
		begin
			flag_out[3] =  flag_in_and_iernor[1]	;
		end
	
		if ( reg_ie_i[5] == 1'b1)
		begin
			flag_out[4] = flag_in_and_iernor[2]	;
		end
	
		if ( reg_ie_i[6] == 1'b1)
		begin
			flag_out[5] = flag_in_and_iernor[3]	;
		end
	
		if ( reg_ie_i[1] == 1'b1)
		begin
			flag_out[1] = flag_in_and_iernor[0]	;
		end	
	
		if (reg_ie_i[0] == 1'b1)
		begin
			if (flag_out_reg[0] == 1'b1)
			begin
				flag_out[0] = 1'b1;
				flag_intx_next[0][1] = 1'b0;
			end
			else
			begin
				flag_out[0] = 1'b0;
			end
		end
		
		if (reg_ie_i[2] == 1'b1)
		begin
			if (flag_out_reg[1] == 1'b1)
			begin
				flag_out[2] = 1'b1;
				flag_intx_next[1][1] = 1'b0;
			end
			else
			begin
				flag_out[2] = 1'b0;
			end
		end
	

		if (int_rdy_i == 1'b1 && int_na_i == 1'b1)
		begin
			ier_next = 7'b0;
			ier_ctr_next =7'b0;
		end
		else
		begin
			if (int_na_i == 1'b1)
			begin
				if (ier_ctr == 7'b0)
				begin
					ier_next = 7'b0;
				end
				else
				begin
					ier_ctr_next =7'b0;
				end
			end		
		end
	
		if (int_rdy_i == 1'b1 )
		begin
			if (ier_ctr == 7'b0)
			begin
				ier_next = 7'b0;
			end
			else
			begin
				ier_ctr_next =7'b0;
			end
		end

	if (flag_in_comp != flag_out)
	begin
		int_reg_clr_o	= 1'b1;
	end
	else
	begin
		int_reg_clr_o = 1'b0;
		flag_out = 'b0;
	end

end
endtask

//----------------------------------STATE 2------------------------------------
task TASK_STATE_2;
begin
	flag_out_reg_next[1:0] = 2'b00;	
	flag_out = 6'd0;
end
endtask

//----------------------------------STATE 3------------------------------------
task TASK_STATE_3;
begin
	flag_out_reg_next[1:0] = 2'b00;	
	TASK_EXT_INT(1'd1, 2'd0, 2'd0);	//lo_ok and hi_ok[0], flag_in[0] = IE0
	TASK_EXT_INT(1'd1, 2'd1, 2'd2);	//lo_ok and hi_ok[1], flag_in[2] = IE1
	
	ier_next = ier;
	ier_ctr_next = ier_ctr;
	flag_out = 6'd0;

		if (ier_ctr == 7'd0 && ier == 7'd0)
		begin
			TASK_IER_FULL;
		end
		else
		begin
			if(ier != 7'd0 && ier_ctr == 7'd0)
			begin	
				TASK_IER_CTR;
			end
		end	// if (ier_next == 0)
end
endtask

//----------------------------------STATE 4------------------------------------
task TASK_STATE_4;
begin
	int_vect_o = vect_register;
	flag_out = 6'd0;
	flag_out_reg_next = 2'b0;
	
	if ( reg_ie_i[0] == 1'b1)
	begin
		if (reg_tcon_i[0])
		begin
			if(flag_intx_next[0] == 2'b11 )
			begin
				flag_out_reg_next[0] = 1'b1;

			end
			else
			begin
				flag_out_reg_next[0] = 1'b0;
			end
		end
		else
		begin
			flag_out_reg_next[0]	= flag_intx[0][0] || flag_intx_next[0][0];
		end
	end

	if ( reg_ie_i[2] == 1'b1)
	begin
		if (reg_tcon_i[2])
		begin
			if(flag_intx_next[1] == 2'b11)
			begin
				flag_out_reg_next[1] = 1'b1;

			end
			else
			begin
				flag_out_reg_next[1] = 1'b0;
			end
		end
		else
		begin
			flag_out_reg_next[1]	= flag_intx[1][0] ||  flag_intx_next[1][0];
		end
	end
end
endtask


//----------------------------------int_vect_o---------------------------------
task TASK_VECT_GENERATOR;
input [2:0]vect_interrupt;

begin
	case (vect_interrupt)
		3'd0:	int_vect_o = 3'd1;
		
		3'd1:	int_vect_o = 3'd2;

		3'd2:	int_vect_o = 3'd3;
		
		3'd3:	int_vect_o = 3'd4;
		
		3'd4:	int_vect_o = 3'd6;
		
		3'd5:	int_vect_o = 3'd5;
		
		3'd6:	int_vect_o = 3'd7;
		
		default:	int_vect_o = 3'd0;
		
	endcase
end
endtask

//----------------------------------Priority-----------------------------------
task TASK_IER_CTR;
begin
	case (1'b1)
		flag_and_ie_in_ip[PL_0]: TASK_IER_CTR_OUT(PL_0);

		flag_and_ie_in_ip[PL_1]: TASK_IER_CTR_OUT(PL_1);
		
		flag_and_ie_in_ip[PL_2]: TASK_IER_CTR_OUT(PL_2);
		
		flag_and_ie_in_ip[PL_3]: TASK_IER_CTR_OUT(PL_3);
		
		flag_and_ie_in_ip[PL_4]: TASK_IER_CTR_OUT(PL_4);
		
		flag_and_ie_in_ip[PL_5]: TASK_IER_CTR_OUT(PL_5);
		
		flag_and_ie_in_ip[PL_6]: TASK_IER_CTR_OUT(PL_6);
	endcase
end
endtask

task TASK_IER_FULL;
begin
	if(reg_ip_i[6:0] == 7'd0)
	begin
		case (1'b1)
			flag_and_ie_in[PL_0]: TASK_IER_OUT(PL_0);

			flag_and_ie_in[PL_1]: TASK_IER_OUT(PL_1);
			
			flag_and_ie_in[PL_2]: TASK_IER_OUT(PL_2);
			
			flag_and_ie_in[PL_3]: TASK_IER_OUT(PL_3);
			
			flag_and_ie_in[PL_4]: TASK_IER_OUT(PL_4);
			
			flag_and_ie_in[PL_5]: TASK_IER_OUT(PL_5);
			
			flag_and_ie_in[PL_6]: TASK_IER_OUT(PL_6);
		endcase
	end
	else
	begin
		case (1'b1)
			flag_and_ie_in_ip[PL_0]: TASK_IER_CTR_OUT(PL_0);

			flag_and_ie_in_ip[PL_1]: TASK_IER_CTR_OUT(PL_1);
			
			flag_and_ie_in_ip[PL_2]: TASK_IER_CTR_OUT(PL_2);
			
			flag_and_ie_in_ip[PL_3]: TASK_IER_CTR_OUT(PL_3);
			
			flag_and_ie_in_ip[PL_4]: TASK_IER_CTR_OUT(PL_4);
			
			flag_and_ie_in_ip[PL_5]: TASK_IER_CTR_OUT(PL_5);
			
			flag_and_ie_in_ip[PL_6]: TASK_IER_CTR_OUT(PL_6);
			
			flag_and_ie_in[PL_0]: TASK_IER_OUT(PL_0);

			flag_and_ie_in[PL_1]: TASK_IER_OUT(PL_1);
			
			flag_and_ie_in[PL_2]: TASK_IER_OUT(PL_2);
			
			flag_and_ie_in[PL_3]: TASK_IER_OUT(PL_3);
			
			flag_and_ie_in[PL_4]: TASK_IER_OUT(PL_4);
			
			flag_and_ie_in[PL_5]: TASK_IER_OUT(PL_5);
			
			flag_and_ie_in[PL_6]: TASK_IER_OUT(PL_6);
		endcase
	end
end
endtask

task TASK_IER_CTR_OUT;
input [2:0]pl_var;
begin
	ier_ctr_next[pl_var] = 1'b1;
	TASK_VECT_GENERATOR (pl_var);
end
endtask

task TASK_IER_OUT;
input [2:0]pl_var;
begin
	ier_next[pl_var] = 1'b1;
	TASK_VECT_GENERATOR (pl_var);
end
endtask

//---------------------------------------------------------------------------//
//-------------------------Task- External Interrupt--------------------------//
//---------------------------------------------------------------------------//

task TASK_HIGH;
input [1:0]var_hi_ok;
input flag_control;
begin
	if (hi_ok[var_hi_ok] =='b0)
	begin
		flag_intx_next[var_hi_ok][1] = 1'b1;		// Signal Hi -ok, flag high is set
		hi_ok_next[var_hi_ok] = 'b0;
	end
	else
	begin
		if (flag_control == 1'b0)
		begin
			hi_ok_next[var_hi_ok] = hi_ok[var_hi_ok] - 1;
		end
	end
end
endtask

task TASK_LOW;
input var_lo_ok;
input flag_control;
begin
	if (lo_ok[var_lo_ok] == 'b0)
	begin
		flag_intx_next[var_lo_ok][0] = 1'b1;	// Signal Low -ok, flag low is set
		lo_ok_next[var_lo_ok] = 'b0;
	end
	else
	begin
		if (flag_control == 1'b0)
		begin
			lo_ok_next[var_lo_ok] = lo_ok[var_lo_ok] - 1;
		end
	end
end
endtask

task TASK_EXT_INT;
input flag_control;
input [1:0]var_lo_hi_intx;
input [1:0]var_reg;
begin
	lo_ok_next[var_lo_hi_intx] = NUMBER_S_VAL;
	flag_intx_next[var_lo_hi_intx][1] = flag_intx[var_lo_hi_intx][1];
	hi_ok_next[var_lo_hi_intx] = NUMBER_S_VAL;

  	if (reg_ie_i[var_reg] == 1'b1)
  	begin	
		if (reg_tcon_i[var_reg])									// 0 = level , 1 = transition
		begin
			if (int_intx_b_i[var_lo_hi_intx] == 1'b1)
			begin
				lo_ok_next[var_lo_hi_intx] = NUMBER_S_VAL;
				flag_intx_next[var_lo_hi_intx][0] = 1'b0;		//Clear flag lo_ok
				flag_intx_next[var_lo_hi_intx][1] = 1'b0;		// Signal Hi -ok, flag high is clear
				TASK_HIGH(var_lo_hi_intx, flag_control);
			end	//---if (int_intx_b_i[0])
			else
			begin
				hi_ok_next[var_lo_hi_intx] = NUMBER_S_VAL;
				if (flag_intx[var_lo_hi_intx][1] == 1'b1)		// If Hi flag = 1
				begin
					TASK_LOW(var_lo_hi_intx, flag_control);
				end	//--- if (flag_intx[0][1] == 1'b1)
			end	//---else, if (int_intx_b_i[0])
		end	//--- if (reg_tcon_i[IT0_IN])
		else
		begin
			if (int_intx_b_i[var_lo_hi_intx] == 1'b0)
			begin
				flag_intx_next[var_lo_hi_intx][1] = 1'b0;
				TASK_LOW(var_lo_hi_intx, flag_control);
			end
			else
			begin
				lo_ok_next[var_lo_hi_intx] = NUMBER_S_VAL;
				flag_intx_next[var_lo_hi_intx][0] = 1'b0;
			end
		end	//---else, if (reg_tcon_i[IT0_IN])
	end	//--- if (reg_ie_i[7] == 1'b1 && reg_ie_i[var_reg] == 1'b1)

end
endtask

endmodule
