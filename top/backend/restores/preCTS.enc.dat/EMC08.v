module emc_pads (
	pads_clock_i, 
	pads_clock_mem_i, 
	pads_reset_i, 
	pads_p0_io, 
	pads_p1_io, 
	pads_p2_io, 
	pads_p3_io, 
	pads_p4_o, 
	pads_pht_i, 
	pads_ea_b_i, 
	pads_se_b_i, 
	pads_tm_i, 
	pads_psen_b_o, 
	top_clock_o, 
	top_clock_mem_o, 
	top_reset_o, 
	top_p0_y_o, 
	top_p1_y_o, 
	top_p2_y_o, 
	top_p3_y_o, 
	top_p0_en_i, 
	top_p1_en_i, 
	top_p2_en_i, 
	top_p3_en_i, 
	top_p0_a_i, 
	top_p1_a_i, 
	top_p2_a_i, 
	top_p3_a_i, 
	top_p4_a_i, 
	top_pht_o, 
	top_ea_b_o, 
	top_scan_enable_b_o, 
	top_test_mode_o, 
	top_psen_b_i);
   input pads_clock_i;
   input pads_clock_mem_i;
   input pads_reset_i;
   inout [7:0] pads_p0_io;
   inout [7:0] pads_p1_io;
   inout [7:0] pads_p2_io;
   inout [7:0] pads_p3_io;
   output [7:0] pads_p4_o;
   input pads_pht_i;
   input pads_ea_b_i;
   input pads_se_b_i;
   input pads_tm_i;
   output pads_psen_b_o;
   output top_clock_o;
   output top_clock_mem_o;
   output top_reset_o;
   output [7:0] top_p0_y_o;
   output [7:0] top_p1_y_o;
   output [7:0] top_p2_y_o;
   output [7:0] top_p3_y_o;
   input [7:0] top_p0_en_i;
   input [7:0] top_p1_en_i;
   input [7:0] top_p2_en_i;
   input [7:0] top_p3_en_i;
   input [7:0] top_p0_a_i;
   input [7:0] top_p1_a_i;
   input [7:0] top_p2_a_i;
   input [7:0] top_p3_a_i;
   input [7:0] top_p4_a_i;
   output top_pht_o;
   output top_ea_b_o;
   output top_scan_enable_b_o;
   output top_test_mode_o;
   input top_psen_b_i;

   // Internal wires
   wire LTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;

   LOGIC1 LTIE_LTIEHI (.Q(LTIE_LTIEHI_NET));
   LOGIC0 LTIE_LTIELO (.Q(LTIE_LTIELO_NET));
   ICUDP P_CLOCK (.Y(top_clock_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_clock_i));
   ICUDP P_CLOCK_MEM (.Y(top_clock_mem_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_clock_mem_i));
   ICUDP P_RESET (.Y(top_reset_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_reset_i));
   BBCUD8P P_PORT0_0 (.Y(top_p0_y_o[0]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[0]), 
	.EN(top_p0_en_i[0]), 
	.A(top_p0_a_i[0]));
   BBCUD8P P_PORT0_1 (.Y(top_p0_y_o[1]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[1]), 
	.EN(top_p0_en_i[1]), 
	.A(top_p0_a_i[1]));
   BBCUD8P P_PORT0_2 (.Y(top_p0_y_o[2]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[2]), 
	.EN(top_p0_en_i[2]), 
	.A(top_p0_a_i[2]));
   BBCUD8P P_PORT0_3 (.Y(top_p0_y_o[3]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[3]), 
	.EN(top_p0_en_i[3]), 
	.A(top_p0_a_i[3]));
   BBCUD8P P_PORT0_4 (.Y(top_p0_y_o[4]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[4]), 
	.EN(top_p0_en_i[4]), 
	.A(top_p0_a_i[4]));
   BBCUD8P P_PORT0_5 (.Y(top_p0_y_o[5]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[5]), 
	.EN(top_p0_en_i[5]), 
	.A(top_p0_a_i[5]));
   BBCUD8P P_PORT0_6 (.Y(top_p0_y_o[6]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[6]), 
	.EN(top_p0_en_i[6]), 
	.A(top_p0_a_i[6]));
   BBCUD8P P_PORT0_7 (.Y(top_p0_y_o[7]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[7]), 
	.EN(top_p0_en_i[7]), 
	.A(top_p0_a_i[7]));
   BBCUD8P P_PORT1_0 (.Y(top_p1_y_o[0]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[0]), 
	.EN(top_p1_en_i[0]), 
	.A(top_p1_a_i[0]));
   BBCUD8P P_PORT1_1 (.Y(top_p1_y_o[1]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[1]), 
	.EN(top_p1_en_i[1]), 
	.A(top_p1_a_i[1]));
   BBCUD8P P_PORT1_2 (.Y(top_p1_y_o[2]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[2]), 
	.EN(top_p1_en_i[2]), 
	.A(top_p1_a_i[2]));
   BBCUD8P P_PORT1_3 (.Y(top_p1_y_o[3]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[3]), 
	.EN(top_p1_en_i[3]), 
	.A(top_p1_a_i[3]));
   BBCUD8P P_PORT1_4 (.Y(top_p1_y_o[4]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[4]), 
	.EN(top_p1_en_i[4]), 
	.A(top_p1_a_i[4]));
   BBCUD8P P_PORT1_5 (.Y(top_p1_y_o[5]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[5]), 
	.EN(top_p1_en_i[5]), 
	.A(top_p1_a_i[5]));
   BBCUD8P P_PORT1_6 (.Y(top_p1_y_o[6]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[6]), 
	.EN(top_p1_en_i[6]), 
	.A(top_p1_a_i[6]));
   BBCUD8P P_PORT1_7 (.Y(top_p1_y_o[7]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[7]), 
	.EN(top_p1_en_i[7]), 
	.A(top_p1_a_i[7]));
   BBCUD8P P_PORT2_0 (.Y(top_p2_y_o[0]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[0]), 
	.EN(top_p2_en_i[0]), 
	.A(top_p2_a_i[0]));
   BBCUD8P P_PORT2_1 (.Y(top_p2_y_o[1]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[1]), 
	.EN(top_p2_en_i[1]), 
	.A(top_p2_a_i[1]));
   BBCUD8P P_PORT2_2 (.Y(top_p2_y_o[2]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[2]), 
	.EN(top_p2_en_i[2]), 
	.A(top_p2_a_i[2]));
   BBCUD8P P_PORT2_3 (.Y(top_p2_y_o[3]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[3]), 
	.EN(top_p2_en_i[3]), 
	.A(top_p2_a_i[3]));
   BBCUD8P P_PORT2_4 (.Y(top_p2_y_o[4]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[4]), 
	.EN(top_p2_en_i[4]), 
	.A(top_p2_a_i[4]));
   BBCUD8P P_PORT2_5 (.Y(top_p2_y_o[5]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[5]), 
	.EN(top_p2_en_i[5]), 
	.A(top_p2_a_i[5]));
   BBCUD8P P_PORT2_6 (.Y(top_p2_y_o[6]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[6]), 
	.EN(top_p2_en_i[6]), 
	.A(top_p2_a_i[6]));
   BBCUD8P P_PORT2_7 (.Y(top_p2_y_o[7]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[7]), 
	.EN(top_p2_en_i[7]), 
	.A(top_p2_a_i[7]));
   BBCUD8P P_PORT3_0 (.Y(top_p3_y_o[0]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[0]), 
	.EN(top_p3_en_i[0]), 
	.A(top_p3_a_i[0]));
   BBCUD8P P_PORT3_1 (.Y(top_p3_y_o[1]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[1]), 
	.EN(top_p3_en_i[1]), 
	.A(top_p3_a_i[1]));
   BBCUD8P P_PORT3_2 (.Y(top_p3_y_o[2]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[2]), 
	.EN(top_p3_en_i[2]), 
	.A(top_p3_a_i[2]));
   BBCUD8P P_PORT3_3 (.Y(top_p3_y_o[3]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[3]), 
	.EN(top_p3_en_i[3]), 
	.A(top_p3_a_i[3]));
   BBCUD8P P_PORT3_4 (.Y(top_p3_y_o[4]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[4]), 
	.EN(top_p3_en_i[4]), 
	.A(top_p3_a_i[4]));
   BBCUD8P P_PORT3_5 (.Y(top_p3_y_o[5]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[5]), 
	.EN(top_p3_en_i[5]), 
	.A(top_p3_a_i[5]));
   BBCUD8P P_PORT3_6 (.Y(top_p3_y_o[6]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[6]), 
	.EN(top_p3_en_i[6]), 
	.A(top_p3_a_i[6]));
   BBCUD8P P_PORT3_7 (.Y(top_p3_y_o[7]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[7]), 
	.EN(top_p3_en_i[7]), 
	.A(top_p3_a_i[7]));
   BD8P P_PORT4_0 (.PAD(pads_p4_o[0]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[0]));
   BD8P P_PORT4_1 (.PAD(pads_p4_o[1]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[1]));
   BD8P P_PORT4_2 (.PAD(pads_p4_o[2]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[2]));
   BD8P P_PORT4_3 (.PAD(pads_p4_o[3]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[3]));
   BD8P P_PORT4_4 (.PAD(pads_p4_o[4]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[4]));
   BD8P P_PORT4_5 (.PAD(pads_p4_o[5]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[5]));
   BD8P P_PORT4_6 (.PAD(pads_p4_o[6]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[6]));
   BD8P P_PORT4_7 (.PAD(pads_p4_o[7]), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_p4_a_i[7]));
   ICUDP P_PHT (.Y(top_pht_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_pht_i));
   ICUDP P_EA_B (.Y(top_ea_b_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_ea_b_i));
   ICUDP P_SE_B (.Y(top_scan_enable_b_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_se_b_i));
   ICUDP P_TEST_MODE (.Y(top_test_mode_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(LTIE_LTIEHI_NET), 
	.PAD(pads_tm_i));
   BD8P P_PSEN_B (.PAD(pads_psen_b_o), 
	.EN(LTIE_LTIELO_NET), 
	.A(top_psen_b_i));
   GNDORPADP P_GND_0 ();
   GNDORPADP P_GND_1 ();
   VDDORPADP P_VDD_3_3V ();
   VDDPADP P_VDD_1_8V_0 ();
   CORNERP P_CORNER_NE ();
   CORNERP P_CORNER_NW ();
   CORNERP P_CORNER_SE ();
   CORNERP P_CORNER_SW ();
endmodule

// Generated by Cadence Encounter(R) RTL Compiler v07.20-p004_1
module increment_unsigned_6_7 (
	A, 
	CI, 
	Z);
   input [14:0] A;
   input CI;
   output [15:0] Z;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_4;
   wire n_6;
   wire n_8;
   wire n_10;
   wire n_12;
   wire n_14;
   wire n_16;
   wire n_18;
   wire n_20;
   wire n_22;
   wire n_24;

   assign Z[0] = 1'b0 ;
   assign Z[15] = 1'b0 ;

   EN2X0 p30522A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   EN2X0 p30699A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p30282A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p30865A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p29982A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p31046A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p29696A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p31209A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p29391A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p31401A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p29116A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p31553A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p28800A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p31757A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p28537A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p31900A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p28213A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p32113A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p27959A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p32245A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p27624A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p32483A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p27394A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p32758A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p27197A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p32845A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p27193A (.Q(n_0), 
	.B(A[1]), 
	.A(A[0]));
endmodule

module increment_unsigned_6_7_4011 (
	A, 
	CI, 
	Z);
   input [14:0] A;
   input CI;
   output [15:0] Z;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_4;
   wire n_6;
   wire n_8;
   wire n_10;
   wire n_12;
   wire n_14;
   wire n_16;
   wire n_18;
   wire n_20;
   wire n_22;
   wire n_24;

   assign Z[0] = 1'b0 ;
   assign Z[15] = 1'b0 ;

   EN2X0 p30171A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   EN2X0 p30348A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p29931A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p30514A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p29631A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p30696A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p29344A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p30858A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p29040A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p31050A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p28764A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p31202A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p28449A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p31406A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p28186A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p31549A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p27862A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p31762A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p27608A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p31894A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p27273A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p32132A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p27043A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p32407A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p26846A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p32495A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p26842A (.Q(n_0), 
	.B(A[1]), 
	.A(A[0]));
endmodule

module baud_rate (
	system_clk_i, 
	system_rst_i_b, 
	baud_rate_scon_sm0_i, 
	baud_rate_scon_sm1_i, 
	baud_rate_scon_sm2_i, 
	baud_rate_pcon_smod_i, 
	baud_rate_pcon_rs232_i, 
	baud_rate_cm_o, 
	baud_rate_br_trans_o, 
	baud_rate_br_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2, 
	SPCASCAN_N1, 
	FE_PT1_top_p2_a_o_0_, 
	SPCASCAN_N2, 
	FE_PT1_top_p2_a_o_1_);
   input system_clk_i;
   input system_rst_i_b;
   input baud_rate_scon_sm0_i;
   input baud_rate_scon_sm1_i;
   input baud_rate_scon_sm2_i;
   input baud_rate_pcon_smod_i;
   input baud_rate_pcon_rs232_i;
   output baud_rate_cm_o;
   output baud_rate_br_trans_o;
   output baud_rate_br_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;
   output SPCASCAN_N1;
   input FE_PT1_top_p2_a_o_0_;
   output SPCASCAN_N2;
   input FE_PT1_top_p2_a_o_1_;

   // Internal wires
   wire UNCONNECTED;
   wire UNCONNECTED0;
   wire UNCONNECTED1;
   wire UNCONNECTED2;
   wire \baud_rate_RS232_counter[0] ;
   wire \baud_rate_RS232_counter[1] ;
   wire \baud_rate_RS232_counter[2] ;
   wire \baud_rate_RS232_counter[3] ;
   wire \baud_rate_RS232_counter[4] ;
   wire \baud_rate_RS232_counter[5] ;
   wire \baud_rate_RS232_counter[6] ;
   wire \baud_rate_RS232_counter[7] ;
   wire \baud_rate_RS232_counter[8] ;
   wire \baud_rate_RS232_counter[9] ;
   wire \baud_rate_RS232_counter[10] ;
   wire \baud_rate_RS232_counter[11] ;
   wire \baud_rate_RS232_counter[12] ;
   wire \baud_rate_RS232_counter[13] ;
   wire \baud_rate_RS232_counter[14] ;
   wire \baud_rate_RS232_trans_counter[0] ;
   wire \baud_rate_RS232_trans_counter[1] ;
   wire \baud_rate_RS232_trans_counter[2] ;
   wire \baud_rate_RS232_trans_counter[3] ;
   wire \baud_rate_RS232_trans_counter[4] ;
   wire \baud_rate_RS232_trans_counter[5] ;
   wire \baud_rate_RS232_trans_counter[6] ;
   wire \baud_rate_RS232_trans_counter[7] ;
   wire \baud_rate_RS232_trans_counter[8] ;
   wire \baud_rate_RS232_trans_counter[9] ;
   wire \baud_rate_RS232_trans_counter[10] ;
   wire \baud_rate_RS232_trans_counter[11] ;
   wire \baud_rate_RS232_trans_counter[12] ;
   wire \baud_rate_RS232_trans_counter[13] ;
   wire \baud_rate_RS232_trans_counter[14] ;
   wire \baud_rate_RS232_width[0] ;
   wire \baud_rate_RS232_width[1] ;
   wire \baud_rate_RS232_width[2] ;
   wire \baud_rate_RS232_width[3] ;
   wire \baud_rate_RS232_width[4] ;
   wire \baud_rate_RS232_width[5] ;
   wire \baud_rate_RS232_width[6] ;
   wire \baud_rate_RS232_width[7] ;
   wire \baud_rate_RS232_width[8] ;
   wire \baud_rate_RS232_width[9] ;
   wire \baud_rate_RS232_width[10] ;
   wire \baud_rate_RS232_width[11] ;
   wire \baud_rate_RS232_width[12] ;
   wire \baud_rate_RS232_width[13] ;
   wire \baud_rate_RS232_width[14] ;
   wire \baud_rate_counter[0] ;
   wire \baud_rate_counter[1] ;
   wire \baud_rate_counter[2] ;
   wire \baud_rate_counter[3] ;
   wire \baud_rate_counter[4] ;
   wire \baud_rate_trans_counter[0] ;
   wire \baud_rate_trans_counter[1] ;
   wire \baud_rate_width[0] ;
   wire \baud_rate_width[1] ;
   wire \baud_rate_width[2] ;
   wire \baud_rate_width[3] ;
   wire \baud_rate_width[4] ;
   wire logic_0_1_net;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_13;
   wire n_17;
   wire n_18;
   wire n_20;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_236;
   wire n_237;
   wire n_238;

   increment_unsigned_6_7 inc_add_148_79 (.A({ \baud_rate_RS232_trans_counter[14] ,
		\baud_rate_RS232_trans_counter[13] ,
		\baud_rate_RS232_trans_counter[12] ,
		\baud_rate_RS232_trans_counter[11] ,
		\baud_rate_RS232_trans_counter[10] ,
		\baud_rate_RS232_trans_counter[9] ,
		\baud_rate_RS232_trans_counter[8] ,
		\baud_rate_RS232_trans_counter[7] ,
		\baud_rate_RS232_trans_counter[6] ,
		\baud_rate_RS232_trans_counter[5] ,
		\baud_rate_RS232_trans_counter[4] ,
		\baud_rate_RS232_trans_counter[3] ,
		\baud_rate_RS232_trans_counter[2] ,
		\baud_rate_RS232_trans_counter[1] ,
		\baud_rate_RS232_trans_counter[0]  }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED,
		n_202,
		n_203,
		n_205,
		n_206,
		n_207,
		n_208,
		n_209,
		n_210,
		n_211,
		n_212,
		n_213,
		n_214,
		n_215,
		n_216,
		UNCONNECTED0 }));
   increment_unsigned_6_7_4011 inc_add_246_76 (.A({ \baud_rate_RS232_counter[14] ,
		\baud_rate_RS232_counter[13] ,
		\baud_rate_RS232_counter[12] ,
		\baud_rate_RS232_counter[11] ,
		\baud_rate_RS232_counter[10] ,
		\baud_rate_RS232_counter[9] ,
		\baud_rate_RS232_counter[8] ,
		\baud_rate_RS232_counter[7] ,
		\baud_rate_RS232_counter[6] ,
		SPCASCAN_N1,
		\baud_rate_RS232_counter[4] ,
		\baud_rate_RS232_counter[3] ,
		\baud_rate_RS232_counter[2] ,
		\baud_rate_RS232_counter[1] ,
		\baud_rate_RS232_counter[0]  }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED1,
		n_188,
		n_189,
		n_190,
		n_191,
		n_192,
		n_193,
		n_194,
		n_195,
		n_196,
		n_197,
		n_198,
		n_199,
		n_200,
		n_201,
		UNCONNECTED2 }));
   SDFRX0 \baud_rate_RS232_width_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[14] ), 
	.QN(\baud_rate_RS232_width[0] ), 
	.Q(n_227), 
	.D(logic_0_1_net), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[10]  (.SE(DFT_sen), 
	.SD(n_233), 
	.QN(\baud_rate_RS232_width[10] ), 
	.Q(DFT_sdo), 
	.D(n_174), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[13]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[11] ), 
	.QN(\baud_rate_RS232_width[13] ), 
	.Q(SPCASCAN_N2), 
	.D(n_159), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[14]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.QN(\baud_rate_RS232_width[14] ), 
	.Q(n_237), 
	.D(n_166), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[3] ), 
	.QN(\baud_rate_RS232_width[1] ), 
	.Q(n_228), 
	.D(n_157), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[13] ), 
	.QN(\baud_rate_RS232_width[2] ), 
	.Q(n_229), 
	.D(n_156), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[1] ), 
	.QN(\baud_rate_RS232_width[4] ), 
	.Q(n_230), 
	.D(n_155), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[6]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[7] ), 
	.QN(\baud_rate_RS232_width[6] ), 
	.Q(n_231), 
	.D(logic_0_1_net), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[8]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[8] ), 
	.QN(\baud_rate_RS232_width[8] ), 
	.Q(n_232), 
	.D(n_174), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_RS232_width_reg[9]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[11] ), 
	.QN(\baud_rate_RS232_width[9] ), 
	.Q(n_233), 
	.D(n_169), 
	.C(system_clk_i));
   SDFRX0 \baud_rate_width_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[0] ), 
	.QN(\baud_rate_width[4] ), 
	.Q(n_238), 
	.D(n_151), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_counter_reg[1]  (.SE(DFT_sen), 
	.SD(n_237), 
	.Q(\baud_rate_counter[1] ), 
	.D(n_173), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_counter_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[1] ), 
	.Q(\baud_rate_counter[2] ), 
	.D(n_172), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_counter_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[3] ), 
	.Q(\baud_rate_counter[4] ), 
	.D(n_168), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_counter_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[2] ), 
	.Q(\baud_rate_counter[3] ), 
	.D(n_164), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_width_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[12] ), 
	.Q(\baud_rate_RS232_width[3] ), 
	.D(n_167), 
	.C(system_clk_i));
   SDFRQX0 baud_rate_br_o_reg (.SE(DFT_sen), 
	.SD(\baud_rate_counter[4] ), 
	.Q(baud_rate_br_o), 
	.D(n_160), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_width[2] ), 
	.Q(\baud_rate_counter[0] ), 
	.D(n_163), 
	.C(system_clk_i));
   SDFRQX0 baud_rate_br_trans_o_reg (.SE(DFT_sen), 
	.SD(\baud_rate_trans_counter[1] ), 
	.Q(baud_rate_br_trans_o), 
	.D(n_152), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_width_reg[12]  (.SE(DFT_sen), 
	.SD(baud_rate_br_trans_o), 
	.Q(\baud_rate_RS232_width[12] ), 
	.D(n_174), 
	.C(system_clk_i));
   AO32X0 p13463A (.Q(n_173), 
	.E(\baud_rate_counter[1] ), 
	.D(n_171), 
	.C(n_17), 
	.B(\baud_rate_counter[0] ), 
	.A(n_138));
   AO22X0 p13434A (.Q(n_172), 
	.D(n_138), 
	.C(n_40), 
	.B(n_171), 
	.A(\baud_rate_counter[2] ));
   SDFRQX0 \baud_rate_RS232_width_reg[11]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[12] ), 
	.Q(\baud_rate_RS232_width[11] ), 
	.D(n_169), 
	.C(system_clk_i));
   AO22X0 p13796A (.Q(n_168), 
	.D(n_138), 
	.C(n_55), 
	.B(n_154), 
	.A(\baud_rate_counter[4] ));
   AO21X0 p13187A (.Q(n_167), 
	.C(n_166), 
	.B(baud_rate_scon_sm1_i), 
	.A(n_165));
   SDFRQX0 \baud_rate_RS232_width_reg[5]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[6] ), 
	.Q(\baud_rate_RS232_width[5] ), 
	.D(n_158), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_width_reg[7]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[11] ), 
	.Q(\baud_rate_RS232_width[7] ), 
	.D(n_165), 
	.C(system_clk_i));
   ON32X0 p13528A (.Q(n_164), 
	.E(n_8), 
	.D(n_153), 
	.C(n_150), 
	.B(\baud_rate_counter[3] ), 
	.A(n_147));
   SDFRQX0 \baud_rate_RS232_counter_reg[10]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[9] ), 
	.Q(\baud_rate_RS232_counter[10] ), 
	.D(n_129), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[12]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[12] ), 
	.Q(\baud_rate_RS232_counter[12] ), 
	.D(n_131), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[0] ), 
	.Q(\baud_rate_RS232_counter[1] ), 
	.D(n_127), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[13]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[14] ), 
	.Q(\baud_rate_RS232_counter[13] ), 
	.D(n_130), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[14]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[0] ), 
	.Q(\baud_rate_RS232_counter[14] ), 
	.D(n_128), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[2]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(\baud_rate_RS232_counter[2] ), 
	.D(n_126), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[4] ), 
	.Q(\baud_rate_RS232_counter[3] ), 
	.D(n_125), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[2] ), 
	.Q(\baud_rate_RS232_counter[4] ), 
	.D(n_124), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[5]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[6] ), 
	.Q(SPCASCAN_N1), 
	.D(n_144), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[6]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[7] ), 
	.Q(\baud_rate_RS232_counter[6] ), 
	.D(n_123), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[8]  (.SE(DFT_sen), 
	.SD(n_231), 
	.Q(\baud_rate_RS232_counter[8] ), 
	.D(n_140), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[7]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[9] ), 
	.Q(\baud_rate_RS232_counter[7] ), 
	.D(n_145), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[9]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[8] ), 
	.Q(\baud_rate_RS232_counter[9] ), 
	.D(n_141), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[3] ), 
	.Q(\baud_rate_RS232_counter[0] ), 
	.D(n_139), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_counter_reg[11]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[10] ), 
	.Q(\baud_rate_RS232_counter[11] ), 
	.D(n_132), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_trans_counter_reg[0]  (.SE(DFT_sen), 
	.SD(baud_rate_br_o), 
	.Q(\baud_rate_trans_counter[0] ), 
	.D(n_134), 
	.C(system_clk_i));
   AO21X0 p13920A (.Q(n_163), 
	.C(n_162), 
	.B(n_161), 
	.A(\baud_rate_counter[0] ));
   OR2X0 p13434A4462 (.Q(n_171), 
	.B(n_161), 
	.A(n_162));
   AO21X0 p13695A (.Q(n_160), 
	.C(n_149), 
	.B(baud_rate_br_o), 
	.A(n_148));
   OR2X0 p13611A (.Q(n_169), 
	.B(n_165), 
	.A(n_159));
   NO2I1X0 p13187A4463 (.Q(n_166), 
	.B(baud_rate_scon_sm2_i), 
	.AN(n_159));
   OR2X0 p13515A (.Q(n_174), 
	.B(n_158), 
	.A(n_159));
   AND2X0 p13788A (.Q(n_157), 
	.B(baud_rate_scon_sm1_i), 
	.A(n_158));
   AND2X0 p13623A (.Q(n_156), 
	.B(baud_rate_scon_sm2_i), 
	.A(n_159));
   AO21X0 p13848A (.Q(n_155), 
	.C(n_165), 
	.B(baud_rate_scon_sm1_i), 
	.A(n_146));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[1] ), 
	.Q(\baud_rate_RS232_trans_counter[0] ), 
	.D(n_106), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[10]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p2_a_o_0_), 
	.Q(\baud_rate_RS232_trans_counter[10] ), 
	.D(n_121), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[11]  (.SE(DFT_sen), 
	.SD(n_232), 
	.Q(\baud_rate_RS232_trans_counter[11] ), 
	.D(n_119), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[12]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[13] ), 
	.Q(\baud_rate_RS232_trans_counter[12] ), 
	.D(n_118), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[13]  (.SE(DFT_sen), 
	.SD(n_227), 
	.Q(\baud_rate_RS232_trans_counter[13] ), 
	.D(n_117), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[4] ), 
	.Q(\baud_rate_RS232_trans_counter[3] ), 
	.D(n_113), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[3] ), 
	.Q(\baud_rate_RS232_trans_counter[2] ), 
	.D(n_114), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[5] ), 
	.Q(\baud_rate_RS232_trans_counter[4] ), 
	.D(n_112), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[5]  (.SE(DFT_sen), 
	.SD(n_230), 
	.Q(\baud_rate_RS232_trans_counter[5] ), 
	.D(n_111), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[6]  (.SE(DFT_sen), 
	.SD(n_228), 
	.Q(\baud_rate_RS232_trans_counter[6] ), 
	.D(n_110), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[7]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[5] ), 
	.Q(\baud_rate_RS232_trans_counter[7] ), 
	.D(n_109), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[2] ), 
	.Q(\baud_rate_RS232_trans_counter[1] ), 
	.D(n_115), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[8]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[7] ), 
	.Q(\baud_rate_RS232_trans_counter[8] ), 
	.D(n_108), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[9]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[10] ), 
	.Q(\baud_rate_RS232_trans_counter[9] ), 
	.D(n_107), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[14]  (.SE(DFT_sen), 
	.SD(n_229), 
	.Q(\baud_rate_RS232_trans_counter[14] ), 
	.D(n_116), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_trans_counter_reg[1]  (.SE(DFT_sen), 
	.SD(baud_rate_cm_o), 
	.Q(\baud_rate_trans_counter[1] ), 
	.D(n_105), 
	.C(system_clk_i));
   INX0 p13796A4480 (.Q(n_154), 
	.A(n_153));
   AO22X0 p13894A (.Q(n_152), 
	.D(n_135), 
	.C(baud_rate_br_trans_o), 
	.B(n_151), 
	.A(n_136));
   NO2X0 p13434A4481 (.Q(n_162), 
	.B(n_147), 
	.A(\baud_rate_counter[0] ));
   AN21X0 p13795A (.Q(n_153), 
	.C(n_161), 
	.B(n_138), 
	.A(n_150));
   NO3I1X0 p13695A4482 (.Q(n_149), 
	.C(baud_rate_br_o), 
	.B(n_148), 
	.AN(system_rst_i_b));
   INX0 p13528A4483 (.Q(n_147), 
	.A(n_138));
   NO2I1X0 p13189A (.Q(n_159), 
	.B(baud_rate_scon_sm1_i), 
	.AN(n_146));
   AND2X0 p13744A (.Q(n_165), 
	.B(baud_rate_scon_sm2_i), 
	.A(n_146));
   NO2I1X0 p13648A (.Q(n_158), 
	.B(baud_rate_scon_sm2_i), 
	.AN(n_146));
   SDFRQX0 \baud_rate_width_reg[5]  (.SE(DFT_sen), 
	.SD(\baud_rate_width[3] ), 
	.Q(DFT_sdo_2), 
	.D(n_120), 
	.C(system_clk_i));
   AO22X0 p14602A (.Q(n_145), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[7] ), 
	.B(n_143), 
	.A(n_195));
   AO22X0 p14602A4485 (.Q(n_144), 
	.D(n_142), 
	.C(SPCASCAN_N1), 
	.B(n_143), 
	.A(n_197));
   AO22X0 p14602A4486 (.Q(n_141), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[9] ), 
	.B(n_143), 
	.A(n_193));
   AO22X0 p14602A4487 (.Q(n_140), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[8] ), 
	.B(n_143), 
	.A(n_194));
   MU2X0 p14654A (.S(\baud_rate_RS232_counter[0] ), 
	.Q(n_139), 
	.IN1(n_142), 
	.IN0(n_143));
   ON31X0 p13893A (.Q(n_136), 
	.D(n_78), 
	.C(n_133), 
	.B(baud_rate_br_trans_o), 
	.A(n_135));
   AO32X0 p14625A (.Q(n_134), 
	.E(\baud_rate_trans_counter[0] ), 
	.D(n_135), 
	.C(n_103), 
	.B(n_133), 
	.A(n_151));
   SDFRQX0 baud_rate_cm_o_reg (.SE(DFT_sen), 
	.SD(\baud_rate_width[0] ), 
	.Q(baud_rate_cm_o), 
	.D(n_102), 
	.C(system_clk_i));
   AO22X0 p14602A4490 (.Q(n_132), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[11] ), 
	.B(n_143), 
	.A(n_191));
   AO22X0 p14602A4491 (.Q(n_131), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[12] ), 
	.B(n_143), 
	.A(n_190));
   AO22X0 p14602A4492 (.Q(n_130), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[13] ), 
	.B(n_143), 
	.A(n_189));
   AO22X0 p14602A4493 (.Q(n_129), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[10] ), 
	.B(n_143), 
	.A(n_192));
   AO22X0 p14602A4494 (.Q(n_128), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[14] ), 
	.B(n_143), 
	.A(n_188));
   AO22X0 p14602A4495 (.Q(n_127), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[1] ), 
	.B(n_143), 
	.A(n_201));
   AO22X0 p14602A4496 (.Q(n_126), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[2] ), 
	.B(n_143), 
	.A(n_200));
   AO22X0 p14602A4497 (.Q(n_125), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[3] ), 
	.B(n_143), 
	.A(n_199));
   AO22X0 p14602A4498 (.Q(n_124), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[4] ), 
	.B(n_143), 
	.A(n_198));
   AO22X0 p14602A4499 (.Q(n_123), 
	.D(n_142), 
	.C(\baud_rate_RS232_counter[6] ), 
	.B(n_143), 
	.A(n_196));
   NA2I1X0 p13692A (.Q(n_148), 
	.B(n_122), 
	.AN(n_143));
   NO2I1X0 p13494A (.Q(n_138), 
	.B(n_122), 
	.AN(n_104));
   AND2X0 p14684A (.Q(n_121), 
	.B(n_135), 
	.A(n_207));
   AND2X0 p13187A4500 (.Q(n_146), 
	.B(baud_rate_pcon_rs232_i), 
	.A(n_120));
   AND2X0 p14684A4501 (.Q(n_119), 
	.B(n_135), 
	.A(n_206));
   AND2X0 p14684A4502 (.Q(n_118), 
	.B(n_135), 
	.A(n_205));
   AND2X0 p14684A4503 (.Q(n_117), 
	.B(n_135), 
	.A(n_203));
   AND2X0 p14684A4504 (.Q(n_116), 
	.B(n_135), 
	.A(n_202));
   AND2X0 p14684A4505 (.Q(n_115), 
	.B(n_135), 
	.A(n_216));
   AND2X0 p14684A4506 (.Q(n_114), 
	.B(n_135), 
	.A(n_215));
   AND2X0 p14684A4507 (.Q(n_113), 
	.B(n_135), 
	.A(n_214));
   AND2X0 p14684A4508 (.Q(n_112), 
	.B(n_135), 
	.A(n_213));
   AND2X0 p14684A4509 (.Q(n_111), 
	.B(n_135), 
	.A(n_212));
   AND2X0 p14684A4510 (.Q(n_110), 
	.B(n_135), 
	.A(n_211));
   AND2X0 p14684A4511 (.Q(n_109), 
	.B(n_135), 
	.A(n_210));
   AND2X0 p14684A4512 (.Q(n_108), 
	.B(n_135), 
	.A(n_209));
   AND2X0 p14684A4513 (.Q(n_107), 
	.B(n_135), 
	.A(n_208));
   NO2I1X0 p14651A (.Q(n_106), 
	.B(\baud_rate_RS232_trans_counter[0] ), 
	.AN(n_135));
   AND2X0 p14684A4514 (.Q(n_105), 
	.B(n_135), 
	.A(\baud_rate_trans_counter[1] ));
   SDFRQX0 \baud_rate_width_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_trans_counter[0] ), 
	.Q(\baud_rate_width[1] ), 
	.D(n_151), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_width_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_width[1] ), 
	.Q(\baud_rate_width[2] ), 
	.D(n_151), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_width_reg[3]  (.SE(DFT_sen), 
	.SD(n_238), 
	.Q(\baud_rate_width[3] ), 
	.D(n_151), 
	.C(system_clk_i));
   NO2I1X0 p13705A (.Q(n_143), 
	.B(n_104), 
	.AN(n_151));
   NO2I1X0 p13900A (.Q(n_135), 
	.B(n_103), 
	.AN(n_151));
   ON311X0 p13480A (.Q(n_122), 
	.E(n_94), 
	.D(n_151), 
	.C(n_85), 
	.B(n_62), 
	.A(n_83));
   SDFRQX0 \baud_rate_width_reg[0]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p2_a_o_1_), 
	.Q(\baud_rate_width[0] ), 
	.D(system_rst_i_b), 
	.C(system_clk_i));
   NO2I1X0 p13187A4519 (.Q(n_120), 
	.B(baud_rate_pcon_smod_i), 
	.AN(n_151));
   AN21X0 p15026A (.Q(n_161), 
	.C(n_101), 
	.B(baud_rate_scon_sm0_i), 
	.A(n_104));
   NO2X0 p21531A (.Q(n_102), 
	.B(n_101), 
	.A(baud_rate_cm_o));
   NO2X0 p14827A (.Q(n_142), 
	.B(n_101), 
	.A(baud_rate_scon_sm0_i));
   AND2X0 p13194A (.Q(n_151), 
	.B(system_rst_i_b), 
	.A(baud_rate_scon_sm0_i));
   INX0 p20262A (.Q(n_101), 
	.A(system_rst_i_b));
   ON221X0 p29246A (.Q(n_104), 
	.E(n_42), 
	.D(n_57), 
	.C(n_58), 
	.B(n_97), 
	.A(n_59));
   ON321X0 p29643D (.Q(n_103), 
	.F(n_45), 
	.E(n_47), 
	.D(n_98), 
	.C(n_96), 
	.B(n_98), 
	.A(n_39));
   OA21X0 p29248A (.Q(n_97), 
	.C(n_69), 
	.B(n_67), 
	.A(n_95));
   AN221X0 p29642A (.Q(n_96), 
	.E(n_68), 
	.D(n_72), 
	.C(n_93), 
	.B(n_71), 
	.A(\baud_rate_RS232_trans_counter[7] ));
   AN22X0 p29248A4521 (.Q(n_95), 
	.D(\baud_rate_RS232_width[6] ), 
	.C(\baud_rate_RS232_counter[6] ), 
	.B(n_23), 
	.A(n_92));
   AN21X0 p29894A (.Q(n_94), 
	.C(n_91), 
	.B(n_82), 
	.A(\baud_rate_counter[4] ));
   NA2X0 p29643A (.Q(n_93), 
	.B(n_89), 
	.A(n_90));
   ON22X0 p29248A4522 (.Q(n_92), 
	.D(\baud_rate_RS232_width[5] ), 
	.C(n_2), 
	.B(n_24), 
	.A(n_86));
   AN221X0 p29892A (.Q(n_91), 
	.E(n_84), 
	.D(n_76), 
	.C(n_81), 
	.B(n_80), 
	.A(n_8));
   ON31X0 p29642A4523 (.Q(n_90), 
	.D(\baud_rate_RS232_width[6] ), 
	.C(n_88), 
	.B(n_87), 
	.A(\baud_rate_RS232_trans_counter[6] ));
   ON21X0 p29764A (.Q(n_89), 
	.C(\baud_rate_RS232_trans_counter[6] ), 
	.B(n_87), 
	.A(n_88));
   AN22X0 p29248A4524 (.Q(n_86), 
	.D(\baud_rate_RS232_width[4] ), 
	.C(\baud_rate_RS232_counter[4] ), 
	.B(n_25), 
	.A(n_79));
   AO21X0 p29876A (.Q(n_85), 
	.C(n_84), 
	.B(n_44), 
	.A(n_17));
   ON22X0 p30365A (.Q(n_83), 
	.D(n_73), 
	.C(\baud_rate_counter[2] ), 
	.B(n_77), 
	.A(\baud_rate_counter[3] ));
   NO2X0 p29876A4525 (.Q(n_84), 
	.B(n_82), 
	.A(\baud_rate_counter[4] ));
   AN21X0 p29643A4526 (.Q(n_88), 
	.C(n_10), 
	.B(\baud_rate_RS232_width[5] ), 
	.A(n_75));
   NA2I1X0 p29894A4527 (.Q(n_81), 
	.B(\baud_rate_counter[3] ), 
	.AN(n_80));
   ON21X0 p29246A4528 (.Q(n_79), 
	.C(n_70), 
	.B(\baud_rate_RS232_width[3] ), 
	.A(n_13));
   NA2X0 p31956A (.Q(n_78), 
	.B(baud_rate_br_trans_o), 
	.A(n_133));
   EO2X0 p29874A (.Q(n_82), 
	.B(DFT_sdo_2), 
	.A(n_74));
   INX0 p30365A4529 (.Q(n_77), 
	.A(n_76));
   NO2X0 p29716A (.Q(n_87), 
	.B(\baud_rate_RS232_width[5] ), 
	.A(n_75));
   ON21X0 p30365A4530 (.Q(n_76), 
	.C(n_74), 
	.B(\baud_rate_width[4] ), 
	.A(n_64));
   NA2X0 p29894A4531 (.Q(n_80), 
	.B(n_73), 
	.A(\baud_rate_counter[2] ));
   AO21X0 p29757A (.Q(n_72), 
	.C(n_71), 
	.B(\baud_rate_RS232_trans_counter[7] ), 
	.A(n_63));
   AO221X0 p29247A (.Q(n_70), 
	.E(n_60), 
	.D(n_51), 
	.C(n_1), 
	.B(n_13), 
	.A(\baud_rate_RS232_width[3] ));
   AN321X0 p30030A (.Q(n_69), 
	.F(n_48), 
	.E(n_65), 
	.D(\baud_rate_RS232_counter[7] ), 
	.C(n_66), 
	.B(\baud_rate_RS232_width[8] ), 
	.A(\baud_rate_RS232_counter[8] ));
   NO3X0 p31766A (.Q(n_133), 
	.C(n_54), 
	.B(\baud_rate_trans_counter[0] ), 
	.A(\baud_rate_trans_counter[1] ));
   AN22X0 p29642A4532 (.Q(n_75), 
	.D(\baud_rate_RS232_width[4] ), 
	.C(\baud_rate_RS232_trans_counter[4] ), 
	.B(n_35), 
	.A(n_46));
   AO321X0 p30383A (.Q(n_68), 
	.F(n_29), 
	.E(\baud_rate_RS232_trans_counter[10] ), 
	.D(\baud_rate_RS232_width[10] ), 
	.C(n_52), 
	.B(\baud_rate_RS232_trans_counter[8] ), 
	.A(\baud_rate_RS232_width[8] ));
   AN31X0 p29866A (.Q(n_67), 
	.D(n_65), 
	.C(n_66), 
	.B(n_53), 
	.A(\baud_rate_RS232_counter[7] ));
   NA2X0 p29877A (.Q(n_74), 
	.B(\baud_rate_width[4] ), 
	.A(n_64));
   NO2I1X0 p29758A (.Q(n_71), 
	.B(\baud_rate_RS232_width[7] ), 
	.AN(n_63));
   AN21X0 p29892A4533 (.Q(n_73), 
	.C(n_64), 
	.B(\baud_rate_width[3] ), 
	.A(n_61));
   AN311X0 p31089A (.Q(n_62), 
	.E(\baud_rate_counter[0] ), 
	.D(n_31), 
	.C(\baud_rate_counter[1] ), 
	.B(n_61), 
	.A(n_43));
   AN21X0 p29329A (.Q(n_60), 
	.C(\baud_rate_RS232_counter[2] ), 
	.B(n_49), 
	.A(n_50));
   AO211X0 p30211A (.Q(n_59), 
	.D(n_58), 
	.C(n_56), 
	.B(\baud_rate_RS232_width[11] ), 
	.A(n_11));
   OA32X0 p30494A (.Q(n_57), 
	.E(n_6), 
	.D(\baud_rate_RS232_width[12] ), 
	.C(n_56), 
	.B(n_11), 
	.A(\baud_rate_RS232_width[11] ));
   ON32X0 p32768A (.Q(n_55), 
	.E(n_7), 
	.D(\baud_rate_counter[3] ), 
	.C(n_150), 
	.B(\baud_rate_counter[4] ), 
	.A(n_8));
   EO2X0 p31770A (.Q(n_54), 
	.B(DFT_sdo_2), 
	.A(n_33));
   NO3I1X0 p29865A (.Q(n_65), 
	.C(\baud_rate_RS232_width[7] ), 
	.B(n_41), 
	.AN(n_53));
   NO2X0 p29877A4534 (.Q(n_64), 
	.B(\baud_rate_width[3] ), 
	.A(n_61));
   OA21X0 p29758A4535 (.Q(n_63), 
	.C(n_52), 
	.B(\baud_rate_RS232_width[8] ), 
	.A(\baud_rate_RS232_trans_counter[8] ));
   NA3X0 p29248A4536 (.Q(n_51), 
	.C(\baud_rate_RS232_counter[2] ), 
	.B(n_49), 
	.A(n_50));
   AO32X0 p30114A (.Q(n_48), 
	.E(\baud_rate_RS232_counter[10] ), 
	.D(\baud_rate_RS232_width[10] ), 
	.C(n_36), 
	.B(\baud_rate_RS232_counter[9] ), 
	.A(\baud_rate_RS232_width[9] ));
   AN32X0 p31177A (.Q(n_47), 
	.E(\baud_rate_RS232_trans_counter[12] ), 
	.D(n_22), 
	.C(n_38), 
	.B(\baud_rate_RS232_trans_counter[11] ), 
	.A(n_9));
   ON21X0 p29643A4537 (.Q(n_46), 
	.C(n_32), 
	.B(n_27), 
	.A(n_26));
   AN32X0 p31342A (.Q(n_45), 
	.E(\baud_rate_RS232_trans_counter[14] ), 
	.D(\baud_rate_RS232_width[14] ), 
	.C(n_37), 
	.B(\baud_rate_RS232_trans_counter[13] ), 
	.A(\baud_rate_RS232_width[13] ));
   NA2X0 p30908A (.Q(n_44), 
	.B(n_43), 
	.A(n_61));
   AN32X0 p31084A (.Q(n_42), 
	.E(\baud_rate_RS232_counter[14] ), 
	.D(\baud_rate_RS232_width[14] ), 
	.C(n_34), 
	.B(\baud_rate_RS232_counter[13] ), 
	.A(\baud_rate_RS232_width[13] ));
   INX0 p30183A (.Q(n_66), 
	.A(n_41));
   AO32X0 p32873A (.Q(n_40), 
	.E(n_17), 
	.D(\baud_rate_counter[2] ), 
	.C(\baud_rate_counter[1] ), 
	.B(\baud_rate_counter[0] ), 
	.A(n_18));
   ON21X0 p30890A (.Q(n_39), 
	.C(n_38), 
	.B(n_9), 
	.A(\baud_rate_RS232_trans_counter[11] ));
   ON21X0 p30993A (.Q(n_98), 
	.C(n_37), 
	.B(\baud_rate_RS232_width[13] ), 
	.A(\baud_rate_RS232_trans_counter[13] ));
   ON21X0 p29866A4538 (.Q(n_41), 
	.C(n_36), 
	.B(\baud_rate_RS232_width[9] ), 
	.A(\baud_rate_RS232_counter[9] ));
   OA22X0 p29738A (.Q(n_35), 
	.D(\baud_rate_RS232_width[4] ), 
	.C(\baud_rate_RS232_trans_counter[4] ), 
	.B(n_20), 
	.A(\baud_rate_RS232_trans_counter[3] ));
   AO211X0 p29247A4539 (.Q(n_50), 
	.D(\baud_rate_RS232_counter[0] ), 
	.C(\baud_rate_RS232_width[0] ), 
	.B(\baud_rate_RS232_width[1] ), 
	.A(\baud_rate_RS232_counter[1] ));
   NA2I1X0 p30913A (.Q(n_43), 
	.B(\baud_rate_width[2] ), 
	.AN(n_30));
   ON21X0 p30264A (.Q(n_58), 
	.C(n_34), 
	.B(\baud_rate_RS232_width[13] ), 
	.A(\baud_rate_RS232_counter[13] ));
   AND5X0 p31767A (.Q(n_33), 
	.E(\baud_rate_width[3] ), 
	.D(\baud_rate_width[2] ), 
	.C(n_0), 
	.B(\baud_rate_width[0] ), 
	.A(\baud_rate_width[1] ));
   AN22X0 p29639A (.Q(n_32), 
	.D(\baud_rate_RS232_width[2] ), 
	.C(\baud_rate_RS232_trans_counter[2] ), 
	.B(n_20), 
	.A(\baud_rate_RS232_trans_counter[3] ));
   AN21X0 p31556A (.Q(n_31), 
	.C(n_30), 
	.B(\baud_rate_width[0] ), 
	.A(\baud_rate_width[1] ));
   AND3X0 p30383A4540 (.Q(n_29), 
	.C(\baud_rate_RS232_width[9] ), 
	.B(\baud_rate_RS232_trans_counter[9] ), 
	.A(n_28));
   OA21X0 p29758A4541 (.Q(n_52), 
	.C(n_28), 
	.B(\baud_rate_RS232_width[9] ), 
	.A(\baud_rate_RS232_trans_counter[9] ));
   NA2I1X0 p29876A4542 (.Q(n_61), 
	.B(n_30), 
	.AN(\baud_rate_width[2] ));
   NO2X0 p30431A (.Q(n_56), 
	.B(n_22), 
	.A(\baud_rate_RS232_counter[12] ));
   AN211X0 p30342A (.Q(n_27), 
	.D(\baud_rate_RS232_trans_counter[0] ), 
	.C(\baud_rate_RS232_width[0] ), 
	.B(\baud_rate_RS232_width[1] ), 
	.A(\baud_rate_RS232_trans_counter[1] ));
   ON22X0 p30265A (.Q(n_26), 
	.D(\baud_rate_RS232_width[2] ), 
	.C(\baud_rate_RS232_trans_counter[2] ), 
	.B(\baud_rate_RS232_width[1] ), 
	.A(\baud_rate_RS232_trans_counter[1] ));
   NA3X0 p32270A (.Q(n_150), 
	.C(\baud_rate_counter[2] ), 
	.B(\baud_rate_counter[0] ), 
	.A(\baud_rate_counter[1] ));
   NO2X0 p29877A4543 (.Q(n_30), 
	.B(\baud_rate_width[1] ), 
	.A(\baud_rate_width[0] ));
   OR2X0 p30264A4544 (.Q(n_34), 
	.B(\baud_rate_RS232_width[14] ), 
	.A(\baud_rate_RS232_counter[14] ));
   OR2X0 p29472A (.Q(n_49), 
	.B(\baud_rate_RS232_width[1] ), 
	.A(\baud_rate_RS232_counter[1] ));
   OR2X0 p29997A (.Q(n_53), 
	.B(\baud_rate_RS232_width[8] ), 
	.A(\baud_rate_RS232_counter[8] ));
   OR2X0 p30410A (.Q(n_25), 
	.B(\baud_rate_RS232_width[4] ), 
	.A(\baud_rate_RS232_counter[4] ));
   OR2X0 p30993A4545 (.Q(n_37), 
	.B(\baud_rate_RS232_width[14] ), 
	.A(\baud_rate_RS232_trans_counter[14] ));
   NO2I1X0 p30364A (.Q(n_24), 
	.B(SPCASCAN_N1), 
	.AN(\baud_rate_RS232_width[5] ));
   NA2I1X0 p30887A (.Q(n_38), 
	.B(\baud_rate_RS232_width[12] ), 
	.AN(\baud_rate_RS232_trans_counter[12] ));
   OR2X0 p30759A (.Q(n_23), 
	.B(\baud_rate_RS232_width[6] ), 
	.A(\baud_rate_RS232_counter[6] ));
   OR2X0 p29758A4546 (.Q(n_28), 
	.B(\baud_rate_RS232_width[10] ), 
	.A(\baud_rate_RS232_trans_counter[10] ));
   OR2X0 p29866A4547 (.Q(n_36), 
	.B(\baud_rate_RS232_width[10] ), 
	.A(\baud_rate_RS232_counter[10] ));
   INX0 p31635A (.Q(n_22), 
	.A(\baud_rate_RS232_width[12] ));
   INX0 p29643A4548 (.Q(n_20), 
	.A(\baud_rate_RS232_width[3] ));
   INX0 p32882A (.Q(n_18), 
	.A(\baud_rate_counter[2] ));
   INX0 p30946A (.Q(n_17), 
	.A(\baud_rate_counter[1] ));
   INX0 p30305A (.Q(n_13), 
	.A(\baud_rate_RS232_counter[3] ));
   INX0 p30494A4550 (.Q(n_11), 
	.A(\baud_rate_RS232_counter[11] ));
   INX0 p30941A (.Q(n_10), 
	.A(\baud_rate_RS232_trans_counter[5] ));
   INX0 p31445A (.Q(n_9), 
	.A(\baud_rate_RS232_width[11] ));
   INX0 p33026A (.Q(n_8), 
	.A(\baud_rate_counter[3] ));
   INX0 p33455A (.Q(n_7), 
	.A(\baud_rate_counter[4] ));
   INX0 p31145A (.Q(n_6), 
	.A(\baud_rate_RS232_counter[12] ));
   INX0 p30565A (.Q(n_2), 
	.A(SPCASCAN_N1));
   INX0 p42348A (.Q(n_1), 
	.A(\baud_rate_RS232_width[2] ));
   INX0 p44789A (.Q(n_0), 
	.A(\baud_rate_width[4] ));
   LOGIC0 tie_0_cell (.Q(logic_0_1_net));
endmodule

module bus_control (
	bus_control_ea_b_i, 
	bus_control_core_ext_data_i, 
	bus_control_core_ext_addr_i, 
	bus_control_core_ext_ram_wr_b_i, 
	bus_control_core_ext_ram_rd_b_i, 
	bus_control_core_ext_rom_rd_b_i, 
	bus_control_psen_b_o, 
	bus_control_core_ext_data_o, 
	bus_control_core_ea_b_o, 
	bus_control_core_p0_i, 
	bus_control_ports_p0_i, 
	bus_control_core_p0en_i, 
	bus_control_core_p2_i, 
	bus_control_core_p2en_i, 
	bus_control_core_p3_6_i, 
	bus_control_core_p3_7_i, 
	bus_control_core_p3en_6_i, 
	bus_control_core_p3en_7_i, 
	bus_control_core_p4_i, 
	bus_control_core_p0_o, 
	bus_control_core_p0en_o, 
	bus_control_core_p2_o, 
	bus_control_core_p2en_o, 
	bus_control_core_p3_6_o, 
	bus_control_core_p3_7_o, 
	bus_control_core_p3en_6_o, 
	bus_control_core_p3en_7_o, 
	bus_control_core_p4_o);
   input bus_control_ea_b_i;
   input [7:0] bus_control_core_ext_data_i;
   input [15:0] bus_control_core_ext_addr_i;
   input bus_control_core_ext_ram_wr_b_i;
   input bus_control_core_ext_ram_rd_b_i;
   input bus_control_core_ext_rom_rd_b_i;
   output bus_control_psen_b_o;
   output [7:0] bus_control_core_ext_data_o;
   output bus_control_core_ea_b_o;
   input [7:0] bus_control_core_p0_i;
   input [7:0] bus_control_ports_p0_i;
   input [7:0] bus_control_core_p0en_i;
   input [7:0] bus_control_core_p2_i;
   input [7:0] bus_control_core_p2en_i;
   input bus_control_core_p3_6_i;
   input bus_control_core_p3_7_i;
   input bus_control_core_p3en_6_i;
   input bus_control_core_p3en_7_i;
   input [7:0] bus_control_core_p4_i;
   output [7:0] bus_control_core_p0_o;
   output [7:0] bus_control_core_p0en_o;
   output [7:0] bus_control_core_p2_o;
   output [7:0] bus_control_core_p2en_o;
   output bus_control_core_p3_6_o;
   output bus_control_core_p3_7_o;
   output bus_control_core_p3en_6_o;
   output bus_control_core_p3en_7_o;
   output [7:0] bus_control_core_p4_o;

   // Internal wires
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_79;

   assign bus_control_core_ea_b_o = 1'b0 ;

   AO22X0 p1781D (.Q(bus_control_core_p4_o[7]), 
	.D(bus_control_core_ext_addr_i[7]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[7]));
   AO22X0 p1781D832 (.Q(bus_control_core_p4_o[6]), 
	.D(bus_control_core_ext_addr_i[6]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[6]));
   AO22X0 p1781D833 (.Q(bus_control_core_p4_o[5]), 
	.D(bus_control_core_ext_addr_i[5]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[5]));
   AO22X0 p1781D834 (.Q(bus_control_core_p4_o[4]), 
	.D(bus_control_core_ext_addr_i[4]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[4]));
   AO22X0 p1781D835 (.Q(bus_control_core_p4_o[3]), 
	.D(bus_control_core_ext_addr_i[3]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[3]));
   AO22X0 p1781D836 (.Q(bus_control_core_p4_o[2]), 
	.D(bus_control_core_ext_addr_i[2]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[2]));
   AO22X0 p1781D837 (.Q(bus_control_core_p4_o[1]), 
	.D(bus_control_core_ext_addr_i[1]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[1]));
   AO22X0 p1781D838 (.Q(bus_control_core_p4_o[0]), 
	.D(bus_control_core_ext_addr_i[0]), 
	.C(n_79), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p4_i[0]));
   AO22X0 p1648D (.Q(bus_control_core_p0_o[5]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[5]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[5]));
   AO22X0 p1648D839 (.Q(bus_control_core_p0_o[0]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[0]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[0]));
   AO22X0 p1648D840 (.Q(bus_control_core_p0_o[6]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[6]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[6]));
   AO22X0 p1648D841 (.Q(bus_control_core_p0_o[4]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[4]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[4]));
   AO22X0 p1648D842 (.Q(bus_control_core_p0_o[7]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[7]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[7]));
   AO22X0 p1648D843 (.Q(bus_control_core_p0_o[2]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[2]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[2]));
   AO22X0 p1648D844 (.Q(bus_control_core_p0_o[3]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[3]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[3]));
   AO22X0 p1648D845 (.Q(bus_control_core_p0_o[1]), 
	.D(n_57), 
	.C(bus_control_core_ext_data_i[1]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[1]));
   NA2I1X0 p5648A (.Q(bus_control_core_p3en_6_o), 
	.B(bus_control_psen_b_o), 
	.AN(bus_control_core_p3en_6_i));
   NA2I1X0 p5648A846 (.Q(bus_control_core_p3en_7_o), 
	.B(bus_control_psen_b_o), 
	.AN(bus_control_core_p3en_7_i));
   AO21X0 p4987A (.Q(bus_control_core_p0en_o[7]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[7]));
   AO21X0 p4987A847 (.Q(bus_control_core_p0en_o[6]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[6]));
   AO21X0 p4987A848 (.Q(bus_control_core_p0en_o[5]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[5]));
   AO21X0 p4987A849 (.Q(bus_control_core_p0en_o[4]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[4]));
   ON21X0 p1613D (.Q(bus_control_core_p3_7_o), 
	.C(n_56), 
	.B(n_61), 
	.A(n_53));
   AO21X0 p4987A850 (.Q(bus_control_core_p0en_o[3]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[3]));
   AO21X0 p4987A851 (.Q(bus_control_core_p0en_o[2]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[2]));
   AO21X0 p4987A852 (.Q(bus_control_core_p0en_o[1]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[1]));
   AO21X0 p4987A853 (.Q(bus_control_core_p0en_o[0]), 
	.C(n_57), 
	.B(n_60), 
	.A(bus_control_core_p0en_i[0]));
   INX0 Fp1588A857 (.Q(n_79), 
	.A(bus_control_psen_b_o));
   NO2X0 p1209D (.Q(bus_control_psen_b_o), 
	.B(n_57), 
	.A(n_61));
   AO21X0 p5218A (.Q(bus_control_core_p2en_o[7]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[7]));
   AO21X0 p5218A858 (.Q(bus_control_core_p2en_o[6]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[6]));
   AO21X0 p5218A859 (.Q(bus_control_core_p2en_o[5]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[5]));
   AO21X0 p5218A860 (.Q(bus_control_core_p2en_o[4]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[4]));
   AO21X0 p5218A861 (.Q(bus_control_core_p2en_o[3]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[3]));
   AO21X0 p5218A862 (.Q(bus_control_core_p2en_o[2]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[2]));
   AO21X0 p5218A863 (.Q(bus_control_core_p2en_o[1]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[1]));
   AO21X0 p5218A864 (.Q(bus_control_core_p2en_o[0]), 
	.C(n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[0]));
   ON21X0 p2158D (.Q(bus_control_core_p3_6_o), 
	.C(n_60), 
	.B(n_57), 
	.A(n_52));
   AO22X0 p2221D (.Q(bus_control_core_p2_o[0]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[0]), 
	.B(bus_control_core_ext_addr_i[8]), 
	.A(n_59));
   AO22X0 p2221D865 (.Q(bus_control_core_p2_o[5]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[5]), 
	.B(n_59), 
	.A(bus_control_core_ext_addr_i[13]));
   AO22X0 p2221D866 (.Q(bus_control_core_p2_o[7]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[7]), 
	.B(n_59), 
	.A(bus_control_core_ext_addr_i[15]));
   AO22X0 p2221D867 (.Q(bus_control_core_p2_o[6]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[6]), 
	.B(n_59), 
	.A(bus_control_core_ext_addr_i[14]));
   AO22X0 p2221D868 (.Q(bus_control_core_p2_o[4]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[4]), 
	.B(n_59), 
	.A(bus_control_core_ext_addr_i[12]));
   AO22X0 p2221D869 (.Q(bus_control_core_p2_o[3]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[3]), 
	.B(bus_control_core_ext_addr_i[11]), 
	.A(n_59));
   AO22X0 p2221D870 (.Q(bus_control_core_p2_o[2]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[2]), 
	.B(bus_control_core_ext_addr_i[10]), 
	.A(n_59));
   AO22X0 p2221D871 (.Q(bus_control_core_p2_o[1]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[1]), 
	.B(bus_control_core_ext_addr_i[9]), 
	.A(n_59));
   NO2I1X0 p4039A (.Q(bus_control_core_ext_data_o[5]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[5]));
   NO2I1X0 p4036A (.Q(bus_control_core_ext_data_o[4]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[4]));
   NO2I1X0 p4036A872 (.Q(bus_control_core_ext_data_o[3]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[3]));
   NO2I1X0 p4038A (.Q(bus_control_core_ext_data_o[2]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[2]));
   NO2I1X0 p4027A (.Q(bus_control_core_ext_data_o[7]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[7]));
   NO2I1X0 p4036A873 (.Q(bus_control_core_ext_data_o[1]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[1]));
   NO2I1X0 p4036A874 (.Q(bus_control_core_ext_data_o[0]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[0]));
   NO2I1X0 p4027A875 (.Q(bus_control_core_ext_data_o[6]), 
	.B(n_57), 
	.AN(bus_control_ports_p0_i[6]));
   INX0 Fp1244A877 (.Q(n_60), 
	.A(n_61));
   NA2X0 p1219A (.Q(n_61), 
	.B(n_55), 
	.A(n_58));
   INX0 Fp1262A883 (.Q(n_58), 
	.A(n_59));
   NO2X0 p1221A (.Q(n_59), 
	.B(bus_control_core_ext_rom_rd_b_i), 
	.A(n_54));
   INX0 Fp1574A893 (.Q(n_56), 
	.A(n_57));
   NO3I2X1 p1394D (.Q(n_57), 
	.C(bus_control_core_ext_ram_wr_b_i), 
	.BN(bus_control_core_ext_rom_rd_b_i), 
	.AN(bus_control_core_ext_ram_rd_b_i));
   NA3I1X0 p1275A (.Q(n_55), 
	.C(bus_control_core_ext_rom_rd_b_i), 
	.B(bus_control_core_ext_ram_wr_b_i), 
	.AN(bus_control_core_ext_ram_rd_b_i));
   NA2X0 p12627A (.Q(n_54), 
	.B(bus_control_core_ext_ram_rd_b_i), 
	.A(bus_control_core_ext_ram_wr_b_i));
   INX0 Fp11278A (.Q(n_53), 
	.A(bus_control_core_p3_7_i));
   INX0 Fp11723A (.Q(n_52), 
	.A(bus_control_core_p3_6_i));
endmodule

module csa_tree (
	in_0, 
	in_1, 
	out_0, 
	out_1);
   input [7:0] in_0;
   input [7:0] in_1;
   output [15:0] out_0;
   output [15:0] out_1;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_11;
   wire n_12;
   wire n_14;
   wire n_15;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_69;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_244;
   wire n_245;
   wire n_248;
   wire n_249;
   wire n_252;
   wire n_253;
   wire n_256;
   wire n_257;
   wire n_260;
   wire n_261;
   wire n_285;

   assign out_1[0] = 1'b0 ;
   assign out_1[15] = 1'b0 ;
   assign out_0[15] = 1'b0 ;

   INX0 Fp1265D (.Q(out_1[9]), 
	.A(n_261));
   INX0 Fp1792A (.Q(out_0[10]), 
	.A(n_260));
   FAX0 p1052D (.S(n_261), 
	.CO(n_260), 
	.CI(n_239), 
	.B(n_232), 
	.A(n_219));
   INX0 Fp1908A (.Q(out_1[10]), 
	.A(n_257));
   INX0 Fp2222A (.Q(out_0[11]), 
	.A(n_256));
   FAX0 p1123D (.S(n_257), 
	.CO(n_256), 
	.CI(n_238), 
	.B(n_231), 
	.A(n_218));
   INX0 Fp2497A (.Q(out_1[11]), 
	.A(n_253));
   INX0 Fp2850A (.Q(out_1[12]), 
	.A(n_252));
   FAX0 p2046A (.S(n_253), 
	.CO(n_252), 
	.CI(n_230), 
	.B(n_211), 
	.A(n_227));
   INX0 Fp0807D (.Q(out_1[8]), 
	.A(n_249));
   INX0 Fp1295D (.Q(out_0[9]), 
	.A(n_248));
   FAX0 p0295D (.S(n_249), 
	.CO(n_248), 
	.CI(n_233), 
	.B(n_222), 
	.A(n_225));
   INX0 Fp0811D (.Q(out_1[7]), 
	.A(n_245));
   INX0 Fp1070D (.Q(out_0[8]), 
	.A(n_244));
   FAX1 p0280D (.S(n_245), 
	.CO(n_244), 
	.CI(n_223), 
	.B(n_220), 
	.A(n_214));
   INX0 Fp3410A (.Q(out_0[12]), 
	.A(n_241));
   INX0 Fp3870A (.Q(out_1[13]), 
	.A(n_240));
   FAX0 p2593A (.S(n_241), 
	.CO(n_240), 
	.CI(n_226), 
	.B(n_172), 
	.A(n_189));
   FAX0 p0587D (.S(n_239), 
	.CO(n_238), 
	.CI(n_224), 
	.B(n_195), 
	.A(n_186));
   INX0 Fp0811D1539 (.Q(out_1[6]), 
	.A(n_235));
   INX0 Fp0995D (.Q(out_0[7]), 
	.A(n_234));
   FAX0 p0285D (.S(n_235), 
	.CO(n_234), 
	.CI(n_221), 
	.B(n_192), 
	.A(n_182));
   FAX0 p0236D (.S(n_233), 
	.CO(n_232), 
	.CI(n_196), 
	.B(n_213), 
	.A(n_176));
   FAX0 p0792D (.S(n_231), 
	.CO(n_230), 
	.CI(n_212), 
	.B(n_174), 
	.A(n_185));
   INX0 Fp0919D (.Q(out_0[6]), 
	.A(n_228));
   AN21X0 p1004D (.Q(n_228), 
	.C(n_202), 
	.B(n_200), 
	.A(n_201));
   FAX0 p2125A (.S(n_227), 
	.CO(n_226), 
	.CI(n_190), 
	.B(n_173), 
	.A(n_31));
   FAX0 p0506D (.S(n_225), 
	.CO(n_224), 
	.CI(n_193), 
	.B(n_179), 
	.A(n_131));
   FAX1 p0132D (.S(n_223), 
	.CO(n_222), 
	.CI(n_194), 
	.B(n_165), 
	.A(n_191));
   FAX1 p0130D (.S(n_221), 
	.CO(n_220), 
	.CI(n_168), 
	.B(n_154), 
	.A(n_148));
   FAX0 p0941D (.S(n_219), 
	.CO(n_218), 
	.CI(n_188), 
	.B(n_175), 
	.A(n_124));
   NA2X0 p0817D (.Q(out_1[5]), 
	.B(n_216), 
	.A(n_215));
   NA2X0 p0801D (.Q(n_216), 
	.B(n_199), 
	.A(n_204));
   NA2X0 p0828D (.Q(n_215), 
	.B(n_200), 
	.A(n_203));
   FAX1 p0257D (.S(n_214), 
	.CO(n_213), 
	.CI(n_183), 
	.B(n_114), 
	.A(n_285));
   FAX0 p0282D (.S(n_212), 
	.CO(n_211), 
	.CI(n_187), 
	.B(n_22), 
	.A(n_45));
   FAX1 p0222D (.S(out_1[4]), 
	.CO(out_0[5]), 
	.CI(n_167), 
	.B(n_151), 
	.A(n_123));
   INX0 Fp4159A (.Q(out_0[13]), 
	.A(n_206));
   INX0 Fp4218A (.Q(out_1[14]), 
	.A(n_205));
   FAX0 p3261A (.S(n_206), 
	.CO(n_205), 
	.CI(n_171), 
	.B(n_62), 
	.A(n_61));
   ON22X0 p0732DT (.Q(n_204), 
	.D(n_180), 
	.C(n_155), 
	.B(n_181), 
	.A(n_156));
   AN22X0 p0902D (.Q(n_203), 
	.D(n_181), 
	.C(n_156), 
	.B(n_180), 
	.A(n_155));
   NO2X0 p1048D (.Q(n_202), 
	.B(n_181), 
	.A(n_155));
   NA2X0 p0964D (.Q(n_201), 
	.B(n_181), 
	.A(n_155));
   NA2X0 p0943DT (.Q(n_200), 
	.B(n_198), 
	.A(n_197));
   AND2X0 p0883D (.Q(n_199), 
	.B(n_198), 
	.A(n_197));
   NA2X0 p0869D (.Q(n_198), 
	.B(n_153), 
	.A(n_170));
   NA2X0 p0843D (.Q(n_197), 
	.B(n_152), 
	.A(n_169));
   FAX1 p0170D (.S(n_196), 
	.CO(n_195), 
	.CI(n_59), 
	.B(n_77), 
	.A(n_138));
   FAX0 n0064D (.S(n_194), 
	.CO(n_193), 
	.CI(n_57), 
	.B(n_87), 
	.A(n_71));
   FAX0 p0270D (.S(n_192), 
	.CO(n_191), 
	.CI(n_44), 
	.B(n_41), 
	.A(n_111));
   FAX0 p1726A (.S(n_190), 
	.CO(n_189), 
	.CI(n_37), 
	.B(n_90), 
	.A(n_53));
   FAX0 p0407D (.S(n_188), 
	.CO(n_187), 
	.CI(n_32), 
	.B(n_92), 
	.A(n_23));
   FAX0 p1115D (.S(n_186), 
	.CO(n_185), 
	.CI(n_20), 
	.B(n_40), 
	.A(n_58));
   INX0 Fp1155D (.Q(out_0[4]), 
	.A(n_177));
   INX0 Fp0341D (.Q(n_183), 
	.A(n_178));
   OA22X0 p0804D (.Q(n_182), 
	.D(n_153), 
	.C(n_66), 
	.B(n_144), 
	.A(n_163));
   NA2X0 p0856DT (.Q(n_180), 
	.B(n_120), 
	.A(n_158));
   AND2X0 p1020D (.Q(n_181), 
	.B(n_120), 
	.A(n_158));
   OA22X0 p0549D (.Q(n_179), 
	.D(n_98), 
	.C(n_38), 
	.B(n_113), 
	.A(n_52));
   NA2I1X0 p0371D (.Q(n_178), 
	.B(n_157), 
	.AN(n_110));
   AN22X0 p1040D (.Q(n_177), 
	.D(n_94), 
	.C(n_89), 
	.B(n_141), 
	.A(n_129));
   FAX0 p0316D (.S(n_176), 
	.CO(n_175), 
	.CI(n_60), 
	.B(n_105), 
	.A(n_48));
   FAX0 p1134D (.S(n_174), 
	.CO(n_173), 
	.CI(n_47), 
	.B(n_30), 
	.A(n_54));
   FAX0 p2225A (.S(n_172), 
	.CO(n_171), 
	.CI(n_74), 
	.B(n_86), 
	.A(n_73));
   MU2IX0 p0789DT (.S(n_65), 
	.Q(n_170), 
	.IN1(n_145), 
	.IN0(n_144));
   AN22X0 p0940D (.Q(n_169), 
	.D(n_145), 
	.C(n_66), 
	.B(n_144), 
	.A(n_65));
   OA21X1 p0119D (.Q(n_168), 
	.C(n_164), 
	.B(n_103), 
	.A(n_147));
   NA2X1 p0266D (.Q(n_167), 
	.B(n_162), 
	.A(n_161));
   MU2IX0 p0739D (.S(n_137), 
	.Q(out_1[3]), 
	.IN1(n_141), 
	.IN0(n_140));
   NO2X1 p0326D (.Q(n_165), 
	.B(n_160), 
	.A(n_159));
   NA2X0 p0120D (.Q(n_164), 
	.B(n_103), 
	.A(n_147));
   NO2X0 p0832D (.Q(n_163), 
	.B(n_152), 
	.A(n_65));
   NA2X0 p0301D (.Q(n_162), 
	.B(n_56), 
	.A(n_142));
   NA2X0 p0286D (.Q(n_161), 
	.B(n_55), 
	.A(n_143));
   NO2X0 p0306D (.Q(n_160), 
	.B(n_51), 
	.A(n_136));
   NO2X0 p0362D (.Q(n_159), 
	.B(n_135), 
	.A(n_52));
   AO21X0 p0914D (.Q(n_158), 
	.C(n_56), 
	.B(n_33), 
	.A(n_63));
   NA2X0 p0370D (.Q(n_157), 
	.B(n_102), 
	.A(n_112));
   EN3X0 p0812DT (.Q(n_155), 
	.C(n_79), 
	.B(n_85), 
	.A(n_101));
   EN2X0 p0874D (.Q(n_156), 
	.B(n_79), 
	.A(n_146));
   NO2I1X1 p0179D (.Q(n_154), 
	.B(n_150), 
	.AN(n_128));
   INX0 Fp0809D (.Q(n_153), 
	.A(n_152));
   HAX0 p0634D (.S(n_151), 
	.CO(n_152), 
	.B(n_46), 
	.A(n_67));
   NO2X0 p0200D (.Q(n_150), 
	.B(n_130), 
	.A(n_100));
   ON21X0 p0725D (.Q(out_1[2]), 
	.C(n_134), 
	.B(n_72), 
	.A(n_69));
   NO2X0 p0667D (.Q(n_148), 
	.B(n_133), 
	.A(n_132));
   NA2X0 p0117D (.Q(n_147), 
	.B(n_127), 
	.A(n_115));
   MU2IX0 p0837D (.S(n_85), 
	.Q(n_146), 
	.IN1(n_100), 
	.IN0(n_101));
   NO2X0 p0814DT (.Q(n_144), 
	.B(n_117), 
	.A(n_126));
   OR2X0 p0908D (.Q(n_145), 
	.B(n_117), 
	.A(n_126));
   MU2IX0 p0228DT (.S(n_34), 
	.Q(n_143), 
	.IN1(n_63), 
	.IN0(n_64));
   ON21X0 p0352D (.Q(n_142), 
	.C(n_106), 
	.B(n_33), 
	.A(n_64));
   NA2X0 p0784DT (.Q(n_141), 
	.B(n_118), 
	.A(n_125));
   AND2X0 p0950D (.Q(n_140), 
	.B(n_125), 
	.A(n_118));
   AND2X1 p0594D (.Q(n_138), 
	.B(n_109), 
	.A(n_108));
   NA2X0 p0740D (.Q(n_137), 
	.B(n_119), 
	.A(n_116));
   AN21X0 p0285DT (.Q(n_136), 
	.C(n_122), 
	.B(n_98), 
	.A(n_39));
   ON21X0 p0405D (.Q(n_135), 
	.C(n_121), 
	.B(n_99), 
	.A(n_38));
   NA2X0 p0815D (.Q(n_134), 
	.B(n_72), 
	.A(n_69));
   NO2X0 p0622D (.Q(n_133), 
	.B(n_81), 
	.A(n_26));
   NO2X0 p0789D (.Q(n_132), 
	.B(n_80), 
	.A(n_27));
   OR2X0 p1506A (.Q(n_131), 
	.B(n_78), 
	.A(n_76));
   AND2X0 p0304D (.Q(n_130), 
	.B(n_79), 
	.A(n_85));
   OR2X0 p0829D (.Q(n_129), 
	.B(n_89), 
	.A(n_94));
   OR2X0 p0306D1542 (.Q(n_128), 
	.B(n_85), 
	.A(n_79));
   NA2X0 p0109D (.Q(n_127), 
	.B(n_25), 
	.A(n_49));
   NO2X0 p0893D (.Q(n_126), 
	.B(n_36), 
	.A(n_83));
   NA2X0 p0919D (.Q(n_125), 
	.B(n_82), 
	.A(n_28));
   OR2X0 p1851A (.Q(n_124), 
	.B(n_96), 
	.A(n_43));
   NO2I1X0 p0864D (.Q(n_123), 
	.B(n_82), 
	.AN(n_28));
   NO2X0 p0237DT (.Q(n_122), 
	.B(n_98), 
	.A(n_39));
   NA2X0 p0406D (.Q(n_121), 
	.B(n_99), 
	.A(n_38));
   NA2X0 p0847D (.Q(n_120), 
	.B(n_64), 
	.A(n_34));
   NA2X0 p0750D (.Q(n_119), 
	.B(n_88), 
	.A(n_94));
   NA2I1X0 p0863D (.Q(n_118), 
	.B(n_29), 
	.AN(n_82));
   NO2I1X0 p0833D (.Q(n_117), 
	.B(n_84), 
	.AN(n_36));
   NA2X0 p0782D (.Q(n_116), 
	.B(n_93), 
	.A(n_89));
   NA2X0 p0134D (.Q(n_115), 
	.B(n_24), 
	.A(n_50));
   NA2X0 p0855D (.Q(n_114), 
	.B(n_81), 
	.A(n_27));
   NO2X0 p0718D (.Q(n_113), 
	.B(n_99), 
	.A(n_39));
   NA2X0 p0376D (.Q(n_112), 
	.B(n_25), 
	.A(n_50));
   NA2X0 p0540D (.Q(n_111), 
	.B(n_35), 
	.A(n_83));
   NO2X0 p0404D (.Q(n_110), 
	.B(n_25), 
	.A(n_50));
   NA2X0 p0593D (.Q(n_109), 
	.B(n_42), 
	.A(n_96));
   NA2X0 p0602D (.Q(n_108), 
	.B(n_95), 
	.A(n_43));
   NO2I1X0 p1192A (.Q(out_0[3]), 
	.B(n_69), 
	.AN(n_72));
   NA2X0 p0365D (.Q(n_106), 
	.B(n_33), 
	.A(n_64));
   INX0 Fp0606D (.Q(n_105), 
	.A(n_104));
   NO2I1X0 p0605D (.Q(n_104), 
	.B(n_19), 
	.AN(in_1[3]));
   NA2X0 p0666DT (.Q(n_103), 
	.B(in_0[4]), 
	.A(in_1[2]));
   AND2X0 p0805D (.Q(n_102), 
	.B(in_0[4]), 
	.A(in_1[2]));
   INX0 Fp0250D1543 (.Q(n_101), 
	.A(n_100));
   NA2X0 p0251D (.Q(n_100), 
	.B(in_0[1]), 
	.A(in_1[4]));
   INX0 Fp0535D1547 (.Q(n_98), 
	.A(n_99));
   NO2I1X0 p0535D (.Q(n_99), 
	.B(n_19), 
	.AN(in_1[2]));
   NO2I1X0 p0814D (.Q(out_1[1]), 
	.B(n_12), 
	.AN(in_1[1]));
   NO2X0 p0526DT (.Q(n_95), 
	.B(n_15), 
	.A(n_6));
   NA2X0 p0681D (.Q(n_96), 
	.B(in_0[6]), 
	.A(in_1[2]));
   NO2X0 p0670DT (.Q(n_94), 
	.B(n_12), 
	.A(n_18));
   NA2X0 p0861D (.Q(n_93), 
	.B(in_0[0]), 
	.A(in_1[3]));
   NA2X0 p0432D (.Q(n_92), 
	.B(in_0[3]), 
	.A(in_1[6]));
   AND2X0 p0848D (.Q(out_0[2]), 
	.B(in_0[1]), 
	.A(in_1[1]));
   NA2X0 p1936A (.Q(n_90), 
	.B(in_0[7]), 
	.A(in_1[4]));
   NO2X0 p0624DT (.Q(n_89), 
	.B(n_2), 
	.A(n_6));
   NA2X0 p0836D (.Q(n_88), 
	.B(in_0[1]), 
	.A(in_1[2]));
   NA2X0 p0145D (.Q(n_87), 
	.B(in_0[3]), 
	.A(in_1[4]));
   NA2X0 p2504A (.Q(n_86), 
	.B(in_0[6]), 
	.A(in_1[6]));
   NA2X0 p0323D (.Q(n_85), 
	.B(in_0[2]), 
	.A(in_1[3]));
   INX0 Fp0594D (.Q(n_84), 
	.A(n_83));
   AND2X0 p0615D (.Q(n_83), 
	.B(in_0[5]), 
	.A(in_1[0]));
   NA2X0 p0838D (.Q(n_82), 
	.B(in_0[2]), 
	.A(in_1[1]));
   NO2X0 p0837DT (.Q(n_81), 
	.B(n_15), 
	.A(n_8));
   NA2X0 p0923D (.Q(n_80), 
	.B(in_0[6]), 
	.A(in_1[0]));
   NA2X0 p0228D (.Q(n_79), 
	.B(in_0[3]), 
	.A(in_1[2]));
   NA2X0 p0961A (.Q(n_78), 
	.B(in_0[7]), 
	.A(in_1[0]));
   NA2X0 p0454D (.Q(n_77), 
	.B(in_0[2]), 
	.A(in_1[6]));
   NA2X0 p0860D (.Q(n_76), 
	.B(in_0[6]), 
	.A(in_1[1]));
   NA2X0 p2210A (.Q(n_74), 
	.B(in_0[5]), 
	.A(in_1[7]));
   NA2X0 p2444A (.Q(n_73), 
	.B(in_0[7]), 
	.A(in_1[5]));
   NO2X0 p0864D1549 (.Q(n_72), 
	.B(n_4), 
	.A(n_8));
   NA2X1 p0455D (.Q(n_71), 
	.B(in_0[4]), 
	.A(in_1[3]));
   AND2X0 p5214A (.Q(out_0[14]), 
	.B(in_0[7]), 
	.A(in_1[7]));
   NA2X0 p0762D (.Q(n_69), 
	.B(in_0[0]), 
	.A(in_1[2]));
   NO2X0 p4737A (.Q(out_0[0]), 
	.B(n_12), 
	.A(n_8));
   NO2I1X0 p0704D (.Q(n_67), 
	.B(n_11), 
	.AN(in_1[1]));
   NO2X0 p0674DT (.Q(n_65), 
	.B(n_12), 
	.A(n_14));
   NA2X0 p0959D (.Q(n_66), 
	.B(in_0[0]), 
	.A(in_1[5]));
   INX0 Fp0339D1550 (.Q(n_63), 
	.A(n_64));
   NO2I1X0 p0353D (.Q(n_64), 
	.B(n_2), 
	.AN(in_1[3]));
   NA2X0 p3997A (.Q(n_62), 
	.B(in_0[7]), 
	.A(in_1[6]));
   NA2X0 p3961A (.Q(n_61), 
	.B(in_0[6]), 
	.A(in_1[7]));
   NA2X0 p0384D (.Q(n_60), 
	.B(in_0[3]), 
	.A(in_1[5]));
   NA2X0 p0170D1551 (.Q(n_59), 
	.B(in_0[1]), 
	.A(in_1[7]));
   NA2X0 p1296A (.Q(n_58), 
	.B(in_0[7]), 
	.A(in_1[2]));
   NA2X1 n0064D1552 (.Q(n_57), 
	.B(in_0[0]), 
	.A(in_1[7]));
   INX0 Fp0906D (.Q(n_55), 
	.A(n_56));
   NA2X0 p0857D (.Q(n_56), 
	.B(in_0[2]), 
	.A(in_1[2]));
   NA2X0 p1249A (.Q(n_54), 
	.B(in_0[7]), 
	.A(in_1[3]));
   NA2X0 p1909A (.Q(n_53), 
	.B(in_0[6]), 
	.A(in_1[5]));
   NO2X0 p0245DT (.Q(n_51), 
	.B(n_2), 
	.A(n_7));
   NA2X0 p0464D (.Q(n_52), 
	.B(in_0[1]), 
	.A(in_1[6]));
   NO2X0 p0078DT (.Q(n_49), 
	.B(n_11), 
	.A(n_18));
   NA2X0 p0280D1553 (.Q(n_50), 
	.B(in_0[3]), 
	.A(in_1[3]));
   NA2X0 p0673D (.Q(n_48), 
	.B(in_0[4]), 
	.A(in_1[4]));
   NA2X0 p1060A (.Q(n_47), 
	.B(in_0[4]), 
	.A(in_1[6]));
   AND2X0 p0884D (.Q(n_46), 
	.B(in_0[4]), 
	.A(in_1[0]));
   NA2X0 p0996A (.Q(n_45), 
	.B(in_0[5]), 
	.A(in_1[5]));
   NA2X0 p0269D (.Q(n_44), 
	.B(in_0[1]), 
	.A(in_1[5]));
   INX0 Fp0612D (.Q(n_43), 
	.A(n_42));
   NO2I1X0 p0615D1554 (.Q(n_42), 
	.B(n_0), 
	.AN(in_1[1]));
   NA2X0 p0284D (.Q(n_41), 
	.B(in_0[0]), 
	.A(in_1[6]));
   NA2X0 p1326A (.Q(n_40), 
	.B(in_0[6]), 
	.A(in_1[3]));
   INX0 Fp0300D1557 (.Q(n_38), 
	.A(n_39));
   NO2I1X1 p0313D (.Q(n_39), 
	.B(n_4), 
	.AN(in_1[5]));
   NA2X0 p1718A (.Q(n_37), 
	.B(in_0[4]), 
	.A(in_1[7]));
   INX0 Fp0674D (.Q(n_36), 
	.A(n_35));
   NO2I1X0 p0672D (.Q(n_35), 
	.B(n_9), 
	.AN(in_1[1]));
   NA2X0 p0183DT (.Q(n_33), 
	.B(in_0[0]), 
	.A(in_1[4]));
   NO2X0 p0471D (.Q(n_34), 
	.B(n_12), 
	.A(n_3));
   NA2X0 p0492D (.Q(n_32), 
	.B(in_0[2]), 
	.A(in_1[7]));
   NA2X0 p2456A (.Q(n_31), 
	.B(in_0[5]), 
	.A(in_1[6]));
   NA2X0 p1280A (.Q(n_30), 
	.B(in_0[6]), 
	.A(in_1[4]));
   INX0 Fp0831D (.Q(n_29), 
	.A(n_28));
   NO2X0 p0803D (.Q(n_28), 
	.B(n_11), 
	.A(n_8));
   NA2X0 p0604DT (.Q(n_26), 
	.B(in_0[5]), 
	.A(in_1[1]));
   NO2I1X0 p0788D (.Q(n_27), 
	.B(n_19), 
	.AN(in_1[1]));
   NO2X0 p0092DT (.Q(n_24), 
	.B(n_4), 
	.A(n_3));
   NA2X0 p0237D (.Q(n_25), 
	.B(in_0[2]), 
	.A(in_1[4]));
   NA2X0 p0665D (.Q(n_23), 
	.B(in_0[5]), 
	.A(in_1[4]));
   NA2X0 p0792D1558 (.Q(n_22), 
	.B(in_0[3]), 
	.A(in_1[7]));
   NO2X0 p0738D (.Q(out_0[1]), 
	.B(n_2), 
	.A(n_8));
   NA2X0 p1107A (.Q(n_20), 
	.B(in_0[4]), 
	.A(in_1[5]));
   INX0 Fp0366D (.Q(n_19), 
	.A(in_0[5]));
   INX0 Fp10691A1561 (.Q(n_18), 
	.A(in_1[3]));
   INX0 Fp0592D1568 (.Q(n_15), 
	.A(in_0[6]));
   INX0 Fp10724A (.Q(n_14), 
	.A(in_1[5]));
   INX0 Fn0020D1570 (.Q(n_12), 
	.A(in_0[0]));
   INX0 Fn0068D1575 (.Q(n_11), 
	.A(in_0[3]));
   INX0 Fp0371D1581 (.Q(n_9), 
	.A(in_0[4]));
   INX0 Fp10478A1585 (.Q(n_8), 
	.A(in_1[0]));
   INX0 Fp10999A (.Q(n_7), 
	.A(in_1[6]));
   INX0 Fp10361A1587 (.Q(n_6), 
	.A(in_1[2]));
   INX0 Fp0027D1594 (.Q(n_4), 
	.A(in_0[2]));
   INX0 Fp10700A1595 (.Q(n_3), 
	.A(in_1[4]));
   INX0 Fp0026D1597 (.Q(n_2), 
	.A(in_0[1]));
   INX0 Fp0622D1604 (.Q(n_0), 
	.A(in_0[7]));
   EN2X0 g1 (.Q(n_285), 
	.B(n_76), 
	.A(n_78));
endmodule

module add_unsigned (
	A, 
	B, 
	Z);
   input [15:0] A;
   input [15:0] B;
   output [15:0] Z;

   // Internal wires
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_18;
   wire n_19;
   wire n_21;
   wire n_23;
   wire n_24;
   wire n_26;
   wire n_27;
   wire n_29;
   wire n_31;
   wire n_33;
   wire n_34;
   wire n_36;
   wire n_37;
   wire n_39;
   wire n_40;
   wire n_42;
   wire n_43;
   wire n_45;
   wire n_46;

   assign Z[0] = 1'b0 ;

   FAX0 p0982D (.S(Z[14]), 
	.CO(Z[15]), 
	.CI(n_46), 
	.B(B[14]), 
	.A(A[14]));
   FAX1 p0874D (.S(Z[13]), 
	.CO(n_46), 
	.CI(n_45), 
	.B(B[13]), 
	.A(A[13]));
   NA2X1 p0877D (.Q(n_45), 
	.B(n_9), 
	.A(n_43));
   EO3X0 p2156D (.Q(Z[12]), 
	.C(A[12]), 
	.B(B[12]), 
	.A(n_42));
   ON21X0 p0856D (.Q(n_43), 
	.C(n_42), 
	.B(A[12]), 
	.A(B[12]));
   NA2X0 p0891D (.Q(n_42), 
	.B(n_10), 
	.A(n_40));
   EN2X0 p2707A (.Q(Z[11]), 
	.B(n_15), 
	.A(n_39));
   ON21X0 p0882D (.Q(n_40), 
	.C(n_39), 
	.B(B[11]), 
	.A(A[11]));
   NA2X0 p0845D (.Q(n_39), 
	.B(n_8), 
	.A(n_37));
   EN2X0 p2943A (.Q(Z[10]), 
	.B(n_14), 
	.A(n_36));
   ON21X0 p0815D (.Q(n_37), 
	.C(n_36), 
	.B(B[10]), 
	.A(A[10]));
   NA2X0 p0846D (.Q(n_36), 
	.B(n_13), 
	.A(n_34));
   EO3X0 p2967A (.Q(Z[9]), 
	.C(A[9]), 
	.B(B[9]), 
	.A(n_33));
   ON21X0 p0813D (.Q(n_34), 
	.C(n_33), 
	.B(A[9]), 
	.A(B[9]));
   ON21X0 p0791D (.Q(n_33), 
	.C(n_6), 
	.B(n_4), 
	.A(n_31));
   EN3X0 p3397A (.Q(Z[8]), 
	.C(A[8]), 
	.B(B[8]), 
	.A(n_31));
   AN21X1 p0801D (.Q(n_31), 
	.C(n_7), 
	.B(n_12), 
	.A(n_29));
   EO3X0 p3308A (.Q(Z[7]), 
	.C(A[7]), 
	.B(B[7]), 
	.A(n_29));
   NA2X1 p0817D (.Q(n_29), 
	.B(n_5), 
	.A(n_27));
   EO3X0 p3562A (.Q(Z[6]), 
	.C(A[6]), 
	.B(B[6]), 
	.A(n_26));
   ON21X0 p0912D (.Q(n_27), 
	.C(n_26), 
	.B(A[6]), 
	.A(B[6]));
   NA2X0 p0918D (.Q(n_26), 
	.B(n_3), 
	.A(n_24));
   EO3X0 p3380A (.Q(Z[5]), 
	.C(A[5]), 
	.B(B[5]), 
	.A(n_23));
   ON21X0 p0925D (.Q(n_24), 
	.C(n_23), 
	.B(A[5]), 
	.A(B[5]));
   FAX0 p0758D (.S(Z[4]), 
	.CO(n_23), 
	.CI(n_21), 
	.B(B[4]), 
	.A(A[4]));
   NA2X1 p0764D (.Q(n_21), 
	.B(n_2), 
	.A(n_19));
   EO3X0 p4008A (.Q(Z[3]), 
	.C(A[3]), 
	.B(n_18), 
	.A(B[3]));
   ON21X0 p0798D (.Q(n_19), 
	.C(n_18), 
	.B(A[3]), 
	.A(B[3]));
   FAX0 p0740D (.S(Z[2]), 
	.CO(n_18), 
	.CI(B[2]), 
	.B(n_11), 
	.A(A[2]));
   EO2X0 p4314A (.Q(Z[1]), 
	.B(A[1]), 
	.A(B[1]));
   EN2X0 p3665A (.Q(n_15), 
	.B(B[11]), 
	.A(A[11]));
   EN2X0 p3660A (.Q(n_14), 
	.B(B[10]), 
	.A(A[10]));
   NA2X0 p1556D (.Q(n_13), 
	.B(A[9]), 
	.A(B[9]));
   OR2X0 p0940D (.Q(n_12), 
	.B(A[7]), 
	.A(B[7]));
   NO2X0 p0815D154 (.Q(n_11), 
	.B(n_0), 
	.A(n_1));
   NA2X0 p2495A (.Q(n_10), 
	.B(B[11]), 
	.A(A[11]));
   NA2X0 p3084A (.Q(n_9), 
	.B(A[12]), 
	.A(B[12]));
   NA2X0 p2177A (.Q(n_8), 
	.B(B[10]), 
	.A(A[10]));
   AND2X0 p0892D (.Q(n_7), 
	.B(A[7]), 
	.A(B[7]));
   NA2X0 p1265D (.Q(n_6), 
	.B(A[8]), 
	.A(B[8]));
   NA2X0 p0986D (.Q(n_5), 
	.B(A[6]), 
	.A(B[6]));
   NO2X0 p1102D (.Q(n_4), 
	.B(A[8]), 
	.A(B[8]));
   NA2X0 p0951D (.Q(n_3), 
	.B(A[5]), 
	.A(B[5]));
   NA2X0 p0886D (.Q(n_2), 
	.B(A[3]), 
	.A(B[3]));
   INX0 Fp0814D (.Q(n_1), 
	.A(B[1]));
   INX0 Fp0816D (.Q(n_0), 
	.A(A[1]));
endmodule

module shared_div_rem_unsigned_300 (
	A, 
	B, 
	QUOTIENT, 
	REMAINDER);
   input [7:0] A;
   input [7:0] B;
   output [7:0] QUOTIENT;
   output [7:0] REMAINDER;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_248;
   wire n_249;
   wire n_250;
   wire n_251;
   wire n_252;
   wire n_253;
   wire n_254;
   wire n_255;
   wire n_256;
   wire n_257;
   wire n_258;
   wire n_259;
   wire n_260;
   wire n_261;
   wire n_262;
   wire n_263;
   wire n_265;
   wire n_266;
   wire n_267;
   wire n_268;
   wire n_269;
   wire n_270;
   wire n_271;
   wire n_272;
   wire n_273;
   wire n_274;
   wire n_275;
   wire n_276;
   wire n_277;
   wire n_278;
   wire n_279;
   wire n_280;
   wire n_281;
   wire n_282;
   wire n_283;
   wire n_284;
   wire n_285;
   wire n_286;
   wire n_287;
   wire n_288;
   wire n_289;
   wire n_290;
   wire n_291;
   wire n_292;
   wire n_293;
   wire n_294;
   wire n_295;
   wire n_296;
   wire n_297;
   wire n_298;
   wire n_299;
   wire n_300;
   wire n_301;
   wire n_302;
   wire n_303;
   wire n_304;
   wire n_305;
   wire n_306;
   wire n_307;
   wire n_308;
   wire n_309;
   wire n_310;
   wire n_311;
   wire n_312;
   wire n_313;
   wire n_314;
   wire n_315;
   wire n_316;
   wire n_317;
   wire n_318;
   wire n_319;
   wire n_320;
   wire n_321;
   wire n_322;
   wire n_323;
   wire n_324;
   wire n_325;
   wire n_326;
   wire n_327;
   wire n_328;
   wire n_329;
   wire n_330;
   wire n_331;
   wire n_332;
   wire n_333;
   wire n_334;
   wire n_335;
   wire n_336;
   wire n_337;
   wire n_338;
   wire n_339;
   wire n_340;
   wire n_341;
   wire n_342;
   wire n_343;
   wire n_344;
   wire n_345;
   wire n_346;
   wire n_347;
   wire n_348;
   wire n_349;
   wire n_350;
   wire n_351;
   wire n_352;
   wire n_353;
   wire n_354;
   wire n_355;
   wire n_356;
   wire n_357;
   wire n_358;
   wire n_359;
   wire n_360;
   wire n_361;
   wire n_362;
   wire n_363;
   wire n_364;
   wire n_365;
   wire n_366;
   wire n_367;
   wire n_368;
   wire n_369;
   wire n_370;
   wire n_371;
   wire n_372;
   wire n_373;
   wire n_374;
   wire n_375;
   wire n_376;
   wire n_377;
   wire n_378;
   wire n_379;
   wire n_380;
   wire n_381;
   wire n_382;
   wire n_383;
   wire n_384;
   wire n_385;
   wire n_386;
   wire n_387;
   wire n_388;
   wire n_389;
   wire n_390;
   wire n_391;
   wire n_392;
   wire n_393;
   wire n_394;
   wire n_395;
   wire n_396;
   wire n_397;
   wire n_400;
   wire n_401;
   wire n_402;
   wire n_403;
   wire n_404;
   wire n_406;
   wire n_407;
   wire n_408;
   wire n_409;
   wire n_410;
   wire n_411;
   wire n_434;

   AO22X1 p0902D (.Q(REMAINDER[0]), 
	.D(A[0]), 
	.C(n_411), 
	.B(n_19), 
	.A(QUOTIENT[0]));
   ON21X0 p1131D (.Q(REMAINDER[6]), 
	.C(n_407), 
	.B(n_386), 
	.A(n_401));
   ON21X0 p1144D (.Q(REMAINDER[2]), 
	.C(n_408), 
	.B(n_341), 
	.A(n_401));
   ON21X0 p1133D (.Q(REMAINDER[1]), 
	.C(n_409), 
	.B(n_35), 
	.A(n_401));
   ON21X0 p1239D (.Q(REMAINDER[3]), 
	.C(n_406), 
	.B(n_354), 
	.A(n_401));
   ON221X0 p1243D (.Q(REMAINDER[5]), 
	.E(n_400), 
	.D(n_402), 
	.C(n_377), 
	.B(n_401), 
	.A(n_378));
   ON21X0 p1225D (.Q(REMAINDER[4]), 
	.C(n_410), 
	.B(n_365), 
	.A(n_401));
   ON211X0 p0829D (.Q(n_411), 
	.D(n_401), 
	.C(n_397), 
	.B(B[0]), 
	.A(n_404));
   AN222X0 p0842D (.Q(n_410), 
	.F(n_366), 
	.E(n_403), 
	.D(n_396), 
	.C(n_284), 
	.B(n_383), 
	.A(n_348));
   AN222X0 p0935D (.Q(n_409), 
	.F(n_403), 
	.E(n_59), 
	.D(n_383), 
	.C(n_94), 
	.B(A[1]), 
	.A(n_396));
   AN222X0 p0936D (.Q(n_408), 
	.F(n_403), 
	.E(n_340), 
	.D(n_383), 
	.C(n_342), 
	.B(n_287), 
	.A(n_396));
   AN222X0 p0906D (.Q(n_407), 
	.F(n_403), 
	.E(n_387), 
	.D(n_396), 
	.C(n_280), 
	.B(n_367), 
	.A(n_383));
   AN222X0 p0842D5122 (.Q(n_406), 
	.F(n_353), 
	.E(n_403), 
	.D(n_383), 
	.C(n_346), 
	.B(n_396), 
	.A(n_279));
   INX0 Fp0820D (.Q(n_404), 
	.A(QUOTIENT[0]));
   NA2X1 p0816D (.Q(QUOTIENT[0]), 
	.B(n_382), 
	.A(n_402));
   INX1 Fp0793D (.Q(n_403), 
	.A(n_402));
   NA2I1X2 p0793D (.Q(n_402), 
	.B(n_397), 
	.AN(QUOTIENT[1]));
   NA2X1 p0801D (.Q(n_401), 
	.B(QUOTIENT[1]), 
	.A(n_382));
   AN22X0 p1000D (.Q(n_400), 
	.D(n_282), 
	.C(n_396), 
	.B(n_359), 
	.A(n_383));
   ON22X0 p1336D (.Q(REMAINDER[7]), 
	.D(n_331), 
	.C(n_382), 
	.B(n_261), 
	.A(n_397));
   NA2X2 p0777D (.Q(QUOTIENT[1]), 
	.B(n_278), 
	.A(n_395));
   NO2X1 p0726DT (.Q(n_396), 
	.B(n_394), 
	.A(n_392));
   NA2X2 p0812D (.Q(n_397), 
	.B(n_393), 
	.A(n_391));
   NA2X1 p0788D (.Q(n_395), 
	.B(n_286), 
	.A(n_388));
   INX1 Fp0775D (.Q(n_394), 
	.A(n_393));
   NA2X2 p0759D (.Q(n_393), 
	.B(n_5), 
	.A(n_390));
   INX0 Fp0806D (.Q(n_392), 
	.A(n_391));
   NA2X1 p0798D (.Q(n_391), 
	.B(n_262), 
	.A(n_389));
   NA2X1 p0768D (.Q(n_390), 
	.B(n_305), 
	.A(n_384));
   NA2X1 p0793D5126 (.Q(n_389), 
	.B(n_329), 
	.A(n_384));
   NA2X1 p0788D5127 (.Q(n_388), 
	.B(n_290), 
	.A(n_385));
   EO2X0 p1041D (.Q(n_387), 
	.B(n_317), 
	.A(n_379));
   EO2X0 p1581D (.Q(n_386), 
	.B(n_318), 
	.A(n_380));
   NA2X1 p0801D5128 (.Q(n_385), 
	.B(n_293), 
	.A(n_381));
   NA2X2 p0774D (.Q(n_384), 
	.B(n_300), 
	.A(n_379));
   ON21X1 p0636DT (.Q(n_382), 
	.C(n_106), 
	.B(n_277), 
	.A(n_373));
   NO2I1X1 p0817D (.Q(n_383), 
	.B(n_374), 
	.AN(n_106));
   NA2X1 p0621DT (.Q(n_381), 
	.B(n_311), 
	.A(n_376));
   AND2X0 p1380D (.Q(n_380), 
	.B(n_311), 
	.A(n_376));
   NA2X2 p0781D (.Q(n_379), 
	.B(n_304), 
	.A(n_375));
   EO2X0 p1755D (.Q(n_378), 
	.B(n_321), 
	.A(n_371));
   EO2X0 p1782D (.Q(n_377), 
	.B(n_320), 
	.A(n_372));
   NA2X1 p0786D (.Q(n_376), 
	.B(n_308), 
	.A(n_369));
   NA2X1 p0794D (.Q(n_375), 
	.B(n_301), 
	.A(n_368));
   NO2X1 p0796D (.Q(n_374), 
	.B(n_277), 
	.A(n_373));
   NO2X2 p0778D (.Q(n_373), 
	.B(n_276), 
	.A(n_370));
   INX0 Fp0806D5129 (.Q(n_372), 
	.A(n_368));
   INX0 Fp0791D (.Q(n_371), 
	.A(n_369));
   NO2I1X2 p0778D5130 (.Q(n_370), 
	.B(n_363), 
	.AN(n_292));
   NA2X1 p0790D (.Q(n_369), 
	.B(n_310), 
	.A(n_364));
   NA2X1 p0802D (.Q(n_368), 
	.B(n_303), 
	.A(n_362));
   EO2X0 p0829D5131 (.Q(n_367), 
	.B(n_324), 
	.A(n_361));
   EO2X0 p1538D (.Q(n_366), 
	.B(n_326), 
	.A(n_355));
   EO2X0 p2205D (.Q(n_365), 
	.B(n_327), 
	.A(n_356));
   NA2X0 p0800D (.Q(n_364), 
	.B(n_309), 
	.A(n_357));
   NO2X1 p0752D (.Q(n_363), 
	.B(n_291), 
	.A(n_360));
   NA2X1 p0807D (.Q(n_362), 
	.B(n_302), 
	.A(n_355));
   NO2X0 p0802D5132 (.Q(n_361), 
	.B(n_338), 
	.A(n_358));
   NO2X1 p0767D (.Q(n_360), 
	.B(n_344), 
	.A(n_358));
   EO2X0 p1048D (.Q(n_359), 
	.B(n_328), 
	.A(n_349));
   NA2X1 p0764D (.Q(n_358), 
	.B(n_307), 
	.A(n_351));
   NA2X0 p0637DT (.Q(n_357), 
	.B(n_299), 
	.A(n_352));
   AND2X0 p1970D (.Q(n_356), 
	.B(n_299), 
	.A(n_352));
   NA2X0 p0792D (.Q(n_355), 
	.B(n_295), 
	.A(n_350));
   EO2X0 p2442D (.Q(n_354), 
	.B(n_323), 
	.A(n_347));
   EO2X0 p1783D (.Q(n_353), 
	.B(n_319), 
	.A(n_332));
   NA2X0 p0805D (.Q(n_352), 
	.B(n_298), 
	.A(n_333));
   ON21X1 p0787D (.Q(n_351), 
	.C(n_306), 
	.B(n_289), 
	.A(n_345));
   NA2X0 p0789D (.Q(n_350), 
	.B(n_294), 
	.A(n_332));
   AN21X0 p0974D (.Q(n_349), 
	.C(n_289), 
	.B(n_288), 
	.A(n_343));
   EO2X0 p1248D (.Q(n_348), 
	.B(n_322), 
	.A(n_343));
   INX0 Fp0809D (.Q(n_347), 
	.A(n_333));
   EO2X0 p1270D (.Q(n_346), 
	.B(n_325), 
	.A(n_339));
   NO2I1X1 p0786D5133 (.Q(n_345), 
	.B(n_337), 
	.AN(n_288));
   AND2X1 p0844D (.Q(n_344), 
	.B(n_79), 
	.A(n_338));
   ON21X0 p0857D (.Q(n_343), 
	.C(n_337), 
	.B(n_296), 
	.A(n_336));
   EO2X0 p1578D (.Q(n_342), 
	.B(n_79), 
	.A(n_334));
   EO3X0 p2698A (.Q(n_341), 
	.C(n_24), 
	.B(B[1]), 
	.A(n_287));
   EN3X0 p2271D (.Q(n_340), 
	.C(n_62), 
	.B(B[2]), 
	.A(n_287));
   NA2X0 p1228D (.Q(n_339), 
	.B(n_316), 
	.A(n_336));
   NO3X1 p0817D5134 (.Q(n_338), 
	.C(n_296), 
	.B(n_314), 
	.A(n_330));
   NO2I1X1 p0801D5135 (.Q(n_337), 
	.B(n_335), 
	.AN(n_297));
   NA2X0 p0875D (.Q(n_336), 
	.B(n_79), 
	.A(n_315));
   NO2X1 p0800D5136 (.Q(n_335), 
	.B(n_296), 
	.A(n_316));
   AND2X0 p1328D (.Q(n_334), 
	.B(n_316), 
	.A(n_315));
   NA2X1 p0809D (.Q(n_333), 
	.B(n_66), 
	.A(n_313));
   NA2X1 p0790D5137 (.Q(n_332), 
	.B(n_82), 
	.A(n_312));
   EN2X0 p2341D (.Q(n_331), 
	.B(n_277), 
	.A(n_291));
   NA2X0 p0805D5138 (.Q(n_330), 
	.B(n_306), 
	.A(n_288));
   AND2X0 p1416D (.Q(n_329), 
	.B(B[7]), 
	.A(n_305));
   NA2X0 p1652D (.Q(n_328), 
	.B(n_306), 
	.A(n_307));
   AND2X0 p2268D (.Q(n_327), 
	.B(n_309), 
	.A(n_310));
   AND2X0 p1577D (.Q(n_326), 
	.B(n_302), 
	.A(n_303));
   NO2I1X0 p1248D5139 (.Q(n_325), 
	.B(n_296), 
	.AN(n_297));
   NA2I1X0 p1393D (.Q(n_324), 
	.B(n_292), 
	.AN(n_291));
   AND2X0 p2268D5140 (.Q(n_323), 
	.B(n_298), 
	.A(n_299));
   NO2I1X0 p1267D (.Q(n_322), 
	.B(n_289), 
	.AN(n_288));
   AND2X0 p2103D (.Q(n_321), 
	.B(n_308), 
	.A(n_311));
   AND2X0 p2130D (.Q(n_320), 
	.B(n_301), 
	.A(n_304));
   AND2X0 p1576D (.Q(n_319), 
	.B(n_294), 
	.A(n_295));
   AND2X0 p2172D (.Q(n_318), 
	.B(n_293), 
	.A(n_290));
   AND2X0 p1580D (.Q(n_317), 
	.B(n_300), 
	.A(n_305));
   NA2X0 p0789D5141 (.Q(n_316), 
	.B(n_73), 
	.A(n_287));
   INX0 Fp0796D (.Q(n_315), 
	.A(n_314));
   NO2X0 p0788D5142 (.Q(n_314), 
	.B(n_73), 
	.A(n_287));
   NA2X0 p0818D (.Q(n_313), 
	.B(n_67), 
	.A(n_287));
   NA2X0 p0793D5143 (.Q(n_312), 
	.B(n_83), 
	.A(n_287));
   NA2X0 p1453D (.Q(n_311), 
	.B(n_8), 
	.A(n_282));
   NA2X0 p1114D (.Q(n_310), 
	.B(n_9), 
	.A(n_284));
   OR2X0 p0925D (.Q(n_309), 
	.B(n_9), 
	.A(n_284));
   OR2X0 p1185D (.Q(n_308), 
	.B(n_8), 
	.A(n_282));
   NA2X0 p1135D (.Q(n_307), 
	.B(n_102), 
	.A(n_282));
   NA2X0 p0817D5144 (.Q(n_306), 
	.B(n_103), 
	.A(n_281));
   NA2I1X0 p1118D (.Q(n_305), 
	.B(n_280), 
	.AN(B[6]));
   NA2X0 p1236D (.Q(n_304), 
	.B(n_2), 
	.A(n_282));
   NA2X0 p1013D (.Q(n_303), 
	.B(n_8), 
	.A(n_284));
   OR2X0 p0830D (.Q(n_302), 
	.B(n_8), 
	.A(n_284));
   NA2X0 p1186D (.Q(n_301), 
	.B(B[5]), 
	.A(n_281));
   NA2I1X0 p1111D (.Q(n_300), 
	.B(B[6]), 
	.AN(n_280));
   NA2X0 p0951D (.Q(n_299), 
	.B(n_7), 
	.A(n_279));
   OR2X0 p0839D (.Q(n_298), 
	.B(n_7), 
	.A(n_279));
   NA2X0 p0822D (.Q(n_297), 
	.B(n_85), 
	.A(n_279));
   NO2I1X1 p0791D (.Q(n_296), 
	.B(n_279), 
	.AN(n_86));
   NA2X0 p0888D (.Q(n_295), 
	.B(n_9), 
	.A(n_279));
   OR2X0 p0816D5145 (.Q(n_294), 
	.B(n_9), 
	.A(n_279));
   OR2X0 p1357D (.Q(n_293), 
	.B(n_2), 
	.A(n_280));
   NA2X0 p1318D (.Q(n_292), 
	.B(n_280), 
	.A(n_105));
   NO2X0 p1164D (.Q(n_291), 
	.B(n_280), 
	.A(n_105));
   NA2X0 p1591D (.Q(n_290), 
	.B(n_2), 
	.A(n_280));
   AND2X0 p0841D (.Q(n_289), 
	.B(n_97), 
	.A(n_284));
   NA2X0 p0792D5146 (.Q(n_288), 
	.B(n_96), 
	.A(n_283));
   NA2X1 p0726D (.Q(n_287), 
	.B(n_274), 
	.A(n_285));
   AO21X0 p1803D (.Q(n_286), 
	.C(n_22), 
	.B(n_5), 
	.A(n_262));
   NA2X1 p0724D (.Q(n_285), 
	.B(A[2]), 
	.A(n_275));
   NA3X1 p0642DT (.Q(n_284), 
	.C(n_267), 
	.B(n_260), 
	.A(n_266));
   NO2X0 p0831D (.Q(n_283), 
	.B(n_265), 
	.A(n_271));
   INX0 Fp0814D5147 (.Q(n_282), 
	.A(n_281));
   NO2X1 p0818D5148 (.Q(n_281), 
	.B(n_269), 
	.A(n_273));
   ON21X0 p0931D (.Q(n_280), 
	.C(n_272), 
	.B(n_239), 
	.A(n_253));
   NA2X1 p0790D5149 (.Q(n_279), 
	.B(n_263), 
	.A(n_270));
   NA2X0 p2203D (.Q(n_278), 
	.B(n_22), 
	.A(n_262));
   NO2X0 p2032D (.Q(n_277), 
	.B(n_261), 
	.A(n_107));
   AND2X0 p1484D (.Q(n_276), 
	.B(n_261), 
	.A(n_107));
   NA2X0 p0743D (.Q(n_275), 
	.B(B[0]), 
	.A(QUOTIENT[2]));
   NA2X0 p0809D5150 (.Q(n_274), 
	.B(n_21), 
	.A(QUOTIENT[2]));
   NA2X0 p0810D (.Q(n_273), 
	.B(n_268), 
	.A(n_257));
   AN21X0 p0964D (.Q(n_272), 
	.C(n_258), 
	.B(n_243), 
	.A(n_250));
   NA2X0 p0841D5151 (.Q(n_271), 
	.B(n_267), 
	.A(n_260));
   AN21X0 p0802D5152 (.Q(n_270), 
	.C(n_259), 
	.B(n_34), 
	.A(n_250));
   NO2X0 p0846D (.Q(n_269), 
	.B(n_227), 
	.A(n_253));
   NA2X0 p0818D5153 (.Q(n_268), 
	.B(n_234), 
	.A(n_250));
   NA2X0 p0816D5154 (.Q(n_267), 
	.B(n_221), 
	.A(n_250));
   INX0 Fp0772D (.Q(n_266), 
	.A(n_265));
   NO2I1X0 p0772D (.Q(n_265), 
	.B(n_253), 
	.AN(n_215));
   NO2X1 p0703D (.Q(QUOTIENT[2]), 
	.B(n_248), 
	.A(n_250));
   NA2X0 p0840D (.Q(n_263), 
	.B(n_58), 
	.A(n_252));
   NO2X0 p1209DT (.Q(n_261), 
	.B(n_115), 
	.A(n_251));
   OR2X0 p1351D (.Q(n_262), 
	.B(n_115), 
	.A(n_251));
   AND2X0 p0801D5155 (.Q(n_260), 
	.B(n_236), 
	.A(n_255));
   NA2X0 p0804D (.Q(n_259), 
	.B(n_235), 
	.A(n_254));
   ON21X0 p0930D (.Q(n_258), 
	.C(n_256), 
	.B(n_223), 
	.A(n_232));
   AN22X0 p0844D5156 (.Q(n_257), 
	.D(n_174), 
	.C(n_248), 
	.B(n_220), 
	.A(n_231));
   NA2X0 p0930D5157 (.Q(n_256), 
	.B(n_172), 
	.A(n_248));
   NA2X0 p0807D5158 (.Q(n_255), 
	.B(n_177), 
	.A(n_248));
   NA2X1 p0809D5159 (.Q(n_254), 
	.B(A[3]), 
	.A(n_248));
   NA2X1 p0573DT (.Q(n_253), 
	.B(n_246), 
	.A(n_249));
   NO2X0 p0854D (.Q(n_252), 
	.B(n_248), 
	.A(QUOTIENT[3]));
   NO2X0 p1087D (.Q(n_251), 
	.B(n_153), 
	.A(n_249));
   NO2X2 p0691D (.Q(n_250), 
	.B(n_231), 
	.A(n_246));
   NO2I1X2 p0560DT (.Q(n_248), 
	.B(n_245), 
	.AN(n_156));
   OR2X0 p0779D (.Q(n_249), 
	.B(n_157), 
	.A(n_245));
   INX0 Fp0684D5160 (.Q(QUOTIENT[3]), 
	.A(n_246));
   NO2I1X2 p0682D (.Q(n_246), 
	.B(n_244), 
	.AN(n_159));
   NO2X2 p0679D (.Q(n_245), 
	.B(n_163), 
	.A(n_241));
   NO2I1X1 p0704D (.Q(n_244), 
	.B(n_242), 
	.AN(n_164));
   INX0 Fp1140D (.Q(n_243), 
	.A(n_240));
   NO2I1X2 p0704D5161 (.Q(n_242), 
	.B(n_238), 
	.AN(n_189));
   NO2I1X1 p0690D (.Q(n_241), 
	.B(n_237), 
	.AN(n_183));
   EO2X0 p0884D (.Q(n_240), 
	.B(n_196), 
	.A(n_230));
   EO2X0 p0973D (.Q(n_239), 
	.B(n_194), 
	.A(n_233));
   NO2X1 p0679D5162 (.Q(n_238), 
	.B(n_188), 
	.A(n_230));
   NO2X1 p0679D5163 (.Q(n_237), 
	.B(n_182), 
	.A(n_229));
   NA2X0 p0796D5164 (.Q(n_236), 
	.B(n_217), 
	.A(n_231));
   NA2X1 p0799D (.Q(n_235), 
	.B(n_95), 
	.A(n_231));
   INX0 Fp1285D (.Q(n_234), 
	.A(n_228));
   INX0 Fp0696D (.Q(n_233), 
	.A(n_229));
   INX0 Fp0712D (.Q(n_232), 
	.A(n_231));
   NO2I1X2 p0711D (.Q(n_231), 
	.B(n_224), 
	.AN(n_160));
   NO2I1X1 p0700D (.Q(n_230), 
	.B(n_226), 
	.AN(n_187));
   NO2I1X2 p0709D (.Q(n_229), 
	.B(n_225), 
	.AN(n_190));
   EO2X0 p0950D (.Q(n_228), 
	.B(n_206), 
	.A(n_197));
   EO2X0 p1038D (.Q(n_227), 
	.B(n_205), 
	.A(n_195));
   NO2X1 p0697D (.Q(n_226), 
	.B(n_184), 
	.A(n_206));
   NO2X1 p0706D (.Q(n_225), 
	.B(n_181), 
	.A(n_205));
   NO2X1 p0678D (.Q(n_224), 
	.B(n_192), 
	.A(n_222));
   EO2X0 p0904D (.Q(n_223), 
	.B(n_202), 
	.A(n_219));
   NO2X1 p0674D (.Q(n_222), 
	.B(n_179), 
	.A(n_218));
   INX0 Fp1240D (.Q(n_221), 
	.A(n_216));
   EN2X0 p0839D5165 (.Q(n_220), 
	.B(n_201), 
	.A(n_213));
   NO2X0 p0865D (.Q(n_219), 
	.B(n_209), 
	.A(n_212));
   NO2X1 p0687D (.Q(n_218), 
	.B(n_212), 
	.A(n_214));
   EN2X0 p0853D (.Q(n_217), 
	.B(n_77), 
	.A(n_207));
   EO2X0 p0895D (.Q(n_216), 
	.B(n_31), 
	.A(n_204));
   EO2X0 p0857D5166 (.Q(n_215), 
	.B(n_61), 
	.A(n_203));
   NO2I1X0 p0690D5167 (.Q(n_214), 
	.B(n_208), 
	.AN(n_77));
   NA2X0 p0838D (.Q(n_213), 
	.B(n_199), 
	.A(n_211));
   NA2X1 p0697D5168 (.Q(n_212), 
	.B(n_185), 
	.A(n_210));
   NA2X0 p0846D5169 (.Q(n_211), 
	.B(n_77), 
	.A(n_200));
   NA2X1 p0702D (.Q(n_210), 
	.B(n_178), 
	.A(n_198));
   INX0 Fp0691D (.Q(n_209), 
	.A(n_208));
   NA2X1 p0690D5170 (.Q(n_208), 
	.B(n_178), 
	.A(n_200));
   NA2X0 p0860D (.Q(n_207), 
	.B(n_200), 
	.A(n_199));
   NO2X1 p0710D (.Q(n_206), 
	.B(n_65), 
	.A(n_193));
   NO2I1X1 p0739D (.Q(n_205), 
	.B(n_191), 
	.AN(n_84));
   MU2IX0 p0844D5171 (.S(n_177), 
	.Q(n_204), 
	.IN1(n_6), 
	.IN0(B[1]));
   MU2IX0 p0806D (.S(n_177), 
	.Q(n_203), 
	.IN1(n_7), 
	.IN0(B[2]));
   NO2I1X0 p1108D (.Q(n_202), 
	.B(n_179), 
	.AN(n_180));
   NA2X0 p0892D (.Q(n_201), 
	.B(n_185), 
	.A(n_178));
   NA2I1X1 p0701D (.Q(n_200), 
	.B(n_176), 
	.AN(n_73));
   INX0 Fp0683D (.Q(n_199), 
	.A(n_198));
   NO2I1X1 p0682D5172 (.Q(n_198), 
	.B(n_176), 
	.AN(n_73));
   NO2I1X0 p0877D (.Q(n_197), 
	.B(n_184), 
	.AN(n_187));
   NO2I1X0 p0880D (.Q(n_196), 
	.B(n_188), 
	.AN(n_189));
   NO2I1X0 p0966D (.Q(n_195), 
	.B(n_181), 
	.AN(n_190));
   NA2I1X0 p1104D (.Q(n_194), 
	.B(n_183), 
	.AN(n_182));
   NO2X1 p0689D (.Q(n_193), 
	.B(n_63), 
	.A(n_176));
   ON21X0 p0804D5173 (.Q(n_192), 
	.C(n_180), 
	.B(n_153), 
	.A(n_103));
   NO2I1X1 p0742D (.Q(n_191), 
	.B(n_176), 
	.AN(n_81));
   NA2X1 p0825D (.Q(n_190), 
	.B(n_174), 
	.A(n_9));
   NA2X0 p0845D (.Q(n_189), 
	.B(n_172), 
	.A(n_9));
   NO2X0 p0950D5174 (.Q(n_188), 
	.B(n_172), 
	.A(n_9));
   INX0 Fp0812D (.Q(n_187), 
	.A(n_186));
   NO2I1X0 p0812D5175 (.Q(n_186), 
	.B(n_173), 
	.AN(n_7));
   NA2X1 p0851D (.Q(n_185), 
	.B(n_174), 
	.A(n_85));
   AND2X1 p0814D (.Q(n_184), 
	.B(n_173), 
	.A(B[2]));
   NA2X0 p0910D (.Q(n_183), 
	.B(n_172), 
	.A(n_8));
   NO2X0 p0930D5176 (.Q(n_182), 
	.B(n_172), 
	.A(n_8));
   AND2X0 p0823D (.Q(n_181), 
	.B(n_173), 
	.A(B[3]));
   NA2X0 p0791D5177 (.Q(n_180), 
	.B(n_172), 
	.A(n_97));
   NO2X0 p1122D (.Q(n_179), 
	.B(n_172), 
	.A(n_97));
   NA2X1 p0730D (.Q(n_178), 
	.B(n_173), 
	.A(n_86));
   INX0 Fp0634D (.Q(n_177), 
	.A(n_176));
   NO2X2 p0633D (.Q(n_176), 
	.B(n_170), 
	.A(n_175));
   NO2I1X1 p0641D (.Q(n_175), 
	.B(n_171), 
	.AN(A[4]));
   NO2X2 p0593DT (.Q(n_173), 
	.B(n_165), 
	.A(n_169));
   OR2X1 p0798D5179 (.Q(n_174), 
	.B(n_165), 
	.A(n_169));
   NA3I1X1 p0807D5180 (.Q(n_172), 
	.C(n_155), 
	.B(n_162), 
	.AN(n_166));
   NO2I1X1 p0642D (.Q(n_171), 
	.B(n_167), 
	.AN(B[0]));
   NO2I1X1 p0714D (.Q(n_170), 
	.B(n_167), 
	.AN(n_16));
   NA2X2 p0718D (.Q(n_169), 
	.B(n_161), 
	.A(n_150));
   INX0 Fp0614D (.Q(QUOTIENT[4]), 
	.A(n_167));
   NA2X2 p0614D (.Q(n_167), 
	.B(n_145), 
	.A(n_158));
   NO2I1X0 p0806D5181 (.Q(n_166), 
	.B(n_158), 
	.AN(n_434));
   NO2I1X1 p0752D5182 (.Q(n_165), 
	.B(n_158), 
	.AN(n_40));
   OR2X0 p0947D (.Q(n_164), 
	.B(n_157), 
	.A(n_56));
   AN21X0 p1085D (.Q(n_163), 
	.C(n_46), 
	.B(n_154), 
	.A(n_22));
   NA3X0 p0862D (.Q(n_162), 
	.C(n_139), 
	.B(n_145), 
	.A(n_152));
   NA3X1 p0733D (.Q(n_161), 
	.C(n_57), 
	.B(n_145), 
	.A(n_152));
   AN21X0 p1146D (.Q(n_160), 
	.C(n_108), 
	.B(n_153), 
	.A(n_103));
   NA2X0 p1355D (.Q(n_159), 
	.B(n_154), 
	.A(n_56));
   NA2X2 p0609D (.Q(n_158), 
	.B(n_135), 
	.A(QUOTIENT[5]));
   NO2X0 p0745DT (.Q(n_157), 
	.B(n_153), 
	.A(n_47));
   NA2X0 p1387D (.Q(n_156), 
	.B(n_154), 
	.A(n_46));
   NA2X0 p0810D5183 (.Q(n_155), 
	.B(n_119), 
	.A(n_148));
   NA2X0 p0733DT (.Q(n_153), 
	.B(n_121), 
	.A(n_146));
   AND2X0 p0851D5184 (.Q(n_154), 
	.B(n_121), 
	.A(n_146));
   INX0 Fp0642D5185 (.Q(n_152), 
	.A(QUOTIENT[5]));
   NA2X2 p0642D5186 (.Q(QUOTIENT[5]), 
	.B(n_127), 
	.A(n_147));
   NO2X1 p0712D (.Q(n_150), 
	.B(n_140), 
	.A(n_149));
   NO2I1X1 p0742D5187 (.Q(n_149), 
	.B(n_145), 
	.AN(A[5]));
   NA2X0 p0816D5188 (.Q(n_148), 
	.B(n_141), 
	.A(n_145));
   NA2X1 p0651D (.Q(n_147), 
	.B(n_144), 
	.A(n_137));
   NA2X0 p0796D5189 (.Q(n_146), 
	.B(n_142), 
	.A(n_145));
   NO2I1X2 p0626D (.Q(n_145), 
	.B(n_143), 
	.AN(n_56));
   INX0 Fp0668D (.Q(n_144), 
	.A(n_131));
   NO2X1 p0622D (.Q(n_143), 
	.B(n_126), 
	.A(n_136));
   OR2X1 p0824D (.Q(n_142), 
	.B(n_135), 
	.A(n_86));
   NA2X0 p0904D5190 (.Q(n_141), 
	.B(n_134), 
	.A(n_73));
   NO2X0 p0823D5191 (.Q(n_140), 
	.B(n_87), 
	.A(n_135));
   EN2X0 p0893D (.Q(n_139), 
	.B(n_76), 
	.A(n_129));
   NO2I1X1 p0668D (.Q(n_137), 
	.B(n_133), 
	.AN(n_56));
   NO2X1 p0641D5193 (.Q(n_136), 
	.B(n_123), 
	.A(n_132));
   INX0 Fp0756D (.Q(n_134), 
	.A(n_135));
   NA3X1 p0774D5194 (.Q(n_135), 
	.C(n_112), 
	.B(n_124), 
	.A(n_128));
   NO2I1X0 p0667D (.Q(n_133), 
	.B(n_126), 
	.AN(n_28));
   NA2X0 p0686D (.Q(n_132), 
	.B(n_93), 
	.A(n_125));
   NO2I1X0 p0655D (.Q(n_131), 
	.B(n_122), 
	.AN(n_64));
   MU2IX0 p0822D5195 (.S(n_118), 
	.Q(n_130), 
	.IN1(n_6), 
	.IN0(B[1]));
   MU2IX0 p0848D (.S(n_118), 
	.Q(n_129), 
	.IN1(n_7), 
	.IN0(B[2]));
   NA2X0 p0787D5196 (.Q(n_128), 
	.B(n_120), 
	.A(n_86));
   NA2X0 p0894D (.Q(n_127), 
	.B(n_121), 
	.A(n_72));
   NO2I1X1 p0658D (.Q(n_126), 
	.B(n_120), 
	.AN(n_9));
   NA2X0 p0695D (.Q(n_125), 
	.B(n_120), 
	.A(B[3]));
   NA2I1X0 p0763D (.Q(n_124), 
	.B(n_118), 
	.AN(n_73));
   NO2X0 p0639D (.Q(n_123), 
	.B(n_92), 
	.A(n_119));
   NO2X0 p0695D5197 (.Q(n_122), 
	.B(n_68), 
	.A(n_118));
   INX0 Fp0635D5198 (.Q(n_121), 
	.A(n_120));
   NO2X1 p0634D (.Q(n_120), 
	.B(n_115), 
	.A(n_101));
   NO2X1 p0528DT (.Q(n_118), 
	.B(n_116), 
	.A(n_100));
   NA2X0 p0798D5199 (.Q(n_119), 
	.B(n_99), 
	.A(n_117));
   INX0 Fp0608D (.Q(n_117), 
	.A(n_116));
   NO2X0 p0622D5200 (.Q(n_116), 
	.B(n_36), 
	.A(n_113));
   NO2X0 p0663D (.Q(n_115), 
	.B(n_74), 
	.A(n_113));
   ON21X0 p6392A (.Q(QUOTIENT[6]), 
	.C(n_113), 
	.B(QUOTIENT[7]), 
	.A(n_90));
   NA2X0 p0616D (.Q(n_113), 
	.B(n_69), 
	.A(n_111));
   AN21X0 p0858D (.Q(n_112), 
	.C(n_109), 
	.B(n_70), 
	.A(n_80));
   NO2X0 p0655D5201 (.Q(n_111), 
	.B(n_20), 
	.A(n_110));
   OR4X0 p8505A (.Q(n_110), 
	.D(n_96), 
	.C(n_86), 
	.B(n_103), 
	.A(n_108));
   NA3I1X0 p9284A (.Q(n_109), 
	.C(n_97), 
	.B(n_102), 
	.AN(n_108));
   NA3I1X0 p8105A (.Q(n_108), 
	.C(n_106), 
	.B(n_105), 
	.AN(n_107));
   EO2X0 p7608D (.Q(n_107), 
	.B(n_22), 
	.A(n_104));
   AO31X0 p7914D (.Q(n_106), 
	.D(n_22), 
	.C(n_98), 
	.B(n_2), 
	.A(n_5));
   EN2X0 p8000A (.Q(n_105), 
	.B(n_32), 
	.A(n_98));
   AN21X0 p7533A (.Q(n_104), 
	.C(n_12), 
	.B(B[5]), 
	.A(n_88));
   INX0 Fp8889A5202 (.Q(n_102), 
	.A(n_103));
   EN2X0 p8568D (.Q(n_103), 
	.B(n_38), 
	.A(n_88));
   NO2I1X1 p0628D (.Q(n_101), 
	.B(n_91), 
	.AN(A[7]));
   INX0 Fp0637D (.Q(n_100), 
	.A(n_99));
   NA2X0 p0637D (.Q(n_99), 
	.B(A[6]), 
	.A(n_90));
   AN211X0 p7680A (.Q(n_98), 
	.D(n_12), 
	.C(n_27), 
	.B(n_37), 
	.A(n_75));
   INX0 Fp9035A (.Q(n_97), 
	.A(n_96));
   EN2X0 p8395A (.Q(n_96), 
	.B(n_43), 
	.A(n_75));
   EN3X0 p2154A (.Q(n_95), 
	.C(A[3]), 
	.B(n_21), 
	.A(n_54));
   EN3X0 p4588A (.Q(n_94), 
	.C(A[1]), 
	.B(n_19), 
	.A(n_54));
   NA2X0 p0702D5206 (.Q(n_93), 
	.B(n_51), 
	.A(B[2]));
   NO2X0 p0627D (.Q(n_92), 
	.B(n_51), 
	.A(B[2]));
   INX0 Fp0558D (.Q(n_91), 
	.A(n_90));
   NA2X0 p0552D (.Q(n_90), 
	.B(n_78), 
	.A(n_60));
   OA211X0 p6368A (.Q(QUOTIENT[7]), 
	.D(n_72), 
	.C(n_6), 
	.B(A[7]), 
	.A(n_0));
   AO311X0 p6744A (.Q(n_88), 
	.E(n_13), 
	.D(n_27), 
	.C(n_71), 
	.B(n_28), 
	.A(n_33));
   EO2X0 p0882D (.Q(n_87), 
	.B(n_16), 
	.A(n_70));
   INX0 Fp9124A5207 (.Q(n_85), 
	.A(n_86));
   EN2X0 p8945A (.Q(n_86), 
	.B(n_71), 
	.A(n_50));
   NA2X0 p1447A (.Q(n_84), 
	.B(n_61), 
	.A(n_7));
   NA2I1X0 p2785A (.Q(n_83), 
	.B(B[2]), 
	.AN(n_62));
   NA2X0 p2877A (.Q(n_82), 
	.B(n_62), 
	.A(n_7));
   OR2X0 p0910D5208 (.Q(n_81), 
	.B(n_61), 
	.A(n_7));
   ON21X0 p0850D (.Q(n_80), 
	.C(n_17), 
	.B(A[5]), 
	.A(n_54));
   ON21X0 p3476A (.Q(n_79), 
	.C(n_45), 
	.B(n_44), 
	.A(n_55));
   NO2I1X0 p0638D (.Q(n_78), 
	.B(n_18), 
	.AN(n_72));
   ON21X0 p1730A (.Q(n_77), 
	.C(n_48), 
	.B(n_49), 
	.A(n_55));
   INX0 Fp0644D (.Q(n_76), 
	.A(n_51));
   AO211X0 p6829A (.Q(n_75), 
	.D(n_11), 
	.C(n_13), 
	.B(n_28), 
	.A(n_53));
   MU2IX0 p0731D (.S(A[7]), 
	.Q(n_74), 
	.IN1(n_54), 
	.IN0(n_55));
   EO2X0 p10242A (.Q(n_73), 
	.B(n_39), 
	.A(n_53));
   NO2I1X0 p9211A (.Q(n_72), 
	.B(n_28), 
	.AN(n_56));
   OR2X0 p6147A (.Q(n_71), 
	.B(n_11), 
	.A(n_53));
   NA2X0 p0820D (.Q(n_70), 
	.B(A[5]), 
	.A(n_54));
   NA2X0 p0736D (.Q(n_69), 
	.B(n_4), 
	.A(n_55));
   NO2I1X0 p0810D5209 (.Q(n_68), 
	.B(n_26), 
	.AN(B[1]));
   NA2I1X0 p3268A (.Q(n_67), 
	.B(B[1]), 
	.AN(n_24));
   NA2X0 p3362A (.Q(n_66), 
	.B(n_24), 
	.A(n_6));
   NO2X0 p2015A (.Q(n_65), 
	.B(n_31), 
	.A(B[1]));
   NA2X0 p0763D5210 (.Q(n_64), 
	.B(n_26), 
	.A(n_6));
   AND2X0 p1836A (.Q(n_63), 
	.B(n_31), 
	.A(B[1]));
   ON21X0 p2768A (.Q(n_62), 
	.C(n_45), 
	.B(n_44), 
	.A(B[1]));
   ON21X0 p0887D (.Q(n_61), 
	.C(n_48), 
	.B(n_49), 
	.A(B[1]));
   ON21X0 p0562D (.Q(n_60), 
	.C(n_20), 
	.B(n_4), 
	.A(B[1]));
   EN3X0 p4706A (.Q(n_59), 
	.C(A[1]), 
	.B(n_19), 
	.A(n_6));
   EN3X0 p2350A (.Q(n_58), 
	.C(A[3]), 
	.B(n_21), 
	.A(n_6));
   EO2X0 p0810D5211 (.Q(n_57), 
	.B(n_16), 
	.A(n_41));
   NO2X0 p8984A (.Q(n_56), 
	.B(B[4]), 
	.A(n_47));
   INX0 Fp9984A5215 (.Q(n_54), 
	.A(n_55));
   HAX0 p6082A (.S(n_55), 
	.CO(n_53), 
	.B(B[1]), 
	.A(B[0]));
   NO2X0 p0620D (.Q(n_51), 
	.B(n_29), 
	.A(n_42));
   NA2I1X0 p8642A (.Q(n_50), 
	.B(n_28), 
	.AN(n_13));
   AND2X0 p0824D5217 (.Q(n_49), 
	.B(n_10), 
	.A(n_21));
   OR2X0 p0893D5218 (.Q(n_48), 
	.B(n_10), 
	.A(n_21));
   INX0 Fp8966A5219 (.Q(n_46), 
	.A(n_47));
   NA2X0 p8813A (.Q(n_47), 
	.B(n_2), 
	.A(n_22));
   NA2I1X0 p2480A (.Q(n_45), 
	.B(A[1]), 
	.AN(n_19));
   NO2I1X0 p2234A (.Q(n_44), 
	.B(A[1]), 
	.AN(n_19));
   NA2I1X0 p8504A (.Q(n_43), 
	.B(n_33), 
	.AN(n_27));
   NO2X0 p0648D (.Q(n_42), 
	.B(n_16), 
	.A(n_14));
   NA2X0 p0803D (.Q(n_41), 
	.B(n_30), 
	.A(n_15));
   NA2X0 p1558A (.Q(n_40), 
	.B(n_23), 
	.A(n_26));
   AO21X0 p9736A (.Q(n_39), 
	.C(n_11), 
	.B(n_6), 
	.A(n_7));
   AO21X0 p8699A (.Q(n_38), 
	.C(n_12), 
	.B(n_2), 
	.A(n_8));
   ON21X0 p8095A (.Q(n_37), 
	.C(n_8), 
	.B(n_2), 
	.A(n_9));
   AN21X0 p0654D (.Q(n_36), 
	.C(n_20), 
	.B(A[6]), 
	.A(n_0));
   AN21X0 p5724A (.Q(n_35), 
	.C(n_25), 
	.B(A[1]), 
	.A(n_0));
   AO21X0 p2862A (.Q(n_34), 
	.C(n_31), 
	.B(A[3]), 
	.A(n_0));
   NA2X0 p6841A (.Q(n_33), 
	.B(n_8), 
	.A(n_9));
   NO2X0 p8671A (.Q(n_32), 
	.B(B[6]), 
	.A(B[5]));
   NO2X0 p1660A (.Q(n_31), 
	.B(A[3]), 
	.A(n_0));
   INX0 Fp0622D (.Q(n_30), 
	.A(n_29));
   NO2I1X0 p0700D5220 (.Q(n_29), 
	.B(n_3), 
	.AN(n_6));
   NA2X0 p6606A (.Q(n_28), 
	.B(n_9), 
	.A(n_7));
   NO2X0 p7058A (.Q(n_27), 
	.B(n_8), 
	.A(n_9));
   NA2X0 p0718D5221 (.Q(n_26), 
	.B(n_3), 
	.A(B[0]));
   INX0 Fp3186A (.Q(n_25), 
	.A(n_24));
   OR2X0 p2795A (.Q(n_24), 
	.B(A[1]), 
	.A(n_0));
   NA2X0 p1680A (.Q(n_23), 
	.B(A[5]), 
	.A(n_0));
   NO2X0 p8507A (.Q(n_22), 
	.B(B[6]), 
	.A(B[7]));
   NO2I1X0 p0831D5223 (.Q(n_21), 
	.B(A[2]), 
	.AN(B[0]));
   NO2I1X1 p0570D (.Q(n_20), 
	.B(A[6]), 
	.AN(B[0]));
   NO2X0 p2044A (.Q(n_19), 
	.B(A[0]), 
	.A(n_0));
   NO2I1X0 p0621D (.Q(n_18), 
	.B(A[7]), 
	.AN(B[1]));
   INX0 Fp0608D5224 (.Q(n_17), 
	.A(n_16));
   NO2I1X1 p0625D (.Q(n_16), 
	.B(A[4]), 
	.AN(B[0]));
   INX0 Fp0654D (.Q(n_15), 
	.A(n_14));
   NO2I1X0 p0650D (.Q(n_14), 
	.B(A[5]), 
	.AN(B[1]));
   NO2X0 p6967A (.Q(n_13), 
	.B(n_9), 
	.A(n_7));
   NO2X0 p8027A (.Q(n_12), 
	.B(n_2), 
	.A(n_8));
   NO2X0 p6243A (.Q(n_11), 
	.B(n_6), 
	.A(n_7));
   INX0 Fp0801D5227 (.Q(n_10), 
	.A(A[3]));
   INX0 Fp6609A5234 (.Q(n_9), 
	.A(B[3]));
   INX0 Fp6791A5245 (.Q(n_8), 
	.A(B[4]));
   INX0 Fp6092A5253 (.Q(n_7), 
	.A(B[2]));
   INX0 Fp6054A (.Q(n_6), 
	.A(B[1]));
   INX0 Fp8552A5270 (.Q(n_5), 
	.A(B[7]));
   INX0 Fp0499D5272 (.Q(n_4), 
	.A(A[7]));
   INX0 Fp0522D (.Q(n_3), 
	.A(A[5]));
   INX0 Fp8022A5278 (.Q(n_2), 
	.A(B[5]));
   INX0 Fp5920A5281 (.Q(n_0), 
	.A(B[0]));
   EN2X0 g1 (.Q(n_434), 
	.B(n_26), 
	.A(n_130));
endmodule

module core_alu (
	alu_en_i, 
	alu_operand1_i, 
	alu_operand2_i, 
	alu_opcode_i, 
	alu_cy_i, 
	alu_ac_i, 
	alu_ov_i, 
	alu_result_o, 
	alu_cy_o, 
	alu_ac_o, 
	alu_ov_o);
   input alu_en_i;
   input [7:0] alu_operand1_i;
   input [7:0] alu_operand2_i;
   input [4:0] alu_opcode_i;
   input alu_cy_i;
   input alu_ac_i;
   input alu_ov_i;
   output [15:0] alu_result_o;
   output alu_cy_o;
   output alu_ac_o;
   output alu_ov_o;

   // Internal wires
   wire UNCONNECTED3;
   wire UNCONNECTED4;
   wire UNCONNECTED5;
   wire UNCONNECTED6;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_247;
   wire n_248;
   wire n_249;
   wire n_250;
   wire n_251;
   wire n_252;
   wire n_253;
   wire n_254;
   wire n_255;
   wire n_256;
   wire n_257;
   wire n_258;
   wire n_259;
   wire n_260;
   wire n_261;
   wire n_262;
   wire n_263;
   wire n_264;
   wire n_282;
   wire n_283;
   wire n_284;
   wire n_285;
   wire n_286;
   wire n_287;
   wire n_288;
   wire n_289;
   wire n_290;
   wire n_291;
   wire n_292;
   wire n_293;
   wire n_294;
   wire n_295;
   wire n_296;
   wire n_297;
   wire n_298;
   wire n_299;
   wire n_300;
   wire n_301;
   wire n_302;
   wire n_303;
   wire n_304;
   wire n_305;
   wire n_306;
   wire n_307;
   wire n_308;
   wire n_309;
   wire n_310;
   wire n_311;
   wire n_312;
   wire n_313;
   wire n_314;
   wire n_315;
   wire n_316;
   wire n_317;
   wire n_318;
   wire n_319;
   wire n_320;
   wire n_321;
   wire n_322;
   wire n_323;
   wire n_324;
   wire n_325;
   wire n_326;
   wire n_341;
   wire n_342;
   wire n_343;
   wire n_344;
   wire n_345;
   wire n_346;
   wire n_347;
   wire n_348;
   wire n_349;
   wire n_350;
   wire n_351;
   wire n_352;
   wire n_353;
   wire n_355;
   wire n_357;

   csa_tree csa_tree_mul_302_43 (.in_0({ alu_operand1_i[7],
		alu_operand1_i[6],
		alu_operand1_i[5],
		alu_operand1_i[4],
		alu_operand1_i[3],
		alu_operand1_i[2],
		alu_operand1_i[1],
		alu_operand1_i[0] }), 
	.in_1({ alu_operand2_i[7],
		alu_operand2_i[6],
		alu_operand2_i[5],
		alu_operand2_i[4],
		alu_operand2_i[3],
		alu_operand2_i[2],
		alu_operand2_i[1],
		alu_operand2_i[0] }), 
	.out_0({ UNCONNECTED3,
		n_312,
		n_313,
		n_314,
		n_315,
		n_316,
		n_317,
		n_318,
		n_319,
		n_320,
		n_321,
		n_322,
		n_323,
		n_324,
		n_325,
		n_326 }), 
	.out_1({ UNCONNECTED4,
		n_298,
		n_299,
		n_300,
		n_301,
		n_302,
		n_303,
		n_304,
		n_305,
		n_306,
		n_307,
		n_308,
		n_309,
		n_310,
		n_311,
		UNCONNECTED5 }));
   add_unsigned final_adder_mul_302_43 (.A({ 1'b0,
		n_312,
		n_313,
		n_314,
		n_315,
		n_316,
		n_317,
		n_318,
		n_319,
		n_320,
		n_321,
		n_322,
		n_323,
		n_324,
		n_325,
		1'b0 }), 
	.B({ 1'b0,
		n_298,
		n_299,
		n_300,
		n_301,
		n_302,
		n_303,
		n_304,
		n_305,
		n_306,
		n_307,
		n_308,
		n_309,
		n_310,
		n_311,
		1'b0 }), 
	.Z({ n_341,
		n_342,
		n_343,
		n_344,
		n_345,
		n_346,
		n_347,
		n_348,
		n_349,
		n_350,
		n_351,
		n_352,
		n_353,
		n_355,
		n_357,
		UNCONNECTED6 }));
   shared_div_rem_unsigned_300 rem_331_53_Y_div_330_53 (.A({ alu_operand1_i[7],
		alu_operand1_i[6],
		alu_operand1_i[5],
		alu_operand1_i[4],
		alu_operand1_i[3],
		alu_operand1_i[2],
		alu_operand1_i[1],
		alu_operand1_i[0] }), 
	.B({ alu_operand2_i[7],
		alu_operand2_i[6],
		alu_operand2_i[5],
		alu_operand2_i[4],
		alu_operand2_i[3],
		alu_operand2_i[2],
		alu_operand2_i[1],
		alu_operand2_i[0] }), 
	.QUOTIENT({ n_297,
		n_296,
		n_295,
		n_294,
		n_293,
		n_292,
		n_291,
		n_290 }), 
	.REMAINDER({ n_289,
		n_288,
		n_287,
		n_286,
		n_285,
		n_284,
		n_283,
		n_282 }));
   AO21X0 p4047A (.Q(alu_ov_o), 
	.C(n_264), 
	.B(n_99), 
	.A(n_219));
   AO221X0 p0884D (.Q(alu_result_o[7]), 
	.E(n_263), 
	.D(n_99), 
	.C(n_349), 
	.B(n_289), 
	.A(n_117));
   ON221X0 p3976A (.Q(n_264), 
	.E(n_202), 
	.D(n_261), 
	.C(n_147), 
	.B(n_256), 
	.A(n_127));
   ON221X0 p4627A (.Q(alu_cy_o), 
	.E(n_250), 
	.D(n_251), 
	.C(n_127), 
	.B(n_262), 
	.A(n_147));
   NA3X0 p0806D (.Q(alu_result_o[6]), 
	.C(n_134), 
	.B(n_148), 
	.A(n_260));
   AO221X0 p3024A (.Q(n_263), 
	.E(n_257), 
	.D(n_247), 
	.C(n_126), 
	.B(n_258), 
	.A(n_116));
   NA2X0 p0941D (.Q(alu_result_o[5]), 
	.B(n_259), 
	.A(n_146));
   OA21X0 p4462A (.Q(n_262), 
	.C(n_46), 
	.B(n_26), 
	.A(n_255));
   MU2IX0 p3999A (.S(n_255), 
	.Q(n_261), 
	.IN1(n_45), 
	.IN0(n_26));
   AN221X0 p4102A (.Q(n_260), 
	.E(n_249), 
	.D(n_252), 
	.C(n_116), 
	.B(n_233), 
	.A(n_61));
   AN221X0 p3747A (.Q(n_259), 
	.E(n_254), 
	.D(n_351), 
	.C(n_99), 
	.B(n_242), 
	.A(n_64));
   EN2X0 p2873A (.Q(n_258), 
	.B(n_72), 
	.A(n_255));
   NA2X0 p0949D (.Q(alu_result_o[4]), 
	.B(n_253), 
	.A(n_145));
   ON221X0 p3084A (.Q(n_257), 
	.E(n_232), 
	.D(n_240), 
	.C(n_124), 
	.B(n_119), 
	.A(n_230));
   EN2X0 p3735A (.Q(n_256), 
	.B(n_239), 
	.A(n_251));
   NA2X0 p1009D (.Q(alu_result_o[3]), 
	.B(n_248), 
	.A(n_149));
   AN22X0 p2695A (.Q(n_255), 
	.D(alu_operand1_i[6]), 
	.C(alu_operand2_i[6]), 
	.B(n_36), 
	.A(n_243));
   NA3X0 p0841D (.Q(alu_result_o[1]), 
	.C(n_241), 
	.B(n_205), 
	.A(n_139));
   AO221X0 p1780D (.Q(alu_result_o[14]), 
	.E(n_246), 
	.D(n_117), 
	.C(n_296), 
	.B(n_342), 
	.A(n_99));
   ON221X0 p4021A (.Q(n_254), 
	.E(n_227), 
	.D(n_209), 
	.C(n_124), 
	.B(n_244), 
	.A(n_64));
   AO221X0 p2014D (.Q(alu_result_o[13]), 
	.E(n_246), 
	.D(n_117), 
	.C(n_295), 
	.B(n_343), 
	.A(n_99));
   AN221X0 p4176A (.Q(n_253), 
	.E(n_245), 
	.D(n_352), 
	.C(n_99), 
	.B(n_225), 
	.A(n_71));
   AO221X0 p2574A (.Q(alu_result_o[12]), 
	.E(n_246), 
	.D(n_294), 
	.C(n_117), 
	.B(n_344), 
	.A(n_99));
   AO221X0 p3092A (.Q(alu_result_o[10]), 
	.E(n_246), 
	.D(n_117), 
	.C(n_292), 
	.B(n_346), 
	.A(n_99));
   AO221X0 p1285D (.Q(alu_result_o[9]), 
	.E(n_246), 
	.D(n_347), 
	.C(n_99), 
	.B(n_291), 
	.A(n_117));
   AO221X0 p0835D (.Q(alu_result_o[8]), 
	.E(n_246), 
	.D(n_348), 
	.C(n_99), 
	.B(n_290), 
	.A(n_117));
   AO221X0 p1874D (.Q(alu_result_o[15]), 
	.E(n_246), 
	.D(n_117), 
	.C(n_297), 
	.B(n_341), 
	.A(n_99));
   AO221X0 p2834A (.Q(alu_result_o[11]), 
	.E(n_246), 
	.D(n_293), 
	.C(n_117), 
	.B(n_345), 
	.A(n_99));
   EO2X0 p3728A (.Q(n_252), 
	.B(n_61), 
	.A(n_243));
   NA3X0 p0830D (.Q(alu_result_o[2]), 
	.C(n_182), 
	.B(n_238), 
	.A(n_143));
   AO21X0 p3452A (.Q(n_251), 
	.C(n_22), 
	.B(n_16), 
	.A(n_239));
   NA3X0 p1022D (.Q(alu_result_o[0]), 
	.C(n_215), 
	.B(n_235), 
	.A(n_138));
   AN321X0 p4440A (.Q(n_250), 
	.F(n_155), 
	.E(n_237), 
	.D(n_211), 
	.C(alu_cy_i), 
	.B(n_210), 
	.A(n_192));
   ON221X0 p3951A (.Q(n_249), 
	.E(n_236), 
	.D(n_213), 
	.C(n_124), 
	.B(n_231), 
	.A(n_61));
   AN221X0 p4472A (.Q(n_248), 
	.E(n_234), 
	.D(n_353), 
	.C(n_99), 
	.B(n_198), 
	.A(n_62));
   EN2X0 p3145A (.Q(n_247), 
	.B(n_72), 
	.A(n_239));
   NO2I1X0 p4126A (.Q(n_246), 
	.B(n_119), 
	.AN(n_237));
   ON221X0 p4275A (.Q(n_245), 
	.E(n_220), 
	.D(n_151), 
	.C(n_95), 
	.B(n_226), 
	.A(n_71));
   AN222X0 p3666A (.Q(n_244), 
	.F(n_116), 
	.E(n_229), 
	.D(n_118), 
	.C(n_162), 
	.B(n_191), 
	.A(n_126));
   ON21X0 p2766A (.Q(n_243), 
	.C(n_18), 
	.B(n_33), 
	.A(n_228));
   ON222X0 p4155A (.Q(n_242), 
	.F(n_162), 
	.E(n_119), 
	.D(n_229), 
	.C(n_115), 
	.B(n_191), 
	.A(n_127));
   OA221X0 p4995A (.Q(n_241), 
	.E(n_224), 
	.D(n_135), 
	.C(n_115), 
	.B(n_152), 
	.A(n_67));
   EN2X0 p3556A (.Q(n_240), 
	.B(alu_operand1_i[7]), 
	.A(n_208));
   ON21X0 p3177A (.Q(n_239), 
	.C(n_17), 
	.B(n_23), 
	.A(n_221));
   AN211X0 p4827A (.Q(n_238), 
	.D(n_216), 
	.C(n_168), 
	.B(n_116), 
	.A(n_167));
   AN21X0 p4161A (.Q(n_237), 
	.C(n_22), 
	.B(n_16), 
	.A(n_218));
   AN221X0 p3681A (.Q(n_236), 
	.E(n_207), 
	.D(n_123), 
	.C(n_222), 
	.B(n_122), 
	.A(alu_operand1_i[2]));
   AN221X0 p5109A (.Q(n_235), 
	.E(n_223), 
	.D(n_116), 
	.C(n_85), 
	.B(n_94), 
	.A(alu_operand1_i[0]));
   ON221X0 p4482A (.Q(n_234), 
	.E(n_217), 
	.D(n_175), 
	.C(alu_operand1_i[3]), 
	.B(n_204), 
	.A(n_62));
   ON22X0 p4336A (.Q(n_233), 
	.D(n_185), 
	.C(n_119), 
	.B(n_127), 
	.A(n_221));
   AN221X0 p2972A (.Q(n_232), 
	.E(n_214), 
	.D(n_123), 
	.C(n_212), 
	.B(n_102), 
	.A(alu_operand1_i[0]));
   AN22X0 p3850A (.Q(n_231), 
	.D(n_185), 
	.C(n_118), 
	.B(n_126), 
	.A(n_221));
   EO2X0 p2948A (.Q(n_230), 
	.B(n_72), 
	.A(n_218));
   INX0 Fp2679A (.Q(n_228), 
	.A(n_229));
   ON21X0 p2617A (.Q(n_229), 
	.C(n_8), 
	.B(n_40), 
	.A(n_200));
   ON211X0 p5826A (.Q(alu_ac_o), 
	.D(n_181), 
	.C(n_201), 
	.B(n_147), 
	.A(n_200));
   AN221X0 p3752A (.Q(n_227), 
	.E(n_203), 
	.D(n_123), 
	.C(n_209), 
	.B(n_122), 
	.A(alu_operand1_i[1]));
   AN222X0 p3958A (.Q(n_226), 
	.F(n_116), 
	.E(n_200), 
	.D(n_118), 
	.C(n_113), 
	.B(n_164), 
	.A(n_126));
   ON221X0 p4318D (.Q(n_225), 
	.E(n_181), 
	.D(n_119), 
	.C(n_113), 
	.B(n_200), 
	.A(n_115));
   AN221X0 p4594A (.Q(n_224), 
	.E(n_199), 
	.D(n_68), 
	.C(n_108), 
	.B(n_99), 
	.A(n_357));
   AO211X0 p4423A (.Q(n_223), 
	.D(n_183), 
	.C(n_178), 
	.B(n_326), 
	.A(n_99));
   ON21X0 p3775A (.Q(n_222), 
	.C(n_195), 
	.B(n_3), 
	.A(n_197));
   AN21X0 p2712A (.Q(n_221), 
	.C(n_13), 
	.B(n_34), 
	.A(n_190));
   AN21X0 p5183A (.Q(n_220), 
	.C(n_206), 
	.B(alu_operand1_i[0]), 
	.A(n_122));
   ON211X0 p3996A (.Q(n_219), 
	.D(n_194), 
	.C(n_55), 
	.B(n_48), 
	.A(n_193));
   ON21X0 p2824D (.Q(n_218), 
	.C(n_17), 
	.B(n_23), 
	.A(n_185));
   AN221X0 p3955A (.Q(n_217), 
	.E(n_188), 
	.D(alu_operand1_i[3]), 
	.C(n_172), 
	.B(n_108), 
	.A(n_62));
   ON211X0 p5129A (.Q(n_216), 
	.D(n_159), 
	.C(n_186), 
	.B(n_1), 
	.A(n_142));
   AN22X0 p5337A (.Q(n_215), 
	.D(n_126), 
	.C(n_86), 
	.B(n_187), 
	.A(n_110));
   AO221X0 p3716A (.Q(n_214), 
	.E(n_189), 
	.D(n_108), 
	.C(n_72), 
	.B(n_122), 
	.A(alu_operand1_i[3]));
   EO2X0 p4428A (.Q(n_213), 
	.B(alu_operand1_i[6]), 
	.A(n_196));
   EO2X0 p2581A (.Q(n_212), 
	.B(alu_operand1_i[7]), 
	.A(n_195));
   INX0 Fp5160A (.Q(n_211), 
	.A(n_210));
   NA2I1X0 p4777A (.Q(n_210), 
	.B(n_110), 
	.AN(n_187));
   NA2I1X0 p3655A (.Q(n_209), 
	.B(n_196), 
	.AN(n_197));
   NO2X0 p3375A (.Q(n_208), 
	.B(n_3), 
	.A(n_196));
   AO221X0 p4706A (.Q(n_207), 
	.E(n_184), 
	.D(n_108), 
	.C(n_61), 
	.B(n_120), 
	.A(alu_operand1_i[5]));
   ON211X0 p4930A (.Q(n_206), 
	.D(n_154), 
	.C(n_173), 
	.B(n_40), 
	.A(n_106));
   OA222X0 p5042A (.Q(n_205), 
	.F(alu_operand1_i[1]), 
	.E(n_166), 
	.D(n_142), 
	.C(n_0), 
	.B(n_153), 
	.A(n_68));
   AN222X0 p4171A (.Q(n_204), 
	.F(n_116), 
	.E(n_177), 
	.D(n_118), 
	.C(n_88), 
	.B(n_136), 
	.A(n_126));
   ON211X0 p4851A (.Q(n_203), 
	.D(n_128), 
	.C(n_176), 
	.B(n_33), 
	.A(n_106));
   AN22X0 p14372A (.Q(n_202), 
	.D(n_91), 
	.C(n_101), 
	.B(n_179), 
	.A(alu_ov_i));
   AN22X0 p6082A (.Q(n_201), 
	.D(n_104), 
	.C(n_94), 
	.B(n_180), 
	.A(alu_ac_i));
   AN22X0 p2497A (.Q(n_200), 
	.D(alu_operand1_i[3]), 
	.C(alu_operand2_i[3]), 
	.B(n_38), 
	.A(n_177));
   ON221X0 p4700A (.Q(n_199), 
	.E(n_169), 
	.D(n_106), 
	.C(n_50), 
	.B(n_98), 
	.A(n_9));
   ON222X0 p4649A (.Q(n_198), 
	.F(n_88), 
	.E(n_119), 
	.D(n_136), 
	.C(n_127), 
	.B(n_177), 
	.A(n_115));
   NO2X0 p3605A (.Q(n_197), 
	.B(alu_operand1_i[5]), 
	.A(n_140));
   NA2X0 p3299A (.Q(n_196), 
	.B(alu_operand1_i[5]), 
	.A(n_140));
   NA2I1X0 p2491A (.Q(n_195), 
	.B(n_39), 
	.AN(n_140));
   NO6X0 p3431A (.Q(n_194), 
	.F(n_301), 
	.E(n_114), 
	.D(n_316), 
	.C(n_302), 
	.B(n_315), 
	.A(n_303));
   AN21X0 p3797A (.Q(n_193), 
	.C(n_174), 
	.B(n_319), 
	.A(n_305));
   NO3I1X0 p15494A (.Q(n_192), 
	.C(n_89), 
	.B(n_107), 
	.AN(n_180));
   INX0 Fp2637A (.Q(n_191), 
	.A(n_190));
   AO21X0 p2270D (.Q(n_190), 
	.C(n_32), 
	.B(n_7), 
	.A(n_164));
   ON221X0 p3875A (.Q(n_189), 
	.E(n_170), 
	.D(n_106), 
	.C(n_26), 
	.B(n_98), 
	.A(n_46));
   ON21X0 p4783A (.Q(n_188), 
	.C(n_171), 
	.B(n_37), 
	.A(n_106));
   NO6X0 p3992A (.Q(n_187), 
	.F(n_64), 
	.E(n_90), 
	.D(n_60), 
	.C(n_59), 
	.B(n_62), 
	.A(n_68));
   AN221X0 p4873A (.Q(n_186), 
	.E(n_157), 
	.D(alu_operand1_i[1]), 
	.C(n_120), 
	.B(n_131), 
	.A(alu_operand1_i[3]));
   AN21X0 p2512A (.Q(n_185), 
	.C(n_13), 
	.B(n_34), 
	.A(n_161));
   AO321X0 p3919A (.Q(n_184), 
	.F(n_158), 
	.E(n_105), 
	.D(n_36), 
	.C(n_97), 
	.B(alu_operand2_i[6]), 
	.A(alu_operand1_i[6]));
   ON221X0 p4604A (.Q(n_183), 
	.E(n_156), 
	.D(n_133), 
	.C(alu_operand1_i[0]), 
	.B(n_130), 
	.A(n_0));
   AN22X0 p4938A (.Q(n_182), 
	.D(n_355), 
	.C(n_99), 
	.B(n_126), 
	.A(n_150));
   OR2X0 p4208A (.Q(n_181), 
	.B(n_127), 
	.A(n_164));
   NO2X0 p15526A (.Q(n_180), 
	.B(n_91), 
	.A(n_165));
   NO2X0 p15732A (.Q(n_179), 
	.B(n_117), 
	.A(n_165));
   ON221X0 p4254A (.Q(n_178), 
	.E(n_163), 
	.D(n_106), 
	.C(n_30), 
	.B(n_98), 
	.A(n_42));
   ON21X0 p2458A (.Q(n_177), 
	.C(n_35), 
	.B(n_10), 
	.A(n_137));
   AN221X0 p4451A (.Q(n_176), 
	.E(n_160), 
	.D(alu_operand1_i[6]), 
	.C(n_131), 
	.B(n_120), 
	.A(alu_operand1_i[4]));
   AN21X0 p4621A (.Q(n_175), 
	.C(n_132), 
	.B(n_12), 
	.A(n_144));
   AN321X0 p3797A6872 (.Q(n_174), 
	.F(n_74), 
	.E(n_57), 
	.D(n_73), 
	.C(n_57), 
	.B(n_87), 
	.A(n_14));
   OA222X0 p4872A (.Q(n_173), 
	.F(n_8), 
	.E(n_98), 
	.D(n_133), 
	.C(alu_operand1_i[4]), 
	.B(n_130), 
	.A(n_5));
   AO221X0 p3272A (.Q(n_172), 
	.E(n_141), 
	.D(n_97), 
	.C(alu_operand2_i[3]), 
	.B(n_144), 
	.A(n_75));
   AN222X0 p4526A (.Q(n_171), 
	.F(alu_operand1_i[2]), 
	.E(n_120), 
	.D(n_122), 
	.C(alu_operand1_i[7]), 
	.B(n_131), 
	.A(alu_operand1_i[4]));
   AN222X0 p3608A (.Q(n_170), 
	.F(alu_operand1_i[6]), 
	.E(n_120), 
	.D(alu_cy_i), 
	.C(n_107), 
	.B(n_132), 
	.A(n_4));
   AN222X0 p4385A (.Q(n_169), 
	.F(alu_operand1_i[0]), 
	.E(n_120), 
	.D(n_122), 
	.C(alu_operand1_i[5]), 
	.B(n_131), 
	.A(alu_operand1_i[2]));
   AO22X0 p4388A (.Q(n_168), 
	.D(n_52), 
	.C(n_144), 
	.B(n_112), 
	.A(n_118));
   EN2X0 p4867A (.Q(n_167), 
	.B(n_59), 
	.A(n_137));
   NO2X0 p4899A (.Q(n_166), 
	.B(n_132), 
	.A(n_144));
   NA3I1X0 p15281A (.Q(n_165), 
	.C(n_127), 
	.B(n_147), 
	.AN(n_99));
   ON21X0 p2222D (.Q(n_164), 
	.C(n_76), 
	.B(n_63), 
	.A(n_125));
   ON21X0 p4157A (.Q(n_163), 
	.C(n_60), 
	.B(n_108), 
	.A(n_118));
   INX0 Fp2487A (.Q(n_162), 
	.A(n_161));
   AO21X0 p2036D (.Q(n_161), 
	.C(n_32), 
	.B(n_7), 
	.A(n_113));
   AO32X0 p3957A (.Q(n_160), 
	.E(n_132), 
	.D(n_5), 
	.C(n_97), 
	.B(alu_operand2_i[5]), 
	.A(alu_operand1_i[5]));
   OA221X0 p4854A (.Q(n_159), 
	.E(n_129), 
	.D(n_106), 
	.C(n_10), 
	.B(n_98), 
	.A(n_35));
   ON22X0 p3984A (.Q(n_158), 
	.D(alu_operand1_i[6]), 
	.C(n_133), 
	.B(n_4), 
	.A(n_130));
   AO22X0 p4710A (.Q(n_157), 
	.D(alu_operand1_i[6]), 
	.C(n_122), 
	.B(n_1), 
	.A(n_132));
   AN222X0 p4749A (.Q(n_156), 
	.F(alu_operand1_i[4]), 
	.E(n_122), 
	.D(alu_cy_i), 
	.C(n_89), 
	.B(n_92), 
	.A(alu_operand1_i[7]));
   AO222X0 p5304A (.Q(n_155), 
	.F(n_89), 
	.E(alu_operand1_i[7]), 
	.D(n_107), 
	.C(alu_operand1_i[0]), 
	.B(n_94), 
	.A(n_69));
   AN22X0 p4816A (.Q(n_154), 
	.D(n_70), 
	.C(n_108), 
	.B(alu_operand1_i[3]), 
	.A(n_120));
   OA22X0 p5051A (.Q(n_153), 
	.D(n_28), 
	.C(n_119), 
	.B(n_127), 
	.A(n_78));
   AN22X0 p4984A (.Q(n_152), 
	.D(n_28), 
	.C(n_118), 
	.B(n_126), 
	.A(n_78));
   EO2X0 p4713A (.Q(n_151), 
	.B(alu_operand1_i[4]), 
	.A(n_121));
   EO2X0 p4755A (.Q(n_150), 
	.B(n_59), 
	.A(n_125));
   NA2X0 p0878D (.Q(n_149), 
	.B(n_117), 
	.A(n_285));
   NA2X0 p0804D (.Q(n_148), 
	.B(n_117), 
	.A(n_288));
   NA2X0 p15107A (.Q(n_147), 
	.B(alu_opcode_i[0]), 
	.A(n_116));
   NA2X0 p0827D (.Q(n_146), 
	.B(n_117), 
	.A(n_287));
   NA2X0 p0823D (.Q(n_145), 
	.B(n_117), 
	.A(n_286));
   NO2X0 p3217A (.Q(n_144), 
	.B(n_95), 
	.A(n_121));
   NA2X0 p0825D (.Q(n_143), 
	.B(n_117), 
	.A(n_284));
   INX0 Fp3423A (.Q(n_141), 
	.A(n_142));
   NA2X0 p3157A (.Q(n_142), 
	.B(n_94), 
	.A(n_121));
   NO2I1X0 p2454A (.Q(n_140), 
	.B(n_121), 
	.AN(alu_operand1_i[4]));
   NA2X0 p0830D6874 (.Q(n_139), 
	.B(n_117), 
	.A(n_283));
   NA2X0 p0839D (.Q(n_138), 
	.B(n_117), 
	.A(n_282));
   OA21X0 p2362A (.Q(n_137), 
	.C(n_9), 
	.B(n_50), 
	.A(n_93));
   OA21X0 p3760A (.Q(n_136), 
	.C(n_77), 
	.B(n_19), 
	.A(n_109));
   EN2X0 p5048A (.Q(n_135), 
	.B(n_67), 
	.A(n_93));
   NA2X0 p3964A (.Q(n_134), 
	.B(n_99), 
	.A(n_350));
   INX0 Fp12910A6878 (.Q(n_132), 
	.A(n_133));
   NA2X0 p12791A (.Q(n_133), 
	.B(n_6), 
	.A(n_103));
   INX0 Fp13228A6880 (.Q(n_130), 
	.A(n_131));
   OR2X0 p13050A (.Q(n_131), 
	.B(n_107), 
	.A(n_102));
   NA2X0 p4760A (.Q(n_129), 
	.B(n_59), 
	.A(n_108));
   NA2X0 p4766A (.Q(n_128), 
	.B(n_64), 
	.A(n_108));
   INX0 Fp15040A6885 (.Q(n_126), 
	.A(n_127));
   NA2X0 p14786A (.Q(n_127), 
	.B(n_21), 
	.A(n_96));
   AND2X0 p2105A (.Q(n_125), 
	.B(n_11), 
	.A(n_109));
   NA2X0 p4755A6888 (.Q(n_124), 
	.B(n_94), 
	.A(n_81));
   NO2X0 p4258A (.Q(n_123), 
	.B(n_95), 
	.A(n_81));
   AND2X0 p13784A (.Q(n_122), 
	.B(alu_opcode_i[1]), 
	.A(n_103));
   NO2X0 p2360A (.Q(n_121), 
	.B(n_104), 
	.A(alu_ac_i));
   OR2X0 p12762A (.Q(n_120), 
	.B(n_92), 
	.A(n_89));
   INX0 Fp14411A6891 (.Q(n_118), 
	.A(n_119));
   NA2X0 p14180D (.Q(n_119), 
	.B(alu_opcode_i[0]), 
	.A(n_96));
   AND2X0 p15331D (.Q(n_117), 
	.B(n_91), 
	.A(n_100));
   INX0 Fp14993A6896 (.Q(n_115), 
	.A(n_116));
   AO31X0 p14606D (.Q(n_116), 
	.D(n_111), 
	.C(n_58), 
	.B(alu_opcode_i[0]), 
	.A(n_2));
   OR6X0 p3485A (.Q(n_114), 
	.F(n_313), 
	.E(n_299), 
	.D(n_312), 
	.C(n_298), 
	.B(n_314), 
	.A(n_300));
   ON21X0 p2075A (.Q(n_113), 
	.C(n_76), 
	.B(n_63), 
	.A(n_79));
   EO2X0 p4051A (.Q(n_112), 
	.B(n_59), 
	.A(n_79));
   NO2X0 p14494A (.Q(n_111), 
	.B(alu_opcode_i[3]), 
	.A(n_82));
   NO2X0 p16144A (.Q(n_110), 
	.B(n_80), 
	.A(n_21));
   NA2X0 p2105A6898 (.Q(n_109), 
	.B(n_31), 
	.A(n_78));
   NO2X0 p14136A (.Q(n_108), 
	.B(n_25), 
	.A(n_82));
   NO2X0 p12974A (.Q(n_107), 
	.B(n_49), 
	.A(n_84));
   INX0 Fp13721A (.Q(n_105), 
	.A(n_106));
   OR2X0 p13147A (.Q(n_106), 
	.B(n_49), 
	.A(n_82));
   AND2X0 p2142A (.Q(n_104), 
	.B(alu_operand1_i[3]), 
	.A(n_12));
   NO2X0 p12775A (.Q(n_103), 
	.B(alu_opcode_i[0]), 
	.A(n_80));
   NO2X0 p13085A (.Q(n_102), 
	.B(n_25), 
	.A(n_84));
   INX0 Fp15336A (.Q(n_101), 
	.A(n_100));
   OR6X0 p15106A (.Q(n_100), 
	.F(alu_operand2_i[7]), 
	.E(alu_operand2_i[0]), 
	.D(alu_operand2_i[4]), 
	.C(alu_operand2_i[5]), 
	.B(alu_operand2_i[6]), 
	.A(n_53));
   NO3X0 p14745D (.Q(n_99), 
	.C(alu_opcode_i[3]), 
	.B(alu_opcode_i[0]), 
	.A(n_84));
   INX0 Fp13800A (.Q(n_97), 
	.A(n_98));
   NA3I1X0 p13505A (.Q(n_98), 
	.C(alu_opcode_i[3]), 
	.B(n_66), 
	.AN(n_21));
   NO3X0 p14286A (.Q(n_96), 
	.C(alu_opcode_i[3]), 
	.B(n_56), 
	.A(alu_opcode_i[1]));
   INX0 Fp14057A6904 (.Q(n_94), 
	.A(n_95));
   NA3X0 p13922A (.Q(n_95), 
	.C(n_24), 
	.B(n_66), 
	.A(n_6));
   NO2I1X0 p2330A (.Q(n_93), 
	.B(n_83), 
	.AN(n_42));
   NO3X0 p12869A (.Q(n_92), 
	.C(n_25), 
	.B(n_56), 
	.A(alu_opcode_i[1]));
   NO3I1X0 p14783A (.Q(n_91), 
	.C(alu_opcode_i[3]), 
	.B(n_84), 
	.AN(alu_opcode_i[0]));
   OR3X0 p3988A (.Q(n_90), 
	.C(n_61), 
	.B(n_72), 
	.A(n_70));
   NO3I1X0 p12622A (.Q(n_89), 
	.C(n_56), 
	.B(n_21), 
	.AN(alu_opcode_i[3]));
   OA21X0 p3863A (.Q(n_88), 
	.C(n_77), 
	.B(n_19), 
	.A(n_65));
   AN221X0 p4044A (.Q(n_87), 
	.E(n_51), 
	.D(n_323), 
	.C(n_309), 
	.B(n_310), 
	.A(n_324));
   EO2X0 p5309A (.Q(n_86), 
	.B(n_60), 
	.A(alu_cy_i));
   EN2X0 p5006A (.Q(n_85), 
	.B(n_60), 
	.A(n_54));
   OR2X0 p12529A (.Q(n_84), 
	.B(n_56), 
	.A(n_6));
   NO2X0 p2319A (.Q(n_83), 
	.B(n_30), 
	.A(n_54));
   NA2X0 p12890A (.Q(n_82), 
	.B(alu_opcode_i[1]), 
	.A(n_66));
   NO2X0 p4016A (.Q(n_81), 
	.B(n_69), 
	.A(alu_cy_i));
   NA2X0 p12618A (.Q(n_80), 
	.B(alu_opcode_i[4]), 
	.A(n_58));
   AND2X0 p2000A (.Q(n_79), 
	.B(n_11), 
	.A(n_65));
   ON21X0 p2199A (.Q(n_78), 
	.C(n_47), 
	.B(n_27), 
	.A(alu_cy_i));
   OA21X0 p3751A (.Q(n_77), 
	.C(n_29), 
	.B(n_19), 
	.A(n_11));
   AO21X0 p2217A (.Q(n_76), 
	.C(n_41), 
	.B(n_29), 
	.A(n_44));
   INX0 Fp2079A (.Q(n_75), 
	.A(n_12));
   ON32X0 p3370A (.Q(n_74), 
	.E(n_306), 
	.D(n_320), 
	.C(n_43), 
	.B(n_307), 
	.A(n_321));
   ON32X0 p3736A (.Q(n_73), 
	.E(n_308), 
	.D(n_322), 
	.C(n_15), 
	.B(n_309), 
	.A(n_323));
   NO2X0 p3992A6905 (.Q(n_72), 
	.B(n_26), 
	.A(n_45));
   INX0 Fp3875A6906 (.Q(n_70), 
	.A(n_71));
   NA2I1X0 p3409A (.Q(n_71), 
	.B(n_8), 
	.AN(n_40));
   NO2X0 p4014A (.Q(n_69), 
	.B(n_4), 
	.A(n_39));
   INX0 Fp3937A (.Q(n_67), 
	.A(n_68));
   NA2X0 p3857A (.Q(n_68), 
	.B(n_31), 
	.A(n_11));
   NO3I1X0 p12634A (.Q(n_66), 
	.C(alu_opcode_i[4]), 
	.B(alu_opcode_i[2]), 
	.AN(alu_en_i));
   NA2X0 p1993A (.Q(n_65), 
	.B(n_28), 
	.A(n_31));
   NA2I1X0 p4278A (.Q(n_64), 
	.B(n_34), 
	.AN(n_13));
   OR2X0 p2084A (.Q(n_63), 
	.B(n_19), 
	.A(n_41));
   NA2I1X0 p4124A (.Q(n_62), 
	.B(n_44), 
	.AN(n_41));
   NA2I1X0 p4126A6908 (.Q(n_61), 
	.B(n_17), 
	.AN(n_23));
   NA2X0 p4106A (.Q(n_60), 
	.B(n_47), 
	.A(n_28));
   NA2X0 p4198A (.Q(n_59), 
	.B(n_29), 
	.A(n_20));
   NO3I1X0 p12407A (.Q(n_58), 
	.C(alu_opcode_i[3]), 
	.B(alu_opcode_i[2]), 
	.AN(alu_en_i));
   AN21X0 p3409A6909 (.Q(n_57), 
	.C(n_43), 
	.B(n_321), 
	.A(n_307));
   NA3X0 p12180A (.Q(n_56), 
	.C(n_2), 
	.B(alu_opcode_i[2]), 
	.A(alu_en_i));
   NO3X0 p4020A (.Q(n_55), 
	.C(n_318), 
	.B(n_317), 
	.A(n_304));
   NA3X0 p10913A (.Q(n_54), 
	.C(alu_opcode_i[0]), 
	.B(alu_opcode_i[1]), 
	.A(alu_cy_i));
   OR3X0 p14959A (.Q(n_53), 
	.C(alu_operand2_i[3]), 
	.B(alu_operand2_i[1]), 
	.A(alu_operand2_i[2]));
   ON21X0 p5052A (.Q(n_52), 
	.C(n_12), 
	.B(n_1), 
	.A(n_0));
   OA211X0 p4000A (.Q(n_51), 
	.D(n_311), 
	.C(n_325), 
	.B(n_324), 
	.A(n_310));
   NO2X0 p2274A (.Q(n_50), 
	.B(alu_operand1_i[1]), 
	.A(alu_operand2_i[1]));
   NA2X0 p13210A (.Q(n_49), 
	.B(alu_opcode_i[3]), 
	.A(alu_opcode_i[0]));
   NO2X0 p4352A (.Q(n_48), 
	.B(n_319), 
	.A(n_305));
   NA2I1X0 p1916A (.Q(n_47), 
	.B(alu_operand1_i[0]), 
	.AN(alu_operand2_i[0]));
   INX0 Fp4005A (.Q(n_45), 
	.A(n_46));
   NA2X0 p3680A (.Q(n_46), 
	.B(alu_operand1_i[7]), 
	.A(alu_operand2_i[7]));
   NA2I1X0 p2065A (.Q(n_44), 
	.B(alu_operand1_i[3]), 
	.AN(alu_operand2_i[3]));
   AND2X0 p3288A (.Q(n_43), 
	.B(n_320), 
	.A(n_306));
   NA2X0 p2193A (.Q(n_42), 
	.B(alu_operand1_i[0]), 
	.A(alu_operand2_i[0]));
   NO2I1X0 p1909A (.Q(n_41), 
	.B(alu_operand1_i[3]), 
	.AN(alu_operand2_i[3]));
   NO2X0 p3018A (.Q(n_40), 
	.B(alu_operand1_i[4]), 
	.A(alu_operand2_i[4]));
   NO2X0 p3717A (.Q(n_39), 
	.B(alu_operand1_i[6]), 
	.A(alu_operand1_i[5]));
   INX0 Fp3284A (.Q(n_38), 
	.A(n_37));
   NO2X0 p2896A (.Q(n_37), 
	.B(alu_operand1_i[3]), 
	.A(alu_operand2_i[3]));
   NA2I1X0 p3818A (.Q(n_36), 
	.B(n_3), 
	.AN(alu_operand2_i[6]));
   NA2X0 p3023A (.Q(n_35), 
	.B(alu_operand1_i[2]), 
	.A(alu_operand2_i[2]));
   NA2X0 p3859A (.Q(n_34), 
	.B(n_5), 
	.A(alu_operand2_i[5]));
   NO2X0 p4167A (.Q(n_33), 
	.B(alu_operand1_i[5]), 
	.A(alu_operand2_i[5]));
   NO2I1X0 p3204A (.Q(n_32), 
	.B(alu_operand2_i[4]), 
	.AN(alu_operand1_i[4]));
   NA2X0 p2012A (.Q(n_31), 
	.B(n_0), 
	.A(alu_operand2_i[1]));
   NO2X0 p2264A (.Q(n_30), 
	.B(alu_operand1_i[0]), 
	.A(alu_operand2_i[0]));
   NA2I1X0 p1936A (.Q(n_29), 
	.B(alu_operand1_i[2]), 
	.AN(alu_operand2_i[2]));
   INX0 Fp1968A (.Q(n_27), 
	.A(n_28));
   NA2I1X0 p1847A (.Q(n_28), 
	.B(alu_operand2_i[0]), 
	.AN(alu_operand1_i[0]));
   NO2X0 p3393A (.Q(n_26), 
	.B(alu_operand1_i[7]), 
	.A(alu_operand2_i[7]));
   INX0 Fp13106A (.Q(n_24), 
	.A(n_25));
   NA2I1X0 p12290A (.Q(n_25), 
	.B(alu_opcode_i[3]), 
	.AN(alu_opcode_i[0]));
   NO2I1X0 p4121A (.Q(n_23), 
	.B(alu_operand1_i[6]), 
	.AN(alu_operand2_i[6]));
   NO2X0 p5922A (.Q(n_22), 
	.B(n_4), 
	.A(alu_operand2_i[7]));
   NA2X0 p12191A (.Q(n_21), 
	.B(alu_opcode_i[0]), 
	.A(n_6));
   INX0 Fp2067A (.Q(n_20), 
	.A(n_19));
   NO2I1X0 p2106A (.Q(n_19), 
	.B(alu_operand1_i[2]), 
	.AN(alu_operand2_i[2]));
   NA2X0 p4427A (.Q(n_18), 
	.B(alu_operand1_i[5]), 
	.A(alu_operand2_i[5]));
   OR2X0 p3686A (.Q(n_17), 
	.B(n_3), 
	.A(alu_operand2_i[6]));
   NA2X0 p5792A (.Q(n_16), 
	.B(n_4), 
	.A(alu_operand2_i[7]));
   INX0 Fp3730A (.Q(n_15), 
	.A(n_14));
   NA2X0 p3512A (.Q(n_14), 
	.B(n_322), 
	.A(n_308));
   NO2X0 p3897A (.Q(n_13), 
	.B(n_5), 
	.A(alu_operand2_i[5]));
   NA2X0 p2083A (.Q(n_12), 
	.B(n_1), 
	.A(n_0));
   OR2X0 p1861A (.Q(n_11), 
	.B(n_0), 
	.A(alu_operand2_i[1]));
   NO2X0 p2832A (.Q(n_10), 
	.B(alu_operand1_i[2]), 
	.A(alu_operand2_i[2]));
   NA2X0 p2436A (.Q(n_9), 
	.B(alu_operand1_i[1]), 
	.A(alu_operand2_i[1]));
   NA2X0 p3691A (.Q(n_8), 
	.B(alu_operand1_i[4]), 
	.A(alu_operand2_i[4]));
   NA2I1X0 p3048A (.Q(n_7), 
	.B(alu_operand2_i[4]), 
	.AN(alu_operand1_i[4]));
   INX0 Fp11950A (.Q(n_6), 
	.A(alu_opcode_i[1]));
   INX0 Fp3579A6917 (.Q(n_5), 
	.A(alu_operand1_i[5]));
   INX0 Fp3210A6920 (.Q(n_4), 
	.A(alu_operand1_i[7]));
   INX0 Fp3444A6922 (.Q(n_3), 
	.A(alu_operand1_i[6]));
   INX0 Fp12590A6925 (.Q(n_2), 
	.A(alu_opcode_i[4]));
   INX0 Fp1753A6926 (.Q(n_1), 
	.A(alu_operand1_i[2]));
   INX0 Fp1776A6933 (.Q(n_0), 
	.A(alu_operand1_i[1]));
endmodule

module core_fsm (
	fsm_clock_i, 
	fsm_reset_i_b, 
	fsm_reset_core_o_b, 
	fsm_alu_result_i, 
	fsm_sfr_addr_o, 
	fsm_bit_byte_flag_o, 
	fsm_rom_addr_o, 
	fsm_ram_addr_o, 
	fsm_rom_rd_o_b, 
	fsm_ram_rd_o_b, 
	fsm_sfr_rd_o_b, 
	fsm_ram_wr_o_b, 
	fsm_sfr_wr_o_b, 
	fsm_alu_op1_o, 
	fsm_alu_op2_o, 
	fsm_alu_opcode_o, 
	fsm_alu_en_o, 
	fsm_sfr_data_i, 
	fsm_sfr_data_o, 
	fsm_ram_data_i, 
	fsm_ram_data_o, 
	fsm_rom_data_i, 
	fsm_psw_rs_i, 
	fsm_pcau_offset_o, 
	fsm_pcau_en_o, 
	fsm_pcau_msb_o, 
	fsm_pcau_direct_o, 
	fsm_pc_i, 
	fsm_int_vect_i, 
	fsm_int_na_o, 
	fsm_int_rdy_o, 
	fsm_ext_ram_o, 
	fsm_state_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2, 
	DFT_sdi_3, 
	DFT_sdo_4);
   input fsm_clock_i;
   input fsm_reset_i_b;
   output fsm_reset_core_o_b;
   input [15:0] fsm_alu_result_i;
   output [7:0] fsm_sfr_addr_o;
   output fsm_bit_byte_flag_o;
   output [15:0] fsm_rom_addr_o;
   output [7:0] fsm_ram_addr_o;
   output fsm_rom_rd_o_b;
   output fsm_ram_rd_o_b;
   output fsm_sfr_rd_o_b;
   output fsm_ram_wr_o_b;
   output fsm_sfr_wr_o_b;
   output [7:0] fsm_alu_op1_o;
   output [7:0] fsm_alu_op2_o;
   output [4:0] fsm_alu_opcode_o;
   output fsm_alu_en_o;
   input [7:0] fsm_sfr_data_i;
   output [7:0] fsm_sfr_data_o;
   input [7:0] fsm_ram_data_i;
   output [7:0] fsm_ram_data_o;
   input [7:0] fsm_rom_data_i;
   input [1:0] fsm_psw_rs_i;
   output [7:0] fsm_pcau_offset_o;
   output fsm_pcau_en_o;
   output [7:0] fsm_pcau_msb_o;
   output fsm_pcau_direct_o;
   input [15:0] fsm_pc_i;
   input [2:0] fsm_int_vect_i;
   output fsm_int_na_o;
   output fsm_int_rdy_o;
   output fsm_ext_ram_o;
   output [2:0] fsm_state_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;
   input DFT_sdi_3;
   output DFT_sdo_4;

   // Internal wires
   wire \fsm_op1[3] ;
   wire \fsm_op1[4] ;
   wire \fsm_op1[5] ;
   wire \fsm_op1[6] ;
   wire \fsm_op2[0] ;
   wire \fsm_op2[1] ;
   wire \fsm_op2[2] ;
   wire \fsm_op2[3] ;
   wire \fsm_op2[4] ;
   wire \fsm_op2[5] ;
   wire \fsm_op2[6] ;
   wire \fsm_op2[7] ;
   wire \fsm_op_aux_1[0] ;
   wire \fsm_op_aux_1[2] ;
   wire \fsm_op_aux_1[4] ;
   wire \fsm_op_aux_1[5] ;
   wire \fsm_op_aux_1[6] ;
   wire \fsm_op_aux_1_2[0] ;
   wire \fsm_op_aux_1_2[1] ;
   wire \fsm_op_aux_1_2[2] ;
   wire \fsm_op_aux_1_2[3] ;
   wire \fsm_op_aux_1_2[4] ;
   wire \fsm_op_aux_1_2[5] ;
   wire \fsm_op_aux_1_2[6] ;
   wire \fsm_op_aux_1_2[7] ;
   wire \fsm_op_aux_2[0] ;
   wire \fsm_op_aux_2[1] ;
   wire \fsm_op_aux_2[2] ;
   wire \fsm_op_aux_2[3] ;
   wire \fsm_op_aux_2[4] ;
   wire \fsm_op_aux_2[5] ;
   wire \fsm_op_aux_2[6] ;
   wire \fsm_op_aux_2[7] ;
   wire \fsm_opcode[7] ;
   wire n_4;
   wire n_27;
   wire n_29;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_247;
   wire n_248;
   wire n_249;
   wire n_250;
   wire n_251;
   wire n_252;
   wire n_253;
   wire n_254;
   wire n_255;
   wire n_256;
   wire n_257;
   wire n_258;
   wire n_259;
   wire n_260;
   wire n_261;
   wire n_263;
   wire n_264;
   wire n_265;
   wire n_266;
   wire n_267;
   wire n_268;
   wire n_269;
   wire n_270;
   wire n_271;
   wire n_272;
   wire n_273;
   wire n_274;
   wire n_275;
   wire n_276;
   wire n_277;
   wire n_278;
   wire n_279;
   wire n_280;
   wire n_281;
   wire n_282;
   wire n_283;
   wire n_284;
   wire n_285;
   wire n_286;
   wire n_287;
   wire n_288;
   wire n_289;
   wire n_290;
   wire n_291;
   wire n_292;
   wire n_293;
   wire n_294;
   wire n_295;
   wire n_296;
   wire n_297;
   wire n_298;
   wire n_299;
   wire n_300;
   wire n_301;
   wire n_302;
   wire n_303;
   wire n_304;
   wire n_305;
   wire n_306;
   wire n_307;
   wire n_308;
   wire n_309;
   wire n_310;
   wire n_311;
   wire n_312;
   wire n_313;
   wire n_314;
   wire n_315;
   wire n_316;
   wire n_317;
   wire n_318;
   wire n_319;
   wire n_320;
   wire n_321;
   wire n_322;
   wire n_323;
   wire n_324;
   wire n_325;
   wire n_326;
   wire n_327;
   wire n_328;
   wire n_329;
   wire n_330;
   wire n_331;
   wire n_332;
   wire n_333;
   wire n_334;
   wire n_335;
   wire n_336;
   wire n_337;
   wire n_338;
   wire n_339;
   wire n_340;
   wire n_341;
   wire n_342;
   wire n_343;
   wire n_344;
   wire n_345;
   wire n_346;
   wire n_347;
   wire n_348;
   wire n_349;
   wire n_350;
   wire n_351;
   wire n_352;
   wire n_353;
   wire n_354;
   wire n_355;
   wire n_356;
   wire n_357;
   wire n_358;
   wire n_359;
   wire n_360;
   wire n_361;
   wire n_362;
   wire n_363;
   wire n_364;
   wire n_365;
   wire n_366;
   wire n_367;
   wire n_368;
   wire n_369;
   wire n_370;
   wire n_371;
   wire n_372;
   wire n_373;
   wire n_374;
   wire n_375;
   wire n_376;
   wire n_377;
   wire n_378;
   wire n_379;
   wire n_380;
   wire n_381;
   wire n_382;
   wire n_383;
   wire n_384;
   wire n_385;
   wire n_386;
   wire n_387;
   wire n_388;
   wire n_389;
   wire n_391;
   wire n_392;
   wire n_393;
   wire n_394;
   wire n_395;
   wire n_396;
   wire n_397;
   wire n_398;
   wire n_399;
   wire n_400;
   wire n_401;
   wire n_402;
   wire n_403;
   wire n_404;
   wire n_405;
   wire n_406;
   wire n_407;
   wire n_408;
   wire n_409;
   wire n_410;
   wire n_411;
   wire n_412;
   wire n_413;
   wire n_414;
   wire n_415;
   wire n_416;
   wire n_417;
   wire n_418;
   wire n_419;
   wire n_420;
   wire n_421;
   wire n_422;
   wire n_423;
   wire n_424;
   wire n_425;
   wire n_426;
   wire n_427;
   wire n_428;
   wire n_429;
   wire n_431;
   wire n_432;
   wire n_433;
   wire n_434;
   wire n_435;
   wire n_436;
   wire n_437;
   wire n_438;
   wire n_439;
   wire n_440;
   wire n_441;
   wire n_442;
   wire n_443;
   wire n_444;
   wire n_445;
   wire n_446;
   wire n_447;
   wire n_448;
   wire n_449;
   wire n_450;
   wire n_451;
   wire n_452;
   wire n_453;
   wire n_454;
   wire n_455;
   wire n_456;
   wire n_457;
   wire n_458;
   wire n_459;
   wire n_460;
   wire n_461;
   wire n_462;
   wire n_463;
   wire n_464;
   wire n_465;
   wire n_466;
   wire n_467;
   wire n_468;
   wire n_469;
   wire n_470;
   wire n_471;
   wire n_472;
   wire n_473;
   wire n_474;
   wire n_475;
   wire n_476;
   wire n_477;
   wire n_478;
   wire n_479;
   wire n_480;
   wire n_481;
   wire n_482;
   wire n_483;
   wire n_484;
   wire n_485;
   wire n_486;
   wire n_487;
   wire n_488;
   wire n_489;
   wire n_490;
   wire n_491;
   wire n_492;
   wire n_493;
   wire n_494;
   wire n_495;
   wire n_496;
   wire n_497;
   wire n_498;
   wire n_499;
   wire n_500;
   wire n_501;
   wire n_502;
   wire n_503;
   wire n_504;
   wire n_505;
   wire n_506;
   wire n_507;
   wire n_508;
   wire n_509;
   wire n_510;
   wire n_511;
   wire n_512;
   wire n_513;
   wire n_514;
   wire n_515;
   wire n_516;
   wire n_517;
   wire n_518;
   wire n_519;
   wire n_520;
   wire n_521;
   wire n_522;
   wire n_523;
   wire n_524;
   wire n_525;
   wire n_526;
   wire n_527;
   wire n_528;
   wire n_529;
   wire n_530;
   wire n_531;
   wire n_532;
   wire n_533;
   wire n_534;
   wire n_535;
   wire n_536;
   wire n_537;
   wire n_538;
   wire n_539;
   wire n_540;
   wire n_541;
   wire n_542;
   wire n_543;
   wire n_544;
   wire n_545;
   wire n_546;
   wire n_547;
   wire n_548;
   wire n_549;
   wire n_550;
   wire n_551;
   wire n_552;
   wire n_553;
   wire n_554;
   wire n_555;
   wire n_556;
   wire n_557;
   wire n_558;
   wire n_559;
   wire n_560;
   wire n_561;
   wire n_562;
   wire n_563;
   wire n_564;
   wire n_565;
   wire n_566;
   wire n_567;
   wire n_568;
   wire n_569;
   wire n_570;
   wire n_571;
   wire n_572;
   wire n_573;
   wire n_574;
   wire n_575;
   wire n_576;
   wire n_577;
   wire n_578;
   wire n_579;
   wire n_580;
   wire n_581;
   wire n_582;
   wire n_583;
   wire n_584;
   wire n_585;
   wire n_586;
   wire n_587;
   wire n_588;
   wire n_589;
   wire n_590;
   wire n_591;
   wire n_592;
   wire n_593;
   wire n_594;
   wire n_595;
   wire n_596;
   wire n_597;
   wire n_598;
   wire n_599;
   wire n_600;
   wire n_601;
   wire n_602;
   wire n_603;
   wire n_604;
   wire n_605;
   wire n_606;
   wire n_607;
   wire n_608;
   wire n_609;
   wire n_610;
   wire n_611;
   wire n_612;
   wire n_613;
   wire n_614;
   wire n_615;
   wire n_616;
   wire n_617;
   wire n_618;
   wire n_619;
   wire n_620;
   wire n_621;
   wire n_622;
   wire n_623;
   wire n_624;
   wire n_625;
   wire n_626;
   wire n_627;
   wire n_628;
   wire n_629;
   wire n_630;
   wire n_631;
   wire n_632;
   wire n_633;
   wire n_634;
   wire n_635;
   wire n_636;
   wire n_637;
   wire n_638;
   wire n_639;
   wire n_640;
   wire n_641;
   wire n_642;
   wire n_643;
   wire n_644;
   wire n_645;
   wire n_646;
   wire n_647;
   wire n_648;
   wire n_649;
   wire n_650;
   wire n_651;
   wire n_652;
   wire n_653;
   wire n_654;
   wire n_655;
   wire n_656;
   wire n_657;
   wire n_658;
   wire n_659;
   wire n_660;
   wire n_661;
   wire n_662;
   wire n_663;
   wire n_664;
   wire n_665;
   wire n_666;
   wire n_667;
   wire n_668;
   wire n_669;
   wire n_670;
   wire n_671;
   wire n_672;
   wire n_673;
   wire n_674;
   wire n_675;
   wire n_676;
   wire n_677;
   wire n_678;
   wire n_679;
   wire n_680;
   wire n_681;
   wire n_682;
   wire n_683;
   wire n_684;
   wire n_685;
   wire n_686;
   wire n_687;
   wire n_688;
   wire n_689;
   wire n_690;
   wire n_691;
   wire n_692;
   wire n_693;
   wire n_694;
   wire n_695;
   wire n_696;
   wire n_697;
   wire n_698;
   wire n_699;
   wire n_700;
   wire n_701;
   wire n_702;
   wire n_703;
   wire n_704;
   wire n_705;
   wire n_706;
   wire n_707;
   wire n_708;
   wire n_709;
   wire n_710;
   wire n_711;
   wire n_712;
   wire n_713;
   wire n_714;
   wire n_715;
   wire n_716;
   wire n_717;
   wire n_718;
   wire n_719;
   wire n_720;
   wire n_721;
   wire n_722;
   wire n_723;
   wire n_724;
   wire n_725;
   wire n_726;
   wire n_727;
   wire n_728;
   wire n_729;
   wire n_730;
   wire n_731;
   wire n_732;
   wire n_733;
   wire n_734;
   wire n_735;
   wire n_736;
   wire n_737;
   wire n_738;
   wire n_739;
   wire n_740;
   wire n_741;
   wire n_742;
   wire n_743;
   wire n_744;
   wire n_745;
   wire n_746;
   wire n_747;
   wire n_748;
   wire n_749;
   wire n_750;
   wire n_751;
   wire n_752;
   wire n_753;
   wire n_754;
   wire n_755;
   wire n_756;
   wire n_757;
   wire n_758;
   wire n_759;
   wire n_760;
   wire n_761;
   wire n_762;
   wire n_763;
   wire n_764;
   wire n_765;
   wire n_766;
   wire n_767;
   wire n_768;
   wire n_769;
   wire n_770;
   wire n_771;
   wire n_772;
   wire n_773;
   wire n_774;
   wire n_775;
   wire n_776;
   wire n_777;
   wire n_778;
   wire n_779;
   wire n_780;
   wire n_781;
   wire n_782;
   wire n_783;
   wire n_784;
   wire n_785;
   wire n_786;
   wire n_787;
   wire n_788;
   wire n_789;
   wire n_790;
   wire n_791;
   wire n_792;
   wire n_793;
   wire n_794;
   wire n_795;
   wire n_796;
   wire n_797;
   wire n_798;
   wire n_799;
   wire n_800;
   wire n_801;
   wire n_802;
   wire n_803;
   wire n_804;
   wire n_805;
   wire n_806;
   wire n_807;
   wire n_808;
   wire n_809;
   wire n_810;
   wire n_811;
   wire n_812;
   wire n_813;
   wire n_814;
   wire n_815;
   wire n_816;
   wire n_817;
   wire n_818;
   wire n_819;
   wire n_820;
   wire n_821;
   wire n_822;
   wire n_823;
   wire n_824;
   wire n_825;
   wire n_826;
   wire n_827;
   wire n_828;
   wire n_829;
   wire n_830;
   wire n_831;
   wire n_832;
   wire n_833;
   wire n_834;
   wire n_835;
   wire n_836;
   wire n_837;
   wire n_838;
   wire n_839;
   wire n_840;
   wire n_841;
   wire n_842;
   wire n_843;
   wire n_844;
   wire n_845;
   wire n_846;
   wire n_847;
   wire n_848;
   wire n_849;
   wire n_850;
   wire n_851;
   wire n_852;
   wire n_853;
   wire n_854;
   wire n_855;
   wire n_856;
   wire n_857;
   wire n_858;
   wire n_859;
   wire n_860;
   wire n_861;
   wire n_862;
   wire n_863;
   wire n_864;
   wire n_865;
   wire n_866;
   wire n_867;
   wire n_868;
   wire n_869;
   wire n_870;
   wire n_871;
   wire n_872;
   wire n_873;
   wire n_874;
   wire n_875;
   wire n_876;
   wire n_877;
   wire n_878;
   wire n_879;
   wire n_880;
   wire n_881;
   wire n_882;
   wire n_883;
   wire n_884;
   wire n_885;
   wire n_886;
   wire n_887;
   wire n_888;
   wire n_889;
   wire n_890;
   wire n_891;
   wire n_892;
   wire n_893;
   wire n_894;
   wire n_895;
   wire n_896;
   wire n_897;
   wire n_898;
   wire n_899;
   wire n_900;
   wire n_901;
   wire n_903;
   wire n_904;
   wire n_905;
   wire n_906;
   wire n_907;
   wire n_908;
   wire n_909;
   wire n_910;
   wire n_911;
   wire n_912;
   wire n_913;
   wire n_914;
   wire n_915;
   wire n_916;
   wire n_917;
   wire n_918;
   wire n_919;
   wire n_920;
   wire n_921;
   wire n_922;
   wire n_923;
   wire n_924;
   wire n_925;
   wire n_926;
   wire n_927;
   wire n_928;
   wire n_929;
   wire n_930;
   wire n_931;
   wire n_932;
   wire n_933;
   wire n_934;
   wire n_935;
   wire n_936;
   wire n_937;
   wire n_938;
   wire n_939;
   wire n_940;
   wire n_941;
   wire n_942;
   wire n_943;
   wire n_944;
   wire n_945;
   wire n_946;
   wire n_947;
   wire n_948;
   wire n_949;
   wire n_950;
   wire n_951;
   wire n_952;
   wire n_953;
   wire n_954;
   wire n_955;
   wire n_956;
   wire n_957;
   wire n_958;
   wire n_959;
   wire n_960;
   wire n_961;
   wire n_962;
   wire n_963;
   wire n_964;
   wire n_965;
   wire n_966;
   wire n_967;
   wire n_968;
   wire n_969;
   wire n_970;
   wire n_971;
   wire n_972;
   wire n_973;
   wire n_974;
   wire n_975;
   wire n_976;
   wire n_977;
   wire n_978;
   wire n_979;
   wire n_980;
   wire n_981;
   wire n_982;
   wire n_983;
   wire n_984;
   wire n_985;
   wire n_986;
   wire n_987;
   wire n_988;
   wire n_989;
   wire n_990;
   wire n_991;
   wire n_992;
   wire n_993;
   wire n_994;
   wire n_995;
   wire n_996;
   wire n_997;
   wire n_998;
   wire n_999;
   wire n_1000;
   wire n_1001;
   wire n_1002;
   wire n_1003;
   wire n_1004;
   wire n_1005;
   wire n_1006;
   wire n_1007;
   wire n_1008;
   wire n_1009;
   wire n_1010;
   wire n_1011;
   wire n_1012;
   wire n_1013;
   wire n_1014;
   wire n_1015;
   wire n_1016;
   wire n_1017;
   wire n_1018;
   wire n_1019;
   wire n_1020;
   wire n_1021;
   wire n_1022;
   wire n_1023;
   wire n_1024;
   wire n_1025;
   wire n_1026;
   wire n_1027;
   wire n_1028;
   wire n_1029;
   wire n_1030;
   wire n_1031;
   wire n_1032;
   wire n_1033;
   wire n_1034;
   wire n_1035;
   wire n_1036;
   wire n_1037;
   wire n_1038;
   wire n_1039;
   wire n_1040;
   wire n_1041;
   wire n_1042;
   wire n_1043;
   wire n_1044;
   wire n_1045;
   wire n_1046;
   wire n_1047;
   wire n_1048;
   wire n_1049;
   wire n_1050;
   wire n_1051;
   wire n_1052;
   wire n_1053;
   wire n_1054;
   wire n_1055;
   wire n_1056;
   wire n_1057;
   wire n_1058;
   wire n_1059;
   wire n_1060;
   wire n_1061;
   wire n_1062;
   wire n_1063;
   wire n_1064;
   wire n_1065;
   wire n_1066;
   wire n_1067;
   wire n_1068;
   wire n_1069;
   wire n_1070;
   wire n_1071;
   wire n_1072;
   wire n_1073;
   wire n_1074;
   wire n_1075;
   wire n_1076;
   wire n_1077;
   wire n_1078;
   wire n_1079;
   wire n_1080;
   wire n_1081;
   wire n_1082;
   wire n_1083;
   wire n_1084;
   wire n_1085;
   wire n_1086;
   wire n_1087;
   wire n_1088;
   wire n_1089;
   wire n_1090;
   wire n_1091;
   wire n_1092;
   wire n_1093;
   wire n_1094;
   wire n_1095;
   wire n_1096;
   wire n_1097;
   wire n_1098;
   wire n_1099;
   wire n_1100;
   wire n_1101;
   wire n_1102;
   wire n_1103;
   wire n_1104;
   wire n_1105;
   wire n_1106;
   wire n_1107;
   wire n_1108;
   wire n_1109;
   wire n_1110;
   wire n_1111;
   wire n_1112;
   wire n_1113;
   wire n_1114;
   wire n_1115;
   wire n_1116;
   wire n_1117;
   wire n_1118;
   wire n_1119;
   wire n_1120;
   wire n_1121;
   wire n_1122;
   wire n_1123;
   wire n_1124;
   wire n_1125;
   wire n_1126;
   wire n_1127;
   wire n_1128;
   wire n_1129;
   wire n_1130;
   wire n_1131;
   wire n_1132;
   wire n_1133;
   wire n_1134;
   wire n_1135;
   wire n_1136;
   wire n_1137;
   wire n_1138;
   wire n_1139;
   wire n_1140;
   wire n_1141;
   wire n_1142;
   wire n_1143;
   wire n_1144;
   wire n_1145;
   wire n_1146;
   wire n_1147;
   wire n_1148;
   wire n_1149;
   wire n_1150;
   wire n_1151;
   wire n_1152;
   wire n_1153;
   wire n_1154;
   wire n_1155;
   wire n_1156;
   wire n_1157;
   wire n_1158;
   wire n_1159;
   wire n_1160;
   wire n_1161;
   wire n_1162;
   wire n_1163;
   wire n_1164;
   wire n_1165;
   wire n_1166;
   wire n_1167;
   wire n_1168;
   wire n_1169;
   wire n_1170;
   wire n_1171;
   wire n_1172;
   wire n_1173;
   wire n_1174;
   wire n_1175;
   wire n_1176;
   wire n_1177;
   wire n_1178;
   wire n_1179;
   wire n_1180;
   wire n_1181;
   wire n_1182;
   wire n_1183;
   wire n_1184;
   wire n_1185;
   wire n_1186;
   wire n_1187;
   wire n_1188;
   wire n_1189;
   wire n_1190;
   wire n_1191;
   wire n_1192;
   wire n_1193;
   wire n_1194;
   wire n_1195;
   wire n_1196;
   wire n_1197;
   wire n_1198;
   wire n_1199;
   wire n_1200;
   wire n_1201;
   wire n_1202;
   wire n_1203;
   wire n_1204;
   wire n_1205;
   wire n_1206;
   wire n_1207;
   wire n_1208;
   wire n_1209;
   wire n_1210;
   wire n_1211;
   wire n_1212;
   wire n_1213;
   wire n_1214;
   wire n_1215;
   wire n_1216;
   wire n_1217;
   wire n_1218;
   wire n_1219;
   wire n_1220;
   wire n_1221;
   wire n_1222;
   wire n_1223;
   wire n_1224;
   wire n_1225;
   wire n_1226;
   wire n_1227;
   wire n_1228;
   wire n_1229;
   wire n_1230;
   wire n_1231;
   wire n_1232;
   wire n_1233;
   wire n_1234;
   wire n_1235;
   wire n_1236;
   wire n_1237;
   wire n_1238;
   wire n_1239;
   wire n_1240;
   wire n_1241;
   wire n_1242;
   wire n_1243;
   wire n_1244;
   wire n_1245;
   wire n_1246;
   wire n_1247;
   wire n_1248;
   wire n_1249;
   wire n_1250;
   wire n_1251;
   wire n_1252;
   wire n_1253;
   wire n_1254;
   wire n_1255;
   wire n_1256;
   wire n_1257;
   wire n_1258;
   wire n_1259;
   wire n_1260;
   wire n_1261;
   wire n_1262;
   wire n_1263;
   wire n_1264;
   wire n_1265;
   wire n_1266;
   wire n_1267;
   wire n_1268;
   wire n_1269;
   wire n_1270;
   wire n_1271;
   wire n_1272;
   wire n_1273;
   wire n_1274;
   wire n_1275;
   wire n_1276;
   wire n_1277;
   wire n_1278;
   wire n_1279;
   wire n_1280;
   wire n_1281;
   wire n_1282;
   wire n_1283;
   wire n_1284;
   wire n_1285;
   wire n_1286;
   wire n_1287;
   wire n_1288;
   wire n_1289;
   wire n_1290;
   wire n_1291;
   wire n_1292;
   wire n_1293;
   wire n_1294;
   wire n_1295;
   wire n_1296;
   wire n_1297;
   wire n_1298;
   wire n_1299;
   wire n_1300;
   wire n_1301;
   wire n_1302;
   wire n_1303;
   wire n_1304;
   wire n_1305;
   wire n_1306;
   wire n_1307;
   wire n_1308;
   wire n_1309;
   wire n_1310;
   wire n_1311;
   wire n_1312;
   wire n_1313;
   wire n_1314;
   wire n_1315;
   wire n_1316;
   wire n_1317;
   wire n_1318;
   wire n_1319;
   wire n_1320;
   wire n_1321;
   wire n_1322;
   wire n_1323;
   wire n_1324;
   wire n_1325;
   wire n_1326;
   wire n_1327;
   wire n_1328;
   wire n_1329;
   wire n_1330;
   wire n_1331;
   wire n_1332;
   wire n_1333;
   wire n_1334;
   wire n_1335;
   wire n_1336;
   wire n_1337;
   wire n_1338;
   wire n_1339;
   wire n_1340;
   wire n_1341;
   wire n_1342;
   wire n_1343;
   wire n_1344;
   wire n_1345;
   wire n_1346;
   wire n_1347;
   wire n_1348;
   wire n_1349;
   wire n_1350;
   wire n_1351;
   wire n_1352;
   wire n_1353;
   wire n_1354;
   wire n_1355;
   wire n_1356;
   wire n_1357;
   wire n_1358;
   wire n_1359;
   wire n_1360;
   wire n_1361;
   wire n_1362;
   wire n_1363;
   wire n_1364;
   wire n_1365;
   wire n_1366;
   wire n_1367;
   wire n_1368;
   wire n_1369;
   wire n_1370;
   wire n_1371;
   wire n_1372;
   wire n_1373;
   wire n_1374;
   wire n_1375;
   wire n_1376;
   wire n_1377;
   wire n_1378;
   wire n_1379;
   wire n_1380;
   wire n_1381;
   wire n_1382;
   wire n_1383;
   wire n_1384;
   wire n_1385;
   wire n_1386;
   wire n_1387;
   wire n_1388;
   wire n_1389;
   wire n_1390;
   wire n_1391;
   wire n_1392;
   wire n_1393;
   wire n_1394;
   wire n_1395;
   wire n_1396;
   wire n_1397;
   wire n_1398;
   wire n_1399;
   wire n_1400;
   wire n_1401;
   wire n_1402;
   wire n_1403;
   wire n_1404;
   wire n_1405;
   wire n_1406;
   wire n_1407;
   wire n_1408;
   wire n_1409;
   wire n_1410;
   wire n_1411;
   wire n_1412;
   wire n_1413;
   wire n_1414;
   wire n_1415;
   wire n_1416;
   wire n_1417;
   wire n_1418;
   wire n_1419;
   wire n_1420;
   wire n_1421;
   wire n_1422;
   wire n_1423;
   wire n_1424;
   wire n_1425;
   wire n_1426;
   wire n_1427;
   wire n_1428;
   wire n_1429;
   wire n_1430;
   wire n_1431;
   wire n_1432;
   wire n_1433;
   wire n_1434;
   wire n_1435;
   wire n_1436;
   wire n_1437;
   wire n_1438;
   wire n_1439;
   wire n_1440;
   wire n_1441;
   wire n_1442;
   wire n_1443;
   wire n_1444;
   wire n_1445;
   wire n_1446;
   wire n_1447;
   wire n_1448;
   wire n_1449;
   wire n_1450;
   wire n_1451;
   wire n_1452;
   wire n_1453;
   wire n_1454;
   wire n_1455;
   wire n_1456;
   wire n_1457;
   wire n_1458;
   wire n_1459;
   wire n_1460;
   wire n_1461;
   wire n_1462;
   wire n_1463;
   wire n_1464;
   wire n_1465;
   wire n_1466;
   wire n_1467;
   wire n_1468;
   wire n_1469;
   wire n_1470;
   wire n_1471;
   wire n_1472;
   wire n_1473;
   wire n_1474;
   wire n_1475;
   wire n_1476;
   wire n_1477;
   wire n_1478;
   wire n_1479;
   wire n_1480;
   wire n_1481;
   wire n_1482;
   wire n_1483;
   wire n_1484;
   wire n_1485;
   wire n_1486;
   wire n_1487;
   wire n_1488;
   wire n_1489;
   wire n_1490;
   wire n_1491;
   wire n_1492;
   wire n_1493;
   wire n_1494;
   wire n_1495;
   wire n_1496;
   wire n_1497;
   wire n_1498;
   wire n_1499;
   wire n_1500;
   wire n_1501;
   wire n_1502;
   wire n_1503;
   wire n_1504;
   wire n_1506;
   wire n_1509;
   wire n_1524;
   wire n_1525;
   wire n_1526;
   wire n_1527;
   wire n_1528;
   wire n_1529;
   wire n_1530;
   wire n_1531;
   wire n_1532;
   wire n_1533;
   wire n_1534;
   wire n_1535;
   wire n_1536;
   wire n_1537;
   wire n_1538;
   wire n_1540;
   wire n_1542;
   wire n_1544;
   wire n_1549;
   wire n_1551;
   wire n_1552;
   wire n_1553;
   wire n_1554;
   wire n_1555;
   wire n_1556;
   wire n_1557;
   wire n_1562;
   wire n_1563;
   wire n_1564;
   wire n_1565;
   wire n_1566;
   wire n_1567;
   wire n_1568;
   wire n_1569;
   wire n_1570;
   wire n_1571;
   wire n_1572;
   wire n_1573;
   wire n_1574;
   wire n_1575;
   wire n_1576;
   wire n_1577;
   wire n_1578;
   wire n_1579;
   wire n_1580;
   wire n_1581;
   wire n_1582;
   wire n_1583;
   wire n_1584;
   wire n_1586;
   wire n_1587;
   wire n_1588;
   wire n_1589;
   wire n_1590;
   wire n_1591;
   wire n_1592;
   wire n_1593;
   wire n_1594;
   wire n_1595;
   wire n_1596;
   wire n_1597;
   wire n_1598;
   wire n_1599;
   wire n_1600;
   wire n_1601;
   wire n_1602;
   wire n_1603;
   wire n_1604;
   wire n_1605;
   wire n_1606;
   wire n_1607;
   wire n_1608;
   wire n_1609;
   wire n_1610;
   wire n_1611;
   wire n_1612;
   wire n_1613;
   wire n_1614;
   wire n_1615;
   wire n_1616;
   wire n_1617;
   wire n_1618;
   wire n_1619;
   wire n_1620;
   wire n_1621;
   wire n_1622;
   wire n_1623;
   wire n_1624;
   wire n_1625;
   wire n_1626;
   wire n_1627;
   wire n_1628;
   wire n_1629;
   wire n_1630;
   wire n_1631;
   wire n_1632;
   wire n_1633;
   wire n_1634;
   wire n_1635;
   wire n_1636;
   wire n_1637;
   wire n_1638;
   wire n_1639;
   wire n_1640;
   wire n_1641;
   wire n_1642;
   wire n_1643;
   wire n_1644;
   wire n_1645;
   wire n_1646;
   wire n_1647;
   wire n_1648;
   wire n_1649;
   wire n_1650;
   wire n_1651;
   wire n_1652;
   wire n_1653;
   wire n_1654;
   wire n_1655;
   wire n_1656;
   wire n_1657;
   wire n_1658;
   wire n_1659;
   wire n_1660;
   wire n_1661;
   wire n_1662;
   wire n_1663;
   wire n_1664;
   wire n_1665;
   wire n_1666;
   wire n_1667;
   wire n_1668;
   wire n_1669;
   wire n_1672;
   wire n_1673;
   wire n_1674;
   wire n_1675;
   wire n_1676;
   wire n_1677;
   wire n_1678;
   wire n_1679;
   wire n_1680;
   wire n_1681;
   wire n_1682;
   wire n_1683;
   wire n_1684;
   wire n_1685;
   wire n_1686;
   wire n_1687;
   wire n_1688;
   wire n_1689;
   wire n_1690;
   wire n_1691;
   wire n_1692;
   wire n_1693;
   wire n_1694;
   wire n_1695;
   wire n_1696;
   wire n_1697;
   wire n_1698;
   wire n_1699;
   wire n_1700;
   wire n_1701;
   wire n_1702;
   wire n_1703;
   wire n_1704;
   wire n_1705;
   wire n_1706;
   wire n_1707;
   wire n_1708;
   wire n_1709;
   wire n_1710;
   wire n_1711;
   wire n_1712;
   wire n_1713;
   wire n_1714;
   wire n_1716;
   wire n_1717;
   wire n_1718;
   wire n_1719;
   wire n_1720;
   wire n_1722;
   wire n_1723;
   wire n_1724;
   wire n_1725;
   wire n_1726;
   wire n_1727;
   wire n_1728;
   wire n_1729;
   wire n_1730;
   wire n_1731;
   wire n_1732;
   wire n_1733;
   wire n_1734;
   wire n_1735;
   wire n_1736;
   wire n_1737;
   wire n_1738;
   wire n_1739;
   wire n_1740;
   wire n_1741;
   wire n_1743;
   wire n_1744;
   wire n_1745;
   wire n_1747;
   wire n_1749;
   wire n_1750;
   wire n_1751;
   wire n_1752;
   wire n_1753;
   wire n_1754;
   wire n_1755;
   wire n_1756;
   wire n_1757;
   wire n_1758;
   wire n_1759;
   wire n_1760;
   wire n_1761;
   wire n_1762;
   wire n_1763;
   wire n_1764;
   wire n_1765;
   wire n_1766;
   wire n_1767;
   wire n_1768;
   wire n_1769;
   wire n_1770;
   wire n_1771;
   wire n_1772;
   wire n_1773;
   wire n_1774;
   wire n_1775;
   wire n_1776;
   wire n_1777;
   wire n_1778;
   wire n_1779;
   wire n_1780;
   wire n_1781;
   wire n_1782;
   wire n_1783;
   wire n_1784;
   wire n_1785;
   wire n_1786;
   wire n_1787;
   wire n_1788;
   wire n_1789;
   wire n_1790;
   wire n_1791;
   wire n_1792;
   wire n_1793;
   wire n_1794;
   wire n_1795;
   wire n_1796;
   wire n_1797;
   wire n_1798;
   wire n_1799;
   wire n_1800;
   wire n_1801;
   wire n_1802;
   wire n_1803;
   wire n_1804;
   wire n_1805;
   wire n_1806;
   wire n_1807;
   wire n_1808;
   wire n_1809;
   wire n_1810;
   wire n_1813;
   wire n_1817;
   wire n_1818;
   wire n_1819;
   wire n_1820;
   wire n_1821;
   wire n_1822;
   wire n_1823;
   wire n_1824;
   wire n_1825;
   wire n_1826;
   wire n_1827;
   wire n_1828;
   wire n_1829;
   wire n_1830;
   wire n_1831;
   wire n_1832;
   wire n_1833;
   wire n_1834;
   wire n_1835;
   wire n_1836;
   wire n_1837;
   wire n_1838;
   wire n_1839;
   wire n_1840;
   wire n_1841;
   wire n_1842;
   wire n_1843;
   wire n_1844;
   wire n_1845;
   wire n_1846;
   wire n_1847;
   wire n_1848;
   wire n_1849;
   wire n_1850;
   wire n_1851;
   wire n_1852;
   wire n_1853;
   wire n_1854;
   wire n_1855;
   wire n_1857;
   wire n_1858;
   wire n_1859;
   wire n_1860;
   wire n_1861;
   wire n_1862;
   wire n_1863;
   wire n_1864;
   wire n_1865;
   wire n_1866;
   wire n_1867;
   wire n_1868;
   wire n_1869;
   wire n_1870;
   wire n_1871;
   wire n_1872;
   wire n_1873;
   wire n_1874;
   wire n_1875;
   wire n_1876;
   wire n_1877;
   wire n_1878;
   wire n_1879;
   wire n_1880;
   wire n_1881;
   wire n_1882;
   wire n_1883;
   wire n_1884;
   wire n_1885;
   wire n_1886;
   wire n_1887;
   wire n_1888;
   wire n_1889;
   wire n_1890;
   wire n_1891;
   wire n_1892;
   wire n_1893;
   wire n_1894;
   wire n_1895;
   wire n_1896;
   wire n_1897;
   wire n_1898;
   wire n_1899;
   wire n_1900;
   wire n_1901;
   wire n_1902;
   wire n_1903;
   wire n_1904;
   wire n_1905;
   wire n_1906;
   wire n_1907;
   wire n_1908;
   wire n_1909;
   wire n_1910;
   wire n_1911;
   wire n_1912;
   wire n_1913;
   wire n_1914;
   wire n_1915;
   wire n_1916;
   wire n_1917;
   wire n_1918;
   wire n_1919;
   wire n_1920;
   wire n_1921;
   wire n_1922;
   wire n_1923;
   wire n_1924;
   wire n_1925;
   wire n_1926;
   wire n_1927;
   wire n_1928;
   wire n_1929;
   wire n_1930;
   wire n_1931;
   wire n_1932;
   wire n_1933;
   wire n_1934;
   wire n_1935;
   wire n_1936;
   wire n_1937;
   wire n_1938;
   wire n_1939;
   wire n_1940;
   wire n_1941;
   wire n_1942;
   wire n_1943;
   wire n_1944;
   wire n_1945;
   wire n_1946;
   wire n_1947;
   wire n_1948;
   wire n_1949;
   wire n_1950;
   wire n_1951;
   wire n_1952;
   wire n_1953;
   wire n_1954;
   wire n_1955;
   wire n_1956;
   wire n_1957;
   wire n_1958;
   wire n_1959;
   wire n_1960;
   wire n_1961;
   wire n_1962;
   wire n_1963;
   wire n_1964;
   wire n_1968;
   wire n_1986;
   wire n_1987;
   wire n_1988;
   wire n_1991;
   wire n_1992;
   wire n_1993;
   wire n_1994;
   wire n_1995;
   wire n_1996;
   wire n_1998;
   wire n_1999;
   wire n_2000;
   wire n_2001;
   wire n_2002;
   wire n_2003;
   wire n_2004;
   wire n_2005;
   wire n_2006;
   wire n_2007;
   wire n_2008;
   wire n_2009;
   wire n_2010;
   wire n_2011;
   wire n_2012;
   wire n_2013;
   wire n_2014;
   wire n_2015;
   wire n_2016;
   wire n_2017;
   wire n_2020;
   wire n_2023;
   wire n_2025;
   wire n_2026;
   wire n_2027;
   wire n_2028;
   wire n_2029;
   wire n_2030;
   wire n_2031;
   wire n_2040;
   wire n_2041;
   wire n_2042;
   wire n_2043;
   wire n_2044;
   wire n_2045;
   wire n_2046;
   wire n_2047;
   wire n_2048;
   wire n_2049;
   wire n_2050;
   wire n_2051;
   wire n_2098;
   wire n_2099;
   wire n_2100;
   wire n_2101;
   wire n_2102;
   wire n_2103;
   wire n_2104;
   wire n_2105;
   wire n_2106;
   wire n_2107;
   wire n_2108;
   wire n_2109;
   wire n_2110;
   wire n_2111;
   wire n_2112;
   wire n_2113;
   wire n_2114;
   wire n_2115;
   wire n_2116;
   wire n_2117;
   wire n_2118;
   wire n_2119;
   wire n_2121;
   wire n_2122;
   wire n_2123;
   wire n_2124;
   wire n_2125;
   wire n_2126;
   wire n_2127;
   wire n_2128;
   wire n_2129;
   wire n_2130;
   wire n_2134;
   wire n_2136;
   wire n_2137;
   wire n_2138;
   wire n_2141;
   wire n_2142;
   wire n_2143;
   wire n_2144;
   wire n_2146;
   wire n_2147;
   wire n_2149;
   wire n_2150;
   wire n_2151;
   wire n_2152;
   wire n_2154;
   wire n_2155;
   wire n_2157;
   wire n_2159;
   wire n_2161;
   wire n_2162;
   wire n_2164;
   wire n_2165;
   wire n_2166;
   wire n_2167;
   wire n_2168;
   wire n_2169;
   wire n_2170;
   wire n_2171;
   wire n_2172;
   wire n_2174;
   wire n_2175;
   wire n_2189;
   wire n_2190;
   wire n_2193;
   wire n_2194;
   wire n_2217;
   wire n_2240;
   wire n_2241;

   assign fsm_state_o[0] = 1'b0 ;
   assign fsm_state_o[1] = 1'b0 ;
   assign fsm_state_o[2] = 1'b0 ;
   assign fsm_rom_addr_o[0] = 1'b0 ;
   assign fsm_rom_addr_o[1] = 1'b0 ;
   assign fsm_rom_addr_o[2] = 1'b0 ;
   assign fsm_rom_addr_o[3] = 1'b0 ;
   assign fsm_rom_addr_o[4] = 1'b0 ;
   assign fsm_rom_addr_o[5] = 1'b0 ;
   assign fsm_rom_addr_o[6] = 1'b0 ;
   assign fsm_rom_addr_o[7] = 1'b0 ;
   assign fsm_rom_addr_o[8] = 1'b0 ;
   assign fsm_rom_addr_o[9] = 1'b0 ;
   assign fsm_rom_addr_o[10] = 1'b0 ;
   assign fsm_rom_addr_o[11] = 1'b0 ;
   assign fsm_rom_addr_o[12] = 1'b0 ;
   assign fsm_rom_addr_o[13] = 1'b0 ;
   assign fsm_rom_addr_o[14] = 1'b0 ;
   assign fsm_rom_addr_o[15] = 1'b0 ;

   SDFFX4 cycle_continue_reg (.SE(DFT_sen), 
	.SD(DFT_sdi_3), 
	.QN(n_2240), 
	.Q(n_2217), 
	.D(n_1741), 
	.CN(fsm_clock_i));
   SDFFX4 \fsm_op1_reg[7]  (.SE(DFT_sen), 
	.SD(\fsm_op1[6] ), 
	.QN(n_2241), 
	.Q(n_520), 
	.D(n_1963), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[0]  (.SE(DFT_sen), 
	.SD(n_2240), 
	.Q(n_1253), 
	.D(n_1960), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[1]  (.SE(DFT_sen), 
	.SD(n_1253), 
	.Q(n_1029), 
	.D(n_1957), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[2]  (.SE(DFT_sen), 
	.SD(n_1029), 
	.Q(n_1316), 
	.D(n_1959), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[3]  (.SE(DFT_sen), 
	.SD(n_1316), 
	.Q(\fsm_op1[3] ), 
	.D(n_1955), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[4]  (.SE(DFT_sen), 
	.SD(\fsm_op1[3] ), 
	.Q(\fsm_op1[4] ), 
	.D(n_1964), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[5]  (.SE(DFT_sen), 
	.SD(\fsm_op1[4] ), 
	.Q(\fsm_op1[5] ), 
	.D(n_1956), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op1_reg[6]  (.SE(DFT_sen), 
	.SD(\fsm_op1[5] ), 
	.Q(\fsm_op1[6] ), 
	.D(n_1958), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[0]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[7] ), 
	.Q(\fsm_op_aux_1[0] ), 
	.D(n_1948), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[1]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1[0] ), 
	.Q(n_1449), 
	.D(n_1950), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[2]  (.SE(DFT_sen), 
	.SD(n_1449), 
	.Q(\fsm_op_aux_1[2] ), 
	.D(n_1954), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[3]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1[2] ), 
	.Q(n_1434), 
	.D(n_1953), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[4]  (.SE(DFT_sen), 
	.SD(n_1434), 
	.Q(\fsm_op_aux_1[4] ), 
	.D(n_1951), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[5]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1[4] ), 
	.Q(\fsm_op_aux_1[5] ), 
	.D(n_1949), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[6]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1[5] ), 
	.Q(\fsm_op_aux_1[6] ), 
	.D(n_1947), 
	.CN(fsm_clock_i));
   SDFFQX2 \fsm_op_aux_1_reg[7]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1[6] ), 
	.Q(n_1170), 
	.D(n_1946), 
	.CN(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[0]  (.SE(DFT_sen), 
	.SD(\fsm_op2[7] ), 
	.Q(\fsm_op_aux_2[0] ), 
	.D(n_1936), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[1]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[0] ), 
	.Q(\fsm_op_aux_2[1] ), 
	.D(n_1945), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[2]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[1] ), 
	.Q(\fsm_op_aux_2[2] ), 
	.D(n_1944), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[3]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[2] ), 
	.Q(\fsm_op_aux_2[3] ), 
	.D(n_1941), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[4]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[3] ), 
	.Q(\fsm_op_aux_2[4] ), 
	.D(n_1940), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[5]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[4] ), 
	.Q(\fsm_op_aux_2[5] ), 
	.D(n_1939), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[6]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[5] ), 
	.Q(\fsm_op_aux_2[6] ), 
	.D(n_1938), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[7]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[6] ), 
	.Q(\fsm_op_aux_2[7] ), 
	.D(n_1937), 
	.C(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[0]  (.SE(DFT_sen), 
	.SD(n_2241), 
	.Q(\fsm_op_aux_1_2[0] ), 
	.D(n_1935), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[1]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[0] ), 
	.Q(\fsm_op_aux_1_2[1] ), 
	.D(n_1934), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[6]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[5] ), 
	.Q(\fsm_op_aux_1_2[6] ), 
	.D(n_1927), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[7]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[6] ), 
	.Q(\fsm_op_aux_1_2[7] ), 
	.D(n_1926), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[3]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[2] ), 
	.Q(\fsm_op_aux_1_2[3] ), 
	.D(n_1930), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[4]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[3] ), 
	.Q(\fsm_op_aux_1_2[4] ), 
	.D(n_1929), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[5]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[4] ), 
	.Q(\fsm_op_aux_1_2[5] ), 
	.D(n_1928), 
	.CN(fsm_clock_i));
   SDFFQX0 \fsm_op_aux_1_2_reg[2]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[1] ), 
	.Q(\fsm_op_aux_1_2[2] ), 
	.D(n_1931), 
	.CN(fsm_clock_i));
   AO221X0 p0962A (.Q(n_1964), 
	.E(n_1917), 
	.D(fsm_alu_result_i[12]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[4]), 
	.A(n_1962));
   AO221X0 p1340A (.Q(n_1963), 
	.E(n_1916), 
	.D(fsm_alu_result_i[15]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[7]), 
	.A(n_1962));
   AO221X0 p0922A (.Q(n_1960), 
	.E(n_1913), 
	.D(fsm_alu_result_i[8]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[0]), 
	.A(n_1962));
   AO221X0 p1101A (.Q(n_1959), 
	.E(n_1911), 
	.D(fsm_alu_result_i[10]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[2]), 
	.A(n_1962));
   AO221X0 p1097A (.Q(n_1958), 
	.E(n_1908), 
	.D(fsm_alu_result_i[14]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[6]), 
	.A(n_1962));
   AO221X0 p1104A (.Q(n_1957), 
	.E(n_1912), 
	.D(fsm_alu_result_i[9]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[1]), 
	.A(n_1962));
   AO221X0 p1085A (.Q(n_1956), 
	.E(n_1909), 
	.D(fsm_alu_result_i[13]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[5]), 
	.A(n_1962));
   AO221X0 p0962A51867 (.Q(n_1955), 
	.E(n_1910), 
	.D(fsm_alu_result_i[11]), 
	.C(n_1961), 
	.B(fsm_alu_result_i[3]), 
	.A(n_1962));
   ON21X0 p1713A (.Q(n_1954), 
	.C(n_1886), 
	.B(n_1952), 
	.A(n_1918));
   ON21X0 p1575A (.Q(n_1953), 
	.C(n_1880), 
	.B(n_1952), 
	.A(n_1919));
   ON21X0 p1575A51868 (.Q(n_1951), 
	.C(n_1881), 
	.B(n_1952), 
	.A(n_1920));
   ON21X0 p1717A (.Q(n_1950), 
	.C(n_1882), 
	.B(n_1952), 
	.A(n_1924));
   ON21X0 p1698A (.Q(n_1949), 
	.C(n_1877), 
	.B(n_1952), 
	.A(n_1925));
   ON21X0 p1536A (.Q(n_1948), 
	.C(n_1887), 
	.B(n_1952), 
	.A(n_1922));
   ON21X0 p1710A (.Q(n_1947), 
	.C(n_1879), 
	.B(n_1952), 
	.A(n_1923));
   ON21X0 p2022A (.Q(n_1946), 
	.C(n_1878), 
	.B(n_1952), 
	.A(n_1921));
   AO221X0 p1220A (.Q(n_1945), 
	.E(n_1828), 
	.D(n_1942), 
	.C(n_1844), 
	.B(fsm_alu_result_i[1]), 
	.A(n_1943));
   AO221X0 p1216A (.Q(n_1944), 
	.E(n_1823), 
	.D(n_1942), 
	.C(n_1842), 
	.B(fsm_alu_result_i[2]), 
	.A(n_1943));
   AO221X0 p1078A (.Q(n_1941), 
	.E(n_1825), 
	.D(n_1942), 
	.C(n_1838), 
	.B(fsm_alu_result_i[3]), 
	.A(n_1943));
   AO221X0 p1078A51869 (.Q(n_1940), 
	.E(n_1824), 
	.D(n_1942), 
	.C(n_1836), 
	.B(fsm_alu_result_i[4]), 
	.A(n_1943));
   AO221X0 p1201A (.Q(n_1939), 
	.E(n_1820), 
	.D(n_1942), 
	.C(n_1832), 
	.B(fsm_alu_result_i[5]), 
	.A(n_1943));
   AO221X0 p1213A (.Q(n_1938), 
	.E(n_1822), 
	.D(n_1942), 
	.C(n_1834), 
	.B(fsm_alu_result_i[6]), 
	.A(n_1943));
   AO221X0 p1522A (.Q(n_1937), 
	.E(n_1818), 
	.D(n_1942), 
	.C(n_1833), 
	.B(fsm_alu_result_i[7]), 
	.A(n_1943));
   AO221X0 p1038A (.Q(n_1936), 
	.E(n_1829), 
	.D(n_1942), 
	.C(n_1831), 
	.B(fsm_alu_result_i[0]), 
	.A(n_1943));
   AO22X0 p1048A (.Q(n_1935), 
	.D(\fsm_op_aux_1_2[0] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[0]));
   AO22X0 p1232A (.Q(n_1934), 
	.D(\fsm_op_aux_1_2[1] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[1]));
   AO22X0 p1228A (.Q(n_1931), 
	.D(\fsm_op_aux_1_2[2] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[2]));
   AO22X0 p1089A (.Q(n_1930), 
	.D(\fsm_op_aux_1_2[3] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[3]));
   AO22X0 p1089A51870 (.Q(n_1929), 
	.D(\fsm_op_aux_1_2[4] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[4]));
   AO22X0 p1212A (.Q(n_1928), 
	.D(\fsm_op_aux_1_2[5] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[5]));
   AO22X0 p1225A (.Q(n_1927), 
	.D(\fsm_op_aux_1_2[6] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[6]));
   AO22X0 p1532A (.Q(n_1926), 
	.D(\fsm_op_aux_1_2[7] ), 
	.C(n_1932), 
	.B(n_1933), 
	.A(fsm_alu_result_i[7]));
   INX0 p1699A (.Q(n_1925), 
	.A(fsm_alu_result_i[5]));
   INX0 p1717A51871 (.Q(n_1924), 
	.A(fsm_alu_result_i[1]));
   INX0 p1710A51872 (.Q(n_1923), 
	.A(fsm_alu_result_i[6]));
   INX0 p1536A51873 (.Q(n_1922), 
	.A(fsm_alu_result_i[0]));
   INX0 p2022A51874 (.Q(n_1921), 
	.A(fsm_alu_result_i[7]));
   INX0 p1576A (.Q(n_1920), 
	.A(fsm_alu_result_i[4]));
   INX0 p1576A51875 (.Q(n_1919), 
	.A(fsm_alu_result_i[3]));
   INX0 p1713A51876 (.Q(n_1918), 
	.A(fsm_alu_result_i[2]));
   AO221X0 p3925A (.Q(n_1917), 
	.E(n_1907), 
	.D(n_1914), 
	.C(fsm_ram_data_i[4]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[4]));
   AO221X0 p3969A (.Q(n_1916), 
	.E(n_1903), 
	.D(n_1914), 
	.C(fsm_ram_data_i[7]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[7]));
   AO221X0 p3951A (.Q(n_1913), 
	.E(n_1902), 
	.D(n_1914), 
	.C(fsm_ram_data_i[0]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[0]));
   AO221X0 p3925A51877 (.Q(n_1912), 
	.E(n_1901), 
	.D(n_1914), 
	.C(fsm_ram_data_i[1]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[1]));
   AO221X0 p3925A51878 (.Q(n_1911), 
	.E(n_1900), 
	.D(n_1914), 
	.C(fsm_ram_data_i[2]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[2]));
   AO221X0 p3951A51879 (.Q(n_1910), 
	.E(n_1899), 
	.D(n_1914), 
	.C(fsm_ram_data_i[3]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[3]));
   AO221X0 p3937A (.Q(n_1909), 
	.E(n_1906), 
	.D(n_1914), 
	.C(fsm_ram_data_i[5]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[5]));
   AO221X0 p3963A (.Q(n_1908), 
	.E(n_1904), 
	.D(n_1914), 
	.C(fsm_ram_data_i[6]), 
	.B(n_1915), 
	.A(fsm_rom_data_i[6]));
   ON21X0 p7184A (.Q(n_1907), 
	.C(n_1898), 
	.B(n_1530), 
	.A(n_1905));
   ON21X0 p7208A (.Q(n_1906), 
	.C(n_1897), 
	.B(n_1532), 
	.A(n_1905));
   ON21X0 p7219A (.Q(n_1904), 
	.C(n_1893), 
	.B(n_1531), 
	.A(n_1905));
   ON21X0 p7213A (.Q(n_1903), 
	.C(n_1892), 
	.B(n_1533), 
	.A(n_1905));
   ON21X0 p6965A (.Q(n_1902), 
	.C(n_1891), 
	.B(n_1525), 
	.A(n_1905));
   ON21X0 p6966A (.Q(n_1901), 
	.C(n_1890), 
	.B(n_1524), 
	.A(n_1905));
   ON21X0 p6967A (.Q(n_1900), 
	.C(n_1889), 
	.B(n_1527), 
	.A(n_1905));
   ON21X0 p6965A51880 (.Q(n_1899), 
	.C(n_1888), 
	.B(n_1526), 
	.A(n_1905));
   SDFRQX1 \fsm_op2_reg[4]  (.SE(DFT_sen), 
	.SD(\fsm_op2[0] ), 
	.Q(\fsm_op2[4] ), 
	.D(n_1875), 
	.C(fsm_clock_i));
   SDFRQX1 \fsm_op2_reg[3]  (.SE(DFT_sen), 
	.SD(\fsm_op2[5] ), 
	.Q(\fsm_op2[3] ), 
	.D(n_1876), 
	.C(fsm_clock_i));
   AN222X0 p7476A (.Q(n_1898), 
	.F(fsm_pc_i[4]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[4]), 
	.B(n_1896), 
	.A(\fsm_op1[4] ));
   AN222X0 p7423A (.Q(n_1897), 
	.F(fsm_pc_i[5]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[5]), 
	.B(n_1896), 
	.A(\fsm_op1[5] ));
   AN222X0 p7520A (.Q(n_1893), 
	.F(fsm_pc_i[6]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[6]), 
	.B(n_1896), 
	.A(\fsm_op1[6] ));
   AN222X0 p7512A (.Q(n_1892), 
	.F(fsm_pc_i[7]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[7]), 
	.B(n_1896), 
	.A(n_520));
   AN222X0 p7403A (.Q(n_1891), 
	.F(fsm_pc_i[0]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[0]), 
	.B(n_1896), 
	.A(n_1253));
   AN222X0 p7345A (.Q(n_1890), 
	.F(fsm_pc_i[1]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[1]), 
	.B(n_1896), 
	.A(n_1029));
   AN222X0 p7462A (.Q(n_1889), 
	.F(fsm_pc_i[2]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[2]), 
	.B(n_1896), 
	.A(n_1316));
   AN222X0 p7446A (.Q(n_1888), 
	.F(fsm_pc_i[3]), 
	.E(n_1894), 
	.D(n_1895), 
	.C(fsm_sfr_data_i[3]), 
	.B(n_1896), 
	.A(\fsm_op1[3] ));
   SDFRQX1 \fsm_op2_reg[5]  (.SE(DFT_sen), 
	.SD(\fsm_op2[1] ), 
	.Q(\fsm_op2[5] ), 
	.D(n_1869), 
	.C(fsm_clock_i));
   SDFRQX1 \fsm_op2_reg[7]  (.SE(DFT_sen), 
	.SD(\fsm_op2[6] ), 
	.Q(\fsm_op2[7] ), 
	.D(n_1871), 
	.C(fsm_clock_i));
   SDFRQX1 \fsm_op2_reg[6]  (.SE(DFT_sen), 
	.SD(\fsm_op2[2] ), 
	.Q(\fsm_op2[6] ), 
	.D(n_1872), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op2_reg[0]  (.SE(DFT_sen), 
	.SD(fsm_int_rdy_o), 
	.Q(\fsm_op2[0] ), 
	.D(n_1868), 
	.C(fsm_clock_i));
   SDFRQX1 \fsm_op2_reg[1]  (.SE(DFT_sen), 
	.SD(\fsm_op2[4] ), 
	.Q(\fsm_op2[1] ), 
	.D(n_1867), 
	.C(fsm_clock_i));
   SDFRQX1 \fsm_op2_reg[2]  (.SE(DFT_sen), 
	.SD(\fsm_op2[3] ), 
	.Q(\fsm_op2[2] ), 
	.D(n_1860), 
	.C(fsm_clock_i));
   AN222X0 p4964A (.Q(n_1887), 
	.F(fsm_rom_data_i[0]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[0]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(\fsm_op_aux_1[0] ));
   AN222X0 p4938A (.Q(n_1886), 
	.F(fsm_rom_data_i[2]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[2]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(\fsm_op_aux_1[2] ));
   AN222X0 p4938A51889 (.Q(n_1882), 
	.F(fsm_rom_data_i[1]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[1]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(n_1449));
   AN222X0 p4938A51890 (.Q(n_1881), 
	.F(fsm_rom_data_i[4]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[4]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(\fsm_op_aux_1[4] ));
   AN222X0 p4964A51891 (.Q(n_1880), 
	.F(fsm_rom_data_i[3]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[3]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(n_1434));
   AN222X0 p4976A (.Q(n_1879), 
	.F(fsm_rom_data_i[6]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[6]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(\fsm_op_aux_1[6] ));
   AN222X0 p4976A51892 (.Q(n_1878), 
	.F(fsm_rom_data_i[7]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[7]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(n_1170));
   AN222X0 p4950A (.Q(n_1877), 
	.F(fsm_rom_data_i[5]), 
	.E(n_1883), 
	.D(fsm_sfr_data_i[5]), 
	.C(n_1884), 
	.B(n_1885), 
	.A(\fsm_op_aux_1[5] ));
   ON221X0 p4673A (.Q(n_1876), 
	.E(n_1865), 
	.D(n_1873), 
	.C(n_1837), 
	.B(n_1874), 
	.A(n_1804));
   ON221X0 p4647A (.Q(n_1875), 
	.E(n_1866), 
	.D(n_1873), 
	.C(n_1835), 
	.B(n_1874), 
	.A(n_1800));
   NO2X0 p9160A (.Q(n_1896), 
	.B(n_1862), 
	.A(n_1861));
   AO221X0 p4162A (.Q(n_1872), 
	.E(n_1848), 
	.D(n_1857), 
	.C(n_1806), 
	.B(n_1870), 
	.A(\fsm_op2[6] ));
   AO221X0 p4162A51893 (.Q(n_1871), 
	.E(n_1847), 
	.D(n_1857), 
	.C(n_1807), 
	.B(n_1870), 
	.A(\fsm_op2[7] ));
   ON21X0 p4314A (.Q(n_1869), 
	.C(n_1859), 
	.B(n_1810), 
	.A(n_1874));
   ON221X0 p4656A (.Q(n_1868), 
	.E(n_1855), 
	.D(n_1873), 
	.C(n_1830), 
	.B(n_1874), 
	.A(n_1798));
   ON221X0 p4647A51894 (.Q(n_1867), 
	.E(n_1854), 
	.D(n_1873), 
	.C(n_1843), 
	.B(n_1874), 
	.A(n_1805));
   AN321X0 p8652A (.Q(n_1866), 
	.F(n_1863), 
	.E(n_1813), 
	.D(\fsm_op2[4] ), 
	.C(n_1864), 
	.B(fsm_int_vect_i[1]), 
	.A(fsm_int_vect_i[0]));
   AN321X0 p8652A51895 (.Q(n_1865), 
	.F(n_1863), 
	.E(n_1813), 
	.D(\fsm_op2[3] ), 
	.C(n_1864), 
	.B(fsm_int_vect_i[1]), 
	.A(n_1535));
   OR2X0 p9158A (.Q(n_1862), 
	.B(n_1914), 
	.A(n_1895));
   OR5X0 p9265A (.Q(n_1861), 
	.E(n_1961), 
	.D(n_1962), 
	.C(n_1808), 
	.B(n_1894), 
	.A(n_1915));
   ON222X0 p4585A (.Q(n_1860), 
	.F(n_377), 
	.E(n_1858), 
	.D(n_1874), 
	.C(n_1801), 
	.B(n_1873), 
	.A(n_1841));
   AN32X0 p9085A (.Q(n_1859), 
	.E(n_1813), 
	.D(\fsm_op2[5] ), 
	.C(n_1864), 
	.B(n_1537), 
	.A(fsm_int_vect_i[2]));
   ON211X0 p10351A (.Q(n_1885), 
	.D(n_1846), 
	.C(n_1851), 
	.B(n_2126), 
	.A(n_1845));
   AO211X0 p9232A (.Q(n_1914), 
	.D(n_1592), 
	.C(n_2044), 
	.B(n_1733), 
	.A(n_1853));
   ON22X0 p10956A (.Q(n_1883), 
	.D(n_2126), 
	.C(n_1737), 
	.B(n_1850), 
	.A(n_1852));
   ON21X0 p8993A (.Q(n_1870), 
	.C(n_1858), 
	.B(n_1678), 
	.A(n_1874));
   INX0 p8467A (.Q(n_1857), 
	.A(n_1873));
   AN21X0 p9329A (.Q(n_1855), 
	.C(n_1864), 
	.B(\fsm_op2[0] ), 
	.A(n_1813));
   AN21X0 p9361A (.Q(n_1854), 
	.C(n_1864), 
	.B(\fsm_op2[1] ), 
	.A(n_1813));
   AND3X0 p8650A (.Q(n_1863), 
	.C(fsm_int_vect_i[2]), 
	.B(n_1536), 
	.A(n_1864));
   AO21X0 p9407A (.Q(n_1915), 
	.C(n_2046), 
	.B(n_1735), 
	.A(n_1853));
   AO22X0 p9159A (.Q(n_1895), 
	.D(n_2042), 
	.C(n_2190), 
	.B(n_1707), 
	.A(n_1853));
   NO2I1X0 p10791A (.Q(n_1884), 
	.B(n_1852), 
	.AN(n_1849));
   NA3I2X0 p10351A51897 (.Q(n_1851), 
	.C(n_1850), 
	.BN(n_1849), 
	.AN(n_1852));
   OR2X0 p8464A (.Q(n_1873), 
	.B(n_1809), 
	.A(n_1874));
   AN21X0 p4162A51898 (.Q(n_1848), 
	.C(n_1874), 
	.B(n_1791), 
	.A(n_1760));
   AN21X0 p4162A51899 (.Q(n_1847), 
	.C(n_1874), 
	.B(n_1792), 
	.A(n_1761));
   AND2X0 p9268A (.Q(n_1894), 
	.B(n_2028), 
	.A(n_1853));
   SDFRQX2 \fsm_opcode_reg[1]  (.SE(DFT_sen), 
	.SD(n_774), 
	.Q(n_209), 
	.D(n_1797), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_opcode_reg[4]  (.SE(DFT_sen), 
	.SD(n_36), 
	.Q(n_167), 
	.D(n_1796), 
	.C(fsm_clock_i));
   NO2X0 p8653A (.Q(n_1864), 
	.B(n_2041), 
	.A(n_1813));
   NA2I1X0 p10431A (.Q(n_1852), 
	.B(n_1846), 
	.AN(n_2040));
   NA3X0 p11745A (.Q(n_1952), 
	.C(n_1613), 
	.B(n_1845), 
	.A(n_1846));
   ON221X0 p3882A (.Q(n_1844), 
	.E(n_1789), 
	.D(n_1839), 
	.C(n_1755), 
	.B(n_1840), 
	.A(n_1843));
   ON221X0 p3883A (.Q(n_1842), 
	.E(n_1788), 
	.D(n_1839), 
	.C(n_1758), 
	.B(n_1840), 
	.A(n_1841));
   ON221X0 p3908A (.Q(n_1838), 
	.E(n_1786), 
	.D(n_1839), 
	.C(n_1753), 
	.B(n_1840), 
	.A(n_1837));
   ON221X0 p3882A51902 (.Q(n_1836), 
	.E(n_1784), 
	.D(n_1839), 
	.C(n_1759), 
	.B(n_1840), 
	.A(n_1835));
   ON221X0 p3899A (.Q(n_1834), 
	.E(n_1783), 
	.D(n_1839), 
	.C(n_1752), 
	.B(n_1840), 
	.A(n_1821));
   ON221X0 p3899A51903 (.Q(n_1833), 
	.E(n_1782), 
	.D(n_1839), 
	.C(n_1757), 
	.B(n_1840), 
	.A(n_1817));
   ON221X0 p3883A51904 (.Q(n_1832), 
	.E(n_1785), 
	.D(n_1839), 
	.C(n_1754), 
	.B(n_1840), 
	.A(n_1819));
   ON221X0 p3908A51905 (.Q(n_1831), 
	.E(n_1781), 
	.D(n_1839), 
	.C(n_1756), 
	.B(n_1840), 
	.A(n_1830));
   SDFRQX2 \fsm_opcode_reg[0]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_2[7] ), 
	.Q(n_774), 
	.D(n_1769), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_opcode_reg[2]  (.SE(DFT_sen), 
	.SD(n_209), 
	.Q(DFT_sdo), 
	.D(n_1767), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_opcode_reg[3]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(n_36), 
	.D(n_1766), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_opcode_reg[5]  (.SE(DFT_sen), 
	.SD(n_167), 
	.Q(n_80), 
	.D(n_1765), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_opcode_reg[6]  (.SE(DFT_sen), 
	.SD(n_80), 
	.Q(n_120), 
	.D(n_1764), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_opcode_reg[7]  (.SE(DFT_sen), 
	.SD(n_120), 
	.Q(\fsm_opcode[7] ), 
	.D(n_1763), 
	.C(fsm_clock_i));
   NA2X0 p8467A51912 (.Q(n_1874), 
	.B(n_2031), 
	.A(n_1858));
   ON221X0 p4013A (.Q(n_1829), 
	.E(n_1779), 
	.D(n_1616), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1830));
   ON221X0 p3987A (.Q(n_1828), 
	.E(n_1778), 
	.D(n_1630), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1843));
   ON221X0 p4013A51913 (.Q(n_1825), 
	.E(n_1775), 
	.D(n_1620), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1837));
   ON221X0 p3987A51914 (.Q(n_1824), 
	.E(n_1774), 
	.D(n_1628), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1835));
   ON221X0 p3996A (.Q(n_1823), 
	.E(n_1770), 
	.D(n_1618), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1841));
   ON221X0 p4004A (.Q(n_1822), 
	.E(n_1772), 
	.D(n_1624), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1821));
   ON221X0 p4010A (.Q(n_1820), 
	.E(n_1773), 
	.D(n_1626), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1819));
   ON221X0 p4003A (.Q(n_1818), 
	.E(n_1771), 
	.D(n_1622), 
	.C(n_1826), 
	.B(n_1827), 
	.A(n_1817));
   AN221X0 p9159A51915 (.Q(n_1853), 
	.E(n_2040), 
	.D(n_1768), 
	.C(n_1738), 
	.B(n_2194), 
	.A(n_1603));
   INX0 p9801A (.Q(n_1813), 
	.A(n_1858));
   ON21X0 p10474A (.Q(n_1846), 
	.C(n_1799), 
	.B(n_2040), 
	.A(n_1739));
   OA211X0 p4314A51918 (.Q(n_1810), 
	.D(n_1762), 
	.C(n_1790), 
	.B(n_1819), 
	.A(n_1809));
   SDFRQX0 lcall_hardware_flag_reg (.SE(DFT_sen), 
	.SD(n_2020), 
	.Q(DFT_sdo_2), 
	.D(n_1750), 
	.C(fsm_clock_i));
   NA2X0 p8467A51920 (.Q(n_1858), 
	.B(n_1780), 
	.A(n_1749));
   NA3X0 p10769A (.Q(n_1808), 
	.C(n_1587), 
	.B(n_1614), 
	.A(n_1905));
   INX0 p4230A (.Q(n_1807), 
	.A(n_1817));
   INX0 p4230A51921 (.Q(n_1806), 
	.A(n_1821));
   AN221X0 p4645A (.Q(n_1805), 
	.E(n_1717), 
	.D(n_1802), 
	.C(fsm_rom_data_i[1]), 
	.B(fsm_ram_data_i[1]), 
	.A(n_1803));
   AN221X0 p4671A (.Q(n_1804), 
	.E(n_1714), 
	.D(n_1802), 
	.C(fsm_rom_data_i[3]), 
	.B(fsm_ram_data_i[3]), 
	.A(n_1803));
   AN221X0 p4581A (.Q(n_1801), 
	.E(n_1716), 
	.D(n_1802), 
	.C(fsm_rom_data_i[2]), 
	.B(fsm_ram_data_i[2]), 
	.A(n_1803));
   AN221X0 p4645A51922 (.Q(n_1800), 
	.E(n_1713), 
	.D(n_1802), 
	.C(fsm_rom_data_i[4]), 
	.B(fsm_ram_data_i[4]), 
	.A(n_1803));
   AN211X0 p10473A (.Q(n_1799), 
	.D(n_1751), 
	.C(n_1606), 
	.B(n_1740), 
	.A(n_2003));
   AN221X0 p4654A (.Q(n_1798), 
	.E(n_1718), 
	.D(n_1802), 
	.C(fsm_rom_data_i[0]), 
	.B(fsm_ram_data_i[0]), 
	.A(n_1803));
   AO221X0 p4799A (.Q(n_1797), 
	.E(n_1793), 
	.D(n_1794), 
	.C(n_209), 
	.B(n_1795), 
	.A(fsm_rom_data_i[1]));
   AO221X0 p4799A51923 (.Q(n_1796), 
	.E(n_1793), 
	.D(n_1794), 
	.C(n_167), 
	.B(n_1795), 
	.A(fsm_rom_data_i[4]));
   AN221X0 p4160A (.Q(n_1792), 
	.E(n_1686), 
	.D(fsm_ram_data_i[7]), 
	.C(n_1803), 
	.B(n_2028), 
	.A(fsm_pc_i[15]));
   AN221X0 p4160A51924 (.Q(n_1791), 
	.E(n_1687), 
	.D(fsm_ram_data_i[6]), 
	.C(n_1803), 
	.B(n_2028), 
	.A(fsm_pc_i[14]));
   AN221X0 p4315A (.Q(n_1790), 
	.E(n_1699), 
	.D(fsm_ram_data_i[5]), 
	.C(n_1803), 
	.B(n_2028), 
	.A(fsm_pc_i[13]));
   AN221X0 p3880A (.Q(n_1789), 
	.E(n_1664), 
	.D(fsm_ram_data_i[1]), 
	.C(n_1787), 
	.B(n_1631), 
	.A(n_2029));
   AN221X0 p3880A51925 (.Q(n_1788), 
	.E(n_1660), 
	.D(fsm_ram_data_i[2]), 
	.C(n_1787), 
	.B(n_1619), 
	.A(n_2029));
   AN221X0 p3906A (.Q(n_1786), 
	.E(n_1658), 
	.D(fsm_ram_data_i[3]), 
	.C(n_1787), 
	.B(n_1621), 
	.A(n_2029));
   AN221X0 p3880A51926 (.Q(n_1785), 
	.E(n_1654), 
	.D(fsm_ram_data_i[5]), 
	.C(n_1787), 
	.B(n_1627), 
	.A(n_2029));
   AN221X0 p3880A51927 (.Q(n_1784), 
	.E(n_1656), 
	.D(fsm_ram_data_i[4]), 
	.C(n_1787), 
	.B(n_1629), 
	.A(n_2029));
   AN221X0 p3906A51928 (.Q(n_1783), 
	.E(n_1652), 
	.D(fsm_ram_data_i[6]), 
	.C(n_1787), 
	.B(n_1625), 
	.A(n_2029));
   AN221X0 p3906A51929 (.Q(n_1782), 
	.E(n_1650), 
	.D(fsm_ram_data_i[7]), 
	.C(n_1787), 
	.B(n_1623), 
	.A(n_2029));
   AN221X0 p3906A51930 (.Q(n_1781), 
	.E(n_1666), 
	.D(fsm_ram_data_i[0]), 
	.C(n_1787), 
	.B(n_1617), 
	.A(n_2029));
   AN22X0 p3908A51931 (.Q(n_1830), 
	.D(fsm_ram_data_i[0]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[0]));
   AN22X0 p3908A51932 (.Q(n_1837), 
	.D(fsm_ram_data_i[3]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[3]));
   AN22X0 p3882A51933 (.Q(n_1843), 
	.D(fsm_ram_data_i[1]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[1]));
   AN22X0 p3892A (.Q(n_1841), 
	.D(fsm_ram_data_i[2]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[2]));
   AN22X0 p3882A51934 (.Q(n_1835), 
	.D(fsm_ram_data_i[4]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[4]));
   AN22X0 p3899A51935 (.Q(n_1821), 
	.D(fsm_ram_data_i[6]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[6]));
   AN22X0 p3906A51936 (.Q(n_1819), 
	.D(fsm_ram_data_i[5]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[5]));
   AN22X0 p3899A51937 (.Q(n_1817), 
	.D(fsm_ram_data_i[7]), 
	.C(n_2124), 
	.B(n_520), 
	.A(fsm_sfr_data_i[7]));
   ON31X0 p15528A (.Q(n_1780), 
	.D(n_2031), 
	.C(n_1743), 
	.B(n_1674), 
	.A(n_2047));
   AN22X0 p15094A (.Q(n_1779), 
	.D(n_1665), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[0] ), 
	.A(n_1777));
   AN22X0 p15094A51938 (.Q(n_1778), 
	.D(n_1661), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[1] ), 
	.A(n_1777));
   AN22X0 p15094A51939 (.Q(n_1775), 
	.D(n_1657), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[3] ), 
	.A(n_1777));
   AN22X0 p15094A51940 (.Q(n_1774), 
	.D(n_1655), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[4] ), 
	.A(n_1777));
   AN22X0 p15094A51941 (.Q(n_1773), 
	.D(n_1653), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_1777));
   AN22X0 p15094A51942 (.Q(n_1772), 
	.D(n_1651), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[6] ), 
	.A(n_1777));
   AN22X0 p15094A51943 (.Q(n_1771), 
	.D(n_1649), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[7] ), 
	.A(n_1777));
   AN22X0 p15094A51944 (.Q(n_1770), 
	.D(n_1659), 
	.C(n_1776), 
	.B(\fsm_op_aux_2[2] ), 
	.A(n_1777));
   AND3X0 p10373A (.Q(n_1961), 
	.C(n_2217), 
	.B(n_1994), 
	.A(n_1745));
   AO22X0 p5120A (.Q(n_1769), 
	.D(n_774), 
	.C(n_1794), 
	.B(fsm_rom_data_i[0]), 
	.A(n_1795));
   NO3X0 p9159A51945 (.Q(n_1768), 
	.C(n_1986), 
	.B(n_1710), 
	.A(n_1745));
   NA2X0 p10768A (.Q(n_1905), 
	.B(n_2029), 
	.A(n_1745));
   AO22X0 p5094A (.Q(n_1767), 
	.D(DFT_sdo), 
	.C(n_1794), 
	.B(fsm_rom_data_i[2]), 
	.A(n_1795));
   AO22X0 p5120A51946 (.Q(n_1766), 
	.D(n_36), 
	.C(n_1794), 
	.B(fsm_rom_data_i[3]), 
	.A(n_1795));
   AO22X0 p5106A (.Q(n_1765), 
	.D(n_80), 
	.C(n_1794), 
	.B(fsm_rom_data_i[5]), 
	.A(n_1795));
   AO22X0 p5132A (.Q(n_1764), 
	.D(n_120), 
	.C(n_1794), 
	.B(fsm_rom_data_i[6]), 
	.A(n_1795));
   AO22X0 p5132A51947 (.Q(n_1763), 
	.D(\fsm_opcode[7] ), 
	.C(n_1794), 
	.B(fsm_rom_data_i[7]), 
	.A(n_1795));
   SDFRQX0 fsm_int_na_o_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(fsm_int_na_o), 
	.D(n_1732), 
	.C(fsm_clock_i));
   OR2X0 p14105A (.Q(n_1826), 
	.B(n_2041), 
	.A(n_1777));
   NA2X0 p4748A (.Q(n_1762), 
	.B(fsm_rom_data_i[5]), 
	.A(n_1802));
   NA2X0 p4598A (.Q(n_1761), 
	.B(fsm_rom_data_i[7]), 
	.A(n_1802));
   NA2X0 p4598A51949 (.Q(n_1760), 
	.B(fsm_rom_data_i[6]), 
	.A(n_1802));
   AN31X0 p10394A (.Q(n_1962), 
	.D(n_1747), 
	.C(n_1744), 
	.B(n_1584), 
	.A(n_1573));
   INX0 p4453A (.Q(n_1759), 
	.A(fsm_rom_data_i[4]));
   INX0 p4453A51950 (.Q(n_1758), 
	.A(fsm_rom_data_i[2]));
   INX0 p4491A (.Q(n_1757), 
	.A(fsm_rom_data_i[7]));
   INX0 p4479A (.Q(n_1756), 
	.A(fsm_rom_data_i[0]));
   INX0 p4453A51951 (.Q(n_1755), 
	.A(fsm_rom_data_i[1]));
   INX0 p4465A (.Q(n_1754), 
	.A(fsm_rom_data_i[5]));
   INX0 p4479A51952 (.Q(n_1753), 
	.A(fsm_rom_data_i[3]));
   INX0 p4491A51953 (.Q(n_1752), 
	.A(fsm_rom_data_i[6]));
   AN31X0 p10474A51954 (.Q(n_1751), 
	.D(n_2126), 
	.C(n_1731), 
	.B(n_1709), 
	.A(n_1734));
   MU2X0 p10223A (.S(n_1749), 
	.Q(n_1750), 
	.IN1(DFT_sdo_2), 
	.IN0(n_1604));
   INX0 p9210A (.Q(n_1745), 
	.A(n_1747));
   NO3X0 p14113A (.Q(n_1777), 
	.C(n_2107), 
	.B(n_2108), 
	.A(n_1736));
   NA2X0 p15265A (.Q(n_1827), 
	.B(n_2217), 
	.A(n_1776));
   AO21X0 p9244A (.Q(n_1747), 
	.C(n_2126), 
	.B(n_1675), 
	.A(n_1744));
   ON211X0 p19377A (.Q(n_1743), 
	.D(n_1722), 
	.C(n_1809), 
	.B(n_2042), 
	.A(n_1589));
   AO22X0 p13027A (.Q(n_1741), 
	.D(n_1740), 
	.C(n_1723), 
	.B(n_2217), 
	.A(n_1724));
   AND2X0 p11296A (.Q(n_1739), 
	.B(n_1737), 
	.A(n_1738));
   AND2X0 p15266A (.Q(n_1776), 
	.B(n_2027), 
	.A(n_1942));
   NA2I1X0 p14107A (.Q(n_1736), 
	.B(n_2098), 
	.AN(n_1942));
   NO2I1X0 p16136A (.Q(n_1943), 
	.B(n_1599), 
	.AN(n_1942));
   NO2I1X0 p8094A (.Q(n_1749), 
	.B(n_1793), 
	.AN(n_2098));
   NO2X0 p9718A (.Q(n_1795), 
	.B(n_1794), 
	.A(n_1793));
   AO21X0 p10513A (.Q(n_1735), 
	.C(n_1728), 
	.B(n_2042), 
	.A(n_2001));
   NA3I1X0 p12176A (.Q(n_1849), 
	.C(n_1734), 
	.B(n_1727), 
	.AN(n_1733));
   ON31X0 p11097A (.Q(n_1732), 
	.D(n_1597), 
	.C(n_1726), 
	.B(n_1725), 
	.A(n_2041));
   NO2I1X0 p9438A (.Q(n_1738), 
	.B(n_1712), 
	.AN(n_1705));
   AO311X0 p10474A51956 (.Q(n_1731), 
	.E(n_1698), 
	.D(n_1642), 
	.C(n_1684), 
	.B(n_2171), 
	.A(n_34));
   AN33X0 p9317A (.Q(n_1744), 
	.F(n_1729), 
	.E(n_1730), 
	.D(n_1679), 
	.C(n_1689), 
	.B(n_1730), 
	.A(n_1729));
   ON211X0 p21094A (.Q(n_1802), 
	.D(n_1840), 
	.C(n_1720), 
	.B(n_2042), 
	.A(n_1641));
   INX0 p10514A (.Q(n_1728), 
	.A(n_1727));
   NO3I1X0 p8092A (.Q(n_1793), 
	.C(n_2041), 
	.B(n_1726), 
	.AN(n_1725));
   ON21X0 p13028A (.Q(n_1724), 
	.C(n_1723), 
	.B(n_619), 
	.A(n_1606));
   NO6X0 p35391A (.Q(n_1722), 
	.F(n_2023), 
	.E(n_1993), 
	.D(n_2027), 
	.C(n_1677), 
	.B(n_1711), 
	.A(n_1719));
   NO2I1X0 p13931A (.Q(n_1942), 
	.B(n_1708), 
	.AN(n_2031));
   AN211X0 p13474A (.Q(n_1845), 
	.D(n_2025), 
	.C(n_2026), 
	.B(n_2042), 
	.A(n_1701));
   NO2X0 p38275A (.Q(n_1720), 
	.B(n_2193), 
	.A(n_1719));
   AO221X0 p7038A (.Q(n_1718), 
	.E(n_1692), 
	.D(n_2029), 
	.C(fsm_pc_i[0]), 
	.B(fsm_pc_i[8]), 
	.A(n_2028));
   AO221X0 p7056A (.Q(n_1717), 
	.E(n_1697), 
	.D(n_2029), 
	.C(fsm_pc_i[1]), 
	.B(fsm_pc_i[9]), 
	.A(n_2028));
   AO221X0 p6995A (.Q(n_1716), 
	.E(n_1694), 
	.D(n_2029), 
	.C(fsm_pc_i[2]), 
	.B(fsm_pc_i[10]), 
	.A(n_2028));
   AN221X0 p10511A (.Q(n_1727), 
	.E(n_2194), 
	.D(n_1703), 
	.C(n_1704), 
	.B(n_1996), 
	.A(n_2042));
   AO221X0 p7055A (.Q(n_1714), 
	.E(n_1693), 
	.D(n_2029), 
	.C(fsm_pc_i[3]), 
	.B(fsm_pc_i[11]), 
	.A(n_2028));
   AO221X0 p7188A (.Q(n_1713), 
	.E(n_1691), 
	.D(n_2029), 
	.C(fsm_pc_i[4]), 
	.B(n_2028), 
	.A(fsm_pc_i[12]));
   ON211X0 p9442A (.Q(n_1712), 
	.D(n_1682), 
	.C(n_1690), 
	.B(n_2217), 
	.A(n_1566));
   AO211X0 p14587A (.Q(n_1803), 
	.D(n_1711), 
	.C(n_2003), 
	.B(n_2125), 
	.A(n_2023));
   NA6I3X0 p9158A51957 (.Q(n_1710), 
	.F(n_1584), 
	.E(n_1706), 
	.D(n_1588), 
	.CN(n_2001), 
	.BN(n_2025), 
	.AN(n_1991));
   AN211X0 p12059A (.Q(n_1709), 
	.D(n_1646), 
	.C(n_1700), 
	.B(n_2042), 
	.A(n_2004));
   AN21X0 p18334A (.Q(n_1708), 
	.C(n_1688), 
	.B(n_2042), 
	.A(n_2026));
   ON211X0 p10594A (.Q(n_1707), 
	.D(n_1706), 
	.C(n_1551), 
	.B(n_2217), 
	.A(n_1702));
   NA2X0 p9467A (.Q(n_1705), 
	.B(n_1703), 
	.A(n_1704));
   NA6I1X0 p13027A51958 (.Q(n_1723), 
	.F(n_1672), 
	.E(n_1702), 
	.D(n_1598), 
	.C(n_1669), 
	.B(n_1734), 
	.AN(n_2001));
   AN311X0 p10543A (.Q(n_1725), 
	.E(n_2112), 
	.D(n_2217), 
	.C(n_1673), 
	.B(n_1602), 
	.A(fsm_sfr_addr_o[5]));
   SDFRQX0 fsm_int_rdy_o_reg (.SE(DFT_sen), 
	.SD(fsm_int_na_o), 
	.Q(fsm_int_rdy_o), 
	.D(n_1676), 
	.C(fsm_clock_i));
   NA2I1X0 p13480A (.Q(n_1701), 
	.B(n_1551), 
	.AN(n_1700));
   OA211X0 p35939A (.Q(n_1719), 
	.D(n_1600), 
	.C(n_1680), 
	.B(n_1563), 
	.A(n_1591));
   AO222X0 p7370A (.Q(n_1699), 
	.F(fsm_sfr_data_i[5]), 
	.E(n_1695), 
	.D(n_2029), 
	.C(fsm_pc_i[5]), 
	.B(n_1696), 
	.A(\fsm_op2[5] ));
   AN21X0 p10634A (.Q(n_1698), 
	.C(n_2099), 
	.B(n_1529), 
	.A(n_1683));
   AO22X0 p14206A (.Q(n_1697), 
	.D(n_1695), 
	.C(fsm_sfr_data_i[1]), 
	.B(\fsm_op2[1] ), 
	.A(n_1696));
   AO22X0 p14144A (.Q(n_1694), 
	.D(n_1695), 
	.C(fsm_sfr_data_i[2]), 
	.B(\fsm_op2[2] ), 
	.A(n_1696));
   AO22X0 p14206A51960 (.Q(n_1693), 
	.D(n_1695), 
	.C(fsm_sfr_data_i[3]), 
	.B(\fsm_op2[3] ), 
	.A(n_1696));
   AO22X0 p14189A (.Q(n_1692), 
	.D(n_1695), 
	.C(fsm_sfr_data_i[0]), 
	.B(\fsm_op2[0] ), 
	.A(n_1696));
   AO22X0 p14206A51961 (.Q(n_1691), 
	.D(n_1695), 
	.C(fsm_sfr_data_i[4]), 
	.B(\fsm_op2[4] ), 
	.A(n_1696));
   NA2I1X0 p10767A (.Q(n_1733), 
	.B(n_1690), 
	.AN(n_2003));
   AN21X0 p13456A (.Q(n_1850), 
	.C(n_2123), 
	.B(n_2042), 
	.A(n_1668));
   AN21X0 p9317A51962 (.Q(n_1689), 
	.C(n_1681), 
	.B(n_2016), 
	.A(n_1607));
   NA6I3X0 p34485A (.Q(n_1688), 
	.F(n_1610), 
	.E(n_1734), 
	.D(n_1840), 
	.CN(n_2030), 
	.BN(n_2025), 
	.AN(n_2027));
   ON22X0 p9466A (.Q(n_1704), 
	.D(DFT_sdo), 
	.C(n_2170), 
	.B(n_1562), 
	.A(n_1667));
   AO222X0 p7290A (.Q(n_1687), 
	.F(n_1685), 
	.E(\fsm_op2[6] ), 
	.D(n_2029), 
	.C(fsm_pc_i[6]), 
	.B(fsm_sfr_data_i[6]), 
	.A(n_1695));
   AO222X0 p7275A (.Q(n_1686), 
	.F(n_1685), 
	.E(\fsm_op2[7] ), 
	.D(n_2029), 
	.C(fsm_pc_i[7]), 
	.B(fsm_sfr_data_i[7]), 
	.A(n_1695));
   ON21X0 p10474A51963 (.Q(n_1684), 
	.C(n_1683), 
	.B(n_2157), 
	.A(n_163));
   NO3X0 p9614A (.Q(n_1682), 
	.C(n_1996), 
	.B(n_2123), 
	.A(n_1668));
   ON31X0 p35586A (.Q(n_1711), 
	.D(n_1579), 
	.C(n_1632), 
	.B(n_1999), 
	.A(n_1995));
   AN311X0 p35312A (.Q(n_1809), 
	.E(n_1637), 
	.D(n_1987), 
	.C(n_1635), 
	.B(n_1988), 
	.A(n_2157));
   NA3X0 p9159A51964 (.Q(n_1706), 
	.C(n_1612), 
	.B(n_1643), 
	.A(n_1634));
   AO21X0 p12059A51965 (.Q(n_1700), 
	.C(n_2002), 
	.B(n_1557), 
	.A(n_1645));
   ON21X0 p9317A51966 (.Q(n_1729), 
	.C(n_1648), 
	.B(n_2050), 
	.A(n_1586));
   AN31X0 p9439A (.Q(n_1681), 
	.D(n_1638), 
	.C(n_1609), 
	.B(n_2121), 
	.A(n_167));
   ON221X0 p9446A (.Q(n_1690), 
	.E(n_1647), 
	.D(n_79), 
	.C(n_1557), 
	.B(n_1565), 
	.A(DFT_sdo));
   NO2X0 p15196A (.Q(n_1933), 
	.B(n_2040), 
	.A(n_1932));
   OA321X0 p10017A (.Q(n_1703), 
	.F(n_1605), 
	.E(n_1611), 
	.D(n_2050), 
	.C(n_58), 
	.B(n_2155), 
	.A(n_120));
   AN31X0 p36100A (.Q(n_1680), 
	.D(n_1644), 
	.C(n_1570), 
	.B(n_2100), 
	.A(n_2154));
   AND2X0 p9555A (.Q(n_1679), 
	.B(n_34), 
	.A(n_1636));
   NA2I1X0 p13928A (.Q(n_1696), 
	.B(n_1678), 
	.AN(n_1685));
   INX0 p35392A (.Q(n_1677), 
	.A(n_1840));
   ON31X0 p19726A (.Q(n_1676), 
	.D(n_1639), 
	.C(n_1556), 
	.B(n_1794), 
	.A(n_2041));
   AN211X0 p9356A (.Q(n_1675), 
	.D(n_1674), 
	.C(n_2000), 
	.B(n_2217), 
	.A(n_1615));
   ON221X0 p10473A51967 (.Q(n_1683), 
	.E(n_1633), 
	.D(n_1555), 
	.C(n_209), 
	.B(n_2171), 
	.A(n_2170));
   ON31X0 p10543A51968 (.Q(n_1673), 
	.D(n_1640), 
	.C(n_1568), 
	.B(fsm_sfr_addr_o[2]), 
	.A(fsm_sfr_addr_o[1]));
   NO3X0 p17675A (.Q(n_1672), 
	.C(n_1606), 
	.B(n_2005), 
	.A(n_1996));
   INX0 p13455A (.Q(n_1668), 
	.A(n_1669));
   AN21X0 p9467A51969 (.Q(n_1667), 
	.C(n_2150), 
	.B(n_1540), 
	.A(n_1596));
   ON211X0 p34726A (.Q(n_1840), 
	.D(n_1593), 
	.C(n_1601), 
	.B(n_80), 
	.A(n_2051));
   AO222X0 p13945A (.Q(n_1666), 
	.F(n_2030), 
	.E(n_1665), 
	.D(fsm_sfr_data_i[0]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[0] ));
   AO222X0 p13945A51970 (.Q(n_1664), 
	.F(n_2030), 
	.E(n_1661), 
	.D(fsm_sfr_data_i[1]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[1] ));
   AO222X0 p13945A51971 (.Q(n_1660), 
	.F(n_2030), 
	.E(n_1659), 
	.D(fsm_sfr_data_i[2]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[2] ));
   AO222X0 p13945A51972 (.Q(n_1658), 
	.F(n_2030), 
	.E(n_1657), 
	.D(fsm_sfr_data_i[3]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[3] ));
   AO222X0 p13945A51973 (.Q(n_1656), 
	.F(n_2030), 
	.E(n_1655), 
	.D(fsm_sfr_data_i[4]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[4] ));
   AO222X0 p13945A51974 (.Q(n_1654), 
	.F(n_2030), 
	.E(n_1653), 
	.D(fsm_sfr_data_i[5]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[5] ));
   AO222X0 p13945A51975 (.Q(n_1652), 
	.F(n_2030), 
	.E(n_1651), 
	.D(fsm_sfr_data_i[6]), 
	.C(n_1662), 
	.B(n_1663), 
	.A(\fsm_op_aux_2[6] ));
   AO222X0 p13945A51976 (.Q(n_1650), 
	.F(n_1663), 
	.E(\fsm_op_aux_2[7] ), 
	.D(fsm_sfr_data_i[7]), 
	.C(n_1662), 
	.B(n_2030), 
	.A(n_1649));
   AN221X0 p9321A (.Q(n_1648), 
	.E(n_2111), 
	.D(n_1582), 
	.C(n_2050), 
	.B(n_1567), 
	.A(n_1571));
   AN211X0 p9445A (.Q(n_1647), 
	.D(n_1594), 
	.C(n_2143), 
	.B(n_2116), 
	.A(n_1553));
   ON211X0 p9618A (.Q(n_1669), 
	.D(n_1557), 
	.C(n_2010), 
	.B(n_36), 
	.A(n_1574));
   AO221X0 p18027A (.Q(n_1695), 
	.E(n_2026), 
	.D(n_2023), 
	.C(n_1170), 
	.B(n_1646), 
	.A(n_2217));
   AN21X0 p15198A (.Q(n_1932), 
	.C(n_1606), 
	.B(n_2217), 
	.A(n_2189));
   SDFRQX2 \fsm_state_o_reg[2]  (.SE(DFT_sen), 
	.SD(n_32), 
	.Q(n_2020), 
	.D(n_1577), 
	.C(fsm_clock_i));
   NO3X0 p12137A (.Q(n_1645), 
	.C(n_1581), 
	.B(n_2102), 
	.A(n_2114));
   NA3X0 p36320A (.Q(n_1644), 
	.C(n_2103), 
	.B(n_2115), 
	.A(n_1590));
   AN221X0 p10957A (.Q(n_1643), 
	.E(n_2048), 
	.D(n_1580), 
	.C(n_297), 
	.B(n_2165), 
	.A(n_34));
   OA221X0 p11068A (.Q(n_1642), 
	.E(n_1583), 
	.D(n_2121), 
	.C(n_2015), 
	.B(n_2149), 
	.A(n_2166));
   NA2I1X0 p14251A (.Q(n_1678), 
	.B(n_2042), 
	.AN(n_1641));
   ON21X0 p10678A (.Q(n_1640), 
	.C(fsm_bit_byte_flag_o), 
	.B(n_1564), 
	.A(n_1576));
   ON211X0 p19732A (.Q(n_1639), 
	.D(fsm_int_rdy_o), 
	.C(n_1794), 
	.B(n_2041), 
	.A(n_2112));
   AN21X0 p9436A (.Q(n_1638), 
	.C(\fsm_opcode[7] ), 
	.B(n_2121), 
	.A(n_1608));
   ON21X0 p10550A (.Q(n_1730), 
	.C(n_1595), 
	.B(n_2118), 
	.A(n_1992));
   AN21X0 p15713A (.Q(n_1839), 
	.C(n_1637), 
	.B(n_2042), 
	.A(n_2028));
   ON22X0 p9556A (.Q(n_1636), 
	.D(n_2146), 
	.C(n_2121), 
	.B(n_80), 
	.A(n_1578));
   ON22X0 p37876A (.Q(n_1635), 
	.D(n_364), 
	.C(n_2121), 
	.B(n_2164), 
	.A(n_1569));
   AN321X0 p9158A51978 (.Q(n_1634), 
	.F(n_1992), 
	.E(n_1554), 
	.D(n_2011), 
	.C(n_2051), 
	.B(n_80), 
	.A(n_1544));
   ON22X0 p10474A51979 (.Q(n_1633), 
	.D(n_774), 
	.C(n_1552), 
	.B(n_2165), 
	.A(n_1575));
   AN221X0 p35584A (.Q(n_1632), 
	.E(n_2008), 
	.D(n_2167), 
	.C(n_1572), 
	.B(n_2113), 
	.A(DFT_sdo));
   INX0 p14217A (.Q(n_1631), 
	.A(n_1630));
   INX0 p14160A (.Q(n_1629), 
	.A(n_1628));
   INX0 p14158A (.Q(n_1627), 
	.A(n_1626));
   INX0 p14158A51980 (.Q(n_1625), 
	.A(n_1624));
   INX0 p14169A (.Q(n_1623), 
	.A(n_1622));
   INX0 p14169A51981 (.Q(n_1621), 
	.A(n_1620));
   INX0 p14160A51982 (.Q(n_1619), 
	.A(n_1618));
   INX0 p14213A (.Q(n_1617), 
	.A(n_1616));
   OR2X0 p9354A (.Q(n_1674), 
	.B(n_2043), 
	.A(n_1646));
   NO2X0 p12513A (.Q(n_1702), 
	.B(n_2006), 
	.A(n_1615));
   NA2X0 p14616A (.Q(n_1614), 
	.B(n_1740), 
	.A(n_2194));
   AND2X0 p13927A (.Q(n_1685), 
	.B(n_2042), 
	.A(n_1646));
   NO2I1X0 p12912A (.Q(n_1613), 
	.B(n_2126), 
	.AN(n_1737));
   AN21X0 p9718A51983 (.Q(n_1612), 
	.C(n_2007), 
	.B(n_2116), 
	.A(n_77));
   AN21X0 p10019A (.Q(n_1611), 
	.C(n_2174), 
	.B(\fsm_opcode[7] ), 
	.A(n_1549));
   AN21X0 p14215A (.Q(n_1630), 
	.C(n_1661), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[1]));
   AN21X0 p14158A51984 (.Q(n_1628), 
	.C(n_1655), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[4]));
   AN21X0 p14157A (.Q(n_1626), 
	.C(n_1653), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[5]));
   AN21X0 p14157A51985 (.Q(n_1624), 
	.C(n_1651), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[6]));
   AN21X0 p14167A (.Q(n_1622), 
	.C(n_1649), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[7]));
   AN21X0 p14167A51986 (.Q(n_1620), 
	.C(n_1657), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[3]));
   AN21X0 p14158A51987 (.Q(n_1618), 
	.C(n_1659), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[2]));
   AN21X0 p14212A (.Q(n_1616), 
	.C(n_1665), 
	.B(n_2217), 
	.A(fsm_sfr_data_i[0]));
   INX0 p36475A (.Q(n_1610), 
	.A(n_1637));
   ON21X0 p9537A (.Q(n_1609), 
	.C(n_1608), 
	.B(n_62), 
	.A(n_1542));
   AO211X0 p9318A (.Q(n_1607), 
	.D(n_2117), 
	.C(n_2127), 
	.B(n_62), 
	.A(n_2012));
   AN211X0 p10678A51988 (.Q(n_1605), 
	.D(n_2014), 
	.C(n_1534), 
	.B(n_29), 
	.A(n_2164));
   AN31X0 p10628A (.Q(n_1604), 
	.D(n_2041), 
	.C(n_1538), 
	.B(n_1603), 
	.A(n_2193));
   NO3I1X0 p11248A (.Q(n_1602), 
	.C(fsm_sfr_wr_o_b), 
	.B(fsm_sfr_addr_o[6]), 
	.AN(fsm_sfr_addr_o[3]));
   NO3I1X0 p34724A (.Q(n_1601), 
	.C(n_2117), 
	.B(n_2151), 
	.AN(n_2115));
   AN21X0 p36894A (.Q(n_1600), 
	.C(n_1557), 
	.B(n_62), 
	.A(n_2155));
   AN21X0 p20984A (.Q(n_1599), 
	.C(n_2026), 
	.B(n_2217), 
	.A(n_2028));
   OA21X0 p19090A (.Q(n_1794), 
	.C(n_2098), 
	.B(n_2217), 
	.A(n_2041));
   NO3X0 p15552A (.Q(n_1598), 
	.C(n_2003), 
	.B(n_1994), 
	.A(n_2194));
   AND4X0 p36474A (.Q(n_1637), 
	.D(n_2119), 
	.C(n_2017), 
	.B(n_2152), 
	.A(n_2142));
   NA3X0 p20529A (.Q(n_1597), 
	.C(n_2098), 
	.B(n_2041), 
	.A(fsm_int_na_o));
   ON21X0 p9464A (.Q(n_1596), 
	.C(n_2144), 
	.B(n_80), 
	.A(n_2012));
   NO3X0 p37348A (.Q(n_1641), 
	.C(n_2030), 
	.B(n_1993), 
	.A(n_2027));
   ON21X0 p10549A (.Q(n_1595), 
	.C(n_2049), 
	.B(n_80), 
	.A(n_2050));
   OR3X0 p9446A51989 (.Q(n_1594), 
	.C(n_2008), 
	.B(n_2174), 
	.A(n_2099));
   OA21X0 p36908A (.Q(n_1593), 
	.C(n_2175), 
	.B(n_2128), 
	.A(n_2116));
   OR3X0 p12479A (.Q(n_1592), 
	.C(n_2045), 
	.B(n_2105), 
	.A(n_2106));
   AN21X0 p35939A51990 (.Q(n_1591), 
	.C(n_1998), 
	.B(n_34), 
	.A(n_2141));
   AN21X0 p39975A (.Q(n_1590), 
	.C(n_2118), 
	.B(n_37), 
	.A(n_2110));
   AN211X0 p38269A (.Q(n_1589), 
	.D(n_2003), 
	.C(n_2026), 
	.B(n_2193), 
	.A(n_1509));
   ON22X0 p11026A (.Q(n_1588), 
	.D(n_2042), 
	.C(n_2003), 
	.B(n_2217), 
	.A(n_1994));
   INX0 p17237A (.Q(n_1606), 
	.A(n_1587));
   NO2X0 p13603A (.Q(n_1586), 
	.B(n_36), 
	.A(n_1549));
   INX0 p12863A (.Q(n_1584), 
	.A(n_1615));
   NO2X0 p11177A (.Q(n_1583), 
	.B(n_1582), 
	.A(n_2172));
   NA3I1X0 p16615A (.Q(n_1581), 
	.C(n_167), 
	.B(\fsm_opcode[7] ), 
	.AN(n_2122));
   NO3X0 p11302A (.Q(n_1580), 
	.C(n_34), 
	.B(n_80), 
	.A(n_2116));
   NA3X0 p38930A (.Q(n_1579), 
	.C(n_34), 
	.B(DFT_sdo), 
	.A(n_2137));
   NA2X0 p17206A (.Q(n_1587), 
	.B(n_2126), 
	.A(n_2040));
   AND2X0 p14449A (.Q(n_1651), 
	.B(\fsm_op_aux_2[6] ), 
	.A(n_2042));
   NO2I1X0 p9538A (.Q(n_1608), 
	.B(n_2142), 
	.AN(n_2101));
   AND2X0 p14026A (.Q(n_1649), 
	.B(\fsm_op_aux_2[7] ), 
	.A(n_2042));
   AND2X0 p14449A51991 (.Q(n_1661), 
	.B(\fsm_op_aux_2[1] ), 
	.A(n_2042));
   NO2X0 p9554A (.Q(n_1578), 
	.B(n_2127), 
	.A(n_2012));
   AND2X0 p14449A51992 (.Q(n_1657), 
	.B(\fsm_op_aux_2[3] ), 
	.A(n_2042));
   NO2I1X0 p19509A (.Q(n_1663), 
	.B(n_2042), 
	.AN(n_2025));
   NA2I1X0 p20810A (.Q(n_1577), 
	.B(fsm_reset_core_o_b), 
	.AN(n_2109));
   NA2X0 p11199A (.Q(n_1576), 
	.B(fsm_sfr_addr_o[1]), 
	.A(fsm_sfr_addr_o[2]));
   NO2I1X0 p10473A51993 (.Q(n_1575), 
	.B(n_2013), 
	.AN(n_2162));
   NO2I1X0 p11135A (.Q(n_1574), 
	.B(n_2175), 
	.AN(n_2146));
   NA2X0 p13836A (.Q(n_1573), 
	.B(n_2217), 
	.A(n_2000));
   NA2I1X0 p38940A (.Q(n_1572), 
	.B(\fsm_opcode[7] ), 
	.AN(n_2136));
   NO2X0 p10796A (.Q(n_1571), 
	.B(\fsm_opcode[7] ), 
	.A(n_2130));
   NA2X0 p36099A (.Q(n_1570), 
	.B(n_64), 
	.A(n_2134));
   NO2X0 p38316A (.Q(n_1569), 
	.B(DFT_sdo), 
	.A(n_2050));
   NA2I1X0 p10543A51994 (.Q(n_1568), 
	.B(fsm_sfr_addr_o[7]), 
	.AN(fsm_sfr_addr_o[0]));
   OR2X0 p9356A51995 (.Q(n_1646), 
	.B(n_2025), 
	.A(n_1994));
   AND2X0 p14449A51996 (.Q(n_1655), 
	.B(\fsm_op_aux_2[4] ), 
	.A(n_2042));
   NO2X0 p9321A51997 (.Q(n_1567), 
	.B(n_2129), 
	.A(n_2161));
   NA2X0 p11632A (.Q(n_1737), 
	.B(n_2042), 
	.A(n_2029));
   NO2X0 p12370A (.Q(n_1566), 
	.B(n_2028), 
	.A(n_2194));
   AND2X0 p14449A51998 (.Q(n_1665), 
	.B(\fsm_op_aux_2[0] ), 
	.A(n_2042));
   NO2X0 p9726A (.Q(n_1565), 
	.B(n_2155), 
	.A(n_2138));
   OR2X0 p10799A (.Q(n_1615), 
	.B(n_2004), 
	.A(n_2026));
   NA2X0 p10677A (.Q(n_1564), 
	.B(fsm_sfr_addr_o[0]), 
	.A(fsm_sfr_addr_o[4]));
   NO2I1X0 p36153A (.Q(n_1563), 
	.B(n_2100), 
	.AN(n_209));
   AND2X0 p14449A51999 (.Q(n_1653), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_2042));
   NO2I1X0 p20343A (.Q(n_1787), 
	.B(n_2042), 
	.AN(n_2030));
   NO2X0 p16849A (.Q(n_1740), 
	.B(n_2217), 
	.A(n_2040));
   AND2X0 p12366A (.Q(n_1562), 
	.B(n_209), 
	.A(n_2170));
   NO2X0 p11217A (.Q(n_1734), 
	.B(n_2028), 
	.A(n_2029));
   AND2X0 p14449A52000 (.Q(n_1659), 
	.B(\fsm_op_aux_2[2] ), 
	.A(n_2042));
   AND2X0 p13944A (.Q(n_1662), 
	.B(n_2042), 
	.A(n_2025));
   INX0 p10654A (.Q(n_1557), 
	.A(n_2121));
   INX0 p40510A (.Q(n_1556), 
	.A(n_2112));
   INX0 p12713A (.Q(n_1555), 
	.A(n_2104));
   INX0 p10640A (.Q(n_1554), 
	.A(n_2147));
   INX0 p10577A (.Q(n_1553), 
	.A(n_2168));
   INX0 p12516A (.Q(n_1552), 
	.A(n_2050));
   INX0 p14923A (.Q(n_1551), 
	.A(n_1994));
   INX0 p13948A (.Q(n_1549), 
	.A(n_2157));
   INX0 p10841A (.Q(n_1544), 
	.A(n_2169));
   INX0 p10531A (.Q(n_1542), 
	.A(n_2159));
   INX0 p10512A (.Q(n_1540), 
	.A(n_2009));
   INX0 p10628A52002 (.Q(n_1538), 
	.A(n_1726));
   NO2X0 p8091A (.Q(n_1726), 
	.B(fsm_int_vect_i[2]), 
	.A(n_1537));
   INX0 p10863A (.Q(n_1536), 
	.A(n_1537));
   OR2X0 p8092A52003 (.Q(n_1537), 
	.B(fsm_int_vect_i[1]), 
	.A(fsm_int_vect_i[0]));
   INX0 p11654A (.Q(n_1535), 
	.A(fsm_int_vect_i[0]));
   SDFFQX2 \fsm_state_o_reg[0]  (.SE(DFT_sen), 
	.SD(n_1170), 
	.Q(DFT_sdo_4), 
	.D(n_1528), 
	.CN(fsm_clock_i));
   AO21X0 p14557A (.Q(n_1534), 
	.C(n_36), 
	.B(n_64), 
	.A(n_774));
   INX0 p7214A (.Q(n_1533), 
	.A(fsm_pc_i[15]));
   INX0 p7208A52005 (.Q(n_1532), 
	.A(fsm_pc_i[13]));
   INX0 p7219A52006 (.Q(n_1531), 
	.A(fsm_pc_i[14]));
   INX0 p7184A52007 (.Q(n_1530), 
	.A(fsm_pc_i[12]));
   INX0 p17337A (.Q(n_1529), 
	.A(n_1582));
   NO2X0 p22207A (.Q(n_1528), 
	.B(n_32), 
	.A(n_2020));
   NA2X0 p14234A (.Q(n_1582), 
	.B(n_34), 
	.A(n_64));
   INX0 p6967A52008 (.Q(n_1527), 
	.A(fsm_pc_i[10]));
   INX0 p6965A52009 (.Q(n_1526), 
	.A(fsm_pc_i[11]));
   INX0 p6966A52010 (.Q(n_1525), 
	.A(fsm_pc_i[8]));
   NO2X0 p12060A (.Q(n_1603), 
	.B(n_2217), 
	.A(n_1509));
   INX0 p6967A52011 (.Q(n_1524), 
	.A(fsm_pc_i[9]));
   INX0 p38271A (.Q(n_1509), 
	.A(DFT_sdo_2));
   SDFRQX1 \fsm_state_o_reg[1]  (.SE(DFT_sen), 
	.SD(\fsm_opcode[7] ), 
	.Q(n_32), 
	.D(n_1506), 
	.C(fsm_clock_i));
   NO2X0 p20363A (.Q(n_1506), 
	.B(n_2020), 
	.A(n_197));
   DFFQX1 fsm_reset_core_o_b_reg (.Q(fsm_reset_core_o_b), 
	.D(fsm_reset_i_b), 
	.CN(fsm_clock_i));
   NA2X1 p0325D (.Q(fsm_alu_op1_o[4]), 
	.B(n_1503), 
	.A(n_1504));
   NA2X1 p0121D (.Q(fsm_alu_op1_o[1]), 
	.B(n_1501), 
	.A(n_1502));
   AN221X0 p9659A (.Q(n_1504), 
	.E(n_1498), 
	.D(\fsm_op2[4] ), 
	.C(n_1499), 
	.B(n_1500), 
	.A(\fsm_op1[4] ));
   NA2X0 p12710A (.Q(fsm_sfr_addr_o[3]), 
	.B(n_1496), 
	.A(n_1497));
   AN21X0 p10106A (.Q(n_1502), 
	.C(n_1495), 
	.B(n_1029), 
	.A(n_1500));
   NA2X1 n0039D (.Q(fsm_alu_op1_o[0]), 
	.B(n_1493), 
	.A(n_1494));
   AO221X0 p11408D (.Q(fsm_sfr_addr_o[5]), 
	.E(n_1490), 
	.D(n_1491), 
	.C(\fsm_op1[5] ), 
	.B(n_1492), 
	.A(\fsm_op1[5] ));
   NA2X0 p13360A (.Q(fsm_ram_addr_o[1]), 
	.B(n_1488), 
	.A(n_1489));
   ON21X0 p12410A (.Q(n_1497), 
	.C(\fsm_op1[3] ), 
	.B(n_1486), 
	.A(n_1487));
   AND3X0 p10069A (.Q(n_1494), 
	.C(n_1483), 
	.B(n_1484), 
	.A(n_1485));
   AO221X0 p10869A (.Q(fsm_ram_addr_o[4]), 
	.E(n_1480), 
	.D(n_1481), 
	.C(\fsm_op1[4] ), 
	.B(fsm_psw_rs_i[1]), 
	.A(n_1482));
   AO221X0 p2448A (.Q(fsm_ram_data_o[6]), 
	.E(n_1477), 
	.D(n_1478), 
	.C(fsm_pc_i[6]), 
	.B(n_1479), 
	.A(fsm_pc_i[14]));
   AO221X0 p2448A60487 (.Q(fsm_ram_data_o[5]), 
	.E(n_1476), 
	.D(n_1478), 
	.C(fsm_pc_i[5]), 
	.B(n_1479), 
	.A(fsm_pc_i[13]));
   AO221X0 p2420A (.Q(fsm_ram_data_o[4]), 
	.E(n_1475), 
	.D(n_1478), 
	.C(fsm_pc_i[4]), 
	.B(n_1479), 
	.A(fsm_pc_i[12]));
   AO221X0 p2077A (.Q(fsm_ram_data_o[3]), 
	.E(n_1474), 
	.D(n_1478), 
	.C(fsm_pc_i[3]), 
	.B(n_1479), 
	.A(fsm_pc_i[11]));
   AO221X0 p2093A (.Q(fsm_ram_data_o[2]), 
	.E(n_1473), 
	.D(n_1478), 
	.C(fsm_pc_i[2]), 
	.B(n_1479), 
	.A(fsm_pc_i[10]));
   AO221X0 p2093A60488 (.Q(fsm_ram_data_o[1]), 
	.E(n_1472), 
	.D(n_1478), 
	.C(fsm_pc_i[1]), 
	.B(n_1479), 
	.A(fsm_pc_i[9]));
   AO221X0 p2093A60489 (.Q(fsm_ram_data_o[0]), 
	.E(n_1471), 
	.D(n_1478), 
	.C(fsm_pc_i[0]), 
	.B(n_1479), 
	.A(fsm_pc_i[8]));
   AO221X0 p10866A (.Q(fsm_ram_addr_o[3]), 
	.E(n_1470), 
	.D(n_1481), 
	.C(\fsm_op1[3] ), 
	.B(fsm_psw_rs_i[0]), 
	.A(n_1482));
   NA2X0 p12190A (.Q(fsm_sfr_addr_o[4]), 
	.B(n_1468), 
	.A(n_1469));
   AO221X0 p2420A60490 (.Q(fsm_ram_data_o[7]), 
	.E(n_1467), 
	.D(n_1478), 
	.C(fsm_pc_i[7]), 
	.B(n_1479), 
	.A(fsm_pc_i[15]));
   NA2X2 p0501D (.Q(fsm_alu_op1_o[7]), 
	.B(n_1465), 
	.A(n_1466));
   AO221X0 p15851A (.Q(fsm_sfr_data_o[5]), 
	.E(n_1462), 
	.D(\fsm_op1[5] ), 
	.C(n_1463), 
	.B(n_1464), 
	.A(\fsm_op_aux_1[5] ));
   AO221X0 p15835A (.Q(fsm_sfr_data_o[6]), 
	.E(n_1461), 
	.D(\fsm_op1[6] ), 
	.C(n_1463), 
	.B(n_1464), 
	.A(\fsm_op_aux_1[6] ));
   AO221X0 p15839A (.Q(fsm_sfr_data_o[4]), 
	.E(n_1460), 
	.D(\fsm_op1[4] ), 
	.C(n_1463), 
	.B(n_1464), 
	.A(\fsm_op_aux_1[4] ));
   NA2X2 p0720D (.Q(fsm_pcau_offset_o[0]), 
	.B(n_1458), 
	.A(n_1459));
   NA2I1X1 p0343D (.Q(fsm_alu_op1_o[5]), 
	.B(n_1457), 
	.AN(n_1456));
   NA2X2 p0473D (.Q(fsm_alu_op1_o[6]), 
	.B(n_1454), 
	.A(n_1455));
   NA2X2 p0027D (.Q(fsm_alu_op1_o[3]), 
	.B(n_1452), 
	.A(n_1453));
   NA2X1 n0026D (.Q(fsm_alu_op1_o[2]), 
	.B(n_1450), 
	.A(n_1451));
   AO222X0 p9383A (.Q(n_1495), 
	.F(n_1447), 
	.E(\fsm_op_aux_2[1] ), 
	.D(n_1448), 
	.C(n_1449), 
	.B(n_1499), 
	.A(\fsm_op2[1] ));
   OR2X0 p12280A (.Q(fsm_sfr_addr_o[0]), 
	.B(n_1445), 
	.A(n_1446));
   OR2X0 p8014A (.Q(fsm_alu_op2_o[6]), 
	.B(n_1443), 
	.A(n_1444));
   NA2X0 p12074A (.Q(fsm_sfr_addr_o[7]), 
	.B(n_1441), 
	.A(n_1442));
   ON211X1 p0544D (.Q(fsm_pcau_offset_o[1]), 
	.D(n_1437), 
	.C(n_1438), 
	.B(n_1439), 
	.A(n_1440));
   AN21X0 p9531A (.Q(n_1455), 
	.C(n_1436), 
	.B(\fsm_op_aux_1[6] ), 
	.A(n_1448));
   AO221X0 p9617A (.Q(n_1456), 
	.E(n_1435), 
	.D(n_1499), 
	.C(\fsm_op2[5] ), 
	.B(n_1448), 
	.A(\fsm_op_aux_1[5] ));
   AN21X0 p9835A (.Q(n_1453), 
	.C(n_1433), 
	.B(n_1434), 
	.A(n_1448));
   AN221X0 p9738A (.Q(n_1451), 
	.E(n_1432), 
	.D(\fsm_op_aux_1[2] ), 
	.C(n_1448), 
	.B(n_1499), 
	.A(\fsm_op2[2] ));
   AO211X0 p7094A (.Q(fsm_alu_op2_o[5]), 
	.D(n_1429), 
	.C(n_1430), 
	.B(\fsm_op_aux_1[5] ), 
	.A(n_1431));
   AO211X0 p5396A (.Q(fsm_alu_op2_o[1]), 
	.D(n_1427), 
	.C(n_1428), 
	.B(n_1449), 
	.A(n_1431));
   AO211X0 p6068A (.Q(fsm_alu_op2_o[4]), 
	.D(n_1425), 
	.C(n_1426), 
	.B(\fsm_op_aux_1[4] ), 
	.A(n_1431));
   AO21X0 p11658A (.Q(fsm_sfr_addr_o[1]), 
	.C(n_1423), 
	.B(n_1029), 
	.A(n_1424));
   AO211X0 p5828A (.Q(fsm_alu_op2_o[3]), 
	.D(n_1421), 
	.C(n_1422), 
	.B(n_1434), 
	.A(n_1431));
   NA3X0 p16631A (.Q(fsm_sfr_data_o[7]), 
	.C(n_1418), 
	.B(n_1419), 
	.A(n_1420));
   AN21X0 p9565A (.Q(n_1466), 
	.C(n_1417), 
	.B(n_1170), 
	.A(n_1448));
   ON211X0 p13297A (.Q(fsm_ram_addr_o[2]), 
	.D(n_1414), 
	.C(n_1415), 
	.B(n_64), 
	.A(n_1416));
   AN221X0 p13301A (.Q(n_1489), 
	.E(n_1410), 
	.D(n_1411), 
	.C(n_1412), 
	.B(n_1413), 
	.A(n_1449));
   ON21X0 p11882A (.Q(n_1469), 
	.C(\fsm_op1[4] ), 
	.B(n_1408), 
	.A(n_1409));
   AO21X0 p12006A (.Q(fsm_sfr_addr_o[2]), 
	.C(n_1407), 
	.B(n_1316), 
	.A(n_1409));
   AN21X1 p0712D (.Q(n_1459), 
	.C(n_1405), 
	.B(\fsm_op2[0] ), 
	.A(n_1406));
   NA3X0 p12279A (.Q(fsm_sfr_addr_o[6]), 
	.C(n_1402), 
	.B(n_1403), 
	.A(n_1404));
   ON21X0 p1543A (.Q(fsm_pcau_offset_o[7]), 
	.C(n_1400), 
	.B(n_2124), 
	.A(n_1401));
   NA3X1 p0559D (.Q(fsm_pcau_offset_o[2]), 
	.C(n_1397), 
	.B(n_1398), 
	.A(n_1399));
   AO221X0 p16105A (.Q(fsm_sfr_data_o[2]), 
	.E(n_1394), 
	.D(\fsm_op2[2] ), 
	.C(n_1395), 
	.B(n_1396), 
	.A(\fsm_op_aux_1[2] ));
   AO221X0 p16101A (.Q(fsm_sfr_data_o[0]), 
	.E(n_1392), 
	.D(\fsm_op2[0] ), 
	.C(n_1395), 
	.B(n_1393), 
	.A(\fsm_op_aux_1[0] ));
   AO221X0 p16098A (.Q(fsm_sfr_data_o[3]), 
	.E(n_1390), 
	.D(\fsm_op2[3] ), 
	.C(n_1395), 
	.B(n_1391), 
	.A(n_1434));
   AO221X0 p16114A (.Q(fsm_sfr_data_o[1]), 
	.E(n_1388), 
	.D(\fsm_op2[1] ), 
	.C(n_1395), 
	.B(n_1389), 
	.A(n_1449));
   AO221X0 p0880D (.Q(fsm_pcau_offset_o[5]), 
	.E(n_1385), 
	.D(n_1386), 
	.C(\fsm_op2[5] ), 
	.B(n_1387), 
	.A(\fsm_op1[5] ));
   AO221X0 p0904D (.Q(fsm_pcau_offset_o[4]), 
	.E(n_1384), 
	.D(\fsm_op2[4] ), 
	.C(n_1386), 
	.B(n_1387), 
	.A(\fsm_op1[4] ));
   ON211X0 p0801D (.Q(fsm_pcau_offset_o[3]), 
	.D(n_1380), 
	.C(n_1381), 
	.B(n_1382), 
	.A(n_1383));
   NA3X0 p1697A (.Q(fsm_pcau_offset_o[6]), 
	.C(n_1377), 
	.B(n_1378), 
	.A(n_1379));
   AO222X0 p13020A (.Q(fsm_ram_addr_o[6]), 
	.F(n_1375), 
	.E(\fsm_op2[6] ), 
	.D(n_1481), 
	.C(\fsm_op1[6] ), 
	.B(n_1376), 
	.A(\fsm_op_aux_1[6] ));
   AO222X0 p13012A (.Q(fsm_ram_addr_o[5]), 
	.F(n_1375), 
	.E(\fsm_op2[5] ), 
	.D(n_1481), 
	.C(\fsm_op1[5] ), 
	.B(n_1376), 
	.A(\fsm_op_aux_1[5] ));
   AO22X0 p9258A (.Q(n_1498), 
	.D(\fsm_op_aux_2[4] ), 
	.C(n_1447), 
	.B(\fsm_op_aux_1[4] ), 
	.A(n_1448));
   ON22X0 p11294A (.Q(n_1492), 
	.D(n_774), 
	.C(n_1373), 
	.B(n_2124), 
	.A(n_1374));
   NA2I1X0 p15583A (.Q(n_1464), 
	.B(n_1372), 
	.AN(n_1391));
   ON31X0 p12318A (.Q(n_1404), 
	.D(\fsm_op1[6] ), 
	.C(n_1370), 
	.B(n_1491), 
	.A(n_1371));
   NA3X0 p6000A (.Q(n_1425), 
	.C(n_1367), 
	.B(n_1368), 
	.A(n_1369));
   AO221X0 p12648A (.Q(n_1477), 
	.E(n_1364), 
	.D(n_1365), 
	.C(\fsm_op2[6] ), 
	.B(n_1366), 
	.A(\fsm_op_aux_1[6] ));
   AO221X0 p12648A60491 (.Q(n_1476), 
	.E(n_1363), 
	.D(n_1365), 
	.C(\fsm_op2[5] ), 
	.B(n_1366), 
	.A(\fsm_op_aux_1[5] ));
   AO221X0 p12648A60492 (.Q(n_1475), 
	.E(n_1362), 
	.D(n_1365), 
	.C(\fsm_op2[4] ), 
	.B(n_1366), 
	.A(\fsm_op_aux_1[4] ));
   AO221X0 p12648A60493 (.Q(n_1474), 
	.E(n_1359), 
	.D(n_1360), 
	.C(\fsm_op1[3] ), 
	.B(n_1361), 
	.A(n_1434));
   AO221X0 p12648A60494 (.Q(n_1473), 
	.E(n_1358), 
	.D(n_1360), 
	.C(n_1316), 
	.B(n_1361), 
	.A(\fsm_op_aux_1[2] ));
   AO221X0 p12648A60495 (.Q(n_1472), 
	.E(n_1357), 
	.D(n_1360), 
	.C(n_1029), 
	.B(n_1361), 
	.A(n_1449));
   AO221X0 p12648A60496 (.Q(n_1471), 
	.E(n_1356), 
	.D(n_1360), 
	.C(n_1253), 
	.B(n_1361), 
	.A(\fsm_op_aux_1[0] ));
   ON211X0 p13327A (.Q(fsm_ram_addr_o[0]), 
	.D(n_1352), 
	.C(n_1353), 
	.B(n_1354), 
	.A(n_1355));
   AO211X1 p5244A (.Q(fsm_alu_op2_o[0]), 
	.D(n_1349), 
	.C(n_1350), 
	.B(\fsm_op_aux_1[0] ), 
	.A(n_1351));
   ON211X0 p7776A (.Q(n_1444), 
	.D(n_1345), 
	.C(n_1346), 
	.B(n_1347), 
	.A(n_1348));
   NA3X1 p0734D (.Q(n_1405), 
	.C(n_1342), 
	.B(n_1343), 
	.A(n_1344));
   AO221X0 p12648A60497 (.Q(n_1467), 
	.E(n_1341), 
	.D(n_1365), 
	.C(\fsm_op2[7] ), 
	.B(n_1366), 
	.A(n_1170));
   AO221X0 p7416D (.Q(fsm_alu_op2_o[7]), 
	.E(n_1338), 
	.D(n_520), 
	.C(n_1339), 
	.B(n_1340), 
	.A(\fsm_op2[7] ));
   ON31X0 p13351A (.Q(n_1414), 
	.D(n_1316), 
	.C(n_1335), 
	.B(n_1336), 
	.A(n_1337));
   AO21X0 p5580A (.Q(fsm_alu_op2_o[2]), 
	.C(n_1334), 
	.B(\fsm_op_aux_1[2] ), 
	.A(n_1431));
   ON211X0 p12058A (.Q(n_1446), 
	.D(n_1331), 
	.C(n_1332), 
	.B(n_41), 
	.A(n_1333));
   AN21X0 p1500A (.Q(n_1400), 
	.C(n_1330), 
	.B(\fsm_op2[7] ), 
	.A(n_1386));
   AN31X0 p12401A (.Q(n_1487), 
	.D(n_2124), 
	.C(n_1327), 
	.B(n_1328), 
	.A(n_1329));
   NO3X0 p11798A (.Q(n_1442), 
	.C(n_1371), 
	.B(n_1325), 
	.A(n_1326));
   AN21X0 p10023A (.Q(n_1483), 
	.C(n_1323), 
	.B(\fsm_op_aux_1[0] ), 
	.A(n_1324));
   ON221X0 p13208A (.Q(n_1410), 
	.E(n_1319), 
	.D(n_1320), 
	.C(n_1322), 
	.B(n_1321), 
	.A(n_1322));
   AO222X0 p8908A (.Q(n_1417), 
	.F(n_1447), 
	.E(\fsm_op_aux_2[7] ), 
	.D(n_1500), 
	.C(n_520), 
	.B(n_1499), 
	.A(\fsm_op2[7] ));
   AO222X0 p8874A (.Q(n_1436), 
	.F(n_1447), 
	.E(\fsm_op_aux_2[6] ), 
	.D(n_1500), 
	.C(\fsm_op1[6] ), 
	.B(n_1499), 
	.A(\fsm_op2[6] ));
   AO222X0 p9160A61689 (.Q(n_1433), 
	.F(n_1447), 
	.E(\fsm_op_aux_2[3] ), 
	.D(n_1500), 
	.C(\fsm_op1[3] ), 
	.B(n_1499), 
	.A(\fsm_op2[3] ));
   AN222X0 p9731A (.Q(n_1485), 
	.F(\fsm_op2[0] ), 
	.E(n_1499), 
	.D(n_1447), 
	.C(\fsm_op_aux_2[0] ), 
	.B(n_1500), 
	.A(n_1253));
   NA2X0 p1696A (.Q(n_1378), 
	.B(\fsm_op1[6] ), 
	.A(n_1387));
   NA2X0 p1691A (.Q(n_1379), 
	.B(\fsm_op2[6] ), 
	.A(n_1386));
   NA2X0 p0801D60498 (.Q(n_1381), 
	.B(\fsm_op1[3] ), 
	.A(n_1387));
   NA2X0 p0560D (.Q(n_1399), 
	.B(\fsm_op2[2] ), 
	.A(n_1318));
   OR2X0 p15171A (.Q(n_1391), 
	.B(n_1408), 
	.A(n_1317));
   NA2X0 p0619D (.Q(n_1398), 
	.B(n_1316), 
	.A(n_1387));
   ON21X0 p13850A (.Q(fsm_ram_addr_o[7]), 
	.C(n_1314), 
	.B(n_2124), 
	.A(n_1315));
   OR2X0 p8877A (.Q(n_1448), 
	.B(n_1313), 
	.A(n_1324));
   ON211X0 p5610A (.Q(n_1422), 
	.D(n_1310), 
	.C(n_1311), 
	.B(n_1312), 
	.A(n_1348));
   ON211X0 p5175A (.Q(n_1428), 
	.D(n_1310), 
	.C(n_1308), 
	.B(n_1309), 
	.A(n_1348));
   AO211X0 p5235A (.Q(n_1421), 
	.D(n_1306), 
	.C(n_1307), 
	.B(\fsm_op2[3] ), 
	.A(n_1340));
   AO211X0 p4803A (.Q(n_1427), 
	.D(n_1305), 
	.C(n_1307), 
	.B(\fsm_op2[1] ), 
	.A(n_1340));
   NA6X0 p11481A (.Q(fsm_rom_rd_o_b), 
	.F(n_1299), 
	.E(n_1300), 
	.D(n_1301), 
	.C(n_1302), 
	.B(n_1303), 
	.A(n_1304));
   NA6X0 p11419A (.Q(n_1490), 
	.F(n_1293), 
	.E(n_1294), 
	.D(n_1295), 
	.C(n_1296), 
	.B(n_1297), 
	.A(n_1298));
   OR3X0 p12495A (.Q(n_1481), 
	.C(n_1291), 
	.B(n_1292), 
	.A(n_1335));
   AN211X0 p12480A (.Q(n_1403), 
	.D(n_1288), 
	.C(n_1289), 
	.B(\fsm_op_aux_1[6] ), 
	.A(n_1290));
   NO2X1 p0775A (.Q(n_1344), 
	.B(n_1286), 
	.A(n_1287));
   ON321X0 p11544A (.Q(n_1424), 
	.F(n_1333), 
	.E(n_1282), 
	.D(n_2124), 
	.C(n_1283), 
	.B(n_1284), 
	.A(n_1285));
   AO221X0 p15446A (.Q(n_1389), 
	.E(n_1317), 
	.D(n_1278), 
	.C(n_1279), 
	.B(n_1280), 
	.A(n_1281));
   AO321X0 p15156A (.Q(n_1393), 
	.F(n_1317), 
	.E(n_1278), 
	.D(n_1276), 
	.C(n_1280), 
	.B(n_41), 
	.A(n_1277));
   ON21X0 p13591A (.Q(n_1488), 
	.C(n_1029), 
	.B(n_1291), 
	.A(n_1336));
   AN211X0 p7606A (.Q(n_1345), 
	.D(n_1275), 
	.C(n_1307), 
	.B(\fsm_op2[6] ), 
	.A(n_1340));
   NA3X0 p6962A (.Q(n_1429), 
	.C(n_1273), 
	.B(n_1274), 
	.A(n_1369));
   AND6X0 p11870A (.Q(n_1441), 
	.F(n_1268), 
	.E(n_1269), 
	.D(n_1270), 
	.C(n_1271), 
	.B(n_1272), 
	.A(n_1402));
   ON311X0 p5109A (.Q(n_1349), 
	.E(n_1265), 
	.D(n_1266), 
	.C(n_1267), 
	.B(n_1170), 
	.A(n_473));
   NA2X1 p0546D (.Q(n_1438), 
	.B(n_1029), 
	.A(n_1264));
   AO221X0 p15438A (.Q(n_1396), 
	.E(n_1317), 
	.D(n_1278), 
	.C(n_1262), 
	.B(n_1280), 
	.A(n_1263));
   OA31X0 p11091A (.Q(n_1374), 
	.D(n_1327), 
	.C(n_1260), 
	.B(n_2041), 
	.A(n_1261));
   AN21X0 p11865A (.Q(n_1409), 
	.C(n_2124), 
	.B(n_1282), 
	.A(n_1259));
   NA3X0 p13439A (.Q(fsm_sfr_wr_o_b), 
	.C(n_1256), 
	.B(n_1257), 
	.A(n_1258));
   ON31X0 p13410A (.Q(n_1352), 
	.D(n_1253), 
	.C(n_1337), 
	.B(n_1254), 
	.A(n_1255));
   ON211X0 p7225A (.Q(n_1338), 
	.D(n_1249), 
	.C(n_1250), 
	.B(n_1251), 
	.A(n_1252));
   OR6X0 p4190A (.Q(fsm_pcau_en_o), 
	.F(n_1244), 
	.E(n_1406), 
	.D(n_1245), 
	.C(n_1246), 
	.B(n_1247), 
	.A(n_1248));
   ON211X0 p5463A (.Q(n_1334), 
	.D(n_1241), 
	.C(n_1242), 
	.B(n_1243), 
	.A(n_1348));
   AN222X0 p16226A (.Q(n_1419), 
	.F(n_1170), 
	.E(n_1238), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[7] ), 
	.B(n_1240), 
	.A(\fsm_op2[7] ));
   AN221X0 p16013A (.Q(n_1420), 
	.E(n_1236), 
	.D(n_520), 
	.C(n_1463), 
	.B(n_1237), 
	.A(n_1170));
   AO221X0 p15519A (.Q(n_1390), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[3] ), 
	.B(n_1463), 
	.A(\fsm_op1[3] ));
   AO221X0 p15504A (.Q(n_1394), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[2] ), 
	.B(n_1463), 
	.A(n_1316));
   AO221X0 p15513A (.Q(n_1388), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[1] ), 
	.B(n_1463), 
	.A(n_1029));
   AO221X0 p15500A (.Q(n_1392), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[0] ), 
	.B(n_1463), 
	.A(n_1253));
   AO22X0 p9234A (.Q(n_1435), 
	.D(\fsm_op_aux_2[5] ), 
	.C(n_1447), 
	.B(\fsm_op1[5] ), 
	.A(n_1500));
   AO22X0 p9394A (.Q(n_1432), 
	.D(\fsm_op_aux_2[2] ), 
	.C(n_1447), 
	.B(n_1316), 
	.A(n_1500));
   ON211X0 p6957A (.Q(n_1430), 
	.D(n_1233), 
	.C(n_1234), 
	.B(n_106), 
	.A(n_1348));
   NA2X1 p0550D (.Q(n_1264), 
	.B(n_1231), 
	.A(n_1232));
   NA2X1 p0807D (.Q(n_1458), 
	.B(n_1253), 
	.A(n_1246));
   NO2X0 p12158A (.Q(n_1370), 
	.B(n_2124), 
	.A(n_1259));
   ON211X0 p11652A (.Q(n_1326), 
	.D(n_1333), 
	.C(n_1228), 
	.B(n_1229), 
	.A(n_1230));
   NA2X0 p8823A (.Q(n_1324), 
	.B(n_1226), 
	.A(n_1227));
   AO221X0 p4997A (.Q(fsm_pcau_msb_o[6]), 
	.E(n_1223), 
	.D(n_1224), 
	.C(\fsm_op2[6] ), 
	.B(n_1225), 
	.A(\fsm_op_aux_1[6] ));
   AO221X0 p4997A60499 (.Q(fsm_pcau_msb_o[5]), 
	.E(n_1222), 
	.D(n_1224), 
	.C(\fsm_op2[5] ), 
	.B(n_1225), 
	.A(\fsm_op_aux_1[5] ));
   AO221X0 p4997A60500 (.Q(fsm_pcau_msb_o[4]), 
	.E(n_1221), 
	.D(n_1224), 
	.C(\fsm_op2[4] ), 
	.B(n_1225), 
	.A(\fsm_op_aux_1[4] ));
   AO221X0 p5015A (.Q(fsm_pcau_msb_o[3]), 
	.E(n_1220), 
	.D(n_1224), 
	.C(\fsm_op2[3] ), 
	.B(n_1225), 
	.A(n_1434));
   NA2X1 p0764A (.Q(n_1287), 
	.B(n_1218), 
	.A(n_1219));
   AN211X0 p11411A (.Q(n_1298), 
	.D(n_1216), 
	.C(n_1217), 
	.B(\fsm_op_aux_1[5] ), 
	.A(n_1290));
   NA3X0 p12090D (.Q(fsm_alu_opcode_o[0]), 
	.C(n_1213), 
	.B(n_1214), 
	.A(n_1215));
   ON211X0 p14959A (.Q(n_1317), 
	.D(n_1210), 
	.C(n_1211), 
	.B(n_2124), 
	.A(n_1212));
   ON211X0 p11810A (.Q(fsm_alu_opcode_o[1]), 
	.D(n_1206), 
	.C(n_1207), 
	.B(n_1208), 
	.A(n_1209));
   NA3I1X0 p11785A (.Q(fsm_alu_en_o), 
	.C(n_1205), 
	.B(n_1213), 
	.AN(n_1204));
   AO211X0 p12385A (.Q(fsm_sfr_rd_o_b), 
	.D(n_1201), 
	.C(n_1202), 
	.B(n_120), 
	.A(n_1203));
   ON321X0 p12436A (.Q(n_1366), 
	.F(n_1197), 
	.E(n_1198), 
	.D(n_1199), 
	.C(n_520), 
	.B(n_2217), 
	.A(n_1200));
   ON211X0 p12290A (.Q(n_1361), 
	.D(n_1197), 
	.C(n_1195), 
	.B(n_1198), 
	.A(n_1196));
   NA2X0 p0765DT (.Q(n_1386), 
	.B(n_1193), 
	.A(n_1194));
   NO2X0 p0831D (.Q(n_1383), 
	.B(n_1191), 
	.A(n_1192));
   NA2X0 p0566D (.Q(n_1318), 
	.B(n_1190), 
	.A(n_1194));
   NO2I1X1 p0586D (.Q(n_1440), 
	.B(n_1192), 
	.AN(n_1189));
   AO221X0 p5273A (.Q(fsm_pcau_msb_o[2]), 
	.E(n_1188), 
	.D(\fsm_op_aux_1_2[2] ), 
	.C(n_565), 
	.B(n_1225), 
	.A(\fsm_op_aux_1[2] ));
   AN321X0 p12887A (.Q(n_1319), 
	.F(n_1186), 
	.E(n_1375), 
	.D(\fsm_op2[1] ), 
	.C(n_1187), 
	.B(n_36), 
	.A(n_490));
   AN21X0 p5897A (.Q(n_1368), 
	.C(n_1307), 
	.B(\fsm_op2[4] ), 
	.A(n_1340));
   INX0 Fp0579D (.Q(n_1401), 
	.A(n_1387));
   NA2X1 p0578D (.Q(n_1387), 
	.B(n_1185), 
	.A(n_1232));
   AN21X0 p5507A (.Q(n_1242), 
	.C(n_1184), 
	.B(\fsm_op2[2] ), 
	.A(n_1340));
   ON211X0 p11655A (.Q(n_1325), 
	.D(n_1180), 
	.C(n_1181), 
	.B(n_1182), 
	.A(n_1183));
   AN211X0 p11118A (.Q(n_1327), 
	.D(n_1177), 
	.C(n_1178), 
	.B(n_977), 
	.A(n_1179));
   AN221X0 p6862A (.Q(n_1249), 
	.E(n_1175), 
	.D(n_1170), 
	.C(n_1431), 
	.B(n_1176), 
	.A(n_1251));
   AN211X0 p11964A (.Q(n_1331), 
	.D(n_1173), 
	.C(n_1174), 
	.B(n_1276), 
	.A(n_1280));
   AO221X0 p4802A (.Q(fsm_pcau_msb_o[1]), 
	.E(n_1172), 
	.D(n_1224), 
	.C(\fsm_op2[1] ), 
	.B(n_1225), 
	.A(n_1449));
   AO221X0 p4501A (.Q(fsm_pcau_msb_o[0]), 
	.E(n_1171), 
	.D(n_1224), 
	.C(\fsm_op2[0] ), 
	.B(n_1225), 
	.A(\fsm_op_aux_1[0] ));
   AO221X0 p4600A (.Q(fsm_pcau_msb_o[7]), 
	.E(n_1169), 
	.D(n_1224), 
	.C(\fsm_op2[7] ), 
	.B(n_1225), 
	.A(n_1170));
   ON211X0 p6161A (.Q(n_1426), 
	.D(n_1166), 
	.C(n_1167), 
	.B(n_1168), 
	.A(n_1348));
   AN221X0 p13401A (.Q(n_1353), 
	.E(n_1164), 
	.D(\fsm_op_aux_1[0] ), 
	.C(n_1376), 
	.B(n_1165), 
	.A(n_1253));
   AO221X0 p15496A (.Q(n_1461), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[6] ), 
	.B(n_1163), 
	.A(\fsm_op2[6] ));
   AO221X0 p15512A (.Q(n_1462), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[5] ), 
	.B(n_1163), 
	.A(\fsm_op2[5] ));
   AO221X0 p15499A (.Q(n_1460), 
	.E(n_1235), 
	.D(n_1239), 
	.C(\fsm_op_aux_2[4] ), 
	.B(n_1163), 
	.A(\fsm_op2[4] ));
   AO222X0 p7453A (.Q(n_1443), 
	.F(n_1161), 
	.E(\fsm_op_aux_2[6] ), 
	.D(n_1162), 
	.C(n_1347), 
	.B(n_1431), 
	.A(\fsm_op_aux_1[6] ));
   AN211X0 p4695D (.Q(n_1265), 
	.D(n_1158), 
	.C(n_1159), 
	.B(n_1170), 
	.A(n_1160));
   NA2I1X0 p15884A (.Q(n_1395), 
	.B(n_1372), 
	.AN(n_1163));
   NA2X0 p6996A (.Q(n_1273), 
	.B(\fsm_op2[5] ), 
	.A(n_1340));
   NO2X0 p11768A (.Q(n_1259), 
	.B(n_1157), 
	.A(n_1177));
   NO2X0 p13852A (.Q(n_1315), 
	.B(n_2045), 
	.A(n_1255));
   NA3X0 p15063A (.Q(n_1463), 
	.C(n_1154), 
	.B(n_1155), 
	.A(n_1156));
   NO3X1 p0555DT (.Q(n_1194), 
	.C(n_1151), 
	.B(n_1152), 
	.A(n_1153));
   NA3X1 p0721D (.Q(n_1192), 
	.C(n_1149), 
	.B(n_958), 
	.A(n_1150));
   AN211X0 p11454A (.Q(n_1180), 
	.D(n_1145), 
	.C(n_1146), 
	.B(n_1147), 
	.A(n_1148));
   NA3X0 p5602A (.Q(n_1350), 
	.C(n_1142), 
	.B(n_1143), 
	.A(n_1144));
   OR3X0 p4555A (.Q(fsm_pcau_direct_o), 
	.C(n_1140), 
	.B(n_1141), 
	.A(n_1225));
   AN211X0 p12220A (.Q(n_1197), 
	.D(n_1137), 
	.C(n_1138), 
	.B(n_2124), 
	.A(n_1139));
   AO311X0 p12114A (.Q(n_1289), 
	.E(n_1135), 
	.D(n_1235), 
	.C(n_1147), 
	.B(n_1136), 
	.A(\fsm_op2[6] ));
   NA3I1X0 p12399A (.Q(n_1288), 
	.C(n_998), 
	.B(n_1296), 
	.AN(n_1134));
   ON311X0 p16151A (.Q(n_1238), 
	.E(n_1211), 
	.D(n_1131), 
	.C(n_1132), 
	.B(n_1133), 
	.A(n_64));
   AN31X0 p5679A (.Q(n_1369), 
	.D(n_1275), 
	.C(n_1128), 
	.B(n_1129), 
	.A(n_1130));
   NO3I1X0 p13181A (.Q(n_1258), 
	.C(n_1126), 
	.B(n_1127), 
	.AN(n_1125));
   AN222X0 p6620A (.Q(n_1233), 
	.F(n_1121), 
	.E(n_1122), 
	.D(n_1123), 
	.C(n_1124), 
	.B(n_1339), 
	.A(\fsm_op1[5] ));
   NO2I1X2 p0547D (.Q(n_1232), 
	.B(n_1120), 
	.AN(n_1119));
   ON211X0 p8602A (.Q(n_1500), 
	.D(n_1115), 
	.C(n_1116), 
	.B(n_1117), 
	.A(n_1118));
   ON211X0 p11910A (.Q(n_1173), 
	.D(n_1272), 
	.C(n_1112), 
	.B(n_1113), 
	.A(n_1114));
   ON21X1 p0725D (.Q(n_1406), 
	.C(n_1109), 
	.B(n_1110), 
	.A(n_1111));
   ON311X0 p12293A (.Q(n_1335), 
	.E(n_1104), 
	.D(n_1105), 
	.C(n_1106), 
	.B(n_1107), 
	.A(n_1108));
   ON31X0 p10059A (.Q(n_1323), 
	.D(n_1100), 
	.C(n_1101), 
	.B(n_1102), 
	.A(n_1103));
   AN221X0 p11087A (.Q(n_1304), 
	.E(n_1097), 
	.D(n_359), 
	.C(n_1098), 
	.B(n_1099), 
	.A(n_93));
   OA21X0 p4968A (.Q(n_1310), 
	.C(n_1095), 
	.B(n_44), 
	.A(n_1096));
   AO221X0 p4828A (.Q(n_1184), 
	.E(n_1092), 
	.D(n_1123), 
	.C(n_1093), 
	.B(n_1094), 
	.A(n_1243));
   NA3X0 p12203A (.Q(n_1407), 
	.C(n_1090), 
	.B(n_998), 
	.A(n_1091));
   AO221X0 p11942A (.Q(n_1292), 
	.E(n_1255), 
	.D(n_1086), 
	.C(n_1087), 
	.B(n_1088), 
	.A(n_1089));
   ON211X0 p13194A (.Q(n_1336), 
	.D(n_1082), 
	.C(n_1083), 
	.B(n_1084), 
	.A(n_1085));
   AN31X0 p12348A (.Q(n_1445), 
	.D(n_1078), 
	.C(n_1079), 
	.B(n_1080), 
	.A(n_1081));
   AN21X0 p11534A (.Q(n_1402), 
	.C(n_1216), 
	.B(n_1076), 
	.A(n_1077));
   NA3X0 p12254A (.Q(n_1201), 
	.C(n_1073), 
	.B(n_1074), 
	.A(n_1075));
   ON311X0 p13161A (.Q(n_1482), 
	.E(n_1355), 
	.D(n_1071), 
	.C(n_1072), 
	.B(n_2040), 
	.A(n_2122));
   AN221X0 p16043A (.Q(n_1418), 
	.E(n_1235), 
	.D(n_1170), 
	.C(n_1069), 
	.B(n_1070), 
	.A(\fsm_op2[7] ));
   AO211X0 p12766A (.Q(fsm_bit_byte_flag_o), 
	.D(n_1067), 
	.C(n_1157), 
	.B(n_1068), 
	.A(n_1089));
   AN21X0 p13717A (.Q(n_1416), 
	.C(n_1066), 
	.B(n_84), 
	.A(n_1412));
   NA3X1 p0770A (.Q(n_1286), 
	.C(n_1063), 
	.B(n_1064), 
	.A(n_1065));
   AN21X0 p12498A (.Q(n_1468), 
	.C(n_1062), 
	.B(\fsm_op_aux_1[4] ), 
	.A(n_862));
   AN211X0 p8521A (.Q(n_1227), 
	.D(n_1058), 
	.C(n_1059), 
	.B(n_1060), 
	.A(n_1061));
   NA3I1X0 p11879A (.Q(n_1423), 
	.C(n_1056), 
	.B(n_1057), 
	.AN(n_1055));
   AN21X1 p0811A (.Q(n_1219), 
	.C(n_1053), 
	.B(n_1253), 
	.A(n_1054));
   AO221X0 p12726A (.Q(n_1337), 
	.E(n_1050), 
	.D(n_544), 
	.C(n_1087), 
	.B(n_1051), 
	.A(n_1052));
   ON311X0 p12751A (.Q(n_1186), 
	.E(n_1047), 
	.D(n_1048), 
	.C(n_1049), 
	.B(n_473), 
	.A(n_34));
   NA6I3X0 p3832A (.Q(n_1247), 
	.F(n_1063), 
	.E(n_1045), 
	.D(n_1046), 
	.CN(n_1042), 
	.BN(n_1043), 
	.AN(n_1044));
   AN221X0 p9821A (.Q(n_1484), 
	.E(n_1038), 
	.D(\fsm_op_aux_1[0] ), 
	.C(n_1039), 
	.B(n_1040), 
	.A(n_1041));
   AN222X0 p7654A (.Q(n_1346), 
	.F(n_1036), 
	.E(n_1128), 
	.D(n_1122), 
	.C(n_1037), 
	.B(n_1339), 
	.A(\fsm_op1[6] ));
   AO22X0 p12980A (.Q(n_1359), 
	.D(\fsm_op_aux_2[3] ), 
	.C(n_1034), 
	.B(\fsm_op2[3] ), 
	.A(n_1035));
   AO22X0 p12980A60501 (.Q(n_1358), 
	.D(\fsm_op_aux_2[2] ), 
	.C(n_1034), 
	.B(\fsm_op2[2] ), 
	.A(n_1035));
   AO22X0 p12980A60502 (.Q(n_1357), 
	.D(\fsm_op_aux_2[1] ), 
	.C(n_1034), 
	.B(\fsm_op2[1] ), 
	.A(n_1035));
   AO22X0 p12980A60503 (.Q(n_1356), 
	.D(\fsm_op_aux_2[0] ), 
	.C(n_1034), 
	.B(\fsm_op2[0] ), 
	.A(n_1035));
   NA2X1 p0801A (.Q(n_1246), 
	.B(n_1032), 
	.A(n_1033));
   AO22X0 p13083A (.Q(n_1480), 
	.D(\fsm_op2[4] ), 
	.C(n_1375), 
	.B(\fsm_op_aux_1[4] ), 
	.A(n_1376));
   AO22X0 p13080A (.Q(n_1470), 
	.D(\fsm_op2[3] ), 
	.C(n_1375), 
	.B(n_1434), 
	.A(n_1376));
   AN222X0 p13461A (.Q(n_1415), 
	.F(\fsm_op_aux_1[2] ), 
	.E(n_1376), 
	.D(n_1375), 
	.C(\fsm_op2[2] ), 
	.B(n_1088), 
	.A(n_1262));
   AN222X0 p5806A (.Q(n_1367), 
	.F(\fsm_op_aux_2[4] ), 
	.E(n_1161), 
	.D(n_1031), 
	.C(n_1122), 
	.B(n_1339), 
	.A(\fsm_op1[4] ));
   AO222X0 p4630A (.Q(n_1306), 
	.F(n_1122), 
	.E(n_1030), 
	.D(n_1339), 
	.C(\fsm_op1[3] ), 
	.B(n_1161), 
	.A(\fsm_op_aux_2[3] ));
   AO222X0 p4197A (.Q(n_1305), 
	.F(n_1122), 
	.E(n_1028), 
	.D(n_1339), 
	.C(n_1029), 
	.B(n_1161), 
	.A(\fsm_op_aux_2[1] ));
   OA222X0 p11169A (.Q(n_1303), 
	.F(n_1024), 
	.E(n_1025), 
	.D(n_1026), 
	.C(n_1354), 
	.B(n_1027), 
	.A(n_1110));
   OA32X0 p11408A (.Q(n_1333), 
	.E(n_1022), 
	.D(n_2124), 
	.C(n_1023), 
	.B(n_1284), 
	.A(n_1133));
   NO2I1X0 p11278A (.Q(n_1282), 
	.B(n_1021), 
	.AN(n_1079));
   NA2X0 p0804A (.Q(n_1033), 
	.B(n_1019), 
	.A(n_1020));
   OR3X0 p15021A (.Q(n_1163), 
	.C(n_1070), 
	.B(n_1240), 
	.A(n_1018));
   NA2X0 p12275A (.Q(fsm_alu_opcode_o[3]), 
	.B(n_1016), 
	.A(n_1017));
   ON211X0 p12586A (.Q(n_1067), 
	.D(n_1012), 
	.C(n_1013), 
	.B(n_1014), 
	.A(n_1015));
   NA3X0 p9360A (.Q(n_1447), 
	.C(n_1009), 
	.B(n_1010), 
	.A(n_1011));
   NO2X1 p0794A (.Q(n_1065), 
	.B(n_1008), 
	.A(n_1244));
   OR3X0 p10341A (.Q(fsm_ram_rd_o_b), 
	.C(n_1005), 
	.B(n_1006), 
	.A(n_1007));
   AO221X0 p4697A (.Q(n_1223), 
	.E(n_1004), 
	.D(\fsm_op_aux_1_2[6] ), 
	.C(n_565), 
	.B(n_1152), 
	.A(\fsm_op1[6] ));
   AO221X0 p4697A60504 (.Q(n_1222), 
	.E(n_1003), 
	.D(\fsm_op_aux_1_2[5] ), 
	.C(n_565), 
	.B(n_1152), 
	.A(\fsm_op1[5] ));
   AO221X0 p4697A60505 (.Q(n_1221), 
	.E(n_1002), 
	.D(\fsm_op_aux_1_2[4] ), 
	.C(n_565), 
	.B(n_1152), 
	.A(\fsm_op1[4] ));
   AO221X0 p4697A60506 (.Q(n_1220), 
	.E(n_1001), 
	.D(\fsm_op_aux_1_2[3] ), 
	.C(n_565), 
	.B(n_1152), 
	.A(\fsm_op1[3] ));
   NA3X0 p12504A (.Q(n_1062), 
	.C(n_998), 
	.B(n_999), 
	.A(n_1000));
   AND6X1 p0806A (.Q(n_1343), 
	.F(n_993), 
	.E(n_994), 
	.D(n_995), 
	.C(n_996), 
	.B(n_1045), 
	.A(n_997));
   NO3X0 p8576A (.Q(n_1116), 
	.C(n_990), 
	.B(n_991), 
	.A(n_992));
   AN321X0 p4994A (.Q(n_1308), 
	.F(n_989), 
	.E(n_1123), 
	.D(n_1030), 
	.C(n_1128), 
	.B(\fsm_op2[3] ), 
	.A(n_1312));
   ON211X0 p15392A (.Q(n_2046), 
	.D(n_985), 
	.C(n_986), 
	.B(n_987), 
	.A(n_988));
   NO3I1X0 p11987A (.Q(n_1075), 
	.C(n_983), 
	.B(n_984), 
	.AN(n_982));
   INX0 Fp13137A (.Q(n_1066), 
	.A(n_1355));
   OA21X0 p12792A (.Q(n_1355), 
	.C(n_980), 
	.B(n_1117), 
	.A(n_981));
   AN321X0 p5429A (.Q(n_1311), 
	.F(n_979), 
	.E(n_1123), 
	.D(n_1028), 
	.C(n_1128), 
	.B(\fsm_op2[1] ), 
	.A(n_1309));
   AN211X0 p14771A (.Q(n_1210), 
	.D(n_975), 
	.C(n_976), 
	.B(n_977), 
	.A(n_978));
   ON211X0 p10790D (.Q(fsm_ram_wr_o_b), 
	.D(n_972), 
	.C(n_973), 
	.B(n_974), 
	.A(n_1089));
   AN211X0 p11844D (.Q(n_1215), 
	.D(n_968), 
	.C(n_969), 
	.B(n_970), 
	.A(n_971));
   NA3X0 p0767A (.Q(n_1053), 
	.C(n_965), 
	.B(n_966), 
	.A(n_967));
   NO3I1X0 p11793A (.Q(n_1270), 
	.C(n_964), 
	.B(n_1290), 
	.AN(n_963));
   ON211X0 p11692A (.Q(n_1204), 
	.D(n_960), 
	.C(n_961), 
	.B(n_2126), 
	.A(n_962));
   AO21X0 p12213A (.Q(n_1291), 
	.C(n_1050), 
	.B(n_1087), 
	.A(n_959));
   ON21X0 p4559A (.Q(n_1169), 
	.C(n_957), 
	.B(n_2124), 
	.A(n_958));
   ON21X0 p5212A (.Q(n_1188), 
	.C(n_956), 
	.B(n_377), 
	.A(n_1231));
   ON21X0 p4746A (.Q(n_1172), 
	.C(n_955), 
	.B(n_111), 
	.A(n_958));
   ON21X0 p4447A (.Q(n_1171), 
	.C(n_954), 
	.B(n_41), 
	.A(n_958));
   ON211X0 p12050A (.Q(n_1135), 
	.D(n_1294), 
	.C(n_951), 
	.B(n_952), 
	.A(n_953));
   AN21X0 p5251A (.Q(n_1348), 
	.C(n_820), 
	.B(n_2118), 
	.A(n_950));
   NA2X0 p5658A (.Q(n_1275), 
	.B(n_1095), 
	.A(n_949));
   AN321X0 p6855A (.Q(n_1274), 
	.F(n_1307), 
	.E(n_1094), 
	.D(n_106), 
	.C(n_1128), 
	.B(\fsm_op2[4] ), 
	.A(n_1168));
   ON221X0 p4841A (.Q(n_1159), 
	.E(n_946), 
	.D(n_947), 
	.C(n_37), 
	.B(n_948), 
	.A(n_1285));
   NO3X0 p12079A (.Q(n_1206), 
	.C(n_943), 
	.B(n_944), 
	.A(n_945));
   NA3X0 p4654A61690 (.Q(n_1340), 
	.C(n_940), 
	.B(n_941), 
	.A(n_942));
   AO21X0 p13236A (.Q(n_1164), 
	.C(n_939), 
	.B(n_1276), 
	.A(n_1088));
   ON21X0 p11800A (.Q(n_1255), 
	.C(n_937), 
	.B(n_938), 
	.A(n_1085));
   ON321X0 p10842A (.Q(n_1097), 
	.F(n_932), 
	.E(n_933), 
	.D(n_934), 
	.C(n_935), 
	.B(n_401), 
	.A(n_936));
   INX0 Fp12291A (.Q(n_1254), 
	.A(n_1104));
   AN21X0 p12174A (.Q(n_1104), 
	.C(n_1137), 
	.B(n_2124), 
	.A(n_1178));
   ON221X0 p8576A60507 (.Q(n_1058), 
	.E(n_929), 
	.D(n_1118), 
	.C(n_930), 
	.B(n_931), 
	.A(n_2122));
   NA3X0 p11276A (.Q(n_1216), 
	.C(n_1372), 
	.B(n_927), 
	.A(n_928));
   NA3X0 p4113A (.Q(n_1248), 
	.C(n_997), 
	.B(n_925), 
	.A(n_926));
   ON21X0 p12855A (.Q(n_1365), 
	.C(n_924), 
	.B(n_211), 
	.A(n_1195));
   NO2X0 p11779A (.Q(n_1207), 
	.B(n_922), 
	.A(n_923));
   ON21X0 p11016A (.Q(n_1177), 
	.C(n_1022), 
	.B(n_1014), 
	.A(n_1023));
   ON211X0 p16131A (.Q(n_1236), 
	.D(n_919), 
	.C(n_920), 
	.B(n_2125), 
	.A(n_921));
   AN321X0 p9712A (.Q(n_1100), 
	.F(n_915), 
	.E(n_916), 
	.D(n_917), 
	.C(n_1040), 
	.B(n_111), 
	.A(n_918));
   AO321X0 p6035A (.Q(n_1175), 
	.F(n_913), 
	.E(n_914), 
	.D(\fsm_op_aux_2[7] ), 
	.C(n_449), 
	.B(n_2124), 
	.A(n_804));
   AN221X0 p7268A (.Q(n_1252), 
	.E(n_943), 
	.D(\fsm_op2[7] ), 
	.C(n_1122), 
	.B(n_1128), 
	.A(n_71));
   AO211X0 p4071A (.Q(n_1092), 
	.D(n_911), 
	.C(n_912), 
	.B(n_1316), 
	.A(n_1339));
   AN211X0 p14854A (.Q(n_1211), 
	.D(n_908), 
	.C(n_909), 
	.B(n_2042), 
	.A(n_910));
   AN221X0 p12164A (.Q(n_1091), 
	.E(n_906), 
	.D(\fsm_op_aux_1[2] ), 
	.C(n_862), 
	.B(n_907), 
	.A(\fsm_op2[2] ));
   AO22X0 p13186A (.Q(n_1341), 
	.D(n_520), 
	.C(n_1360), 
	.B(\fsm_op_aux_2[7] ), 
	.A(n_1034));
   AO22X0 p13186A60508 (.Q(n_1364), 
	.D(\fsm_op1[6] ), 
	.C(n_1360), 
	.B(\fsm_op_aux_2[6] ), 
	.A(n_1034));
   AO22X0 p13186A60509 (.Q(n_1363), 
	.D(\fsm_op1[5] ), 
	.C(n_1360), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_1034));
   AO22X0 p13186A60510 (.Q(n_1362), 
	.D(\fsm_op1[4] ), 
	.C(n_1360), 
	.B(\fsm_op_aux_2[4] ), 
	.A(n_1034));
   NA2X1 p0547D60511 (.Q(n_1120), 
	.B(n_904), 
	.A(n_905));
   ON321X0 p11227A (.Q(n_1217), 
	.F(n_951), 
	.E(n_899), 
	.D(n_900), 
	.C(n_901), 
	.B(DFT_sdo_4), 
	.A(n_903));
   AN222X0 p5147A (.Q(n_1241), 
	.F(n_1122), 
	.E(n_897), 
	.D(n_898), 
	.C(n_1128), 
	.B(n_1161), 
	.A(\fsm_op_aux_2[2] ));
   OA221X0 p5524A (.Q(n_1266), 
	.E(n_892), 
	.D(n_893), 
	.C(n_894), 
	.B(n_895), 
	.A(n_896));
   AN211X0 p5421A (.Q(n_1144), 
	.D(n_890), 
	.C(n_912), 
	.B(\fsm_op2[0] ), 
	.A(n_891));
   NO2X0 p15311A (.Q(n_1212), 
	.B(n_1157), 
	.A(n_1021));
   NA2X0 p0552D (.Q(n_905), 
	.B(n_888), 
	.A(n_889));
   AN211X0 p13216A (.Q(n_1082), 
	.D(n_886), 
	.C(n_887), 
	.B(n_2014), 
	.A(n_882));
   NA2X0 p7160A (.Q(n_1234), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_1161));
   AO211X0 p11809A (.Q(fsm_alu_opcode_o[2]), 
	.D(n_883), 
	.C(n_884), 
	.B(n_1060), 
	.A(n_885));
   OR2X0 p12311A (.Q(n_1051), 
	.B(n_882), 
	.A(n_959));
   NA2X0 p9105A (.Q(n_1499), 
	.B(n_880), 
	.A(n_881));
   AND2X0 p11108A (.Q(n_1079), 
	.B(n_879), 
	.A(n_1328));
   NA2X0 p11701A (.Q(n_1491), 
	.B(n_878), 
	.A(n_1181));
   NA2X0 p16154A (.Q(n_1069), 
	.B(n_1269), 
	.A(n_878));
   NA2X0 p12787A (.Q(n_1376), 
	.B(n_876), 
	.A(n_877));
   NA3X0 p11561A (.Q(n_1145), 
	.C(n_873), 
	.B(n_874), 
	.A(n_875));
   AO21X0 p7216A (.Q(n_1162), 
	.C(n_1094), 
	.B(n_872), 
	.A(n_1123));
   ON321X0 p4599A (.Q(n_1158), 
	.F(n_867), 
	.E(n_1102), 
	.D(n_868), 
	.C(n_869), 
	.B(n_870), 
	.A(n_871));
   AN211X0 p12004A (.Q(n_1214), 
	.D(n_863), 
	.C(n_864), 
	.B(n_865), 
	.A(n_866));
   AN211X0 p11734AT (.Q(n_1057), 
	.D(n_860), 
	.C(n_861), 
	.B(n_1449), 
	.A(n_862));
   ON211X0 p8433A (.Q(n_992), 
	.D(n_857), 
	.C(n_858), 
	.B(n_636), 
	.A(n_859));
   NA3X0 p10292A (.Q(n_1007), 
	.C(n_854), 
	.B(n_855), 
	.A(n_856));
   ON321X0 p11554A (.Q(n_1055), 
	.F(n_848), 
	.E(n_849), 
	.D(n_850), 
	.C(n_851), 
	.B(n_852), 
	.A(n_853));
   ON221X0 p11891A (.Q(n_1174), 
	.E(n_845), 
	.D(n_849), 
	.C(n_1283), 
	.B(n_846), 
	.A(n_847));
   ON321X0 p12315A (.Q(n_1202), 
	.F(n_841), 
	.E(n_842), 
	.D(n_197), 
	.C(n_843), 
	.B(n_844), 
	.A(n_62));
   AN21X0 p11726A (.Q(n_1112), 
	.C(n_840), 
	.B(\fsm_op2[0] ), 
	.A(n_907));
   AN211X0 p11670A (.Q(n_982), 
	.D(n_837), 
	.C(n_838), 
	.B(n_481), 
	.A(n_839));
   NA2X0 p0806D (.Q(n_1020), 
	.B(n_835), 
	.A(n_836));
   NO2X1 p0845A (.Q(n_1064), 
	.B(n_1044), 
	.A(n_834));
   AN211X0 p3789A (.Q(n_926), 
	.D(n_831), 
	.C(n_832), 
	.B(n_235), 
	.A(n_833));
   ON311X0 p12216A (.Q(n_1134), 
	.E(n_963), 
	.D(n_829), 
	.C(n_830), 
	.B(n_143), 
	.A(n_774));
   AN321X0 p12561A (.Q(n_980), 
	.F(n_826), 
	.E(n_827), 
	.D(n_36), 
	.C(n_828), 
	.B(n_366), 
	.A(n_481));
   ON31X0 p13471A (.Q(n_1165), 
	.D(n_1105), 
	.C(n_1106), 
	.B(n_1260), 
	.A(n_825));
   AN21X0 p4924A (.Q(n_1095), 
	.C(n_912), 
	.B(n_824), 
	.A(n_1128));
   AO21X0 p4600A60512 (.Q(n_1307), 
	.C(n_911), 
	.B(n_823), 
	.A(n_1122));
   NO3X0 p11934D (.Q(n_1017), 
	.C(n_820), 
	.B(n_821), 
	.A(n_822));
   AN211X0 p12097A (.Q(n_1056), 
	.D(n_1146), 
	.C(n_819), 
	.B(\fsm_op2[1] ), 
	.A(n_907));
   AN221X0 p12259A (.Q(n_1012), 
	.E(n_816), 
	.D(n_817), 
	.C(n_833), 
	.B(n_818), 
	.A(n_235));
   AN221X0 p13371A (.Q(n_1320), 
	.E(n_814), 
	.D(n_571), 
	.C(n_815), 
	.B(n_1086), 
	.A(n_545));
   INX0 Fp12705A (.Q(n_924), 
	.A(n_1035));
   AO211X0 p12244A (.Q(n_1035), 
	.D(n_812), 
	.C(n_909), 
	.B(n_882), 
	.A(n_813));
   AO21X0 p13623A (.Q(n_1986), 
	.C(n_810), 
	.B(n_59), 
	.A(n_811));
   NA2X0 p12242A (.Q(n_1050), 
	.B(n_1195), 
	.A(n_809));
   AO21X0 p5605A (.Q(n_1431), 
	.C(n_1351), 
	.B(n_338), 
	.A(n_808));
   AN311X0 p4522A (.Q(n_946), 
	.E(n_805), 
	.D(n_1059), 
	.C(n_806), 
	.B(n_807), 
	.A(n_1253));
   AN321X0 p11449A (.Q(n_1302), 
	.F(n_801), 
	.E(n_802), 
	.D(n_803), 
	.C(n_804), 
	.B(n_80), 
	.A(n_366));
   ON311X0 p13325A (.Q(n_1413), 
	.E(n_877), 
	.D(n_798), 
	.C(n_799), 
	.B(n_235), 
	.A(n_800));
   ON31X0 p4698D (.Q(n_1160), 
	.D(n_796), 
	.C(n_1101), 
	.B(n_797), 
	.A(n_62));
   AN221X0 p11741A (.Q(n_1205), 
	.E(n_792), 
	.D(n_793), 
	.C(n_794), 
	.B(n_795), 
	.A(n_1060));
   ON21X0 p11648A (.Q(n_923), 
	.C(n_1010), 
	.B(n_790), 
	.A(n_791));
   ON311X0 p13146A (.Q(n_1127), 
	.E(n_787), 
	.D(n_788), 
	.C(n_789), 
	.B(n_800), 
	.A(n_143));
   AN221X0 p14600A (.Q(n_1156), 
	.E(n_784), 
	.D(n_785), 
	.C(n_325), 
	.B(n_786), 
	.A(n_977));
   AN222X0 p13847A (.Q(n_1314), 
	.F(n_1170), 
	.E(n_780), 
	.D(n_781), 
	.C(n_65), 
	.B(n_782), 
	.A(n_783));
   AN321X0 p10327A (.Q(n_973), 
	.F(n_777), 
	.E(n_778), 
	.D(n_120), 
	.C(n_779), 
	.B(DFT_sdo), 
	.A(n_37));
   NA2X1 p0807A (.Q(n_1244), 
	.B(n_775), 
	.A(n_776));
   AN311X0 p10479D (.Q(n_932), 
	.E(n_770), 
	.D(n_771), 
	.C(n_772), 
	.B(n_773), 
	.A(n_774));
   ON211X0 p11950A (.Q(n_945), 
	.D(n_767), 
	.C(n_768), 
	.B(n_167), 
	.A(n_769));
   AN211X0 p11516A (.Q(n_937), 
	.D(n_766), 
	.C(n_887), 
	.B(n_783), 
	.A(n_478));
   AN21X0 p11020A (.Q(n_1022), 
	.C(n_763), 
	.B(n_764), 
	.A(n_765));
   AN31X0 p12506A (.Q(n_1048), 
	.D(n_762), 
	.C(n_882), 
	.B(n_1029), 
	.A(n_2118));
   NO2X0 p0731D (.Q(n_1111), 
	.B(n_760), 
	.A(n_761));
   ON21X0 p13087A (.Q(n_939), 
	.C(n_759), 
	.B(n_1354), 
	.A(n_1071));
   AN321X0 p7258A (.Q(n_1250), 
	.F(n_757), 
	.E(n_1123), 
	.D(n_758), 
	.C(n_416), 
	.B(\fsm_op_aux_2[7] ), 
	.A(n_1060));
   AN32X0 p0897A (.Q(n_1189), 
	.E(n_754), 
	.D(n_1281), 
	.C(n_755), 
	.B(n_1279), 
	.A(n_756));
   ON211X0 p11813A (.Q(n_1371), 
	.D(n_899), 
	.C(n_1373), 
	.B(n_2124), 
	.A(n_753));
   MU2IX0 p4888A (.S(n_752), 
	.Q(n_1096), 
	.IN1(n_1128), 
	.IN0(n_1122));
   AO22X0 p11872A (.Q(n_1137), 
	.D(n_65), 
	.C(n_882), 
	.B(n_2124), 
	.A(n_814));
   ON211X0 p1901A (.Q(n_1330), 
	.D(n_749), 
	.C(n_750), 
	.B(n_2125), 
	.A(n_751));
   AN221X0 p4979A (.Q(n_956), 
	.E(n_746), 
	.D(\fsm_op_aux_2[2] ), 
	.C(n_747), 
	.B(n_748), 
	.A(n_1316));
   AN321X0 p14829A (.Q(n_1155), 
	.F(n_743), 
	.E(n_744), 
	.D(n_745), 
	.C(n_1170), 
	.B(n_84), 
	.A(n_408));
   AN22X0 p15932A (.Q(n_919), 
	.D(\fsm_op2[7] ), 
	.C(n_741), 
	.B(n_1253), 
	.A(n_742));
   INX0 Fp0625D (.Q(n_1150), 
	.A(n_1153));
   NA2X1 p0615D (.Q(n_1153), 
	.B(n_739), 
	.A(n_740));
   AN21X0 p1772A (.Q(n_1377), 
	.C(n_738), 
	.B(\fsm_op_aux_2[6] ), 
	.A(n_1225));
   ON211X0 p1309A (.Q(n_1385), 
	.D(n_736), 
	.C(n_750), 
	.B(n_737), 
	.A(n_751));
   ON211X0 p1282A (.Q(n_1384), 
	.D(n_734), 
	.C(n_750), 
	.B(n_735), 
	.A(n_751));
   AN221X0 p0933A (.Q(n_1380), 
	.E(n_732), 
	.D(n_733), 
	.C(n_1434), 
	.B(n_1225), 
	.A(\fsm_op_aux_2[3] ));
   INX0 Fp0847A (.Q(n_1397), 
	.A(n_731));
   ON211X0 p0999A (.Q(n_731), 
	.D(n_750), 
	.C(n_729), 
	.B(n_730), 
	.A(n_751));
   AN32X0 p0811A60513 (.Q(n_1190), 
	.E(n_754), 
	.D(n_1263), 
	.C(n_755), 
	.B(n_1262), 
	.A(n_756));
   AN222X0 p4308A (.Q(n_957), 
	.F(n_565), 
	.E(\fsm_op_aux_1_2[7] ), 
	.D(n_728), 
	.C(fsm_pc_i[15]), 
	.B(n_747), 
	.A(\fsm_op_aux_2[7] ));
   AN22X0 p5929A (.Q(n_1167), 
	.D(n_727), 
	.C(n_1123), 
	.B(n_1168), 
	.A(n_1094));
   AN221X0 p12754A (.Q(n_1496), 
	.E(n_1235), 
	.D(n_1434), 
	.C(n_862), 
	.B(n_907), 
	.A(\fsm_op2[3] ));
   AN22X0 p5692A (.Q(n_949), 
	.D(n_758), 
	.C(n_1128), 
	.B(n_726), 
	.A(n_1122));
   ON321X0 p14991A (.Q(n_1240), 
	.F(n_723), 
	.E(n_724), 
	.D(n_1284), 
	.C(n_2125), 
	.B(n_725), 
	.A(n_850));
   AN22X0 p4381A (.Q(n_942), 
	.D(n_888), 
	.C(n_721), 
	.B(n_722), 
	.A(n_808));
   ON221X0 p4492A (.Q(n_1141), 
	.E(n_718), 
	.D(n_947), 
	.C(n_719), 
	.B(n_720), 
	.A(n_88));
   NO2X0 p9908A (.Q(n_1040), 
	.B(\fsm_op2[0] ), 
	.A(n_717));
   NO2I1X0 p6009A (.Q(n_913), 
	.B(n_716), 
	.AN(n_1123));
   INX0 Fp12333A (.Q(n_906), 
	.A(n_1000));
   NO2X0 p12181A (.Q(n_1000), 
	.B(n_714), 
	.A(n_715));
   NA2X0 p11654A61691 (.Q(n_878), 
	.B(n_1089), 
	.A(n_1278));
   NO2X0 p5591A (.Q(n_1351), 
	.B(n_2042), 
	.A(n_713));
   NA2X0 p12142A (.Q(n_809), 
	.B(n_1087), 
	.A(n_765));
   NO2X0 p3996A61692 (.Q(n_1339), 
	.B(n_711), 
	.A(n_712));
   INX0 Fp1261A (.Q(n_1193), 
	.A(n_1191));
   NO2I1X0 p1240A (.Q(n_1191), 
	.B(n_710), 
	.AN(n_754));
   NO2X0 p12512A (.Q(n_1360), 
	.B(n_708), 
	.A(n_709));
   NA2X0 p0767A60514 (.Q(n_740), 
	.B(n_1089), 
	.A(n_820));
   ON211X0 p10097A (.Q(n_777), 
	.D(n_705), 
	.C(n_706), 
	.B(n_120), 
	.A(n_707));
   AN211X0 p12093A (.Q(n_841), 
	.D(n_701), 
	.C(n_702), 
	.B(n_703), 
	.A(n_704));
   NA2X0 p14577A (.Q(n_784), 
	.B(n_699), 
	.A(n_700));
   NA3I1X0 p12132A (.Q(n_816), 
	.C(n_697), 
	.B(n_698), 
	.AN(n_714));
   AND3X0 p10565A (.Q(n_972), 
	.C(n_1025), 
	.B(n_695), 
	.A(n_696));
   AN31X0 p11755A (.Q(n_1297), 
	.D(n_964), 
	.C(n_1147), 
	.B(n_1136), 
	.A(\fsm_op2[5] ));
   AN211X0 p13349A (.Q(n_1321), 
	.D(n_692), 
	.C(n_693), 
	.B(n_694), 
	.A(n_1068));
   INX0 Fp0561D (.Q(n_836), 
	.A(n_889));
   ON311X0 p0538D (.Q(n_889), 
	.E(n_689), 
	.D(n_690), 
	.C(n_691), 
	.B(n_1170), 
	.A(n_1014));
   ON21X0 p4484A (.Q(n_867), 
	.C(n_1313), 
	.B(n_1093), 
	.A(n_688));
   AN21X0 p11842A (.Q(n_1209), 
	.C(n_817), 
	.B(n_686), 
	.A(n_687));
   NA3X0 p12077A (.Q(n_863), 
	.C(n_683), 
	.B(n_684), 
	.A(n_685));
   ON211X0 p16101A60515 (.Q(n_1237), 
	.D(n_681), 
	.C(n_1372), 
	.B(n_682), 
	.A(n_1229));
   AN221X0 p12327A (.Q(n_1073), 
	.E(n_679), 
	.D(n_32), 
	.C(n_896), 
	.B(n_680), 
	.A(DFT_sdo_4));
   ON32X0 p11958A (.Q(n_1139), 
	.E(n_1132), 
	.D(n_677), 
	.C(n_710), 
	.B(n_799), 
	.A(n_678));
   AO21X0 p1595A (.Q(n_738), 
	.C(n_732), 
	.B(\fsm_op_aux_1[6] ), 
	.A(n_733));
   AN211X0 p0756A (.Q(n_967), 
	.D(n_674), 
	.C(n_675), 
	.B(\fsm_op_aux_2[0] ), 
	.A(n_676));
   ON221X0 p0770A60516 (.Q(n_1044), 
	.E(n_670), 
	.D(n_671), 
	.C(n_672), 
	.B(n_673), 
	.A(n_847));
   AN21X0 p12408A (.Q(n_1105), 
	.C(n_669), 
	.B(n_2124), 
	.A(n_693));
   AN311X0 p3714A (.Q(n_1046), 
	.E(n_667), 
	.D(n_668), 
	.C(n_419), 
	.B(n_366), 
	.A(n_37));
   ON221X0 p4925A (.Q(n_1245), 
	.E(n_993), 
	.D(n_853), 
	.C(n_665), 
	.B(n_666), 
	.A(n_2217));
   ON31X0 p5154A (.Q(n_1224), 
	.D(n_1231), 
	.C(n_663), 
	.B(n_664), 
	.A(n_2217));
   AN221X0 p11105A (.Q(n_951), 
	.E(n_659), 
	.D(n_2014), 
	.C(n_660), 
	.B(n_661), 
	.A(n_662));
   NA3X0 p6411A (.Q(n_1166), 
	.C(\fsm_op2[5] ), 
	.B(n_106), 
	.A(n_1128));
   ON21X0 p11542A (.Q(n_1021), 
	.C(n_1081), 
	.B(n_658), 
	.A(n_1198));
   NO3X0 p11402A (.Q(n_1300), 
	.C(n_655), 
	.B(n_656), 
	.A(n_657));
   NA2X0 p5414A (.Q(n_890), 
	.B(n_1226), 
	.A(n_654));
   AN311X0 p11475A (.Q(n_845), 
	.E(n_650), 
	.D(n_651), 
	.C(n_652), 
	.B(n_804), 
	.A(n_653));
   OA211X0 p9259AT (.Q(n_915), 
	.D(n_648), 
	.C(n_649), 
	.B(n_1028), 
	.A(n_1031));
   AO21X0 p3869A (.Q(n_1161), 
	.C(n_914), 
	.B(n_416), 
	.A(n_356));
   AO21X0 p14793A (.Q(n_1018), 
	.C(n_741), 
	.B(n_647), 
	.A(n_781));
   ON22X0 p10093A (.Q(n_1039), 
	.D(n_645), 
	.C(n_1102), 
	.B(n_684), 
	.A(n_646));
   ON211X0 p11637A (.Q(n_837), 
	.D(n_642), 
	.C(n_643), 
	.B(n_197), 
	.A(n_644));
   ON22X0 p15312A (.Q(n_2106), 
	.D(n_639), 
	.C(n_640), 
	.B(n_938), 
	.A(n_641));
   AN221X0 p11830A (.Q(n_848), 
	.E(n_715), 
	.D(n_804), 
	.C(n_637), 
	.B(n_638), 
	.A(n_977));
   ON321X0 p14828A (.Q(n_908), 
	.F(n_635), 
	.E(n_1198), 
	.D(n_636), 
	.C(n_636), 
	.B(n_1283), 
	.A(n_2119));
   ON321X0 p11250A (.Q(n_801), 
	.F(n_632), 
	.E(n_633), 
	.D(n_634), 
	.C(n_903), 
	.B(n_2115), 
	.A(n_774));
   NA3X0 p13490A (.Q(n_1256), 
	.C(n_411), 
	.B(n_29), 
	.A(n_631));
   AN21X0 p12828A (.Q(n_877), 
	.C(n_629), 
	.B(n_2125), 
	.A(n_630));
   ON31X0 p7168D (.Q(n_1176), 
	.D(n_1009), 
	.C(n_1102), 
	.B(n_1170), 
	.A(n_628));
   ON211X0 p11836A (.Q(n_792), 
	.D(n_626), 
	.C(n_684), 
	.B(n_627), 
	.A(n_894));
   OA21X0 p11941A (.Q(n_1213), 
	.C(n_1010), 
	.B(n_624), 
	.A(n_625));
   OA211X0 p11061A (.Q(n_928), 
	.D(n_622), 
	.C(n_623), 
	.B(n_64), 
	.A(n_830));
   ON21X0 p11560A (.Q(n_766), 
	.C(n_1083), 
	.B(n_620), 
	.A(n_621));
   AN311X0 p15430A (.Q(n_985), 
	.E(n_616), 
	.D(n_617), 
	.C(n_618), 
	.B(n_619), 
	.A(n_211));
   ON31X0 p11160A (.Q(n_1178), 
	.D(n_879), 
	.C(n_1198), 
	.B(n_249), 
	.A(n_473));
   ON321X0 p11637A60517 (.Q(n_840), 
	.F(n_635), 
	.E(n_613), 
	.D(n_209), 
	.C(n_1078), 
	.B(n_614), 
	.A(n_615));
   AN221X0 p8656A (.Q(n_1115), 
	.E(n_610), 
	.D(n_84), 
	.C(n_611), 
	.B(n_446), 
	.A(n_612));
   AO31X0 p12420A (.Q(n_1486), 
	.D(n_1408), 
	.C(n_782), 
	.B(n_609), 
	.A(n_401));
   AN21X0 p11999A (.Q(n_1272), 
	.C(n_819), 
	.B(n_607), 
	.A(n_608));
   INX1 Fp1071A60518 (.Q(n_958), 
	.A(n_1152));
   ON21X1 p0866A (.Q(n_1152), 
	.C(n_605), 
	.B(n_663), 
	.A(n_606));
   AN211X0 p13233A (.Q(n_1257), 
	.D(n_602), 
	.C(n_603), 
	.B(n_2124), 
	.A(n_604));
   AO321X0 p12146A (.Q(fsm_alu_opcode_o[4]), 
	.F(n_599), 
	.E(n_600), 
	.D(n_305), 
	.C(n_446), 
	.B(n_601), 
	.A(n_817));
   OA21X0 p11871A (.Q(n_1228), 
	.C(n_1294), 
	.B(n_197), 
	.A(n_1299));
   AO221X0 p11576A (.Q(n_968), 
	.E(n_596), 
	.D(n_611), 
	.C(n_597), 
	.B(n_598), 
	.A(n_1060));
   AN211X0 p4086A (.Q(n_925), 
	.D(n_593), 
	.C(n_594), 
	.B(n_201), 
	.A(n_595));
   AN222X0 p8917A (.Q(n_1011), 
	.F(n_591), 
	.E(n_592), 
	.D(n_971), 
	.C(n_609), 
	.B(n_866), 
	.A(n_783));
   AN21X0 p15445A (.Q(n_986), 
	.C(n_590), 
	.B(n_286), 
	.A(n_811));
   ON321X0 p11350A (.Q(n_1146), 
	.F(n_586), 
	.E(n_849), 
	.D(n_587), 
	.C(n_588), 
	.B(n_589), 
	.A(n_2040));
   ON221X0 p4631A (.Q(n_1140), 
	.E(n_584), 
	.D(n_663), 
	.C(n_585), 
	.B(n_606), 
	.A(n_624));
   ON22X0 p12498A60521 (.Q(n_762), 
	.D(n_1107), 
	.C(n_581), 
	.B(n_582), 
	.A(n_583));
   ON211X0 p13406A (.Q(n_810), 
	.D(n_579), 
	.C(n_580), 
	.B(n_230), 
	.A(n_988));
   AN222X0 p8628A (.Q(n_881), 
	.F(n_167), 
	.E(n_578), 
	.D(n_419), 
	.C(n_446), 
	.B(n_807), 
	.A(n_755));
   ON221X0 p3899A61693 (.Q(n_831), 
	.E(n_575), 
	.D(n_710), 
	.C(n_576), 
	.B(n_577), 
	.A(n_634));
   ON31X0 p0792D (.Q(n_761), 
	.D(n_574), 
	.C(n_710), 
	.B(n_1014), 
	.A(n_80));
   AO321X0 p14099A (.Q(n_975), 
	.F(n_573), 
	.E(n_781), 
	.D(n_609), 
	.C(n_478), 
	.B(n_452), 
	.A(n_102));
   AN22X0 p11678A (.Q(n_963), 
	.D(n_804), 
	.C(n_570), 
	.B(n_571), 
	.A(n_572));
   AN22X0 p0763A (.Q(n_1437), 
	.D(\fsm_op_aux_2[1] ), 
	.C(n_1225), 
	.B(n_1449), 
	.A(n_733));
   AN321X0 p0759A (.Q(n_1109), 
	.F(n_568), 
	.E(n_194), 
	.D(n_569), 
	.C(\fsm_op_aux_1[0] ), 
	.B(n_226), 
	.A(n_545));
   AN222X0 p4491A61694 (.Q(n_955), 
	.F(n_565), 
	.E(\fsm_op_aux_1_2[1] ), 
	.D(n_566), 
	.C(n_888), 
	.B(n_567), 
	.A(\fsm_op_aux_2[1] ));
   AO22X0 p4522A60522 (.Q(n_1004), 
	.D(fsm_pc_i[14]), 
	.C(n_728), 
	.B(\fsm_op_aux_2[6] ), 
	.A(n_747));
   AO22X0 p4522A60523 (.Q(n_1003), 
	.D(fsm_pc_i[13]), 
	.C(n_728), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_747));
   AO22X0 p4522A60524 (.Q(n_1002), 
	.D(fsm_pc_i[12]), 
	.C(n_728), 
	.B(\fsm_op_aux_2[4] ), 
	.A(n_747));
   AO22X0 p4522A60525 (.Q(n_1001), 
	.D(n_728), 
	.C(fsm_pc_i[11]), 
	.B(\fsm_op_aux_2[3] ), 
	.A(n_747));
   AN222X0 p4191A (.Q(n_954), 
	.F(n_565), 
	.E(\fsm_op_aux_1_2[0] ), 
	.D(n_728), 
	.C(n_80), 
	.B(n_567), 
	.A(\fsm_op_aux_2[0] ));
   ON211X0 p11577A (.Q(fsm_ext_ram_o), 
	.D(n_562), 
	.C(n_563), 
	.B(n_415), 
	.A(n_564));
   ON31X0 p9745A (.Q(n_1038), 
	.D(n_559), 
	.C(n_791), 
	.B(n_560), 
	.A(n_561));
   AN22X0 p12640A (.Q(n_1047), 
	.D(n_1411), 
	.C(n_558), 
	.B(n_1029), 
	.A(n_669));
   ON22X0 p5217A (.Q(n_950), 
	.D(n_556), 
	.C(n_859), 
	.B(n_1170), 
	.A(n_557));
   AN33X0 p5272A (.Q(n_892), 
	.F(n_555), 
	.E(n_722), 
	.D(\fsm_op2[0] ), 
	.C(n_755), 
	.B(n_804), 
	.A(n_2217));
   AN32X0 p11202A (.Q(n_1026), 
	.E(n_553), 
	.D(n_261), 
	.C(n_779), 
	.B(n_554), 
	.A(n_32));
   AO221X0 p11622A (.Q(n_944), 
	.E(n_551), 
	.D(n_611), 
	.C(n_89), 
	.B(n_552), 
	.A(n_888));
   AN211X0 p12239A (.Q(n_1016), 
	.D(n_990), 
	.C(n_549), 
	.B(n_612), 
	.A(n_550));
   AN32X0 p15806A (.Q(n_1131), 
	.E(n_548), 
	.D(n_520), 
	.C(n_781), 
	.B(n_817), 
	.A(n_60));
   ON32X0 p12252A (.Q(n_959), 
	.E(n_547), 
	.D(n_686), 
	.C(n_1198), 
	.B(n_261), 
	.A(n_62));
   AN321X0 p11583A (.Q(n_1181), 
	.F(n_542), 
	.E(n_543), 
	.D(n_520), 
	.C(n_544), 
	.B(n_545), 
	.A(n_546));
   AN221X0 p11570A (.Q(n_1301), 
	.E(n_539), 
	.D(n_261), 
	.C(n_540), 
	.B(n_541), 
	.A(n_359));
   AO221X0 p11188A (.Q(n_883), 
	.E(n_610), 
	.D(n_611), 
	.C(n_69), 
	.B(n_638), 
	.A(n_446));
   AN221X0 p11371A (.Q(n_960), 
	.E(n_537), 
	.D(n_785), 
	.C(n_538), 
	.B(n_449), 
	.A(n_773));
   AN22X0 p11615A (.Q(n_1296), 
	.D(n_2118), 
	.C(n_428), 
	.B(n_105), 
	.A(n_536));
   AN321X1 p0767A60526 (.Q(n_776), 
	.F(n_533), 
	.E(n_408), 
	.D(n_36), 
	.C(n_194), 
	.B(n_534), 
	.A(n_535));
   AN22X0 p11025A (.Q(n_1328), 
	.D(n_764), 
	.C(n_1086), 
	.B(n_647), 
	.A(n_532));
   AO321X0 p7710A (.Q(n_991), 
	.F(n_537), 
	.E(n_530), 
	.D(n_531), 
	.C(n_806), 
	.B(n_2217), 
	.A(n_216));
   AN32X0 p15122A (.Q(n_1154), 
	.E(n_529), 
	.D(n_612), 
	.C(n_815), 
	.B(n_275), 
	.A(n_473));
   ON221X0 p14877A (.Q(n_976), 
	.E(n_526), 
	.D(n_527), 
	.C(n_88), 
	.B(n_851), 
	.A(n_528));
   OA32X0 p5063A (.Q(n_1267), 
	.E(n_869), 
	.D(n_557), 
	.C(n_1101), 
	.B(n_560), 
	.A(n_211));
   NO2X0 p12974A (.Q(n_1478), 
	.B(n_401), 
	.A(n_525));
   NA2X0 p1822A (.Q(n_749), 
	.B(\fsm_op_aux_2[7] ), 
	.A(n_1225));
   NA2X0 p0600D (.Q(n_739), 
	.B(n_523), 
	.A(n_524));
   NA2X0 p1312A (.Q(n_736), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_1225));
   NA2X0 p1257A (.Q(n_734), 
	.B(\fsm_op_aux_2[4] ), 
	.A(n_1225));
   NA2X0 p1025A (.Q(n_729), 
	.B(\fsm_op_aux_2[2] ), 
	.A(n_1225));
   NA2X0 p0809A (.Q(n_996), 
	.B(\fsm_op2[0] ), 
	.A(n_522));
   NO2I1X0 p0895A (.Q(n_1063), 
	.B(n_521), 
	.AN(n_2098));
   INX0 Fp11902A60527 (.Q(n_1114), 
	.A(n_862));
   AND2X0 p11490A (.Q(n_862), 
	.B(n_1170), 
	.A(n_630));
   NA2X0 p12497A (.Q(n_1090), 
	.B(n_1262), 
	.A(n_1280));
   AND2X0 p4800A (.Q(n_989), 
	.B(n_1309), 
	.A(n_1094));
   NO2X0 p11226A (.Q(n_1278), 
	.B(n_974), 
	.A(n_1229));
   AN32X0 p11015A (.Q(n_899), 
	.E(n_778), 
	.D(n_518), 
	.C(n_519), 
	.B(n_520), 
	.A(n_647));
   AND2X0 p5235A60528 (.Q(n_979), 
	.B(n_1312), 
	.A(n_1094));
   NO2I1X0 p0749D (.Q(n_760), 
	.B(n_517), 
	.AN(n_516));
   NA3X0 p9591A (.Q(n_559), 
	.C(n_514), 
	.B(n_515), 
	.A(n_687));
   NO2I1X0 p17334A (.Q(n_2189), 
	.B(n_636), 
	.AN(n_572));
   AND2X0 p3686A (.Q(n_914), 
	.B(n_609), 
	.A(n_866));
   INX0 Fp0963A (.Q(n_820), 
	.A(n_1009));
   NA2X1 p0895A60531 (.Q(n_1009), 
	.B(n_2110), 
	.A(n_513));
   NA2X0 p1164A (.Q(n_1342), 
	.B(n_201), 
	.A(n_512));
   INX0 Fp5083A (.Q(n_790), 
	.A(n_1128));
   NO2X0 p5065A (.Q(n_1128), 
	.B(n_2119), 
	.A(n_1102));
   NO2I1X0 p12410A60535 (.Q(n_1408), 
	.B(n_710), 
	.AN(n_1280));
   NA2I1X0 p4402A (.Q(n_593), 
	.B(n_511), 
	.AN(n_674));
   NO2X0 p4600A60536 (.Q(n_1122), 
	.B(n_1261), 
	.A(n_1102));
   NO2I1X0 p0886A (.Q(n_754), 
	.B(n_1208), 
	.AN(n_2110));
   NA2I1X0 p13711A (.Q(n_780), 
	.B(n_876), 
	.AN(n_629));
   INX0 Fp1262A60537 (.Q(n_732), 
	.A(n_750));
   NA2X0 p1181A (.Q(n_750), 
	.B(n_417), 
	.A(n_523));
   NO2X0 p5275A (.Q(n_1123), 
	.B(n_37), 
	.A(n_1102));
   NO2X0 p12876A (.Q(n_1479), 
	.B(n_2217), 
	.A(n_876));
   AN21X0 p11251A (.Q(n_1290), 
	.C(n_2125), 
	.B(n_509), 
	.A(n_510));
   NO2X0 p5025A (.Q(n_1313), 
	.B(n_473), 
	.A(n_1208));
   INX0 Fp11144A (.Q(n_692), 
	.A(n_879));
   NA2X0 p11005A (.Q(n_879), 
	.B(DFT_sdo_4), 
	.A(n_508));
   NA2X0 p9843A (.Q(n_717), 
	.B(n_649), 
	.A(n_648));
   ON211X0 p13014A (.Q(n_1126), 
	.D(n_505), 
	.C(n_506), 
	.B(n_589), 
	.A(n_507));
   ON21X1 p0762A (.Q(n_1218), 
	.C(\fsm_op_aux_1[0] ), 
	.B(n_594), 
	.A(n_565));
   AN21X0 p12005A (.Q(n_768), 
	.C(n_1059), 
	.B(n_804), 
	.A(n_755));
   AO221X0 p11185AT (.Q(n_969), 
	.E(n_821), 
	.D(n_446), 
	.C(n_785), 
	.B(n_504), 
	.A(n_514));
   AO31X0 p15568A (.Q(n_1239), 
	.D(n_907), 
	.C(n_195), 
	.B(n_408), 
	.A(n_2042));
   ON221X0 p14900A (.Q(n_743), 
	.E(n_873), 
	.D(n_842), 
	.C(n_502), 
	.B(n_503), 
	.A(n_2041));
   ON21X0 p15911A (.Q(n_742), 
	.C(n_500), 
	.B(n_871), 
	.A(n_501));
   AO31X0 p12668A (.Q(n_1034), 
	.D(n_1375), 
	.C(n_882), 
	.B(n_499), 
	.A(n_2042));
   AN31X0 p0870A (.Q(n_904), 
	.D(n_728), 
	.C(n_498), 
	.B(n_356), 
	.A(n_211));
   AN221X0 p11736A (.Q(n_1295), 
	.E(n_494), 
	.D(n_495), 
	.C(n_661), 
	.B(n_496), 
	.A(n_497));
   AND3X0 p4424A (.Q(n_911), 
	.C(n_804), 
	.B(n_520), 
	.A(n_449));
   NO2X0 p12567A (.Q(n_1332), 
	.B(n_861), 
	.A(n_860));
   ON21X0 p11780A (.Q(n_814), 
	.C(n_1329), 
	.B(n_2041), 
	.A(n_493));
   AO31X0 p15536A (.Q(n_2044), 
	.D(n_492), 
	.C(n_661), 
	.B(n_192), 
	.A(n_84));
   AO21X0 p13004A (.Q(n_631), 
	.C(n_524), 
	.B(n_2110), 
	.A(n_2124));
   AN21X0 p4314A61695 (.Q(n_720), 
	.C(n_818), 
	.B(n_2119), 
	.A(n_4));
   AN221X0 p11465A (.Q(n_961), 
	.E(n_1059), 
	.D(n_490), 
	.C(n_446), 
	.B(n_491), 
	.A(n_530));
   AN31X0 p13008A (.Q(n_1071), 
	.D(n_492), 
	.C(n_434), 
	.B(n_65), 
	.A(n_653));
   AO21X0 p11679A (.Q(n_715), 
	.C(n_651), 
	.B(n_2110), 
	.A(n_489));
   ON21X0 p11839A (.Q(n_819), 
	.C(n_699), 
	.B(n_487), 
	.A(n_488));
   AN311X0 p11201A (.Q(n_927), 
	.E(n_484), 
	.D(n_485), 
	.C(n_745), 
	.B(n_486), 
	.A(n_167));
   INX0 Fp0872A (.Q(n_748), 
	.A(n_605));
   NA3X0 p0838A (.Q(n_605), 
	.C(n_37), 
	.B(n_401), 
	.A(n_483));
   INX0 Fp4325A60538 (.Q(n_1118), 
	.A(n_808));
   ON21X0 p4316A (.Q(n_808), 
	.C(n_859), 
	.B(n_37), 
	.A(n_482));
   AN221X0 p9939A (.Q(n_855), 
	.E(n_479), 
	.D(n_29), 
	.C(n_89), 
	.B(n_480), 
	.A(n_481));
   OA21X0 p12216A60539 (.Q(n_826), 
	.C(n_84), 
	.B(n_478), 
	.A(n_558));
   AN21X0 p0902A (.Q(n_995), 
	.C(n_668), 
	.B(n_514), 
	.A(n_477));
   AN22X0 p12494A (.Q(n_1013), 
	.D(n_305), 
	.C(n_475), 
	.B(n_419), 
	.A(n_476));
   ON21X0 p11604A (.Q(n_964), 
	.C(n_829), 
	.B(n_474), 
	.A(n_830));
   AN31X0 p11818A (.Q(n_1230), 
	.D(n_2111), 
	.C(n_1089), 
	.B(n_473), 
	.A(n_102));
   OA21X0 p11422A (.Q(n_1083), 
	.C(n_563), 
	.B(n_471), 
	.A(n_472));
   AN21X0 p4673A61696 (.Q(n_941), 
	.C(n_596), 
	.B(n_470), 
	.A(n_806));
   AO311X0 p9844A (.Q(n_771), 
	.E(n_468), 
	.D(n_469), 
	.C(n_601), 
	.B(n_817), 
	.A(n_366));
   AN21X0 p1029A (.Q(n_997), 
	.C(n_467), 
	.B(n_125), 
	.A(n_570));
   AN321X0 p11332A (.Q(n_1294), 
	.F(n_464), 
	.E(n_786), 
	.D(n_465), 
	.C(n_466), 
	.B(n_36), 
	.A(n_211));
   ON321X0 p10490A (.Q(n_770), 
	.F(n_460), 
	.E(n_461), 
	.D(n_462), 
	.C(n_2217), 
	.B(n_197), 
	.A(n_463));
   AN321X0 p12812A (.Q(n_788), 
	.F(n_457), 
	.E(n_458), 
	.D(n_161), 
	.C(n_459), 
	.B(n_1354), 
	.A(n_29));
   AN32X0 p13254A (.Q(n_759), 
	.E(n_1375), 
	.D(\fsm_op2[0] ), 
	.C(n_456), 
	.B(n_619), 
	.A(n_545));
   INX0 Fp0675A (.Q(n_1149), 
	.A(n_1151));
   ON21X0 p0665D (.Q(n_1151), 
	.C(n_454), 
	.B(n_455), 
	.A(n_1200));
   AO33X0 p3939A (.Q(n_805), 
	.F(n_449), 
	.E(n_452), 
	.D(n_453), 
	.C(n_538), 
	.B(n_338), 
	.A(\fsm_op_aux_1[0] ));
   AO211X0 p11241A (.Q(n_822), 
	.D(n_610), 
	.C(n_551), 
	.B(n_888), 
	.A(n_451));
   AN32X0 p11875A (.Q(n_767), 
	.E(n_449), 
	.D(n_785), 
	.C(n_450), 
	.B(n_2124), 
	.A(n_686));
   ON32X0 p7264A (.Q(n_757), 
	.E(n_447), 
	.D(n_636), 
	.C(n_448), 
	.B(n_871), 
	.A(n_859));
   AO32X0 p12419A (.Q(n_1138), 
	.E(n_813), 
	.D(n_408), 
	.C(n_882), 
	.B(n_1087), 
	.A(n_686));
   AN32X0 p5784AT (.Q(n_1142), 
	.E(n_971), 
	.D(n_444), 
	.C(n_869), 
	.B(n_445), 
	.A(n_446));
   AO22X0 p11430A (.Q(n_884), 
	.D(n_89), 
	.C(n_806), 
	.B(n_530), 
	.A(n_443));
   AO32X0 p14530A (.Q(n_910), 
	.E(n_1147), 
	.D(n_601), 
	.C(n_442), 
	.B(n_226), 
	.A(n_167));
   AN33X0 p16132A (.Q(n_920), 
	.F(n_542), 
	.E(\fsm_op2[7] ), 
	.D(n_80), 
	.C(n_420), 
	.B(n_1253), 
	.A(n_817));
   ON32X0 p12240A (.Q(n_812), 
	.E(n_502), 
	.D(n_173), 
	.C(n_1170), 
	.B(n_725), 
	.A(n_1283));
   ON221X0 p3928A (.Q(n_1043), 
	.E(n_438), 
	.D(n_439), 
	.C(n_440), 
	.B(n_441), 
	.A(n_974));
   AN32X0 p8495A (.Q(n_929), 
	.E(n_755), 
	.D(n_436), 
	.C(n_356), 
	.B(n_437), 
	.A(n_261));
   AO22X0 p15292A (.Q(n_590), 
	.D(n_2118), 
	.C(n_489), 
	.B(n_434), 
	.A(n_435));
   AN321X0 p12124A (.Q(n_999), 
	.F(n_433), 
	.E(n_907), 
	.D(\fsm_op2[4] ), 
	.C(n_105), 
	.B(n_601), 
	.A(n_977));
   AN32X0 p5758A (.Q(n_1143), 
	.E(n_611), 
	.D(n_495), 
	.C(n_121), 
	.B(n_432), 
	.A(n_211));
   AN22X0 p5301A (.Q(n_654), 
	.D(n_785), 
	.C(n_356), 
	.B(n_4), 
	.A(n_431));
   AN222X0 p5366A (.Q(n_893), 
	.F(n_497), 
	.E(n_121), 
	.D(n_429), 
	.C(\fsm_op2[0] ), 
	.B(n_1253), 
	.A(n_612));
   AN33X0 p5300A (.Q(n_895), 
	.F(n_888), 
	.E(\fsm_op2[0] ), 
	.D(n_62), 
	.C(n_356), 
	.B(n_686), 
	.A(\fsm_op_aux_2[0] ));
   AN22X0 p14905A (.Q(n_723), 
	.D(n_783), 
	.C(n_660), 
	.B(n_65), 
	.A(n_428));
   AO222X0 p4768A (.Q(n_891), 
	.F(n_888), 
	.E(n_425), 
	.D(n_426), 
	.C(n_356), 
	.B(n_427), 
	.A(n_530));
   AN22X0 p5461A (.Q(n_713), 
	.D(n_424), 
	.C(n_449), 
	.B(n_267), 
	.A(n_195));
   ON22X0 p1022A (.Q(n_834), 
	.D(n_853), 
	.C(n_421), 
	.B(n_422), 
	.A(n_423));
   ON221X0 p10718A (.Q(n_765), 
	.E(n_587), 
	.D(n_1106), 
	.C(n_167), 
	.B(n_2042), 
	.A(n_1015));
   INX0 Fp12226A (.Q(n_1080), 
	.A(n_1157));
   AO22X0 p11816A (.Q(n_1157), 
	.D(n_226), 
	.C(n_419), 
	.B(n_686), 
	.A(n_420));
   ON22X0 p13197A (.Q(n_886), 
	.D(n_620), 
	.C(n_418), 
	.B(n_463), 
	.A(n_502));
   AN32X0 p8982A (.Q(n_1010), 
	.E(n_385), 
	.D(n_416), 
	.C(n_417), 
	.B(n_344), 
	.A(n_803));
   ON22X0 p7251A (.Q(n_943), 
	.D(n_415), 
	.C(n_447), 
	.B(n_493), 
	.A(n_870));
   AN321X0 p0662A (.Q(n_670), 
	.F(n_414), 
	.E(n_2042), 
	.D(n_198), 
	.C(n_591), 
	.B(n_434), 
	.A(n_2119));
   AN211X0 p9841A (.Q(n_705), 
	.D(n_412), 
	.C(n_413), 
	.B(n_37), 
	.A(n_804));
   AN33X0 p14444A (.Q(n_700), 
	.F(n_2217), 
	.E(n_478), 
	.D(n_216), 
	.C(n_105), 
	.B(n_428), 
	.A(n_411));
   AN33X0 p8189A (.Q(n_858), 
	.F(n_459), 
	.E(n_803), 
	.D(n_793), 
	.C(n_409), 
	.B(n_410), 
	.A(n_2110));
   AN321X0 p12482A (.Q(n_709), 
	.F(n_882), 
	.E(n_332), 
	.D(n_192), 
	.C(n_2125), 
	.B(n_211), 
	.A(n_408));
   AN321X0 p12211A (.Q(n_1074), 
	.F(n_405), 
	.E(n_406), 
	.D(n_2124), 
	.C(n_407), 
	.B(n_59), 
	.A(n_197));
   ON32X0 p5084A (.Q(n_746), 
	.E(n_403), 
	.D(n_663), 
	.C(n_2126), 
	.B(n_404), 
	.A(n_261));
   AN22X0 p11469A (.Q(n_1081), 
	.D(n_89), 
	.C(n_660), 
	.B(n_401), 
	.A(n_402));
   ON22X0 p1005A (.Q(n_1054), 
	.D(n_399), 
	.C(n_666), 
	.B(n_439), 
	.A(n_400));
   AN22X0 p8545A (.Q(n_931), 
	.D(n_686), 
	.C(n_611), 
	.B(n_530), 
	.A(n_779));
   AO33X0 p11698A (.Q(n_864), 
	.F(n_530), 
	.E(n_83), 
	.D(n_167), 
	.C(n_591), 
	.B(n_793), 
	.A(n_261));
   AO22X0 p15476A (.Q(n_2105), 
	.D(n_828), 
	.C(n_385), 
	.B(n_398), 
	.A(n_286));
   AN22X0 p3903A (.Q(n_712), 
	.D(n_452), 
	.C(n_806), 
	.B(n_817), 
	.A(n_611));
   AN222X0 p12028A (.Q(n_1271), 
	.F(n_396), 
	.E(n_420), 
	.D(n_637), 
	.C(n_216), 
	.B(n_397), 
	.A(n_310));
   AN22X0 p11382A (.Q(n_874), 
	.D(n_275), 
	.C(n_660), 
	.B(n_417), 
	.A(n_395));
   NA2X0 p0992A (.Q(n_1119), 
	.B(n_446), 
	.A(n_394));
   NA2X0 p1332D (.Q(n_835), 
	.B(n_37), 
	.A(n_394));
   NA2X1 p0481D (.Q(n_1454), 
	.B(fsm_pc_i[6]), 
	.A(n_393));
   NA2X1 p0509D (.Q(n_1465), 
	.B(fsm_pc_i[7]), 
	.A(n_393));
   NA2X1 p0364D (.Q(n_1457), 
	.B(fsm_pc_i[5]), 
	.A(n_393));
   NA2X1 p0333D (.Q(n_1503), 
	.B(fsm_pc_i[4]), 
	.A(n_393));
   NA2X1 p0034D (.Q(n_1452), 
	.B(fsm_pc_i[3]), 
	.A(n_393));
   NA2X0 n0013D (.Q(n_1450), 
	.B(fsm_pc_i[2]), 
	.A(n_393));
   NA2X0 p0129D (.Q(n_1501), 
	.B(fsm_pc_i[1]), 
	.A(n_393));
   NA2X0 n0045D (.Q(n_1493), 
	.B(fsm_pc_i[0]), 
	.A(n_393));
   NO2X0 p9609A (.Q(n_791), 
	.B(n_823), 
	.A(n_688));
   NA2I1X0 p9534A (.Q(n_687), 
	.B(n_392), 
	.AN(n_824));
   NA2X0 p5126A (.Q(n_898), 
	.B(n_645), 
	.A(n_392));
   INX0 Fp11027A (.Q(n_547), 
	.A(n_532));
   NA2I1X0 p10762A (.Q(n_532), 
	.B(n_1015), 
	.AN(n_1187));
   NO2I1X0 p7540A (.Q(n_537), 
	.B(n_211), 
	.AN(n_600));
   INX0 Fp0605D60540 (.Q(n_517), 
	.A(n_524));
   NO2I1X0 p0609D (.Q(n_524), 
	.B(n_1089), 
	.AN(n_2110));
   INX0 Fp12026A60542 (.Q(n_998), 
	.A(n_860));
   NA2X0 p11558A (.Q(n_860), 
	.B(n_698), 
	.A(n_391));
   AND2X0 p12171A (.Q(n_1088), 
	.B(n_2124), 
	.A(n_1068));
   AND2X0 p3445A (.Q(n_866), 
	.B(n_2217), 
	.A(n_449));
   NO2X0 p16660A (.Q(n_2107), 
	.B(n_636), 
	.A(n_799));
   AND2X0 p12809A (.Q(n_492), 
	.B(n_424), 
	.A(n_1412));
   NO2I1X0 p16711A (.Q(n_2108), 
	.B(n_487), 
	.AN(n_591));
   INX0 Fp0741A (.Q(n_513), 
	.A(n_557));
   NA2X1 p0732A (.Q(n_557), 
	.B(n_389), 
	.A(n_4));
   NO2I1X0 p12394A (.Q(n_693), 
	.B(n_388), 
	.AN(n_359));
   AND2X0 p0907A (.Q(n_674), 
	.B(n_800), 
	.A(n_660));
   INX0 Fp13968A (.Q(n_573), 
	.A(n_500));
   NA2X0 p13902A (.Q(n_500), 
	.B(n_514), 
	.A(n_882));
   INX0 Fp4581A (.Q(n_578), 
	.A(n_1102));
   NA2X0 p4390A (.Q(n_1102), 
	.B(n_2118), 
	.A(n_4));
   INX0 Fp10426A (.Q(n_549), 
	.A(n_684));
   OR2X0 p10168A (.Q(n_684), 
	.B(n_2115), 
	.A(n_560));
   INX0 Fp1106A (.Q(n_797), 
	.A(n_523));
   NO2X0 p1077A (.Q(n_523), 
	.B(n_249), 
	.A(n_387));
   INX0 Fp0828A (.Q(n_947), 
	.A(n_483));
   NO2X0 p0772A (.Q(n_483), 
	.B(n_235), 
	.A(n_560));
   NA2X0 p0995A (.Q(n_993), 
	.B(DFT_sdo), 
	.A(n_744));
   AND2X0 p4433A (.Q(n_596), 
	.B(n_356), 
	.A(n_443));
   NA3X0 p11825A (.Q(n_635), 
	.C(n_386), 
	.B(n_977), 
	.A(n_804));
   NO2X0 p13694A (.Q(n_781), 
	.B(n_2124), 
	.A(n_487));
   NA2X0 p11411A60543 (.Q(n_1372), 
	.B(n_783), 
	.A(n_550));
   NO2X0 p11870A60544 (.Q(n_1280), 
	.B(n_1014), 
	.A(n_851));
   NA2I1X0 p14811A (.Q(n_1070), 
	.B(n_1293), 
	.AN(n_484));
   NO2I1X0 p11518A (.Q(n_651), 
	.B(n_987), 
	.AN(n_419));
   INX0 Fp0835A60545 (.Q(n_648), 
	.A(n_1208));
   NA2X0 p0793A (.Q(n_1208), 
	.B(n_266), 
	.A(n_755));
   NO2X0 p15442A (.Q(n_641), 
	.B(n_384), 
	.A(n_385));
   INX0 Fp11118A (.Q(n_659), 
	.A(n_873));
   NA2X0 p10905A (.Q(n_873), 
	.B(n_36), 
	.A(n_660));
   INX0 Fp11233A (.Q(n_621), 
	.A(n_1086));
   NA2X0 p10897A (.Q(n_1086), 
	.B(n_487), 
	.A(n_418));
   NO2X0 p12469A (.Q(n_1183), 
	.B(n_660), 
	.A(n_744));
   NA2X0 p11133A (.Q(n_632), 
	.B(n_294), 
	.A(n_383));
   NO2X0 p11735A (.Q(n_572), 
	.B(n_211), 
	.A(n_987));
   NO2X1 p0896A (.Q(n_1225), 
	.B(n_987), 
	.A(n_625));
   NO2X0 p9018A (.Q(n_990), 
	.B(n_473), 
	.A(n_948));
   NA2I1X0 p10987A (.Q(n_1229), 
	.B(n_167), 
	.AN(n_851));
   NA2X0 p0956A (.Q(n_965), 
	.B(n_62), 
	.A(n_1042));
   NA2X0 p12376A (.Q(n_1269), 
	.B(n_382), 
	.A(n_782));
   AO21X0 p4915A (.Q(n_897), 
	.C(n_688), 
	.B(n_352), 
	.A(n_869));
   AN311X0 p13029A (.Q(n_1125), 
	.E(n_379), 
	.D(n_380), 
	.C(n_381), 
	.B(n_120), 
	.A(n_167));
   OA21X0 p4361A (.Q(n_1101), 
	.C(n_392), 
	.B(n_377), 
	.A(n_378));
   NO3X0 p10012A (.Q(n_856), 
	.C(n_618), 
	.B(n_375), 
	.A(n_376));
   AN22X0 p12018A (.Q(n_769), 
	.D(n_373), 
	.C(n_446), 
	.B(n_1060), 
	.A(n_374));
   ON31X0 p11902A (.Q(n_685), 
	.D(n_806), 
	.C(n_436), 
	.B(n_495), 
	.A(n_785));
   ON211X0 p12012A (.Q(n_984), 
	.D(n_369), 
	.C(n_370), 
	.B(n_371), 
	.A(n_372));
   NA3X0 p0956A60546 (.Q(n_454), 
	.C(n_1113), 
	.B(n_977), 
	.A(n_368));
   AN21X0 p12026A (.Q(n_1085), 
	.C(n_1187), 
	.B(n_366), 
	.A(n_367));
   ON31X0 p12318A60547 (.Q(n_669), 
	.D(n_562), 
	.C(n_520), 
	.B(n_1015), 
	.A(n_365));
   ON31X0 p8281A (.Q(n_857), 
	.D(n_1060), 
	.C(n_426), 
	.B(n_338), 
	.A(n_531));
   ON321X0 p11169A60548 (.Q(n_657), 
	.F(n_362), 
	.E(n_363), 
	.D(n_1261), 
	.C(n_2042), 
	.B(n_364), 
	.A(n_462));
   ON21X0 p11286A (.Q(n_821), 
	.C(n_361), 
	.B(n_658), 
	.A(n_859));
   ON21X0 p11338A (.Q(n_630), 
	.C(n_510), 
	.B(n_501), 
	.A(n_1199));
   ON21X0 p4955A (.Q(n_940), 
	.C(n_611), 
	.B(n_360), 
	.A(n_424));
   AO321X0 p11046A (.Q(n_838), 
	.F(n_357), 
	.E(n_358), 
	.D(n_359), 
	.C(n_194), 
	.B(n_571), 
	.A(n_59));
   ON21X0 p8980A (.Q(n_880), 
	.C(n_356), 
	.B(n_427), 
	.A(n_339));
   AN21X0 p4596A (.Q(n_1094), 
	.C(n_493), 
	.B(n_859), 
	.A(n_870));
   ON211X0 p10360A (.Q(n_1006), 
	.D(n_353), 
	.C(n_354), 
	.B(n_120), 
	.A(n_355));
   ON31X0 p0943D (.Q(n_512), 
	.D(n_350), 
	.C(n_351), 
	.B(n_352), 
	.A(n_80));
   AN211X0 p13847A60549 (.Q(n_988), 
	.D(n_499), 
	.C(n_349), 
	.B(n_211), 
	.A(n_514));
   OA211X0 p12013A (.Q(n_1268), 
	.D(n_391), 
	.C(n_347), 
	.B(n_2041), 
	.A(n_348));
   AN21X0 p12987A (.Q(n_981), 
	.C(n_1187), 
	.B(n_2119), 
	.A(n_2031));
   NO3I1X0 p12068A (.Q(n_599), 
	.C(n_346), 
	.B(n_387), 
	.AN(n_773));
   NA3X0 p1322A (.Q(n_1231), 
	.C(n_417), 
	.B(DFT_sdo_4), 
	.A(n_345));
   ON211X0 p3923AT (.Q(n_575), 
	.D(n_344), 
	.C(n_305), 
	.B(n_495), 
	.A(n_722));
   ON221X0 p10279A (.Q(n_1005), 
	.E(n_340), 
	.D(n_341), 
	.C(DFT_sdo_4), 
	.B(n_342), 
	.A(n_343));
   INX0 Fp12397A (.Q(n_827), 
	.A(n_1049));
   AN21X0 p12268A (.Q(n_1049), 
	.C(n_882), 
	.B(n_167), 
	.A(n_267));
   NA3X0 p12047A (.Q(n_1373), 
	.C(n_209), 
	.B(n_660), 
	.A(n_520));
   OA21X0 p12110A (.Q(n_922), 
	.C(n_530), 
	.B(n_339), 
	.A(n_443));
   AN21X0 p10951A (.Q(n_622), 
	.C(n_433), 
	.B(n_337), 
	.A(n_338));
   NA3X0 p11421A (.Q(n_586), 
	.C(n_803), 
	.B(n_459), 
	.A(n_344));
   INX0 Fp0707A60550 (.Q(n_751), 
	.A(n_733));
   ON31X0 p0786D (.Q(n_733), 
	.D(n_334), 
	.C(n_335), 
	.B(n_1198), 
	.A(n_336));
   AO21X0 p10888A (.Q(n_508), 
	.C(n_475), 
	.B(n_294), 
	.A(n_333));
   AND3X0 p4384A (.Q(n_747), 
	.C(n_803), 
	.B(n_888), 
	.A(n_417));
   NA3X0 p11685A (.Q(n_1329), 
	.C(n_2119), 
	.B(n_89), 
	.A(n_332));
   AN21X0 p12255A (.Q(n_753), 
	.C(n_475), 
	.B(n_260), 
	.A(n_333));
   AN21X0 p0938A (.Q(n_521), 
	.C(n_1260), 
	.B(n_850), 
	.A(n_1283));
   AN311X0 p9944A (.Q(n_854), 
	.E(n_329), 
	.D(n_330), 
	.C(n_331), 
	.B(n_520), 
	.A(n_346));
   AN21X0 p11595A (.Q(n_564), 
	.C(n_882), 
	.B(n_27), 
	.A(n_344));
   AO21X0 p12419A60552 (.Q(n_629), 
	.C(n_909), 
	.B(n_459), 
	.A(n_833));
   AN22X0 p12839AT (.Q(n_876), 
	.D(n_198), 
	.C(n_328), 
	.B(n_408), 
	.A(n_1061));
   ON21X0 p11280A (.Q(n_464), 
	.C(n_326), 
	.B(n_327), 
	.A(n_842));
   AN32X0 p16058A (.Q(n_681), 
	.E(n_324), 
	.D(n_478), 
	.C(n_778), 
	.B(n_325), 
	.A(n_2042));
   NA3X0 p11160A60553 (.Q(n_563), 
	.C(n_119), 
	.B(n_266), 
	.A(n_882));
   NO3I1X0 p15096A (.Q(n_741), 
	.C(n_62), 
	.B(n_830), 
	.AN(n_545));
   AN21X0 p4104A (.Q(n_577), 
	.C(n_323), 
	.B(n_534), 
	.A(n_267));
   AN321X0 p12661A (.Q(n_787), 
	.F(n_321), 
	.E(DFT_sdo_4), 
	.D(n_62), 
	.C(n_704), 
	.B(n_322), 
	.A(n_71));
   AN321X0 p11328A (.Q(n_642), 
	.F(n_319), 
	.E(n_320), 
	.D(n_81), 
	.C(n_197), 
	.B(n_2048), 
	.A(n_161));
   ON22X0 p0722A (.Q(n_522), 
	.D(n_471), 
	.C(n_317), 
	.B(n_576), 
	.A(n_318));
   AN221X0 p12628A (.Q(n_505), 
	.E(n_314), 
	.D(n_32), 
	.C(n_315), 
	.B(n_424), 
	.A(n_316));
   AO321X0 p12426A (.Q(n_602), 
	.F(n_312), 
	.E(n_813), 
	.D(n_29), 
	.C(n_313), 
	.B(n_481), 
	.A(n_261));
   AO22X0 p11495A (.Q(n_536), 
	.D(n_60), 
	.C(n_310), 
	.B(n_311), 
	.A(n_1077));
   AN211X0 p0774A (.Q(n_568), 
	.D(\fsm_op_aux_1[0] ), 
	.C(n_2041), 
	.B(n_2154), 
	.A(n_309));
   AO222X0 p10745A (.Q(n_650), 
	.F(n_499), 
	.E(n_466), 
	.D(n_306), 
	.C(n_325), 
	.B(n_307), 
	.A(n_308));
   ON32X0 p11695A (.Q(n_887), 
	.E(n_1015), 
	.D(n_620), 
	.C(n_1106), 
	.B(n_236), 
	.A(n_1261));
   ON32X0 p10871A (.Q(n_763), 
	.E(n_304), 
	.D(n_1015), 
	.C(n_1106), 
	.B(n_92), 
	.A(n_305));
   AN32X0 p11106A (.Q(n_623), 
	.E(n_332), 
	.D(n_612), 
	.C(n_785), 
	.B(n_303), 
	.A(n_1968));
   AN221X0 p10181A (.Q(n_696), 
	.E(n_302), 
	.D(n_704), 
	.C(n_1148), 
	.B(n_516), 
	.A(n_62));
   AN22X0 p13105A (.Q(n_525), 
	.D(n_618), 
	.C(n_198), 
	.B(n_408), 
	.A(n_514));
   ON321X0 p12034A (.Q(n_701), 
	.F(n_299), 
	.E(n_300), 
	.D(n_211), 
	.C(n_301), 
	.B(n_371), 
	.A(n_143));
   ON221X0 p13472A (.Q(n_604), 
	.E(n_493), 
	.D(n_297), 
	.C(n_556), 
	.B(n_298), 
	.A(n_59));
   AN221X0 p13424A (.Q(n_579), 
	.E(n_295), 
	.D(n_516), 
	.C(n_2116), 
	.B(n_296), 
	.A(n_211));
   AN33X0 p11989A (.Q(n_697), 
	.F(n_382), 
	.E(n_294), 
	.D(n_27), 
	.C(n_1077), 
	.B(n_2110), 
	.A(n_37));
   ON32X0 p16288A (.Q(n_548), 
	.E(n_615), 
	.D(n_1107), 
	.C(n_1283), 
	.B(n_415), 
	.A(n_37));
   OA22X0 p12383A (.Q(n_581), 
	.D(n_138), 
	.C(n_300), 
	.B(n_1106), 
	.A(n_1322));
   NA3X0 p0770A60554 (.Q(n_1008), 
	.C(n_292), 
	.B(n_511), 
	.A(n_293));
   ON22X0 p11754A (.Q(n_543), 
	.D(n_291), 
	.C(n_615), 
	.B(n_235), 
	.A(n_1198));
   AN22X0 p0822A (.Q(n_775), 
	.D(n_764), 
	.C(n_486), 
	.B(n_289), 
	.A(n_290));
   ON21X0 p1002A (.Q(n_668), 
	.C(n_287), 
	.B(n_288), 
	.A(n_1023));
   AO22X0 p11195A (.Q(n_540), 
	.D(n_1968), 
	.C(n_618), 
	.B(n_490), 
	.A(n_286));
   AN33X0 p11577A60555 (.Q(n_643), 
	.F(n_266), 
	.E(n_284), 
	.D(n_481), 
	.C(n_2217), 
	.B(n_194), 
	.A(n_285));
   ON22X0 p0813A (.Q(n_533), 
	.D(n_2154), 
	.C(n_615), 
	.B(n_283), 
	.A(n_528));
   AN33X0 p11358A (.Q(n_875), 
	.F(n_282), 
	.E(n_194), 
	.D(n_1968), 
	.C(n_105), 
	.B(n_1077), 
	.A(n_305));
   ON222X0 p11489A (.Q(n_539), 
	.F(n_665), 
	.E(n_1260), 
	.D(n_280), 
	.C(n_197), 
	.B(n_281), 
	.A(n_903));
   AN21X0 p0575D (.Q(n_689), 
	.C(n_277), 
	.B(n_278), 
	.A(n_279));
   AO22X0 p15290A (.Q(n_616), 
	.D(n_276), 
	.C(n_384), 
	.B(n_382), 
	.A(n_772));
   AN32X0 p10386A (.Q(n_460), 
	.E(n_477), 
	.D(n_597), 
	.C(n_289), 
	.B(n_275), 
	.A(n_62));
   ON22X0 p15377A (.Q(n_617), 
	.D(n_665), 
	.C(n_273), 
	.B(n_639), 
	.A(n_274));
   ON22X0 p15322A (.Q(n_529), 
	.D(n_211), 
	.C(n_615), 
	.B(n_850), 
	.A(n_2042));
   OA221X0 p16157A (.Q(n_921), 
	.E(n_526), 
	.D(n_846), 
	.C(n_1283), 
	.B(n_272), 
	.A(n_850));
   ON21X0 p0951A (.Q(n_467), 
	.C(n_270), 
	.B(n_283), 
	.A(n_271));
   AO22X0 p11015A60556 (.Q(n_553), 
	.D(n_59), 
	.C(n_359), 
	.B(n_686), 
	.A(n_661));
   NA2X0 p11078A (.Q(n_519), 
	.B(n_1015), 
	.A(n_1023));
   NA2X0 p12556A (.Q(n_476), 
	.B(n_1015), 
	.A(n_421));
   INX0 Fp4510A (.Q(n_584), 
	.A(n_567));
   NO2I1X0 p4356A (.Q(n_567), 
	.B(n_690), 
	.AN(n_888));
   INX0 Fp11639A (.Q(n_613), 
	.A(n_489));
   AND2X0 p11369A (.Q(n_489), 
	.B(n_481), 
	.A(n_1077));
   OR2X0 p13487A (.Q(n_2194), 
	.B(n_328), 
	.A(n_2193));
   NO2X0 p12276A (.Q(n_1068), 
	.B(n_1014), 
	.A(n_501));
   OR2X0 p3577A (.Q(n_538), 
	.B(n_530), 
	.A(n_555));
   NA2X0 p0666D (.Q(n_455), 
	.B(n_261), 
	.A(n_269));
   NA2X0 p1112A (.Q(n_292), 
	.B(n_2110), 
	.A(n_833));
   NO2X0 p4505A (.Q(n_912), 
	.B(n_859), 
	.A(n_664));
   INX0 Fp1008A60559 (.Q(n_565), 
	.A(n_334));
   NA2X0 p1018A (.Q(n_334), 
	.B(n_267), 
	.A(n_268));
   NO2X1 p10294A (.Q(n_393), 
	.B(n_587), 
	.A(n_625));
   NO2X0 p17039A (.Q(n_2047), 
	.B(n_230), 
	.A(n_625));
   INX0 Fp0535A60562 (.Q(n_4), 
	.A(n_560));
   NA2X1 p0519A (.Q(n_560), 
	.B(n_266), 
	.A(n_530));
   INX0 Fp0912A60566 (.Q(n_449), 
	.A(n_387));
   NA2X0 p0866A60569 (.Q(n_387), 
	.B(n_305), 
	.A(n_530));
   AND2X0 p10418A (.Q(n_515), 
	.B(n_305), 
	.A(n_888));
   AND2X0 p10698A (.Q(n_475), 
	.B(n_490), 
	.A(n_1077));
   INX0 Fp0775A60576 (.Q(n_356), 
	.A(n_663));
   NA2X1 p0700A (.Q(n_663), 
	.B(n_37), 
	.A(n_530));
   INX0 Fp1012A60578 (.Q(n_385), 
	.A(n_987));
   NA2X0 p0976A (.Q(n_987), 
	.B(n_197), 
	.A(n_289));
   INX0 Fp5446A (.Q(n_450), 
	.A(n_948));
   NA2X0 p5320A (.Q(n_948), 
	.B(n_803), 
	.A(n_530));
   NO2X0 p5968A (.Q(n_971), 
	.B(n_401), 
	.A(n_859));
   AND2X0 p10770A (.Q(n_433), 
	.B(n_260), 
	.A(n_443));
   NA2X0 p11256A (.Q(n_509), 
	.B(n_424), 
	.A(n_408));
   AND2X1 p0659A (.Q(n_755), 
	.B(n_27), 
	.A(n_530));
   INX0 Fp12350A60579 (.Q(n_815), 
	.A(n_1132));
   NA2X0 p12259A60580 (.Q(n_1132), 
	.B(n_211), 
	.A(n_325));
   INX0 Fp0838A (.Q(n_676), 
	.A(n_438));
   NA3X0 p0849A (.Q(n_438), 
	.C(n_481), 
	.B(n_2217), 
	.A(n_265));
   AND2X0 p8660A (.Q(n_610), 
	.B(n_591), 
	.A(n_530));
   NA2X0 p11792A (.Q(n_391), 
	.B(n_465), 
	.A(n_264));
   NO2X0 p12377A (.Q(n_861), 
	.B(n_1106), 
	.A(n_348));
   NA2I1X0 p14910A (.Q(n_978), 
	.B(n_263), 
	.AN(n_264));
   INX0 Fp3479A60581 (.Q(n_611), 
	.A(n_894));
   NA2X0 p3587A (.Q(n_894), 
	.B(n_389), 
	.A(n_530));
   NA2X0 p12507A (.Q(n_1195), 
	.B(n_783), 
	.A(n_325));
   AND2X0 p8885A (.Q(n_592), 
	.B(n_2119), 
	.A(n_888));
   NA2X0 p11783A (.Q(n_699), 
	.B(n_267), 
	.A(n_638));
   AND2X0 p3859A (.Q(n_806), 
	.B(n_80), 
	.A(n_530));
   INX0 Fp11870A (.Q(n_527), 
	.A(n_420));
   NO2X0 p11650A (.Q(n_420), 
	.B(n_1283), 
	.A(n_589));
   NO2I1X0 p11927A (.Q(n_1235), 
	.B(n_348), 
	.AN(n_888));
   INX0 Fp0811A60589 (.Q(n_744), 
	.A(n_799));
   NA2X1 p0776A (.Q(n_799), 
	.B(n_167), 
	.A(n_408));
   NA2X0 p10851A (.Q(n_851), 
	.B(n_408), 
	.A(n_520));
   INX0 Fp11729A (.Q(n_724), 
	.A(n_1147));
   AND2X0 p11427A (.Q(n_1147), 
	.B(n_817), 
	.A(n_408));
   NO2X0 p12458A (.Q(n_782), 
	.B(n_1198), 
	.A(n_2124));
   NO2I1X0 p12248A (.Q(n_909), 
	.B(n_1198), 
	.AN(n_499));
   INX0 Fp0833A (.Q(n_402), 
	.A(n_1200));
   NA2X0 p0821A (.Q(n_1200), 
	.B(n_325), 
	.A(n_609));
   NA2X0 p10439A (.Q(n_1187), 
	.B(n_501), 
	.A(n_1023));
   INX0 Fp10762A (.Q(n_882), 
	.A(n_487));
   NA2X0 p10531A61697 (.Q(n_487), 
	.B(n_305), 
	.A(n_332));
   INX0 Fp10935A (.Q(n_544), 
	.A(n_418));
   NA2X0 p10801A (.Q(n_418), 
	.B(n_261), 
	.A(n_260));
   NO2I1X0 p11308A (.Q(n_484), 
	.B(n_859), 
	.AN(n_290));
   NA2X0 p5624A (.Q(n_1226), 
	.B(n_446), 
	.A(n_499));
   INX0 Fp7211A (.Q(n_550), 
	.A(n_447));
   NA2X0 p7029A (.Q(n_447), 
	.B(n_167), 
	.A(n_446));
   INX0 Fp5780A (.Q(n_626), 
	.A(n_432));
   NO2X0 p5823A (.Q(n_432), 
	.B(n_673), 
	.A(n_859));
   AND2X0 p12445A (.Q(n_1412), 
	.B(n_2042), 
	.A(n_772));
   NA2X0 p1041A (.Q(n_422), 
	.B(n_305), 
	.A(n_344));
   INX0 Fp1009A60604 (.Q(n_818), 
	.A(n_666));
   NA2X0 p1002A60605 (.Q(n_666), 
	.B(n_259), 
	.A(n_260));
   NO2X1 p0684A (.Q(n_660), 
	.B(n_167), 
	.A(n_615));
   ON211X0 p12571A (.Q(n_457), 
	.D(n_300), 
	.C(n_258), 
	.B(n_32), 
	.A(n_284));
   INX0 Fp11218A (.Q(n_428), 
	.A(n_830));
   NA2X0 p10918A (.Q(n_830), 
	.B(n_27), 
	.A(n_332));
   AN31X0 p12774A (.Q(n_583), 
	.D(n_478), 
	.C(n_481), 
	.B(n_366), 
	.A(n_211));
   AND3X0 p11859A (.Q(n_907), 
	.C(n_408), 
	.B(n_290), 
	.A(\fsm_op2[7] ));
   AND3X0 p12028A60608 (.Q(n_1375), 
	.C(n_408), 
	.B(n_71), 
	.A(n_290));
   AN21X0 p12567A60609 (.Q(n_388), 
	.C(n_1077), 
	.B(n_366), 
	.A(n_257));
   AN21X0 p12302A (.Q(n_953), 
	.C(n_307), 
	.B(n_2042), 
	.A(n_310));
   AO211X0 p39885A (.Q(n_1988), 
	.D(n_1987), 
	.C(n_346), 
	.B(n_34), 
	.A(n_256));
   ON31X0 p9911A (.Q(n_646), 
	.D(\fsm_op2[0] ), 
	.C(n_1093), 
	.B(n_727), 
	.A(n_1030));
   ON21X0 p4435A (.Q(n_688), 
	.C(n_255), 
	.B(n_44), 
	.A(n_752));
   AN21X0 p4113A60610 (.Q(n_392), 
	.C(n_758), 
	.B(n_1316), 
	.A(n_752));
   AO21X0 p12690A (.Q(n_1203), 
	.C(n_435), 
	.B(n_481), 
	.A(n_254));
   AND3X0 p15738A (.Q(n_2190), 
	.C(n_817), 
	.B(n_194), 
	.A(n_1077));
   AN21X0 p11631A (.Q(n_656), 
	.C(n_2040), 
	.B(n_252), 
	.A(n_253));
   ON311X0 p13237AT (.Q(n_603), 
	.E(n_250), 
	.D(n_251), 
	.C(n_1170), 
	.B(n_1199), 
	.A(n_120));
   AND3X0 p7422A (.Q(n_600), 
	.C(n_662), 
	.B(n_817), 
	.A(n_888));
   AN21X0 p11466A (.Q(n_1027), 
	.C(n_339), 
	.B(n_2168), 
	.A(n_145));
   ON311X0 p11906A (.Q(n_702), 
	.E(n_248), 
	.D(n_273), 
	.C(DFT_sdo_4), 
	.B(n_507), 
	.A(n_249));
   ON211X0 p11766A (.Q(n_795), 
	.D(n_246), 
	.C(n_252), 
	.B(n_1354), 
	.A(n_247));
   ON21X0 p1300A (.Q(n_345), 
	.C(n_244), 
	.B(n_249), 
	.A(n_245));
   AN321X0 p10191A (.Q(n_695), 
	.F(n_243), 
	.E(n_442), 
	.D(n_211), 
	.C(n_520), 
	.B(n_37), 
	.A(n_534));
   INX0 Fp11639A60611 (.Q(n_2045), 
	.A(n_562));
   NA3X0 p11590A (.Q(n_562), 
	.C(n_303), 
	.B(n_452), 
	.A(n_1077));
   ON221X0 p12190A60613 (.Q(n_680), 
	.E(n_253), 
	.D(n_844), 
	.C(n_70), 
	.B(n_520), 
	.A(n_242));
   AO221X0 p9417A (.Q(n_479), 
	.E(n_239), 
	.D(n_303), 
	.C(n_240), 
	.B(n_241), 
	.A(n_81));
   AND3X0 p11130A (.Q(n_551), 
	.C(n_211), 
	.B(n_490), 
	.A(n_888));
   NO3X0 p1002A60614 (.Q(n_1042), 
	.C(n_249), 
	.B(n_401), 
	.A(n_587));
   NA3X0 p11509A (.Q(n_510), 
	.C(n_27), 
	.B(n_783), 
	.A(n_260));
   NA2X0 p11260A (.Q(n_326), 
	.B(n_238), 
	.A(n_661));
   NA3X0 p0910A (.Q(n_270), 
	.C(n_261), 
	.B(n_609), 
	.A(n_237));
   INX0 Fp4272A (.Q(n_482), 
	.A(n_409));
   AO21X0 p3988A (.Q(n_409), 
	.C(n_530), 
	.B(n_211), 
	.A(n_793));
   NA2X0 p5350A (.Q(n_796), 
	.B(n_514), 
	.A(n_504));
   NA2X0 p12136A (.Q(n_683), 
	.B(n_446), 
	.A(n_445));
   NO3X0 p0831A (.Q(n_594), 
	.C(n_34), 
	.B(n_850), 
	.A(n_335));
   AN21X0 p0700A60615 (.Q(n_414), 
	.C(n_615), 
	.B(n_711), 
	.A(n_236));
   OA21X0 p11066A (.Q(n_485), 
	.C(n_384), 
	.B(n_2118), 
	.A(n_745));
   AN21X0 p11275A (.Q(n_518), 
	.C(n_615), 
	.B(n_37), 
	.A(n_2217));
   ON211X0 p10902A (.Q(n_383), 
	.D(n_234), 
	.C(n_1117), 
	.B(n_37), 
	.A(n_235));
   ON321X0 p9975A (.Q(n_376), 
	.F(n_231), 
	.E(n_1133), 
	.D(n_232), 
	.C(n_233), 
	.B(n_371), 
	.A(n_634));
   ON222X0 p12229A (.Q(n_679), 
	.F(n_300), 
	.E(n_520), 
	.D(n_228), 
	.C(n_229), 
	.B(n_253), 
	.A(n_230));
   AN22X0 p1190A (.Q(n_1045), 
	.D(n_225), 
	.C(n_226), 
	.B(n_198), 
	.A(n_227));
   ON22X0 p0957D (.Q(n_394), 
	.D(n_556), 
	.C(n_224), 
	.B(n_1170), 
	.A(n_1014));
   AN21X0 p0700DT (.Q(n_966), 
	.C(n_222), 
	.B(n_486), 
	.A(n_223));
   AO21X0 p4138A (.Q(n_832), 
	.C(n_222), 
	.B(n_486), 
	.A(n_223));
   NO2X1 p0514DT (.Q(n_1089), 
	.B(n_220), 
	.A(n_221));
   NA2X0 p0801D60619 (.Q(n_710), 
	.B(n_218), 
	.A(n_219));
   AO321X0 p9339A (.Q(n_412), 
	.F(n_612), 
	.E(n_785), 
	.D(n_27), 
	.C(n_217), 
	.B(n_1170), 
	.A(n_29));
   AO33X0 p11314A (.Q(n_494), 
	.F(n_2042), 
	.E(n_486), 
	.D(n_216), 
	.C(n_417), 
	.B(n_310), 
	.A(n_162));
   AN311X0 p10867D (.Q(n_362), 
	.E(n_213), 
	.D(n_2109), 
	.C(n_214), 
	.B(n_215), 
	.A(n_32));
   AN22X0 p0917D (.Q(n_350), 
	.D(n_516), 
	.C(n_417), 
	.B(n_1253), 
	.A(n_212));
   AO32X0 p11822A (.Q(n_558), 
	.E(n_401), 
	.D(n_466), 
	.C(n_197), 
	.B(n_434), 
	.A(n_211));
   AN33X0 p11027A (.Q(n_633), 
	.F(n_359), 
	.E(n_209), 
	.D(n_1354), 
	.C(DFT_sdo_4), 
	.B(n_210), 
	.A(n_686));
   ON22X0 p12715A (.Q(n_321), 
	.D(n_32), 
	.C(n_359), 
	.B(n_209), 
	.A(n_208));
   OA222X0 p12955A (.Q(n_506), 
	.F(n_1354), 
	.E(n_206), 
	.D(n_207), 
	.C(n_249), 
	.B(n_471), 
	.A(n_59));
   OA211X0 p9870A (.Q(n_469), 
	.D(n_434), 
	.C(n_36), 
	.B(n_211), 
	.A(n_653));
   AN22X0 p11607A (.Q(n_829), 
	.D(n_466), 
	.C(n_785), 
	.B(n_198), 
	.A(n_205));
   INX0 Fp0894D (.Q(n_852), 
	.A(n_1279));
   NO2X0 p0876D (.Q(n_1279), 
	.B(n_111), 
	.A(n_204));
   INX0 Fp0772D60620 (.Q(n_1276), 
	.A(n_318));
   NA2X0 p0781D (.Q(n_318), 
	.B(n_1253), 
	.A(n_203));
   INX0 Fp0563D (.Q(n_269), 
	.A(n_279));
   NO2I1X0 p0558D (.Q(n_279), 
	.B(n_202), 
	.AN(n_2125));
   NA2X0 p1302A (.Q(n_576), 
	.B(n_201), 
	.A(n_278));
   INX0 Fp0597D (.Q(n_218), 
	.A(n_220));
   NO2I1X1 p0597D (.Q(n_220), 
	.B(n_203), 
	.AN(n_1253));
   NA2X0 p13905A (.Q(n_349), 
	.B(n_672), 
	.A(n_528));
   INX0 Fp0634D (.Q(n_219), 
	.A(n_221));
   NO2I1X1 p0634D (.Q(n_221), 
	.B(n_1277), 
	.AN(n_41));
   NA2X0 p1690A (.Q(n_1032), 
	.B(n_535), 
	.A(n_566));
   INX0 Fp0552A60625 (.Q(n_408), 
	.A(n_501));
   NA2X1 p0577A (.Q(n_501), 
	.B(n_201), 
	.A(n_481));
   NA2X0 p1449A (.Q(n_439), 
	.B(n_201), 
	.A(n_200));
   INX0 Fp10039A (.Q(n_916), 
	.A(n_361));
   NA2X0 p9995A (.Q(n_361), 
	.B(n_1060), 
	.A(n_419));
   INX0 Fp11956A60635 (.Q(n_478), 
	.A(n_502));
   NA2X0 p11856A (.Q(n_502), 
	.B(n_201), 
	.A(n_303));
   NA2X0 p4421A (.Q(n_870), 
	.B(n_1060), 
	.A(n_1170));
   INX0 Fp0860A (.Q(n_718), 
	.A(n_728));
   NO2X1 p0866A60640 (.Q(n_728), 
	.B(n_2126), 
	.A(n_271));
   NO2I1X4 p0399D (.Q(n_530), 
	.B(n_197), 
	.AN(n_201));
   NO2X0 p0992D (.Q(n_222), 
	.B(n_847), 
	.A(n_1199));
   NA2I1X0 p11348A (.Q(n_491), 
	.B(n_952), 
	.AN(n_205));
   NO2I1X0 p4697A60641 (.Q(n_426), 
	.B(n_2042), 
	.AN(n_205));
   OR4X0 p12921A (.Q(n_2144), 
	.D(n_2099), 
	.C(n_211), 
	.B(n_199), 
	.A(n_1999));
   NA2X0 p13943A (.Q(n_798), 
	.B(n_198), 
	.A(n_328));
   NO2I1X0 p4659A (.Q(n_1059), 
	.B(n_2126), 
	.AN(n_328));
   INX0 Fp0612A (.Q(n_325), 
	.A(n_1198));
   NA2X1 p0567A (.Q(n_1198), 
	.B(n_481), 
	.A(n_1019));
   NO2X0 p11679A60647 (.Q(n_542), 
	.B(n_2041), 
	.A(n_272));
   NO2X0 p0966D (.Q(n_351), 
	.B(n_282), 
	.A(n_268));
   NA2X0 p15011A (.Q(n_526), 
	.B(n_198), 
	.A(n_608));
   NO2X0 p10447A (.Q(n_1077), 
	.B(n_249), 
	.A(n_903));
   INX0 Fp0889A (.Q(n_977), 
	.A(n_1283));
   NA2X1 p0752A (.Q(n_1283), 
	.B(n_201), 
	.A(n_197));
   INX0 Fp0887A60654 (.Q(n_421), 
	.A(n_289));
   NO2X0 p0819A (.Q(n_289), 
	.B(n_80), 
	.A(n_665));
   INX0 Fp11176A60655 (.Q(n_327), 
	.A(n_286));
   NO2X0 p11130A60656 (.Q(n_286), 
	.B(n_665), 
	.A(DFT_sdo_4));
   NO2I1X0 p12000A (.Q(n_846), 
	.B(n_212), 
	.AN(n_263));
   OR2X0 p4977A (.Q(n_429), 
	.B(n_161), 
	.A(n_358));
   NA2X0 p12144A (.Q(n_1293), 
	.B(n_1019), 
	.A(n_196));
   NA2X0 p11915A (.Q(n_1299), 
	.B(n_146), 
	.A(n_196));
   NO2I1X0 p1008A (.Q(n_888), 
	.B(n_197), 
	.AN(n_1019));
   NO2X0 p3602A (.Q(n_555), 
	.B(n_305), 
	.A(n_2126));
   AND2X0 p13720A (.Q(n_2028), 
	.B(n_29), 
	.A(n_195));
   INX0 Fp0862D (.Q(n_339), 
	.A(n_625));
   NA2X1 p1000D (.Q(n_625), 
	.B(n_2217), 
	.A(n_195));
   AND2X0 p10898A (.Q(n_772), 
	.B(n_294), 
	.A(n_194));
   AND2X0 p10824A (.Q(n_384), 
	.B(n_434), 
	.A(n_194));
   NA2X0 p13959A (.Q(n_811), 
	.B(n_853), 
	.A(n_901));
   AND2X0 p10899A (.Q(n_661), 
	.B(n_481), 
	.A(n_434));
   NO2X0 p12231A (.Q(n_652), 
	.B(n_665), 
	.A(n_2042));
   INX0 Fp0999A (.Q(n_244), 
	.A(n_833));
   NO2X0 p0899A (.Q(n_833), 
	.B(n_589), 
	.A(n_665));
   INX0 Fp0773A (.Q(n_344), 
	.A(n_1106));
   NA2X1 p0581A (.Q(n_1106), 
	.B(n_434), 
	.A(DFT_sdo_4));
   INX0 Fp0872A60666 (.Q(n_267), 
	.A(n_587));
   NA2X1 p0674A (.Q(n_587), 
	.B(n_359), 
	.A(n_294));
   INX0 Fp11747A (.Q(n_496), 
	.A(n_639));
   NA2X0 p11712A (.Q(n_639), 
	.B(n_303), 
	.A(n_434));
   INX0 Fp0905A (.Q(n_472), 
	.A(n_237));
   NO2X0 p0924A (.Q(n_237), 
	.B(n_193), 
	.A(n_903));
   NO2X0 p1453A (.Q(n_477), 
	.B(n_719), 
	.A(n_665));
   INX0 Fp0785A60670 (.Q(n_260), 
	.A(n_1023));
   NA2X1 p0650A (.Q(n_1023), 
	.B(n_294), 
	.A(DFT_sdo_4));
   AND2X0 p13083A60672 (.Q(n_2193), 
	.B(n_29), 
	.A(n_1061));
   NO2X0 p13077A (.Q(n_2043), 
	.B(n_230), 
	.A(n_849));
   INX0 Fp0582A (.Q(n_332), 
	.A(n_615));
   NA2X1 p0525A (.Q(n_615), 
	.B(n_1019), 
	.A(n_197));
   INX0 Fp0914A60682 (.Q(n_446), 
	.A(n_859));
   NA2X1 p0771A (.Q(n_859), 
	.B(n_359), 
	.A(n_1019));
   NO2X0 p5348A (.Q(n_504), 
	.B(n_2119), 
	.A(n_2126));
   AND2X0 p13121A (.Q(n_2003), 
	.B(n_59), 
	.A(n_794));
   NA2X0 p0831D60688 (.Q(n_293), 
	.B(n_192), 
	.A(n_323));
   NA2X0 p0872D (.Q(n_1263), 
	.B(n_190), 
	.A(n_191));
   NA2X0 p0804D (.Q(n_1262), 
	.B(n_188), 
	.A(n_189));
   AO211X0 p10554A (.Q(n_319), 
	.D(n_2020), 
	.C(n_187), 
	.B(n_32), 
	.A(n_2169));
   AND3X0 p1427A (.Q(n_569), 
	.C(DFT_sdo), 
	.B(n_535), 
	.A(n_1113));
   AN221X0 p1059D (.Q(n_1281), 
	.E(n_1029), 
	.D(n_1253), 
	.C(n_185), 
	.B(n_41), 
	.A(n_186));
   NA2X0 p0730D (.Q(n_317), 
	.B(n_1277), 
	.A(n_184));
   AN211X0 p5743A (.Q(n_716), 
	.D(n_824), 
	.C(n_183), 
	.B(\fsm_op2[6] ), 
	.A(n_1347));
   AN21X0 p10643A (.Q(n_355), 
	.C(n_162), 
	.B(n_346), 
	.A(n_182));
   ON21X0 p12184A (.Q(n_813), 
	.C(n_253), 
	.B(n_686), 
	.A(n_181));
   ON21X0 p13856A (.Q(n_580), 
	.C(n_554), 
	.B(n_591), 
	.A(n_419));
   AN21X0 p13126A (.Q(n_1196), 
	.C(n_828), 
	.B(n_119), 
	.A(n_1087));
   AN21X0 p13456A61698 (.Q(n_298), 
	.C(n_591), 
	.B(n_481), 
	.A(n_609));
   NA3X0 p1324D (.Q(n_1185), 
	.C(n_93), 
	.B(DFT_sdo_4), 
	.A(n_212));
   AO21X0 p11283A (.Q(n_552), 
	.C(n_794), 
	.B(n_211), 
	.A(n_785));
   NO2X0 p0820DT (.Q(n_423), 
	.B(n_179), 
	.A(n_180));
   NA2I1X0 p4718A (.Q(n_427), 
	.B(n_253), 
	.AN(n_179));
   ON21X0 p12119A (.Q(n_347), 
	.C(n_466), 
	.B(n_373), 
	.A(n_804));
   AO21X0 p39075A (.Q(n_2027), 
	.C(n_2001), 
	.B(n_178), 
	.A(n_609));
   AO21X0 p10199A (.Q(n_480), 
	.C(n_346), 
	.B(n_59), 
	.A(n_2008));
   AO321X0 p9630A (.Q(n_302), 
	.F(n_2041), 
	.E(n_2217), 
	.D(n_241), 
	.C(n_284), 
	.B(n_60), 
	.A(n_80));
   AO21X0 p4568A (.Q(n_721), 
	.C(n_425), 
	.B(n_2217), 
	.A(n_591));
   AO21X0 p11160A60689 (.Q(n_1099), 
	.C(n_443), 
	.B(n_259), 
	.A(n_459));
   ON222X0 p12262A (.Q(n_406), 
	.F(n_363), 
	.E(n_2116), 
	.D(n_462), 
	.C(n_844), 
	.B(n_177), 
	.A(n_193));
   ON22X0 p13647A (.Q(n_1991), 
	.D(n_175), 
	.C(n_640), 
	.B(n_176), 
	.A(n_938));
   ON21X0 p0774D (.Q(n_309), 
	.C(n_545), 
	.B(n_1170), 
	.A(n_174));
   ON21X0 p12726A60690 (.Q(n_407), 
	.C(n_471), 
	.B(n_389), 
	.A(n_173));
   AO321X0 p8679A (.Q(n_239), 
	.F(n_405), 
	.E(n_1076), 
	.D(n_171), 
	.C(n_197), 
	.B(n_172), 
	.A(n_473));
   AN21X0 p10276A (.Q(n_329), 
	.C(n_371), 
	.B(n_708), 
	.A(n_170));
   ON21X0 p11629A (.Q(n_264), 
	.C(n_871), 
	.B(n_169), 
	.A(n_589));
   AO21X0 p4299A (.Q(n_595), 
	.C(n_282), 
	.B(n_37), 
	.A(n_308));
   AN321X0 p9716A (.Q(n_706), 
	.F(n_166), 
	.E(n_785), 
	.D(n_316), 
	.C(n_2116), 
	.B(n_167), 
	.A(n_168));
   ON321X0 p10014A (.Q(n_375), 
	.F(n_366), 
	.E(n_163), 
	.D(n_556), 
	.C(n_2125), 
	.B(n_164), 
	.A(n_165));
   AN33X0 p4806A (.Q(n_403), 
	.F(n_442), 
	.E(n_1316), 
	.D(n_192), 
	.C(n_308), 
	.B(\fsm_op2[2] ), 
	.A(n_211));
   AO32X0 p12523A (.Q(n_380), 
	.E(n_1995), 
	.D(n_2118), 
	.C(n_2042), 
	.B(n_64), 
	.A(n_187));
   AO32X0 p11661A (.Q(n_839), 
	.E(n_2169), 
	.D(n_161), 
	.C(n_214), 
	.B(n_162), 
	.A(n_33));
   AN32X0 p11581A (.Q(n_698), 
	.E(n_804), 
	.D(n_466), 
	.C(n_514), 
	.B(n_194), 
	.A(n_146));
   AN21X0 p0796DT (.Q(n_994), 
	.C(n_159), 
	.B(n_160), 
	.A(n_637));
   AO21X0 p3595A (.Q(n_667), 
	.C(n_159), 
	.B(n_160), 
	.A(n_637));
   AN22X0 p10153A (.Q(n_353), 
	.D(n_29), 
	.C(n_373), 
	.B(n_157), 
	.A(n_158));
   ON222X0 p9906A (.Q(n_413), 
	.F(n_70), 
	.E(n_2101), 
	.D(n_2124), 
	.C(n_974), 
	.B(n_155), 
	.A(n_156));
   AO22X0 p13767A (.Q(n_2123), 
	.D(n_29), 
	.C(n_828), 
	.B(n_59), 
	.A(n_398));
   AO222X0 p12130A (.Q(n_312), 
	.F(n_367), 
	.E(n_209), 
	.D(n_1052), 
	.C(n_1995), 
	.B(n_320), 
	.A(n_2116));
   AN222X0 p11873A (.Q(n_370), 
	.F(n_120), 
	.E(n_153), 
	.D(n_154), 
	.C(n_2118), 
	.B(n_785), 
	.A(n_1995));
   AN321X0 p11975A (.Q(n_369), 
	.F(n_2000), 
	.E(n_151), 
	.D(n_192), 
	.C(DFT_sdo_4), 
	.B(n_152), 
	.A(n_2125));
   AN22X0 p10236A (.Q(n_340), 
	.D(n_2175), 
	.C(n_157), 
	.B(n_150), 
	.A(n_214));
   AO32X0 p12431A (.Q(n_435), 
	.E(n_591), 
	.D(n_481), 
	.C(n_162), 
	.B(n_1076), 
	.A(n_211));
   NA2X0 p12478A (.Q(n_983), 
	.B(n_250), 
	.A(n_251));
   AN33X0 p11680A (.Q(n_299), 
	.F(n_230), 
	.E(n_686), 
	.D(n_32), 
	.C(n_214), 
	.B(n_197), 
	.A(n_149));
   ON321X0 p10058A (.Q(n_243), 
	.F(n_272), 
	.E(n_148), 
	.D(n_1261), 
	.C(n_2124), 
	.B(n_235), 
	.A(n_156));
   OA22X0 p10741A (.Q(n_234), 
	.D(n_628), 
	.C(n_147), 
	.B(n_169), 
	.A(n_165));
   AN32X0 p0799D (.Q(n_511), 
	.E(n_382), 
	.D(n_337), 
	.C(n_266), 
	.B(n_1076), 
	.A(n_146));
   ON22X0 p10772A (.Q(n_333), 
	.D(n_1261), 
	.C(n_708), 
	.B(n_490), 
	.A(n_589));
   AN22X0 p12006A60691 (.Q(n_962), 
	.D(n_211), 
	.C(n_83), 
	.B(n_62), 
	.A(n_145));
   ON22X0 p9783A (.Q(n_468), 
	.D(n_143), 
	.C(n_206), 
	.B(n_144), 
	.A(n_197));
   ON21X0 p12715A60692 (.Q(n_314), 
	.C(n_142), 
	.B(n_789), 
	.A(n_147));
   AO321X0 p13064AT (.Q(n_295), 
	.F(n_1987), 
	.E(n_276), 
	.D(n_1995), 
	.C(n_154), 
	.B(n_817), 
	.A(n_133));
   AN222X0 p11734A (.Q(n_644), 
	.F(n_774), 
	.E(n_140), 
	.D(n_490), 
	.C(n_59), 
	.B(n_275), 
	.A(n_141));
   INX0 Fp11553A60693 (.Q(n_619), 
	.A(n_2040));
   NA2X0 p11487A (.Q(n_2040), 
	.B(n_366), 
	.A(n_197));
   INX0 Fp0559D (.Q(n_691), 
	.A(n_202));
   NA2X0 p0559D60694 (.Q(n_202), 
	.B(n_1113), 
	.A(n_139));
   OR2X0 p15782A (.Q(n_324), 
	.B(n_419), 
	.A(n_807));
   NO2X0 p12958A (.Q(n_2031), 
	.B(n_138), 
	.A(n_197));
   NA2X0 p0939A (.Q(n_2098), 
	.B(n_137), 
	.A(n_2020));
   NA2I1X0 p5637A (.Q(n_1031), 
	.B(n_136), 
	.AN(n_1124));
   INX0 Fp11308A60696 (.Q(n_933), 
	.A(n_310));
   AND2X0 p10908A (.Q(n_310), 
	.B(n_366), 
	.A(n_194));
   NA2X0 p10468A (.Q(n_1015), 
	.B(n_366), 
	.A(n_359));
   INX0 Fp0530A (.Q(n_434), 
	.A(n_903));
   NA2X1 p0496A (.Q(n_903), 
	.B(n_120), 
	.A(n_366));
   INX0 Fp0597A60706 (.Q(n_294), 
	.A(n_665));
   NA2X1 p0429A (.Q(n_665), 
	.B(n_59), 
	.A(n_366));
   NO2X0 p10868A (.Q(n_2109), 
	.B(n_137), 
	.A(n_1968));
   NO2X0 p13058A (.Q(n_258), 
	.B(n_2020), 
	.A(n_210));
   NO2I1X0 p12097A60710 (.Q(n_714), 
	.B(n_636), 
	.AN(n_307));
   NA2X0 p1120D (.Q(n_672), 
	.B(n_133), 
	.A(n_134));
   NO2X0 p10719A (.Q(n_461), 
	.B(n_32), 
	.A(n_2111));
   NA2X0 p1016D (.Q(n_690), 
	.B(n_132), 
	.A(n_803));
   NO2X0 p11810A60711 (.Q(n_246), 
	.B(n_534), 
	.A(n_612));
   AND2X0 p4420A (.Q(n_205), 
	.B(n_211), 
	.A(n_612));
   NA2X0 p11210A (.Q(n_842), 
	.B(n_612), 
	.A(n_2042));
   AND2X0 p12176A61699 (.Q(n_1994), 
	.B(n_601), 
	.A(n_704));
   INX0 Fp0987D (.Q(n_566), 
	.A(n_271));
   NA2X0 p0981D (.Q(n_271), 
	.B(n_401), 
	.A(n_618));
   NO2X0 p0692D (.Q(n_277), 
	.B(n_224), 
	.A(n_131));
   NO2X0 p12638A (.Q(n_2004), 
	.B(n_130), 
	.A(n_636));
   NA2X0 p39897A (.Q(n_256), 
	.B(n_128), 
	.A(n_129));
   NO2I1X0 p4337A (.Q(n_443), 
	.B(n_228), 
	.AN(n_601));
   NO2I1X0 p40873A (.Q(n_2112), 
	.B(n_935), 
	.AN(n_178));
   NO2X0 p0796D (.Q(n_323), 
	.B(n_126), 
	.A(n_127));
   INX0 Fp0986D (.Q(n_400), 
	.A(n_498));
   NA2X0 p0994D (.Q(n_498), 
	.B(n_440), 
	.A(n_585));
   NO2I1X0 p4450A (.Q(n_328), 
	.B(n_211), 
	.AN(n_618));
   AND2X0 p11403A (.Q(n_614), 
	.B(n_935), 
	.A(n_488));
   INX0 Fp0550A60717 (.Q(n_198), 
	.A(n_2041));
   NA2X1 p0468A (.Q(n_2041), 
	.B(n_535), 
	.A(n_197));
   NO2I1X0 p12163A (.Q(n_608), 
	.B(n_634), 
	.AN(n_618));
   NA2X0 p0736DT (.Q(n_606), 
	.B(n_192), 
	.A(n_804));
   NO2X0 p0926D (.Q(n_268), 
	.B(n_634), 
	.A(n_636));
   NA2X0 p1490D (.Q(n_574), 
	.B(n_200), 
	.A(n_514));
   NA2I1X0 p4796A (.Q(n_358), 
	.B(n_34), 
	.AN(n_2014));
   NO2I1X0 p11663A (.Q(n_285), 
	.B(n_297), 
	.AN(n_210));
   NO2I1X0 p0895A60718 (.Q(n_265), 
	.B(n_141), 
	.AN(n_210));
   AND2X2 p0403A (.Q(n_201), 
	.B(n_59), 
	.A(n_535));
   INX0 Fp3842A60722 (.Q(n_416), 
	.A(n_849));
   NA2X0 p3408A (.Q(n_849), 
	.B(n_261), 
	.A(n_804));
   NO2X0 p15588A (.Q(n_2029), 
	.B(n_129), 
	.A(n_636));
   INX0 Fp0810D60725 (.Q(n_195), 
	.A(n_664));
   NA2X0 p0801D60726 (.Q(n_664), 
	.B(n_211), 
	.A(n_804));
   NA2X0 p12479A61700 (.Q(n_250), 
	.B(n_634), 
	.A(n_618));
   INX0 Fp0974D (.Q(n_257), 
	.A(n_1014));
   NA2X1 p0907D (.Q(n_1014), 
	.B(n_2110), 
	.A(n_125));
   NA2X0 p0924D (.Q(n_1199), 
	.B(n_211), 
	.A(n_424));
   NO2I1X0 p10829A (.Q(n_707), 
	.B(n_216), 
	.AN(n_556));
   NA2I1X0 p13301A60727 (.Q(n_2143), 
	.B(n_1117), 
	.AN(n_2175));
   NA2X0 p5202A (.Q(n_871), 
	.B(n_211), 
	.A(n_419));
   INX0 Fp11488A (.Q(n_379), 
	.A(n_901));
   NA2X0 p11472A (.Q(n_901), 
	.B(n_2110), 
	.A(n_259));
   AND2X1 p0397A (.Q(n_1019), 
	.B(n_120), 
	.A(n_535));
   INX0 Fp0715A60728 (.Q(n_793), 
	.A(n_2126));
   NA2X1 p0539A (.Q(n_2126), 
	.B(n_535), 
	.A(DFT_sdo_4));
   AND2X0 p3973A (.Q(n_1060), 
	.B(n_535), 
	.A(n_359));
   INX0 Fp0853A60733 (.Q(n_226), 
	.A(n_850));
   NA2X0 p0727A (.Q(n_850), 
	.B(n_535), 
	.A(n_481));
   NA2X0 p11922A (.Q(n_263), 
	.B(n_125), 
	.A(n_417));
   INX0 Fp0966D60734 (.Q(n_253), 
	.A(n_180));
   NA2X0 p0976D (.Q(n_180), 
	.B(n_1117), 
	.A(n_1084));
   NA2I1X0 p6688A (.Q(n_1121), 
	.B(n_136), 
	.AN(n_727));
   NO2X0 p6054A (.Q(n_445), 
	.B(n_62), 
	.A(n_1284));
   INX0 Fp11733A60735 (.Q(n_348), 
	.A(n_196));
   NO2X0 p11310A (.Q(n_196), 
	.B(n_589), 
	.A(n_228));
   NO2I1X0 p13552A (.Q(n_2001), 
	.B(n_124), 
	.AN(n_609));
   NA2X0 p0937D (.Q(n_853), 
	.B(n_473), 
	.A(n_125));
   INX0 Fp5037A (.Q(n_1179), 
	.A(n_493));
   NA2X0 p4702A (.Q(n_493), 
	.B(n_2118), 
	.A(n_125));
   AND2X0 p18245A (.Q(n_2005), 
	.B(n_1995), 
	.A(n_499));
   AND2X0 p0796D60736 (.Q(n_212), 
	.B(n_80), 
	.A(n_282));
   NO2X0 p11478A (.Q(n_638), 
	.B(n_169), 
	.A(n_1284));
   AND2X0 p15264A (.Q(n_2006), 
	.B(n_154), 
	.A(n_499));
   NO2X0 p9309A (.Q(n_1061), 
	.B(n_235), 
	.A(n_1284));
   AND2X1 p0896D (.Q(n_290), 
	.B(n_211), 
	.A(n_609));
   NO2X0 p11286A60737 (.Q(n_794), 
	.B(n_235), 
	.A(n_589));
   AN31X0 p11654A60738 (.Q(n_655), 
	.D(n_371), 
	.C(n_2115), 
	.B(n_249), 
	.A(n_291));
   AO21X0 p11130A60739 (.Q(n_451), 
	.C(n_514), 
	.B(n_2119), 
	.A(n_785));
   ON21X0 p1127D (.Q(n_227), 
	.C(n_155), 
	.B(n_167), 
	.A(n_123));
   AO21X0 p7569A (.Q(n_1036), 
	.C(n_183), 
	.B(\fsm_op2[7] ), 
	.A(n_448));
   NO2X0 p0808D (.Q(n_335), 
	.B(n_121), 
	.A(n_122));
   AN21X0 p10892A (.Q(n_354), 
	.C(n_612), 
	.B(n_2110), 
	.A(n_197));
   OA21X0 p10810A (.Q(n_213), 
	.C(n_187), 
	.B(n_120), 
	.A(n_844));
   AND3X0 p0860D (.Q(n_159), 
	.C(DFT_sdo), 
	.B(n_119), 
	.A(n_307));
   NO3I1X0 p10732A (.Q(n_306), 
	.C(n_634), 
	.B(n_1078), 
	.AN(n_162));
   ON21X0 p13571A (.Q(n_381), 
	.C(n_708), 
	.B(n_463), 
	.A(DFT_sdo_4));
   AO21X0 p11679A60740 (.Q(n_885), 
	.C(n_531), 
	.B(n_161), 
	.A(n_779));
   AND3X0 p12372A (.Q(n_2026), 
	.C(n_120), 
	.B(n_803), 
	.A(n_490));
   AO21X0 p11142A (.Q(n_786), 
	.C(n_591), 
	.B(n_69), 
	.A(n_2013));
   NA3X0 p0946D (.Q(n_287), 
	.C(n_146), 
	.B(n_653), 
	.A(n_764));
   ON21X0 p12778A (.Q(n_254), 
	.C(n_118), 
	.B(n_233), 
	.A(n_401));
   AN21X0 p11094A (.Q(n_304), 
	.C(n_419), 
	.B(n_2170), 
	.A(n_266));
   AO21X0 p13588A (.Q(n_296), 
	.C(n_618), 
	.B(n_162), 
	.A(n_2165));
   AO31X0 p11003A (.Q(n_395), 
	.D(n_637), 
	.C(n_465), 
	.B(n_346), 
	.A(n_167));
   ON31X0 p11890A (.Q(n_802), 
	.D(n_197), 
	.C(n_2042), 
	.B(n_1024), 
	.A(n_686));
   ON211X0 p9289A (.Q(n_217), 
	.D(n_1182), 
	.C(n_708), 
	.B(n_62), 
	.A(n_117));
   AN21X0 p14803A (.Q(n_503), 
	.C(n_338), 
	.B(n_27), 
	.A(n_541));
   AO221X0 p10006A (.Q(n_1041), 
	.E(n_869), 
	.D(n_115), 
	.C(n_377), 
	.B(n_116), 
	.A(n_44));
   ON32X0 p5333A (.Q(n_431), 
	.E(n_2125), 
	.D(n_561), 
	.C(n_121), 
	.B(n_114), 
	.A(\fsm_op2[0] ));
   NA2X0 p0707DT (.Q(n_204), 
	.B(n_112), 
	.A(n_113));
   AND2X0 p13464A (.Q(n_694), 
	.B(n_112), 
	.A(n_113));
   AN22X0 p0827D (.Q(n_189), 
	.D(\fsm_op_aux_2[7] ), 
	.C(n_448), 
	.B(\fsm_op_aux_2[4] ), 
	.A(n_1168));
   AN22X0 p0880D60741 (.Q(n_190), 
	.D(\fsm_op_aux_2[3] ), 
	.C(n_1312), 
	.B(\fsm_op_aux_2[1] ), 
	.A(n_1309));
   AN22X0 p1006D (.Q(n_191), 
	.D(\fsm_op_aux_2[2] ), 
	.C(n_1243), 
	.B(\fsm_op_aux_2[0] ), 
	.A(n_869));
   MU2IX0 p0592D (.S(n_111), 
	.Q(n_203), 
	.IN1(n_185), 
	.IN0(n_110));
   AN22X0 p3988A60742 (.Q(n_752), 
	.D(n_1029), 
	.C(n_108), 
	.B(n_111), 
	.A(n_109));
   MU2IX0 p0631D (.S(n_111), 
	.Q(n_1277), 
	.IN1(n_186), 
	.IN0(n_107));
   AN22X0 p0777D (.Q(n_188), 
	.D(\fsm_op_aux_2[6] ), 
	.C(n_1347), 
	.B(\fsm_op_aux_2[5] ), 
	.A(n_106));
   AO32X0 p9754A (.Q(n_330), 
	.E(n_311), 
	.D(n_84), 
	.C(n_104), 
	.B(n_305), 
	.A(n_119));
   AO22X0 p11299A (.Q(n_598), 
	.D(n_167), 
	.C(n_785), 
	.B(n_534), 
	.A(n_2217));
   AN22X0 p9888A (.Q(n_231), 
	.D(n_36), 
	.C(n_1995), 
	.B(n_359), 
	.A(n_828));
   AN22X0 p11551A (.Q(n_281), 
	.D(n_133), 
	.C(n_2118), 
	.B(n_686), 
	.A(n_662));
   AN22X0 p10235A (.Q(n_342), 
	.D(n_359), 
	.C(n_103), 
	.B(n_703), 
	.A(n_520));
   AO22X0 p11806A (.Q(n_397), 
	.D(n_34), 
	.C(n_105), 
	.B(n_162), 
	.A(n_2042));
   AO22X0 p7341A (.Q(n_1037), 
	.D(n_71), 
	.C(n_448), 
	.B(n_98), 
	.A(n_109));
   AN33X0 p11624A (.Q(n_248), 
	.F(n_1133), 
	.E(n_104), 
	.D(n_167), 
	.C(n_311), 
	.B(n_119), 
	.A(n_774));
   AN321X0 p11142A60743 (.Q(n_280), 
	.F(n_140), 
	.E(n_2169), 
	.D(n_774), 
	.C(n_103), 
	.B(n_473), 
	.A(n_2119));
   AN22X0 p8847A (.Q(n_930), 
	.D(n_62), 
	.C(n_545), 
	.B(n_102), 
	.A(n_490));
   AO33X0 p10592A (.Q(n_357), 
	.F(n_2042), 
	.E(n_311), 
	.D(n_103), 
	.C(n_2170), 
	.B(n_303), 
	.A(DFT_sdo));
   OA22X0 p12610A (.Q(n_208), 
	.D(n_100), 
	.C(n_197), 
	.B(n_556), 
	.A(n_230));
   INX0 Fp0458A60745 (.Q(n_138), 
	.A(n_366));
   NO2X1 p0421A (.Q(n_366), 
	.B(n_32), 
	.A(n_2020));
   NA2X0 p0829D (.Q(n_113), 
	.B(n_110), 
	.A(n_1253));
   NO2I1X0 p4886A (.Q(n_824), 
	.B(n_99), 
	.AN(n_115));
   NA2X0 p5762A (.Q(n_136), 
	.B(n_1130), 
	.A(n_108));
   NO2I1X0 p6118A (.Q(n_727), 
	.B(\fsm_op2[4] ), 
	.AN(n_1168));
   INX0 Fp5849A (.Q(n_917), 
	.A(n_645));
   NA2X0 p5748A (.Q(n_645), 
	.B(\fsm_op2[0] ), 
	.A(n_869));
   NO2I1X0 p5011A (.Q(n_1030), 
	.B(\fsm_op2[1] ), 
	.AN(n_1309));
   NO2X0 p5190A (.Q(n_1093), 
	.B(\fsm_op2[2] ), 
	.A(n_378));
   AND2X0 p4343A (.Q(n_823), 
	.B(n_115), 
	.A(n_99));
   NO2I1X0 p4586A (.Q(n_1028), 
	.B(\fsm_op2[3] ), 
	.AN(n_1312));
   NO2I1X0 p5544A (.Q(n_1124), 
	.B(\fsm_op2[5] ), 
	.AN(n_106));
   NO2I1X0 p5782A (.Q(n_183), 
	.B(n_109), 
	.AN(n_98));
   INX0 Fp4670A (.Q(n_726), 
	.A(n_255));
   NA2X0 p4480A (.Q(n_255), 
	.B(n_96), 
	.A(n_97));
   NA2X0 p0904D60751 (.Q(n_112), 
	.B(n_107), 
	.A(n_41));
   NO2X0 p0843D (.Q(n_278), 
	.B(n_1261), 
	.A(n_95));
   NO2X0 p10578A (.Q(n_187), 
	.B(n_33), 
	.A(n_197));
   NO2X0 p0899A60752 (.Q(n_137), 
	.B(n_32), 
	.A(DFT_sdo_4));
   NO2X0 p0971D (.Q(n_184), 
	.B(n_1253), 
	.A(n_245));
   NO2I1X1 p0852D (.Q(n_307), 
	.B(n_94), 
	.AN(n_93));
   NO2X0 p4909A (.Q(n_807), 
	.B(n_711), 
	.A(n_228));
   NO2X0 p4295A (.Q(n_612), 
	.B(n_209), 
	.A(n_711));
   NO2I1X0 p4266A (.Q(n_758), 
	.B(n_97), 
	.AN(n_96));
   NO2X2 p0367A (.Q(n_535), 
	.B(n_33), 
	.A(n_2020));
   NO2X0 p0901A (.Q(n_210), 
	.B(n_32), 
	.A(n_1354));
   NA2X0 p11928A (.Q(n_936), 
	.B(n_32), 
	.A(n_59));
   NO2X0 p12911A (.Q(n_677), 
	.B(n_360), 
	.A(n_571));
   INX0 Fp0866D (.Q(n_368), 
	.A(n_288));
   NA2X0 p0881D (.Q(n_288), 
	.B(n_773), 
	.A(n_215));
   AND2X0 p40798A (.Q(n_1993), 
	.B(n_215), 
	.A(n_2116));
   AND2X0 p39175A (.Q(n_2030), 
	.B(n_783), 
	.A(n_178));
   NO2X0 p10189A (.Q(n_166), 
	.B(n_2119), 
	.A(n_92));
   NA2I1X0 p11918A (.Q(n_374), 
	.B(n_1260), 
	.AN(n_785));
   NO2X0 p0948D (.Q(n_155), 
	.B(n_785), 
	.A(n_597));
   NO2X0 p4266A60755 (.Q(n_601), 
	.B(n_167), 
	.A(n_711));
   NA2X0 p12754A60756 (.Q(n_251), 
	.B(n_225), 
	.A(n_2099));
   INX0 Fp0814D (.Q(n_127), 
	.A(n_444));
   NA2X0 p0815D (.Q(n_444), 
	.B(n_708), 
	.A(n_233));
   NA2X0 p10880A (.Q(n_1025), 
	.B(n_37), 
	.A(n_531));
   INX0 Fp4196A60759 (.Q(n_338), 
	.A(n_144));
   NA2X0 p3730A (.Q(n_144), 
	.B(n_2110), 
	.A(n_662));
   NO2X0 p12218A (.Q(n_2000), 
	.B(n_708), 
	.A(n_124));
   NO2I1X0 p40742A (.Q(n_2023), 
	.B(n_130), 
	.AN(n_783));
   INX0 Fp5746A (.Q(n_145), 
	.A(n_896));
   NA2X0 p5555A (.Q(n_896), 
	.B(n_261), 
	.A(n_162));
   AND2X0 p10364A (.Q(n_341), 
	.B(n_247), 
	.A(n_252));
   AND2X0 p0939D (.Q(n_223), 
	.B(n_167), 
	.A(n_373));
   AND2X1 p0842D (.Q(n_618), 
	.B(n_473), 
	.A(n_162));
   NO2X1 p0733DT (.Q(n_804), 
	.B(n_90), 
	.A(n_91));
   NA2X1 p0995D (.Q(n_636), 
	.B(n_2118), 
	.A(n_162));
   NO2X0 p1029D (.Q(n_803), 
	.B(n_2119), 
	.A(n_91));
   NO2X0 p8680A (.Q(n_436), 
	.B(n_415), 
	.A(n_2217));
   NA2X0 p11410A (.Q(n_488), 
	.B(n_89), 
	.A(n_2217));
   INX0 Fp0859D (.Q(n_173), 
	.A(n_424));
   NA2X1 p0804D60770 (.Q(n_424), 
	.B(n_708), 
	.A(n_463));
   INX0 Fp4377A (.Q(n_118), 
	.A(n_419));
   NO2X0 p4501A60775 (.Q(n_419), 
	.B(n_90), 
	.A(n_249));
   NA2X0 p0807DT (.Q(n_131), 
	.B(n_305), 
	.A(n_266));
   NO2X0 p1000D60776 (.Q(n_516), 
	.B(n_2119), 
	.A(n_249));
   NA2X0 p12854A (.Q(n_1992), 
	.B(n_620), 
	.A(n_865));
   NO2X0 p13943A60777 (.Q(n_176), 
	.B(n_29), 
	.A(n_1995));
   NA2X0 p1032D (.Q(n_471), 
	.B(n_2110), 
	.A(n_266));
   NA2X0 p0762DT (.Q(n_528), 
	.B(n_2110), 
	.A(n_545));
   AND2X0 p11380A (.Q(n_647), 
	.B(n_2110), 
	.A(n_545));
   NO2I1X0 p15470A (.Q(n_2002), 
	.B(n_708), 
	.AN(n_178));
   NO2X1 p0716D (.Q(n_591), 
	.B(n_235), 
	.A(n_91));
   NO2X0 p0985D (.Q(n_637), 
	.B(n_37), 
	.A(n_847));
   NO2X0 p13220A (.Q(n_1987), 
	.B(n_708), 
	.A(n_130));
   INX0 Fp12498A60778 (.Q(n_398), 
	.A(n_725));
   NA2X0 p12128A (.Q(n_725), 
	.B(n_211), 
	.A(n_783));
   NA2X0 p12261A (.Q(n_273), 
	.B(n_303), 
	.A(n_84));
   AND2X0 p12105A (.Q(n_1087), 
	.B(n_545), 
	.A(n_2124));
   AND2X0 p0989D (.Q(n_764), 
	.B(n_473), 
	.A(n_545));
   NA2I1X0 p13548A (.Q(n_2007), 
	.B(n_249), 
	.AN(n_545));
   NA2X0 p11284A (.Q(n_238), 
	.B(n_291), 
	.A(n_620));
   NO2X0 p5048A (.Q(n_442), 
	.B(n_62), 
	.A(n_91));
   INX0 Fp8107A60781 (.Q(n_216), 
	.A(n_952));
   NA2X0 p7578A (.Q(n_952), 
	.B(n_209), 
	.A(n_162));
   NA2X0 p0841DT (.Q(n_585), 
	.B(n_119), 
	.A(n_162));
   NO2X0 p4433A60783 (.Q(n_308), 
	.B(n_143), 
	.A(n_91));
   NA2X0 p5325A (.Q(n_404), 
	.B(n_162), 
	.A(n_817));
   NO2X0 p1174DT (.Q(n_514), 
	.B(n_249), 
	.A(n_235));
   NA2X0 p11594A (.Q(n_935), 
	.B(n_490), 
	.A(n_266));
   NO2X0 p12276A60786 (.Q(n_177), 
	.B(n_62), 
	.A(n_2157));
   NA2X0 p9966A (.Q(n_272), 
	.B(n_276), 
	.A(n_520));
   NO2X1 p0776D (.Q(n_282), 
	.B(n_249), 
	.A(n_88));
   NO2X0 p1058DT (.Q(n_382), 
	.B(n_62), 
	.A(n_249));
   NA2X0 p1086D (.Q(n_673), 
	.B(\fsm_opcode[7] ), 
	.A(n_266));
   INX0 Fp0802D60787 (.Q(n_259), 
	.A(n_589));
   NA2X1 p0786D60789 (.Q(n_589), 
	.B(n_80), 
	.A(n_266));
   NO2I1X1 p0721DT (.Q(n_125), 
	.B(n_249), 
	.AN(n_167));
   NA2X0 p5977A (.Q(n_1284), 
	.B(n_167), 
	.A(n_266));
   NO2X0 p5630A (.Q(n_499), 
	.B(n_169), 
	.A(n_249));
   NO2X0 p1006D60792 (.Q(n_570), 
	.B(n_2217), 
	.A(n_671));
   NO2X1 p0799D60793 (.Q(n_609), 
	.B(n_169), 
	.A(n_87));
   NA3X0 p0934D (.Q(n_122), 
	.C(n_2124), 
	.B(n_85), 
	.A(n_86));
   AO21X0 p9904A (.Q(n_1148), 
	.C(n_1136), 
	.B(n_1354), 
	.A(n_167));
   NO3X0 p0955D (.Q(n_675), 
	.C(n_283), 
	.B(n_29), 
	.A(n_974));
   AN21X0 p12308A (.Q(n_242), 
	.C(n_497), 
	.B(n_59), 
	.A(n_411));
   NA3X0 p12079A60794 (.Q(n_229), 
	.C(n_120), 
	.B(n_653), 
	.A(n_346));
   ON21X0 p12669A (.Q(n_970), 
	.C(n_34), 
	.B(n_209), 
	.A(n_123));
   AO21X0 p10272A (.Q(n_158), 
	.C(n_84), 
	.B(n_64), 
	.A(n_2116));
   AO21X0 p12483A (.Q(n_1999), 
	.C(n_458), 
	.B(n_686), 
	.A(n_554));
   ON21X0 p10477A (.Q(n_170), 
	.C(n_305), 
	.B(n_686), 
	.A(n_800));
   NA3X0 p5527A (.Q(n_868), 
	.C(n_37), 
	.B(n_1170), 
	.A(n_869));
   AN21X0 p11299A60795 (.Q(n_934), 
	.C(n_83), 
	.B(n_773), 
	.A(n_275));
   NO3I1X0 p39608A (.Q(n_128), 
	.C(n_2161), 
	.B(n_2169), 
	.AN(n_2101));
   NO3X0 p12042A (.Q(n_2025), 
	.C(n_249), 
	.B(n_169), 
	.A(n_82));
   NO3X0 p12139A (.Q(n_151), 
	.C(n_123), 
	.B(n_156), 
	.A(n_169));
   INX0 Fp13354A (.Q(n_456), 
	.A(n_1072));
   AN21X0 p13153A (.Q(n_1072), 
	.C(n_490), 
	.B(n_209), 
	.A(n_2119));
   AN21X0 p4309A (.Q(n_722), 
	.C(n_686), 
	.B(n_34), 
	.A(n_123));
   AO21X0 p10078A (.Q(n_150), 
	.C(n_194), 
	.B(n_64), 
	.A(n_653));
   AO21X0 p12263A (.Q(n_315), 
	.C(n_703), 
	.B(n_59), 
	.A(DFT_sdo_4));
   AN21X0 p10692A (.Q(n_147), 
	.C(n_36), 
	.B(n_209), 
	.A(n_800));
   ON21X0 p10632A (.Q(n_182), 
	.C(n_88), 
	.B(n_2217), 
	.A(DFT_sdo_4));
   NA3I1X0 p12642A (.Q(n_2049), 
	.C(n_235), 
	.B(n_561), 
	.AN(n_2137));
   AND3X0 p13570A (.Q(n_1996), 
	.C(n_60), 
	.B(n_305), 
	.A(n_704));
   AN21X0 p12471A (.Q(n_843), 
	.C(n_81), 
	.B(n_359), 
	.A(n_401));
   OR3X0 p10112A (.Q(n_331), 
	.C(n_29), 
	.B(n_2137), 
	.A(n_199));
   NA3X0 p12710A60796 (.Q(n_142), 
	.C(n_773), 
	.B(n_162), 
	.A(n_29));
   NA3X0 p13097A (.Q(n_207), 
	.C(n_209), 
	.B(n_554), 
	.A(n_2124));
   NA3I1X0 p14621A (.Q(n_2162), 
	.C(n_686), 
	.B(n_156), 
	.AN(n_316));
   AN21X0 p12762A (.Q(n_372), 
	.C(n_597), 
	.B(n_80), 
	.A(n_2118));
   AND3X0 p8488A (.Q(n_405), 
	.C(n_27), 
	.B(n_133), 
	.A(n_704));
   INX0 Fp10557A (.Q(n_2111), 
	.A(n_474));
   INX0 Fp13015A (.Q(n_2051), 
	.A(n_79));
   INX0 Fp40111A (.Q(n_2103), 
	.A(n_78));
   HAX0 p12595A (.S(n_79), 
	.CO(n_78), 
	.B(n_211), 
	.A(n_686));
   HAX0 p13116A (.S(n_77), 
	.CO(n_2011), 
	.B(n_34), 
	.A(n_80));
   INX0 Fp0584D (.Q(n_174), 
	.A(n_139));
   AND3X0 p0586D60798 (.Q(n_139), 
	.C(n_74), 
	.B(n_75), 
	.A(n_76));
   AN22X0 p3859A60799 (.Q(n_441), 
	.D(n_1968), 
	.C(n_653), 
	.B(n_146), 
	.A(n_197));
   ON211X0 p11762A (.Q(n_1098), 
	.D(n_117), 
	.C(n_34), 
	.B(n_90), 
	.A(n_2042));
   NO2X0 p0837DT (.Q(n_1243), 
	.B(n_111), 
	.A(n_73));
   NA2X0 p5085A (.Q(n_378), 
	.B(n_1029), 
	.A(n_115));
   NO2X0 p0739DT (.Q(n_448), 
	.B(n_41), 
	.A(n_72));
   NA2X0 p7776A60803 (.Q(n_1251), 
	.B(n_1253), 
	.A(n_1130));
   NA2X0 p0797DT (.Q(n_121), 
	.B(n_111), 
	.A(n_115));
   NO2X0 p0980D (.Q(n_869), 
	.B(n_1029), 
	.A(n_73));
   NO2X0 p0861D (.Q(n_1347), 
	.B(n_1253), 
	.A(n_72));
   NO2I1X0 p4744A (.Q(n_453), 
	.B(n_232), 
	.AN(\fsm_op_aux_2[0] ));
   NO2X0 p9892A (.Q(n_1136), 
	.B(n_2122), 
	.A(n_71));
   NA2X0 p12649A (.Q(n_678), 
	.B(n_2110), 
	.A(n_411));
   NA2X0 p0674DT (.Q(n_95), 
	.B(n_346), 
	.A(n_2110));
   NO2X0 p1342D (.Q(n_756), 
	.B(n_69), 
	.A(n_70));
   AND2X0 p0832D (.Q(n_486), 
	.B(n_93), 
	.A(n_481));
   NA2X0 p1158D (.Q(n_974), 
	.B(n_102), 
	.A(n_2110));
   INX0 Fp0687D60806 (.Q(n_662), 
	.A(n_711));
   NA2X0 p0707D (.Q(n_711), 
	.B(DFT_sdo), 
	.A(n_102));
   NA2X0 p0687DT (.Q(n_91), 
	.B(n_774), 
	.A(n_346));
   NO2X1 p0874D (.Q(n_162), 
	.B(n_1354), 
	.A(n_69));
   NO2X0 p0949D (.Q(n_1312), 
	.B(n_111), 
	.A(n_67));
   NO2X0 p0786D60814 (.Q(n_1168), 
	.B(n_1253), 
	.A(n_66));
   NO2X0 p13330A (.Q(n_313), 
	.B(n_123), 
	.A(n_343));
   NO2X0 p0917D60815 (.Q(n_215), 
	.B(n_2119), 
	.A(n_346));
   NA2X0 p11718A (.Q(n_658), 
	.B(n_209), 
	.A(n_346));
   NA2X0 p0683D (.Q(n_224), 
	.B(n_2110), 
	.A(n_1170));
   NO2X1 p0838D (.Q(n_785), 
	.B(\fsm_opcode[7] ), 
	.A(n_346));
   NO2X0 p12291A (.Q(n_627), 
	.B(n_62), 
	.A(n_69));
   INX0 Fp11979A (.Q(n_181), 
	.A(n_1052));
   NO2X0 p11714A (.Q(n_1052), 
	.B(n_123), 
	.A(n_520));
   NO2X0 p1138D (.Q(n_179), 
	.B(\fsm_opcode[7] ), 
	.A(n_123));
   NA2X0 p0952D (.Q(n_440), 
	.B(n_346), 
	.A(n_817));
   INX0 Fp0777D (.Q(n_466), 
	.A(n_126));
   NA2X0 p0783D (.Q(n_126), 
	.B(n_146), 
	.A(n_481));
   NA2X0 p0894DT (.Q(n_336), 
	.B(n_261), 
	.A(n_84));
   NO2X0 p8131A (.Q(n_531), 
	.B(n_708), 
	.A(n_401));
   NO2X0 p1354D (.Q(n_225), 
	.B(n_167), 
	.A(n_800));
   NA2X0 p11977A (.Q(n_2157), 
	.B(n_123), 
	.A(n_800));
   NO2X0 p0877DT (.Q(n_534), 
	.B(n_69), 
	.A(n_90));
   NA2X0 p7533A (.Q(n_415), 
	.B(n_346), 
	.A(n_2118));
   NA2X0 p1019D (.Q(n_556), 
	.B(n_211), 
	.A(n_346));
   AND2X1 p0740DT (.Q(n_266), 
	.B(n_1354), 
	.A(n_346));
   NA2X1 p0824D (.Q(n_249), 
	.B(n_1354), 
	.A(n_346));
   NO2X0 p13834A (.Q(n_640), 
	.B(n_2118), 
	.A(n_84));
   INX0 Fp10139A60826 (.Q(n_89), 
	.A(n_92));
   NA2X0 p9963A (.Q(n_92), 
	.B(n_346), 
	.A(n_490));
   NO2X0 p11181A (.Q(n_745), 
	.B(n_62), 
	.A(n_346));
   NA2X0 p12703A (.Q(n_865), 
	.B(n_473), 
	.A(n_346));
   NO2X0 p11141A (.Q(n_140), 
	.B(n_69), 
	.A(n_2115));
   NA2X0 p4509A (.Q(n_624), 
	.B(n_359), 
	.A(n_93));
   NA2X0 p0984D (.Q(n_245), 
	.B(n_27), 
	.A(n_93));
   NA2X0 p0722DT (.Q(n_847), 
	.B(n_93), 
	.A(n_197));
   NO2X0 p11300A (.Q(n_465), 
	.B(n_1110), 
	.A(DFT_sdo_4));
   NO2I1X0 p0799D60827 (.Q(n_373), 
	.B(n_169), 
	.AN(n_102));
   NO2X0 p1118D (.Q(n_160), 
	.B(n_708), 
	.A(n_2217));
   NA2X0 p10341A60828 (.Q(n_247), 
	.B(n_473), 
	.A(n_261));
   NO2X0 p12432A (.Q(n_458), 
	.B(n_120), 
	.A(n_2115));
   NO2X0 p5105A (.Q(n_360), 
	.B(n_62), 
	.A(n_123));
   NO2X0 p0856D (.Q(n_1309), 
	.B(n_1029), 
	.A(n_67));
   NO2X0 p0769D (.Q(n_106), 
	.B(n_41), 
	.A(n_66));
   NA2X0 p12190A60829 (.Q(n_507), 
	.B(n_2169), 
	.A(n_2217));
   NA2I1X0 p15324A (.Q(n_2171), 
	.B(n_2104), 
	.AN(n_2017));
   INX0 Fp11626A (.Q(n_682), 
	.A(n_571));
   NO2X0 p11684A (.Q(n_571), 
	.B(n_774), 
	.A(n_90));
   NA2X0 p12815A (.Q(n_365), 
	.B(n_102), 
	.A(n_2118));
   NO2X0 p9987A (.Q(n_828), 
	.B(n_167), 
	.A(n_708));
   NA2X0 p15517A (.Q(n_129), 
	.B(n_167), 
	.A(n_29));
   INX0 Fp0720D60835 (.Q(n_236), 
	.A(n_65));
   NO2I1X0 p0727D (.Q(n_65), 
	.B(n_90), 
	.AN(n_34));
   NA2I1X0 p8816A (.Q(n_171), 
	.B(n_34), 
	.AN(n_2152));
   NA2X0 p0774DT (.Q(n_141), 
	.B(\fsm_opcode[7] ), 
	.A(n_2166));
   NO2I1X0 p11757A (.Q(n_2048), 
	.B(n_62), 
	.AN(n_2166));
   INX0 Fp0884D60839 (.Q(n_194), 
	.A(n_94));
   NA2X0 p0892D (.Q(n_94), 
	.B(n_305), 
	.A(n_197));
   NA2X0 p0691DT (.Q(n_671), 
	.B(n_1968), 
	.A(n_481));
   AND2X0 p0842D60840 (.Q(n_337), 
	.B(n_1968), 
	.A(n_481));
   NO2X0 p10122A (.Q(n_157), 
	.B(n_206), 
	.A(n_2124));
   NO2X0 p0924D60841 (.Q(n_597), 
	.B(n_774), 
	.A(n_70));
   NO2X0 p10141A (.Q(n_276), 
	.B(n_2122), 
	.A(n_70));
   NO2X0 p15494A (.Q(n_178), 
	.B(n_120), 
	.A(n_2119));
   INX0 Fp0976D (.Q(n_470), 
	.A(n_1084));
   NA2X0 p0952D60842 (.Q(n_1084), 
	.B(DFT_sdo), 
	.A(n_490));
   NO2X0 p12017A (.Q(n_149), 
	.B(n_64), 
	.A(n_389));
   INX0 Fp0800D (.Q(n_463), 
	.A(n_63));
   NO2I1X0 p0800D (.Q(n_63), 
	.B(n_90), 
	.AN(DFT_sdo));
   NO2X0 p10250A (.Q(n_703), 
	.B(DFT_sdo), 
	.A(n_193));
   NO2X0 p11869A (.Q(n_320), 
	.B(n_64), 
	.A(n_2119));
   NO2X0 p9249A (.Q(n_783), 
	.B(n_2122), 
	.A(n_90));
   INX0 Fp10402A (.Q(n_2099), 
	.A(n_163));
   NA2X0 p9895A (.Q(n_163), 
	.B(n_62), 
	.A(n_29));
   NA2X0 p12472A (.Q(n_2121), 
	.B(n_230), 
	.A(n_82));
   NA2X0 p12538A (.Q(n_301), 
	.B(n_1354), 
	.A(n_27));
   NA2X0 p0794D (.Q(n_233), 
	.B(n_774), 
	.A(n_817));
   NO2X0 p4294A (.Q(n_495), 
	.B(n_774), 
	.A(n_235));
   NA2X0 p10228A (.Q(n_252), 
	.B(n_36), 
	.A(n_261));
   NO2X0 p8553A (.Q(n_779), 
	.B(n_169), 
	.A(n_401));
   NO2X0 p9832A (.Q(n_303), 
	.B(n_1261), 
	.A(DFT_sdo_4));
   NA2X0 p5055A (.Q(n_561), 
	.B(n_80), 
	.A(n_817));
   INX0 Fp1286D60847 (.Q(n_83), 
	.A(n_1260));
   NA2X0 p1244D (.Q(n_1260), 
	.B(n_774), 
	.A(n_490));
   NA2X0 p9200A (.Q(n_1182), 
	.B(n_774), 
	.A(n_2118));
   NA2X0 p0784DT (.Q(n_87), 
	.B(n_774), 
	.A(n_60));
   NO2X1 p0965D (.Q(n_545), 
	.B(n_1354), 
	.A(n_2122));
   INX0 Fp3845A (.Q(n_452), 
	.A(n_228));
   NA2X0 p3686A60855 (.Q(n_228), 
	.B(n_817), 
	.A(n_2217));
   NA2X0 p0624DT (.Q(n_88), 
	.B(n_490), 
	.A(n_2042));
   NO2X0 p1096D (.Q(n_417), 
	.B(n_235), 
	.A(n_2217));
   NA2X0 p12657A (.Q(n_130), 
	.B(n_59), 
	.A(n_27));
   NA2X0 p12130A60859 (.Q(n_124), 
	.B(n_120), 
	.A(n_389));
   INX0 Fp13142A (.Q(n_1411), 
	.A(n_582));
   NA2X0 p12906A (.Q(n_582), 
	.B(n_36), 
	.A(n_2118));
   INX0 Fp11176A60860 (.Q(n_152), 
	.A(n_620));
   NA2X0 p10880A60861 (.Q(n_620), 
	.B(n_209), 
	.A(n_60));
   INX0 Fp4329A60862 (.Q(n_425), 
	.A(n_1107));
   NA2X0 p4006A (.Q(n_1107), 
	.B(n_2119), 
	.A(n_490));
   INX0 Fp9923A (.Q(n_1995), 
	.A(n_789));
   NA2X0 p9843A60870 (.Q(n_789), 
	.B(n_120), 
	.A(n_305));
   NA2X0 p13602A (.Q(n_825), 
	.B(n_2119), 
	.A(n_2124));
   NO2X0 p9854A (.Q(n_311), 
	.B(n_2119), 
	.A(n_197));
   NO2X0 p40402A (.Q(n_1998), 
	.B(n_80), 
	.A(n_232));
   NA2X0 p10388A (.Q(n_165), 
	.B(n_60), 
	.A(n_27));
   NA2X0 p12496A (.Q(n_938), 
	.B(n_60), 
	.A(n_490));
   NO2X0 p10180A (.Q(n_199), 
	.B(n_37), 
	.A(n_297));
   NA2X0 p9995A60871 (.Q(n_164), 
	.B(n_2116), 
	.A(DFT_sdo_4));
   NO2X0 p8570A (.Q(n_410), 
	.B(n_37), 
	.A(n_117));
   INX0 Fp11394A60872 (.Q(n_588), 
	.A(n_105));
   NO2X0 p11189A (.Q(n_105), 
	.B(n_169), 
	.A(n_2217));
   NO2X0 p8480A (.Q(n_459), 
	.B(n_235), 
	.A(n_2042));
   NO2I1X0 p10318A (.Q(n_214), 
	.B(n_2042), 
	.AN(n_2116));
   NO2X0 p8890A (.Q(n_437), 
	.B(n_232), 
	.A(n_62));
   INX0 Fp12058A (.Q(n_175), 
	.A(n_154));
   NO2X0 p12174A60875 (.Q(n_154), 
	.B(n_59), 
	.A(n_1261));
   NO2X0 p8397A (.Q(n_704), 
	.B(n_120), 
	.A(n_169));
   NO2X0 p13382A (.Q(n_322), 
	.B(n_167), 
	.A(n_232));
   NO2X0 p10748A (.Q(n_778), 
	.B(n_2122), 
	.A(n_1133));
   NA2X0 p13708A (.Q(n_2155), 
	.B(n_628), 
	.A(n_1261));
   OR2X0 p12276A60876 (.Q(n_2159), 
	.B(n_240), 
	.A(n_2016));
   NA2X0 p15509A (.Q(n_274), 
	.B(n_133), 
	.A(n_817));
   OR2X0 p12223A (.Q(n_2050), 
	.B(n_2116), 
	.A(n_2165));
   MU2IX0 p3774AT (.S(n_41), 
	.Q(n_109), 
	.IN1(\fsm_op2[4] ), 
	.IN0(\fsm_op2[5] ));
   AO21X0 p4086A60877 (.Q(n_97), 
	.C(n_116), 
	.B(n_1029), 
	.A(n_1382));
   AN21X0 p10974A (.Q(n_1103), 
	.C(n_200), 
	.B(n_211), 
	.A(\fsm_op_aux_1[0] ));
   AO21X0 p13077A60878 (.Q(n_2164), 
	.C(n_2014), 
	.B(n_64), 
	.A(n_473));
   AO21X0 p13034A (.Q(n_2147), 
	.C(n_2128), 
	.B(DFT_sdo), 
	.A(n_120));
   INX0 Fp13655A (.Q(n_2149), 
	.A(n_58));
   AN21X0 p13423A (.Q(n_58), 
	.C(n_134), 
	.B(n_167), 
	.A(n_209));
   AO21X0 p13509A (.Q(n_2138), 
	.C(n_2008), 
	.B(n_34), 
	.A(n_211));
   ON21X0 p9770A (.Q(n_168), 
	.C(n_346), 
	.B(n_774), 
	.A(n_2124));
   NO3I1X0 p9770A60879 (.Q(n_241), 
	.C(n_37), 
	.B(n_209), 
	.AN(n_102));
   ON21X0 p9092A (.Q(n_172), 
	.C(n_232), 
	.B(n_36), 
	.A(n_2217));
   AN21X0 p12510A (.Q(n_100), 
	.C(n_275), 
	.B(n_774), 
	.A(n_167));
   AN21X0 p9988A (.Q(n_148), 
	.C(n_2170), 
	.B(n_62), 
	.A(n_520));
   ON21X0 p39320A (.Q(n_2151), 
	.C(n_474), 
	.B(n_1354), 
	.A(n_686));
   ON21X0 p40111A (.Q(n_2167), 
	.C(n_1117), 
	.B(n_36), 
	.A(n_62));
   NA2X0 p0669D (.Q(n_186), 
	.B(n_56), 
	.A(n_57));
   ON22X0 p4498A (.Q(n_99), 
	.D(\fsm_op2[2] ), 
	.C(n_111), 
	.B(\fsm_op2[0] ), 
	.A(n_1029));
   NA2X0 p0629D (.Q(n_110), 
	.B(n_54), 
	.A(n_55));
   NA2X0 p0658D (.Q(n_107), 
	.B(n_52), 
	.A(n_53));
   INX0 Fp4057A (.Q(n_1129), 
	.A(n_108));
   ON22X0 p3678A (.Q(n_108), 
	.D(\fsm_op2[7] ), 
	.C(n_41), 
	.B(\fsm_op2[6] ), 
	.A(n_1253));
   NA2X0 p0630D (.Q(n_185), 
	.B(n_50), 
	.A(n_51));
   NO2X0 p0932D (.Q(n_85), 
	.B(\fsm_op1[6] ), 
	.A(\fsm_op1[4] ));
   NA2X0 p0609D60881 (.Q(n_54), 
	.B(n_49), 
	.A(n_1316));
   NA2X0 p0752D (.Q(n_57), 
	.B(n_48), 
	.A(n_44));
   NA2X0 p0637D (.Q(n_52), 
	.B(n_47), 
	.A(n_1316));
   NO2X0 p0597D60882 (.Q(n_75), 
	.B(n_1449), 
	.A(n_1434));
   NO2X0 p0600D60883 (.Q(n_76), 
	.B(\fsm_op_aux_1[2] ), 
	.A(\fsm_op_aux_1[4] ));
   NA2X0 p0648D (.Q(n_56), 
	.B(n_46), 
	.A(n_1316));
   NA2X0 p0731D60884 (.Q(n_53), 
	.B(n_45), 
	.A(n_44));
   NA2X0 p0725D60885 (.Q(n_51), 
	.B(n_43), 
	.A(n_44));
   NA2X0 p0718D (.Q(n_55), 
	.B(n_42), 
	.A(n_44));
   INX0 Fp0918D60886 (.Q(n_115), 
	.A(n_73));
   NA2X0 p0929D (.Q(n_73), 
	.B(n_44), 
	.A(n_41));
   NO2X0 p10335A (.Q(n_918), 
	.B(\fsm_op2[4] ), 
	.A(n_1253));
   NA2X0 p0610D (.Q(n_50), 
	.B(n_40), 
	.A(n_1316));
   NO2X0 p0947D (.Q(n_86), 
	.B(\fsm_op1[3] ), 
	.A(\fsm_op1[5] ));
   NA2X0 p0747DT (.Q(n_72), 
	.B(n_1029), 
	.A(n_1316));
   NO2X0 p6079A (.Q(n_1130), 
	.B(n_44), 
	.A(n_111));
   NO2X0 p10280A (.Q(n_649), 
	.B(n_62), 
	.A(n_1113));
   NO2X0 p4013A61701 (.Q(n_116), 
	.B(\fsm_op2[1] ), 
	.A(n_1029));
   NO2X0 p0587D (.Q(n_74), 
	.B(\fsm_op_aux_1[5] ), 
	.A(\fsm_op_aux_1[6] ));
   NA2X0 p0790DT (.Q(n_67), 
	.B(n_44), 
	.A(n_1253));
   NO2X0 p4414A (.Q(n_96), 
	.B(n_1316), 
	.A(n_41));
   INX0 Fp0794D (.Q(n_98), 
	.A(n_66));
   NA2X0 p0803D (.Q(n_66), 
	.B(n_1316), 
	.A(n_111));
   NA2X0 p10568A (.Q(n_1078), 
	.B(n_1253), 
	.A(n_520));
   INX0 Fp0915D (.Q(n_607), 
	.A(n_283));
   NA2X0 p0889D (.Q(n_283), 
	.B(n_1968), 
	.A(n_197));
   INX0 Fp1128D (.Q(n_411), 
	.A(n_800));
   NA2X0 p1022D (.Q(n_800), 
	.B(n_64), 
	.A(n_1354));
   INX0 Fp0900D60893 (.Q(n_161), 
	.A(n_123));
   NA2X0 p0915D (.Q(n_123), 
	.B(DFT_sdo), 
	.A(n_774));
   NO2X2 p0603DT (.Q(n_346), 
	.B(n_36), 
	.A(DFT_sdo));
   NA2X1 p0854D (.Q(n_69), 
	.B(n_34), 
	.A(n_64));
   NO2X0 p4694A (.Q(n_2014), 
	.B(n_64), 
	.A(n_473));
   NO2X0 p0759DT (.Q(n_93), 
	.B(n_2020), 
	.A(n_120));
   NA2X0 p2239A (.Q(n_1110), 
	.B(n_1968), 
	.A(n_59));
   NA2X0 p40355A (.Q(n_2100), 
	.B(DFT_sdo), 
	.A(n_80));
   INX0 Fp9499A (.Q(n_104), 
	.A(n_363));
   NA2X0 p9271A (.Q(n_363), 
	.B(DFT_sdo), 
	.A(DFT_sdo_4));
   NO2X0 p12898A (.Q(n_2128), 
	.B(DFT_sdo), 
	.A(n_120));
   NO2X0 p13238A (.Q(n_2174), 
	.B(DFT_sdo), 
	.A(n_686));
   NA2X0 p12390A (.Q(n_1322), 
	.B(n_1029), 
	.A(n_2124));
   NO2X0 p15172A (.Q(n_2017), 
	.B(n_1354), 
	.A(n_473));
   NA2X0 p15436A (.Q(n_2104), 
	.B(n_1354), 
	.A(n_473));
   NO2X0 p0780D (.Q(n_102), 
	.B(n_36), 
	.A(n_774));
   NO2X0 p12412A (.Q(n_2012), 
	.B(n_64), 
	.A(n_211));
   NO2X0 p12460A (.Q(n_2127), 
	.B(DFT_sdo), 
	.A(n_167));
   NA2X0 p13132A (.Q(n_1108), 
	.B(n_34), 
	.A(n_2124));
   NO2X0 p10842A60908 (.Q(n_2175), 
	.B(n_36), 
	.A(n_209));
   INX0 Fp5433A (.Q(n_2136), 
	.A(n_114));
   NA2X0 p5355A (.Q(n_114), 
	.B(n_209), 
	.A(n_80));
   INX0 Fp11683A (.Q(n_153), 
	.A(n_300));
   NA2X0 p11381A (.Q(n_300), 
	.B(n_36), 
	.A(DFT_sdo_4));
   NA2X0 p1050D (.Q(n_2154), 
	.B(n_36), 
	.A(n_80));
   NO2X0 p40400A (.Q(n_2134), 
	.B(n_36), 
	.A(n_80));
   NO2X0 p0881DT (.Q(n_146), 
	.B(n_59), 
	.A(n_2020));
   NA2X0 p12118A (.Q(n_1024), 
	.B(n_120), 
	.A(n_1968));
   NO2X0 p12855A60909 (.Q(n_2130), 
	.B(n_1354), 
	.A(n_59));
   NO2X0 p5809A (.Q(n_497), 
	.B(n_774), 
	.A(n_686));
   NO2X0 p12840A (.Q(n_2129), 
	.B(n_774), 
	.A(n_120));
   NA2X0 p9605A (.Q(n_206), 
	.B(n_80), 
	.A(DFT_sdo_4));
   INX1 Fp0562D60914 (.Q(n_481), 
	.A(n_38));
   NA2X1 p0561D (.Q(n_38), 
	.B(n_37), 
	.A(n_197));
   NO2X0 p10050A (.Q(n_284), 
	.B(n_120), 
	.A(n_209));
   NA2X1 p0600DT (.Q(n_90), 
	.B(\fsm_opcode[7] ), 
	.A(n_209));
   NO2X1 p1048D (.Q(n_2118), 
	.B(n_62), 
	.A(n_473));
   NO2X0 p12511A61702 (.Q(n_2142), 
	.B(n_36), 
	.A(n_686));
   INX0 Fp0713D60929 (.Q(n_84), 
	.A(n_708));
   OR2X1 p0734D60932 (.Q(n_708), 
	.B(n_34), 
	.A(n_62));
   NO2X0 p15652A (.Q(n_2102), 
	.B(n_59), 
	.A(n_473));
   INX0 Fp5554A (.Q(n_396), 
	.A(n_1285));
   NA2X0 p5328A (.Q(n_1285), 
	.B(n_686), 
	.A(n_520));
   NO2X1 p0612DT (.Q(n_2110), 
	.B(\fsm_opcode[7] ), 
	.A(n_209));
   NA2X0 p0956D (.Q(n_70), 
	.B(n_62), 
	.A(n_473));
   NO2X0 p8826A (.Q(n_2152), 
	.B(DFT_sdo), 
	.A(n_59));
   INX0 Fp8406A60941 (.Q(n_275), 
	.A(n_117));
   NA2X0 p8361A (.Q(n_117), 
	.B(DFT_sdo), 
	.A(n_1354));
   NA2X0 p11196A (.Q(n_291), 
	.B(DFT_sdo), 
	.A(n_211));
   INX0 Fp0809D60949 (.Q(n_60), 
	.A(n_2122));
   NA2X2 p0795D (.Q(n_2122), 
	.B(DFT_sdo), 
	.A(n_34));
   NO2X0 p14091A (.Q(n_2009), 
	.B(DFT_sdo), 
	.A(n_37));
   NO2X0 p12210A (.Q(n_541), 
	.B(n_64), 
	.A(n_686));
   INX0 Fp11798A (.Q(n_364), 
	.A(n_2117));
   NO2X0 p11449A60952 (.Q(n_2117), 
	.B(DFT_sdo), 
	.A(n_62));
   INX0 Fp10649A (.Q(n_103), 
	.A(n_844));
   NA2X0 p10248A (.Q(n_844), 
	.B(n_64), 
	.A(n_774));
   NO2X0 p13039A (.Q(n_2146), 
	.B(n_64), 
	.A(n_120));
   NA2X0 p9770A60955 (.Q(n_2115), 
	.B(n_80), 
	.A(n_686));
   NO2X0 p1044DT (.Q(n_29), 
	.B(n_80), 
	.A(n_120));
   NA2X0 p12245A (.Q(n_230), 
	.B(n_37), 
	.A(n_59));
   NA2X0 p12223A60961 (.Q(n_82), 
	.B(n_80), 
	.A(n_120));
   NO2X0 p12804A (.Q(n_2161), 
	.B(n_80), 
	.A(n_686));
   AND2X0 p0824D60962 (.Q(n_1076), 
	.B(n_62), 
	.A(n_197));
   INX0 Fp9177A60964 (.Q(n_81), 
	.A(n_371));
   NA2X0 p9066A (.Q(n_371), 
	.B(n_120), 
	.A(DFT_sdo_4));
   NO2X0 p1098D (.Q(n_134), 
	.B(n_167), 
	.A(n_209));
   NO2X0 p10202A (.Q(n_2008), 
	.B(n_34), 
	.A(n_211));
   NO2X0 p0827D60965 (.Q(n_773), 
	.B(n_62), 
	.A(n_2042));
   INX0 Fp1009D (.Q(n_399), 
	.A(n_132));
   NO2X0 p0994D60966 (.Q(n_132), 
	.B(\fsm_opcode[7] ), 
	.A(n_2217));
   NO2X0 p10916A (.Q(n_2169), 
	.B(n_120), 
	.A(n_686));
   INX0 Fp10029A (.Q(n_2170), 
	.A(n_343));
   NA2X0 p9947A (.Q(n_343), 
	.B(n_120), 
	.A(n_686));
   NA2X1 p0759DT60985 (.Q(n_2119), 
	.B(n_80), 
	.A(n_167));
   NO2X1 p0943D60986 (.Q(n_305), 
	.B(n_37), 
	.A(n_211));
   NO2X0 p1105DT (.Q(n_200), 
	.B(n_80), 
	.A(n_167));
   NA2X0 p1388D (.Q(n_719), 
	.B(n_37), 
	.A(n_211));
   NA2X1 p0725DT (.Q(n_401), 
	.B(n_167), 
	.A(n_2217));
   NO2X1 p0941D (.Q(n_261), 
	.B(n_211), 
	.A(n_2042));
   NO2X0 p13836A61703 (.Q(n_2010), 
	.B(n_211), 
	.A(n_62));
   NO2X0 p0995D60997 (.Q(n_2166), 
	.B(n_120), 
	.A(n_167));
   NO2X0 p14070A (.Q(n_2150), 
	.B(n_167), 
	.A(n_686));
   NO2X0 p15707A (.Q(n_2114), 
	.B(n_774), 
	.A(n_59));
   NO2X0 p40322A (.Q(n_2141), 
	.B(n_37), 
	.A(n_774));
   NA2X0 p10187A (.Q(n_474), 
	.B(n_1354), 
	.A(n_686));
   NO2X0 p16036A (.Q(n_2015), 
	.B(n_1354), 
	.A(n_167));
   INX0 Fp0865D (.Q(n_133), 
	.A(n_232));
   NA2X0 p0801D61002 (.Q(n_232), 
	.B(n_34), 
	.A(n_774));
   NA2X1 p0626DT (.Q(n_235), 
	.B(n_209), 
	.A(n_62));
   NO2X1 p0919D (.Q(n_490), 
	.B(\fsm_opcode[7] ), 
	.A(n_473));
   INX0 Fp10075A (.Q(n_546), 
	.A(n_1133));
   NA2X0 p9673A (.Q(n_1133), 
	.B(n_473), 
	.A(n_520));
   NA2X1 p0719DT (.Q(n_169), 
	.B(\fsm_opcode[7] ), 
	.A(n_473));
   NO2X1 p0956D61025 (.Q(n_817), 
	.B(n_209), 
	.A(n_62));
   NO2X0 p12153A (.Q(n_2016), 
	.B(n_36), 
	.A(n_59));
   NO2X0 p10229A (.Q(n_240), 
	.B(n_120), 
	.A(n_34));
   NA2X0 p1085D (.Q(n_1117), 
	.B(n_36), 
	.A(n_62));
   NO2X0 p40191A (.Q(n_2113), 
	.B(n_36), 
	.A(n_473));
   NO2X0 p10260A (.Q(n_2137), 
	.B(n_80), 
	.A(n_473));
   NO2X0 p11840A (.Q(n_386), 
	.B(n_37), 
	.A(n_2217));
   NO2X1 p0457DT (.Q(n_359), 
	.B(n_80), 
	.A(n_197));
   NA2X0 p0970D (.Q(n_193), 
	.B(n_37), 
	.A(DFT_sdo_4));
   NO2X0 p10465A (.Q(n_316), 
	.B(n_120), 
	.A(n_37));
   INX0 Fp0985D61030 (.Q(n_389), 
	.A(n_628));
   NA2X0 p0885D (.Q(n_628), 
	.B(n_167), 
	.A(n_37));
   NO2X0 p11324A (.Q(n_2013), 
	.B(n_37), 
	.A(n_686));
   INX0 Fp10433A61034 (.Q(n_367), 
	.A(n_462));
   NA2X0 p10117A (.Q(n_462), 
	.B(n_211), 
	.A(DFT_sdo_4));
   NO2X0 p11680A61035 (.Q(n_2168), 
	.B(n_80), 
	.A(n_62));
   INX0 Fp10048A61036 (.Q(n_554), 
	.A(n_156));
   NA2X0 p10035A (.Q(n_156), 
	.B(n_120), 
	.A(n_37));
   INX0 Fp0790D (.Q(n_27), 
	.A(n_1261));
   NA2X2 p0816D (.Q(n_1261), 
	.B(n_80), 
	.A(n_211));
   AND2X0 p0808D61050 (.Q(n_653), 
	.B(n_80), 
	.A(n_197));
   NO2I1X0 p0792DT (.Q(n_119), 
	.B(n_2217), 
	.AN(\fsm_opcode[7] ));
   NA2X0 p4195A (.Q(n_143), 
	.B(\fsm_opcode[7] ), 
	.A(n_2042));
   NO2X0 p0705DT (.Q(n_192), 
	.B(n_211), 
	.A(n_2217));
   NA2X0 p0886D (.Q(n_634), 
	.B(n_167), 
	.A(n_2042));
   NO2X0 p10117A61057 (.Q(n_2116), 
	.B(n_120), 
	.A(n_62));
   NO2X0 p16026A (.Q(n_2172), 
	.B(n_211), 
	.A(n_120));
   NA2X0 p10068A (.Q(n_2101), 
	.B(n_120), 
	.A(n_211));
   INX0 Fp10013A (.Q(n_2165), 
	.A(n_297));
   NA2X0 p9554A61704 (.Q(n_297), 
	.B(n_120), 
	.A(n_62));
   INX0 Fp0685D61089 (.Q(n_2125), 
	.A(n_1170));
   INX0 Fp0719D61115 (.Q(n_111), 
	.A(n_1029));
   INX1 Fp0628D61147 (.Q(n_1354), 
	.A(n_774));
   INX1 Fp0398D61188 (.Q(n_59), 
	.A(n_120));
   INX0 Fp0757D61222 (.Q(n_41), 
	.A(n_1253));
   INX0 Fp2099A (.Q(n_1439), 
	.A(\fsm_op2[1] ));
   INX1 Fp0631D61260 (.Q(n_473), 
	.A(n_209));
   INX2 Fp0322D61298 (.Q(n_197), 
	.A(DFT_sdo_4));
   INX1 Fp0616D61327 (.Q(n_64), 
	.A(DFT_sdo));
   INX0 Fp1109D (.Q(n_352), 
	.A(\fsm_op2[0] ));
   INX0 Fp0945D (.Q(n_42), 
	.A(\fsm_op_aux_2[3] ));
   INX0 Fp0982D (.Q(n_45), 
	.A(\fsm_op_aux_2[2] ));
   INX2 Fp0646D61376 (.Q(n_37), 
	.A(n_80));
   INX0 Fp2953A61381 (.Q(n_71), 
	.A(\fsm_op2[7] ));
   INX2 Fp0692D61454 (.Q(n_211), 
	.A(n_167));
   INX0 Fp0946D (.Q(n_46), 
	.A(\fsm_op_aux_2[4] ));
   INX0 Fp0468D (.Q(n_730), 
	.A(\fsm_op_aux_1[2] ));
   INX0 Fp0355D61465 (.Q(n_1968), 
	.A(n_2020));
   INX0 Fp0589D61489 (.Q(n_44), 
	.A(n_1316));
   INX0 Fp0506D (.Q(n_737), 
	.A(\fsm_op_aux_1[5] ));
   INX1 Fp0727D61536 (.Q(n_2042), 
	.A(n_2217));
   INX0 Fp0678D61537 (.Q(n_1113), 
	.A(\fsm_op_aux_1[0] ));
   INX0 Fp2084A (.Q(n_377), 
	.A(\fsm_op2[2] ));
   INX0 Fp0850D (.Q(n_900), 
	.A(\fsm_op1[5] ));
   INX0 Fp0902D (.Q(n_49), 
	.A(\fsm_op_aux_2[7] ));
   INX0 Fp0979D (.Q(n_48), 
	.A(\fsm_op_aux_2[0] ));
   INX0 Fp2284A61543 (.Q(n_1382), 
	.A(\fsm_op2[3] ));
   INX0 Fp0910D (.Q(n_40), 
	.A(\fsm_op_aux_2[5] ));
   INX1 Fp0568D61583 (.Q(n_34), 
	.A(n_36));
   INX0 Fp1016D61628 (.Q(n_2124), 
	.A(n_520));
   INX0 Fp0944D (.Q(n_43), 
	.A(\fsm_op_aux_2[1] ));
   INX0 Fp0505D (.Q(n_735), 
	.A(\fsm_op_aux_1[4] ));
   INX0 Fp0944D61630 (.Q(n_47), 
	.A(\fsm_op_aux_2[6] ));
   INX0 Fp0573D61673 (.Q(n_686), 
	.A(n_62));
   INX2 Fp0573D61685 (.Q(n_62), 
	.A(\fsm_opcode[7] ));
   INX0 Fp3284A (.Q(n_872), 
	.A(\fsm_op2[6] ));
   INX0 fopt (.Q(n_33), 
	.A(n_32));
endmodule

module core_mem_ctrl (
	mem_ctrl_clk_i, 
	mem_ctrl_rom_rd_b_i, 
	mem_ctrl_ram_rd_b_i, 
	mem_ctrl_ram_wr_b_i, 
	mem_ctrl_bit_byte_flag_i, 
	mem_ctrl_ext_ram_i, 
	mem_ctrl_rom_addr_i, 
	mem_ctrl_ram_addr_i, 
	mem_ctrl_ram_data_i, 
	mem_ctrl_bus_ctrl_ea_b_i, 
	mem_ctrl_bus_ctrl_data_i, 
	mem_ctrl_bus_ctrl_data_o, 
	mem_ctrl_bus_ctrl_addr_o, 
	mem_ctrl_bus_ctrl_ext_rom_rd_b_o, 
	mem_ctrl_bus_ctrl_ext_ram_rd_b_o, 
	mem_ctrl_bus_ctrl_ext_ram_wr_b_o, 
	mem_ctrl_rom_data_o, 
	mem_ctrl_ram_data_o);
   input mem_ctrl_clk_i;
   input mem_ctrl_rom_rd_b_i;
   input mem_ctrl_ram_rd_b_i;
   input mem_ctrl_ram_wr_b_i;
   input mem_ctrl_bit_byte_flag_i;
   input mem_ctrl_ext_ram_i;
   input [15:0] mem_ctrl_rom_addr_i;
   input [7:0] mem_ctrl_ram_addr_i;
   input [7:0] mem_ctrl_ram_data_i;
   input mem_ctrl_bus_ctrl_ea_b_i;
   input [7:0] mem_ctrl_bus_ctrl_data_i;
   output [7:0] mem_ctrl_bus_ctrl_data_o;
   output [15:0] mem_ctrl_bus_ctrl_addr_o;
   output mem_ctrl_bus_ctrl_ext_rom_rd_b_o;
   output mem_ctrl_bus_ctrl_ext_ram_rd_b_o;
   output mem_ctrl_bus_ctrl_ext_ram_wr_b_o;
   output [7:0] mem_ctrl_rom_data_o;
   output [7:0] mem_ctrl_ram_data_o;

   // Internal wires
   wire \int_ram_data_o[0] ;
   wire \int_ram_data_o[1] ;
   wire \int_ram_data_o[2] ;
   wire \int_ram_data_o[3] ;
   wire \int_ram_data_o[4] ;
   wire \int_ram_data_o[5] ;
   wire \int_ram_data_o[6] ;
   wire \int_ram_data_o[7] ;
   wire \int_rom_data_o[0] ;
   wire \int_rom_data_o[1] ;
   wire \int_rom_data_o[2] ;
   wire \int_rom_data_o[3] ;
   wire \int_rom_data_o[4] ;
   wire \int_rom_data_o[5] ;
   wire \int_rom_data_o[6] ;
   wire \int_rom_data_o[7] ;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_13;
   wire n_24;
   wire n_56;
   wire n_61;
   wire n_62;
   wire n_64;
   wire n_65;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_115;
   wire n_117;
   wire n_120;

   SPRAM128X8 internal_ram (.WEB(n_115), 
	.Q({ \int_ram_data_o[7] ,
		\int_ram_data_o[6] ,
		\int_ram_data_o[5] ,
		\int_ram_data_o[4] ,
		\int_ram_data_o[3] ,
		\int_ram_data_o[2] ,
		\int_ram_data_o[1] ,
		\int_ram_data_o[0]  }), 
	.OEB(n_117), 
	.ENB(n_24), 
	.D({ n_91,
		n_90,
		n_89,
		n_88,
		n_87,
		n_86,
		n_85,
		n_84 }), 
	.CLK(mem_ctrl_clk_i), 
	.ADR({ n_96,
		n_92,
		n_106,
		n_83,
		n_82,
		n_81,
		n_80 }));
   ROM4096X8 internal_rom (.Q({ \int_rom_data_o[7] ,
		\int_rom_data_o[6] ,
		\int_rom_data_o[5] ,
		\int_rom_data_o[4] ,
		\int_rom_data_o[3] ,
		\int_rom_data_o[2] ,
		\int_rom_data_o[1] ,
		\int_rom_data_o[0]  }), 
	.OEB(n_120), 
	.ENB(n_120), 
	.CLK(mem_ctrl_clk_i), 
	.ADR({ n_97,
		n_95,
		n_94,
		n_93,
		n_105,
		n_104,
		n_103,
		n_102,
		n_101,
		n_100,
		n_99,
		n_98 }));
   AO22X0 p3459A (.Q(mem_ctrl_rom_data_o[7]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[7]), 
	.B(n_13), 
	.A(\int_rom_data_o[7] ));
   AO22X0 p3446A (.Q(mem_ctrl_rom_data_o[4]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[4]), 
	.B(n_13), 
	.A(\int_rom_data_o[4] ));
   AO22X0 p3446A1646 (.Q(mem_ctrl_rom_data_o[1]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[1]), 
	.B(n_13), 
	.A(\int_rom_data_o[1] ));
   AO22X0 p3841D (.Q(mem_ctrl_ram_data_o[1]), 
	.D(mem_ctrl_bus_ctrl_data_i[1]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[1] ), 
	.A(n_11));
   AO22X0 p3841D1647 (.Q(mem_ctrl_ram_data_o[0]), 
	.D(mem_ctrl_bus_ctrl_data_i[0]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[0] ), 
	.A(n_11));
   AO22X0 p3446A1648 (.Q(mem_ctrl_rom_data_o[0]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[0]), 
	.B(n_13), 
	.A(\int_rom_data_o[0] ));
   AO22X0 p3446A1649 (.Q(mem_ctrl_rom_data_o[3]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[3]), 
	.B(n_13), 
	.A(\int_rom_data_o[3] ));
   AO22X0 p3832D (.Q(mem_ctrl_ram_data_o[7]), 
	.D(mem_ctrl_bus_ctrl_data_i[7]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[7] ), 
	.A(n_11));
   AO22X0 p3832D1650 (.Q(mem_ctrl_ram_data_o[6]), 
	.D(mem_ctrl_bus_ctrl_data_i[6]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[6] ), 
	.A(n_11));
   AO22X0 p3458A (.Q(mem_ctrl_rom_data_o[6]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[6]), 
	.B(n_13), 
	.A(\int_rom_data_o[6] ));
   AO22X0 p3458A1651 (.Q(mem_ctrl_rom_data_o[5]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[5]), 
	.B(n_13), 
	.A(\int_rom_data_o[5] ));
   AO22X0 p3844A (.Q(mem_ctrl_ram_data_o[5]), 
	.D(mem_ctrl_bus_ctrl_data_i[5]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[5] ), 
	.A(n_11));
   AO22X0 p3446A1652 (.Q(mem_ctrl_rom_data_o[2]), 
	.D(n_56), 
	.C(mem_ctrl_bus_ctrl_data_i[2]), 
	.B(n_13), 
	.A(\int_rom_data_o[2] ));
   AO22X0 p3841D1653 (.Q(mem_ctrl_ram_data_o[4]), 
	.D(mem_ctrl_bus_ctrl_data_i[4]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[4] ), 
	.A(n_11));
   AO22X0 p3841D1654 (.Q(mem_ctrl_ram_data_o[3]), 
	.D(mem_ctrl_bus_ctrl_data_i[3]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[3] ), 
	.A(n_11));
   AO22X0 p3843D (.Q(mem_ctrl_ram_data_o[2]), 
	.D(mem_ctrl_bus_ctrl_data_i[2]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[2] ), 
	.A(n_11));
   INX0 Fp4474A (.Q(n_13), 
	.A(n_56));
   INX0 Fp16782A1655 (.Q(n_11), 
	.A(mem_ctrl_ext_ram_i));
   AO22X0 p2368A (.Q(mem_ctrl_bus_ctrl_addr_o[7]), 
	.D(mem_ctrl_ram_addr_i[7]), 
	.C(n_6), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[7]));
   AO22X0 p2368A1889 (.Q(mem_ctrl_bus_ctrl_addr_o[3]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[3]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[3]));
   AO22X0 p2368A1890 (.Q(mem_ctrl_bus_ctrl_addr_o[2]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[2]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[2]));
   AO22X0 p2368A1891 (.Q(mem_ctrl_bus_ctrl_addr_o[1]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[1]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[1]));
   AO22X0 p2368A1892 (.Q(mem_ctrl_bus_ctrl_addr_o[0]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[0]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[0]));
   AO22X0 p2368A1893 (.Q(mem_ctrl_bus_ctrl_addr_o[6]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[6]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[6]));
   AO22X0 p2368A1894 (.Q(mem_ctrl_bus_ctrl_addr_o[5]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[5]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[5]));
   AO22X0 p2368A1895 (.Q(mem_ctrl_bus_ctrl_addr_o[4]), 
	.D(n_6), 
	.C(mem_ctrl_ram_addr_i[4]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[4]));
   AND2X0 p2352A (.Q(mem_ctrl_bus_ctrl_addr_o[10]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[10]));
   NO2I1X1 p5309A (.Q(n_99), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[1]));
   AND2X0 p2352A1896 (.Q(mem_ctrl_bus_ctrl_addr_o[9]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[9]));
   NO2I1X1 p5309A1897 (.Q(n_103), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[5]));
   AND2X0 p2352A1898 (.Q(mem_ctrl_bus_ctrl_addr_o[8]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[8]));
   AND2X0 p2352A1899 (.Q(mem_ctrl_bus_ctrl_addr_o[11]), 
	.B(n_10), 
	.A(mem_ctrl_rom_addr_i[11]));
   NO2I1X1 p5309A1900 (.Q(n_97), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[11]));
   NO2I1X1 p5309A1901 (.Q(n_95), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[10]));
   NO2I1X1 p5309A1902 (.Q(n_94), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[9]));
   NO2I1X1 p5309A1903 (.Q(n_93), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[8]));
   NO2I1X1 p5309A1904 (.Q(n_105), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[7]));
   NO2I1X1 p5309A1905 (.Q(n_104), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[6]));
   NO2I1X1 p5309A1906 (.Q(n_102), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[4]));
   NO2I1X1 p5309A1907 (.Q(n_101), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[3]));
   NO2I1X1 p5309A1908 (.Q(n_100), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[2]));
   NO2I1X1 p5309A1909 (.Q(n_98), 
	.B(n_120), 
	.AN(mem_ctrl_rom_addr_i[0]));
   AO22X0 p12986A (.Q(n_83), 
	.D(n_8), 
	.C(mem_ctrl_ram_addr_i[6]), 
	.B(n_9), 
	.A(mem_ctrl_ram_addr_i[3]));
   AO22X0 p15258A (.Q(n_82), 
	.D(n_8), 
	.C(mem_ctrl_ram_addr_i[5]), 
	.B(n_9), 
	.A(mem_ctrl_ram_addr_i[2]));
   AO22X0 p13054A (.Q(n_81), 
	.D(n_8), 
	.C(mem_ctrl_ram_addr_i[4]), 
	.B(mem_ctrl_ram_addr_i[1]), 
	.A(n_9));
   AO22X0 p13054A1910 (.Q(n_80), 
	.D(n_8), 
	.C(mem_ctrl_ram_addr_i[3]), 
	.B(mem_ctrl_ram_addr_i[0]), 
	.A(n_9));
   AND2X0 p3051A (.Q(mem_ctrl_bus_ctrl_addr_o[13]), 
	.B(mem_ctrl_rom_addr_i[13]), 
	.A(n_7));
   AND2X0 p3023A (.Q(mem_ctrl_bus_ctrl_addr_o[12]), 
	.B(mem_ctrl_rom_addr_i[12]), 
	.A(n_7));
   AND2X0 p3023A1911 (.Q(mem_ctrl_bus_ctrl_addr_o[15]), 
	.B(mem_ctrl_rom_addr_i[15]), 
	.A(n_7));
   AND2X0 p15290A (.Q(n_96), 
	.B(n_9), 
	.A(mem_ctrl_ram_addr_i[6]));
   AND2X0 p13073A (.Q(n_106), 
	.B(n_9), 
	.A(mem_ctrl_ram_addr_i[4]));
   AND2X0 p3051A1912 (.Q(mem_ctrl_bus_ctrl_addr_o[14]), 
	.B(mem_ctrl_rom_addr_i[14]), 
	.A(n_7));
   OR2X2 p3300A (.Q(n_120), 
	.B(n_56), 
	.A(mem_ctrl_rom_rd_b_i));
   INX0 Fp1184A1915 (.Q(n_10), 
	.A(mem_ctrl_bus_ctrl_ext_rom_rd_b_o));
   NA2X0 p0884D (.Q(mem_ctrl_bus_ctrl_ext_rom_rd_b_o), 
	.B(n_56), 
	.A(n_7));
   AO21X0 p15244A (.Q(n_92), 
	.C(n_8), 
	.B(n_5), 
	.A(mem_ctrl_ram_addr_i[5]));
   NO2I1X0 p2728A (.Q(mem_ctrl_bus_ctrl_data_o[7]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[7]));
   AND2X0 p7314A (.Q(n_88), 
	.B(mem_ctrl_ram_data_i[4]), 
	.A(n_5));
   AND2X0 p6970A (.Q(n_87), 
	.B(mem_ctrl_ram_data_i[3]), 
	.A(n_5));
   AND2X0 p7000A (.Q(n_86), 
	.B(mem_ctrl_ram_data_i[2]), 
	.A(n_5));
   AND2X0 p7000A1917 (.Q(n_84), 
	.B(mem_ctrl_ram_data_i[0]), 
	.A(n_5));
   NO2I1X0 p2415A (.Q(mem_ctrl_bus_ctrl_data_o[2]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[2]));
   AND2X0 p7314A1918 (.Q(n_91), 
	.B(mem_ctrl_ram_data_i[7]), 
	.A(n_5));
   NO2I1X0 p2415A1919 (.Q(mem_ctrl_bus_ctrl_data_o[1]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[1]));
   AND2X0 p7000A1920 (.Q(n_85), 
	.B(mem_ctrl_ram_data_i[1]), 
	.A(n_5));
   NO2I1X0 p2756A (.Q(mem_ctrl_bus_ctrl_data_o[6]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[6]));
   NO2I1X0 p2415A1921 (.Q(mem_ctrl_bus_ctrl_data_o[0]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[0]));
   NO2I1X0 p2756A1922 (.Q(mem_ctrl_bus_ctrl_data_o[5]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[5]));
   NO2X0 p14689A (.Q(n_9), 
	.B(mem_ctrl_bit_byte_flag_i), 
	.A(n_24));
   AND2X0 p14828A (.Q(n_8), 
	.B(mem_ctrl_bit_byte_flag_i), 
	.A(n_5));
   NO2X0 p11964A (.Q(n_7), 
	.B(mem_ctrl_rom_rd_b_i), 
	.A(n_6));
   AND2X0 p7341A (.Q(n_89), 
	.B(mem_ctrl_ram_data_i[5]), 
	.A(n_5));
   NO2I1X0 p2385A (.Q(mem_ctrl_bus_ctrl_data_o[3]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[3]));
   NO2I1X0 p2728A1923 (.Q(mem_ctrl_bus_ctrl_data_o[4]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[4]));
   AND2X0 p7341A1924 (.Q(n_90), 
	.B(mem_ctrl_ram_data_i[6]), 
	.A(n_5));
   NA3I1X0 p0823D (.Q(n_56), 
	.C(n_3), 
	.B(n_4), 
	.AN(mem_ctrl_rom_addr_i[12]));
   AND2X0 p11296A (.Q(n_6), 
	.B(mem_ctrl_ext_ram_i), 
	.A(n_1));
   INX0 Fp14093A1928 (.Q(n_5), 
	.A(n_24));
   AO21X1 p13988AT (.Q(n_24), 
	.C(mem_ctrl_ext_ram_i), 
	.B(mem_ctrl_ram_rd_b_i), 
	.A(mem_ctrl_ram_wr_b_i));
   NA2X0 p16279A (.Q(n_115), 
	.B(mem_ctrl_ram_rd_b_i), 
	.A(n_2));
   NA3I1X0 p12148D (.Q(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.C(mem_ctrl_ext_ram_i), 
	.B(mem_ctrl_ram_rd_b_i), 
	.AN(mem_ctrl_ram_wr_b_i));
   NO2X0 p0810D (.Q(n_4), 
	.B(mem_ctrl_rom_addr_i[13]), 
	.A(mem_ctrl_rom_addr_i[15]));
   NO2X0 p0794D (.Q(n_3), 
	.B(n_0), 
	.A(mem_ctrl_rom_addr_i[14]));
   NO2X0 p16297A (.Q(n_2), 
	.B(mem_ctrl_ext_ram_i), 
	.A(mem_ctrl_ram_wr_b_i));
   NA2X0 p11214A (.Q(n_1), 
	.B(mem_ctrl_ram_rd_b_i), 
	.A(mem_ctrl_ram_wr_b_i));
   NA2I1X0 p12130A (.Q(mem_ctrl_bus_ctrl_ext_ram_rd_b_o), 
	.B(mem_ctrl_ext_ram_i), 
	.AN(mem_ctrl_ram_rd_b_i));
   OR2X1 p14111A (.Q(n_117), 
	.B(mem_ctrl_ext_ram_i), 
	.A(mem_ctrl_ram_rd_b_i));
   INX0 Fp9979841A (.Q(n_0), 
	.A(mem_ctrl_bus_ctrl_ea_b_i));
endmodule

module core_pcau (
	pcau_clock_mem_i, 
	pcau_reset_i_b, 
	pcau_offset_i, 
	pcau_en_i, 
	pcau_pc_o, 
	pcau_pc_direct_i, 
	pcau_pc_msb_i, 
	pcau_fsm_state_i, 
	DFT_sdi, 
	DFT_sen, 
	FE_PT1_top_p4_a_o_6_);
   input pcau_clock_mem_i;
   input pcau_reset_i_b;
   input [7:0] pcau_offset_i;
   input pcau_en_i;
   output [15:0] pcau_pc_o;
   input pcau_pc_direct_i;
   input [7:0] pcau_pc_msb_i;
   input [2:0] pcau_fsm_state_i;
   input DFT_sdi;
   input DFT_sen;
   input FE_PT1_top_p4_a_o_6_;

   // Internal wires
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;

   SDFFQX2 \pcau_pc_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(pcau_pc_o[0]), 
	.D(n_53), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[10]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[9]), 
	.Q(pcau_pc_o[10]), 
	.D(n_97), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[11]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[10]), 
	.Q(pcau_pc_o[11]), 
	.D(n_102), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[12]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[11]), 
	.Q(pcau_pc_o[12]), 
	.D(n_107), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[13]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[12]), 
	.Q(pcau_pc_o[13]), 
	.D(n_111), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[14]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[13]), 
	.Q(pcau_pc_o[14]), 
	.D(n_113), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[15]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[14]), 
	.Q(pcau_pc_o[15]), 
	.D(n_114), 
	.CN(pcau_clock_mem_i));
   SDFFQX2 \pcau_pc_o_reg[1]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[2]), 
	.Q(pcau_pc_o[1]), 
	.D(n_58), 
	.CN(pcau_clock_mem_i));
   SDFFQX2 \pcau_pc_o_reg[2]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[3]), 
	.Q(pcau_pc_o[2]), 
	.D(n_62), 
	.CN(pcau_clock_mem_i));
   SDFFQX2 \pcau_pc_o_reg[3]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[4]), 
	.Q(pcau_pc_o[3]), 
	.D(n_66), 
	.CN(pcau_clock_mem_i));
   SDFFQX4 \pcau_pc_o_reg[4]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p4_a_o_6_), 
	.Q(pcau_pc_o[4]), 
	.D(n_70), 
	.CN(pcau_clock_mem_i));
   SDFFQX4 \pcau_pc_o_reg[5]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[1]), 
	.Q(pcau_pc_o[5]), 
	.D(n_74), 
	.CN(pcau_clock_mem_i));
   SDFFQX4 \pcau_pc_o_reg[6]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[0]), 
	.Q(pcau_pc_o[6]), 
	.D(n_78), 
	.CN(pcau_clock_mem_i));
   SDFFQX4 \pcau_pc_o_reg[7]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[6]), 
	.Q(pcau_pc_o[7]), 
	.D(n_81), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[8]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[7]), 
	.Q(pcau_pc_o[8]), 
	.D(n_85), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[9]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[8]), 
	.Q(pcau_pc_o[9]), 
	.D(n_92), 
	.CN(pcau_clock_mem_i));
   AO222X0 p0891D (.Q(n_114), 
	.F(n_17), 
	.E(pcau_pc_o[15]), 
	.D(n_31), 
	.C(pcau_pc_msb_i[7]), 
	.B(n_112), 
	.A(n_32));
   ON21X0 p2117A (.Q(n_113), 
	.C(n_50), 
	.B(n_33), 
	.A(n_109));
   EN3X0 p0823D (.Q(n_112), 
	.C(pcau_pc_o[14]), 
	.B(pcau_pc_o[15]), 
	.A(n_110));
   ON21X0 p2356A (.Q(n_111), 
	.C(n_51), 
	.B(n_33), 
	.A(n_104));
   NA2X1 p0814D (.Q(n_110), 
	.B(n_9), 
	.A(n_108));
   EO2X0 p1917D (.Q(n_109), 
	.B(n_34), 
	.A(n_105));
   NA2X1 p0819D (.Q(n_108), 
	.B(n_14), 
	.A(n_106));
   ON21X0 p2628A (.Q(n_107), 
	.C(n_47), 
	.B(n_33), 
	.A(n_99));
   NA2X0 p0658DT (.Q(n_106), 
	.B(n_12), 
	.A(n_103));
   AND2X0 p1791D (.Q(n_105), 
	.B(n_12), 
	.A(n_103));
   EO2X0 p2191A (.Q(n_104), 
	.B(n_35), 
	.A(n_100));
   NA2X1 p0836D (.Q(n_103), 
	.B(n_16), 
	.A(n_101));
   ON21X0 p2870A (.Q(n_102), 
	.C(n_48), 
	.B(n_33), 
	.A(n_94));
   NA2X0 p0674DT (.Q(n_101), 
	.B(n_22), 
	.A(n_98));
   AND2X0 p2135A (.Q(n_100), 
	.B(n_22), 
	.A(n_98));
   EO2X0 p2445A (.Q(n_99), 
	.B(n_37), 
	.A(n_95));
   NA2X1 p0841D (.Q(n_98), 
	.B(n_11), 
	.A(n_96));
   ON21X0 p3165A (.Q(n_97), 
	.C(n_49), 
	.B(n_33), 
	.A(n_89));
   NA2X0 p0678DT (.Q(n_96), 
	.B(n_3), 
	.A(n_93));
   AND2X0 p2393A (.Q(n_95), 
	.B(n_3), 
	.A(n_93));
   EO2X0 p2695A (.Q(n_94), 
	.B(n_36), 
	.A(n_90));
   NA2X0 p0845D (.Q(n_93), 
	.B(n_0), 
	.A(n_91));
   AO222X0 p2811A (.Q(n_92), 
	.F(n_17), 
	.E(pcau_pc_o[9]), 
	.D(n_32), 
	.C(n_84), 
	.B(n_31), 
	.A(pcau_pc_msb_i[1]));
   NA2X0 p0684DT (.Q(n_91), 
	.B(n_24), 
	.A(n_88));
   AND2X0 p2567A (.Q(n_90), 
	.B(n_24), 
	.A(n_88));
   EO2X0 p2963A (.Q(n_89), 
	.B(n_38), 
	.A(n_86));
   NA2X0 p0859D (.Q(n_88), 
	.B(n_15), 
	.A(n_87));
   NA2X0 p0695DT (.Q(n_87), 
	.B(n_23), 
	.A(n_83));
   AND2X0 p2828A (.Q(n_86), 
	.B(n_23), 
	.A(n_83));
   AO222X0 p2798A (.Q(n_85), 
	.F(n_17), 
	.E(pcau_pc_o[8]), 
	.D(n_32), 
	.C(n_80), 
	.B(n_31), 
	.A(pcau_pc_msb_i[0]));
   EN2X0 p2754A (.Q(n_84), 
	.B(n_44), 
	.A(n_82));
   NA2X0 p0880D (.Q(n_83), 
	.B(n_28), 
	.A(n_82));
   NA2X1 p0864D (.Q(n_82), 
	.B(n_27), 
	.A(n_79));
   AO222X0 p3020A (.Q(n_81), 
	.F(n_17), 
	.E(pcau_pc_o[7]), 
	.D(n_32), 
	.C(n_76), 
	.B(n_31), 
	.A(pcau_offset_i[7]));
   EN2X0 p2705A (.Q(n_80), 
	.B(n_30), 
	.A(n_77));
   ON21X0 p0830D (.Q(n_79), 
	.C(n_77), 
	.B(pcau_pc_o[8]), 
	.A(pcau_offset_i[7]));
   AO222X0 p3332A (.Q(n_78), 
	.F(n_17), 
	.E(pcau_pc_o[6]), 
	.D(n_32), 
	.C(n_72), 
	.B(n_31), 
	.A(pcau_offset_i[6]));
   NA2X0 p0805D (.Q(n_77), 
	.B(n_19), 
	.A(n_75));
   EN2X0 p2950A (.Q(n_76), 
	.B(n_40), 
	.A(n_73));
   NA2X0 p0810D (.Q(n_75), 
	.B(n_13), 
	.A(n_73));
   AO222X0 p3579A (.Q(n_74), 
	.F(n_17), 
	.E(pcau_pc_o[5]), 
	.D(n_32), 
	.C(n_68), 
	.B(n_31), 
	.A(pcau_offset_i[5]));
   NA2X1 p0796D (.Q(n_73), 
	.B(n_10), 
	.A(n_71));
   EN2X0 p3210A (.Q(n_72), 
	.B(n_39), 
	.A(n_69));
   NA2X1 p0800D (.Q(n_71), 
	.B(n_21), 
	.A(n_69));
   AO222X0 p3841A (.Q(n_70), 
	.F(n_17), 
	.E(pcau_pc_o[4]), 
	.D(n_32), 
	.C(n_64), 
	.B(n_31), 
	.A(pcau_offset_i[4]));
   NA2X1 p0808D (.Q(n_69), 
	.B(n_18), 
	.A(n_67));
   EN2X0 p3469A (.Q(n_68), 
	.B(n_42), 
	.A(n_65));
   NA2X1 p0819D1713 (.Q(n_67), 
	.B(n_5), 
	.A(n_65));
   AO222X0 p4111A (.Q(n_66), 
	.F(n_17), 
	.E(pcau_pc_o[3]), 
	.D(n_32), 
	.C(n_60), 
	.B(n_31), 
	.A(pcau_offset_i[3]));
   NA2X1 p0802D (.Q(n_65), 
	.B(n_8), 
	.A(n_63));
   EN2X0 p3729A (.Q(n_64), 
	.B(n_46), 
	.A(n_61));
   NA2X1 p0808D1715 (.Q(n_63), 
	.B(n_1), 
	.A(n_61));
   AO222X0 p4350A (.Q(n_62), 
	.F(n_17), 
	.E(pcau_pc_o[2]), 
	.D(n_32), 
	.C(n_56), 
	.B(n_31), 
	.A(pcau_offset_i[2]));
   NA2X1 p0793D (.Q(n_61), 
	.B(n_6), 
	.A(n_59));
   EN2X0 p3976A (.Q(n_60), 
	.B(n_45), 
	.A(n_57));
   NA2X0 p0798D (.Q(n_59), 
	.B(n_7), 
	.A(n_57));
   AO222X0 p4553A (.Q(n_58), 
	.F(n_17), 
	.E(pcau_pc_o[1]), 
	.D(n_32), 
	.C(n_52), 
	.B(n_31), 
	.A(pcau_offset_i[1]));
   NA2X1 p0805D1718 (.Q(n_57), 
	.B(n_25), 
	.A(n_55));
   EN2X0 p4270A (.Q(n_56), 
	.B(n_41), 
	.A(n_54));
   NA2X0 p0836D1719 (.Q(n_55), 
	.B(n_2), 
	.A(n_54));
   ON21X0 p0914D (.Q(n_54), 
	.C(n_26), 
	.B(n_4), 
	.A(n_20));
   AO222X0 p4776A (.Q(n_53), 
	.F(n_17), 
	.E(pcau_pc_o[0]), 
	.D(n_32), 
	.C(n_29), 
	.B(n_31), 
	.A(pcau_offset_i[0]));
   EN2X0 p4430A (.Q(n_52), 
	.B(n_20), 
	.A(n_43));
   AN22X0 p5285A (.Q(n_51), 
	.D(pcau_pc_o[13]), 
	.C(n_17), 
	.B(pcau_pc_msb_i[5]), 
	.A(n_31));
   AN22X0 p5285A1721 (.Q(n_50), 
	.D(pcau_pc_o[14]), 
	.C(n_17), 
	.B(pcau_pc_msb_i[6]), 
	.A(n_31));
   AN22X0 p5285A1722 (.Q(n_49), 
	.D(pcau_pc_o[10]), 
	.C(n_17), 
	.B(pcau_pc_msb_i[2]), 
	.A(n_31));
   AN22X0 p5285A1723 (.Q(n_48), 
	.D(pcau_pc_o[11]), 
	.C(n_17), 
	.B(pcau_pc_msb_i[3]), 
	.A(n_31));
   AN22X0 p5285A1724 (.Q(n_47), 
	.D(pcau_pc_o[12]), 
	.C(n_17), 
	.B(pcau_pc_msb_i[4]), 
	.A(n_31));
   NA2X0 p4002A (.Q(n_46), 
	.B(n_8), 
	.A(n_1));
   NA2X0 p3997A (.Q(n_45), 
	.B(n_6), 
	.A(n_7));
   NA2X0 p4325A (.Q(n_44), 
	.B(n_28), 
	.A(n_23));
   NO2I1X0 p4169A (.Q(n_43), 
	.B(n_4), 
	.AN(n_26));
   NA2X0 p4002A1725 (.Q(n_42), 
	.B(n_18), 
	.A(n_5));
   NA2X0 p4206A (.Q(n_41), 
	.B(n_2), 
	.A(n_25));
   NA2X0 p4002A1726 (.Q(n_40), 
	.B(n_19), 
	.A(n_13));
   NA2X0 p4002A1727 (.Q(n_39), 
	.B(n_10), 
	.A(n_21));
   AND2X0 p18865A (.Q(n_38), 
	.B(n_24), 
	.A(n_15));
   AND2X0 p18874A (.Q(n_37), 
	.B(n_22), 
	.A(n_11));
   AND2X0 p18852A (.Q(n_36), 
	.B(n_0), 
	.A(n_3));
   AND2X0 p19418A (.Q(n_35), 
	.B(n_12), 
	.A(n_16));
   AND2X0 p19418A1728 (.Q(n_34), 
	.B(n_9), 
	.A(n_14));
   INX0 Fp4700A (.Q(n_33), 
	.A(n_32));
   NO3I2X0 p4498A (.Q(n_32), 
	.C(pcau_pc_direct_i), 
	.BN(pcau_reset_i_b), 
	.AN(pcau_en_i));
   AND3X0 p4510A (.Q(n_31), 
	.C(pcau_reset_i_b), 
	.B(pcau_pc_direct_i), 
	.A(pcau_en_i));
   EN2X0 p3958A (.Q(n_30), 
	.B(pcau_pc_o[8]), 
	.A(pcau_offset_i[7]));
   EO2X0 p4501A (.Q(n_29), 
	.B(pcau_pc_o[0]), 
	.A(pcau_offset_i[0]));
   NA2X0 p2667A (.Q(n_28), 
	.B(pcau_pc_o[9]), 
	.A(pcau_offset_i[7]));
   NA2X0 p2584A (.Q(n_27), 
	.B(pcau_pc_o[8]), 
	.A(pcau_offset_i[7]));
   NA2X0 p0857D (.Q(n_26), 
	.B(pcau_pc_o[1]), 
	.A(pcau_offset_i[1]));
   NA2X0 p1276A (.Q(n_25), 
	.B(pcau_pc_o[2]), 
	.A(pcau_offset_i[2]));
   NA2I1X0 p16834A (.Q(n_24), 
	.B(pcau_pc_o[9]), 
	.AN(pcau_pc_o[10]));
   OR2X0 p2568A (.Q(n_23), 
	.B(pcau_pc_o[9]), 
	.A(pcau_offset_i[7]));
   NA2I1X0 p17375A (.Q(n_22), 
	.B(pcau_pc_o[11]), 
	.AN(pcau_pc_o[12]));
   OR2X0 p1817A (.Q(n_21), 
	.B(pcau_pc_o[6]), 
	.A(pcau_offset_i[6]));
   NA2X0 p0934A (.Q(n_20), 
	.B(pcau_pc_o[0]), 
	.A(pcau_offset_i[0]));
   NA2X0 p2214A (.Q(n_19), 
	.B(pcau_pc_o[7]), 
	.A(pcau_offset_i[7]));
   NA2X0 p1890A (.Q(n_18), 
	.B(pcau_pc_o[5]), 
	.A(pcau_offset_i[5]));
   NO2I1X0 p5143A (.Q(n_17), 
	.B(pcau_en_i), 
	.AN(pcau_reset_i_b));
   NA2I1X0 p18076A (.Q(n_16), 
	.B(pcau_pc_o[13]), 
	.AN(pcau_pc_o[12]));
   NA2I1X0 p16747A (.Q(n_15), 
	.B(pcau_pc_o[10]), 
	.AN(pcau_pc_o[9]));
   NA2I1X0 p18324A (.Q(n_14), 
	.B(pcau_pc_o[14]), 
	.AN(pcau_pc_o[13]));
   OR2X0 p1911A (.Q(n_13), 
	.B(pcau_pc_o[7]), 
	.A(pcau_offset_i[7]));
   NA2I1X0 p18142A (.Q(n_12), 
	.B(pcau_pc_o[12]), 
	.AN(pcau_pc_o[13]));
   NA2I1X0 p17248A (.Q(n_11), 
	.B(pcau_pc_o[12]), 
	.AN(pcau_pc_o[11]));
   NA2X0 p1953A (.Q(n_10), 
	.B(pcau_pc_o[6]), 
	.A(pcau_offset_i[6]));
   NA2I1X0 p18468A (.Q(n_9), 
	.B(pcau_pc_o[13]), 
	.AN(pcau_pc_o[14]));
   NA2X0 p1642A (.Q(n_8), 
	.B(pcau_pc_o[4]), 
	.A(pcau_offset_i[4]));
   OR2X0 p0876D (.Q(n_7), 
	.B(pcau_pc_o[3]), 
	.A(pcau_offset_i[3]));
   NA2X0 p1373A (.Q(n_6), 
	.B(pcau_pc_o[3]), 
	.A(pcau_offset_i[3]));
   OR2X0 p1664A (.Q(n_5), 
	.B(pcau_pc_o[5]), 
	.A(pcau_offset_i[5]));
   NO2X0 p0984A (.Q(n_4), 
	.B(pcau_pc_o[1]), 
	.A(pcau_offset_i[1]));
   NA2I1X0 p17043A (.Q(n_3), 
	.B(pcau_pc_o[10]), 
	.AN(pcau_pc_o[11]));
   OR2X0 p0839D (.Q(n_2), 
	.B(pcau_pc_o[2]), 
	.A(pcau_offset_i[2]));
   OR2X0 p1404A (.Q(n_1), 
	.B(pcau_pc_o[4]), 
	.A(pcau_offset_i[4]));
   NA2I1X0 p16991A (.Q(n_0), 
	.B(pcau_pc_o[11]), 
	.AN(pcau_pc_o[10]));
endmodule

module core_reg_ctrl (
	reg_ctrl_clk_i, 
	reg_ctrl_reset_b_i, 
	reg_ctrl_fsm_wr_b_i, 
	reg_ctrl_fsm_rd_b_i, 
	reg_ctrl_fsm_bit_byte_flag_i, 
	reg_ctrl_fsm_addr_i, 
	reg_ctrl_fsm_data_i, 
	reg_ctrl_ext_ram_rd_i, 
	reg_ctrl_ext_ram_wr_i, 
	reg_ctrl_ext_rom_rd_i, 
	reg_ctrl_alu_cy_i, 
	reg_ctrl_alu_ac_i, 
	reg_ctrl_alu_ov_i, 
	reg_ctrl_bus_ctrl_p0en_i, 
	reg_ctrl_bus_ctrl_p0_i, 
	reg_ctrl_bus_ctrl_p2en_i, 
	reg_ctrl_bus_ctrl_p2_i, 
	reg_ctrl_bus_ctrl_p3en_6_i, 
	reg_ctrl_bus_ctrl_p3en_7_i, 
	reg_ctrl_bus_ctrl_p3_6_i, 
	reg_ctrl_bus_ctrl_p3_7_i, 
	reg_ctrl_bus_ctrl_p4_i, 
	reg_ctrl_interrupt_ie0_i, 
	reg_ctrl_interrupt_ie1_i, 
	reg_ctrl_interrupt_tf0_i, 
	reg_ctrl_interrupt_tf1_i, 
	reg_ctrl_interrupt_tf2_i, 
	reg_ctrl_interrupt_txrxf_i, 
	reg_ctrl_interrupt_clear_i, 
	reg_ctrl_ports_p0_i, 
	reg_ctrl_ports_p1_i, 
	reg_ctrl_ports_p2_i, 
	reg_ctrl_ports_p3_i, 
	reg_ctrl_serial_p3en_0_i, 
	reg_ctrl_serial_p3en_1_i, 
	reg_ctrl_serial_p3_0_i, 
	reg_ctrl_serial_p3_1_i, 
	reg_ctrl_serial_sbuf_rx_i, 
	reg_ctrl_serial_rb8_i, 
	reg_ctrl_serial_ti_i, 
	reg_ctrl_serial_ri_i, 
	reg_ctrl_serial_load_sbuf_i, 
	reg_ctrl_timers_th0_i, 
	reg_ctrl_timers_tm0_i, 
	reg_ctrl_timers_tl0_i, 
	reg_ctrl_timers_tf0_i, 
	reg_ctrl_timers_th1_i, 
	reg_ctrl_timers_tm1_i, 
	reg_ctrl_timers_tl1_i, 
	reg_ctrl_timers_tf1_i, 
	reg_ctrl_timers_acrh_i, 
	reg_ctrl_timers_acrm_i, 
	reg_ctrl_timers_acrl_i, 
	reg_ctrl_timers_tf2_i, 
	reg_ctrl_fsm_data_o, 
	reg_ctrl_fsm_psw_rs_o, 
	reg_ctrl_alu_cy_o, 
	reg_ctrl_alu_ac_o, 
	reg_ctrl_alu_ov_o, 
	reg_ctrl_baudrate_sm0_o, 
	reg_ctrl_baudrate_sm1_o, 
	reg_ctrl_baudrate_sm2_o, 
	reg_ctrl_baudrate_smod_o, 
	reg_ctrl_baudrate_rs232_o, 
	reg_ctrl_bus_ctrl_p0_o, 
	reg_ctrl_interrupt_ip_o, 
	reg_ctrl_interrupt_ie_o, 
	reg_ctrl_interrupt_int0_o, 
	reg_ctrl_interrupt_int1_o, 
	reg_ctrl_interrupt_it0_o, 
	reg_ctrl_interrupt_it1_o, 
	reg_ctrl_interrupt_ie0_o, 
	reg_ctrl_interrupt_ie1_o, 
	reg_ctrl_interrupt_ri_o, 
	reg_ctrl_interrupt_ti_o, 
	reg_ctrl_interrupt_tf0_o, 
	reg_ctrl_interrupt_tf1_o, 
	reg_ctrl_interrupt_tf2_o, 
	reg_ctrl_interrupt_txrxf_o, 
	reg_ctrl_ports_p0_o, 
	reg_ctrl_ports_p1_o, 
	reg_ctrl_ports_p2_o, 
	reg_ctrl_ports_p3_o, 
	reg_ctrl_ports_p4_o, 
	reg_ctrl_ports_p0en_o, 
	reg_ctrl_ports_p1en_o, 
	reg_ctrl_ports_p2en_o, 
	reg_ctrl_ports_p3en_o, 
	reg_ctrl_serial_sm0_o, 
	reg_ctrl_serial_ren_o, 
	reg_ctrl_serial_p3_0_o, 
	reg_ctrl_serial_sbuf_tx_o, 
	reg_ctrl_serial_tb8_o, 
	reg_ctrl_serial_ti_o, 
	reg_ctrl_serial_ri_o, 
	reg_ctrl_serial_tx_o, 
	reg_ctrl_timers_th0_o, 
	reg_ctrl_timers_tm0_o, 
	reg_ctrl_timers_tl0_o, 
	reg_ctrl_timers_gate_t0_o, 
	reg_ctrl_timers_m1_t0_o, 
	reg_ctrl_timers_m0_t0_o, 
	reg_ctrl_timers_tr0_o, 
	reg_ctrl_timers_tf0_o, 
	reg_ctrl_timers_int0_o, 
	reg_ctrl_timers_th1_o, 
	reg_ctrl_timers_tm1_o, 
	reg_ctrl_timers_tl1_o, 
	reg_ctrl_timers_gate_t1_o, 
	reg_ctrl_timers_m1_t1_o, 
	reg_ctrl_timers_m0_t1_o, 
	reg_ctrl_timers_tr1_o, 
	reg_ctrl_timers_tf1_o, 
	reg_ctrl_timers_int1_o, 
	reg_ctrl_timers_tacph_o, 
	reg_ctrl_timers_tacpl_o, 
	reg_ctrl_timers_tr2_o, 
	reg_ctrl_timers_tf2_o, 
	reg_ctrl_timers_dfsel_o, 
	reg_ctrl_timers_edgsel_o, 
	reg_ctrl_timers_dfp_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdi_2, 
	DFT_sdo_3, 
	DFT_sdi_4, 
	DFT_sdi_5, 
	DFT_sdo_6, 
	DFT_sdi_7, 
	DFT_sdo_8, 
	DFT_sdi_9, 
	FE_PT1_top_p4_a_o_7_);
   input reg_ctrl_clk_i;
   input reg_ctrl_reset_b_i;
   input reg_ctrl_fsm_wr_b_i;
   input reg_ctrl_fsm_rd_b_i;
   input reg_ctrl_fsm_bit_byte_flag_i;
   input [7:0] reg_ctrl_fsm_addr_i;
   input [7:0] reg_ctrl_fsm_data_i;
   input reg_ctrl_ext_ram_rd_i;
   input reg_ctrl_ext_ram_wr_i;
   input reg_ctrl_ext_rom_rd_i;
   input reg_ctrl_alu_cy_i;
   input reg_ctrl_alu_ac_i;
   input reg_ctrl_alu_ov_i;
   input [7:0] reg_ctrl_bus_ctrl_p0en_i;
   input [7:0] reg_ctrl_bus_ctrl_p0_i;
   input [7:0] reg_ctrl_bus_ctrl_p2en_i;
   input [7:0] reg_ctrl_bus_ctrl_p2_i;
   input reg_ctrl_bus_ctrl_p3en_6_i;
   input reg_ctrl_bus_ctrl_p3en_7_i;
   input reg_ctrl_bus_ctrl_p3_6_i;
   input reg_ctrl_bus_ctrl_p3_7_i;
   input [7:0] reg_ctrl_bus_ctrl_p4_i;
   input reg_ctrl_interrupt_ie0_i;
   input reg_ctrl_interrupt_ie1_i;
   input reg_ctrl_interrupt_tf0_i;
   input reg_ctrl_interrupt_tf1_i;
   input reg_ctrl_interrupt_tf2_i;
   input reg_ctrl_interrupt_txrxf_i;
   input reg_ctrl_interrupt_clear_i;
   input [7:0] reg_ctrl_ports_p0_i;
   input [7:0] reg_ctrl_ports_p1_i;
   input [7:0] reg_ctrl_ports_p2_i;
   input [7:0] reg_ctrl_ports_p3_i;
   input reg_ctrl_serial_p3en_0_i;
   input reg_ctrl_serial_p3en_1_i;
   input reg_ctrl_serial_p3_0_i;
   input reg_ctrl_serial_p3_1_i;
   input [7:0] reg_ctrl_serial_sbuf_rx_i;
   input reg_ctrl_serial_rb8_i;
   input reg_ctrl_serial_ti_i;
   input reg_ctrl_serial_ri_i;
   input reg_ctrl_serial_load_sbuf_i;
   input [7:0] reg_ctrl_timers_th0_i;
   input [7:0] reg_ctrl_timers_tm0_i;
   input [7:0] reg_ctrl_timers_tl0_i;
   input reg_ctrl_timers_tf0_i;
   input [7:0] reg_ctrl_timers_th1_i;
   input [7:0] reg_ctrl_timers_tm1_i;
   input [7:0] reg_ctrl_timers_tl1_i;
   input reg_ctrl_timers_tf1_i;
   input [7:0] reg_ctrl_timers_acrh_i;
   input [7:0] reg_ctrl_timers_acrm_i;
   input [7:0] reg_ctrl_timers_acrl_i;
   input reg_ctrl_timers_tf2_i;
   output [7:0] reg_ctrl_fsm_data_o;
   output [1:0] reg_ctrl_fsm_psw_rs_o;
   output reg_ctrl_alu_cy_o;
   output reg_ctrl_alu_ac_o;
   output reg_ctrl_alu_ov_o;
   output reg_ctrl_baudrate_sm0_o;
   output reg_ctrl_baudrate_sm1_o;
   output reg_ctrl_baudrate_sm2_o;
   output reg_ctrl_baudrate_smod_o;
   output reg_ctrl_baudrate_rs232_o;
   output [7:0] reg_ctrl_bus_ctrl_p0_o;
   output [6:0] reg_ctrl_interrupt_ip_o;
   output [7:0] reg_ctrl_interrupt_ie_o;
   output reg_ctrl_interrupt_int0_o;
   output reg_ctrl_interrupt_int1_o;
   output reg_ctrl_interrupt_it0_o;
   output reg_ctrl_interrupt_it1_o;
   output reg_ctrl_interrupt_ie0_o;
   output reg_ctrl_interrupt_ie1_o;
   output reg_ctrl_interrupt_ri_o;
   output reg_ctrl_interrupt_ti_o;
   output reg_ctrl_interrupt_tf0_o;
   output reg_ctrl_interrupt_tf1_o;
   output reg_ctrl_interrupt_tf2_o;
   output reg_ctrl_interrupt_txrxf_o;
   output [7:0] reg_ctrl_ports_p0_o;
   output [7:0] reg_ctrl_ports_p1_o;
   output [7:0] reg_ctrl_ports_p2_o;
   output [7:0] reg_ctrl_ports_p3_o;
   output [7:0] reg_ctrl_ports_p4_o;
   output [7:0] reg_ctrl_ports_p0en_o;
   output [7:0] reg_ctrl_ports_p1en_o;
   output [7:0] reg_ctrl_ports_p2en_o;
   output [7:0] reg_ctrl_ports_p3en_o;
   output reg_ctrl_serial_sm0_o;
   output reg_ctrl_serial_ren_o;
   output reg_ctrl_serial_p3_0_o;
   output [7:0] reg_ctrl_serial_sbuf_tx_o;
   output reg_ctrl_serial_tb8_o;
   output reg_ctrl_serial_ti_o;
   output reg_ctrl_serial_ri_o;
   output reg_ctrl_serial_tx_o;
   output [7:0] reg_ctrl_timers_th0_o;
   output [7:0] reg_ctrl_timers_tm0_o;
   output [7:0] reg_ctrl_timers_tl0_o;
   output reg_ctrl_timers_gate_t0_o;
   output reg_ctrl_timers_m1_t0_o;
   output reg_ctrl_timers_m0_t0_o;
   output reg_ctrl_timers_tr0_o;
   output reg_ctrl_timers_tf0_o;
   output reg_ctrl_timers_int0_o;
   output [7:0] reg_ctrl_timers_th1_o;
   output [7:0] reg_ctrl_timers_tm1_o;
   output [7:0] reg_ctrl_timers_tl1_o;
   output reg_ctrl_timers_gate_t1_o;
   output reg_ctrl_timers_m1_t1_o;
   output reg_ctrl_timers_m0_t1_o;
   output reg_ctrl_timers_tr1_o;
   output reg_ctrl_timers_tf1_o;
   output reg_ctrl_timers_int1_o;
   output [1:0] reg_ctrl_timers_tacph_o;
   output [7:0] reg_ctrl_timers_tacpl_o;
   output reg_ctrl_timers_tr2_o;
   output reg_ctrl_timers_tf2_o;
   output reg_ctrl_timers_dfsel_o;
   output reg_ctrl_timers_edgsel_o;
   output [2:0] reg_ctrl_timers_dfp_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   input DFT_sdi_2;
   output DFT_sdo_3;
   input DFT_sdi_4;
   input DFT_sdi_5;
   output DFT_sdo_6;
   input DFT_sdi_7;
   output DFT_sdo_8;
   input DFT_sdi_9;
   input FE_PT1_top_p4_a_o_7_;

   // Internal wires
   wire load_sbuf_prev;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_36;
   wire n_38;
   wire n_49;
   wire n_50;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_103;
   wire n_104;
   wire n_106;
   wire n_107;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_121;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_130;
   wire n_132;
   wire n_133;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_209;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_232;
   wire n_233;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_247;
   wire n_249;
   wire n_251;
   wire n_252;
   wire n_254;
   wire n_255;
   wire n_256;
   wire n_257;
   wire n_258;
   wire n_259;
   wire n_260;
   wire n_261;
   wire n_262;
   wire n_263;
   wire n_264;
   wire n_265;
   wire n_266;
   wire n_267;
   wire n_268;
   wire n_269;
   wire n_270;
   wire n_271;
   wire n_272;
   wire n_273;
   wire n_274;
   wire n_275;
   wire n_276;
   wire n_277;
   wire n_278;
   wire n_279;
   wire n_280;
   wire n_281;
   wire n_282;
   wire n_283;
   wire n_284;
   wire n_285;
   wire n_286;
   wire n_287;
   wire n_288;
   wire n_289;
   wire n_290;
   wire n_291;
   wire n_292;
   wire n_293;
   wire n_294;
   wire n_295;
   wire n_296;
   wire n_297;
   wire n_298;
   wire n_299;
   wire n_300;
   wire n_301;
   wire n_302;
   wire n_303;
   wire n_304;
   wire n_305;
   wire n_306;
   wire n_307;
   wire n_308;
   wire n_309;
   wire n_310;
   wire n_311;
   wire n_312;
   wire n_313;
   wire n_314;
   wire n_315;
   wire n_316;
   wire n_317;
   wire n_318;
   wire n_319;
   wire n_320;
   wire n_321;
   wire n_322;
   wire n_323;
   wire n_324;
   wire n_325;
   wire n_326;
   wire n_327;
   wire n_328;
   wire n_329;
   wire n_330;
   wire n_331;
   wire n_332;
   wire n_333;
   wire n_334;
   wire n_336;
   wire n_337;
   wire n_338;
   wire n_339;
   wire n_340;
   wire n_341;
   wire n_342;
   wire n_343;
   wire n_345;
   wire n_346;
   wire n_347;
   wire n_348;
   wire n_349;
   wire n_350;
   wire n_351;
   wire n_352;
   wire n_353;
   wire n_355;
   wire n_356;
   wire n_357;
   wire n_358;
   wire n_359;
   wire n_360;
   wire n_361;
   wire n_362;
   wire n_363;
   wire n_364;
   wire n_365;
   wire n_366;
   wire n_367;
   wire n_368;
   wire n_369;
   wire n_370;
   wire n_371;
   wire n_372;
   wire n_373;
   wire n_374;
   wire n_375;
   wire n_376;
   wire n_377;
   wire n_378;
   wire n_379;
   wire n_381;
   wire n_382;
   wire n_383;
   wire n_384;
   wire n_385;
   wire n_387;
   wire n_388;
   wire n_389;
   wire n_390;
   wire n_392;
   wire n_394;
   wire n_396;
   wire n_398;
   wire n_400;
   wire n_402;
   wire n_403;
   wire n_405;
   wire n_407;
   wire n_408;
   wire n_409;
   wire n_410;
   wire n_411;
   wire n_412;
   wire n_413;
   wire n_414;
   wire n_415;
   wire n_416;
   wire n_417;
   wire n_418;
   wire n_419;
   wire n_420;
   wire n_421;
   wire n_422;
   wire n_423;
   wire n_424;
   wire n_425;
   wire n_426;
   wire n_427;
   wire n_428;
   wire n_429;
   wire n_430;
   wire n_431;
   wire n_432;
   wire n_433;
   wire n_434;
   wire n_435;
   wire n_436;
   wire n_437;
   wire n_438;
   wire n_439;
   wire n_440;
   wire n_441;
   wire n_442;
   wire n_443;
   wire n_444;
   wire n_445;
   wire n_446;
   wire n_447;
   wire n_448;
   wire n_449;
   wire n_450;
   wire n_451;
   wire n_452;
   wire n_453;
   wire n_454;
   wire n_455;
   wire n_456;
   wire n_457;
   wire n_458;
   wire n_459;
   wire n_460;
   wire n_461;
   wire n_462;
   wire n_463;
   wire n_464;
   wire n_465;
   wire n_466;
   wire n_467;
   wire n_468;
   wire n_469;
   wire n_470;
   wire n_471;
   wire n_472;
   wire n_473;
   wire n_474;
   wire n_475;
   wire n_476;
   wire n_477;
   wire n_478;
   wire n_479;
   wire n_480;
   wire n_481;
   wire n_482;
   wire n_483;
   wire n_484;
   wire n_485;
   wire n_486;
   wire n_487;
   wire n_488;
   wire n_489;
   wire n_490;
   wire n_491;
   wire n_492;
   wire n_493;
   wire n_494;
   wire n_495;
   wire n_496;
   wire n_497;
   wire n_498;
   wire n_499;
   wire n_500;
   wire n_501;
   wire n_502;
   wire n_503;
   wire n_504;
   wire n_505;
   wire n_506;
   wire n_507;
   wire n_508;
   wire n_509;
   wire n_510;
   wire n_511;
   wire n_512;
   wire n_513;
   wire n_514;
   wire n_515;
   wire n_516;
   wire n_517;
   wire n_518;
   wire n_519;
   wire n_520;
   wire n_521;
   wire n_522;
   wire n_523;
   wire n_524;
   wire n_525;
   wire n_526;
   wire n_527;
   wire n_528;
   wire n_529;
   wire n_530;
   wire n_531;
   wire n_532;
   wire n_534;
   wire n_535;
   wire n_536;
   wire n_538;
   wire n_540;
   wire n_541;
   wire n_542;
   wire n_543;
   wire n_544;
   wire n_545;
   wire n_546;
   wire n_547;
   wire n_548;
   wire n_549;
   wire n_550;
   wire n_551;
   wire n_552;
   wire n_553;
   wire n_554;
   wire n_555;
   wire n_556;
   wire n_557;
   wire n_558;
   wire n_559;
   wire n_560;
   wire n_561;
   wire n_562;
   wire n_563;
   wire n_565;
   wire n_566;
   wire n_567;
   wire n_568;
   wire n_569;
   wire n_570;
   wire n_571;
   wire n_572;
   wire n_573;
   wire n_574;
   wire n_575;
   wire n_576;
   wire n_577;
   wire n_578;
   wire n_579;
   wire n_580;
   wire n_581;
   wire n_582;
   wire n_583;
   wire n_584;
   wire n_585;
   wire n_586;
   wire n_587;
   wire n_588;
   wire n_589;
   wire n_590;
   wire n_591;
   wire n_592;
   wire n_593;
   wire n_594;
   wire n_595;
   wire n_596;
   wire n_597;
   wire n_598;
   wire n_599;
   wire n_600;
   wire n_601;
   wire n_602;
   wire n_603;
   wire n_604;
   wire n_605;
   wire n_606;
   wire n_607;
   wire n_608;
   wire n_609;
   wire n_610;
   wire n_611;
   wire n_612;
   wire n_613;
   wire n_614;
   wire n_615;
   wire n_616;
   wire n_617;
   wire n_618;
   wire n_619;
   wire n_620;
   wire n_621;
   wire n_622;
   wire n_623;
   wire n_624;
   wire n_625;
   wire n_626;
   wire n_627;
   wire n_628;
   wire n_629;
   wire n_630;
   wire n_631;
   wire n_632;
   wire n_633;
   wire n_634;
   wire n_635;
   wire n_636;
   wire n_637;
   wire n_638;
   wire n_639;
   wire n_640;
   wire n_641;
   wire n_642;
   wire n_643;
   wire n_644;
   wire n_645;
   wire n_646;
   wire n_647;
   wire n_648;
   wire n_649;
   wire n_650;
   wire n_651;
   wire n_652;
   wire n_653;
   wire n_654;
   wire n_655;
   wire n_656;
   wire n_657;
   wire n_658;
   wire n_659;
   wire n_660;
   wire n_661;
   wire n_662;
   wire n_663;
   wire n_664;
   wire n_665;
   wire n_666;
   wire n_667;
   wire n_668;
   wire n_669;
   wire n_670;
   wire n_671;
   wire n_672;
   wire n_673;
   wire n_674;
   wire n_675;
   wire n_676;
   wire n_677;
   wire n_678;
   wire n_679;
   wire n_680;
   wire n_681;
   wire n_682;
   wire n_683;
   wire n_684;
   wire n_685;
   wire n_686;
   wire n_687;
   wire n_688;
   wire n_689;
   wire n_690;
   wire n_691;
   wire n_692;
   wire n_693;
   wire n_694;
   wire n_695;
   wire n_696;
   wire n_697;
   wire n_698;
   wire n_699;
   wire n_700;
   wire n_701;
   wire n_702;
   wire n_703;
   wire n_704;
   wire n_705;
   wire n_706;
   wire n_707;
   wire n_708;
   wire n_709;
   wire n_710;
   wire n_711;
   wire n_712;
   wire n_713;
   wire n_714;
   wire n_715;
   wire n_716;
   wire n_717;
   wire n_718;
   wire n_719;
   wire n_720;
   wire n_721;
   wire n_722;
   wire n_723;
   wire n_724;
   wire n_725;
   wire n_726;
   wire n_728;
   wire n_730;
   wire n_732;
   wire n_734;
   wire n_736;
   wire n_738;
   wire n_739;
   wire n_741;
   wire n_743;
   wire n_744;
   wire n_745;
   wire n_746;
   wire n_747;
   wire n_748;
   wire n_749;
   wire n_750;
   wire n_751;
   wire n_752;
   wire n_753;
   wire n_754;
   wire n_755;
   wire n_756;
   wire n_757;
   wire n_758;
   wire n_759;
   wire n_760;
   wire n_761;
   wire n_762;
   wire n_763;
   wire n_764;
   wire n_765;
   wire n_766;
   wire n_767;
   wire n_768;
   wire n_769;
   wire n_770;
   wire n_771;
   wire n_772;
   wire n_773;
   wire n_774;
   wire n_775;
   wire n_776;
   wire n_777;
   wire n_778;
   wire n_779;
   wire n_780;
   wire n_781;
   wire n_782;
   wire n_783;
   wire n_784;
   wire n_785;
   wire n_786;
   wire n_787;
   wire n_788;
   wire n_789;
   wire n_790;
   wire n_791;
   wire n_792;
   wire n_793;
   wire n_794;
   wire n_795;
   wire n_796;
   wire n_797;
   wire n_798;
   wire n_799;
   wire n_800;
   wire n_801;
   wire n_802;
   wire n_803;
   wire n_804;
   wire n_805;
   wire n_806;
   wire n_807;
   wire n_808;
   wire n_809;
   wire n_810;
   wire n_811;
   wire n_812;
   wire n_813;
   wire n_814;
   wire n_815;
   wire n_816;
   wire n_817;
   wire n_819;
   wire n_820;
   wire n_821;
   wire n_822;
   wire n_823;
   wire n_824;
   wire n_825;
   wire n_826;
   wire n_827;
   wire n_828;
   wire n_829;
   wire n_830;
   wire n_831;
   wire n_832;
   wire n_833;
   wire n_834;
   wire n_835;
   wire n_836;
   wire n_837;
   wire n_838;
   wire n_839;
   wire n_840;
   wire n_841;
   wire n_842;
   wire n_843;
   wire n_844;
   wire n_845;
   wire n_846;
   wire n_847;
   wire n_848;
   wire n_849;
   wire n_850;
   wire n_851;
   wire n_852;
   wire n_853;
   wire n_854;
   wire n_855;
   wire n_856;
   wire n_857;
   wire n_858;
   wire n_859;
   wire n_860;
   wire n_861;
   wire n_862;
   wire n_863;
   wire n_864;
   wire n_865;
   wire n_866;
   wire n_868;
   wire n_870;
   wire n_871;
   wire n_873;
   wire n_875;
   wire n_877;
   wire n_879;
   wire n_880;
   wire n_881;
   wire n_882;
   wire n_884;
   wire n_885;
   wire n_886;
   wire n_887;
   wire n_888;
   wire n_889;
   wire n_890;
   wire n_891;
   wire n_892;
   wire n_893;
   wire n_894;
   wire n_895;
   wire n_896;
   wire n_897;
   wire n_898;
   wire n_899;
   wire n_901;
   wire n_902;
   wire n_903;
   wire n_904;
   wire n_906;
   wire n_907;
   wire n_908;
   wire n_909;
   wire n_910;
   wire n_911;
   wire n_913;
   wire n_914;
   wire n_915;
   wire n_916;
   wire n_917;
   wire n_918;
   wire n_919;
   wire n_920;
   wire n_921;
   wire n_922;
   wire n_923;
   wire n_924;
   wire n_925;
   wire n_926;
   wire n_927;
   wire n_928;
   wire n_929;
   wire n_930;
   wire n_931;
   wire n_932;
   wire n_933;
   wire n_934;
   wire n_935;
   wire n_936;
   wire n_937;
   wire n_938;
   wire n_939;
   wire n_940;
   wire n_941;
   wire n_942;
   wire n_943;
   wire n_944;
   wire n_945;
   wire n_946;
   wire n_947;
   wire n_948;
   wire n_949;
   wire n_950;
   wire n_951;
   wire n_952;
   wire n_953;
   wire n_954;
   wire n_955;
   wire n_956;
   wire n_957;
   wire n_958;
   wire n_959;
   wire n_960;
   wire n_961;
   wire n_962;
   wire n_963;
   wire n_964;
   wire n_965;
   wire n_966;
   wire n_967;
   wire n_968;
   wire n_969;
   wire n_970;
   wire n_971;
   wire n_972;
   wire n_973;
   wire n_974;
   wire n_975;
   wire n_976;
   wire n_977;
   wire n_978;
   wire n_979;
   wire n_980;
   wire n_981;
   wire n_982;
   wire n_983;
   wire n_984;
   wire n_985;
   wire n_986;
   wire n_987;
   wire n_988;
   wire n_989;
   wire n_990;
   wire n_991;
   wire n_992;
   wire n_993;
   wire n_994;
   wire n_995;
   wire n_996;
   wire n_997;
   wire n_998;
   wire n_999;
   wire n_1000;
   wire n_1001;
   wire n_1002;
   wire n_1003;
   wire n_1004;
   wire n_1005;
   wire n_1006;
   wire n_1231;
   wire serial_status;
   wire \sfr[1][0] ;
   wire \sfr[1][1] ;
   wire \sfr[1][2] ;
   wire \sfr[1][3] ;
   wire \sfr[1][4] ;
   wire \sfr[1][5] ;
   wire \sfr[1][6] ;
   wire \sfr[1][7] ;
   wire \sfr[2][0] ;
   wire \sfr[2][1] ;
   wire \sfr[2][2] ;
   wire \sfr[2][3] ;
   wire \sfr[2][4] ;
   wire \sfr[2][5] ;
   wire \sfr[2][6] ;
   wire \sfr[2][7] ;
   wire \sfr[3][0] ;
   wire \sfr[3][1] ;
   wire \sfr[3][2] ;
   wire \sfr[3][3] ;
   wire \sfr[3][4] ;
   wire \sfr[3][5] ;
   wire \sfr[3][6] ;
   wire \sfr[3][7] ;
   wire \sfr[4][0] ;
   wire \sfr[4][1] ;
   wire \sfr[4][2] ;
   wire \sfr[4][3] ;
   wire \sfr[4][5] ;
   wire \sfr[4][6] ;
   wire \sfr[4][7] ;
   wire \sfr[5][0] ;
   wire \sfr[5][1] ;
   wire \sfr[5][2] ;
   wire \sfr[5][3] ;
   wire \sfr[5][4] ;
   wire \sfr[5][5] ;
   wire \sfr[5][6] ;
   wire \sfr[5][7] ;
   wire \sfr[6][0] ;
   wire \sfr[6][1] ;
   wire \sfr[6][2] ;
   wire \sfr[6][3] ;
   wire \sfr[6][4] ;
   wire \sfr[6][5] ;
   wire \sfr[6][6] ;
   wire \sfr[6][7] ;
   wire \sfr[7][0] ;
   wire \sfr[7][1] ;
   wire \sfr[7][3] ;
   wire \sfr[7][4] ;
   wire \sfr[7][5] ;
   wire \sfr[7][6] ;
   wire \sfr[9][2] ;
   wire \sfr[9][6] ;
   wire \sfr[17][2] ;
   wire \sfr[18][0] ;
   wire \sfr[18][1] ;
   wire \sfr[18][2] ;
   wire \sfr[18][3] ;
   wire \sfr[18][4] ;
   wire \sfr[18][5] ;
   wire \sfr[18][6] ;
   wire \sfr[18][7] ;
   wire \sfr[24][7] ;
   wire \sfr[25][0] ;
   wire \sfr[25][1] ;
   wire \sfr[25][2] ;
   wire \sfr[25][3] ;
   wire \sfr[25][4] ;
   wire \sfr[25][5] ;
   wire \sfr[25][6] ;
   wire \sfr[25][7] ;
   wire \sfr[27][2] ;
   wire \sfr[27][3] ;
   wire \sfr[27][4] ;
   wire \sfr[27][5] ;
   wire \sfr[27][6] ;
   wire \sfr[27][7] ;
   wire \sfr[28][0] ;
   wire \sfr[28][2] ;
   wire \sfr[28][3] ;
   wire \sfr[28][4] ;
   wire \sfr[28][5] ;
   wire \sfr[28][6] ;
   wire \sfr[28][7] ;
   wire \sfr[29][0] ;
   wire \sfr[29][1] ;
   wire \sfr[29][2] ;
   wire \sfr[29][3] ;
   wire \sfr[29][4] ;
   wire \sfr[29][5] ;
   wire \sfr[29][6] ;
   wire \sfr[29][7] ;
   wire \sfr[30][0] ;
   wire \sfr[30][1] ;
   wire \sfr[30][2] ;
   wire \sfr[30][3] ;
   wire \sfr[30][4] ;
   wire \sfr[30][5] ;
   wire \sfr[30][6] ;
   wire \sfr[30][7] ;
   wire \sfr[31][0] ;
   wire \sfr[31][1] ;
   wire \sfr[31][2] ;
   wire \sfr[31][3] ;
   wire \sfr[31][4] ;
   wire \sfr[31][5] ;
   wire \sfr[31][6] ;
   wire \sfr[31][7] ;
   wire \sfr[34][1] ;
   wire \sfr[34][5] ;
   wire \sfr[36][0] ;
   wire \sfr[36][1] ;
   wire \sfr[36][2] ;
   wire \sfr[36][3] ;
   wire \sfr[36][4] ;
   wire \sfr[36][5] ;
   wire \sfr[36][6] ;
   wire \sfr[36][7] ;
   wire \sfr[38][0] ;
   wire \sfr[38][1] ;
   wire \sfr[38][2] ;
   wire \sfr[38][3] ;
   wire \sfr[38][4] ;
   wire \sfr[38][5] ;
   wire \sfr[38][6] ;
   wire \sfr[38][7] ;

   assign reg_ctrl_timers_tf2_o = 1'b0 ;
   assign reg_ctrl_timers_int1_o = 1'b0 ;
   assign reg_ctrl_timers_tf1_o = 1'b0 ;
   assign reg_ctrl_timers_int0_o = 1'b0 ;
   assign reg_ctrl_timers_tf0_o = 1'b0 ;
   assign reg_ctrl_serial_ri_o = 1'b0 ;
   assign reg_ctrl_serial_ti_o = 1'b0 ;
   assign reg_ctrl_serial_p3_0_o = 1'b0 ;
   assign reg_ctrl_serial_sm0_o = 1'b0 ;
   assign reg_ctrl_ports_p3_o[2] = 1'b0 ;
   assign reg_ctrl_ports_p3_o[3] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[0] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[1] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[2] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[3] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[4] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[5] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[6] = 1'b0 ;
   assign reg_ctrl_bus_ctrl_p0_o[7] = 1'b0 ;

   SDFRX0 \sfr_reg[6][2]  (.SE(DFT_sen), 
	.SD(\sfr[6][3] ), 
	.QN(\sfr[6][2] ), 
	.Q(n_1231), 
	.D(n_625), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_alu_cy_o), 
	.Q(reg_ctrl_alu_ov_o), 
	.D(n_1006), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfp_o[1]), 
	.Q(reg_ctrl_alu_ac_o), 
	.D(n_1005), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_alu_ac_o), 
	.Q(reg_ctrl_alu_cy_o), 
	.D(n_1002), 
	.C(reg_ctrl_clk_i));
   AO22X0 p2275A (.Q(n_1006), 
	.D(n_1003), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_1004), 
	.A(reg_ctrl_alu_ov_i));
   AO22X0 p5820A (.Q(n_1005), 
	.D(n_1003), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_1004), 
	.A(reg_ctrl_alu_ac_i));
   AO22X0 p3340A (.Q(n_1002), 
	.D(n_1003), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_1004), 
	.A(reg_ctrl_alu_cy_i));
   SDFRQX0 \read_data_reg[3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[4]), 
	.Q(reg_ctrl_fsm_data_o[3]), 
	.D(n_1000), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[7]), 
	.Q(reg_ctrl_fsm_data_o[7]), 
	.D(n_1001), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[3]), 
	.Q(reg_ctrl_fsm_data_o[2]), 
	.D(n_999), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[0]  (.SE(DFT_sen), 
	.SD(load_sbuf_prev), 
	.Q(reg_ctrl_fsm_data_o[0]), 
	.D(n_997), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[7]), 
	.Q(reg_ctrl_fsm_data_o[1]), 
	.D(n_998), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[6]), 
	.Q(reg_ctrl_fsm_data_o[5]), 
	.D(n_996), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[5]), 
	.Q(reg_ctrl_fsm_data_o[4]), 
	.D(n_994), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \read_data_reg[6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[1]), 
	.Q(reg_ctrl_fsm_data_o[6]), 
	.D(n_995), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][0]  (.SE(DFT_sen), 
	.SD(serial_status), 
	.Q(reg_ctrl_ports_p0_o[0]), 
	.D(n_990), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[2]), 
	.Q(reg_ctrl_ports_p0_o[1]), 
	.D(n_986), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[3]), 
	.Q(reg_ctrl_ports_p0_o[2]), 
	.D(n_989), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[4]), 
	.Q(reg_ctrl_ports_p0_o[3]), 
	.D(n_987), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[5]), 
	.Q(reg_ctrl_ports_p0_o[4]), 
	.D(n_985), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[6]), 
	.Q(reg_ctrl_ports_p0_o[5]), 
	.D(n_984), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][6]  (.SE(DFT_sen), 
	.SD(\sfr[1][0] ), 
	.Q(reg_ctrl_ports_p0_o[6]), 
	.D(n_983), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[0][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[0]), 
	.Q(reg_ctrl_ports_p0_o[7]), 
	.D(n_982), 
	.C(reg_ctrl_clk_i));
   NA6X0 p8606A (.Q(n_1001), 
	.F(n_747), 
	.E(n_553), 
	.D(n_832), 
	.C(n_959), 
	.B(n_894), 
	.A(n_993));
   NA6X0 p8467A (.Q(n_1000), 
	.F(n_863), 
	.E(n_746), 
	.D(n_824), 
	.C(n_860), 
	.B(n_895), 
	.A(n_992));
   NA6X0 p8565A (.Q(n_999), 
	.F(n_551), 
	.E(n_424), 
	.D(n_443), 
	.C(n_644), 
	.B(n_827), 
	.A(n_991));
   NA6X0 p8680A (.Q(n_998), 
	.F(n_348), 
	.E(n_347), 
	.D(n_829), 
	.C(n_887), 
	.B(n_961), 
	.A(n_981));
   NA6X0 p8705A (.Q(n_997), 
	.F(n_381), 
	.E(n_744), 
	.D(n_885), 
	.C(n_978), 
	.B(n_913), 
	.A(n_903));
   NA6X0 p8582A (.Q(n_996), 
	.F(n_389), 
	.E(n_755), 
	.D(n_888), 
	.C(n_975), 
	.B(n_948), 
	.A(n_906));
   SDFRQX0 \sfr_reg[23][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[7]), 
	.Q(reg_ctrl_ports_p3_o[0]), 
	.D(n_955), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[23][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[0]), 
	.Q(reg_ctrl_ports_p3_o[1]), 
	.D(n_956), 
	.C(reg_ctrl_clk_i));
   NA6X0 p8654A (.Q(n_995), 
	.F(n_372), 
	.E(n_750), 
	.D(n_749), 
	.C(n_965), 
	.B(n_954), 
	.A(n_908));
   NA6X0 p8521A (.Q(n_994), 
	.F(n_861), 
	.E(n_496), 
	.D(n_643), 
	.C(n_962), 
	.B(n_953), 
	.A(n_960));
   AN211X0 p8606A22507 (.Q(n_993), 
	.D(n_980), 
	.C(n_594), 
	.B(n_754), 
	.A(reg_ctrl_baudrate_sm0_o));
   AND6X0 p8466A (.Q(n_992), 
	.F(n_240), 
	.E(n_241), 
	.D(n_427), 
	.C(n_425), 
	.B(n_426), 
	.A(n_979));
   SDFRQX0 \sfr_reg[16][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[5]), 
	.Q(reg_ctrl_ports_p1_o[0]), 
	.D(n_952), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[0]), 
	.Q(reg_ctrl_ports_p1_o[1]), 
	.D(n_951), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[1]), 
	.Q(reg_ctrl_ports_p1_o[2]), 
	.D(n_949), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[2]), 
	.Q(DFT_sdo_3), 
	.D(n_947), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][4]  (.SE(DFT_sen), 
	.SD(DFT_sdi_4), 
	.Q(reg_ctrl_ports_p1_o[4]), 
	.D(n_945), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[6]), 
	.Q(reg_ctrl_ports_p1_o[5]), 
	.D(n_946), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[7]), 
	.Q(reg_ctrl_ports_p1_o[6]), 
	.D(n_944), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[16][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[3]), 
	.Q(reg_ctrl_ports_p1_o[7]), 
	.D(n_943), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[1]), 
	.Q(reg_ctrl_ports_p2_o[0]), 
	.D(n_940), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[2]), 
	.Q(reg_ctrl_ports_p2_o[1]), 
	.D(n_939), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[6]), 
	.Q(reg_ctrl_ports_p2_o[2]), 
	.D(n_937), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[0]), 
	.Q(reg_ctrl_ports_p2_o[3]), 
	.D(n_936), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[3]), 
	.Q(reg_ctrl_ports_p2_o[4]), 
	.D(n_935), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[6]), 
	.Q(reg_ctrl_ports_p2_o[5]), 
	.D(n_934), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[7]), 
	.Q(reg_ctrl_ports_p2_o[6]), 
	.D(n_933), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[20][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[4]), 
	.Q(reg_ctrl_ports_p2_o[7]), 
	.D(n_932), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[23][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[5]), 
	.Q(reg_ctrl_ports_p3_o[6]), 
	.D(n_929), 
	.C(reg_ctrl_clk_i));
   AND6X0 p8565A22525 (.Q(n_991), 
	.F(n_346), 
	.E(n_864), 
	.D(n_964), 
	.C(n_345), 
	.B(n_826), 
	.A(n_931));
   AO221X0 p2397A (.Q(n_990), 
	.E(n_974), 
	.D(reg_ctrl_ports_p0_o[0]), 
	.C(n_882), 
	.B(reg_ctrl_bus_ctrl_p0_i[0]), 
	.A(n_988));
   AO221X0 p2397A22526 (.Q(n_989), 
	.E(n_971), 
	.D(reg_ctrl_ports_p0_o[2]), 
	.C(n_877), 
	.B(reg_ctrl_bus_ctrl_p0_i[2]), 
	.A(n_988));
   AO221X0 p2397A22527 (.Q(n_987), 
	.E(n_970), 
	.D(reg_ctrl_ports_p0_o[3]), 
	.C(n_875), 
	.B(reg_ctrl_bus_ctrl_p0_i[3]), 
	.A(n_988));
   AO221X0 p2397A22528 (.Q(n_986), 
	.E(n_973), 
	.D(reg_ctrl_ports_p0_o[1]), 
	.C(n_881), 
	.B(reg_ctrl_bus_ctrl_p0_i[1]), 
	.A(n_988));
   AO221X0 p2397A22529 (.Q(n_985), 
	.E(n_969), 
	.D(reg_ctrl_ports_p0_o[4]), 
	.C(n_873), 
	.B(reg_ctrl_bus_ctrl_p0_i[4]), 
	.A(n_988));
   AO221X0 p2397A22530 (.Q(n_984), 
	.E(n_968), 
	.D(reg_ctrl_ports_p0_o[5]), 
	.C(n_871), 
	.B(reg_ctrl_bus_ctrl_p0_i[5]), 
	.A(n_988));
   AO221X0 p2397A22531 (.Q(n_983), 
	.E(n_967), 
	.D(reg_ctrl_ports_p0_o[6]), 
	.C(n_870), 
	.B(reg_ctrl_bus_ctrl_p0_i[6]), 
	.A(n_988));
   AO221X0 p2397A22532 (.Q(n_982), 
	.E(n_966), 
	.D(reg_ctrl_ports_p0_o[7]), 
	.C(n_868), 
	.B(reg_ctrl_bus_ctrl_p0_i[7]), 
	.A(n_988));
   SDFRQX0 \sfr_reg[23][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[1]), 
	.Q(reg_ctrl_interrupt_int0_o), 
	.D(n_918), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[23][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_int1_o), 
	.Q(reg_ctrl_ports_p3_o[4]), 
	.D(n_915), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[23][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_int0_o), 
	.Q(reg_ctrl_interrupt_int1_o), 
	.D(n_917), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[23][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[4]), 
	.Q(reg_ctrl_ports_p3_o[5]), 
	.D(n_914), 
	.C(reg_ctrl_clk_i));
   AN221X0 p8680A22537 (.Q(n_981), 
	.E(n_941), 
	.D(n_976), 
	.C(reg_ctrl_ports_p1en_o[1]), 
	.B(reg_ctrl_timers_m1_t0_o), 
	.A(n_977));
   SDFRQX0 \sfr_reg[23][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[6]), 
	.Q(reg_ctrl_ports_p3_o[7]), 
	.D(n_902), 
	.C(reg_ctrl_clk_i));
   NA3X0 p8602A (.Q(n_980), 
	.C(n_228), 
	.B(n_247), 
	.A(n_942));
   AN221X0 p8466A22539 (.Q(n_979), 
	.E(n_911), 
	.D(n_320), 
	.C(\sfr[38][3] ), 
	.B(\sfr[1][3] ), 
	.A(n_898));
   AN221X0 p8705A22540 (.Q(n_978), 
	.E(n_909), 
	.D(n_976), 
	.C(reg_ctrl_ports_p1en_o[0]), 
	.B(reg_ctrl_timers_m0_t0_o), 
	.A(n_977));
   AN221X0 p8699A (.Q(n_975), 
	.E(n_910), 
	.D(n_963), 
	.C(reg_ctrl_ports_p3_o[5]), 
	.B(reg_ctrl_timers_m1_t1_o), 
	.A(n_977));
   AO32X0 p5566A (.Q(n_974), 
	.E(n_928), 
	.D(reg_ctrl_ports_p0_i[0]), 
	.C(reg_ctrl_ports_p0en_o[0]), 
	.B(reg_ctrl_fsm_data_i[0]), 
	.A(n_972));
   AO32X0 p5566A22541 (.Q(n_973), 
	.E(n_927), 
	.D(reg_ctrl_ports_p0_i[1]), 
	.C(reg_ctrl_ports_p0en_o[1]), 
	.B(reg_ctrl_fsm_data_i[1]), 
	.A(n_972));
   AO32X0 p5570A (.Q(n_971), 
	.E(n_924), 
	.D(reg_ctrl_ports_p0_i[2]), 
	.C(reg_ctrl_ports_p0en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_972));
   AO32X0 p5570A22542 (.Q(n_970), 
	.E(n_923), 
	.D(reg_ctrl_ports_p0_i[3]), 
	.C(reg_ctrl_ports_p0en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_972));
   AO32X0 p5570A22543 (.Q(n_969), 
	.E(n_920), 
	.D(reg_ctrl_ports_p0_i[4]), 
	.C(reg_ctrl_ports_p0en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_972));
   AO32X0 p5566A22544 (.Q(n_968), 
	.E(n_922), 
	.D(reg_ctrl_ports_p0_i[5]), 
	.C(reg_ctrl_ports_p0en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_972));
   AO32X0 p5570A22545 (.Q(n_967), 
	.E(n_921), 
	.D(reg_ctrl_ports_p0_i[6]), 
	.C(reg_ctrl_ports_p0en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_972));
   AO32X0 p5570A22546 (.Q(n_966), 
	.E(n_919), 
	.D(reg_ctrl_ports_p0_i[7]), 
	.C(reg_ctrl_ports_p0en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_972));
   SDFRQX0 \sfr_reg[10][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[3]), 
	.Q(reg_ctrl_timers_tl0_o[0]), 
	.D(n_854), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[2]), 
	.Q(reg_ctrl_timers_tl0_o[1]), 
	.D(n_853), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[1]), 
	.Q(reg_ctrl_timers_tl0_o[2]), 
	.D(n_850), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[1]), 
	.Q(reg_ctrl_timers_tl0_o[3]), 
	.D(n_849), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m0_t1_o), 
	.Q(reg_ctrl_timers_tl0_o[4]), 
	.D(n_848), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][5]  (.SE(DFT_sen), 
	.SD(DFT_sdi_2), 
	.Q(reg_ctrl_timers_tl0_o[5]), 
	.D(n_847), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[4]), 
	.Q(reg_ctrl_timers_tl0_o[6]), 
	.D(n_846), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[10][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[6]), 
	.Q(reg_ctrl_timers_tl0_o[7]), 
	.D(n_845), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[5]), 
	.Q(reg_ctrl_ports_p4_o[0]), 
	.D(n_843), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[0]), 
	.Q(reg_ctrl_ports_p4_o[1]), 
	.D(n_844), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[1]), 
	.Q(reg_ctrl_ports_p4_o[2]), 
	.D(n_839), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][3]  (.SE(DFT_sen), 
	.SD(DFT_sdi_5), 
	.Q(reg_ctrl_ports_p4_o[3]), 
	.D(n_838), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[3]), 
	.Q(reg_ctrl_ports_p4_o[4]), 
	.D(n_837), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[4]), 
	.Q(reg_ctrl_ports_p4_o[5]), 
	.D(n_836), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[5]), 
	.Q(reg_ctrl_ports_p4_o[6]), 
	.D(n_835), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[22][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[6]), 
	.Q(reg_ctrl_ports_p4_o[7]), 
	.D(n_834), 
	.C(reg_ctrl_clk_i));
   AN221X0 p8871A (.Q(n_965), 
	.E(n_893), 
	.D(n_958), 
	.C(reg_ctrl_ports_p2_o[6]), 
	.B(reg_ctrl_ports_p0_o[6]), 
	.A(n_896));
   AN221X0 p8609A (.Q(n_964), 
	.E(n_889), 
	.D(n_817), 
	.C(reg_ctrl_interrupt_it1_o), 
	.B(reg_ctrl_interrupt_int0_o), 
	.A(n_963));
   AN221X0 p8821A (.Q(n_962), 
	.E(n_891), 
	.D(n_976), 
	.C(reg_ctrl_ports_p1en_o[4]), 
	.B(reg_ctrl_fsm_psw_rs_o[1]), 
	.A(n_862));
   AND6X0 p8735A (.Q(n_961), 
	.F(n_243), 
	.E(n_310), 
	.D(n_437), 
	.C(n_438), 
	.B(n_449), 
	.A(n_899));
   AN221X0 p8521A22563 (.Q(n_960), 
	.E(n_884), 
	.D(n_756), 
	.C(reg_ctrl_ports_p2en_o[4]), 
	.B(reg_ctrl_ports_p1_o[4]), 
	.A(n_957));
   AN221X0 p9090A (.Q(n_959), 
	.E(n_897), 
	.D(n_957), 
	.C(reg_ctrl_ports_p1_o[7]), 
	.B(reg_ctrl_ports_p2_o[7]), 
	.A(n_958));
   ON222X0 p10514A (.Q(n_956), 
	.F(reg_ctrl_reset_b_i), 
	.E(n_57), 
	.D(n_0), 
	.C(n_858), 
	.B(reg_ctrl_ports_p3en_o[1]), 
	.A(n_690));
   ON222X0 p10514A22564 (.Q(n_955), 
	.F(reg_ctrl_reset_b_i), 
	.E(n_38), 
	.D(n_32), 
	.C(n_859), 
	.B(reg_ctrl_ports_p3en_o[0]), 
	.A(n_691));
   AND6X0 p8654A22565 (.Q(n_954), 
	.F(n_246), 
	.E(n_207), 
	.D(n_647), 
	.C(n_321), 
	.B(n_388), 
	.A(n_833));
   AND6X0 p8625A (.Q(n_953), 
	.F(n_342), 
	.E(n_223), 
	.D(n_421), 
	.C(n_550), 
	.B(n_420), 
	.A(n_823));
   AO321X0 p10286A (.Q(n_952), 
	.F(n_636), 
	.E(reg_ctrl_ports_p1_o[0]), 
	.D(n_689), 
	.C(reg_ctrl_ports_p1en_o[0]), 
	.B(reg_ctrl_fsm_data_i[0]), 
	.A(n_950));
   AO321X0 p10286A22566 (.Q(n_951), 
	.F(n_635), 
	.E(reg_ctrl_ports_p1_o[1]), 
	.D(n_688), 
	.C(reg_ctrl_ports_p1en_o[1]), 
	.B(reg_ctrl_fsm_data_i[1]), 
	.A(n_950));
   AO321X0 p10286A22567 (.Q(n_949), 
	.F(n_633), 
	.E(reg_ctrl_ports_p1_o[2]), 
	.D(n_685), 
	.C(reg_ctrl_ports_p1en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_950));
   AND6X0 p8582A22568 (.Q(n_948), 
	.F(n_237), 
	.E(n_340), 
	.D(n_416), 
	.C(n_261), 
	.B(n_339), 
	.A(n_822));
   AO321X0 p10286A22569 (.Q(n_947), 
	.F(n_632), 
	.E(DFT_sdo_3), 
	.D(n_684), 
	.C(reg_ctrl_ports_p1en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_950));
   AO321X0 p10286A22570 (.Q(n_946), 
	.F(n_630), 
	.E(reg_ctrl_ports_p1_o[5]), 
	.D(n_682), 
	.C(reg_ctrl_ports_p1en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_950));
   AO321X0 p10286A22571 (.Q(n_945), 
	.F(n_631), 
	.E(reg_ctrl_ports_p1_o[4]), 
	.D(n_683), 
	.C(reg_ctrl_ports_p1en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_950));
   AO321X0 p10286A22572 (.Q(n_944), 
	.F(n_629), 
	.E(reg_ctrl_ports_p1_o[6]), 
	.D(n_681), 
	.C(reg_ctrl_ports_p1en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_950));
   AO321X0 p10286A22573 (.Q(n_943), 
	.F(n_628), 
	.E(reg_ctrl_ports_p1_o[7]), 
	.D(n_680), 
	.C(reg_ctrl_ports_p1en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_950));
   SDFRQX0 \sfr_reg[11][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[7]), 
	.Q(reg_ctrl_timers_tl1_o[0]), 
	.D(n_807), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[2]), 
	.Q(reg_ctrl_timers_tl1_o[1]), 
	.D(n_788), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[6]), 
	.Q(reg_ctrl_timers_tl1_o[2]), 
	.D(n_805), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[7]), 
	.Q(reg_ctrl_timers_tl1_o[3]), 
	.D(n_786), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[5]), 
	.Q(reg_ctrl_timers_tl1_o[4]), 
	.D(n_801), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[6]), 
	.Q(reg_ctrl_timers_tl1_o[5]), 
	.D(n_799), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[4]), 
	.Q(reg_ctrl_timers_tl1_o[6]), 
	.D(n_797), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[11][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[5]), 
	.Q(reg_ctrl_timers_tl1_o[7]), 
	.D(n_784), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[3]), 
	.Q(reg_ctrl_timers_tm0_o[0]), 
	.D(n_795), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[2]), 
	.Q(reg_ctrl_timers_tm0_o[1]), 
	.D(n_782), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[1]), 
	.Q(reg_ctrl_timers_tm0_o[2]), 
	.D(n_794), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[2]), 
	.Q(reg_ctrl_timers_tm0_o[3]), 
	.D(n_781), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[5]), 
	.Q(reg_ctrl_timers_tm0_o[4]), 
	.D(n_791), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[6]), 
	.Q(reg_ctrl_timers_tm0_o[5]), 
	.D(n_790), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[3]), 
	.Q(reg_ctrl_timers_tm0_o[6]), 
	.D(n_789), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[14][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[7]), 
	.Q(reg_ctrl_timers_tm0_o[7]), 
	.D(n_780), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[1]), 
	.Q(reg_ctrl_timers_tm1_o[0]), 
	.D(n_767), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[4]), 
	.Q(reg_ctrl_timers_tm1_o[1]), 
	.D(n_766), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[4]), 
	.Q(reg_ctrl_timers_tm1_o[2]), 
	.D(n_763), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[2]), 
	.Q(reg_ctrl_timers_tm1_o[3]), 
	.D(n_762), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[3]), 
	.Q(reg_ctrl_timers_tm1_o[4]), 
	.D(n_761), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[0]), 
	.Q(reg_ctrl_timers_tm1_o[5]), 
	.D(n_760), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[3]), 
	.Q(reg_ctrl_timers_tm1_o[6]), 
	.D(n_759), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[15][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[1]), 
	.Q(reg_ctrl_timers_tm1_o[7]), 
	.D(n_758), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][0]  (.SE(DFT_sen), 
	.SD(\sfr[25][7] ), 
	.Q(reg_ctrl_timers_tacpl_o[0]), 
	.D(n_726), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[0]), 
	.Q(reg_ctrl_timers_tacpl_o[1]), 
	.D(n_725), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[1]), 
	.Q(reg_ctrl_timers_tacpl_o[2]), 
	.D(n_722), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[2]), 
	.Q(reg_ctrl_timers_tacpl_o[3]), 
	.D(n_721), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[3]), 
	.Q(reg_ctrl_timers_tacpl_o[4]), 
	.D(n_720), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[4]), 
	.Q(reg_ctrl_timers_tacpl_o[5]), 
	.D(n_719), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[5]), 
	.Q(reg_ctrl_timers_tacpl_o[6]), 
	.D(n_718), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[26][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[6]), 
	.Q(reg_ctrl_timers_tacpl_o[7]), 
	.D(n_717), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[7]), 
	.Q(reg_ctrl_timers_tacph_o[0]), 
	.D(n_716), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph_o[0]), 
	.Q(reg_ctrl_timers_tacph_o[1]), 
	.D(n_714), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][0]  (.SE(DFT_sen), 
	.SD(\sfr[31][2] ), 
	.Q(\sfr[30][0] ), 
	.D(n_710), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][1]  (.SE(DFT_sen), 
	.SD(\sfr[30][0] ), 
	.Q(\sfr[30][1] ), 
	.D(n_709), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][2]  (.SE(DFT_sen), 
	.SD(\sfr[30][1] ), 
	.Q(\sfr[30][2] ), 
	.D(n_706), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][3]  (.SE(DFT_sen), 
	.SD(\sfr[30][2] ), 
	.Q(\sfr[30][3] ), 
	.D(n_705), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][4]  (.SE(DFT_sen), 
	.SD(\sfr[30][5] ), 
	.Q(\sfr[30][4] ), 
	.D(n_704), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][5]  (.SE(DFT_sen), 
	.SD(\sfr[30][3] ), 
	.Q(\sfr[30][5] ), 
	.D(n_703), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][6]  (.SE(DFT_sen), 
	.SD(\sfr[30][4] ), 
	.Q(\sfr[30][6] ), 
	.D(n_701), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[30][7]  (.SE(DFT_sen), 
	.SD(\sfr[30][6] ), 
	.Q(\sfr[30][7] ), 
	.D(n_702), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[5]), 
	.Q(reg_ctrl_ports_p0en_o[0]), 
	.D(n_777), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[0]), 
	.Q(reg_ctrl_ports_p0en_o[1]), 
	.D(n_778), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[4]), 
	.Q(reg_ctrl_ports_p0en_o[2]), 
	.D(n_773), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[2]), 
	.Q(reg_ctrl_ports_p0en_o[3]), 
	.D(n_772), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[7]), 
	.Q(reg_ctrl_ports_p0en_o[4]), 
	.D(n_771), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[6]), 
	.Q(reg_ctrl_ports_p0en_o[5]), 
	.D(n_769), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[0]), 
	.Q(reg_ctrl_ports_p0en_o[6]), 
	.D(n_770), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[32][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[1]), 
	.Q(reg_ctrl_ports_p0en_o[7]), 
	.D(n_768), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][1]  (.SE(DFT_sen), 
	.SD(\sfr[7][4] ), 
	.Q(\sfr[7][1] ), 
	.D(n_700), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][2]  (.SE(DFT_sen), 
	.SD(\sfr[7][3] ), 
	.Q(reg_ctrl_baudrate_rs232_o), 
	.D(n_699), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][3]  (.SE(DFT_sen), 
	.SD(\sfr[7][0] ), 
	.Q(\sfr[7][3] ), 
	.D(n_695), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_gate_t1_o), 
	.Q(reg_ctrl_baudrate_smod_o), 
	.D(n_693), 
	.C(reg_ctrl_clk_i));
   AN221X0 p8604A (.Q(n_942), 
	.E(n_820), 
	.D(n_977), 
	.C(reg_ctrl_timers_gate_t1_o), 
	.B(reg_ctrl_interrupt_ie_o[7]), 
	.A(n_890));
   AO221X0 p8679A (.Q(n_941), 
	.E(n_892), 
	.D(reg_ctrl_timers_th1_o[1]), 
	.C(n_541), 
	.B(reg_ctrl_timers_th0_o[1]), 
	.A(n_930));
   ON321X0 p3209A (.Q(n_940), 
	.F(n_658), 
	.E(n_23), 
	.D(n_743), 
	.C(reg_ctrl_ports_p2en_o[0]), 
	.B(n_938), 
	.A(n_68));
   ON321X0 p3208A (.Q(n_939), 
	.F(n_657), 
	.E(n_28), 
	.D(n_741), 
	.C(reg_ctrl_ports_p2en_o[1]), 
	.B(n_938), 
	.A(n_70));
   ON321X0 p3209A22628 (.Q(n_937), 
	.F(n_654), 
	.E(n_12), 
	.D(n_738), 
	.C(reg_ctrl_ports_p2en_o[2]), 
	.B(n_938), 
	.A(n_65));
   ON321X0 p3209A22629 (.Q(n_936), 
	.F(n_653), 
	.E(n_30), 
	.D(n_736), 
	.C(reg_ctrl_ports_p2en_o[3]), 
	.B(n_938), 
	.A(n_71));
   ON321X0 p3208A22630 (.Q(n_935), 
	.F(n_652), 
	.E(n_26), 
	.D(n_734), 
	.C(reg_ctrl_ports_p2en_o[4]), 
	.B(n_938), 
	.A(n_73));
   ON321X0 p3208A22631 (.Q(n_934), 
	.F(n_651), 
	.E(n_7), 
	.D(n_732), 
	.C(reg_ctrl_ports_p2en_o[5]), 
	.B(n_938), 
	.A(n_66));
   ON321X0 p3208A22632 (.Q(n_933), 
	.F(n_650), 
	.E(n_5), 
	.D(n_730), 
	.C(reg_ctrl_ports_p2en_o[6]), 
	.B(n_938), 
	.A(n_75));
   ON321X0 p3208A22633 (.Q(n_932), 
	.F(n_649), 
	.E(n_2), 
	.D(n_728), 
	.C(reg_ctrl_ports_p2en_o[7]), 
	.B(n_938), 
	.A(n_62));
   AN221X0 p8565A22634 (.Q(n_931), 
	.E(n_855), 
	.D(n_957), 
	.C(reg_ctrl_ports_p1_o[2]), 
	.B(reg_ctrl_timers_th0_o[2]), 
	.A(n_930));
   ON31X0 p2882A (.Q(n_929), 
	.D(n_901), 
	.C(n_163), 
	.B(n_641), 
	.A(n_661));
   ON21X0 p5567A (.Q(n_928), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[0]));
   ON21X0 p5567A22635 (.Q(n_927), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[1]));
   ON21X0 p5567A22636 (.Q(n_924), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[2]));
   ON21X0 p5567A22637 (.Q(n_923), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[3]));
   ON21X0 p5567A22638 (.Q(n_922), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[5]));
   ON21X0 p5567A22639 (.Q(n_921), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[6]));
   ON21X0 p5567A22640 (.Q(n_920), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[4]));
   ON21X0 p5567A22641 (.Q(n_919), 
	.C(n_925), 
	.B(n_926), 
	.A(reg_ctrl_ports_p0en_o[7]));
   AO321X0 p10566A (.Q(n_918), 
	.F(n_642), 
	.E(reg_ctrl_interrupt_int0_o), 
	.D(n_606), 
	.C(reg_ctrl_ports_p3en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_916));
   AO321X0 p10566A22642 (.Q(n_917), 
	.F(n_640), 
	.E(reg_ctrl_interrupt_int1_o), 
	.D(n_604), 
	.C(reg_ctrl_ports_p3en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_916));
   AO321X0 p10566A22643 (.Q(n_915), 
	.F(n_639), 
	.E(reg_ctrl_ports_p3_o[4]), 
	.D(n_603), 
	.C(reg_ctrl_ports_p3en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_916));
   AO321X0 p10566A22644 (.Q(n_914), 
	.F(n_638), 
	.E(reg_ctrl_ports_p3_o[5]), 
	.D(n_602), 
	.C(reg_ctrl_ports_p3en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_916));
   AN221X0 p8752A (.Q(n_913), 
	.E(n_753), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[0]), 
	.B(reg_ctrl_ports_p0en_o[0]), 
	.A(n_904));
   SDFRQX0 \sfr_reg[1][3]  (.SE(DFT_sen), 
	.SD(\sfr[1][4] ), 
	.Q(\sfr[1][3] ), 
	.D(n_549), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][4]  (.SE(DFT_sen), 
	.SD(\sfr[1][5] ), 
	.Q(\sfr[1][4] ), 
	.D(n_548), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][5]  (.SE(DFT_sen), 
	.SD(\sfr[1][6] ), 
	.Q(\sfr[1][5] ), 
	.D(n_545), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][6]  (.SE(DFT_sen), 
	.SD(\sfr[1][7] ), 
	.Q(\sfr[1][6] ), 
	.D(n_544), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][7]  (.SE(DFT_sen), 
	.SD(\sfr[2][0] ), 
	.Q(\sfr[1][7] ), 
	.D(n_543), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph_o[1]), 
	.Q(\sfr[27][2] ), 
	.D(n_560), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][3]  (.SE(DFT_sen), 
	.SD(\sfr[27][2] ), 
	.Q(\sfr[27][3] ), 
	.D(n_562), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][4]  (.SE(DFT_sen), 
	.SD(\sfr[27][3] ), 
	.Q(\sfr[27][4] ), 
	.D(n_561), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][5]  (.SE(DFT_sen), 
	.SD(\sfr[27][4] ), 
	.Q(\sfr[27][5] ), 
	.D(n_559), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][6]  (.SE(DFT_sen), 
	.SD(\sfr[27][5] ), 
	.Q(\sfr[27][6] ), 
	.D(n_558), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[27][7]  (.SE(DFT_sen), 
	.SD(\sfr[27][6] ), 
	.Q(\sfr[27][7] ), 
	.D(n_557), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][0]  (.SE(DFT_sen), 
	.SD(\sfr[2][1] ), 
	.Q(\sfr[2][0] ), 
	.D(n_617), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][1]  (.SE(DFT_sen), 
	.SD(\sfr[2][2] ), 
	.Q(\sfr[2][1] ), 
	.D(n_609), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][2]  (.SE(DFT_sen), 
	.SD(\sfr[2][3] ), 
	.Q(\sfr[2][2] ), 
	.D(n_616), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][3]  (.SE(DFT_sen), 
	.SD(\sfr[2][4] ), 
	.Q(\sfr[2][3] ), 
	.D(n_608), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][4]  (.SE(DFT_sen), 
	.SD(\sfr[2][5] ), 
	.Q(\sfr[2][4] ), 
	.D(n_612), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][5]  (.SE(DFT_sen), 
	.SD(\sfr[2][6] ), 
	.Q(\sfr[2][5] ), 
	.D(n_610), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][6]  (.SE(DFT_sen), 
	.SD(\sfr[2][7] ), 
	.Q(\sfr[2][6] ), 
	.D(n_611), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[2][7]  (.SE(DFT_sen), 
	.SD(\sfr[3][4] ), 
	.Q(\sfr[2][7] ), 
	.D(n_607), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][0]  (.SE(DFT_sen), 
	.SD(\sfr[30][7] ), 
	.Q(\sfr[31][0] ), 
	.D(n_598), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][1]  (.SE(DFT_sen), 
	.SD(\sfr[31][5] ), 
	.Q(\sfr[31][1] ), 
	.D(n_597), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][2]  (.SE(DFT_sen), 
	.SD(\sfr[29][7] ), 
	.Q(\sfr[31][2] ), 
	.D(n_593), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][3]  (.SE(DFT_sen), 
	.SD(\sfr[31][4] ), 
	.Q(\sfr[31][3] ), 
	.D(n_592), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][4]  (.SE(DFT_sen), 
	.SD(\sfr[31][0] ), 
	.Q(\sfr[31][4] ), 
	.D(n_591), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][5]  (.SE(DFT_sen), 
	.SD(\sfr[31][7] ), 
	.Q(\sfr[31][5] ), 
	.D(n_590), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][6]  (.SE(DFT_sen), 
	.SD(\sfr[31][1] ), 
	.Q(\sfr[31][6] ), 
	.D(n_589), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[31][7]  (.SE(DFT_sen), 
	.SD(\sfr[31][3] ), 
	.Q(\sfr[31][7] ), 
	.D(n_588), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_psw_rs_o[0]), 
	.Q(reg_ctrl_fsm_psw_rs_o[1]), 
	.D(n_586), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][3]  (.SE(DFT_sen), 
	.SD(\sfr[34][1] ), 
	.Q(reg_ctrl_fsm_psw_rs_o[0]), 
	.D(n_587), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_psw_rs_o[1]), 
	.Q(\sfr[34][5] ), 
	.D(n_585), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[3]), 
	.Q(\sfr[36][0] ), 
	.D(n_584), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][1]  (.SE(DFT_sen), 
	.SD(\sfr[36][3] ), 
	.Q(\sfr[36][1] ), 
	.D(n_583), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][2]  (.SE(DFT_sen), 
	.SD(\sfr[36][7] ), 
	.Q(\sfr[36][2] ), 
	.D(n_580), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][3]  (.SE(DFT_sen), 
	.SD(\sfr[36][4] ), 
	.Q(\sfr[36][3] ), 
	.D(n_579), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][4]  (.SE(DFT_sen), 
	.SD(\sfr[36][2] ), 
	.Q(\sfr[36][4] ), 
	.D(n_578), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfp_o[2]), 
	.Q(\sfr[36][5] ), 
	.D(n_577), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[0]), 
	.Q(\sfr[36][6] ), 
	.D(n_576), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[36][7]  (.SE(DFT_sen), 
	.SD(\sfr[36][6] ), 
	.Q(\sfr[36][7] ), 
	.D(n_575), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][0]  (.SE(DFT_sen), 
	.SD(\sfr[36][5] ), 
	.Q(reg_ctrl_ports_p2en_o[0]), 
	.D(n_673), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][1]  (.SE(DFT_sen), 
	.SD(\sfr[36][1] ), 
	.Q(reg_ctrl_ports_p2en_o[1]), 
	.D(n_672), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][2]  (.SE(DFT_sen), 
	.SD(\sfr[36][0] ), 
	.Q(reg_ctrl_ports_p2en_o[2]), 
	.D(n_668), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[4]), 
	.Q(reg_ctrl_ports_p2en_o[3]), 
	.D(n_667), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[7]), 
	.Q(reg_ctrl_ports_p2en_o[4]), 
	.D(n_666), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[1]), 
	.Q(reg_ctrl_ports_p2en_o[5]), 
	.D(n_665), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[5]), 
	.Q(reg_ctrl_ports_p2en_o[6]), 
	.D(n_664), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[37][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[6]), 
	.Q(reg_ctrl_ports_p2en_o[7]), 
	.D(n_663), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][0]  (.SE(DFT_sen), 
	.SD(\sfr[38][2] ), 
	.Q(\sfr[38][0] ), 
	.D(n_574), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[4]), 
	.Q(\sfr[38][1] ), 
	.D(n_571), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][2]  (.SE(DFT_sen), 
	.SD(\sfr[38][1] ), 
	.Q(\sfr[38][2] ), 
	.D(n_570), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][3]  (.SE(DFT_sen), 
	.SD(\sfr[38][5] ), 
	.Q(\sfr[38][3] ), 
	.D(n_569), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][4]  (.SE(DFT_sen), 
	.SD(\sfr[38][3] ), 
	.Q(\sfr[38][4] ), 
	.D(n_568), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][5]  (.SE(DFT_sen), 
	.SD(\sfr[38][6] ), 
	.Q(\sfr[38][5] ), 
	.D(n_567), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][6]  (.SE(DFT_sen), 
	.SD(\sfr[38][7] ), 
	.Q(\sfr[38][6] ), 
	.D(n_566), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[38][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[0]), 
	.Q(\sfr[38][7] ), 
	.D(n_601), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[1]), 
	.Q(reg_ctrl_ports_p3en_o[0]), 
	.D(n_675), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[2]), 
	.Q(reg_ctrl_ports_p3en_o[1]), 
	.D(n_674), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][6]  (.SE(DFT_sen), 
	.SD(\sfr[38][4] ), 
	.Q(reg_ctrl_ports_p3en_o[6]), 
	.D(n_662), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[7]), 
	.Q(reg_ctrl_ports_p3en_o[7]), 
	.D(n_660), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][0]  (.SE(DFT_sen), 
	.SD(\sfr[5][6] ), 
	.Q(\sfr[6][0] ), 
	.D(n_626), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][1]  (.SE(DFT_sen), 
	.SD(\sfr[5][7] ), 
	.Q(\sfr[6][1] ), 
	.D(n_619), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][3]  (.SE(DFT_sen), 
	.SD(\sfr[6][0] ), 
	.Q(\sfr[6][3] ), 
	.D(n_618), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][4]  (.SE(DFT_sen), 
	.SD(\sfr[6][1] ), 
	.Q(\sfr[6][4] ), 
	.D(n_622), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][5]  (.SE(DFT_sen), 
	.SD(\sfr[6][4] ), 
	.Q(\sfr[6][5] ), 
	.D(n_621), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][6]  (.SE(DFT_sen), 
	.SD(\sfr[6][5] ), 
	.Q(\sfr[6][6] ), 
	.D(n_620), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[6][7]  (.SE(DFT_sen), 
	.SD(n_1231), 
	.Q(\sfr[6][7] ), 
	.D(n_613), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][0]  (.SE(DFT_sen), 
	.SD(\sfr[7][1] ), 
	.Q(\sfr[7][0] ), 
	.D(n_555), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][5]  (.SE(DFT_sen), 
	.SD(\sfr[7][6] ), 
	.Q(\sfr[7][5] ), 
	.D(n_563), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][4]  (.SE(DFT_sen), 
	.SD(\sfr[7][5] ), 
	.Q(\sfr[7][4] ), 
	.D(n_556), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[7][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_gate_t0_o), 
	.Q(\sfr[7][6] ), 
	.D(n_554), 
	.C(reg_ctrl_clk_i));
   AO221X0 p8465A (.Q(n_911), 
	.E(n_821), 
	.D(reg_ctrl_fsm_data_o[3]), 
	.C(n_599), 
	.B(reg_ctrl_timers_gate_t0_o), 
	.A(n_977));
   NA3X0 p8696A (.Q(n_910), 
	.C(n_254), 
	.B(n_328), 
	.A(n_819));
   NA3X0 p8702A (.Q(n_909), 
	.C(n_232), 
	.B(n_413), 
	.A(n_866));
   AN221X0 p8854A (.Q(n_908), 
	.E(n_809), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[6]), 
	.B(reg_ctrl_ports_p1_o[6]), 
	.A(n_957));
   AN221X0 p8857A (.Q(n_906), 
	.E(n_812), 
	.D(n_904), 
	.C(reg_ctrl_ports_p0en_o[5]), 
	.B(reg_ctrl_ports_p1_o[5]), 
	.A(n_957));
   AND6X0 p8912A (.Q(n_903), 
	.F(n_273), 
	.E(n_236), 
	.D(n_423), 
	.C(n_419), 
	.B(n_417), 
	.A(n_757));
   ON21X0 p2720A (.Q(n_902), 
	.C(n_779), 
	.B(n_540), 
	.A(n_209));
   AN321X0 p6302A (.Q(n_901), 
	.F(n_648), 
	.E(reg_ctrl_ports_p3_o[6]), 
	.D(n_627), 
	.C(reg_ctrl_ports_p3en_o[6]), 
	.B(n_916), 
	.A(reg_ctrl_fsm_data_i[6]));
   AN221X0 p8735A22714 (.Q(n_899), 
	.E(n_600), 
	.D(n_963), 
	.C(reg_ctrl_ports_p3_o[1]), 
	.B(\sfr[1][1] ), 
	.A(n_898));
   AO222X0 p9090A22715 (.Q(n_897), 
	.F(reg_ctrl_timers_tl1_o[7]), 
	.E(n_751), 
	.D(reg_ctrl_ports_p0_o[7]), 
	.C(n_896), 
	.B(reg_ctrl_timers_tl0_o[7]), 
	.A(n_752));
   AN221X0 p9110A (.Q(n_895), 
	.E(n_565), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[3]), 
	.B(reg_ctrl_ports_p1en_o[3]), 
	.A(n_976));
   AN211X0 p8922A (.Q(n_894), 
	.D(n_646), 
	.C(n_542), 
	.B(n_963), 
	.A(reg_ctrl_ports_p3_o[7]));
   SDFRQX0 \sfr_reg[12][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[0]), 
	.Q(reg_ctrl_timers_th0_o[0]), 
	.D(n_521), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[0]), 
	.Q(reg_ctrl_timers_th0_o[1]), 
	.D(n_517), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[1]), 
	.Q(reg_ctrl_timers_th0_o[2]), 
	.D(n_513), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[2]), 
	.Q(reg_ctrl_timers_th0_o[3]), 
	.D(n_512), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[5]), 
	.Q(reg_ctrl_timers_th0_o[4]), 
	.D(n_510), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[7]), 
	.Q(reg_ctrl_timers_th0_o[5]), 
	.D(n_509), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[0]), 
	.Q(reg_ctrl_timers_th0_o[6]), 
	.D(n_508), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[12][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[6]), 
	.Q(reg_ctrl_timers_th0_o[7]), 
	.D(n_507), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[4]), 
	.Q(reg_ctrl_timers_th1_o[0]), 
	.D(n_506), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[7]), 
	.Q(reg_ctrl_timers_th1_o[1]), 
	.D(n_505), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[1]), 
	.Q(reg_ctrl_timers_th1_o[2]), 
	.D(n_502), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[2]), 
	.Q(reg_ctrl_timers_th1_o[3]), 
	.D(n_501), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[3]), 
	.Q(reg_ctrl_timers_th1_o[4]), 
	.D(n_500), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[0]), 
	.Q(reg_ctrl_timers_th1_o[5]), 
	.D(n_499), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[5]), 
	.Q(reg_ctrl_timers_th1_o[6]), 
	.D(n_498), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[13][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[6]), 
	.Q(reg_ctrl_timers_th1_o[7]), 
	.D(n_497), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[2]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[0]), 
	.D(n_484), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][1]  (.SE(DFT_sen), 
	.SD(\sfr[17][2] ), 
	.Q(reg_ctrl_serial_sbuf_tx_o[1]), 
	.D(n_473), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[3]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[2]), 
	.D(n_483), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[4]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[3]), 
	.D(n_472), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][6]  (.SE(DFT_sen), 
	.SD(\sfr[5][5] ), 
	.Q(\sfr[5][6] ), 
	.D(n_457), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[5]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[4]), 
	.D(n_480), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[6]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[5]), 
	.D(n_479), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[7]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[6]), 
	.D(n_478), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][0]  (.SE(DFT_sen), 
	.SD(\sfr[1][1] ), 
	.Q(\sfr[1][0] ), 
	.D(n_477), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][1]  (.SE(DFT_sen), 
	.SD(\sfr[1][2] ), 
	.Q(\sfr[1][1] ), 
	.D(n_476), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[1][2]  (.SE(DFT_sen), 
	.SD(\sfr[1][3] ), 
	.Q(\sfr[1][2] ), 
	.D(n_474), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[19][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[1]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[7]), 
	.D(n_471), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][6]  (.SE(DFT_sen), 
	.SD(\sfr[5][1] ), 
	.Q(\sfr[4][6] ), 
	.D(n_464), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[34][1]  (.SE(DFT_sen), 
	.SD(\sfr[38][0] ), 
	.Q(\sfr[34][1] ), 
	.D(n_495), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[3]), 
	.Q(reg_ctrl_ports_p3en_o[2]), 
	.D(n_535), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tr2_o), 
	.Q(reg_ctrl_ports_p3en_o[3]), 
	.D(n_534), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][0]  (.SE(DFT_sen), 
	.SD(\sfr[3][1] ), 
	.Q(\sfr[3][0] ), 
	.D(n_532), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[2]), 
	.Q(\sfr[3][1] ), 
	.D(n_531), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][2]  (.SE(DFT_sen), 
	.SD(\sfr[3][0] ), 
	.Q(\sfr[3][2] ), 
	.D(n_528), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][3]  (.SE(DFT_sen), 
	.SD(\sfr[3][5] ), 
	.Q(\sfr[3][3] ), 
	.D(n_527), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][4]  (.SE(DFT_sen), 
	.SD(\sfr[3][3] ), 
	.Q(\sfr[3][4] ), 
	.D(n_526), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][5]  (.SE(DFT_sen), 
	.SD(\sfr[3][6] ), 
	.Q(\sfr[3][5] ), 
	.D(n_525), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][6]  (.SE(DFT_sen), 
	.SD(\sfr[3][7] ), 
	.Q(\sfr[3][6] ), 
	.D(n_524), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[3][7]  (.SE(DFT_sen), 
	.SD(\sfr[3][2] ), 
	.Q(\sfr[3][7] ), 
	.D(n_523), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][0]  (.SE(DFT_sen), 
	.SD(\sfr[4][3] ), 
	.Q(\sfr[4][0] ), 
	.D(n_470), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][1]  (.SE(DFT_sen), 
	.SD(\sfr[4][0] ), 
	.Q(\sfr[4][1] ), 
	.D(n_451), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][2]  (.SE(DFT_sen), 
	.SD(\sfr[4][1] ), 
	.Q(\sfr[4][2] ), 
	.D(n_469), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_tx_o), 
	.Q(\sfr[4][3] ), 
	.D(n_455), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][4]  (.SE(DFT_sen), 
	.SD(\sfr[4][2] ), 
	.Q(DFT_sdo), 
	.D(n_466), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][5]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(\sfr[4][5] ), 
	.D(n_465), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[4][7]  (.SE(DFT_sen), 
	.SD(\sfr[6][7] ), 
	.Q(\sfr[4][7] ), 
	.D(n_454), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][0]  (.SE(DFT_sen), 
	.SD(\sfr[4][5] ), 
	.Q(\sfr[5][0] ), 
	.D(n_463), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][1]  (.SE(DFT_sen), 
	.SD(\sfr[5][0] ), 
	.Q(\sfr[5][1] ), 
	.D(n_453), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][2]  (.SE(DFT_sen), 
	.SD(\sfr[5][3] ), 
	.Q(\sfr[5][2] ), 
	.D(n_462), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][3]  (.SE(DFT_sen), 
	.SD(\sfr[4][6] ), 
	.Q(\sfr[5][3] ), 
	.D(n_456), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][4]  (.SE(DFT_sen), 
	.SD(\sfr[5][2] ), 
	.Q(\sfr[5][4] ), 
	.D(n_459), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][5]  (.SE(DFT_sen), 
	.SD(\sfr[5][4] ), 
	.Q(\sfr[5][5] ), 
	.D(n_458), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[5][7]  (.SE(DFT_sen), 
	.SD(\sfr[4][7] ), 
	.Q(\sfr[5][7] ), 
	.D(n_452), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie1_o), 
	.Q(reg_ctrl_interrupt_ie0_o), 
	.D(n_522), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][3]  (.SE(DFT_sen), 
	.SD(\sfr[6][6] ), 
	.Q(reg_ctrl_interrupt_ie1_o), 
	.D(n_520), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_it1_o), 
	.Q(reg_ctrl_interrupt_tf0_o), 
	.D(n_514), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tr0_o), 
	.Q(reg_ctrl_interrupt_tf1_o), 
	.D(n_511), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_it0_o), 
	.Q(reg_ctrl_timers_m0_t0_o), 
	.D(n_493), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m0_t0_o), 
	.Q(reg_ctrl_timers_m1_t0_o), 
	.D(n_494), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][3]  (.SE(DFT_sen), 
	.SD(\sfr[9][6] ), 
	.Q(reg_ctrl_timers_gate_t0_o), 
	.D(n_490), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_rs232_o), 
	.Q(reg_ctrl_timers_m0_t1_o), 
	.D(n_489), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m1_t0_o), 
	.Q(reg_ctrl_timers_m1_t1_o), 
	.D(n_487), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m1_t1_o), 
	.Q(reg_ctrl_timers_gate_t1_o), 
	.D(n_485), 
	.C(reg_ctrl_clk_i));
   NA3X0 p8868A (.Q(n_893), 
	.C(n_229), 
	.B(n_195), 
	.A(n_816));
   AO221X0 p8681A (.Q(n_892), 
	.E(n_679), 
	.D(reg_ctrl_timers_tm1_o[1]), 
	.C(n_810), 
	.B(reg_ctrl_timers_tm0_o[1]), 
	.A(n_811));
   AO221X0 p8820A (.Q(n_891), 
	.E(n_815), 
	.D(reg_ctrl_interrupt_ip_o[4]), 
	.C(n_865), 
	.B(reg_ctrl_interrupt_ie_o[4]), 
	.A(n_890));
   ON211X0 p8605A (.Q(n_889), 
	.D(n_326), 
	.C(n_194), 
	.B(\sfr[6][2] ), 
	.A(n_414));
   AN221X0 p9126A (.Q(n_888), 
	.E(n_450), 
	.D(n_886), 
	.C(\sfr[31][5] ), 
	.B(reg_ctrl_ports_p0_o[5]), 
	.A(n_896));
   AN221X0 p9194A (.Q(n_887), 
	.E(n_435), 
	.D(n_886), 
	.C(\sfr[31][1] ), 
	.B(reg_ctrl_ports_p0_o[1]), 
	.A(n_896));
   AN221X0 p9022A (.Q(n_885), 
	.E(n_447), 
	.D(reg_ctrl_ports_p0_o[0]), 
	.C(n_896), 
	.B(n_825), 
	.A(reg_ctrl_timers_tacpl_o[0]));
   AO221X0 p8520A (.Q(n_884), 
	.E(n_808), 
	.D(reg_ctrl_timers_m0_t1_o), 
	.C(n_977), 
	.B(reg_ctrl_ports_p0en_o[4]), 
	.A(n_904));
   ON221X0 p6222A (.Q(n_882), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[0]), 
	.C(n_879), 
	.B(n_36), 
	.A(n_880));
   ON221X0 p6222A22780 (.Q(n_881), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[1]), 
	.C(n_879), 
	.B(n_50), 
	.A(n_880));
   ON221X0 p6222A22781 (.Q(n_877), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[2]), 
	.C(n_879), 
	.B(n_55), 
	.A(n_880));
   ON221X0 p6222A22782 (.Q(n_875), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[3]), 
	.C(n_879), 
	.B(n_53), 
	.A(n_880));
   ON221X0 p6222A22783 (.Q(n_873), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[4]), 
	.C(n_879), 
	.B(n_61), 
	.A(n_880));
   ON221X0 p6222A22784 (.Q(n_871), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[5]), 
	.C(n_879), 
	.B(n_49), 
	.A(n_880));
   ON221X0 p6222A22785 (.Q(n_870), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[6]), 
	.C(n_879), 
	.B(n_54), 
	.A(n_880));
   ON221X0 p6222A22786 (.Q(n_868), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[7]), 
	.C(n_879), 
	.B(n_52), 
	.A(n_880));
   AN222X0 p8704A (.Q(n_866), 
	.F(reg_ctrl_interrupt_ie_o[0]), 
	.E(n_890), 
	.D(n_677), 
	.C(\sfr[6][0] ), 
	.B(n_865), 
	.A(reg_ctrl_interrupt_ip_o[0]));
   AN22X0 p9767A (.Q(n_864), 
	.D(n_828), 
	.C(reg_ctrl_timers_dfp_o[0]), 
	.B(n_896), 
	.A(reg_ctrl_ports_p0_o[2]));
   AN22X0 p10084A (.Q(n_863), 
	.D(n_862), 
	.C(reg_ctrl_fsm_psw_rs_o[0]), 
	.B(n_896), 
	.A(reg_ctrl_ports_p0_o[3]));
   AN22X0 p10084A22787 (.Q(n_861), 
	.D(n_958), 
	.C(reg_ctrl_ports_p2_o[4]), 
	.B(n_896), 
	.A(reg_ctrl_ports_p0_o[4]));
   AN221X0 p9062A (.Q(n_860), 
	.E(n_428), 
	.D(n_957), 
	.C(DFT_sdo_3), 
	.B(reg_ctrl_interrupt_int1_o), 
	.A(n_963));
   AN222X0 p10514A22788 (.Q(n_859), 
	.F(n_856), 
	.E(reg_ctrl_serial_p3_0_i), 
	.D(reg_ctrl_fsm_data_i[0]), 
	.C(n_916), 
	.B(n_334), 
	.A(n_857));
   AN222X0 p10514A22789 (.Q(n_858), 
	.F(n_856), 
	.E(reg_ctrl_serial_p3_1_i), 
	.D(reg_ctrl_fsm_data_i[1]), 
	.C(n_916), 
	.B(n_332), 
	.A(n_857));
   ON21X0 p5565A (.Q(n_925), 
	.C(n_637), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.A(reg_ctrl_ext_ram_rd_i));
   NA3X0 p8562A (.Q(n_855), 
	.C(n_202), 
	.B(n_431), 
	.A(n_432));
   ON22X0 p9900A (.Q(n_854), 
	.D(n_851), 
	.C(n_63), 
	.B(n_715), 
	.A(n_852));
   ON22X0 p9900A22790 (.Q(n_853), 
	.D(n_851), 
	.C(n_74), 
	.B(n_712), 
	.A(n_852));
   ON22X0 p9900A22791 (.Q(n_850), 
	.D(n_851), 
	.C(n_69), 
	.B(n_697), 
	.A(n_852));
   ON22X0 p9900A22792 (.Q(n_849), 
	.D(n_851), 
	.C(n_67), 
	.B(n_694), 
	.A(n_852));
   ON22X0 p9900A22793 (.Q(n_848), 
	.D(n_851), 
	.C(n_72), 
	.B(n_488), 
	.A(n_852));
   ON22X0 p9900A22794 (.Q(n_847), 
	.D(n_851), 
	.C(n_64), 
	.B(n_486), 
	.A(n_852));
   ON22X0 p9900A22795 (.Q(n_846), 
	.D(n_851), 
	.C(n_76), 
	.B(n_115), 
	.A(n_852));
   ON22X0 p9900A22796 (.Q(n_845), 
	.D(n_851), 
	.C(n_77), 
	.B(n_692), 
	.A(n_852));
   AO222X0 p2443A (.Q(n_844), 
	.F(n_840), 
	.E(n_787), 
	.D(reg_ctrl_bus_ctrl_p4_i[1]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[1]), 
	.A(n_842));
   AO222X0 p2443A22797 (.Q(n_843), 
	.F(n_840), 
	.E(n_806), 
	.D(reg_ctrl_bus_ctrl_p4_i[0]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[0]), 
	.A(n_842));
   AO222X0 p2443A22798 (.Q(n_839), 
	.F(n_840), 
	.E(n_803), 
	.D(reg_ctrl_bus_ctrl_p4_i[2]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[2]), 
	.A(n_842));
   AO222X0 p2443A22799 (.Q(n_838), 
	.F(n_840), 
	.E(n_785), 
	.D(reg_ctrl_bus_ctrl_p4_i[3]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[3]), 
	.A(n_842));
   AO222X0 p2443A22800 (.Q(n_837), 
	.F(n_840), 
	.E(n_800), 
	.D(reg_ctrl_bus_ctrl_p4_i[4]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[4]), 
	.A(n_842));
   AO222X0 p2443A22801 (.Q(n_836), 
	.F(n_840), 
	.E(n_798), 
	.D(reg_ctrl_bus_ctrl_p4_i[5]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[5]), 
	.A(n_842));
   AO222X0 p2443A22802 (.Q(n_835), 
	.F(n_840), 
	.E(n_796), 
	.D(reg_ctrl_bus_ctrl_p4_i[6]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[6]), 
	.A(n_842));
   AO222X0 p2443A22803 (.Q(n_834), 
	.F(n_840), 
	.E(n_783), 
	.D(reg_ctrl_bus_ctrl_p4_i[7]), 
	.C(n_841), 
	.B(reg_ctrl_ports_p4_o[7]), 
	.A(n_842));
   AN221X0 p8654A22804 (.Q(n_833), 
	.E(n_441), 
	.D(n_830), 
	.C(\sfr[3][6] ), 
	.B(\sfr[2][6] ), 
	.A(n_831));
   AN221X0 p9029A (.Q(n_832), 
	.E(n_439), 
	.D(n_830), 
	.C(\sfr[3][7] ), 
	.B(\sfr[2][7] ), 
	.A(n_831));
   AN221X0 p9105A (.Q(n_829), 
	.E(n_436), 
	.D(n_828), 
	.C(reg_ctrl_timers_dfsel_o), 
	.B(reg_ctrl_ports_p2_o[1]), 
	.A(n_958));
   AN221X0 p9055A (.Q(n_827), 
	.E(n_434), 
	.D(n_448), 
	.C(\sfr[25][2] ), 
	.B(\sfr[3][2] ), 
	.A(n_830));
   AN221X0 p8642A (.Q(n_826), 
	.E(n_430), 
	.D(\sfr[36][2] ), 
	.C(n_745), 
	.B(n_825), 
	.A(reg_ctrl_timers_tacpl_o[2]));
   AN221X0 p9008A (.Q(n_824), 
	.E(n_429), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[3]), 
	.B(reg_ctrl_timers_tacpl_o[3]), 
	.A(n_825));
   AN221X0 p8625A22805 (.Q(n_823), 
	.E(n_422), 
	.D(n_886), 
	.C(\sfr[31][4] ), 
	.B(reg_ctrl_timers_dfp_o[2]), 
	.A(n_828));
   AN221X0 p8582A22806 (.Q(n_822), 
	.E(n_415), 
	.D(n_446), 
	.C(\sfr[27][5] ), 
	.B(\sfr[2][5] ), 
	.A(n_831));
   SDFRQX0 \sfr_reg[9][6]  (.SE(DFT_sen), 
	.SD(\sfr[9][2] ), 
	.Q(\sfr[9][6] ), 
	.D(n_333), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 serial_status_reg (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[1]), 
	.Q(serial_status), 
	.D(n_330), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][0]  (.SE(DFT_sen), 
	.SD(\sfr[24][7] ), 
	.Q(\sfr[25][0] ), 
	.D(n_385), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][1]  (.SE(DFT_sen), 
	.SD(\sfr[25][0] ), 
	.Q(\sfr[25][1] ), 
	.D(n_384), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][2]  (.SE(DFT_sen), 
	.SD(\sfr[25][1] ), 
	.Q(\sfr[25][2] ), 
	.D(n_379), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][3]  (.SE(DFT_sen), 
	.SD(\sfr[25][2] ), 
	.Q(\sfr[25][3] ), 
	.D(n_378), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][4]  (.SE(DFT_sen), 
	.SD(\sfr[25][3] ), 
	.Q(\sfr[25][4] ), 
	.D(n_377), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][5]  (.SE(DFT_sen), 
	.SD(\sfr[25][4] ), 
	.Q(\sfr[25][5] ), 
	.D(n_375), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][6]  (.SE(DFT_sen), 
	.SD(\sfr[25][5] ), 
	.Q(\sfr[25][6] ), 
	.D(n_376), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[25][7]  (.SE(DFT_sen), 
	.SD(\sfr[25][6] ), 
	.Q(\sfr[25][7] ), 
	.D(n_374), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][0]  (.SE(DFT_sen), 
	.SD(\sfr[27][7] ), 
	.Q(\sfr[28][0] ), 
	.D(n_369), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][1]  (.SE(DFT_sen), 
	.SD(\sfr[28][0] ), 
	.Q(DFT_sdo_6), 
	.D(n_371), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][2]  (.SE(DFT_sen), 
	.SD(\sfr[29][4] ), 
	.Q(\sfr[28][2] ), 
	.D(n_366), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][3]  (.SE(DFT_sen), 
	.SD(\sfr[29][6] ), 
	.Q(\sfr[28][3] ), 
	.D(n_365), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][4]  (.SE(DFT_sen), 
	.SD(\sfr[29][1] ), 
	.Q(\sfr[28][4] ), 
	.D(n_363), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][5]  (.SE(DFT_sen), 
	.SD(\sfr[28][4] ), 
	.Q(\sfr[28][5] ), 
	.D(n_364), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[28][7]  (.SE(DFT_sen), 
	.SD(\sfr[29][0] ), 
	.Q(\sfr[28][7] ), 
	.D(n_361), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][0]  (.SE(DFT_sen), 
	.SD(\sfr[28][5] ), 
	.Q(\sfr[29][0] ), 
	.D(n_360), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][1]  (.SE(DFT_sen), 
	.SD(\sfr[28][3] ), 
	.Q(\sfr[29][1] ), 
	.D(n_359), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][2]  (.SE(DFT_sen), 
	.SD(\sfr[29][5] ), 
	.Q(\sfr[29][2] ), 
	.D(n_356), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][3]  (.SE(DFT_sen), 
	.SD(\sfr[29][2] ), 
	.Q(\sfr[29][3] ), 
	.D(n_353), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[5]), 
	.Q(\sfr[29][4] ), 
	.D(n_352), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][5]  (.SE(DFT_sen), 
	.SD(\sfr[28][2] ), 
	.Q(\sfr[29][5] ), 
	.D(n_351), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][7]  (.SE(DFT_sen), 
	.SD(\sfr[29][3] ), 
	.Q(\sfr[29][7] ), 
	.D(n_349), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[9][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_smod_o), 
	.Q(\sfr[9][2] ), 
	.D(n_331), 
	.C(reg_ctrl_clk_i));
   NA2X0 p8466A22832 (.Q(n_821), 
	.B(n_411), 
	.A(n_676));
   NA3X0 p8602A22833 (.Q(n_820), 
	.C(n_224), 
	.B(n_412), 
	.A(n_678));
   SDFRQX0 \sfr_reg[28][6]  (.SE(DFT_sen), 
	.SD(\sfr[28][7] ), 
	.Q(\sfr[28][6] ), 
	.D(n_362), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[29][6]  (.SE(DFT_sen), 
	.SD(\sfr[31][6] ), 
	.Q(\sfr[29][6] ), 
	.D(n_350), 
	.C(reg_ctrl_clk_i));
   AN222X0 p8698A (.Q(n_819), 
	.F(reg_ctrl_interrupt_tf0_o), 
	.E(n_817), 
	.D(n_677), 
	.C(\sfr[6][5] ), 
	.B(n_890), 
	.A(reg_ctrl_interrupt_ie_o[5]));
   AN222X0 p8871A22836 (.Q(n_816), 
	.F(\sfr[6][6] ), 
	.E(n_677), 
	.D(n_813), 
	.C(\sfr[5][6] ), 
	.B(n_814), 
	.A(\sfr[4][6] ));
   AO222X0 p8822A (.Q(n_815), 
	.F(n_813), 
	.E(\sfr[5][4] ), 
	.D(n_677), 
	.C(\sfr[6][4] ), 
	.B(n_814), 
	.A(DFT_sdo));
   SDFRQX0 \sfr_reg[24][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[5]), 
	.Q(reg_ctrl_interrupt_ip_o[6]), 
	.D(n_311), 
	.C(reg_ctrl_clk_i));
   AO221X0 p8856A (.Q(n_812), 
	.E(n_445), 
	.D(reg_ctrl_timers_tm1_o[5]), 
	.C(n_810), 
	.B(reg_ctrl_timers_tm0_o[5]), 
	.A(n_811));
   AO221X0 p8852A (.Q(n_809), 
	.E(n_440), 
	.D(reg_ctrl_timers_tm1_o[6]), 
	.C(n_810), 
	.B(reg_ctrl_timers_tm0_o[6]), 
	.A(n_811));
   AO221X0 p8521A22838 (.Q(n_808), 
	.E(n_418), 
	.D(reg_ctrl_timers_tm1_o[4]), 
	.C(n_810), 
	.B(reg_ctrl_timers_tm0_o[4]), 
	.A(n_811));
   AO22X0 p9965A (.Q(n_807), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[0]), 
	.B(n_806), 
	.A(n_804));
   AO22X0 p9965A22839 (.Q(n_805), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[2]), 
	.B(n_803), 
	.A(n_804));
   AO22X0 p9965A22840 (.Q(n_801), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[4]), 
	.B(n_800), 
	.A(n_804));
   SDFRQX0 \sfr_reg[21][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_sm1_o), 
	.Q(reg_ctrl_interrupt_ie_o[6]), 
	.D(n_325), 
	.C(reg_ctrl_clk_i));
   AO22X0 p9965A22842 (.Q(n_799), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[5]), 
	.B(n_798), 
	.A(n_804));
   AO22X0 p9965A22843 (.Q(n_797), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[6]), 
	.B(n_796), 
	.A(n_804));
   AO22X0 p9966A (.Q(n_795), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[0]), 
	.B(n_806), 
	.A(n_793));
   AO22X0 p9966A22844 (.Q(n_794), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[2]), 
	.B(n_803), 
	.A(n_793));
   AO22X0 p9966A22845 (.Q(n_791), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[4]), 
	.B(n_800), 
	.A(n_793));
   AO22X0 p9966A22846 (.Q(n_790), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[5]), 
	.B(n_798), 
	.A(n_793));
   AO22X0 p9966A22847 (.Q(n_789), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[6]), 
	.B(n_796), 
	.A(n_793));
   AO22X0 p9965A22848 (.Q(n_788), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[1]), 
	.B(n_787), 
	.A(n_804));
   AO22X0 p9965A22849 (.Q(n_786), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[3]), 
	.B(n_785), 
	.A(n_804));
   AO22X0 p9965A22850 (.Q(n_784), 
	.D(n_802), 
	.C(reg_ctrl_timers_tl1_i[7]), 
	.B(n_783), 
	.A(n_804));
   AO22X0 p9966A22851 (.Q(n_782), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[1]), 
	.B(n_787), 
	.A(n_793));
   AO22X0 p9966A22852 (.Q(n_781), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[3]), 
	.B(n_785), 
	.A(n_793));
   AO22X0 p9966A22853 (.Q(n_780), 
	.D(n_792), 
	.C(reg_ctrl_timers_tm0_i[7]), 
	.B(n_783), 
	.A(n_793));
   AN32X0 p11152A (.Q(n_779), 
	.E(reg_ctrl_ports_p3_o[7]), 
	.D(n_408), 
	.C(reg_ctrl_ports_p3en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_916));
   AO222X0 p5257A (.Q(n_778), 
	.F(reg_ctrl_fsm_data_i[1]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[1]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[1]), 
	.A(n_776));
   AO222X0 p5257A22854 (.Q(n_777), 
	.F(reg_ctrl_fsm_data_i[0]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[0]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[0]), 
	.A(n_776));
   AO222X0 p5256A (.Q(n_773), 
	.F(reg_ctrl_fsm_data_i[2]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[2]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[2]), 
	.A(n_776));
   AO222X0 p5256A22855 (.Q(n_772), 
	.F(reg_ctrl_fsm_data_i[3]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[3]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[3]), 
	.A(n_776));
   AO222X0 p5256A22856 (.Q(n_771), 
	.F(reg_ctrl_fsm_data_i[4]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[4]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[4]), 
	.A(n_776));
   AO222X0 p5256A22857 (.Q(n_770), 
	.F(reg_ctrl_fsm_data_i[6]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[6]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[6]), 
	.A(n_776));
   AO222X0 p5257A22858 (.Q(n_769), 
	.F(reg_ctrl_fsm_data_i[5]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[5]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[5]), 
	.A(n_776));
   AO222X0 p5256A22859 (.Q(n_768), 
	.F(reg_ctrl_fsm_data_i[7]), 
	.E(n_774), 
	.D(reg_ctrl_bus_ctrl_p0en_i[7]), 
	.C(n_775), 
	.B(reg_ctrl_ports_p0en_o[7]), 
	.A(n_776));
   AO22X0 p9892A (.Q(n_767), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[0]), 
	.B(n_806), 
	.A(n_765));
   AO22X0 p9892A22860 (.Q(n_766), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[1]), 
	.B(n_787), 
	.A(n_765));
   AO22X0 p9892A22861 (.Q(n_763), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[2]), 
	.B(n_803), 
	.A(n_765));
   AO22X0 p9892A22862 (.Q(n_762), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[3]), 
	.B(n_785), 
	.A(n_765));
   AO22X0 p9892A22863 (.Q(n_761), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[4]), 
	.B(n_800), 
	.A(n_765));
   AO22X0 p9892A22864 (.Q(n_760), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[5]), 
	.B(n_798), 
	.A(n_765));
   AO22X0 p9892A22865 (.Q(n_759), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[6]), 
	.B(n_796), 
	.A(n_765));
   AO22X0 p9892A22866 (.Q(n_758), 
	.D(n_764), 
	.C(reg_ctrl_timers_tm1_i[7]), 
	.B(n_783), 
	.A(n_765));
   AN221X0 p9243A (.Q(n_757), 
	.E(n_341), 
	.D(n_756), 
	.C(reg_ctrl_ports_p2en_o[0]), 
	.B(\sfr[28][0] ), 
	.A(n_552));
   AN221X0 p9396A (.Q(n_755), 
	.E(n_390), 
	.D(n_754), 
	.C(reg_ctrl_baudrate_sm2_o), 
	.B(reg_ctrl_ports_p2_o[5]), 
	.A(n_958));
   AO221X0 p8751A (.Q(n_753), 
	.E(n_444), 
	.D(reg_ctrl_timers_tl1_o[0]), 
	.C(n_751), 
	.B(reg_ctrl_timers_tl0_o[0]), 
	.A(n_752));
   AN221X0 p10586A (.Q(n_750), 
	.E(n_387), 
	.D(reg_ctrl_baudrate_sm1_o), 
	.C(n_754), 
	.B(n_756), 
	.A(reg_ctrl_ports_p2en_o[6]));
   AN221X0 p9499A (.Q(n_749), 
	.E(n_373), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[6]), 
	.B(reg_ctrl_timers_tacpl_o[6]), 
	.A(n_825));
   AN221X0 p10566A22867 (.Q(n_747), 
	.E(n_355), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[7]), 
	.B(reg_ctrl_ports_p2en_o[7]), 
	.A(n_756));
   AN221X0 p10383A (.Q(n_746), 
	.E(n_343), 
	.D(n_828), 
	.C(reg_ctrl_timers_dfp_o[1]), 
	.B(\sfr[36][3] ), 
	.A(n_745));
   AN221X0 p10383A22868 (.Q(n_744), 
	.E(n_338), 
	.D(reg_ctrl_interrupt_it0_o), 
	.C(n_817), 
	.B(n_745), 
	.A(\sfr[36][0] ));
   AN21X0 p7018A (.Q(n_743), 
	.C(n_407), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[0]));
   AN21X0 p7018A22869 (.Q(n_741), 
	.C(n_405), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[1]));
   AN21X0 p7018A22870 (.Q(n_738), 
	.C(n_402), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[2]));
   AN21X0 p7018A22871 (.Q(n_736), 
	.C(n_400), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[3]));
   AN21X0 p7018A22872 (.Q(n_734), 
	.C(n_398), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[4]));
   AN21X0 p7018A22873 (.Q(n_732), 
	.C(n_396), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[5]));
   AN21X0 p7018A22874 (.Q(n_730), 
	.C(n_394), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[6]));
   AN21X0 p7018A22875 (.Q(n_728), 
	.C(n_392), 
	.B(n_739), 
	.A(reg_ctrl_ports_p2en_o[7]));
   AO22X0 p10034A (.Q(n_726), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[0]), 
	.B(n_806), 
	.A(n_724));
   AO22X0 p10034A22876 (.Q(n_725), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[1]), 
	.B(n_787), 
	.A(n_724));
   AO22X0 p10034A22877 (.Q(n_722), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[2]), 
	.B(n_803), 
	.A(n_724));
   AO22X0 p10034A22878 (.Q(n_721), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[3]), 
	.B(n_785), 
	.A(n_724));
   AO22X0 p10034A22879 (.Q(n_720), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[4]), 
	.B(n_800), 
	.A(n_724));
   AO22X0 p10034A22880 (.Q(n_719), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[5]), 
	.B(n_798), 
	.A(n_724));
   AO22X0 p10034A22881 (.Q(n_718), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[6]), 
	.B(n_796), 
	.A(n_724));
   AO22X0 p10034A22882 (.Q(n_717), 
	.D(n_723), 
	.C(reg_ctrl_timers_tacpl_o[7]), 
	.B(n_783), 
	.A(n_724));
   ON22X0 p10289A (.Q(n_716), 
	.D(n_711), 
	.C(n_6), 
	.B(n_715), 
	.A(n_713));
   ON22X0 p10289A22883 (.Q(n_714), 
	.D(n_711), 
	.C(n_27), 
	.B(n_712), 
	.A(n_713));
   AO22X0 p9836A (.Q(n_710), 
	.D(n_707), 
	.C(\sfr[30][0] ), 
	.B(n_806), 
	.A(n_708));
   AO22X0 p9836A22884 (.Q(n_709), 
	.D(n_707), 
	.C(\sfr[30][1] ), 
	.B(n_787), 
	.A(n_708));
   AO22X0 p9836A22885 (.Q(n_706), 
	.D(n_707), 
	.C(\sfr[30][2] ), 
	.B(n_803), 
	.A(n_708));
   AO22X0 p9836A22886 (.Q(n_705), 
	.D(n_707), 
	.C(\sfr[30][3] ), 
	.B(n_785), 
	.A(n_708));
   AO22X0 p9836A22887 (.Q(n_704), 
	.D(n_707), 
	.C(\sfr[30][4] ), 
	.B(n_800), 
	.A(n_708));
   AO22X0 p9836A22888 (.Q(n_703), 
	.D(n_707), 
	.C(\sfr[30][5] ), 
	.B(n_798), 
	.A(n_708));
   AO22X0 p9836A22889 (.Q(n_702), 
	.D(n_707), 
	.C(\sfr[30][7] ), 
	.B(n_783), 
	.A(n_708));
   AO22X0 p9836A22890 (.Q(n_701), 
	.D(n_707), 
	.C(\sfr[30][6] ), 
	.B(n_796), 
	.A(n_708));
   ON22X0 p9856A (.Q(n_700), 
	.D(n_696), 
	.C(n_33), 
	.B(n_712), 
	.A(n_698));
   ON22X0 p9856A22891 (.Q(n_699), 
	.D(n_696), 
	.C(n_18), 
	.B(n_697), 
	.A(n_698));
   ON22X0 p9856A22892 (.Q(n_695), 
	.D(n_696), 
	.C(n_11), 
	.B(n_694), 
	.A(n_698));
   ON22X0 p9856A22893 (.Q(n_693), 
	.D(n_696), 
	.C(n_34), 
	.B(n_692), 
	.A(n_698));
   AN22X0 p10773A (.Q(n_691), 
	.D(n_209), 
	.C(reg_ctrl_ports_p3_o[0]), 
	.B(reg_ctrl_ports_p3_i[0]), 
	.A(n_336));
   AN22X0 p10773A22894 (.Q(n_690), 
	.D(n_209), 
	.C(reg_ctrl_ports_p3_o[1]), 
	.B(reg_ctrl_ports_p3_i[1]), 
	.A(n_336));
   ON221X0 p10294A (.Q(n_689), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_4), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[0]), 
	.A(n_687));
   ON221X0 p10294A22895 (.Q(n_688), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_20), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[1]), 
	.A(n_687));
   ON221X0 p10294A22896 (.Q(n_685), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_8), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[2]), 
	.A(n_687));
   ON221X0 p10294A22897 (.Q(n_684), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_9), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[3]), 
	.A(n_687));
   ON221X0 p10294A22898 (.Q(n_683), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_16), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[4]), 
	.A(n_687));
   ON221X0 p10294A22899 (.Q(n_682), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_17), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[5]), 
	.A(n_687));
   ON221X0 p10294A22900 (.Q(n_681), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_31), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[6]), 
	.A(n_687));
   ON221X0 p10294A22901 (.Q(n_680), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_21), 
	.C(n_686), 
	.B(reg_ctrl_ports_p1en_o[7]), 
	.A(n_687));
   SDFRQX0 \sfr_reg[8][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_tf1_o), 
	.Q(reg_ctrl_timers_tr1_o), 
	.D(n_274), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 serial_tx_tmp_reg (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[0]), 
	.Q(reg_ctrl_serial_tx_o), 
	.D(n_235), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[4]), 
	.Q(reg_ctrl_interrupt_ri_o), 
	.D(n_272), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_sm0_o), 
	.Q(reg_ctrl_interrupt_ti_o), 
	.D(n_271), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[4]), 
	.Q(reg_ctrl_serial_tb8_o), 
	.D(n_268), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_sm2_o), 
	.Q(reg_ctrl_serial_ren_o), 
	.D(n_267), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ri_o), 
	.Q(reg_ctrl_baudrate_sm2_o), 
	.D(n_266), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[7]), 
	.Q(reg_ctrl_baudrate_sm1_o), 
	.D(n_265), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_tb8_o), 
	.Q(reg_ctrl_baudrate_sm0_o), 
	.D(n_264), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_ren_o), 
	.Q(reg_ctrl_interrupt_ie_o[0]), 
	.D(n_260), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[5]), 
	.Q(reg_ctrl_interrupt_ie_o[1]), 
	.D(n_259), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[3]), 
	.Q(reg_ctrl_interrupt_ie_o[2]), 
	.D(n_258), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[1]), 
	.Q(reg_ctrl_interrupt_ie_o[3]), 
	.D(n_256), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[2]), 
	.Q(reg_ctrl_interrupt_ie_o[4]), 
	.D(n_257), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ti_o), 
	.Q(reg_ctrl_interrupt_ie_o[5]), 
	.D(n_255), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[21][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[0]), 
	.Q(reg_ctrl_interrupt_ie_o[7]), 
	.D(n_324), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[24][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[7]), 
	.Q(reg_ctrl_interrupt_ip_o[0]), 
	.D(n_319), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[24][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[0]), 
	.Q(reg_ctrl_interrupt_ip_o[1]), 
	.D(n_318), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[24][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[1]), 
	.Q(reg_ctrl_interrupt_ip_o[2]), 
	.D(n_315), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[24][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[2]), 
	.Q(reg_ctrl_interrupt_ip_o[3]), 
	.D(n_314), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[24][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[3]), 
	.Q(reg_ctrl_interrupt_ip_o[4]), 
	.D(n_313), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[24][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[4]), 
	.Q(reg_ctrl_interrupt_ip_o[5]), 
	.D(n_312), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[1]), 
	.Q(reg_ctrl_ports_p1en_o[0]), 
	.D(n_309), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[2]), 
	.Q(reg_ctrl_ports_p1en_o[1]), 
	.D(n_308), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[3]), 
	.Q(reg_ctrl_ports_p1en_o[2]), 
	.D(n_305), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[4]), 
	.Q(reg_ctrl_ports_p1en_o[3]), 
	.D(n_303), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[6]), 
	.Q(reg_ctrl_ports_p1en_o[4]), 
	.D(n_304), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[7]), 
	.Q(reg_ctrl_ports_p1en_o[5]), 
	.D(n_301), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][7]  (.SE(DFT_sen), 
	.SD(\sfr[28][6] ), 
	.Q(reg_ctrl_ports_p1en_o[7]), 
	.D(n_300), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfp_o[0]), 
	.Q(reg_ctrl_timers_edgsel_o), 
	.D(n_299), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_edgsel_o), 
	.Q(reg_ctrl_timers_dfsel_o), 
	.D(n_298), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_alu_ov_o), 
	.Q(reg_ctrl_timers_dfp_o[0]), 
	.D(n_295), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][3]  (.SE(DFT_sen), 
	.SD(\sfr[34][5] ), 
	.Q(reg_ctrl_timers_dfp_o[1]), 
	.D(n_263), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfsel_o), 
	.Q(reg_ctrl_timers_dfp_o[2]), 
	.D(n_294), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_txrxf_o), 
	.Q(reg_ctrl_interrupt_tf2_o), 
	.D(n_293), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[2]), 
	.Q(reg_ctrl_interrupt_txrxf_o), 
	.D(n_291), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[5]), 
	.Q(reg_ctrl_ports_p3en_o[4]), 
	.D(n_281), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[39][5]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p4_a_o_7_), 
	.Q(reg_ctrl_ports_p3en_o[5]), 
	.D(n_280), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tr1_o), 
	.Q(reg_ctrl_interrupt_it0_o), 
	.D(n_279), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie0_o), 
	.Q(reg_ctrl_interrupt_it1_o), 
	.D(n_278), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[8][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_tf0_o), 
	.Q(reg_ctrl_timers_tr0_o), 
	.D(n_275), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[35][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_tf2_o), 
	.Q(reg_ctrl_timers_tr2_o), 
	.D(n_292), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[33][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[5]), 
	.Q(reg_ctrl_ports_p1en_o[6]), 
	.D(n_302), 
	.C(reg_ctrl_clk_i));
   NA3X0 p8680A22945 (.Q(n_679), 
	.C(n_193), 
	.B(n_327), 
	.A(n_538));
   AN22X0 p8604A22946 (.Q(n_678), 
	.D(n_828), 
	.C(reg_ctrl_interrupt_txrxf_o), 
	.B(\sfr[6][7] ), 
	.A(n_677));
   AN222X0 p8480A (.Q(n_676), 
	.F(n_890), 
	.E(reg_ctrl_interrupt_ie_o[3]), 
	.D(reg_ctrl_interrupt_ie1_o), 
	.C(n_817), 
	.B(n_677), 
	.A(\sfr[6][3] ));
   MU2IX0 p11536A (.S(n_857), 
	.Q(n_675), 
	.IN1(n_290), 
	.IN0(n_85));
   MU2IX0 p11583A (.S(n_857), 
	.Q(n_674), 
	.IN1(n_289), 
	.IN0(n_84));
   AO222X0 p5541A (.Q(n_673), 
	.F(reg_ctrl_fsm_data_i[0]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[0]), 
	.B(reg_ctrl_ports_p2en_o[0]), 
	.A(n_671));
   AO222X0 p5541A22947 (.Q(n_672), 
	.F(reg_ctrl_fsm_data_i[1]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[1]), 
	.B(reg_ctrl_ports_p2en_o[1]), 
	.A(n_671));
   AO222X0 p5541A22948 (.Q(n_668), 
	.F(reg_ctrl_fsm_data_i[2]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[2]), 
	.B(reg_ctrl_ports_p2en_o[2]), 
	.A(n_671));
   AO222X0 p5541A22949 (.Q(n_667), 
	.F(reg_ctrl_fsm_data_i[3]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[3]), 
	.B(reg_ctrl_ports_p2en_o[3]), 
	.A(n_671));
   AO222X0 p5541A22950 (.Q(n_666), 
	.F(reg_ctrl_fsm_data_i[4]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[4]), 
	.B(reg_ctrl_ports_p2en_o[4]), 
	.A(n_671));
   AO222X0 p5541A22951 (.Q(n_665), 
	.F(reg_ctrl_fsm_data_i[5]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[5]), 
	.B(reg_ctrl_ports_p2en_o[5]), 
	.A(n_671));
   AO222X0 p5541A22952 (.Q(n_664), 
	.F(reg_ctrl_fsm_data_i[6]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[6]), 
	.B(reg_ctrl_ports_p2en_o[6]), 
	.A(n_671));
   AO222X0 p5541A22953 (.Q(n_663), 
	.F(reg_ctrl_fsm_data_i[7]), 
	.E(n_669), 
	.D(n_670), 
	.C(reg_ctrl_bus_ctrl_p2en_i[7]), 
	.B(reg_ctrl_ports_p2en_o[7]), 
	.A(n_671));
   AO22X0 p5573A (.Q(n_662), 
	.D(n_659), 
	.C(reg_ctrl_bus_ctrl_p3en_6_i), 
	.B(n_661), 
	.A(n_283));
   AO22X0 p5593A (.Q(n_660), 
	.D(n_659), 
	.C(reg_ctrl_bus_ctrl_p3en_7_i), 
	.B(n_661), 
	.A(n_282));
   AN32X0 p3204A (.Q(n_658), 
	.E(reg_ctrl_bus_ctrl_p2_i[0]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[0]), 
	.B(reg_ctrl_fsm_data_i[0]), 
	.A(n_656));
   AN32X0 p3202A (.Q(n_657), 
	.E(reg_ctrl_bus_ctrl_p2_i[1]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[1]), 
	.B(reg_ctrl_fsm_data_i[1]), 
	.A(n_656));
   AN32X0 p3204A22954 (.Q(n_654), 
	.E(reg_ctrl_bus_ctrl_p2_i[2]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_656));
   AN32X0 p3204A22955 (.Q(n_653), 
	.E(reg_ctrl_bus_ctrl_p2_i[3]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_656));
   AN32X0 p3203A (.Q(n_652), 
	.E(reg_ctrl_bus_ctrl_p2_i[4]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_656));
   AN32X0 p3202A22956 (.Q(n_651), 
	.E(reg_ctrl_bus_ctrl_p2_i[5]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_656));
   AN32X0 p3202A22957 (.Q(n_650), 
	.E(reg_ctrl_bus_ctrl_p2_i[6]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_656));
   AN32X0 p3202A22958 (.Q(n_649), 
	.E(reg_ctrl_bus_ctrl_p2_i[7]), 
	.D(n_655), 
	.C(reg_ctrl_ports_p2en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_656));
   NO3X0 p6302A22959 (.Q(n_648), 
	.C(n_252), 
	.B(n_337), 
	.A(reg_ctrl_ports_p3en_o[6]));
   AN221X0 p8828A (.Q(n_647), 
	.E(n_244), 
	.D(n_886), 
	.C(\sfr[31][6] ), 
	.B(\sfr[7][6] ), 
	.A(n_645));
   AO221X0 p8974A (.Q(n_646), 
	.E(n_370), 
	.D(reg_ctrl_timers_tacpl_o[7]), 
	.C(n_825), 
	.B(reg_ctrl_baudrate_smod_o), 
	.A(n_645));
   AN221X0 p9719A (.Q(n_644), 
	.E(n_284), 
	.D(n_754), 
	.C(\sfr[17][2] ), 
	.B(reg_ctrl_alu_ov_o), 
	.A(n_862));
   AN221X0 p9499A22960 (.Q(n_643), 
	.E(n_262), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[4]), 
	.B(reg_ctrl_timers_tacpl_o[4]), 
	.A(n_825));
   NO3I1X0 p10650A (.Q(n_642), 
	.C(n_641), 
	.B(reg_ctrl_ports_p3en_o[2]), 
	.AN(reg_ctrl_ports_p3_i[2]));
   NO3I1X0 p10648A (.Q(n_640), 
	.C(n_641), 
	.B(reg_ctrl_ports_p3en_o[3]), 
	.AN(reg_ctrl_ports_p3_i[3]));
   NO3I1X0 p10649A (.Q(n_639), 
	.C(n_641), 
	.B(reg_ctrl_ports_p3en_o[4]), 
	.AN(reg_ctrl_ports_p3_i[4]));
   NO3I1X0 p10650A22961 (.Q(n_638), 
	.C(n_641), 
	.B(reg_ctrl_ports_p3en_o[5]), 
	.AN(reg_ctrl_ports_p3_i[5]));
   INX0 p9591A (.Q(n_637), 
	.A(n_926));
   NO3I1X0 p10315A (.Q(n_636), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[0]), 
	.AN(reg_ctrl_ports_p1_i[0]));
   NO3I1X0 p10315A22962 (.Q(n_635), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[1]), 
	.AN(reg_ctrl_ports_p1_i[1]));
   NO3I1X0 p10316A (.Q(n_633), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[2]), 
	.AN(reg_ctrl_ports_p1_i[2]));
   NO3I1X0 p10315A22963 (.Q(n_632), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[3]), 
	.AN(reg_ctrl_ports_p1_i[3]));
   NO3I1X0 p10315A22964 (.Q(n_631), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[4]), 
	.AN(reg_ctrl_ports_p1_i[4]));
   NO3I1X0 p10316A22965 (.Q(n_630), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[5]), 
	.AN(reg_ctrl_ports_p1_i[5]));
   NO3I1X0 p10317A (.Q(n_629), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[6]), 
	.AN(reg_ctrl_ports_p1_i[6]));
   NO3I1X0 p10317A22966 (.Q(n_628), 
	.C(n_634), 
	.B(reg_ctrl_ports_p1en_o[7]), 
	.AN(reg_ctrl_ports_p1_i[7]));
   ON211X0 p6379A (.Q(n_627), 
	.D(reg_ctrl_reset_b_i), 
	.C(n_409), 
	.B(n_605), 
	.A(reg_ctrl_ports_p3en_o[6]));
   AO22X0 p10111A (.Q(n_626), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[0]), 
	.B(n_806), 
	.A(n_624));
   AO22X0 p10109A (.Q(n_625), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[2]), 
	.B(n_803), 
	.A(n_624));
   AO22X0 p10111A22967 (.Q(n_622), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[4]), 
	.B(n_800), 
	.A(n_624));
   AO22X0 p10111A22968 (.Q(n_621), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[5]), 
	.B(n_798), 
	.A(n_624));
   AO22X0 p10111A22969 (.Q(n_620), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[6]), 
	.B(n_796), 
	.A(n_624));
   AO22X0 p10111A22970 (.Q(n_619), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[1]), 
	.B(n_787), 
	.A(n_624));
   AO22X0 p10111A22971 (.Q(n_618), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[3]), 
	.B(n_785), 
	.A(n_624));
   AO22X0 p10084A22972 (.Q(n_617), 
	.D(n_614), 
	.C(\sfr[2][0] ), 
	.B(n_806), 
	.A(n_615));
   AO22X0 p10084A22973 (.Q(n_616), 
	.D(n_614), 
	.C(\sfr[2][2] ), 
	.B(n_803), 
	.A(n_615));
   AO22X0 p10111A22974 (.Q(n_613), 
	.D(n_623), 
	.C(reg_ctrl_timers_acrh_i[7]), 
	.B(n_783), 
	.A(n_624));
   AO22X0 p10084A22975 (.Q(n_612), 
	.D(n_614), 
	.C(\sfr[2][4] ), 
	.B(n_800), 
	.A(n_615));
   AO22X0 p10084A22976 (.Q(n_611), 
	.D(n_614), 
	.C(\sfr[2][6] ), 
	.B(n_796), 
	.A(n_615));
   AO22X0 p10084A22977 (.Q(n_610), 
	.D(n_614), 
	.C(\sfr[2][5] ), 
	.B(n_798), 
	.A(n_615));
   AO22X0 p10084A22978 (.Q(n_609), 
	.D(n_614), 
	.C(\sfr[2][1] ), 
	.B(n_787), 
	.A(n_615));
   AO22X0 p10084A22979 (.Q(n_608), 
	.D(n_614), 
	.C(\sfr[2][3] ), 
	.B(n_785), 
	.A(n_615));
   AO22X0 p10084A22980 (.Q(n_607), 
	.D(n_614), 
	.C(\sfr[2][7] ), 
	.B(n_783), 
	.A(n_615));
   ON221X0 p10574A (.Q(n_606), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_29), 
	.C(n_209), 
	.B(reg_ctrl_ports_p3en_o[2]), 
	.A(n_605));
   ON221X0 p10574A22981 (.Q(n_604), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_15), 
	.C(n_209), 
	.B(reg_ctrl_ports_p3en_o[3]), 
	.A(n_605));
   ON221X0 p10574A22982 (.Q(n_603), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_25), 
	.C(n_209), 
	.B(reg_ctrl_ports_p3en_o[4]), 
	.A(n_605));
   ON221X0 p10574A22983 (.Q(n_602), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_19), 
	.C(n_209), 
	.B(reg_ctrl_ports_p3en_o[5]), 
	.A(n_605));
   AO22X0 p11227A (.Q(n_601), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_573), 
	.A(\sfr[38][7] ));
   AO222X0 p8734A (.Q(n_600), 
	.F(reg_ctrl_timers_tl1_o[1]), 
	.E(n_751), 
	.D(reg_ctrl_fsm_data_o[1]), 
	.C(n_599), 
	.B(reg_ctrl_timers_tl0_o[1]), 
	.A(n_752));
   AO22X0 p10208A (.Q(n_598), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_596), 
	.A(\sfr[31][0] ));
   AO22X0 p10208A22984 (.Q(n_597), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_596), 
	.A(\sfr[31][1] ));
   AO222X0 p9026A (.Q(n_594), 
	.F(reg_ctrl_timers_tm1_o[7]), 
	.E(n_810), 
	.D(reg_ctrl_fsm_data_o[7]), 
	.C(n_599), 
	.B(reg_ctrl_timers_tm0_o[7]), 
	.A(n_811));
   AO22X0 p10208A22985 (.Q(n_593), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_596), 
	.A(\sfr[31][2] ));
   AO22X0 p10208A22986 (.Q(n_592), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_596), 
	.A(\sfr[31][3] ));
   AO22X0 p10208A22987 (.Q(n_591), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_596), 
	.A(\sfr[31][4] ));
   AO22X0 p10208A22988 (.Q(n_590), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_596), 
	.A(\sfr[31][5] ));
   AO22X0 p10208A22989 (.Q(n_589), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_596), 
	.A(\sfr[31][6] ));
   AO22X0 p10208A22990 (.Q(n_588), 
	.D(n_595), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_596), 
	.A(\sfr[31][7] ));
   AO22X0 p11326A (.Q(n_587), 
	.D(n_1003), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_1004), 
	.A(reg_ctrl_fsm_psw_rs_o[0]));
   AO22X0 p11326A22991 (.Q(n_586), 
	.D(n_1003), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_1004), 
	.A(reg_ctrl_fsm_psw_rs_o[1]));
   AO22X0 p11326A22992 (.Q(n_585), 
	.D(n_1003), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_1004), 
	.A(\sfr[34][5] ));
   AO22X0 p11227A22993 (.Q(n_584), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_582), 
	.A(\sfr[36][0] ));
   AO22X0 p11227A22994 (.Q(n_583), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_582), 
	.A(\sfr[36][1] ));
   AO22X0 p11227A22995 (.Q(n_580), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_582), 
	.A(\sfr[36][2] ));
   AO22X0 p11227A22996 (.Q(n_579), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_582), 
	.A(\sfr[36][3] ));
   AO22X0 p11227A22997 (.Q(n_578), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_582), 
	.A(\sfr[36][4] ));
   AO22X0 p11227A22998 (.Q(n_577), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_582), 
	.A(\sfr[36][5] ));
   AO22X0 p11227A22999 (.Q(n_576), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_582), 
	.A(\sfr[36][6] ));
   AO22X0 p11227A23000 (.Q(n_575), 
	.D(n_581), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_582), 
	.A(\sfr[36][7] ));
   AO22X0 p11227A23001 (.Q(n_574), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_573), 
	.A(\sfr[38][0] ));
   AO22X0 p11227A23002 (.Q(n_571), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_573), 
	.A(\sfr[38][1] ));
   AO22X0 p11227A23003 (.Q(n_570), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_573), 
	.A(\sfr[38][2] ));
   AO22X0 p11227A23004 (.Q(n_569), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_573), 
	.A(\sfr[38][3] ));
   AO22X0 p11227A23005 (.Q(n_568), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_573), 
	.A(\sfr[38][4] ));
   AO22X0 p11227A23006 (.Q(n_567), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_573), 
	.A(\sfr[38][5] ));
   AO22X0 p11227A23007 (.Q(n_566), 
	.D(n_572), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_573), 
	.A(\sfr[38][6] ));
   AO222X0 p9110A23008 (.Q(n_565), 
	.F(reg_ctrl_timers_tm1_o[3]), 
	.E(n_810), 
	.D(reg_ctrl_ports_p0en_o[3]), 
	.C(n_904), 
	.B(reg_ctrl_timers_tl0_o[3]), 
	.A(n_752));
   NO2I1X0 p10041A (.Q(n_563), 
	.B(n_696), 
	.AN(\sfr[7][5] ));
   NO2I1X0 p10473A (.Q(n_562), 
	.B(n_711), 
	.AN(\sfr[27][3] ));
   NO2I1X0 p10473A23009 (.Q(n_561), 
	.B(n_711), 
	.AN(\sfr[27][4] ));
   NO2I1X0 p10473A23010 (.Q(n_560), 
	.B(n_711), 
	.AN(\sfr[27][2] ));
   NO2I1X0 p10473A23011 (.Q(n_559), 
	.B(n_711), 
	.AN(\sfr[27][5] ));
   NO2I1X0 p10473A23012 (.Q(n_558), 
	.B(n_711), 
	.AN(\sfr[27][6] ));
   NO2I1X0 p10473A23013 (.Q(n_557), 
	.B(n_711), 
	.AN(\sfr[27][7] ));
   NO2I1X0 p10041A23014 (.Q(n_556), 
	.B(n_696), 
	.AN(\sfr[7][4] ));
   NO2I1X0 p10041A23015 (.Q(n_555), 
	.B(n_696), 
	.AN(\sfr[7][0] ));
   NO2I1X0 p10041A23016 (.Q(n_554), 
	.B(n_696), 
	.AN(\sfr[7][6] ));
   NA2X0 p6301A (.Q(n_938), 
	.B(n_739), 
	.A(reg_ctrl_reset_b_i));
   AN221X0 p9710A (.Q(n_553), 
	.E(n_242), 
	.D(n_552), 
	.C(\sfr[28][7] ), 
	.B(\sfr[18][7] ), 
	.A(n_245));
   AN221X0 p9630A (.Q(n_551), 
	.E(n_238), 
	.D(n_599), 
	.C(reg_ctrl_fsm_data_o[2]), 
	.B(\sfr[28][2] ), 
	.A(n_552));
   AN221X0 p9306A (.Q(n_550), 
	.E(n_239), 
	.D(n_433), 
	.C(\sfr[29][4] ), 
	.B(\sfr[1][4] ), 
	.A(n_898));
   AO22X0 p10419A (.Q(n_549), 
	.D(n_546), 
	.C(\sfr[1][3] ), 
	.B(n_785), 
	.A(n_547));
   AO22X0 p10419A23017 (.Q(n_548), 
	.D(n_546), 
	.C(\sfr[1][4] ), 
	.B(n_800), 
	.A(n_547));
   AO22X0 p10419A23018 (.Q(n_545), 
	.D(n_546), 
	.C(\sfr[1][5] ), 
	.B(n_798), 
	.A(n_547));
   AO22X0 p10419A23019 (.Q(n_544), 
	.D(n_546), 
	.C(\sfr[1][6] ), 
	.B(n_796), 
	.A(n_547));
   AO22X0 p10419A23020 (.Q(n_543), 
	.D(n_546), 
	.C(\sfr[1][7] ), 
	.B(n_783), 
	.A(n_547));
   AO222X0 p8921A (.Q(n_542), 
	.F(reg_ctrl_timers_th1_o[7]), 
	.E(n_541), 
	.D(\sfr[31][7] ), 
	.C(n_886), 
	.B(reg_ctrl_timers_th0_o[7]), 
	.A(n_930));
   AN321X0 p2718A (.Q(n_540), 
	.F(n_233), 
	.E(reg_ctrl_bus_ctrl_p3_7_i), 
	.D(n_659), 
	.C(reg_ctrl_ports_p3en_o[7]), 
	.B(n_661), 
	.A(reg_ctrl_ports_p3_o[7]));
   SDFRQX0 \sfr_reg[24][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[6]), 
	.Q(\sfr[24][7] ), 
	.D(n_230), 
	.C(reg_ctrl_clk_i));
   AN222X0 p8677A (.Q(n_538), 
	.F(\sfr[6][1] ), 
	.E(n_677), 
	.D(reg_ctrl_interrupt_ie_o[1]), 
	.C(n_890), 
	.B(reg_ctrl_interrupt_ti_o), 
	.A(n_754));
   NA2X0 p10039A (.Q(n_879), 
	.B(n_103), 
	.A(n_536));
   NO2I1X0 p9297A (.Q(n_896), 
	.B(n_158), 
	.AN(n_536));
   NA3I1X0 p9186A (.Q(n_926), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_410), 
	.AN(reg_ctrl_ext_ram_wr_i));
   AN21X0 p11606A (.Q(n_535), 
	.C(n_286), 
	.B(reg_ctrl_interrupt_ie_o[0]), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   AN21X0 p11604A (.Q(n_534), 
	.C(n_285), 
	.B(reg_ctrl_interrupt_ie_o[2]), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   AO22X0 p10168A (.Q(n_532), 
	.D(n_529), 
	.C(\sfr[3][0] ), 
	.B(n_806), 
	.A(n_530));
   AO22X0 p10168A23022 (.Q(n_531), 
	.D(n_529), 
	.C(\sfr[3][1] ), 
	.B(n_787), 
	.A(n_530));
   AO22X0 p10168A23023 (.Q(n_528), 
	.D(n_529), 
	.C(\sfr[3][2] ), 
	.B(n_803), 
	.A(n_530));
   AO22X0 p10168A23024 (.Q(n_527), 
	.D(n_529), 
	.C(\sfr[3][3] ), 
	.B(n_785), 
	.A(n_530));
   AO22X0 p10168A23025 (.Q(n_526), 
	.D(n_529), 
	.C(\sfr[3][4] ), 
	.B(n_800), 
	.A(n_530));
   AO22X0 p10168A23026 (.Q(n_525), 
	.D(n_529), 
	.C(\sfr[3][5] ), 
	.B(n_798), 
	.A(n_530));
   AO22X0 p10168A23027 (.Q(n_524), 
	.D(n_529), 
	.C(\sfr[3][6] ), 
	.B(n_796), 
	.A(n_530));
   AO22X0 p10168A23028 (.Q(n_523), 
	.D(n_529), 
	.C(\sfr[3][7] ), 
	.B(n_783), 
	.A(n_530));
   AO22X0 p10857A (.Q(n_522), 
	.D(n_518), 
	.C(reg_ctrl_interrupt_ie0_i), 
	.B(n_519), 
	.A(reg_ctrl_interrupt_ie0_o));
   AO22X0 p9939A (.Q(n_521), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[0]), 
	.B(n_806), 
	.A(n_516));
   AO22X0 p10857A23029 (.Q(n_520), 
	.D(n_518), 
	.C(reg_ctrl_interrupt_ie1_i), 
	.B(n_519), 
	.A(reg_ctrl_interrupt_ie1_o));
   AO22X0 p9939A23030 (.Q(n_517), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[1]), 
	.B(n_787), 
	.A(n_516));
   AO22X0 p10857A23031 (.Q(n_514), 
	.D(n_518), 
	.C(reg_ctrl_interrupt_tf0_i), 
	.B(n_519), 
	.A(reg_ctrl_timers_tf0_i));
   AO22X0 p9939A23032 (.Q(n_513), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[2]), 
	.B(n_803), 
	.A(n_516));
   AO22X0 p9939A23033 (.Q(n_512), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[3]), 
	.B(n_785), 
	.A(n_516));
   AO22X0 p10857A23034 (.Q(n_511), 
	.D(n_518), 
	.C(reg_ctrl_interrupt_tf1_i), 
	.B(n_519), 
	.A(reg_ctrl_timers_tf1_i));
   AO22X0 p9939A23035 (.Q(n_510), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[4]), 
	.B(n_800), 
	.A(n_516));
   AO22X0 p9939A23036 (.Q(n_509), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[5]), 
	.B(n_798), 
	.A(n_516));
   AO22X0 p9939A23037 (.Q(n_508), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[6]), 
	.B(n_796), 
	.A(n_516));
   AO22X0 p9939A23038 (.Q(n_507), 
	.D(n_515), 
	.C(reg_ctrl_timers_th0_i[7]), 
	.B(n_783), 
	.A(n_516));
   AO22X0 p9939A23039 (.Q(n_506), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[0]), 
	.B(n_806), 
	.A(n_504));
   AO22X0 p9939A23040 (.Q(n_505), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[1]), 
	.B(n_787), 
	.A(n_504));
   AO22X0 p9939A23041 (.Q(n_502), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[2]), 
	.B(n_803), 
	.A(n_504));
   AO22X0 p9939A23042 (.Q(n_501), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[3]), 
	.B(n_785), 
	.A(n_504));
   AO22X0 p9939A23043 (.Q(n_500), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[4]), 
	.B(n_800), 
	.A(n_504));
   AO22X0 p9939A23044 (.Q(n_499), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[5]), 
	.B(n_798), 
	.A(n_504));
   AO22X0 p9939A23045 (.Q(n_498), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[6]), 
	.B(n_796), 
	.A(n_504));
   AO22X0 p9939A23046 (.Q(n_497), 
	.D(n_503), 
	.C(reg_ctrl_timers_th1_i[7]), 
	.B(n_783), 
	.A(n_504));
   AN222X0 p10452A (.Q(n_496), 
	.F(n_907), 
	.E(reg_ctrl_ports_p3en_o[4]), 
	.D(reg_ctrl_ports_p3_o[4]), 
	.C(n_963), 
	.B(reg_ctrl_timers_tr0_o), 
	.A(n_817));
   NO2X0 p10512A (.Q(n_856), 
	.B(n_641), 
	.A(n_857));
   AND2X0 p11758A (.Q(n_495), 
	.B(n_1004), 
	.A(\sfr[34][1] ));
   NA2X0 p9962A (.Q(n_851), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_852));
   ON22X0 p10142A (.Q(n_494), 
	.D(n_491), 
	.C(n_10), 
	.B(n_712), 
	.A(n_492));
   ON22X0 p10142A23047 (.Q(n_493), 
	.D(n_491), 
	.C(n_24), 
	.B(n_715), 
	.A(n_492));
   ON22X0 p10142A23048 (.Q(n_490), 
	.D(n_491), 
	.C(n_3), 
	.B(n_694), 
	.A(n_492));
   ON22X0 p10142A23049 (.Q(n_489), 
	.D(n_491), 
	.C(n_1), 
	.B(n_488), 
	.A(n_492));
   ON22X0 p10142A23050 (.Q(n_487), 
	.D(n_491), 
	.C(n_14), 
	.B(n_486), 
	.A(n_492));
   ON22X0 p10142A23051 (.Q(n_485), 
	.D(n_491), 
	.C(n_22), 
	.B(n_692), 
	.A(n_492));
   AO22X0 p9850A (.Q(n_484), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[0]), 
	.B(n_806), 
	.A(n_482));
   AO22X0 p9850A23052 (.Q(n_483), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[2]), 
	.B(n_803), 
	.A(n_482));
   AO22X0 p9850A23053 (.Q(n_480), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[4]), 
	.B(n_800), 
	.A(n_482));
   AO22X0 p9850A23054 (.Q(n_479), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[5]), 
	.B(n_798), 
	.A(n_482));
   AO22X0 p9850A23055 (.Q(n_478), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[6]), 
	.B(n_796), 
	.A(n_482));
   AO221X0 p10310A (.Q(n_477), 
	.E(n_329), 
	.D(n_547), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(\sfr[1][0] ), 
	.A(n_475));
   AO221X0 p10310A23056 (.Q(n_476), 
	.E(n_329), 
	.D(n_547), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(\sfr[1][1] ), 
	.A(n_475));
   AO221X0 p10310A23057 (.Q(n_474), 
	.E(n_329), 
	.D(n_547), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(\sfr[1][2] ), 
	.A(n_475));
   AO22X0 p9850A23058 (.Q(n_473), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[1]), 
	.B(n_787), 
	.A(n_482));
   AO22X0 p9850A23059 (.Q(n_472), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[3]), 
	.B(n_785), 
	.A(n_482));
   AO22X0 p9850A23060 (.Q(n_471), 
	.D(n_481), 
	.C(reg_ctrl_serial_sbuf_tx_o[7]), 
	.B(n_783), 
	.A(n_482));
   AO22X0 p10391A (.Q(n_470), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[0]), 
	.B(n_806), 
	.A(n_468));
   AO22X0 p10391A23061 (.Q(n_469), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[2]), 
	.B(n_803), 
	.A(n_468));
   AO22X0 p10391A23062 (.Q(n_466), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[4]), 
	.B(n_800), 
	.A(n_468));
   AO22X0 p10391A23063 (.Q(n_465), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[5]), 
	.B(n_798), 
	.A(n_468));
   AO22X0 p10391A23064 (.Q(n_464), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[6]), 
	.B(n_796), 
	.A(n_468));
   AO22X0 p10392A (.Q(n_463), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[0]), 
	.B(n_806), 
	.A(n_461));
   AO22X0 p10392A23065 (.Q(n_462), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[2]), 
	.B(n_803), 
	.A(n_461));
   AO22X0 p10392A23066 (.Q(n_459), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[4]), 
	.B(n_800), 
	.A(n_461));
   AO22X0 p10392A23067 (.Q(n_458), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[5]), 
	.B(n_798), 
	.A(n_461));
   AO22X0 p10392A23068 (.Q(n_457), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[6]), 
	.B(n_796), 
	.A(n_461));
   AO22X0 p10392A23069 (.Q(n_456), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[3]), 
	.B(n_785), 
	.A(n_461));
   AO22X0 p10391A23070 (.Q(n_455), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[3]), 
	.B(n_785), 
	.A(n_468));
   AO22X0 p10391A23071 (.Q(n_454), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[7]), 
	.B(n_783), 
	.A(n_468));
   AO22X0 p10392A23072 (.Q(n_453), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[1]), 
	.B(n_787), 
	.A(n_461));
   AO22X0 p10392A23073 (.Q(n_452), 
	.D(n_460), 
	.C(reg_ctrl_timers_acrm_i[7]), 
	.B(n_783), 
	.A(n_461));
   AO22X0 p10391A23074 (.Q(n_451), 
	.D(n_467), 
	.C(reg_ctrl_timers_acrl_i[1]), 
	.B(n_787), 
	.A(n_468));
   AO22X0 p9124A (.Q(n_450), 
	.D(n_442), 
	.C(\sfr[30][5] ), 
	.B(n_825), 
	.A(reg_ctrl_timers_tacpl_o[5]));
   AN22X0 p8908A (.Q(n_449), 
	.D(n_448), 
	.C(\sfr[25][1] ), 
	.B(n_830), 
	.A(\sfr[3][1] ));
   AO22X0 p9020A (.Q(n_447), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[0]), 
	.B(n_446), 
	.A(reg_ctrl_timers_tacph_o[0]));
   AO22X0 p8857A23075 (.Q(n_445), 
	.D(n_751), 
	.C(reg_ctrl_timers_tl1_o[5]), 
	.B(n_752), 
	.A(reg_ctrl_timers_tl0_o[5]));
   AO22X0 p8753A (.Q(n_444), 
	.D(n_810), 
	.C(reg_ctrl_timers_tm1_o[0]), 
	.B(n_811), 
	.A(reg_ctrl_timers_tm0_o[0]));
   AN22X0 p9553A (.Q(n_443), 
	.D(n_442), 
	.C(\sfr[30][2] ), 
	.B(n_831), 
	.A(\sfr[2][2] ));
   AO22X0 p8653A (.Q(n_441), 
	.D(n_446), 
	.C(\sfr[27][6] ), 
	.B(n_442), 
	.A(\sfr[30][6] ));
   AO22X0 p8854A23076 (.Q(n_440), 
	.D(n_751), 
	.C(reg_ctrl_timers_tl1_o[6]), 
	.B(n_752), 
	.A(reg_ctrl_timers_tl0_o[6]));
   AO22X0 p9028A (.Q(n_439), 
	.D(n_446), 
	.C(\sfr[27][7] ), 
	.B(n_442), 
	.A(\sfr[30][7] ));
   AN22X0 p8932A (.Q(n_438), 
	.D(n_552), 
	.C(DFT_sdo_6), 
	.B(n_645), 
	.A(\sfr[7][1] ));
   AN22X0 p9163A (.Q(n_437), 
	.D(n_442), 
	.C(\sfr[30][1] ), 
	.B(n_831), 
	.A(\sfr[2][1] ));
   AO22X0 p9103A (.Q(n_436), 
	.D(n_446), 
	.C(reg_ctrl_timers_tacph_o[1]), 
	.B(n_745), 
	.A(\sfr[36][1] ));
   AO22X0 p9210A (.Q(n_435), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[1]), 
	.B(n_825), 
	.A(reg_ctrl_timers_tacpl_o[1]));
   AO22X0 p9054A (.Q(n_434), 
	.D(n_886), 
	.C(\sfr[31][2] ), 
	.B(n_433), 
	.A(\sfr[29][2] ));
   AN22X0 p8563A (.Q(n_432), 
	.D(n_810), 
	.C(reg_ctrl_timers_tm1_o[2]), 
	.B(n_811), 
	.A(reg_ctrl_timers_tm0_o[2]));
   AN22X0 p8638A (.Q(n_431), 
	.D(n_751), 
	.C(reg_ctrl_timers_tl1_o[2]), 
	.B(n_752), 
	.A(reg_ctrl_timers_tl0_o[2]));
   AO22X0 p8640A (.Q(n_430), 
	.D(n_958), 
	.C(reg_ctrl_ports_p2_o[2]), 
	.B(n_645), 
	.A(reg_ctrl_baudrate_rs232_o));
   AO22X0 p9006A (.Q(n_429), 
	.D(n_886), 
	.C(\sfr[31][3] ), 
	.B(n_442), 
	.A(\sfr[30][3] ));
   AO22X0 p9060A (.Q(n_428), 
	.D(n_751), 
	.C(reg_ctrl_timers_tl1_o[3]), 
	.B(n_811), 
	.A(reg_ctrl_timers_tm0_o[3]));
   AN22X0 p9117A (.Q(n_427), 
	.D(n_830), 
	.C(\sfr[3][3] ), 
	.B(n_831), 
	.A(\sfr[2][3] ));
   AN22X0 p8995A (.Q(n_426), 
	.D(n_756), 
	.C(reg_ctrl_ports_p2en_o[3]), 
	.B(n_446), 
	.A(\sfr[27][3] ));
   AN222X0 p8974A23077 (.Q(n_425), 
	.F(n_645), 
	.E(\sfr[7][3] ), 
	.D(reg_ctrl_timers_th1_o[3]), 
	.C(n_541), 
	.B(reg_ctrl_timers_th0_o[3]), 
	.A(n_930));
   AN22X0 p9314A (.Q(n_424), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[2]), 
	.B(n_446), 
	.A(\sfr[27][2] ));
   AN22X0 p9010A (.Q(n_423), 
	.D(n_886), 
	.C(\sfr[31][0] ), 
	.B(n_645), 
	.A(\sfr[7][0] ));
   AO22X0 p8624A (.Q(n_422), 
	.D(n_448), 
	.C(\sfr[25][4] ), 
	.B(n_645), 
	.A(\sfr[7][4] ));
   AN22X0 p9011A (.Q(n_421), 
	.D(n_446), 
	.C(\sfr[27][4] ), 
	.B(n_442), 
	.A(\sfr[30][4] ));
   AN22X0 p9065A (.Q(n_420), 
	.D(n_830), 
	.C(\sfr[3][4] ), 
	.B(n_831), 
	.A(\sfr[2][4] ));
   AN22X0 p8912A23078 (.Q(n_419), 
	.D(n_448), 
	.C(\sfr[25][0] ), 
	.B(n_830), 
	.A(\sfr[3][0] ));
   AO22X0 p8521A23079 (.Q(n_418), 
	.D(n_751), 
	.C(reg_ctrl_timers_tl1_o[4]), 
	.B(n_752), 
	.A(reg_ctrl_timers_tl0_o[4]));
   AN22X0 p9172A (.Q(n_417), 
	.D(n_442), 
	.C(\sfr[30][0] ), 
	.B(n_831), 
	.A(\sfr[2][0] ));
   AN22X0 p8980A (.Q(n_416), 
	.D(n_552), 
	.C(\sfr[28][5] ), 
	.B(n_645), 
	.A(\sfr[7][5] ));
   AO22X0 p8581A (.Q(n_415), 
	.D(n_448), 
	.C(\sfr[25][5] ), 
	.B(n_830), 
	.A(\sfr[3][5] ));
   INX0 p8609A23080 (.Q(n_414), 
	.A(n_677));
   AN222X0 p10056A (.Q(n_413), 
	.F(n_754), 
	.E(reg_ctrl_interrupt_ri_o), 
	.D(n_813), 
	.C(\sfr[5][0] ), 
	.B(n_814), 
	.A(\sfr[4][0] ));
   AN222X0 p9606A (.Q(n_412), 
	.F(n_817), 
	.E(reg_ctrl_interrupt_tf1_o), 
	.D(n_813), 
	.C(\sfr[5][7] ), 
	.B(n_814), 
	.A(\sfr[4][7] ));
   AN222X0 p9422A (.Q(n_411), 
	.F(n_865), 
	.E(reg_ctrl_interrupt_ip_o[3]), 
	.D(n_813), 
	.C(\sfr[5][3] ), 
	.B(n_814), 
	.A(\sfr[4][3] ));
   NA2X0 p5992A (.Q(n_880), 
	.B(n_661), 
	.A(n_410));
   AND3X0 p10787A (.Q(n_988), 
	.C(reg_ctrl_reset_b_i), 
	.B(reg_ctrl_ext_ram_wr_i), 
	.A(n_410));
   NO2I1X0 p9965A23081 (.Q(n_802), 
	.B(n_804), 
	.AN(reg_ctrl_reset_b_i));
   NO2I1X0 p9966A23082 (.Q(n_792), 
	.B(n_793), 
	.AN(reg_ctrl_reset_b_i));
   NO2I1X0 p9892A23083 (.Q(n_764), 
	.B(n_765), 
	.AN(reg_ctrl_reset_b_i));
   NA3X0 p6379A23084 (.Q(n_409), 
	.C(n_661), 
	.B(n_605), 
	.A(reg_ctrl_ports_p3en_o[6]));
   ON21X0 p11187A (.Q(n_408), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_605), 
	.A(reg_ctrl_ports_p3en_o[7]));
   ON21X0 p11358A (.Q(n_407), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[0]));
   ON21X0 p11358A23085 (.Q(n_405), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[1]));
   ON21X0 p11358A23086 (.Q(n_402), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[2]));
   ON21X0 p11358A23087 (.Q(n_400), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[3]));
   ON21X0 p11358A23088 (.Q(n_398), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[4]));
   ON21X0 p11358A23089 (.Q(n_396), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[5]));
   ON21X0 p11358A23090 (.Q(n_394), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[6]));
   ON21X0 p11358A23091 (.Q(n_392), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_403), 
	.A(reg_ctrl_ports_p2en_o[7]));
   AO22X0 p9395A (.Q(n_390), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[5]), 
	.B(n_745), 
	.A(\sfr[36][5] ));
   AN22X0 p10846A (.Q(n_389), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[5]), 
	.B(n_976), 
	.A(reg_ctrl_ports_p1en_o[5]));
   AN222X0 p9528A (.Q(n_388), 
	.F(n_930), 
	.E(reg_ctrl_timers_th0_o[6]), 
	.D(reg_ctrl_fsm_data_o[6]), 
	.C(n_599), 
	.B(reg_ctrl_timers_th1_o[6]), 
	.A(n_541));
   AO22X0 p10585A (.Q(n_387), 
	.D(n_976), 
	.C(reg_ctrl_ports_p1en_o[6]), 
	.B(n_904), 
	.A(reg_ctrl_ports_p0en_o[6]));
   AO22X0 p10625A (.Q(n_385), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_383), 
	.A(\sfr[25][0] ));
   AO22X0 p10625A23092 (.Q(n_384), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_383), 
	.A(\sfr[25][1] ));
   AN22X0 p10650A23093 (.Q(n_381), 
	.D(n_963), 
	.C(reg_ctrl_ports_p3_o[0]), 
	.B(n_957), 
	.A(reg_ctrl_ports_p1_o[0]));
   AO22X0 p10625A23094 (.Q(n_379), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_383), 
	.A(\sfr[25][2] ));
   AO22X0 p10625A23095 (.Q(n_378), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_383), 
	.A(\sfr[25][3] ));
   AO22X0 p10625A23096 (.Q(n_377), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_383), 
	.A(\sfr[25][4] ));
   AO22X0 p10625A23097 (.Q(n_376), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_383), 
	.A(\sfr[25][6] ));
   AO22X0 p10625A23098 (.Q(n_375), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_383), 
	.A(\sfr[25][5] ));
   AO22X0 p10625A23099 (.Q(n_374), 
	.D(n_382), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_383), 
	.A(\sfr[25][7] ));
   AO22X0 p10366A (.Q(n_373), 
	.D(n_828), 
	.C(reg_ctrl_timers_tr2_o), 
	.B(n_745), 
	.A(\sfr[36][6] ));
   AN22X0 p10594A (.Q(n_372), 
	.D(n_963), 
	.C(reg_ctrl_ports_p3_o[6]), 
	.B(n_817), 
	.A(reg_ctrl_timers_tr1_o));
   AO22X0 p10823A (.Q(n_371), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_368), 
	.A(DFT_sdo_6));
   AO22X0 p9164A (.Q(n_370), 
	.D(n_748), 
	.C(reg_ctrl_ports_p4_o[7]), 
	.B(n_745), 
	.A(\sfr[36][7] ));
   AO22X0 p10823A23100 (.Q(n_369), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_368), 
	.A(\sfr[28][0] ));
   AO22X0 p10823A23101 (.Q(n_366), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_368), 
	.A(\sfr[28][2] ));
   AO22X0 p10823A23102 (.Q(n_365), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_368), 
	.A(\sfr[28][3] ));
   AO22X0 p10823A23103 (.Q(n_364), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_368), 
	.A(\sfr[28][5] ));
   AO22X0 p10823A23104 (.Q(n_363), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_368), 
	.A(\sfr[28][4] ));
   AO22X0 p10823A23105 (.Q(n_362), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_368), 
	.A(\sfr[28][6] ));
   AO22X0 p10823A23106 (.Q(n_361), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_368), 
	.A(\sfr[28][7] ));
   AO22X0 p10823A23107 (.Q(n_360), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_358), 
	.A(\sfr[29][0] ));
   AO22X0 p10823A23108 (.Q(n_359), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_358), 
	.A(\sfr[29][1] ));
   AO22X0 p10823A23109 (.Q(n_356), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_358), 
	.A(\sfr[29][2] ));
   AO22X0 p10564A (.Q(n_355), 
	.D(n_976), 
	.C(reg_ctrl_ports_p1en_o[7]), 
	.B(n_904), 
	.A(reg_ctrl_ports_p0en_o[7]));
   AO22X0 p10823A23110 (.Q(n_353), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_358), 
	.A(\sfr[29][3] ));
   AO22X0 p10823A23111 (.Q(n_352), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_358), 
	.A(\sfr[29][4] ));
   AO22X0 p10823A23112 (.Q(n_351), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_358), 
	.A(\sfr[29][5] ));
   AO22X0 p10823A23113 (.Q(n_350), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_358), 
	.A(\sfr[29][6] ));
   AO22X0 p10823A23114 (.Q(n_349), 
	.D(n_357), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_358), 
	.A(\sfr[29][7] ));
   AN22X0 p10934A (.Q(n_348), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[1]), 
	.B(n_904), 
	.A(reg_ctrl_ports_p0en_o[1]));
   AN22X0 p10680A (.Q(n_347), 
	.D(n_756), 
	.C(reg_ctrl_ports_p2en_o[1]), 
	.B(n_957), 
	.A(reg_ctrl_ports_p1_o[1]));
   AN22X0 p10502A (.Q(n_346), 
	.D(n_907), 
	.C(reg_ctrl_ports_p3en_o[2]), 
	.B(n_976), 
	.A(reg_ctrl_ports_p1en_o[2]));
   AN22X0 p10610A (.Q(n_345), 
	.D(n_756), 
	.C(reg_ctrl_ports_p2en_o[2]), 
	.B(n_904), 
	.A(reg_ctrl_ports_p0en_o[2]));
   AO22X0 p10381A (.Q(n_343), 
	.D(n_754), 
	.C(reg_ctrl_serial_tb8_o), 
	.B(n_958), 
	.A(reg_ctrl_ports_p2_o[3]));
   AN222X0 p9481A (.Q(n_342), 
	.F(n_930), 
	.E(reg_ctrl_timers_th0_o[4]), 
	.D(reg_ctrl_fsm_data_o[4]), 
	.C(n_599), 
	.B(reg_ctrl_timers_th1_o[4]), 
	.A(n_541));
   AO222X0 p9242A (.Q(n_341), 
	.F(reg_ctrl_timers_th1_o[0]), 
	.E(n_541), 
	.D(reg_ctrl_fsm_data_o[0]), 
	.C(n_599), 
	.B(reg_ctrl_timers_th0_o[0]), 
	.A(n_930));
   AN22X0 p10329A (.Q(n_340), 
	.D(n_756), 
	.C(reg_ctrl_ports_p2en_o[5]), 
	.B(n_862), 
	.A(\sfr[34][5] ));
   AN222X0 p9527A (.Q(n_339), 
	.F(n_930), 
	.E(reg_ctrl_timers_th0_o[5]), 
	.D(reg_ctrl_fsm_data_o[5]), 
	.C(n_599), 
	.B(reg_ctrl_timers_th1_o[5]), 
	.A(n_541));
   AO22X0 p10381A23115 (.Q(n_338), 
	.D(n_828), 
	.C(reg_ctrl_timers_edgsel_o), 
	.B(n_958), 
	.A(reg_ctrl_ports_p2_o[0]));
   NO2X0 p5829A (.Q(n_842), 
	.B(n_337), 
	.A(n_840));
   INX0 p10773A23116 (.Q(n_336), 
	.A(n_641));
   NO2X0 p10856A (.Q(n_334), 
	.B(n_209), 
	.A(n_38));
   NO2X0 p9925A (.Q(n_723), 
	.B(n_329), 
	.A(n_724));
   NO2I1X0 p10329A23118 (.Q(n_333), 
	.B(n_491), 
	.AN(\sfr[9][6] ));
   NA2X0 p10349A (.Q(n_711), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_713));
   NO2X0 p10856A23119 (.Q(n_332), 
	.B(n_209), 
	.A(n_57));
   NO2X0 p9665A (.Q(n_707), 
	.B(n_329), 
	.A(n_708));
   NO2X0 p6301A23120 (.Q(n_739), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.A(n_197));
   NO2I1X0 p10329A23121 (.Q(n_331), 
	.B(n_491), 
	.AN(\sfr[9][2] ));
   NA2X0 p9916A (.Q(n_696), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_698));
   NO2I1X0 p5403A (.Q(n_841), 
	.B(n_840), 
	.AN(n_659));
   NO3X0 p10388A (.Q(n_330), 
	.C(n_329), 
	.B(reg_ctrl_interrupt_ti_o), 
	.A(n_199));
   AN222X0 p10056A23122 (.Q(n_328), 
	.F(n_865), 
	.E(reg_ctrl_interrupt_ip_o[5]), 
	.D(n_813), 
	.C(\sfr[5][5] ), 
	.B(n_814), 
	.A(\sfr[4][5] ));
   AN22X0 p9319A (.Q(n_327), 
	.D(\sfr[5][1] ), 
	.C(n_813), 
	.B(\sfr[4][1] ), 
	.A(n_814));
   AN22X0 p9783A (.Q(n_326), 
	.D(\sfr[5][2] ), 
	.C(n_813), 
	.B(\sfr[4][2] ), 
	.A(n_814));
   AND3X0 p6454A (.Q(n_655), 
	.C(reg_ctrl_ext_rom_rd_i), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_403));
   ON321X0 p9360A (.Q(n_536), 
	.F(n_154), 
	.E(n_162), 
	.D(reg_ctrl_fsm_bit_byte_flag_i), 
	.C(n_190), 
	.B(n_136), 
	.A(reg_ctrl_fsm_addr_i[6]));
   AO22X0 p11366A (.Q(n_325), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[6]));
   AO22X0 p11366A23123 (.Q(n_324), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   AN22X0 p9637A (.Q(n_321), 
	.D(n_320), 
	.C(\sfr[38][6] ), 
	.B(n_898), 
	.A(\sfr[1][6] ));
   AO22X0 p11231A (.Q(n_319), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[0]));
   AO22X0 p11231A23124 (.Q(n_318), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[1]));
   AO22X0 p11231A23125 (.Q(n_315), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[2]));
   AO22X0 p11231A23126 (.Q(n_314), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[3]));
   AO22X0 p11231A23127 (.Q(n_313), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[4]));
   AO22X0 p11231A23128 (.Q(n_312), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[5]));
   AO22X0 p11231A23129 (.Q(n_311), 
	.D(n_316), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_317), 
	.A(reg_ctrl_interrupt_ip_o[6]));
   AN22X0 p10329A23130 (.Q(n_310), 
	.D(n_320), 
	.C(\sfr[38][1] ), 
	.B(n_862), 
	.A(\sfr[34][1] ));
   AO22X0 p11564A (.Q(n_309), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[0]));
   AO22X0 p11686A (.Q(n_308), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[1]));
   AO22X0 p11686A23131 (.Q(n_305), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[2]));
   AO22X0 p11596A (.Q(n_304), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[4]));
   AO22X0 p11686A23132 (.Q(n_303), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[3]));
   AO22X0 p11592A (.Q(n_302), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[6]));
   AO22X0 p11608A (.Q(n_301), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[5]));
   AO22X0 p11686A23133 (.Q(n_300), 
	.D(n_306), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_307), 
	.A(reg_ctrl_ports_p1en_o[7]));
   AO22X0 p11439A (.Q(n_299), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_297), 
	.A(reg_ctrl_timers_edgsel_o));
   AO22X0 p11439A23134 (.Q(n_298), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_297), 
	.A(reg_ctrl_timers_dfsel_o));
   AO22X0 p11439A23135 (.Q(n_295), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_297), 
	.A(reg_ctrl_timers_dfp_o[0]));
   AO22X0 p11439A23136 (.Q(n_294), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_297), 
	.A(reg_ctrl_timers_dfp_o[2]));
   AO22X0 p10418A (.Q(n_293), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_297), 
	.A(n_98));
   AO22X0 p11439A23137 (.Q(n_292), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_297), 
	.A(reg_ctrl_timers_tr2_o));
   AO22X0 p10420A (.Q(n_291), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_297), 
	.A(n_99));
   AN22X0 p11535A (.Q(n_290), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[0]));
   AN22X0 p11583A23138 (.Q(n_289), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[1]));
   AN22X0 p11604A23139 (.Q(n_286), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[2]));
   AN22X0 p11603A (.Q(n_285), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[3]));
   AO22X0 p9718A (.Q(n_284), 
	.D(n_320), 
	.C(\sfr[38][2] ), 
	.B(n_977), 
	.A(\sfr[9][2] ));
   AO22X0 p10941A (.Q(n_283), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[6]));
   AO22X0 p11021A (.Q(n_282), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[7]));
   AO22X0 p11596A23140 (.Q(n_281), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[4]));
   AO22X0 p11608A23141 (.Q(n_280), 
	.D(n_287), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_288), 
	.A(reg_ctrl_ports_p3en_o[5]));
   AO22X0 p11502A (.Q(n_279), 
	.D(n_276), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_277), 
	.A(reg_ctrl_interrupt_it0_o));
   AO22X0 p11502A23142 (.Q(n_278), 
	.D(n_276), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_277), 
	.A(reg_ctrl_interrupt_it1_o));
   AO22X0 p11502A23143 (.Q(n_275), 
	.D(n_276), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_277), 
	.A(reg_ctrl_timers_tr0_o));
   AO22X0 p11502A23144 (.Q(n_274), 
	.D(n_276), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_277), 
	.A(reg_ctrl_timers_tr1_o));
   AN22X0 p9647A (.Q(n_273), 
	.D(n_320), 
	.C(\sfr[38][0] ), 
	.B(n_898), 
	.A(\sfr[1][0] ));
   AO22X0 p11232A (.Q(n_272), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_270), 
	.A(n_82));
   AO22X0 p11232A23145 (.Q(n_271), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_270), 
	.A(n_81));
   AO22X0 p11232A23146 (.Q(n_268), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_270), 
	.A(reg_ctrl_serial_tb8_o));
   AO22X0 p11232A23147 (.Q(n_267), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_270), 
	.A(reg_ctrl_serial_ren_o));
   AO22X0 p11232A23148 (.Q(n_266), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_270), 
	.A(reg_ctrl_baudrate_sm2_o));
   AO22X0 p11232A23149 (.Q(n_265), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_270), 
	.A(reg_ctrl_baudrate_sm1_o));
   AO22X0 p11231A23150 (.Q(n_264), 
	.D(n_269), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_270), 
	.A(reg_ctrl_baudrate_sm0_o));
   AO22X0 p11439A23151 (.Q(n_263), 
	.D(n_296), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_297), 
	.A(reg_ctrl_timers_dfp_o[1]));
   AO22X0 p10366A23152 (.Q(n_262), 
	.D(n_754), 
	.C(reg_ctrl_serial_ren_o), 
	.B(n_745), 
	.A(\sfr[36][4] ));
   AN22X0 p9637A23153 (.Q(n_261), 
	.D(n_320), 
	.C(\sfr[38][5] ), 
	.B(n_898), 
	.A(\sfr[1][5] ));
   AO22X0 p11366A23154 (.Q(n_260), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[0]));
   AO22X0 p11366A23155 (.Q(n_259), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[1]));
   AO22X0 p11366A23156 (.Q(n_258), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[2]));
   AO22X0 p11366A23157 (.Q(n_257), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[4]));
   AO22X0 p11366A23158 (.Q(n_256), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[3]));
   AO22X0 p11366A23159 (.Q(n_255), 
	.D(n_322), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_323), 
	.A(reg_ctrl_interrupt_ie_o[5]));
   NA2X0 p10176A (.Q(n_641), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_605));
   NA2X0 p10577A (.Q(n_254), 
	.B(n_828), 
	.A(reg_ctrl_interrupt_tf2_o));
   NO2X0 p9885A (.Q(n_623), 
	.B(n_329), 
	.A(n_624));
   NO2X0 p9859A (.Q(n_614), 
	.B(n_329), 
	.A(n_615));
   NO2X0 p5794A (.Q(n_776), 
	.B(n_337), 
	.A(n_251));
   NA2X0 p11112A (.Q(n_252), 
	.B(reg_ctrl_ports_p3_i[6]), 
	.A(n_605));
   NA2X0 p10377A (.Q(n_634), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_687));
   NO2I1X0 p5438A (.Q(n_775), 
	.B(n_251), 
	.AN(n_659));
   ON21X0 p11670A (.Q(n_1004), 
	.C(n_249), 
	.B(n_329), 
	.A(n_121));
   ON21X0 p11616A (.Q(n_573), 
	.C(n_249), 
	.B(n_329), 
	.A(n_116));
   ON21X0 p11616A23160 (.Q(n_582), 
	.C(n_249), 
	.B(n_329), 
	.A(n_114));
   NA3I1X0 p9962A23161 (.Q(n_852), 
	.C(n_206), 
	.B(n_218), 
	.AN(reg_ctrl_timers_tr0_o));
   ON21X0 p10208A23162 (.Q(n_596), 
	.C(n_185), 
	.B(n_329), 
	.A(n_217));
   AN22X0 p9586A (.Q(n_247), 
	.D(n_865), 
	.C(\sfr[24][7] ), 
	.B(n_898), 
	.A(\sfr[1][7] ));
   AN22X0 p9647A23163 (.Q(n_246), 
	.D(n_552), 
	.C(\sfr[28][6] ), 
	.B(n_245), 
	.A(\sfr[18][6] ));
   AO22X0 p9366A (.Q(n_244), 
	.D(n_433), 
	.C(\sfr[29][6] ), 
	.B(n_448), 
	.A(\sfr[25][6] ));
   AN22X0 p9647A23164 (.Q(n_243), 
	.D(n_433), 
	.C(\sfr[29][1] ), 
	.B(n_245), 
	.A(\sfr[18][1] ));
   AO22X0 p9708A (.Q(n_242), 
	.D(n_433), 
	.C(\sfr[29][7] ), 
	.B(n_448), 
	.A(\sfr[25][7] ));
   AN22X0 p9725A (.Q(n_241), 
	.D(n_433), 
	.C(\sfr[29][3] ), 
	.B(n_448), 
	.A(\sfr[25][3] ));
   AN22X0 p9678A (.Q(n_240), 
	.D(n_552), 
	.C(\sfr[28][3] ), 
	.B(n_245), 
	.A(\sfr[18][3] ));
   AO22X0 p9304A (.Q(n_239), 
	.D(n_552), 
	.C(\sfr[28][4] ), 
	.B(n_245), 
	.A(\sfr[18][4] ));
   AO22X0 p9629A (.Q(n_238), 
	.D(n_245), 
	.C(\sfr[18][2] ), 
	.B(n_898), 
	.A(\sfr[1][2] ));
   AN22X0 p9647A23165 (.Q(n_237), 
	.D(n_433), 
	.C(\sfr[29][5] ), 
	.B(n_245), 
	.A(\sfr[18][5] ));
   AN22X0 p9705A (.Q(n_236), 
	.D(n_433), 
	.C(\sfr[29][0] ), 
	.B(n_245), 
	.A(\sfr[18][0] ));
   AO22X0 p10451A (.Q(n_235), 
	.D(n_329), 
	.C(reg_ctrl_serial_tx_o), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_482));
   INX0 p10375A (.Q(n_686), 
	.A(n_687));
   NO2X0 p10419A23166 (.Q(n_546), 
	.B(n_329), 
	.A(n_547));
   NO3I1X0 p5973A (.Q(n_233), 
	.C(n_337), 
	.B(reg_ctrl_ports_p3en_o[7]), 
	.AN(reg_ctrl_ports_p3_i[7]));
   NA2X0 p10350A (.Q(n_232), 
	.B(n_862), 
	.A(DFT_sdo_8));
   ON21X0 p9262A (.Q(n_410), 
	.C(n_173), 
	.B(n_130), 
	.A(n_161));
   NO2X0 p10760A (.Q(n_916), 
	.B(n_220), 
	.A(n_225));
   AND2X0 p11750A (.Q(n_230), 
	.B(n_317), 
	.A(\sfr[24][7] ));
   NA2X0 p10352A (.Q(n_229), 
	.B(n_862), 
	.A(reg_ctrl_alu_ac_o));
   AND2X0 p10857A23167 (.Q(n_518), 
	.B(n_277), 
	.A(reg_ctrl_interrupt_clear_i));
   NA2X0 p10455A (.Q(n_228), 
	.B(n_320), 
	.A(\sfr[38][7] ));
   NO2X0 p9940A (.Q(n_529), 
	.B(n_329), 
	.A(n_530));
   AND2X0 p6556A (.Q(n_670), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.A(n_226));
   NO2I1X0 p6793A (.Q(n_671), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.AN(n_226));
   NO2X0 p11233A (.Q(n_572), 
	.B(n_222), 
	.A(n_225));
   NO2I1X0 p11019A (.Q(n_519), 
	.B(reg_ctrl_interrupt_clear_i), 
	.AN(n_277));
   NO2X0 p9715A (.Q(n_515), 
	.B(n_329), 
	.A(n_516));
   NO2X0 p9715A23168 (.Q(n_503), 
	.B(n_329), 
	.A(n_504));
   NA2X0 p9894A (.Q(n_224), 
	.B(n_862), 
	.A(reg_ctrl_alu_cy_o));
   NA2X0 p10541A (.Q(n_223), 
	.B(n_320), 
	.A(\sfr[38][4] ));
   NO2X0 p11325A (.Q(n_1003), 
	.B(n_222), 
	.A(n_221));
   NO2X0 p11233A23169 (.Q(n_581), 
	.B(n_222), 
	.A(n_219));
   NO2X0 p10526A (.Q(n_950), 
	.B(n_220), 
	.A(n_221));
   NO2X0 p10214A (.Q(n_656), 
	.B(n_220), 
	.A(n_219));
   NO3I1X0 p9201A (.Q(n_804), 
	.C(n_216), 
	.B(reg_ctrl_timers_tr1_o), 
	.AN(n_218));
   NO3I1X0 p9201A23170 (.Q(n_793), 
	.C(n_205), 
	.B(reg_ctrl_timers_tr0_o), 
	.AN(n_218));
   NO3I1X0 p9135A (.Q(n_765), 
	.C(n_192), 
	.B(reg_ctrl_timers_tr1_o), 
	.AN(n_217));
   AND2X0 p8971A (.Q(n_840), 
	.B(n_188), 
	.A(n_217));
   NO2I1X0 p8734A23171 (.Q(n_446), 
	.B(n_216), 
	.AN(n_201));
   INX0 p10856A23176 (.Q(n_209), 
	.A(n_605));
   NA2X0 p9898A (.Q(n_207), 
	.B(n_977), 
	.A(\sfr[9][6] ));
   NO2I1X0 p8688A (.Q(n_810), 
	.B(n_198), 
	.AN(n_204));
   AND2X0 p9918A (.Q(n_724), 
	.B(n_206), 
	.A(n_196));
   NO2I1X0 p8566A (.Q(n_811), 
	.B(n_205), 
	.AN(n_204));
   NO2I1X0 p8526A (.Q(n_751), 
	.B(n_216), 
	.AN(n_204));
   AND2X0 p9131A (.Q(n_831), 
	.B(n_200), 
	.A(n_206));
   NA2X0 p9914A (.Q(n_698), 
	.B(n_132), 
	.A(n_217));
   NO2I1X0 p10295A (.Q(n_595), 
	.B(n_169), 
	.AN(n_217));
   NA2X0 p9371A (.Q(n_202), 
	.B(n_541), 
	.A(reg_ctrl_timers_th1_o[2]));
   NO2X0 p10282A (.Q(n_467), 
	.B(n_329), 
	.A(n_468));
   AND2X0 p9126A23178 (.Q(n_825), 
	.B(n_201), 
	.A(n_206));
   NA2X0 p10203A (.Q(n_491), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_492));
   NO2I1X0 p8553A (.Q(n_677), 
	.B(n_205), 
	.AN(n_200));
   AND2X0 p8693A (.Q(n_752), 
	.B(n_204), 
	.A(n_206));
   NO2X0 p10387A (.Q(n_199), 
	.B(n_482), 
	.A(serial_status));
   NO2X0 p10282A23179 (.Q(n_460), 
	.B(n_329), 
	.A(n_461));
   NO2X0 p9643A (.Q(n_481), 
	.B(n_329), 
	.A(n_482));
   NO2I1X0 p8829A (.Q(n_886), 
	.B(n_198), 
	.AN(n_201));
   NO2I1X0 p8632A (.Q(n_645), 
	.B(n_198), 
	.AN(n_200));
   INX0 p10498A (.Q(n_197), 
	.A(n_403));
   NO2I1X0 p8589A (.Q(n_830), 
	.B(n_216), 
	.AN(n_200));
   NO2I1X0 p8662A (.Q(n_442), 
	.B(n_205), 
	.AN(n_201));
   NO2I1X0 p9666A (.Q(n_708), 
	.B(n_205), 
	.AN(n_196));
   NA2X0 p10350A23180 (.Q(n_713), 
	.B(n_117), 
	.A(n_196));
   AN22X0 p10105A (.Q(n_195), 
	.D(n_865), 
	.C(reg_ctrl_interrupt_ip_o[6]), 
	.B(n_890), 
	.A(reg_ctrl_interrupt_ie_o[6]));
   AN22X0 p9678A23181 (.Q(n_194), 
	.D(n_865), 
	.C(reg_ctrl_interrupt_ip_o[2]), 
	.B(n_890), 
	.A(reg_ctrl_interrupt_ie_o[2]));
   AN22X0 p9434A (.Q(n_193), 
	.D(n_865), 
	.C(reg_ctrl_interrupt_ip_o[1]), 
	.B(n_817), 
	.A(reg_ctrl_interrupt_ie0_o));
   OR2X0 p10174A (.Q(n_605), 
	.B(n_225), 
	.A(n_191));
   NO2X0 p10502A23182 (.Q(n_976), 
	.B(n_189), 
	.A(n_192));
   NA2I1X0 p10170A (.Q(n_687), 
	.B(n_121), 
	.AN(n_191));
   NO2X0 p10393A (.Q(n_904), 
	.B(n_189), 
	.A(n_190));
   NO2X0 p10084A23183 (.Q(n_828), 
	.B(n_189), 
	.A(n_177));
   NO2I1X0 p11364A (.Q(n_251), 
	.B(n_187), 
	.AN(n_124));
   NO2X0 p10260A (.Q(n_963), 
	.B(n_186), 
	.A(n_225));
   NO2I1X0 p10497A (.Q(n_756), 
	.B(n_189), 
	.AN(n_188));
   NA2X0 p11659A (.Q(n_249), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_187));
   OR2X0 p10013A (.Q(n_403), 
	.B(n_219), 
	.A(n_191));
   NO2X0 p10612A (.Q(n_907), 
	.B(n_189), 
	.A(n_174));
   NO2X0 p10290A (.Q(n_957), 
	.B(n_186), 
	.A(n_221));
   NO2X0 p10069A (.Q(n_958), 
	.B(n_186), 
	.A(n_219));
   ON21X0 p10824A (.Q(n_368), 
	.C(n_185), 
	.B(n_329), 
	.A(n_171));
   ON21X0 p10824A23184 (.Q(n_358), 
	.C(n_185), 
	.B(n_329), 
	.A(n_172));
   NO3I1X0 p9168A (.Q(n_748), 
	.C(n_170), 
	.B(n_198), 
	.AN(n_188));
   ON21X0 p10625A23185 (.Q(n_383), 
	.C(n_185), 
	.B(n_329), 
	.A(n_166));
   NO3I1X0 p9886A (.Q(n_624), 
	.C(n_205), 
	.B(n_184), 
	.AN(n_168));
   NO3I1X0 p9857A (.Q(n_615), 
	.C(n_184), 
	.B(n_190), 
	.AN(n_206));
   INX0 p10309A (.Q(n_547), 
	.A(n_475));
   NA2X0 p11466A (.Q(n_297), 
	.B(n_180), 
	.A(n_183));
   NA2X0 p11307A (.Q(n_226), 
	.B(n_179), 
	.A(n_183));
   NA2X0 p11343A (.Q(n_288), 
	.B(n_185), 
	.A(n_183));
   AND2X0 p11367A (.Q(n_322), 
	.B(n_176), 
	.A(n_188));
   NA2X0 p12028A (.Q(n_307), 
	.B(n_182), 
	.A(n_183));
   NO2I1X0 p11510A (.Q(n_669), 
	.B(n_178), 
	.AN(n_188));
   NA2X0 p11019A23186 (.Q(n_277), 
	.B(n_182), 
	.A(n_181));
   NO2X0 p10320A (.Q(n_320), 
	.B(n_175), 
	.A(n_225));
   NA2X0 p11456A (.Q(n_270), 
	.B(n_180), 
	.A(n_181));
   NA2X0 p11413A (.Q(n_317), 
	.B(n_185), 
	.A(n_181));
   NA2X0 p11409A (.Q(n_323), 
	.B(n_179), 
	.A(n_181));
   OR2X0 p11227A23187 (.Q(n_222), 
	.B(n_178), 
	.A(reg_ctrl_fsm_addr_i[3]));
   NO2X0 p11686A23188 (.Q(n_296), 
	.B(n_178), 
	.A(n_177));
   NA2X0 p10212A (.Q(n_220), 
	.B(n_176), 
	.A(n_107));
   NO2I1X0 p11231A23189 (.Q(n_269), 
	.B(n_177), 
	.AN(n_176));
   NO2X0 p9898A23190 (.Q(n_745), 
	.B(n_175), 
	.A(n_219));
   NO2X0 p9895A (.Q(n_862), 
	.B(n_175), 
	.A(n_221));
   NO2I1X0 p11516A (.Q(n_276), 
	.B(n_192), 
	.AN(n_176));
   NO2X0 p11686A23191 (.Q(n_306), 
	.B(n_178), 
	.A(n_192));
   NO2I1X0 p10588A (.Q(n_972), 
	.B(n_190), 
	.AN(n_176));
   NO2X0 p11512A (.Q(n_774), 
	.B(n_178), 
	.A(n_190));
   NO2X0 p11021A23192 (.Q(n_287), 
	.B(n_178), 
	.A(n_174));
   NO2I1X0 p11231A23193 (.Q(n_316), 
	.B(n_174), 
	.AN(n_176));
   AN311X0 p9695A (.Q(n_173), 
	.E(n_159), 
	.D(reg_ctrl_fsm_wr_b_i), 
	.C(n_123), 
	.B(n_143), 
	.A(reg_ctrl_fsm_addr_i[7]));
   NO3X0 p9938A (.Q(n_530), 
	.C(n_216), 
	.B(n_190), 
	.A(n_184));
   NO3I1X0 p9712A (.Q(n_504), 
	.C(n_192), 
	.B(reg_ctrl_timers_tr1_o), 
	.AN(n_172));
   NO3I1X0 p9712A23194 (.Q(n_516), 
	.C(n_192), 
	.B(reg_ctrl_timers_tr0_o), 
	.AN(n_171));
   NO2X0 p9415A (.Q(n_813), 
	.B(n_167), 
	.A(n_190));
   NO2X0 p8523A (.Q(n_204), 
	.B(n_170), 
	.A(n_192));
   NO2I1X0 p10874A (.Q(n_357), 
	.B(n_169), 
	.AN(n_172));
   NO2I1X0 p10874A23195 (.Q(n_367), 
	.B(n_169), 
	.AN(n_171));
   AND2X0 p10276A (.Q(n_468), 
	.B(n_171), 
	.A(n_168));
   NO2X0 p9370A (.Q(n_541), 
	.B(n_167), 
	.A(n_192));
   NO2I1X0 p9644A (.Q(n_482), 
	.B(n_177), 
	.AN(n_166));
   NO2X0 p9321A (.Q(n_814), 
	.B(n_165), 
	.A(n_190));
   NA2X0 p10306A (.Q(n_475), 
	.B(n_132), 
	.A(n_166));
   NO2X0 p9205A (.Q(n_218), 
	.B(n_192), 
	.A(n_184));
   NO2X0 p8994A (.Q(n_217), 
	.B(n_198), 
	.A(n_184));
   NO2X0 p9251A (.Q(n_930), 
	.B(n_165), 
	.A(n_192));
   NO2X0 p8656A (.Q(n_201), 
	.B(n_170), 
	.A(n_174));
   AND2X0 p10276A23196 (.Q(n_461), 
	.B(n_172), 
	.A(n_168));
   NA2X0 p10204A (.Q(n_492), 
	.B(n_127), 
	.A(n_166));
   NO2X0 p8562A23197 (.Q(n_200), 
	.B(n_170), 
	.A(n_190));
   NO2X0 p9370A23198 (.Q(n_552), 
	.B(n_165), 
	.A(n_174));
   NO2X0 p9453A (.Q(n_433), 
	.B(n_167), 
	.A(n_174));
   NO2I1X0 p10709A (.Q(n_382), 
	.B(n_169), 
	.AN(n_166));
   NO2X0 p9665A23199 (.Q(n_196), 
	.B(n_174), 
	.A(n_184));
   NO2X0 p9313A (.Q(n_245), 
	.B(n_164), 
	.A(n_177));
   NO2X0 p9331A (.Q(n_977), 
	.B(n_164), 
	.A(n_192));
   NO2X0 p9545A (.Q(n_898), 
	.B(n_164), 
	.A(n_190));
   NO2X0 p9374A (.Q(n_448), 
	.B(n_164), 
	.A(n_174));
   NA2X0 p5783A (.Q(n_337), 
	.B(n_661), 
	.A(reg_ctrl_reset_b_i));
   NO2X0 p5403A23200 (.Q(n_659), 
	.B(n_329), 
	.A(n_661));
   INX0 p2880A (.Q(n_163), 
	.A(reg_ctrl_bus_ctrl_p3_6_i));
   AN321X0 p9359A (.Q(n_162), 
	.F(n_139), 
	.E(n_133), 
	.D(n_114), 
	.C(n_107), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(reg_ctrl_fsm_addr_i[4]));
   AN211X0 p9261A (.Q(n_161), 
	.D(n_138), 
	.C(n_128), 
	.B(n_124), 
	.A(n_153));
   NA2X0 p11367A23201 (.Q(n_187), 
	.B(n_142), 
	.A(n_146));
   NA2X0 p10013A23202 (.Q(n_191), 
	.B(n_141), 
	.A(n_146));
   NA2I1X0 p10085A (.Q(n_189), 
	.B(n_159), 
	.AN(n_158));
   NA2X0 p10067A (.Q(n_186), 
	.B(n_140), 
	.A(n_146));
   NA2I1X0 p11075A (.Q(n_178), 
	.B(reg_ctrl_reset_b_i), 
	.AN(n_157));
   NA2X0 p11356A (.Q(n_183), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_157));
   NO2X0 p10208A23203 (.Q(n_176), 
	.B(n_329), 
	.A(n_156));
   NO2I1X0 p9100A (.Q(n_890), 
	.B(n_155), 
	.AN(n_188));
   NA2X0 p11071A (.Q(n_181), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_156));
   NO2X0 p8937A (.Q(n_754), 
	.B(n_155), 
	.A(n_177));
   NO2X0 p9403A (.Q(n_817), 
	.B(n_155), 
	.A(n_192));
   NO2X0 p9550A (.Q(n_865), 
	.B(n_155), 
	.A(n_174));
   AN21X0 p10204A23204 (.Q(n_154), 
	.C(n_104), 
	.B(reg_ctrl_fsm_addr_i[6]), 
	.A(n_136));
   OR3X0 p9893A (.Q(n_175), 
	.C(n_158), 
	.B(n_147), 
	.A(n_153));
   AND2X0 p9715A23205 (.Q(n_171), 
	.B(n_151), 
	.A(n_152));
   NO2I1X0 p9645A (.Q(n_166), 
	.B(n_148), 
	.AN(n_152));
   NA2X0 p9242A23206 (.Q(n_165), 
	.B(n_149), 
	.A(n_151));
   AND2X0 p9715A23207 (.Q(n_172), 
	.B(n_150), 
	.A(n_152));
   NA2X0 p9370A23208 (.Q(n_167), 
	.B(n_149), 
	.A(n_150));
   NA2I1X0 p9305A (.Q(n_164), 
	.B(n_149), 
	.AN(n_148));
   NA2X0 p8519A (.Q(n_170), 
	.B(n_149), 
	.A(reg_ctrl_fsm_addr_i[1]));
   NA2X0 p8993A (.Q(n_184), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_152));
   NO3X0 p4669A (.Q(n_661), 
	.C(reg_ctrl_ext_rom_rd_i), 
	.B(reg_ctrl_ext_ram_rd_i), 
	.A(reg_ctrl_ext_ram_wr_i));
   NO2X0 p9711A (.Q(n_159), 
	.B(n_147), 
	.A(n_136));
   INX0 p10013A23209 (.Q(n_146), 
	.A(n_153));
   NA2X0 p9530A (.Q(n_153), 
	.B(n_107), 
	.A(n_143));
   NA2X0 p11085A (.Q(n_157), 
	.B(n_142), 
	.A(n_143));
   NA2X0 p10211A (.Q(n_156), 
	.B(n_141), 
	.A(n_143));
   NA2X0 p9224A (.Q(n_155), 
	.B(n_140), 
	.A(n_143));
   NA2X0 p11495A (.Q(n_180), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_177));
   NO2I1X0 p8991A (.Q(n_152), 
	.B(reg_ctrl_fsm_bit_byte_flag_i), 
	.AN(n_141));
   NA2X0 p11841A (.Q(n_169), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_128));
   NO2I1X0 p9452A (.Q(n_139), 
	.B(n_126), 
	.AN(n_137));
   NO2I1X0 p8517A (.Q(n_149), 
	.B(reg_ctrl_fsm_bit_byte_flag_i), 
	.AN(n_140));
   ON33X0 p9543A (.Q(n_138), 
	.F(reg_ctrl_fsm_addr_i[5]), 
	.E(n_137), 
	.D(n_107), 
	.C(n_125), 
	.B(n_198), 
	.A(n_101));
   OR2X0 p11362A (.Q(n_179), 
	.B(n_329), 
	.A(n_188));
   NA2X0 p11512A23211 (.Q(n_185), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_174));
   NO2X0 p10863A (.Q(n_168), 
	.B(n_190), 
	.A(reg_ctrl_timers_tr2_o));
   NA2X0 p11775A (.Q(n_182), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_192));
   INX0 p10204A23212 (.Q(n_136), 
	.A(n_143));
   ON22X0 p9553A23214 (.Q(n_133), 
	.D(n_101), 
	.C(n_118), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_206));
   ON21X0 p9254A (.Q(n_143), 
	.C(n_106), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(n_137));
   INX0 p12072A (.Q(n_132), 
	.A(n_190));
   NO2X0 p8995A23215 (.Q(n_141), 
	.B(reg_ctrl_fsm_wr_b_i), 
	.A(n_130));
   INX0 p9262A23216 (.Q(n_128), 
	.A(n_174));
   INX0 p11982A (.Q(n_127), 
	.A(n_192));
   NA2X0 p8930A (.Q(n_177), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(n_121));
   NO2X0 p8520A23217 (.Q(n_140), 
	.B(n_158), 
	.A(n_130));
   AN21X0 p9449A (.Q(n_126), 
	.C(n_121), 
	.B(n_107), 
	.A(reg_ctrl_fsm_addr_i[5]));
   NO2X0 p9474A (.Q(n_151), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_205));
   NA2X0 p9892A23218 (.Q(n_190), 
	.B(n_107), 
	.A(n_124));
   NO2X0 p9633A (.Q(n_150), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_198));
   NO2X0 p11085A23219 (.Q(n_142), 
	.B(reg_ctrl_fsm_wr_b_i), 
	.A(n_147));
   NA2I1X0 p9258A (.Q(n_174), 
	.B(reg_ctrl_fsm_addr_i[4]), 
	.AN(n_125));
   NA2I1X0 p10206A (.Q(n_148), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.AN(n_137));
   NO2X0 p9098A (.Q(n_188), 
	.B(reg_ctrl_fsm_addr_i[4]), 
	.A(n_125));
   NA2X0 p9921A (.Q(n_192), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(n_124));
   INX0 p9695A23220 (.Q(n_123), 
	.A(n_124));
   INX0 p11230A (.Q(n_488), 
	.A(n_800));
   INX0 p11242A (.Q(n_486), 
	.A(n_798));
   INX0 p12282A (.Q(n_121), 
	.A(n_221));
   INX0 p11489A (.Q(n_697), 
	.A(n_803));
   INX0 p9735A (.Q(n_118), 
	.A(n_198));
   INX0 p11405A (.Q(n_712), 
	.A(n_787));
   INX0 p12686A (.Q(n_117), 
	.A(n_216));
   INX0 p11166A (.Q(n_715), 
	.A(n_806));
   INX0 p12341A (.Q(n_116), 
	.A(n_225));
   INX0 p11277A (.Q(n_115), 
	.A(n_796));
   INX0 p11677A (.Q(n_694), 
	.A(n_785));
   OR2X0 p8805A (.Q(n_130), 
	.B(n_104), 
	.A(reg_ctrl_fsm_addr_i[6]));
   INX0 p12049A (.Q(n_692), 
	.A(n_783));
   INX0 p9361A (.Q(n_114), 
	.A(n_219));
   AND2X0 p10879A (.Q(n_800), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[4]));
   AND2X0 p10892A (.Q(n_798), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[5]));
   NO2X0 p9326A (.Q(n_124), 
	.B(reg_ctrl_fsm_addr_i[4]), 
	.A(reg_ctrl_fsm_addr_i[5]));
   NA2I1X0 p8936A (.Q(n_221), 
	.B(reg_ctrl_fsm_addr_i[4]), 
	.AN(reg_ctrl_fsm_addr_i[5]));
   NA2X0 p9818A (.Q(n_147), 
	.B(reg_ctrl_fsm_addr_i[7]), 
	.A(reg_ctrl_fsm_addr_i[6]));
   NA2X0 p9097A (.Q(n_125), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(reg_ctrl_fsm_addr_i[5]));
   NO2X0 p9553A23222 (.Q(n_206), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(reg_ctrl_fsm_addr_i[2]));
   AND2X0 p11138A (.Q(n_803), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[2]));
   NO2I1X0 p10534A (.Q(n_599), 
	.B(n_329), 
	.AN(reg_ctrl_fsm_rd_b_i));
   NA2X0 p9540A (.Q(n_198), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(reg_ctrl_fsm_addr_i[2]));
   NA2I1X0 p9550A23223 (.Q(n_205), 
	.B(reg_ctrl_fsm_addr_i[2]), 
	.AN(reg_ctrl_fsm_addr_i[0]));
   AND2X0 p11146A (.Q(n_787), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[1]));
   NA2I1X0 p10285A (.Q(n_216), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.AN(reg_ctrl_fsm_addr_i[2]));
   AND2X0 p10860A (.Q(n_806), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[0]));
   NA2X0 p11038A (.Q(n_225), 
	.B(reg_ctrl_fsm_addr_i[4]), 
	.A(reg_ctrl_fsm_addr_i[5]));
   AND2X0 p10876A (.Q(n_796), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[6]));
   AND2X0 p11373A (.Q(n_785), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[3]));
   OR2X0 p9324A (.Q(n_137), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(reg_ctrl_fsm_addr_i[2]));
   OR2X0 p8519A23224 (.Q(n_158), 
	.B(n_329), 
	.A(reg_ctrl_fsm_rd_b_i));
   AND2X0 p11743A (.Q(n_783), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_fsm_data_i[7]));
   NA2I1X0 p9381A (.Q(n_219), 
	.B(reg_ctrl_fsm_addr_i[5]), 
	.AN(reg_ctrl_fsm_addr_i[4]));
   INX0 p11101A (.Q(n_107), 
	.A(reg_ctrl_fsm_addr_i[3]));
   INX0 p9253A (.Q(n_106), 
	.A(reg_ctrl_fsm_bit_byte_flag_i));
   INX0 p11512A23225 (.Q(n_104), 
	.A(reg_ctrl_fsm_addr_i[7]));
   INX0 p12285A (.Q(n_103), 
	.A(reg_ctrl_fsm_wr_b_i));
   INX0 p10723A (.Q(n_101), 
	.A(reg_ctrl_fsm_addr_i[1]));
   SDFRQX0 \sfr_reg[34][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[3]), 
	.Q(DFT_sdo_8), 
	.D(n_100), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][2]  (.SE(DFT_sen), 
	.SD(\sfr[18][3] ), 
	.Q(\sfr[18][2] ), 
	.D(n_93), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][2]  (.SE(DFT_sen), 
	.SD(\sfr[18][5] ), 
	.Q(\sfr[17][2] ), 
	.D(n_97), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][0]  (.SE(DFT_sen), 
	.SD(\sfr[18][7] ), 
	.Q(\sfr[18][0] ), 
	.D(n_86), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][1]  (.SE(DFT_sen), 
	.SD(\sfr[18][2] ), 
	.Q(\sfr[18][1] ), 
	.D(n_96), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][3]  (.SE(DFT_sen), 
	.SD(\sfr[18][0] ), 
	.Q(\sfr[18][3] ), 
	.D(n_92), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][4]  (.SE(DFT_sen), 
	.SD(\sfr[18][1] ), 
	.Q(\sfr[18][4] ), 
	.D(n_91), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][5]  (.SE(DFT_sen), 
	.SD(\sfr[18][6] ), 
	.Q(\sfr[18][5] ), 
	.D(n_89), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[0]), 
	.Q(\sfr[18][7] ), 
	.D(n_88), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[18][6]  (.SE(DFT_sen), 
	.SD(\sfr[18][4] ), 
	.Q(\sfr[18][6] ), 
	.D(n_90), 
	.C(reg_ctrl_clk_i));
   NO2X0 p14513A (.Q(n_100), 
	.B(n_329), 
	.A(n_87));
   MU2X0 p10420A23236 (.S(reg_ctrl_interrupt_clear_i), 
	.Q(n_99), 
	.IN1(reg_ctrl_interrupt_txrxf_i), 
	.IN0(reg_ctrl_interrupt_txrxf_o));
   MU2X0 p10418A23237 (.S(reg_ctrl_interrupt_clear_i), 
	.Q(n_98), 
	.IN1(reg_ctrl_interrupt_tf2_i), 
	.IN0(reg_ctrl_timers_tf2_i));
   AO22X0 p14909A (.Q(n_97), 
	.D(n_94), 
	.C(\sfr[17][2] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_rb8_i));
   AO22X0 p14909A23238 (.Q(n_96), 
	.D(n_94), 
	.C(\sfr[18][1] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[1]));
   AO22X0 p14909A23239 (.Q(n_93), 
	.D(n_94), 
	.C(\sfr[18][2] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[2]));
   AO22X0 p14909A23240 (.Q(n_92), 
	.D(n_94), 
	.C(\sfr[18][3] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[3]));
   AO22X0 p14909A23241 (.Q(n_91), 
	.D(n_94), 
	.C(\sfr[18][4] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[4]));
   AO22X0 p14909A23242 (.Q(n_90), 
	.D(n_94), 
	.C(\sfr[18][6] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[6]));
   AO22X0 p14909A23243 (.Q(n_89), 
	.D(n_94), 
	.C(\sfr[18][5] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[5]));
   AO22X0 p14909A23244 (.Q(n_88), 
	.D(n_94), 
	.C(\sfr[18][7] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[7]));
   EN3X0 p14509A (.Q(n_87), 
	.C(n_58), 
	.B(n_60), 
	.A(n_79));
   AO22X0 p14909A23245 (.Q(n_86), 
	.D(n_94), 
	.C(\sfr[18][0] ), 
	.B(n_95), 
	.A(reg_ctrl_serial_sbuf_rx_i[0]));
   SDFRQX0 load_sbuf_prev_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(load_sbuf_prev), 
	.D(n_78), 
	.C(reg_ctrl_clk_i));
   NA2X0 p15480A (.Q(n_85), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_serial_p3en_0_i));
   NA2X0 p15480A23247 (.Q(n_84), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_serial_p3en_1_i));
   NO2X0 p14916A (.Q(n_95), 
	.B(n_329), 
	.A(n_83));
   AND2X0 p14994A (.Q(n_94), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_83));
   MU2X0 p15405A (.S(n_80), 
	.Q(n_82), 
	.IN1(reg_ctrl_interrupt_ri_o), 
	.IN0(reg_ctrl_serial_ri_i));
   MU2X0 p15405A23248 (.S(n_80), 
	.Q(n_81), 
	.IN1(reg_ctrl_interrupt_ti_o), 
	.IN0(reg_ctrl_serial_ti_i));
   EN3X0 p14585A (.Q(n_79), 
	.C(\sfr[36][6] ), 
	.B(\sfr[36][7] ), 
	.A(n_59));
   NA2I1X0 p14910A (.Q(n_83), 
	.B(load_sbuf_prev), 
	.AN(reg_ctrl_serial_load_sbuf_i));
   NO2I1X0 p16408A (.Q(n_78), 
	.B(n_329), 
	.AN(reg_ctrl_serial_load_sbuf_i));
   INX0 p15924A (.Q(n_77), 
	.A(reg_ctrl_timers_tl0_i[7]));
   INX0 p15924A23249 (.Q(n_76), 
	.A(reg_ctrl_timers_tl0_i[6]));
   INX0 p214748365A (.Q(n_75), 
	.A(reg_ctrl_ports_p2_i[6]));
   INX0 p15924A23250 (.Q(n_74), 
	.A(reg_ctrl_timers_tl0_i[1]));
   INX0 p214748365A23251 (.Q(n_73), 
	.A(reg_ctrl_ports_p2_i[4]));
   INX0 p214748365A23255 (.Q(n_329), 
	.A(reg_ctrl_reset_b_i));
   INX0 p15924A23256 (.Q(n_72), 
	.A(reg_ctrl_timers_tl0_i[4]));
   INX0 p214748365A23257 (.Q(n_71), 
	.A(reg_ctrl_ports_p2_i[3]));
   INX0 p214748365A23258 (.Q(n_70), 
	.A(reg_ctrl_ports_p2_i[1]));
   INX0 p15924A23259 (.Q(n_69), 
	.A(reg_ctrl_timers_tl0_i[2]));
   INX0 p214748365A23260 (.Q(n_68), 
	.A(reg_ctrl_ports_p2_i[0]));
   INX0 p15924A23261 (.Q(n_67), 
	.A(reg_ctrl_timers_tl0_i[3]));
   INX0 p214748365A23262 (.Q(n_66), 
	.A(reg_ctrl_ports_p2_i[5]));
   INX0 p214748365A23263 (.Q(n_65), 
	.A(reg_ctrl_ports_p2_i[2]));
   INX0 p15924A23264 (.Q(n_64), 
	.A(reg_ctrl_timers_tl0_i[5]));
   INX0 p15924A23265 (.Q(n_63), 
	.A(reg_ctrl_timers_tl0_i[0]));
   INX0 p214748365A23266 (.Q(n_62), 
	.A(reg_ctrl_ports_p2_i[7]));
   INX0 p14632A (.Q(n_61), 
	.A(reg_ctrl_ports_p0en_o[4]));
   NA2X0 p15405A23268 (.Q(n_80), 
	.B(reg_ctrl_interrupt_ie_o[4]), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   EO2X0 p14541A (.Q(n_60), 
	.B(\sfr[36][1] ), 
	.A(\sfr[36][0] ));
   EN2X0 p14614A (.Q(n_59), 
	.B(\sfr[36][5] ), 
	.A(\sfr[36][4] ));
   EO2X0 p14513A23269 (.Q(n_58), 
	.B(\sfr[36][3] ), 
	.A(\sfr[36][2] ));
   INX0 p15555A (.Q(n_57), 
	.A(reg_ctrl_ports_p3_o[1]));
   INX0 p14503A (.Q(n_55), 
	.A(reg_ctrl_ports_p0en_o[2]));
   INX0 p14590A (.Q(n_54), 
	.A(reg_ctrl_ports_p0en_o[6]));
   INX0 p14632A23271 (.Q(n_53), 
	.A(reg_ctrl_ports_p0en_o[3]));
   INX0 p14582A (.Q(n_52), 
	.A(reg_ctrl_ports_p0en_o[7]));
   NO2X0 p14557A (.Q(n_857), 
	.B(serial_status), 
	.A(reg_ctrl_serial_ren_o));
   BUCX4 p214748365A23272 (.Q(reg_ctrl_ports_p1_o[3]), 
	.A(DFT_sdo_3));
   INX0 p14628A (.Q(n_50), 
	.A(reg_ctrl_ports_p0en_o[1]));
   INX0 p14625A (.Q(n_49), 
	.A(reg_ctrl_ports_p0en_o[5]));
   INX0 p15584A (.Q(n_38), 
	.A(reg_ctrl_ports_p3_o[0]));
   INX0 p14631A (.Q(n_36), 
	.A(reg_ctrl_ports_p0en_o[0]));
   INX0 p15992A (.Q(n_34), 
	.A(reg_ctrl_baudrate_smod_o));
   INX0 p15828A (.Q(n_33), 
	.A(\sfr[7][1] ));
   INX0 p15206A (.Q(n_32), 
	.A(reg_ctrl_ports_p3en_o[0]));
   INX0 p14688A (.Q(n_31), 
	.A(reg_ctrl_ports_p1en_o[6]));
   INX0 p16602A (.Q(n_30), 
	.A(reg_ctrl_ports_p2_o[3]));
   INX0 p14643A (.Q(n_29), 
	.A(reg_ctrl_ports_p3en_o[2]));
   INX0 p16593A (.Q(n_28), 
	.A(reg_ctrl_ports_p2_o[1]));
   INX0 p15648A (.Q(n_27), 
	.A(reg_ctrl_timers_tacph_o[1]));
   INX0 p16599A (.Q(n_26), 
	.A(reg_ctrl_ports_p2_o[4]));
   INX0 p14589A (.Q(n_25), 
	.A(reg_ctrl_ports_p3en_o[4]));
   INX0 p16047A (.Q(n_24), 
	.A(reg_ctrl_timers_m0_t0_o));
   INX0 p16602A23290 (.Q(n_23), 
	.A(reg_ctrl_ports_p2_o[0]));
   INX0 p16179A (.Q(n_22), 
	.A(reg_ctrl_timers_gate_t1_o));
   INX0 p14681A (.Q(n_21), 
	.A(reg_ctrl_ports_p1en_o[7]));
   INX0 p14548A (.Q(n_20), 
	.A(reg_ctrl_ports_p1en_o[1]));
   INX0 p14596A (.Q(n_19), 
	.A(reg_ctrl_ports_p3en_o[5]));
   INX0 p15964A (.Q(n_18), 
	.A(reg_ctrl_baudrate_rs232_o));
   INX0 p14553A (.Q(n_17), 
	.A(reg_ctrl_ports_p1en_o[5]));
   INX0 p14547A (.Q(n_16), 
	.A(reg_ctrl_ports_p1en_o[4]));
   INX0 p14586A (.Q(n_15), 
	.A(reg_ctrl_ports_p3en_o[3]));
   INX0 p16052A (.Q(n_14), 
	.A(reg_ctrl_timers_m1_t1_o));
   INX0 p16602A23295 (.Q(n_12), 
	.A(reg_ctrl_ports_p2_o[2]));
   INX0 p15793A (.Q(n_11), 
	.A(\sfr[7][3] ));
   INX0 p16053A (.Q(n_10), 
	.A(reg_ctrl_timers_m1_t0_o));
   INX0 p14555A (.Q(n_9), 
	.A(reg_ctrl_ports_p1en_o[3]));
   INX0 p14629A (.Q(n_8), 
	.A(reg_ctrl_ports_p1en_o[2]));
   INX0 p16593A23297 (.Q(n_7), 
	.A(reg_ctrl_ports_p2_o[5]));
   INX0 p15725A (.Q(n_6), 
	.A(reg_ctrl_timers_tacph_o[0]));
   INX0 p16590A (.Q(n_5), 
	.A(reg_ctrl_ports_p2_o[6]));
   INX0 p14547A23300 (.Q(n_4), 
	.A(reg_ctrl_ports_p1en_o[0]));
   INX0 p16195A (.Q(n_3), 
	.A(reg_ctrl_timers_gate_t0_o));
   INX0 p16593A23301 (.Q(n_2), 
	.A(reg_ctrl_ports_p2_o[7]));
   INX0 p16059A (.Q(n_1), 
	.A(reg_ctrl_timers_m0_t1_o));
   INX0 p15202A23302 (.Q(n_0), 
	.A(reg_ctrl_ports_p3en_o[1]));
endmodule

module core (
	core_clk_i, 
	core_mem_clk_i, 
	core_reset_i, 
	core_interrupt_vect_i, 
	core_timers_th0_i, 
	core_timers_tm0_i, 
	core_timers_tl0_i, 
	core_timers_tf0_i, 
	core_timers_th1_i, 
	core_timers_tm1_i, 
	core_timers_tl1_i, 
	core_timers_tf1_i, 
	core_timers_acrh_i, 
	core_timers_acrm_i, 
	core_timers_acrl_i, 
	core_timers_tf2_i, 
	core_bus_ctrl_p0en_i, 
	core_bus_ctrl_p2en_i, 
	core_bus_ctrl_p3en_6_i, 
	core_bus_ctrl_p3en_7_i, 
	core_bus_ctrl_p2_i, 
	core_bus_ctrl_p3_6_i, 
	core_bus_ctrl_p3_7_i, 
	core_bus_ctrl_p4_i, 
	core_interrupt_tcon_i, 
	core_interrupt_tcon2_i, 
	core_interrupt_clear_i, 
	core_serial_p3en_0_i, 
	core_serial_p3en_1_i, 
	core_serial_p3_0_i, 
	core_serial_p3_1_i, 
	core_serial_sbuf_rx_i, 
	core_serial_rb8_i, 
	core_serial_ti_i, 
	core_serial_ri_i, 
	core_serial_load_sbuf_i, 
	core_ports_p0_i, 
	core_ports_p1_i, 
	core_ports_p2_i, 
	core_ports_p3_i, 
	core_bus_ctrl_p0_i, 
	core_reset_o, 
	core_baudrate_sm0_o, 
	core_baudrate_sm1_o, 
	core_baudrate_sm2_o, 
	core_baudrate_smod_o, 
	core_baudrate_rs232_o, 
	core_timers_th0_o, 
	core_timers_tm0_o, 
	core_timers_tl0_o, 
	core_timers_gate_t0_o, 
	core_timers_m1_t0_o, 
	core_timers_m0_t0_o, 
	core_timers_tr0_o, 
	core_timers_tf0_o, 
	core_timers_th1_o, 
	core_timers_tm1_o, 
	core_timers_tl1_o, 
	core_timers_gate_t1_o, 
	core_timers_m1_t1_o, 
	core_timers_m0_t1_o, 
	core_timers_int0_o, 
	core_timers_tr1_o, 
	core_timers_tf1_o, 
	core_timers_int1_o, 
	core_timers_tacph_o, 
	core_timers_tacpl_o, 
	core_timers_tr2_o, 
	core_timers_tf2_o, 
	core_timers_dfsel_o, 
	core_timers_edgsel_o, 
	core_timers_dfp_o, 
	core_interrupt_ip_o, 
	core_interrupt_ie_o, 
	core_interrupt_scon_o, 
	core_interrupt_tcon_o, 
	core_interrupt_tcon2_o, 
	core_interrupt_intx_o, 
	core_interrupt_na_o, 
	core_interrupt_rdy_o, 
	core_ports_p4_o, 
	core_ports_p0en_o, 
	core_ports_p1en_o, 
	core_ports_p2en_o, 
	core_ports_p3en_o, 
	core_ports_p0_o, 
	core_ports_p1_o, 
	core_ports_p2_o, 
	core_ports_p3_o, 
	core_bus_ctrl_p0_o, 
	core_serial_sm0_o, 
	core_serial_ren_o, 
	core_serial_p3_0_o, 
	core_serial_sbuf_tx_o, 
	core_serial_tb8_o, 
	core_serial_ti_o, 
	core_serial_ri_o, 
	core_serial_tx_o, 
	core_bus_ctrl_ea_b_i, 
	core_bus_ctrl_data_i, 
	core_bus_ctrl_addr_o, 
	core_bus_ctrl_data_o, 
	core_bus_ctrl_ext_rom_rd_b_o, 
	core_bus_ctrl_ext_ram_rd_b_o, 
	core_bus_ctrl_ext_ram_wr_b_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2, 
	DFT_sdi_3, 
	DFT_sdo_4, 
	DFT_sdi_5, 
	DFT_sdo_6, 
	DFT_sdi_7, 
	DFT_sdi_8, 
	DFT_sdo_9, 
	DFT_sdi_10, 
	DFT_sdi_11, 
	DFT_sdo_12, 
	DFT_sdi_13, 
	DFT_sdo_14, 
	DFT_sdi_15, 
	DFT_sdo_16, 
	DFT_sdi_17, 
	SPCASCAN_N0, 
	FE_PT1_top_p4_a_o_6_, 
	FE_PT1_top_p4_a_o_7_);
   input core_clk_i;
   input core_mem_clk_i;
   input core_reset_i;
   input [2:0] core_interrupt_vect_i;
   input [7:0] core_timers_th0_i;
   input [7:0] core_timers_tm0_i;
   input [7:0] core_timers_tl0_i;
   input core_timers_tf0_i;
   input [7:0] core_timers_th1_i;
   input [7:0] core_timers_tm1_i;
   input [7:0] core_timers_tl1_i;
   input core_timers_tf1_i;
   input [7:0] core_timers_acrh_i;
   input [7:0] core_timers_acrm_i;
   input [7:0] core_timers_acrl_i;
   input core_timers_tf2_i;
   input [7:0] core_bus_ctrl_p0en_i;
   input [7:0] core_bus_ctrl_p2en_i;
   input core_bus_ctrl_p3en_6_i;
   input core_bus_ctrl_p3en_7_i;
   input [7:0] core_bus_ctrl_p2_i;
   input core_bus_ctrl_p3_6_i;
   input core_bus_ctrl_p3_7_i;
   input [7:0] core_bus_ctrl_p4_i;
   input [3:0] core_interrupt_tcon_i;
   input [1:0] core_interrupt_tcon2_i;
   input core_interrupt_clear_i;
   input core_serial_p3en_0_i;
   input core_serial_p3en_1_i;
   input core_serial_p3_0_i;
   input core_serial_p3_1_i;
   input [7:0] core_serial_sbuf_rx_i;
   input core_serial_rb8_i;
   input core_serial_ti_i;
   input core_serial_ri_i;
   input core_serial_load_sbuf_i;
   input [7:0] core_ports_p0_i;
   input [7:0] core_ports_p1_i;
   input [7:0] core_ports_p2_i;
   input [7:0] core_ports_p3_i;
   input [7:0] core_bus_ctrl_p0_i;
   output core_reset_o;
   output core_baudrate_sm0_o;
   output core_baudrate_sm1_o;
   output core_baudrate_sm2_o;
   output core_baudrate_smod_o;
   output core_baudrate_rs232_o;
   output [7:0] core_timers_th0_o;
   output [7:0] core_timers_tm0_o;
   output [7:0] core_timers_tl0_o;
   output core_timers_gate_t0_o;
   output core_timers_m1_t0_o;
   output core_timers_m0_t0_o;
   output core_timers_tr0_o;
   output core_timers_tf0_o;
   output [7:0] core_timers_th1_o;
   output [7:0] core_timers_tm1_o;
   output [7:0] core_timers_tl1_o;
   output core_timers_gate_t1_o;
   output core_timers_m1_t1_o;
   output core_timers_m0_t1_o;
   output core_timers_int0_o;
   output core_timers_tr1_o;
   output core_timers_tf1_o;
   output core_timers_int1_o;
   output [1:0] core_timers_tacph_o;
   output [7:0] core_timers_tacpl_o;
   output core_timers_tr2_o;
   output core_timers_tf2_o;
   output core_timers_dfsel_o;
   output core_timers_edgsel_o;
   output [2:0] core_timers_dfp_o;
   output [6:0] core_interrupt_ip_o;
   output [7:0] core_interrupt_ie_o;
   output [1:0] core_interrupt_scon_o;
   output [5:0] core_interrupt_tcon_o;
   output [1:0] core_interrupt_tcon2_o;
   output [1:0] core_interrupt_intx_o;
   output core_interrupt_na_o;
   output core_interrupt_rdy_o;
   output [7:0] core_ports_p4_o;
   output [7:0] core_ports_p0en_o;
   output [7:0] core_ports_p1en_o;
   output [7:0] core_ports_p2en_o;
   output [7:0] core_ports_p3en_o;
   output [7:0] core_ports_p0_o;
   output [7:0] core_ports_p1_o;
   output [7:0] core_ports_p2_o;
   output [7:0] core_ports_p3_o;
   output [7:0] core_bus_ctrl_p0_o;
   output core_serial_sm0_o;
   output core_serial_ren_o;
   output core_serial_p3_0_o;
   output [7:0] core_serial_sbuf_tx_o;
   output core_serial_tb8_o;
   output core_serial_ti_o;
   output core_serial_ri_o;
   output core_serial_tx_o;
   input core_bus_ctrl_ea_b_i;
   input [7:0] core_bus_ctrl_data_i;
   output [15:0] core_bus_ctrl_addr_o;
   output [7:0] core_bus_ctrl_data_o;
   output core_bus_ctrl_ext_rom_rd_b_o;
   output core_bus_ctrl_ext_ram_rd_b_o;
   output core_bus_ctrl_ext_ram_wr_b_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;
   input DFT_sdi_3;
   output DFT_sdo_4;
   input DFT_sdi_5;
   output DFT_sdo_6;
   input DFT_sdi_7;
   input DFT_sdi_8;
   output DFT_sdo_9;
   input DFT_sdi_10;
   input DFT_sdi_11;
   output DFT_sdo_12;
   input DFT_sdi_13;
   output DFT_sdo_14;
   input DFT_sdi_15;
   output DFT_sdo_16;
   input DFT_sdi_17;
   output SPCASCAN_N0;
   input FE_PT1_top_p4_a_o_6_;
   input FE_PT1_top_p4_a_o_7_;

   // Internal wires
   wire UNCONNECTED7;
   wire UNCONNECTED8;
   wire UNCONNECTED9;
   wire UNCONNECTED10;
   wire UNCONNECTED11;
   wire UNCONNECTED12;
   wire UNCONNECTED13;
   wire UNCONNECTED14;
   wire UNCONNECTED15;
   wire UNCONNECTED16;
   wire UNCONNECTED17;
   wire UNCONNECTED18;
   wire UNCONNECTED19;
   wire UNCONNECTED20;
   wire UNCONNECTED21;
   wire UNCONNECTED22;
   wire UNCONNECTED23;
   wire UNCONNECTED24;
   wire UNCONNECTED25;
   wire UNCONNECTED26;
   wire UNCONNECTED27;
   wire UNCONNECTED28;
   wire UNCONNECTED29;
   wire UNCONNECTED30;
   wire UNCONNECTED31;
   wire UNCONNECTED32;
   wire UNCONNECTED33;
   wire UNCONNECTED34;
   wire UNCONNECTED35;
   wire UNCONNECTED36;
   wire UNCONNECTED37;
   wire UNCONNECTED38;
   wire UNCONNECTED39;
   wire UNCONNECTED40;
   wire UNCONNECTED41;
   wire UNCONNECTED42;
   wire UNCONNECTED43;
   wire UNCONNECTED44;
   wire \alu_fsm_result[0] ;
   wire \alu_fsm_result[1] ;
   wire \alu_fsm_result[2] ;
   wire \alu_fsm_result[3] ;
   wire \alu_fsm_result[4] ;
   wire \alu_fsm_result[5] ;
   wire \alu_fsm_result[6] ;
   wire \alu_fsm_result[7] ;
   wire \alu_fsm_result[8] ;
   wire \alu_fsm_result[9] ;
   wire \alu_fsm_result[10] ;
   wire \alu_fsm_result[11] ;
   wire \alu_fsm_result[12] ;
   wire \alu_fsm_result[13] ;
   wire \alu_fsm_result[14] ;
   wire \alu_fsm_result[15] ;
   wire alu_reg_ctrl_ac;
   wire alu_reg_ctrl_cy;
   wire alu_reg_ctrl_ov;
   wire fsm_alu_en;
   wire \fsm_alu_opcode[0] ;
   wire \fsm_alu_opcode[1] ;
   wire \fsm_alu_opcode[2] ;
   wire \fsm_alu_opcode[3] ;
   wire \fsm_alu_opcode[4] ;
   wire \fsm_alu_operand1[0] ;
   wire \fsm_alu_operand1[1] ;
   wire \fsm_alu_operand1[2] ;
   wire \fsm_alu_operand1[3] ;
   wire \fsm_alu_operand1[4] ;
   wire \fsm_alu_operand1[5] ;
   wire \fsm_alu_operand1[6] ;
   wire \fsm_alu_operand1[7] ;
   wire \fsm_alu_operand2[0] ;
   wire \fsm_alu_operand2[1] ;
   wire \fsm_alu_operand2[2] ;
   wire \fsm_alu_operand2[3] ;
   wire \fsm_alu_operand2[4] ;
   wire \fsm_alu_operand2[5] ;
   wire \fsm_alu_operand2[6] ;
   wire \fsm_alu_operand2[7] ;
   wire fsm_bit_byte_flag;
   wire fsm_ext_ram;
   wire \fsm_mem_ctrl_ram_addr[0] ;
   wire \fsm_mem_ctrl_ram_addr[1] ;
   wire \fsm_mem_ctrl_ram_addr[2] ;
   wire \fsm_mem_ctrl_ram_addr[3] ;
   wire \fsm_mem_ctrl_ram_addr[4] ;
   wire \fsm_mem_ctrl_ram_addr[5] ;
   wire \fsm_mem_ctrl_ram_addr[6] ;
   wire \fsm_mem_ctrl_ram_addr[7] ;
   wire \fsm_mem_ctrl_ram_data[0] ;
   wire \fsm_mem_ctrl_ram_data[1] ;
   wire \fsm_mem_ctrl_ram_data[2] ;
   wire \fsm_mem_ctrl_ram_data[3] ;
   wire \fsm_mem_ctrl_ram_data[4] ;
   wire \fsm_mem_ctrl_ram_data[5] ;
   wire \fsm_mem_ctrl_ram_data[6] ;
   wire \fsm_mem_ctrl_ram_data[7] ;
   wire fsm_mem_ctrl_ram_rd_b;
   wire fsm_mem_ctrl_ram_wr_b;
   wire fsm_mem_ctrl_rom_rd_b;
   wire fsm_pcau_direct;
   wire fsm_pcau_en;
   wire \fsm_pcau_msb[0] ;
   wire \fsm_pcau_msb[1] ;
   wire \fsm_pcau_msb[2] ;
   wire \fsm_pcau_msb[3] ;
   wire \fsm_pcau_msb[4] ;
   wire \fsm_pcau_msb[5] ;
   wire \fsm_pcau_msb[6] ;
   wire \fsm_pcau_msb[7] ;
   wire \fsm_pcau_offset[0] ;
   wire \fsm_pcau_offset[1] ;
   wire \fsm_pcau_offset[2] ;
   wire \fsm_pcau_offset[3] ;
   wire \fsm_pcau_offset[4] ;
   wire \fsm_pcau_offset[5] ;
   wire \fsm_pcau_offset[6] ;
   wire \fsm_pcau_offset[7] ;
   wire \fsm_reg_ctrl_addr[0] ;
   wire \fsm_reg_ctrl_addr[1] ;
   wire \fsm_reg_ctrl_addr[2] ;
   wire \fsm_reg_ctrl_addr[3] ;
   wire \fsm_reg_ctrl_addr[4] ;
   wire \fsm_reg_ctrl_addr[5] ;
   wire \fsm_reg_ctrl_addr[6] ;
   wire \fsm_reg_ctrl_addr[7] ;
   wire \fsm_reg_ctrl_data[0] ;
   wire \fsm_reg_ctrl_data[1] ;
   wire \fsm_reg_ctrl_data[2] ;
   wire \fsm_reg_ctrl_data[3] ;
   wire \fsm_reg_ctrl_data[4] ;
   wire \fsm_reg_ctrl_data[5] ;
   wire \fsm_reg_ctrl_data[6] ;
   wire \fsm_reg_ctrl_data[7] ;
   wire \fsm_reg_ctrl_psw_rs[0] ;
   wire \fsm_reg_ctrl_psw_rs[1] ;
   wire fsm_reg_ctrl_rd_b;
   wire fsm_reg_ctrl_wr_b;
   wire \mem_ctrl_fsm_ram_data[0] ;
   wire \mem_ctrl_fsm_ram_data[1] ;
   wire \mem_ctrl_fsm_ram_data[2] ;
   wire \mem_ctrl_fsm_ram_data[3] ;
   wire \mem_ctrl_fsm_ram_data[4] ;
   wire \mem_ctrl_fsm_ram_data[5] ;
   wire \mem_ctrl_fsm_ram_data[6] ;
   wire \mem_ctrl_fsm_ram_data[7] ;
   wire \mem_ctrl_fsm_rom_data[0] ;
   wire \mem_ctrl_fsm_rom_data[1] ;
   wire \mem_ctrl_fsm_rom_data[2] ;
   wire \mem_ctrl_fsm_rom_data[3] ;
   wire \mem_ctrl_fsm_rom_data[4] ;
   wire \mem_ctrl_fsm_rom_data[5] ;
   wire \mem_ctrl_fsm_rom_data[6] ;
   wire \mem_ctrl_fsm_rom_data[7] ;
   wire n_10;
   wire n_11;
   wire n_12;
   wire \pcau_fsm_pc[0] ;
   wire \pcau_fsm_pc[1] ;
   wire \pcau_fsm_pc[2] ;
   wire \pcau_fsm_pc[3] ;
   wire \pcau_fsm_pc[4] ;
   wire \pcau_fsm_pc[5] ;
   wire \pcau_fsm_pc[6] ;
   wire \pcau_fsm_pc[7] ;
   wire \pcau_fsm_pc[8] ;
   wire \pcau_fsm_pc[9] ;
   wire \pcau_fsm_pc[10] ;
   wire \pcau_fsm_pc[11] ;
   wire \pcau_fsm_pc[12] ;
   wire \pcau_fsm_pc[13] ;
   wire \pcau_fsm_pc[14] ;
   wire reg_ctrl_alu_ac;
   wire reg_ctrl_alu_cy;
   wire reg_ctrl_alu_ov;
   wire \reg_ctrl_fsm_data[0] ;
   wire \reg_ctrl_fsm_data[1] ;
   wire \reg_ctrl_fsm_data[2] ;
   wire \reg_ctrl_fsm_data[3] ;
   wire \reg_ctrl_fsm_data[4] ;
   wire \reg_ctrl_fsm_data[5] ;
   wire \reg_ctrl_fsm_data[6] ;
   wire \reg_ctrl_fsm_data[7] ;

   assign core_serial_ri_o = 1'b0 ;
   assign core_serial_ti_o = 1'b0 ;
   assign core_serial_p3_0_o = 1'b0 ;
   assign core_serial_sm0_o = 1'b0 ;
   assign core_bus_ctrl_p0_o[0] = 1'b0 ;
   assign core_bus_ctrl_p0_o[1] = 1'b0 ;
   assign core_bus_ctrl_p0_o[2] = 1'b0 ;
   assign core_bus_ctrl_p0_o[3] = 1'b0 ;
   assign core_bus_ctrl_p0_o[4] = 1'b0 ;
   assign core_bus_ctrl_p0_o[5] = 1'b0 ;
   assign core_bus_ctrl_p0_o[6] = 1'b0 ;
   assign core_bus_ctrl_p0_o[7] = 1'b0 ;
   assign core_ports_p3_o[2] = 1'b0 ;
   assign core_ports_p3_o[3] = 1'b0 ;
   assign core_interrupt_intx_o[0] = 1'b0 ;
   assign core_interrupt_intx_o[1] = 1'b0 ;
   assign core_interrupt_tcon2_o[0] = 1'b0 ;
   assign core_interrupt_tcon_o[4] = 1'b0 ;
   assign core_interrupt_tcon_o[5] = 1'b0 ;

   core_alu alu (.alu_en_i(fsm_alu_en), 
	.alu_operand1_i({ \fsm_alu_operand1[7] ,
		\fsm_alu_operand1[6] ,
		\fsm_alu_operand1[5] ,
		\fsm_alu_operand1[4] ,
		\fsm_alu_operand1[3] ,
		\fsm_alu_operand1[2] ,
		\fsm_alu_operand1[1] ,
		\fsm_alu_operand1[0]  }), 
	.alu_operand2_i({ \fsm_alu_operand2[7] ,
		\fsm_alu_operand2[6] ,
		\fsm_alu_operand2[5] ,
		\fsm_alu_operand2[4] ,
		\fsm_alu_operand2[3] ,
		\fsm_alu_operand2[2] ,
		\fsm_alu_operand2[1] ,
		\fsm_alu_operand2[0]  }), 
	.alu_opcode_i({ \fsm_alu_opcode[4] ,
		\fsm_alu_opcode[3] ,
		\fsm_alu_opcode[2] ,
		\fsm_alu_opcode[1] ,
		\fsm_alu_opcode[0]  }), 
	.alu_cy_i(reg_ctrl_alu_cy), 
	.alu_ac_i(reg_ctrl_alu_ac), 
	.alu_ov_i(reg_ctrl_alu_ov), 
	.alu_result_o({ \alu_fsm_result[15] ,
		\alu_fsm_result[14] ,
		\alu_fsm_result[13] ,
		\alu_fsm_result[12] ,
		\alu_fsm_result[11] ,
		\alu_fsm_result[10] ,
		\alu_fsm_result[9] ,
		\alu_fsm_result[8] ,
		\alu_fsm_result[7] ,
		\alu_fsm_result[6] ,
		\alu_fsm_result[5] ,
		\alu_fsm_result[4] ,
		\alu_fsm_result[3] ,
		\alu_fsm_result[2] ,
		\alu_fsm_result[1] ,
		\alu_fsm_result[0]  }), 
	.alu_cy_o(alu_reg_ctrl_cy), 
	.alu_ac_o(alu_reg_ctrl_ac), 
	.alu_ov_o(alu_reg_ctrl_ov));
   core_fsm fsm (.fsm_clock_i(core_clk_i), 
	.fsm_reset_i_b(core_reset_i), 
	.fsm_reset_core_o_b(core_reset_o), 
	.fsm_alu_result_i({ \alu_fsm_result[15] ,
		\alu_fsm_result[14] ,
		\alu_fsm_result[13] ,
		\alu_fsm_result[12] ,
		\alu_fsm_result[11] ,
		\alu_fsm_result[10] ,
		\alu_fsm_result[9] ,
		\alu_fsm_result[8] ,
		\alu_fsm_result[7] ,
		\alu_fsm_result[6] ,
		\alu_fsm_result[5] ,
		\alu_fsm_result[4] ,
		\alu_fsm_result[3] ,
		\alu_fsm_result[2] ,
		\alu_fsm_result[1] ,
		\alu_fsm_result[0]  }), 
	.fsm_sfr_addr_o({ \fsm_reg_ctrl_addr[7] ,
		\fsm_reg_ctrl_addr[6] ,
		\fsm_reg_ctrl_addr[5] ,
		\fsm_reg_ctrl_addr[4] ,
		\fsm_reg_ctrl_addr[3] ,
		\fsm_reg_ctrl_addr[2] ,
		\fsm_reg_ctrl_addr[1] ,
		\fsm_reg_ctrl_addr[0]  }), 
	.fsm_bit_byte_flag_o(fsm_bit_byte_flag), 
	.fsm_rom_addr_o({ UNCONNECTED7,
		UNCONNECTED8,
		UNCONNECTED9,
		UNCONNECTED10,
		UNCONNECTED11,
		UNCONNECTED12,
		UNCONNECTED13,
		UNCONNECTED14,
		UNCONNECTED15,
		UNCONNECTED16,
		UNCONNECTED17,
		UNCONNECTED18,
		UNCONNECTED19,
		UNCONNECTED20,
		UNCONNECTED21,
		UNCONNECTED22 }), 
	.fsm_ram_addr_o({ \fsm_mem_ctrl_ram_addr[7] ,
		\fsm_mem_ctrl_ram_addr[6] ,
		\fsm_mem_ctrl_ram_addr[5] ,
		\fsm_mem_ctrl_ram_addr[4] ,
		\fsm_mem_ctrl_ram_addr[3] ,
		\fsm_mem_ctrl_ram_addr[2] ,
		\fsm_mem_ctrl_ram_addr[1] ,
		\fsm_mem_ctrl_ram_addr[0]  }), 
	.fsm_rom_rd_o_b(fsm_mem_ctrl_rom_rd_b), 
	.fsm_ram_rd_o_b(fsm_mem_ctrl_ram_rd_b), 
	.fsm_sfr_rd_o_b(fsm_reg_ctrl_rd_b), 
	.fsm_ram_wr_o_b(fsm_mem_ctrl_ram_wr_b), 
	.fsm_sfr_wr_o_b(fsm_reg_ctrl_wr_b), 
	.fsm_alu_op1_o({ \fsm_alu_operand1[7] ,
		\fsm_alu_operand1[6] ,
		\fsm_alu_operand1[5] ,
		\fsm_alu_operand1[4] ,
		\fsm_alu_operand1[3] ,
		\fsm_alu_operand1[2] ,
		\fsm_alu_operand1[1] ,
		\fsm_alu_operand1[0]  }), 
	.fsm_alu_op2_o({ \fsm_alu_operand2[7] ,
		\fsm_alu_operand2[6] ,
		\fsm_alu_operand2[5] ,
		\fsm_alu_operand2[4] ,
		\fsm_alu_operand2[3] ,
		\fsm_alu_operand2[2] ,
		\fsm_alu_operand2[1] ,
		\fsm_alu_operand2[0]  }), 
	.fsm_alu_opcode_o({ \fsm_alu_opcode[4] ,
		\fsm_alu_opcode[3] ,
		\fsm_alu_opcode[2] ,
		\fsm_alu_opcode[1] ,
		\fsm_alu_opcode[0]  }), 
	.fsm_alu_en_o(fsm_alu_en), 
	.fsm_sfr_data_i({ \reg_ctrl_fsm_data[7] ,
		\reg_ctrl_fsm_data[6] ,
		\reg_ctrl_fsm_data[5] ,
		\reg_ctrl_fsm_data[4] ,
		\reg_ctrl_fsm_data[3] ,
		\reg_ctrl_fsm_data[2] ,
		\reg_ctrl_fsm_data[1] ,
		\reg_ctrl_fsm_data[0]  }), 
	.fsm_sfr_data_o({ \fsm_reg_ctrl_data[7] ,
		\fsm_reg_ctrl_data[6] ,
		\fsm_reg_ctrl_data[5] ,
		\fsm_reg_ctrl_data[4] ,
		\fsm_reg_ctrl_data[3] ,
		\fsm_reg_ctrl_data[2] ,
		\fsm_reg_ctrl_data[1] ,
		\fsm_reg_ctrl_data[0]  }), 
	.fsm_ram_data_i({ \mem_ctrl_fsm_ram_data[7] ,
		\mem_ctrl_fsm_ram_data[6] ,
		\mem_ctrl_fsm_ram_data[5] ,
		\mem_ctrl_fsm_ram_data[4] ,
		\mem_ctrl_fsm_ram_data[3] ,
		\mem_ctrl_fsm_ram_data[2] ,
		\mem_ctrl_fsm_ram_data[1] ,
		\mem_ctrl_fsm_ram_data[0]  }), 
	.fsm_ram_data_o({ \fsm_mem_ctrl_ram_data[7] ,
		\fsm_mem_ctrl_ram_data[6] ,
		\fsm_mem_ctrl_ram_data[5] ,
		\fsm_mem_ctrl_ram_data[4] ,
		\fsm_mem_ctrl_ram_data[3] ,
		\fsm_mem_ctrl_ram_data[2] ,
		\fsm_mem_ctrl_ram_data[1] ,
		\fsm_mem_ctrl_ram_data[0]  }), 
	.fsm_rom_data_i({ \mem_ctrl_fsm_rom_data[7] ,
		\mem_ctrl_fsm_rom_data[6] ,
		\mem_ctrl_fsm_rom_data[5] ,
		\mem_ctrl_fsm_rom_data[4] ,
		\mem_ctrl_fsm_rom_data[3] ,
		\mem_ctrl_fsm_rom_data[2] ,
		\mem_ctrl_fsm_rom_data[1] ,
		\mem_ctrl_fsm_rom_data[0]  }), 
	.fsm_psw_rs_i({ \fsm_reg_ctrl_psw_rs[1] ,
		\fsm_reg_ctrl_psw_rs[0]  }), 
	.fsm_pcau_offset_o({ \fsm_pcau_offset[7] ,
		\fsm_pcau_offset[6] ,
		\fsm_pcau_offset[5] ,
		\fsm_pcau_offset[4] ,
		\fsm_pcau_offset[3] ,
		\fsm_pcau_offset[2] ,
		\fsm_pcau_offset[1] ,
		\fsm_pcau_offset[0]  }), 
	.fsm_pcau_en_o(fsm_pcau_en), 
	.fsm_pcau_msb_o({ \fsm_pcau_msb[7] ,
		\fsm_pcau_msb[6] ,
		\fsm_pcau_msb[5] ,
		\fsm_pcau_msb[4] ,
		\fsm_pcau_msb[3] ,
		\fsm_pcau_msb[2] ,
		\fsm_pcau_msb[1] ,
		\fsm_pcau_msb[0]  }), 
	.fsm_pcau_direct_o(fsm_pcau_direct), 
	.fsm_pc_i({ DFT_sdo_16,
		\pcau_fsm_pc[14] ,
		\pcau_fsm_pc[13] ,
		\pcau_fsm_pc[12] ,
		\pcau_fsm_pc[11] ,
		\pcau_fsm_pc[10] ,
		\pcau_fsm_pc[9] ,
		\pcau_fsm_pc[8] ,
		\pcau_fsm_pc[7] ,
		\pcau_fsm_pc[6] ,
		SPCASCAN_N0,
		\pcau_fsm_pc[4] ,
		\pcau_fsm_pc[3] ,
		\pcau_fsm_pc[2] ,
		\pcau_fsm_pc[1] ,
		\pcau_fsm_pc[0]  }), 
	.fsm_int_vect_i({ core_interrupt_vect_i[2],
		core_interrupt_vect_i[1],
		core_interrupt_vect_i[0] }), 
	.fsm_int_na_o(core_interrupt_na_o), 
	.fsm_int_rdy_o(core_interrupt_rdy_o), 
	.fsm_ext_ram_o(fsm_ext_ram), 
	.fsm_state_o({ UNCONNECTED23,
		UNCONNECTED24,
		UNCONNECTED25 }), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_1), 
	.DFT_sdo_2(DFT_sdo_2), 
	.DFT_sdi_3(DFT_sdi_3), 
	.DFT_sdo_4(DFT_sdo_4));
   core_mem_ctrl mem_ctrl (.mem_ctrl_clk_i(core_mem_clk_i), 
	.mem_ctrl_rom_rd_b_i(fsm_mem_ctrl_rom_rd_b), 
	.mem_ctrl_ram_rd_b_i(fsm_mem_ctrl_ram_rd_b), 
	.mem_ctrl_ram_wr_b_i(fsm_mem_ctrl_ram_wr_b), 
	.mem_ctrl_bit_byte_flag_i(fsm_bit_byte_flag), 
	.mem_ctrl_ext_ram_i(fsm_ext_ram), 
	.mem_ctrl_rom_addr_i({ DFT_sdo_16,
		\pcau_fsm_pc[14] ,
		\pcau_fsm_pc[13] ,
		\pcau_fsm_pc[12] ,
		\pcau_fsm_pc[11] ,
		\pcau_fsm_pc[10] ,
		\pcau_fsm_pc[9] ,
		\pcau_fsm_pc[8] ,
		\pcau_fsm_pc[7] ,
		\pcau_fsm_pc[6] ,
		SPCASCAN_N0,
		\pcau_fsm_pc[4] ,
		\pcau_fsm_pc[3] ,
		\pcau_fsm_pc[2] ,
		\pcau_fsm_pc[1] ,
		\pcau_fsm_pc[0]  }), 
	.mem_ctrl_ram_addr_i({ \fsm_mem_ctrl_ram_addr[7] ,
		\fsm_mem_ctrl_ram_addr[6] ,
		\fsm_mem_ctrl_ram_addr[5] ,
		\fsm_mem_ctrl_ram_addr[4] ,
		\fsm_mem_ctrl_ram_addr[3] ,
		\fsm_mem_ctrl_ram_addr[2] ,
		\fsm_mem_ctrl_ram_addr[1] ,
		\fsm_mem_ctrl_ram_addr[0]  }), 
	.mem_ctrl_ram_data_i({ \fsm_mem_ctrl_ram_data[7] ,
		\fsm_mem_ctrl_ram_data[6] ,
		\fsm_mem_ctrl_ram_data[5] ,
		\fsm_mem_ctrl_ram_data[4] ,
		\fsm_mem_ctrl_ram_data[3] ,
		\fsm_mem_ctrl_ram_data[2] ,
		\fsm_mem_ctrl_ram_data[1] ,
		\fsm_mem_ctrl_ram_data[0]  }), 
	.mem_ctrl_bus_ctrl_ea_b_i(core_bus_ctrl_ea_b_i), 
	.mem_ctrl_bus_ctrl_data_i({ core_bus_ctrl_data_i[7],
		core_bus_ctrl_data_i[6],
		core_bus_ctrl_data_i[5],
		core_bus_ctrl_data_i[4],
		core_bus_ctrl_data_i[3],
		core_bus_ctrl_data_i[2],
		core_bus_ctrl_data_i[1],
		core_bus_ctrl_data_i[0] }), 
	.mem_ctrl_bus_ctrl_data_o({ core_bus_ctrl_data_o[7],
		core_bus_ctrl_data_o[6],
		core_bus_ctrl_data_o[5],
		core_bus_ctrl_data_o[4],
		core_bus_ctrl_data_o[3],
		core_bus_ctrl_data_o[2],
		core_bus_ctrl_data_o[1],
		core_bus_ctrl_data_o[0] }), 
	.mem_ctrl_bus_ctrl_addr_o({ core_bus_ctrl_addr_o[15],
		core_bus_ctrl_addr_o[14],
		core_bus_ctrl_addr_o[13],
		core_bus_ctrl_addr_o[12],
		core_bus_ctrl_addr_o[11],
		core_bus_ctrl_addr_o[10],
		core_bus_ctrl_addr_o[9],
		core_bus_ctrl_addr_o[8],
		core_bus_ctrl_addr_o[7],
		core_bus_ctrl_addr_o[6],
		core_bus_ctrl_addr_o[5],
		core_bus_ctrl_addr_o[4],
		core_bus_ctrl_addr_o[3],
		core_bus_ctrl_addr_o[2],
		core_bus_ctrl_addr_o[1],
		core_bus_ctrl_addr_o[0] }), 
	.mem_ctrl_bus_ctrl_ext_rom_rd_b_o(core_bus_ctrl_ext_rom_rd_b_o), 
	.mem_ctrl_bus_ctrl_ext_ram_rd_b_o(core_bus_ctrl_ext_ram_rd_b_o), 
	.mem_ctrl_bus_ctrl_ext_ram_wr_b_o(core_bus_ctrl_ext_ram_wr_b_o), 
	.mem_ctrl_rom_data_o({ \mem_ctrl_fsm_rom_data[7] ,
		\mem_ctrl_fsm_rom_data[6] ,
		\mem_ctrl_fsm_rom_data[5] ,
		\mem_ctrl_fsm_rom_data[4] ,
		\mem_ctrl_fsm_rom_data[3] ,
		\mem_ctrl_fsm_rom_data[2] ,
		\mem_ctrl_fsm_rom_data[1] ,
		\mem_ctrl_fsm_rom_data[0]  }), 
	.mem_ctrl_ram_data_o({ \mem_ctrl_fsm_ram_data[7] ,
		\mem_ctrl_fsm_ram_data[6] ,
		\mem_ctrl_fsm_ram_data[5] ,
		\mem_ctrl_fsm_ram_data[4] ,
		\mem_ctrl_fsm_ram_data[3] ,
		\mem_ctrl_fsm_ram_data[2] ,
		\mem_ctrl_fsm_ram_data[1] ,
		\mem_ctrl_fsm_ram_data[0]  }));
   core_pcau pcau (.pcau_clock_mem_i(core_mem_clk_i), 
	.pcau_reset_i_b(core_reset_o), 
	.pcau_offset_i({ \fsm_pcau_offset[7] ,
		\fsm_pcau_offset[6] ,
		\fsm_pcau_offset[5] ,
		\fsm_pcau_offset[4] ,
		\fsm_pcau_offset[3] ,
		\fsm_pcau_offset[2] ,
		\fsm_pcau_offset[1] ,
		\fsm_pcau_offset[0]  }), 
	.pcau_en_i(fsm_pcau_en), 
	.pcau_pc_o({ DFT_sdo_16,
		\pcau_fsm_pc[14] ,
		\pcau_fsm_pc[13] ,
		\pcau_fsm_pc[12] ,
		\pcau_fsm_pc[11] ,
		\pcau_fsm_pc[10] ,
		\pcau_fsm_pc[9] ,
		\pcau_fsm_pc[8] ,
		\pcau_fsm_pc[7] ,
		\pcau_fsm_pc[6] ,
		SPCASCAN_N0,
		\pcau_fsm_pc[4] ,
		\pcau_fsm_pc[3] ,
		\pcau_fsm_pc[2] ,
		\pcau_fsm_pc[1] ,
		\pcau_fsm_pc[0]  }), 
	.pcau_pc_direct_i(fsm_pcau_direct), 
	.pcau_pc_msb_i({ \fsm_pcau_msb[7] ,
		\fsm_pcau_msb[6] ,
		\fsm_pcau_msb[5] ,
		\fsm_pcau_msb[4] ,
		\fsm_pcau_msb[3] ,
		\fsm_pcau_msb[2] ,
		\fsm_pcau_msb[1] ,
		\fsm_pcau_msb[0]  }), 
	.pcau_fsm_state_i({ 1'b0,
		1'b0,
		1'b0 }), 
	.DFT_sdi(DFT_sdi_15), 
	.DFT_sen(DFT_sen), 
	.FE_PT1_top_p4_a_o_6_(FE_PT1_top_p4_a_o_6_));
   core_reg_ctrl reg_ctrl (.reg_ctrl_clk_i(core_mem_clk_i), 
	.reg_ctrl_reset_b_i(core_reset_i), 
	.reg_ctrl_fsm_wr_b_i(fsm_reg_ctrl_wr_b), 
	.reg_ctrl_fsm_rd_b_i(fsm_reg_ctrl_rd_b), 
	.reg_ctrl_fsm_bit_byte_flag_i(fsm_bit_byte_flag), 
	.reg_ctrl_fsm_addr_i({ \fsm_reg_ctrl_addr[7] ,
		\fsm_reg_ctrl_addr[6] ,
		\fsm_reg_ctrl_addr[5] ,
		\fsm_reg_ctrl_addr[4] ,
		\fsm_reg_ctrl_addr[3] ,
		\fsm_reg_ctrl_addr[2] ,
		\fsm_reg_ctrl_addr[1] ,
		\fsm_reg_ctrl_addr[0]  }), 
	.reg_ctrl_fsm_data_i({ \fsm_reg_ctrl_data[7] ,
		\fsm_reg_ctrl_data[6] ,
		\fsm_reg_ctrl_data[5] ,
		\fsm_reg_ctrl_data[4] ,
		\fsm_reg_ctrl_data[3] ,
		\fsm_reg_ctrl_data[2] ,
		\fsm_reg_ctrl_data[1] ,
		\fsm_reg_ctrl_data[0]  }), 
	.reg_ctrl_ext_ram_rd_i(n_11), 
	.reg_ctrl_ext_ram_wr_i(n_10), 
	.reg_ctrl_ext_rom_rd_i(n_12), 
	.reg_ctrl_alu_cy_i(alu_reg_ctrl_cy), 
	.reg_ctrl_alu_ac_i(alu_reg_ctrl_ac), 
	.reg_ctrl_alu_ov_i(alu_reg_ctrl_ov), 
	.reg_ctrl_bus_ctrl_p0en_i({ core_bus_ctrl_p0en_i[7],
		core_bus_ctrl_p0en_i[6],
		core_bus_ctrl_p0en_i[5],
		core_bus_ctrl_p0en_i[4],
		core_bus_ctrl_p0en_i[3],
		core_bus_ctrl_p0en_i[2],
		core_bus_ctrl_p0en_i[1],
		core_bus_ctrl_p0en_i[0] }), 
	.reg_ctrl_bus_ctrl_p0_i({ core_bus_ctrl_p0_i[7],
		core_bus_ctrl_p0_i[6],
		core_bus_ctrl_p0_i[5],
		core_bus_ctrl_p0_i[4],
		core_bus_ctrl_p0_i[3],
		core_bus_ctrl_p0_i[2],
		core_bus_ctrl_p0_i[1],
		core_bus_ctrl_p0_i[0] }), 
	.reg_ctrl_bus_ctrl_p2en_i({ core_bus_ctrl_p2en_i[7],
		core_bus_ctrl_p2en_i[6],
		core_bus_ctrl_p2en_i[5],
		core_bus_ctrl_p2en_i[4],
		core_bus_ctrl_p2en_i[3],
		core_bus_ctrl_p2en_i[2],
		core_bus_ctrl_p2en_i[1],
		core_bus_ctrl_p2en_i[0] }), 
	.reg_ctrl_bus_ctrl_p2_i({ core_bus_ctrl_p2_i[7],
		core_bus_ctrl_p2_i[6],
		core_bus_ctrl_p2_i[5],
		core_bus_ctrl_p2_i[4],
		core_bus_ctrl_p2_i[3],
		core_bus_ctrl_p2_i[2],
		core_bus_ctrl_p2_i[1],
		core_bus_ctrl_p2_i[0] }), 
	.reg_ctrl_bus_ctrl_p3en_6_i(core_bus_ctrl_p3en_6_i), 
	.reg_ctrl_bus_ctrl_p3en_7_i(core_bus_ctrl_p3en_7_i), 
	.reg_ctrl_bus_ctrl_p3_6_i(core_bus_ctrl_p3_6_i), 
	.reg_ctrl_bus_ctrl_p3_7_i(core_bus_ctrl_p3_7_i), 
	.reg_ctrl_bus_ctrl_p4_i({ core_bus_ctrl_p4_i[7],
		core_bus_ctrl_p4_i[6],
		core_bus_ctrl_p4_i[5],
		core_bus_ctrl_p4_i[4],
		core_bus_ctrl_p4_i[3],
		core_bus_ctrl_p4_i[2],
		core_bus_ctrl_p4_i[1],
		core_bus_ctrl_p4_i[0] }), 
	.reg_ctrl_interrupt_ie0_i(core_interrupt_tcon_i[0]), 
	.reg_ctrl_interrupt_ie1_i(core_interrupt_tcon_i[1]), 
	.reg_ctrl_interrupt_tf0_i(core_interrupt_tcon_i[2]), 
	.reg_ctrl_interrupt_tf1_i(core_interrupt_tcon_i[3]), 
	.reg_ctrl_interrupt_tf2_i(core_interrupt_tcon2_i[0]), 
	.reg_ctrl_interrupt_txrxf_i(core_interrupt_tcon2_i[1]), 
	.reg_ctrl_interrupt_clear_i(core_interrupt_clear_i), 
	.reg_ctrl_ports_p0_i({ core_ports_p0_i[7],
		core_ports_p0_i[6],
		core_ports_p0_i[5],
		core_ports_p0_i[4],
		core_ports_p0_i[3],
		core_ports_p0_i[2],
		core_ports_p0_i[1],
		core_ports_p0_i[0] }), 
	.reg_ctrl_ports_p1_i({ core_ports_p1_i[7],
		core_ports_p1_i[6],
		core_ports_p1_i[5],
		core_ports_p1_i[4],
		core_ports_p1_i[3],
		core_ports_p1_i[2],
		core_ports_p1_i[1],
		core_ports_p1_i[0] }), 
	.reg_ctrl_ports_p2_i({ core_ports_p2_i[7],
		core_ports_p2_i[6],
		core_ports_p2_i[5],
		core_ports_p2_i[4],
		core_ports_p2_i[3],
		core_ports_p2_i[2],
		core_ports_p2_i[1],
		core_ports_p2_i[0] }), 
	.reg_ctrl_ports_p3_i({ core_ports_p3_i[7],
		core_ports_p3_i[6],
		core_ports_p3_i[5],
		core_ports_p3_i[4],
		core_ports_p3_i[3],
		core_ports_p3_i[2],
		core_ports_p3_i[1],
		core_ports_p3_i[0] }), 
	.reg_ctrl_serial_p3en_0_i(core_serial_p3en_0_i), 
	.reg_ctrl_serial_p3en_1_i(core_serial_p3en_1_i), 
	.reg_ctrl_serial_p3_0_i(core_serial_p3_0_i), 
	.reg_ctrl_serial_p3_1_i(core_serial_p3_1_i), 
	.reg_ctrl_serial_sbuf_rx_i({ core_serial_sbuf_rx_i[7],
		core_serial_sbuf_rx_i[6],
		core_serial_sbuf_rx_i[5],
		core_serial_sbuf_rx_i[4],
		core_serial_sbuf_rx_i[3],
		core_serial_sbuf_rx_i[2],
		core_serial_sbuf_rx_i[1],
		core_serial_sbuf_rx_i[0] }), 
	.reg_ctrl_serial_rb8_i(core_serial_rb8_i), 
	.reg_ctrl_serial_ti_i(core_serial_ti_i), 
	.reg_ctrl_serial_ri_i(core_serial_ri_i), 
	.reg_ctrl_serial_load_sbuf_i(core_serial_load_sbuf_i), 
	.reg_ctrl_timers_th0_i({ core_timers_th0_i[7],
		core_timers_th0_i[6],
		core_timers_th0_i[5],
		core_timers_th0_i[4],
		core_timers_th0_i[3],
		core_timers_th0_i[2],
		core_timers_th0_i[1],
		core_timers_th0_i[0] }), 
	.reg_ctrl_timers_tm0_i({ core_timers_tm0_i[7],
		core_timers_tm0_i[6],
		core_timers_tm0_i[5],
		core_timers_tm0_i[4],
		core_timers_tm0_i[3],
		core_timers_tm0_i[2],
		core_timers_tm0_i[1],
		core_timers_tm0_i[0] }), 
	.reg_ctrl_timers_tl0_i({ core_timers_tl0_i[7],
		core_timers_tl0_i[6],
		core_timers_tl0_i[5],
		core_timers_tl0_i[4],
		core_timers_tl0_i[3],
		core_timers_tl0_i[2],
		core_timers_tl0_i[1],
		core_timers_tl0_i[0] }), 
	.reg_ctrl_timers_tf0_i(core_timers_tf0_i), 
	.reg_ctrl_timers_th1_i({ core_timers_th1_i[7],
		core_timers_th1_i[6],
		core_timers_th1_i[5],
		core_timers_th1_i[4],
		core_timers_th1_i[3],
		core_timers_th1_i[2],
		core_timers_th1_i[1],
		core_timers_th1_i[0] }), 
	.reg_ctrl_timers_tm1_i({ core_timers_tm1_i[7],
		core_timers_tm1_i[6],
		core_timers_tm1_i[5],
		core_timers_tm1_i[4],
		core_timers_tm1_i[3],
		core_timers_tm1_i[2],
		core_timers_tm1_i[1],
		core_timers_tm1_i[0] }), 
	.reg_ctrl_timers_tl1_i({ core_timers_tl1_i[7],
		core_timers_tl1_i[6],
		core_timers_tl1_i[5],
		core_timers_tl1_i[4],
		core_timers_tl1_i[3],
		core_timers_tl1_i[2],
		core_timers_tl1_i[1],
		core_timers_tl1_i[0] }), 
	.reg_ctrl_timers_tf1_i(core_timers_tf1_i), 
	.reg_ctrl_timers_acrh_i({ core_timers_acrh_i[7],
		core_timers_acrh_i[6],
		core_timers_acrh_i[5],
		core_timers_acrh_i[4],
		core_timers_acrh_i[3],
		core_timers_acrh_i[2],
		core_timers_acrh_i[1],
		core_timers_acrh_i[0] }), 
	.reg_ctrl_timers_acrm_i({ core_timers_acrm_i[7],
		core_timers_acrm_i[6],
		core_timers_acrm_i[5],
		core_timers_acrm_i[4],
		core_timers_acrm_i[3],
		core_timers_acrm_i[2],
		core_timers_acrm_i[1],
		core_timers_acrm_i[0] }), 
	.reg_ctrl_timers_acrl_i({ core_timers_acrl_i[7],
		core_timers_acrl_i[6],
		core_timers_acrl_i[5],
		core_timers_acrl_i[4],
		core_timers_acrl_i[3],
		core_timers_acrl_i[2],
		core_timers_acrl_i[1],
		core_timers_acrl_i[0] }), 
	.reg_ctrl_timers_tf2_i(core_timers_tf2_i), 
	.reg_ctrl_fsm_data_o({ \reg_ctrl_fsm_data[7] ,
		\reg_ctrl_fsm_data[6] ,
		\reg_ctrl_fsm_data[5] ,
		\reg_ctrl_fsm_data[4] ,
		\reg_ctrl_fsm_data[3] ,
		\reg_ctrl_fsm_data[2] ,
		\reg_ctrl_fsm_data[1] ,
		\reg_ctrl_fsm_data[0]  }), 
	.reg_ctrl_fsm_psw_rs_o({ \fsm_reg_ctrl_psw_rs[1] ,
		\fsm_reg_ctrl_psw_rs[0]  }), 
	.reg_ctrl_alu_cy_o(reg_ctrl_alu_cy), 
	.reg_ctrl_alu_ac_o(reg_ctrl_alu_ac), 
	.reg_ctrl_alu_ov_o(reg_ctrl_alu_ov), 
	.reg_ctrl_baudrate_sm0_o(core_baudrate_sm0_o), 
	.reg_ctrl_baudrate_sm1_o(core_baudrate_sm1_o), 
	.reg_ctrl_baudrate_sm2_o(core_baudrate_sm2_o), 
	.reg_ctrl_baudrate_smod_o(core_baudrate_smod_o), 
	.reg_ctrl_baudrate_rs232_o(core_baudrate_rs232_o), 
	.reg_ctrl_bus_ctrl_p0_o({ UNCONNECTED26,
		UNCONNECTED27,
		UNCONNECTED28,
		UNCONNECTED29,
		UNCONNECTED30,
		UNCONNECTED31,
		UNCONNECTED32,
		UNCONNECTED33 }), 
	.reg_ctrl_interrupt_ip_o({ core_interrupt_ip_o[6],
		core_interrupt_ip_o[5],
		core_interrupt_ip_o[4],
		core_interrupt_ip_o[3],
		core_interrupt_ip_o[2],
		core_interrupt_ip_o[1],
		core_interrupt_ip_o[0] }), 
	.reg_ctrl_interrupt_ie_o({ core_interrupt_ie_o[7],
		core_interrupt_ie_o[6],
		core_interrupt_ie_o[5],
		core_interrupt_ie_o[4],
		core_interrupt_ie_o[3],
		core_interrupt_ie_o[2],
		core_interrupt_ie_o[1],
		core_interrupt_ie_o[0] }), 
	.reg_ctrl_interrupt_int0_o(core_timers_int0_o), 
	.reg_ctrl_interrupt_int1_o(core_timers_int1_o), 
	.reg_ctrl_interrupt_it0_o(core_interrupt_tcon_o[0]), 
	.reg_ctrl_interrupt_it1_o(core_interrupt_tcon_o[2]), 
	.reg_ctrl_interrupt_ie0_o(core_interrupt_tcon_o[1]), 
	.reg_ctrl_interrupt_ie1_o(core_interrupt_tcon_o[3]), 
	.reg_ctrl_interrupt_ri_o(core_interrupt_scon_o[0]), 
	.reg_ctrl_interrupt_ti_o(core_interrupt_scon_o[1]), 
	.reg_ctrl_interrupt_tf0_o(core_timers_tf0_o), 
	.reg_ctrl_interrupt_tf1_o(core_timers_tf1_o), 
	.reg_ctrl_interrupt_tf2_o(core_timers_tf2_o), 
	.reg_ctrl_interrupt_txrxf_o(core_interrupt_tcon2_o[1]), 
	.reg_ctrl_ports_p0_o({ core_ports_p0_o[7],
		core_ports_p0_o[6],
		core_ports_p0_o[5],
		core_ports_p0_o[4],
		core_ports_p0_o[3],
		core_ports_p0_o[2],
		core_ports_p0_o[1],
		core_ports_p0_o[0] }), 
	.reg_ctrl_ports_p1_o({ core_ports_p1_o[7],
		core_ports_p1_o[6],
		core_ports_p1_o[5],
		core_ports_p1_o[4],
		core_ports_p1_o[3],
		core_ports_p1_o[2],
		core_ports_p1_o[1],
		core_ports_p1_o[0] }), 
	.reg_ctrl_ports_p2_o({ core_ports_p2_o[7],
		core_ports_p2_o[6],
		core_ports_p2_o[5],
		core_ports_p2_o[4],
		core_ports_p2_o[3],
		core_ports_p2_o[2],
		core_ports_p2_o[1],
		core_ports_p2_o[0] }), 
	.reg_ctrl_ports_p3_o({ core_ports_p3_o[7],
		core_ports_p3_o[6],
		core_ports_p3_o[5],
		core_ports_p3_o[4],
		UNCONNECTED34,
		UNCONNECTED35,
		core_ports_p3_o[1],
		core_ports_p3_o[0] }), 
	.reg_ctrl_ports_p4_o({ core_ports_p4_o[7],
		core_ports_p4_o[6],
		core_ports_p4_o[5],
		core_ports_p4_o[4],
		core_ports_p4_o[3],
		core_ports_p4_o[2],
		core_ports_p4_o[1],
		core_ports_p4_o[0] }), 
	.reg_ctrl_ports_p0en_o({ core_ports_p0en_o[7],
		core_ports_p0en_o[6],
		core_ports_p0en_o[5],
		core_ports_p0en_o[4],
		core_ports_p0en_o[3],
		core_ports_p0en_o[2],
		core_ports_p0en_o[1],
		core_ports_p0en_o[0] }), 
	.reg_ctrl_ports_p1en_o({ core_ports_p1en_o[7],
		core_ports_p1en_o[6],
		core_ports_p1en_o[5],
		core_ports_p1en_o[4],
		core_ports_p1en_o[3],
		core_ports_p1en_o[2],
		core_ports_p1en_o[1],
		core_ports_p1en_o[0] }), 
	.reg_ctrl_ports_p2en_o({ core_ports_p2en_o[7],
		core_ports_p2en_o[6],
		core_ports_p2en_o[5],
		core_ports_p2en_o[4],
		core_ports_p2en_o[3],
		core_ports_p2en_o[2],
		core_ports_p2en_o[1],
		core_ports_p2en_o[0] }), 
	.reg_ctrl_ports_p3en_o({ core_ports_p3en_o[7],
		core_ports_p3en_o[6],
		core_ports_p3en_o[5],
		core_ports_p3en_o[4],
		core_ports_p3en_o[3],
		core_ports_p3en_o[2],
		core_ports_p3en_o[1],
		core_ports_p3en_o[0] }), 
	.reg_ctrl_serial_sm0_o(UNCONNECTED36), 
	.reg_ctrl_serial_ren_o(core_serial_ren_o), 
	.reg_ctrl_serial_p3_0_o(UNCONNECTED37), 
	.reg_ctrl_serial_sbuf_tx_o({ core_serial_sbuf_tx_o[7],
		core_serial_sbuf_tx_o[6],
		core_serial_sbuf_tx_o[5],
		core_serial_sbuf_tx_o[4],
		core_serial_sbuf_tx_o[3],
		core_serial_sbuf_tx_o[2],
		core_serial_sbuf_tx_o[1],
		core_serial_sbuf_tx_o[0] }), 
	.reg_ctrl_serial_tb8_o(core_serial_tb8_o), 
	.reg_ctrl_serial_ti_o(UNCONNECTED38), 
	.reg_ctrl_serial_ri_o(UNCONNECTED39), 
	.reg_ctrl_serial_tx_o(core_serial_tx_o), 
	.reg_ctrl_timers_th0_o({ core_timers_th0_o[7],
		core_timers_th0_o[6],
		core_timers_th0_o[5],
		core_timers_th0_o[4],
		core_timers_th0_o[3],
		core_timers_th0_o[2],
		core_timers_th0_o[1],
		core_timers_th0_o[0] }), 
	.reg_ctrl_timers_tm0_o({ core_timers_tm0_o[7],
		core_timers_tm0_o[6],
		core_timers_tm0_o[5],
		core_timers_tm0_o[4],
		core_timers_tm0_o[3],
		core_timers_tm0_o[2],
		core_timers_tm0_o[1],
		core_timers_tm0_o[0] }), 
	.reg_ctrl_timers_tl0_o({ core_timers_tl0_o[7],
		core_timers_tl0_o[6],
		core_timers_tl0_o[5],
		core_timers_tl0_o[4],
		core_timers_tl0_o[3],
		core_timers_tl0_o[2],
		core_timers_tl0_o[1],
		core_timers_tl0_o[0] }), 
	.reg_ctrl_timers_gate_t0_o(core_timers_gate_t0_o), 
	.reg_ctrl_timers_m1_t0_o(core_timers_m1_t0_o), 
	.reg_ctrl_timers_m0_t0_o(core_timers_m0_t0_o), 
	.reg_ctrl_timers_tr0_o(core_timers_tr0_o), 
	.reg_ctrl_timers_tf0_o(UNCONNECTED40), 
	.reg_ctrl_timers_int0_o(UNCONNECTED41), 
	.reg_ctrl_timers_th1_o({ core_timers_th1_o[7],
		core_timers_th1_o[6],
		core_timers_th1_o[5],
		core_timers_th1_o[4],
		core_timers_th1_o[3],
		core_timers_th1_o[2],
		core_timers_th1_o[1],
		core_timers_th1_o[0] }), 
	.reg_ctrl_timers_tm1_o({ core_timers_tm1_o[7],
		core_timers_tm1_o[6],
		core_timers_tm1_o[5],
		core_timers_tm1_o[4],
		core_timers_tm1_o[3],
		core_timers_tm1_o[2],
		core_timers_tm1_o[1],
		core_timers_tm1_o[0] }), 
	.reg_ctrl_timers_tl1_o({ core_timers_tl1_o[7],
		core_timers_tl1_o[6],
		core_timers_tl1_o[5],
		core_timers_tl1_o[4],
		core_timers_tl1_o[3],
		core_timers_tl1_o[2],
		core_timers_tl1_o[1],
		core_timers_tl1_o[0] }), 
	.reg_ctrl_timers_gate_t1_o(core_timers_gate_t1_o), 
	.reg_ctrl_timers_m1_t1_o(core_timers_m1_t1_o), 
	.reg_ctrl_timers_m0_t1_o(core_timers_m0_t1_o), 
	.reg_ctrl_timers_tr1_o(core_timers_tr1_o), 
	.reg_ctrl_timers_tf1_o(UNCONNECTED42), 
	.reg_ctrl_timers_int1_o(UNCONNECTED43), 
	.reg_ctrl_timers_tacph_o({ core_timers_tacph_o[1],
		core_timers_tacph_o[0] }), 
	.reg_ctrl_timers_tacpl_o({ core_timers_tacpl_o[7],
		core_timers_tacpl_o[6],
		core_timers_tacpl_o[5],
		core_timers_tacpl_o[4],
		core_timers_tacpl_o[3],
		core_timers_tacpl_o[2],
		core_timers_tacpl_o[1],
		core_timers_tacpl_o[0] }), 
	.reg_ctrl_timers_tr2_o(core_timers_tr2_o), 
	.reg_ctrl_timers_tf2_o(UNCONNECTED44), 
	.reg_ctrl_timers_dfsel_o(core_timers_dfsel_o), 
	.reg_ctrl_timers_edgsel_o(core_timers_edgsel_o), 
	.reg_ctrl_timers_dfp_o({ core_timers_dfp_o[2],
		core_timers_dfp_o[1],
		core_timers_dfp_o[0] }), 
	.DFT_sdi(DFT_sdi_5), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo_6), 
	.DFT_sdi_1(DFT_sdi_7), 
	.DFT_sdi_2(DFT_sdi_8), 
	.DFT_sdo_3(DFT_sdo_9), 
	.DFT_sdi_4(DFT_sdi_10), 
	.DFT_sdi_5(DFT_sdi_11), 
	.DFT_sdo_6(DFT_sdo_12), 
	.DFT_sdi_7(DFT_sdi_13), 
	.DFT_sdo_8(DFT_sdo_14), 
	.DFT_sdi_9(DFT_sdi_17), 
	.FE_PT1_top_p4_a_o_7_(FE_PT1_top_p4_a_o_7_));
   INX0 p4540A (.Q(n_12), 
	.A(core_bus_ctrl_ext_rom_rd_b_o));
   INX0 p11812A (.Q(n_11), 
	.A(core_bus_ctrl_ext_ram_rd_b_o));
   INX0 p11875A (.Q(n_10), 
	.A(core_bus_ctrl_ext_ram_wr_b_o));
endmodule

module INTERRUPT (
	int_intx_b_i, 
	int_rst_sync_b_i, 
	clk, 
	int_rdy_i, 
	int_na_i, 
	int_cm_i, 
	reg_ie_i, 
	reg_ip_i, 
	reg_scon_i, 
	reg_tcon_i, 
	reg_tcon2_i, 
	int_vect_o, 
	reg_tcon_o, 
	reg_tcon2_o, 
	int_reg_clr_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2);
   input [1:0] int_intx_b_i;
   input int_rst_sync_b_i;
   input clk;
   input int_rdy_i;
   input int_na_i;
   input int_cm_i;
   input [7:0] reg_ie_i;
   input [6:0] reg_ip_i;
   input [1:0] reg_scon_i;
   input [5:0] reg_tcon_i;
   input [1:0] reg_tcon2_i;
   output [2:0] int_vect_o;
   output [3:0] reg_tcon_o;
   output [1:0] reg_tcon2_o;
   output int_reg_clr_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;

   // Internal wires
   wire \flag_intx_next[1][0] ;
   wire \flag_intx_next[1][1] ;
   wire \function_TASK_DEFAULT[0] ;
   wire \function_TASK_DEFAULT[1] ;
   wire \hi_ok[0] ;
   wire \hi_ok[1] ;
   wire \ier[0] ;
   wire \ier[1] ;
   wire \ier[2] ;
   wire \ier[3] ;
   wire \ier[4] ;
   wire \ier[5] ;
   wire \ier[6] ;
   wire \ier_ctr[0] ;
   wire \ier_ctr[1] ;
   wire \ier_ctr[2] ;
   wire \ier_ctr[3] ;
   wire \ier_ctr[4] ;
   wire \ier_ctr[5] ;
   wire \ier_ctr[6] ;
   wire ier_ctr_next_4616;
   wire ier_ctr_next_4617;
   wire ier_ctr_next_4618;
   wire ier_ctr_next_4619;
   wire ier_next_4620;
   wire ier_next_4621;
   wire ier_next_4622;
   wire ier_next_4623;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_196;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_206;
   wire reset;
   wire \vect_register[0] ;
   wire \vect_register[1] ;

   SDFFQX0 \flag_intx_reg[0][0]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(\function_TASK_DEFAULT[0] ), 
	.D(n_145), 
	.CN(clk));
   SDFFQX0 \flag_intx_reg[0][1]  (.SE(DFT_sen), 
	.SD(\function_TASK_DEFAULT[0] ), 
	.Q(\function_TASK_DEFAULT[1] ), 
	.D(n_147), 
	.CN(clk));
   SDFFQX0 \flag_intx_reg[1][0]  (.SE(DFT_sen), 
	.SD(\function_TASK_DEFAULT[1] ), 
	.Q(\flag_intx_next[1][0] ), 
	.D(n_144), 
	.CN(clk));
   SDFFQX0 \flag_intx_reg[1][1]  (.SE(DFT_sen), 
	.SD(\flag_intx_next[1][0] ), 
	.Q(\flag_intx_next[1][1] ), 
	.D(n_146), 
	.CN(clk));
   SDFRQX0 \flag_out_reg_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(n_151), 
	.D(n_127), 
	.C(clk));
   SDFRQX0 \flag_out_reg_reg[1]  (.SE(DFT_sen), 
	.SD(n_151), 
	.Q(DFT_sdo), 
	.D(n_126), 
	.C(clk));
   SDFFQX0 \hi_ok_reg[0][0]  (.SE(DFT_sen), 
	.SD(\flag_intx_next[1][1] ), 
	.Q(\hi_ok[0] ), 
	.D(n_134), 
	.CN(clk));
   SDFFQX0 \hi_ok_reg[1][0]  (.SE(DFT_sen), 
	.SD(\hi_ok[0] ), 
	.Q(\hi_ok[1] ), 
	.D(n_133), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[0]  (.SE(DFT_sen), 
	.SD(\hi_ok[1] ), 
	.Q(\ier_ctr[0] ), 
	.D(n_141), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[1]  (.SE(DFT_sen), 
	.SD(\ier_ctr[0] ), 
	.Q(\ier_ctr[1] ), 
	.D(n_76), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[2]  (.SE(DFT_sen), 
	.SD(\ier_ctr[1] ), 
	.Q(\ier_ctr[2] ), 
	.D(n_140), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[3]  (.SE(DFT_sen), 
	.SD(\ier_ctr[2] ), 
	.Q(\ier_ctr[3] ), 
	.D(n_89), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[4]  (.SE(DFT_sen), 
	.SD(\ier_ctr[3] ), 
	.Q(\ier_ctr[4] ), 
	.D(n_139), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[5]  (.SE(DFT_sen), 
	.SD(\ier_ctr[4] ), 
	.Q(\ier_ctr[5] ), 
	.D(n_82), 
	.CN(clk));
   SDFFQX0 \ier_ctr_reg[6]  (.SE(DFT_sen), 
	.SD(\ier_ctr[5] ), 
	.Q(\ier_ctr[6] ), 
	.D(n_81), 
	.CN(clk));
   SDFFQX0 \ier_reg[0]  (.SE(DFT_sen), 
	.SD(\ier_ctr[6] ), 
	.Q(\ier[0] ), 
	.D(n_132), 
	.CN(clk));
   SDFFQX0 \ier_reg[1]  (.SE(DFT_sen), 
	.SD(\ier[0] ), 
	.Q(\ier[1] ), 
	.D(n_83), 
	.CN(clk));
   SDFFQX0 \ier_reg[2]  (.SE(DFT_sen), 
	.SD(\ier[1] ), 
	.Q(\ier[2] ), 
	.D(n_131), 
	.CN(clk));
   SDFFQX0 \ier_reg[3]  (.SE(DFT_sen), 
	.SD(\ier[2] ), 
	.Q(\ier[3] ), 
	.D(n_79), 
	.CN(clk));
   SDFFQX0 \ier_reg[4]  (.SE(DFT_sen), 
	.SD(\ier[3] ), 
	.Q(\ier[4] ), 
	.D(n_130), 
	.CN(clk));
   SDFFQX0 \ier_reg[5]  (.SE(DFT_sen), 
	.SD(\ier[4] ), 
	.Q(\ier[5] ), 
	.D(n_78), 
	.CN(clk));
   SDFFQX0 \ier_reg[6]  (.SE(DFT_sen), 
	.SD(\ier[5] ), 
	.Q(\ier[6] ), 
	.D(n_90), 
	.CN(clk));
   SDFFQX0 \lo_ok_reg[0][0]  (.SE(DFT_sen), 
	.SD(\ier[6] ), 
	.Q(n_150), 
	.D(n_129), 
	.CN(clk));
   SDFFQX0 \lo_ok_reg[1][0]  (.SE(DFT_sen), 
	.SD(n_150), 
	.Q(n_149), 
	.D(n_128), 
	.CN(clk));
   SDFFQX0 reset_reg (.SE(DFT_sen), 
	.SD(n_149), 
	.Q(reset), 
	.D(int_rst_sync_b_i), 
	.CN(clk));
   SDFFQX0 \vect_register_reg[0]  (.SE(DFT_sen), 
	.SD(n_206), 
	.Q(\vect_register[0] ), 
	.D(n_102), 
	.CN(clk));
   SDFFQX0 \vect_register_reg[1]  (.SE(DFT_sen), 
	.SD(\vect_register[0] ), 
	.Q(\vect_register[1] ), 
	.D(n_101), 
	.CN(clk));
   SDFFQX0 \vect_register_reg[2]  (.SE(DFT_sen), 
	.SD(\vect_register[1] ), 
	.Q(DFT_sdo_2), 
	.D(n_108), 
	.CN(clk));
   ON21X0 p15318A (.Q(n_147), 
	.C(n_121), 
	.B(n_64), 
	.A(n_143));
   ON21X0 p15318A6162 (.Q(n_146), 
	.C(n_120), 
	.B(n_64), 
	.A(n_142));
   AN21X0 p15441A (.Q(n_145), 
	.C(n_64), 
	.B(n_135), 
	.A(n_138));
   AN21X0 p15441A6166 (.Q(n_144), 
	.C(n_64), 
	.B(n_137), 
	.A(n_136));
   AN32X0 p15186A (.Q(n_143), 
	.E(\function_TASK_DEFAULT[1] ), 
	.D(n_106), 
	.C(n_66), 
	.B(n_105), 
	.A(n_123));
   AN32X0 p15186A6174 (.Q(n_142), 
	.E(\flag_intx_next[1][1] ), 
	.D(n_111), 
	.C(n_71), 
	.B(n_110), 
	.A(n_124));
   AO22X0 p15186A6175 (.Q(n_141), 
	.D(\ier_ctr[0] ), 
	.C(n_125), 
	.B(n_178), 
	.A(n_122));
   AO22X0 p15186A6176 (.Q(n_140), 
	.D(\ier_ctr[2] ), 
	.C(n_125), 
	.B(n_184), 
	.A(n_122));
   AO22X0 p15186A6177 (.Q(n_139), 
	.D(\ier_ctr[4] ), 
	.C(n_125), 
	.B(n_186), 
	.A(n_122));
   NA3I1X0 p15267A (.Q(n_138), 
	.C(n_112), 
	.B(n_119), 
	.AN(n_150));
   ON21X0 p15328A (.Q(n_137), 
	.C(\flag_intx_next[1][0] ), 
	.B(n_77), 
	.A(n_113));
   NA3I1X0 p15267A6180 (.Q(n_136), 
	.C(n_112), 
	.B(n_117), 
	.AN(n_149));
   ON21X0 p15328A6181 (.Q(n_135), 
	.C(\function_TASK_DEFAULT[0] ), 
	.B(n_73), 
	.A(n_113));
   ON221X0 p15558A (.Q(n_134), 
	.E(n_115), 
	.D(n_66), 
	.C(n_104), 
	.B(n_105), 
	.A(n_116));
   ON221X0 p15558A6182 (.Q(n_133), 
	.E(n_115), 
	.D(n_71), 
	.C(n_104), 
	.B(n_110), 
	.A(n_116));
   AO22X0 p14974A (.Q(n_132), 
	.D(n_97), 
	.C(n_177), 
	.B(\ier[0] ), 
	.A(n_114));
   AO22X0 p14974A6183 (.Q(n_131), 
	.D(n_97), 
	.C(n_185), 
	.B(\ier[2] ), 
	.A(n_114));
   AO22X0 p14951A (.Q(n_130), 
	.D(n_97), 
	.C(n_187), 
	.B(\ier[4] ), 
	.A(n_114));
   ON221X0 p15342A (.Q(n_129), 
	.E(n_115), 
	.D(n_65), 
	.C(n_104), 
	.B(n_119), 
	.A(n_116));
   ON221X0 p15342A6184 (.Q(n_128), 
	.E(n_115), 
	.D(n_67), 
	.C(n_104), 
	.B(n_117), 
	.A(n_116));
   NO3X0 p15584A (.Q(n_127), 
	.C(n_84), 
	.B(n_99), 
	.A(n_109));
   NO3X0 p15584A6185 (.Q(n_126), 
	.C(n_84), 
	.B(n_98), 
	.A(n_107));
   ON31X0 p15115A (.Q(n_125), 
	.D(n_95), 
	.C(n_188), 
	.B(n_75), 
	.A(n_64));
   ON21X0 p15105A (.Q(n_124), 
	.C(n_118), 
	.B(DFT_sdo), 
	.A(n_103));
   ON21X0 p15105A6186 (.Q(n_123), 
	.C(n_118), 
	.B(n_151), 
	.A(n_103));
   ON31X0 p15190A (.Q(n_122), 
	.D(n_96), 
	.C(n_86), 
	.B(n_87), 
	.A(int_cm_i));
   ON221X0 p15046A (.Q(n_121), 
	.E(\function_TASK_DEFAULT[1] ), 
	.D(n_91), 
	.C(n_88), 
	.B(n_94), 
	.A(n_100));
   ON221X0 p15046A6187 (.Q(n_120), 
	.E(\flag_intx_next[1][1] ), 
	.D(n_91), 
	.C(n_74), 
	.B(n_93), 
	.A(n_100));
   NO2X0 p15131A (.Q(n_119), 
	.B(int_intx_b_i[0]), 
	.A(n_99));
   OR2X0 p15019A (.Q(n_118), 
	.B(n_100), 
	.A(n_182));
   NO2X0 p15131A6191 (.Q(n_117), 
	.B(int_intx_b_i[1]), 
	.A(n_98));
   AN31X0 p15058A (.Q(n_116), 
	.D(n_104), 
	.C(n_70), 
	.B(reg_ie_i[7]), 
	.A(n_69));
   AN21X0 p15251A (.Q(n_115), 
	.C(n_64), 
	.B(n_80), 
	.A(n_70));
   ON31X0 p14983A (.Q(n_114), 
	.D(n_95), 
	.C(n_85), 
	.B(n_181), 
	.A(n_64));
   INX0 Fp15237A (.Q(n_112), 
	.A(n_113));
   AO22X0 p14873A (.Q(n_113), 
	.D(int_cm_i), 
	.C(n_70), 
	.B(n_69), 
	.A(n_92));
   NA2X0 p15343A (.Q(n_111), 
	.B(reg_ie_i[2]), 
	.A(n_84));
   NO2I1X0 p15065A (.Q(n_110), 
	.B(n_77), 
	.AN(reg_tcon_i[2]));
   NA2X0 p15676A (.Q(n_109), 
	.B(reset), 
	.A(\function_TASK_DEFAULT[0] ));
   NO2I1X0 p14608A (.Q(n_108), 
	.B(n_87), 
	.AN(n_204));
   NA2X0 p15676A6200 (.Q(n_107), 
	.B(reset), 
	.A(\flag_intx_next[1][0] ));
   NA2X0 p15343A6201 (.Q(n_106), 
	.B(reg_ie_i[0]), 
	.A(n_84));
   NO2I1X0 p15065A6202 (.Q(n_105), 
	.B(n_73), 
	.AN(reg_tcon_i[0]));
   INX0 Fp15123A6203 (.Q(n_103), 
	.A(n_104));
   AND2X0 p14789A (.Q(n_104), 
	.B(int_cm_i), 
	.A(n_80));
   NO2I1X0 p14608A6204 (.Q(n_102), 
	.B(n_87), 
	.AN(n_202));
   NO2I1X0 p14618A (.Q(n_101), 
	.B(n_87), 
	.AN(n_203));
   ON21X0 p14650A (.Q(n_100), 
	.C(reg_ie_i[7]), 
	.B(n_72), 
	.A(n_69));
   ON21X0 p14880A (.Q(n_99), 
	.C(reg_ie_i[0]), 
	.B(n_68), 
	.A(\function_TASK_DEFAULT[1] ));
   ON21X0 p14880A6205 (.Q(n_98), 
	.C(reg_ie_i[2]), 
	.B(n_63), 
	.A(\flag_intx_next[1][1] ));
   INX0 Fp15194A (.Q(n_96), 
	.A(n_97));
   NO3I1X0 p15037A (.Q(n_97), 
	.C(n_72), 
	.B(n_87), 
	.AN(n_196));
   AN21X0 p14711A (.Q(n_95), 
	.C(n_91), 
	.B(int_rst_sync_b_i), 
	.A(n_69));
   EN2X0 p14909A (.Q(n_94), 
	.B(int_intx_b_i[0]), 
	.A(n_68));
   EN2X0 p14909A6206 (.Q(n_93), 
	.B(int_intx_b_i[1]), 
	.A(n_63));
   NA2X0 p14949A (.Q(n_92), 
	.B(n_206), 
	.A(reg_ie_i[7]));
   NO2X0 p14771A (.Q(n_91), 
	.B(n_64), 
	.A(n_182));
   NO2I1X0 p14915A (.Q(n_90), 
	.B(n_64), 
	.AN(ier_next_4620));
   NO2I1X0 p15543A (.Q(n_89), 
	.B(n_64), 
	.AN(ier_ctr_next_4618));
   NO2X0 p15892A (.Q(n_88), 
	.B(n_64), 
	.A(n_151));
   NA2X0 p14598A (.Q(n_87), 
	.B(int_rst_sync_b_i), 
	.A(reg_ie_i[7]));
   NA2X0 p39872A (.Q(n_86), 
	.B(n_206), 
	.A(n_179));
   OR2X0 p15242A (.Q(n_85), 
	.B(n_180), 
	.A(n_183));
   NA2X0 p15027A (.Q(n_84), 
	.B(n_69), 
	.A(n_182));
   NO2I1X0 p15185A (.Q(n_83), 
	.B(n_64), 
	.AN(ier_next_4623));
   NO2I1X0 p15458A (.Q(n_82), 
	.B(n_64), 
	.AN(ier_ctr_next_4617));
   NO2I1X0 p15418A (.Q(n_81), 
	.B(n_64), 
	.AN(ier_ctr_next_4616));
   NO2I1X0 p14650A6208 (.Q(n_80), 
	.B(n_206), 
	.AN(reg_ie_i[7]));
   NO2I1X0 p15152A (.Q(n_79), 
	.B(n_64), 
	.AN(ier_next_4622));
   NO2I1X0 p15156A (.Q(n_78), 
	.B(n_64), 
	.AN(ier_next_4621));
   NA2X0 p15083A (.Q(n_77), 
	.B(reg_ie_i[2]), 
	.A(int_intx_b_i[1]));
   NO2I1X0 p15543A6209 (.Q(n_76), 
	.B(n_64), 
	.AN(ier_ctr_next_4619));
   AND2X0 p15556A (.Q(n_75), 
	.B(int_rdy_i), 
	.A(n_152));
   NO2X0 p15892A6210 (.Q(n_74), 
	.B(n_64), 
	.A(DFT_sdo));
   NA2X0 p15083A6211 (.Q(n_73), 
	.B(reg_ie_i[0]), 
	.A(int_intx_b_i[0]));
   INX0 Fp45924A (.Q(n_72), 
	.A(n_206));
   INX0 Fp9999860A (.Q(n_71), 
	.A(\hi_ok[1] ));
   INX0 Fp14755A (.Q(n_70), 
	.A(n_182));
   INX0 Fp14574A (.Q(n_69), 
	.A(int_cm_i));
   INX0 Fp14853A (.Q(n_68), 
	.A(reg_tcon_i[0]));
   INX0 Fp9999839A (.Q(n_67), 
	.A(n_149));
   INX0 Fp9999860A6219 (.Q(n_66), 
	.A(\hi_ok[0] ));
   INX0 Fp9999839A6220 (.Q(n_65), 
	.A(n_150));
   INX0 Fp45776A6230 (.Q(n_64), 
	.A(int_rst_sync_b_i));
   INX0 Fp14853A6231 (.Q(n_63), 
	.A(reg_tcon_i[2]));
   SDFFQX0 state_reg (.SE(DFT_sen), 
	.SD(reset), 
	.Q(n_206), 
	.D(int_cm_i), 
	.CN(clk));
   NO2I1X0 p12926A (.Q(reg_tcon_o[1]), 
	.B(n_62), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12926A6861 (.Q(reg_tcon_o[0]), 
	.B(n_61), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12926A6862 (.Q(reg_tcon_o[3]), 
	.B(n_60), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12926A6863 (.Q(reg_tcon_o[2]), 
	.B(n_59), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12328A (.Q(reg_tcon2_o[1]), 
	.B(n_58), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12328A6864 (.Q(reg_tcon2_o[0]), 
	.B(n_57), 
	.AN(int_reg_clr_o));
   AN31X0 p12052A (.Q(int_reg_clr_o), 
	.D(n_53), 
	.C(n_54), 
	.B(n_55), 
	.A(n_56));
   AN21X0 p11985A (.Q(n_54), 
	.C(n_52), 
	.B(reg_tcon2_i[1]), 
	.A(n_58));
   AN222X0 p11520A (.Q(n_55), 
	.F(reg_tcon2_i[0]), 
	.E(n_57), 
	.D(n_59), 
	.C(reg_tcon_i[4]), 
	.B(n_60), 
	.A(reg_tcon_i[5]));
   AND2X0 p9994A (.Q(int_vect_o[0]), 
	.B(reg_ie_i[7]), 
	.A(n_202));
   AND2X0 p10485A (.Q(int_vect_o[2]), 
	.B(reg_ie_i[7]), 
	.A(n_204));
   AND2X0 p9977A (.Q(int_vect_o[1]), 
	.B(reg_ie_i[7]), 
	.A(n_203));
   NA2X0 p11979A (.Q(n_58), 
	.B(reg_tcon2_i[1]), 
	.A(n_51));
   NA2X0 p11612A (.Q(n_57), 
	.B(reg_tcon2_i[0]), 
	.A(n_50));
   NA2X0 p11542A (.Q(n_60), 
	.B(reg_tcon_i[5]), 
	.A(n_49));
   ON21X0 p12060A (.Q(n_51), 
	.C(reg_ie_i[6]), 
	.B(ier_ctr_next_4616), 
	.A(ier_next_4620));
   ON21X0 p11691A (.Q(n_50), 
	.C(reg_ie_i[5]), 
	.B(ier_ctr_next_4617), 
	.A(ier_next_4621));
   NA3X0 p9785A (.Q(n_202), 
	.C(n_46), 
	.B(n_47), 
	.A(n_48));
   NA3X0 p10275A (.Q(n_204), 
	.C(n_44), 
	.B(n_45), 
	.A(n_48));
   NA3I1X0 p9661A (.Q(n_203), 
	.C(n_45), 
	.B(n_43), 
	.AN(n_42));
   NA2X0 p11513A (.Q(n_59), 
	.B(reg_tcon_i[4]), 
	.A(n_41));
   ON21X0 p11575A (.Q(n_49), 
	.C(reg_ie_i[3]), 
	.B(ier_ctr_next_4618), 
	.A(ier_next_4622));
   AN221X0 p9686A (.Q(n_48), 
	.E(n_36), 
	.D(n_37), 
	.C(n_38), 
	.B(n_39), 
	.A(n_40));
   NA2X0 p9531A (.Q(n_42), 
	.B(n_35), 
	.A(n_47));
   ON21X0 p11545A (.Q(n_41), 
	.C(reg_ie_i[1]), 
	.B(ier_ctr_next_4619), 
	.A(ier_next_4623));
   AN22X0 p9799A (.Q(n_45), 
	.D(n_37), 
	.C(n_186), 
	.B(n_40), 
	.A(n_187));
   AO22X0 p11738A (.Q(ier_next_4620), 
	.D(\ier[6] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_34));
   AO22X0 p11370A (.Q(ier_next_4621), 
	.D(\ier[5] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_39));
   INX0 Fp9571A (.Q(n_36), 
	.A(n_43));
   AN22X0 p9415A (.Q(n_43), 
	.D(n_37), 
	.C(n_31), 
	.B(n_40), 
	.A(n_34));
   AO22X0 p11254A (.Q(ier_next_4622), 
	.D(\ier[3] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_30));
   AN222X0 p10373A (.Q(n_44), 
	.F(n_40), 
	.E(n_30), 
	.D(DFT_sdo_2), 
	.C(n_28), 
	.B(n_29), 
	.A(n_37));
   AN22X0 p9521A (.Q(n_47), 
	.D(n_184), 
	.C(n_37), 
	.B(n_40), 
	.A(n_185));
   NO2X0 p9718A (.Q(n_39), 
	.B(n_26), 
	.A(n_27));
   NO3I1X0 p9165A (.Q(n_34), 
	.C(n_25), 
	.B(n_27), 
	.AN(n_24));
   NO3I1X0 p9418A (.Q(n_187), 
	.C(n_24), 
	.B(n_27), 
	.AN(n_26));
   AO22X0 p11224A (.Q(ier_next_4623), 
	.D(\ier[1] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_23));
   AN222X0 p9531A6865 (.Q(n_35), 
	.F(n_40), 
	.E(n_23), 
	.D(\vect_register[1] ), 
	.C(n_28), 
	.B(n_37), 
	.A(n_22));
   NO2X0 p9652A (.Q(n_185), 
	.B(n_20), 
	.A(n_21));
   NA3I1X0 p8822A (.Q(n_27), 
	.C(n_19), 
	.B(n_20), 
	.AN(n_21));
   NO3I1X0 p10257A (.Q(n_30), 
	.C(n_19), 
	.B(n_21), 
	.AN(n_20));
   AN222X0 p9883A (.Q(n_46), 
	.F(n_40), 
	.E(n_177), 
	.D(\vect_register[0] ), 
	.C(n_28), 
	.B(n_37), 
	.A(n_178));
   AO22X0 p11921A (.Q(ier_ctr_next_4616), 
	.D(\ier_ctr[6] ), 
	.C(n_17), 
	.B(n_18), 
	.A(n_31));
   NA2I1X0 p8452A (.Q(n_21), 
	.B(n_16), 
	.AN(n_15));
   NO2X0 p9798A (.Q(n_23), 
	.B(n_16), 
	.A(n_15));
   AO22X0 p11552A (.Q(ier_ctr_next_4617), 
	.D(\ier_ctr[5] ), 
	.C(n_17), 
	.B(n_18), 
	.A(n_38));
   NO2X0 p10050A (.Q(n_31), 
	.B(n_13), 
	.A(n_14));
   NA3I1X0 p8119A (.Q(n_15), 
	.C(n_12), 
	.B(n_13), 
	.AN(n_14));
   NO3I1X0 p10091A (.Q(n_177), 
	.C(n_12), 
	.B(n_14), 
	.AN(n_13));
   AO22X0 p11436A (.Q(ier_ctr_next_4618), 
	.D(\ier_ctr[3] ), 
	.C(n_17), 
	.B(n_18), 
	.A(n_29));
   AO22X0 p11450A (.Q(ier_ctr_next_4619), 
	.D(\ier_ctr[1] ), 
	.C(n_17), 
	.B(n_22), 
	.A(n_18));
   NO2I1X0 p10973A (.Q(n_33), 
	.B(n_11), 
	.AN(n_18));
   NO2X0 p10430A (.Q(n_38), 
	.B(n_9), 
	.A(n_10));
   NA3I1X0 p7622A (.Q(n_14), 
	.C(n_9), 
	.B(n_8), 
	.AN(n_10));
   NO3I1X0 p10170A (.Q(n_186), 
	.C(n_8), 
	.B(n_10), 
	.AN(n_9));
   AND2X0 p10703A (.Q(n_18), 
	.B(reg_ie_i[7]), 
	.A(n_37));
   NO2I1X0 p9273A (.Q(n_40), 
	.B(n_11), 
	.AN(n_37));
   NA2X0 p7517A (.Q(n_10), 
	.B(n_6), 
	.A(n_7));
   NO2I1X0 p10856A (.Q(n_29), 
	.B(n_6), 
	.AN(n_7));
   AO21X0 p10957A (.Q(n_32), 
	.C(n_17), 
	.B(n_5), 
	.A(n_152));
   NO3X0 p14942A (.Q(n_196), 
	.C(int_cm_i), 
	.B(n_152), 
	.A(n_11));
   OA21X0 p15512A (.Q(n_188), 
	.C(int_na_i), 
	.B(int_rdy_i), 
	.A(n_152));
   NO2I1X0 p39140A (.Q(n_179), 
	.B(n_152), 
	.AN(n_11));
   NO2I1X0 p15380A (.Q(n_181), 
	.B(n_152), 
	.AN(int_rdy_i));
   NO2I1X0 p15113A (.Q(n_180), 
	.B(n_152), 
	.AN(int_na_i));
   NO2X0 p9005A (.Q(n_37), 
	.B(n_4), 
	.A(n_152));
   NO3X0 p7191A (.Q(n_7), 
	.C(n_178), 
	.B(n_2), 
	.A(n_3));
   NO3I1X0 p10363A (.Q(n_184), 
	.C(n_178), 
	.B(n_2), 
	.AN(n_3));
   EO2X0 p13290A (.Q(n_56), 
	.B(reg_tcon_i[1]), 
	.A(n_61));
   EN2X0 p13126A (.Q(n_52), 
	.B(reg_tcon_i[3]), 
	.A(n_62));
   NA2I1X0 p7866A (.Q(n_8), 
	.B(reg_ip_i[4]), 
	.AN(n_24));
   NA2X0 p14298A (.Q(n_53), 
	.B(int_cm_i), 
	.A(n_182));
   NO2I1X0 p10371A (.Q(n_22), 
	.B(n_178), 
	.AN(n_2));
   OR5X0 p9277A (.Q(n_11), 
	.E(\ier[0] ), 
	.D(\ier[2] ), 
	.C(\ier[5] ), 
	.B(\ier[6] ), 
	.A(n_1));
   OR5X0 p8697A (.Q(n_152), 
	.E(\ier_ctr[0] ), 
	.D(\ier_ctr[2] ), 
	.C(\ier_ctr[5] ), 
	.B(\ier_ctr[6] ), 
	.A(n_0));
   ON211X0 p11079A (.Q(n_17), 
	.D(n_182), 
	.C(int_cm_i), 
	.B(int_na_i), 
	.A(int_rdy_i));
   NO2X0 p14749A (.Q(n_28), 
	.B(n_206), 
	.A(int_cm_i));
   NO2I1X0 p10299A (.Q(n_182), 
	.B(n_206), 
	.AN(reg_ie_i[7]));
   NA2I1X0 p7879A (.Q(n_9), 
	.B(reg_ip_i[5]), 
	.AN(n_26));
   NO2I1X0 p7021A (.Q(n_178), 
	.B(n_12), 
	.AN(reg_ip_i[0]));
   NO2I1X0 p7112A (.Q(n_2), 
	.B(n_16), 
	.AN(reg_ip_i[1]));
   NO2I1X0 p7201A (.Q(n_3), 
	.B(n_20), 
	.AN(reg_ip_i[2]));
   NA2I1X0 p10841A (.Q(n_4), 
	.B(n_206), 
	.AN(int_cm_i));
   NA2I1X0 p7562A (.Q(n_6), 
	.B(reg_ip_i[3]), 
	.AN(n_19));
   OR3X0 p8427A (.Q(n_0), 
	.C(\ier_ctr[4] ), 
	.B(\ier_ctr[3] ), 
	.A(\ier_ctr[1] ));
   ON21X0 p7544A (.Q(n_24), 
	.C(reg_ie_i[4]), 
	.B(reg_scon_i[0]), 
	.A(reg_scon_i[1]));
   NA3X0 p10185A (.Q(n_25), 
	.C(reg_tcon2_i[1]), 
	.B(reg_ie_i[6]), 
	.A(n_26));
   OR3X0 p9007A (.Q(n_1), 
	.C(\ier[4] ), 
	.B(\ier[3] ), 
	.A(\ier[1] ));
   NA3X0 p8697A6866 (.Q(n_13), 
	.C(reg_ie_i[6]), 
	.B(reg_tcon2_i[1]), 
	.A(reg_ip_i[6]));
   MU2IX0 p13328A (.S(reg_ie_i[0]), 
	.Q(n_61), 
	.IN1(n_151), 
	.IN0(reg_tcon_i[1]));
   MU2IX0 p13192A (.S(reg_ie_i[2]), 
	.Q(n_62), 
	.IN1(DFT_sdo), 
	.IN0(reg_tcon_i[3]));
   NA2X0 p6775A (.Q(n_12), 
	.B(reg_tcon_i[1]), 
	.A(reg_ie_i[0]));
   NA2X0 p7560A (.Q(n_26), 
	.B(reg_tcon2_i[0]), 
	.A(reg_ie_i[5]));
   NA2X0 p6887A (.Q(n_20), 
	.B(reg_tcon_i[3]), 
	.A(reg_ie_i[2]));
   NA2X0 p6897A (.Q(n_16), 
	.B(reg_tcon_i[4]), 
	.A(reg_ie_i[1]));
   INX0 Fp11860A (.Q(n_183), 
	.A(n_5));
   NA2X0 p11796A (.Q(n_5), 
	.B(int_rdy_i), 
	.A(int_na_i));
   NA2X0 p7317A (.Q(n_19), 
	.B(reg_tcon_i[5]), 
	.A(reg_ie_i[3]));
endmodule

module PORT_TOP (
	ports_sfr_P0EN_i, 
	ports_sfr_P1EN_i, 
	ports_sfr_P2EN_i, 
	ports_sfr_P3EN_i, 
	ports_sfr_P0_i, 
	ports_sfr_P1_i, 
	ports_sfr_P2_i, 
	ports_sfr_P3_i, 
	ports_sfr_P4_i, 
	ports_sfr_P0_o, 
	ports_sfr_P1_o, 
	ports_sfr_P2_o, 
	ports_sfr_P3_o, 
	y_port0_i, 
	y_port1_i, 
	y_port2_i, 
	y_port3_i, 
	ports_test_mode_i, 
	en_port0_o, 
	en_port1_o, 
	en_port2_o, 
	en_port3_o, 
	a_port0_o, 
	a_port1_o, 
	a_port2_o, 
	a_port3_o, 
	a_port4_o);
   input [7:0] ports_sfr_P0EN_i;
   input [7:0] ports_sfr_P1EN_i;
   input [7:0] ports_sfr_P2EN_i;
   input [7:0] ports_sfr_P3EN_i;
   input [7:0] ports_sfr_P0_i;
   input [7:0] ports_sfr_P1_i;
   input [7:0] ports_sfr_P2_i;
   input [7:0] ports_sfr_P3_i;
   input [7:0] ports_sfr_P4_i;
   output [7:0] ports_sfr_P0_o;
   output [7:0] ports_sfr_P1_o;
   output [7:0] ports_sfr_P2_o;
   output [7:0] ports_sfr_P3_o;
   input [7:0] y_port0_i;
   input [7:0] y_port1_i;
   input [7:0] y_port2_i;
   input [7:0] y_port3_i;
   input ports_test_mode_i;
   output [7:0] en_port0_o;
   output [7:0] en_port1_o;
   output [7:0] en_port2_o;
   output [7:0] en_port3_o;
   output [7:0] a_port0_o;
   output [7:0] a_port1_o;
   output [7:0] a_port2_o;
   output [7:0] a_port3_o;
   output [7:0] a_port4_o;

   // Internal wires
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;

   assign a_port4_o[0] = 1'b0 ;
   assign a_port4_o[1] = 1'b0 ;
   assign a_port4_o[2] = 1'b0 ;
   assign a_port4_o[3] = 1'b0 ;
   assign a_port4_o[4] = 1'b0 ;
   assign a_port4_o[5] = 1'b0 ;
   assign a_port4_o[6] = 1'b0 ;
   assign a_port4_o[7] = 1'b0 ;
   assign a_port3_o[0] = 1'b0 ;
   assign a_port3_o[1] = 1'b0 ;
   assign a_port3_o[2] = 1'b0 ;
   assign a_port3_o[3] = 1'b0 ;
   assign a_port3_o[4] = 1'b0 ;
   assign a_port3_o[5] = 1'b0 ;
   assign a_port3_o[6] = 1'b0 ;
   assign a_port3_o[7] = 1'b0 ;
   assign a_port2_o[0] = 1'b0 ;
   assign a_port2_o[1] = 1'b0 ;
   assign a_port2_o[2] = 1'b0 ;
   assign a_port2_o[3] = 1'b0 ;
   assign a_port2_o[4] = 1'b0 ;
   assign a_port2_o[5] = 1'b0 ;
   assign a_port2_o[6] = 1'b0 ;
   assign a_port2_o[7] = 1'b0 ;
   assign a_port1_o[0] = 1'b0 ;
   assign a_port1_o[1] = 1'b0 ;
   assign a_port1_o[2] = 1'b0 ;
   assign a_port1_o[3] = 1'b0 ;
   assign a_port1_o[4] = 1'b0 ;
   assign a_port1_o[5] = 1'b0 ;
   assign a_port1_o[6] = 1'b0 ;
   assign a_port1_o[7] = 1'b0 ;
   assign a_port0_o[0] = 1'b0 ;
   assign a_port0_o[1] = 1'b0 ;
   assign a_port0_o[2] = 1'b0 ;
   assign a_port0_o[3] = 1'b0 ;
   assign a_port0_o[4] = 1'b0 ;
   assign a_port0_o[5] = 1'b0 ;
   assign a_port0_o[6] = 1'b0 ;
   assign a_port0_o[7] = 1'b0 ;
   assign en_port3_o[0] = 1'b0 ;
   assign en_port3_o[1] = 1'b0 ;
   assign en_port3_o[2] = 1'b0 ;
   assign en_port3_o[3] = 1'b0 ;
   assign en_port3_o[4] = 1'b0 ;
   assign en_port3_o[5] = 1'b0 ;
   assign en_port3_o[6] = 1'b0 ;
   assign en_port3_o[7] = 1'b0 ;
   assign ports_sfr_P3_o[0] = 1'b0 ;
   assign ports_sfr_P3_o[1] = 1'b0 ;
   assign ports_sfr_P3_o[2] = 1'b0 ;
   assign ports_sfr_P3_o[3] = 1'b0 ;
   assign ports_sfr_P3_o[4] = 1'b0 ;
   assign ports_sfr_P3_o[5] = 1'b0 ;
   assign ports_sfr_P3_o[6] = 1'b0 ;
   assign ports_sfr_P3_o[7] = 1'b0 ;
   assign ports_sfr_P2_o[0] = 1'b0 ;
   assign ports_sfr_P2_o[1] = 1'b0 ;
   assign ports_sfr_P2_o[2] = 1'b0 ;
   assign ports_sfr_P2_o[3] = 1'b0 ;
   assign ports_sfr_P2_o[4] = 1'b0 ;
   assign ports_sfr_P2_o[5] = 1'b0 ;
   assign ports_sfr_P2_o[6] = 1'b0 ;
   assign ports_sfr_P2_o[7] = 1'b0 ;
   assign ports_sfr_P1_o[0] = 1'b0 ;
   assign ports_sfr_P1_o[1] = 1'b0 ;
   assign ports_sfr_P1_o[2] = 1'b0 ;
   assign ports_sfr_P1_o[3] = 1'b0 ;
   assign ports_sfr_P1_o[4] = 1'b0 ;
   assign ports_sfr_P1_o[5] = 1'b0 ;
   assign ports_sfr_P1_o[6] = 1'b0 ;
   assign ports_sfr_P1_o[7] = 1'b0 ;
   assign ports_sfr_P0_o[0] = 1'b0 ;
   assign ports_sfr_P0_o[1] = 1'b0 ;
   assign ports_sfr_P0_o[2] = 1'b0 ;
   assign ports_sfr_P0_o[3] = 1'b0 ;
   assign ports_sfr_P0_o[4] = 1'b0 ;
   assign ports_sfr_P0_o[5] = 1'b0 ;
   assign ports_sfr_P0_o[6] = 1'b0 ;
   assign ports_sfr_P0_o[7] = 1'b0 ;

   NA2I1X0 p214748365A (.Q(en_port0_o[7]), 
	.B(ports_sfr_P0EN_i[7]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A182 (.Q(en_port0_o[6]), 
	.B(ports_sfr_P0EN_i[6]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A183 (.Q(en_port0_o[4]), 
	.B(ports_sfr_P0EN_i[4]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A184 (.Q(en_port0_o[0]), 
	.B(ports_sfr_P0EN_i[0]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A185 (.Q(en_port1_o[0]), 
	.B(ports_sfr_P1EN_i[0]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A186 (.Q(en_port2_o[7]), 
	.B(n_56), 
	.A(n_48));
   NA2I1X0 p214748365A187 (.Q(en_port1_o[7]), 
	.B(ports_sfr_P1EN_i[7]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A188 (.Q(en_port2_o[6]), 
	.B(n_56), 
	.A(n_51));
   AND2X0 p214748365A189 (.Q(en_port2_o[5]), 
	.B(n_56), 
	.A(n_55));
   NA2I1X0 p214748365A190 (.Q(en_port0_o[3]), 
	.B(ports_sfr_P0EN_i[3]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A191 (.Q(en_port1_o[6]), 
	.B(ports_sfr_P1EN_i[6]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A192 (.Q(en_port2_o[4]), 
	.B(n_56), 
	.A(n_54));
   AND2X0 p214748365A193 (.Q(en_port2_o[3]), 
	.B(n_56), 
	.A(n_49));
   NA2I1X0 p214748365A194 (.Q(en_port1_o[5]), 
	.B(ports_sfr_P1EN_i[5]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A195 (.Q(en_port2_o[2]), 
	.B(n_56), 
	.A(n_53));
   AND2X0 p214748365A196 (.Q(en_port2_o[1]), 
	.B(n_56), 
	.A(n_50));
   NA2I1X0 p214748365A197 (.Q(en_port0_o[5]), 
	.B(ports_sfr_P0EN_i[5]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A198 (.Q(en_port0_o[2]), 
	.B(ports_sfr_P0EN_i[2]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A199 (.Q(en_port1_o[4]), 
	.B(ports_sfr_P1EN_i[4]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A200 (.Q(en_port2_o[0]), 
	.B(n_56), 
	.A(n_52));
   NA2I1X0 p214748365A201 (.Q(en_port1_o[3]), 
	.B(ports_sfr_P1EN_i[3]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A202 (.Q(en_port0_o[1]), 
	.B(ports_sfr_P0EN_i[1]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A203 (.Q(en_port1_o[2]), 
	.B(ports_sfr_P1EN_i[2]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A204 (.Q(en_port1_o[1]), 
	.B(ports_sfr_P1EN_i[1]), 
	.AN(ports_test_mode_i));
   INX0 Fp9999889A (.Q(n_56), 
	.A(ports_test_mode_i));
   INX0 Fp9999857A (.Q(n_55), 
	.A(ports_sfr_P2EN_i[5]));
   INX0 Fp9999857A205 (.Q(n_54), 
	.A(ports_sfr_P2EN_i[4]));
   INX0 Fp9999857A206 (.Q(n_53), 
	.A(ports_sfr_P2EN_i[2]));
   INX0 Fp9999857A207 (.Q(n_52), 
	.A(ports_sfr_P2EN_i[0]));
   INX0 Fp9999857A208 (.Q(n_51), 
	.A(ports_sfr_P2EN_i[6]));
   INX0 Fp9999857A209 (.Q(n_50), 
	.A(ports_sfr_P2EN_i[1]));
   INX0 Fp9999857A210 (.Q(n_49), 
	.A(ports_sfr_P2EN_i[3]));
   INX0 Fp9999857A211 (.Q(n_48), 
	.A(ports_sfr_P2EN_i[7]));
endmodule

module serial_outputs_logic_control (
	serial_clock_internal_i, 
	serial_reset_internal_i_b, 
	serial_br_internal_i, 
	serial_br_trans_internal_i, 
	serial_scon0_ri_o_internal_i, 
	serial_scon1_ti_o_internal_i, 
	serial_scon2_rb8_internal_i, 
	serial_data_tx_internal_i, 
	serial_scon7_sm0_internal_i, 
	serial_p3en_0_internal_i, 
	serial_p3en_1_internal_i, 
	serial_receive_internal_i, 
	serial_send_internal_i, 
	serial_data_en_internal_i, 
	serial_sbuf_rx_internal_i, 
	serial_load_sbuf_internal_i, 
	serial_p3en_0_o, 
	serial_p3en_1_o, 
	serial_p3_0_o, 
	serial_p3_1_o, 
	serial_scon0_ri_o, 
	serial_scon1_ti_o, 
	serial_scon2_rb8_o, 
	serial_data_sbuf_o, 
	serial_load_sbuf_o);
   input serial_clock_internal_i;
   input serial_reset_internal_i_b;
   input serial_br_internal_i;
   input serial_br_trans_internal_i;
   input serial_scon0_ri_o_internal_i;
   input serial_scon1_ti_o_internal_i;
   input serial_scon2_rb8_internal_i;
   input serial_data_tx_internal_i;
   input serial_scon7_sm0_internal_i;
   input serial_p3en_0_internal_i;
   input serial_p3en_1_internal_i;
   input serial_receive_internal_i;
   input serial_send_internal_i;
   input serial_data_en_internal_i;
   input [7:0] serial_sbuf_rx_internal_i;
   input serial_load_sbuf_internal_i;
   output serial_p3en_0_o;
   output serial_p3en_1_o;
   output serial_p3_0_o;
   output serial_p3_1_o;
   output serial_scon0_ri_o;
   output serial_scon1_ti_o;
   output serial_scon2_rb8_o;
   output [7:0] serial_data_sbuf_o;
   output serial_load_sbuf_o;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_3;

   assign serial_load_sbuf_o = 1'b0 ;
   assign serial_data_sbuf_o[0] = 1'b0 ;
   assign serial_data_sbuf_o[1] = 1'b0 ;
   assign serial_data_sbuf_o[2] = 1'b0 ;
   assign serial_data_sbuf_o[3] = 1'b0 ;
   assign serial_data_sbuf_o[4] = 1'b0 ;
   assign serial_data_sbuf_o[5] = 1'b0 ;
   assign serial_data_sbuf_o[6] = 1'b0 ;
   assign serial_data_sbuf_o[7] = 1'b0 ;
   assign serial_scon2_rb8_o = 1'b0 ;
   assign serial_scon1_ti_o = 1'b0 ;
   assign serial_scon0_ri_o = 1'b0 ;
   assign serial_p3en_1_o = 1'b0 ;
   assign serial_p3en_0_o = 1'b0 ;

   AO32X0 p14436A (.Q(serial_p3_1_o), 
	.E(n_3), 
	.D(n_0), 
	.C(serial_p3_0_o), 
	.B(serial_scon7_sm0_internal_i), 
	.A(serial_data_en_internal_i));
   MU2IX0 p14546A (.S(serial_br_internal_i), 
	.Q(n_3), 
	.IN1(serial_receive_internal_i), 
	.IN0(n_2));
   NO2I1X0 p21061A (.Q(n_2), 
	.B(serial_receive_internal_i), 
	.AN(serial_send_internal_i));
   AND2X0 p14320A (.Q(serial_p3_0_o), 
	.B(serial_send_internal_i), 
	.A(serial_data_tx_internal_i));
   INX0 Fp14680A (.Q(n_0), 
	.A(serial_scon7_sm0_internal_i));
endmodule

module serial_rx_control (
	serial_br_i, 
	serial_clock_i, 
	serial_reset_i_b, 
	serial_scon7_sm0_i, 
	serial_scon4_ren_i, 
	serial_scon0_ri_i, 
	serial_end_bit_i, 
	serial_data_mode2_i, 
	serial_transition_detected_i, 
	serial_clear_count_o, 
	serial_p3en_0_o, 
	serial_p3en_1_o, 
	serial_scon0_ri_o, 
	serial_receive_o, 
	serial_load_sbuf_o, 
	serial_shift_input_shift_reg_o, 
	serial_start_input_shift_reg_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo);
   input serial_br_i;
   input serial_clock_i;
   input serial_reset_i_b;
   input serial_scon7_sm0_i;
   input serial_scon4_ren_i;
   input serial_scon0_ri_i;
   input serial_end_bit_i;
   input serial_data_mode2_i;
   input serial_transition_detected_i;
   output serial_clear_count_o;
   output serial_p3en_0_o;
   output serial_p3en_1_o;
   output serial_scon0_ri_o;
   output serial_receive_o;
   output serial_load_sbuf_o;
   output serial_shift_input_shift_reg_o;
   output serial_start_input_shift_reg_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;

   // Internal wires
   wire aux2_tran_det;
   wire aux_tran_det;
   wire logic_0_1_net;
   wire n_0;
   wire n_1;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_26;
   wire n_30;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_97;
   wire \state_rx[0] ;
   wire \state_rx[1] ;
   wire \state_rx[2] ;

   SDFRX0 aux2_tran_det_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.QN(aux2_tran_det), 
	.Q(n_97), 
	.D(n_43), 
	.C(serial_clock_i));
   SDFRQX0 \state_rx_reg[0]  (.SE(DFT_sen), 
	.SD(serial_start_input_shift_reg_o), 
	.Q(\state_rx[0] ), 
	.D(n_73), 
	.C(serial_clock_i));
   SDFRQX0 \state_rx_reg[1]  (.SE(DFT_sen), 
	.SD(\state_rx[0] ), 
	.Q(\state_rx[1] ), 
	.D(n_71), 
	.C(serial_clock_i));
   SDFRQX0 \state_rx_reg[2]  (.SE(DFT_sen), 
	.SD(\state_rx[1] ), 
	.Q(\state_rx[2] ), 
	.D(n_72), 
	.C(serial_clock_i));
   SDFRQX0 \state_rx_reg[3]  (.SE(DFT_sen), 
	.SD(\state_rx[2] ), 
	.Q(DFT_sdo), 
	.D(n_69), 
	.C(serial_clock_i));
   ON211X0 p15776A (.Q(n_73), 
	.D(n_67), 
	.C(n_60), 
	.B(n_26), 
	.A(n_65));
   NA3I1X0 p15589A (.Q(n_72), 
	.C(n_70), 
	.B(n_58), 
	.AN(n_62));
   NA2X0 p15664A (.Q(n_71), 
	.B(n_70), 
	.A(n_68));
   ON21X0 p19638A (.Q(n_69), 
	.C(n_63), 
	.B(n_57), 
	.A(n_64));
   AN222X0 p19526A (.Q(n_68), 
	.F(n_75), 
	.E(n_56), 
	.D(n_77), 
	.C(n_51), 
	.B(n_40), 
	.A(n_52));
   AN31X0 p15563A (.Q(n_70), 
	.D(n_66), 
	.C(serial_scon4_ren_i), 
	.B(serial_scon7_sm0_i), 
	.A(n_59));
   AN221X0 p19598A (.Q(n_67), 
	.E(n_53), 
	.D(\state_rx[1] ), 
	.C(n_66), 
	.B(n_47), 
	.A(n_37));
   OA21X0 p19337A (.Q(n_65), 
	.C(n_49), 
	.B(n_32), 
	.A(n_64));
   AN321X0 p19637A (.Q(n_63), 
	.F(n_50), 
	.E(n_47), 
	.D(n_61), 
	.C(n_46), 
	.B(serial_transition_detected_i), 
	.A(\state_rx[1] ));
   ON22X0 p19430A (.Q(n_62), 
	.D(n_61), 
	.C(n_54), 
	.B(n_55), 
	.A(n_41));
   NA2X0 p15775A (.Q(n_60), 
	.B(n_59), 
	.A(serial_scon4_ren_i));
   AO21X0 p19530A (.Q(n_58), 
	.C(n_64), 
	.B(n_57), 
	.A(n_36));
   ON21X0 p19525A (.Q(n_56), 
	.C(n_54), 
	.B(n_55), 
	.A(n_38));
   NO2X0 p17353A (.Q(n_59), 
	.B(serial_scon0_ri_i), 
	.A(n_45));
   AO33X0 p19598A1573 (.Q(n_53), 
	.F(n_78), 
	.E(n_51), 
	.D(n_30), 
	.C(n_52), 
	.B(n_33), 
	.A(serial_end_bit_i));
   NO2I1X0 p19353A (.Q(n_64), 
	.B(n_52), 
	.AN(n_55));
   INX0 p19826A (.Q(n_50), 
	.A(n_49));
   SDFRQX0 br_detect_reg (.SE(DFT_sen), 
	.SD(aux_tran_det), 
	.Q(n_75), 
	.D(n_44), 
	.C(serial_clock_i));
   SDFRQX0 aux_tran_det_reg (.SE(DFT_sen), 
	.SD(n_97), 
	.Q(aux_tran_det), 
	.D(n_42), 
	.C(serial_clock_i));
   ON21X0 p19826A1577 (.Q(n_49), 
	.C(n_78), 
	.B(n_51), 
	.A(n_52));
   INX0 p19532A (.Q(n_54), 
	.A(n_47));
   NO2I1X0 p20003A (.Q(n_66), 
	.B(serial_transition_detected_i), 
	.AN(n_46));
   NA3X0 p19719A (.Q(n_45), 
	.C(n_30), 
	.B(n_39), 
	.A(n_51));
   NA2X0 p19352A (.Q(n_55), 
	.B(\state_rx[2] ), 
	.A(n_51));
   NO2I1X0 p19530A1578 (.Q(n_47), 
	.B(n_57), 
	.AN(n_51));
   AND3X0 p21403A (.Q(n_44), 
	.C(aux_tran_det), 
	.B(aux2_tran_det), 
	.A(serial_reset_i_b));
   AND2X0 p21512A (.Q(n_43), 
	.B(aux_tran_det), 
	.A(serial_reset_i_b));
   NO3I1X0 p19993A (.Q(n_46), 
	.C(n_30), 
	.B(n_36), 
	.AN(serial_reset_i_b));
   NO2I1X0 p19351A (.Q(n_51), 
	.B(\state_rx[1] ), 
	.AN(serial_reset_i_b));
   AND2X0 p19599A (.Q(n_52), 
	.B(serial_reset_i_b), 
	.A(n_76));
   AND2X0 p15785A (.Q(n_42), 
	.B(serial_reset_i_b), 
	.A(serial_br_i));
   AN22X0 p31795A (.Q(n_41), 
	.D(serial_end_bit_i), 
	.C(n_39), 
	.B(n_26), 
	.A(n_40));
   AN21X0 p32112A (.Q(n_38), 
	.C(n_78), 
	.B(n_34), 
	.A(n_39));
   NA2I1X0 p31794A (.Q(n_40), 
	.B(n_32), 
	.AN(n_78));
   AO21X0 p31960A (.Q(n_37), 
	.C(n_26), 
	.B(serial_data_mode2_i), 
	.A(n_30));
   INX0 p31443A (.Q(n_36), 
	.A(n_77));
   NA2X0 p32570A (.Q(n_61), 
	.B(serial_data_mode2_i), 
	.A(n_75));
   INX0 p32805A (.Q(n_34), 
	.A(serial_end_bit_i));
   INX0 p31742A (.Q(n_33), 
	.A(n_57));
   INX0 p32344A (.Q(n_32), 
	.A(n_39));
   NA2X0 p31743A (.Q(n_57), 
	.B(DFT_sdo), 
	.A(\state_rx[0] ));
   NO2X0 p32027A (.Q(n_39), 
	.B(DFT_sdo), 
	.A(\state_rx[0] ));
   INX0 p31960A1579 (.Q(n_30), 
	.A(\state_rx[2] ));
   INX0 p33383A (.Q(n_26), 
	.A(n_75));
   SDFRQX0 serial_p3en_1_o_reg (.SE(DFT_sen), 
	.SD(serial_p3en_0_o), 
	.Q(serial_p3en_1_o), 
	.D(n_23), 
	.C(serial_clock_i));
   SDFRQX0 serial_scon0_ri_o_reg (.SE(DFT_sen), 
	.SD(serial_receive_o), 
	.Q(serial_scon0_ri_o), 
	.D(n_22), 
	.C(serial_clock_i));
   SDFRQX0 serial_load_sbuf_o_reg (.SE(DFT_sen), 
	.SD(serial_clear_count_o), 
	.Q(serial_load_sbuf_o), 
	.D(n_21), 
	.C(serial_clock_i));
   SDFRQX0 serial_start_input_shift_reg_o_reg (.SE(DFT_sen), 
	.SD(serial_shift_input_shift_reg_o), 
	.Q(serial_start_input_shift_reg_o), 
	.D(n_20), 
	.C(serial_clock_i));
   SDFRQX0 serial_receive_o_reg (.SE(DFT_sen), 
	.SD(serial_p3en_1_o), 
	.Q(serial_receive_o), 
	.D(n_19), 
	.C(serial_clock_i));
   SDFRQX0 serial_shift_input_shift_reg_o_reg (.SE(DFT_sen), 
	.SD(serial_scon0_ri_o), 
	.Q(serial_shift_input_shift_reg_o), 
	.D(n_18), 
	.C(serial_clock_i));
   SDFRQX0 serial_clear_count_o_reg (.SE(DFT_sen), 
	.SD(n_75), 
	.Q(serial_clear_count_o), 
	.D(n_17), 
	.C(serial_clock_i));
   SDFRQX0 serial_p3en_0_o_reg (.SE(DFT_sen), 
	.SD(serial_load_sbuf_o), 
	.Q(serial_p3en_0_o), 
	.D(logic_0_1_net), 
	.C(serial_clock_i));
   OA31X0 p22475A (.Q(n_23), 
	.D(serial_reset_i_b), 
	.C(n_16), 
	.B(n_78), 
	.A(n_77));
   MU2X0 p16625A (.S(n_15), 
	.Q(n_22), 
	.IN1(n_14), 
	.IN0(serial_scon0_ri_i));
   NO2I1X0 p22462A (.Q(n_21), 
	.B(n_13), 
	.AN(serial_reset_i_b));
   AND2X0 p22465A (.Q(n_20), 
	.B(serial_reset_i_b), 
	.A(n_12));
   OA21X0 p22479A (.Q(n_19), 
	.C(serial_reset_i_b), 
	.B(n_76), 
	.A(n_11));
   AND3X0 p22401A (.Q(n_18), 
	.C(serial_reset_i_b), 
	.B(\state_rx[0] ), 
	.A(n_76));
   NO2I1X0 p22462A1212 (.Q(n_17), 
	.B(n_10), 
	.AN(serial_reset_i_b));
   AO221X0 p31596A (.Q(n_16), 
	.E(n_76), 
	.D(n_0), 
	.C(DFT_sdo), 
	.B(n_1), 
	.A(\state_rx[2] ));
   NA2X0 p21987A (.Q(n_15), 
	.B(serial_reset_i_b), 
	.A(n_7));
   AND2X0 p21997A (.Q(n_14), 
	.B(serial_reset_i_b), 
	.A(n_6));
   AN22X0 p32619A (.Q(n_13), 
	.D(DFT_sdo), 
	.C(n_6), 
	.B(n_77), 
	.A(n_5));
   NA2X0 p32524A (.Q(n_12), 
	.B(n_4), 
	.A(n_10));
   NO2I1X0 p32290A (.Q(n_11), 
	.B(n_77), 
	.AN(n_5));
   NA2X0 p32485A (.Q(n_10), 
	.B(n_3), 
	.A(n_78));
   NA3I1X0 p32182A (.Q(n_7), 
	.C(\state_rx[1] ), 
	.B(\state_rx[2] ), 
	.AN(\state_rx[0] ));
   INX0 Fp32193A (.Q(n_6), 
	.A(n_7));
   NO2I1X0 p32442A (.Q(n_5), 
	.B(\state_rx[1] ), 
	.AN(\state_rx[2] ));
   NA2X0 p32560A (.Q(n_4), 
	.B(n_3), 
	.A(n_77));
   NO2X0 p32662A (.Q(n_3), 
	.B(\state_rx[1] ), 
	.A(\state_rx[2] ));
   AND2X0 p31116A (.Q(n_77), 
	.B(\state_rx[0] ), 
	.A(n_1));
   NO2X0 p31611A (.Q(n_78), 
	.B(\state_rx[0] ), 
	.A(n_1));
   NO2X0 p31171A (.Q(n_76), 
	.B(\state_rx[2] ), 
	.A(n_0));
   INX0 Fp30923A1215 (.Q(n_1), 
	.A(DFT_sdo));
   INX0 Fp31026A (.Q(n_0), 
	.A(\state_rx[1] ));
   LOGIC0 tie_0_cell (.Q(logic_0_1_net));
endmodule

module serial_rx_detector (
	serial_rxd_data_i, 
	serial_br_trans_i, 
	serial_clear_count_i, 
	serial_clock_i, 
	serial_reset_i_b, 
	serial_sample_detected_o, 
	serial_transition_detected_o, 
	serial_shift_o, 
	DFT_sdi, 
	DFT_sen);
   input serial_rxd_data_i;
   input serial_br_trans_i;
   input serial_clear_count_i;
   input serial_clock_i;
   input serial_reset_i_b;
   output serial_sample_detected_o;
   output serial_transition_detected_o;
   output serial_shift_o;
   input DFT_sdi;
   input DFT_sen;

   // Internal wires
   wire aux1_bit_det;
   wire aux2_bit_det;
   wire aux2_tran_det;
   wire aux3_bit_det;
   wire aux_reset2;
   wire aux_tran_det;
   wire clear_br;
   wire \counter[0] ;
   wire \counter[1] ;
   wire \counter[2] ;
   wire \counter[3] ;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;

   SDFRQX0 \counter_reg[3]  (.SE(DFT_sen), 
	.SD(\counter[2] ), 
	.Q(\counter[3] ), 
	.D(n_32), 
	.C(serial_br_trans_i));
   SDFRQX0 clear_reg (.SE(DFT_sen), 
	.SD(clear_br), 
	.Q(n_40), 
	.D(n_31), 
	.C(serial_clock_i));
   NO2X0 p33250A (.Q(n_32), 
	.B(n_42), 
	.A(n_30));
   SDFRQX0 aux2_bit_det_reg (.SE(DFT_sen), 
	.SD(aux1_bit_det), 
	.Q(aux2_bit_det), 
	.D(n_26), 
	.C(serial_br_trans_i));
   SDFRQX0 aux1_bit_det_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(aux1_bit_det), 
	.D(n_27), 
	.C(serial_br_trans_i));
   SDFRQX0 aux3_bit_det_reg (.SE(DFT_sen), 
	.SD(aux2_tran_det), 
	.Q(aux3_bit_det), 
	.D(n_28), 
	.C(serial_br_trans_i));
   SDFRQX0 \counter_reg[2]  (.SE(DFT_sen), 
	.SD(\counter[1] ), 
	.Q(\counter[2] ), 
	.D(n_29), 
	.C(serial_br_trans_i));
   OA21X0 p22510A (.Q(n_31), 
	.C(serial_reset_i_b), 
	.B(serial_clear_count_i), 
	.A(n_25));
   EN2X0 p33134A (.Q(n_30), 
	.B(\counter[3] ), 
	.A(n_20));
   NO2X0 p33357A (.Q(n_29), 
	.B(n_21), 
	.A(n_42));
   ON32X0 p15783A (.Q(n_28), 
	.E(n_13), 
	.D(n_24), 
	.C(n_19), 
	.B(n_17), 
	.A(n_7));
   ON22X0 p15810A (.Q(n_27), 
	.D(n_16), 
	.C(n_17), 
	.B(n_24), 
	.A(n_10));
   ON22X0 p15810A840 (.Q(n_26), 
	.D(n_15), 
	.C(n_17), 
	.B(n_24), 
	.A(n_14));
   SDFRQX0 aux_reset1_reg (.SE(DFT_sen), 
	.SD(aux3_bit_det), 
	.Q(n_41), 
	.D(n_22), 
	.C(serial_clock_i));
   SDFRQX0 \counter_reg[1]  (.SE(DFT_sen), 
	.SD(\counter[0] ), 
	.Q(\counter[1] ), 
	.D(n_23), 
	.C(serial_br_trans_i));
   NO2I1X0 p32979A (.Q(n_25), 
	.B(clear_br), 
	.AN(n_40));
   SDFRQX0 clear_br_reg (.SE(DFT_sen), 
	.SD(aux_tran_det), 
	.Q(clear_br), 
	.D(n_18), 
	.C(serial_br_trans_i));
   NA2I1X0 p15598A (.Q(n_24), 
	.B(serial_rxd_data_i), 
	.AN(n_17));
   NO2X0 p33356A (.Q(n_23), 
	.B(n_19), 
	.A(n_42));
   MU2X0 p22158A (.S(n_11), 
	.Q(n_22), 
	.IN1(n_41), 
	.IN0(n_39));
   EO2X0 p33108A (.Q(n_21), 
	.B(\counter[2] ), 
	.A(n_13));
   SDFRQX0 \counter_reg[0]  (.SE(DFT_sen), 
	.SD(n_40), 
	.Q(\counter[0] ), 
	.D(n_9), 
	.C(serial_br_trans_i));
   NO2I1X0 p32907A (.Q(n_20), 
	.B(n_13), 
	.AN(\counter[2] ));
   AND2X0 p32880A (.Q(n_19), 
	.B(n_10), 
	.A(n_14));
   NO3I1X0 p33046A (.Q(n_18), 
	.C(n_41), 
	.B(n_8), 
	.AN(n_40));
   NA3I1X0 p32501A (.Q(n_17), 
	.C(\counter[2] ), 
	.B(n_12), 
	.AN(n_40));
   SDFRQX0 aux_reset2_reg (.SE(DFT_sen), 
	.SD(n_41), 
	.Q(aux_reset2), 
	.D(n_41), 
	.C(serial_br_trans_i));
   NA2X0 p33285A (.Q(n_16), 
	.B(\counter[1] ), 
	.A(aux1_bit_det));
   NA2X0 p33272A (.Q(n_15), 
	.B(\counter[0] ), 
	.A(aux2_bit_det));
   NA2I1X0 p32605A (.Q(n_14), 
	.B(\counter[1] ), 
	.AN(\counter[0] ));
   NA2X0 p32695A (.Q(n_13), 
	.B(\counter[1] ), 
	.A(\counter[0] ));
   NO2X0 p32474A (.Q(n_12), 
	.B(n_41), 
	.A(\counter[3] ));
   NO2I1X0 p21999A (.Q(n_11), 
	.B(aux_reset2), 
	.AN(serial_reset_i_b));
   NA2I1X0 p32586A (.Q(n_10), 
	.B(\counter[0] ), 
	.AN(\counter[1] ));
   NO2X0 p33355A (.Q(n_9), 
	.B(\counter[0] ), 
	.A(n_42));
   INX0 Fp33063A (.Q(n_8), 
	.A(n_42));
   INX0 Fp12879A (.Q(n_7), 
	.A(aux3_bit_det));
   SDFRQX0 serial_transition_detected_o_reg (.SE(DFT_sen), 
	.SD(serial_shift_o), 
	.Q(serial_transition_detected_o), 
	.D(n_6), 
	.C(serial_clock_i));
   SDFRQX0 serial_sample_detected_o_reg (.SE(DFT_sen), 
	.SD(\counter[3] ), 
	.Q(serial_sample_detected_o), 
	.D(n_5), 
	.C(serial_br_trans_i));
   SDFRQX0 aux2_tran_det_reg (.SE(DFT_sen), 
	.SD(aux2_bit_det), 
	.Q(aux2_tran_det), 
	.D(n_4), 
	.C(serial_clock_i));
   SDFRQX0 serial_shift_o_reg (.SE(DFT_sen), 
	.SD(serial_sample_detected_o), 
	.Q(serial_shift_o), 
	.D(n_3), 
	.C(serial_br_trans_i));
   SDFRQX0 aux_tran_det_reg (.SE(DFT_sen), 
	.SD(aux_reset2), 
	.Q(aux_tran_det), 
	.D(n_2), 
	.C(serial_clock_i));
   NO3I1X0 p22609A (.Q(n_6), 
	.C(aux_tran_det), 
	.B(n_39), 
	.AN(aux2_tran_det));
   AN21X0 p32889A (.Q(n_5), 
	.C(n_41), 
	.B(n_0), 
	.A(n_1));
   NO2I1X0 p22647A (.Q(n_4), 
	.B(n_39), 
	.AN(aux_tran_det));
   NO5I3X0 p32760A (.Q(n_3), 
	.E(\counter[3] ), 
	.D(n_42), 
	.CN(\counter[0] ), 
	.BN(\counter[2] ), 
	.AN(\counter[1] ));
   AND2X0 p16004A (.Q(n_2), 
	.B(serial_reset_i_b), 
	.A(serial_rxd_data_i));
   ON21X0 p33070A (.Q(n_1), 
	.C(aux1_bit_det), 
	.B(aux3_bit_det), 
	.A(aux2_bit_det));
   NA2X0 p33149A (.Q(n_0), 
	.B(aux3_bit_det), 
	.A(aux2_bit_det));
   OR2X0 p32475A (.Q(n_42), 
	.B(n_41), 
	.A(n_40));
   INX0 Fp22583A (.Q(n_39), 
	.A(serial_reset_i_b));
endmodule

module serial_rx_input_shifter_reg (
	serial_clock_i, 
	serial_reset_i_b, 
	serial_load_sbuf_i, 
	serial_data_i, 
	serial_scon7_sm0_i, 
	serial_start_input_shift_reg_i, 
	serial_shift_input_shift_reg_i, 
	serial_receive_i, 
	serial_sbuf_rx_o, 
	serial_end_bit_o, 
	serial_scon2_rb8_o, 
	DFT_sdi, 
	DFT_sen, 
	SPCASCAN_N3, 
	p3en_0_temp2);
   input serial_clock_i;
   input serial_reset_i_b;
   input serial_load_sbuf_i;
   input serial_data_i;
   input serial_scon7_sm0_i;
   input serial_start_input_shift_reg_i;
   input serial_shift_input_shift_reg_i;
   input serial_receive_i;
   output [7:0] serial_sbuf_rx_o;
   output serial_end_bit_o;
   output serial_scon2_rb8_o;
   input DFT_sdi;
   input DFT_sen;
   output SPCASCAN_N3;
   input p3en_0_temp2;

   // Internal wires
   wire \data_received[0] ;
   wire \data_received[1] ;
   wire \data_received[2] ;
   wire \data_received[3] ;
   wire \data_received[4] ;
   wire \data_received[5] ;
   wire \data_received[6] ;
   wire \data_received[7] ;
   wire \data_received[8] ;
   wire \data_received[9] ;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_35;
   wire n_37;
   wire n_40;
   wire n_41;

   SDFRQX0 \data_received_reg[2]  (.SE(DFT_sen), 
	.SD(\data_received[1] ), 
	.Q(SPCASCAN_N3), 
	.D(n_29), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[6]  (.SE(DFT_sen), 
	.SD(\data_received[5] ), 
	.Q(\data_received[6] ), 
	.D(n_25), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[7]  (.SE(DFT_sen), 
	.SD(\data_received[6] ), 
	.Q(\data_received[7] ), 
	.D(n_32), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[8]  (.SE(DFT_sen), 
	.SD(\data_received[7] ), 
	.Q(\data_received[8] ), 
	.D(n_31), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[9]  (.SE(DFT_sen), 
	.SD(\data_received[8] ), 
	.Q(\data_received[9] ), 
	.D(n_30), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[3]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[4]), 
	.Q(\data_received[3] ), 
	.D(n_28), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[4]  (.SE(DFT_sen), 
	.SD(\data_received[3] ), 
	.Q(\data_received[4] ), 
	.D(n_27), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[5]  (.SE(DFT_sen), 
	.SD(\data_received[4] ), 
	.Q(\data_received[5] ), 
	.D(n_26), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(\data_received[0] ), 
	.D(n_24), 
	.C(serial_clock_i));
   SDFRQX0 \data_received_reg[1]  (.SE(DFT_sen), 
	.SD(\data_received[0] ), 
	.Q(\data_received[1] ), 
	.D(n_21), 
	.C(serial_clock_i));
   AO221X0 p14870A (.Q(n_32), 
	.E(n_22), 
	.D(\data_received[7] ), 
	.C(n_19), 
	.B(\data_received[6] ), 
	.A(n_18));
   AO221X0 p14870A781 (.Q(n_31), 
	.E(n_22), 
	.D(\data_received[8] ), 
	.C(n_19), 
	.B(\data_received[7] ), 
	.A(n_18));
   AO221X0 p14870A782 (.Q(n_30), 
	.E(n_22), 
	.D(\data_received[9] ), 
	.C(n_19), 
	.B(\data_received[8] ), 
	.A(n_18));
   AO221X0 p14870A783 (.Q(n_29), 
	.E(n_22), 
	.D(SPCASCAN_N3), 
	.C(n_19), 
	.B(\data_received[1] ), 
	.A(n_18));
   AO221X0 p14870A784 (.Q(n_28), 
	.E(n_22), 
	.D(\data_received[3] ), 
	.C(n_19), 
	.B(SPCASCAN_N3), 
	.A(n_18));
   AO221X0 p14870A785 (.Q(n_27), 
	.E(n_22), 
	.D(\data_received[4] ), 
	.C(n_19), 
	.B(\data_received[3] ), 
	.A(n_18));
   AO221X0 p14870A786 (.Q(n_26), 
	.E(n_22), 
	.D(\data_received[5] ), 
	.C(n_19), 
	.B(\data_received[4] ), 
	.A(n_18));
   AO221X0 p14870A787 (.Q(n_25), 
	.E(n_22), 
	.D(\data_received[6] ), 
	.C(n_19), 
	.B(\data_received[5] ), 
	.A(n_18));
   ON21X0 p15414A (.Q(n_24), 
	.C(n_23), 
	.B(n_15), 
	.A(n_20));
   INX0 Fp14822A (.Q(n_23), 
	.A(n_22));
   OA21X0 p14255A (.Q(n_22), 
	.C(serial_start_input_shift_reg_i), 
	.B(n_12), 
	.A(n_17));
   AO22X0 p21644A (.Q(n_21), 
	.D(n_19), 
	.C(\data_received[1] ), 
	.B(n_18), 
	.A(\data_received[0] ));
   SDFRQX0 serial_scon2_rb8_o_reg (.SE(DFT_sen), 
	.SD(p3en_0_temp2), 
	.Q(serial_scon2_rb8_o), 
	.D(n_16), 
	.C(serial_clock_i));
   AN32X0 p15308A (.Q(n_20), 
	.E(\data_received[0] ), 
	.D(n_13), 
	.C(serial_data_i), 
	.B(n_11), 
	.A(serial_receive_i));
   NO2I1X0 p21331A (.Q(n_19), 
	.B(n_15), 
	.AN(n_14));
   NO2X0 p21213A (.Q(n_18), 
	.B(n_14), 
	.A(n_15));
   AN21X0 p14278A (.Q(n_17), 
	.C(n_35), 
	.B(serial_reset_i_b), 
	.A(serial_scon7_sm0_i));
   AO22X0 p15534A (.Q(n_16), 
	.D(n_41), 
	.C(\data_received[1] ), 
	.B(serial_scon2_rb8_o), 
	.A(n_40));
   NA2I1X0 p21041A (.Q(n_15), 
	.B(serial_reset_i_b), 
	.AN(serial_start_input_shift_reg_i));
   NA2X0 p46474A (.Q(n_14), 
	.B(serial_shift_input_shift_reg_i), 
	.A(serial_receive_i));
   INX0 Fp46492A (.Q(n_13), 
	.A(serial_receive_i));
   INX0 Fp14276A (.Q(n_12), 
	.A(n_37));
   INX0 Fp46487A (.Q(n_11), 
	.A(serial_shift_input_shift_reg_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[7]  (.SE(DFT_sen), 
	.SD(serial_scon2_rb8_o), 
	.Q(serial_sbuf_rx_o[7]), 
	.D(n_10), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[6]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[1]), 
	.Q(serial_sbuf_rx_o[6]), 
	.D(n_9), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[4]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[3]), 
	.Q(serial_sbuf_rx_o[4]), 
	.D(n_8), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[0]  (.SE(DFT_sen), 
	.SD(serial_end_bit_o), 
	.Q(serial_sbuf_rx_o[0]), 
	.D(n_7), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[3]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[2]), 
	.Q(serial_sbuf_rx_o[3]), 
	.D(n_6), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[5]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[6]), 
	.Q(serial_sbuf_rx_o[5]), 
	.D(n_5), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[2]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[5]), 
	.Q(serial_sbuf_rx_o[2]), 
	.D(n_4), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[1]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[7]), 
	.Q(serial_sbuf_rx_o[1]), 
	.D(n_3), 
	.C(serial_clock_i));
   SDFRQX0 serial_end_bit_o_reg (.SE(DFT_sen), 
	.SD(\data_received[9] ), 
	.Q(serial_end_bit_o), 
	.D(n_2), 
	.C(serial_clock_i));
   AO22X0 p15498A715 (.Q(n_10), 
	.D(n_41), 
	.C(\data_received[9] ), 
	.B(n_40), 
	.A(\data_received[8] ));
   AO22X0 p15498A714 (.Q(n_9), 
	.D(n_41), 
	.C(\data_received[8] ), 
	.B(n_40), 
	.A(\data_received[7] ));
   AO22X0 p15498A712 (.Q(n_8), 
	.D(n_41), 
	.C(\data_received[6] ), 
	.B(n_40), 
	.A(\data_received[5] ));
   AO22X0 p15498A (.Q(n_7), 
	.D(n_41), 
	.C(SPCASCAN_N3), 
	.B(n_40), 
	.A(\data_received[1] ));
   AO22X0 p15498A711 (.Q(n_6), 
	.D(n_41), 
	.C(\data_received[5] ), 
	.B(n_40), 
	.A(\data_received[4] ));
   AO22X0 p15498A713 (.Q(n_5), 
	.D(n_41), 
	.C(\data_received[7] ), 
	.B(n_40), 
	.A(\data_received[6] ));
   AO22X0 p15498A710 (.Q(n_4), 
	.D(n_41), 
	.C(\data_received[4] ), 
	.B(n_40), 
	.A(\data_received[3] ));
   AO22X0 p15498A709 (.Q(n_3), 
	.D(n_41), 
	.C(\data_received[3] ), 
	.B(n_40), 
	.A(SPCASCAN_N3));
   AND2X0 p15684A (.Q(n_2), 
	.B(serial_reset_i_b), 
	.A(n_1));
   MU2IX0 p15771A (.S(serial_scon7_sm0_i), 
	.Q(n_1), 
	.IN1(\data_received[9] ), 
	.IN0(\data_received[8] ));
   NO2I1X0 p15070A (.Q(n_41), 
	.B(n_0), 
	.AN(serial_scon7_sm0_i));
   NO2X0 p15079A (.Q(n_40), 
	.B(n_0), 
	.A(serial_scon7_sm0_i));
   NA2X0 p21428A (.Q(n_0), 
	.B(serial_load_sbuf_i), 
	.A(serial_reset_i_b));
   NA2X0 p14211A (.Q(n_37), 
	.B(serial_reset_i_b), 
	.A(serial_scon7_sm0_i));
   NA2I1X0 p14155A (.Q(n_35), 
	.B(serial_reset_i_b), 
	.AN(serial_scon7_sm0_i));
endmodule

module serial_rx (
	serial_clock_i, 
	serial_reset_i_b, 
	serial_br_i, 
	serial_br_trans_i, 
	serial_rxd_data_i, 
	serial_scon7_sm0_i, 
	serial_scon4_ren_i, 
	serial_scon0_ri_i, 
	serial_data_mode0_i, 
	serial_p3en_0_o, 
	serial_p3en_1_o, 
	serial_scon0_ri_o, 
	serial_scon2_rb8_o, 
	serial_sbuf_rx_o, 
	serial_receive_o, 
	serial_load_sbuf_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	SPCASCAN_N3, 
	p3en_0_temp2);
   input serial_clock_i;
   input serial_reset_i_b;
   input serial_br_i;
   input serial_br_trans_i;
   input serial_rxd_data_i;
   input serial_scon7_sm0_i;
   input serial_scon4_ren_i;
   input serial_scon0_ri_i;
   input serial_data_mode0_i;
   output serial_p3en_0_o;
   output serial_p3en_1_o;
   output serial_scon0_ri_o;
   output serial_scon2_rb8_o;
   output [7:0] serial_sbuf_rx_o;
   output serial_receive_o;
   output serial_load_sbuf_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output SPCASCAN_N3;
   input p3en_0_temp2;

   // Internal wires
   wire CLEAR_COUNT;
   wire DATA_MODE2;
   wire END_BIT;
   wire SERIAL_SHIFT;
   wire SHIFT_BR;
   wire SHIFT_INPUT_SHIFT_REG;
   wire START_INPUT_SHIFT_REG;
   wire data_mode;
   wire n_22;

   serial_rx_control serial_rx_control (.serial_br_i(SHIFT_BR), 
	.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_scon4_ren_i(serial_scon4_ren_i), 
	.serial_scon0_ri_i(serial_scon0_ri_i), 
	.serial_end_bit_i(END_BIT), 
	.serial_data_mode2_i(DATA_MODE2), 
	.serial_transition_detected_i(DFT_sdo), 
	.serial_clear_count_o(CLEAR_COUNT), 
	.serial_p3en_0_o(serial_p3en_0_o), 
	.serial_p3en_1_o(serial_p3en_1_o), 
	.serial_scon0_ri_o(serial_scon0_ri_o), 
	.serial_receive_o(serial_receive_o), 
	.serial_load_sbuf_o(serial_load_sbuf_o), 
	.serial_shift_input_shift_reg_o(SHIFT_INPUT_SHIFT_REG), 
	.serial_start_input_shift_reg_o(START_INPUT_SHIFT_REG), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(n_22));
   serial_rx_detector serial_rx_detector (.serial_rxd_data_i(serial_data_mode0_i), 
	.serial_br_trans_i(serial_br_trans_i), 
	.serial_clear_count_i(CLEAR_COUNT), 
	.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_sample_detected_o(DATA_MODE2), 
	.serial_transition_detected_o(DFT_sdo), 
	.serial_shift_o(SERIAL_SHIFT), 
	.DFT_sdi(n_22), 
	.DFT_sen(DFT_sen));
   serial_rx_input_shifter_reg serial_rx_input_shifter_reg (.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_load_sbuf_i(serial_load_sbuf_o), 
	.serial_data_i(data_mode), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_start_input_shift_reg_i(START_INPUT_SHIFT_REG), 
	.serial_shift_input_shift_reg_i(SHIFT_INPUT_SHIFT_REG), 
	.serial_receive_i(serial_receive_o), 
	.serial_sbuf_rx_o({ serial_sbuf_rx_o[7],
		serial_sbuf_rx_o[6],
		serial_sbuf_rx_o[5],
		serial_sbuf_rx_o[4],
		serial_sbuf_rx_o[3],
		serial_sbuf_rx_o[2],
		serial_sbuf_rx_o[1],
		serial_sbuf_rx_o[0] }), 
	.serial_end_bit_o(END_BIT), 
	.serial_scon2_rb8_o(serial_scon2_rb8_o), 
	.DFT_sdi(DFT_sdi_1), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.p3en_0_temp2(p3en_0_temp2));
   MU2X0 p15116A (.S(serial_scon7_sm0_i), 
	.Q(data_mode), 
	.IN1(DATA_MODE2), 
	.IN0(serial_data_mode0_i));
   MU2X0 p15501A (.S(serial_scon7_sm0_i), 
	.Q(SHIFT_BR), 
	.IN1(SERIAL_SHIFT), 
	.IN0(serial_br_i));
endmodule

module serial_tx_control (
	serial_br_i, 
	serial_clock_i, 
	serial_reset_i_b, 
	serial_scon7_sm0_i, 
	serial_scon1_ti_i, 
	serial_end_bit_i, 
	serial_serial_tx_i, 
	serial_p3en_0_o, 
	serial_p3en_1_o, 
	serial_data_en_o, 
	serial_send_o, 
	serial_scon1_ti_o, 
	serial_shift_o, 
	serial_stop_bit_gen_o, 
	serial_start_shifter_reg_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	SPCASCAN_N4, 
	FE_PT1_top_p0_y_i_3_);
   input serial_br_i;
   input serial_clock_i;
   input serial_reset_i_b;
   input serial_scon7_sm0_i;
   input serial_scon1_ti_i;
   input serial_end_bit_i;
   input serial_serial_tx_i;
   output serial_p3en_0_o;
   output serial_p3en_1_o;
   output serial_data_en_o;
   output serial_send_o;
   output serial_scon1_ti_o;
   output serial_shift_o;
   output serial_stop_bit_gen_o;
   output serial_start_shifter_reg_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input SPCASCAN_N4;
   input FE_PT1_top_p0_y_i_3_;

   // Internal wires
   wire aux1_ti_o;
   wire aux2_ti_o;
   wire aux2_tran_det;
   wire aux_tran_det;
   wire br_detect1;
   wire do_first_shift_flag;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_25;
   wire n_27;
   wire n_29;
   wire n_32;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_63;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_69;
   wire n_70;
   wire n_73;
   wire n_84;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_95;
   wire \state_tx[0] ;
   wire \state_tx[1] ;
   wire \state_tx[2] ;

   SDFRX0 aux2_tran_det_reg (.SE(DFT_sen), 
	.SD(do_first_shift_flag), 
	.QN(aux2_tran_det), 
	.Q(n_95), 
	.D(n_36), 
	.C(serial_clock_i));
   SDFRQX0 \state_tx_reg[0]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_3_), 
	.Q(\state_tx[0] ), 
	.D(n_61), 
	.C(serial_clock_i));
   SDFRQX0 \state_tx_reg[1]  (.SE(DFT_sen), 
	.SD(\state_tx[0] ), 
	.Q(\state_tx[1] ), 
	.D(n_60), 
	.C(serial_clock_i));
   AND2X0 p15332A (.Q(n_61), 
	.B(n_59), 
	.A(n_54));
   SDFRQX0 \state_tx_reg[2]  (.SE(DFT_sen), 
	.SD(\state_tx[1] ), 
	.Q(\state_tx[2] ), 
	.D(n_55), 
	.C(serial_clock_i));
   AN211X0 p20453A (.Q(n_60), 
	.D(n_57), 
	.C(n_49), 
	.B(n_27), 
	.A(n_58));
   AN211X0 p15332A1992 (.Q(n_59), 
	.D(n_56), 
	.C(n_84), 
	.B(n_63), 
	.A(n_58));
   SDFRQX0 \state_tx_reg[3]  (.SE(DFT_sen), 
	.SD(serial_stop_bit_gen_o), 
	.Q(DFT_sdo), 
	.D(n_53), 
	.C(serial_clock_i));
   ON311X0 p20555A (.Q(n_57), 
	.E(n_52), 
	.D(n_67), 
	.C(n_87), 
	.B(n_23), 
	.A(serial_end_bit_i));
   ON211X0 p19955A (.Q(n_56), 
	.D(n_51), 
	.C(n_67), 
	.B(n_63), 
	.A(n_46));
   ON211X0 p16014A (.Q(n_55), 
	.D(n_50), 
	.C(n_47), 
	.B(n_90), 
	.A(n_54));
   INX0 p21327A (.Q(n_53), 
	.A(n_52));
   NA2X0 p20834A (.Q(n_52), 
	.B(serial_reset_i_b), 
	.A(n_45));
   SDFRQX0 do_first_shift_flag_reg (.SE(DFT_sen), 
	.SD(n_63), 
	.Q(do_first_shift_flag), 
	.D(n_40), 
	.C(serial_clock_i));
   SDFRQX0 br_detect1_reg (.SE(DFT_sen), 
	.SD(DFT_sdo), 
	.Q(br_detect1), 
	.D(n_39), 
	.C(serial_clock_i));
   AN21X0 p20509A (.Q(n_51), 
	.C(n_43), 
	.B(serial_reset_i_b), 
	.A(n_44));
   AN31X0 p20515A (.Q(n_50), 
	.D(n_48), 
	.C(n_38), 
	.B(serial_reset_i_b), 
	.A(n_63));
   NA3I2X0 p20454A (.Q(n_49), 
	.C(n_92), 
	.BN(n_69), 
	.AN(n_48));
   NO2I1X0 p20239A (.Q(n_47), 
	.B(n_58), 
	.AN(n_46));
   AO221X0 p30654A (.Q(n_45), 
	.E(n_44), 
	.D(n_86), 
	.C(n_29), 
	.B(n_37), 
	.A(n_27));
   ON221X0 p31063A (.Q(n_43), 
	.E(n_92), 
	.D(n_87), 
	.C(br_detect1), 
	.B(n_88), 
	.A(n_41));
   NO2X0 p20454A1996 (.Q(n_48), 
	.B(n_73), 
	.A(n_42));
   NO2X0 p20290A (.Q(n_58), 
	.B(n_41), 
	.A(n_42));
   NA3I2X0 p19958A (.Q(n_46), 
	.C(\state_tx[1] ), 
	.BN(\state_tx[0] ), 
	.AN(n_42));
   SDFRQX0 aux_tran_det_reg (.SE(DFT_sen), 
	.SD(n_95), 
	.Q(aux_tran_det), 
	.D(n_35), 
	.C(serial_clock_i));
   SDFRQX0 br_detect_reg (.SE(DFT_sen), 
	.SD(br_detect1), 
	.Q(n_63), 
	.D(n_34), 
	.C(serial_clock_i));
   AO22X0 p30654A1999 (.Q(n_44), 
	.D(do_first_shift_flag), 
	.C(n_86), 
	.B(n_27), 
	.A(n_91));
   AN211X0 p21354A (.Q(n_40), 
	.D(n_89), 
	.C(n_32), 
	.B(\state_tx[0] ), 
	.A(n_25));
   ON32X0 p21146A (.Q(n_39), 
	.E(n_23), 
	.D(serial_reset_i_b), 
	.C(n_32), 
	.B(aux2_tran_det), 
	.A(aux_tran_det));
   OR2X0 p31959A (.Q(n_38), 
	.B(n_37), 
	.A(n_91));
   NA2X0 p16013A (.Q(n_54), 
	.B(serial_scon7_sm0_i), 
	.A(n_69));
   NA2I1X0 p19956A (.Q(n_42), 
	.B(serial_reset_i_b), 
	.AN(n_70));
   NO2I1X0 p21546A (.Q(n_36), 
	.B(n_32), 
	.AN(aux_tran_det));
   NO2I1X0 p21546A2000 (.Q(n_35), 
	.B(n_32), 
	.AN(serial_br_i));
   AND3X0 p21403A (.Q(n_34), 
	.C(aux_tran_det), 
	.B(aux2_tran_det), 
	.A(serial_reset_i_b));
   INX0 p21146A2001 (.Q(n_32), 
	.A(serial_reset_i_b));
   NO3I1X0 p31481A (.Q(n_37), 
	.C(\state_tx[2] ), 
	.B(n_41), 
	.AN(DFT_sdo));
   INX0 p32476A (.Q(n_29), 
	.A(serial_end_bit_i));
   NA2I1X0 p31478A (.Q(n_41), 
	.B(\state_tx[0] ), 
	.AN(\state_tx[1] ));
   INX0 p31368A (.Q(n_27), 
	.A(n_63));
   INX0 p33378A (.Q(n_25), 
	.A(do_first_shift_flag));
   INX0 p32822A (.Q(n_23), 
	.A(br_detect1));
   SDFRQX0 serial_scon1_ti_o_reg (.SE(DFT_sen), 
	.SD(serial_send_o), 
	.Q(serial_scon1_ti_o), 
	.D(n_22), 
	.C(serial_clock_i));
   SDFRQX0 aux2_ti_o_reg (.SE(DFT_sen), 
	.SD(aux_tran_det), 
	.Q(aux2_ti_o), 
	.D(n_21), 
	.C(serial_clock_i));
   SDFRQX0 aux1_ti_o_reg (.SE(DFT_sen), 
	.SD(aux2_ti_o), 
	.Q(aux1_ti_o), 
	.D(n_20), 
	.C(serial_clock_i));
   SDFRQX0 serial_send_o_reg (.SE(DFT_sen), 
	.SD(serial_data_en_o), 
	.Q(serial_send_o), 
	.D(n_19), 
	.C(serial_clock_i));
   SDFRQX0 serial_p3en_1_o_reg (.SE(DFT_sen), 
	.SD(serial_scon1_ti_o), 
	.Q(serial_p3en_1_o), 
	.D(n_18), 
	.C(serial_clock_i));
   SDFRQX0 serial_p3en_0_o_reg (.SE(DFT_sen), 
	.SD(serial_p3en_1_o), 
	.Q(serial_p3en_0_o), 
	.D(n_17), 
	.C(serial_clock_i));
   SDFRQX0 serial_start_shifter_reg_o_reg (.SE(DFT_sen), 
	.SD(SPCASCAN_N4), 
	.Q(serial_start_shifter_reg_o), 
	.D(n_16), 
	.C(serial_clock_i));
   SDFRQX0 serial_shift_o_reg (.SE(DFT_sen), 
	.SD(aux1_ti_o), 
	.Q(serial_shift_o), 
	.D(n_15), 
	.C(serial_clock_i));
   SDFRQX0 serial_stop_bit_gen_o_reg (.SE(DFT_sen), 
	.SD(\state_tx[2] ), 
	.Q(serial_stop_bit_gen_o), 
	.D(n_14), 
	.C(serial_clock_i));
   SDFRQX0 serial_data_en_o_reg (.SE(DFT_sen), 
	.SD(serial_start_shifter_reg_o), 
	.Q(serial_data_en_o), 
	.D(n_13), 
	.C(serial_clock_i));
   AO32X0 p16492A (.Q(n_22), 
	.E(serial_scon1_ti_i), 
	.D(n_10), 
	.C(serial_reset_i_b), 
	.B(n_11), 
	.A(n_12));
   AND2X0 p22536A (.Q(n_21), 
	.B(aux1_ti_o), 
	.A(serial_reset_i_b));
   AND3X0 p22411A (.Q(n_20), 
	.C(serial_reset_i_b), 
	.B(\state_tx[0] ), 
	.A(n_9));
   OA21X0 p22516A (.Q(n_19), 
	.C(serial_reset_i_b), 
	.B(n_7), 
	.A(n_8));
   NO2I1X0 p16657A (.Q(n_18), 
	.B(n_84), 
	.AN(n_67));
   AN221X0 p15823A (.Q(n_17), 
	.E(n_66), 
	.D(serial_scon7_sm0_i), 
	.C(n_5), 
	.B(n_6), 
	.A(n_90));
   NO3I1X0 p22460A (.Q(n_16), 
	.C(n_73), 
	.B(n_70), 
	.AN(serial_reset_i_b));
   AND3X0 p22436A (.Q(n_15), 
	.C(serial_reset_i_b), 
	.B(\state_tx[0] ), 
	.A(n_4));
   AND2X0 p22499A (.Q(n_14), 
	.B(serial_reset_i_b), 
	.A(n_91));
   AND2X0 p22499A1986 (.Q(n_13), 
	.B(serial_reset_i_b), 
	.A(n_8));
   NO2I1X0 p46553A (.Q(n_12), 
	.B(aux1_ti_o), 
	.AN(aux2_ti_o));
   NA2I1X0 p21720A (.Q(n_11), 
	.B(serial_reset_i_b), 
	.AN(n_12));
   INX0 Fp21839A (.Q(n_10), 
	.A(n_11));
   NA2X0 p32016A (.Q(n_9), 
	.B(n_92), 
	.A(n_3));
   NA2X0 p32065A (.Q(n_8), 
	.B(n_2), 
	.A(n_89));
   NO2X0 p32276A (.Q(n_7), 
	.B(DFT_sdo), 
	.A(n_5));
   INX0 Fp30583A (.Q(n_6), 
	.A(n_73));
   EN2X0 p32246A (.Q(n_5), 
	.B(\state_tx[1] ), 
	.A(\state_tx[0] ));
   ON21X0 p32331A (.Q(n_4), 
	.C(n_89), 
	.B(\state_tx[1] ), 
	.A(n_88));
   NA2X0 p31975A (.Q(n_3), 
	.B(serial_end_bit_i), 
	.A(n_1));
   NA2X0 p31867A (.Q(n_2), 
	.B(DFT_sdo), 
	.A(n_65));
   ON21X0 p31933A (.Q(n_1), 
	.C(n_2), 
	.B(do_first_shift_flag), 
	.A(n_89));
   AND2X0 p15845A (.Q(n_84), 
	.B(n_90), 
	.A(n_69));
   NO2X0 p21474A (.Q(n_69), 
	.B(n_73), 
	.A(n_66));
   NO3I1X0 p30691A (.Q(n_91), 
	.C(\state_tx[2] ), 
	.B(n_73), 
	.AN(DFT_sdo));
   NA2I1X0 p30866A (.Q(n_92), 
	.B(\state_tx[0] ), 
	.AN(n_87));
   NO2I1X0 p30510A (.Q(n_86), 
	.B(n_89), 
	.AN(\state_tx[0] ));
   OA21X0 p21527A (.Q(n_67), 
	.C(serial_reset_i_b), 
	.B(n_0), 
	.A(n_65));
   NA2I1X0 p30107A (.Q(n_89), 
	.B(\state_tx[1] ), 
	.AN(n_70));
   NA2I1X0 p30591A (.Q(n_87), 
	.B(\state_tx[1] ), 
	.AN(n_88));
   NA2I1X0 p21374A (.Q(n_66), 
	.B(serial_reset_i_b), 
	.AN(n_88));
   NO2X0 p31703A (.Q(n_65), 
	.B(\state_tx[1] ), 
	.A(\state_tx[2] ));
   NA2I1X0 p15590A (.Q(n_90), 
	.B(serial_serial_tx_i), 
	.AN(serial_scon1_ti_i));
   OR2X0 p30407A (.Q(n_73), 
	.B(\state_tx[0] ), 
	.A(\state_tx[1] ));
   NA2X0 p29997A (.Q(n_70), 
	.B(\state_tx[2] ), 
	.A(n_0));
   OR2X0 p30433A (.Q(n_88), 
	.B(\state_tx[2] ), 
	.A(DFT_sdo));
   INX0 Fp29794A1987 (.Q(n_0), 
	.A(DFT_sdo));
endmodule

module serial_tx_output_shifter_reg (
	serial_clock_i, 
	serial_reset_i_b, 
	serial_data_sbuf_i, 
	serial_start_shifter_reg_i, 
	serial_shift_i, 
	serial_stop_bit_gen_i, 
	serial_scon3_tb8_i, 
	serial_scon7_sm0_i, 
	serial_data_tx_o, 
	serial_end_bit_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	SPCASCAN_N3, 
	SPCASCAN_N4);
   input serial_clock_i;
   input serial_reset_i_b;
   input [7:0] serial_data_sbuf_i;
   input serial_start_shifter_reg_i;
   input serial_shift_i;
   input serial_stop_bit_gen_i;
   input serial_scon3_tb8_i;
   input serial_scon7_sm0_i;
   output serial_data_tx_o;
   output serial_end_bit_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   input SPCASCAN_N3;
   output SPCASCAN_N4;

   // Internal wires
   wire \data_to_transmit[0] ;
   wire \data_to_transmit[2] ;
   wire \data_to_transmit[3] ;
   wire \data_to_transmit[4] ;
   wire \data_to_transmit[5] ;
   wire \data_to_transmit[6] ;
   wire \data_to_transmit[7] ;
   wire \data_to_transmit[8] ;
   wire \data_to_transmit[9] ;
   wire flag_end_bit;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_46;
   wire n_50;
   wire n_52;

   SDFRQX0 \data_to_transmit_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(SPCASCAN_N4), 
	.D(n_29), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[1]  (.SE(DFT_sen), 
	.SD(SPCASCAN_N3), 
	.Q(DFT_sdo), 
	.D(n_36), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[2]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(\data_to_transmit[2] ), 
	.D(n_32), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[3]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[2] ), 
	.Q(\data_to_transmit[3] ), 
	.D(n_30), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[4]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[3] ), 
	.Q(\data_to_transmit[4] ), 
	.D(n_37), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[5]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[4] ), 
	.Q(\data_to_transmit[5] ), 
	.D(n_35), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[6]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[5] ), 
	.Q(\data_to_transmit[6] ), 
	.D(n_34), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[7]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[6] ), 
	.Q(\data_to_transmit[7] ), 
	.D(n_33), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[8]  (.SE(DFT_sen), 
	.SD(flag_end_bit), 
	.Q(\data_to_transmit[8] ), 
	.D(n_31), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[9]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[8] ), 
	.Q(\data_to_transmit[9] ), 
	.D(n_28), 
	.C(serial_clock_i));
   SDFRQX0 flag_end_bit_reg (.SE(DFT_sen), 
	.SD(\data_to_transmit[7] ), 
	.Q(flag_end_bit), 
	.D(n_40), 
	.C(serial_clock_i));
   SDFRQX0 serial_data_tx_o_reg (.SE(DFT_sen), 
	.SD(serial_end_bit_o), 
	.Q(serial_data_tx_o), 
	.D(n_39), 
	.C(serial_clock_i));
   AO22X0 p14934A (.Q(n_40), 
	.D(serial_stop_bit_gen_i), 
	.C(n_14), 
	.B(n_38), 
	.A(flag_end_bit));
   AO32X0 p15015A (.Q(n_39), 
	.E(SPCASCAN_N4), 
	.D(n_19), 
	.C(n_18), 
	.B(n_7), 
	.A(serial_scon7_sm0_i));
   NA2X0 p14939A (.Q(n_38), 
	.B(n_9), 
	.A(n_27));
   AO221X0 p14432A (.Q(n_37), 
	.E(n_26), 
	.D(n_16), 
	.C(serial_data_sbuf_i[4]), 
	.B(\data_to_transmit[4] ), 
	.A(n_14));
   AO221X0 p14432A1107 (.Q(n_36), 
	.E(n_23), 
	.D(n_13), 
	.C(serial_data_sbuf_i[0]), 
	.B(\data_to_transmit[2] ), 
	.A(n_15));
   AO221X0 p14432A1108 (.Q(n_35), 
	.E(n_25), 
	.D(n_13), 
	.C(serial_data_sbuf_i[4]), 
	.B(\data_to_transmit[6] ), 
	.A(n_15));
   AO221X0 p14432A1109 (.Q(n_34), 
	.E(n_24), 
	.D(n_13), 
	.C(serial_data_sbuf_i[5]), 
	.B(\data_to_transmit[7] ), 
	.A(n_15));
   AO221X0 p14432A1110 (.Q(n_33), 
	.E(n_22), 
	.D(n_13), 
	.C(serial_data_sbuf_i[6]), 
	.B(\data_to_transmit[8] ), 
	.A(n_15));
   AO221X0 p14432A1111 (.Q(n_32), 
	.E(n_21), 
	.D(n_13), 
	.C(serial_data_sbuf_i[1]), 
	.B(\data_to_transmit[3] ), 
	.A(n_15));
   AO221X0 p14490A (.Q(n_31), 
	.E(n_17), 
	.D(\data_to_transmit[9] ), 
	.C(n_15), 
	.B(\data_to_transmit[8] ), 
	.A(n_14));
   AO221X0 p14432A1112 (.Q(n_30), 
	.E(n_20), 
	.D(n_13), 
	.C(serial_data_sbuf_i[2]), 
	.B(\data_to_transmit[4] ), 
	.A(n_15));
   AO222X0 p14425A (.Q(n_29), 
	.F(DFT_sdo), 
	.E(n_15), 
	.D(SPCASCAN_N4), 
	.C(n_14), 
	.B(n_16), 
	.A(serial_data_sbuf_i[0]));
   AO22X0 p14743A (.Q(n_28), 
	.D(serial_scon3_tb8_i), 
	.C(n_13), 
	.B(n_14), 
	.A(n_6));
   ON31X0 p21817A (.Q(n_27), 
	.D(serial_reset_i_b), 
	.C(n_12), 
	.B(SPCASCAN_N4), 
	.A(serial_shift_i));
   AO22X0 p14016A (.Q(n_26), 
	.D(serial_data_sbuf_i[3]), 
	.C(n_13), 
	.B(n_15), 
	.A(\data_to_transmit[5] ));
   AO22X0 p14016A1113 (.Q(n_25), 
	.D(serial_data_sbuf_i[5]), 
	.C(n_16), 
	.B(n_14), 
	.A(\data_to_transmit[5] ));
   AO22X0 p14016A1114 (.Q(n_24), 
	.D(serial_data_sbuf_i[6]), 
	.C(n_16), 
	.B(n_14), 
	.A(\data_to_transmit[6] ));
   AO22X0 p14016A1115 (.Q(n_23), 
	.D(serial_data_sbuf_i[1]), 
	.C(n_16), 
	.B(n_14), 
	.A(DFT_sdo));
   AO22X0 p14016A1116 (.Q(n_22), 
	.D(serial_data_sbuf_i[7]), 
	.C(n_16), 
	.B(n_14), 
	.A(\data_to_transmit[7] ));
   AO22X0 p14016A1117 (.Q(n_21), 
	.D(serial_data_sbuf_i[2]), 
	.C(n_16), 
	.B(n_14), 
	.A(\data_to_transmit[2] ));
   AO22X0 p14016A1118 (.Q(n_20), 
	.D(serial_data_sbuf_i[3]), 
	.C(n_16), 
	.B(n_14), 
	.A(\data_to_transmit[3] ));
   NA2X0 p15009A (.Q(n_19), 
	.B(n_11), 
	.A(n_9));
   NO2X0 p32450A (.Q(n_18), 
	.B(n_10), 
	.A(n_12));
   AO21X0 p14312A (.Q(n_17), 
	.C(n_16), 
	.B(serial_data_sbuf_i[7]), 
	.A(n_8));
   NO2X0 p14215A (.Q(n_16), 
	.B(serial_scon7_sm0_i), 
	.A(n_9));
   AND2X0 p13795A (.Q(n_15), 
	.B(serial_shift_i), 
	.A(n_7));
   NO2I1X0 p13729A (.Q(n_14), 
	.B(serial_shift_i), 
	.AN(n_7));
   NO2I1X0 p14216A (.Q(n_13), 
	.B(n_9), 
	.AN(serial_scon7_sm0_i));
   NA3I1X0 p31835A (.Q(n_12), 
	.C(n_52), 
	.B(n_46), 
	.AN(DFT_sdo));
   ON21X0 p15177A (.Q(n_11), 
	.C(serial_reset_i_b), 
	.B(serial_scon7_sm0_i), 
	.A(n_50));
   NO2X0 p32788A (.Q(n_10), 
	.B(serial_data_tx_o), 
	.A(flag_end_bit));
   INX0 Fp14206A (.Q(n_8), 
	.A(n_9));
   NA2X0 p13828A (.Q(n_9), 
	.B(serial_reset_i_b), 
	.A(serial_start_shifter_reg_i));
   NO2I1X0 p13712A (.Q(n_7), 
	.B(serial_start_shifter_reg_i), 
	.AN(serial_reset_i_b));
   OR2X0 p32969A (.Q(n_6), 
	.B(serial_stop_bit_gen_i), 
	.A(\data_to_transmit[9] ));
   SDFRQX0 serial_end_bit_o_reg (.SE(DFT_sen), 
	.SD(\data_to_transmit[9] ), 
	.Q(serial_end_bit_o), 
	.D(n_5), 
	.C(serial_clock_i));
   AND2X0 p15689A (.Q(n_5), 
	.B(serial_reset_i_b), 
	.A(n_4));
   MU2IX0 p15790A (.S(serial_scon7_sm0_i), 
	.Q(n_4), 
	.IN1(n_50), 
	.IN0(n_3));
   NA3X0 p32492A (.Q(n_3), 
	.C(DFT_sdo), 
	.B(n_52), 
	.A(n_46));
   NA3X0 p31825A (.Q(n_50), 
	.C(n_52), 
	.B(n_46), 
	.A(n_2));
   NO3I1X0 p31246A (.Q(n_52), 
	.C(\data_to_transmit[6] ), 
	.B(\data_to_transmit[8] ), 
	.AN(n_1));
   NO3I1X0 p31252A (.Q(n_46), 
	.C(\data_to_transmit[3] ), 
	.B(\data_to_transmit[2] ), 
	.AN(n_0));
   NO2I1X0 p31797A (.Q(n_2), 
	.B(DFT_sdo), 
	.AN(SPCASCAN_N4));
   NO2X0 p31140A (.Q(n_1), 
	.B(\data_to_transmit[9] ), 
	.A(\data_to_transmit[7] ));
   NO2X0 p31146A (.Q(n_0), 
	.B(\data_to_transmit[5] ), 
	.A(\data_to_transmit[4] ));
endmodule

module serial_tx (
	serial_br_i, 
	serial_clock_i, 
	serial_reset_i_b, 
	serial_scon7_sm0_i, 
	serial_scon1_ti_i, 
	serial_serial_tx_i, 
	serial_data_sbuf_i, 
	serial_scon3_tb8_i, 
	serial_p3en_0_o, 
	serial_p3en_1_o, 
	serial_scon1_ti_o, 
	serial_send_o, 
	serial_data_en_o, 
	serial_data_tx_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2, 
	SPCASCAN_N3, 
	FE_PT1_top_p0_y_i_3_);
   input serial_br_i;
   input serial_clock_i;
   input serial_reset_i_b;
   input serial_scon7_sm0_i;
   input serial_scon1_ti_i;
   input serial_serial_tx_i;
   input [7:0] serial_data_sbuf_i;
   input serial_scon3_tb8_i;
   output serial_p3en_0_o;
   output serial_p3en_1_o;
   output serial_scon1_ti_o;
   output serial_send_o;
   output serial_data_en_o;
   output serial_data_tx_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;
   input SPCASCAN_N3;
   input FE_PT1_top_p0_y_i_3_;

   // Internal wires
   wire SPCASCAN_N4;
   wire SHIFT;
   wire START_OUTPUT;
   wire START_SHIFTER_REG;
   wire STOP_BIT_GEN;
   wire n_23;

   serial_tx_control serial_tx_control (.serial_br_i(serial_br_i), 
	.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_scon1_ti_i(serial_scon1_ti_i), 
	.serial_end_bit_i(DFT_sdo_2), 
	.serial_serial_tx_i(serial_serial_tx_i), 
	.serial_p3en_0_o(serial_p3en_0_o), 
	.serial_p3en_1_o(serial_p3en_1_o), 
	.serial_data_en_o(serial_data_en_o), 
	.serial_send_o(serial_send_o), 
	.serial_scon1_ti_o(serial_scon1_ti_o), 
	.serial_shift_o(SHIFT), 
	.serial_stop_bit_gen_o(STOP_BIT_GEN), 
	.serial_start_shifter_reg_o(START_SHIFTER_REG), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(n_23), 
	.SPCASCAN_N4(SPCASCAN_N4), 
	.FE_PT1_top_p0_y_i_3_(FE_PT1_top_p0_y_i_3_));
   serial_tx_output_shifter_reg serial_tx_output_shifter_reg (.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_data_sbuf_i({ serial_data_sbuf_i[7],
		serial_data_sbuf_i[6],
		serial_data_sbuf_i[5],
		serial_data_sbuf_i[4],
		serial_data_sbuf_i[3],
		serial_data_sbuf_i[2],
		serial_data_sbuf_i[1],
		serial_data_sbuf_i[0] }), 
	.serial_start_shifter_reg_i(START_OUTPUT), 
	.serial_shift_i(SHIFT), 
	.serial_stop_bit_gen_i(STOP_BIT_GEN), 
	.serial_scon3_tb8_i(serial_scon3_tb8_i), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_data_tx_o(serial_data_tx_o), 
	.serial_end_bit_o(DFT_sdo_2), 
	.DFT_sdi(SHIFT), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_1), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.SPCASCAN_N4(SPCASCAN_N4));
   MU2X0 p13511A (.S(serial_scon7_sm0_i), 
	.Q(START_OUTPUT), 
	.IN1(START_SHIFTER_REG), 
	.IN0(serial_serial_tx_i));
endmodule

module serial_top (
	serial_clock_i, 
	serial_reset_i_b, 
	serial_br_i, 
	serial_br_trans_i, 
	serial_scon0_ri_i, 
	serial_scon1_ti_i, 
	serial_scon3_tb8_i, 
	serial_scon4_ren_i, 
	serial_scon7_sm0_i, 
	serial_serial_tx_i, 
	serial_data_sbuf_i, 
	serial_p3_0_i, 
	serial_p3en_0_o, 
	serial_p3en_1_o, 
	serial_p3_0_o, 
	serial_p3_1_o, 
	serial_scon0_ri_o, 
	serial_scon1_ti_o, 
	serial_scon2_rb8_o, 
	serial_data_sbuf_o, 
	serial_load_sbuf_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2, 
	DFT_sdi_3, 
	DFT_sdo_4, 
	FE_PT1_top_p0_y_i_3_, 
	SPCASCAN_N5);
   input serial_clock_i;
   input serial_reset_i_b;
   input serial_br_i;
   input serial_br_trans_i;
   input serial_scon0_ri_i;
   input serial_scon1_ti_i;
   input serial_scon3_tb8_i;
   input serial_scon4_ren_i;
   input serial_scon7_sm0_i;
   input serial_serial_tx_i;
   input [7:0] serial_data_sbuf_i;
   input serial_p3_0_i;
   output serial_p3en_0_o;
   output serial_p3en_1_o;
   output serial_p3_0_o;
   output serial_p3_1_o;
   output serial_scon0_ri_o;
   output serial_scon1_ti_o;
   output serial_scon2_rb8_o;
   output [7:0] serial_data_sbuf_o;
   output serial_load_sbuf_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;
   input DFT_sdi_3;
   output DFT_sdo_4;
   input FE_PT1_top_p0_y_i_3_;
   output SPCASCAN_N5;

   // Internal wires
   wire SPCASCAN_N3;
   wire DATA_EN_INTERNAL;
   wire DATA_TX_INTERNAL;
   wire RECEIVE_INTERNAL;
   wire SEND_INTERNAL;
   wire UNCONNECTED45;
   wire UNCONNECTED46;
   wire UNCONNECTED47;
   wire UNCONNECTED48;
   wire UNCONNECTED49;
   wire UNCONNECTED50;
   wire UNCONNECTED51;
   wire UNCONNECTED52;
   wire UNCONNECTED53;
   wire UNCONNECTED54;
   wire UNCONNECTED55;
   wire UNCONNECTED56;
   wire UNCONNECTED57;
   wire UNCONNECTED58;
   wire p3en_0_temp1;
   wire p3en_0_temp2;
   wire p3en_1_temp1;
   wire p3en_1_temp2;

   serial_outputs_logic_control serial_outputs_logic_control (.serial_clock_internal_i(1'b0), 
	.serial_reset_internal_i_b(1'b0), 
	.serial_br_internal_i(serial_br_i), 
	.serial_br_trans_internal_i(1'b0), 
	.serial_scon0_ri_o_internal_i(1'b0), 
	.serial_scon1_ti_o_internal_i(1'b0), 
	.serial_scon2_rb8_internal_i(1'b0), 
	.serial_data_tx_internal_i(SPCASCAN_N5), 
	.serial_scon7_sm0_internal_i(serial_scon7_sm0_i), 
	.serial_p3en_0_internal_i(1'b0), 
	.serial_p3en_1_internal_i(1'b0), 
	.serial_receive_internal_i(RECEIVE_INTERNAL), 
	.serial_send_internal_i(SEND_INTERNAL), 
	.serial_data_en_internal_i(DATA_EN_INTERNAL), 
	.serial_sbuf_rx_internal_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.serial_load_sbuf_internal_i(1'b0), 
	.serial_p3en_0_o(UNCONNECTED45), 
	.serial_p3en_1_o(UNCONNECTED46), 
	.serial_p3_0_o(serial_p3_0_o), 
	.serial_p3_1_o(serial_p3_1_o), 
	.serial_scon0_ri_o(UNCONNECTED47), 
	.serial_scon1_ti_o(UNCONNECTED48), 
	.serial_scon2_rb8_o(UNCONNECTED49), 
	.serial_data_sbuf_o({ UNCONNECTED50,
		UNCONNECTED51,
		UNCONNECTED52,
		UNCONNECTED53,
		UNCONNECTED54,
		UNCONNECTED55,
		UNCONNECTED56,
		UNCONNECTED57 }), 
	.serial_load_sbuf_o(UNCONNECTED58));
   serial_rx serial_rx_block (.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_br_i(serial_br_i), 
	.serial_br_trans_i(serial_br_trans_i), 
	.serial_rxd_data_i(1'b0), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_scon4_ren_i(serial_scon4_ren_i), 
	.serial_scon0_ri_i(serial_scon0_ri_i), 
	.serial_data_mode0_i(serial_p3_0_i), 
	.serial_p3en_0_o(p3en_0_temp1), 
	.serial_p3en_1_o(p3en_1_temp1), 
	.serial_scon0_ri_o(serial_scon0_ri_o), 
	.serial_scon2_rb8_o(serial_scon2_rb8_o), 
	.serial_sbuf_rx_o({ serial_data_sbuf_o[7],
		serial_data_sbuf_o[6],
		serial_data_sbuf_o[5],
		serial_data_sbuf_o[4],
		serial_data_sbuf_o[3],
		serial_data_sbuf_o[2],
		serial_data_sbuf_o[1],
		serial_data_sbuf_o[0] }), 
	.serial_receive_o(RECEIVE_INTERNAL), 
	.serial_load_sbuf_o(serial_load_sbuf_o), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_1), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.p3en_0_temp2(p3en_0_temp2));
   serial_tx serial_tx_block (.serial_br_i(serial_br_i), 
	.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_scon1_ti_i(serial_scon1_ti_i), 
	.serial_serial_tx_i(serial_serial_tx_i), 
	.serial_data_sbuf_i({ serial_data_sbuf_i[7],
		serial_data_sbuf_i[6],
		serial_data_sbuf_i[5],
		serial_data_sbuf_i[4],
		serial_data_sbuf_i[3],
		serial_data_sbuf_i[2],
		serial_data_sbuf_i[1],
		serial_data_sbuf_i[0] }), 
	.serial_scon3_tb8_i(serial_scon3_tb8_i), 
	.serial_p3en_0_o(p3en_0_temp2), 
	.serial_p3en_1_o(p3en_1_temp2), 
	.serial_scon1_ti_o(serial_scon1_ti_o), 
	.serial_send_o(SEND_INTERNAL), 
	.serial_data_en_o(DATA_EN_INTERNAL), 
	.serial_data_tx_o(SPCASCAN_N5), 
	.DFT_sdi(serial_scon2_rb8_o), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo_2), 
	.DFT_sdi_1(DFT_sdi_3), 
	.DFT_sdo_2(DFT_sdo_4), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.FE_PT1_top_p0_y_i_3_(FE_PT1_top_p0_y_i_3_));
   OR2X0 p22235A (.Q(serial_p3en_0_o), 
	.B(p3en_0_temp2), 
	.A(p3en_0_temp1));
   OR2X0 p22235A10 (.Q(serial_p3en_1_o), 
	.B(p3en_1_temp2), 
	.A(p3en_1_temp1));
endmodule

module decrement_unsigned_166_167 (
	A, 
	CI, 
	Z);
   input [23:0] A;
   input CI;
   output [24:0] Z;

   // Internal wires
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_13;
   wire n_15;
   wire n_17;
   wire n_19;
   wire n_21;
   wire n_23;
   wire n_25;
   wire n_27;
   wire n_29;
   wire n_31;
   wire n_33;
   wire n_35;
   wire n_37;
   wire n_39;
   wire n_41;
   wire n_43;
   wire n_45;
   wire n_47;
   wire n_49;
   wire n_51;
   wire n_53;

   assign Z[0] = 1'b0 ;
   assign Z[24] = 1'b0 ;

   EN2X0 p11363A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_53));
   ON21X0 p11752A (.Q(Z[22]), 
	.C(n_53), 
	.B(n_2), 
	.A(n_51));
   NA2X0 p11376A (.Q(n_53), 
	.B(n_2), 
	.A(n_51));
   AO21X0 p11578A (.Q(Z[21]), 
	.C(n_51), 
	.B(A[21]), 
	.A(n_49));
   NO2X0 p11058A (.Q(n_51), 
	.B(A[21]), 
	.A(n_49));
   ON21X0 p12077A (.Q(Z[20]), 
	.C(n_49), 
	.B(n_10), 
	.A(n_47));
   NA2X0 p10998A (.Q(n_49), 
	.B(n_10), 
	.A(n_47));
   AO21X0 p11909A (.Q(Z[19]), 
	.C(n_47), 
	.B(A[19]), 
	.A(n_45));
   NO2X0 p10686A (.Q(n_47), 
	.B(A[19]), 
	.A(n_45));
   ON21X0 p12407A (.Q(Z[18]), 
	.C(n_45), 
	.B(n_5), 
	.A(n_43));
   NA2X0 p10625A (.Q(n_45), 
	.B(n_5), 
	.A(n_43));
   AO21X0 p12236A (.Q(Z[17]), 
	.C(n_43), 
	.B(A[17]), 
	.A(n_41));
   NO2X0 p10310A (.Q(n_43), 
	.B(A[17]), 
	.A(n_41));
   ON21X0 p12735A (.Q(Z[16]), 
	.C(n_41), 
	.B(n_7), 
	.A(n_39));
   NA2X0 p10250A (.Q(n_41), 
	.B(n_7), 
	.A(n_39));
   AO21X0 p12568A (.Q(Z[15]), 
	.C(n_39), 
	.B(A[15]), 
	.A(n_37));
   NO2X0 p9939A (.Q(n_39), 
	.B(A[15]), 
	.A(n_37));
   ON21X0 p13067A (.Q(Z[14]), 
	.C(n_37), 
	.B(n_0), 
	.A(n_35));
   NA2X0 p9878A (.Q(n_37), 
	.B(n_0), 
	.A(n_35));
   AO21X0 p12898A (.Q(Z[13]), 
	.C(n_35), 
	.B(A[13]), 
	.A(n_33));
   NO2X0 p9567A (.Q(n_35), 
	.B(A[13]), 
	.A(n_33));
   ON21X0 p13397A (.Q(Z[12]), 
	.C(n_33), 
	.B(n_3), 
	.A(n_31));
   NA2X0 p9506A (.Q(n_33), 
	.B(n_3), 
	.A(n_31));
   AO21X0 p13226A (.Q(Z[11]), 
	.C(n_31), 
	.B(A[11]), 
	.A(n_29));
   NO2X0 p9192A (.Q(n_31), 
	.B(A[11]), 
	.A(n_29));
   ON21X0 p13725A (.Q(Z[10]), 
	.C(n_29), 
	.B(n_4), 
	.A(n_27));
   NA2X0 p9131A (.Q(n_29), 
	.B(n_4), 
	.A(n_27));
   AO21X0 p13549A (.Q(Z[9]), 
	.C(n_27), 
	.B(A[9]), 
	.A(n_25));
   NO2X0 p8824A (.Q(n_27), 
	.B(A[9]), 
	.A(n_25));
   ON21X0 p14011A (.Q(Z[8]), 
	.C(n_25), 
	.B(n_6), 
	.A(n_23));
   NA2X0 p8763A (.Q(n_25), 
	.B(n_6), 
	.A(n_23));
   AO21X0 p13814A (.Q(Z[7]), 
	.C(n_23), 
	.B(A[7]), 
	.A(n_21));
   NO2X0 p8422A (.Q(n_23), 
	.B(A[7]), 
	.A(n_21));
   ON21X0 p14295A (.Q(Z[6]), 
	.C(n_21), 
	.B(n_8), 
	.A(n_19));
   NA2X0 p8359A (.Q(n_21), 
	.B(n_8), 
	.A(n_19));
   AO21X0 p14066A (.Q(Z[5]), 
	.C(n_19), 
	.B(A[5]), 
	.A(n_17));
   NO2X0 p8025A (.Q(n_19), 
	.B(A[5]), 
	.A(n_17));
   ON21X0 p14564A (.Q(Z[4]), 
	.C(n_17), 
	.B(n_1), 
	.A(n_15));
   NA2X0 p7962A (.Q(n_17), 
	.B(n_1), 
	.A(n_15));
   AO21X0 p14584A (.Q(Z[3]), 
	.C(n_15), 
	.B(A[3]), 
	.A(n_13));
   NO2X0 p7641A (.Q(n_15), 
	.B(A[3]), 
	.A(n_13));
   ON21X0 p15148A (.Q(Z[2]), 
	.C(n_13), 
	.B(n_9), 
	.A(n_11));
   NA2X0 p7578A (.Q(n_13), 
	.B(n_9), 
	.A(n_11));
   AO21X0 p14942A (.Q(Z[1]), 
	.C(n_11), 
	.B(A[0]), 
	.A(A[1]));
   NO2X0 p7308A (.Q(n_11), 
	.B(A[0]), 
	.A(A[1]));
   INX0 Fp14001A (.Q(n_10), 
	.A(A[20]));
   INX0 Fp7726A (.Q(n_9), 
	.A(A[2]));
   INX0 Fp9132A (.Q(n_8), 
	.A(A[6]));
   INX0 Fp12644A (.Q(n_7), 
	.A(A[16]));
   INX0 Fp9836A (.Q(n_6), 
	.A(A[8]));
   INX0 Fp13347A (.Q(n_5), 
	.A(A[18]));
   INX0 Fp10538A (.Q(n_4), 
	.A(A[10]));
   INX0 Fp11242A (.Q(n_3), 
	.A(A[12]));
   INX0 Fp14514A (.Q(n_2), 
	.A(A[22]));
   INX0 Fp8430A (.Q(n_1), 
	.A(A[4]));
   INX0 Fp11944A (.Q(n_0), 
	.A(A[14]));
endmodule

module increment_unsigned_164_165 (
	A, 
	CI, 
	Z);
   input [23:0] A;
   input CI;
   output [24:0] Z;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_4;
   wire n_6;
   wire n_8;
   wire n_10;
   wire n_12;
   wire n_14;
   wire n_16;
   wire n_18;
   wire n_20;
   wire n_22;
   wire n_24;
   wire n_26;
   wire n_28;
   wire n_30;
   wire n_32;
   wire n_34;
   wire n_36;
   wire n_38;
   wire n_40;
   wire n_42;

   assign Z[0] = 1'b0 ;
   assign Z[24] = 1'b0 ;

   EN2X0 p11684A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p11859A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p11443A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p12019A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p11136A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p12194A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p10844A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p12354A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p10537A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p12529A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p10245A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p12689A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p9937A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p12864A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p9646A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p13022A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p9336A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p13199A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p9046A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p13353A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p8733A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p13534A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p8447A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p13684A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p8100A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p13869A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p7847A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p14012A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p7415A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p14204A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p7165A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p14323A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p6717A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p14538A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p6478A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p14609A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p6052A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p14832A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p5796A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p14449A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p5382A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p14691A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p5137A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p14620A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p4943A (.Q(n_0), 
	.B(A[0]), 
	.A(A[1]));
endmodule

module timer0 (
	timers_clock_i, 
	timers_reset_i_b, 
	timers_int0_i, 
	timers_sfr_tmod_gate_t0_i, 
	timers_sfr_tmod_m0t0_i, 
	timers_sfr_tmod_m1t0_i, 
	timers_sfr_tcon_tr0_i, 
	timers_sfr_th0_i, 
	timers_sfr_tm0_i, 
	timers_sfr_tl0_i, 
	timers_sfr_tcon_tf0_i, 
	timers_sfr_tcon_tf0_o, 
	timers_sfr_th0_o, 
	timers_sfr_tm0_o, 
	timers_sfr_tl0_o, 
	DFT_sdi, 
	DFT_sen, 
	FE_PT1__top_timers_sfr_th1_o_0__);
   input timers_clock_i;
   input timers_reset_i_b;
   input timers_int0_i;
   input timers_sfr_tmod_gate_t0_i;
   input timers_sfr_tmod_m0t0_i;
   input timers_sfr_tmod_m1t0_i;
   input timers_sfr_tcon_tr0_i;
   input [7:0] timers_sfr_th0_i;
   input [7:0] timers_sfr_tm0_i;
   input [7:0] timers_sfr_tl0_i;
   input timers_sfr_tcon_tf0_i;
   output timers_sfr_tcon_tf0_o;
   output [7:0] timers_sfr_th0_o;
   output [7:0] timers_sfr_tm0_o;
   output [7:0] timers_sfr_tl0_o;
   input DFT_sdi;
   input DFT_sen;
   input FE_PT1__top_timers_sfr_th1_o_0__;

   // Internal wires
   wire UNCONNECTED59;
   wire UNCONNECTED60;
   wire UNCONNECTED61;
   wire UNCONNECTED62;
   wire n_0;
   wire n_1;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;

   decrement_unsigned_166_167 dec_sub_167_61 (.A({ timers_sfr_th0_i[7],
		timers_sfr_th0_i[6],
		timers_sfr_th0_i[5],
		timers_sfr_th0_i[4],
		timers_sfr_th0_i[3],
		timers_sfr_th0_i[2],
		timers_sfr_th0_i[1],
		timers_sfr_th0_i[0],
		timers_sfr_tm0_i[7],
		timers_sfr_tm0_i[6],
		timers_sfr_tm0_i[5],
		timers_sfr_tm0_i[4],
		timers_sfr_tm0_i[3],
		timers_sfr_tm0_i[2],
		timers_sfr_tm0_i[1],
		timers_sfr_tm0_i[0],
		timers_sfr_tl0_i[7],
		timers_sfr_tl0_i[6],
		timers_sfr_tl0_i[5],
		timers_sfr_tl0_i[4],
		timers_sfr_tl0_i[3],
		timers_sfr_tl0_i[2],
		timers_sfr_tl0_i[1],
		timers_sfr_tl0_i[0] }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED59,
		n_56,
		n_57,
		n_58,
		n_59,
		n_60,
		n_61,
		n_62,
		n_63,
		n_64,
		n_65,
		n_66,
		n_67,
		n_69,
		n_70,
		n_71,
		n_72,
		n_73,
		n_74,
		n_75,
		n_76,
		n_77,
		n_78,
		n_80,
		UNCONNECTED60 }));
   increment_unsigned_164_165 inc_add_140_57 (.A({ timers_sfr_th0_i[7],
		timers_sfr_th0_i[6],
		timers_sfr_th0_i[5],
		timers_sfr_th0_i[4],
		timers_sfr_th0_i[3],
		timers_sfr_th0_i[2],
		timers_sfr_th0_i[1],
		timers_sfr_th0_i[0],
		timers_sfr_tm0_i[7],
		timers_sfr_tm0_i[6],
		timers_sfr_tm0_i[5],
		timers_sfr_tm0_i[4],
		timers_sfr_tm0_i[3],
		timers_sfr_tm0_i[2],
		timers_sfr_tm0_i[1],
		timers_sfr_tm0_i[0],
		timers_sfr_tl0_i[7],
		timers_sfr_tl0_i[6],
		timers_sfr_tl0_i[5],
		timers_sfr_tl0_i[4],
		timers_sfr_tl0_i[3],
		timers_sfr_tl0_i[2],
		timers_sfr_tl0_i[1],
		timers_sfr_tl0_i[0] }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED61,
		n_81,
		n_82,
		n_83,
		n_84,
		n_85,
		n_86,
		n_87,
		n_88,
		n_89,
		n_90,
		n_91,
		n_92,
		n_93,
		n_94,
		n_95,
		n_96,
		n_97,
		n_98,
		n_99,
		n_100,
		n_101,
		n_102,
		n_103,
		UNCONNECTED62 }));
   SDFRQX0 \timers_sfr_th0_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(timers_sfr_th0_o[0]), 
	.D(n_49), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[2]), 
	.Q(timers_sfr_th0_o[1]), 
	.D(n_48), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[3]), 
	.Q(timers_sfr_th0_o[2]), 
	.D(n_47), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[4]), 
	.Q(timers_sfr_th0_o[3]), 
	.D(n_46), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[5]), 
	.Q(timers_sfr_th0_o[4]), 
	.D(n_45), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[6]), 
	.Q(timers_sfr_th0_o[5]), 
	.D(n_44), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[7]), 
	.Q(timers_sfr_th0_o[6]), 
	.D(n_43), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[0]), 
	.Q(timers_sfr_th0_o[7]), 
	.D(n_42), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[1]), 
	.Q(timers_sfr_tl0_o[0]), 
	.D(n_41), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[2]), 
	.Q(timers_sfr_tl0_o[1]), 
	.D(n_40), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[3]), 
	.Q(timers_sfr_tl0_o[2]), 
	.D(n_39), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[4]), 
	.Q(timers_sfr_tl0_o[3]), 
	.D(n_38), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[5]), 
	.Q(timers_sfr_tl0_o[4]), 
	.D(n_37), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[6]), 
	.Q(timers_sfr_tl0_o[5]), 
	.D(n_36), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[7]), 
	.Q(timers_sfr_tl0_o[6]), 
	.D(n_35), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[0]), 
	.Q(timers_sfr_tl0_o[7]), 
	.D(n_34), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[1]), 
	.Q(timers_sfr_tm0_o[0]), 
	.D(n_33), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[2]), 
	.Q(timers_sfr_tm0_o[1]), 
	.D(n_32), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[3]), 
	.Q(timers_sfr_tm0_o[2]), 
	.D(n_31), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[4]), 
	.Q(timers_sfr_tm0_o[3]), 
	.D(n_30), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[5]), 
	.Q(timers_sfr_tm0_o[4]), 
	.D(n_29), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[6]), 
	.Q(timers_sfr_tm0_o[5]), 
	.D(n_28), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[7]), 
	.Q(timers_sfr_tm0_o[6]), 
	.D(n_27), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[7]  (.SE(DFT_sen), 
	.SD(FE_PT1__top_timers_sfr_th1_o_0__), 
	.Q(timers_sfr_tm0_o[7]), 
	.D(n_26), 
	.C(timers_clock_i));
   AO222X0 p12630A (.Q(n_49), 
	.F(n_88), 
	.E(n_23), 
	.D(n_63), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[0]));
   AO222X0 p12454A (.Q(n_48), 
	.F(n_87), 
	.E(n_23), 
	.D(n_62), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[1]));
   AO222X0 p12295A (.Q(n_47), 
	.F(n_86), 
	.E(n_23), 
	.D(n_61), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[2]));
   AO222X0 p12118A (.Q(n_46), 
	.F(n_85), 
	.E(n_23), 
	.D(n_60), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[3]));
   AO222X0 p11960A (.Q(n_45), 
	.F(n_84), 
	.E(n_23), 
	.D(n_59), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[4]));
   AO222X0 p11784A (.Q(n_44), 
	.F(n_83), 
	.E(n_23), 
	.D(n_58), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[5]));
   AO222X0 p11623A (.Q(n_43), 
	.F(n_82), 
	.E(n_23), 
	.D(n_57), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[6]));
   AO222X0 p11408A (.Q(n_42), 
	.F(n_81), 
	.E(n_23), 
	.D(n_56), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[7]));
   AO32X0 p15057A (.Q(n_41), 
	.E(n_25), 
	.D(timers_sfr_tl0_i[0]), 
	.C(n_21), 
	.B(timers_reset_i_b), 
	.A(n_22));
   AO222X0 p14633A (.Q(n_40), 
	.F(n_24), 
	.E(n_80), 
	.D(n_25), 
	.C(timers_sfr_tl0_i[1]), 
	.B(n_23), 
	.A(n_103));
   AO222X0 p14633A1858 (.Q(n_39), 
	.F(n_24), 
	.E(n_78), 
	.D(n_25), 
	.C(timers_sfr_tl0_i[2]), 
	.B(n_23), 
	.A(n_102));
   AO222X0 p14581A (.Q(n_38), 
	.F(n_77), 
	.E(n_24), 
	.D(n_25), 
	.C(timers_sfr_tl0_i[3]), 
	.B(n_23), 
	.A(n_101));
   AO222X0 p14544A (.Q(n_37), 
	.F(n_100), 
	.E(n_23), 
	.D(n_76), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[4]));
   AO222X0 p14457A (.Q(n_36), 
	.F(n_99), 
	.E(n_23), 
	.D(n_75), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[5]));
   AO222X0 p14305A (.Q(n_35), 
	.F(n_98), 
	.E(n_23), 
	.D(n_74), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[6]));
   AO222X0 p14128A (.Q(n_34), 
	.F(n_97), 
	.E(n_23), 
	.D(n_73), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[7]));
   AO222X0 p13970A (.Q(n_33), 
	.F(n_96), 
	.E(n_23), 
	.D(n_72), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[0]));
   AO222X0 p13794A (.Q(n_32), 
	.F(n_95), 
	.E(n_23), 
	.D(n_71), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[1]));
   AO222X0 p13635A (.Q(n_31), 
	.F(n_94), 
	.E(n_23), 
	.D(n_70), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[2]));
   AO222X0 p13458A (.Q(n_30), 
	.F(n_93), 
	.E(n_23), 
	.D(n_69), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[3]));
   AO222X0 p13300A (.Q(n_29), 
	.F(n_92), 
	.E(n_23), 
	.D(n_67), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[4]));
   AO222X0 p13124A (.Q(n_28), 
	.F(n_91), 
	.E(n_23), 
	.D(n_66), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[5]));
   AO222X0 p12965A (.Q(n_27), 
	.F(n_90), 
	.E(n_23), 
	.D(n_65), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[6]));
   AO222X0 p12788A (.Q(n_26), 
	.F(n_89), 
	.E(n_23), 
	.D(n_64), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[7]));
   NO2I1X0 p14308A (.Q(n_25), 
	.B(n_21), 
	.AN(timers_reset_i_b));
   NO3I1X0 p14293A (.Q(n_24), 
	.C(n_50), 
	.B(n_52), 
	.AN(timers_reset_i_b));
   AND3X0 p14281A (.Q(n_23), 
	.C(n_20), 
	.B(n_51), 
	.A(timers_reset_i_b));
   INX0 Fp13835A (.Q(n_22), 
	.A(timers_sfr_tl0_i[0]));
   NO2X0 p14336A (.Q(n_21), 
	.B(n_52), 
	.A(n_19));
   INX0 Fp13629A1859 (.Q(n_20), 
	.A(n_52));
   EO2X0 p14047A (.Q(n_19), 
	.B(timers_sfr_tmod_m0t0_i), 
	.A(timers_sfr_tmod_m1t0_i));
   AO321X0 p14057A (.Q(timers_sfr_tcon_tf0_o), 
	.F(timers_sfr_tcon_tf0_i), 
	.E(n_13), 
	.D(n_14), 
	.C(n_15), 
	.B(n_16), 
	.A(n_17));
   AND6X0 p13935A (.Q(n_15), 
	.F(timers_sfr_tm0_i[2]), 
	.E(timers_sfr_tl0_i[7]), 
	.D(n_11), 
	.C(timers_sfr_tm0_i[1]), 
	.B(timers_sfr_tm0_i[0]), 
	.A(n_12));
   NO6X0 p13759A (.Q(n_14), 
	.F(timers_sfr_tm0_i[2]), 
	.E(timers_sfr_tm0_i[0]), 
	.D(n_9), 
	.C(timers_sfr_tl0_i[7]), 
	.B(timers_sfr_tm0_i[1]), 
	.A(n_10));
   NA3X0 p13758A (.Q(n_10), 
	.C(n_7), 
	.B(n_8), 
	.A(n_51));
   NO3X0 p14052A (.Q(n_12), 
	.C(n_5), 
	.B(n_6), 
	.A(n_50));
   NO6X0 p13839A (.Q(n_13), 
	.F(timers_sfr_th0_i[4]), 
	.E(timers_sfr_th0_i[2]), 
	.D(n_3), 
	.C(timers_sfr_th0_i[1]), 
	.B(timers_sfr_th0_i[3]), 
	.A(n_4));
   OR5X0 p13674A (.Q(n_4), 
	.E(timers_sfr_tl0_i[2]), 
	.D(timers_sfr_th0_i[0]), 
	.C(timers_sfr_tl0_i[1]), 
	.B(timers_sfr_tm0_i[7]), 
	.A(n_52));
   AND5X0 p14008A (.Q(n_17), 
	.E(timers_sfr_tl0_i[1]), 
	.D(timers_sfr_tl0_i[2]), 
	.C(timers_sfr_th0_i[0]), 
	.B(timers_sfr_tm0_i[7]), 
	.A(n_20));
   AND5X0 p14115A (.Q(n_16), 
	.E(timers_sfr_th0_i[1]), 
	.D(timers_sfr_th0_i[2]), 
	.C(timers_sfr_th0_i[4]), 
	.B(timers_sfr_th0_i[3]), 
	.A(n_1));
   ON21X0 p13470A (.Q(n_52), 
	.C(timers_sfr_tcon_tr0_i), 
	.B(timers_int0_i), 
	.A(n_0));
   AND4X0 p14055A (.Q(n_11), 
	.D(timers_sfr_tm0_i[4]), 
	.C(timers_sfr_tm0_i[5]), 
	.B(timers_sfr_tm0_i[6]), 
	.A(timers_sfr_tm0_i[3]));
   OR4X0 p13775A (.Q(n_9), 
	.D(timers_sfr_tm0_i[5]), 
	.C(timers_sfr_tm0_i[6]), 
	.B(timers_sfr_tm0_i[3]), 
	.A(timers_sfr_tm0_i[4]));
   OR4X0 p13842A (.Q(n_3), 
	.D(timers_sfr_th0_i[6]), 
	.C(timers_sfr_tl0_i[0]), 
	.B(timers_sfr_th0_i[5]), 
	.A(timers_sfr_th0_i[7]));
   AND4X0 p14027A (.Q(n_1), 
	.D(timers_sfr_tl0_i[0]), 
	.C(timers_sfr_th0_i[6]), 
	.B(timers_sfr_th0_i[5]), 
	.A(timers_sfr_th0_i[7]));
   NO2X0 p13799A (.Q(n_8), 
	.B(timers_sfr_tl0_i[6]), 
	.A(timers_sfr_tl0_i[5]));
   NA2X0 p14009A (.Q(n_5), 
	.B(timers_sfr_tl0_i[5]), 
	.A(timers_sfr_tl0_i[6]));
   NO2X0 p13722A (.Q(n_51), 
	.B(timers_sfr_tmod_m0t0_i), 
	.A(timers_sfr_tmod_m1t0_i));
   NA2X0 p13814A (.Q(n_50), 
	.B(timers_sfr_tmod_m0t0_i), 
	.A(timers_sfr_tmod_m1t0_i));
   NA2X0 p14017A (.Q(n_6), 
	.B(timers_sfr_tl0_i[3]), 
	.A(timers_sfr_tl0_i[4]));
   NO2X0 p13774A (.Q(n_7), 
	.B(timers_sfr_tl0_i[4]), 
	.A(timers_sfr_tl0_i[3]));
   INX0 Fp13452A (.Q(n_0), 
	.A(timers_sfr_tmod_gate_t0_i));
endmodule

module decrement_unsigned_166_167_4490 (
	A, 
	CI, 
	Z);
   input [23:0] A;
   input CI;
   output [24:0] Z;

   // Internal wires
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_13;
   wire n_15;
   wire n_17;
   wire n_19;
   wire n_21;
   wire n_23;
   wire n_25;
   wire n_27;
   wire n_29;
   wire n_31;
   wire n_33;
   wire n_35;
   wire n_37;
   wire n_39;
   wire n_41;
   wire n_43;
   wire n_45;
   wire n_47;
   wire n_49;
   wire n_51;
   wire n_53;

   assign Z[0] = 1'b0 ;
   assign Z[24] = 1'b0 ;

   EN2X0 p11363A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_53));
   ON21X0 p11752A (.Q(Z[22]), 
	.C(n_53), 
	.B(n_2), 
	.A(n_51));
   NA2X0 p11376A (.Q(n_53), 
	.B(n_2), 
	.A(n_51));
   AO21X0 p11578A (.Q(Z[21]), 
	.C(n_51), 
	.B(A[21]), 
	.A(n_49));
   NO2X0 p11058A (.Q(n_51), 
	.B(A[21]), 
	.A(n_49));
   ON21X0 p12077A (.Q(Z[20]), 
	.C(n_49), 
	.B(n_10), 
	.A(n_47));
   NA2X0 p10998A (.Q(n_49), 
	.B(n_10), 
	.A(n_47));
   AO21X0 p11909A (.Q(Z[19]), 
	.C(n_47), 
	.B(A[19]), 
	.A(n_45));
   NO2X0 p10686A (.Q(n_47), 
	.B(A[19]), 
	.A(n_45));
   ON21X0 p12407A (.Q(Z[18]), 
	.C(n_45), 
	.B(n_5), 
	.A(n_43));
   NA2X0 p10625A (.Q(n_45), 
	.B(n_5), 
	.A(n_43));
   AO21X0 p12236A (.Q(Z[17]), 
	.C(n_43), 
	.B(A[17]), 
	.A(n_41));
   NO2X0 p10310A (.Q(n_43), 
	.B(A[17]), 
	.A(n_41));
   ON21X0 p12735A (.Q(Z[16]), 
	.C(n_41), 
	.B(n_7), 
	.A(n_39));
   NA2X0 p10250A (.Q(n_41), 
	.B(n_7), 
	.A(n_39));
   AO21X0 p12568A (.Q(Z[15]), 
	.C(n_39), 
	.B(A[15]), 
	.A(n_37));
   NO2X0 p9939A (.Q(n_39), 
	.B(A[15]), 
	.A(n_37));
   ON21X0 p13067A (.Q(Z[14]), 
	.C(n_37), 
	.B(n_0), 
	.A(n_35));
   NA2X0 p9878A (.Q(n_37), 
	.B(n_0), 
	.A(n_35));
   AO21X0 p12898A (.Q(Z[13]), 
	.C(n_35), 
	.B(A[13]), 
	.A(n_33));
   NO2X0 p9567A (.Q(n_35), 
	.B(A[13]), 
	.A(n_33));
   ON21X0 p13397A (.Q(Z[12]), 
	.C(n_33), 
	.B(n_3), 
	.A(n_31));
   NA2X0 p9506A (.Q(n_33), 
	.B(n_3), 
	.A(n_31));
   AO21X0 p13226A (.Q(Z[11]), 
	.C(n_31), 
	.B(A[11]), 
	.A(n_29));
   NO2X0 p9192A (.Q(n_31), 
	.B(A[11]), 
	.A(n_29));
   ON21X0 p13725A (.Q(Z[10]), 
	.C(n_29), 
	.B(n_4), 
	.A(n_27));
   NA2X0 p9131A (.Q(n_29), 
	.B(n_4), 
	.A(n_27));
   AO21X0 p13549A (.Q(Z[9]), 
	.C(n_27), 
	.B(A[9]), 
	.A(n_25));
   NO2X0 p8824A (.Q(n_27), 
	.B(A[9]), 
	.A(n_25));
   ON21X0 p14011A (.Q(Z[8]), 
	.C(n_25), 
	.B(n_6), 
	.A(n_23));
   NA2X0 p8763A (.Q(n_25), 
	.B(n_6), 
	.A(n_23));
   AO21X0 p13814A (.Q(Z[7]), 
	.C(n_23), 
	.B(A[7]), 
	.A(n_21));
   NO2X0 p8422A (.Q(n_23), 
	.B(A[7]), 
	.A(n_21));
   ON21X0 p14295A (.Q(Z[6]), 
	.C(n_21), 
	.B(n_8), 
	.A(n_19));
   NA2X0 p8359A (.Q(n_21), 
	.B(n_8), 
	.A(n_19));
   AO21X0 p14066A (.Q(Z[5]), 
	.C(n_19), 
	.B(A[5]), 
	.A(n_17));
   NO2X0 p8025A (.Q(n_19), 
	.B(A[5]), 
	.A(n_17));
   ON21X0 p14564A (.Q(Z[4]), 
	.C(n_17), 
	.B(n_1), 
	.A(n_15));
   NA2X0 p7962A (.Q(n_17), 
	.B(n_1), 
	.A(n_15));
   AO21X0 p14584A (.Q(Z[3]), 
	.C(n_15), 
	.B(A[3]), 
	.A(n_13));
   NO2X0 p7641A (.Q(n_15), 
	.B(A[3]), 
	.A(n_13));
   ON21X0 p15148A (.Q(Z[2]), 
	.C(n_13), 
	.B(n_9), 
	.A(n_11));
   NA2X0 p7578A (.Q(n_13), 
	.B(n_9), 
	.A(n_11));
   AO21X0 p14942A (.Q(Z[1]), 
	.C(n_11), 
	.B(A[0]), 
	.A(A[1]));
   NO2X0 p7308A (.Q(n_11), 
	.B(A[0]), 
	.A(A[1]));
   INX0 Fp14001A (.Q(n_10), 
	.A(A[20]));
   INX0 Fp7726A (.Q(n_9), 
	.A(A[2]));
   INX0 Fp9132A (.Q(n_8), 
	.A(A[6]));
   INX0 Fp12644A (.Q(n_7), 
	.A(A[16]));
   INX0 Fp9836A (.Q(n_6), 
	.A(A[8]));
   INX0 Fp13347A (.Q(n_5), 
	.A(A[18]));
   INX0 Fp10538A (.Q(n_4), 
	.A(A[10]));
   INX0 Fp11242A (.Q(n_3), 
	.A(A[12]));
   INX0 Fp14514A (.Q(n_2), 
	.A(A[22]));
   INX0 Fp8430A (.Q(n_1), 
	.A(A[4]));
   INX0 Fp11944A (.Q(n_0), 
	.A(A[14]));
endmodule

module increment_unsigned_164_165_4489 (
	A, 
	CI, 
	Z);
   input [23:0] A;
   input CI;
   output [24:0] Z;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_4;
   wire n_6;
   wire n_8;
   wire n_10;
   wire n_12;
   wire n_14;
   wire n_16;
   wire n_18;
   wire n_20;
   wire n_22;
   wire n_24;
   wire n_26;
   wire n_28;
   wire n_30;
   wire n_32;
   wire n_34;
   wire n_36;
   wire n_38;
   wire n_40;
   wire n_42;

   assign Z[0] = 1'b0 ;
   assign Z[24] = 1'b0 ;

   EN2X0 p11684A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p11859A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p11443A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p12019A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p11136A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p12194A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p10844A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p12354A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p10537A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p12529A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p10245A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p12689A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p9937A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p12864A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p9646A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p13022A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p9336A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p13199A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p9046A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p13353A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p8733A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p13534A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p8447A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p13684A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p8100A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p13869A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p7847A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p14012A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p7415A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p14204A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p7165A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p14323A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p6717A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p14538A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p6478A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p14609A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p6052A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p14832A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p5796A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p14449A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p5382A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p14691A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p5137A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p14620A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p4943A (.Q(n_0), 
	.B(A[0]), 
	.A(A[1]));
endmodule

module timer1 (
	timers_clock_i, 
	timers_reset_i_b, 
	timers_int1_i, 
	timers_sfr_tmod_gate_t1_i, 
	timers_sfr_tmod_m0t1_i, 
	timers_sfr_tmod_m1t1_i, 
	timers_sfr_tcon_tr1_i, 
	timers_sfr_th1_i, 
	timers_sfr_tm1_i, 
	timers_sfr_tl1_i, 
	timers_sfr_tcon_tf1_i, 
	timers_sfr_tcon_tf1_o, 
	timers_sfr_th1_o, 
	timers_sfr_tm1_o, 
	timers_sfr_tl1_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdi_1, 
	FE_PT1__top_timers_sfr_th0_o_0__, 
	FE_PT1_top_p0_y_i_6_);
   input timers_clock_i;
   input timers_reset_i_b;
   input timers_int1_i;
   input timers_sfr_tmod_gate_t1_i;
   input timers_sfr_tmod_m0t1_i;
   input timers_sfr_tmod_m1t1_i;
   input timers_sfr_tcon_tr1_i;
   input [7:0] timers_sfr_th1_i;
   input [7:0] timers_sfr_tm1_i;
   input [7:0] timers_sfr_tl1_i;
   input timers_sfr_tcon_tf1_i;
   output timers_sfr_tcon_tf1_o;
   output [7:0] timers_sfr_th1_o;
   output [7:0] timers_sfr_tm1_o;
   output [7:0] timers_sfr_tl1_o;
   input DFT_sdi;
   input DFT_sen;
   input DFT_sdi_1;
   input FE_PT1__top_timers_sfr_th0_o_0__;
   input FE_PT1_top_p0_y_i_6_;

   // Internal wires
   wire UNCONNECTED63;
   wire UNCONNECTED64;
   wire UNCONNECTED65;
   wire UNCONNECTED66;
   wire n_0;
   wire n_1;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;

   decrement_unsigned_166_167_4490 dec_sub_167_61 (.A({ timers_sfr_th1_i[7],
		timers_sfr_th1_i[6],
		timers_sfr_th1_i[5],
		timers_sfr_th1_i[4],
		timers_sfr_th1_i[3],
		timers_sfr_th1_i[2],
		timers_sfr_th1_i[1],
		timers_sfr_th1_i[0],
		timers_sfr_tm1_i[7],
		timers_sfr_tm1_i[6],
		timers_sfr_tm1_i[5],
		timers_sfr_tm1_i[4],
		timers_sfr_tm1_i[3],
		timers_sfr_tm1_i[2],
		timers_sfr_tm1_i[1],
		timers_sfr_tm1_i[0],
		timers_sfr_tl1_i[7],
		timers_sfr_tl1_i[6],
		timers_sfr_tl1_i[5],
		timers_sfr_tl1_i[4],
		timers_sfr_tl1_i[3],
		timers_sfr_tl1_i[2],
		timers_sfr_tl1_i[1],
		timers_sfr_tl1_i[0] }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED63,
		n_56,
		n_57,
		n_58,
		n_59,
		n_60,
		n_61,
		n_62,
		n_63,
		n_64,
		n_65,
		n_66,
		n_67,
		n_69,
		n_70,
		n_71,
		n_72,
		n_73,
		n_74,
		n_75,
		n_76,
		n_77,
		n_78,
		n_80,
		UNCONNECTED64 }));
   increment_unsigned_164_165_4489 inc_add_140_57 (.A({ timers_sfr_th1_i[7],
		timers_sfr_th1_i[6],
		timers_sfr_th1_i[5],
		timers_sfr_th1_i[4],
		timers_sfr_th1_i[3],
		timers_sfr_th1_i[2],
		timers_sfr_th1_i[1],
		timers_sfr_th1_i[0],
		timers_sfr_tm1_i[7],
		timers_sfr_tm1_i[6],
		timers_sfr_tm1_i[5],
		timers_sfr_tm1_i[4],
		timers_sfr_tm1_i[3],
		timers_sfr_tm1_i[2],
		timers_sfr_tm1_i[1],
		timers_sfr_tm1_i[0],
		timers_sfr_tl1_i[7],
		timers_sfr_tl1_i[6],
		timers_sfr_tl1_i[5],
		timers_sfr_tl1_i[4],
		timers_sfr_tl1_i[3],
		timers_sfr_tl1_i[2],
		timers_sfr_tl1_i[1],
		timers_sfr_tl1_i[0] }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED65,
		n_81,
		n_82,
		n_83,
		n_84,
		n_85,
		n_86,
		n_87,
		n_88,
		n_89,
		n_90,
		n_91,
		n_92,
		n_93,
		n_94,
		n_95,
		n_96,
		n_97,
		n_98,
		n_99,
		n_100,
		n_101,
		n_102,
		n_103,
		UNCONNECTED66 }));
   SDFRQX0 \timers_sfr_th1_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(timers_sfr_th1_o[0]), 
	.D(n_49), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[1]  (.SE(DFT_sen), 
	.SD(FE_PT1__top_timers_sfr_th0_o_0__), 
	.Q(timers_sfr_th1_o[1]), 
	.D(n_48), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[1]), 
	.Q(timers_sfr_th1_o[2]), 
	.D(n_47), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[2]), 
	.Q(timers_sfr_th1_o[3]), 
	.D(n_46), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[3]), 
	.Q(timers_sfr_th1_o[4]), 
	.D(n_45), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[4]), 
	.Q(timers_sfr_th1_o[5]), 
	.D(n_44), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[6]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(timers_sfr_th1_o[6]), 
	.D(n_43), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[0]), 
	.Q(timers_sfr_th1_o[7]), 
	.D(n_42), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[7]), 
	.Q(timers_sfr_tl1_o[0]), 
	.D(n_41), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[2]), 
	.Q(timers_sfr_tl1_o[1]), 
	.D(n_40), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[6]), 
	.Q(timers_sfr_tl1_o[2]), 
	.D(n_39), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[4]), 
	.Q(timers_sfr_tl1_o[3]), 
	.D(n_38), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[5]), 
	.Q(timers_sfr_tl1_o[4]), 
	.D(n_37), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[6]), 
	.Q(timers_sfr_tl1_o[5]), 
	.D(n_36), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[7]), 
	.Q(timers_sfr_tl1_o[6]), 
	.D(n_35), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[7]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_6_), 
	.Q(timers_sfr_tl1_o[7]), 
	.D(n_34), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[1]), 
	.Q(timers_sfr_tm1_o[0]), 
	.D(n_33), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[3]), 
	.Q(timers_sfr_tm1_o[1]), 
	.D(n_32), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[0]), 
	.Q(timers_sfr_tm1_o[2]), 
	.D(n_31), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[2]), 
	.Q(timers_sfr_tm1_o[3]), 
	.D(n_30), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[3]), 
	.Q(timers_sfr_tm1_o[4]), 
	.D(n_29), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[4]), 
	.Q(timers_sfr_tm1_o[5]), 
	.D(n_28), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[5]), 
	.Q(timers_sfr_tm1_o[6]), 
	.D(n_27), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[1]), 
	.Q(timers_sfr_tm1_o[7]), 
	.D(n_26), 
	.C(timers_clock_i));
   AO222X0 p12630A (.Q(n_49), 
	.F(n_88), 
	.E(n_23), 
	.D(n_63), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[0]));
   AO222X0 p12454A (.Q(n_48), 
	.F(n_87), 
	.E(n_23), 
	.D(n_62), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[1]));
   AO222X0 p12295A (.Q(n_47), 
	.F(n_86), 
	.E(n_23), 
	.D(n_61), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[2]));
   AO222X0 p12118A (.Q(n_46), 
	.F(n_85), 
	.E(n_23), 
	.D(n_60), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[3]));
   AO222X0 p11960A (.Q(n_45), 
	.F(n_84), 
	.E(n_23), 
	.D(n_59), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[4]));
   AO222X0 p11784A (.Q(n_44), 
	.F(n_83), 
	.E(n_23), 
	.D(n_58), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[5]));
   AO222X0 p11623A (.Q(n_43), 
	.F(n_82), 
	.E(n_23), 
	.D(n_57), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[6]));
   AO222X0 p11408A (.Q(n_42), 
	.F(n_81), 
	.E(n_23), 
	.D(n_56), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[7]));
   AO32X0 p15057A (.Q(n_41), 
	.E(n_25), 
	.D(timers_sfr_tl1_i[0]), 
	.C(n_21), 
	.B(timers_reset_i_b), 
	.A(n_22));
   AO222X0 p14633A (.Q(n_40), 
	.F(n_24), 
	.E(n_80), 
	.D(n_25), 
	.C(timers_sfr_tl1_i[1]), 
	.B(n_23), 
	.A(n_103));
   AO222X0 p14633A1854 (.Q(n_39), 
	.F(n_24), 
	.E(n_78), 
	.D(n_25), 
	.C(timers_sfr_tl1_i[2]), 
	.B(n_23), 
	.A(n_102));
   AO222X0 p14581A (.Q(n_38), 
	.F(n_77), 
	.E(n_24), 
	.D(n_25), 
	.C(timers_sfr_tl1_i[3]), 
	.B(n_23), 
	.A(n_101));
   AO222X0 p14544A (.Q(n_37), 
	.F(n_100), 
	.E(n_23), 
	.D(n_76), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[4]));
   AO222X0 p14457A (.Q(n_36), 
	.F(n_99), 
	.E(n_23), 
	.D(n_75), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[5]));
   AO222X0 p14305A (.Q(n_35), 
	.F(n_98), 
	.E(n_23), 
	.D(n_74), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[6]));
   AO222X0 p14128A (.Q(n_34), 
	.F(n_97), 
	.E(n_23), 
	.D(n_73), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[7]));
   AO222X0 p13970A (.Q(n_33), 
	.F(n_96), 
	.E(n_23), 
	.D(n_72), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[0]));
   AO222X0 p13794A (.Q(n_32), 
	.F(n_95), 
	.E(n_23), 
	.D(n_71), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[1]));
   AO222X0 p13635A (.Q(n_31), 
	.F(n_94), 
	.E(n_23), 
	.D(n_70), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[2]));
   AO222X0 p13458A (.Q(n_30), 
	.F(n_93), 
	.E(n_23), 
	.D(n_69), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[3]));
   AO222X0 p13300A (.Q(n_29), 
	.F(n_92), 
	.E(n_23), 
	.D(n_67), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[4]));
   AO222X0 p13124A (.Q(n_28), 
	.F(n_91), 
	.E(n_23), 
	.D(n_66), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[5]));
   AO222X0 p12965A (.Q(n_27), 
	.F(n_90), 
	.E(n_23), 
	.D(n_65), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[6]));
   AO222X0 p12788A (.Q(n_26), 
	.F(n_89), 
	.E(n_23), 
	.D(n_64), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[7]));
   NO2I1X0 p14308A (.Q(n_25), 
	.B(n_21), 
	.AN(timers_reset_i_b));
   NO3I1X0 p14293A (.Q(n_24), 
	.C(n_50), 
	.B(n_52), 
	.AN(timers_reset_i_b));
   AND3X0 p14281A (.Q(n_23), 
	.C(n_20), 
	.B(n_51), 
	.A(timers_reset_i_b));
   INX0 Fp13835A (.Q(n_22), 
	.A(timers_sfr_tl1_i[0]));
   NO2X0 p14336A (.Q(n_21), 
	.B(n_52), 
	.A(n_19));
   INX0 Fp13629A1855 (.Q(n_20), 
	.A(n_52));
   EO2X0 p14047A (.Q(n_19), 
	.B(timers_sfr_tmod_m0t1_i), 
	.A(timers_sfr_tmod_m1t1_i));
   AO321X0 p14057A (.Q(timers_sfr_tcon_tf1_o), 
	.F(timers_sfr_tcon_tf1_i), 
	.E(n_13), 
	.D(n_14), 
	.C(n_15), 
	.B(n_16), 
	.A(n_17));
   AND6X0 p13935A (.Q(n_15), 
	.F(timers_sfr_tm1_i[2]), 
	.E(timers_sfr_tl1_i[7]), 
	.D(n_11), 
	.C(timers_sfr_tm1_i[1]), 
	.B(timers_sfr_tm1_i[0]), 
	.A(n_12));
   NO6X0 p13759A (.Q(n_14), 
	.F(timers_sfr_tm1_i[2]), 
	.E(timers_sfr_tm1_i[0]), 
	.D(n_9), 
	.C(timers_sfr_tl1_i[7]), 
	.B(timers_sfr_tm1_i[1]), 
	.A(n_10));
   NA3X0 p13758A (.Q(n_10), 
	.C(n_7), 
	.B(n_8), 
	.A(n_51));
   NO3X0 p14052A (.Q(n_12), 
	.C(n_5), 
	.B(n_6), 
	.A(n_50));
   NO6X0 p13839A (.Q(n_13), 
	.F(timers_sfr_th1_i[4]), 
	.E(timers_sfr_th1_i[2]), 
	.D(n_3), 
	.C(timers_sfr_th1_i[1]), 
	.B(timers_sfr_th1_i[3]), 
	.A(n_4));
   OR5X0 p13674A (.Q(n_4), 
	.E(timers_sfr_tl1_i[2]), 
	.D(timers_sfr_th1_i[0]), 
	.C(timers_sfr_tl1_i[1]), 
	.B(timers_sfr_tm1_i[7]), 
	.A(n_52));
   AND5X0 p14008A (.Q(n_17), 
	.E(timers_sfr_tl1_i[1]), 
	.D(timers_sfr_tl1_i[2]), 
	.C(timers_sfr_th1_i[0]), 
	.B(timers_sfr_tm1_i[7]), 
	.A(n_20));
   AND5X0 p14115A (.Q(n_16), 
	.E(timers_sfr_th1_i[1]), 
	.D(timers_sfr_th1_i[2]), 
	.C(timers_sfr_th1_i[4]), 
	.B(timers_sfr_th1_i[3]), 
	.A(n_1));
   ON21X0 p13470A (.Q(n_52), 
	.C(timers_sfr_tcon_tr1_i), 
	.B(timers_int1_i), 
	.A(n_0));
   AND4X0 p14055A (.Q(n_11), 
	.D(timers_sfr_tm1_i[4]), 
	.C(timers_sfr_tm1_i[5]), 
	.B(timers_sfr_tm1_i[6]), 
	.A(timers_sfr_tm1_i[3]));
   OR4X0 p13775A (.Q(n_9), 
	.D(timers_sfr_tm1_i[5]), 
	.C(timers_sfr_tm1_i[6]), 
	.B(timers_sfr_tm1_i[3]), 
	.A(timers_sfr_tm1_i[4]));
   OR4X0 p13842A (.Q(n_3), 
	.D(timers_sfr_th1_i[6]), 
	.C(timers_sfr_tl1_i[0]), 
	.B(timers_sfr_th1_i[5]), 
	.A(timers_sfr_th1_i[7]));
   AND4X0 p14027A (.Q(n_1), 
	.D(timers_sfr_tl1_i[0]), 
	.C(timers_sfr_th1_i[6]), 
	.B(timers_sfr_th1_i[5]), 
	.A(timers_sfr_th1_i[7]));
   NO2X0 p13799A (.Q(n_8), 
	.B(timers_sfr_tl1_i[6]), 
	.A(timers_sfr_tl1_i[5]));
   NA2X0 p14009A (.Q(n_5), 
	.B(timers_sfr_tl1_i[5]), 
	.A(timers_sfr_tl1_i[6]));
   NO2X0 p13722A (.Q(n_51), 
	.B(timers_sfr_tmod_m0t1_i), 
	.A(timers_sfr_tmod_m1t1_i));
   NA2X0 p13814A (.Q(n_50), 
	.B(timers_sfr_tmod_m0t1_i), 
	.A(timers_sfr_tmod_m1t1_i));
   NA2X0 p14017A (.Q(n_6), 
	.B(timers_sfr_tl1_i[3]), 
	.A(timers_sfr_tl1_i[4]));
   NO2X0 p13774A (.Q(n_7), 
	.B(timers_sfr_tl1_i[4]), 
	.A(timers_sfr_tl1_i[3]));
   INX0 Fp13452A (.Q(n_0), 
	.A(timers_sfr_tmod_gate_t1_i));
endmodule

module increment_unsigned_164_165_4513 (
	A, 
	CI, 
	Z);
   input [23:0] A;
   input CI;
   output [24:0] Z;

   // Internal wires
   wire n_0;
   wire n_2;
   wire n_4;
   wire n_6;
   wire n_8;
   wire n_10;
   wire n_12;
   wire n_14;
   wire n_16;
   wire n_18;
   wire n_20;
   wire n_22;
   wire n_24;
   wire n_26;
   wire n_28;
   wire n_30;
   wire n_32;
   wire n_34;
   wire n_36;
   wire n_38;
   wire n_40;
   wire n_42;

   assign Z[0] = 1'b0 ;
   assign Z[24] = 1'b0 ;

   EN2X0 p35916A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p36088A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p35671A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p36260A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p35376A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p36432A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p35081A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p36604A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p34786A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p36776A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p34490A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p36948A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p34195A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p37119A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p33900A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p37292A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p33605A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p37463A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p33309A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p37635A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p33014A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p37807A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p32718A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p37983A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p32427A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p38151A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p32128A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p38337A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p31847A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p38494A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p31537A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p38693A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p31269A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p38842A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p30950A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p39049A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p30690A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p39186A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p30360A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p39424A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p30131A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p39701A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p29927A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p39759A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p29821A (.Q(n_0), 
	.B(A[1]), 
	.A(A[0]));
endmodule

module timers_timer2_acg (
	timers_timer2_acg_clock_i, 
	timers_timer2_acg_reset_i_b, 
	timers_timer2_acg_pdf_pht_i, 
	timers_sfr_tacpl_i, 
	timers_sfr_tacph_i, 
	timers_sfr_tcon2_tf2_i, 
	timers_sfr_tcon2_tr2_i, 
	timers_sfr_acrh_o, 
	timers_sfr_acrm_o, 
	timers_sfr_acrl_o, 
	timers_sfr_tcon2_tf2_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	FE_PT1__top_timers_sfr_th1_o_6__, 
	FE_PT1_top_p0_y_i_7_);
   input timers_timer2_acg_clock_i;
   input timers_timer2_acg_reset_i_b;
   input timers_timer2_acg_pdf_pht_i;
   input [7:0] timers_sfr_tacpl_i;
   input [1:0] timers_sfr_tacph_i;
   input timers_sfr_tcon2_tf2_i;
   input timers_sfr_tcon2_tr2_i;
   output [7:0] timers_sfr_acrh_o;
   output [7:0] timers_sfr_acrm_o;
   output [7:0] timers_sfr_acrl_o;
   output timers_sfr_tcon2_tf2_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   input FE_PT1__top_timers_sfr_th1_o_6__;
   input FE_PT1_top_p0_y_i_7_;

   // Internal wires
   wire UNCONNECTED67;
   wire UNCONNECTED68;
   wire acr_inc;
   wire \angle_clk[0] ;
   wire \angle_clk[1] ;
   wire \angle_clk[2] ;
   wire \angle_clk[3] ;
   wire \angle_clk[4] ;
   wire \angle_clk[5] ;
   wire \angle_clk[6] ;
   wire \angle_clk[7] ;
   wire \angle_clk[8] ;
   wire \angle_clk[9] ;
   wire \angle_clk_period[0] ;
   wire \angle_clk_period[1] ;
   wire \angle_clk_period[2] ;
   wire \angle_clk_period[3] ;
   wire \angle_clk_period[4] ;
   wire \angle_clk_period[5] ;
   wire \angle_clk_period[6] ;
   wire \angle_clk_period[7] ;
   wire \angle_clk_period[8] ;
   wire \angle_clk_period[9] ;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;
   wire n_47;
   wire n_48;
   wire n_49;
   wire n_50;
   wire n_51;
   wire n_52;
   wire n_53;
   wire n_54;
   wire n_55;
   wire n_56;
   wire n_57;
   wire n_58;
   wire n_59;
   wire n_60;
   wire n_61;
   wire n_62;
   wire n_63;
   wire n_64;
   wire n_65;
   wire n_66;
   wire n_67;
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
   wire n_72;
   wire n_73;
   wire n_74;
   wire n_75;
   wire n_76;
   wire n_77;
   wire n_78;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_82;
   wire n_83;
   wire n_84;
   wire n_85;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_90;
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
   wire n_96;
   wire n_97;
   wire n_98;
   wire n_99;
   wire n_100;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_104;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_108;
   wire n_109;
   wire n_110;
   wire n_111;
   wire n_112;
   wire n_113;
   wire n_114;
   wire n_115;
   wire n_116;
   wire n_117;
   wire n_118;
   wire n_119;
   wire n_120;
   wire n_121;
   wire n_122;
   wire n_123;
   wire n_124;
   wire n_125;
   wire n_126;
   wire n_127;
   wire n_128;
   wire n_129;
   wire n_130;
   wire n_131;
   wire n_132;
   wire n_133;
   wire n_134;
   wire n_135;
   wire n_136;
   wire n_137;
   wire n_138;
   wire n_139;
   wire n_140;
   wire n_141;
   wire n_142;
   wire n_143;
   wire n_144;
   wire n_145;
   wire n_146;
   wire n_147;
   wire n_148;
   wire n_149;
   wire n_150;
   wire n_151;
   wire n_152;
   wire n_153;
   wire n_154;
   wire n_155;
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;
   wire n_160;
   wire n_161;
   wire n_162;
   wire n_163;
   wire n_164;
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_169;
   wire n_170;
   wire n_171;
   wire n_172;
   wire n_173;
   wire n_174;
   wire n_175;
   wire n_176;
   wire n_177;
   wire n_178;
   wire n_179;
   wire n_180;
   wire n_181;
   wire n_182;
   wire n_183;
   wire n_184;
   wire n_185;
   wire n_186;
   wire n_187;
   wire n_188;
   wire n_189;
   wire n_190;
   wire n_191;
   wire n_192;
   wire n_193;
   wire n_194;
   wire n_195;
   wire n_196;
   wire n_197;
   wire n_198;
   wire n_199;
   wire n_200;
   wire n_201;
   wire n_202;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_206;
   wire n_207;
   wire n_208;
   wire n_209;
   wire n_210;
   wire n_211;
   wire n_212;
   wire n_213;
   wire n_214;
   wire n_215;
   wire n_216;
   wire n_217;
   wire n_218;
   wire n_219;
   wire n_220;
   wire n_221;
   wire n_222;
   wire n_223;
   wire n_224;
   wire n_225;
   wire n_226;
   wire n_227;
   wire n_228;
   wire n_229;
   wire n_230;
   wire n_231;
   wire n_232;
   wire n_233;
   wire n_234;
   wire n_235;
   wire n_236;
   wire n_237;
   wire n_238;
   wire n_239;
   wire n_240;
   wire n_241;
   wire n_242;
   wire n_243;
   wire n_244;
   wire n_245;
   wire n_246;
   wire n_247;
   wire n_248;
   wire n_249;
   wire n_250;
   wire n_251;
   wire n_252;
   wire n_253;
   wire n_254;
   wire n_255;
   wire n_256;
   wire \state[0] ;

   increment_unsigned_164_165_4513 inc_add_274_55 (.A({ timers_sfr_acrh_o[7],
		timers_sfr_acrh_o[6],
		timers_sfr_acrh_o[5],
		timers_sfr_acrh_o[4],
		timers_sfr_acrh_o[3],
		timers_sfr_acrh_o[2],
		timers_sfr_acrh_o[1],
		timers_sfr_acrh_o[0],
		timers_sfr_acrm_o[7],
		timers_sfr_acrm_o[6],
		timers_sfr_acrm_o[5],
		timers_sfr_acrm_o[4],
		timers_sfr_acrm_o[3],
		timers_sfr_acrm_o[2],
		timers_sfr_acrm_o[1],
		timers_sfr_acrm_o[0],
		timers_sfr_acrl_o[7],
		timers_sfr_acrl_o[6],
		timers_sfr_acrl_o[5],
		timers_sfr_acrl_o[4],
		timers_sfr_acrl_o[3],
		timers_sfr_acrl_o[2],
		timers_sfr_acrl_o[1],
		timers_sfr_acrl_o[0] }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED67,
		n_234,
		n_235,
		n_236,
		n_237,
		n_238,
		n_239,
		n_240,
		n_241,
		n_242,
		n_243,
		n_244,
		n_245,
		n_246,
		n_247,
		n_248,
		n_249,
		n_250,
		n_251,
		n_252,
		n_253,
		n_254,
		n_255,
		n_256,
		UNCONNECTED68 }));
   SDFRQX0 timers_sfr_tcon2_tf2_o_reg (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[0]), 
	.Q(timers_sfr_tcon2_tf2_o), 
	.D(n_233), 
	.C(timers_timer2_acg_clock_i));
   MU2X0 p15140A (.S(n_232), 
	.Q(n_233), 
	.IN1(n_231), 
	.IN0(timers_sfr_tcon2_tf2_i));
   NA2I1X0 p14883A (.Q(n_232), 
	.B(timers_timer2_acg_reset_i_b), 
	.AN(n_231));
   AND6X0 p14574A (.Q(n_231), 
	.F(timers_sfr_acrh_o[6]), 
	.E(timers_timer2_acg_reset_i_b), 
	.D(n_228), 
	.C(timers_sfr_acrh_o[7]), 
	.B(n_225), 
	.A(n_230));
   AND6X0 p37935A (.Q(n_230), 
	.F(timers_sfr_acrl_o[3]), 
	.E(timers_sfr_acrl_o[0]), 
	.D(n_226), 
	.C(timers_sfr_acrl_o[2]), 
	.B(timers_sfr_acrl_o[1]), 
	.A(n_229));
   AND5X0 p37618A (.Q(n_229), 
	.E(timers_sfr_acrm_o[0]), 
	.D(timers_sfr_acrm_o[2]), 
	.C(timers_sfr_acrm_o[3]), 
	.B(timers_sfr_acrm_o[1]), 
	.A(n_227));
   AND4X0 p38711A (.Q(n_228), 
	.D(timers_sfr_acrh_o[3]), 
	.C(timers_sfr_acrh_o[0]), 
	.B(timers_sfr_acrh_o[1]), 
	.A(timers_sfr_acrh_o[2]));
   AND4X0 p37826A (.Q(n_227), 
	.D(timers_sfr_acrm_o[5]), 
	.C(timers_sfr_acrm_o[6]), 
	.B(timers_sfr_acrm_o[7]), 
	.A(timers_sfr_acrm_o[4]));
   AND4X0 p38199A (.Q(n_226), 
	.D(timers_sfr_acrl_o[5]), 
	.C(timers_sfr_acrl_o[6]), 
	.B(timers_sfr_acrl_o[7]), 
	.A(timers_sfr_acrl_o[4]));
   AND2X0 p38820A (.Q(n_225), 
	.B(timers_sfr_acrh_o[5]), 
	.A(timers_sfr_acrh_o[4]));
   SDFRQX0 acr_inc_reg (.SE(DFT_sen), 
	.SD(\angle_clk_period[0] ), 
	.Q(acr_inc), 
	.D(n_193), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[0]  (.SE(DFT_sen), 
	.SD(\angle_clk[1] ), 
	.Q(\angle_clk_period[0] ), 
	.D(n_184), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[1]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[2] ), 
	.Q(\angle_clk_period[1] ), 
	.D(n_203), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[2]  (.SE(DFT_sen), 
	.SD(FE_PT1__top_timers_sfr_th1_o_6__), 
	.Q(\angle_clk_period[2] ), 
	.D(n_206), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[3]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[1] ), 
	.Q(\angle_clk_period[3] ), 
	.D(n_205), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[4]  (.SE(DFT_sen), 
	.SD(\angle_clk[4] ), 
	.Q(\angle_clk_period[4] ), 
	.D(n_208), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[5]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[4] ), 
	.Q(\angle_clk_period[5] ), 
	.D(n_210), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[6]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[5] ), 
	.Q(\angle_clk_period[6] ), 
	.D(n_207), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[7]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[6] ), 
	.Q(\angle_clk_period[7] ), 
	.D(n_221), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[8]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[7] ), 
	.Q(\angle_clk_period[8] ), 
	.D(n_223), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[9]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[8] ), 
	.Q(\angle_clk_period[9] ), 
	.D(n_224), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[0]  (.SE(DFT_sen), 
	.SD(acr_inc), 
	.Q(\angle_clk[0] ), 
	.D(n_211), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[1]  (.SE(DFT_sen), 
	.SD(\angle_clk[2] ), 
	.Q(\angle_clk[1] ), 
	.D(n_219), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[2]  (.SE(DFT_sen), 
	.SD(\angle_clk[3] ), 
	.Q(\angle_clk[2] ), 
	.D(n_218), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[3]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[3] ), 
	.Q(\angle_clk[3] ), 
	.D(n_217), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[4]  (.SE(DFT_sen), 
	.SD(\angle_clk[5] ), 
	.Q(\angle_clk[4] ), 
	.D(n_216), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[5]  (.SE(DFT_sen), 
	.SD(\angle_clk[6] ), 
	.Q(\angle_clk[5] ), 
	.D(n_220), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[6]  (.SE(DFT_sen), 
	.SD(\angle_clk[0] ), 
	.Q(\angle_clk[6] ), 
	.D(n_215), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[7]  (.SE(DFT_sen), 
	.SD(\angle_clk[8] ), 
	.Q(\angle_clk[7] ), 
	.D(n_214), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[8]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[9] ), 
	.Q(\angle_clk[8] ), 
	.D(n_213), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_reg[9]  (.SE(DFT_sen), 
	.SD(\angle_clk[7] ), 
	.Q(\angle_clk[9] ), 
	.D(n_209), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \state_reg[0]  (.SE(DFT_sen), 
	.SD(\angle_clk[9] ), 
	.Q(\state[0] ), 
	.D(n_157), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \state_reg[1]  (.SE(DFT_sen), 
	.SD(\state[0] ), 
	.Q(DFT_sdo), 
	.D(n_63), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(timers_sfr_acrh_o[0]), 
	.D(n_74), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[0]), 
	.Q(timers_sfr_acrh_o[1]), 
	.D(n_73), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[7]), 
	.Q(timers_sfr_acrh_o[2]), 
	.D(n_72), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[2]), 
	.Q(timers_sfr_acrh_o[3]), 
	.D(n_71), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_tcon2_tf2_o), 
	.Q(timers_sfr_acrh_o[4]), 
	.D(n_70), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[4]), 
	.Q(timers_sfr_acrh_o[5]), 
	.D(n_68), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[7]), 
	.Q(timers_sfr_acrh_o[6]), 
	.D(n_67), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[5]), 
	.Q(timers_sfr_acrh_o[7]), 
	.D(n_90), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[3]), 
	.Q(timers_sfr_acrl_o[0]), 
	.D(n_66), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[3]), 
	.Q(timers_sfr_acrl_o[1]), 
	.D(n_88), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[1]), 
	.Q(timers_sfr_acrl_o[2]), 
	.D(n_86), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[4]), 
	.Q(timers_sfr_acrl_o[3]), 
	.D(n_69), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[5]), 
	.Q(timers_sfr_acrl_o[4]), 
	.D(n_75), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[6]), 
	.Q(timers_sfr_acrl_o[5]), 
	.D(n_85), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[7]), 
	.Q(timers_sfr_acrl_o[6]), 
	.D(n_78), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[0]), 
	.Q(timers_sfr_acrl_o[7]), 
	.D(n_84), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[1]), 
	.Q(timers_sfr_acrm_o[0]), 
	.D(n_76), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[5]), 
	.Q(timers_sfr_acrm_o[1]), 
	.D(n_83), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[3]), 
	.Q(timers_sfr_acrm_o[2]), 
	.D(n_89), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[3]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_7_), 
	.Q(timers_sfr_acrm_o[3]), 
	.D(n_82), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[2]), 
	.Q(timers_sfr_acrm_o[4]), 
	.D(n_87), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[1]), 
	.Q(timers_sfr_acrm_o[5]), 
	.D(n_81), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[4]), 
	.Q(timers_sfr_acrm_o[6]), 
	.D(n_77), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[2]), 
	.Q(timers_sfr_acrm_o[7]), 
	.D(n_80), 
	.C(timers_timer2_acg_clock_i));
   AO21X0 p14297A (.Q(n_224), 
	.C(n_194), 
	.B(\angle_clk_period[9] ), 
	.A(n_222));
   ON321X0 p14571A (.Q(n_223), 
	.F(n_187), 
	.E(n_212), 
	.D(n_4), 
	.C(n_178), 
	.B(\angle_clk_period[8] ), 
	.A(n_1));
   ON21X0 p14233A (.Q(n_222), 
	.C(n_212), 
	.B(\angle_clk_period[8] ), 
	.A(n_166));
   AO21X0 p14572A (.Q(n_221), 
	.C(n_195), 
	.B(\angle_clk_period[7] ), 
	.A(n_204));
   AO221X0 p14398A (.Q(n_220), 
	.E(n_190), 
	.D(n_163), 
	.C(n_113), 
	.B(n_160), 
	.A(\angle_clk_period[5] ));
   AO221X0 p14406A (.Q(n_219), 
	.E(n_192), 
	.D(n_160), 
	.C(\angle_clk_period[1] ), 
	.B(n_163), 
	.A(n_35));
   ON21X0 p14832A (.Q(n_218), 
	.C(n_201), 
	.B(n_64), 
	.A(n_164));
   ON21X0 p14832A7059 (.Q(n_217), 
	.C(n_200), 
	.B(n_98), 
	.A(n_164));
   ON21X0 p14832A7060 (.Q(n_216), 
	.C(n_199), 
	.B(n_106), 
	.A(n_164));
   ON21X0 p14832A7061 (.Q(n_215), 
	.C(n_198), 
	.B(n_119), 
	.A(n_164));
   ON21X0 p14856A (.Q(n_214), 
	.C(n_197), 
	.B(n_125), 
	.A(n_164));
   ON21X0 p14844A (.Q(n_213), 
	.C(n_196), 
	.B(n_131), 
	.A(n_164));
   AN21X0 p13942A (.Q(n_212), 
	.C(n_204), 
	.B(n_1), 
	.A(n_165));
   ON211X0 p14809A (.Q(n_211), 
	.D(n_181), 
	.C(n_185), 
	.B(\angle_clk_period[0] ), 
	.A(n_164));
   AO221X0 p14405A (.Q(n_210), 
	.E(n_186), 
	.D(n_165), 
	.C(n_105), 
	.B(n_191), 
	.A(\angle_clk_period[5] ));
   AO221X0 p14394A (.Q(n_209), 
	.E(n_183), 
	.D(n_163), 
	.C(n_135), 
	.B(n_160), 
	.A(\angle_clk_period[9] ));
   AO21X0 p14615A (.Q(n_208), 
	.C(n_202), 
	.B(\angle_clk_period[4] ), 
	.A(n_191));
   ON321X0 p14846A (.Q(n_207), 
	.F(n_188), 
	.E(n_189), 
	.D(n_3), 
	.C(n_166), 
	.B(n_101), 
	.A(\angle_clk_period[6] ));
   ON221X0 p15085A (.Q(n_206), 
	.E(n_180), 
	.D(n_168), 
	.C(n_64), 
	.B(n_166), 
	.A(n_38));
   ON221X0 p15085A7064 (.Q(n_205), 
	.E(n_179), 
	.D(n_168), 
	.C(n_98), 
	.B(n_166), 
	.A(n_96));
   ON21X0 p13901A (.Q(n_204), 
	.C(n_189), 
	.B(\angle_clk_period[6] ), 
	.A(n_166));
   ON21X0 p15068A (.Q(n_203), 
	.C(n_182), 
	.B(n_35), 
	.A(n_166));
   ON321X0 p14588A (.Q(n_202), 
	.F(n_25), 
	.E(n_168), 
	.D(n_106), 
	.C(n_166), 
	.B(n_94), 
	.A(\angle_clk_period[4] ));
   AN221X0 p14354A (.Q(n_201), 
	.E(n_175), 
	.D(\angle_clk_period[2] ), 
	.C(n_160), 
	.B(n_159), 
	.A(\angle_clk[2] ));
   AN221X0 p14354A7065 (.Q(n_200), 
	.E(n_174), 
	.D(\angle_clk_period[3] ), 
	.C(n_160), 
	.B(n_159), 
	.A(\angle_clk[3] ));
   AN221X0 p14354A7066 (.Q(n_199), 
	.E(n_173), 
	.D(\angle_clk_period[4] ), 
	.C(n_160), 
	.B(n_159), 
	.A(\angle_clk[4] ));
   AN221X0 p14354A7067 (.Q(n_198), 
	.E(n_171), 
	.D(\angle_clk_period[6] ), 
	.C(n_160), 
	.B(n_159), 
	.A(\angle_clk[6] ));
   AN221X0 p14354A7068 (.Q(n_197), 
	.E(n_170), 
	.D(\angle_clk_period[7] ), 
	.C(n_160), 
	.B(n_159), 
	.A(\angle_clk[7] ));
   AN221X0 p14354A7069 (.Q(n_196), 
	.E(n_169), 
	.D(\angle_clk_period[8] ), 
	.C(n_160), 
	.B(n_159), 
	.A(\angle_clk[8] ));
   ON221X0 p14510A (.Q(n_195), 
	.E(n_13), 
	.D(n_168), 
	.C(n_125), 
	.B(n_178), 
	.A(\angle_clk_period[7] ));
   ON321X0 p14422A (.Q(n_194), 
	.F(n_30), 
	.E(n_168), 
	.D(n_134), 
	.C(n_178), 
	.B(n_27), 
	.A(n_4));
   NO2X0 p15780A (.Q(n_193), 
	.B(n_146), 
	.A(n_177));
   AO21X0 p14029A (.Q(n_192), 
	.C(n_176), 
	.B(\angle_clk[1] ), 
	.A(n_159));
   AO21X0 p14108A (.Q(n_191), 
	.C(n_155), 
	.B(n_94), 
	.A(n_165));
   AO21X0 p14030A (.Q(n_190), 
	.C(n_172), 
	.B(\angle_clk[5] ), 
	.A(n_159));
   AN21X0 p13770A (.Q(n_189), 
	.C(n_155), 
	.B(n_101), 
	.A(n_165));
   OA21X0 p14701A (.Q(n_188), 
	.C(n_12), 
	.B(n_119), 
	.A(n_168));
   OA21X0 p14701A7070 (.Q(n_187), 
	.C(n_14), 
	.B(n_131), 
	.A(n_168));
   ON21X0 p14579A (.Q(n_186), 
	.C(n_28), 
	.B(n_112), 
	.A(n_168));
   AN221X0 p14444A (.Q(n_185), 
	.E(n_162), 
	.D(\angle_clk[0] ), 
	.C(n_159), 
	.B(n_149), 
	.A(n_33));
   ON321X0 p15098A (.Q(n_184), 
	.F(n_10), 
	.E(n_156), 
	.D(n_0), 
	.C(n_155), 
	.B(\angle_clk_period[0] ), 
	.A(n_6));
   AO222X0 p13489AT (.Q(n_183), 
	.F(n_6), 
	.E(timers_sfr_tacph_i[1]), 
	.D(n_161), 
	.C(\angle_clk[9] ), 
	.B(n_154), 
	.A(n_149));
   AN221X0 p14660A (.Q(n_182), 
	.E(n_20), 
	.D(n_35), 
	.C(n_167), 
	.B(n_155), 
	.A(\angle_clk_period[1] ));
   NA2X0 p14759A (.Q(n_181), 
	.B(\angle_clk_period[0] ), 
	.A(n_160));
   AN21X0 p15057A (.Q(n_180), 
	.C(n_15), 
	.B(\angle_clk_period[2] ), 
	.A(n_155));
   AN21X0 p15057A7071 (.Q(n_179), 
	.C(n_18), 
	.B(\angle_clk_period[3] ), 
	.A(n_155));
   NA3I1X0 p14205A (.Q(n_178), 
	.C(\angle_clk_period[6] ), 
	.B(n_165), 
	.AN(n_101));
   MU2IX0 p32280A (.S(n_158), 
	.Q(n_177), 
	.IN1(acr_inc), 
	.IN0(n_147));
   AO221X0 p13535A (.Q(n_176), 
	.E(n_20), 
	.D(n_151), 
	.C(n_32), 
	.B(n_149), 
	.A(n_91));
   AO221X0 p14035A (.Q(n_175), 
	.E(n_15), 
	.D(n_151), 
	.C(n_93), 
	.B(n_149), 
	.A(n_103));
   AO221X0 p14035A7072 (.Q(n_174), 
	.E(n_18), 
	.D(n_151), 
	.C(n_100), 
	.B(n_149), 
	.A(n_108));
   ON221X0 p14594A (.Q(n_173), 
	.E(n_25), 
	.D(n_152), 
	.C(n_110), 
	.B(n_150), 
	.A(n_118));
   ON221X0 p14088A (.Q(n_172), 
	.E(n_28), 
	.D(n_152), 
	.C(n_115), 
	.B(n_150), 
	.A(n_124));
   ON221X0 p14594A7073 (.Q(n_171), 
	.E(n_12), 
	.D(n_152), 
	.C(n_121), 
	.B(n_150), 
	.A(n_130));
   ON221X0 p14561A (.Q(n_170), 
	.E(n_13), 
	.D(n_152), 
	.C(n_127), 
	.B(n_137), 
	.A(n_150));
   ON221X0 p14561A7074 (.Q(n_169), 
	.E(n_14), 
	.D(n_152), 
	.C(n_133), 
	.B(n_142), 
	.A(n_150));
   INX0 Fp14444A (.Q(n_167), 
	.A(n_168));
   OR2X0 p13918A (.Q(n_168), 
	.B(n_146), 
	.A(n_155));
   INX0 Fp13491A (.Q(n_165), 
	.A(n_166));
   NA3X0 p13319A (.Q(n_166), 
	.C(timers_timer2_acg_reset_i_b), 
	.B(n_29), 
	.A(n_156));
   INX0 Fp14327A (.Q(n_163), 
	.A(n_164));
   OR3X0 p13766A (.Q(n_164), 
	.C(n_138), 
	.B(n_153), 
	.A(n_159));
   ON21X0 p14621A (.Q(n_162), 
	.C(n_10), 
	.B(\angle_clk[0] ), 
	.A(n_152));
   AO21X0 p13360A (.Q(n_161), 
	.C(n_159), 
	.B(n_132), 
	.A(n_151));
   NO3I1X0 p14507A (.Q(n_160), 
	.C(n_153), 
	.B(n_159), 
	.AN(n_138));
   NO2I1X0 p13209A (.Q(n_159), 
	.B(n_153), 
	.AN(n_26));
   NA2X0 p32108A (.Q(n_158), 
	.B(n_145), 
	.A(n_148));
   NO2X0 p15779A (.Q(n_157), 
	.B(n_6), 
	.A(n_148));
   INX0 Fp13203A7084 (.Q(n_155), 
	.A(n_156));
   OR2X0 p13094A (.Q(n_156), 
	.B(n_139), 
	.A(n_146));
   EO3X0 p29948A (.Q(n_154), 
	.C(\angle_clk[9] ), 
	.B(\angle_clk_period[9] ), 
	.A(n_141));
   NA2X0 p13159A (.Q(n_153), 
	.B(timers_timer2_acg_reset_i_b), 
	.A(n_144));
   INX0 Fp13304A7090 (.Q(n_151), 
	.A(n_152));
   OR2X0 p12538A (.Q(n_152), 
	.B(n_6), 
	.A(n_143));
   INX0 Fp13362A7093 (.Q(n_149), 
	.A(n_150));
   OR2X0 p12583A (.Q(n_150), 
	.B(n_6), 
	.A(n_145));
   NA3X0 p31952A (.Q(n_148), 
	.C(n_11), 
	.B(n_26), 
	.A(n_144));
   OR6X0 p32278A (.Q(n_147), 
	.F(\angle_clk[7] ), 
	.E(n_65), 
	.D(\angle_clk[4] ), 
	.C(\angle_clk[5] ), 
	.B(\angle_clk[9] ), 
	.A(n_143));
   AO21X0 p12521A (.Q(n_146), 
	.C(n_6), 
	.B(n_29), 
	.A(n_140));
   OR2X0 p29502A (.Q(n_145), 
	.B(n_26), 
	.A(n_140));
   NA2I1X0 p29902A (.Q(n_144), 
	.B(DFT_sdo), 
	.AN(n_140));
   NA2I1X0 p29400A (.Q(n_143), 
	.B(n_29), 
	.AN(n_140));
   FAX0 p29604A (.S(n_142), 
	.CO(n_141), 
	.CI(n_4), 
	.B(\angle_clk[8] ), 
	.A(n_136));
   OR2X0 p29065A (.Q(n_140), 
	.B(\state[0] ), 
	.A(n_138));
   NO3I1X0 p30127A (.Q(n_139), 
	.C(n_26), 
	.B(n_138), 
	.AN(\state[0] ));
   NO2X0 p28644A (.Q(n_138), 
	.B(\angle_clk[9] ), 
	.A(n_132));
   FAX0 p29097A (.S(n_137), 
	.CO(n_136), 
	.CI(n_1), 
	.B(\angle_clk[7] ), 
	.A(n_129));
   INX0 Fp31989A (.Q(n_135), 
	.A(n_134));
   EO2X0 p31758A (.Q(n_134), 
	.B(\angle_clk_period[9] ), 
	.A(n_128));
   EN2X0 p31697AT (.Q(n_133), 
	.B(\angle_clk[8] ), 
	.A(n_126));
   NA2I1X0 p28600A (.Q(n_132), 
	.B(n_126), 
	.AN(\angle_clk[8] ));
   OA21X0 p32073A (.Q(n_131), 
	.C(n_128), 
	.B(n_4), 
	.A(n_122));
   FAX0 p28578A (.S(n_130), 
	.CO(n_129), 
	.CI(n_3), 
	.B(\angle_clk[6] ), 
	.A(n_123));
   NA2X0 p31758A7095 (.Q(n_128), 
	.B(n_4), 
	.A(n_122));
   AN21X0 p32351A (.Q(n_127), 
	.C(n_126), 
	.B(\angle_clk[7] ), 
	.A(n_120));
   NO2X0 p28227A (.Q(n_126), 
	.B(\angle_clk[7] ), 
	.A(n_120));
   AN21X0 p32308A (.Q(n_125), 
	.C(n_122), 
	.B(\angle_clk_period[7] ), 
	.A(n_116));
   FAX0 p28095A (.S(n_124), 
	.CO(n_123), 
	.CI(n_8), 
	.B(\angle_clk[5] ), 
	.A(n_117));
   NO2X0 p31432A (.Q(n_122), 
	.B(\angle_clk_period[7] ), 
	.A(n_116));
   EN2X0 p32034AT (.Q(n_121), 
	.B(\angle_clk[6] ), 
	.A(n_114));
   NA2I1X0 p28183A (.Q(n_120), 
	.B(n_114), 
	.AN(\angle_clk[6] ));
   OA21X0 p32384A (.Q(n_119), 
	.C(n_116), 
	.B(n_3), 
	.A(n_111));
   FAX0 p27588A (.S(n_118), 
	.CO(n_117), 
	.CI(n_7), 
	.B(\angle_clk[4] ), 
	.A(n_109));
   NA2X0 p31357A (.Q(n_116), 
	.B(n_3), 
	.A(n_111));
   AN21X0 p32183A (.Q(n_115), 
	.C(n_114), 
	.B(\angle_clk[5] ), 
	.A(n_107));
   NO2X0 p27813A (.Q(n_114), 
	.B(\angle_clk[5] ), 
	.A(n_107));
   INX0 Fp32710A (.Q(n_113), 
	.A(n_112));
   AN21X0 p32498A (.Q(n_112), 
	.C(n_111), 
	.B(\angle_clk_period[5] ), 
	.A(n_102));
   NO2X0 p31018A (.Q(n_111), 
	.B(\angle_clk_period[5] ), 
	.A(n_102));
   EN2X0 p32372AT (.Q(n_110), 
	.B(\angle_clk[4] ), 
	.A(n_99));
   AN21X0 p27410A (.Q(n_109), 
	.C(n_24), 
	.B(n_19), 
	.A(n_104));
   EN2X0 p31820A (.Q(n_108), 
	.B(n_34), 
	.A(n_104));
   NA2I1X0 p27769A (.Q(n_107), 
	.B(n_99), 
	.AN(\angle_clk[4] ));
   OA21X0 p32682A (.Q(n_106), 
	.C(n_102), 
	.B(n_7), 
	.A(n_95));
   ON32X0 p33085A (.Q(n_105), 
	.E(n_8), 
	.D(\angle_clk_period[4] ), 
	.C(n_94), 
	.B(\angle_clk_period[5] ), 
	.A(n_7));
   FAX0 p26948A (.S(n_103), 
	.CO(n_104), 
	.CI(\angle_clk_period[2] ), 
	.B(n_9), 
	.A(n_97));
   NA2X0 p30943A (.Q(n_102), 
	.B(n_7), 
	.A(n_95));
   NA3I1X0 p31682A (.Q(n_101), 
	.C(\angle_clk_period[4] ), 
	.B(\angle_clk_period[5] ), 
	.AN(n_94));
   AO21X0 p32254A (.Q(n_100), 
	.C(n_99), 
	.B(\angle_clk[3] ), 
	.A(n_79));
   NO2X0 p27421A (.Q(n_99), 
	.B(\angle_clk[3] ), 
	.A(n_79));
   AN21X0 p33422A (.Q(n_98), 
	.C(n_95), 
	.B(\angle_clk_period[3] ), 
	.A(n_37));
   ON21X0 p26750A (.Q(n_97), 
	.C(n_92), 
	.B(\angle_clk[1] ), 
	.A(n_31));
   EN2X0 p33540A (.Q(n_96), 
	.B(\angle_clk_period[3] ), 
	.A(n_36));
   NO2X0 p30629A (.Q(n_95), 
	.B(\angle_clk_period[3] ), 
	.A(n_37));
   NA2X0 p31504A (.Q(n_94), 
	.B(\angle_clk_period[3] ), 
	.A(n_36));
   ON21X0 p32806A (.Q(n_93), 
	.C(n_79), 
	.B(n_9), 
	.A(n_16));
   AN21X0 p26669A (.Q(n_92), 
	.C(n_16), 
	.B(\angle_clk_period[1] ), 
	.A(n_23));
   EN3X0 p31533A (.Q(n_91), 
	.C(\angle_clk[1] ), 
	.B(\angle_clk_period[1] ), 
	.A(n_23));
   NO2X0 p15522A (.Q(n_90), 
	.B(n_6), 
	.A(n_49));
   NO2X0 p15522A7121 (.Q(n_89), 
	.B(n_6), 
	.A(n_59));
   NO2X0 p15522A7122 (.Q(n_88), 
	.B(n_6), 
	.A(n_46));
   NO2X0 p15522A7123 (.Q(n_87), 
	.B(n_6), 
	.A(n_57));
   NO2X0 p15522A7124 (.Q(n_86), 
	.B(n_6), 
	.A(n_62));
   NO2X0 p15522A7125 (.Q(n_85), 
	.B(n_6), 
	.A(n_53));
   NO2X0 p15522A7126 (.Q(n_84), 
	.B(n_6), 
	.A(n_50));
   NO2X0 p15522A7127 (.Q(n_83), 
	.B(n_6), 
	.A(n_60));
   NO2X0 p15522A7128 (.Q(n_82), 
	.B(n_6), 
	.A(n_52));
   NO2X0 p15522A7129 (.Q(n_81), 
	.B(n_6), 
	.A(n_45));
   NO2X0 p15522A7130 (.Q(n_80), 
	.B(n_6), 
	.A(n_54));
   NA2X0 p27348A (.Q(n_79), 
	.B(n_9), 
	.A(n_16));
   NO2X0 p15522A7131 (.Q(n_78), 
	.B(n_6), 
	.A(n_47));
   NO2X0 p15522A7132 (.Q(n_77), 
	.B(n_6), 
	.A(n_56));
   NO2X0 p15522A7133 (.Q(n_76), 
	.B(n_6), 
	.A(n_61));
   NO2X0 p15522A7134 (.Q(n_75), 
	.B(n_6), 
	.A(n_44));
   NO2X0 p15522A7135 (.Q(n_74), 
	.B(n_6), 
	.A(n_43));
   NO2X0 p15522A7136 (.Q(n_73), 
	.B(n_6), 
	.A(n_48));
   NO2X0 p15522A7137 (.Q(n_72), 
	.B(n_6), 
	.A(n_42));
   NO2X0 p15522A7138 (.Q(n_71), 
	.B(n_6), 
	.A(n_51));
   NO2X0 p15522A7139 (.Q(n_70), 
	.B(n_6), 
	.A(n_41));
   NO2X0 p15522A7140 (.Q(n_69), 
	.B(n_6), 
	.A(n_58));
   NO2X0 p15522A7141 (.Q(n_68), 
	.B(n_6), 
	.A(n_40));
   NO2X0 p15522A7142 (.Q(n_67), 
	.B(n_6), 
	.A(n_55));
   NO2X0 p15522A7143 (.Q(n_66), 
	.B(n_6), 
	.A(n_39));
   OR5X0 p32810A (.Q(n_65), 
	.E(\angle_clk[2] ), 
	.D(\angle_clk[1] ), 
	.C(\angle_clk[3] ), 
	.B(\angle_clk[6] ), 
	.A(\angle_clk[8] ));
   EN2X0 p33191AT (.Q(n_64), 
	.B(\angle_clk_period[2] ), 
	.A(n_31));
   AN21X0 p15747A (.Q(n_63), 
	.C(n_6), 
	.B(n_2), 
	.A(n_11));
   AN22X0 p15342A (.Q(n_62), 
	.D(timers_sfr_acrl_o[2]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_255));
   AN22X0 p15342A7144 (.Q(n_61), 
	.D(timers_sfr_acrm_o[0]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_249));
   AN22X0 p15342A7145 (.Q(n_60), 
	.D(timers_sfr_acrm_o[1]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_248));
   AN22X0 p15342A7146 (.Q(n_59), 
	.D(timers_sfr_acrm_o[2]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_247));
   AN22X0 p15342A7147 (.Q(n_58), 
	.D(timers_sfr_acrl_o[3]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_254));
   AN22X0 p15342A7148 (.Q(n_57), 
	.D(timers_sfr_acrm_o[4]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_245));
   AN22X0 p15342A7149 (.Q(n_56), 
	.D(timers_sfr_acrm_o[6]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_243));
   AN22X0 p15342A7150 (.Q(n_55), 
	.D(timers_sfr_acrh_o[6]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_235));
   AN22X0 p15342A7151 (.Q(n_54), 
	.D(timers_sfr_acrm_o[7]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_242));
   AN22X0 p15342A7152 (.Q(n_53), 
	.D(timers_sfr_acrl_o[5]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_252));
   AN22X0 p15342A7153 (.Q(n_52), 
	.D(timers_sfr_acrm_o[3]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_246));
   AN22X0 p15342A7154 (.Q(n_51), 
	.D(timers_sfr_acrh_o[3]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_238));
   AN22X0 p15342A7155 (.Q(n_50), 
	.D(timers_sfr_acrl_o[7]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_250));
   AN22X0 p15342A7156 (.Q(n_49), 
	.D(timers_sfr_acrh_o[7]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_234));
   AN22X0 p15342A7157 (.Q(n_48), 
	.D(timers_sfr_acrh_o[1]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_240));
   AN22X0 p15342A7158 (.Q(n_47), 
	.D(timers_sfr_acrl_o[6]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_251));
   AN22X0 p15342A7159 (.Q(n_46), 
	.D(timers_sfr_acrl_o[1]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_256));
   AN22X0 p15342A7160 (.Q(n_45), 
	.D(timers_sfr_acrm_o[5]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_244));
   AN22X0 p15342A7161 (.Q(n_44), 
	.D(timers_sfr_acrl_o[4]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_253));
   AN22X0 p15342A7162 (.Q(n_43), 
	.D(timers_sfr_acrh_o[0]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_241));
   AN22X0 p15342A7163 (.Q(n_42), 
	.D(timers_sfr_acrh_o[2]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_239));
   AN22X0 p15342A7164 (.Q(n_41), 
	.D(timers_sfr_acrh_o[4]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_237));
   AN22X0 p15342A7165 (.Q(n_40), 
	.D(timers_sfr_acrh_o[5]), 
	.C(n_22), 
	.B(n_21), 
	.A(n_236));
   EN2X0 p15358A (.Q(n_39), 
	.B(timers_sfr_acrl_o[0]), 
	.A(n_21));
   EO2X0 p33524A (.Q(n_38), 
	.B(\angle_clk_period[2] ), 
	.A(n_17));
   NA2I1X0 p30399A (.Q(n_37), 
	.B(n_31), 
	.AN(\angle_clk_period[2] ));
   NO2I1X0 p31108A (.Q(n_36), 
	.B(n_17), 
	.AN(\angle_clk_period[2] ));
   NA2I1X0 p33098A (.Q(n_35), 
	.B(n_17), 
	.AN(n_31));
   NA2I1X0 p31731A (.Q(n_34), 
	.B(n_19), 
	.AN(n_24));
   ON21X0 p33264A (.Q(n_33), 
	.C(n_23), 
	.B(\angle_clk[0] ), 
	.A(n_0));
   AO21X0 p32093A (.Q(n_32), 
	.C(n_16), 
	.B(\angle_clk[1] ), 
	.A(\angle_clk[0] ));
   NO2X0 p26376A (.Q(n_31), 
	.B(\angle_clk_period[0] ), 
	.A(\angle_clk_period[1] ));
   NA2X0 p14983A (.Q(n_30), 
	.B(timers_sfr_tacph_i[1]), 
	.A(n_6));
   NO2X0 p30343A (.Q(n_29), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(n_2));
   NA2X0 p14209A (.Q(n_28), 
	.B(timers_sfr_tacpl_i[5]), 
	.A(n_6));
   NA2I1X0 p32682A7166 (.Q(n_27), 
	.B(\angle_clk_period[7] ), 
	.AN(\angle_clk_period[9] ));
   NA2X0 p30038A (.Q(n_26), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(DFT_sdo));
   NA2X0 p14701A7167 (.Q(n_25), 
	.B(timers_sfr_tacpl_i[4]), 
	.A(n_6));
   NO2I1X0 p27581A (.Q(n_24), 
	.B(\angle_clk[3] ), 
	.AN(\angle_clk_period[3] ));
   NA2X0 p26448A (.Q(n_23), 
	.B(\angle_clk[0] ), 
	.A(n_0));
   INX0 Fp15227A7168 (.Q(n_22), 
	.A(n_21));
   AND2X0 p15011A (.Q(n_21), 
	.B(timers_sfr_tcon2_tr2_i), 
	.A(acr_inc));
   NO2I1X0 p13945A (.Q(n_20), 
	.B(timers_timer2_acg_reset_i_b), 
	.AN(timers_sfr_tacpl_i[1]));
   NA2I1X0 p27468A (.Q(n_19), 
	.B(\angle_clk[3] ), 
	.AN(\angle_clk_period[3] ));
   NO2I1X0 p14446A (.Q(n_18), 
	.B(timers_timer2_acg_reset_i_b), 
	.AN(timers_sfr_tacpl_i[3]));
   NA2X0 p31007A (.Q(n_17), 
	.B(\angle_clk_period[0] ), 
	.A(\angle_clk_period[1] ));
   NO2X0 p26470A (.Q(n_16), 
	.B(\angle_clk[1] ), 
	.A(\angle_clk[0] ));
   NO2I1X0 p14446A7169 (.Q(n_15), 
	.B(timers_timer2_acg_reset_i_b), 
	.AN(timers_sfr_tacpl_i[2]));
   NA2X0 p14716A (.Q(n_14), 
	.B(timers_sfr_tacph_i[0]), 
	.A(n_6));
   NA2X0 p14706A (.Q(n_13), 
	.B(timers_sfr_tacpl_i[7]), 
	.A(n_6));
   NA2X0 p14715A (.Q(n_12), 
	.B(timers_sfr_tacpl_i[6]), 
	.A(n_6));
   NA2X0 p32850A (.Q(n_11), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(\state[0] ));
   NA2X0 p14685A (.Q(n_10), 
	.B(timers_sfr_tacpl_i[0]), 
	.A(n_6));
   INX0 Fp40049A7170 (.Q(n_9), 
	.A(\angle_clk[2] ));
   INX0 Fp41742A7172 (.Q(n_8), 
	.A(\angle_clk_period[5] ));
   INX0 Fp40806A7173 (.Q(n_7), 
	.A(\angle_clk_period[4] ));
   INX0 Fp12487A7189 (.Q(n_6), 
	.A(timers_timer2_acg_reset_i_b));
   INX0 Fp43896A (.Q(n_4), 
	.A(\angle_clk_period[8] ));
   INX0 Fp42402A (.Q(n_3), 
	.A(\angle_clk_period[6] ));
   INX0 Fp43741A7197 (.Q(n_2), 
	.A(DFT_sdo));
   INX0 Fp43139A7199 (.Q(n_1), 
	.A(\angle_clk_period[7] ));
   INX0 Fp38960A (.Q(n_0), 
	.A(\angle_clk_period[0] ));
endmodule

module timers_timer2_pdcf (
	timers_timer2_pdcf_reset_i_b, 
	timers_timer2_pdcf_clock_i, 
	timers_sfr_tcon2_dfp_i, 
	timers_timer2_pdcf_clkdiv_o, 
	DFT_sdi, 
	DFT_sen, 
	SPCASCAN_N6);
   input timers_timer2_pdcf_reset_i_b;
   input timers_timer2_pdcf_clock_i;
   input [2:0] timers_sfr_tcon2_dfp_i;
   output timers_timer2_pdcf_clkdiv_o;
   input DFT_sdi;
   input DFT_sen;
   output SPCASCAN_N6;

   // Internal wires
   wire \contador[0] ;
   wire \contador[1] ;
   wire \contador[2] ;
   wire \contador[3] ;
   wire \contador[4] ;
   wire \contador[5] ;
   wire \contador[6] ;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;

   SDFRQX0 \contador_reg[6]  (.SE(DFT_sen), 
	.SD(\contador[5] ), 
	.Q(SPCASCAN_N6), 
	.D(n_41), 
	.C(timers_timer2_pdcf_clock_i));
   NO2I1X0 p15288A (.Q(n_41), 
	.B(n_40), 
	.AN(timers_timer2_pdcf_reset_i_b));
   SDFRQX0 \contador_reg[5]  (.SE(DFT_sen), 
	.SD(\contador[4] ), 
	.Q(\contador[5] ), 
	.D(n_39), 
	.C(timers_timer2_pdcf_clock_i));
   AN22X0 p15120A (.Q(n_40), 
	.D(SPCASCAN_N6), 
	.C(n_12), 
	.B(n_13), 
	.A(n_37));
   NO2I1X0 p15288A471 (.Q(n_39), 
	.B(n_38), 
	.AN(timers_timer2_pdcf_reset_i_b));
   AN22X0 p15120A472 (.Q(n_38), 
	.D(n_12), 
	.C(\contador[5] ), 
	.B(n_13), 
	.A(n_34));
   EN2X0 p39152A (.Q(n_37), 
	.B(SPCASCAN_N6), 
	.A(n_33));
   SDFRQX0 \contador_reg[4]  (.SE(DFT_sen), 
	.SD(\contador[3] ), 
	.Q(\contador[4] ), 
	.D(n_36), 
	.C(timers_timer2_pdcf_clock_i));
   NO2I1X0 p15288A474 (.Q(n_36), 
	.B(n_35), 
	.AN(timers_timer2_pdcf_reset_i_b));
   AN22X0 p15120A475 (.Q(n_35), 
	.D(n_12), 
	.C(\contador[4] ), 
	.B(n_13), 
	.A(n_30));
   EN2X0 p39208A (.Q(n_34), 
	.B(\contador[5] ), 
	.A(n_29));
   SDFRQX0 \contador_reg[3]  (.SE(DFT_sen), 
	.SD(\contador[2] ), 
	.Q(\contador[3] ), 
	.D(n_32), 
	.C(timers_timer2_pdcf_clock_i));
   NA2I1X0 p38770A (.Q(n_33), 
	.B(\contador[5] ), 
	.AN(n_29));
   NO2I1X0 p15288A477 (.Q(n_32), 
	.B(n_31), 
	.AN(timers_timer2_pdcf_reset_i_b));
   AN22X0 p15120A478 (.Q(n_31), 
	.D(n_12), 
	.C(\contador[3] ), 
	.B(n_13), 
	.A(n_26));
   EN2X0 p39447A (.Q(n_30), 
	.B(\contador[4] ), 
	.A(n_25));
   SDFRQX0 \contador_reg[2]  (.SE(DFT_sen), 
	.SD(\contador[1] ), 
	.Q(\contador[2] ), 
	.D(n_28), 
	.C(timers_timer2_pdcf_clock_i));
   NA2I1X0 p38530A (.Q(n_29), 
	.B(\contador[4] ), 
	.AN(n_25));
   NO2I1X0 p15288A480 (.Q(n_28), 
	.B(n_27), 
	.AN(timers_timer2_pdcf_reset_i_b));
   SDFRQX0 timers_timer2_pdcf_clkdiv_o_reg (.SE(DFT_sen), 
	.SD(\contador[0] ), 
	.Q(timers_timer2_pdcf_clkdiv_o), 
	.D(n_24), 
	.C(timers_timer2_pdcf_clock_i));
   AN22X0 p15120A482 (.Q(n_27), 
	.D(n_12), 
	.C(\contador[2] ), 
	.B(n_13), 
	.A(n_18));
   EN2X0 p39509A (.Q(n_26), 
	.B(\contador[3] ), 
	.A(n_17));
   SDFRQX0 \contador_reg[1]  (.SE(DFT_sen), 
	.SD(timers_timer2_pdcf_clkdiv_o), 
	.Q(\contador[1] ), 
	.D(n_23), 
	.C(timers_timer2_pdcf_clock_i));
   NA2I1X0 p38114A (.Q(n_25), 
	.B(\contador[3] ), 
	.AN(n_17));
   AO21X0 p14875A (.Q(n_24), 
	.C(n_22), 
	.B(timers_sfr_tcon2_dfp_i[1]), 
	.A(n_20));
   SDFRQX0 \contador_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(\contador[0] ), 
	.D(n_21), 
	.C(timers_timer2_pdcf_clock_i));
   NO2I1X0 p15288A485 (.Q(n_23), 
	.B(n_19), 
	.AN(timers_timer2_pdcf_reset_i_b));
   ON321X0 p14699A (.Q(n_22), 
	.F(n_16), 
	.E(n_14), 
	.D(n_8), 
	.C(n_3), 
	.B(n_10), 
	.A(timers_sfr_tcon2_dfp_i[1]));
   NO2I1X0 p15296A (.Q(n_21), 
	.B(n_15), 
	.AN(timers_timer2_pdcf_reset_i_b));
   ON321X0 p14717A (.Q(n_20), 
	.F(n_11), 
	.E(n_0), 
	.D(n_10), 
	.C(n_2), 
	.B(n_5), 
	.A(timers_sfr_tcon2_dfp_i[0]));
   AN22X0 p15120A486 (.Q(n_19), 
	.D(\contador[1] ), 
	.C(n_12), 
	.B(n_13), 
	.A(n_9));
   EN2X0 p39732A (.Q(n_18), 
	.B(\contador[2] ), 
	.A(n_7));
   NA2I1X0 p37859A (.Q(n_17), 
	.B(\contador[2] ), 
	.AN(n_7));
   AN32X0 p14489A (.Q(n_16), 
	.E(timers_timer2_pdcf_clkdiv_o), 
	.D(n_2), 
	.C(\contador[3] ), 
	.B(timers_timer2_pdcf_reset_i_b), 
	.A(n_6));
   EN2X0 p15112A (.Q(n_15), 
	.B(\contador[0] ), 
	.A(n_13));
   AN221X0 p14491A (.Q(n_14), 
	.E(n_6), 
	.D(n_1), 
	.C(\contador[1] ), 
	.B(\contador[0] ), 
	.A(n_4));
   INX0 Fp15040A (.Q(n_12), 
	.A(n_13));
   NA2I1X0 p15022A (.Q(n_13), 
	.B(n_6), 
	.AN(timers_sfr_tcon2_dfp_i[2]));
   NA3I1X0 p14490A (.Q(n_11), 
	.C(timers_sfr_tcon2_dfp_i[0]), 
	.B(\contador[2] ), 
	.AN(n_8));
   NA3X0 p14658A (.Q(n_10), 
	.C(timers_sfr_tcon2_dfp_i[2]), 
	.B(timers_sfr_tcon2_dfp_i[0]), 
	.A(timers_timer2_pdcf_reset_i_b));
   EO2X0 p39603A (.Q(n_9), 
	.B(\contador[1] ), 
	.A(\contador[0] ));
   NA2I1X0 p14334A (.Q(n_8), 
	.B(timers_timer2_pdcf_reset_i_b), 
	.AN(timers_sfr_tcon2_dfp_i[2]));
   NA2X0 p37582A (.Q(n_7), 
	.B(\contador[1] ), 
	.A(\contador[0] ));
   NO2X0 p14588A (.Q(n_6), 
	.B(timers_sfr_tcon2_dfp_i[1]), 
	.A(timers_sfr_tcon2_dfp_i[0]));
   NA2X0 p15085A (.Q(n_5), 
	.B(timers_sfr_tcon2_dfp_i[2]), 
	.A(\contador[5] ));
   INX0 Fp14440A (.Q(n_4), 
	.A(timers_sfr_tcon2_dfp_i[1]));
   INX0 Fp46099A (.Q(n_3), 
	.A(\contador[4] ));
   INX0 Fp14288A487 (.Q(n_2), 
	.A(timers_timer2_pdcf_reset_i_b));
   INX0 Fp14537A (.Q(n_1), 
	.A(timers_sfr_tcon2_dfp_i[0]));
   INX0 Fp46671A (.Q(n_0), 
	.A(SPCASCAN_N6));
endmodule

module timers_timer2_pdf (
	timers_timer2_pdf_enable_i, 
	timers_timer2_clock_i_b, 
	timers_timer2_pht_i, 
	timers_timer2_reset_i, 
	timers_sfr_tcon2_dfsel_i, 
	timers_sfr_tcon2_edsel_i, 
	timers_timer2_pdfoutput_o, 
	DFT_sen, 
	SPCASCAN_N6);
   input timers_timer2_pdf_enable_i;
   input timers_timer2_clock_i_b;
   input timers_timer2_pht_i;
   input timers_timer2_reset_i;
   input timers_sfr_tcon2_dfsel_i;
   input timers_sfr_tcon2_edsel_i;
   output timers_timer2_pdfoutput_o;
   input DFT_sen;
   input SPCASCAN_N6;

   // Internal wires
   wire \ff_sync[0] ;
   wire \ff_sync[1] ;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_27;
   wire n_29;
   wire \pdf_2sample[0] ;
   wire \pdf_2sample[1] ;
   wire \pdf_2sample[2] ;
   wire pdf_out;
   wire q_flop;

   SDFRX0 q_flop_reg (.SE(DFT_sen), 
	.SD(SPCASCAN_N6), 
	.QN(q_flop), 
	.Q(n_29), 
	.D(pdf_out), 
	.C(timers_timer2_clock_i_b));
   SDFRQX0 timers_timer2_pdfoutput_o_reg (.SE(DFT_sen), 
	.SD(pdf_out), 
	.Q(timers_timer2_pdfoutput_o), 
	.D(n_19), 
	.C(timers_timer2_clock_i_b));
   NO2X0 p15405A (.Q(n_19), 
	.B(n_18), 
	.A(n_27));
   AN31X0 p15401A (.Q(n_18), 
	.D(n_17), 
	.C(pdf_out), 
	.B(timers_sfr_tcon2_edsel_i), 
	.A(q_flop));
   NO3X0 p15403A (.Q(n_17), 
	.C(q_flop), 
	.B(timers_sfr_tcon2_edsel_i), 
	.A(pdf_out));
   INX0 p16176A (.Q(n_27), 
	.A(timers_timer2_reset_i));
   SDFRQX0 \pdf_2sample_reg[0]  (.SE(DFT_sen), 
	.SD(n_29), 
	.Q(\pdf_2sample[0] ), 
	.D(n_15), 
	.C(timers_timer2_clock_i_b));
   SDFRQX0 pdf_out_reg (.SE(DFT_sen), 
	.SD(\pdf_2sample[2] ), 
	.Q(pdf_out), 
	.D(n_14), 
	.C(timers_timer2_clock_i_b));
   NO2I1X0 p15628A (.Q(n_15), 
	.B(n_13), 
	.AN(timers_timer2_reset_i));
   AO31X0 p15212A (.Q(n_14), 
	.D(n_12), 
	.C(pdf_out), 
	.B(n_11), 
	.A(timers_timer2_reset_i));
   MU2IX0 p33183A (.S(timers_timer2_pdf_enable_i), 
	.Q(n_13), 
	.IN1(\ff_sync[1] ), 
	.IN0(\pdf_2sample[0] ));
   SDFRQX0 \ff_sync_reg[1]  (.SE(DFT_sen), 
	.SD(\pdf_2sample[0] ), 
	.Q(\ff_sync[1] ), 
	.D(n_8), 
	.C(timers_timer2_clock_i_b));
   SDFRQX0 \pdf_2sample_reg[1]  (.SE(DFT_sen), 
	.SD(\ff_sync[0] ), 
	.Q(\pdf_2sample[1] ), 
	.D(n_10), 
	.C(timers_timer2_clock_i_b));
   SDFRQX0 \pdf_2sample_reg[2]  (.SE(DFT_sen), 
	.SD(\pdf_2sample[1] ), 
	.Q(\pdf_2sample[2] ), 
	.D(n_7), 
	.C(timers_timer2_clock_i_b));
   AN211X0 p15186A (.Q(n_12), 
	.D(n_6), 
	.C(n_27), 
	.B(timers_sfr_tcon2_dfsel_i), 
	.A(n_0));
   AN31X0 p15230A (.Q(n_11), 
	.D(n_9), 
	.C(timers_timer2_pdf_enable_i), 
	.B(n_1), 
	.A(n_3));
   NO2I1X0 p15628A381 (.Q(n_10), 
	.B(n_4), 
	.AN(timers_timer2_reset_i));
   NO2X0 p15106A (.Q(n_9), 
	.B(n_3), 
	.A(n_6));
   AND2X0 p15653A (.Q(n_8), 
	.B(\ff_sync[0] ), 
	.A(timers_timer2_reset_i));
   NO2I1X0 p15628A382 (.Q(n_7), 
	.B(n_5), 
	.AN(timers_timer2_reset_i));
   SDFRQX0 \ff_sync_reg[0]  (.SE(DFT_sen), 
	.SD(\ff_sync[1] ), 
	.Q(\ff_sync[0] ), 
	.D(n_2), 
	.C(timers_timer2_clock_i_b));
   NA3X0 p32359A (.Q(n_6), 
	.C(\pdf_2sample[0] ), 
	.B(\pdf_2sample[1] ), 
	.A(timers_timer2_pdf_enable_i));
   MU2IX0 p33183A384 (.S(timers_timer2_pdf_enable_i), 
	.Q(n_5), 
	.IN1(\pdf_2sample[1] ), 
	.IN0(\pdf_2sample[2] ));
   MU2IX0 p33183A385 (.S(timers_timer2_pdf_enable_i), 
	.Q(n_4), 
	.IN1(\pdf_2sample[0] ), 
	.IN0(\pdf_2sample[1] ));
   NA2X0 p15060A (.Q(n_3), 
	.B(timers_sfr_tcon2_dfsel_i), 
	.A(\pdf_2sample[2] ));
   AND2X0 p15653A386 (.Q(n_2), 
	.B(timers_timer2_pht_i), 
	.A(timers_timer2_reset_i));
   NO2X0 p39537A (.Q(n_1), 
	.B(\pdf_2sample[1] ), 
	.A(\pdf_2sample[0] ));
   INX0 Fp46533A (.Q(n_0), 
	.A(\pdf_2sample[2] ));
endmodule

module top_timer2 (
	top_timer2_reset_i, 
	top_timer2_clock_i_d, 
	top_timer2_pht_i, 
	top_timer2_sfr_tcon2_dfp_i, 
	top_timer2_sfr_tcon2_dfsel_i, 
	top_timer2_sfr_tcon2_edsel_i, 
	top_timer2_sfr_tacph_i, 
	top_timer2_sfr_tacpl_i, 
	top_timer2_sfr_tcon2_tf2_i, 
	timers_sfr_tcon2_tr2_i, 
	top_timer2_sfr_tcon2_tf2_o, 
	top_timer2_sfr_acrh_o, 
	top_timer2_sfr_acrm_o, 
	top_timer2_sfr_acrl_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	DFT_sdo_2, 
	FE_PT1__top_timers_sfr_th1_o_6__, 
	FE_PT1_top_p0_y_i_7_);
   input top_timer2_reset_i;
   input top_timer2_clock_i_d;
   input top_timer2_pht_i;
   input [2:0] top_timer2_sfr_tcon2_dfp_i;
   input top_timer2_sfr_tcon2_dfsel_i;
   input top_timer2_sfr_tcon2_edsel_i;
   input [1:0] top_timer2_sfr_tacph_i;
   input [7:0] top_timer2_sfr_tacpl_i;
   input top_timer2_sfr_tcon2_tf2_i;
   input timers_sfr_tcon2_tr2_i;
   output top_timer2_sfr_tcon2_tf2_o;
   output [7:0] top_timer2_sfr_acrh_o;
   output [7:0] top_timer2_sfr_acrm_o;
   output [7:0] top_timer2_sfr_acrl_o;
   input DFT_sdi;
   input DFT_sen;
   output DFT_sdo;
   input DFT_sdi_1;
   output DFT_sdo_2;
   input FE_PT1__top_timers_sfr_th1_o_6__;
   input FE_PT1_top_p0_y_i_7_;

   // Internal wires
   wire SPCASCAN_N6;
   wire pdcf_out_tmp;

   timers_timer2_acg top_acg (.timers_timer2_acg_clock_i(top_timer2_clock_i_d), 
	.timers_timer2_acg_reset_i_b(top_timer2_reset_i), 
	.timers_timer2_acg_pdf_pht_i(DFT_sdo_2), 
	.timers_sfr_tacpl_i({ top_timer2_sfr_tacpl_i[7],
		top_timer2_sfr_tacpl_i[6],
		top_timer2_sfr_tacpl_i[5],
		top_timer2_sfr_tacpl_i[4],
		top_timer2_sfr_tacpl_i[3],
		top_timer2_sfr_tacpl_i[2],
		top_timer2_sfr_tacpl_i[1],
		top_timer2_sfr_tacpl_i[0] }), 
	.timers_sfr_tacph_i({ top_timer2_sfr_tacph_i[1],
		top_timer2_sfr_tacph_i[0] }), 
	.timers_sfr_tcon2_tf2_i(top_timer2_sfr_tcon2_tf2_i), 
	.timers_sfr_tcon2_tr2_i(timers_sfr_tcon2_tr2_i), 
	.timers_sfr_acrh_o({ top_timer2_sfr_acrh_o[7],
		top_timer2_sfr_acrh_o[6],
		top_timer2_sfr_acrh_o[5],
		top_timer2_sfr_acrh_o[4],
		top_timer2_sfr_acrh_o[3],
		top_timer2_sfr_acrh_o[2],
		top_timer2_sfr_acrh_o[1],
		top_timer2_sfr_acrh_o[0] }), 
	.timers_sfr_acrm_o({ top_timer2_sfr_acrm_o[7],
		top_timer2_sfr_acrm_o[6],
		top_timer2_sfr_acrm_o[5],
		top_timer2_sfr_acrm_o[4],
		top_timer2_sfr_acrm_o[3],
		top_timer2_sfr_acrm_o[2],
		top_timer2_sfr_acrm_o[1],
		top_timer2_sfr_acrm_o[0] }), 
	.timers_sfr_acrl_o({ top_timer2_sfr_acrl_o[7],
		top_timer2_sfr_acrl_o[6],
		top_timer2_sfr_acrl_o[5],
		top_timer2_sfr_acrl_o[4],
		top_timer2_sfr_acrl_o[3],
		top_timer2_sfr_acrl_o[2],
		top_timer2_sfr_acrl_o[1],
		top_timer2_sfr_acrl_o[0] }), 
	.timers_sfr_tcon2_tf2_o(top_timer2_sfr_tcon2_tf2_o), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_1), 
	.FE_PT1__top_timers_sfr_th1_o_6__(FE_PT1__top_timers_sfr_th1_o_6__), 
	.FE_PT1_top_p0_y_i_7_(FE_PT1_top_p0_y_i_7_));
   timers_timer2_pdcf top_pdcf (.timers_timer2_pdcf_reset_i_b(top_timer2_reset_i), 
	.timers_timer2_pdcf_clock_i(top_timer2_clock_i_d), 
	.timers_sfr_tcon2_dfp_i({ top_timer2_sfr_tcon2_dfp_i[2],
		top_timer2_sfr_tcon2_dfp_i[1],
		top_timer2_sfr_tcon2_dfp_i[0] }), 
	.timers_timer2_pdcf_clkdiv_o(pdcf_out_tmp), 
	.DFT_sdi(top_timer2_sfr_acrh_o[6]), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N6(SPCASCAN_N6));
   timers_timer2_pdf top_pdf (.timers_timer2_pdf_enable_i(pdcf_out_tmp), 
	.timers_timer2_clock_i_b(top_timer2_clock_i_d), 
	.timers_timer2_pht_i(top_timer2_pht_i), 
	.timers_timer2_reset_i(top_timer2_reset_i), 
	.timers_sfr_tcon2_dfsel_i(top_timer2_sfr_tcon2_dfsel_i), 
	.timers_sfr_tcon2_edsel_i(top_timer2_sfr_tcon2_edsel_i), 
	.timers_timer2_pdfoutput_o(DFT_sdo_2), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N6(SPCASCAN_N6));
endmodule

module top_timers (
	top_timers_reset_i, 
	top_timers_clock_i, 
	top_timers_machine_cycle_i, 
	top_timers_pht_i, 
	top_timers_sfr_tcon2_dfp_i, 
	top_timers_sfr_tcon2_dfsel_i, 
	top_timers_sfr_tcon2_edsel_i, 
	top_timers_sfr_tacph_i, 
	top_timers_sfr_tacpl_i, 
	top_timers_sfr_tcon_tr0_i, 
	top_timers_sfr_tcon_tr1_i, 
	top_timers_sfr_tmod_gate_t0_i, 
	top_timers_sfr_tmod_gate_t1_i, 
	top_timers_sfr_tmod_m0_t0_i, 
	top_timers_sfr_tmod_m1_t0_i, 
	top_timers_sfr_tmod_m0_t1_i, 
	top_timers_sfr_tmod_m1_t1_i, 
	top_timers_sfr_th0_i, 
	top_timers_sfr_tm0_i, 
	top_timers_sfr_tl0_i, 
	top_timers_sfr_th1_i, 
	top_timers_sfr_tm1_i, 
	top_timers_sfr_tl1_i, 
	top_timers_int0_i, 
	top_timers_int1_i, 
	top_timers_sfr_tcon_tf0_i, 
	top_timers_sfr_tcon_tf1_i, 
	top_timers_sfr_tcon2_tf2_i, 
	top_timers_sfr_tcon2_tr2_i, 
	top_timers_sfr_tcon_tf0_o, 
	top_timers_sfr_tcon_tf1_o, 
	top_timers_sfr_tcon2_tf2_o, 
	top_timers_sfr_acrh_o, 
	top_timers_sfr_acrm_o, 
	top_timers_sfr_acrl_o, 
	top_timers_sfr_th0_o, 
	top_timers_sfr_tm0_o, 
	top_timers_sfr_tl0_o, 
	top_timers_sfr_th1_o, 
	top_timers_sfr_tm1_o, 
	top_timers_sfr_tl1_o, 
	DFT_in, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdi_1, 
	DFT_sdo, 
	DFT_sdi_2, 
	DFT_sdo_3, 
	DFT_sdi_4, 
	DFT_sdo_5, 
	SPCASCAN_N5, 
	FE_PT1_top_p0_y_i_6_, 
	FE_PT1_top_p0_y_i_7_);
   input top_timers_reset_i;
   input top_timers_clock_i;
   input top_timers_machine_cycle_i;
   input top_timers_pht_i;
   input [2:0] top_timers_sfr_tcon2_dfp_i;
   input top_timers_sfr_tcon2_dfsel_i;
   input top_timers_sfr_tcon2_edsel_i;
   input [1:0] top_timers_sfr_tacph_i;
   input [7:0] top_timers_sfr_tacpl_i;
   input top_timers_sfr_tcon_tr0_i;
   input top_timers_sfr_tcon_tr1_i;
   input top_timers_sfr_tmod_gate_t0_i;
   input top_timers_sfr_tmod_gate_t1_i;
   input top_timers_sfr_tmod_m0_t0_i;
   input top_timers_sfr_tmod_m1_t0_i;
   input top_timers_sfr_tmod_m0_t1_i;
   input top_timers_sfr_tmod_m1_t1_i;
   input [7:0] top_timers_sfr_th0_i;
   input [7:0] top_timers_sfr_tm0_i;
   input [7:0] top_timers_sfr_tl0_i;
   input [7:0] top_timers_sfr_th1_i;
   input [7:0] top_timers_sfr_tm1_i;
   input [7:0] top_timers_sfr_tl1_i;
   input top_timers_int0_i;
   input top_timers_int1_i;
   input top_timers_sfr_tcon_tf0_i;
   input top_timers_sfr_tcon_tf1_i;
   input top_timers_sfr_tcon2_tf2_i;
   input top_timers_sfr_tcon2_tr2_i;
   output top_timers_sfr_tcon_tf0_o;
   output top_timers_sfr_tcon_tf1_o;
   output top_timers_sfr_tcon2_tf2_o;
   output [7:0] top_timers_sfr_acrh_o;
   output [7:0] top_timers_sfr_acrm_o;
   output [7:0] top_timers_sfr_acrl_o;
   output [7:0] top_timers_sfr_th0_o;
   output [7:0] top_timers_sfr_tm0_o;
   output [7:0] top_timers_sfr_tl0_o;
   output [7:0] top_timers_sfr_th1_o;
   output [7:0] top_timers_sfr_tm1_o;
   output [7:0] top_timers_sfr_tl1_o;
   input DFT_in;
   input DFT_sdi;
   input DFT_sen;
   input DFT_sdi_1;
   output DFT_sdo;
   input DFT_sdi_2;
   output DFT_sdo_3;
   input DFT_sdi_4;
   output DFT_sdo_5;
   input SPCASCAN_N5;
   input FE_PT1_top_p0_y_i_6_;
   input FE_PT1_top_p0_y_i_7_;

   // Internal wires
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_84;

   timer0 dut_timer0 (.timers_clock_i(n_84), 
	.timers_reset_i_b(DFT_sdo), 
	.timers_int0_i(top_timers_int0_i), 
	.timers_sfr_tmod_gate_t0_i(top_timers_sfr_tmod_gate_t0_i), 
	.timers_sfr_tmod_m0t0_i(top_timers_sfr_tmod_m0_t0_i), 
	.timers_sfr_tmod_m1t0_i(top_timers_sfr_tmod_m1_t0_i), 
	.timers_sfr_tcon_tr0_i(top_timers_sfr_tcon_tr0_i), 
	.timers_sfr_th0_i({ top_timers_sfr_th0_i[7],
		top_timers_sfr_th0_i[6],
		top_timers_sfr_th0_i[5],
		top_timers_sfr_th0_i[4],
		top_timers_sfr_th0_i[3],
		top_timers_sfr_th0_i[2],
		top_timers_sfr_th0_i[1],
		top_timers_sfr_th0_i[0] }), 
	.timers_sfr_tm0_i({ top_timers_sfr_tm0_i[7],
		top_timers_sfr_tm0_i[6],
		top_timers_sfr_tm0_i[5],
		top_timers_sfr_tm0_i[4],
		top_timers_sfr_tm0_i[3],
		top_timers_sfr_tm0_i[2],
		top_timers_sfr_tm0_i[1],
		top_timers_sfr_tm0_i[0] }), 
	.timers_sfr_tl0_i({ top_timers_sfr_tl0_i[7],
		top_timers_sfr_tl0_i[6],
		top_timers_sfr_tl0_i[5],
		top_timers_sfr_tl0_i[4],
		top_timers_sfr_tl0_i[3],
		top_timers_sfr_tl0_i[2],
		top_timers_sfr_tl0_i[1],
		top_timers_sfr_tl0_i[0] }), 
	.timers_sfr_tcon_tf0_i(top_timers_sfr_tcon_tf0_i), 
	.timers_sfr_tcon_tf0_o(top_timers_sfr_tcon_tf0_o), 
	.timers_sfr_th0_o({ top_timers_sfr_th0_o[7],
		top_timers_sfr_th0_o[6],
		top_timers_sfr_th0_o[5],
		top_timers_sfr_th0_o[4],
		top_timers_sfr_th0_o[3],
		top_timers_sfr_th0_o[2],
		top_timers_sfr_th0_o[1],
		top_timers_sfr_th0_o[0] }), 
	.timers_sfr_tm0_o({ top_timers_sfr_tm0_o[7],
		top_timers_sfr_tm0_o[6],
		top_timers_sfr_tm0_o[5],
		top_timers_sfr_tm0_o[4],
		top_timers_sfr_tm0_o[3],
		top_timers_sfr_tm0_o[2],
		top_timers_sfr_tm0_o[1],
		top_timers_sfr_tm0_o[0] }), 
	.timers_sfr_tl0_o({ top_timers_sfr_tl0_o[7],
		top_timers_sfr_tl0_o[6],
		top_timers_sfr_tl0_o[5],
		top_timers_sfr_tl0_o[4],
		top_timers_sfr_tl0_o[3],
		top_timers_sfr_tl0_o[2],
		top_timers_sfr_tl0_o[1],
		top_timers_sfr_tl0_o[0] }), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.FE_PT1__top_timers_sfr_th1_o_0__(top_timers_sfr_th1_o[0]));
   timer1 dut_timer1 (.timers_clock_i(n_84), 
	.timers_reset_i_b(DFT_sdo), 
	.timers_int1_i(top_timers_int1_i), 
	.timers_sfr_tmod_gate_t1_i(top_timers_sfr_tmod_gate_t1_i), 
	.timers_sfr_tmod_m0t1_i(top_timers_sfr_tmod_m0_t1_i), 
	.timers_sfr_tmod_m1t1_i(top_timers_sfr_tmod_m1_t1_i), 
	.timers_sfr_tcon_tr1_i(top_timers_sfr_tcon_tr1_i), 
	.timers_sfr_th1_i({ top_timers_sfr_th1_i[7],
		top_timers_sfr_th1_i[6],
		top_timers_sfr_th1_i[5],
		top_timers_sfr_th1_i[4],
		top_timers_sfr_th1_i[3],
		top_timers_sfr_th1_i[2],
		top_timers_sfr_th1_i[1],
		top_timers_sfr_th1_i[0] }), 
	.timers_sfr_tm1_i({ top_timers_sfr_tm1_i[7],
		top_timers_sfr_tm1_i[6],
		top_timers_sfr_tm1_i[5],
		top_timers_sfr_tm1_i[4],
		top_timers_sfr_tm1_i[3],
		top_timers_sfr_tm1_i[2],
		top_timers_sfr_tm1_i[1],
		top_timers_sfr_tm1_i[0] }), 
	.timers_sfr_tl1_i({ top_timers_sfr_tl1_i[7],
		top_timers_sfr_tl1_i[6],
		top_timers_sfr_tl1_i[5],
		top_timers_sfr_tl1_i[4],
		top_timers_sfr_tl1_i[3],
		top_timers_sfr_tl1_i[2],
		top_timers_sfr_tl1_i[1],
		top_timers_sfr_tl1_i[0] }), 
	.timers_sfr_tcon_tf1_i(top_timers_sfr_tcon_tf1_i), 
	.timers_sfr_tcon_tf1_o(top_timers_sfr_tcon_tf1_o), 
	.timers_sfr_th1_o({ top_timers_sfr_th1_o[7],
		top_timers_sfr_th1_o[6],
		top_timers_sfr_th1_o[5],
		top_timers_sfr_th1_o[4],
		top_timers_sfr_th1_o[3],
		top_timers_sfr_th1_o[2],
		top_timers_sfr_th1_o[1],
		top_timers_sfr_th1_o[0] }), 
	.timers_sfr_tm1_o({ top_timers_sfr_tm1_o[7],
		top_timers_sfr_tm1_o[6],
		top_timers_sfr_tm1_o[5],
		top_timers_sfr_tm1_o[4],
		top_timers_sfr_tm1_o[3],
		top_timers_sfr_tm1_o[2],
		top_timers_sfr_tm1_o[1],
		top_timers_sfr_tm1_o[0] }), 
	.timers_sfr_tl1_o({ top_timers_sfr_tl1_o[7],
		top_timers_sfr_tl1_o[6],
		top_timers_sfr_tl1_o[5],
		top_timers_sfr_tl1_o[4],
		top_timers_sfr_tl1_o[3],
		top_timers_sfr_tl1_o[2],
		top_timers_sfr_tl1_o[1],
		top_timers_sfr_tl1_o[0] }), 
	.DFT_sdi(SPCASCAN_N5), 
	.DFT_sen(DFT_sen), 
	.DFT_sdi_1(DFT_sdi_2), 
	.FE_PT1__top_timers_sfr_th0_o_0__(top_timers_sfr_th0_o[0]), 
	.FE_PT1_top_p0_y_i_6_(FE_PT1_top_p0_y_i_6_));
   top_timer2 dut_timer2 (.top_timer2_reset_i(DFT_sdo), 
	.top_timer2_clock_i_d(top_timers_clock_i), 
	.top_timer2_pht_i(top_timers_pht_i), 
	.top_timer2_sfr_tcon2_dfp_i({ top_timers_sfr_tcon2_dfp_i[2],
		top_timers_sfr_tcon2_dfp_i[1],
		top_timers_sfr_tcon2_dfp_i[0] }), 
	.top_timer2_sfr_tcon2_dfsel_i(top_timers_sfr_tcon2_dfsel_i), 
	.top_timer2_sfr_tcon2_edsel_i(top_timers_sfr_tcon2_edsel_i), 
	.top_timer2_sfr_tacph_i({ top_timers_sfr_tacph_i[1],
		top_timers_sfr_tacph_i[0] }), 
	.top_timer2_sfr_tacpl_i({ top_timers_sfr_tacpl_i[7],
		top_timers_sfr_tacpl_i[6],
		top_timers_sfr_tacpl_i[5],
		top_timers_sfr_tacpl_i[4],
		top_timers_sfr_tacpl_i[3],
		top_timers_sfr_tacpl_i[2],
		top_timers_sfr_tacpl_i[1],
		top_timers_sfr_tacpl_i[0] }), 
	.top_timer2_sfr_tcon2_tf2_i(top_timers_sfr_tcon2_tf2_i), 
	.timers_sfr_tcon2_tr2_i(top_timers_sfr_tcon2_tr2_i), 
	.top_timer2_sfr_tcon2_tf2_o(top_timers_sfr_tcon2_tf2_o), 
	.top_timer2_sfr_acrh_o({ top_timers_sfr_acrh_o[7],
		top_timers_sfr_acrh_o[6],
		top_timers_sfr_acrh_o[5],
		top_timers_sfr_acrh_o[4],
		top_timers_sfr_acrh_o[3],
		top_timers_sfr_acrh_o[2],
		top_timers_sfr_acrh_o[1],
		top_timers_sfr_acrh_o[0] }), 
	.top_timer2_sfr_acrm_o({ top_timers_sfr_acrm_o[7],
		top_timers_sfr_acrm_o[6],
		top_timers_sfr_acrm_o[5],
		top_timers_sfr_acrm_o[4],
		top_timers_sfr_acrm_o[3],
		top_timers_sfr_acrm_o[2],
		top_timers_sfr_acrm_o[1],
		top_timers_sfr_acrm_o[0] }), 
	.top_timer2_sfr_acrl_o({ top_timers_sfr_acrl_o[7],
		top_timers_sfr_acrl_o[6],
		top_timers_sfr_acrl_o[5],
		top_timers_sfr_acrl_o[4],
		top_timers_sfr_acrl_o[3],
		top_timers_sfr_acrl_o[2],
		top_timers_sfr_acrl_o[1],
		top_timers_sfr_acrl_o[0] }), 
	.DFT_sdi(top_timers_sfr_tm1_o[7]), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo_3), 
	.DFT_sdi_1(DFT_sdi_4), 
	.DFT_sdo_2(DFT_sdo_5), 
	.FE_PT1__top_timers_sfr_th1_o_6__(top_timers_sfr_th1_o[6]), 
	.FE_PT1_top_p0_y_i_7_(FE_PT1_top_p0_y_i_7_));
   MU2X0 p214748365A (.S(DFT_in), 
	.Q(n_84), 
	.IN1(top_timers_clock_i), 
	.IN0(top_timers_machine_cycle_i));
   SDFFQX0 reset_aux_reg (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(DFT_sdo), 
	.D(n_3), 
	.CN(top_timers_clock_i));
   AO33X0 p15596AT (.Q(n_3), 
	.F(DFT_sdo), 
	.E(n_1), 
	.D(top_timers_reset_i), 
	.C(n_2), 
	.B(top_timers_machine_cycle_i), 
	.A(top_timers_reset_i));
   NA2X0 p15756A (.Q(n_2), 
	.B(top_timers_reset_i), 
	.A(n_1));
   INX0 Fp15758A38 (.Q(n_1), 
	.A(top_timers_machine_cycle_i));
endmodule

module emc_top (
	top_clock_i, 
	top_clock_mem_i, 
	top_reset_i, 
	top_p0_y_i, 
	top_p1_y_i, 
	top_p2_y_i, 
	top_p3_y_i, 
	top_p0_en_o, 
	top_p1_en_o, 
	top_p2_en_o, 
	top_p3_en_o, 
	top_p0_a_o, 
	top_p1_a_o, 
	top_p2_a_o, 
	top_p3_a_o, 
	top_p4_a_o, 
	top_pht_i, 
	top_ea_b_i, 
	top_test_mode_i, 
	top_psen_b_o, 
	top_scan_enable_b_i, 
	SPCASCAN_N0, 
	SPCASCAN_N1, 
	SPCASCAN_N2, 
	SPCASCAN_N7);
   input top_clock_i;
   input top_clock_mem_i;
   input top_reset_i;
   input [7:0] top_p0_y_i;
   input [7:0] top_p1_y_i;
   input [7:0] top_p2_y_i;
   input [7:0] top_p3_y_i;
   output [7:0] top_p0_en_o;
   output [7:0] top_p1_en_o;
   output [7:0] top_p2_en_o;
   output [7:0] top_p3_en_o;
   output [7:0] top_p0_a_o;
   output [7:0] top_p1_a_o;
   output [7:0] top_p2_a_o;
   output [7:0] top_p3_a_o;
   output [7:0] top_p4_a_o;
   input top_pht_i;
   input top_ea_b_i;
   input top_test_mode_i;
   output top_psen_b_o;
   input top_scan_enable_b_i;
   output SPCASCAN_N0;
   output SPCASCAN_N1;
   output SPCASCAN_N2;
   output SPCASCAN_N7;

   // Internal wires
   wire SPCASCAN_N5;
   wire UNCONNECTED69;
   wire UNCONNECTED70;
   wire UNCONNECTED71;
   wire UNCONNECTED72;
   wire UNCONNECTED73;
   wire UNCONNECTED74;
   wire UNCONNECTED75;
   wire UNCONNECTED76;
   wire UNCONNECTED77;
   wire UNCONNECTED78;
   wire UNCONNECTED79;
   wire UNCONNECTED80;
   wire UNCONNECTED81;
   wire UNCONNECTED82;
   wire UNCONNECTED83;
   wire UNCONNECTED84;
   wire UNCONNECTED85;
   wire UNCONNECTED86;
   wire UNCONNECTED87;
   wire UNCONNECTED88;
   wire UNCONNECTED89;
   wire UNCONNECTED90;
   wire UNCONNECTED91;
   wire UNCONNECTED92;
   wire UNCONNECTED93;
   wire UNCONNECTED94;
   wire UNCONNECTED95;
   wire UNCONNECTED96;
   wire UNCONNECTED97;
   wire UNCONNECTED98;
   wire UNCONNECTED99;
   wire UNCONNECTED100;
   wire UNCONNECTED101;
   wire UNCONNECTED102;
   wire UNCONNECTED103;
   wire UNCONNECTED104;
   wire UNCONNECTED105;
   wire UNCONNECTED106;
   wire UNCONNECTED107;
   wire UNCONNECTED108;
   wire UNCONNECTED109;
   wire UNCONNECTED110;
   wire UNCONNECTED111;
   wire UNCONNECTED112;
   wire UNCONNECTED113;
   wire UNCONNECTED114;
   wire UNCONNECTED115;
   wire UNCONNECTED116;
   wire UNCONNECTED117;
   wire UNCONNECTED118;
   wire UNCONNECTED119;
   wire UNCONNECTED120;
   wire UNCONNECTED121;
   wire UNCONNECTED122;
   wire UNCONNECTED123;
   wire UNCONNECTED124;
   wire UNCONNECTED125;
   wire UNCONNECTED126;
   wire UNCONNECTED127;
   wire UNCONNECTED128;
   wire UNCONNECTED129;
   wire UNCONNECTED130;
   wire UNCONNECTED131;
   wire UNCONNECTED132;
   wire UNCONNECTED133;
   wire UNCONNECTED134;
   wire UNCONNECTED135;
   wire UNCONNECTED136;
   wire UNCONNECTED137;
   wire UNCONNECTED138;
   wire UNCONNECTED139;
   wire UNCONNECTED140;
   wire UNCONNECTED141;
   wire UNCONNECTED142;
   wire UNCONNECTED143;
   wire UNCONNECTED144;
   wire UNCONNECTED145;
   wire UNCONNECTED146;
   wire UNCONNECTED147;
   wire UNCONNECTED148;
   wire UNCONNECTED149;
   wire UNCONNECTED150;
   wire UNCONNECTED151;
   wire UNCONNECTED152;
   wire UNCONNECTED153;
   wire UNCONNECTED154;
   wire UNCONNECTED155;
   wire UNCONNECTED156;
   wire UNCONNECTED157;
   wire UNCONNECTED158;
   wire UNCONNECTED159;
   wire UNCONNECTED160;
   wire UNCONNECTED161;
   wire UNCONNECTED162;
   wire UNCONNECTED163;
   wire UNCONNECTED164;
   wire UNCONNECTED165;
   wire UNCONNECTED166;
   wire UNCONNECTED167;
   wire UNCONNECTED168;
   wire baud_rate_br_o;
   wire \bus_control_ext_data_o[0] ;
   wire \bus_control_ext_data_o[1] ;
   wire \bus_control_ext_data_o[2] ;
   wire \bus_control_ext_data_o[3] ;
   wire \bus_control_ext_data_o[4] ;
   wire \bus_control_ext_data_o[5] ;
   wire \bus_control_ext_data_o[6] ;
   wire \bus_control_ext_data_o[7] ;
   wire \bus_control_p0en_o[0] ;
   wire \bus_control_p0en_o[1] ;
   wire \bus_control_p0en_o[2] ;
   wire \bus_control_p0en_o[3] ;
   wire \bus_control_p0en_o[4] ;
   wire \bus_control_p0en_o[5] ;
   wire \bus_control_p0en_o[6] ;
   wire \bus_control_p0en_o[7] ;
   wire \bus_control_p2_o[0] ;
   wire \bus_control_p2_o[1] ;
   wire \bus_control_p2_o[2] ;
   wire \bus_control_p2_o[3] ;
   wire \bus_control_p2_o[4] ;
   wire \bus_control_p2_o[5] ;
   wire \bus_control_p2_o[6] ;
   wire \bus_control_p2_o[7] ;
   wire \bus_control_p2en_o[0] ;
   wire \bus_control_p2en_o[1] ;
   wire \bus_control_p2en_o[2] ;
   wire \bus_control_p2en_o[3] ;
   wire \bus_control_p2en_o[4] ;
   wire \bus_control_p2en_o[5] ;
   wire \bus_control_p2en_o[6] ;
   wire \bus_control_p2en_o[7] ;
   wire bus_control_p3en_6_o;
   wire bus_control_p3en_7_o;
   wire \bus_control_p4_o[0] ;
   wire \bus_control_p4_o[1] ;
   wire \bus_control_p4_o[2] ;
   wire \bus_control_p4_o[3] ;
   wire \bus_control_p4_o[4] ;
   wire \bus_control_p4_o[5] ;
   wire \bus_control_p4_o[6] ;
   wire \bus_control_p4_o[7] ;
   wire core_baudrate_rs232_o;
   wire core_baudrate_sm0_o;
   wire core_baudrate_sm1_o;
   wire core_baudrate_sm2_o;
   wire core_baudrate_smod_o;
   wire \core_bus_ctrl_addr_o[0] ;
   wire \core_bus_ctrl_addr_o[1] ;
   wire \core_bus_ctrl_addr_o[2] ;
   wire \core_bus_ctrl_addr_o[3] ;
   wire \core_bus_ctrl_addr_o[4] ;
   wire \core_bus_ctrl_addr_o[5] ;
   wire \core_bus_ctrl_addr_o[6] ;
   wire \core_bus_ctrl_addr_o[7] ;
   wire \core_bus_ctrl_addr_o[8] ;
   wire \core_bus_ctrl_addr_o[9] ;
   wire \core_bus_ctrl_addr_o[10] ;
   wire \core_bus_ctrl_addr_o[11] ;
   wire \core_bus_ctrl_addr_o[12] ;
   wire \core_bus_ctrl_addr_o[13] ;
   wire \core_bus_ctrl_addr_o[14] ;
   wire \core_bus_ctrl_addr_o[15] ;
   wire \core_bus_ctrl_data_o[0] ;
   wire \core_bus_ctrl_data_o[1] ;
   wire \core_bus_ctrl_data_o[2] ;
   wire \core_bus_ctrl_data_o[3] ;
   wire \core_bus_ctrl_data_o[4] ;
   wire \core_bus_ctrl_data_o[5] ;
   wire \core_bus_ctrl_data_o[6] ;
   wire \core_bus_ctrl_data_o[7] ;
   wire core_bus_ctrl_ext_ram_rd_b_o;
   wire core_bus_ctrl_ext_ram_wr_b_o;
   wire core_bus_ctrl_ext_rom_rd_b_o;
   wire \core_interrupt_ie_o[0] ;
   wire \core_interrupt_ie_o[1] ;
   wire \core_interrupt_ie_o[2] ;
   wire \core_interrupt_ie_o[3] ;
   wire \core_interrupt_ie_o[4] ;
   wire \core_interrupt_ie_o[5] ;
   wire \core_interrupt_ie_o[6] ;
   wire \core_interrupt_ie_o[7] ;
   wire \core_interrupt_ip_o[0] ;
   wire \core_interrupt_ip_o[1] ;
   wire \core_interrupt_ip_o[2] ;
   wire \core_interrupt_ip_o[3] ;
   wire \core_interrupt_ip_o[4] ;
   wire \core_interrupt_ip_o[5] ;
   wire \core_interrupt_ip_o[6] ;
   wire core_interrupt_na_o;
   wire core_interrupt_rdy_o;
   wire \core_interrupt_scon_o[0] ;
   wire \core_interrupt_scon_o[1] ;
   wire \core_interrupt_tcon2_o[1] ;
   wire \core_interrupt_tcon_o[0] ;
   wire \core_interrupt_tcon_o[1] ;
   wire \core_interrupt_tcon_o[2] ;
   wire \core_interrupt_tcon_o[3] ;
   wire \core_ports_p0_o[0] ;
   wire \core_ports_p0_o[1] ;
   wire \core_ports_p0_o[2] ;
   wire \core_ports_p0_o[3] ;
   wire \core_ports_p0_o[4] ;
   wire \core_ports_p0_o[5] ;
   wire \core_ports_p0_o[6] ;
   wire \core_ports_p0_o[7] ;
   wire \core_ports_p0en_o[0] ;
   wire \core_ports_p0en_o[1] ;
   wire \core_ports_p0en_o[2] ;
   wire \core_ports_p0en_o[3] ;
   wire \core_ports_p0en_o[4] ;
   wire \core_ports_p0en_o[5] ;
   wire \core_ports_p0en_o[6] ;
   wire \core_ports_p0en_o[7] ;
   wire \core_ports_p1en_o[0] ;
   wire \core_ports_p1en_o[1] ;
   wire \core_ports_p1en_o[2] ;
   wire \core_ports_p1en_o[3] ;
   wire \core_ports_p1en_o[4] ;
   wire \core_ports_p1en_o[5] ;
   wire \core_ports_p1en_o[6] ;
   wire \core_ports_p1en_o[7] ;
   wire \core_ports_p2_o[0] ;
   wire \core_ports_p2_o[1] ;
   wire \core_ports_p2_o[2] ;
   wire \core_ports_p2_o[3] ;
   wire \core_ports_p2_o[4] ;
   wire \core_ports_p2_o[5] ;
   wire \core_ports_p2_o[6] ;
   wire \core_ports_p2_o[7] ;
   wire \core_ports_p2en_o[0] ;
   wire \core_ports_p2en_o[1] ;
   wire \core_ports_p2en_o[2] ;
   wire \core_ports_p2en_o[3] ;
   wire \core_ports_p2en_o[4] ;
   wire \core_ports_p2en_o[5] ;
   wire \core_ports_p2en_o[6] ;
   wire \core_ports_p2en_o[7] ;
   wire \core_ports_p3_o[6] ;
   wire \core_ports_p3_o[7] ;
   wire \core_ports_p3en_o[0] ;
   wire \core_ports_p3en_o[1] ;
   wire \core_ports_p3en_o[2] ;
   wire \core_ports_p3en_o[3] ;
   wire \core_ports_p3en_o[4] ;
   wire \core_ports_p3en_o[5] ;
   wire \core_ports_p3en_o[6] ;
   wire \core_ports_p3en_o[7] ;
   wire \core_ports_p4_o[0] ;
   wire \core_ports_p4_o[1] ;
   wire \core_ports_p4_o[2] ;
   wire \core_ports_p4_o[3] ;
   wire \core_ports_p4_o[4] ;
   wire \core_ports_p4_o[5] ;
   wire \core_ports_p4_o[6] ;
   wire \core_ports_p4_o[7] ;
   wire core_reset_o;
   wire core_serial_ren_o;
   wire \core_serial_sbuf_tx_o[0] ;
   wire \core_serial_sbuf_tx_o[1] ;
   wire \core_serial_sbuf_tx_o[2] ;
   wire \core_serial_sbuf_tx_o[3] ;
   wire \core_serial_sbuf_tx_o[4] ;
   wire \core_serial_sbuf_tx_o[5] ;
   wire \core_serial_sbuf_tx_o[6] ;
   wire \core_serial_sbuf_tx_o[7] ;
   wire core_serial_tb8_o;
   wire core_serial_tx_o;
   wire \core_timers_dfp_o[0] ;
   wire \core_timers_dfp_o[1] ;
   wire \core_timers_dfp_o[2] ;
   wire core_timers_dfsel_o;
   wire core_timers_edgsel_o;
   wire core_timers_gate_t0_o;
   wire core_timers_gate_t1_o;
   wire core_timers_m0_t0_o;
   wire core_timers_m0_t1_o;
   wire core_timers_m1_t0_o;
   wire core_timers_m1_t1_o;
   wire \core_timers_tacph_o[0] ;
   wire \core_timers_tacph_o[1] ;
   wire \core_timers_tacpl_o[0] ;
   wire \core_timers_tacpl_o[1] ;
   wire \core_timers_tacpl_o[2] ;
   wire \core_timers_tacpl_o[3] ;
   wire \core_timers_tacpl_o[4] ;
   wire \core_timers_tacpl_o[5] ;
   wire \core_timers_tacpl_o[6] ;
   wire \core_timers_tacpl_o[7] ;
   wire core_timers_tf0_o;
   wire core_timers_tf1_o;
   wire core_timers_tf2_o;
   wire \core_timers_th0_o[0] ;
   wire \core_timers_th0_o[1] ;
   wire \core_timers_th0_o[2] ;
   wire \core_timers_th0_o[3] ;
   wire \core_timers_th0_o[4] ;
   wire \core_timers_th0_o[5] ;
   wire \core_timers_th0_o[6] ;
   wire \core_timers_th0_o[7] ;
   wire \core_timers_th1_o[0] ;
   wire \core_timers_th1_o[1] ;
   wire \core_timers_th1_o[2] ;
   wire \core_timers_th1_o[3] ;
   wire \core_timers_th1_o[4] ;
   wire \core_timers_th1_o[5] ;
   wire \core_timers_th1_o[6] ;
   wire \core_timers_th1_o[7] ;
   wire \core_timers_tl0_o[0] ;
   wire \core_timers_tl0_o[1] ;
   wire \core_timers_tl0_o[2] ;
   wire \core_timers_tl0_o[3] ;
   wire \core_timers_tl0_o[4] ;
   wire \core_timers_tl0_o[5] ;
   wire \core_timers_tl0_o[6] ;
   wire \core_timers_tl0_o[7] ;
   wire \core_timers_tl1_o[0] ;
   wire \core_timers_tl1_o[1] ;
   wire \core_timers_tl1_o[2] ;
   wire \core_timers_tl1_o[3] ;
   wire \core_timers_tl1_o[4] ;
   wire \core_timers_tl1_o[5] ;
   wire \core_timers_tl1_o[6] ;
   wire \core_timers_tl1_o[7] ;
   wire \core_timers_tm0_o[0] ;
   wire \core_timers_tm0_o[1] ;
   wire \core_timers_tm0_o[2] ;
   wire \core_timers_tm0_o[3] ;
   wire \core_timers_tm0_o[4] ;
   wire \core_timers_tm0_o[5] ;
   wire \core_timers_tm0_o[6] ;
   wire \core_timers_tm0_o[7] ;
   wire \core_timers_tm1_o[0] ;
   wire \core_timers_tm1_o[1] ;
   wire \core_timers_tm1_o[2] ;
   wire \core_timers_tm1_o[3] ;
   wire \core_timers_tm1_o[4] ;
   wire \core_timers_tm1_o[5] ;
   wire \core_timers_tm1_o[6] ;
   wire \core_timers_tm1_o[7] ;
   wire core_timers_tr0_o;
   wire core_timers_tr1_o;
   wire core_timers_tr2_o;
   wire int_reg_clr_o;
   wire \int_vect_o[0] ;
   wire \int_vect_o[1] ;
   wire \int_vect_o[2] ;
   wire n_144;
   wire n_145;
   wire n_154;
   wire n_158;
   wire n_159;
   wire n_166;
   wire n_169;
   wire n_170;
   wire n_203;
   wire n_206;
   wire n_207;
   wire n_215;
   wire n_219;
   wire n_223;
   wire n_231;
   wire n_235;
   wire n_239;
   wire n_247;
   wire n_251;
   wire n_255;
   wire n_259;
   wire \reg_tcon2_o[0] ;
   wire \reg_tcon2_o[1] ;
   wire \reg_tcon_o[0] ;
   wire \reg_tcon_o[1] ;
   wire \reg_tcon_o[2] ;
   wire \reg_tcon_o[3] ;
   wire \serial_data_sbuf_o[0] ;
   wire \serial_data_sbuf_o[1] ;
   wire \serial_data_sbuf_o[2] ;
   wire \serial_data_sbuf_o[3] ;
   wire \serial_data_sbuf_o[4] ;
   wire \serial_data_sbuf_o[5] ;
   wire \serial_data_sbuf_o[6] ;
   wire \serial_data_sbuf_o[7] ;
   wire serial_load_sbuf_o;
   wire serial_p3_0_o;
   wire serial_p3_1_o;
   wire serial_p3en_0_o;
   wire serial_p3en_1_o;
   wire serial_scon0_ri_o;
   wire serial_scon1_ti_o;
   wire serial_scon2_rb8_o;
   wire top_cycle_machine;
   wire \top_timers_sfr_acrh_o[0] ;
   wire \top_timers_sfr_acrh_o[1] ;
   wire \top_timers_sfr_acrh_o[2] ;
   wire \top_timers_sfr_acrh_o[3] ;
   wire \top_timers_sfr_acrh_o[4] ;
   wire \top_timers_sfr_acrh_o[5] ;
   wire \top_timers_sfr_acrh_o[6] ;
   wire \top_timers_sfr_acrh_o[7] ;
   wire \top_timers_sfr_acrl_o[0] ;
   wire \top_timers_sfr_acrl_o[1] ;
   wire \top_timers_sfr_acrl_o[2] ;
   wire \top_timers_sfr_acrl_o[3] ;
   wire \top_timers_sfr_acrl_o[4] ;
   wire \top_timers_sfr_acrl_o[5] ;
   wire \top_timers_sfr_acrl_o[6] ;
   wire \top_timers_sfr_acrl_o[7] ;
   wire \top_timers_sfr_acrm_o[0] ;
   wire \top_timers_sfr_acrm_o[1] ;
   wire \top_timers_sfr_acrm_o[2] ;
   wire \top_timers_sfr_acrm_o[3] ;
   wire \top_timers_sfr_acrm_o[4] ;
   wire \top_timers_sfr_acrm_o[5] ;
   wire \top_timers_sfr_acrm_o[6] ;
   wire \top_timers_sfr_acrm_o[7] ;
   wire top_timers_sfr_tcon2_tf2_o;
   wire top_timers_sfr_tcon_tf0_o;
   wire top_timers_sfr_tcon_tf1_o;
   wire \top_timers_sfr_th0_o[0] ;
   wire \top_timers_sfr_th0_o[1] ;
   wire \top_timers_sfr_th0_o[2] ;
   wire \top_timers_sfr_th0_o[3] ;
   wire \top_timers_sfr_th0_o[4] ;
   wire \top_timers_sfr_th0_o[5] ;
   wire \top_timers_sfr_th0_o[6] ;
   wire \top_timers_sfr_th0_o[7] ;
   wire \top_timers_sfr_th1_o[0] ;
   wire \top_timers_sfr_th1_o[1] ;
   wire \top_timers_sfr_th1_o[2] ;
   wire \top_timers_sfr_th1_o[3] ;
   wire \top_timers_sfr_th1_o[4] ;
   wire \top_timers_sfr_th1_o[5] ;
   wire \top_timers_sfr_th1_o[6] ;
   wire \top_timers_sfr_th1_o[7] ;
   wire \top_timers_sfr_tl0_o[0] ;
   wire \top_timers_sfr_tl0_o[1] ;
   wire \top_timers_sfr_tl0_o[2] ;
   wire \top_timers_sfr_tl0_o[3] ;
   wire \top_timers_sfr_tl0_o[4] ;
   wire \top_timers_sfr_tl0_o[5] ;
   wire \top_timers_sfr_tl0_o[6] ;
   wire \top_timers_sfr_tl0_o[7] ;
   wire \top_timers_sfr_tl1_o[0] ;
   wire \top_timers_sfr_tl1_o[1] ;
   wire \top_timers_sfr_tl1_o[2] ;
   wire \top_timers_sfr_tl1_o[3] ;
   wire \top_timers_sfr_tl1_o[4] ;
   wire \top_timers_sfr_tl1_o[5] ;
   wire \top_timers_sfr_tl1_o[6] ;
   wire \top_timers_sfr_tl1_o[7] ;
   wire \top_timers_sfr_tm0_o[0] ;
   wire \top_timers_sfr_tm0_o[1] ;
   wire \top_timers_sfr_tm0_o[2] ;
   wire \top_timers_sfr_tm0_o[3] ;
   wire \top_timers_sfr_tm0_o[4] ;
   wire \top_timers_sfr_tm0_o[5] ;
   wire \top_timers_sfr_tm0_o[6] ;
   wire \top_timers_sfr_tm0_o[7] ;
   wire \top_timers_sfr_tm1_o[0] ;
   wire \top_timers_sfr_tm1_o[1] ;
   wire \top_timers_sfr_tm1_o[2] ;
   wire \top_timers_sfr_tm1_o[3] ;
   wire \top_timers_sfr_tm1_o[4] ;
   wire \top_timers_sfr_tm1_o[5] ;
   wire \top_timers_sfr_tm1_o[6] ;
   wire \top_timers_sfr_tm1_o[7] ;

   baud_rate BAUD_RATE_INSTANCE (.system_clk_i(top_clock_i), 
	.system_rst_i_b(core_reset_o), 
	.baud_rate_scon_sm0_i(core_baudrate_sm0_o), 
	.baud_rate_scon_sm1_i(core_baudrate_sm1_o), 
	.baud_rate_scon_sm2_i(core_baudrate_sm2_o), 
	.baud_rate_pcon_smod_i(core_baudrate_smod_o), 
	.baud_rate_pcon_rs232_i(core_baudrate_rs232_o), 
	.baud_rate_cm_o(top_cycle_machine), 
	.baud_rate_br_trans_o(n_144), 
	.baud_rate_br_o(baud_rate_br_o), 
	.DFT_sdi(top_p0_y_i[0]), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_203), 
	.DFT_sdi_1(top_p0_y_i[1]), 
	.DFT_sdo_2(n_154), 
	.SPCASCAN_N1(SPCASCAN_N1), 
	.FE_PT1_top_p2_a_o_0_(top_p2_a_o[0]), 
	.SPCASCAN_N2(SPCASCAN_N2), 
	.FE_PT1_top_p2_a_o_1_(top_p2_a_o[1]));
   bus_control BUS_CONTROL_INSTANCE (.bus_control_ea_b_i(1'b0), 
	.bus_control_core_ext_data_i({ \core_bus_ctrl_data_o[7] ,
		\core_bus_ctrl_data_o[6] ,
		\core_bus_ctrl_data_o[5] ,
		\core_bus_ctrl_data_o[4] ,
		\core_bus_ctrl_data_o[3] ,
		\core_bus_ctrl_data_o[2] ,
		\core_bus_ctrl_data_o[1] ,
		\core_bus_ctrl_data_o[0]  }), 
	.bus_control_core_ext_addr_i({ \core_bus_ctrl_addr_o[15] ,
		\core_bus_ctrl_addr_o[14] ,
		\core_bus_ctrl_addr_o[13] ,
		\core_bus_ctrl_addr_o[12] ,
		\core_bus_ctrl_addr_o[11] ,
		\core_bus_ctrl_addr_o[10] ,
		\core_bus_ctrl_addr_o[9] ,
		\core_bus_ctrl_addr_o[8] ,
		\core_bus_ctrl_addr_o[7] ,
		\core_bus_ctrl_addr_o[6] ,
		\core_bus_ctrl_addr_o[5] ,
		\core_bus_ctrl_addr_o[4] ,
		\core_bus_ctrl_addr_o[3] ,
		\core_bus_ctrl_addr_o[2] ,
		\core_bus_ctrl_addr_o[1] ,
		\core_bus_ctrl_addr_o[0]  }), 
	.bus_control_core_ext_ram_wr_b_i(core_bus_ctrl_ext_ram_wr_b_o), 
	.bus_control_core_ext_ram_rd_b_i(core_bus_ctrl_ext_ram_rd_b_o), 
	.bus_control_core_ext_rom_rd_b_i(core_bus_ctrl_ext_rom_rd_b_o), 
	.bus_control_psen_b_o(top_psen_b_o), 
	.bus_control_core_ext_data_o({ \bus_control_ext_data_o[7] ,
		\bus_control_ext_data_o[6] ,
		\bus_control_ext_data_o[5] ,
		\bus_control_ext_data_o[4] ,
		\bus_control_ext_data_o[3] ,
		\bus_control_ext_data_o[2] ,
		\bus_control_ext_data_o[1] ,
		\bus_control_ext_data_o[0]  }), 
	.bus_control_core_ea_b_o(UNCONNECTED69), 
	.bus_control_core_p0_i({ \core_ports_p0_o[7] ,
		\core_ports_p0_o[6] ,
		\core_ports_p0_o[5] ,
		\core_ports_p0_o[4] ,
		\core_ports_p0_o[3] ,
		\core_ports_p0_o[2] ,
		\core_ports_p0_o[1] ,
		\core_ports_p0_o[0]  }), 
	.bus_control_ports_p0_i({ top_p0_y_i[7],
		top_p0_y_i[6],
		top_p0_y_i[5],
		top_p0_y_i[4],
		top_p0_y_i[3],
		top_p0_y_i[2],
		top_p0_y_i[1],
		top_p0_y_i[0] }), 
	.bus_control_core_p0en_i({ \core_ports_p0en_o[7] ,
		\core_ports_p0en_o[6] ,
		\core_ports_p0en_o[5] ,
		\core_ports_p0en_o[4] ,
		\core_ports_p0en_o[3] ,
		\core_ports_p0en_o[2] ,
		\core_ports_p0en_o[1] ,
		\core_ports_p0en_o[0]  }), 
	.bus_control_core_p2_i({ \core_ports_p2_o[7] ,
		\core_ports_p2_o[6] ,
		\core_ports_p2_o[5] ,
		\core_ports_p2_o[4] ,
		\core_ports_p2_o[3] ,
		\core_ports_p2_o[2] ,
		\core_ports_p2_o[1] ,
		\core_ports_p2_o[0]  }), 
	.bus_control_core_p2en_i({ \core_ports_p2en_o[7] ,
		\core_ports_p2en_o[6] ,
		\core_ports_p2en_o[5] ,
		\core_ports_p2en_o[4] ,
		\core_ports_p2en_o[3] ,
		\core_ports_p2en_o[2] ,
		\core_ports_p2en_o[1] ,
		\core_ports_p2en_o[0]  }), 
	.bus_control_core_p3_6_i(\core_ports_p3_o[6] ), 
	.bus_control_core_p3_7_i(\core_ports_p3_o[7] ), 
	.bus_control_core_p3en_6_i(SPCASCAN_N7), 
	.bus_control_core_p3en_7_i(\core_ports_p3en_o[7] ), 
	.bus_control_core_p4_i({ \core_ports_p4_o[7] ,
		\core_ports_p4_o[6] ,
		\core_ports_p4_o[5] ,
		\core_ports_p4_o[4] ,
		\core_ports_p4_o[3] ,
		\core_ports_p4_o[2] ,
		\core_ports_p4_o[1] ,
		\core_ports_p4_o[0]  }), 
	.bus_control_core_p0_o({ top_p0_a_o[7],
		top_p0_a_o[6],
		top_p0_a_o[5],
		top_p0_a_o[4],
		top_p0_a_o[3],
		top_p0_a_o[2],
		top_p0_a_o[1],
		top_p0_a_o[0] }), 
	.bus_control_core_p0en_o({ \bus_control_p0en_o[7] ,
		\bus_control_p0en_o[6] ,
		\bus_control_p0en_o[5] ,
		\bus_control_p0en_o[4] ,
		\bus_control_p0en_o[3] ,
		\bus_control_p0en_o[2] ,
		\bus_control_p0en_o[1] ,
		\bus_control_p0en_o[0]  }), 
	.bus_control_core_p2_o({ \bus_control_p2_o[7] ,
		\bus_control_p2_o[6] ,
		\bus_control_p2_o[5] ,
		\bus_control_p2_o[4] ,
		\bus_control_p2_o[3] ,
		\bus_control_p2_o[2] ,
		\bus_control_p2_o[1] ,
		\bus_control_p2_o[0]  }), 
	.bus_control_core_p2en_o({ \bus_control_p2en_o[7] ,
		\bus_control_p2en_o[6] ,
		\bus_control_p2en_o[5] ,
		\bus_control_p2en_o[4] ,
		\bus_control_p2en_o[3] ,
		\bus_control_p2en_o[2] ,
		\bus_control_p2en_o[1] ,
		\bus_control_p2en_o[0]  }), 
	.bus_control_core_p3_6_o(top_p3_a_o[6]), 
	.bus_control_core_p3_7_o(top_p3_a_o[7]), 
	.bus_control_core_p3en_6_o(bus_control_p3en_6_o), 
	.bus_control_core_p3en_7_o(bus_control_p3en_7_o), 
	.bus_control_core_p4_o({ \bus_control_p4_o[7] ,
		\bus_control_p4_o[6] ,
		\bus_control_p4_o[5] ,
		\bus_control_p4_o[4] ,
		\bus_control_p4_o[3] ,
		\bus_control_p4_o[2] ,
		\bus_control_p4_o[1] ,
		\bus_control_p4_o[0]  }));
   core CORE_INSTANCE (.core_clk_i(top_clock_i), 
	.core_mem_clk_i(top_clock_mem_i), 
	.core_reset_i(top_reset_i), 
	.core_interrupt_vect_i({ \int_vect_o[2] ,
		\int_vect_o[1] ,
		\int_vect_o[0]  }), 
	.core_timers_th0_i({ \top_timers_sfr_th0_o[7] ,
		\top_timers_sfr_th0_o[6] ,
		\top_timers_sfr_th0_o[5] ,
		\top_timers_sfr_th0_o[4] ,
		\top_timers_sfr_th0_o[3] ,
		\top_timers_sfr_th0_o[2] ,
		\top_timers_sfr_th0_o[1] ,
		\top_timers_sfr_th0_o[0]  }), 
	.core_timers_tm0_i({ \top_timers_sfr_tm0_o[7] ,
		\top_timers_sfr_tm0_o[6] ,
		\top_timers_sfr_tm0_o[5] ,
		\top_timers_sfr_tm0_o[4] ,
		\top_timers_sfr_tm0_o[3] ,
		\top_timers_sfr_tm0_o[2] ,
		\top_timers_sfr_tm0_o[1] ,
		\top_timers_sfr_tm0_o[0]  }), 
	.core_timers_tl0_i({ \top_timers_sfr_tl0_o[7] ,
		\top_timers_sfr_tl0_o[6] ,
		\top_timers_sfr_tl0_o[5] ,
		\top_timers_sfr_tl0_o[4] ,
		\top_timers_sfr_tl0_o[3] ,
		\top_timers_sfr_tl0_o[2] ,
		\top_timers_sfr_tl0_o[1] ,
		\top_timers_sfr_tl0_o[0]  }), 
	.core_timers_tf0_i(top_timers_sfr_tcon_tf0_o), 
	.core_timers_th1_i({ \top_timers_sfr_th1_o[7] ,
		\top_timers_sfr_th1_o[6] ,
		\top_timers_sfr_th1_o[5] ,
		\top_timers_sfr_th1_o[4] ,
		\top_timers_sfr_th1_o[3] ,
		\top_timers_sfr_th1_o[2] ,
		\top_timers_sfr_th1_o[1] ,
		\top_timers_sfr_th1_o[0]  }), 
	.core_timers_tm1_i({ \top_timers_sfr_tm1_o[7] ,
		\top_timers_sfr_tm1_o[6] ,
		\top_timers_sfr_tm1_o[5] ,
		\top_timers_sfr_tm1_o[4] ,
		\top_timers_sfr_tm1_o[3] ,
		\top_timers_sfr_tm1_o[2] ,
		\top_timers_sfr_tm1_o[1] ,
		\top_timers_sfr_tm1_o[0]  }), 
	.core_timers_tl1_i({ \top_timers_sfr_tl1_o[7] ,
		\top_timers_sfr_tl1_o[6] ,
		\top_timers_sfr_tl1_o[5] ,
		\top_timers_sfr_tl1_o[4] ,
		\top_timers_sfr_tl1_o[3] ,
		\top_timers_sfr_tl1_o[2] ,
		\top_timers_sfr_tl1_o[1] ,
		\top_timers_sfr_tl1_o[0]  }), 
	.core_timers_tf1_i(top_timers_sfr_tcon_tf1_o), 
	.core_timers_acrh_i({ \top_timers_sfr_acrh_o[7] ,
		\top_timers_sfr_acrh_o[6] ,
		\top_timers_sfr_acrh_o[5] ,
		\top_timers_sfr_acrh_o[4] ,
		\top_timers_sfr_acrh_o[3] ,
		\top_timers_sfr_acrh_o[2] ,
		\top_timers_sfr_acrh_o[1] ,
		\top_timers_sfr_acrh_o[0]  }), 
	.core_timers_acrm_i({ \top_timers_sfr_acrm_o[7] ,
		\top_timers_sfr_acrm_o[6] ,
		\top_timers_sfr_acrm_o[5] ,
		\top_timers_sfr_acrm_o[4] ,
		\top_timers_sfr_acrm_o[3] ,
		\top_timers_sfr_acrm_o[2] ,
		\top_timers_sfr_acrm_o[1] ,
		\top_timers_sfr_acrm_o[0]  }), 
	.core_timers_acrl_i({ \top_timers_sfr_acrl_o[7] ,
		\top_timers_sfr_acrl_o[6] ,
		\top_timers_sfr_acrl_o[5] ,
		\top_timers_sfr_acrl_o[4] ,
		\top_timers_sfr_acrl_o[3] ,
		\top_timers_sfr_acrl_o[2] ,
		\top_timers_sfr_acrl_o[1] ,
		\top_timers_sfr_acrl_o[0]  }), 
	.core_timers_tf2_i(top_timers_sfr_tcon2_tf2_o), 
	.core_bus_ctrl_p0en_i({ \bus_control_p0en_o[7] ,
		\bus_control_p0en_o[6] ,
		\bus_control_p0en_o[5] ,
		\bus_control_p0en_o[4] ,
		\bus_control_p0en_o[3] ,
		\bus_control_p0en_o[2] ,
		\bus_control_p0en_o[1] ,
		\bus_control_p0en_o[0]  }), 
	.core_bus_ctrl_p2en_i({ \bus_control_p2en_o[7] ,
		\bus_control_p2en_o[6] ,
		\bus_control_p2en_o[5] ,
		\bus_control_p2en_o[4] ,
		\bus_control_p2en_o[3] ,
		\bus_control_p2en_o[2] ,
		\bus_control_p2en_o[1] ,
		\bus_control_p2en_o[0]  }), 
	.core_bus_ctrl_p3en_6_i(bus_control_p3en_6_o), 
	.core_bus_ctrl_p3en_7_i(bus_control_p3en_7_o), 
	.core_bus_ctrl_p2_i({ \bus_control_p2_o[7] ,
		\bus_control_p2_o[6] ,
		\bus_control_p2_o[5] ,
		\bus_control_p2_o[4] ,
		\bus_control_p2_o[3] ,
		\bus_control_p2_o[2] ,
		\bus_control_p2_o[1] ,
		\bus_control_p2_o[0]  }), 
	.core_bus_ctrl_p3_6_i(top_p3_a_o[6]), 
	.core_bus_ctrl_p3_7_i(top_p3_a_o[7]), 
	.core_bus_ctrl_p4_i({ \bus_control_p4_o[7] ,
		\bus_control_p4_o[6] ,
		\bus_control_p4_o[5] ,
		\bus_control_p4_o[4] ,
		\bus_control_p4_o[3] ,
		\bus_control_p4_o[2] ,
		\bus_control_p4_o[1] ,
		\bus_control_p4_o[0]  }), 
	.core_interrupt_tcon_i({ \reg_tcon_o[3] ,
		\reg_tcon_o[2] ,
		\reg_tcon_o[1] ,
		\reg_tcon_o[0]  }), 
	.core_interrupt_tcon2_i({ \reg_tcon2_o[1] ,
		\reg_tcon2_o[0]  }), 
	.core_interrupt_clear_i(int_reg_clr_o), 
	.core_serial_p3en_0_i(serial_p3en_0_o), 
	.core_serial_p3en_1_i(serial_p3en_1_o), 
	.core_serial_p3_0_i(serial_p3_0_o), 
	.core_serial_p3_1_i(serial_p3_1_o), 
	.core_serial_sbuf_rx_i({ \serial_data_sbuf_o[7] ,
		\serial_data_sbuf_o[6] ,
		\serial_data_sbuf_o[5] ,
		\serial_data_sbuf_o[4] ,
		\serial_data_sbuf_o[3] ,
		\serial_data_sbuf_o[2] ,
		\serial_data_sbuf_o[1] ,
		\serial_data_sbuf_o[0]  }), 
	.core_serial_rb8_i(serial_scon2_rb8_o), 
	.core_serial_ti_i(serial_scon1_ti_o), 
	.core_serial_ri_i(serial_scon0_ri_o), 
	.core_serial_load_sbuf_i(serial_load_sbuf_o), 
	.core_ports_p0_i({ top_p0_y_i[7],
		top_p0_y_i[6],
		top_p0_y_i[5],
		top_p0_y_i[4],
		top_p0_y_i[3],
		top_p0_y_i[2],
		top_p0_y_i[1],
		top_p0_y_i[0] }), 
	.core_ports_p1_i({ top_p1_y_i[7],
		top_p1_y_i[6],
		top_p1_y_i[5],
		top_p1_y_i[4],
		top_p1_y_i[3],
		top_p1_y_i[2],
		top_p1_y_i[1],
		top_p1_y_i[0] }), 
	.core_ports_p2_i({ top_p2_y_i[7],
		top_p2_y_i[6],
		top_p2_y_i[5],
		top_p2_y_i[4],
		top_p2_y_i[3],
		top_p2_y_i[2],
		top_p2_y_i[1],
		top_p2_y_i[0] }), 
	.core_ports_p3_i({ top_p3_y_i[7],
		top_p3_y_i[6],
		top_p3_y_i[5],
		top_p3_y_i[4],
		top_p3_y_i[3],
		top_p3_y_i[2],
		top_p3_y_i[1],
		top_p3_y_i[0] }), 
	.core_bus_ctrl_p0_i({ top_p0_a_o[7],
		top_p0_a_o[6],
		top_p0_a_o[5],
		top_p0_a_o[4],
		top_p0_a_o[3],
		top_p0_a_o[2],
		top_p0_a_o[1],
		top_p0_a_o[0] }), 
	.core_reset_o(core_reset_o), 
	.core_baudrate_sm0_o(core_baudrate_sm0_o), 
	.core_baudrate_sm1_o(core_baudrate_sm1_o), 
	.core_baudrate_sm2_o(core_baudrate_sm2_o), 
	.core_baudrate_smod_o(core_baudrate_smod_o), 
	.core_baudrate_rs232_o(core_baudrate_rs232_o), 
	.core_timers_th0_o({ \core_timers_th0_o[7] ,
		\core_timers_th0_o[6] ,
		\core_timers_th0_o[5] ,
		\core_timers_th0_o[4] ,
		\core_timers_th0_o[3] ,
		\core_timers_th0_o[2] ,
		\core_timers_th0_o[1] ,
		\core_timers_th0_o[0]  }), 
	.core_timers_tm0_o({ \core_timers_tm0_o[7] ,
		\core_timers_tm0_o[6] ,
		\core_timers_tm0_o[5] ,
		\core_timers_tm0_o[4] ,
		\core_timers_tm0_o[3] ,
		\core_timers_tm0_o[2] ,
		\core_timers_tm0_o[1] ,
		\core_timers_tm0_o[0]  }), 
	.core_timers_tl0_o({ \core_timers_tl0_o[7] ,
		\core_timers_tl0_o[6] ,
		\core_timers_tl0_o[5] ,
		\core_timers_tl0_o[4] ,
		\core_timers_tl0_o[3] ,
		\core_timers_tl0_o[2] ,
		\core_timers_tl0_o[1] ,
		\core_timers_tl0_o[0]  }), 
	.core_timers_gate_t0_o(core_timers_gate_t0_o), 
	.core_timers_m1_t0_o(core_timers_m1_t0_o), 
	.core_timers_m0_t0_o(core_timers_m0_t0_o), 
	.core_timers_tr0_o(core_timers_tr0_o), 
	.core_timers_tf0_o(core_timers_tf0_o), 
	.core_timers_th1_o({ \core_timers_th1_o[7] ,
		\core_timers_th1_o[6] ,
		\core_timers_th1_o[5] ,
		\core_timers_th1_o[4] ,
		\core_timers_th1_o[3] ,
		\core_timers_th1_o[2] ,
		\core_timers_th1_o[1] ,
		\core_timers_th1_o[0]  }), 
	.core_timers_tm1_o({ \core_timers_tm1_o[7] ,
		\core_timers_tm1_o[6] ,
		\core_timers_tm1_o[5] ,
		\core_timers_tm1_o[4] ,
		\core_timers_tm1_o[3] ,
		\core_timers_tm1_o[2] ,
		\core_timers_tm1_o[1] ,
		\core_timers_tm1_o[0]  }), 
	.core_timers_tl1_o({ \core_timers_tl1_o[7] ,
		\core_timers_tl1_o[6] ,
		\core_timers_tl1_o[5] ,
		\core_timers_tl1_o[4] ,
		\core_timers_tl1_o[3] ,
		\core_timers_tl1_o[2] ,
		\core_timers_tl1_o[1] ,
		\core_timers_tl1_o[0]  }), 
	.core_timers_gate_t1_o(core_timers_gate_t1_o), 
	.core_timers_m1_t1_o(core_timers_m1_t1_o), 
	.core_timers_m0_t1_o(core_timers_m0_t1_o), 
	.core_timers_int0_o(top_p3_a_o[2]), 
	.core_timers_tr1_o(core_timers_tr1_o), 
	.core_timers_tf1_o(core_timers_tf1_o), 
	.core_timers_int1_o(top_p3_a_o[3]), 
	.core_timers_tacph_o({ \core_timers_tacph_o[1] ,
		\core_timers_tacph_o[0]  }), 
	.core_timers_tacpl_o({ \core_timers_tacpl_o[7] ,
		\core_timers_tacpl_o[6] ,
		\core_timers_tacpl_o[5] ,
		\core_timers_tacpl_o[4] ,
		\core_timers_tacpl_o[3] ,
		\core_timers_tacpl_o[2] ,
		\core_timers_tacpl_o[1] ,
		\core_timers_tacpl_o[0]  }), 
	.core_timers_tr2_o(core_timers_tr2_o), 
	.core_timers_tf2_o(core_timers_tf2_o), 
	.core_timers_dfsel_o(core_timers_dfsel_o), 
	.core_timers_edgsel_o(core_timers_edgsel_o), 
	.core_timers_dfp_o({ \core_timers_dfp_o[2] ,
		\core_timers_dfp_o[1] ,
		\core_timers_dfp_o[0]  }), 
	.core_interrupt_ip_o({ \core_interrupt_ip_o[6] ,
		\core_interrupt_ip_o[5] ,
		\core_interrupt_ip_o[4] ,
		\core_interrupt_ip_o[3] ,
		\core_interrupt_ip_o[2] ,
		\core_interrupt_ip_o[1] ,
		\core_interrupt_ip_o[0]  }), 
	.core_interrupt_ie_o({ \core_interrupt_ie_o[7] ,
		\core_interrupt_ie_o[6] ,
		\core_interrupt_ie_o[5] ,
		\core_interrupt_ie_o[4] ,
		\core_interrupt_ie_o[3] ,
		\core_interrupt_ie_o[2] ,
		\core_interrupt_ie_o[1] ,
		\core_interrupt_ie_o[0]  }), 
	.core_interrupt_scon_o({ \core_interrupt_scon_o[1] ,
		\core_interrupt_scon_o[0]  }), 
	.core_interrupt_tcon_o({ UNCONNECTED70,
		UNCONNECTED71,
		\core_interrupt_tcon_o[3] ,
		\core_interrupt_tcon_o[2] ,
		\core_interrupt_tcon_o[1] ,
		\core_interrupt_tcon_o[0]  }), 
	.core_interrupt_tcon2_o({ \core_interrupt_tcon2_o[1] ,
		UNCONNECTED72 }), 
	.core_interrupt_intx_o({ UNCONNECTED73,
		UNCONNECTED74 }), 
	.core_interrupt_na_o(core_interrupt_na_o), 
	.core_interrupt_rdy_o(core_interrupt_rdy_o), 
	.core_ports_p4_o({ \core_ports_p4_o[7] ,
		\core_ports_p4_o[6] ,
		\core_ports_p4_o[5] ,
		\core_ports_p4_o[4] ,
		\core_ports_p4_o[3] ,
		\core_ports_p4_o[2] ,
		\core_ports_p4_o[1] ,
		\core_ports_p4_o[0]  }), 
	.core_ports_p0en_o({ \core_ports_p0en_o[7] ,
		\core_ports_p0en_o[6] ,
		\core_ports_p0en_o[5] ,
		\core_ports_p0en_o[4] ,
		\core_ports_p0en_o[3] ,
		\core_ports_p0en_o[2] ,
		\core_ports_p0en_o[1] ,
		\core_ports_p0en_o[0]  }), 
	.core_ports_p1en_o({ \core_ports_p1en_o[7] ,
		\core_ports_p1en_o[6] ,
		\core_ports_p1en_o[5] ,
		\core_ports_p1en_o[4] ,
		\core_ports_p1en_o[3] ,
		\core_ports_p1en_o[2] ,
		\core_ports_p1en_o[1] ,
		\core_ports_p1en_o[0]  }), 
	.core_ports_p2en_o({ \core_ports_p2en_o[7] ,
		\core_ports_p2en_o[6] ,
		\core_ports_p2en_o[5] ,
		\core_ports_p2en_o[4] ,
		\core_ports_p2en_o[3] ,
		\core_ports_p2en_o[2] ,
		\core_ports_p2en_o[1] ,
		\core_ports_p2en_o[0]  }), 
	.core_ports_p3en_o({ \core_ports_p3en_o[7] ,
		SPCASCAN_N7,
		\core_ports_p3en_o[5] ,
		\core_ports_p3en_o[4] ,
		\core_ports_p3en_o[3] ,
		\core_ports_p3en_o[2] ,
		\core_ports_p3en_o[1] ,
		\core_ports_p3en_o[0]  }), 
	.core_ports_p0_o({ \core_ports_p0_o[7] ,
		\core_ports_p0_o[6] ,
		\core_ports_p0_o[5] ,
		\core_ports_p0_o[4] ,
		\core_ports_p0_o[3] ,
		\core_ports_p0_o[2] ,
		\core_ports_p0_o[1] ,
		\core_ports_p0_o[0]  }), 
	.core_ports_p1_o({ top_p1_a_o[7],
		top_p1_a_o[6],
		top_p1_a_o[5],
		top_p1_a_o[4],
		top_p1_a_o[3],
		top_p1_a_o[2],
		top_p1_a_o[1],
		top_p1_a_o[0] }), 
	.core_ports_p2_o({ \core_ports_p2_o[7] ,
		\core_ports_p2_o[6] ,
		\core_ports_p2_o[5] ,
		\core_ports_p2_o[4] ,
		\core_ports_p2_o[3] ,
		\core_ports_p2_o[2] ,
		\core_ports_p2_o[1] ,
		\core_ports_p2_o[0]  }), 
	.core_ports_p3_o({ \core_ports_p3_o[7] ,
		\core_ports_p3_o[6] ,
		top_p3_a_o[5],
		top_p3_a_o[4],
		UNCONNECTED75,
		UNCONNECTED76,
		top_p3_a_o[1],
		top_p3_a_o[0] }), 
	.core_bus_ctrl_p0_o({ UNCONNECTED77,
		UNCONNECTED78,
		UNCONNECTED79,
		UNCONNECTED80,
		UNCONNECTED81,
		UNCONNECTED82,
		UNCONNECTED83,
		UNCONNECTED84 }), 
	.core_serial_sm0_o(UNCONNECTED85), 
	.core_serial_ren_o(core_serial_ren_o), 
	.core_serial_p3_0_o(UNCONNECTED86), 
	.core_serial_sbuf_tx_o({ \core_serial_sbuf_tx_o[7] ,
		\core_serial_sbuf_tx_o[6] ,
		\core_serial_sbuf_tx_o[5] ,
		\core_serial_sbuf_tx_o[4] ,
		\core_serial_sbuf_tx_o[3] ,
		\core_serial_sbuf_tx_o[2] ,
		\core_serial_sbuf_tx_o[1] ,
		\core_serial_sbuf_tx_o[0]  }), 
	.core_serial_tb8_o(core_serial_tb8_o), 
	.core_serial_ti_o(UNCONNECTED87), 
	.core_serial_ri_o(UNCONNECTED88), 
	.core_serial_tx_o(core_serial_tx_o), 
	.core_bus_ctrl_ea_b_i(top_ea_b_i), 
	.core_bus_ctrl_data_i({ \bus_control_ext_data_o[7] ,
		\bus_control_ext_data_o[6] ,
		\bus_control_ext_data_o[5] ,
		\bus_control_ext_data_o[4] ,
		\bus_control_ext_data_o[3] ,
		\bus_control_ext_data_o[2] ,
		\bus_control_ext_data_o[1] ,
		\bus_control_ext_data_o[0]  }), 
	.core_bus_ctrl_addr_o({ \core_bus_ctrl_addr_o[15] ,
		\core_bus_ctrl_addr_o[14] ,
		\core_bus_ctrl_addr_o[13] ,
		\core_bus_ctrl_addr_o[12] ,
		\core_bus_ctrl_addr_o[11] ,
		\core_bus_ctrl_addr_o[10] ,
		\core_bus_ctrl_addr_o[9] ,
		\core_bus_ctrl_addr_o[8] ,
		\core_bus_ctrl_addr_o[7] ,
		\core_bus_ctrl_addr_o[6] ,
		\core_bus_ctrl_addr_o[5] ,
		\core_bus_ctrl_addr_o[4] ,
		\core_bus_ctrl_addr_o[3] ,
		\core_bus_ctrl_addr_o[2] ,
		\core_bus_ctrl_addr_o[1] ,
		\core_bus_ctrl_addr_o[0]  }), 
	.core_bus_ctrl_data_o({ \core_bus_ctrl_data_o[7] ,
		\core_bus_ctrl_data_o[6] ,
		\core_bus_ctrl_data_o[5] ,
		\core_bus_ctrl_data_o[4] ,
		\core_bus_ctrl_data_o[3] ,
		\core_bus_ctrl_data_o[2] ,
		\core_bus_ctrl_data_o[1] ,
		\core_bus_ctrl_data_o[0]  }), 
	.core_bus_ctrl_ext_rom_rd_b_o(core_bus_ctrl_ext_rom_rd_b_o), 
	.core_bus_ctrl_ext_ram_rd_b_o(core_bus_ctrl_ext_ram_rd_b_o), 
	.core_bus_ctrl_ext_ram_wr_b_o(core_bus_ctrl_ext_ram_wr_b_o), 
	.DFT_sdi(n_154), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_231), 
	.DFT_sdi_1(top_p0_y_i[2]), 
	.DFT_sdo_2(n_158), 
	.DFT_sdi_3(top_p0_y_i[5]), 
	.DFT_sdo_4(n_169), 
	.DFT_sdi_5(top_p1_y_i[0]), 
	.DFT_sdo_6(n_259), 
	.DFT_sdi_7(\core_timers_tl0_o[0] ), 
	.DFT_sdi_8(\core_timers_tl0_o[7] ), 
	.DFT_sdo_9(n_207), 
	.DFT_sdi_10(top_p1_a_o[5]), 
	.DFT_sdi_11(top_p1_y_i[4]), 
	.DFT_sdo_12(n_215), 
	.DFT_sdi_13(top_p1_y_i[5]), 
	.DFT_sdo_14(n_219), 
	.DFT_sdi_15(top_p1_y_i[6]), 
	.DFT_sdo_16(n_223), 
	.DFT_sdi_17(top_p1_y_i[7]), 
	.SPCASCAN_N0(SPCASCAN_N0), 
	.FE_PT1_top_p4_a_o_6_(top_p4_a_o[6]), 
	.FE_PT1_top_p4_a_o_7_(top_p4_a_o[7]));
   INTERRUPT INTERRUPT_INSTANCE (.int_intx_b_i({ top_p3_a_o[3],
		top_p3_a_o[2] }), 
	.int_rst_sync_b_i(core_reset_o), 
	.clk(top_clock_i), 
	.int_rdy_i(core_interrupt_rdy_o), 
	.int_na_i(core_interrupt_na_o), 
	.int_cm_i(top_cycle_machine), 
	.reg_ie_i({ \core_interrupt_ie_o[7] ,
		\core_interrupt_ie_o[6] ,
		\core_interrupt_ie_o[5] ,
		\core_interrupt_ie_o[4] ,
		\core_interrupt_ie_o[3] ,
		\core_interrupt_ie_o[2] ,
		\core_interrupt_ie_o[1] ,
		\core_interrupt_ie_o[0]  }), 
	.reg_ip_i({ \core_interrupt_ip_o[6] ,
		\core_interrupt_ip_o[5] ,
		\core_interrupt_ip_o[4] ,
		\core_interrupt_ip_o[3] ,
		\core_interrupt_ip_o[2] ,
		\core_interrupt_ip_o[1] ,
		\core_interrupt_ip_o[0]  }), 
	.reg_scon_i({ \core_interrupt_scon_o[1] ,
		\core_interrupt_scon_o[0]  }), 
	.reg_tcon_i({ core_timers_tf1_o,
		core_timers_tf0_o,
		\core_interrupt_tcon_o[3] ,
		\core_interrupt_tcon_o[2] ,
		\core_interrupt_tcon_o[1] ,
		\core_interrupt_tcon_o[0]  }), 
	.reg_tcon2_i({ \core_interrupt_tcon2_o[1] ,
		core_timers_tf2_o }), 
	.int_vect_o({ \int_vect_o[2] ,
		\int_vect_o[1] ,
		\int_vect_o[0]  }), 
	.reg_tcon_o({ \reg_tcon_o[3] ,
		\reg_tcon_o[2] ,
		\reg_tcon_o[1] ,
		\reg_tcon_o[0]  }), 
	.reg_tcon2_o({ \reg_tcon2_o[1] ,
		\reg_tcon2_o[0]  }), 
	.int_reg_clr_o(int_reg_clr_o), 
	.DFT_sdi(n_158), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_159), 
	.DFT_sdi_1(n_169), 
	.DFT_sdo_2(n_170));
   PORT_TOP PORTS_INSTANCE (.ports_sfr_P0EN_i({ \core_ports_p0en_o[7] ,
		\core_ports_p0en_o[6] ,
		\core_ports_p0en_o[5] ,
		\core_ports_p0en_o[4] ,
		\core_ports_p0en_o[3] ,
		\core_ports_p0en_o[2] ,
		\core_ports_p0en_o[1] ,
		\core_ports_p0en_o[0]  }), 
	.ports_sfr_P1EN_i({ \core_ports_p1en_o[7] ,
		\core_ports_p1en_o[6] ,
		\core_ports_p1en_o[5] ,
		\core_ports_p1en_o[4] ,
		\core_ports_p1en_o[3] ,
		\core_ports_p1en_o[2] ,
		\core_ports_p1en_o[1] ,
		\core_ports_p1en_o[0]  }), 
	.ports_sfr_P2EN_i({ \core_ports_p2en_o[7] ,
		\core_ports_p2en_o[6] ,
		\core_ports_p2en_o[5] ,
		\core_ports_p2en_o[4] ,
		\core_ports_p2en_o[3] ,
		\core_ports_p2en_o[2] ,
		\core_ports_p2en_o[1] ,
		\core_ports_p2en_o[0]  }), 
	.ports_sfr_P3EN_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_sfr_P0_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_sfr_P1_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_sfr_P2_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_sfr_P3_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_sfr_P4_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_sfr_P0_o({ UNCONNECTED89,
		UNCONNECTED90,
		UNCONNECTED91,
		UNCONNECTED92,
		UNCONNECTED93,
		UNCONNECTED94,
		UNCONNECTED95,
		UNCONNECTED96 }), 
	.ports_sfr_P1_o({ UNCONNECTED97,
		UNCONNECTED98,
		UNCONNECTED99,
		UNCONNECTED100,
		UNCONNECTED101,
		UNCONNECTED102,
		UNCONNECTED103,
		UNCONNECTED104 }), 
	.ports_sfr_P2_o({ UNCONNECTED105,
		UNCONNECTED106,
		UNCONNECTED107,
		UNCONNECTED108,
		UNCONNECTED109,
		UNCONNECTED110,
		UNCONNECTED111,
		UNCONNECTED112 }), 
	.ports_sfr_P3_o({ UNCONNECTED113,
		UNCONNECTED114,
		UNCONNECTED115,
		UNCONNECTED116,
		UNCONNECTED117,
		UNCONNECTED118,
		UNCONNECTED119,
		UNCONNECTED120 }), 
	.y_port0_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.y_port1_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.y_port2_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.y_port3_i({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.ports_test_mode_i(top_test_mode_i), 
	.en_port0_o({ top_p0_en_o[7],
		top_p0_en_o[6],
		top_p0_en_o[5],
		top_p0_en_o[4],
		top_p0_en_o[3],
		top_p0_en_o[2],
		top_p0_en_o[1],
		top_p0_en_o[0] }), 
	.en_port1_o({ top_p1_en_o[7],
		top_p1_en_o[6],
		top_p1_en_o[5],
		top_p1_en_o[4],
		top_p1_en_o[3],
		top_p1_en_o[2],
		top_p1_en_o[1],
		top_p1_en_o[0] }), 
	.en_port2_o({ top_p2_en_o[7],
		top_p2_en_o[6],
		top_p2_en_o[5],
		top_p2_en_o[4],
		top_p2_en_o[3],
		top_p2_en_o[2],
		top_p2_en_o[1],
		top_p2_en_o[0] }), 
	.en_port3_o({ UNCONNECTED121,
		UNCONNECTED122,
		UNCONNECTED123,
		UNCONNECTED124,
		UNCONNECTED125,
		UNCONNECTED126,
		UNCONNECTED127,
		UNCONNECTED128 }), 
	.a_port0_o({ UNCONNECTED129,
		UNCONNECTED130,
		UNCONNECTED131,
		UNCONNECTED132,
		UNCONNECTED133,
		UNCONNECTED134,
		UNCONNECTED135,
		UNCONNECTED136 }), 
	.a_port1_o({ UNCONNECTED137,
		UNCONNECTED138,
		UNCONNECTED139,
		UNCONNECTED140,
		UNCONNECTED141,
		UNCONNECTED142,
		UNCONNECTED143,
		UNCONNECTED144 }), 
	.a_port2_o({ UNCONNECTED145,
		UNCONNECTED146,
		UNCONNECTED147,
		UNCONNECTED148,
		UNCONNECTED149,
		UNCONNECTED150,
		UNCONNECTED151,
		UNCONNECTED152 }), 
	.a_port3_o({ UNCONNECTED153,
		UNCONNECTED154,
		UNCONNECTED155,
		UNCONNECTED156,
		UNCONNECTED157,
		UNCONNECTED158,
		UNCONNECTED159,
		UNCONNECTED160 }), 
	.a_port4_o({ UNCONNECTED161,
		UNCONNECTED162,
		UNCONNECTED163,
		UNCONNECTED164,
		UNCONNECTED165,
		UNCONNECTED166,
		UNCONNECTED167,
		UNCONNECTED168 }));
   serial_top SERIAL_INSTANCE (.serial_clock_i(top_clock_i), 
	.serial_reset_i_b(core_reset_o), 
	.serial_br_i(baud_rate_br_o), 
	.serial_br_trans_i(n_145), 
	.serial_scon0_ri_i(\core_interrupt_scon_o[0] ), 
	.serial_scon1_ti_i(\core_interrupt_scon_o[1] ), 
	.serial_scon3_tb8_i(core_serial_tb8_o), 
	.serial_scon4_ren_i(core_serial_ren_o), 
	.serial_scon7_sm0_i(core_baudrate_sm0_o), 
	.serial_serial_tx_i(core_serial_tx_o), 
	.serial_data_sbuf_i({ \core_serial_sbuf_tx_o[7] ,
		\core_serial_sbuf_tx_o[6] ,
		\core_serial_sbuf_tx_o[5] ,
		\core_serial_sbuf_tx_o[4] ,
		\core_serial_sbuf_tx_o[3] ,
		\core_serial_sbuf_tx_o[2] ,
		\core_serial_sbuf_tx_o[1] ,
		\core_serial_sbuf_tx_o[0]  }), 
	.serial_p3_0_i(top_p3_a_o[0]), 
	.serial_p3en_0_o(serial_p3en_0_o), 
	.serial_p3en_1_o(serial_p3en_1_o), 
	.serial_p3_0_o(serial_p3_0_o), 
	.serial_p3_1_o(serial_p3_1_o), 
	.serial_scon0_ri_o(serial_scon0_ri_o), 
	.serial_scon1_ti_o(serial_scon1_ti_o), 
	.serial_scon2_rb8_o(serial_scon2_rb8_o), 
	.serial_data_sbuf_o({ \serial_data_sbuf_o[7] ,
		\serial_data_sbuf_o[6] ,
		\serial_data_sbuf_o[5] ,
		\serial_data_sbuf_o[4] ,
		\serial_data_sbuf_o[3] ,
		\serial_data_sbuf_o[2] ,
		\serial_data_sbuf_o[1] ,
		\serial_data_sbuf_o[0]  }), 
	.serial_load_sbuf_o(serial_load_sbuf_o), 
	.DFT_sdi(n_159), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_235), 
	.DFT_sdi_1(\serial_data_sbuf_o[0] ), 
	.DFT_sdo_2(n_239), 
	.DFT_sdi_3(top_p0_y_i[4]), 
	.DFT_sdo_4(n_166), 
	.FE_PT1_top_p0_y_i_3_(top_p0_y_i[3]), 
	.SPCASCAN_N5(SPCASCAN_N5));
   top_timers TIMERS_INSTANCE (.top_timers_reset_i(core_reset_o), 
	.top_timers_clock_i(top_clock_i), 
	.top_timers_machine_cycle_i(top_cycle_machine), 
	.top_timers_pht_i(top_pht_i), 
	.top_timers_sfr_tcon2_dfp_i({ \core_timers_dfp_o[2] ,
		\core_timers_dfp_o[1] ,
		\core_timers_dfp_o[0]  }), 
	.top_timers_sfr_tcon2_dfsel_i(core_timers_dfsel_o), 
	.top_timers_sfr_tcon2_edsel_i(core_timers_edgsel_o), 
	.top_timers_sfr_tacph_i({ \core_timers_tacph_o[1] ,
		\core_timers_tacph_o[0]  }), 
	.top_timers_sfr_tacpl_i({ \core_timers_tacpl_o[7] ,
		\core_timers_tacpl_o[6] ,
		\core_timers_tacpl_o[5] ,
		\core_timers_tacpl_o[4] ,
		\core_timers_tacpl_o[3] ,
		\core_timers_tacpl_o[2] ,
		\core_timers_tacpl_o[1] ,
		\core_timers_tacpl_o[0]  }), 
	.top_timers_sfr_tcon_tr0_i(core_timers_tr0_o), 
	.top_timers_sfr_tcon_tr1_i(core_timers_tr1_o), 
	.top_timers_sfr_tmod_gate_t0_i(core_timers_gate_t0_o), 
	.top_timers_sfr_tmod_gate_t1_i(core_timers_gate_t1_o), 
	.top_timers_sfr_tmod_m0_t0_i(core_timers_m0_t0_o), 
	.top_timers_sfr_tmod_m1_t0_i(core_timers_m1_t0_o), 
	.top_timers_sfr_tmod_m0_t1_i(core_timers_m0_t1_o), 
	.top_timers_sfr_tmod_m1_t1_i(core_timers_m1_t1_o), 
	.top_timers_sfr_th0_i({ \core_timers_th0_o[7] ,
		\core_timers_th0_o[6] ,
		\core_timers_th0_o[5] ,
		\core_timers_th0_o[4] ,
		\core_timers_th0_o[3] ,
		\core_timers_th0_o[2] ,
		\core_timers_th0_o[1] ,
		\core_timers_th0_o[0]  }), 
	.top_timers_sfr_tm0_i({ \core_timers_tm0_o[7] ,
		\core_timers_tm0_o[6] ,
		\core_timers_tm0_o[5] ,
		\core_timers_tm0_o[4] ,
		\core_timers_tm0_o[3] ,
		\core_timers_tm0_o[2] ,
		\core_timers_tm0_o[1] ,
		\core_timers_tm0_o[0]  }), 
	.top_timers_sfr_tl0_i({ \core_timers_tl0_o[7] ,
		\core_timers_tl0_o[6] ,
		\core_timers_tl0_o[5] ,
		\core_timers_tl0_o[4] ,
		\core_timers_tl0_o[3] ,
		\core_timers_tl0_o[2] ,
		\core_timers_tl0_o[1] ,
		\core_timers_tl0_o[0]  }), 
	.top_timers_sfr_th1_i({ \core_timers_th1_o[7] ,
		\core_timers_th1_o[6] ,
		\core_timers_th1_o[5] ,
		\core_timers_th1_o[4] ,
		\core_timers_th1_o[3] ,
		\core_timers_th1_o[2] ,
		\core_timers_th1_o[1] ,
		\core_timers_th1_o[0]  }), 
	.top_timers_sfr_tm1_i({ \core_timers_tm1_o[7] ,
		\core_timers_tm1_o[6] ,
		\core_timers_tm1_o[5] ,
		\core_timers_tm1_o[4] ,
		\core_timers_tm1_o[3] ,
		\core_timers_tm1_o[2] ,
		\core_timers_tm1_o[1] ,
		\core_timers_tm1_o[0]  }), 
	.top_timers_sfr_tl1_i({ \core_timers_tl1_o[7] ,
		\core_timers_tl1_o[6] ,
		\core_timers_tl1_o[5] ,
		\core_timers_tl1_o[4] ,
		\core_timers_tl1_o[3] ,
		\core_timers_tl1_o[2] ,
		\core_timers_tl1_o[1] ,
		\core_timers_tl1_o[0]  }), 
	.top_timers_int0_i(top_p3_a_o[2]), 
	.top_timers_int1_i(top_p3_a_o[3]), 
	.top_timers_sfr_tcon_tf0_i(core_timers_tf0_o), 
	.top_timers_sfr_tcon_tf1_i(core_timers_tf1_o), 
	.top_timers_sfr_tcon2_tf2_i(core_timers_tf2_o), 
	.top_timers_sfr_tcon2_tr2_i(core_timers_tr2_o), 
	.top_timers_sfr_tcon_tf0_o(top_timers_sfr_tcon_tf0_o), 
	.top_timers_sfr_tcon_tf1_o(top_timers_sfr_tcon_tf1_o), 
	.top_timers_sfr_tcon2_tf2_o(top_timers_sfr_tcon2_tf2_o), 
	.top_timers_sfr_acrh_o({ \top_timers_sfr_acrh_o[7] ,
		\top_timers_sfr_acrh_o[6] ,
		\top_timers_sfr_acrh_o[5] ,
		\top_timers_sfr_acrh_o[4] ,
		\top_timers_sfr_acrh_o[3] ,
		\top_timers_sfr_acrh_o[2] ,
		\top_timers_sfr_acrh_o[1] ,
		\top_timers_sfr_acrh_o[0]  }), 
	.top_timers_sfr_acrm_o({ \top_timers_sfr_acrm_o[7] ,
		\top_timers_sfr_acrm_o[6] ,
		\top_timers_sfr_acrm_o[5] ,
		\top_timers_sfr_acrm_o[4] ,
		\top_timers_sfr_acrm_o[3] ,
		\top_timers_sfr_acrm_o[2] ,
		\top_timers_sfr_acrm_o[1] ,
		\top_timers_sfr_acrm_o[0]  }), 
	.top_timers_sfr_acrl_o({ \top_timers_sfr_acrl_o[7] ,
		\top_timers_sfr_acrl_o[6] ,
		\top_timers_sfr_acrl_o[5] ,
		\top_timers_sfr_acrl_o[4] ,
		\top_timers_sfr_acrl_o[3] ,
		\top_timers_sfr_acrl_o[2] ,
		\top_timers_sfr_acrl_o[1] ,
		\top_timers_sfr_acrl_o[0]  }), 
	.top_timers_sfr_th0_o({ \top_timers_sfr_th0_o[7] ,
		\top_timers_sfr_th0_o[6] ,
		\top_timers_sfr_th0_o[5] ,
		\top_timers_sfr_th0_o[4] ,
		\top_timers_sfr_th0_o[3] ,
		\top_timers_sfr_th0_o[2] ,
		\top_timers_sfr_th0_o[1] ,
		\top_timers_sfr_th0_o[0]  }), 
	.top_timers_sfr_tm0_o({ \top_timers_sfr_tm0_o[7] ,
		\top_timers_sfr_tm0_o[6] ,
		\top_timers_sfr_tm0_o[5] ,
		\top_timers_sfr_tm0_o[4] ,
		\top_timers_sfr_tm0_o[3] ,
		\top_timers_sfr_tm0_o[2] ,
		\top_timers_sfr_tm0_o[1] ,
		\top_timers_sfr_tm0_o[0]  }), 
	.top_timers_sfr_tl0_o({ \top_timers_sfr_tl0_o[7] ,
		\top_timers_sfr_tl0_o[6] ,
		\top_timers_sfr_tl0_o[5] ,
		\top_timers_sfr_tl0_o[4] ,
		\top_timers_sfr_tl0_o[3] ,
		\top_timers_sfr_tl0_o[2] ,
		\top_timers_sfr_tl0_o[1] ,
		\top_timers_sfr_tl0_o[0]  }), 
	.top_timers_sfr_th1_o({ \top_timers_sfr_th1_o[7] ,
		\top_timers_sfr_th1_o[6] ,
		\top_timers_sfr_th1_o[5] ,
		\top_timers_sfr_th1_o[4] ,
		\top_timers_sfr_th1_o[3] ,
		\top_timers_sfr_th1_o[2] ,
		\top_timers_sfr_th1_o[1] ,
		\top_timers_sfr_th1_o[0]  }), 
	.top_timers_sfr_tm1_o({ \top_timers_sfr_tm1_o[7] ,
		\top_timers_sfr_tm1_o[6] ,
		\top_timers_sfr_tm1_o[5] ,
		\top_timers_sfr_tm1_o[4] ,
		\top_timers_sfr_tm1_o[3] ,
		\top_timers_sfr_tm1_o[2] ,
		\top_timers_sfr_tm1_o[1] ,
		\top_timers_sfr_tm1_o[0]  }), 
	.top_timers_sfr_tl1_o({ \top_timers_sfr_tl1_o[7] ,
		\top_timers_sfr_tl1_o[6] ,
		\top_timers_sfr_tl1_o[5] ,
		\top_timers_sfr_tl1_o[4] ,
		\top_timers_sfr_tl1_o[3] ,
		\top_timers_sfr_tl1_o[2] ,
		\top_timers_sfr_tl1_o[1] ,
		\top_timers_sfr_tl1_o[0]  }), 
	.DFT_in(top_test_mode_i), 
	.DFT_sdi(\top_timers_sfr_th0_o[1] ), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdi_1(n_170), 
	.DFT_sdo(n_247), 
	.DFT_sdi_2(\top_timers_sfr_th1_o[7] ), 
	.DFT_sdo_3(n_251), 
	.DFT_sdi_4(\top_timers_sfr_acrm_o[6] ), 
	.DFT_sdo_5(n_255), 
	.SPCASCAN_N5(SPCASCAN_N5), 
	.FE_PT1_top_p0_y_i_6_(top_p0_y_i[6]), 
	.FE_PT1_top_p0_y_i_7_(top_p0_y_i[7]));
   INX4 p214748365A94 (.Q(top_p3_en_o[7]), 
	.A(\core_ports_p3en_o[7] ));
   INX4 p214748365A95 (.Q(top_p3_en_o[0]), 
	.A(\core_ports_p3en_o[0] ));
   INX4 p214748365A96 (.Q(top_p3_en_o[3]), 
	.A(\core_ports_p3en_o[3] ));
   INX4 p214748365A97 (.Q(top_p3_en_o[2]), 
	.A(\core_ports_p3en_o[2] ));
   INX4 p214748365A98 (.Q(top_p3_en_o[5]), 
	.A(\core_ports_p3en_o[5] ));
   INX4 p214748365A99 (.Q(top_p3_en_o[1]), 
	.A(\core_ports_p3en_o[1] ));
   INX4 p214748365A100 (.Q(top_p3_en_o[6]), 
	.A(SPCASCAN_N7));
   INX4 p214748365A102 (.Q(top_p3_en_o[4]), 
	.A(\core_ports_p3en_o[4] ));
   MU2X0 p214748365A174 (.S(top_test_mode_i), 
	.Q(n_145), 
	.IN1(top_clock_i), 
	.IN0(n_144));
   AO22X0 DFT_shared_out_mux_0 (.Q(top_p2_a_o[0]), 
	.D(top_scan_enable_b_i), 
	.C(n_203), 
	.B(n_206), 
	.A(\bus_control_p2_o[0] ));
   AO22X0 DFT_shared_out_mux_1 (.Q(top_p4_a_o[2]), 
	.D(top_scan_enable_b_i), 
	.C(n_207), 
	.B(n_206), 
	.A(\bus_control_p4_o[2] ));
   AO22X0 DFT_shared_out_mux_2 (.Q(top_p4_a_o[3]), 
	.D(top_scan_enable_b_i), 
	.C(\core_ports_p4_o[2] ), 
	.B(n_206), 
	.A(\bus_control_p4_o[3] ));
   AO22X0 DFT_shared_out_mux_3 (.Q(top_p4_a_o[4]), 
	.D(top_scan_enable_b_i), 
	.C(n_215), 
	.B(n_206), 
	.A(\bus_control_p4_o[4] ));
   AO22X0 DFT_shared_out_mux_4 (.Q(top_p4_a_o[5]), 
	.D(top_scan_enable_b_i), 
	.C(n_219), 
	.B(n_206), 
	.A(\bus_control_p4_o[5] ));
   AO22X0 DFT_shared_out_mux_5 (.Q(top_p4_a_o[6]), 
	.D(top_scan_enable_b_i), 
	.C(n_223), 
	.B(n_206), 
	.A(\bus_control_p4_o[6] ));
   AO22X0 DFT_shared_out_mux_6 (.Q(top_p4_a_o[7]), 
	.D(top_scan_enable_b_i), 
	.C(\core_ports_p3en_o[7] ), 
	.B(n_206), 
	.A(\bus_control_p4_o[7] ));
   AO22X0 DFT_shared_out_mux_7 (.Q(top_p2_a_o[1]), 
	.D(top_scan_enable_b_i), 
	.C(n_231), 
	.B(n_206), 
	.A(\bus_control_p2_o[1] ));
   AO22X0 DFT_shared_out_mux_8 (.Q(top_p2_a_o[2]), 
	.D(top_scan_enable_b_i), 
	.C(n_235), 
	.B(n_206), 
	.A(\bus_control_p2_o[2] ));
   AO22X0 DFT_shared_out_mux_9 (.Q(top_p2_a_o[3]), 
	.D(top_scan_enable_b_i), 
	.C(n_239), 
	.B(n_206), 
	.A(\bus_control_p2_o[3] ));
   AO22X0 DFT_shared_out_mux_10 (.Q(top_p2_a_o[4]), 
	.D(top_scan_enable_b_i), 
	.C(\top_timers_sfr_th1_o[5] ), 
	.B(n_206), 
	.A(\bus_control_p2_o[4] ));
   AO22X0 DFT_shared_out_mux_11 (.Q(top_p2_a_o[5]), 
	.D(top_scan_enable_b_i), 
	.C(n_247), 
	.B(n_206), 
	.A(\bus_control_p2_o[5] ));
   AO22X0 DFT_shared_out_mux_12 (.Q(top_p2_a_o[6]), 
	.D(top_scan_enable_b_i), 
	.C(n_251), 
	.B(n_206), 
	.A(\bus_control_p2_o[6] ));
   AO22X0 DFT_shared_out_mux_13 (.Q(top_p2_a_o[7]), 
	.D(top_scan_enable_b_i), 
	.C(n_255), 
	.B(n_206), 
	.A(\bus_control_p2_o[7] ));
   AO22X0 DFT_shared_out_mux_14 (.Q(top_p4_a_o[0]), 
	.D(top_scan_enable_b_i), 
	.C(n_259), 
	.B(n_206), 
	.A(\bus_control_p4_o[0] ));
   AO22X0 DFT_shared_out_mux_15 (.Q(top_p4_a_o[1]), 
	.D(top_scan_enable_b_i), 
	.C(\core_timers_tl0_o[4] ), 
	.B(n_206), 
	.A(\bus_control_p4_o[1] ));
   INX0 DFT_shared_out_mux_16 (.Q(n_206), 
	.A(top_scan_enable_b_i));
endmodule

module EMC08 (
	CLOCK, 
	CLOCK_MEM, 
	RESET_B, 
	P0, 
	P1, 
	P2, 
	P3, 
	P4, 
	PHT, 
	EA_B, 
	SE_B, 
	TM, 
	PSEN_B);
   input CLOCK;
   input CLOCK_MEM;
   input RESET_B;
   inout [7:0] P0;
   inout [7:0] P1;
   inout [7:0] P2;
   inout [7:0] P3;
   output [7:0] P4;
   input PHT;
   input EA_B;
   input SE_B;
   input TM;
   output PSEN_B;

   // Internal wires
   wire SPCASCAN_N7;
   wire SPCASCAN_N2;
   wire SPCASCAN_N1;
   wire SPCASCAN_N0;
   wire top_clock_i;
   wire top_clock_mem_i;
   wire top_reset_i;
   wire [7:0] top_p0_y_i;
   wire [7:0] top_p1_y_i;
   wire [7:0] top_p2_y_i;
   wire [7:0] top_p3_y_i;
   wire [7:0] top_p0_en_o;
   wire [7:0] top_p1_en_o;
   wire [7:0] top_p2_en_o;
   wire [7:0] top_p3_en_o;
   wire [7:0] top_p0_a_o;
   wire [7:0] top_p1_a_o;
   wire [7:0] top_p2_a_o;
   wire [7:0] top_p3_a_o;
   wire [7:0] top_p4_a_o;
   wire top_ea_b_i;
   wire top_pht_i;
   wire top_test_mode_i;
   wire top_psen_b_o;
   wire top_se_b_i;

   emc_top EMC_TOP_INSTANCE (.top_clock_i(top_clock_i), 
	.top_clock_mem_i(top_clock_mem_i), 
	.top_reset_i(top_reset_i), 
	.top_p0_y_i({ top_p0_y_i[7],
		top_p0_y_i[6],
		top_p0_y_i[5],
		top_p0_y_i[4],
		top_p0_y_i[3],
		top_p0_y_i[2],
		top_p0_y_i[1],
		top_p0_y_i[0] }), 
	.top_p1_y_i({ top_p1_y_i[7],
		top_p1_y_i[6],
		top_p1_y_i[5],
		top_p1_y_i[4],
		top_p1_y_i[3],
		top_p1_y_i[2],
		top_p1_y_i[1],
		top_p1_y_i[0] }), 
	.top_p2_y_i({ top_p2_y_i[7],
		top_p2_y_i[6],
		top_p2_y_i[5],
		top_p2_y_i[4],
		top_p2_y_i[3],
		top_p2_y_i[2],
		top_p2_y_i[1],
		top_p2_y_i[0] }), 
	.top_p3_y_i({ top_p3_y_i[7],
		top_p3_y_i[6],
		top_p3_y_i[5],
		top_p3_y_i[4],
		top_p3_y_i[3],
		top_p3_y_i[2],
		top_p3_y_i[1],
		top_p3_y_i[0] }), 
	.top_p0_en_o({ top_p0_en_o[7],
		top_p0_en_o[6],
		top_p0_en_o[5],
		top_p0_en_o[4],
		top_p0_en_o[3],
		top_p0_en_o[2],
		top_p0_en_o[1],
		top_p0_en_o[0] }), 
	.top_p1_en_o({ top_p1_en_o[7],
		top_p1_en_o[6],
		top_p1_en_o[5],
		top_p1_en_o[4],
		top_p1_en_o[3],
		top_p1_en_o[2],
		top_p1_en_o[1],
		top_p1_en_o[0] }), 
	.top_p2_en_o({ top_p2_en_o[7],
		top_p2_en_o[6],
		top_p2_en_o[5],
		top_p2_en_o[4],
		top_p2_en_o[3],
		top_p2_en_o[2],
		top_p2_en_o[1],
		top_p2_en_o[0] }), 
	.top_p3_en_o({ top_p3_en_o[7],
		top_p3_en_o[6],
		top_p3_en_o[5],
		top_p3_en_o[4],
		top_p3_en_o[3],
		top_p3_en_o[2],
		top_p3_en_o[1],
		top_p3_en_o[0] }), 
	.top_p0_a_o({ top_p0_a_o[7],
		top_p0_a_o[6],
		top_p0_a_o[5],
		top_p0_a_o[4],
		top_p0_a_o[3],
		top_p0_a_o[2],
		top_p0_a_o[1],
		top_p0_a_o[0] }), 
	.top_p1_a_o({ top_p1_a_o[7],
		top_p1_a_o[6],
		top_p1_a_o[5],
		top_p1_a_o[4],
		top_p1_a_o[3],
		top_p1_a_o[2],
		top_p1_a_o[1],
		top_p1_a_o[0] }), 
	.top_p2_a_o({ top_p2_a_o[7],
		top_p2_a_o[6],
		top_p2_a_o[5],
		top_p2_a_o[4],
		top_p2_a_o[3],
		top_p2_a_o[2],
		top_p2_a_o[1],
		top_p2_a_o[0] }), 
	.top_p3_a_o({ top_p3_a_o[7],
		top_p3_a_o[6],
		top_p3_a_o[5],
		top_p3_a_o[4],
		top_p3_a_o[3],
		top_p3_a_o[2],
		top_p3_a_o[1],
		top_p3_a_o[0] }), 
	.top_p4_a_o({ top_p4_a_o[7],
		top_p4_a_o[6],
		top_p4_a_o[5],
		top_p4_a_o[4],
		top_p4_a_o[3],
		top_p4_a_o[2],
		top_p4_a_o[1],
		top_p4_a_o[0] }), 
	.top_pht_i(top_pht_i), 
	.top_ea_b_i(top_ea_b_i), 
	.top_psen_b_o(top_psen_b_o), 
	.SPCASCAN_N0(SPCASCAN_N0), 
	.SPCASCAN_N1(SPCASCAN_N1), 
	.SPCASCAN_N2(SPCASCAN_N2), 
	.SPCASCAN_N7(SPCASCAN_N7));
   emc_pads EMC_PADS_INSTANCE (.pads_clock_i(CLOCK), 
	.pads_clock_mem_i(CLOCK_MEM), 
	.pads_reset_i(RESET_B), 
	.pads_p0_io({ P0[7],
		P0[6],
		P0[5],
		P0[4],
		P0[3],
		P0[2],
		P0[1],
		P0[0] }), 
	.pads_p1_io({ P1[7],
		P1[6],
		P1[5],
		P1[4],
		P1[3],
		P1[2],
		P1[1],
		P1[0] }), 
	.pads_p2_io({ P2[7],
		P2[6],
		P2[5],
		P2[4],
		P2[3],
		P2[2],
		P2[1],
		P2[0] }), 
	.pads_p3_io({ P3[7],
		P3[6],
		P3[5],
		P3[4],
		P3[3],
		P3[2],
		P3[1],
		P3[0] }), 
	.pads_p4_o({ P4[7],
		P4[6],
		P4[5],
		P4[4],
		P4[3],
		P4[2],
		P4[1],
		P4[0] }), 
	.pads_pht_i(PHT), 
	.pads_ea_b_i(EA_B), 
	.pads_se_b_i(SE_B), 
	.pads_tm_i(TM), 
	.pads_psen_b_o(PSEN_B), 
	.top_clock_o(top_clock_i), 
	.top_clock_mem_o(top_clock_mem_i), 
	.top_reset_o(top_reset_i), 
	.top_p0_y_o({ top_p0_y_i[7],
		top_p0_y_i[6],
		top_p0_y_i[5],
		top_p0_y_i[4],
		top_p0_y_i[3],
		top_p0_y_i[2],
		top_p0_y_i[1],
		top_p0_y_i[0] }), 
	.top_p1_y_o({ top_p1_y_i[7],
		top_p1_y_i[6],
		top_p1_y_i[5],
		top_p1_y_i[4],
		top_p1_y_i[3],
		top_p1_y_i[2],
		top_p1_y_i[1],
		top_p1_y_i[0] }), 
	.top_p2_y_o({ top_p2_y_i[7],
		top_p2_y_i[6],
		top_p2_y_i[5],
		top_p2_y_i[4],
		top_p2_y_i[3],
		top_p2_y_i[2],
		top_p2_y_i[1],
		top_p2_y_i[0] }), 
	.top_p3_y_o({ top_p3_y_i[7],
		top_p3_y_i[6],
		top_p3_y_i[5],
		top_p3_y_i[4],
		top_p3_y_i[3],
		top_p3_y_i[2],
		top_p3_y_i[1],
		top_p3_y_i[0] }), 
	.top_p0_en_i({ top_p0_en_o[7],
		top_p0_en_o[6],
		top_p0_en_o[5],
		top_p0_en_o[4],
		top_p0_en_o[3],
		top_p0_en_o[2],
		top_p0_en_o[1],
		top_p0_en_o[0] }), 
	.top_p1_en_i({ top_p1_en_o[7],
		top_p1_en_o[6],
		top_p1_en_o[5],
		top_p1_en_o[4],
		top_p1_en_o[3],
		top_p1_en_o[2],
		top_p1_en_o[1],
		top_p1_en_o[0] }), 
	.top_p2_en_i({ top_p2_en_o[7],
		top_p2_en_o[6],
		top_p2_en_o[5],
		top_p2_en_o[4],
		top_p2_en_o[3],
		top_p2_en_o[2],
		top_p2_en_o[1],
		top_p2_en_o[0] }), 
	.top_p3_en_i({ top_p3_en_o[7],
		top_p3_en_o[6],
		top_p3_en_o[5],
		top_p3_en_o[4],
		top_p3_en_o[3],
		top_p3_en_o[2],
		top_p3_en_o[1],
		top_p3_en_o[0] }), 
	.top_p0_a_i({ top_p0_a_o[7],
		top_p0_a_o[6],
		top_p0_a_o[5],
		top_p0_a_o[4],
		top_p0_a_o[3],
		top_p0_a_o[2],
		top_p0_a_o[1],
		top_p0_a_o[0] }), 
	.top_p1_a_i({ top_p1_a_o[7],
		top_p1_a_o[6],
		top_p1_a_o[5],
		top_p1_a_o[4],
		top_p1_a_o[3],
		top_p1_a_o[2],
		top_p1_a_o[1],
		top_p1_a_o[0] }), 
	.top_p2_a_i({ top_p2_a_o[7],
		top_p2_a_o[6],
		top_p2_a_o[5],
		top_p2_a_o[4],
		top_p2_a_o[3],
		top_p2_a_o[2],
		SPCASCAN_N2,
		SPCASCAN_N1 }), 
	.top_p3_a_i({ top_p3_a_o[7],
		top_p3_a_o[6],
		top_p3_a_o[5],
		top_p3_a_o[4],
		top_p3_a_o[3],
		top_p3_a_o[2],
		top_p3_a_o[1],
		top_p3_a_o[0] }), 
	.top_p4_a_i({ SPCASCAN_N7,
		SPCASCAN_N0,
		top_p4_a_o[5],
		top_p4_a_o[4],
		top_p4_a_o[3],
		top_p4_a_o[2],
		top_p4_a_o[1],
		top_p4_a_o[0] }), 
	.top_pht_o(top_pht_i), 
	.top_ea_b_o(top_ea_b_i), 
	.top_scan_enable_b_o(top_se_b_i), 
	.top_test_mode_o(top_test_mode_i), 
	.top_psen_b_i(top_psen_b_o));
endmodule

