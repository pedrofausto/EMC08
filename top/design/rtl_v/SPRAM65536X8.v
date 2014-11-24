//************************************************************************/
// Copyright        : (c) All Rights Reserved
// Company          : X-FAB Semiconductor Foundries AG 
// Address          : Haarbergstr. 67,  D-99097 Erfurt, Germany 
//
// File             : SPRAM65536X8.v
// Description      : Verilog simulation file
//                  : Single-Port RAM SPRAM65536X8
//
// Technology       : xh018 LP3MOS 1.8/3.3 low power CMOS module
// Model version    : V 1.2.1
// Last Modified by : etu
// Created by       :	X-FAB FRONTEND MEMORY COMPILER
//                  :       0.18um SPRAM XFMC V1.2
// on               : Tue Jun 22 19:42:19 2010
//
// Comment          : If the ATPG tool TetraMAX is used then the following
//		      compiler directive must be set before reading this file:
//
//		      `define ATPG_RUN 
//
//		      To handle negative values of timing checks (, ) the Verilog 
//		      simulator must be started with the option +neg_tchk, otherwise the negative 
//		      values of timing checks are automaticly set to 0.
//
//		      `define NEG_TCHK 
//
//		     In order to initialize contents of RAM use 
//		     parameter 'ram_init_file' to define initialization file.
//
//************************************************************************/
//######################################################################################
//#  Copyright (c) X-FAB Semiconductor Foundries AG . All rights reserved.
//#  This Memory Compiler data and the associated documentation are
//#  confidential and proprietary to X-FAB Semiconductor Foundries AG.
//#
//#  DISCLAIMER
//#  The information contained herein is provided by X-FAB Semiconductor
//#  Foundries AG  on an "AS IS" basis without any warranty.
//#
//#  X-FAB Semiconductor Foundries AG disclaims any representation that
//#  the information does not infringe any intellectual property rights or proprietary
//#  rights of any third parties.  There are no other warranties given by
//#  X-FAB, whether express, implied or statutory, including, without limitation,
//#  implied warranties of merchantability and fitness for a particular purpose.
//#
//# In no event X-FAB will be liable or responsible for any expense, losses, damages,
//# or action incurred or undertaken as a result of the receipt of the information.
//#
//#  X-FAB Semiconductor Foundries AG  reserves the right to make changes
//#  to the information at any time and without notice.
//#
//######################################################################################

`resetall
`celldefine
`suppress_faults
`enable_portfaults
`expand_vectornets
`timescale 1ns/10ps

primitive SPRAM65536X8_DFF  (Q, D, C, RN, SN, NOTIFY);

    output Q;
    input  D, C, RN, SN, NOTIFY;
    reg    Q;

// FUNCTION : POSITIVE EDGE TRIGGERED D FLIP-FLOP WITH 
//            ASYNCHRONOUS ACTIVE LOW SET AND CLEAR.

    table

//  D    C    RN    SN   NTFY : Qt  : Qt+1
// ---- ---- ----- ----- ---- : --- : ----
// data clk  rst_n set_n ntfy : Qi  : Q_out           
// ---- ---- ----- ----- ---- : --- : ----

    *	 b    1     1	  ?   :  ?  :  -  ; // data changes, clk stable
    ?	 0    1     1	  ?   :  ?  :  -  ; // clocks off


    1  (0x)   1     ?	  ?   :  1  :  1  ; // possible clk of D=1, but Q=1
    0  (0x)   ?     1	  ?   :  0  :  0  ; // possible clk of D=0, but Q=0

    ?	 ?    1     0	  ?   :  ?  :  1  ; // async set
    ?	 ?    0     1	  ?   :  ?  :  0  ; // async reset

    0  (01)   ?     1	  ?   :  ?  :  0  ; // clocking D=0
    1  (01)   1     ?	  ?   :  ?  :  1  ; // clocking D=1

   					    // reduced pessimism: 
    ?    ?  (?1)    1     ?   :  ?  :  -  ; // ignore the edges on rst_n
    ?    ?    1   (?1)    ?   :  ?  :  -  ; // ignore the edges on set_n

    1  (x1)   1     ?     ?   :  1  :  1  ; // potential pos_edge clk, potential set_n, but D=1 && Qi=1
    0  (x1)   ?     1     ?   :  0  :  0  ; // potential pos_edge clk, potential rst_n, but D=0 && Qi=0

    1  (1x)   1     ?     ?   :  1  :  1  ; // to_x_edge clk, but D=1 && Qi=1
    0  (1x)   ?     1     ?   :  0  :  0  ; // to_x_edge clk, but D=0 && Qi=0

