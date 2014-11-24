// ----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// ----------------------------------------------------------------------------
// File Name: t_interrupt_prty.v
// Module Name: Interrupt Testbench
// Author: Hugo Kakisaka/Marcelo Mamoru Ono
//				
// E-mail:
// ----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 23/08/2010 Initial version
//
// ----------------------------------------------------------------------------
// Description
//
// This code implements testbench for EMC08 Interrupt Controller Module, 
// using Verilog language.
// 
// 
// ----------------------------------------------------------------------------



`timescale 1 ns / 1 ns


module interrupt_tb;	

parameter PERIOD = 50;


//---------------------------------------------------------------------------//
//--------------------Testbench Connections----------------------------------//
//---------------------------------------------------------------------------//	 	

   // SFR Registers Inputs - BITS: 7 |  6  |  5  |  4  |  3  |  2  |  1  |  0
//   reg_ie_i:     uint(bits:8); // EA |ETXRX| ET2 |  ES | ET1 | EX1 | ET0 | EX0
//   reg_ip_i:     uint(bits:7); //  - |PTXRX| PT2 |  PS | PT1 | PX1 | PT0 | PX0
//   reg_scon_i:   uint(bits:2); //  - |  -  |  -  |  -  |  -  |  -  | TI  | RI 
//   reg_tcon_i:   uint(bits:6); //  - |  -  | TF1 | TF0 | IE1 | IT1 | IE0 | IT0
//   reg_tcon2_i:  uint(bits:2); //  - |  -  |  -  |  -  |  -  |  -  |TXRXF| TF2

//---SFR_TCON
//output [3:0]reg_tcon_o,    //[0] = IE0, [1] = IE1,[2] = TF0, [3] = TF1
//---SFR_TCON2
//output [1:0]reg_tcon2_o,      //[0] = TF2, [1] = TXRXF
												
  reg        clk					;	// Clock Input
  reg        int_rst_sync_b_i	;	// Synchronous Reset Input
  reg  [1:0] int_intx_b_i		;	// External Interrupt 0 and 1 Inputs
  reg        int_rdy_i			;	// Interrupt Routine Finished Flag
  reg        int_na_i			;  // Interrupt Not Accepted Flag
  reg        int_cm_i			;  // Cycle Machine Flag
  reg  [7:0] reg_ie_i			;	
  reg	 [6:0] reg_ip_i			; 
  reg  [1:0] reg_scon_i			;
  reg  [5:0] reg_tcon_i			;
  reg  [1:0] reg_tcon2_i		;
  wire [2:0] int_vect_o			;	// Interrupt Adress Vector Output
  wire [3:0] reg_tcon_o       ;
  wire [1:0] reg_tcon2_o		;
  wire       int_reg_clr_o		;

//---------------------------------------------------------------------------//
//--------------------Module Instance----------------------------------------//
//---------------------------------------------------------------------------//	 	

						
 	INTERRUPT UUT (			
 	 
		.clk 					(clk)						,
		.int_rst_sync_b_i (int_rst_sync_b_i)	,
		.int_intx_b_i		(int_intx_b_i)			,
		.int_rdy_i			(int_rdy_i)				,
		.int_na_i			(int_na_i)				,
		.int_cm_i			(int_cm_i)				,
		.reg_ie_i			(reg_ie_i)				,
		.reg_ip_i			(reg_ip_i)				,
		.reg_scon_i			(reg_scon_i)			,
		.reg_tcon_i			(reg_tcon_i)			,
		.reg_tcon2_i		(reg_tcon2_i)			,
		.int_vect_o			(int_vect_o)			,
		.reg_tcon_o			(reg_tcon_o)			,
		.reg_tcon2_o		(reg_tcon2_o)			,
		.int_reg_clr_o		(int_reg_clr_o)			

				     )									;


always
begin
   clk <= 1'b1;
   #(PERIOD/2);
   clk <= 1'b0;
   #(PERIOD/2);
end
endmodule