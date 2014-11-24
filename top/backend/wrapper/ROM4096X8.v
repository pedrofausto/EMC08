//************************************************************************/
// Copyright        : (c) All Rights Reserved
// Company          : X-FAB Semiconductor Foundries AG 
// Address          : Haarbergstr. 67,  D-99097 Erfurt, Germany 
//
// File             : ROM4096X8.v
// Description      : Verilog simulation file
//                  : ROM ROM4096X8
//
// Technology       : xh018 LP3MOS 1.8/3.3 low power CMOS module
// Model version    : V 1.1.1
// Last Modified by : etu
// Created by       :	X-FAB FRONTEND MEMORY COMPILER
//                  :      0.18um ROM XFMC V1.1
// on               : Tue Jun 22 19:31:19 2010
//
// Comment          : If the ATPG tool TetraMAX is used then the following
//		      compiler directive must be set before reading this file:
//
//		      `define ATPG_RUN 
//
//		      To handle negative values of timing checks ($setuphold) the Verilog 
//		      simulator must be started with the option +neg_tchk, otherwise the negative 
//		      values of timing checks are automaticly set to 0.
//		     Also the following compiler directive must be set before reading this file:
//
//		      `define NEG_TCHK 
//
//		      Reading of memory outside of physical address range returns logic "1" data.
//		      The parameter DATA_OUTSIDE_ADDRESS_RANGE controls model behaviour in case of physical address overflow.
//		      This parameter must be set to 8'hX in order to control addressing outside of address space
//		      otherwise 8'hFF
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

primitive ROM4096X8_DFF  (Q, D, C, RN, SN, NOTIFY);

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

module ROM4096X8 (Q, ADR, CLK, ENB, OEB, romvdd, romgnd);

output [7:0]	Q;
input  [11:0]	ADR;
input		CLK, ENB, OEB;
input romvdd, romgnd;

parameter DATA_OUTSIDE_ADDRESS_RANGE = 8'hX;

wire  [7:0]	QI;
wire  [11:0]	ADR_;

reg [7:0] QR;

reg [7:0] ROM_matrix [0:4095];

reg NOTIFY_REG;

`ifdef NEG_TCHK
// -- specify buffers: --
wire   [11:0]   ADR_d;

buf	gBufCLK (CLK_, CLK_d),
	gBufENB (ENB_, ENB_d),
	gBufOEB (OEB_, OEB);
`else
buf	gBufCLK (CLK_, CLK),
	gBufENB (ENB_, ENB),
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

`endif

	bufif0 gBufQ_0_ (Q[0], QI[0], OEB_);
	bufif0 gBufQ_1_ (Q[1], QI[1], OEB_);
	bufif0 gBufQ_2_ (Q[2], QI[2], OEB_);
	bufif0 gBufQ_3_ (Q[3], QI[3], OEB_);
	bufif0 gBufQ_4_ (Q[4], QI[4], OEB_);
	bufif0 gBufQ_5_ (Q[5], QI[5], OEB_);
	bufif0 gBufQ_6_ (Q[6], QI[6], OEB_);
	bufif0 gBufQ_7_ (Q[7], QI[7], OEB_);

not	gNotRomgnd (romgndi, romgnd);
and	gAndSupply (supply_OK, romvdd, romgndi);
not	gNotEnb (enableMem_, ENB_);

`ifdef ATPG_RUN
and	gAndEnm (enableMem, enableMem_, supply_OK);
`else
reg rt;
and	gAndEnm (enableMem, enableMem_, supply_OK, rt);
`endif

ROM4096X8_DFF CHK_FF (Q_OK, supply_OK, CLK_, 1'b1, 1'b1, NOTIFY_REG);

`ifdef ATPG_RUN
`else
integer i;
`endif

	bufif1 gQ_ok_0_ (QI[0], QR[0], Q_OK);
	bufif1 gQ_ok_1_ (QI[1], QR[1], Q_OK);
	bufif1 gQ_ok_2_ (QI[2], QR[2], Q_OK);
	bufif1 gQ_ok_3_ (QI[3], QR[3], Q_OK);
	bufif1 gQ_ok_4_ (QI[4], QR[4], Q_OK);
	bufif1 gQ_ok_5_ (QI[5], QR[5], Q_OK);
	bufif1 gQ_ok_6_ (QI[6], QR[6], Q_OK);
	bufif1 gQ_ok_7_ (QI[7], QR[7], Q_OK);

`ifdef ATPG_RUN
always @(posedge CLK) if(enableMem) QR = ROM_matrix[ADR_];
`else
initial	for(i = 0; i < 4096; i = i + 1) ROM_matrix[i] = ~8'b0;
always @(posedge CLK) if(enableMem)
begin
	if(ADR_ < 4096) QR = ROM_matrix[ADR_];
	else QR = DATA_OUTSIDE_ADDRESS_RANGE;
end
`endif



//*****************************************************************************************
// -- Load Rom Data File (comment out one of these lines) --
//initial $readmemb("ROM4096X8.bin", ROM_matrix);
initial $readmemh("ROM4096X8.vhe", ROM_matrix);
//*****************************************************************************************

// -- timing section: --

specify
      specparam
		ADR_SETUP_TIME	= 0.753,
                ADR_HOLD_TIME	= 0.653,
		ENB_SETUP_TIME	= 0.958,
                ENB_HOLD_TIME	= 0.635,
		CLK_LOW_TIME	= 0.909,
		CLK_HIGH_TIME	= 0.304,
		CYCLE_TIME	= 3.062,
	        ACCESS_TIME	= 3.042,
                LOW_Z_TIME	= 0.249,
                HIGH_Z_TIME	= 0.231;
		
// path delays:
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

	$setuphold  (posedge CLK &&& enableMem, posedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[0]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[0]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[1]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[1]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[2]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[2]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[3]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[3]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[4]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[4]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[5]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[5]);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[6]);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG,,, CLK_d, ADR_d[6]);
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

	$setuphold  (posedge CLK, posedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG,,, CLK_d, ENB_d);
	$setuphold  (posedge CLK, negedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG,,, CLK_d, ENB_d);

`else
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[0], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[1], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[2], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[3], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[4], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[5], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, posedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK &&& enableMem, negedge ADR[6], ADR_SETUP_TIME, ADR_HOLD_TIME, NOTIFY_REG);
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

	$setuphold  (posedge CLK, posedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG);
	$setuphold  (posedge CLK, negedge ENB, ENB_SETUP_TIME, ENB_HOLD_TIME, NOTIFY_REG);

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
	#250 ;		// no ROM activity permitted for first 250ns of sim.
	rt = 1'b1;
	end
reg last_CLK_;
always @(CLK_) 	last_CLK_ <= CLK_;
always @(posedge CLK_)
	begin
		if (ENB_ === 1'bx)  $display ("\n%t: ERROR: %m : ENB is at %b at CLK rising edge:\n", $realtime, ENB);
		if (enableMem === 1'b1)
			begin
				if ((CLK_ == 1'b1 && last_CLK_ === 1'bx) || (CLK_ === 1'bx && last_CLK_ == 1'b0))
				if ($realtime>0.00) $display ("\n%t: ERROR: %m : bad CLK rising edge:\n", $realtime);
			end
		if(rt === 1'b0)
	 		begin
          			if (ENB_ === 1'b0 ) $display ("\n%t: ERROR: %m : ROM enabled during initial 250ns\n", $realtime); 
	 		end
	end
`endif
endmodule // ROM4096X8

`nosuppress_faults
`disable_portfaults
`endcelldefine