`ifdef    ATPG_RUN

    ?	 *    1     0	  ?   :  ?  :  1  ; // clk while async set	      // ATPG_RUN
    ?	 *    0     1	  ?   :  ?  :  0  ; // clk while async reset	      // ATPG_RUN
    ?	 ?    1     x	  ?   :  1  :  1  ; //   set=X, but Q=1		      // ATPG_RUN
    ?    ?    x     1	  ?   :  0  :  0  ; // reset=X, but Q=0		      // ATPG_RUN

`else
   					    // reduced pessimism: 
    1	 ?    1     x	  ?   :  1  :  1  ; //   set=X, but Q=1    	      // Vlg
    0	 b    1   (0x)	  ?   :  1  :  1  ; //   set=X, D=0, but Q=1   	      // Vlg
    0	 b    1   (1x)	  ?   :  1  :  1  ; //   set=X, D=0, but Q=1   	      // Vlg
   (??)	 b    1     ?	  ?   :  1  :  1  ; //   set=X, D=egdes, but Q=1      // Vlg
    ?  (?0)   1     x	  ?   :  1  :  1  ; //   set=X, neg_edge clk, but Q=1 // Vlg

    0    ?    x     1	  ?   :  0  :  0  ; // reset=X, but Q=0    	      // Vlg
    1    b  (0x)    1	  ?   :  0  :  0  ; // reset=X, D=1, but Q=0   	      // Vlg
    1    b  (1x)    1	  ?   :  0  :  0  ; // reset=X, D=1, but Q=0   	      // Vlg
   (??)  b    ?     1	  ?   :  0  :  0  ; // reset=X, D=egdes, but Q=0      // Vlg
    ?  (?0)   x     1	  ?   :  0  :  0  ; // reset=X, neg_edge clk, but Q=0 // Vlg
 
`endif // ATPG_RUN

    endtable

endprimitive

module SPRAM65536X8 (Q, D, ADR, CLK, ENB, WEB, OEB, ramvdd, ramgnd);

output [7:0]	Q;		// RAM data output

input  [7:0]	D;		// RAM data input bus
input  [15:0]	ADR;		// RAM address bus
input		CLK; 		// RAM clock
input		ENB;		// RAM enable
input		WEB;		// RAM  write enable, 0-active
input		OEB;		// RAM  output enable, 0-active
input 		ramvdd, 	// RAM power
		ramgnd;		// RAM ground

parameter ram_init_file = "";

wire   [7:0]   QI;
wire   [7:0]   D_;
wire   [15:0]   ADR_;

`ifdef NEG_TCHK
// -- specify buffers: --
wire   [7:0]   D_d;
wire   [15:0]   ADR_d;

buf	
	gBufCLK (CLK_, CLK_d),
	gBufENB (ENB_, ENB_d),
	gBufWEB (WEB_, WEB_d),
	gBufOEB (OEB_, OEB);
