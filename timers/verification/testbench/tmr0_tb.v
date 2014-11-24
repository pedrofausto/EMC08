// ----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// ----------------------------------------------------------------------------
// File Name: t_timerx.v
// Module Name: Timer Testbench
// Author: Hugo Kakisaka/Marcelo Mamoru Ono
//				
// E-mail:
// ----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 08/09/2010 Initial version
//
// ----------------------------------------------------------------------------
// Description
//
// This code implements clock generation testbench for EMC08 Timer/Counter Module, 
// using Verilog language.
// 
// 
// ----------------------------------------------------------------------------


`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"



 module timer0_tb	;	


//---------------------------------------------------------------------------//
//--------------------Constant Parameter-------------------------------------//
//---------------------------------------------------------------------------//			
						
													
  localparam integer PERIOD 		= 50				;	// 20 MHz clock frequency



//---------------------------------------------------------------------------//
//--------------------Testbench Connections----------------------------------//
//---------------------------------------------------------------------------//	 	
												

  reg  clock             		; // 	Clock Input

  reg  reset           			; // 	Synchronous Reset Input

  reg  int0              		;

  reg  tmod_gate_t0  			;

  reg  tmod_m0t0     			;

  reg  tmod_m1t0     			;

  reg  tcon_tr0      			;

  reg  [7:0] th0_i          	;

  reg  [7:0] tm0_i          	;

  reg  [7:0] tl0_i          	;


  wire 		 tcon_tf0 			;

  wire [7:0] th0_o      		;		// Timer 0 Counter Registers
  wire [7:0] tm0_o      		;
  wire [7:0] tl0_o      		;


  
  reg  int1              		;

  reg  tmod_gate_t1  			;

  reg  tmod_m0t1     			;

  reg  tmod_m1t1     			;

  reg  tcon_tr1      			;

  reg  [7:0] th1_i          	;

  reg  [7:0] tm1_i          	;

  reg  [7:0] tl1_i          	;


  wire 		 tcon_tf1 			;

  wire [7:0] th1_o      		;		// Timer 0 Counter Registers
  wire [7:0] tm1_o      		;
  wire [7:0] tl1_o      		;





//---------------------------------------------------------------------------//
//--------------------Module Instance----------------------------------------//
//---------------------------------------------------------------------------//	 	

						
 	top_timers UUT (			
 	 
		 .top_timers_machine_cycle_i  	(clock)     		,
       .top_timers_reset_i          	(reset)				,
//	/*
       .top_timers_int0_i					(int0)      		,
       .top_timers_sfr_tmod_gate_t0_i 	(tmod_gate_t0)		,
       .top_timers_sfr_tmod_m0_t0_i    	(tmod_m0t0)			,
       .top_timers_sfr_tmod_m1_t0_i  	(tmod_m1t0)			,
       .top_timers_sfr_tcon_tr0_i 		(tcon_tr0)			,
       .top_timers_sfr_th0_i          	(th0_i)				,
       .top_timers_sfr_tm0_i          	(tm0_i)				,
       .top_timers_sfr_tl0_i          	(tl0_i)				,
       .top_timers_sfr_tcon_tf0_i     	(tcon_tf0_i)		,          
       .top_timers_sfr_tcon_tf0_o     	(tcon_tf0_o)		,
       .top_timers_sfr_th0_o				(th0_o)	         ,
       .top_timers_sfr_tm0_o          	(tm0_o)				,
       .top_timers_sfr_tl0_o          	(tl0_o)				
//  */   
   /*    	
       .top_timers_int1_i					(int0)      		,
       .top_timers_sfr_tmod_gate_t1_i 	(tmod_gate_t0)		,
       .top_timers_sfr_tmod_m0_t1_i    	(tmod_m0t0)			,
       .top_timers_sfr_tmod_m1_t1_i  	(tmod_m1t0)			,
       .top_timers_sfr_tcon_tr1_i 		(tcon_tr0)			,
       .top_timers_sfr_th1_i          	(th0_i)				,
       .top_timers_sfr_tm1_i          	(tm0_i)				,
       .top_timers_sfr_tl1_i          	(tl0_i)				,
       .top_timers_sfr_tcon_tf1_i     	(tcon_tf0_i)		,          
       .top_timers_sfr_tcon_tf1_o     	(tcon_tf0_o)		,
       .top_timers_sfr_th1_o				(th0_o)	         ,
       .top_timers_sfr_tm1_o          	(tm0_o)				,
       .top_timers_sfr_tl1_o          	(tl0_o)			
*/
				     )					 		;



//---------------------------------------------------------------------------//
//--------------------Clock Generation---------------------------------------//
//---------------------------------------------------------------------------//


 always

	begin

		clock <= 1			;
		#(PERIOD/2)			;
		clock <= 0			;
		#(PERIOD/2)			;

	end



endmodule
	