`else
buf	
	gBufCLK (CLK_, CLK),
	gBufENB (ENB_, ENB),
	gBufWEB (WEB_, WEB),
	gBufOEB (OEB_, OEB);
`endif
`ifdef NEG_TCHK
	buf gBufADR_0_ (ADR_[0], ADR_d[0]);
	buf gBufADR_1_ (ADR_[1], ADR_d[1]);
	buf gBufADR_2_ (ADR_[2], ADR_d[2]);
	buf gBufADR_3_ (ADR_[3], ADR_d[3]);
	buf gBufADR_4_ (ADR_[4], ADR_d[4]);
	buf gBufADR_5_ (ADR_[5], ADR_d[5]);
	buf gBufADR_6_ (ADR_[6], ADR_d[6]);
   buf gBufADR_7_ (ADR_[7], ADR_d[7]);
   buf gBufADR_8_ (ADR_[8], ADR_d[8]);
   buf gBufADR_9_ (ADR_[9], ADR_d[9]);
   buf gBufADR_10_ (ADR_[10], ADR_d[10]);
   buf gBufADR_11_ (ADR_[11], ADR_d[11]);
   buf gBufADR_12_ (ADR_[12], ADR_d[12]);
   buf gBufADR_13_ (ADR_[13], ADR_d[13]);
   buf gBufADR_14_ (ADR_[14], ADR_d[14]);
   buf gBufADR_15_ (ADR_[15], ADR_d[15]);

	buf gBufD_0_ (D_[0], D_d[0]);
	buf gBufD_1_ (D_[1], D_d[1]);
	buf gBufD_2_ (D_[2], D_d[2]);
	buf gBufD_3_ (D_[3], D_d[3]);
	buf gBufD_4_ (D_[4], D_d[4]);
	buf gBufD_5_ (D_[5], D_d[5]);
	buf gBufD_6_ (D_[6], D_d[6]);
	buf gBufD_7_ (D_[7], D_d[7]);
`else
	buf gBufADR_0_ (ADR_[0], ADR[0]);
	buf gBufADR_1_ (ADR_[1], ADR[1]);
	buf gBufADR_2_ (ADR_[2], ADR[2]);
	buf gBufADR_3_ (ADR_[3], ADR[3]);
	buf gBufADR_4_ (ADR_[4], ADR[4]);
	buf gBufADR_5_ (ADR_[5], ADR[5]);
	buf gBufADR_6_ (ADR_[6], ADR[6]);
   buf gBufADR_7_ (ADR_[7], ADR[7]);
   buf gBufADR_8_ (ADR_[8], ADR[8]);
   buf gBufADR_9_ (ADR_[9], ADR[9]);
   buf gBufADR_10_ (ADR_[10], ADR[10]);
   buf gBufADR_11_ (ADR_[11], ADR[11]);
   buf gBufADR_12_ (ADR_[12], ADR[12]);
   buf gBufADR_13_ (ADR_[13], ADR[13]);
   buf gBufADR_14_ (ADR_[14], ADR[14]);
   buf gBufADR_15_ (ADR_[15], ADR[15]);

	buf gBufD_0_ (D_[0], D[0]);
	buf gBufD_1_ (D_[1], D[1]);
	buf gBufD_2_ (D_[2], D[2]);
	buf gBufD_3_ (D_[3], D[3]);
	buf gBufD_4_ (D_[4], D[4]);
	buf gBufD_5_ (D_[5], D[5]);
	buf gBufD_6_ (D_[6], D[6]);
	buf gBufD_7_ (D_[7], D[7]);

`endif

	bufif0 gBufQ_0_ (Q[0], QI[0], OEB_);
	bufif0 gBufQ_1_ (Q[1], QI[1], OEB_);
	bufif0 gBufQ_2_ (Q[2], QI[2], OEB_);
	bufif0 gBufQ_3_ (Q[3], QI[3], OEB_);
	bufif0 gBufQ_4_ (Q[4], QI[4], OEB_);
	bufif0 gBufQ_5_ (Q[5], QI[5], OEB_);
	bufif0 gBufQ_6_ (Q[6], QI[6], OEB_);
	bufif0 gBufQ_7_ (Q[7], QI[7], OEB_);

// logic:
not	gNotRamgnd (ramgndi, ramgnd);
and	gAndSupply (supply_OK, ramvdd, ramgndi);
not     gNotENM  (enable, ENB_);

`ifdef ATPG_RUN
and gAndENM (enableMem, enable, supply_OK);
`else
reg rt;
and gAndENM (enableMem, enable, supply_OK, rt);
`endif
not gNotWeb (WEBB, WEB_);
and gAndCleanWR  (cleanWrite, enableMem, WEBB);
and gAndPossRD  (possRead, enableMem, WEB_);

not gNotCW (cleanWriteN, cleanWrite);
and gAndRW (RW, possRead, cleanWriteN);

//*********************************

reg [7:0] RAM_matrix [0:65535];
reg [7:0] QR;

	bufif1 gBufQI_0_ (QI[0], QR[0], T_OK_Q);
	bufif1 gBufQI_1_ (QI[1], QR[1], T_OK_Q);
	bufif1 gBufQI_2_ (QI[2], QR[2], T_OK_Q);
	bufif1 gBufQI_3_ (QI[3], QR[3], T_OK_Q);
	bufif1 gBufQI_4_ (QI[4], QR[4], T_OK_Q);
	bufif1 gBufQI_5_ (QI[5], QR[5], T_OK_Q);
	bufif1 gBufQI_6_ (QI[6], QR[6], T_OK_Q);
	bufif1 gBufQI_7_ (QI[7], QR[7], T_OK_Q);


reg NOTIFY_REG, NOTIFY_ADR, NOTIFY_WEB;

SPRAM65536X8_DFF CHK_ADR (T_OK_ADR, supply_OK, CLK_, 1'b1, 1'b1, NOTIFY_ADR);

SPRAM65536X8_DFF CHK_Q (T_OK_QI, supply_OK, CLK_, 1'b1, 1'b1, NOTIFY_REG);

SPRAM65536X8_DFF CHK_WEB (RWL, RW, CLK_, 1'b1, 1'b1, NOTIFY_WEB);

and gAndOk (TOK, T_OK_QI, T_OK_ADR, RWL);
not gNotRW (NRWL, RWL);
or gOrOk (T_OK_Q, NRWL, TOK);

//**************************************************
`ifdef ATPG_RUN
`else
initial
begin
	if(ram_init_file !== "") $readmemb(ram_init_file, RAM_matrix);
end
`endif

always @(posedge CLK_) if (possRead) begin
			QR[7:0] = RAM_matrix[ADR_];
		end
`ifdef     ATPG_RUN	
always @(posedge CLK_) if (cleanWrite) begin
			RAM_matrix[ADR_] = D_[7:0];
		end
`else
		else if (cleanWrite) begin
			RAM_matrix[ADR_] = D_[7:0];
		// inconsistent address:
		    if (^ADR_ === 1'bx)
		      begin
		      $display ("\n%t WARNING: %m : RAM write with inconsistent address", $realtime);
		      end 
		    if (ADR_ >= 65536)
		      begin
		      $display ("\n%t WARNING: %m : RAM write to non-existent address(hex) %h", $realtime, ADR);
		      end 
		 end
		else if (cleanWrite === 1'bx) RAM_matrix[ADR_] = 8'hX;
`endif //  ATPG_RUN 

specify
	      specparam
		ADR_SETUP_TIME = 0.611,
		ADR_HOLD_TIME  = 0.106,
		ENB_SETUP_TIME = 0.816,
		ENB_HOLD_TIME  = 0.18,
		WEB_SETUP_TIME = 0.736,
		WEB_HOLD_TIME  = 0.197,
		HIGH_Z_TIME    = 0.258,
		LOW_Z_TIME     = 0.281,
		D_SETUP_TIME   = 0.135,
		D_HOLD_TIME    = 0.408,
		CLK_LOW_TIME   = 0.576,
		CLK_HIGH_TIME  = 0.241,
		CYCLE_TIME     = 1.863,
		ACCESS_TIME    = 1.771;

	(posedge CLK => (Q[0] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[1] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[2] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[3] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[4] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[5] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[6] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);
	(posedge CLK => (Q[7] : 1'b0)) = (ACCESS_TIME, ACCESS_TIME);

	(OEB => Q[0]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[1]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[2]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[3]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[4]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[5]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[6]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);
	(OEB => Q[7]) = (LOW_Z_TIME, LOW_Z_TIME, HIGH_Z_TIME);

`ifdef     NEG_TCHK
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[0]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[0]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[1]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[1]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[2]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[2]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[3]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[3]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[4]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[4]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[5]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[5]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[6]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR,,, CLK_d, ADR_d[6]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[7], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[7]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[7], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[7]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[8], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[8]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[8], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[8]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[9], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[9]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[9], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[9]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[10], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[10]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[10], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[10]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[11], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[11]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[11], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[11]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[12], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[12]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[12], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[12]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[13], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[13]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[13], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[13]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[14], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[14]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[14], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[14]);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[15], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[15]);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[15], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[15]);

	$setuphold  (posedge CLK &&& cleanWrite, posedge D[0], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[0]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[0], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[0]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[1], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[1]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[1], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[1]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[2], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[2]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[2], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[2]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[3], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[3]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[3], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[3]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[4], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[4]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[4], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[4]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[5], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[5]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[5], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[5]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[6], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[6]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[6], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[6]);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[7], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[7]);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[7], D_SETUP_TIME, D_HOLD_TIME,,,, CLK_d, D_d[7]);

	$setuphold  (posedge CLK, posedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG,,, CLK_d, ENB_d);
	$setuphold  (posedge CLK, negedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG,,, CLK_d, ENB_d);

	$setuphold  (posedge CLK &&& enableMem, posedge WEB, WEB_SETUP_TIME, WEB_HOLD_TIME, NOTIFY_WEB,,, CLK_d, WEB_d);
	$setuphold  (posedge CLK &&& enableMem, negedge WEB, WEB_SETUP_TIME, WEB_HOLD_TIME, NOTIFY_WEB,,, CLK_d, WEB_d);

`else
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_ADR);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[7], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[7], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[8], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[8], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[9], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[9], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[10], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[10], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[11], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[11], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[12], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[12], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[13], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[13], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[14], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[14], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, posedge ADR[15], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
   $setuphold  (posedge CLK &&& enableMem, negedge ADR[15], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);

	$setuphold  (posedge CLK &&& cleanWrite, posedge D[0], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[0], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[1], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[1], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[2], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[2], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[3], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[3], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[4], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[4], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[5], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[5], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[6], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[6], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, posedge D[7], D_SETUP_TIME, D_HOLD_TIME);
	$setuphold  (posedge CLK &&& cleanWrite, negedge D[7], D_SETUP_TIME, D_HOLD_TIME);

	$setuphold  (posedge CLK, posedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK, negedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG);

	$setuphold  (posedge CLK &&& enableMem, posedge WEB, WEB_SETUP_TIME, WEB_HOLD_TIME, NOTIFY_WEB);
	$setuphold  (posedge CLK &&& enableMem, negedge WEB, WEB_SETUP_TIME, WEB_HOLD_TIME, NOTIFY_WEB);

`endif
	$width (posedge CLK &&& enableMem, CLK_HIGH_TIME, 0, NOTIFY_REG);
	$width (negedge CLK &&& enableMem, CLK_LOW_TIME, 0, NOTIFY_REG);

	$period (posedge CLK &&& enableMem, CYCLE_TIME, NOTIFY_REG);
	$period (negedge CLK &&& enableMem, CYCLE_TIME, NOTIFY_REG);

endspecify
`ifdef ATPG_RUN
`else
initial begin
	$timeformat (-9, 2, " ns", 0);
	rt = 1'b0;
	#250 ;		// no RAM activity permitted for first 250n sec. of sim.
	rt = 1'b1;
	end
always @(posedge CLK_)
	begin
	if(rt === 1'b0)
		begin
		if (ENB_ === 1'b0 ) $display ("\n%t: ERROR: %m : RAM enabled during initial 250ns: RAM content UNDEFINED\n", $realtime); 
		end
	end
`endif

endmodule

`nosuppress_faults
`disable_portfaults

`endcelldefine

