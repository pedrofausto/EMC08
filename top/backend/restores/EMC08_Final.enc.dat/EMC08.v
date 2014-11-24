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
   wire FE_OFN9_LTIE_LTIEHI_NET;
   wire FE_OFN8_LTIE_LTIELO_NET;
   wire LTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;

   BUX2 FE_OFC9_LTIE_LTIEHI_NET (.Q(FE_OFN9_LTIE_LTIEHI_NET), 
	.A(LTIE_LTIEHI_NET));
   BUX2 FE_OFC8_LTIE_LTIELO_NET (.Q(FE_OFN8_LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   LOGIC1 LTIE_LTIEHI (.Q(LTIE_LTIEHI_NET));
   LOGIC0 LTIE_LTIELO (.Q(LTIE_LTIELO_NET));
   ICUDP P_CLOCK (.Y(top_clock_o), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_clock_i));
   ICUDP P_CLOCK_MEM (.Y(top_clock_mem_o), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_clock_mem_i));
   ICUDP P_RESET (.Y(top_reset_o), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_reset_i));
   BBCUD8P P_PORT0_0 (.Y(top_p0_y_o[0]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[0]), 
	.EN(top_p0_en_i[0]), 
	.A(top_p0_a_i[0]));
   BBCUD8P P_PORT0_1 (.Y(top_p0_y_o[1]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[1]), 
	.EN(top_p0_en_i[1]), 
	.A(top_p0_a_i[1]));
   BBCUD8P P_PORT0_2 (.Y(top_p0_y_o[2]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[2]), 
	.EN(top_p0_en_i[2]), 
	.A(top_p0_a_i[2]));
   BBCUD8P P_PORT0_3 (.Y(top_p0_y_o[3]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[3]), 
	.EN(top_p0_en_i[3]), 
	.A(top_p0_a_i[3]));
   BBCUD8P P_PORT0_4 (.Y(top_p0_y_o[4]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[4]), 
	.EN(top_p0_en_i[4]), 
	.A(top_p0_a_i[4]));
   BBCUD8P P_PORT0_5 (.Y(top_p0_y_o[5]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[5]), 
	.EN(top_p0_en_i[5]), 
	.A(top_p0_a_i[5]));
   BBCUD8P P_PORT0_6 (.Y(top_p0_y_o[6]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[6]), 
	.EN(top_p0_en_i[6]), 
	.A(top_p0_a_i[6]));
   BBCUD8P P_PORT0_7 (.Y(top_p0_y_o[7]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p0_io[7]), 
	.EN(top_p0_en_i[7]), 
	.A(top_p0_a_i[7]));
   BBCUD8P P_PORT1_0 (.Y(top_p1_y_o[0]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[0]), 
	.EN(top_p1_en_i[0]), 
	.A(top_p1_a_i[0]));
   BBCUD8P P_PORT1_1 (.Y(top_p1_y_o[1]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[1]), 
	.EN(top_p1_en_i[1]), 
	.A(top_p1_a_i[1]));
   BBCUD8P P_PORT1_2 (.Y(top_p1_y_o[2]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[2]), 
	.EN(top_p1_en_i[2]), 
	.A(top_p1_a_i[2]));
   BBCUD8P P_PORT1_3 (.Y(top_p1_y_o[3]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[3]), 
	.EN(top_p1_en_i[3]), 
	.A(top_p1_a_i[3]));
   BBCUD8P P_PORT1_4 (.Y(top_p1_y_o[4]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[4]), 
	.EN(top_p1_en_i[4]), 
	.A(top_p1_a_i[4]));
   BBCUD8P P_PORT1_5 (.Y(top_p1_y_o[5]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[5]), 
	.EN(top_p1_en_i[5]), 
	.A(top_p1_a_i[5]));
   BBCUD8P P_PORT1_6 (.Y(top_p1_y_o[6]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[6]), 
	.EN(top_p1_en_i[6]), 
	.A(top_p1_a_i[6]));
   BBCUD8P P_PORT1_7 (.Y(top_p1_y_o[7]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p1_io[7]), 
	.EN(top_p1_en_i[7]), 
	.A(top_p1_a_i[7]));
   BBCUD8P P_PORT2_0 (.Y(top_p2_y_o[0]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[0]), 
	.EN(top_p2_en_i[0]), 
	.A(top_p2_a_i[0]));
   BBCUD8P P_PORT2_1 (.Y(top_p2_y_o[1]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[1]), 
	.EN(top_p2_en_i[1]), 
	.A(top_p2_a_i[1]));
   BBCUD8P P_PORT2_2 (.Y(top_p2_y_o[2]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[2]), 
	.EN(top_p2_en_i[2]), 
	.A(top_p2_a_i[2]));
   BBCUD8P P_PORT2_3 (.Y(top_p2_y_o[3]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[3]), 
	.EN(top_p2_en_i[3]), 
	.A(top_p2_a_i[3]));
   BBCUD8P P_PORT2_4 (.Y(top_p2_y_o[4]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[4]), 
	.EN(top_p2_en_i[4]), 
	.A(top_p2_a_i[4]));
   BBCUD8P P_PORT2_5 (.Y(top_p2_y_o[5]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[5]), 
	.EN(top_p2_en_i[5]), 
	.A(top_p2_a_i[5]));
   BBCUD8P P_PORT2_6 (.Y(top_p2_y_o[6]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[6]), 
	.EN(top_p2_en_i[6]), 
	.A(top_p2_a_i[6]));
   BBCUD8P P_PORT2_7 (.Y(top_p2_y_o[7]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p2_io[7]), 
	.EN(top_p2_en_i[7]), 
	.A(top_p2_a_i[7]));
   BBCUD8P P_PORT3_0 (.Y(top_p3_y_o[0]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[0]), 
	.EN(top_p3_en_i[0]), 
	.A(top_p3_a_i[0]));
   BBCUD8P P_PORT3_1 (.Y(top_p3_y_o[1]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[1]), 
	.EN(top_p3_en_i[1]), 
	.A(top_p3_a_i[1]));
   BBCUD8P P_PORT3_2 (.Y(top_p3_y_o[2]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[2]), 
	.EN(top_p3_en_i[2]), 
	.A(top_p3_a_i[2]));
   BBCUD8P P_PORT3_3 (.Y(top_p3_y_o[3]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[3]), 
	.EN(top_p3_en_i[3]), 
	.A(top_p3_a_i[3]));
   BBCUD8P P_PORT3_4 (.Y(top_p3_y_o[4]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[4]), 
	.EN(top_p3_en_i[4]), 
	.A(top_p3_a_i[4]));
   BBCUD8P P_PORT3_5 (.Y(top_p3_y_o[5]), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[5]), 
	.EN(top_p3_en_i[5]), 
	.A(top_p3_a_i[5]));
   BBCUD8P P_PORT3_6 (.Y(top_p3_y_o[6]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_p3_io[6]), 
	.EN(top_p3_en_i[6]), 
	.A(top_p3_a_i[6]));
   BBCUD8P P_PORT3_7 (.Y(top_p3_y_o[7]), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
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
	.EN(FE_OFN8_LTIE_LTIELO_NET), 
	.A(top_p4_a_i[3]));
   BD8P P_PORT4_4 (.PAD(pads_p4_o[4]), 
	.EN(FE_OFN8_LTIE_LTIELO_NET), 
	.A(top_p4_a_i[4]));
   BD8P P_PORT4_5 (.PAD(pads_p4_o[5]), 
	.EN(FE_OFN8_LTIE_LTIELO_NET), 
	.A(top_p4_a_i[5]));
   BD8P P_PORT4_6 (.PAD(pads_p4_o[6]), 
	.EN(FE_OFN8_LTIE_LTIELO_NET), 
	.A(top_p4_a_i[6]));
   BD8P P_PORT4_7 (.PAD(pads_p4_o[7]), 
	.EN(FE_OFN8_LTIE_LTIELO_NET), 
	.A(top_p4_a_i[7]));
   ICUDP P_PHT (.Y(top_pht_o), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_pht_i));
   ICUDP P_EA_B (.Y(top_ea_b_o), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_ea_b_i));
   ICUDP P_SE_B (.Y(top_scan_enable_b_o), 
	.PUEN(LTIE_LTIELO_NET), 
	.PI(LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_se_b_i));
   ICUDP P_TEST_MODE (.Y(top_test_mode_o), 
	.PUEN(FE_OFN8_LTIE_LTIELO_NET), 
	.PI(FE_OFN8_LTIE_LTIELO_NET), 
	.PDEN(FE_OFN9_LTIE_LTIEHI_NET), 
	.PAD(pads_tm_i));
   BD8P P_PSEN_B (.PAD(pads_psen_b_o), 
	.EN(FE_OFN8_LTIE_LTIELO_NET), 
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
	SPCASCAN_N1, 
	FE_PT1_top_p2_a_o_0_, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N2, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N8);
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
   output SPCASCAN_N1;
   input FE_PT1_top_p2_a_o_0_;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N2;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N8;

   // Internal wires
   wire \baud_rate_RS232_counter[0] ;
   wire \baud_rate_RS232_counter[1] ;
   wire \baud_rate_RS232_counter[2] ;
   wire \baud_rate_RS232_counter[3] ;
   wire \baud_rate_RS232_counter[4] ;
   wire \baud_rate_RS232_trans_counter[0] ;
   wire \baud_rate_RS232_trans_counter[1] ;
   wire \baud_rate_RS232_trans_counter[2] ;
   wire \baud_rate_RS232_trans_counter[3] ;
   wire \baud_rate_RS232_trans_counter[4] ;
   wire \baud_rate_RS232_width[0] ;
   wire \baud_rate_RS232_width[1] ;
   wire \baud_rate_RS232_width[2] ;
   wire \baud_rate_RS232_width[3] ;
   wire \baud_rate_RS232_width[4] ;
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
   wire n_2;
   wire n_6;
   wire n_7;
   wire n_9;
   wire n_10;
   wire n_18;
   wire n_20;
   wire n_21;
   wire n_22;
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
   wire n_83;
   wire n_84;
   wire n_87;
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
   wire n_156;
   wire n_157;
   wire n_158;
   wire n_159;

   SDFRX0 \baud_rate_RS232_width_reg[3]  (.SE(DFT_sen), 
	.SD(baud_rate_br_trans_o), 
	.QN(\baud_rate_RS232_width[3] ), 
	.Q(n_156), 
	.D(n_114), 
	.C(top_clock_i__L2_N8));
   SDFRX0 \baud_rate_RS232_width_reg[4]  (.SE(DFT_sen), 
	.SD(n_156), 
	.QN(\baud_rate_RS232_width[4] ), 
	.Q(n_157), 
	.D(n_121), 
	.C(top_clock_i__L2_N8));
   SDFRX0 \baud_rate_width_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_width[1] ), 
	.QN(\baud_rate_width[2] ), 
	.Q(n_158), 
	.D(n_87), 
	.C(top_clock_i__L2_N4));
   SDFRX0 \baud_rate_width_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_width[3] ), 
	.QN(\baud_rate_width[4] ), 
	.Q(n_159), 
	.D(n_87), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \baud_rate_counter_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[0] ), 
	.Q(\baud_rate_counter[3] ), 
	.D(n_138), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \baud_rate_counter_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_width[0] ), 
	.Q(\baud_rate_counter[4] ), 
	.D(n_133), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \baud_rate_counter_reg[2]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(\baud_rate_counter[2] ), 
	.D(n_135), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \baud_rate_counter_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[2] ), 
	.Q(\baud_rate_counter[1] ), 
	.D(n_137), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \baud_rate_RS232_counter_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[4] ), 
	.Q(\baud_rate_RS232_counter[3] ), 
	.D(n_128), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \baud_rate_RS232_counter_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[0] ), 
	.Q(\baud_rate_RS232_counter[4] ), 
	.D(n_125), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \baud_rate_RS232_width_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[0] ), 
	.Q(\baud_rate_RS232_width[0] ), 
	.D(n_139), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \baud_rate_RS232_width_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[2] ), 
	.Q(\baud_rate_RS232_width[1] ), 
	.D(n_131), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \baud_rate_RS232_width_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[1] ), 
	.Q(\baud_rate_RS232_width[2] ), 
	.D(n_139), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \baud_rate_RS232_counter_reg[2]  (.SE(DFT_sen), 
	.SD(baud_rate_br_o), 
	.Q(\baud_rate_RS232_counter[2] ), 
	.D(n_127), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \baud_rate_RS232_counter_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[2] ), 
	.Q(\baud_rate_RS232_counter[1] ), 
	.D(n_123), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \baud_rate_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_width[1] ), 
	.Q(\baud_rate_counter[0] ), 
	.D(n_119), 
	.C(top_clock_i__L2_N2));
   SDFRQX0 baud_rate_br_trans_o_reg (.SE(DFT_sen), 
	.SD(baud_rate_cm_o), 
	.Q(baud_rate_br_trans_o), 
	.D(n_115), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 baud_rate_br_o_reg (.SE(DFT_sen), 
	.SD(n_157), 
	.Q(baud_rate_br_o), 
	.D(n_113), 
	.C(top_clock_i__L2_N8));
   ON32X0 p14731A (.Q(n_138), 
	.E(n_7), 
	.D(n_132), 
	.C(n_116), 
	.B(\baud_rate_counter[3] ), 
	.A(n_136));
   ON32X0 p14769A (.Q(n_137), 
	.E(n_9), 
	.D(n_134), 
	.C(\baud_rate_counter[1] ), 
	.B(n_18), 
	.A(n_136));
   ON22X0 p14806A (.Q(n_135), 
	.D(n_136), 
	.C(n_35), 
	.B(n_134), 
	.A(n_22));
   ON22X0 p14768A (.Q(n_133), 
	.D(n_136), 
	.C(n_54), 
	.B(n_132), 
	.A(n_21));
   SDFRQX0 \baud_rate_RS232_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[1] ), 
	.Q(\baud_rate_RS232_counter[0] ), 
	.D(n_111), 
	.C(top_clock_i__L2_N7));
   ON21X0 p14929A (.Q(n_139), 
	.C(n_129), 
	.B(baud_rate_scon_sm2_i), 
	.A(n_130));
   ON21X0 p15031A (.Q(n_131), 
	.C(n_129), 
	.B(n_34), 
	.A(n_130));
   SDFRQX0 \baud_rate_trans_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_trans_counter[1] ), 
	.Q(\baud_rate_trans_counter[0] ), 
	.D(n_107), 
	.C(top_clock_i__L2_N4));
   AO22X0 p14898A (.Q(n_128), 
	.D(n_126), 
	.C(n_39), 
	.B(n_124), 
	.A(\baud_rate_RS232_counter[3] ));
   AO22X0 p14961A (.Q(n_127), 
	.D(n_122), 
	.C(\baud_rate_RS232_counter[2] ), 
	.B(n_126), 
	.A(n_38));
   AO22X0 p14961A2651 (.Q(n_125), 
	.D(n_124), 
	.C(\baud_rate_RS232_counter[4] ), 
	.B(n_126), 
	.A(n_53));
   AO32X0 p14928A (.Q(n_123), 
	.E(\baud_rate_RS232_counter[1] ), 
	.D(n_122), 
	.C(\baud_rate_RS232_counter[0] ), 
	.B(n_20), 
	.A(n_126));
   NO2I1X0 p15052A (.Q(n_121), 
	.B(baud_rate_scon_sm2_i), 
	.AN(n_114));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[0]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_counter[3] ), 
	.Q(\baud_rate_RS232_trans_counter[0] ), 
	.D(n_102), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[0] ), 
	.Q(\baud_rate_RS232_trans_counter[1] ), 
	.D(n_98), 
	.C(system_clk_i));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[4]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[3] ), 
	.Q(SPCASCAN_N1), 
	.D(n_96), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[2]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[3] ), 
	.Q(\baud_rate_RS232_trans_counter[2] ), 
	.D(n_97), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \baud_rate_RS232_trans_counter_reg[3]  (.SE(DFT_sen), 
	.SD(\baud_rate_RS232_trans_counter[2] ), 
	.Q(\baud_rate_RS232_trans_counter[3] ), 
	.D(n_99), 
	.C(top_clock_i__L2_N4));
   NO2X0 p14768A2657 (.Q(n_134), 
	.B(n_118), 
	.A(n_117));
   AO21X0 p14952A (.Q(n_119), 
	.C(n_117), 
	.B(n_118), 
	.A(\baud_rate_counter[0] ));
   AN21X0 p14730A (.Q(n_132), 
	.C(n_118), 
	.B(n_110), 
	.A(n_116));
   AO22X0 p14521A (.Q(n_115), 
	.D(n_108), 
	.C(baud_rate_br_trans_o), 
	.B(n_87), 
	.A(n_109));
   INX0 p15035A (.Q(n_129), 
	.A(n_114));
   MU2X0 p14950A (.S(n_104), 
	.Q(n_113), 
	.IN1(n_84), 
	.IN0(baud_rate_br_o));
   NO2X0 p15033A (.Q(n_114), 
	.B(baud_rate_scon_sm1_i), 
	.A(n_130));
   SDFRQX2 \baud_rate_width_reg[5]  (.SE(DFT_sen), 
	.SD(\baud_rate_trans_counter[0] ), 
	.Q(DFT_sdo), 
	.D(n_105), 
	.C(top_clock_i__L2_N7));
   NO2X0 p14769A2659 (.Q(n_117), 
	.B(n_136), 
	.A(\baud_rate_counter[0] ));
   NA2X0 p14928A2660 (.Q(n_122), 
	.B(n_112), 
	.A(n_100));
   NA2X0 p14898A2661 (.Q(n_124), 
	.B(n_112), 
	.A(n_101));
   ON22X0 p15297A (.Q(n_111), 
	.D(n_112), 
	.C(n_6), 
	.B(n_95), 
	.A(\baud_rate_RS232_counter[0] ));
   SDFRQX2 baud_rate_cm_o_reg (.SE(DFT_sen), 
	.SD(FE_PT1_top_p2_a_o_0_), 
	.Q(baud_rate_cm_o), 
	.D(n_91), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \baud_rate_width_reg[3]  (.SE(DFT_sen), 
	.SD(n_158), 
	.Q(\baud_rate_width[3] ), 
	.D(n_87), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \baud_rate_width_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[1] ), 
	.Q(\baud_rate_width[1] ), 
	.D(n_87), 
	.C(system_clk_i));
   INX0 p14731A2665 (.Q(n_110), 
	.A(n_136));
   ON31X0 p14521A2666 (.Q(n_109), 
	.D(n_72), 
	.C(n_106), 
	.B(baud_rate_br_trans_o), 
	.A(n_108));
   AO32X0 p15291A (.Q(n_107), 
	.E(\baud_rate_trans_counter[0] ), 
	.D(n_108), 
	.C(n_92), 
	.B(n_106), 
	.A(n_87));
   NA2X0 p15035A2667 (.Q(n_130), 
	.B(baud_rate_pcon_rs232_i), 
	.A(n_105));
   NO2X0 p14940A (.Q(n_104), 
	.B(n_103), 
	.A(n_126));
   NA2X0 p14728A (.Q(n_136), 
	.B(n_103), 
	.A(n_93));
   NO2I1X0 p15332A (.Q(n_102), 
	.B(\baud_rate_RS232_trans_counter[0] ), 
	.AN(n_108));
   NA2X0 p14897A (.Q(n_101), 
	.B(n_126), 
	.A(n_52));
   NA2X0 p14928A2668 (.Q(n_100), 
	.B(n_126), 
	.A(n_6));
   NO2I1X0 p15333A (.Q(n_99), 
	.B(n_48), 
	.AN(n_108));
   NO2I1X0 p15333A2669 (.Q(n_98), 
	.B(n_31), 
	.AN(n_108));
   NO2I1X0 p15333A2670 (.Q(n_97), 
	.B(n_41), 
	.AN(n_108));
   NO2I1X0 p15333A2671 (.Q(n_96), 
	.B(n_65), 
	.AN(n_108));
   INX0 p15297A2672 (.Q(n_95), 
	.A(n_126));
   NO2X0 p15032A (.Q(n_105), 
	.B(baud_rate_pcon_smod_i), 
	.A(n_94));
   SDFRQX0 \baud_rate_width_reg[0]  (.SE(DFT_sen), 
	.SD(n_159), 
	.Q(\baud_rate_width[0] ), 
	.D(system_rst_i_b), 
	.C(system_clk_i));
   NO2X0 p14731A2674 (.Q(n_103), 
	.B(n_94), 
	.A(n_79));
   NO2X0 p14898A2675 (.Q(n_126), 
	.B(n_94), 
	.A(n_93));
   NO2X0 p14525A (.Q(n_108), 
	.B(n_94), 
	.A(n_92));
   NO2X0 p21394A (.Q(n_91), 
	.B(n_83), 
	.A(baud_rate_cm_o));
   INX0 p16445A2676 (.Q(n_87), 
	.A(n_94));
   OR2X0 p15747A (.Q(n_112), 
	.B(n_83), 
	.A(baud_rate_scon_sm0_i));
   NO2X0 p21004A (.Q(n_84), 
	.B(n_83), 
	.A(baud_rate_br_o));
   AN21X0 p16004A (.Q(n_118), 
	.C(n_83), 
	.B(baud_rate_scon_sm0_i), 
	.A(n_93));
   NA2X0 p14170A (.Q(n_94), 
	.B(system_rst_i_b), 
	.A(baud_rate_scon_sm0_i));
   INX0 p21393A (.Q(n_83), 
	.A(system_rst_i_b));
   ON222X0 p29799A (.Q(n_79), 
	.F(n_71), 
	.E(n_21), 
	.D(n_78), 
	.C(n_76), 
	.B(n_75), 
	.A(n_77));
   OA32X0 p29828A (.Q(n_78), 
	.E(n_7), 
	.D(n_70), 
	.C(n_73), 
	.B(n_22), 
	.A(n_74));
   AO21X0 p29898A (.Q(n_77), 
	.C(n_76), 
	.B(n_60), 
	.A(n_9));
   AO211X0 p29802A (.Q(n_75), 
	.D(n_61), 
	.C(n_73), 
	.B(n_74), 
	.A(n_22));
   NA2X0 p32226A (.Q(n_72), 
	.B(baud_rate_br_trans_o), 
	.A(n_106));
   NO2I1X0 p29887A (.Q(n_76), 
	.B(\baud_rate_counter[4] ), 
	.AN(n_71));
   NO2I1X0 p29802A2678 (.Q(n_73), 
	.B(\baud_rate_counter[3] ), 
	.AN(n_70));
   ON221X0 p30423A (.Q(n_93), 
	.E(n_67), 
	.D(n_55), 
	.C(n_20), 
	.B(n_56), 
	.A(n_30));
   ON21X0 p30706A (.Q(n_92), 
	.C(n_69), 
	.B(n_28), 
	.A(n_64));
   NO2X0 p32139A (.Q(n_106), 
	.B(n_66), 
	.A(\baud_rate_trans_counter[0] ));
   EN2X0 p29886A (.Q(n_71), 
	.B(DFT_sdo), 
	.A(n_68));
   AN321X0 p30708A (.Q(n_69), 
	.F(n_42), 
	.E(n_62), 
	.D(\baud_rate_RS232_trans_counter[1] ), 
	.C(n_63), 
	.B(n_0), 
	.A(\baud_rate_RS232_trans_counter[2] ));
   ON21X0 p29802A2679 (.Q(n_70), 
	.C(n_68), 
	.B(\baud_rate_width[4] ), 
	.A(n_57));
   AN321X0 p30831A (.Q(n_67), 
	.F(n_51), 
	.E(\baud_rate_RS232_counter[4] ), 
	.D(\baud_rate_RS232_width[4] ), 
	.C(n_32), 
	.B(\baud_rate_RS232_width[3] ), 
	.A(\baud_rate_RS232_counter[3] ));
   ON21X0 p32139A2680 (.Q(n_66), 
	.C(n_59), 
	.B(DFT_sdo), 
	.A(n_58));
   EO2X0 p32247A (.Q(n_65), 
	.B(n_47), 
	.A(SPCASCAN_N1));
   AN31X0 p30994A (.Q(n_64), 
	.D(n_62), 
	.C(n_63), 
	.B(\baud_rate_RS232_trans_counter[1] ), 
	.A(n_49));
   OA221X0 p30146A (.Q(n_61), 
	.E(n_18), 
	.D(n_9), 
	.C(n_60), 
	.B(n_40), 
	.A(n_44));
   AN21X0 p32137A (.Q(n_59), 
	.C(\baud_rate_trans_counter[1] ), 
	.B(DFT_sdo), 
	.A(n_58));
   NA2X0 p29799A2681 (.Q(n_68), 
	.B(\baud_rate_width[4] ), 
	.A(n_57));
   OA31X0 p30430A (.Q(n_56), 
	.D(n_55), 
	.C(n_50), 
	.B(n_20), 
	.A(n_43));
   AO21X0 p30120A (.Q(n_74), 
	.C(n_57), 
	.B(\baud_rate_width[3] ), 
	.A(n_45));
   OA32X0 p32435A (.Q(n_54), 
	.E(n_21), 
	.D(\baud_rate_counter[3] ), 
	.C(n_116), 
	.B(\baud_rate_counter[4] ), 
	.A(n_7));
   ON32X0 p32544A (.Q(n_53), 
	.E(\baud_rate_RS232_counter[3] ), 
	.D(n_27), 
	.C(n_52), 
	.B(n_2), 
	.A(\baud_rate_RS232_counter[4] ));
   NO3I1X0 p30832A (.Q(n_51), 
	.C(\baud_rate_RS232_width[2] ), 
	.B(n_50), 
	.AN(\baud_rate_RS232_counter[2] ));
   NO3I1X0 p30746A (.Q(n_62), 
	.C(\baud_rate_RS232_width[1] ), 
	.B(n_37), 
	.AN(n_49));
   EN2X0 p32504A (.Q(n_48), 
	.B(\baud_rate_RS232_trans_counter[3] ), 
	.A(n_46));
   NA2X0 p32246A (.Q(n_47), 
	.B(\baud_rate_RS232_trans_counter[3] ), 
	.A(n_46));
   NO2X0 p29801A (.Q(n_57), 
	.B(\baud_rate_width[3] ), 
	.A(n_45));
   ON21X0 p30146A2682 (.Q(n_60), 
	.C(n_45), 
	.B(\baud_rate_width[2] ), 
	.A(n_44));
   OR3X0 p30430A2683 (.Q(n_55), 
	.C(\baud_rate_RS232_width[1] ), 
	.B(n_43), 
	.A(n_50));
   AO32X0 p30706A2684 (.Q(n_42), 
	.E(SPCASCAN_N1), 
	.D(\baud_rate_RS232_width[4] ), 
	.C(n_33), 
	.B(\baud_rate_RS232_trans_counter[3] ), 
	.A(\baud_rate_RS232_width[3] ));
   EO2X0 p32871A (.Q(n_41), 
	.B(\baud_rate_RS232_trans_counter[2] ), 
	.A(n_36));
   NA3I1X0 p32139A2685 (.Q(n_58), 
	.C(n_40), 
	.B(n_29), 
	.AN(\baud_rate_width[2] ));
   NO2X0 p32999A (.Q(n_39), 
	.B(\baud_rate_RS232_counter[3] ), 
	.A(n_52));
   ON32X0 p32879A (.Q(n_38), 
	.E(\baud_rate_RS232_counter[1] ), 
	.D(n_10), 
	.C(n_6), 
	.B(n_20), 
	.A(\baud_rate_RS232_counter[2] ));
   INX0 p30782A (.Q(n_63), 
	.A(n_37));
   NA2X0 p29798A (.Q(n_45), 
	.B(\baud_rate_width[2] ), 
	.A(n_44));
   NO2I1X0 p32244A (.Q(n_46), 
	.B(n_36), 
	.AN(\baud_rate_RS232_trans_counter[2] ));
   AN32X0 p33287A (.Q(n_35), 
	.E(n_9), 
	.D(\baud_rate_counter[2] ), 
	.C(\baud_rate_counter[1] ), 
	.B(\baud_rate_counter[0] ), 
	.A(n_22));
   INX0 p16278A (.Q(n_34), 
	.A(baud_rate_scon_sm2_i));
   SDFRQX0 \baud_rate_trans_counter_reg[1]  (.SE(DFT_sen), 
	.SD(\baud_rate_counter[4] ), 
	.Q(\baud_rate_trans_counter[1] ), 
	.D(logic_0_1_net), 
	.C(top_clock_i__L2_N6));
   ON21X0 p30747A (.Q(n_37), 
	.C(n_33), 
	.B(\baud_rate_RS232_width[3] ), 
	.A(\baud_rate_RS232_trans_counter[3] ));
   ON21X0 p30430A2687 (.Q(n_50), 
	.C(n_32), 
	.B(\baud_rate_RS232_width[3] ), 
	.A(\baud_rate_RS232_counter[3] ));
   NO2X0 p30667A (.Q(n_43), 
	.B(n_0), 
	.A(\baud_rate_RS232_counter[2] ));
   NA3X0 p32278A (.Q(n_52), 
	.C(\baud_rate_RS232_counter[2] ), 
	.B(\baud_rate_RS232_counter[1] ), 
	.A(\baud_rate_RS232_counter[0] ));
   NA3X0 p32434A (.Q(n_116), 
	.C(\baud_rate_counter[2] ), 
	.B(\baud_rate_counter[0] ), 
	.A(\baud_rate_counter[1] ));
   EN2X0 p33209A (.Q(n_31), 
	.B(\baud_rate_RS232_trans_counter[1] ), 
	.A(\baud_rate_RS232_trans_counter[0] ));
   NO2I1X0 p31339A (.Q(n_30), 
	.B(\baud_rate_RS232_counter[0] ), 
	.AN(\baud_rate_RS232_width[0] ));
   OR2X0 p30706A2688 (.Q(n_33), 
	.B(\baud_rate_RS232_width[4] ), 
	.A(SPCASCAN_N1));
   NA2X0 p32247A2689 (.Q(n_36), 
	.B(\baud_rate_RS232_trans_counter[1] ), 
	.A(\baud_rate_RS232_trans_counter[0] ));
   AND2X0 p30618A (.Q(n_40), 
	.B(\baud_rate_width[1] ), 
	.A(\baud_rate_width[0] ));
   NO2I1X0 p32139A2690 (.Q(n_29), 
	.B(\baud_rate_width[4] ), 
	.AN(\baud_rate_width[3] ));
   NO2X0 p29801A2691 (.Q(n_44), 
	.B(\baud_rate_width[1] ), 
	.A(\baud_rate_width[0] ));
   NA2I1X0 p30808A (.Q(n_49), 
	.B(\baud_rate_RS232_width[2] ), 
	.AN(\baud_rate_RS232_trans_counter[2] ));
   NO2I1X0 p31534A (.Q(n_28), 
	.B(\baud_rate_RS232_trans_counter[0] ), 
	.AN(\baud_rate_RS232_width[0] ));
   OR2X0 p30429A (.Q(n_32), 
	.B(\baud_rate_RS232_width[4] ), 
	.A(\baud_rate_RS232_counter[4] ));
   INX0 p33528A (.Q(n_27), 
	.A(\baud_rate_RS232_counter[4] ));
   INX0 p33289A (.Q(n_22), 
	.A(\baud_rate_counter[2] ));
   INX0 p33906A (.Q(n_21), 
	.A(\baud_rate_counter[4] ));
   INX0 p33038A (.Q(n_20), 
	.A(\baud_rate_RS232_counter[1] ));
   INX0 p33608A (.Q(n_18), 
	.A(\baud_rate_counter[0] ));
   INX0 p33336A (.Q(n_10), 
	.A(\baud_rate_RS232_counter[2] ));
   INX0 p33887A (.Q(n_9), 
	.A(\baud_rate_counter[1] ));
   INX0 p32659A (.Q(n_7), 
	.A(\baud_rate_counter[3] ));
   INX0 p33497A (.Q(n_6), 
	.A(\baud_rate_RS232_counter[0] ));
   INX0 p33186A (.Q(n_2), 
	.A(\baud_rate_RS232_counter[3] ));
   INX0 p31234A (.Q(n_0), 
	.A(\baud_rate_RS232_width[2] ));
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
   wire FE_OFN270_top_psen_b_o;
   wire FE_OFN269_top_psen_b_o;
   wire FE_OFN268_top_psen_b_o;
   wire FE_OFN267_top_psen_b_o;
   wire FE_OFN265_n_59;
   wire FE_OFN264_n_57;
   wire FE_OFN263_n_57;
   wire FE_OFN262_n_57;
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

   INX4 FE_OFC270_top_psen_b_o (.Q(FE_OFN270_top_psen_b_o), 
	.A(FE_OFN268_top_psen_b_o));
   INX1 FE_OFC269_top_psen_b_o (.Q(bus_control_psen_b_o), 
	.A(FE_OFN268_top_psen_b_o));
   INX4 FE_OFC267_top_psen_b_o (.Q(FE_OFN268_top_psen_b_o), 
	.A(FE_OFN267_top_psen_b_o));
   BUX6 FE_OFC265_n_59 (.Q(FE_OFN265_n_59), 
	.A(n_59));
   INX1 FE_OFC264_n_57 (.Q(FE_OFN264_n_57), 
	.A(FE_OFN262_n_57));
   INX8 FE_OFC263_n_57 (.Q(FE_OFN263_n_57), 
	.A(FE_OFN262_n_57));
   INX3 FE_OFC262_n_57 (.Q(FE_OFN262_n_57), 
	.A(n_57));
   AO22X0 p1785D (.Q(bus_control_core_p4_o[7]), 
	.D(bus_control_core_ext_addr_i[7]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[7]));
   AO22X2 p1785D832 (.Q(bus_control_core_p4_o[6]), 
	.D(bus_control_core_ext_addr_i[6]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[6]));
   AO22X0 p1785D833 (.Q(bus_control_core_p4_o[5]), 
	.D(bus_control_core_ext_addr_i[5]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[5]));
   AO22X0 p1785D834 (.Q(bus_control_core_p4_o[4]), 
	.D(bus_control_core_ext_addr_i[4]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[4]));
   AO22X0 p1785D835 (.Q(bus_control_core_p4_o[3]), 
	.D(bus_control_core_ext_addr_i[3]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[3]));
   AO22X0 p1785D836 (.Q(bus_control_core_p4_o[2]), 
	.D(bus_control_core_ext_addr_i[2]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[2]));
   AO22X0 p1785D837 (.Q(bus_control_core_p4_o[1]), 
	.D(bus_control_core_ext_addr_i[1]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[1]));
   AO22X0 p1785D838 (.Q(bus_control_core_p4_o[0]), 
	.D(bus_control_core_ext_addr_i[0]), 
	.C(n_79), 
	.B(FE_OFN270_top_psen_b_o), 
	.A(bus_control_core_p4_i[0]));
   AO22X0 p1664D (.Q(bus_control_core_p0_o[5]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[5]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[5]));
   AO22X1 p1664D839 (.Q(bus_control_core_p0_o[0]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[0]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[0]));
   AO22X0 p1664D840 (.Q(bus_control_core_p0_o[6]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[6]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[6]));
   AO22X0 p1664D841 (.Q(bus_control_core_p0_o[4]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[4]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[4]));
   AO22X1 p1664D842 (.Q(bus_control_core_p0_o[7]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[7]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[7]));
   AO22X0 p1664D843 (.Q(bus_control_core_p0_o[2]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[2]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[2]));
   AO22X0 p1664D844 (.Q(bus_control_core_p0_o[3]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[3]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[3]));
   AO22X0 p1664D845 (.Q(bus_control_core_p0_o[1]), 
	.D(FE_OFN263_n_57), 
	.C(bus_control_core_ext_data_i[1]), 
	.B(bus_control_psen_b_o), 
	.A(bus_control_core_p0_i[1]));
   NA2I1X0 p5633A (.Q(bus_control_core_p3en_6_o), 
	.B(bus_control_psen_b_o), 
	.AN(bus_control_core_p3en_6_i));
   NA2I1X0 p5633A846 (.Q(bus_control_core_p3en_7_o), 
	.B(FE_OFN270_top_psen_b_o), 
	.AN(bus_control_core_p3en_7_i));
   AO21X0 p4859A (.Q(bus_control_core_p0en_o[7]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[7]));
   AO21X0 p4859A847 (.Q(bus_control_core_p0en_o[6]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[6]));
   AO21X0 p4859A848 (.Q(bus_control_core_p0en_o[5]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[5]));
   AO21X0 p4859A849 (.Q(bus_control_core_p0en_o[4]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[4]));
   ON21X1 p2024D (.Q(bus_control_core_p3_7_o), 
	.C(n_56), 
	.B(n_60), 
	.A(n_53));
   AO21X0 p4859A850 (.Q(bus_control_core_p0en_o[3]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[3]));
   AO21X0 p4859A851 (.Q(bus_control_core_p0en_o[2]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[2]));
   AO21X0 p4859A852 (.Q(bus_control_core_p0en_o[1]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[1]));
   AO21X0 p4859A853 (.Q(bus_control_core_p0en_o[0]), 
	.C(FE_OFN263_n_57), 
	.B(n_61), 
	.A(bus_control_core_p0en_i[0]));
   INX3 Fp1606A857 (.Q(n_79), 
	.A(FE_OFN270_top_psen_b_o));
   NO2X4 p1233D (.Q(FE_OFN267_top_psen_b_o), 
	.B(FE_OFN263_n_57), 
	.A(n_60));
   AO21X0 p5209A (.Q(bus_control_core_p2en_o[7]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[7]));
   AO21X0 p5209A858 (.Q(bus_control_core_p2en_o[6]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[6]));
   AO21X0 p5209A859 (.Q(bus_control_core_p2en_o[5]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[5]));
   AO21X0 p5209A860 (.Q(bus_control_core_p2en_o[4]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[4]));
   AO21X0 p5209A861 (.Q(bus_control_core_p2en_o[3]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[3]));
   AO21X0 p5209A862 (.Q(bus_control_core_p2en_o[2]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[2]));
   AO21X0 p5209A863 (.Q(bus_control_core_p2en_o[1]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[1]));
   AO21X0 p5209A864 (.Q(bus_control_core_p2en_o[0]), 
	.C(FE_OFN265_n_59), 
	.B(n_55), 
	.A(bus_control_core_p2en_i[0]));
   ON21X1 p2106D (.Q(bus_control_core_p3_6_o), 
	.C(n_61), 
	.B(FE_OFN264_n_57), 
	.A(n_52));
   AO22X0 p2205D (.Q(bus_control_core_p2_o[0]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[0]), 
	.B(bus_control_core_ext_addr_i[8]), 
	.A(FE_OFN265_n_59));
   AO22X0 p2205D865 (.Q(bus_control_core_p2_o[5]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[5]), 
	.B(FE_OFN265_n_59), 
	.A(bus_control_core_ext_addr_i[13]));
   AO22X0 p2205D866 (.Q(bus_control_core_p2_o[7]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[7]), 
	.B(FE_OFN265_n_59), 
	.A(bus_control_core_ext_addr_i[15]));
   AO22X0 p2205D867 (.Q(bus_control_core_p2_o[6]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[6]), 
	.B(FE_OFN265_n_59), 
	.A(bus_control_core_ext_addr_i[14]));
   AO22X0 p2205D868 (.Q(bus_control_core_p2_o[4]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[4]), 
	.B(FE_OFN265_n_59), 
	.A(bus_control_core_ext_addr_i[12]));
   AO22X0 p2205D869 (.Q(bus_control_core_p2_o[3]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[3]), 
	.B(bus_control_core_ext_addr_i[11]), 
	.A(FE_OFN265_n_59));
   AO22X0 p2205D870 (.Q(bus_control_core_p2_o[2]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[2]), 
	.B(bus_control_core_ext_addr_i[10]), 
	.A(FE_OFN265_n_59));
   AO22X0 p2205D871 (.Q(bus_control_core_p2_o[1]), 
	.D(n_58), 
	.C(bus_control_core_p2_i[1]), 
	.B(bus_control_core_ext_addr_i[9]), 
	.A(FE_OFN265_n_59));
   NO2I1X0 p4096A (.Q(bus_control_core_ext_data_o[5]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[5]));
   NO2I1X0 p4121A (.Q(bus_control_core_ext_data_o[4]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[4]));
   NO2I1X0 p4121A872 (.Q(bus_control_core_ext_data_o[3]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[3]));
   NO2I1X0 p4123A (.Q(bus_control_core_ext_data_o[2]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[2]));
   NO2I1X0 p4096A873 (.Q(bus_control_core_ext_data_o[7]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[7]));
   NO2I1X0 p4058A (.Q(bus_control_core_ext_data_o[1]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[1]));
   NO2I1X0 p4058A874 (.Q(bus_control_core_ext_data_o[0]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[0]));
   NO2I1X0 p4096A875 (.Q(bus_control_core_ext_data_o[6]), 
	.B(FE_OFN264_n_57), 
	.AN(bus_control_ports_p0_i[6]));
   INX0 Fp1290A878 (.Q(n_61), 
	.A(n_60));
   NA2X4 p1261A (.Q(n_60), 
	.B(n_55), 
	.A(n_58));
   INX6 Fp1284A886 (.Q(n_58), 
	.A(FE_OFN265_n_59));
   NO2X2 p1241A (.Q(n_59), 
	.B(bus_control_core_ext_rom_rd_b_i), 
	.A(n_54));
   INX0 Fp1536A894 (.Q(n_56), 
	.A(FE_OFN264_n_57));
   NO3I2X2 p1392D (.Q(n_57), 
	.C(bus_control_core_ext_ram_wr_b_i), 
	.BN(bus_control_core_ext_rom_rd_b_i), 
	.AN(bus_control_core_ext_ram_rd_b_i));
   NA3I1X2 p1297A (.Q(n_55), 
	.C(bus_control_core_ext_rom_rd_b_i), 
	.B(bus_control_core_ext_ram_wr_b_i), 
	.AN(bus_control_core_ext_ram_rd_b_i));
   NA2X2 p12610A (.Q(n_54), 
	.B(bus_control_core_ext_ram_rd_b_i), 
	.A(bus_control_core_ext_ram_wr_b_i));
   INX0 Fp11657A (.Q(n_53), 
	.A(bus_control_core_p3_7_i));
   INX0 Fp11657A896 (.Q(n_52), 
	.A(bus_control_core_p3_6_i));
endmodule

module csa_tree (
	in_0, 
	in_1, 
	out_0, 
	out_1, 
	FE_OFN235_fsm_alu_operand2_2_);
   input [7:0] in_0;
   input [7:0] in_1;
   output [15:0] out_0;
   output [15:0] out_1;
   input FE_OFN235_fsm_alu_operand2_2_;

   // Internal wires
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
   wire n_14;
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
   wire n_65;
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
   wire n_91;
   wire n_92;
   wire n_93;
   wire n_94;
   wire n_95;
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
   wire n_262;
   wire n_263;
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
   wire n_290;
   wire n_291;
   wire n_292;
   wire n_293;
   wire n_294;
   wire n_295;
   wire n_297;
   wire n_298;
   wire n_299;
   wire n_300;
   wire n_301;
   wire n_302;
   wire n_305;
   wire n_306;
   wire n_307;
   wire n_308;
   wire n_311;
   wire n_312;
   wire n_315;
   wire n_318;
   wire n_319;
   wire n_322;
   wire n_323;
   wire n_326;
   wire n_327;

   assign out_1[0] = 1'b0 ;
   assign out_1[15] = 1'b0 ;
   assign out_0[15] = 1'b0 ;

   INX1 Fp0815D (.Q(out_1[9]), 
	.A(n_327));
   INX1 Fp1698A (.Q(out_0[10]), 
	.A(n_326));
   FAX1 p0563D (.S(n_327), 
	.CO(n_326), 
	.CI(n_306), 
	.B(n_294), 
	.A(n_291));
   INX1 Fp1609A (.Q(out_1[10]), 
	.A(n_323));
   INX1 Fp2240A (.Q(out_0[11]), 
	.A(n_322));
   FAX0 p0946D (.S(n_323), 
	.CO(n_322), 
	.CI(n_305), 
	.B(n_298), 
	.A(n_290));
   INX1 Fp2464A (.Q(out_1[11]), 
	.A(n_319));
   INX1 Fp2897A (.Q(out_1[12]), 
	.A(n_318));
   FAX0 p1495D (.S(n_319), 
	.CO(n_318), 
	.CI(n_297), 
	.B(n_266), 
	.A(n_293));
   INX1 Fp0906D (.Q(out_0[9]), 
	.A(n_315));
   ON22X0 p0886D (.Q(out_0[8]), 
	.D(n_270), 
	.C(n_284), 
	.B(n_301), 
	.A(n_280));
   NO2X1 p0856D (.Q(n_315), 
	.B(n_299), 
	.A(n_311));
   MU2IX1 p0817D (.S(n_300), 
	.Q(out_1[8]), 
	.IN1(n_287), 
	.IN0(n_288));
   ON21X1 p0682D (.Q(out_1[7]), 
	.C(n_312), 
	.B(n_302), 
	.A(n_280));
   NA2X1 p0682D1539 (.Q(n_312), 
	.B(n_302), 
	.A(n_280));
   AN21X0 p0870D (.Q(n_311), 
	.C(n_288), 
	.B(n_282), 
	.A(n_273));
   INX1 Fp3032A (.Q(out_0[12]), 
	.A(n_308));
   INX0 Fp3060A (.Q(out_1[13]), 
	.A(n_307));
   FAX0 p2236A (.S(n_308), 
	.CO(n_307), 
	.CI(n_292), 
	.B(n_208), 
	.A(n_227));
   FAX1 p0115D (.S(n_306), 
	.CO(n_305), 
	.CI(n_271), 
	.B(n_229), 
	.A(n_224));
   FAX1 p0263D (.S(out_1[6]), 
	.CO(out_0[7]), 
	.CI(n_279), 
	.B(n_197), 
	.A(n_221));
   HAX1 p0544D (.S(n_302), 
	.CO(n_301), 
	.B(n_270), 
	.A(n_284));
   MU2IX1 p0819D (.S(n_281), 
	.Q(n_300), 
	.IN1(n_272), 
	.IN0(n_273));
   NO2X0 p1159D (.Q(n_299), 
	.B(n_282), 
	.A(n_273));
   FAX0 p0415D (.S(n_298), 
	.CO(n_297), 
	.CI(n_267), 
	.B(n_210), 
	.A(n_223));
   INX1 Fp0818D (.Q(out_0[6]), 
	.A(n_295));
   AN21X1 p0817D1540 (.Q(n_295), 
	.C(n_246), 
	.B(n_239), 
	.A(n_245));
   NO2X1 p0647D (.Q(n_294), 
	.B(n_244), 
	.A(n_283));
   FAX1 p1337D (.S(n_293), 
	.CO(n_292), 
	.CI(n_228), 
	.B(n_209), 
	.A(n_25));
   FAX0 p0256D (.S(n_291), 
	.CO(n_290), 
	.CI(n_226), 
	.B(n_163), 
	.A(n_122));
   NA2X1 p0672D (.Q(out_1[5]), 
	.B(n_286), 
	.A(n_285));
   MU2IX1 p0820DT (.S(n_252), 
	.Q(n_288), 
	.IN1(n_268), 
	.IN0(n_269));
   MU2IX1 p0961D (.S(n_252), 
	.Q(n_287), 
	.IN1(n_269), 
	.IN0(n_268));
   NA2X1 p0718D (.Q(n_286), 
	.B(n_238), 
	.A(n_253));
   NA2X1 p0681D (.Q(n_285), 
	.B(n_239), 
	.A(n_254));
   NO2I1X1 p0564D (.Q(n_284), 
	.B(n_274), 
	.AN(n_237));
   AN21X0 p0710D (.Q(n_283), 
	.C(n_268), 
	.B(n_171), 
	.A(n_231));
   NA2X1 p0750DT (.Q(n_281), 
	.B(n_276), 
	.A(n_275));
   AND2X0 p0904D (.Q(n_282), 
	.B(n_276), 
	.A(n_275));
   MU2IX1 p0668D (.S(n_255), 
	.Q(n_280), 
	.IN1(n_211), 
	.IN0(n_212));
   NA2X1 p0326D (.Q(n_279), 
	.B(n_278), 
	.A(n_277));
   NA2X1 p0372D (.Q(n_278), 
	.B(n_205), 
	.A(n_240));
   NA3X1 p0344DT (.Q(n_277), 
	.C(n_235), 
	.B(n_234), 
	.A(n_204));
   NA2X0 p0810D (.Q(n_276), 
	.B(n_217), 
	.A(n_257));
   NA2I1X0 p0820D (.Q(n_275), 
	.B(n_256), 
	.AN(n_217));
   NO2X1 p0563D1541 (.Q(n_274), 
	.B(n_236), 
	.A(n_205));
   ON21X0 p0814DT (.Q(n_272), 
	.C(n_243), 
	.B(n_199), 
	.A(n_241));
   NO2I1X1 p0825D (.Q(n_273), 
	.B(n_262), 
	.AN(n_243));
   NO2X1 p0205D (.Q(n_271), 
	.B(n_242), 
	.A(n_263));
   INX0 Fp0796D1542 (.Q(n_269), 
	.A(n_268));
   FAX0 p0131D (.S(n_270), 
	.CO(n_268), 
	.CI(n_215), 
	.B(n_115), 
	.A(n_141));
   FAX1 n0016D (.S(n_267), 
	.CO(n_266), 
	.CI(n_225), 
	.B(n_16), 
	.A(n_39));
   FAX1 p0146D (.S(out_1[4]), 
	.CO(out_0[5]), 
	.CI(n_203), 
	.B(n_139), 
	.A(n_120));
   NO2I1X0 p0222D (.Q(n_263), 
	.B(n_249), 
	.AN(n_160));
   NO2X1 p0833D (.Q(n_262), 
	.B(n_199), 
	.A(n_241));
   INX0 Fp3304A (.Q(out_0[13]), 
	.A(n_259));
   INX0 Fp3282A (.Q(out_1[14]), 
	.A(n_258));
   FAX0 p2492A (.S(n_259), 
	.CO(n_258), 
	.CI(n_207), 
	.B(n_57), 
	.A(n_58));
   MU2IX0 p0758DT (.S(n_218), 
	.Q(n_257), 
	.IN1(n_160), 
	.IN0(n_128));
   AN22X0 p0807D (.Q(n_256), 
	.D(n_128), 
	.C(n_218), 
	.B(n_160), 
	.A(n_219));
   NA2X1 p0668D1543 (.Q(n_255), 
	.B(n_248), 
	.A(n_247));
   MU2IX0 p0592DT (.S(n_220), 
	.Q(n_254), 
	.IN1(n_172), 
	.IN0(n_173));
   MU2IX0 p0764D (.S(n_220), 
	.Q(n_253), 
	.IN1(n_173), 
	.IN0(n_172));
   NA2X1 p0809D (.Q(n_252), 
	.B(n_250), 
	.A(n_251));
   NA2X1 p0834D (.Q(n_251), 
	.B(n_171), 
	.A(n_230));
   NA2X1 p0809D1544 (.Q(n_250), 
	.B(n_170), 
	.A(n_231));
   NO2X0 p0228D (.Q(n_249), 
	.B(n_216), 
	.A(n_218));
   NA2X1 p0681D1545 (.Q(n_248), 
	.B(n_199), 
	.A(n_201));
   NA2X1 p0704D (.Q(n_247), 
	.B(n_198), 
	.A(n_200));
   NO2X0 p0873D (.Q(n_246), 
	.B(n_220), 
	.A(n_173));
   NA2X0 p0817D1546 (.Q(n_245), 
	.B(n_220), 
	.A(n_173));
   NO2X0 p0750D (.Q(n_244), 
	.B(n_171), 
	.A(n_231));
   NA2X0 p0793D (.Q(n_243), 
	.B(n_212), 
	.A(n_201));
   NO2X1 p0260D (.Q(n_242), 
	.B(n_217), 
	.A(n_219));
   NO2I1X0 p0817D1547 (.Q(n_241), 
	.B(n_201), 
	.AN(n_211));
   NA2X1 p0445D (.Q(n_240), 
	.B(n_235), 
	.A(n_234));
   NA2X1 p0842DT (.Q(n_239), 
	.B(n_233), 
	.A(n_232));
   AND2X1 p0956D (.Q(n_238), 
	.B(n_233), 
	.A(n_232));
   NA2X0 p0611D (.Q(n_237), 
	.B(n_148), 
	.A(n_165));
   NO2I1X0 p0617D (.Q(n_236), 
	.B(n_165), 
	.AN(n_147));
   NA2X1 p0411D (.Q(n_235), 
	.B(n_147), 
	.A(n_165));
   NA2X1 p0416D (.Q(n_234), 
	.B(n_148), 
	.A(n_164));
   NA2X1 p0943D (.Q(n_233), 
	.B(n_121), 
	.A(n_206));
   OR2X1 p0849D (.Q(n_232), 
	.B(n_121), 
	.A(n_206));
   INX0 Fp0739D (.Q(n_230), 
	.A(n_231));
   FAX0 p0579D (.S(n_231), 
	.CO(n_229), 
	.CI(n_54), 
	.B(n_74), 
	.A(n_140));
   FAX0 p0919D (.S(n_228), 
	.CO(n_227), 
	.CI(n_29), 
	.B(n_48), 
	.A(n_89));
   FAX1 p0139D (.S(n_226), 
	.CO(n_225), 
	.CI(n_26), 
	.B(n_91), 
	.A(n_17));
   FAX0 p0503D (.S(n_224), 
	.CO(n_223), 
	.CI(n_14), 
	.B(n_32), 
	.A(n_53));
   INX0 Fp0966D (.Q(out_0[4]), 
	.A(n_214));
   NA2X1 p0764D1548 (.Q(n_221), 
	.B(n_193), 
	.A(n_213));
   OA22X0 p0871D (.Q(n_220), 
	.D(n_27), 
	.C(n_59), 
	.B(n_50), 
	.A(n_161));
   ON21X0 p0179DT (.Q(n_218), 
	.C(n_116), 
	.B(n_85), 
	.A(n_105));
   NO2X1 p0317D (.Q(n_219), 
	.B(n_154), 
	.A(n_174));
   ON21X0 p0244DT (.Q(n_216), 
	.C(n_114), 
	.B(n_46), 
	.A(n_113));
   NO2I1X0 p0393D (.Q(n_217), 
	.B(n_176), 
	.AN(n_114));
   NO2X1 p0202D (.Q(n_215), 
	.B(n_157), 
	.A(n_175));
   AN22X0 p0887D (.Q(n_214), 
	.D(n_87), 
	.C(n_92), 
	.B(n_125), 
	.A(n_143));
   NA2X0 p0773D (.Q(n_213), 
	.B(n_144), 
	.A(n_192));
   NO2X1 p0728DT (.Q(n_211), 
	.B(n_107), 
	.A(n_177));
   OR2X0 p0797D (.Q(n_212), 
	.B(n_107), 
	.A(n_177));
   FAX0 p0807D1549 (.S(n_210), 
	.CO(n_209), 
	.CI(n_42), 
	.B(n_24), 
	.A(n_49));
   FAX0 p1966A (.S(n_208), 
	.CO(n_207), 
	.CI(n_71), 
	.B(n_84), 
	.A(n_70));
   MU2IX1 p0844D (.S(n_144), 
	.Q(n_206), 
	.IN1(n_60), 
	.IN0(n_61));
   NO2X1 p0328DT (.Q(n_205), 
	.B(n_194), 
	.A(n_196));
   NA2I1X0 p0524D (.Q(n_204), 
	.B(n_195), 
	.AN(n_194));
   NA2X1 p0257D (.Q(n_203), 
	.B(n_189), 
	.A(n_188));
   NA2X1 p0721D (.Q(out_1[3]), 
	.B(n_178), 
	.A(n_179));
   NA2X1 p0555DT (.Q(n_201), 
	.B(n_184), 
	.A(n_186));
   NO2X0 p0755D (.Q(n_200), 
	.B(n_187), 
	.A(n_185));
   NO2X1 p0577DT (.Q(n_199), 
	.B(n_180), 
	.A(n_182));
   NA2X1 p0831D (.Q(n_198), 
	.B(n_183), 
	.A(n_181));
   NA2X1 p0655D (.Q(n_197), 
	.B(n_191), 
	.A(n_190));
   INX1 Fp0413D (.Q(n_196), 
	.A(n_195));
   NA2X1 p0413D (.Q(n_195), 
	.B(n_101), 
	.A(n_158));
   NO2I1X1 p0440D (.Q(n_194), 
	.B(n_158), 
	.AN(n_102));
   NA2X0 p0867D (.Q(n_193), 
	.B(n_60), 
	.A(n_156));
   NA2X0 p0773D1550 (.Q(n_192), 
	.B(n_61), 
	.A(n_121));
   NA2X0 p0656D (.Q(n_191), 
	.B(n_111), 
	.A(n_135));
   NA2X0 p0628D (.Q(n_190), 
	.B(n_159), 
	.A(n_136));
   NA2X0 p0259D (.Q(n_189), 
	.B(n_50), 
	.A(n_162));
   OR2X1 p0205D1551 (.Q(n_188), 
	.B(n_50), 
	.A(n_162));
   NO2X0 p0576DT (.Q(n_187), 
	.B(n_86), 
	.A(n_134));
   NA2X1 p0743D (.Q(n_186), 
	.B(n_85), 
	.A(n_155));
   INX0 Fp0657D (.Q(n_185), 
	.A(n_184));
   NA2X1 p0657D (.Q(n_184), 
	.B(n_86), 
	.A(n_134));
   INX0 Fp0675D (.Q(n_183), 
	.A(n_182));
   NO2X0 p0670D (.Q(n_182), 
	.B(n_47), 
	.A(n_133));
   INX0 Fp0725D (.Q(n_181), 
	.A(n_180));
   NO2I1X1 p0726D (.Q(n_180), 
	.B(n_132), 
	.AN(n_47));
   NA2X1 p0716D (.Q(n_179), 
	.B(n_143), 
	.A(n_137));
   NA2X1 p0714D (.Q(n_178), 
	.B(n_138), 
	.A(n_142));
   AN21X0 p0828D (.Q(n_177), 
	.C(n_111), 
	.B(n_34), 
	.A(n_38));
   NO2X0 p0397D (.Q(n_176), 
	.B(n_46), 
	.A(n_113));
   AN21X1 p0232D (.Q(n_175), 
	.C(n_101), 
	.B(n_19), 
	.A(n_45));
   NO2X0 p0312D (.Q(n_174), 
	.B(n_85), 
	.A(n_105));
   NA2X1 p0633DT (.Q(n_172), 
	.B(n_167), 
	.A(n_169));
   NO2X1 p0792D (.Q(n_173), 
	.B(n_168), 
	.A(n_166));
   EN3X0 p0846DT (.Q(n_171), 
	.C(n_103), 
	.B(n_43), 
	.A(n_56));
   EO3X0 p0825D1552 (.Q(n_170), 
	.C(n_43), 
	.B(n_103), 
	.A(n_56));
   INX0 Fp0772D (.Q(n_169), 
	.A(n_168));
   NO2I1X1 p0771D (.Q(n_168), 
	.B(n_145), 
	.AN(n_76));
   INX0 Fp0732D (.Q(n_167), 
	.A(n_166));
   NO2I1X1 p0731D (.Q(n_166), 
	.B(n_146), 
	.AN(n_77));
   NA2X1 p0288DT (.Q(n_165), 
	.B(n_124), 
	.A(n_151));
   NO2I1X0 p0481D (.Q(n_164), 
	.B(n_150), 
	.AN(n_124));
   NO2I1X1 p0678D (.Q(n_163), 
	.B(n_149), 
	.AN(n_123));
   HAX1 p0002D (.S(n_162), 
	.CO(n_161), 
	.B(n_27), 
	.A(n_59));
   INX1 Fp0988D (.Q(n_160), 
	.A(n_128));
   INX0 Fp1113A (.Q(n_159), 
	.A(n_111));
   HAX0 p0093D (.S(n_158), 
	.CO(n_157), 
	.B(n_18), 
	.A(n_44));
   INX0 Fp0763D (.Q(n_156), 
	.A(n_121));
   INX0 Fp0665D (.Q(n_155), 
	.A(n_134));
   INX0 Fp0278D (.Q(n_154), 
	.A(n_116));
   HAX1 p0512D (.S(out_1[2]), 
	.CO(out_0[3]), 
	.B(n_69), 
	.A(n_65));
   ON21X0 p0305DT (.Q(n_151), 
	.C(n_99), 
	.B(n_82), 
	.A(n_76));
   AN21X1 p0551D (.Q(n_150), 
	.C(n_100), 
	.B(n_83), 
	.A(n_77));
   NO2X0 p0700D (.Q(n_149), 
	.B(n_131), 
	.A(n_55));
   NO2X0 p0776DT (.Q(n_147), 
	.B(n_130), 
	.A(n_129));
   OR2X1 p0822D (.Q(n_148), 
	.B(n_129), 
	.A(n_130));
   MU2IX0 p0627DT (.S(n_99), 
	.Q(n_146), 
	.IN1(n_83), 
	.IN0(n_82));
   NA2X1 p0801D (.Q(n_145), 
	.B(n_127), 
	.A(n_126));
   EN2X0 p0875D (.Q(n_144), 
	.B(n_81), 
	.A(n_28));
   MU2IX0 p0704DT (.S(n_80), 
	.Q(n_142), 
	.IN1(n_22), 
	.IN0(n_23));
   MU2IX0 p0816D (.S(n_23), 
	.Q(n_143), 
	.IN1(n_80), 
	.IN0(n_79));
   MU2X0 p0816D1555 (.S(n_75), 
	.Q(n_141), 
	.IN1(n_73), 
	.IN0(n_72));
   NO2X1 p0781D (.Q(n_140), 
	.B(n_110), 
	.A(n_109));
   NA2X1 p0630D (.Q(n_139), 
	.B(n_117), 
	.A(n_112));
   MU2IX0 p0634DT (.S(n_92), 
	.Q(n_138), 
	.IN1(n_87), 
	.IN0(n_88));
   MU2IX0 p0857D (.S(n_92), 
	.Q(n_137), 
	.IN1(n_88), 
	.IN0(n_87));
   MU2IX0 p0602DT (.S(n_33), 
	.Q(n_136), 
	.IN1(n_38), 
	.IN0(n_37));
   ON21X0 p0743D1556 (.Q(n_135), 
	.C(n_108), 
	.B(n_37), 
	.A(n_34));
   NO2X1 p0665D (.Q(n_134), 
	.B(n_118), 
	.A(n_106));
   MU2IX0 p0599DT (.S(n_30), 
	.Q(n_133), 
	.IN1(n_98), 
	.IN0(n_97));
   NA2X1 p0757D (.Q(n_132), 
	.B(n_119), 
	.A(n_104));
   NO2X0 p0895D (.Q(n_131), 
	.B(n_103), 
	.A(n_43));
   NO2I1X0 p0809D1557 (.Q(n_130), 
	.B(n_20), 
	.AN(n_78));
   NO2X1 p0836D (.Q(n_129), 
	.B(n_78), 
	.A(n_21));
   NA2X1 p0827D (.Q(n_128), 
	.B(n_75), 
	.A(n_73));
   NA2X0 p0814D (.Q(n_127), 
	.B(n_82), 
	.A(n_100));
   NA2X0 p0865D (.Q(n_126), 
	.B(n_83), 
	.A(n_99));
   NA2X0 p0963D (.Q(n_125), 
	.B(n_93), 
	.A(n_88));
   NA2X1 p0424D (.Q(n_124), 
	.B(n_82), 
	.A(n_76));
   NA2X0 p0915D (.Q(n_123), 
	.B(n_103), 
	.A(n_43));
   OR2X0 p1350A (.Q(n_122), 
	.B(n_36), 
	.A(n_95));
   NA2X1 p0765D (.Q(n_121), 
	.B(n_40), 
	.A(n_62));
   NO2X1 p0737D (.Q(n_120), 
	.B(n_79), 
	.A(n_22));
   NA2X0 p0751D (.Q(n_119), 
	.B(n_97), 
	.A(n_31));
   NO2X1 p0650D (.Q(n_118), 
	.B(n_67), 
	.A(n_52));
   NA2X0 p0650D1558 (.Q(n_117), 
	.B(n_41), 
	.A(n_62));
   NA2X0 p0264D (.Q(n_116), 
	.B(n_67), 
	.A(n_51));
   NA2I1X0 p0826D (.Q(n_115), 
	.B(n_21), 
	.AN(n_78));
   NA2X0 p0356D (.Q(n_114), 
	.B(n_97), 
	.A(n_30));
   NO2X0 p0314D (.Q(n_113), 
	.B(n_97), 
	.A(n_30));
   NA2X0 p0678D1559 (.Q(n_112), 
	.B(n_40), 
	.A(n_63));
   NA2I1X0 p1029D (.Q(n_111), 
	.B(n_28), 
	.AN(n_81));
   NO2X1 p0796D (.Q(n_110), 
	.B(n_94), 
	.A(n_36));
   NO2X1 p0861D (.Q(n_109), 
	.B(n_35), 
	.A(n_95));
   NA2X0 p0767D (.Q(n_108), 
	.B(n_34), 
	.A(n_37));
   NO2X0 p0870D1560 (.Q(n_107), 
	.B(n_34), 
	.A(n_38));
   NO2X1 p0698D (.Q(n_106), 
	.B(n_68), 
	.A(n_51));
   NO2X0 p0256D1561 (.Q(n_105), 
	.B(n_67), 
	.A(n_51));
   NA2X0 p0766D (.Q(n_104), 
	.B(n_98), 
	.A(n_30));
   NO2I1X0 p0828D1562 (.Q(n_103), 
	.B(n_12), 
	.AN(in_1[3]));
   INX0 Fp0713D1563 (.Q(n_102), 
	.A(n_101));
   NA2X0 p0708D (.Q(n_101), 
	.B(in_0[4]), 
	.A(FE_OFN235_fsm_alu_operand2_2_));
   INX1 Fp0471D (.Q(n_100), 
	.A(n_99));
   NO2I1X1 p0453D (.Q(n_99), 
	.B(n_3), 
	.AN(in_1[4]));
   INX0 Fp0693D (.Q(n_98), 
	.A(n_97));
   NO2I1X0 p0691D (.Q(n_97), 
	.B(n_12), 
	.AN(FE_OFN235_fsm_alu_operand2_2_));
   NO2X0 p0806D (.Q(out_1[1]), 
	.B(n_9), 
	.A(n_5));
   NO2X0 p0707DT (.Q(n_94), 
	.B(n_11), 
	.A(n_6));
   NA2X0 p0960A (.Q(n_95), 
	.B(in_0[6]), 
	.A(FE_OFN235_fsm_alu_operand2_2_));
   INX0 Fp0766D1568 (.Q(n_93), 
	.A(n_92));
   NO2I1X1 p0824D (.Q(n_92), 
	.B(n_9), 
	.AN(in_1[3]));
   NA2X0 p0084D (.Q(n_91), 
	.B(in_0[3]), 
	.A(in_1[6]));
   NO2X0 p0905D (.Q(out_0[2]), 
	.B(n_3), 
	.A(n_5));
   NA2X0 p1171A (.Q(n_89), 
	.B(in_0[7]), 
	.A(in_1[4]));
   NO2X0 p0637DT (.Q(n_87), 
	.B(n_3), 
	.A(n_6));
   NA2X0 p0875D1569 (.Q(n_88), 
	.B(in_0[1]), 
	.A(FE_OFN235_fsm_alu_operand2_2_));
   INX0 Fp0470D (.Q(n_86), 
	.A(n_85));
   NA2X0 p0468D (.Q(n_85), 
	.B(in_0[3]), 
	.A(in_1[4]));
   NA2X0 p2150A (.Q(n_84), 
	.B(in_0[6]), 
	.A(in_1[6]));
   INX1 Fp0418D1574 (.Q(n_83), 
	.A(n_82));
   NO2I1X1 p0446D (.Q(n_82), 
	.B(n_4), 
	.AN(in_1[3]));
   NA2X0 p0885D (.Q(n_81), 
	.B(in_0[5]), 
	.A(in_1[0]));
   NA2X0 p0638DT (.Q(n_79), 
	.B(in_0[2]), 
	.A(in_1[1]));
   NO2X0 p0882D (.Q(n_80), 
	.B(n_4), 
	.A(n_5));
   NA2X0 p0805D (.Q(n_78), 
	.B(in_0[6]), 
	.A(in_1[0]));
   INX0 Fp0469D1576 (.Q(n_77), 
	.A(n_76));
   NO2I1X1 p0469D (.Q(n_76), 
	.B(n_8), 
	.AN(FE_OFN235_fsm_alu_operand2_2_));
   NO2I1X0 p0860D (.Q(n_75), 
	.B(n_1), 
	.AN(in_1[0]));
   NA2X0 p0656D1577 (.Q(n_74), 
	.B(in_0[2]), 
	.A(in_1[6]));
   NO2X0 p0695DT (.Q(n_73), 
	.B(n_11), 
	.A(n_5));
   NA2X0 p0939A (.Q(n_72), 
	.B(in_0[6]), 
	.A(in_1[1]));
   NA2X0 p1929A (.Q(n_71), 
	.B(in_0[5]), 
	.A(in_1[7]));
   NA2X0 p2126A (.Q(n_70), 
	.B(in_0[7]), 
	.A(in_1[5]));
   NO2I1X0 p0648D (.Q(n_69), 
	.B(n_4), 
	.AN(in_1[0]));
   INX0 Fp0577D (.Q(n_68), 
	.A(n_67));
   NO2I1X0 p0659D (.Q(n_67), 
	.B(n_7), 
	.AN(in_1[3]));
   NO2I1X0 p4343A (.Q(out_0[14]), 
	.B(n_1), 
	.AN(in_1[7]));
   NO2X0 p0576D (.Q(n_65), 
	.B(n_9), 
	.A(n_6));
   NO2I1X0 p5496A (.Q(out_0[0]), 
	.B(n_9), 
	.AN(in_1[0]));
   INX0 Fp0620D (.Q(n_63), 
	.A(n_62));
   NO2I1X0 p0618D (.Q(n_62), 
	.B(n_8), 
	.AN(in_1[1]));
   NO2X0 p0743DT (.Q(n_60), 
	.B(n_9), 
	.A(n_10));
   NA2X0 p0925D (.Q(n_61), 
	.B(in_0[0]), 
	.A(in_1[5]));
   NA2X1 p0046D (.Q(n_59), 
	.B(in_0[1]), 
	.A(in_1[3]));
   NA2X0 p3120A (.Q(n_58), 
	.B(in_0[7]), 
	.A(in_1[6]));
   NA2X0 p3144A (.Q(n_57), 
	.B(in_0[6]), 
	.A(in_1[7]));
   INX0 Fp0728D (.Q(n_56), 
	.A(n_55));
   NA2X0 p0728D (.Q(n_55), 
	.B(in_0[3]), 
	.A(in_1[5]));
   NA2X1 p0579D1578 (.Q(n_54), 
	.B(in_0[1]), 
	.A(in_1[7]));
   NA2X0 p0815D (.Q(n_53), 
	.B(in_0[7]), 
	.A(FE_OFN235_fsm_alu_operand2_2_));
   INX1 Fp0214D (.Q(n_52), 
	.A(n_51));
   NO2I1X1 p0227D (.Q(n_51), 
	.B(n_9), 
	.AN(in_1[7]));
   NA2X0 p0703D (.Q(n_50), 
	.B(in_0[2]), 
	.A(in_1[2]));
   NA2X0 p0979A (.Q(n_49), 
	.B(in_0[7]), 
	.A(in_1[3]));
   NA2X0 p1164A (.Q(n_48), 
	.B(in_0[6]), 
	.A(in_1[5]));
   INX1 Fp0356D1580 (.Q(n_47), 
	.A(n_46));
   NA2X1 p0354D (.Q(n_46), 
	.B(in_0[1]), 
	.A(in_1[6]));
   INX0 Fp0114D (.Q(n_45), 
	.A(n_44));
   NO2I1X1 p0117D (.Q(n_44), 
	.B(n_8), 
	.AN(in_1[3]));
   NO2I1X0 p0772D (.Q(n_43), 
	.B(n_7), 
	.AN(in_1[4]));
   NA2X0 p0806D1582 (.Q(n_42), 
	.B(in_0[4]), 
	.A(in_1[6]));
   INX1 Fp0863D (.Q(n_41), 
	.A(n_40));
   AND2X0 p0855D (.Q(n_40), 
	.B(in_0[4]), 
	.A(in_1[0]));
   NA2X0 p0852D (.Q(n_39), 
	.B(in_0[5]), 
	.A(in_1[5]));
   NO2X0 p0565DT (.Q(n_37), 
	.B(n_3), 
	.A(n_10));
   NA2X0 p0834D1583 (.Q(n_38), 
	.B(in_0[1]), 
	.A(in_1[5]));
   INX1 Fp0851D (.Q(n_36), 
	.A(n_35));
   NO2X0 p0805D1584 (.Q(n_35), 
	.B(n_1), 
	.A(n_5));
   NA2X0 p0559DT (.Q(n_34), 
	.B(in_0[0]), 
	.A(in_1[6]));
   NO2I1X0 p0812D (.Q(n_33), 
	.B(n_9), 
	.AN(in_1[6]));
   NA2X0 p0786D (.Q(n_32), 
	.B(in_0[6]), 
	.A(in_1[3]));
   INX0 Fp0296D1586 (.Q(n_31), 
	.A(n_30));
   NO2X4 p0324D (.Q(n_30), 
	.B(n_4), 
	.A(n_10));
   NA2X4 p0946D1587 (.Q(n_29), 
	.B(in_0[4]), 
	.A(in_1[7]));
   NO2X0 p0860D1588 (.Q(n_28), 
	.B(n_7), 
	.A(n_5));
   NA2X1 p0047D (.Q(n_27), 
	.B(in_0[0]), 
	.A(in_1[4]));
   NA2X0 p0150D (.Q(n_26), 
	.B(in_0[2]), 
	.A(in_1[7]));
   NA2X0 p1762A (.Q(n_25), 
	.B(in_0[5]), 
	.A(in_1[6]));
   NA2X0 p0971A (.Q(n_24), 
	.B(in_0[6]), 
	.A(in_1[4]));
   NA2X0 p0640DT (.Q(n_22), 
	.B(in_0[3]), 
	.A(in_1[0]));
   NO2I1X0 p0815D1589 (.Q(n_23), 
	.B(n_8), 
	.AN(in_1[0]));
   NO2I1X0 p0723DT (.Q(n_21), 
	.B(n_12), 
	.AN(in_1[1]));
   NA2X0 p0887D1590 (.Q(n_20), 
	.B(in_0[5]), 
	.A(in_1[1]));
   INX0 Fp0101D (.Q(n_19), 
	.A(n_18));
   NO2I1X1 p0101D (.Q(n_18), 
	.B(n_4), 
	.AN(in_1[4]));
   NA2X0 p0508D (.Q(n_17), 
	.B(in_0[5]), 
	.A(in_1[4]));
   NA2X0 p0444D (.Q(n_16), 
	.B(in_0[3]), 
	.A(in_1[7]));
   NO2I1X0 p0780D (.Q(out_0[1]), 
	.B(n_3), 
	.AN(in_1[0]));
   NA2X0 p0584D (.Q(n_14), 
	.B(in_0[4]), 
	.A(in_1[5]));
   INX0 Fp0493D1593 (.Q(n_12), 
	.A(in_0[5]));
   INX0 Fp0690D1594 (.Q(n_11), 
	.A(in_0[6]));
   INX0 Fp10994A1595 (.Q(n_10), 
	.A(in_1[5]));
   INX1 Fp0092D1600 (.Q(n_9), 
	.A(in_0[0]));
   INX1 Fp0105D1608 (.Q(n_8), 
	.A(in_0[3]));
   INX3 Fp0531D1610 (.Q(n_7), 
	.A(in_0[4]));
   INX0 Fp10836A1612 (.Q(n_6), 
	.A(FE_OFN235_fsm_alu_operand2_2_));
   INX0 Fp10769A1614 (.Q(n_5), 
	.A(in_1[1]));
   INX2 Fp0104D1622 (.Q(n_4), 
	.A(in_0[2]));
   INX1 Fp0088D1628 (.Q(n_3), 
	.A(in_0[1]));
   INX0 Fp0708D1630 (.Q(n_1), 
	.A(in_0[7]));
endmodule

module add_unsigned (
	A, 
	B, 
	Z);
   input [15:0] A;
   input [15:0] B;
   output [15:0] Z;

   // Internal wires
   wire FE_RN_76_0;
   wire FE_RN_75_0;
   wire FE_RN_74_0;
   wire FE_RN_73_0;
   wire FE_RN_72_0;
   wire FE_RN_71_0;
   wire FE_RN_70_0;
   wire FE_RN_69_0;
   wire FE_RN_68_0;
   wire FE_RN_67_0;
   wire FE_RN_66_0;
   wire FE_RN_65_0;
   wire FE_RN_64_0;
   wire FE_RN_63_0;
   wire FE_RN_62_0;
   wire FE_RN_61_0;
   wire FE_RN_60_0;
   wire FE_RN_59_0;
   wire FE_RN_58_0;
   wire FE_RN_57_0;
   wire FE_RN_56_0;
   wire FE_RN_55_0;
   wire FE_RN_54_0;
   wire FE_RN_53_0;
   wire FE_RN_52_0;
   wire FE_RN_51_0;
   wire FE_RN_50_0;
   wire FE_RN_49_0;
   wire FE_RN_48_0;
   wire FE_RN_47_0;
   wire FE_RN_46_0;
   wire FE_RN_45_0;
   wire FE_RN_44_0;
   wire FE_RN_43_0;
   wire FE_RN_42_0;
   wire FE_RN_41_0;
   wire FE_RN_40_0;
   wire FE_RN_39_0;
   wire FE_RN_38_0;
   wire FE_RN_37_0;
   wire FE_RN_36_0;
   wire FE_RN_35_0;
   wire FE_RN_34_0;
   wire FE_RN_33_0;
   wire FE_RN_32_0;
   wire FE_RN_31_0;
   wire FE_RN_30_0;
   wire FE_RN_29_0;
   wire FE_RN_28_0;
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
   wire n_20;
   wire n_21;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_27;
   wire n_29;
   wire n_30;
   wire n_32;
   wire n_34;
   wire n_36;
   wire n_37;
   wire n_44;
   wire n_46;

   assign Z[0] = 1'b0 ;

   INX0 FE_RC_114_0 (.Q(FE_RN_76_0), 
	.A(FE_RN_66_0));
   INX0 FE_RC_113_0 (.Q(FE_RN_75_0), 
	.A(FE_RN_31_0));
   NO2I1X1 FE_RC_112_0 (.Q(FE_RN_74_0), 
	.B(FE_RN_36_0), 
	.AN(FE_RN_42_0));
   NO2X1 FE_RC_111_0 (.Q(FE_RN_73_0), 
	.B(FE_RN_75_0), 
	.A(FE_RN_74_0));
   NA3X1 FE_RC_110_0 (.Q(FE_RN_72_0), 
	.C(n_37), 
	.B(FE_RN_42_0), 
	.A(FE_RN_56_0));
   NA3X1 FE_RC_109_0 (.Q(FE_RN_71_0), 
	.C(n_12), 
	.B(FE_RN_42_0), 
	.A(FE_RN_56_0));
   NA3X1 FE_RC_108_0 (.Q(FE_RN_70_0), 
	.C(FE_RN_73_0), 
	.B(FE_RN_72_0), 
	.A(FE_RN_71_0));
   NA2X1 FE_RC_107_0 (.Q(FE_RN_69_0), 
	.B(FE_RN_76_0), 
	.A(FE_RN_70_0));
   INX0 FE_RC_106_0 (.Q(FE_RN_68_0), 
	.A(A[12]));
   INX0 FE_RC_105_0 (.Q(FE_RN_67_0), 
	.A(B[12]));
   ON21X0 FE_RC_104_0 (.Q(FE_RN_66_0), 
	.C(FE_RN_29_0), 
	.B(FE_RN_67_0), 
	.A(FE_RN_68_0));
   AN21X1 FE_RC_103_0 (.Q(FE_RN_65_0), 
	.C(FE_RN_41_0), 
	.B(FE_RN_31_0), 
	.A(FE_RN_38_0));
   NA2X1 FE_RC_102_0 (.Q(FE_RN_64_0), 
	.B(FE_RN_31_0), 
	.A(FE_RN_33_0));
   NA2X1 FE_RC_101_0 (.Q(FE_RN_63_0), 
	.B(FE_RN_65_0), 
	.A(FE_RN_64_0));
   NA2X1 FE_RC_100_0 (.Q(FE_RN_62_0), 
	.B(FE_RN_66_0), 
	.A(FE_RN_63_0));
   NA2X1 FE_RC_99_0 (.Q(Z[12]), 
	.B(FE_RN_69_0), 
	.A(FE_RN_62_0));
   INX0 FE_RC_98_0 (.Q(FE_RN_61_0), 
	.A(A[11]));
   NA2X1 FE_RC_96_0 (.Q(FE_RN_59_0), 
	.B(FE_RN_61_0), 
	.A(B[11]));
   ON21X0 FE_RC_95_0 (.Q(FE_RN_58_0), 
	.C(FE_RN_59_0), 
	.B(FE_RN_61_0), 
	.A(B[11]));
   NA2X1 FE_RC_94_0 (.Q(FE_RN_57_0), 
	.B(n_37), 
	.A(FE_RN_56_0));
   AND2X1 FE_RC_93_0 (.Q(FE_RN_56_0), 
	.B(n_17), 
	.A(FE_RN_43_0));
   NA2X1 FE_RC_92_0 (.Q(FE_RN_55_0), 
	.B(n_12), 
	.A(FE_RN_56_0));
   NA3X1 FE_RC_91_0 (.Q(FE_RN_54_0), 
	.C(FE_RN_36_0), 
	.B(FE_RN_57_0), 
	.A(FE_RN_55_0));
   NA2X1 FE_RC_90_0 (.Q(FE_RN_53_0), 
	.B(FE_RN_58_0), 
	.A(FE_RN_54_0));
   INX0 FE_RC_89_0 (.Q(FE_RN_52_0), 
	.A(FE_RN_43_0));
   NA2X1 FE_RC_88_0 (.Q(FE_RN_51_0), 
	.B(FE_RN_31_0), 
	.A(FE_RN_42_0));
   ON31X0 FE_RC_87_0 (.Q(FE_RN_50_0), 
	.D(FE_RN_51_0), 
	.C(FE_RN_33_0), 
	.B(FE_RN_38_0), 
	.A(FE_RN_52_0));
   NA2X1 FE_RC_86_0 (.Q(Z[11]), 
	.B(FE_RN_53_0), 
	.A(FE_RN_50_0));
   EN2X0 FE_RC_85_0 (.Q(FE_RN_49_0), 
	.B(B[10]), 
	.A(A[10]));
   INX0 FE_RC_84_0 (.Q(FE_RN_48_0), 
	.A(FE_RN_36_0));
   NO2I1X1 FE_RC_83_0 (.Q(FE_RN_47_0), 
	.B(FE_RN_48_0), 
	.AN(FE_RN_43_0));
   NA2X1 FE_RC_82_0 (.Q(FE_RN_46_0), 
	.B(n_17), 
	.A(FE_RN_34_0));
   MU2IX1 FE_RC_81_0 (.S(FE_RN_46_0), 
	.Q(Z[10]), 
	.IN1(FE_RN_47_0), 
	.IN0(FE_RN_49_0));
   NA2X1 FE_RC_80_0 (.Q(FE_RN_45_0), 
	.B(A[12]), 
	.A(FE_RN_41_0));
   INX1 FE_RC_79_0 (.Q(FE_RN_44_0), 
	.A(FE_RN_31_0));
   NA2X1 FE_RC_78_0 (.Q(FE_RN_43_0), 
	.B(B[10]), 
	.A(A[10]));
   NA2X1 FE_RC_77_0 (.Q(FE_RN_42_0), 
	.B(A[11]), 
	.A(B[11]));
   ON21X1 FE_RC_76_0 (.Q(FE_RN_41_0), 
	.C(FE_RN_42_0), 
	.B(FE_RN_43_0), 
	.A(FE_RN_44_0));
   ON21X1 FE_RC_75_0 (.Q(FE_RN_40_0), 
	.C(B[12]), 
	.B(A[12]), 
	.A(FE_RN_41_0));
   INX0 FE_RC_74_0 (.Q(FE_RN_39_0), 
	.A(n_17));
   AND2X1 FE_RC_73_0 (.Q(FE_RN_38_0), 
	.B(FE_RN_39_0), 
	.A(FE_RN_36_0));
   INX0 FE_RC_72_0 (.Q(FE_RN_37_0), 
	.A(A[10]));
   NA2I1X4 FE_RC_71_0 (.Q(FE_RN_36_0), 
	.B(FE_RN_37_0), 
	.AN(B[10]));
   INX0 FE_RC_70_0 (.Q(FE_RN_35_0), 
	.A(n_12));
   NA2I1X1 FE_RC_69_0 (.Q(FE_RN_34_0), 
	.B(FE_RN_35_0), 
	.AN(n_37));
   NO2I1X2 FE_RC_68_0 (.Q(FE_RN_33_0), 
	.B(FE_RN_34_0), 
	.AN(FE_RN_36_0));
   INX0 FE_RC_67_0 (.Q(FE_RN_32_0), 
	.A(A[11]));
   NA2I1X1 FE_RC_66_0 (.Q(FE_RN_31_0), 
	.B(FE_RN_32_0), 
	.AN(B[11]));
   NA2I1X0 FE_RC_64_0 (.Q(FE_RN_29_0), 
	.B(FE_RN_68_0), 
	.AN(B[12]));
   ON211X1 FE_RC_63_0 (.Q(FE_RN_28_0), 
	.D(FE_RN_29_0), 
	.C(FE_RN_31_0), 
	.B(FE_RN_33_0), 
	.A(FE_RN_38_0));
   NA3X2 FE_RC_62_0 (.Q(n_44), 
	.C(FE_RN_45_0), 
	.B(FE_RN_40_0), 
	.A(FE_RN_28_0));
   FAX1 p2131D (.S(Z[14]), 
	.CO(Z[15]), 
	.CI(n_46), 
	.B(B[14]), 
	.A(A[14]));
   FAX2 p1789D (.S(Z[13]), 
	.CO(n_46), 
	.CI(B[13]), 
	.B(A[13]), 
	.A(n_44));
   EN3X0 p3839A (.Q(Z[9]), 
	.C(A[9]), 
	.B(B[9]), 
	.A(n_37));
   INX1 Fp0699D (.Q(n_37), 
	.A(n_36));
   ON21X1 p0718D (.Q(n_36), 
	.C(n_10), 
	.B(n_6), 
	.A(n_34));
   EN3X0 p4114A (.Q(Z[8]), 
	.C(A[8]), 
	.B(B[8]), 
	.A(n_34));
   AN21X1 p0723D (.Q(n_34), 
	.C(n_11), 
	.B(n_14), 
	.A(n_32));
   EO3X0 p4135A (.Q(Z[7]), 
	.C(A[7]), 
	.B(B[7]), 
	.A(n_32));
   NA2X4 p0759D (.Q(n_32), 
	.B(n_9), 
	.A(n_30));
   EO3X0 p4285A (.Q(Z[6]), 
	.C(A[6]), 
	.B(B[6]), 
	.A(n_29));
   NA2X1 p0767D (.Q(n_30), 
	.B(n_8), 
	.A(n_29));
   ON21X1 p0796D (.Q(n_29), 
	.C(n_5), 
	.B(n_15), 
	.A(n_27));
   EN3X0 p4589A (.Q(Z[5]), 
	.C(A[5]), 
	.B(B[5]), 
	.A(n_27));
   NO2I1X1 p0812D (.Q(n_27), 
	.B(n_25), 
	.AN(n_7));
   EO3X0 p4650A (.Q(Z[4]), 
	.C(A[4]), 
	.B(B[4]), 
	.A(n_23));
   NO2X1 p0841D (.Q(n_25), 
	.B(n_24), 
	.A(n_16));
   INX0 Fp0812D (.Q(n_24), 
	.A(n_23));
   NA2X2 p0817D (.Q(n_23), 
	.B(n_4), 
	.A(n_21));
   EO3X0 p4994A (.Q(Z[3]), 
	.C(A[3]), 
	.B(n_20), 
	.A(B[3]));
   ON21X0 p0823D (.Q(n_21), 
	.C(n_20), 
	.B(A[3]), 
	.A(B[3]));
   FAX0 p0795D (.S(Z[2]), 
	.CO(n_20), 
	.CI(B[2]), 
	.B(n_13), 
	.A(A[2]));
   EO2X0 p5042A (.Q(Z[1]), 
	.B(B[1]), 
	.A(A[1]));
   NA2X1 p1280D (.Q(n_17), 
	.B(A[9]), 
	.A(B[9]));
   NO2X1 p0838D (.Q(n_16), 
	.B(A[4]), 
	.A(B[4]));
   NO2X1 p0790D (.Q(n_15), 
	.B(A[5]), 
	.A(B[5]));
   OR2X1 p0857D (.Q(n_14), 
	.B(A[7]), 
	.A(B[7]));
   NO2X1 p0867D (.Q(n_13), 
	.B(n_2), 
	.A(n_3));
   NO2X1 p1116D (.Q(n_12), 
	.B(A[9]), 
	.A(B[9]));
   AND2X0 p0845D (.Q(n_11), 
	.B(A[7]), 
	.A(B[7]));
   NA2X0 p1068D (.Q(n_10), 
	.B(A[8]), 
	.A(B[8]));
   NA2X1 p0874D (.Q(n_9), 
	.B(A[6]), 
	.A(B[6]));
   NA2X1 p0780D (.Q(n_8), 
	.B(n_1), 
	.A(n_0));
   NA2X0 p0817D154 (.Q(n_7), 
	.B(A[4]), 
	.A(B[4]));
   NO2X0 p0905D (.Q(n_6), 
	.B(A[8]), 
	.A(B[8]));
   NA2X0 p0876D (.Q(n_5), 
	.B(A[5]), 
	.A(B[5]));
   NA2X0 p0842D (.Q(n_4), 
	.B(A[3]), 
	.A(B[3]));
   INX1 Fp0817D (.Q(n_3), 
	.A(B[1]));
   INX0 Fp0825D (.Q(n_2), 
	.A(A[1]));
   INX1 Fp1058D (.Q(n_1), 
	.A(A[6]));
   INX0 Fp0756D (.Q(n_0), 
	.A(B[6]));
endmodule

module shared_div_rem_unsigned_284 (
	A, 
	B, 
	QUOTIENT, 
	REMAINDER, 
	FE_PT1_n_4);
   input [7:0] A;
   input [7:0] B;
   output [7:0] QUOTIENT;
   output [7:0] REMAINDER;
   input FE_PT1_n_4;

   // Internal wires
   wire FE_RN_27_0;
   wire FE_RN_16_0;
   wire FE_OFN284_n_293;
   wire FE_OFN283_n_293;
   wire FE_OFN266_n_99;
   wire FE_OFN259_n_54;
   wire FE_OFN258_n_54;
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
   wire n_165;
   wire n_166;
   wire n_167;
   wire n_168;
   wire n_170;
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
   wire n_414;
   wire n_415;
   wire n_416;
   wire n_417;
   wire n_419;
   wire n_420;
   wire n_421;
   wire n_422;
   wire n_423;
   wire n_424;
   wire n_425;

   AND2X1 FE_RC_61_0 (.Q(FE_RN_27_0), 
	.B(n_149), 
	.A(n_158));
   NA3I1X4 FE_RC_60_0 (.Q(n_179), 
	.C(n_160), 
	.B(n_166), 
	.AN(FE_RN_27_0));
   INX1 FE_RC_41_0 (.Q(n_119), 
	.A(FE_RN_16_0));
   NA2X2 FE_RC_40_0 (.Q(n_126), 
	.B(FE_RN_16_0), 
	.A(n_102));
   OR2X1 FE_RC_39_0 (.Q(FE_RN_16_0), 
	.B(n_75), 
	.A(n_117));
   AND2X2 FE_RC_38_0 (.Q(n_125), 
	.B(n_102), 
	.A(FE_RN_16_0));
   OR2X1 FE_RC_1_0 (.Q(n_78), 
	.B(n_14), 
	.A(n_71));
   INX2 FE_OFC284_n_293 (.Q(FE_OFN284_n_293), 
	.A(FE_OFN283_n_293));
   INX0 FE_OFC283_n_293 (.Q(FE_OFN283_n_293), 
	.A(n_293));
   BUX1 FE_OFC266_n_99 (.Q(FE_OFN266_n_99), 
	.A(n_99));
   INX1 FE_OFC259_n_54 (.Q(FE_OFN259_n_54), 
	.A(FE_OFN258_n_54));
   INX0 FE_OFC258_n_54 (.Q(FE_OFN258_n_54), 
	.A(n_54));
   AO22X4 p0866D (.Q(REMAINDER[0]), 
	.D(n_32), 
	.C(QUOTIENT[0]), 
	.B(A[0]), 
	.A(n_425));
   ON21X1 p1425D (.Q(REMAINDER[6]), 
	.C(n_419), 
	.B(n_402), 
	.A(n_417));
   ON21X1 p1364D (.Q(REMAINDER[1]), 
	.C(n_423), 
	.B(n_35), 
	.A(n_417));
   ON21X1 p1428D (.Q(REMAINDER[3]), 
	.C(n_422), 
	.B(n_369), 
	.A(n_417));
   ON21X1 p1975D (.Q(REMAINDER[2]), 
	.C(n_420), 
	.B(n_358), 
	.A(n_417));
   ON221X1 p1394D (.Q(REMAINDER[5]), 
	.E(n_414), 
	.D(n_415), 
	.C(n_392), 
	.B(n_417), 
	.A(n_393));
   ON21X0 p1430D (.Q(REMAINDER[4]), 
	.C(n_421), 
	.B(n_380), 
	.A(n_417));
   NA3X2 p0834D (.Q(n_425), 
	.C(n_409), 
	.B(n_417), 
	.A(n_424));
   NA2X2 p0834D5105 (.Q(n_424), 
	.B(n_10), 
	.A(QUOTIENT[0]));
   AN222X1 p0925D (.Q(n_423), 
	.F(n_57), 
	.E(n_416), 
	.D(n_397), 
	.C(n_97), 
	.B(n_410), 
	.A(A[1]));
   AN222X4 p1005D (.Q(n_422), 
	.F(n_368), 
	.E(n_416), 
	.D(n_397), 
	.C(n_363), 
	.B(n_410), 
	.A(n_295));
   AN222X1 p1005D5106 (.Q(n_421), 
	.F(n_381), 
	.E(n_416), 
	.D(n_397), 
	.C(n_365), 
	.B(n_410), 
	.A(n_299));
   AN222X1 p1425D5107 (.Q(n_420), 
	.F(n_304), 
	.E(n_410), 
	.D(n_397), 
	.C(n_359), 
	.B(n_416), 
	.A(n_357));
   AN222X1 p1005D5108 (.Q(n_419), 
	.F(n_403), 
	.E(n_416), 
	.D(n_397), 
	.C(n_382), 
	.B(n_410), 
	.A(FE_OFN284_n_293));
   NA2X2 p0822D (.Q(QUOTIENT[0]), 
	.B(n_396), 
	.A(n_415));
   NA2X2 p0834D5109 (.Q(n_417), 
	.B(QUOTIENT[1]), 
	.A(n_396));
   INX4 Fp0808D5110 (.Q(n_416), 
	.A(n_415));
   NA2I1X4 p0808D (.Q(n_415), 
	.B(n_409), 
	.AN(QUOTIENT[1]));
   AN22X0 p1189D (.Q(n_414), 
	.D(n_374), 
	.C(n_397), 
	.B(n_297), 
	.A(n_410));
   ON22X1 p1692D (.Q(REMAINDER[7]), 
	.D(n_347), 
	.C(n_396), 
	.B(n_273), 
	.A(n_409));
   NA2X4 p0792D (.Q(QUOTIENT[1]), 
	.B(n_292), 
	.A(n_411));
   NA2X4 p0800D (.Q(n_411), 
	.B(n_302), 
	.A(n_404));
   NA2X4 p0697DT (.Q(n_409), 
	.B(n_408), 
	.A(n_407));
   AND2X4 p0814D (.Q(n_410), 
	.B(n_407), 
	.A(n_408));
   NA2X4 p0796D (.Q(n_408), 
	.B(n_4), 
	.A(n_406));
   NA2X2 p0784D (.Q(n_407), 
	.B(n_272), 
	.A(n_405));
   NA2X2 p0805D (.Q(n_406), 
	.B(n_324), 
	.A(n_400));
   NA2X2 p0777D (.Q(n_405), 
	.B(n_346), 
	.A(n_400));
   NA2X4 p0799D (.Q(n_404), 
	.B(n_310), 
	.A(n_401));
   EO2X0 p1152D (.Q(n_403), 
	.B(n_337), 
	.A(n_399));
   EO2X0 p1864D (.Q(n_402), 
	.B(n_331), 
	.A(n_398));
   NA2X2 p0795D (.Q(n_401), 
	.B(n_311), 
	.A(n_395));
   NA2X4 p0783D (.Q(n_400), 
	.B(n_319), 
	.A(n_394));
   INX0 Fp0796D (.Q(n_399), 
	.A(n_394));
   INX0 Fp0799D (.Q(n_398), 
	.A(n_395));
   ON21X4 p0674DT (.Q(n_396), 
	.C(n_109), 
	.B(n_291), 
	.A(n_388));
   NO2I1X2 p0822D5111 (.Q(n_397), 
	.B(n_389), 
	.AN(n_109));
   NA2X2 p0799D5112 (.Q(n_395), 
	.B(n_330), 
	.A(n_391));
   NA2X4 p0792D5113 (.Q(n_394), 
	.B(n_323), 
	.A(n_390));
   EO2X0 p1964D (.Q(n_393), 
	.B(n_333), 
	.A(n_383));
   EO2X0 p1958D (.Q(n_392), 
	.B(n_332), 
	.A(n_387));
   NA2X2 p0796D5114 (.Q(n_391), 
	.B(n_327), 
	.A(n_384));
   NA2X2 p0804D (.Q(n_390), 
	.B(n_320), 
	.A(n_385));
   NO2X2 p0793D (.Q(n_389), 
	.B(n_291), 
	.A(n_388));
   AN21X1 p0751D (.Q(n_388), 
	.C(n_386), 
	.B(n_273), 
	.A(n_110));
   INX0 Fp0816D (.Q(n_387), 
	.A(n_385));
   NO2I1X2 p0751D5115 (.Q(n_386), 
	.B(n_377), 
	.AN(n_309));
   NA2X4 p0812D (.Q(n_385), 
	.B(n_322), 
	.A(n_378));
   NA2X2 p0626DT (.Q(n_384), 
	.B(n_329), 
	.A(n_379));
   AND2X0 p1708D (.Q(n_383), 
	.B(n_329), 
	.A(n_379));
   EO2X0 p0969D (.Q(n_382), 
	.B(n_341), 
	.A(n_376));
   EO2X0 p1703D (.Q(n_381), 
	.B(n_344), 
	.A(n_370));
   EO2X0 p2421D (.Q(n_380), 
	.B(n_343), 
	.A(n_371));
   NA2X1 p0805D5116 (.Q(n_379), 
	.B(n_328), 
	.A(n_372));
   NA2X2 p0821D (.Q(n_378), 
	.B(n_321), 
	.A(n_370));
   NO2X2 p0754D (.Q(n_377), 
	.B(n_308), 
	.A(n_375));
   NO2X0 p0942D (.Q(n_376), 
	.B(n_355), 
	.A(n_373));
   NO2X2 p0752D (.Q(n_375), 
	.B(n_361), 
	.A(n_373));
   EO2X0 p1431D (.Q(n_374), 
	.B(n_345), 
	.A(n_366));
   NA2X2 p0754D5117 (.Q(n_373), 
	.B(n_326), 
	.A(n_367));
   ON21X1 p0704DT (.Q(n_372), 
	.C(n_318), 
	.B(n_317), 
	.A(n_349));
   OA21X0 p2056D (.Q(n_371), 
	.C(n_318), 
	.B(n_317), 
	.A(n_349));
   ON21X1 p0839D (.Q(n_370), 
	.C(n_313), 
	.B(n_312), 
	.A(n_348));
   EO2X0 p2688A (.Q(n_369), 
	.B(n_339), 
	.A(n_349));
   EO2X0 p1981D (.Q(n_368), 
	.B(n_338), 
	.A(n_348));
   NA2X1 p0767D (.Q(n_367), 
	.B(n_325), 
	.A(n_364));
   AN21X1 p1243D (.Q(n_366), 
	.C(n_307), 
	.B(n_305), 
	.A(n_360));
   EO2X0 p1383D (.Q(n_365), 
	.B(n_340), 
	.A(n_360));
   NA2X2 p0757D (.Q(n_364), 
	.B(n_306), 
	.A(n_362));
   EO2X0 p1545D (.Q(n_363), 
	.B(n_342), 
	.A(n_356));
   NA2X1 p0754D5118 (.Q(n_362), 
	.B(n_305), 
	.A(n_353));
   AND2X2 p0847D (.Q(n_361), 
	.B(n_79), 
	.A(n_355));
   ON21X1 p1130D (.Q(n_360), 
	.C(n_354), 
	.B(n_315), 
	.A(n_352));
   EO2X0 p2202D (.Q(n_359), 
	.B(n_79), 
	.A(n_350));
   EN3X0 p3350A (.Q(n_358), 
	.C(n_30), 
	.B(B[1]), 
	.A(n_304));
   EN3X0 p2740A (.Q(n_357), 
	.C(n_60), 
	.B(B[2]), 
	.A(n_304));
   NA2X0 p1441D (.Q(n_356), 
	.B(n_335), 
	.A(n_352));
   AND4X2 p0827D (.Q(n_355), 
	.D(n_325), 
	.C(n_314), 
	.B(n_305), 
	.A(n_336));
   INX0 Fp0769D (.Q(n_354), 
	.A(n_353));
   NA2X2 p0756D (.Q(n_353), 
	.B(n_316), 
	.A(n_351));
   NA2X0 p1100D (.Q(n_352), 
	.B(n_79), 
	.A(n_336));
   NA2X2 p0762D (.Q(n_351), 
	.B(n_314), 
	.A(n_334));
   AND2X0 p1955D (.Q(n_350), 
	.B(n_336), 
	.A(n_335));
   AN21X1 p0837D (.Q(n_349), 
	.C(n_64), 
	.B(n_67), 
	.A(n_304));
   AN21X1 p0818D (.Q(n_348), 
	.C(n_83), 
	.B(n_84), 
	.A(n_304));
   EN2X0 p2815A (.Q(n_347), 
	.B(n_291), 
	.A(n_308));
   AND2X1 p1536D (.Q(n_346), 
	.B(B[7]), 
	.A(n_324));
   NA2X0 p1964D5119 (.Q(n_345), 
	.B(n_326), 
	.A(n_325));
   AND2X0 p1822D (.Q(n_344), 
	.B(n_322), 
	.A(n_321));
   AND2X0 p2634A (.Q(n_343), 
	.B(n_329), 
	.A(n_328));
   AND2X0 p1572D (.Q(n_342), 
	.B(n_316), 
	.A(n_314));
   NA2I1X0 p1556D (.Q(n_341), 
	.B(n_309), 
	.AN(n_308));
   AND2X0 p1528D (.Q(n_340), 
	.B(n_306), 
	.A(n_305));
   NO2I1X0 p2652A (.Q(n_339), 
	.B(n_317), 
	.AN(n_318));
   NA2I1X0 p1810D (.Q(n_338), 
	.B(n_313), 
	.AN(n_312));
   NA2X0 p1896D (.Q(n_337), 
	.B(n_324), 
	.A(n_319));
   NA2X1 p0817D (.Q(n_336), 
	.B(n_74), 
	.A(n_303));
   INX0 Fp0768D (.Q(n_335), 
	.A(n_334));
   NO2X1 p0755D (.Q(n_334), 
	.B(n_74), 
	.A(n_303));
   AND2X0 p2348D (.Q(n_333), 
	.B(n_330), 
	.A(n_327));
   AND2X0 p2377D (.Q(n_332), 
	.B(n_323), 
	.A(n_320));
   AND2X0 p2632A (.Q(n_331), 
	.B(n_310), 
	.A(n_311));
   NA2X0 p1489D (.Q(n_330), 
	.B(n_6), 
	.A(n_297));
   NA2X0 p1267D (.Q(n_329), 
	.B(n_9), 
	.A(n_299));
   OR2X1 p1031D (.Q(n_328), 
	.B(n_9), 
	.A(n_299));
   OR2X2 p1306D (.Q(n_327), 
	.B(n_6), 
	.A(n_297));
   NA2X1 p1119D (.Q(n_326), 
	.B(n_105), 
	.A(n_297));
   NA2I1X2 p0826D (.Q(n_325), 
	.B(n_296), 
	.AN(n_105));
   NA2I1X1 p1215D (.Q(n_324), 
	.B(FE_OFN284_n_293), 
	.AN(B[6]));
   NA2X1 p1347D (.Q(n_323), 
	.B(n_3), 
	.A(n_297));
   NA2X1 p1133D (.Q(n_322), 
	.B(n_6), 
	.A(n_299));
   OR2X1 p0956D (.Q(n_321), 
	.B(n_6), 
	.A(n_299));
   NA2X0 p1228D (.Q(n_320), 
	.B(B[5]), 
	.A(n_296));
   NA2I1X1 p1320D (.Q(n_319), 
	.B(B[6]), 
	.AN(FE_OFN284_n_293));
   NA2X1 p0971D (.Q(n_318), 
	.B(n_1), 
	.A(n_295));
   NO2X1 p1074D (.Q(n_317), 
	.B(n_1), 
	.A(n_295));
   NA2X1 p1004D (.Q(n_316), 
	.B(n_88), 
	.A(n_295));
   INX0 Fp0770D (.Q(n_315), 
	.A(n_314));
   NA2X1 p0780D (.Q(n_314), 
	.B(n_87), 
	.A(n_294));
   NA2X2 p0956D5120 (.Q(n_313), 
	.B(n_9), 
	.A(n_295));
   NO2X1 p1063D (.Q(n_312), 
	.B(n_9), 
	.A(n_295));
   OR2X1 p1508D (.Q(n_311), 
	.B(n_3), 
	.A(FE_OFN284_n_293));
   NA2X0 p1675D (.Q(n_310), 
	.B(n_3), 
	.A(FE_OFN284_n_293));
   NA2X0 p1424D (.Q(n_309), 
	.B(n_108), 
	.A(FE_OFN284_n_293));
   NO2X1 p1357D (.Q(n_308), 
	.B(n_108), 
	.A(FE_OFN284_n_293));
   INX0 Fp1239D (.Q(n_307), 
	.A(n_306));
   NA2X1 p0941D (.Q(n_306), 
	.B(FE_OFN266_n_99), 
	.A(n_299));
   NA2I1X4 p0816D (.Q(n_305), 
	.B(n_298), 
	.AN(FE_OFN266_n_99));
   NO2X2 p0591DT (.Q(n_303), 
	.B(n_288), 
	.A(n_300));
   NA2X4 p0805D5122 (.Q(n_304), 
	.B(n_289), 
	.A(n_301));
   AO21X0 p1811D (.Q(n_302), 
	.C(n_28), 
	.B(n_4), 
	.A(n_272));
   INX2 Fp0736D (.Q(n_301), 
	.A(n_300));
   NO2I1X4 p0733D (.Q(n_300), 
	.B(n_290), 
	.AN(A[2]));
   NO2X2 p0696DT (.Q(n_298), 
	.B(n_279), 
	.A(n_285));
   NA2I1X2 p0821D5123 (.Q(n_299), 
	.B(n_286), 
	.AN(n_279));
   INX1 Fp0836D5124 (.Q(n_297), 
	.A(n_296));
   NO2X2 p0796D5125 (.Q(n_296), 
	.B(n_280), 
	.A(n_287));
   NO2X1 p0661DT (.Q(n_294), 
	.B(n_274), 
	.A(n_284));
   NA2X2 p0850D (.Q(n_295), 
	.B(n_275), 
	.A(n_283));
   ON221X0 p1007D (.Q(n_293), 
	.E(n_268), 
	.D(n_260), 
	.C(n_248), 
	.B(n_263), 
	.A(n_247));
   NA2X0 p2211D (.Q(n_292), 
	.B(n_28), 
	.A(n_272));
   NO2X1 p2281D (.Q(n_291), 
	.B(n_273), 
	.A(n_110));
   NO2I1X4 p0733D5126 (.Q(n_290), 
	.B(n_276), 
	.AN(B[0]));
   INX2 Fp0792D (.Q(n_289), 
	.A(n_288));
   NO2I1X2 p0791D (.Q(n_288), 
	.B(n_276), 
	.AN(n_17));
   ON211X0 p0826D5127 (.Q(n_287), 
	.D(n_245), 
	.C(n_267), 
	.B(n_237), 
	.A(n_260));
   NO2X1 p0671DT (.Q(n_286), 
	.B(n_271), 
	.A(n_281));
   NA2X1 p0863D (.Q(n_285), 
	.B(n_270), 
	.A(n_282));
   ON211X1 p0675DT (.Q(n_284), 
	.D(n_242), 
	.C(n_266), 
	.B(n_33), 
	.A(n_260));
   NO2X2 p0825D (.Q(n_283), 
	.B(n_269), 
	.A(n_278));
   NA2X1 p0678DT (.Q(n_282), 
	.B(n_224), 
	.A(n_259));
   NO2X1 p0868D (.Q(n_281), 
	.B(n_225), 
	.A(n_260));
   NO2X2 p0826D5128 (.Q(n_280), 
	.B(n_236), 
	.A(n_263));
   NO2I1X1 p0785D (.Q(n_279), 
	.B(n_263), 
	.AN(n_223));
   NO2X1 p0829D (.Q(n_278), 
	.B(n_33), 
	.A(n_260));
   INX0 Fp0710D (.Q(QUOTIENT[2]), 
	.A(n_276));
   NA2X4 p0683D (.Q(n_276), 
	.B(n_255), 
	.A(n_260));
   NA2X1 p0720DT (.Q(n_275), 
	.B(n_58), 
	.A(n_262));
   NO2I1X0 p0813D (.Q(n_274), 
	.B(n_263), 
	.AN(n_58));
   NA2X1 p1357DT (.Q(n_272), 
	.B(n_120), 
	.A(n_261));
   AND2X1 p2102D (.Q(n_273), 
	.B(n_120), 
	.A(n_261));
   NA2X1 p0651DT (.Q(n_271), 
	.B(n_243), 
	.A(n_265));
   NO2X1 p0862D (.Q(n_270), 
	.B(n_264), 
	.A(n_244));
   NA2X2 p0823D (.Q(n_269), 
	.B(n_242), 
	.A(n_266));
   AN22X0 p0987D (.Q(n_268), 
	.D(n_231), 
	.C(n_241), 
	.B(n_179), 
	.A(n_256));
   NA2X2 p0835D (.Q(n_267), 
	.B(n_181), 
	.A(n_256));
   NA2X1 p0800D5129 (.Q(n_266), 
	.B(A[3]), 
	.A(n_256));
   NA2X0 p0651DT5130 (.Q(n_265), 
	.B(n_184), 
	.A(n_256));
   NO2I1X1 p0810D (.Q(n_264), 
	.B(n_255), 
	.AN(n_184));
   INX1 Fp0754D (.Q(n_262), 
	.A(n_263));
   NA2X4 p0754D5131 (.Q(n_263), 
	.B(n_255), 
	.A(n_257));
   NA2X0 p1460D (.Q(n_261), 
	.B(n_159), 
	.A(n_256));
   INX0 Fp0655D (.Q(n_259), 
	.A(n_260));
   NA2X4 p0655D (.Q(n_260), 
	.B(QUOTIENT[3]), 
	.A(n_240));
   INX2 Fp0663D (.Q(n_257), 
	.A(QUOTIENT[3]));
   NA2X4 p0663D (.Q(QUOTIENT[3]), 
	.B(n_170), 
	.A(n_252));
   NA2X4 p0581DT (.Q(n_255), 
	.B(n_165), 
	.A(n_254));
   NO2I1X4 p0794D (.Q(n_256), 
	.B(n_253), 
	.AN(n_165));
   NA2X2 p0585DT (.Q(n_254), 
	.B(n_175), 
	.A(n_250));
   NO2I1X2 p0791D5132 (.Q(n_253), 
	.B(n_249), 
	.AN(n_175));
   NA2X2 p0652D (.Q(n_252), 
	.B(n_178), 
	.A(n_251));
   ON21X1 p0692D (.Q(n_251), 
	.C(n_196), 
	.B(n_195), 
	.A(n_239));
   ON21X1 p0640DT (.Q(n_250), 
	.C(n_191), 
	.B(n_190), 
	.A(n_238));
   NO2I1X2 p0790D (.Q(n_249), 
	.B(n_246), 
	.AN(n_191));
   EO2X0 p1123D (.Q(n_248), 
	.B(n_203), 
	.A(n_239));
   EO2X0 p1037D (.Q(n_247), 
	.B(n_201), 
	.A(n_238));
   NO2X2 p0773D (.Q(n_246), 
	.B(n_190), 
	.A(n_238));
   NA2X1 p0831D (.Q(n_245), 
	.B(n_229), 
	.A(n_241));
   INX1 Fp0778D (.Q(n_244), 
	.A(n_243));
   NA2X1 p0778D (.Q(n_243), 
	.B(n_226), 
	.A(n_241));
   NA2X4 p0801D (.Q(n_242), 
	.B(n_98), 
	.A(n_241));
   NA2X2 p0559DT (.Q(n_240), 
	.B(n_174), 
	.A(n_233));
   NO2I1X2 p0765D (.Q(n_241), 
	.B(n_232), 
	.AN(n_174));
   NO2I1X4 p0709D (.Q(n_239), 
	.B(n_235), 
	.AN(n_194));
   NO2I1X2 p0776D (.Q(n_238), 
	.B(n_234), 
	.AN(n_197));
   EO2X0 p1065D (.Q(n_237), 
	.B(n_204), 
	.A(n_213));
   EO2X0 p1068D (.Q(n_236), 
	.B(n_202), 
	.A(n_212));
   NO2X2 p0711D (.Q(n_235), 
	.B(n_192), 
	.A(n_213));
   NO2X2 p0771D (.Q(n_234), 
	.B(n_189), 
	.A(n_212));
   ON21X1 p0643DT (.Q(n_233), 
	.C(n_199), 
	.B(n_186), 
	.A(n_227));
   NO2I1X2 p0752D5133 (.Q(n_232), 
	.B(n_230), 
	.AN(n_199));
   EN2X0 p0964D (.Q(n_231), 
	.B(n_208), 
	.A(n_228));
   NO2X2 p0742D (.Q(n_230), 
	.B(n_186), 
	.A(n_227));
   EN2X0 p0837D5134 (.Q(n_229), 
	.B(n_209), 
	.A(n_219));
   NO2X1 p0960D (.Q(n_228), 
	.B(n_216), 
	.A(n_218));
   NO2X4 p0724D (.Q(n_227), 
	.B(n_222), 
	.A(n_218));
   EO2X1 p0835D5135 (.Q(n_226), 
	.B(n_81), 
	.A(n_214));
   NO2X0 p0922DT (.Q(n_225), 
	.B(n_220), 
	.A(n_221));
   OR2X1 p1018D (.Q(n_224), 
	.B(n_220), 
	.A(n_221));
   EN2X0 p0961D (.Q(n_223), 
	.B(n_61), 
	.A(n_210));
   NO2I1X2 p0703D (.Q(n_222), 
	.B(n_215), 
	.AN(n_81));
   NO2X1 p1018D5136 (.Q(n_221), 
	.B(n_23), 
	.A(n_211));
   AND2X1 p0805D5137 (.Q(n_220), 
	.B(n_23), 
	.A(n_211));
   AN21X0 p0818D5138 (.Q(n_219), 
	.C(n_205), 
	.B(n_81), 
	.A(n_206));
   NA2X1 p0780D5139 (.Q(n_218), 
	.B(n_193), 
	.A(n_217));
   NA2X1 p0786D (.Q(n_217), 
	.B(n_185), 
	.A(n_205));
   INX0 Fp0705D (.Q(n_216), 
	.A(n_215));
   NA2X1 p0706D (.Q(n_215), 
	.B(n_185), 
	.A(n_206));
   NO2X1 p0866D5140 (.Q(n_214), 
	.B(n_205), 
	.A(n_207));
   NO2I1X2 p0726D (.Q(n_213), 
	.B(n_200), 
	.AN(n_62));
   NO2I1X2 p0788D (.Q(n_212), 
	.B(n_198), 
	.AN(n_86));
   MU2IX1 p0874D (.S(n_184), 
	.Q(n_211), 
	.IN1(n_5), 
	.IN0(B[1]));
   MU2IX1 p0955D (.S(n_184), 
	.Q(n_210), 
	.IN1(B[2]), 
	.IN0(n_1));
   AND2X0 p0819D (.Q(n_209), 
	.B(n_185), 
	.A(n_193));
   NO2I1X0 p0978D (.Q(n_208), 
	.B(n_186), 
	.AN(n_187));
   INX0 Fp0724D (.Q(n_207), 
	.A(n_206));
   NA2X4 p0724D5141 (.Q(n_206), 
	.B(n_183), 
	.A(n_74));
   NO2I1X1 p0747D (.Q(n_205), 
	.B(n_183), 
	.AN(n_73));
   NO2I1X0 p1001D (.Q(n_204), 
	.B(n_192), 
	.AN(n_194));
   NO2I1X0 p1130D5142 (.Q(n_203), 
	.B(n_195), 
	.AN(n_196));
   NO2I1X1 p1003D (.Q(n_202), 
	.B(n_189), 
	.AN(n_197));
   NO2I1X0 p1044D (.Q(n_201), 
	.B(n_190), 
	.AN(n_191));
   NO2I1X2 p0721D (.Q(n_200), 
	.B(n_183), 
	.AN(n_63));
   AN21X1 p1090D (.Q(n_199), 
	.C(n_188), 
	.B(n_159), 
	.A(n_105));
   NO2I1X1 p0793D5143 (.Q(n_198), 
	.B(n_183), 
	.AN(n_85));
   NA2X1 p0918D (.Q(n_197), 
	.B(n_181), 
	.A(n_9));
   NA2X0 p0833D (.Q(n_196), 
	.B(n_179), 
	.A(n_9));
   NO2X2 p1010D (.Q(n_195), 
	.B(n_179), 
	.A(n_9));
   NA2X1 p0851D (.Q(n_194), 
	.B(n_181), 
	.A(n_1));
   NA2X1 p0786D5144 (.Q(n_193), 
	.B(n_181), 
	.A(n_88));
   NO2X1 p0816D5145 (.Q(n_192), 
	.B(n_181), 
	.A(n_1));
   NA2X0 p0894D (.Q(n_191), 
	.B(n_179), 
	.A(n_6));
   NO2X1 p0939D (.Q(n_190), 
	.B(n_179), 
	.A(n_6));
   NO2X2 p0798D (.Q(n_189), 
	.B(n_181), 
	.A(n_9));
   INX1 Fp0817D (.Q(n_188), 
	.A(n_187));
   NA2X1 p0789D (.Q(n_187), 
	.B(n_179), 
	.A(FE_OFN266_n_99));
   NO2X1 p1030D (.Q(n_186), 
	.B(n_179), 
	.A(FE_OFN266_n_99));
   NA2X4 p0802D (.Q(n_185), 
	.B(n_180), 
	.A(n_87));
   INX0 Fp0664D5146 (.Q(n_184), 
	.A(n_183));
   NO2X4 p0663D5148 (.Q(n_183), 
	.B(n_176), 
	.A(n_182));
   NO2I1X2 p0680D (.Q(n_182), 
	.B(n_177), 
	.AN(A[4]));
   NA3X4 p0783DT (.Q(n_181), 
	.C(n_167), 
	.B(n_163), 
	.A(n_157));
   NO2I1X2 p0810D5149 (.Q(n_180), 
	.B(n_173), 
	.AN(n_167));
   NA2I1X2 p1050D (.Q(n_178), 
	.B(n_165), 
	.AN(n_55));
   NO2I1X4 p0680D5151 (.Q(n_177), 
	.B(n_168), 
	.AN(B[0]));
   NO2I1X2 p0734D (.Q(n_176), 
	.B(n_168), 
	.AN(n_27));
   AO21X1 p0844D (.Q(n_175), 
	.C(n_45), 
	.B(n_159), 
	.A(n_28));
   OA21X0 p0824D (.Q(n_174), 
	.C(n_112), 
	.B(n_159), 
	.A(n_105));
   NA2X1 p0797D (.Q(n_173), 
	.B(n_163), 
	.A(n_157));
   NA2X0 p1160D (.Q(n_170), 
	.B(n_159), 
	.A(n_55));
   INX0 Fp0670D (.Q(QUOTIENT[4]), 
	.A(n_168));
   NA2X4 p0652D5153 (.Q(n_168), 
	.B(n_149), 
	.A(n_161));
   NA2X4 p0744D (.Q(n_167), 
	.B(n_34), 
	.A(n_162));
   NA2X1 p0956D5154 (.Q(n_166), 
	.B(n_142), 
	.A(n_162));
   NA2X1 p0896D (.Q(n_165), 
	.B(n_159), 
	.A(n_45));
   NA3X1 p0776D5156 (.Q(n_163), 
	.C(n_56), 
	.B(n_153), 
	.A(n_149));
   NA2X2 p0610DT (.Q(n_161), 
	.B(n_136), 
	.A(QUOTIENT[5]));
   NO2I1X1 p0766D (.Q(n_162), 
	.B(n_153), 
	.AN(n_136));
   NA2X2 p0812D5157 (.Q(n_160), 
	.B(n_124), 
	.A(n_154));
   NO2I1X1 p0800D5158 (.Q(n_159), 
	.B(n_155), 
	.AN(n_126));
   NO2X2 p0802D5159 (.Q(n_158), 
	.B(n_143), 
	.A(QUOTIENT[5]));
   NO2X2 p0739D (.Q(n_157), 
	.B(n_145), 
	.A(n_156));
   NO2I1X1 p0754D5160 (.Q(n_156), 
	.B(n_149), 
	.AN(A[5]));
   NO2X1 p0794D5161 (.Q(n_155), 
	.B(n_146), 
	.A(n_150));
   NA2X1 p0811D (.Q(n_154), 
	.B(n_147), 
	.A(n_149));
   ON22X4 p0608DT (.Q(QUOTIENT[5]), 
	.D(n_133), 
	.C(n_13), 
	.B(n_125), 
	.A(n_144));
   NO2X1 p0755D5162 (.Q(n_153), 
	.B(n_141), 
	.A(n_151));
   NO2I1X0 p0788D5163 (.Q(n_151), 
	.B(n_144), 
	.AN(n_126));
   INX1 Fp0685D (.Q(n_150), 
	.A(n_149));
   NO2X2 p0685D (.Q(n_149), 
	.B(n_139), 
	.A(n_148));
   NA2X2 p0670D (.Q(n_148), 
	.B(n_137), 
	.A(n_55));
   OR2X1 p0846D (.Q(n_147), 
	.B(n_136), 
	.A(n_74));
   NO2X0 p1038D (.Q(n_146), 
	.B(n_136), 
	.A(n_87));
   NO2X0 p1067D (.Q(n_145), 
	.B(n_89), 
	.A(n_136));
   NO2I1X2 p0678D (.Q(n_144), 
	.B(n_140), 
	.AN(n_71));
   EO2X1 p0850D5164 (.Q(n_143), 
	.B(n_51), 
	.A(n_131));
   EN3X0 p0804D5165 (.Q(n_142), 
	.C(n_29), 
	.B(n_124), 
	.A(n_5));
   NO2X0 p0844D5166 (.Q(n_141), 
	.B(n_133), 
	.A(n_13));
   NO2I1X2 p0678D5167 (.Q(n_140), 
	.B(n_133), 
	.AN(n_9));
   INX1 Fp0713D (.Q(n_139), 
	.A(n_138));
   NA2X1 p0706D5168 (.Q(n_138), 
	.B(n_135), 
	.A(B[3]));
   NA2X1 p0669D (.Q(n_137), 
	.B(n_125), 
	.A(n_134));
   NA2X2 p0797D5169 (.Q(n_136), 
	.B(n_129), 
	.A(n_132));
   NA2X1 p0704D (.Q(n_135), 
	.B(n_95), 
	.A(n_128));
   NA2X1 p0683D5170 (.Q(n_134), 
	.B(n_101), 
	.A(n_128));
   NA2X2 p0638D (.Q(n_133), 
	.B(n_80), 
	.A(n_127));
   NO2X1 p0812D5171 (.Q(n_132), 
	.B(n_116), 
	.A(n_130));
   MU2IX1 p0806D (.S(n_1), 
	.Q(n_131), 
	.IN1(n_123), 
	.IN0(n_124));
   NO2X1 p0779D (.Q(n_130), 
	.B(n_126), 
	.A(n_88));
   NA2X0 p0890D (.Q(n_129), 
	.B(n_123), 
	.A(n_74));
   ON21X1 p0702D (.Q(n_128), 
	.C(n_123), 
	.B(n_50), 
	.A(B[2]));
   NA2X1 p0667D (.Q(n_127), 
	.B(n_66), 
	.A(n_123));
   NO2X4 p0546DT (.Q(n_123), 
	.B(n_121), 
	.A(n_103));
   NA2X1 p0757D5173 (.Q(n_124), 
	.B(n_104), 
	.A(n_122));
   INX0 Fp0588D (.Q(n_122), 
	.A(n_121));
   NO2X2 p0588D (.Q(n_121), 
	.B(n_37), 
	.A(n_117));
   INX0 Fp0723D (.Q(n_120), 
	.A(n_119));
   ON21X0 p7076A (.Q(QUOTIENT[6]), 
	.C(n_117), 
	.B(QUOTIENT[7]), 
	.A(n_93));
   NA2X4 p0600D (.Q(n_117), 
	.B(n_72), 
	.A(n_115));
   NA2X1 p0811D5175 (.Q(n_116), 
	.B(n_96), 
	.A(n_113));
   NO2X1 p0640D (.Q(n_115), 
	.B(n_25), 
	.A(n_114));
   NA3X1 p9066A (.Q(n_114), 
	.C(n_105), 
	.B(n_107), 
	.A(n_112));
   AND3X0 p9638A (.Q(n_113), 
	.C(FE_OFN266_n_99), 
	.B(n_105), 
	.A(n_112));
   NO2X2 p8777A (.Q(n_112), 
	.B(n_110), 
	.A(n_111));
   NA2X1 p8772A (.Q(n_111), 
	.B(n_108), 
	.A(n_109));
   EO2X0 p8576A (.Q(n_110), 
	.B(n_28), 
	.A(n_106));
   AO31X0 p8299A (.Q(n_109), 
	.D(n_28), 
	.C(n_100), 
	.B(n_3), 
	.A(n_4));
   EN2X0 p8611A (.Q(n_108), 
	.B(n_19), 
	.A(n_100));
   AND2X2 p9309A (.Q(n_107), 
	.B(n_88), 
	.A(FE_OFN266_n_99));
   AN21X1 p8539A (.Q(n_106), 
	.C(n_24), 
	.B(B[5]), 
	.A(n_90));
   EO2X2 p8800D (.Q(n_105), 
	.B(n_36), 
	.A(n_90));
   INX0 Fp0573D (.Q(n_104), 
	.A(n_103));
   NO2I1X2 p0572D (.Q(n_103), 
	.B(n_92), 
	.AN(A[6]));
   NA2X0 p0759D (.Q(n_102), 
	.B(A[7]), 
	.A(n_93));
   NO2I1X0 p0679D (.Q(n_101), 
	.B(n_94), 
	.AN(n_9));
   AN211X0 p8170A (.Q(n_100), 
	.D(n_24), 
	.C(n_22), 
	.B(n_38), 
	.A(n_76));
   EO2X0 p8657A (.Q(n_99), 
	.B(n_46), 
	.A(n_76));
   EN3X0 p2064A (.Q(n_98), 
	.C(A[3]), 
	.B(n_17), 
	.A(n_53));
   EN3X0 p4720A (.Q(n_97), 
	.C(A[1]), 
	.B(n_32), 
	.A(n_53));
   NA2X1 p0835D5176 (.Q(n_96), 
	.B(n_68), 
	.A(n_82));
   INX0 Fp0680D (.Q(n_95), 
	.A(n_94));
   NO2I1X2 p0674D (.Q(n_94), 
	.B(n_51), 
	.AN(B[2]));
   INX1 Fp0559D5177 (.Q(n_93), 
	.A(n_92));
   NO2X2 p0565D (.Q(n_92), 
	.B(n_78), 
	.A(n_59));
   AN211X0 p7111A (.Q(QUOTIENT[7]), 
	.D(n_71), 
	.C(B[1]), 
	.B(n_7), 
	.A(B[0]));
   AO311X2 p7756A (.Q(n_90), 
	.E(n_12), 
	.D(n_22), 
	.C(n_69), 
	.B(n_13), 
	.A(n_31));
   EO2X0 p1152D5178 (.Q(n_89), 
	.B(n_27), 
	.A(n_68));
   INX12 Fp9260A5179 (.Q(n_88), 
	.A(n_87));
   EN2X0 p9034A (.Q(n_87), 
	.B(n_43), 
	.A(n_69));
   NA2X0 p1626A (.Q(n_86), 
	.B(n_61), 
	.A(n_1));
   OR2X0 p1089D (.Q(n_85), 
	.B(n_61), 
	.A(n_1));
   NA2I1X0 p2993A (.Q(n_84), 
	.B(B[2]), 
	.AN(n_60));
   NO2I1X0 p3156A (.Q(n_83), 
	.B(B[2]), 
	.AN(n_60));
   ON21X0 p0835D5182 (.Q(n_82), 
	.C(n_26), 
	.B(A[5]), 
	.A(n_53));
   ON21X0 p1771A (.Q(n_81), 
	.C(n_48), 
	.B(n_49), 
	.A(FE_OFN259_n_54));
   NO2I1X0 p0943D (.Q(n_80), 
	.B(n_70), 
	.AN(n_55));
   ON21X0 p3814A (.Q(n_79), 
	.C(n_44), 
	.B(n_47), 
	.A(FE_OFN259_n_54));
   AO211X0 p7280A (.Q(n_76), 
	.D(n_12), 
	.C(n_11), 
	.B(n_13), 
	.A(n_52));
   MU2IX1 p0800D5183 (.S(A[7]), 
	.Q(n_75), 
	.IN1(n_53), 
	.IN0(FE_OFN259_n_54));
   INX0 Fp11017A (.Q(n_73), 
	.A(n_74));
   EN2X0 p10756A (.Q(n_74), 
	.B(n_52), 
	.A(n_39));
   NA2X1 p0688D (.Q(n_72), 
	.B(n_7), 
	.A(FE_OFN259_n_54));
   NA2I1X0 p9626A (.Q(n_71), 
	.B(n_55), 
	.AN(n_13));
   NO2I1X0 p0911D (.Q(n_70), 
	.B(A[5]), 
	.AN(n_52));
   OR2X0 p7218A (.Q(n_69), 
	.B(n_11), 
	.A(n_52));
   NA2X0 p1023D (.Q(n_68), 
	.B(A[5]), 
	.A(n_53));
   NA2X0 p3766A (.Q(n_67), 
	.B(n_30), 
	.A(B[1]));
   INX0 Fp0772D (.Q(n_66), 
	.A(n_65));
   NO2I1X1 p0772D (.Q(n_65), 
	.B(n_29), 
	.AN(n_5));
   NO2X0 p3783A (.Q(n_64), 
	.B(n_30), 
	.A(B[1]));
   NA2X0 p1918A (.Q(n_63), 
	.B(n_23), 
	.A(B[1]));
   OR2X0 p1886A (.Q(n_62), 
	.B(n_23), 
	.A(B[1]));
   ON21X0 p1051D (.Q(n_61), 
	.C(n_48), 
	.B(n_49), 
	.A(B[1]));
   ON21X0 p2994A (.Q(n_60), 
	.C(n_44), 
	.B(n_47), 
	.A(B[1]));
   AND2X1 p0549D (.Q(n_59), 
	.B(n_18), 
	.A(n_25));
   EN3X0 p2136A (.Q(n_58), 
	.C(A[3]), 
	.B(n_17), 
	.A(n_5));
   EN3X0 p4968A (.Q(n_57), 
	.C(A[1]), 
	.B(n_32), 
	.A(n_5));
   EO2X0 p0894D5184 (.Q(n_56), 
	.B(n_27), 
	.A(n_40));
   AND2X0 p9481A (.Q(n_55), 
	.B(n_6), 
	.A(n_45));
   INX1 Fp10351A5188 (.Q(n_53), 
	.A(FE_OFN259_n_54));
   HAX1 p7075A (.S(n_54), 
	.CO(n_52), 
	.B(B[1]), 
	.A(B[0]));
   NO2X1 p0563DT (.Q(n_50), 
	.B(n_21), 
	.A(n_41));
   NA2X1 p0723D (.Q(n_51), 
	.B(n_20), 
	.A(n_42));
   NO2I1X0 p0939D5189 (.Q(n_49), 
	.B(A[3]), 
	.AN(n_17));
   OR2X0 p0839D5190 (.Q(n_48), 
	.B(n_2), 
	.A(n_17));
   NO2I1X0 p2435A (.Q(n_47), 
	.B(A[1]), 
	.AN(n_32));
   NA2I1X0 p8566A (.Q(n_46), 
	.B(n_31), 
	.AN(n_22));
   AND2X0 p9084A (.Q(n_45), 
	.B(n_3), 
	.A(n_28));
   NA2I1X0 p2681A (.Q(n_44), 
	.B(A[1]), 
	.AN(n_32));
   NA2I1X0 p8587A (.Q(n_43), 
	.B(n_13), 
	.AN(n_12));
   NA2X1 p0539DT (.Q(n_42), 
	.B(n_26), 
	.A(n_16));
   NO2X0 p0795D5191 (.Q(n_41), 
	.B(n_27), 
	.A(n_15));
   NA2X0 p0836D (.Q(n_40), 
	.B(n_20), 
	.A(n_16));
   AO21X0 p10269A (.Q(n_39), 
	.C(n_11), 
	.B(n_1), 
	.A(n_5));
   ON21X0 p8370A (.Q(n_38), 
	.C(n_6), 
	.B(n_3), 
	.A(n_9));
   AN21X1 p0692D5192 (.Q(n_37), 
	.C(n_25), 
	.B(A[6]), 
	.A(n_10));
   AO21X0 p8782A (.Q(n_36), 
	.C(n_24), 
	.B(n_3), 
	.A(n_6));
   AN21X0 p6142A (.Q(n_35), 
	.C(n_30), 
	.B(A[1]), 
	.A(n_10));
   AO21X0 p1657A (.Q(n_34), 
	.C(n_29), 
	.B(A[5]), 
	.A(n_10));
   AN21X0 p3252A (.Q(n_33), 
	.C(n_23), 
	.B(A[3]), 
	.A(n_10));
   NO2X0 p2284A (.Q(n_32), 
	.B(A[0]), 
	.A(n_10));
   NA2X0 p7700A (.Q(n_31), 
	.B(n_6), 
	.A(n_9));
   NO2X0 p3669A (.Q(n_30), 
	.B(A[1]), 
	.A(n_10));
   NO2I1X1 p0790D5193 (.Q(n_29), 
	.B(A[5]), 
	.AN(B[0]));
   NO2X1 p8909A (.Q(n_28), 
	.B(B[7]), 
	.A(B[6]));
   INX1 Fp0708D5196 (.Q(n_26), 
	.A(n_27));
   NO2I1X4 p0708D (.Q(n_27), 
	.B(A[4]), 
	.AN(B[0]));
   NO2I1X4 p0544D (.Q(n_25), 
	.B(A[6]), 
	.AN(B[0]));
   NO2X0 p8454A (.Q(n_24), 
	.B(n_3), 
	.A(n_6));
   NO2X0 p1715A (.Q(n_23), 
	.B(A[3]), 
	.A(n_10));
   NO2X0 p7960A (.Q(n_22), 
	.B(n_6), 
	.A(n_9));
   INX0 Fp0826D (.Q(n_21), 
	.A(n_20));
   NA2X0 p0823D5197 (.Q(n_20), 
	.B(A[5]), 
	.A(n_5));
   NO2X0 p9298A (.Q(n_19), 
	.B(B[5]), 
	.A(B[6]));
   NA2X1 p0561D (.Q(n_18), 
	.B(A[7]), 
	.A(n_5));
   NO2I1X1 p0830D (.Q(n_17), 
	.B(A[2]), 
	.AN(B[0]));
   NA2X1 p0634DT (.Q(n_16), 
	.B(n_8), 
	.A(B[1]));
   NO2X0 p0843D (.Q(n_15), 
	.B(A[5]), 
	.A(n_5));
   NO2X4 p0522D (.Q(n_14), 
	.B(A[7]), 
	.A(n_5));
   NA2X4 p6980A (.Q(n_13), 
	.B(n_1), 
	.A(n_9));
   NO2X0 p7508A (.Q(n_12), 
	.B(n_1), 
	.A(n_9));
   NO2X1 p7266A (.Q(n_11), 
	.B(n_5), 
	.A(n_1));
   INX0 Fp6913A (.Q(n_10), 
	.A(B[0]));
   INX3 Fp6890A5217 (.Q(n_9), 
	.A(B[3]));
   INX1 Fp0716D (.Q(n_8), 
	.A(A[5]));
   INX1 Fp0536D5222 (.Q(n_7), 
	.A(A[7]));
   INX1 Fp7691A5226 (.Q(n_6), 
	.A(B[4]));
   INX1 Fp6911A5235 (.Q(n_5), 
	.A(B[1]));
   INX0 Fp8960A5238 (.Q(n_4), 
	.A(B[7]));
   INX1 Fp8265A5244 (.Q(n_3), 
	.A(B[5]));
   INX0 Fp0802D (.Q(n_2), 
	.A(A[3]));
   INX3 Fp6833A5255 (.Q(n_1), 
	.A(B[2]));
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
   wire FE_RN_78_0;
   wire FE_RN_77_0;
   wire FE_OFN294_alu_fsm_result_temp_6_;
   wire FE_OFN293_alu_fsm_result_temp_6_;
   wire FE_OFN290_alu_fsm_result_temp_8_;
   wire FE_OFN289_alu_fsm_result_temp_8_;
   wire FE_OFN288_alu_fsm_result_temp_9_;
   wire FE_OFN287_alu_fsm_result_temp_9_;
   wire FE_OFN286_alu_fsm_result_temp_10_;
   wire FE_OFN285_alu_fsm_result_temp_10_;
   wire FE_OFN282_alu_fsm_result_temp_11_;
   wire FE_OFN281_alu_fsm_result_temp_11_;
   wire FE_OFN279_alu_fsm_result_temp_14_;
   wire FE_OFN278_alu_fsm_result_temp_14_;
   wire FE_OFN277_alu_fsm_result_temp_15_;
   wire FE_OFN276_alu_fsm_result_temp_15_;
   wire FE_OFN275_alu_fsm_result_temp_13_;
   wire FE_OFN274_alu_fsm_result_temp_13_;
   wire FE_OFN273_alu_fsm_result_temp_12_;
   wire FE_OFN272_alu_fsm_result_temp_12_;
   wire FE_OFN235_fsm_alu_operand2_2_;
   wire FE_OFN234_fsm_alu_operand2_2_;
   wire FE_OFN229_fsm_alu_operand2_0_;
   wire UNCONNECTED;
   wire UNCONNECTED0;
   wire UNCONNECTED1;
   wire UNCONNECTED2;
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
   wire n_349;
   wire n_351;

   AO221X4 FE_RC_121_0 (.Q(alu_result_o[5]), 
	.E(n_252), 
	.D(n_345), 
	.C(n_97), 
	.B(n_281), 
	.A(n_124));
   OR6X1 FE_RC_117_0 (.Q(FE_RN_78_0), 
	.F(n_292), 
	.E(n_298), 
	.D(n_306), 
	.C(n_293), 
	.B(n_307), 
	.A(n_312));
   OR5X1 FE_RC_116_0 (.Q(FE_RN_77_0), 
	.E(n_294), 
	.D(n_308), 
	.C(n_311), 
	.B(n_310), 
	.A(FE_RN_78_0));
   OR5X1 FE_RC_115_0 (.Q(n_198), 
	.E(n_309), 
	.D(n_297), 
	.C(n_295), 
	.B(n_296), 
	.A(FE_RN_77_0));
   INX4 FE_OFC294_alu_fsm_result_temp_6_ (.Q(alu_result_o[6]), 
	.A(FE_OFN294_alu_fsm_result_temp_6_));
   INX3 FE_OFC293_alu_fsm_result_temp_6_ (.Q(FE_OFN294_alu_fsm_result_temp_6_), 
	.A(FE_OFN293_alu_fsm_result_temp_6_));
   INX2 FE_OFC290_alu_fsm_result_temp_8_ (.Q(alu_result_o[8]), 
	.A(FE_OFN290_alu_fsm_result_temp_8_));
   INX1 FE_OFC289_alu_fsm_result_temp_8_ (.Q(FE_OFN290_alu_fsm_result_temp_8_), 
	.A(FE_OFN289_alu_fsm_result_temp_8_));
   INX1 FE_OFC288_alu_fsm_result_temp_9_ (.Q(alu_result_o[9]), 
	.A(FE_OFN288_alu_fsm_result_temp_9_));
   INX1 FE_OFC287_alu_fsm_result_temp_9_ (.Q(FE_OFN288_alu_fsm_result_temp_9_), 
	.A(FE_OFN287_alu_fsm_result_temp_9_));
   INX1 FE_OFC286_alu_fsm_result_temp_10_ (.Q(alu_result_o[10]), 
	.A(FE_OFN286_alu_fsm_result_temp_10_));
   INX1 FE_OFC285_alu_fsm_result_temp_10_ (.Q(FE_OFN286_alu_fsm_result_temp_10_), 
	.A(FE_OFN285_alu_fsm_result_temp_10_));
   INX1 FE_OFC282_alu_fsm_result_temp_11_ (.Q(alu_result_o[11]), 
	.A(FE_OFN282_alu_fsm_result_temp_11_));
   INX1 FE_OFC281_alu_fsm_result_temp_11_ (.Q(FE_OFN282_alu_fsm_result_temp_11_), 
	.A(FE_OFN281_alu_fsm_result_temp_11_));
   INX3 FE_OFC279_alu_fsm_result_temp_14_ (.Q(alu_result_o[14]), 
	.A(FE_OFN279_alu_fsm_result_temp_14_));
   INX1 FE_OFC278_alu_fsm_result_temp_14_ (.Q(FE_OFN279_alu_fsm_result_temp_14_), 
	.A(FE_OFN278_alu_fsm_result_temp_14_));
   INX1 FE_OFC277_alu_fsm_result_temp_15_ (.Q(alu_result_o[15]), 
	.A(FE_OFN277_alu_fsm_result_temp_15_));
   INX1 FE_OFC276_alu_fsm_result_temp_15_ (.Q(FE_OFN277_alu_fsm_result_temp_15_), 
	.A(FE_OFN276_alu_fsm_result_temp_15_));
   INX1 FE_OFC275_alu_fsm_result_temp_13_ (.Q(alu_result_o[13]), 
	.A(FE_OFN275_alu_fsm_result_temp_13_));
   INX1 FE_OFC274_alu_fsm_result_temp_13_ (.Q(FE_OFN275_alu_fsm_result_temp_13_), 
	.A(FE_OFN274_alu_fsm_result_temp_13_));
   INX1 FE_OFC273_alu_fsm_result_temp_12_ (.Q(alu_result_o[12]), 
	.A(FE_OFN273_alu_fsm_result_temp_12_));
   INX1 FE_OFC272_alu_fsm_result_temp_12_ (.Q(FE_OFN273_alu_fsm_result_temp_12_), 
	.A(FE_OFN272_alu_fsm_result_temp_12_));
   INX4 FE_OFC235_fsm_alu_operand2_2_ (.Q(FE_OFN235_fsm_alu_operand2_2_), 
	.A(alu_operand2_i[2]));
   INX1 FE_OFC234_fsm_alu_operand2_2_ (.Q(FE_OFN234_fsm_alu_operand2_2_), 
	.A(alu_operand2_i[2]));
   BUX4 FE_OFC229_fsm_alu_operand2_0_ (.Q(FE_OFN229_fsm_alu_operand2_0_), 
	.A(alu_operand2_i[0]));
   csa_tree csa_tree_mul_309_43 (.in_0({ alu_operand1_i[7],
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
		FE_OFN234_fsm_alu_operand2_2_,
		alu_operand2_i[1],
		FE_OFN229_fsm_alu_operand2_0_ }), 
	.out_0({ UNCONNECTED,
		n_306,
		n_307,
		n_308,
		n_309,
		n_310,
		n_311,
		n_312,
		n_313,
		n_314,
		n_315,
		n_316,
		n_317,
		n_318,
		n_319,
		n_320 }), 
	.out_1({ UNCONNECTED0,
		n_292,
		n_293,
		n_294,
		n_295,
		n_296,
		n_297,
		n_298,
		n_299,
		n_300,
		n_301,
		n_302,
		n_303,
		n_304,
		n_305,
		UNCONNECTED1 }), 
	.FE_OFN235_fsm_alu_operand2_2_(FE_OFN235_fsm_alu_operand2_2_));
   add_unsigned final_adder_mul_309_43 (.A({ 1'b0,
		n_306,
		n_307,
		n_308,
		n_309,
		n_310,
		n_311,
		n_312,
		n_313,
		n_314,
		n_315,
		n_316,
		n_317,
		n_318,
		n_319,
		1'b0 }), 
	.B({ 1'b0,
		n_292,
		n_293,
		n_294,
		n_295,
		n_296,
		n_297,
		n_298,
		n_299,
		n_300,
		n_301,
		n_302,
		n_303,
		n_304,
		n_305,
		1'b0 }), 
	.Z({ n_335,
		n_336,
		n_337,
		n_338,
		n_339,
		n_340,
		n_341,
		n_342,
		n_343,
		n_344,
		n_345,
		n_346,
		n_347,
		n_349,
		n_351,
		UNCONNECTED2 }));
   shared_div_rem_unsigned_284 rem_338_53_Y_div_337_53 (.A({ alu_operand1_i[7],
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
		FE_OFN235_fsm_alu_operand2_2_,
		alu_operand2_i[1],
		FE_OFN229_fsm_alu_operand2_0_ }), 
	.QUOTIENT({ n_291,
		n_290,
		n_289,
		n_288,
		n_287,
		n_286,
		n_285,
		n_284 }), 
	.REMAINDER({ n_283,
		n_282,
		n_281,
		n_280,
		n_279,
		n_278,
		n_277,
		n_276 }), 
	.FE_PT1_n_4(n_4));
   ON221X4 p4108A (.Q(alu_ov_o), 
	.E(n_258), 
	.D(n_250), 
	.C(n_114), 
	.B(n_220), 
	.A(n_210));
   AO221X1 p1401D (.Q(alu_result_o[7]), 
	.E(n_257), 
	.D(n_343), 
	.C(n_97), 
	.B(n_283), 
	.A(n_124));
   AO221X4 p3913A (.Q(alu_cy_o), 
	.E(n_244), 
	.D(n_246), 
	.C(n_115), 
	.B(n_256), 
	.A(n_144));
   AN321X0 p3841A (.Q(n_258), 
	.F(n_127), 
	.E(n_255), 
	.D(n_144), 
	.C(alu_ov_i), 
	.B(n_123), 
	.A(n_156));
   AO221X4 p1096D (.Q(FE_OFN293_alu_fsm_result_temp_6_), 
	.E(n_254), 
	.D(n_344), 
	.C(n_97), 
	.B(n_282), 
	.A(n_124));
   AO221X0 p3810A (.Q(n_257), 
	.E(n_251), 
	.D(n_242), 
	.C(n_115), 
	.B(n_253), 
	.A(n_117));
   ON21X0 p4004A (.Q(n_256), 
	.C(n_9), 
	.B(n_24), 
	.A(n_249));
   MU2IX0 p3906A (.S(n_249), 
	.Q(n_255), 
	.IN1(n_9), 
	.IN0(n_25));
   AO221X0 p4097A (.Q(n_254), 
	.E(n_243), 
	.D(n_225), 
	.C(n_66), 
	.B(n_247), 
	.A(n_117));
   EN2X0 p3703A (.Q(n_253), 
	.B(n_70), 
	.A(n_249));
   AO221X2 p1107D (.Q(alu_result_o[4]), 
	.E(n_245), 
	.D(n_97), 
	.C(n_346), 
	.B(n_280), 
	.A(n_124));
   ON21X0 p4897A (.Q(n_252), 
	.C(n_248), 
	.B(n_60), 
	.A(n_234));
   ON221X0 p3962A (.Q(n_251), 
	.E(n_223), 
	.D(n_233), 
	.C(n_125), 
	.B(n_103), 
	.A(n_222));
   EO2X0 p4286A (.Q(n_250), 
	.B(n_230), 
	.A(n_246));
   AO221X2 p1104D (.Q(alu_result_o[3]), 
	.E(n_240), 
	.D(n_97), 
	.C(n_347), 
	.B(n_279), 
	.A(n_124));
   ON211X1 p1719D (.Q(alu_result_o[2]), 
	.D(n_239), 
	.C(n_176), 
	.B(n_123), 
	.A(n_6));
   AO211X1 p1019D (.Q(alu_result_o[1]), 
	.D(n_238), 
	.C(n_179), 
	.B(n_124), 
	.A(n_277));
   AN22X0 p3468A (.Q(n_249), 
	.D(alu_operand1_i[6]), 
	.C(alu_operand2_i[6]), 
	.B(n_38), 
	.A(n_235));
   AO221X4 p2680A (.Q(FE_OFN278_alu_fsm_result_temp_14_), 
	.E(n_241), 
	.D(n_290), 
	.C(n_124), 
	.B(n_336), 
	.A(n_97));
   AN21X0 p4736A (.Q(n_248), 
	.C(n_231), 
	.B(n_60), 
	.A(n_237));
   AO221X0 p2976A (.Q(FE_OFN274_alu_fsm_result_temp_13_), 
	.E(n_241), 
	.D(n_289), 
	.C(n_124), 
	.B(n_337), 
	.A(n_97));
   AO221X0 p2963A (.Q(FE_OFN272_alu_fsm_result_temp_12_), 
	.E(n_241), 
	.D(n_124), 
	.C(n_288), 
	.B(n_338), 
	.A(n_97));
   AO221X0 p3500A (.Q(FE_OFN285_alu_fsm_result_temp_10_), 
	.E(n_241), 
	.D(n_286), 
	.C(n_124), 
	.B(n_340), 
	.A(n_97));
   AO221X0 p1804D (.Q(FE_OFN287_alu_fsm_result_temp_9_), 
	.E(n_241), 
	.D(n_341), 
	.C(n_97), 
	.B(n_285), 
	.A(n_124));
   AO221X0 p1427D (.Q(FE_OFN289_alu_fsm_result_temp_8_), 
	.E(n_241), 
	.D(n_342), 
	.C(n_97), 
	.B(n_284), 
	.A(n_124));
   AO221X4 p2738A (.Q(FE_OFN276_alu_fsm_result_temp_15_), 
	.E(n_241), 
	.D(n_291), 
	.C(n_124), 
	.B(n_335), 
	.A(n_97));
   AO221X0 p3230A (.Q(FE_OFN281_alu_fsm_result_temp_11_), 
	.E(n_241), 
	.D(n_287), 
	.C(n_124), 
	.B(n_339), 
	.A(n_97));
   EO2X0 p3750A (.Q(n_247), 
	.B(n_66), 
	.A(n_235));
   AN21X0 p4025A (.Q(n_246), 
	.C(n_42), 
	.B(n_23), 
	.A(n_230));
   AO21X0 p4863A (.Q(n_245), 
	.C(n_236), 
	.B(n_68), 
	.A(n_214));
   ON211X0 p4278A (.Q(n_244), 
	.D(n_208), 
	.C(n_148), 
	.B(n_187), 
	.A(n_228));
   ON221X0 p4090A (.Q(n_243), 
	.E(n_227), 
	.D(n_204), 
	.C(n_125), 
	.B(n_224), 
	.A(n_66));
   EN2X0 p3989A (.Q(n_242), 
	.B(n_70), 
	.A(n_230));
   NO2X0 p4940A (.Q(n_241), 
	.B(n_228), 
	.A(n_103));
   ON21X0 p5270A (.Q(n_240), 
	.C(n_226), 
	.B(n_59), 
	.A(n_188));
   AN21X0 p5845A (.Q(n_239), 
	.C(n_229), 
	.B(n_117), 
	.A(n_159));
   ON211X0 p5469A (.Q(n_238), 
	.D(n_162), 
	.C(n_212), 
	.B(n_0), 
	.A(n_140));
   ON221X0 p4545A (.Q(n_237), 
	.E(n_232), 
	.D(n_103), 
	.C(n_154), 
	.B(n_182), 
	.A(n_114));
   ON221X0 p4609A (.Q(n_236), 
	.E(n_211), 
	.D(n_146), 
	.C(n_96), 
	.B(n_215), 
	.A(n_68));
   AO221X4 p1156D (.Q(alu_result_o[0]), 
	.E(n_221), 
	.D(n_110), 
	.C(n_168), 
	.B(n_276), 
	.A(n_124));
   AO22X1 p2966A (.Q(n_235), 
	.D(alu_operand1_i[5]), 
	.C(alu_operand2_i[5]), 
	.B(n_35), 
	.A(n_218));
   AN222X0 p4736A6925 (.Q(n_234), 
	.F(n_117), 
	.E(n_219), 
	.D(n_102), 
	.C(n_154), 
	.B(n_182), 
	.A(n_115));
   EN2X0 p4405A (.Q(n_233), 
	.B(alu_operand1_i[7]), 
	.A(n_201));
   NA2X0 p4432A (.Q(n_232), 
	.B(n_117), 
	.A(n_218));
   ON21X0 p4886A (.Q(n_231), 
	.C(n_216), 
	.B(n_125), 
	.A(n_202));
   ON21X4 p4027A (.Q(n_230), 
	.C(n_36), 
	.B(n_30), 
	.A(n_207));
   ON221X0 p5837A (.Q(n_229), 
	.E(n_213), 
	.D(n_142), 
	.C(n_53), 
	.B(n_103), 
	.A(n_112));
   AO21X0 p3958A (.Q(n_228), 
	.C(n_42), 
	.B(n_23), 
	.A(n_206));
   AN221X0 p3851A (.Q(n_227), 
	.E(n_199), 
	.D(n_122), 
	.C(n_209), 
	.B(n_121), 
	.A(alu_operand1_i[2]));
   AN21X0 p5092A (.Q(n_226), 
	.C(n_217), 
	.B(n_59), 
	.A(n_195));
   ON22X0 p4458A (.Q(n_225), 
	.D(n_180), 
	.C(n_103), 
	.B(n_114), 
	.A(n_207));
   AN22X0 p4003A (.Q(n_224), 
	.D(n_180), 
	.C(n_102), 
	.B(n_115), 
	.A(n_207));
   AN221X0 p3807A (.Q(n_223), 
	.E(n_205), 
	.D(n_122), 
	.C(n_203), 
	.B(n_99), 
	.A(alu_operand1_i[0]));
   EO2X0 p3828A (.Q(n_222), 
	.B(n_70), 
	.A(n_206));
   ON211X0 p5914A (.Q(n_221), 
	.D(n_200), 
	.C(n_196), 
	.B(n_61), 
	.A(n_149));
   ON31X0 p3869A (.Q(n_220), 
	.D(n_97), 
	.C(n_198), 
	.B(n_299), 
	.A(n_313));
   INX0 Fp2956A (.Q(n_219), 
	.A(n_218));
   ON21X0 p2936A2428 (.Q(n_218), 
	.C(n_37), 
	.B(n_11), 
	.A(n_192));
   ON221X0 p5068A (.Q(n_217), 
	.E(n_190), 
	.D(n_164), 
	.C(n_4), 
	.B(n_167), 
	.A(alu_operand1_i[3]));
   AN221X0 p4405A6926 (.Q(n_216), 
	.E(n_194), 
	.D(n_122), 
	.C(n_202), 
	.B(n_121), 
	.A(alu_operand1_i[1]));
   ON211X0 p5658A (.Q(alu_ac_o), 
	.D(n_175), 
	.C(n_193), 
	.B(n_143), 
	.A(n_192));
   AN222X0 p4303A (.Q(n_215), 
	.F(n_117), 
	.E(n_192), 
	.D(n_102), 
	.C(n_113), 
	.B(n_155), 
	.A(n_115));
   ON221X0 p4892A (.Q(n_214), 
	.E(n_175), 
	.D(n_103), 
	.C(n_113), 
	.B(n_192), 
	.A(n_116));
   AN221X0 p5250A (.Q(n_213), 
	.E(n_197), 
	.D(alu_operand1_i[2]), 
	.C(n_139), 
	.B(n_107), 
	.A(n_58));
   AN221X0 p5278A (.Q(n_212), 
	.E(n_189), 
	.D(n_351), 
	.C(n_97), 
	.B(n_107), 
	.A(n_62));
   OA221X0 p5255A (.Q(n_211), 
	.E(n_191), 
	.D(n_108), 
	.C(n_68), 
	.B(n_118), 
	.A(n_4));
   AN211X0 p3845A (.Q(n_210), 
	.D(n_134), 
	.C(n_198), 
	.B(n_313), 
	.A(n_299));
   ON21X0 p3948A (.Q(n_209), 
	.C(n_184), 
	.B(n_7), 
	.A(n_186));
   NA3X0 p4798A (.Q(n_208), 
	.C(n_187), 
	.B(n_183), 
	.A(alu_cy_i));
   AN21X0 p3570A (.Q(n_207), 
	.C(n_20), 
	.B(n_16), 
	.A(n_182));
   ON21X4 p3589D (.Q(n_206), 
	.C(n_36), 
	.B(n_30), 
	.A(n_180));
   AO221X0 p4401A (.Q(n_205), 
	.E(n_181), 
	.D(n_107), 
	.C(n_70), 
	.B(n_121), 
	.A(alu_operand1_i[3]));
   EO2X0 p4589A (.Q(n_204), 
	.B(alu_operand1_i[6]), 
	.A(n_185));
   EO2X0 p3481A (.Q(n_203), 
	.B(alu_operand1_i[7]), 
	.A(n_184));
   NA2I1X0 p4293A (.Q(n_202), 
	.B(n_185), 
	.AN(n_186));
   NO2X0 p4286A6927 (.Q(n_201), 
	.B(n_7), 
	.A(n_185));
   OA211X0 p5609A (.Q(n_200), 
	.D(n_177), 
	.C(n_151), 
	.B(n_27), 
	.A(n_94));
   AO221X0 p4660A (.Q(n_199), 
	.E(n_178), 
	.D(n_107), 
	.C(n_66), 
	.B(n_119), 
	.A(alu_operand1_i[5]));
   ON211X0 p5432A (.Q(n_197), 
	.D(n_147), 
	.C(n_166), 
	.B(n_45), 
	.A(n_94));
   AN22X0 p5801A (.Q(n_196), 
	.D(alu_operand1_i[0]), 
	.C(n_95), 
	.B(n_61), 
	.A(n_172));
   ON222X0 p5120A (.Q(n_195), 
	.F(n_88), 
	.E(n_103), 
	.D(n_171), 
	.C(n_116), 
	.B(n_136), 
	.A(n_114));
   ON221X0 p5340A (.Q(n_194), 
	.E(n_169), 
	.D(n_106), 
	.C(n_34), 
	.B(n_108), 
	.A(n_60));
   AN22X0 p5956A (.Q(n_193), 
	.D(n_101), 
	.C(n_95), 
	.B(n_173), 
	.A(alu_ac_i));
   AN22X4 p2748A (.Q(n_192), 
	.D(alu_operand1_i[3]), 
	.C(alu_operand2_i[3]), 
	.B(n_40), 
	.A(n_170));
   AN221X0 p4948A (.Q(n_191), 
	.E(n_165), 
	.D(alu_operand1_i[0]), 
	.C(n_121), 
	.B(n_105), 
	.A(n_10));
   OA221X0 p5283A (.Q(n_190), 
	.E(n_163), 
	.D(n_108), 
	.C(n_59), 
	.B(n_106), 
	.A(n_39));
   ON221X0 p5252A (.Q(n_189), 
	.E(n_160), 
	.D(n_106), 
	.C(n_43), 
	.B(n_94), 
	.A(n_8));
   AN222X0 p5230A (.Q(n_188), 
	.F(n_117), 
	.E(n_171), 
	.D(n_102), 
	.C(n_88), 
	.B(n_136), 
	.A(n_115));
   NA2I1X0 p4545A6928 (.Q(n_187), 
	.B(n_110), 
	.AN(n_168));
   NO2X0 p3767A (.Q(n_186), 
	.B(alu_operand1_i[5]), 
	.A(n_138));
   NA2X0 p4144A (.Q(n_185), 
	.B(alu_operand1_i[5]), 
	.A(n_138));
   NA2I1X0 p3339A (.Q(n_184), 
	.B(n_47), 
	.AN(n_138));
   NO3I1X0 p15233A (.Q(n_183), 
	.C(n_104), 
	.B(n_87), 
	.AN(n_173));
   AO21X0 p3192A (.Q(n_182), 
	.C(n_21), 
	.B(n_46), 
	.A(n_155));
   ON221X0 p4567A (.Q(n_181), 
	.E(n_161), 
	.D(n_106), 
	.C(n_24), 
	.B(n_94), 
	.A(n_9));
   AN21X0 p3460A (.Q(n_180), 
	.C(n_20), 
	.B(n_16), 
	.A(n_154));
   ON22X0 p5624A (.Q(n_179), 
	.D(alu_operand1_i[1]), 
	.C(n_158), 
	.B(n_114), 
	.A(n_111));
   AO321X0 p3913A6929 (.Q(n_178), 
	.F(n_152), 
	.E(n_105), 
	.D(n_38), 
	.C(n_93), 
	.B(alu_operand2_i[6]), 
	.A(alu_operand1_i[6]));
   OA221X0 p5353A (.Q(n_177), 
	.E(n_150), 
	.D(n_106), 
	.C(n_31), 
	.B(n_131), 
	.A(alu_operand1_i[0]));
   AN22X0 p5873A (.Q(n_176), 
	.D(n_349), 
	.C(n_97), 
	.B(n_115), 
	.A(n_145));
   OR2X0 p4737A (.Q(n_175), 
	.B(n_114), 
	.A(n_155));
   NO2I1X0 p15095A (.Q(n_173), 
	.B(n_89), 
	.AN(n_156));
   ON221X0 p14624A (.Q(n_172), 
	.E(n_132), 
	.D(alu_cy_i), 
	.C(n_114), 
	.B(n_55), 
	.A(n_116));
   INX0 Fp2750A (.Q(n_171), 
	.A(n_170));
   ON21X0 p2796A (.Q(n_170), 
	.C(n_45), 
	.B(n_33), 
	.A(n_137));
   AN221X0 p4911A (.Q(n_169), 
	.E(n_153), 
	.D(alu_operand1_i[6]), 
	.C(n_129), 
	.B(n_119), 
	.A(alu_operand1_i[4]));
   NO3I1X0 p4279A (.Q(n_168), 
	.C(n_58), 
	.B(n_61), 
	.AN(n_157));
   OA21X0 p4904A (.Q(n_167), 
	.C(n_131), 
	.B(n_32), 
	.A(n_142));
   AN222X0 p5196A (.Q(n_166), 
	.F(alu_operand1_i[3]), 
	.E(n_129), 
	.D(n_121), 
	.C(alu_operand1_i[6]), 
	.B(n_130), 
	.A(n_2));
   ON222X0 p4850A (.Q(n_165), 
	.F(alu_operand1_i[4]), 
	.E(n_131), 
	.D(n_94), 
	.C(n_37), 
	.B(n_128), 
	.A(n_5));
   AN221X0 p4668A (.Q(n_164), 
	.E(n_139), 
	.D(n_32), 
	.C(n_141), 
	.B(n_93), 
	.A(alu_operand2_i[3]));
   AN222X0 p5112A (.Q(n_163), 
	.F(alu_operand1_i[2]), 
	.E(n_119), 
	.D(n_121), 
	.C(alu_operand1_i[7]), 
	.B(n_129), 
	.A(alu_operand1_i[4]));
   AN22X0 p5399A (.Q(n_162), 
	.D(n_85), 
	.C(n_102), 
	.B(n_117), 
	.A(n_133));
   AN222X0 p4243A (.Q(n_161), 
	.F(alu_operand1_i[6]), 
	.E(n_119), 
	.D(alu_cy_i), 
	.C(n_104), 
	.B(n_130), 
	.A(n_3));
   AN222X0 p4868A (.Q(n_160), 
	.F(alu_operand1_i[0]), 
	.E(n_119), 
	.D(n_121), 
	.C(alu_operand1_i[5]), 
	.B(n_129), 
	.A(alu_operand1_i[2]));
   EN2X0 p5990A (.Q(n_159), 
	.B(n_58), 
	.A(n_137));
   NO2X0 p5474A (.Q(n_158), 
	.B(n_130), 
	.A(n_141));
   NO2X0 p4208A (.Q(n_157), 
	.B(n_62), 
	.A(n_135));
   NO3X0 p15043A (.Q(n_156), 
	.C(n_97), 
	.B(n_115), 
	.A(n_144));
   AO21X0 p2840A (.Q(n_155), 
	.C(n_73), 
	.B(n_63), 
	.A(n_126));
   AO21X0 p3052A (.Q(n_154), 
	.C(n_21), 
	.B(n_46), 
	.A(n_113));
   AO32X0 p4399A (.Q(n_153), 
	.E(n_130), 
	.D(n_5), 
	.C(n_93), 
	.B(alu_operand2_i[5]), 
	.A(alu_operand1_i[5]));
   ON22X0 p3938A (.Q(n_152), 
	.D(alu_operand1_i[6]), 
	.C(n_131), 
	.B(n_3), 
	.A(n_128));
   AN22X0 p5513A (.Q(n_151), 
	.D(n_320), 
	.C(n_97), 
	.B(alu_operand1_i[1]), 
	.A(n_129));
   AN222X0 p5336A (.Q(n_150), 
	.F(alu_operand1_i[4]), 
	.E(n_121), 
	.D(alu_cy_i), 
	.C(n_87), 
	.B(n_98), 
	.A(alu_operand1_i[7]));
   AN22X0 p15100A (.Q(n_149), 
	.D(n_115), 
	.C(alu_cy_i), 
	.B(n_117), 
	.A(n_55));
   AN222X0 p5225A (.Q(n_148), 
	.F(alu_operand1_i[0]), 
	.E(n_104), 
	.D(n_87), 
	.C(alu_operand1_i[7]), 
	.B(n_95), 
	.A(n_67));
   OA22X0 p5296A (.Q(n_147), 
	.D(n_33), 
	.C(n_106), 
	.B(n_0), 
	.A(n_118));
   EO2X0 p5136A (.Q(n_146), 
	.B(alu_operand1_i[4]), 
	.A(n_120));
   EN2X0 p5816A (.Q(n_145), 
	.B(n_58), 
	.A(n_126));
   INX0 Fp14851A6930 (.Q(n_144), 
	.A(n_143));
   NA2X0 p14584A (.Q(n_143), 
	.B(alu_opcode_i[0]), 
	.A(n_117));
   INX0 Fp4444A6932 (.Q(n_141), 
	.A(n_142));
   OR2X0 p4123A (.Q(n_142), 
	.B(n_96), 
	.A(n_120));
   INX0 Fp4854A (.Q(n_140), 
	.A(n_139));
   NO2I1X0 p4811A (.Q(n_139), 
	.B(n_96), 
	.AN(n_120));
   NO2I1X0 p3159A (.Q(n_138), 
	.B(n_120), 
	.AN(alu_operand1_i[4]));
   OA21X4 p2402A (.Q(n_137), 
	.C(n_8), 
	.B(n_43), 
	.A(n_92));
   ON21X0 p4978D (.Q(n_136), 
	.C(n_72), 
	.B(n_29), 
	.A(n_109));
   NA3X0 p4118A (.Q(n_135), 
	.C(n_60), 
	.B(n_90), 
	.A(n_59));
   AN222X0 p3873A (.Q(n_134), 
	.F(n_69), 
	.E(n_75), 
	.D(n_71), 
	.C(n_51), 
	.B(n_71), 
	.A(n_86));
   EN2X0 p5262A (.Q(n_133), 
	.B(n_62), 
	.A(n_92));
   NO2X0 p16051A (.Q(n_132), 
	.B(n_107), 
	.A(n_102));
   INX0 Fp13563A (.Q(n_130), 
	.A(n_131));
   NA2X0 p13460A (.Q(n_131), 
	.B(n_1), 
	.A(n_100));
   INX0 Fp13448A6936 (.Q(n_128), 
	.A(n_129));
   OR2X0 p13192A (.Q(n_129), 
	.B(n_104), 
	.A(n_99));
   NO2I1X0 p16374A (.Q(n_127), 
	.B(n_77), 
	.AN(n_89));
   NA2X2 p2749A (.Q(n_126), 
	.B(n_26), 
	.A(n_109));
   NA2X0 p5508A (.Q(n_125), 
	.B(n_95), 
	.A(n_80));
   INX0 Fp16092A6941 (.Q(n_123), 
	.A(n_124));
   AND2X1 p15550A (.Q(n_124), 
	.B(n_89), 
	.A(n_77));
   NO2X0 p4824A (.Q(n_122), 
	.B(n_96), 
	.A(n_80));
   AND2X0 p14520A (.Q(n_121), 
	.B(alu_opcode_i[1]), 
	.A(n_100));
   NO2X0 p3111A (.Q(n_120), 
	.B(n_101), 
	.A(alu_ac_i));
   INX0 Fp13996A6942 (.Q(n_118), 
	.A(n_119));
   OR2X0 p13602A (.Q(n_119), 
	.B(n_98), 
	.A(n_87));
   INX0 Fp14486A6943 (.Q(n_116), 
	.A(n_117));
   ON21X1 p14274A (.Q(n_117), 
	.C(n_76), 
	.B(alu_opcode_i[3]), 
	.A(n_83));
   INX0 Fp14944A6945 (.Q(n_115), 
	.A(n_114));
   NA3X0 p14697D (.Q(n_114), 
	.C(n_1), 
	.B(n_84), 
	.A(n_14));
   AO21X0 p2685A (.Q(n_113), 
	.C(n_73), 
	.B(n_63), 
	.A(n_78));
   EO2X0 p5627A (.Q(n_112), 
	.B(n_58), 
	.A(n_78));
   EO2X0 p5605A (.Q(n_111), 
	.B(n_62), 
	.A(n_74));
   NO2X0 p15688A (.Q(n_110), 
	.B(n_82), 
	.A(n_14));
   NA2X0 p2550A (.Q(n_109), 
	.B(n_22), 
	.A(n_74));
   INX0 Fp14975A6954 (.Q(n_108), 
	.A(n_107));
   NO2X0 p14892A (.Q(n_107), 
	.B(n_50), 
	.A(n_83));
   INX0 Fp13787A6955 (.Q(n_105), 
	.A(n_106));
   OR2X0 p13206A (.Q(n_106), 
	.B(n_17), 
	.A(n_83));
   NO2X0 p13076A (.Q(n_104), 
	.B(n_17), 
	.A(n_79));
   INX0 Fp15742A6958 (.Q(n_102), 
	.A(n_103));
   NA2X0 p15514A (.Q(n_103), 
	.B(n_84), 
	.A(n_13));
   NO2X0 p2736A (.Q(n_101), 
	.B(n_4), 
	.A(n_32));
   NO2X0 p13438A (.Q(n_100), 
	.B(alu_opcode_i[0]), 
	.A(n_82));
   NO2X0 p13202A (.Q(n_99), 
	.B(n_50), 
	.A(n_79));
   NO3X0 p13773A (.Q(n_98), 
	.C(n_50), 
	.B(alu_opcode_i[1]), 
	.A(n_56));
   NO3X1 p14417D (.Q(n_97), 
	.C(alu_opcode_i[3]), 
	.B(alu_opcode_i[0]), 
	.A(n_79));
   INX0 Fp15235A6962 (.Q(n_95), 
	.A(n_96));
   NA3X0 p15057A (.Q(n_96), 
	.C(n_49), 
	.B(n_1), 
	.A(n_65));
   INX0 Fp14031A6965 (.Q(n_93), 
	.A(n_94));
   NA3X0 p13885A (.Q(n_94), 
	.C(alu_opcode_i[3]), 
	.B(n_65), 
	.A(n_13));
   NO2I1X1 p2354A (.Q(n_92), 
	.B(n_81), 
	.AN(n_27));
   NO3I1X0 p3799A (.Q(n_90), 
	.C(n_70), 
	.B(n_66), 
	.AN(n_68));
   NO3I1X0 p15076A (.Q(n_89), 
	.C(alu_opcode_i[3]), 
	.B(n_79), 
	.AN(alu_opcode_i[0]));
   ON21X0 p5131D (.Q(n_88), 
	.C(n_72), 
	.B(n_29), 
	.A(n_64));
   NO3I1X0 p13553A (.Q(n_87), 
	.C(n_56), 
	.B(n_14), 
	.AN(alu_opcode_i[3]));
   AN221X0 p4225A (.Q(n_86), 
	.E(n_52), 
	.D(n_317), 
	.C(n_303), 
	.B(n_304), 
	.A(n_318));
   EN2X0 p5354A (.Q(n_85), 
	.B(n_19), 
	.A(n_62));
   NO2X0 p14314A (.Q(n_84), 
	.B(alu_opcode_i[3]), 
	.A(n_56));
   NA2X0 p12882A (.Q(n_83), 
	.B(alu_opcode_i[1]), 
	.A(n_65));
   NA2X0 p13290A (.Q(n_82), 
	.B(alu_opcode_i[4]), 
	.A(n_57));
   NO2I1X0 p2350A (.Q(n_81), 
	.B(n_31), 
	.AN(n_55));
   NO2X0 p4589A6966 (.Q(n_80), 
	.B(n_67), 
	.A(alu_cy_i));
   OR2X0 p12545A (.Q(n_79), 
	.B(n_56), 
	.A(n_1));
   NA2X2 p2575A (.Q(n_78), 
	.B(n_26), 
	.A(n_64));
   OR5X0 p15420A (.Q(n_77), 
	.E(alu_operand2_i[6]), 
	.D(alu_operand2_i[3]), 
	.C(alu_operand2_i[4]), 
	.B(alu_operand2_i[0]), 
	.A(n_54));
   NA3I1X0 p14238A (.Q(n_76), 
	.C(alu_opcode_i[0]), 
	.B(n_57), 
	.AN(alu_opcode_i[4]));
   ON21X0 p3854A (.Q(n_75), 
	.C(n_314), 
	.B(n_300), 
	.A(n_41));
   ON21X0 p2636D (.Q(n_74), 
	.C(n_44), 
	.B(n_18), 
	.A(alu_cy_i));
   AN21X0 p2925A (.Q(n_73), 
	.C(n_48), 
	.B(n_12), 
	.A(n_15));
   OA21X0 p4952A (.Q(n_72), 
	.C(n_12), 
	.B(n_29), 
	.A(n_26));
   AN222X0 p3735A (.Q(n_71), 
	.F(n_300), 
	.E(n_314), 
	.D(n_301), 
	.C(n_315), 
	.B(n_316), 
	.A(n_302));
   NO2I1X0 p4162A (.Q(n_70), 
	.B(n_24), 
	.AN(n_9));
   NA2X0 p4049A (.Q(n_69), 
	.B(n_300), 
	.A(n_41));
   NA2X0 p3553A (.Q(n_68), 
	.B(n_37), 
	.A(n_10));
   NO2X0 p4604A (.Q(n_67), 
	.B(n_3), 
	.A(n_47));
   NA2I1X0 p4231A (.Q(n_66), 
	.B(n_36), 
	.AN(n_30));
   NO3I1X0 p12619A (.Q(n_65), 
	.C(alu_opcode_i[4]), 
	.B(alu_opcode_i[2]), 
	.AN(alu_en_i));
   NA2X0 p2452A (.Q(n_64), 
	.B(n_19), 
	.A(n_22));
   NO2X0 p2920A (.Q(n_63), 
	.B(n_29), 
	.A(n_48));
   NA2X0 p4145A (.Q(n_62), 
	.B(n_26), 
	.A(n_22));
   NA2X0 p4430A (.Q(n_61), 
	.B(n_44), 
	.A(n_19));
   NO2I1X0 p4010A (.Q(n_60), 
	.B(n_20), 
	.AN(n_16));
   NO2I1X0 p3579A (.Q(n_59), 
	.B(n_48), 
	.AN(n_15));
   NA2X0 p4569A (.Q(n_58), 
	.B(n_12), 
	.A(n_28));
   NO3I1X0 p13086A (.Q(n_57), 
	.C(alu_opcode_i[2]), 
	.B(alu_opcode_i[3]), 
	.AN(alu_en_i));
   NA3I1X0 p12174D (.Q(n_56), 
	.C(alu_opcode_i[2]), 
	.B(alu_en_i), 
	.AN(alu_opcode_i[4]));
   AND3X0 p10600A (.Q(n_55), 
	.C(alu_opcode_i[0]), 
	.B(alu_opcode_i[1]), 
	.A(alu_cy_i));
   OR4X0 p15352A (.Q(n_54), 
	.D(alu_operand2_i[7]), 
	.C(alu_operand2_i[1]), 
	.B(FE_OFN235_fsm_alu_operand2_2_), 
	.A(alu_operand2_i[5]));
   AN21X0 p6300A (.Q(n_53), 
	.C(n_32), 
	.B(alu_operand1_i[2]), 
	.A(alu_operand1_i[1]));
   OA211X0 p4174A (.Q(n_52), 
	.D(n_319), 
	.C(n_305), 
	.B(n_318), 
	.A(n_304));
   ON22X0 p4361A (.Q(n_51), 
	.D(n_317), 
	.C(n_303), 
	.B(n_316), 
	.A(n_302));
   INX0 Fp13524A (.Q(n_49), 
	.A(n_50));
   NA2I1X0 p12892A (.Q(n_50), 
	.B(alu_opcode_i[3]), 
	.AN(alu_opcode_i[0]));
   NO2I1X0 p2591A (.Q(n_48), 
	.B(alu_operand1_i[3]), 
	.AN(alu_operand2_i[3]));
   NO2X0 p4360A (.Q(n_47), 
	.B(alu_operand1_i[6]), 
	.A(alu_operand1_i[5]));
   NA2I1X0 p3872A (.Q(n_46), 
	.B(alu_operand2_i[4]), 
	.AN(alu_operand1_i[4]));
   NA2X0 p3206A (.Q(n_45), 
	.B(alu_operand1_i[2]), 
	.A(FE_OFN235_fsm_alu_operand2_2_));
   NA2I1X0 p2512A (.Q(n_44), 
	.B(alu_operand1_i[0]), 
	.AN(FE_OFN229_fsm_alu_operand2_0_));
   NO2X0 p2419A (.Q(n_43), 
	.B(alu_operand1_i[1]), 
	.A(alu_operand2_i[1]));
   NO2X0 p5997A (.Q(n_42), 
	.B(n_3), 
	.A(alu_operand2_i[7]));
   OR2X0 p3596A (.Q(n_41), 
	.B(n_315), 
	.A(n_301));
   INX0 Fp3450A (.Q(n_40), 
	.A(n_39));
   NO2X0 p3068A (.Q(n_39), 
	.B(alu_operand1_i[3]), 
	.A(alu_operand2_i[3]));
   NA2I1X0 p3841A6967 (.Q(n_38), 
	.B(n_7), 
	.AN(alu_operand2_i[6]));
   NA2X0 p3735A6968 (.Q(n_37), 
	.B(alu_operand1_i[4]), 
	.A(alu_operand2_i[4]));
   NA2I1X0 p3895A (.Q(n_36), 
	.B(alu_operand1_i[6]), 
	.AN(alu_operand2_i[6]));
   INX0 Fp4500A (.Q(n_35), 
	.A(n_34));
   NO2X0 p4258A (.Q(n_34), 
	.B(alu_operand1_i[5]), 
	.A(alu_operand2_i[5]));
   NO2X0 p3014A (.Q(n_33), 
	.B(alu_operand1_i[2]), 
	.A(FE_OFN234_fsm_alu_operand2_2_));
   NO2X1 p2716A (.Q(n_32), 
	.B(alu_operand1_i[2]), 
	.A(alu_operand1_i[1]));
   NO2X0 p1977A (.Q(n_31), 
	.B(alu_operand1_i[0]), 
	.A(FE_OFN229_fsm_alu_operand2_0_));
   NO2I1X0 p3959A (.Q(n_30), 
	.B(alu_operand1_i[6]), 
	.AN(alu_operand2_i[6]));
   INX0 Fp2937A (.Q(n_28), 
	.A(n_29));
   NO2I1X0 p2607A (.Q(n_29), 
	.B(alu_operand1_i[2]), 
	.AN(FE_OFN234_fsm_alu_operand2_2_));
   NA2X0 p2237A (.Q(n_27), 
	.B(alu_operand1_i[0]), 
	.A(FE_OFN229_fsm_alu_operand2_0_));
   NA2I1X0 p2420A (.Q(n_26), 
	.B(alu_operand1_i[1]), 
	.AN(alu_operand2_i[1]));
   INX0 Fp4172A (.Q(n_25), 
	.A(n_24));
   NO2X0 p4127A (.Q(n_24), 
	.B(alu_operand1_i[7]), 
	.A(alu_operand2_i[7]));
   NA2X0 p5976A (.Q(n_23), 
	.B(n_3), 
	.A(alu_operand2_i[7]));
   NA2X1 p2324A (.Q(n_22), 
	.B(n_0), 
	.A(alu_operand2_i[1]));
   NO2I1X0 p4028A (.Q(n_21), 
	.B(alu_operand2_i[4]), 
	.AN(alu_operand1_i[4]));
   NO2X0 p3973A (.Q(n_20), 
	.B(n_5), 
	.A(alu_operand2_i[5]));
   INX0 Fp2414A (.Q(n_18), 
	.A(n_19));
   NA2I1X4 p2306A (.Q(n_19), 
	.B(FE_OFN229_fsm_alu_operand2_0_), 
	.AN(alu_operand1_i[0]));
   NA2X0 p13289A (.Q(n_17), 
	.B(alu_opcode_i[3]), 
	.A(alu_opcode_i[0]));
   NA2X0 p3782A (.Q(n_16), 
	.B(n_5), 
	.A(alu_operand2_i[5]));
   NA2I1X0 p2734A (.Q(n_15), 
	.B(alu_operand1_i[3]), 
	.AN(alu_operand2_i[3]));
   INX0 Fp13534A (.Q(n_13), 
	.A(n_14));
   NA2X0 p12815A (.Q(n_14), 
	.B(alu_opcode_i[0]), 
	.A(n_1));
   NA2I1X0 p2608A (.Q(n_12), 
	.B(alu_operand1_i[2]), 
	.AN(FE_OFN234_fsm_alu_operand2_2_));
   INX0 Fp3555A (.Q(n_11), 
	.A(n_10));
   OR2X0 p3188A (.Q(n_10), 
	.B(alu_operand1_i[4]), 
	.A(alu_operand2_i[4]));
   NA2X0 p4008A (.Q(n_9), 
	.B(alu_operand1_i[7]), 
	.A(alu_operand2_i[7]));
   NA2X0 p2531A (.Q(n_8), 
	.B(alu_operand1_i[1]), 
	.A(alu_operand2_i[1]));
   INX0 Fp3702A (.Q(n_7), 
	.A(alu_operand1_i[6]));
   INX2 Fp1711D (.Q(n_6), 
	.A(n_278));
   INX0 Fp3726A6974 (.Q(n_5), 
	.A(alu_operand1_i[5]));
   INX0 Fp2513A6978 (.Q(n_4), 
	.A(alu_operand1_i[3]));
   INX0 Fp3833A6981 (.Q(n_3), 
	.A(alu_operand1_i[7]));
   INX0 Fp2529A (.Q(n_2), 
	.A(alu_operand1_i[2]));
   INX0 Fp12324A (.Q(n_1), 
	.A(alu_opcode_i[1]));
   INX0 Fp2223A6988 (.Q(n_0), 
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
	DFT_sdo_4, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N2, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N8);
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
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N2;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N8;

   // Internal wires
   wire FE_OFCN298_n_959;
   wire FE_OFCN297_n_648;
   wire FE_PHN2_alu_fsm_result_1_;
   wire FE_PHN1_alu_fsm_result_0_;
   wire FE_PHN0_alu_fsm_result_4_;
   wire FE_RN_79_0;
   wire FE_OFN230_n_1424;
   wire FE_OFN228_n_1336;
   wire FE_OFN227_n_1403;
   wire FE_OFN226_n_1290;
   wire FE_OFN217_n_1186;
   wire FE_OFN216_n_1186;
   wire FE_OFN215_n_1124;
   wire FE_OFN214_n_874;
   wire FE_OFN212_n_1129;
   wire FE_OFN211_n_1191;
   wire FE_OFN210_n_1244;
   wire FE_OFN209_n_460;
   wire FE_OFN208_n_231;
   wire FE_OFN207_n_231;
   wire FE_OFN206_n_1214;
   wire FE_OFN205_n_966;
   wire FE_OFN204_n_1154;
   wire FE_OFN203_n_17;
   wire FE_OFN202_n_1221;
   wire FE_OFN200_n_707;
   wire FE_OFN199_n_275;
   wire FE_OFN197_n_224;
   wire FE_OFN196_n_588;
   wire FE_OFN195_n_588;
   wire FE_OFN194_n_528;
   wire FE_OFN193_n_907;
   wire FE_OFN192_n_832;
   wire FE_OFN191_n_1116;
   wire FE_OFN190_n_628;
   wire FE_OFN189_n_543;
   wire FE_OFN188_n_555;
   wire FE_OFN187_n_2173;
   wire FE_OFN185_n_2018;
   wire FE_OFN184_n_443;
   wire FE_OFN183_n_585;
   wire FE_OFN182_n_585;
   wire FE_OFN181_n_585;
   wire FE_OFN180_n_396;
   wire FE_OFN179_n_396;
   wire FE_OFN178_n_396;
   wire FE_OFN177_n_396;
   wire FE_OFN176_n_396;
   wire FE_OFN175_n_322;
   wire FE_OFN174_n_551;
   wire FE_OFN173_n_551;
   wire FE_OFN172_n_551;
   wire FE_OFN171_n_2175;
   wire FE_OFN170_n_473;
   wire FE_OFN169_n_516;
   wire FE_OFN168_n_2183;
   wire FE_OFN167_n_2183;
   wire FE_OFN166_n_2154;
   wire FE_OFN165_n_2181;
   wire FE_OFN164_n_425;
   wire FE_OFN163_n_425;
   wire FE_OFN162_n_425;
   wire FE_OFN161_n_173;
   wire FE_OFN160_n_418;
   wire FE_OFN159_n_577;
   wire FE_OFN158_n_577;
   wire FE_OFN157_n_577;
   wire FE_OFN156_n_2115;
   wire FE_OFN155_n_2115;
   wire FE_OFN154_n_174;
   wire FE_OFN153_n_174;
   wire FE_OFN152_n_284;
   wire FE_OFN150_n_284;
   wire FE_OFN149_n_284;
   wire FE_OFN148_n_153;
   wire FE_OFN147_n_153;
   wire FE_OFN146_n_134;
   wire FE_OFN145_n_2110;
   wire FE_OFN144_n_2110;
   wire FE_OFN143_n_2110;
   wire FE_OFN142_n_117;
   wire FE_OFN141_n_2118;
   wire FE_OFN140_n_2121;
   wire FE_OFN139_n_270;
   wire FE_OFN137_n_270;
   wire FE_OFN136_n_270;
   wire FE_OFN135_n_255;
   wire FE_OFN134_n_255;
   wire FE_OFN133_n_255;
   wire FE_OFN131_n_114;
   wire FE_OFN130_n_114;
   wire FE_OFN129_n_2135;
   wire FE_OFN128_n_2135;
   wire FE_OFN127_n_2135;
   wire FE_OFN125_n_2135;
   wire FE_OFN124_n_2135;
   wire FE_OFN123_n_295;
   wire FE_OFN122_n_295;
   wire FE_OFN121_n_2044;
   wire FE_OFN120_n_2044;
   wire FE_OFN119_n_2044;
   wire FE_OFN118_n_2044;
   wire FE_OFN117_n_24;
   wire FE_OFN116_n_24;
   wire FE_OFN115_n_2221;
   wire FE_OFN114_n_2221;
   wire FE_OFN113_n_325;
   wire FE_OFN112_n_325;
   wire FE_OFN111_n_325;
   wire FE_OFN110_n_325;
   wire FE_OFN107_fsm_op1_0_;
   wire FE_OFN105_fsm_op1_1_;
   wire FE_OFN104_fsm_op1_1_;
   wire FE_OFN103_fsm_op1_2_;
   wire FE_OFN102_fsm_op1_2_;
   wire FE_OFN101_fsm_op1_4_;
   wire FE_OFN100_fsm_op1_4_;
   wire FE_OFN99_fsm_op1_5_;
   wire FE_OFN98_fsm_op1_5_;
   wire FE_OFN97_fsm_op1_5_;
   wire FE_OFN96_fsm_op1_6_;
   wire FE_OFN95_fsm_op1_6_;
   wire FE_OFN94_fsm_op2_3_;
   wire FE_OFN93_fsm_op2_3_;
   wire FE_OFN92_fsm_op2_4_;
   wire FE_OFN91_fsm_op2_5_;
   wire FE_OFN90_fsm_op2_5_;
   wire FE_OFN89_n_1288;
   wire FE_OFN88_n_1288;
   wire FE_OFN87_fsm_op_aux_1_1_;
   wire FE_OFN86_fsm_op_aux_1_1_;
   wire FE_OFN85_fsm_op_aux_1_1_;
   wire FE_OFN84_fsm_op_aux_1_2_;
   wire FE_OFN83_fsm_op_aux_1_2_;
   wire FE_OFN82_n_1402;
   wire FE_OFN81_n_1402;
   wire FE_OFN80_n_1402;
   wire FE_OFN79_fsm_op_aux_1_4_;
   wire FE_OFN78_fsm_op_aux_1_4_;
   wire FE_OFN77_n_1334;
   wire FE_OFN76_n_1334;
   wire FE_OFN75_fsm_op_aux_1_6_;
   wire FE_OFN74_fsm_op_aux_1_6_;
   wire FE_OFN73_fsm_op_aux_1_7_;
   wire FE_OFN72_fsm_op2_2_;
   wire FE_OFN71_fsm_op2_2_;
   wire FE_OFN70_fsm_op2_6_;
   wire FE_OFN69_n_202;
   wire FE_OFN68_n_202;
   wire FE_OFN67_n_202;
   wire FE_OFN66_fsm_op2_0_;
   wire FE_OFN65_fsm_op2_0_;
   wire FE_OFN64_fsm_op2_0_;
   wire FE_OFN63_fsm_op2_1_;
   wire FE_OFN62_fsm_op2_1_;
   wire FE_OFN61_fsm_op_aux_2_0_;
   wire FE_OFN60_fsm_op_aux_2_0_;
   wire FE_OFN59_fsm_op_aux_2_0_;
   wire FE_OFN58_fsm_op_aux_2_1_;
   wire FE_OFN57_fsm_op_aux_2_1_;
   wire FE_OFN56_fsm_op_aux_2_2_;
   wire FE_OFN55_fsm_op_aux_2_2_;
   wire FE_OFN54_fsm_op_aux_2_3_;
   wire FE_OFN53_fsm_op_aux_2_3_;
   wire FE_OFN52_fsm_op_aux_2_3_;
   wire FE_OFN51_fsm_op_aux_2_4_;
   wire FE_OFN50_fsm_op_aux_2_4_;
   wire FE_OFN49_fsm_op_aux_2_5_;
   wire FE_OFN48_fsm_op_aux_2_5_;
   wire FE_OFN47_fsm_op_aux_2_6_;
   wire FE_OFN46_fsm_op_aux_2_6_;
   wire FE_OFN45_fsm_op_aux_2_7_;
   wire FE_OFN44_fsm_op_aux_2_7_;
   wire FE_OFN43_fsm_opcode_1_;
   wire FE_OFN42_fsm_opcode_4_;
   wire FE_OFN41_fsm_opcode_4_;
   wire FE_OFN40_n_198;
   wire FE_OFN39_n_23;
   wire FE_OFN38_n_692;
   wire FE_OFN37_n_692;
   wire FE_OFN36_fsm_opcode_5_;
   wire FE_OFN35_fsm_opcode_5_;
   wire FE_OFN34_fsm_opcode_5_;
   wire FE_OFN33_fsm_opcode_5_;
   wire FE_OFN32_n_78;
   wire FE_OFN31_fsm_opcode_7_;
   wire FE_OFN30_fsm_opcode_7_;
   wire FE_OFN29_n_1973;
   wire FE_OFN28_n_1973;
   wire FE_OFN27_n_1973;
   wire FE_OFN26_n_19;
   wire FE_OFN25_n_19;
   wire FE_OFN7_n_1735;
   wire FE_OFN6_n_1718;
   wire FE_OFN5_n_1175;
   wire \fsm_op1[0] ;
   wire \fsm_op1[1] ;
   wire \fsm_op1[2] ;
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
   wire \fsm_op_aux_1[1] ;
   wire \fsm_op_aux_1[2] ;
   wire \fsm_op_aux_1[4] ;
   wire \fsm_op_aux_1[6] ;
   wire \fsm_op_aux_1[7] ;
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
   wire \fsm_opcode[1] ;
   wire \fsm_opcode[4] ;
   wire \fsm_opcode[5] ;
   wire \fsm_opcode[7] ;
   wire logic_1_1_net;
   wire n_17;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
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
   wire n_43;
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
   wire n_68;
   wire n_69;
   wire n_70;
   wire n_71;
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
   wire n_124;
   wire n_125;
   wire n_126;
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
   wire n_902;
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
   wire n_1504;
   wire n_1505;
   wire n_1509;
   wire n_1511;
   wire n_1513;
   wire n_1517;
   wire n_1518;
   wire n_1519;
   wire n_1520;
   wire n_1521;
   wire n_1522;
   wire n_1523;
   wire n_1524;
   wire n_1526;
   wire n_1528;
   wire n_1530;
   wire n_1532;
   wire n_1534;
   wire n_1535;
   wire n_1536;
   wire n_1537;
   wire n_1538;
   wire n_1539;
   wire n_1540;
   wire n_1541;
   wire n_1542;
   wire n_1543;
   wire n_1544;
   wire n_1545;
   wire n_1546;
   wire n_1547;
   wire n_1548;
   wire n_1549;
   wire n_1550;
   wire n_1551;
   wire n_1552;
   wire n_1553;
   wire n_1554;
   wire n_1555;
   wire n_1556;
   wire n_1557;
   wire n_1560;
   wire n_1561;
   wire n_1562;
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
   wire n_1585;
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
   wire n_1670;
   wire n_1671;
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
   wire n_1715;
   wire n_1716;
   wire n_1717;
   wire n_1718;
   wire n_1719;
   wire n_1720;
   wire n_1721;
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
   wire n_1740;
   wire n_1741;
   wire n_1742;
   wire n_1743;
   wire n_1744;
   wire n_1745;
   wire n_1746;
   wire n_1747;
   wire n_1748;
   wire n_1749;
   wire n_1750;
   wire n_1751;
   wire n_1752;
   wire n_1754;
   wire n_1755;
   wire n_1756;
   wire n_1757;
   wire n_1759;
   wire n_1760;
   wire n_1761;
   wire n_1763;
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
   wire n_1812;
   wire n_1813;
   wire n_1814;
   wire n_1815;
   wire n_1816;
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
   wire n_1856;
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
   wire n_1965;
   wire n_1966;
   wire n_1967;
   wire n_1973;
   wire n_1974;
   wire n_1976;
   wire n_1991;
   wire n_1996;
   wire n_1997;
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
   wire n_2018;
   wire n_2019;
   wire n_2020;
   wire n_2025;
   wire n_2026;
   wire n_2027;
   wire n_2028;
   wire n_2029;
   wire n_2030;
   wire n_2031;
   wire n_2032;
   wire n_2033;
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
   wire n_2052;
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
   wire n_2120;
   wire n_2121;
   wire n_2122;
   wire n_2123;
   wire n_2124;
   wire n_2125;
   wire n_2126;
   wire n_2127;
   wire n_2128;
   wire n_2129;
   wire n_2131;
   wire n_2132;
   wire n_2133;
   wire n_2134;
   wire n_2135;
   wire n_2136;
   wire n_2138;
   wire n_2139;
   wire n_2145;
   wire n_2146;
   wire n_2148;
   wire n_2149;
   wire n_2150;
   wire n_2152;
   wire n_2153;
   wire n_2154;
   wire n_2155;
   wire n_2156;
   wire n_2157;
   wire n_2158;
   wire n_2160;
   wire n_2161;
   wire n_2162;
   wire n_2163;
   wire n_2165;
   wire n_2166;
   wire n_2170;
   wire n_2171;
   wire n_2173;
   wire n_2174;
   wire n_2175;
   wire n_2177;
   wire n_2178;
   wire n_2179;
   wire n_2180;
   wire n_2181;
   wire n_2182;
   wire n_2183;
   wire n_2196;
   wire n_2221;
   wire n_2244;
   wire n_2245;

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

   BUX0 FE_OFCC298_n_959 (.Q(FE_OFCN298_n_959), 
	.A(n_959));
   BUX1 FE_OFCC297_n_648 (.Q(FE_OFCN297_n_648), 
	.A(n_648));
   BUX1 FE_PHC2_alu_fsm_result_1_ (.Q(FE_PHN2_alu_fsm_result_1_), 
	.A(fsm_alu_result_i[1]));
   BUCX4 FE_PHC1_alu_fsm_result_0_ (.Q(FE_PHN1_alu_fsm_result_0_), 
	.A(fsm_alu_result_i[0]));
   BUX0 FE_PHC0_alu_fsm_result_4_ (.Q(FE_PHN0_alu_fsm_result_4_), 
	.A(fsm_alu_result_i[4]));
   NA3X1 FE_RC_149_0 (.Q(n_1151), 
	.C(n_914), 
	.B(n_913), 
	.A(n_915));
   ON33X1 FE_RC_148_0 (.Q(n_578), 
	.F(n_363), 
	.E(n_1011), 
	.D(FE_OFN89_n_1288), 
	.C(n_365), 
	.B(n_512), 
	.A(n_364));
   NA2X1 FE_RC_136_0 (.Q(n_311), 
	.B(n_118), 
	.A(n_430));
   AND3X4 FE_RC_135_0 (.Q(n_1244), 
	.C(n_118), 
	.B(FE_OFN193_n_907), 
	.A(n_430));
   INX3 FE_RC_132_0 (.Q(n_100), 
	.A(FE_OFN146_n_134));
   INX1 FE_RC_131_0 (.Q(FE_RN_79_0), 
	.A(FE_OFN40_n_198));
   AND2X4 FE_RC_130_0 (.Q(FE_OFN189_n_543), 
	.B(FE_RN_79_0), 
	.A(FE_OFN146_n_134));
   AO321X1 FE_RC_118_0 (.Q(n_548), 
	.F(n_2108), 
	.E(n_331), 
	.D(n_376), 
	.C(FE_OFN183_n_585), 
	.B(n_274), 
	.A(FE_OFN116_n_24));
   AN221X4 FE_RC_5_0 (.Q(FE_OFN212_n_1129), 
	.E(n_505), 
	.D(n_506), 
	.C(FE_OFN189_n_543), 
	.B(n_507), 
	.A(FE_OFN192_n_832));
   BUX16 FE_RC_3_0 (.Q(FE_OFN107_fsm_op1_0_), 
	.A(\fsm_op1[0] ));
   BUX2 FE_OFC230_n_1424 (.Q(FE_OFN230_n_1424), 
	.A(n_1424));
   BUX1 FE_OFC228_n_1336 (.Q(FE_OFN228_n_1336), 
	.A(n_1336));
   BUX1 FE_OFC227_n_1403 (.Q(FE_OFN227_n_1403), 
	.A(n_1403));
   BUX1 FE_OFC226_n_1290 (.Q(FE_OFN226_n_1290), 
	.A(n_1290));
   INX2 FE_OFC217_n_1186 (.Q(FE_OFN217_n_1186), 
	.A(FE_OFN216_n_1186));
   INX1 FE_OFC216_n_1186 (.Q(FE_OFN216_n_1186), 
	.A(n_1186));
   BUX1 FE_OFC215_n_1124 (.Q(FE_OFN215_n_1124), 
	.A(n_1124));
   BUX1 FE_OFC214_n_874 (.Q(FE_OFN214_n_874), 
	.A(n_874));
   BUX3 FE_OFC211_n_1191 (.Q(FE_OFN211_n_1191), 
	.A(n_1191));
   BUX6 FE_OFC210_n_1244 (.Q(FE_OFN210_n_1244), 
	.A(n_1244));
   BUX2 FE_OFC209_n_460 (.Q(FE_OFN209_n_460), 
	.A(n_460));
   INX8 FE_OFC208_n_231 (.Q(FE_OFN208_n_231), 
	.A(FE_OFN207_n_231));
   INX2 FE_OFC207_n_231 (.Q(FE_OFN207_n_231), 
	.A(n_231));
   BUX3 FE_OFC206_n_1214 (.Q(FE_OFN206_n_1214), 
	.A(n_1214));
   BUX1 FE_OFC205_n_966 (.Q(FE_OFN205_n_966), 
	.A(n_966));
   BUX2 FE_OFC204_n_1154 (.Q(FE_OFN204_n_1154), 
	.A(n_1154));
   BUX6 FE_OFC203_n_17 (.Q(FE_OFN203_n_17), 
	.A(n_17));
   BUX3 FE_OFC202_n_1221 (.Q(FE_OFN202_n_1221), 
	.A(n_1221));
   BUX2 FE_OFC200_n_707 (.Q(FE_OFN200_n_707), 
	.A(n_707));
   BUX1 FE_OFC199_n_275 (.Q(FE_OFN199_n_275), 
	.A(n_275));
   BUX3 FE_OFC197_n_224 (.Q(FE_OFN197_n_224), 
	.A(n_224));
   INX1 FE_OFC196_n_588 (.Q(FE_OFN196_n_588), 
	.A(FE_OFN195_n_588));
   INX1 FE_OFC195_n_588 (.Q(FE_OFN195_n_588), 
	.A(n_588));
   BUX3 FE_OFC194_n_528 (.Q(FE_OFN194_n_528), 
	.A(n_528));
   BUX4 FE_OFC193_n_907 (.Q(FE_OFN193_n_907), 
	.A(n_907));
   BUX4 FE_OFC192_n_832 (.Q(FE_OFN192_n_832), 
	.A(n_832));
   BUX1 FE_OFC191_n_1116 (.Q(FE_OFN191_n_1116), 
	.A(n_1116));
   BUX2 FE_OFC190_n_628 (.Q(FE_OFN190_n_628), 
	.A(n_628));
   BUX1 FE_OFC188_n_555 (.Q(FE_OFN188_n_555), 
	.A(n_555));
   BUX1 FE_OFC187_n_2173 (.Q(FE_OFN187_n_2173), 
	.A(n_2173));
   BUX6 FE_OFC185_n_2018 (.Q(FE_OFN185_n_2018), 
	.A(n_2018));
   BUX4 FE_OFC184_n_443 (.Q(FE_OFN184_n_443), 
	.A(n_443));
   INX1 FE_OFC183_n_585 (.Q(FE_OFN183_n_585), 
	.A(FE_OFN181_n_585));
   INX6 FE_OFC182_n_585 (.Q(FE_OFN182_n_585), 
	.A(FE_OFN181_n_585));
   INX2 FE_OFC181_n_585 (.Q(FE_OFN181_n_585), 
	.A(n_585));
   INX8 FE_OFC180_n_396 (.Q(FE_OFN180_n_396), 
	.A(FE_OFN178_n_396));
   INX1 FE_OFC179_n_396 (.Q(FE_OFN179_n_396), 
	.A(FE_OFN178_n_396));
   INX6 FE_OFC178_n_396 (.Q(FE_OFN178_n_396), 
	.A(n_396));
   BUX3 FE_OFC177_n_396 (.Q(FE_OFN177_n_396), 
	.A(n_396));
   BUX1 FE_OFC176_n_396 (.Q(FE_OFN176_n_396), 
	.A(n_396));
   BUX6 FE_OFC175_n_322 (.Q(FE_OFN175_n_322), 
	.A(n_322));
   INX1 FE_OFC174_n_551 (.Q(FE_OFN174_n_551), 
	.A(FE_OFN172_n_551));
   INX1 FE_OFC173_n_551 (.Q(FE_OFN173_n_551), 
	.A(FE_OFN172_n_551));
   INX1 FE_OFC172_n_551 (.Q(FE_OFN172_n_551), 
	.A(n_551));
   BUX3 FE_OFC171_n_2175 (.Q(FE_OFN171_n_2175), 
	.A(n_2175));
   BUX4 FE_OFC170_n_473 (.Q(FE_OFN170_n_473), 
	.A(n_473));
   BUX2 FE_OFC169_n_516 (.Q(FE_OFN169_n_516), 
	.A(n_516));
   INX8 FE_OFC168_n_2183 (.Q(FE_OFN168_n_2183), 
	.A(FE_OFN167_n_2183));
   INX2 FE_OFC167_n_2183 (.Q(FE_OFN167_n_2183), 
	.A(n_2183));
   BUX2 FE_OFC166_n_2154 (.Q(FE_OFN166_n_2154), 
	.A(n_2154));
   BUX1 FE_OFC165_n_2181 (.Q(FE_OFN165_n_2181), 
	.A(n_2181));
   INX1 FE_OFC164_n_425 (.Q(FE_OFN164_n_425), 
	.A(FE_OFN162_n_425));
   INX2 FE_OFC163_n_425 (.Q(FE_OFN163_n_425), 
	.A(FE_OFN162_n_425));
   INX1 FE_OFC162_n_425 (.Q(FE_OFN162_n_425), 
	.A(n_425));
   BUX3 FE_OFC161_n_173 (.Q(FE_OFN161_n_173), 
	.A(n_173));
   BUX4 FE_OFC160_n_418 (.Q(FE_OFN160_n_418), 
	.A(n_418));
   INX1 FE_OFC159_n_577 (.Q(FE_OFN159_n_577), 
	.A(FE_OFN157_n_577));
   INX2 FE_OFC158_n_577 (.Q(FE_OFN158_n_577), 
	.A(FE_OFN157_n_577));
   INX1 FE_OFC157_n_577 (.Q(FE_OFN157_n_577), 
	.A(n_577));
   BUX4 FE_OFC156_n_2115 (.Q(FE_OFN156_n_2115), 
	.A(n_2115));
   BUX1 FE_OFC155_n_2115 (.Q(FE_OFN155_n_2115), 
	.A(n_2115));
   BUX2 FE_OFC154_n_174 (.Q(FE_OFN154_n_174), 
	.A(n_174));
   BUX1 FE_OFC153_n_174 (.Q(FE_OFN153_n_174), 
	.A(n_174));
   BUX2 FE_OFC152_n_284 (.Q(FE_OFN152_n_284), 
	.A(n_284));
   BUX1 FE_OFC149_n_284 (.Q(FE_OFN149_n_284), 
	.A(n_284));
   INX6 FE_OFC148_n_153 (.Q(FE_OFN148_n_153), 
	.A(FE_OFN147_n_153));
   INX2 FE_OFC147_n_153 (.Q(FE_OFN147_n_153), 
	.A(n_153));
   BUX12 FE_OFC146_n_134 (.Q(FE_OFN146_n_134), 
	.A(n_134));
   INX1 FE_OFC145_n_2110 (.Q(FE_OFN145_n_2110), 
	.A(FE_OFN143_n_2110));
   INX1 FE_OFC144_n_2110 (.Q(FE_OFN144_n_2110), 
	.A(FE_OFN143_n_2110));
   INX1 FE_OFC143_n_2110 (.Q(FE_OFN143_n_2110), 
	.A(n_2110));
   BUX4 FE_OFC142_n_117 (.Q(FE_OFN142_n_117), 
	.A(n_117));
   BUX6 FE_OFC141_n_2118 (.Q(FE_OFN141_n_2118), 
	.A(n_2118));
   BUX6 FE_OFC140_n_2121 (.Q(FE_OFN140_n_2121), 
	.A(n_2121));
   BUX2 FE_OFC139_n_270 (.Q(FE_OFN139_n_270), 
	.A(n_270));
   BUX1 FE_OFC136_n_270 (.Q(FE_OFN136_n_270), 
	.A(n_270));
   BUX8 FE_OFC135_n_255 (.Q(FE_OFN135_n_255), 
	.A(n_255));
   BUX1 FE_OFC134_n_255 (.Q(FE_OFN134_n_255), 
	.A(n_255));
   BUX1 FE_OFC133_n_255 (.Q(FE_OFN133_n_255), 
	.A(n_255));
   BUX1 FE_OFC131_n_114 (.Q(FE_OFN131_n_114), 
	.A(n_114));
   BUX1 FE_OFC130_n_114 (.Q(FE_OFN130_n_114), 
	.A(n_114));
   INX1 FE_OFC129_n_2135 (.Q(FE_OFN129_n_2135), 
	.A(FE_OFN127_n_2135));
   INX1 FE_OFC127_n_2135 (.Q(FE_OFN127_n_2135), 
	.A(n_2135));
   BUX1 FE_OFC125_n_2135 (.Q(FE_OFN125_n_2135), 
	.A(n_2135));
   BUX8 FE_OFC123_n_295 (.Q(FE_OFN123_n_295), 
	.A(n_295));
   BUX4 FE_OFC122_n_295 (.Q(FE_OFN122_n_295), 
	.A(n_295));
   BUX12 FE_OFC121_n_2044 (.Q(FE_OFN121_n_2044), 
	.A(n_2044));
   BUX1 FE_OFC120_n_2044 (.Q(FE_OFN120_n_2044), 
	.A(n_2044));
   BUX0 FE_OFC119_n_2044 (.Q(FE_OFN119_n_2044), 
	.A(n_2044));
   BUX3 FE_OFC117_n_24 (.Q(FE_OFN117_n_24), 
	.A(n_24));
   BUX6 FE_OFC116_n_24 (.Q(FE_OFN116_n_24), 
	.A(n_24));
   BUX4 FE_OFC115_n_2221 (.Q(FE_OFN115_n_2221), 
	.A(n_2221));
   BUX4 FE_OFC114_n_2221 (.Q(FE_OFN114_n_2221), 
	.A(n_2221));
   INX1 FE_OFC113_n_325 (.Q(FE_OFN113_n_325), 
	.A(n_2135));
   INX6 FE_OFC105_fsm_op1_1_ (.Q(FE_OFN105_fsm_op1_1_), 
	.A(FE_OFN104_fsm_op1_1_));
   INX4 FE_OFC104_fsm_op1_1_ (.Q(FE_OFN104_fsm_op1_1_), 
	.A(\fsm_op1[1] ));
   INX8 FE_OFC103_fsm_op1_2_ (.Q(FE_OFN103_fsm_op1_2_), 
	.A(FE_OFN102_fsm_op1_2_));
   INX6 FE_OFC102_fsm_op1_2_ (.Q(FE_OFN102_fsm_op1_2_), 
	.A(\fsm_op1[2] ));
   INX1 FE_OFC101_fsm_op1_4_ (.Q(FE_OFN101_fsm_op1_4_), 
	.A(FE_OFN100_fsm_op1_4_));
   INX1 FE_OFC100_fsm_op1_4_ (.Q(FE_OFN100_fsm_op1_4_), 
	.A(\fsm_op1[4] ));
   INX1 FE_OFC99_fsm_op1_5_ (.Q(FE_OFN99_fsm_op1_5_), 
	.A(FE_OFN97_fsm_op1_5_));
   INX1 FE_OFC97_fsm_op1_5_ (.Q(FE_OFN97_fsm_op1_5_), 
	.A(\fsm_op1[5] ));
   INX1 FE_OFC96_fsm_op1_6_ (.Q(FE_OFN96_fsm_op1_6_), 
	.A(FE_OFN95_fsm_op1_6_));
   INX1 FE_OFC95_fsm_op1_6_ (.Q(FE_OFN95_fsm_op1_6_), 
	.A(\fsm_op1[6] ));
   INX1 FE_OFC94_fsm_op2_3_ (.Q(FE_OFN94_fsm_op2_3_), 
	.A(FE_OFN93_fsm_op2_3_));
   INX1 FE_OFC93_fsm_op2_3_ (.Q(FE_OFN93_fsm_op2_3_), 
	.A(\fsm_op2[3] ));
   BUX1 FE_OFC92_fsm_op2_4_ (.Q(FE_OFN92_fsm_op2_4_), 
	.A(\fsm_op2[4] ));
   INX1 FE_OFC91_fsm_op2_5_ (.Q(FE_OFN91_fsm_op2_5_), 
	.A(FE_OFN90_fsm_op2_5_));
   INX1 FE_OFC90_fsm_op2_5_ (.Q(FE_OFN90_fsm_op2_5_), 
	.A(\fsm_op2[5] ));
   INX2 FE_OFC89_n_1288 (.Q(FE_OFN89_n_1288), 
	.A(FE_OFN88_n_1288));
   INX1 FE_OFC88_n_1288 (.Q(FE_OFN88_n_1288), 
	.A(n_1288));
   INX1 FE_OFC87_fsm_op_aux_1_1_ (.Q(FE_OFN87_fsm_op_aux_1_1_), 
	.A(FE_OFN85_fsm_op_aux_1_1_));
   INX1 FE_OFC86_fsm_op_aux_1_1_ (.Q(FE_OFN86_fsm_op_aux_1_1_), 
	.A(FE_OFN85_fsm_op_aux_1_1_));
   INX1 FE_OFC85_fsm_op_aux_1_1_ (.Q(FE_OFN85_fsm_op_aux_1_1_), 
	.A(\fsm_op_aux_1[1] ));
   INX2 FE_OFC84_fsm_op_aux_1_2_ (.Q(FE_OFN84_fsm_op_aux_1_2_), 
	.A(FE_OFN83_fsm_op_aux_1_2_));
   INX1 FE_OFC83_fsm_op_aux_1_2_ (.Q(FE_OFN83_fsm_op_aux_1_2_), 
	.A(\fsm_op_aux_1[2] ));
   INX1 FE_OFC82_n_1402 (.Q(FE_OFN82_n_1402), 
	.A(FE_OFN80_n_1402));
   INX1 FE_OFC81_n_1402 (.Q(FE_OFN81_n_1402), 
	.A(FE_OFN80_n_1402));
   INX1 FE_OFC80_n_1402 (.Q(FE_OFN80_n_1402), 
	.A(n_1402));
   INX2 FE_OFC79_fsm_op_aux_1_4_ (.Q(FE_OFN79_fsm_op_aux_1_4_), 
	.A(FE_OFN78_fsm_op_aux_1_4_));
   INX1 FE_OFC78_fsm_op_aux_1_4_ (.Q(FE_OFN78_fsm_op_aux_1_4_), 
	.A(\fsm_op_aux_1[4] ));
   INX2 FE_OFC77_n_1334 (.Q(FE_OFN77_n_1334), 
	.A(FE_OFN76_n_1334));
   INX1 FE_OFC76_n_1334 (.Q(FE_OFN76_n_1334), 
	.A(n_1334));
   INX2 FE_OFC75_fsm_op_aux_1_6_ (.Q(FE_OFN75_fsm_op_aux_1_6_), 
	.A(FE_OFN74_fsm_op_aux_1_6_));
   INX1 FE_OFC74_fsm_op_aux_1_6_ (.Q(FE_OFN74_fsm_op_aux_1_6_), 
	.A(\fsm_op_aux_1[6] ));
   BUX3 FE_OFC73_fsm_op_aux_1_7_ (.Q(FE_OFN73_fsm_op_aux_1_7_), 
	.A(\fsm_op_aux_1[7] ));
   INX1 FE_OFC72_fsm_op2_2_ (.Q(FE_OFN72_fsm_op2_2_), 
	.A(FE_OFN71_fsm_op2_2_));
   INX1 FE_OFC71_fsm_op2_2_ (.Q(FE_OFN71_fsm_op2_2_), 
	.A(\fsm_op2[2] ));
   BUX1 FE_OFC70_fsm_op2_6_ (.Q(FE_OFN70_fsm_op2_6_), 
	.A(\fsm_op2[6] ));
   INX0 FE_OFC69_n_202 (.Q(FE_OFN69_n_202), 
	.A(FE_OFN68_n_202));
   INX1 FE_OFC68_n_202 (.Q(DFT_sdo), 
	.A(FE_OFN68_n_202));
   INX1 FE_OFC67_n_202 (.Q(FE_OFN68_n_202), 
	.A(FE_OFN67_n_202));
   INX1 FE_OFC66_fsm_op2_0_ (.Q(FE_OFN66_fsm_op2_0_), 
	.A(FE_OFN64_fsm_op2_0_));
   INX1 FE_OFC64_fsm_op2_0_ (.Q(FE_OFN64_fsm_op2_0_), 
	.A(\fsm_op2[0] ));
   INX1 FE_OFC63_fsm_op2_1_ (.Q(FE_OFN63_fsm_op2_1_), 
	.A(FE_OFN62_fsm_op2_1_));
   INX1 FE_OFC62_fsm_op2_1_ (.Q(FE_OFN62_fsm_op2_1_), 
	.A(\fsm_op2[1] ));
   INX1 FE_OFC61_fsm_op_aux_2_0_ (.Q(FE_OFN61_fsm_op_aux_2_0_), 
	.A(FE_OFN59_fsm_op_aux_2_0_));
   INX2 FE_OFC60_fsm_op_aux_2_0_ (.Q(FE_OFN60_fsm_op_aux_2_0_), 
	.A(FE_OFN59_fsm_op_aux_2_0_));
   INX1 FE_OFC59_fsm_op_aux_2_0_ (.Q(FE_OFN59_fsm_op_aux_2_0_), 
	.A(\fsm_op_aux_2[0] ));
   INX4 FE_OFC58_fsm_op_aux_2_1_ (.Q(FE_OFN58_fsm_op_aux_2_1_), 
	.A(FE_OFN57_fsm_op_aux_2_1_));
   INX1 FE_OFC57_fsm_op_aux_2_1_ (.Q(FE_OFN57_fsm_op_aux_2_1_), 
	.A(\fsm_op_aux_2[1] ));
   INX2 FE_OFC56_fsm_op_aux_2_2_ (.Q(FE_OFN56_fsm_op_aux_2_2_), 
	.A(FE_OFN55_fsm_op_aux_2_2_));
   INX1 FE_OFC55_fsm_op_aux_2_2_ (.Q(FE_OFN55_fsm_op_aux_2_2_), 
	.A(\fsm_op_aux_2[2] ));
   INX1 FE_OFC54_fsm_op_aux_2_3_ (.Q(FE_OFN54_fsm_op_aux_2_3_), 
	.A(FE_OFN52_fsm_op_aux_2_3_));
   INX1 FE_OFC53_fsm_op_aux_2_3_ (.Q(FE_OFN53_fsm_op_aux_2_3_), 
	.A(FE_OFN52_fsm_op_aux_2_3_));
   INX1 FE_OFC52_fsm_op_aux_2_3_ (.Q(FE_OFN52_fsm_op_aux_2_3_), 
	.A(\fsm_op_aux_2[3] ));
   INX2 FE_OFC51_fsm_op_aux_2_4_ (.Q(FE_OFN51_fsm_op_aux_2_4_), 
	.A(FE_OFN50_fsm_op_aux_2_4_));
   INX1 FE_OFC50_fsm_op_aux_2_4_ (.Q(FE_OFN50_fsm_op_aux_2_4_), 
	.A(\fsm_op_aux_2[4] ));
   INX6 FE_OFC49_fsm_op_aux_2_5_ (.Q(FE_OFN49_fsm_op_aux_2_5_), 
	.A(FE_OFN48_fsm_op_aux_2_5_));
   INX1 FE_OFC48_fsm_op_aux_2_5_ (.Q(FE_OFN48_fsm_op_aux_2_5_), 
	.A(\fsm_op_aux_2[5] ));
   INX3 FE_OFC47_fsm_op_aux_2_6_ (.Q(FE_OFN47_fsm_op_aux_2_6_), 
	.A(FE_OFN46_fsm_op_aux_2_6_));
   INX1 FE_OFC46_fsm_op_aux_2_6_ (.Q(FE_OFN46_fsm_op_aux_2_6_), 
	.A(\fsm_op_aux_2[6] ));
   INX2 FE_OFC45_fsm_op_aux_2_7_ (.Q(FE_OFN45_fsm_op_aux_2_7_), 
	.A(FE_OFN44_fsm_op_aux_2_7_));
   INX1 FE_OFC44_fsm_op_aux_2_7_ (.Q(FE_OFN44_fsm_op_aux_2_7_), 
	.A(\fsm_op_aux_2[7] ));
   BUX8 FE_OFC43_fsm_opcode_1_ (.Q(FE_OFN43_fsm_opcode_1_), 
	.A(\fsm_opcode[1] ));
   INX6 FE_OFC42_fsm_opcode_4_ (.Q(FE_OFN42_fsm_opcode_4_), 
	.A(FE_OFN41_fsm_opcode_4_));
   INX2 FE_OFC41_fsm_opcode_4_ (.Q(FE_OFN41_fsm_opcode_4_), 
	.A(\fsm_opcode[4] ));
   BUX8 FE_OFC40_n_198 (.Q(FE_OFN40_n_198), 
	.A(n_198));
   BUX8 FE_OFC39_n_23 (.Q(FE_OFN39_n_23), 
	.A(n_23));
   BUX0 FE_OFC38_n_692 (.Q(FE_OFN38_n_692), 
	.A(n_692));
   BUX12 FE_OFC37_n_692 (.Q(FE_OFN37_n_692), 
	.A(n_692));
   INX0 FE_OFC36_fsm_opcode_5_ (.Q(FE_OFN36_fsm_opcode_5_), 
	.A(FE_OFN34_fsm_opcode_5_));
   INX8 FE_OFC35_fsm_opcode_5_ (.Q(FE_OFN35_fsm_opcode_5_), 
	.A(FE_OFN34_fsm_opcode_5_));
   INX4 FE_OFC34_fsm_opcode_5_ (.Q(FE_OFN34_fsm_opcode_5_), 
	.A(\fsm_opcode[5] ));
   BUX0 FE_OFC33_fsm_opcode_5_ (.Q(FE_OFN33_fsm_opcode_5_), 
	.A(\fsm_opcode[5] ));
   BUX12 FE_OFC32_n_78 (.Q(FE_OFN32_n_78), 
	.A(n_78));
   INX8 FE_OFC31_fsm_opcode_7_ (.Q(FE_OFN31_fsm_opcode_7_), 
	.A(FE_OFN30_fsm_opcode_7_));
   INX6 FE_OFC30_fsm_opcode_7_ (.Q(FE_OFN30_fsm_opcode_7_), 
	.A(\fsm_opcode[7] ));
   INX6 FE_OFC29_n_1973 (.Q(FE_OFN29_n_1973), 
	.A(FE_OFN27_n_1973));
   INX1 FE_OFC28_n_1973 (.Q(FE_OFN28_n_1973), 
	.A(FE_OFN27_n_1973));
   INX2 FE_OFC27_n_1973 (.Q(FE_OFN27_n_1973), 
	.A(n_1973));
   INX8 FE_OFC26_n_19 (.Q(FE_OFN26_n_19), 
	.A(FE_OFN25_n_19));
   INX2 FE_OFC25_n_19 (.Q(FE_OFN25_n_19), 
	.A(n_19));
   BUX0 FE_OFC7_n_1735 (.Q(FE_OFN7_n_1735), 
	.A(n_1735));
   BUX0 FE_OFC6_n_1718 (.Q(FE_OFN6_n_1718), 
	.A(n_1718));
   BUX0 FE_OFC5_n_1175 (.Q(FE_OFN5_n_1175), 
	.A(n_1175));
   SDFFX4 cycle_continue_reg (.SE(DFT_sen), 
	.SD(DFT_sdi_3), 
	.QN(n_2244), 
	.Q(n_2221), 
	.D(n_1756), 
	.CN(top_clock_i__L2_N1));
   SDFFX4 \fsm_op1_reg[7]  (.SE(DFT_sen), 
	.SD(FE_OFN96_fsm_op1_6_), 
	.QN(n_2245), 
	.Q(n_325), 
	.D(n_1960), 
	.CN(top_clock_i__L2_N1));
   SDFFX4 \fsm_state_o_reg[0]  (.SE(DFT_sen), 
	.SD(FE_OFN73_fsm_op_aux_1_7_), 
	.QN(DFT_sdo_4), 
	.Q(n_871), 
	.D(n_1491), 
	.CN(top_clock_i__L2_N8));
   SDFFX4 \fsm_op1_reg[0]  (.SE(DFT_sen), 
	.SD(n_2244), 
	.Q(\fsm_op1[0] ), 
	.D(n_1959), 
	.CN(top_clock_i__L2_N8));
   SDFFX4 \fsm_op1_reg[1]  (.SE(DFT_sen), 
	.SD(FE_OFN107_fsm_op1_0_), 
	.Q(\fsm_op1[1] ), 
	.D(n_1958), 
	.CN(top_clock_i__L2_N1));
   SDFFX4 \fsm_op1_reg[2]  (.SE(DFT_sen), 
	.SD(FE_OFN105_fsm_op1_1_), 
	.Q(\fsm_op1[2] ), 
	.D(n_1966), 
	.CN(top_clock_i__L2_N1));
   SDFFQX2 \fsm_op1_reg[3]  (.SE(DFT_sen), 
	.SD(FE_OFN103_fsm_op1_2_), 
	.Q(\fsm_op1[3] ), 
	.D(n_1967), 
	.CN(top_clock_i__L2_N1));
   SDFFQX1 \fsm_op1_reg[4]  (.SE(DFT_sen), 
	.SD(\fsm_op1[3] ), 
	.Q(\fsm_op1[4] ), 
	.D(n_1963), 
	.CN(top_clock_i__L2_N1));
   SDFFSQX2 \fsm_op1_reg[5]  (.SN(logic_1_1_net), 
	.SE(DFT_sen), 
	.SD(FE_OFN101_fsm_op1_4_), 
	.Q(\fsm_op1[5] ), 
	.D(n_1962), 
	.CN(top_clock_i__L2_N1));
   SDFFSQX2 \fsm_op1_reg[6]  (.SN(logic_1_1_net), 
	.SE(DFT_sen), 
	.SD(FE_OFN99_fsm_op1_5_), 
	.Q(\fsm_op1[6] ), 
	.D(n_1961), 
	.CN(top_clock_i__L2_N1));
   SDFRQX1 \fsm_op2_reg[3]  (.SE(DFT_sen), 
	.SD(FE_OFN92_fsm_op2_4_), 
	.Q(\fsm_op2[3] ), 
	.D(n_1957), 
	.C(top_clock_i__L2_N11));
   SDFRQX1 \fsm_op2_reg[4]  (.SE(DFT_sen), 
	.SD(FE_OFN91_fsm_op2_5_), 
	.Q(\fsm_op2[4] ), 
	.D(n_1956), 
	.C(top_clock_i__L2_N1));
   SDFRQX1 \fsm_op2_reg[5]  (.SE(DFT_sen), 
	.SD(FE_OFN70_fsm_op2_6_), 
	.Q(\fsm_op2[5] ), 
	.D(n_1954), 
	.C(top_clock_i__L2_N1));
   SDFFQX2 \fsm_op_aux_1_reg[0]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[7] ), 
	.Q(n_1288), 
	.D(n_1931), 
	.CN(top_clock_i__L2_N2));
   SDFFQX2 \fsm_op_aux_1_reg[1]  (.SE(DFT_sen), 
	.SD(FE_OFN89_n_1288), 
	.Q(\fsm_op_aux_1[1] ), 
	.D(n_1940), 
	.CN(top_clock_i__L2_N2));
   SDFFQX2 \fsm_op_aux_1_reg[2]  (.SE(DFT_sen), 
	.SD(FE_OFN86_fsm_op_aux_1_1_), 
	.Q(\fsm_op_aux_1[2] ), 
	.D(n_1939), 
	.CN(top_clock_i__L2_N2));
   SDFFQX2 \fsm_op_aux_1_reg[3]  (.SE(DFT_sen), 
	.SD(FE_OFN84_fsm_op_aux_1_2_), 
	.Q(n_1402), 
	.D(n_1936), 
	.CN(top_clock_i__L2_N2));
   SDFFQX2 \fsm_op_aux_1_reg[4]  (.SE(DFT_sen), 
	.SD(FE_OFN81_n_1402), 
	.Q(\fsm_op_aux_1[4] ), 
	.D(n_1935), 
	.CN(top_clock_i__L2_N2));
   SDFFQX2 \fsm_op_aux_1_reg[5]  (.SE(DFT_sen), 
	.SD(FE_OFN79_fsm_op_aux_1_4_), 
	.Q(n_1334), 
	.D(n_1933), 
	.CN(top_clock_i__L2_N2));
   SDFFQX2 \fsm_op_aux_1_reg[6]  (.SE(DFT_sen), 
	.SD(FE_OFN77_n_1334), 
	.Q(\fsm_op_aux_1[6] ), 
	.D(n_1934), 
	.CN(top_clock_i__L2_N11));
   SDFFQX2 \fsm_op_aux_1_reg[7]  (.SE(DFT_sen), 
	.SD(FE_OFN75_fsm_op_aux_1_6_), 
	.Q(\fsm_op_aux_1[7] ), 
	.D(n_1932), 
	.CN(top_clock_i__L2_N2));
   AO221X0 p4984A (.Q(n_1967), 
	.E(n_1952), 
	.D(n_1964), 
	.C(fsm_ram_data_i[3]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[3]));
   AO221X0 p4984A55994 (.Q(n_1966), 
	.E(n_1953), 
	.D(n_1964), 
	.C(fsm_ram_data_i[2]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[2]));
   AO221X0 p5004A (.Q(n_1963), 
	.E(n_1950), 
	.D(n_1964), 
	.C(fsm_ram_data_i[4]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[4]));
   AO221X0 p4933A (.Q(n_1962), 
	.E(n_1949), 
	.D(n_1964), 
	.C(fsm_ram_data_i[5]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[5]));
   AO221X0 p4933A55995 (.Q(n_1961), 
	.E(n_1948), 
	.D(n_1964), 
	.C(fsm_ram_data_i[6]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[6]));
   AO221X0 p4991A (.Q(n_1960), 
	.E(n_1947), 
	.D(n_1964), 
	.C(fsm_ram_data_i[7]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[7]));
   AO221X0 p4912A (.Q(n_1959), 
	.E(n_1946), 
	.D(n_1964), 
	.C(fsm_ram_data_i[0]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[0]));
   AO221X0 p4912A55996 (.Q(n_1958), 
	.E(n_1945), 
	.D(n_1964), 
	.C(fsm_ram_data_i[1]), 
	.B(n_1965), 
	.A(fsm_rom_data_i[1]));
   ON211X0 p4430A (.Q(n_1957), 
	.D(n_1882), 
	.C(n_1944), 
	.B(n_1770), 
	.A(n_1955));
   ON211X0 p4430A55997 (.Q(n_1956), 
	.D(n_1879), 
	.C(n_1943), 
	.B(n_1768), 
	.A(n_1955));
   SDFRQX1 \fsm_op2_reg[2]  (.SE(DFT_sen), 
	.SD(FE_OFN94_fsm_op2_3_), 
	.Q(\fsm_op2[2] ), 
	.D(n_1920), 
	.C(top_clock_i__L2_N1));
   SDFRQX1 \fsm_op2_reg[6]  (.SE(DFT_sen), 
	.SD(FE_OFN66_fsm_op2_0_), 
	.Q(\fsm_op2[6] ), 
	.D(n_1919), 
	.C(top_clock_i__L2_N1));
   SDFRQX1 \fsm_op2_reg[7]  (.SE(DFT_sen), 
	.SD(FE_OFN63_fsm_op2_1_), 
	.Q(FE_OFN67_n_202), 
	.D(n_1918), 
	.C(top_clock_i__L2_N2));
   SDFRQX1 \fsm_op2_reg[0]  (.SE(DFT_sen), 
	.SD(fsm_int_rdy_o), 
	.Q(\fsm_op2[0] ), 
	.D(n_1905), 
	.C(top_clock_i__L2_N2));
   SDFRQX1 \fsm_op2_reg[1]  (.SE(DFT_sen), 
	.SD(FE_OFN72_fsm_op2_2_), 
	.Q(\fsm_op2[1] ), 
	.D(n_1904), 
	.C(top_clock_i__L2_N1));
   ON211X0 p4472A (.Q(n_1954), 
	.D(n_1916), 
	.C(n_1878), 
	.B(n_1785), 
	.A(n_1955));
   ON21X0 p7703A (.Q(n_1953), 
	.C(n_1922), 
	.B(n_1487), 
	.A(n_1951));
   ON21X0 p7706A (.Q(n_1952), 
	.C(n_1930), 
	.B(n_1488), 
	.A(n_1951));
   ON21X0 p7917A (.Q(n_1950), 
	.C(n_1929), 
	.B(n_1489), 
	.A(n_1951));
   ON21X0 p7883A (.Q(n_1949), 
	.C(n_1926), 
	.B(n_1499), 
	.A(n_1951));
   ON21X0 p7866A (.Q(n_1948), 
	.C(n_1925), 
	.B(n_1496), 
	.A(n_1951));
   ON21X0 p8037A (.Q(n_1947), 
	.C(n_1924), 
	.B(n_1492), 
	.A(n_1951));
   ON21X0 p7714A (.Q(n_1946), 
	.C(n_1923), 
	.B(n_1486), 
	.A(n_1951));
   ON21X0 p7704A (.Q(n_1945), 
	.C(n_1921), 
	.B(n_1485), 
	.A(n_1951));
   AN221X0 p5000A (.Q(n_1944), 
	.E(n_1903), 
	.D(fsm_ram_data_i[3]), 
	.C(n_1941), 
	.B(n_1942), 
	.A(fsm_sfr_data_i[3]));
   AN221X0 p5000A56003 (.Q(n_1943), 
	.E(n_1902), 
	.D(fsm_ram_data_i[4]), 
	.C(n_1941), 
	.B(n_1942), 
	.A(fsm_sfr_data_i[4]));
   AO221X0 p4912A56004 (.Q(n_1940), 
	.E(n_1915), 
	.D(fsm_sfr_data_i[1]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[1]));
   AO221X0 p4984A56005 (.Q(n_1939), 
	.E(n_1914), 
	.D(fsm_sfr_data_i[2]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[2]));
   AO221X0 p4984A56006 (.Q(n_1936), 
	.E(n_1911), 
	.D(fsm_sfr_data_i[3]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[3]));
   AO221X0 p4984A56007 (.Q(n_1935), 
	.E(n_1910), 
	.D(fsm_sfr_data_i[4]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[4]));
   AO221X0 p4984A56008 (.Q(n_1934), 
	.E(n_1908), 
	.D(fsm_sfr_data_i[6]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[6]));
   AO221X0 p4984A56009 (.Q(n_1933), 
	.E(n_1909), 
	.D(fsm_sfr_data_i[5]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[5]));
   AO221X0 p4984A56010 (.Q(n_1932), 
	.E(n_1907), 
	.D(fsm_sfr_data_i[7]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[7]));
   AO221X0 p4912A56011 (.Q(n_1931), 
	.E(n_1906), 
	.D(fsm_sfr_data_i[0]), 
	.C(n_1937), 
	.B(n_1938), 
	.A(fsm_rom_data_i[0]));
   AN221X0 p7960A (.Q(n_1930), 
	.E(n_1889), 
	.D(fsm_pc_i[3]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(\fsm_op1[3] ));
   AN221X0 p7916A (.Q(n_1929), 
	.E(n_1888), 
	.D(fsm_pc_i[4]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(FE_OFN101_fsm_op1_4_));
   AN221X0 p7882A (.Q(n_1926), 
	.E(n_1887), 
	.D(fsm_pc_i[5]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(FE_OFN99_fsm_op1_5_));
   AN221X0 p7981A (.Q(n_1925), 
	.E(n_1886), 
	.D(fsm_pc_i[6]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(FE_OFN96_fsm_op1_6_));
   AN221X0 p8037A56012 (.Q(n_1924), 
	.E(n_1885), 
	.D(fsm_pc_i[7]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(n_325));
   AN221X0 p7935A (.Q(n_1923), 
	.E(n_1884), 
	.D(fsm_pc_i[0]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(FE_OFN107_fsm_op1_0_));
   AN221X0 p7952A (.Q(n_1922), 
	.E(n_1893), 
	.D(fsm_pc_i[2]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(FE_OFN103_fsm_op1_2_));
   AN221X0 p7924A (.Q(n_1921), 
	.E(n_1894), 
	.D(fsm_pc_i[1]), 
	.C(n_1927), 
	.B(n_1928), 
	.A(FE_OFN105_fsm_op1_1_));
   ON211X0 p4432A (.Q(n_1920), 
	.D(n_1883), 
	.C(n_1900), 
	.B(n_1771), 
	.A(n_1955));
   ON221X0 p4494A (.Q(n_1919), 
	.E(n_1877), 
	.D(n_1955), 
	.C(n_1784), 
	.B(n_1917), 
	.A(n_961));
   ON221X0 p4494A56013 (.Q(n_1918), 
	.E(n_1876), 
	.D(n_1955), 
	.C(n_1783), 
	.B(n_1917), 
	.A(n_1171));
   AN32X0 p8890A (.Q(n_1916), 
	.E(n_1895), 
	.D(FE_OFN91_fsm_op2_5_), 
	.C(n_1897), 
	.B(n_1870), 
	.A(fsm_int_vect_i[2]));
   AO22X0 p10001A (.Q(n_1915), 
	.D(fsm_alu_result_i[1]), 
	.C(n_1912), 
	.B(FE_OFN86_fsm_op_aux_1_1_), 
	.A(n_1913));
   AO22X0 p10001A56014 (.Q(n_1914), 
	.D(fsm_alu_result_i[2]), 
	.C(n_1912), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(n_1913));
   AO22X0 p10001A56015 (.Q(n_1911), 
	.D(fsm_alu_result_i[3]), 
	.C(n_1912), 
	.B(FE_OFN81_n_1402), 
	.A(n_1913));
   AO22X0 p10001A56016 (.Q(n_1910), 
	.D(fsm_alu_result_i[4]), 
	.C(n_1912), 
	.B(FE_OFN79_fsm_op_aux_1_4_), 
	.A(n_1913));
   AO22X0 p10001A56017 (.Q(n_1909), 
	.D(fsm_alu_result_i[5]), 
	.C(n_1912), 
	.B(FE_OFN77_n_1334), 
	.A(n_1913));
   AO22X0 p10001A56018 (.Q(n_1908), 
	.D(fsm_alu_result_i[6]), 
	.C(n_1912), 
	.B(FE_OFN75_fsm_op_aux_1_6_), 
	.A(n_1913));
   AO22X0 p10001A56019 (.Q(n_1907), 
	.D(fsm_alu_result_i[7]), 
	.C(n_1912), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_1913));
   AO22X0 p10001A56020 (.Q(n_1906), 
	.D(fsm_alu_result_i[0]), 
	.C(n_1912), 
	.B(FE_OFN89_n_1288), 
	.A(n_1913));
   ON21X0 p4258A (.Q(n_1905), 
	.C(n_1899), 
	.B(n_1847), 
	.A(n_1955));
   ON21X0 p4258A56021 (.Q(n_1904), 
	.C(n_1896), 
	.B(n_1844), 
	.A(n_1955));
   NA3X0 p8903A (.Q(n_1903), 
	.C(n_1901), 
	.B(n_1875), 
	.A(n_1873));
   NA3X0 p8903A56022 (.Q(n_1902), 
	.C(n_1901), 
	.B(n_1874), 
	.A(n_1871));
   SDFRQX2 \fsm_op_aux_2_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(\fsm_op_aux_2[0] ), 
	.D(n_1868), 
	.C(top_clock_i__L2_N1));
   SDFRQX2 \fsm_op_aux_2_reg[1]  (.SE(DFT_sen), 
	.SD(FE_OFN61_fsm_op_aux_2_0_), 
	.Q(\fsm_op_aux_2[1] ), 
	.D(n_1867), 
	.C(top_clock_i__L2_N4));
   AN222X0 p5138A (.Q(n_1900), 
	.F(fsm_ram_data_i[2]), 
	.E(n_1941), 
	.D(n_1942), 
	.C(fsm_sfr_data_i[2]), 
	.B(n_1898), 
	.A(FE_OFN72_fsm_op2_2_));
   SDFRQX2 \fsm_op_aux_2_reg[2]  (.SE(DFT_sen), 
	.SD(FE_OFN58_fsm_op_aux_2_1_), 
	.Q(\fsm_op_aux_2[2] ), 
	.D(n_1863), 
	.C(top_clock_i__L2_N10));
   SDFRQX2 \fsm_op_aux_2_reg[3]  (.SE(DFT_sen), 
	.SD(FE_OFN56_fsm_op_aux_2_2_), 
	.Q(\fsm_op_aux_2[3] ), 
	.D(n_1861), 
	.C(top_clock_i__L2_N11));
   SDFRQX2 \fsm_op_aux_2_reg[4]  (.SE(DFT_sen), 
	.SD(FE_OFN54_fsm_op_aux_2_3_), 
	.Q(\fsm_op_aux_2[4] ), 
	.D(n_1857), 
	.C(top_clock_i__L2_N11));
   SDFRQX2 \fsm_op_aux_2_reg[5]  (.SE(DFT_sen), 
	.SD(FE_OFN51_fsm_op_aux_2_4_), 
	.Q(\fsm_op_aux_2[5] ), 
	.D(n_1855), 
	.C(fsm_clock_i));
   SDFRQX2 \fsm_op_aux_2_reg[6]  (.SE(DFT_sen), 
	.SD(FE_OFN49_fsm_op_aux_2_5_), 
	.Q(\fsm_op_aux_2[6] ), 
	.D(n_1853), 
	.C(top_clock_i__L2_N1));
   SDFRQX2 \fsm_op_aux_2_reg[7]  (.SE(DFT_sen), 
	.SD(FE_OFN47_fsm_op_aux_2_6_), 
	.Q(\fsm_op_aux_2[7] ), 
	.D(n_1851), 
	.C(top_clock_i__L2_N1));
   AN21X0 p9894A (.Q(n_1899), 
	.C(n_1897), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_1898));
   AN21X0 p9894A56031 (.Q(n_1896), 
	.C(n_1897), 
	.B(FE_OFN63_fsm_op2_1_), 
	.A(n_1898));
   INX0 p9200A (.Q(n_1895), 
	.A(n_1917));
   NO5I2X0 p8994A (.Q(n_1928), 
	.E(n_1965), 
	.D(n_1927), 
	.C(n_1964), 
	.BN(n_1822), 
	.AN(n_1865));
   AO222X0 p9463A (.Q(n_1894), 
	.F(n_1890), 
	.E(fsm_alu_result_i[9]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[1]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[1]));
   AO222X0 p9463A56032 (.Q(n_1893), 
	.F(n_1890), 
	.E(fsm_alu_result_i[10]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[2]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[2]));
   AO222X0 p9463A56033 (.Q(n_1889), 
	.F(n_1890), 
	.E(fsm_alu_result_i[11]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[3]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[3]));
   AO222X0 p9483A (.Q(n_1888), 
	.F(n_1890), 
	.E(fsm_alu_result_i[12]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[4]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[4]));
   AO222X0 p9412A (.Q(n_1887), 
	.F(n_1890), 
	.E(fsm_alu_result_i[13]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[5]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[5]));
   AO222X0 p9412A56034 (.Q(n_1886), 
	.F(n_1890), 
	.E(fsm_alu_result_i[14]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[6]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[6]));
   AO222X0 p9470A (.Q(n_1885), 
	.F(n_1890), 
	.E(fsm_alu_result_i[15]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[7]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[7]));
   AO222X0 p9463A56035 (.Q(n_1884), 
	.F(n_1890), 
	.E(fsm_alu_result_i[8]), 
	.D(n_1891), 
	.C(fsm_sfr_data_i[0]), 
	.B(n_1892), 
	.A(fsm_alu_result_i[0]));
   ON321X0 p10003A (.Q(n_1913), 
	.F(n_1849), 
	.E(n_1848), 
	.D(n_2136), 
	.C(n_1869), 
	.B(n_1864), 
	.A(n_1667));
   AN22X0 p4431A (.Q(n_1883), 
	.D(fsm_rom_data_i[2]), 
	.C(n_1880), 
	.B(n_1862), 
	.A(n_1881));
   AN22X0 p4429A (.Q(n_1882), 
	.D(fsm_rom_data_i[3]), 
	.C(n_1880), 
	.B(n_1860), 
	.A(n_1881));
   AN22X0 p4429A56036 (.Q(n_1879), 
	.D(fsm_rom_data_i[4]), 
	.C(n_1880), 
	.B(n_1856), 
	.A(n_1881));
   AN22X0 p4471A (.Q(n_1878), 
	.D(fsm_rom_data_i[5]), 
	.C(n_1880), 
	.B(n_1854), 
	.A(n_1881));
   AN22X0 p4492A (.Q(n_1877), 
	.D(fsm_rom_data_i[6]), 
	.C(n_1880), 
	.B(n_1852), 
	.A(n_1881));
   NO2X0 p9201A (.Q(n_1917), 
	.B(n_1872), 
	.A(n_1898));
   AN22X0 p4492A56037 (.Q(n_1876), 
	.D(fsm_rom_data_i[7]), 
	.C(n_1880), 
	.B(n_1850), 
	.A(n_1881));
   AN32X0 p8904A (.Q(n_1875), 
	.E(n_1830), 
	.D(FE_OFN94_fsm_op2_3_), 
	.C(n_1897), 
	.B(n_1501), 
	.A(fsm_int_vect_i[1]));
   AN32X0 p8904A56038 (.Q(n_1874), 
	.E(n_1830), 
	.D(FE_OFN92_fsm_op2_4_), 
	.C(n_1897), 
	.B(fsm_int_vect_i[0]), 
	.A(fsm_int_vect_i[1]));
   NA2X0 p9220A (.Q(n_1873), 
	.B(FE_OFN94_fsm_op2_3_), 
	.A(n_1872));
   NA2X0 p9220A56039 (.Q(n_1871), 
	.B(FE_OFN92_fsm_op2_4_), 
	.A(n_1872));
   NA3I1X0 p8954A (.Q(n_1901), 
	.C(fsm_int_vect_i[2]), 
	.B(n_1897), 
	.AN(n_1870));
   ON22X0 p10792A (.Q(n_1938), 
	.D(n_2136), 
	.C(n_1746), 
	.B(n_1666), 
	.A(n_1869));
   SDFRQX2 lcall_hardware_flag_reg (.SE(DFT_sen), 
	.SD(FE_OFN29_n_1973), 
	.Q(DFT_sdo_2), 
	.D(n_1825), 
	.C(top_clock_i__L2_N2));
   ON21X0 p9069A (.Q(n_1898), 
	.C(n_1836), 
	.B(n_1625), 
	.A(n_1955));
   ON211X0 p4473A (.Q(n_1868), 
	.D(n_1835), 
	.C(n_1824), 
	.B(n_1777), 
	.A(n_1866));
   ON211X0 p4473A56041 (.Q(n_1867), 
	.D(n_1834), 
	.C(n_1823), 
	.B(n_1782), 
	.A(n_1866));
   INX0 p8994A56042 (.Q(n_1865), 
	.A(n_1891));
   NO2I1X0 p10910A (.Q(n_1937), 
	.B(n_1869), 
	.AN(n_1864));
   AO221X0 p4242A (.Q(n_1863), 
	.E(n_1843), 
	.D(n_1858), 
	.C(fsm_rom_data_i[2]), 
	.B(n_1859), 
	.A(n_1862));
   AO221X0 p4240A (.Q(n_1861), 
	.E(n_1842), 
	.D(n_1858), 
	.C(fsm_rom_data_i[3]), 
	.B(n_1859), 
	.A(n_1860));
   AO221X0 p4240A56043 (.Q(n_1857), 
	.E(n_1839), 
	.D(n_1858), 
	.C(fsm_rom_data_i[4]), 
	.B(n_1859), 
	.A(n_1856));
   AO221X0 p4295A (.Q(n_1855), 
	.E(n_1838), 
	.D(n_1858), 
	.C(fsm_rom_data_i[5]), 
	.B(n_1859), 
	.A(n_1854));
   AO221X0 p4295A56044 (.Q(n_1853), 
	.E(n_1837), 
	.D(n_1858), 
	.C(fsm_rom_data_i[6]), 
	.B(n_1859), 
	.A(n_1852));
   AO221X0 p4295A56045 (.Q(n_1851), 
	.E(n_1840), 
	.D(n_1858), 
	.C(fsm_rom_data_i[7]), 
	.B(n_1859), 
	.A(n_1850));
   NO2X0 p9185A (.Q(n_1881), 
	.B(n_1818), 
	.A(n_1955));
   NO2X0 p9476A (.Q(n_1941), 
	.B(n_1732), 
	.A(n_1955));
   NO2X0 p9420A (.Q(n_1942), 
	.B(n_1644), 
	.A(n_1955));
   NO2X0 p9213A (.Q(n_1872), 
	.B(n_1624), 
	.A(n_1955));
   AN21X0 p9346A (.Q(n_1880), 
	.C(n_1955), 
	.B(n_1846), 
	.A(n_1845));
   AO22X0 p8991A (.Q(n_1891), 
	.D(FE_OFN120_n_2044), 
	.C(n_2103), 
	.B(n_1736), 
	.A(n_1826));
   ON21X1 p9310A (.Q(n_1964), 
	.C(n_1566), 
	.B(n_1698), 
	.A(n_1831));
   NO2X0 p8901A (.Q(n_1897), 
	.B(n_2043), 
	.A(n_1830));
   AND2X0 p9124A (.Q(n_1927), 
	.B(n_2031), 
	.A(n_1826));
   NA2X0 p10086A (.Q(n_1869), 
	.B(n_274), 
	.A(n_1849));
   AND3X0 p10813A (.Q(n_1912), 
	.C(n_1588), 
	.B(n_1848), 
	.A(n_1849));
   OA221X0 p4258A56046 (.Q(n_1847), 
	.E(n_1819), 
	.D(n_1845), 
	.C(n_1763), 
	.B(n_1846), 
	.A(n_1763));
   OA221X0 p4258A56047 (.Q(n_1844), 
	.E(n_1817), 
	.D(n_1845), 
	.C(n_1765), 
	.B(n_1846), 
	.A(n_1765));
   SDFRQX4 \fsm_opcode_reg[1]  (.SE(DFT_sen), 
	.SD(FE_OFN40_n_198), 
	.Q(\fsm_opcode[1] ), 
	.D(n_1800), 
	.C(top_clock_i__L2_N2));
   SDFRQX4 \fsm_opcode_reg[4]  (.SE(DFT_sen), 
	.SD(n_692), 
	.Q(\fsm_opcode[4] ), 
	.D(n_1799), 
	.C(top_clock_i__L2_N5));
   ON221X0 p4437A (.Q(n_1843), 
	.E(n_1816), 
	.D(n_1693), 
	.C(n_1841), 
	.B(n_1866), 
	.A(n_1780));
   ON221X0 p4435A (.Q(n_1842), 
	.E(n_1815), 
	.D(n_1691), 
	.C(n_1841), 
	.B(n_1866), 
	.A(n_1778));
   ON221X0 p4490A (.Q(n_1840), 
	.E(n_1813), 
	.D(n_1682), 
	.C(n_1841), 
	.B(n_1866), 
	.A(n_1772));
   ON221X0 p4435A56050 (.Q(n_1839), 
	.E(n_1810), 
	.D(n_1688), 
	.C(n_1841), 
	.B(n_1866), 
	.A(n_1775));
   ON221X0 p4490A56051 (.Q(n_1838), 
	.E(n_1809), 
	.D(n_1686), 
	.C(n_1841), 
	.B(n_1866), 
	.A(n_1774));
   ON221X0 p4490A56052 (.Q(n_1837), 
	.E(n_1814), 
	.D(n_1684), 
	.C(n_1841), 
	.B(n_1866), 
	.A(n_1773));
   NA2X0 p9081A (.Q(n_1955), 
	.B(n_2033), 
	.A(n_1836));
   AN222X0 p15599A (.Q(n_1835), 
	.F(n_1812), 
	.E(n_1776), 
	.D(n_1832), 
	.C(n_1675), 
	.B(n_1833), 
	.A(FE_OFN61_fsm_op_aux_2_0_));
   AN222X0 p15599A56053 (.Q(n_1834), 
	.F(n_1812), 
	.E(n_1781), 
	.D(n_1832), 
	.C(n_1672), 
	.B(n_1833), 
	.A(FE_OFN58_fsm_op_aux_2_1_));
   AN21X1 p9823A (.Q(n_1965), 
	.C(n_1831), 
	.B(n_1749), 
	.A(n_1760));
   SDFRQX4 \fsm_opcode_reg[0]  (.SE(DFT_sen), 
	.SD(FE_OFN45_fsm_op_aux_2_7_), 
	.Q(n_198), 
	.D(n_1792), 
	.C(top_clock_i__L2_N1));
   SDFRX4 \fsm_opcode_reg[2]  (.SE(DFT_sen), 
	.SD(FE_OFN43_fsm_opcode_1_), 
	.Q(n_23), 
	.D(n_1793), 
	.C(top_clock_i__L2_N2));
   SDFRQX4 \fsm_opcode_reg[3]  (.SE(DFT_sen), 
	.SD(FE_OFN39_n_23), 
	.Q(n_692), 
	.D(n_1794), 
	.C(top_clock_i__L2_N2));
   SDFRQX2 \fsm_opcode_reg[5]  (.SE(DFT_sen), 
	.SD(FE_OFN42_fsm_opcode_4_), 
	.Q(\fsm_opcode[5] ), 
	.D(n_1791), 
	.C(top_clock_i__L2_N2));
   SDFRQX4 \fsm_opcode_reg[6]  (.SE(DFT_sen), 
	.SD(FE_OFN33_fsm_opcode_5_), 
	.Q(n_78), 
	.D(n_1790), 
	.C(top_clock_i__L2_N2));
   SDFRX4 \fsm_opcode_reg[7]  (.SE(DFT_sen), 
	.SD(FE_OFN32_n_78), 
	.Q(\fsm_opcode[7] ), 
	.D(n_1789), 
	.C(top_clock_i__L2_N2));
   INX0 p9388A (.Q(n_1830), 
	.A(n_1836));
   INX0 p8994A56061 (.Q(n_1826), 
	.A(n_1831));
   AO211X0 p10085A (.Q(n_1849), 
	.D(n_1801), 
	.C(n_1821), 
	.B(n_274), 
	.A(n_1748));
   ON31X0 p10088A (.Q(n_1825), 
	.D(n_1808), 
	.C(n_1820), 
	.B(DFT_sdo_2), 
	.A(n_2043));
   AN22X0 p4472A56062 (.Q(n_1824), 
	.D(fsm_rom_data_i[0]), 
	.C(n_1858), 
	.B(n_1806), 
	.A(n_1859));
   AN22X0 p4472A56063 (.Q(n_1823), 
	.D(fsm_rom_data_i[1]), 
	.C(n_1858), 
	.B(n_1804), 
	.A(n_1859));
   NO3X0 p9823A56064 (.Q(n_1822), 
	.C(n_1821), 
	.B(n_1795), 
	.A(n_1807));
   NA2X0 p8544A (.Q(n_1836), 
	.B(n_1802), 
	.A(n_1820));
   AO221X0 p9045A (.Q(n_1831), 
	.E(n_2042), 
	.D(n_1767), 
	.C(n_1766), 
	.B(DFT_sdo_2), 
	.A(n_1561));
   OA21X0 p4258A56065 (.Q(n_1819), 
	.C(n_1788), 
	.B(n_1805), 
	.A(n_1818));
   OA21X0 p4258A56066 (.Q(n_1817), 
	.C(n_1787), 
	.B(n_1803), 
	.A(n_1818));
   AN22X0 p16255A (.Q(n_1816), 
	.D(n_1657), 
	.C(n_1832), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(n_1833));
   AN22X0 p16255A56067 (.Q(n_1815), 
	.D(n_1653), 
	.C(n_1832), 
	.B(FE_OFN54_fsm_op_aux_2_3_), 
	.A(n_1833));
   AN22X0 p16255A56068 (.Q(n_1814), 
	.D(n_1649), 
	.C(n_1832), 
	.B(FE_OFN47_fsm_op_aux_2_6_), 
	.A(n_1833));
   AN22X0 p16255A56069 (.Q(n_1813), 
	.D(n_1647), 
	.C(n_1832), 
	.B(FE_OFN45_fsm_op_aux_2_7_), 
	.A(n_1833));
   INX0 p18541A (.Q(n_1812), 
	.A(n_1841));
   AN22X0 p16255A56071 (.Q(n_1810), 
	.D(n_1645), 
	.C(n_1832), 
	.B(FE_OFN51_fsm_op_aux_2_4_), 
	.A(n_1833));
   AN22X0 p16255A56072 (.Q(n_1809), 
	.D(n_1651), 
	.C(n_1832), 
	.B(FE_OFN49_fsm_op_aux_2_5_), 
	.A(n_1833));
   ON31X0 p10088A56073 (.Q(n_1808), 
	.D(DFT_sdo_2), 
	.C(n_1761), 
	.B(n_1744), 
	.A(n_1571));
   OR2X0 p9822A (.Q(n_1807), 
	.B(n_1890), 
	.A(n_1892));
   INX0 p4473A56074 (.Q(n_1806), 
	.A(n_1805));
   INX0 p4473A56075 (.Q(n_1804), 
	.A(n_1803));
   OR2X0 p18368A (.Q(n_1841), 
	.B(n_2043), 
	.A(n_1833));
   ON31X0 p17225A (.Q(n_1802), 
	.D(n_2033), 
	.C(n_1754), 
	.B(n_1664), 
	.A(n_2047));
   AN31X0 p10085A56076 (.Q(n_1801), 
	.D(n_2136), 
	.C(n_1752), 
	.B(n_1697), 
	.A(n_1601));
   AO221X0 p5027A (.Q(n_1800), 
	.E(n_1796), 
	.D(n_1797), 
	.C(FE_OFN43_fsm_opcode_1_), 
	.B(n_1798), 
	.A(fsm_rom_data_i[1]));
   AO221X0 p5100A (.Q(n_1799), 
	.E(n_1796), 
	.D(n_1797), 
	.C(FE_OFN42_fsm_opcode_4_), 
	.B(n_1798), 
	.A(fsm_rom_data_i[4]));
   INX0 p10620A (.Q(n_1795), 
	.A(n_1951));
   AN22X0 p4275A (.Q(n_1805), 
	.D(n_325), 
	.C(fsm_sfr_data_i[0]), 
	.B(fsm_ram_data_i[0]), 
	.A(FE_OFN125_n_2135));
   AN22X0 p4275A56077 (.Q(n_1803), 
	.D(n_325), 
	.C(fsm_sfr_data_i[1]), 
	.B(fsm_ram_data_i[1]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p4242A56078 (.Q(n_1862), 
	.D(n_325), 
	.C(fsm_sfr_data_i[2]), 
	.B(fsm_ram_data_i[2]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p4240A56079 (.Q(n_1860), 
	.D(n_325), 
	.C(fsm_sfr_data_i[3]), 
	.B(fsm_ram_data_i[3]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p4240A56080 (.Q(n_1856), 
	.D(n_325), 
	.C(fsm_sfr_data_i[4]), 
	.B(fsm_ram_data_i[4]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p4295A56081 (.Q(n_1854), 
	.D(n_325), 
	.C(fsm_sfr_data_i[5]), 
	.B(fsm_ram_data_i[5]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p4295A56082 (.Q(n_1852), 
	.D(n_325), 
	.C(fsm_sfr_data_i[6]), 
	.B(fsm_ram_data_i[6]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p4295A56083 (.Q(n_1850), 
	.D(n_325), 
	.C(fsm_sfr_data_i[7]), 
	.B(fsm_ram_data_i[7]), 
	.A(FE_OFN125_n_2135));
   AO22X0 p5395A (.Q(n_1794), 
	.D(n_692), 
	.C(n_1797), 
	.B(fsm_rom_data_i[3]), 
	.A(n_1798));
   AO22X0 p5395A56084 (.Q(n_1793), 
	.D(FE_OFN39_n_23), 
	.C(n_1797), 
	.B(fsm_rom_data_i[2]), 
	.A(n_1798));
   AO22X0 p5322A (.Q(n_1792), 
	.D(FE_OFN40_n_198), 
	.C(n_1797), 
	.B(fsm_rom_data_i[0]), 
	.A(n_1798));
   AO22X0 p5395A56085 (.Q(n_1791), 
	.D(FE_OFN33_fsm_opcode_5_), 
	.C(n_1797), 
	.B(fsm_rom_data_i[5]), 
	.A(n_1798));
   AO22X0 p5395A56086 (.Q(n_1790), 
	.D(FE_OFN32_n_78), 
	.C(n_1797), 
	.B(fsm_rom_data_i[6]), 
	.A(n_1798));
   AO22X0 p5395A56087 (.Q(n_1789), 
	.D(FE_OFN31_fsm_opcode_7_), 
	.C(n_1797), 
	.B(fsm_rom_data_i[7]), 
	.A(n_1798));
   NA2X0 p10619A (.Q(n_1951), 
	.B(n_2030), 
	.A(n_1757));
   AND3X0 p9824A (.Q(n_1890), 
	.C(n_2221), 
	.B(n_2001), 
	.A(n_1757));
   AN221X0 p4261A (.Q(n_1788), 
	.E(n_1728), 
	.D(fsm_ram_data_i[0]), 
	.C(n_1786), 
	.B(fsm_pc_i[8]), 
	.A(n_2031));
   AN221X0 p4261A56088 (.Q(n_1787), 
	.E(n_1727), 
	.D(fsm_ram_data_i[1]), 
	.C(n_1786), 
	.B(fsm_pc_i[9]), 
	.A(n_2031));
   AN221X0 p5101A (.Q(n_1785), 
	.E(n_1724), 
	.D(fsm_ram_data_i[5]), 
	.C(n_1786), 
	.B(n_2031), 
	.A(fsm_pc_i[13]));
   AN221X0 p5014A (.Q(n_1784), 
	.E(n_1723), 
	.D(fsm_ram_data_i[6]), 
	.C(n_1786), 
	.B(n_2031), 
	.A(fsm_pc_i[14]));
   AN221X0 p5014A56089 (.Q(n_1783), 
	.E(n_1721), 
	.D(fsm_ram_data_i[7]), 
	.C(n_1786), 
	.B(n_2031), 
	.A(fsm_pc_i[15]));
   AN221X0 p5064A (.Q(n_1782), 
	.E(n_1674), 
	.D(fsm_ram_data_i[1]), 
	.C(n_1779), 
	.B(n_1781), 
	.A(n_2030));
   AN21X0 p4435A56090 (.Q(n_1780), 
	.C(n_1694), 
	.B(fsm_ram_data_i[2]), 
	.A(n_1779));
   AN21X0 p4434A (.Q(n_1778), 
	.C(n_1692), 
	.B(fsm_ram_data_i[3]), 
	.A(n_1779));
   AN221X0 p5064A56091 (.Q(n_1777), 
	.E(n_1676), 
	.D(fsm_ram_data_i[0]), 
	.C(n_1779), 
	.B(n_1776), 
	.A(n_2030));
   AN21X0 p4434A56092 (.Q(n_1775), 
	.C(n_1689), 
	.B(fsm_ram_data_i[4]), 
	.A(n_1779));
   AN21X0 p4488A (.Q(n_1774), 
	.C(n_1687), 
	.B(fsm_ram_data_i[5]), 
	.A(n_1779));
   AN21X0 p4488A56093 (.Q(n_1773), 
	.C(n_1685), 
	.B(fsm_ram_data_i[6]), 
	.A(n_1779));
   AN21X0 p4488A56094 (.Q(n_1772), 
	.C(n_1683), 
	.B(fsm_ram_data_i[7]), 
	.A(n_1779));
   AN221X0 p5050A (.Q(n_1771), 
	.E(n_1713), 
	.D(fsm_ram_data_i[2]), 
	.C(n_1769), 
	.B(n_2031), 
	.A(fsm_pc_i[10]));
   AN221X0 p5048A (.Q(n_1770), 
	.E(n_1712), 
	.D(fsm_ram_data_i[3]), 
	.C(n_1769), 
	.B(n_2031), 
	.A(fsm_pc_i[11]));
   AN221X0 p5048A56095 (.Q(n_1768), 
	.E(n_1710), 
	.D(fsm_ram_data_i[4]), 
	.C(n_1769), 
	.B(n_2031), 
	.A(fsm_pc_i[12]));
   SDFRQX2 fsm_int_na_o_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(fsm_int_na_o), 
	.D(n_1745), 
	.C(top_clock_i__L2_N10));
   NO3X1 p17698A (.Q(n_1833), 
	.C(n_2106), 
	.B(n_2107), 
	.A(n_1755));
   NO3X0 p9048A (.Q(n_1767), 
	.C(n_1737), 
	.B(n_1759), 
	.A(n_1750));
   AN21X1 p10461A (.Q(n_1892), 
	.C(n_1766), 
	.B(n_1565), 
	.A(n_1751));
   INX0 p5155A (.Q(n_1765), 
	.A(fsm_rom_data_i[1]));
   INX0 p5155A56097 (.Q(n_1763), 
	.A(fsm_rom_data_i[0]));
   AND2X0 p10087A (.Q(n_1761), 
	.B(n_2043), 
	.A(n_1820));
   AN21X0 p11250A (.Q(n_1760), 
	.C(n_1759), 
	.B(FE_OFN121_n_2044), 
	.A(n_2006));
   INX0 p10619A56100 (.Q(n_1757), 
	.A(n_1766));
   MU2IX1 p14441A (.S(n_1743), 
	.Q(n_1756), 
	.IN1(FE_OFN114_n_2221), 
	.IN0(n_1593));
   NO2X0 p16594A (.Q(n_1858), 
	.B(n_1613), 
	.A(n_1866));
   NO2I1X0 p19341A (.Q(n_1832), 
	.B(n_1866), 
	.AN(n_2029));
   NA2X0 p17693A (.Q(n_1755), 
	.B(n_2100), 
	.A(n_1866));
   AN21X0 p19837A (.Q(n_1859), 
	.C(n_1866), 
	.B(FE_OFN6_n_1718), 
	.A(n_1543));
   ON211X0 p19287A (.Q(n_1754), 
	.D(n_1741), 
	.C(n_1818), 
	.B(FE_OFN121_n_2044), 
	.A(n_1742));
   ON321X0 p10081A (.Q(n_1752), 
	.F(n_1598), 
	.E(n_1731), 
	.D(n_2052), 
	.C(n_1730), 
	.B(n_2129), 
	.A(FE_OFN37_n_692));
   AO21X0 p9107A (.Q(n_1766), 
	.C(n_2136), 
	.B(n_1751), 
	.A(n_1665));
   NA3I1X0 p9045A56101 (.Q(n_1750), 
	.C(n_1679), 
	.B(n_1747), 
	.AN(n_1561));
   NO2I1X0 p8543A (.Q(n_1820), 
	.B(n_1796), 
	.AN(n_2100));
   NA3X0 p11738A (.Q(n_1864), 
	.C(n_1584), 
	.B(n_1681), 
	.A(n_1749));
   NO2X0 p10284A (.Q(n_1798), 
	.B(n_1797), 
	.A(n_1796));
   AN221X0 p9351A (.Q(n_1759), 
	.E(n_1733), 
	.D(n_1714), 
	.C(n_1605), 
	.B(n_1541), 
	.A(n_2180));
   NA3X0 p10631A (.Q(n_1748), 
	.C(n_1746), 
	.B(n_1677), 
	.A(n_1747));
   ON31X1 p17757A (.Q(n_1866), 
	.D(n_2033), 
	.C(n_1561), 
	.B(n_1717), 
	.A(n_1600));
   AO32X0 p11870A (.Q(n_1745), 
	.E(n_1744), 
	.D(n_1740), 
	.C(fsm_int_na_o), 
	.B(n_2043), 
	.A(n_2100));
   SDFFQX0 \fsm_op_aux_1_2_reg[0]  (.SE(DFT_sen), 
	.SD(n_2245), 
	.Q(\fsm_op_aux_1_2[0] ), 
	.D(n_1704), 
	.CN(top_clock_i__L2_N1));
   SDFFQX0 \fsm_op_aux_1_2_reg[1]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[0] ), 
	.Q(\fsm_op_aux_1_2[1] ), 
	.D(n_1708), 
	.CN(top_clock_i__L2_N2));
   SDFFQX0 \fsm_op_aux_1_2_reg[2]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[1] ), 
	.Q(\fsm_op_aux_1_2[2] ), 
	.D(n_1707), 
	.CN(top_clock_i__L2_N1));
   SDFFQX0 \fsm_op_aux_1_2_reg[3]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[2] ), 
	.Q(\fsm_op_aux_1_2[3] ), 
	.D(n_1703), 
	.CN(top_clock_i__L2_N2));
   SDFFQX0 \fsm_op_aux_1_2_reg[4]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[3] ), 
	.Q(\fsm_op_aux_1_2[4] ), 
	.D(n_1702), 
	.CN(top_clock_i__L2_N11));
   SDFFQX0 \fsm_op_aux_1_2_reg[5]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[4] ), 
	.Q(\fsm_op_aux_1_2[5] ), 
	.D(n_1701), 
	.CN(top_clock_i__L2_N1));
   SDFFQX0 \fsm_op_aux_1_2_reg[6]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[5] ), 
	.Q(\fsm_op_aux_1_2[6] ), 
	.D(n_1700), 
	.CN(top_clock_i__L2_N2));
   SDFFQX0 \fsm_op_aux_1_2_reg[7]  (.SE(DFT_sen), 
	.SD(\fsm_op_aux_1_2[6] ), 
	.Q(\fsm_op_aux_1_2[7] ), 
	.D(n_1699), 
	.CN(top_clock_i__L2_N2));
   AN31X0 p14439A (.Q(n_1743), 
	.D(n_2042), 
	.C(n_1696), 
	.B(n_1585), 
	.A(n_1742));
   NO3X0 p35510A (.Q(n_1741), 
	.C(n_1720), 
	.B(n_1734), 
	.A(n_1663));
   NO2I1X1 p8541A (.Q(n_1796), 
	.B(n_1740), 
	.AN(n_1744));
   AN211X0 p9041A (.Q(n_1747), 
	.D(n_1738), 
	.C(n_1669), 
	.B(FE_OFN121_n_2044), 
	.A(n_2031));
   AN211X0 p11312A (.Q(n_1749), 
	.D(n_1738), 
	.C(n_2027), 
	.B(FE_OFN121_n_2044), 
	.A(n_2004));
   ON211X1 p9107A56110 (.Q(n_1751), 
	.D(n_1719), 
	.C(n_1623), 
	.B(n_1619), 
	.A(n_1614));
   NA3X0 p9422A (.Q(n_1737), 
	.C(n_1641), 
	.B(FE_OFN7_n_1735), 
	.A(n_1583));
   ON211X0 p10700A (.Q(n_1736), 
	.D(FE_OFN7_n_1735), 
	.C(n_1528), 
	.B(FE_OFN114_n_2221), 
	.A(n_1695));
   AN21X0 p21002A (.Q(n_1846), 
	.C(n_1734), 
	.B(FE_OFN114_n_2221), 
	.A(n_1591));
   AN31X1 p36168A (.Q(n_1818), 
	.D(n_1716), 
	.C(n_1671), 
	.B(n_1620), 
	.A(n_2170));
   AN21X0 p9382A (.Q(n_1733), 
	.C(n_1715), 
	.B(FE_OFN37_n_692), 
	.A(n_2177));
   NA2I1X0 p19191A (.Q(n_1786), 
	.B(n_1732), 
	.AN(n_1769));
   NO2I1X0 p10362A (.Q(n_1731), 
	.B(n_1729), 
	.AN(n_1626));
   AN21X0 p10085A56111 (.Q(n_1730), 
	.C(n_1729), 
	.B(n_2052), 
	.A(n_1532));
   AO311X0 p11378A (.Q(n_1740), 
	.E(n_2051), 
	.D(FE_OFN115_n_2221), 
	.C(n_1638), 
	.B(n_1574), 
	.A(fsm_sfr_addr_o[3]));
   AO222X0 p6943A (.Q(n_1728), 
	.F(n_1725), 
	.E(FE_OFN66_fsm_op2_0_), 
	.D(n_2030), 
	.C(fsm_pc_i[0]), 
	.B(fsm_sfr_data_i[0]), 
	.A(n_1726));
   AO222X0 p6932A (.Q(n_1727), 
	.F(n_1725), 
	.E(FE_OFN63_fsm_op2_1_), 
	.D(n_2030), 
	.C(fsm_pc_i[1]), 
	.B(fsm_sfr_data_i[1]), 
	.A(n_1726));
   AO222X0 p7774A (.Q(n_1724), 
	.F(n_1722), 
	.E(FE_OFN91_fsm_op2_5_), 
	.D(n_2030), 
	.C(fsm_pc_i[5]), 
	.B(fsm_sfr_data_i[5]), 
	.A(n_1726));
   AO222X0 p7786A (.Q(n_1723), 
	.F(n_1722), 
	.E(FE_OFN70_fsm_op2_6_), 
	.D(n_2030), 
	.C(fsm_pc_i[6]), 
	.B(fsm_sfr_data_i[6]), 
	.A(n_1726));
   AO222X0 p7784A (.Q(n_1721), 
	.F(n_1722), 
	.E(DFT_sdo), 
	.D(n_2030), 
	.C(fsm_pc_i[7]), 
	.B(fsm_sfr_data_i[7]), 
	.A(n_1726));
   OR3X0 p36815A (.Q(n_1769), 
	.C(n_1662), 
	.B(n_2007), 
	.A(n_1720));
   AO22X0 p9107A56112 (.Q(n_1719), 
	.D(n_41), 
	.C(n_1606), 
	.B(n_1642), 
	.A(n_1609));
   SDFRQX2 fsm_int_rdy_o_reg (.SE(DFT_sen), 
	.SD(fsm_int_na_o), 
	.Q(fsm_int_rdy_o), 
	.D(n_1634), 
	.C(top_clock_i__L2_N2));
   OA211X0 p12682A (.Q(n_1848), 
	.D(n_1582), 
	.C(n_1534), 
	.B(FE_OFN114_n_2221), 
	.A(n_1661));
   ON31X1 p35510A56114 (.Q(n_1734), 
	.D(FE_OFN6_n_1718), 
	.C(n_1632), 
	.B(n_1670), 
	.A(n_1635));
   OR5X0 p35245A (.Q(n_1717), 
	.E(n_2032), 
	.D(n_1716), 
	.C(n_2028), 
	.B(n_1643), 
	.A(n_2029));
   AN211X0 p9040A (.Q(n_1738), 
	.D(n_1622), 
	.C(n_1659), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(n_1519));
   AN321X0 p9381A (.Q(n_1715), 
	.F(n_1633), 
	.E(n_1604), 
	.D(n_1579), 
	.C(n_1615), 
	.B(n_2139), 
	.A(n_1595));
   AN221X0 p10080A (.Q(n_1729), 
	.E(n_1618), 
	.D(n_1617), 
	.C(FE_OFN40_n_198), 
	.B(n_2116), 
	.A(n_2129));
   ON22X0 p9492A (.Q(n_1714), 
	.D(FE_OFN40_n_198), 
	.C(n_499), 
	.B(n_2012), 
	.A(n_1636));
   AO222X0 p7792A (.Q(n_1713), 
	.F(fsm_sfr_data_i[2]), 
	.E(n_1711), 
	.D(n_2030), 
	.C(fsm_pc_i[2]), 
	.B(n_1725), 
	.A(FE_OFN72_fsm_op2_2_));
   AO222X0 p7801A (.Q(n_1712), 
	.F(fsm_sfr_data_i[3]), 
	.E(n_1711), 
	.D(n_2030), 
	.C(fsm_pc_i[3]), 
	.B(n_1709), 
	.A(FE_OFN94_fsm_op2_3_));
   AO222X0 p7737A (.Q(n_1710), 
	.F(fsm_sfr_data_i[4]), 
	.E(n_1711), 
	.D(n_2030), 
	.C(fsm_pc_i[4]), 
	.B(n_1709), 
	.A(FE_OFN92_fsm_op2_4_));
   AO22X0 p15912A (.Q(n_1708), 
	.D(\fsm_op_aux_1_2[1] ), 
	.C(n_1705), 
	.B(FE_PHN2_alu_fsm_result_1_), 
	.A(n_1706));
   AO22X0 p15904A (.Q(n_1707), 
	.D(\fsm_op_aux_1_2[2] ), 
	.C(n_1705), 
	.B(fsm_alu_result_i[2]), 
	.A(n_1706));
   AO22X0 p15912A56115 (.Q(n_1704), 
	.D(\fsm_op_aux_1_2[0] ), 
	.C(n_1705), 
	.B(FE_PHN1_alu_fsm_result_0_), 
	.A(n_1706));
   AO22X0 p15905A (.Q(n_1703), 
	.D(\fsm_op_aux_1_2[3] ), 
	.C(n_1705), 
	.B(fsm_alu_result_i[3]), 
	.A(n_1706));
   AO22X0 p15905A56116 (.Q(n_1702), 
	.D(\fsm_op_aux_1_2[4] ), 
	.C(n_1705), 
	.B(FE_PHN0_alu_fsm_result_4_), 
	.A(n_1706));
   AO22X0 p15920A (.Q(n_1701), 
	.D(\fsm_op_aux_1_2[5] ), 
	.C(n_1705), 
	.B(fsm_alu_result_i[5]), 
	.A(n_1706));
   AO22X0 p15920A56117 (.Q(n_1700), 
	.D(\fsm_op_aux_1_2[6] ), 
	.C(n_1705), 
	.B(fsm_alu_result_i[6]), 
	.A(n_1706));
   AO22X0 p15903A (.Q(n_1699), 
	.D(\fsm_op_aux_1_2[7] ), 
	.C(n_1705), 
	.B(fsm_alu_result_i[7]), 
	.A(n_1706));
   AN211X0 p11544A (.Q(n_1698), 
	.D(n_1678), 
	.C(n_1680), 
	.B(FE_OFN114_n_2221), 
	.A(n_2132));
   AN211X0 p11396A (.Q(n_1697), 
	.D(n_1621), 
	.C(n_1660), 
	.B(FE_OFN121_n_2044), 
	.A(n_2009));
   ON311X0 p9424A (.Q(n_1735), 
	.E(n_1639), 
	.D(n_1520), 
	.C(n_2049), 
	.B(n_2013), 
	.A(n_2101));
   NO3I1X0 p14440A (.Q(n_1696), 
	.C(n_2006), 
	.B(n_1668), 
	.AN(n_1695));
   ON221X0 p14191A (.Q(n_1694), 
	.E(n_1658), 
	.D(n_1495), 
	.C(n_1690), 
	.B(n_1693), 
	.A(n_1513));
   ON221X0 p14192A (.Q(n_1692), 
	.E(n_1656), 
	.D(n_1500), 
	.C(n_1690), 
	.B(n_1691), 
	.A(n_1513));
   ON221X0 p14192A56118 (.Q(n_1689), 
	.E(n_1646), 
	.D(n_1493), 
	.C(n_1690), 
	.B(n_1688), 
	.A(n_1513));
   ON221X0 p14208A (.Q(n_1687), 
	.E(n_1652), 
	.D(n_1497), 
	.C(n_1690), 
	.B(n_1686), 
	.A(n_1513));
   ON221X0 p14208A56119 (.Q(n_1685), 
	.E(n_1650), 
	.D(n_1498), 
	.C(n_1690), 
	.B(n_1684), 
	.A(n_1513));
   ON221X0 p14190A (.Q(n_1683), 
	.E(n_1648), 
	.D(n_1494), 
	.C(n_1690), 
	.B(n_1682), 
	.A(n_1513));
   NO2X0 p12525A (.Q(n_1681), 
	.B(n_2007), 
	.A(n_1680));
   NO2X0 p9484A (.Q(n_1679), 
	.B(n_1680), 
	.A(n_1678));
   AN21X0 p10629A (.Q(n_1677), 
	.C(n_1680), 
	.B(FE_OFN121_n_2044), 
	.A(n_2007));
   AO221X0 p14531A (.Q(n_1676), 
	.E(n_1629), 
	.D(n_2032), 
	.C(n_1675), 
	.B(fsm_sfr_data_i[0]), 
	.A(n_1673));
   AO221X0 p14531A56120 (.Q(n_1674), 
	.E(n_1628), 
	.D(n_2032), 
	.C(n_1672), 
	.B(fsm_sfr_data_i[1]), 
	.A(n_1673));
   OA21X0 p36173A (.Q(n_1671), 
	.C(n_1627), 
	.B(n_1670), 
	.A(n_1612));
   NO2X0 p36128A (.Q(n_1720), 
	.B(n_2010), 
	.A(n_1631));
   OR2X0 p10973A (.Q(n_1669), 
	.B(n_2133), 
	.A(n_1668));
   INX0 p14474A (.Q(n_1667), 
	.A(n_1666));
   AN211X0 p10866A (.Q(n_1665), 
	.D(n_1664), 
	.C(n_2005), 
	.B(FE_OFN114_n_2221), 
	.A(n_2009));
   OR5X0 p35994A (.Q(n_1663), 
	.E(n_2025), 
	.D(n_1998), 
	.C(n_2032), 
	.B(n_1662), 
	.A(n_2029));
   INX0 p12682A56121 (.Q(n_1661), 
	.A(n_1660));
   AN21X0 p14523A (.Q(n_1666), 
	.C(n_2133), 
	.B(FE_OFN121_n_2044), 
	.A(n_1637));
   ON321X0 p9947A (.Q(n_1659), 
	.F(n_1607), 
	.E(n_1586), 
	.D(n_2050), 
	.C(n_1530), 
	.B(n_1589), 
	.A(FE_OFN32_n_78));
   AN222X0 p14191A56122 (.Q(n_1658), 
	.F(n_1657), 
	.E(n_2032), 
	.D(n_1654), 
	.C(FE_OFN56_fsm_op_aux_2_2_), 
	.B(n_1655), 
	.A(fsm_alu_result_i[2]));
   AN222X0 p14193A (.Q(n_1656), 
	.F(n_1653), 
	.E(n_2032), 
	.D(n_1654), 
	.C(FE_OFN54_fsm_op_aux_2_3_), 
	.B(n_1655), 
	.A(fsm_alu_result_i[3]));
   AN222X0 p14208A56123 (.Q(n_1652), 
	.F(n_1651), 
	.E(n_2032), 
	.D(n_1654), 
	.C(FE_OFN49_fsm_op_aux_2_5_), 
	.B(n_1655), 
	.A(fsm_alu_result_i[5]));
   AN222X0 p14208A56124 (.Q(n_1650), 
	.F(n_1649), 
	.E(n_2032), 
	.D(n_1654), 
	.C(FE_OFN47_fsm_op_aux_2_6_), 
	.B(n_1655), 
	.A(fsm_alu_result_i[6]));
   AN222X0 p14191A56125 (.Q(n_1648), 
	.F(n_1647), 
	.E(n_2032), 
	.D(n_1654), 
	.C(FE_OFN45_fsm_op_aux_2_7_), 
	.B(n_1655), 
	.A(fsm_alu_result_i[7]));
   AN222X0 p14193A56126 (.Q(n_1646), 
	.F(n_1645), 
	.E(n_2032), 
	.D(n_1654), 
	.C(FE_OFN51_fsm_op_aux_2_4_), 
	.B(n_1655), 
	.A(fsm_alu_result_i[4]));
   NA2I1X0 p18001A (.Q(n_1726), 
	.B(n_1644), 
	.AN(n_1711));
   INX0 p35245A56127 (.Q(n_1643), 
	.A(FE_OFN6_n_1718));
   AN32X0 p9107A56128 (.Q(n_1642), 
	.E(n_1567), 
	.D(n_2120), 
	.C(n_1577), 
	.B(FE_OFN32_n_78), 
	.A(n_41));
   NO2X0 p10224A (.Q(n_1641), 
	.B(n_2006), 
	.A(n_1640));
   NO2X0 p11466A (.Q(n_1695), 
	.B(n_1640), 
	.A(n_2132));
   AN211X0 p9424A56129 (.Q(n_1639), 
	.D(n_1599), 
	.C(n_1976), 
	.B(n_41), 
	.A(n_1596));
   ON31X0 p11397A (.Q(n_1660), 
	.D(n_1505), 
	.C(n_1630), 
	.B(n_1572), 
	.A(n_2126));
   OA211X0 p9485A (.Q(n_1680), 
	.D(n_1996), 
	.C(n_1573), 
	.B(FE_OFN39_n_23), 
	.A(n_1590));
   AO22X0 p11783A (.Q(n_1638), 
	.D(fsm_sfr_addr_o[7]), 
	.C(n_1570), 
	.B(fsm_bit_byte_flag_o), 
	.A(n_1597));
   OR2X0 p10972A (.Q(n_1668), 
	.B(n_2004), 
	.A(n_1637));
   NO2X0 p9490A (.Q(n_1636), 
	.B(n_2119), 
	.A(n_1611));
   ON211X0 p38428A (.Q(n_1635), 
	.D(n_1535), 
	.C(n_2120), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(n_1554));
   ON31X0 p20419A (.Q(n_1634), 
	.D(n_1608), 
	.C(n_1523), 
	.B(n_1797), 
	.A(n_2043));
   ON31X0 p9550A (.Q(n_1633), 
	.D(n_41), 
	.C(n_1568), 
	.B(n_1557), 
	.A(n_1991));
   AN22X0 p35509A (.Q(n_1632), 
	.D(FE_OFN43_fsm_opcode_1_), 
	.C(n_1522), 
	.B(n_1547), 
	.A(n_1578));
   AN22X0 p36124A (.Q(n_1631), 
	.D(n_2180), 
	.C(n_1581), 
	.B(n_1587), 
	.A(n_1630));
   ON221X0 p35242A (.Q(n_1718), 
	.E(n_1602), 
	.D(n_2011), 
	.C(n_1564), 
	.B(n_1526), 
	.A(FE_OFN35_fsm_opcode_5_));
   AO22X0 p14530A (.Q(n_1629), 
	.D(FE_OFN61_fsm_op_aux_2_0_), 
	.C(n_1654), 
	.B(fsm_alu_result_i[0]), 
	.A(n_1655));
   AO22X0 p14530A56130 (.Q(n_1628), 
	.D(FE_OFN58_fsm_op_aux_2_1_), 
	.C(n_1654), 
	.B(fsm_alu_result_i[1]), 
	.A(n_1655));
   AO321X0 p36172A (.Q(n_1627), 
	.F(n_1580), 
	.E(n_2171), 
	.D(n_1626), 
	.C(n_1539), 
	.B(n_2117), 
	.A(FE_OFN37_n_692));
   NA2I1X0 p15263A (.Q(n_1709), 
	.B(n_1625), 
	.AN(n_1722));
   NO2X0 p17027A (.Q(n_1706), 
	.B(n_2042), 
	.A(n_1705));
   NA2I1X0 p14747A (.Q(n_1725), 
	.B(n_1624), 
	.AN(n_1722));
   NO3I1X0 p35996A (.Q(n_1662), 
	.C(n_2138), 
	.B(n_1576), 
	.AN(FE_OFN171_n_2175));
   ON32X0 p10478A (.Q(n_1623), 
	.E(n_1976), 
	.D(FE_OFN166_n_2154), 
	.C(n_1549), 
	.B(n_1542), 
	.A(FE_OFN145_n_2110));
   AN221X0 p9041A56131 (.Q(n_1622), 
	.E(n_2163), 
	.D(n_1610), 
	.C(n_1569), 
	.B(n_2116), 
	.A(n_376));
   AO211X0 p10864A (.Q(n_1664), 
	.D(n_1621), 
	.C(n_2045), 
	.B(FE_OFN114_n_2221), 
	.A(n_2026));
   AO21X0 p18568A (.Q(n_1711), 
	.C(n_2026), 
	.B(FE_OFN114_n_2221), 
	.A(n_1621));
   ON21X0 p36585A (.Q(n_1620), 
	.C(FE_OFN171_n_2175), 
	.B(n_2014), 
	.A(n_1630));
   ON31X0 p9913A (.Q(n_1619), 
	.D(n_2127), 
	.C(n_1536), 
	.B(n_2146), 
	.A(FE_OFN187_n_2173));
   AN21X0 p11880A (.Q(n_1618), 
	.C(n_2050), 
	.B(n_1616), 
	.A(n_1630));
   NA3I1X0 p10085A56132 (.Q(n_1617), 
	.C(n_1616), 
	.B(n_1630), 
	.AN(n_2129));
   ON221X0 p9382A56133 (.Q(n_1615), 
	.E(n_1517), 
	.D(n_2171), 
	.C(FE_OFN32_n_78), 
	.B(n_1603), 
	.A(n_2101));
   MU2IX0 p10111A (.S(n_2050), 
	.Q(n_1614), 
	.IN1(n_1626), 
	.IN0(n_1556));
   SDFRQX2 \fsm_state_o_reg[2]  (.SE(DFT_sen), 
	.SD(FE_OFN26_n_19), 
	.Q(n_1973), 
	.D(n_1551), 
	.C(top_clock_i__L2_N12));
   NO3I1X0 p10224A56135 (.Q(n_1640), 
	.C(n_1553), 
	.B(n_2049), 
	.AN(n_2050));
   AN21X0 p16592A (.Q(n_1613), 
	.C(n_1716), 
	.B(n_2044), 
	.A(n_2031));
   ON321X0 p36469A (.Q(n_1612), 
	.F(n_1537), 
	.E(n_2048), 
	.D(FE_OFN43_fsm_opcode_1_), 
	.C(n_2149), 
	.B(n_2019), 
	.A(FE_OFN31_fsm_opcode_7_));
   AN31X0 p9491A (.Q(n_1611), 
	.D(n_2123), 
	.C(n_1511), 
	.B(n_1610), 
	.A(FE_OFN32_n_78));
   ON21X0 p10567A (.Q(n_1609), 
	.C(FE_OFN31_fsm_opcode_7_), 
	.B(n_2148), 
	.A(n_1538));
   ON211X0 p20424A (.Q(n_1608), 
	.D(fsm_int_rdy_o), 
	.C(n_1797), 
	.B(n_2043), 
	.A(n_2051));
   AN211X0 p13963A (.Q(n_1607), 
	.D(n_1575), 
	.C(FE_OFN37_n_692), 
	.B(FE_OFN171_n_2175), 
	.A(n_1540));
   ON21X0 p14147A (.Q(n_1821), 
	.C(n_1592), 
	.B(n_2042), 
	.A(n_1560));
   ON22X0 p11068A (.Q(n_1606), 
	.D(n_2158), 
	.C(n_2120), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.A(n_1546));
   AO22X0 p9355A (.Q(n_1605), 
	.D(FE_OFN32_n_78), 
	.C(n_1526), 
	.B(n_2161), 
	.A(n_1545));
   AN211X0 p10973A56136 (.Q(n_1637), 
	.D(n_2120), 
	.C(n_1594), 
	.B(n_41), 
	.A(n_1550));
   AN22X0 p9459A (.Q(n_1604), 
	.D(n_2111), 
	.C(n_2163), 
	.B(FE_OFN141_n_2118), 
	.A(n_1603));
   AND2X0 p14747A56137 (.Q(n_1722), 
	.B(FE_OFN119_n_2044), 
	.A(n_1621));
   AN21X0 p17029A (.Q(n_1705), 
	.C(n_1562), 
	.B(FE_OFN114_n_2221), 
	.A(n_2131));
   NO3I1X0 p35720A (.Q(n_1602), 
	.C(n_2117), 
	.B(n_1603), 
	.AN(FE_OFN168_n_2183));
   INX0 p12935A (.Q(n_1601), 
	.A(n_1600));
   ON32X0 p9424A56138 (.Q(n_1599), 
	.E(n_2161), 
	.D(n_318), 
	.C(n_2174), 
	.B(n_2122), 
	.A(n_1490));
   ON221X0 p11782A (.Q(n_1598), 
	.E(n_1552), 
	.D(n_2120), 
	.C(n_2020), 
	.B(n_2162), 
	.A(n_2177));
   NA3I1X0 p11817A (.Q(n_1597), 
	.C(fsm_sfr_addr_o[2]), 
	.B(fsm_sfr_addr_o[4]), 
	.AN(n_1548));
   ON31X0 p11084A (.Q(n_1596), 
	.D(n_1504), 
	.C(n_2123), 
	.B(n_2105), 
	.A(n_229));
   ON211X0 p9976A (.Q(n_1595), 
	.D(n_2048), 
	.C(n_1594), 
	.B(n_2105), 
	.A(n_2123));
   NA2X0 p20447A (.Q(n_1593), 
	.B(FE_OFN114_n_2221), 
	.A(n_1592));
   NA2X0 p15152A (.Q(n_1624), 
	.B(n_2044), 
	.A(n_1591));
   NO2X0 p9861A (.Q(n_1590), 
	.B(n_1589), 
	.A(n_2145));
   NO2I1X0 p16043A (.Q(n_1588), 
	.B(n_2136), 
	.AN(n_1746));
   ON21X0 p36128A56139 (.Q(n_1587), 
	.C(n_2170), 
	.B(n_376), 
	.A(n_1518));
   AN21X0 p9946A (.Q(n_1586), 
	.C(n_2113), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(n_1532));
   NO3I1X0 p16289A (.Q(n_1585), 
	.C(n_2001), 
	.B(n_2008), 
	.AN(n_1584));
   AO21X0 p15439A (.Q(n_1776), 
	.C(n_1675), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[0]));
   AO21X0 p15439A56140 (.Q(n_1781), 
	.C(n_1672), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[1]));
   AN21X0 p14706A (.Q(n_1691), 
	.C(n_1653), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[3]));
   AN21X0 p14703A (.Q(n_1688), 
	.C(n_1645), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[4]));
   AN21X0 p14715A (.Q(n_1686), 
	.C(n_1651), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[5]));
   AN21X0 p14702A (.Q(n_1693), 
	.C(n_1657), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[2]));
   AN21X0 p14696A (.Q(n_1682), 
	.C(n_1647), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[7]));
   AN21X0 p14713A (.Q(n_1684), 
	.C(n_1649), 
	.B(FE_OFN114_n_2221), 
	.A(fsm_sfr_data_i[6]));
   NO3I1X0 p10856A (.Q(n_1583), 
	.C(n_2028), 
	.B(n_1997), 
	.AN(n_1582));
   ON21X0 p40092A (.Q(n_1581), 
	.C(FE_OFN31_fsm_opcode_7_), 
	.B(n_2125), 
	.A(n_1524));
   ON21X0 p12932A (.Q(n_1600), 
	.C(n_1584), 
	.B(FE_OFN114_n_2221), 
	.A(n_1521));
   AN21X0 p36172A56141 (.Q(n_1580), 
	.C(n_1555), 
	.B(n_2117), 
	.A(n_2148));
   ON21X0 p10060A (.Q(n_1579), 
	.C(n_1544), 
	.B(FE_OFN145_n_2110), 
	.A(n_2162));
   AN211X0 p35621A (.Q(n_1578), 
	.D(n_2014), 
	.C(n_2156), 
	.B(n_41), 
	.A(n_1509));
   AO211X0 p9107A56142 (.Q(n_1577), 
	.D(n_2138), 
	.C(n_2182), 
	.B(FE_OFN117_n_24), 
	.A(n_2017));
   AO211X0 p18653A (.Q(n_1655), 
	.D(n_2027), 
	.C(n_2026), 
	.B(FE_OFN114_n_2221), 
	.A(n_2031));
   AND5X0 p36334A (.Q(n_1716), 
	.E(FE_OFN43_fsm_opcode_1_), 
	.D(FE_OFN40_n_198), 
	.C(FE_OFN141_n_2118), 
	.B(n_2150), 
	.A(n_2124));
   OA21X0 p8543A56143 (.Q(n_1744), 
	.C(n_673), 
	.B(fsm_int_vect_i[2]), 
	.A(n_1870));
   NA3I1X0 p35994A56144 (.Q(n_1576), 
	.C(n_2157), 
	.B(n_2013), 
	.AN(n_1575));
   NO3I1X0 p11380A (.Q(n_1574), 
	.C(fsm_sfr_wr_o_b), 
	.B(fsm_sfr_addr_o[6]), 
	.AN(fsm_sfr_addr_o[5]));
   NO3I1X0 p10004A (.Q(n_1573), 
	.C(n_2113), 
	.B(n_2153), 
	.AN(n_2170));
   NA3I1X0 p11402A (.Q(n_1572), 
	.C(FE_OFN42_fsm_opcode_4_), 
	.B(n_2109), 
	.AN(FE_OFN140_n_2121));
   AN21X0 p21470A (.Q(n_1571), 
	.C(n_2043), 
	.B(FE_OFN120_n_2044), 
	.A(n_2003));
   NO3X0 p12383A (.Q(n_1570), 
	.C(fsm_sfr_addr_o[0]), 
	.B(fsm_sfr_addr_o[1]), 
	.A(fsm_sfr_addr_o[2]));
   ON21X0 p9040A56145 (.Q(n_1569), 
	.C(n_2155), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.A(n_2017));
   AN21X0 p9783A (.Q(n_1568), 
	.C(n_2149), 
	.B(n_2019), 
	.A(n_2165));
   NO3X0 p9506A (.Q(n_1567), 
	.C(FE_OFN31_fsm_opcode_7_), 
	.B(n_2178), 
	.A(n_2124));
   OA21X0 p19863A (.Q(n_1797), 
	.C(n_2100), 
	.B(n_2221), 
	.A(n_2043));
   NO3X0 p12434A (.Q(n_1566), 
	.C(n_2196), 
	.B(n_2046), 
	.A(n_2104));
   AN211X0 p12978A (.Q(n_1565), 
	.D(n_2009), 
	.C(n_2026), 
	.B(FE_OFN114_n_2221), 
	.A(n_2005));
   NA2I1X0 p10867A (.Q(n_1621), 
	.B(n_1528), 
	.AN(n_2028));
   NO2X0 p36199A (.Q(n_1564), 
	.B(n_2182), 
	.A(n_318));
   INX0 p15250A (.Q(n_1673), 
	.A(n_1690));
   INX0 p18564A (.Q(n_1562), 
	.A(n_1592));
   INX0 p17827A (.Q(n_1561), 
	.A(n_1560));
   INX0 p9551A (.Q(n_1557), 
	.A(n_1603));
   INX0 p10113A (.Q(n_1556), 
	.A(n_1555));
   INX0 p38970A (.Q(n_1554), 
	.A(n_1589));
   NA2X0 p13702A (.Q(n_1630), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(n_1524));
   NA3X0 p10225A (.Q(n_1553), 
	.C(FE_OFN43_fsm_opcode_1_), 
	.B(n_1626), 
	.A(n_2166));
   NO2I1X0 p11782A56146 (.Q(n_1552), 
	.B(n_2152), 
	.AN(n_1626));
   AND2X0 p15291A (.Q(n_1649), 
	.B(FE_OFN47_fsm_op_aux_2_6_), 
	.A(FE_OFN119_n_2044));
   AND2X0 p15291A56147 (.Q(n_1653), 
	.B(FE_OFN54_fsm_op_aux_2_3_), 
	.A(FE_OFN119_n_2044));
   NA2I1X0 p21524A (.Q(n_1551), 
	.B(fsm_reset_core_o_b), 
	.AN(n_2108));
   NO2X0 p14813A (.Q(n_1742), 
	.B(n_2007), 
	.A(n_2027));
   AND2X0 p15291A56148 (.Q(n_1657), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(FE_OFN119_n_2044));
   AND2X0 p16002A (.Q(n_1675), 
	.B(FE_OFN61_fsm_op_aux_2_0_), 
	.A(FE_OFN119_n_2044));
   NA2X0 p15252A (.Q(n_1690), 
	.B(FE_OFN119_n_2044), 
	.A(n_2028));
   NA2X0 p12008A (.Q(n_1582), 
	.B(FE_OFN121_n_2044), 
	.A(n_2001));
   NA2I1X0 p10973A56149 (.Q(n_1550), 
	.B(n_2158), 
	.AN(FE_OFN168_n_2183));
   NO2I1X0 p19698A (.Q(n_1654), 
	.B(FE_OFN119_n_2044), 
	.AN(n_2028));
   NO2X0 p12935A56150 (.Q(n_1584), 
	.B(n_2031), 
	.A(n_2030));
   NO2X0 p10482A (.Q(n_1549), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.A(n_2050));
   NA2X0 p11816A (.Q(n_1548), 
	.B(fsm_sfr_addr_o[0]), 
	.A(fsm_sfr_addr_o[1]));
   AND2X0 p15291A56151 (.Q(n_1651), 
	.B(FE_OFN49_fsm_op_aux_2_5_), 
	.A(FE_OFN119_n_2044));
   NA2X0 p35511A (.Q(n_1547), 
	.B(n_2102), 
	.A(n_2161));
   NO2X0 p11067A (.Q(n_1546), 
	.B(n_2138), 
	.A(n_2017));
   NA2X0 p16781A (.Q(n_1592), 
	.B(n_2136), 
	.A(n_2042));
   NA2I1X0 p40543A (.Q(n_1845), 
	.B(n_2027), 
	.AN(DFT_sdo_2));
   NA2X0 p9355A56152 (.Q(n_1545), 
	.B(n_2050), 
	.A(n_2049));
   NA2X0 p12646A (.Q(n_1560), 
	.B(n_2044), 
	.A(n_2027));
   NA2X0 p19191A56153 (.Q(n_1732), 
	.B(n_2134), 
	.A(n_2025));
   NA2X0 p9383A (.Q(n_1603), 
	.B(n_1999), 
	.A(n_2127));
   NO2X0 p10060A56154 (.Q(n_1544), 
	.B(FE_OFN185_n_2018), 
	.A(n_2163));
   NA2X0 p21009A (.Q(n_1543), 
	.B(FE_OFN114_n_2221), 
	.A(n_2029));
   OR2X0 p38782A (.Q(n_1591), 
	.B(n_2000), 
	.A(n_2006));
   NO2X0 p12115A (.Q(n_1616), 
	.B(n_229), 
	.A(n_2174));
   NA2X0 p10109A (.Q(n_1555), 
	.B(n_41), 
	.A(n_2171));
   NO2X0 p11645A (.Q(n_1542), 
	.B(n_24), 
	.A(n_2111));
   NA2X0 p12608A (.Q(n_1541), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(n_2016));
   NA2I1X0 p13964A (.Q(n_1540), 
	.B(n_376), 
	.AN(n_2119));
   NA2X0 p37323A (.Q(n_1539), 
	.B(FE_OFN39_n_23), 
	.A(n_2148));
   AND2X0 p15291A56155 (.Q(n_1647), 
	.B(FE_OFN45_fsm_op_aux_2_7_), 
	.A(FE_OFN119_n_2044));
   NA2X0 p13038A (.Q(n_1538), 
	.B(FE_OFN42_fsm_opcode_4_), 
	.A(n_2120));
   AND2X0 p16002A56156 (.Q(n_1672), 
	.B(FE_OFN58_fsm_op_aux_2_1_), 
	.A(FE_OFN119_n_2044));
   NA2I1X0 p12012A (.Q(n_1589), 
	.B(n_2115), 
	.AN(FE_OFN184_n_443));
   NO2I1X0 p9794A (.Q(n_1678), 
	.B(FE_OFN121_n_2044), 
	.AN(n_2007));
   NA2X0 p39972A (.Q(n_1625), 
	.B(n_2027), 
	.A(DFT_sdo_2));
   NA2I1X0 p40984A (.Q(n_1537), 
	.B(n_2117), 
	.AN(FE_OFN32_n_78));
   NO2I1X0 p38774A (.Q(n_1670), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.AN(n_2179));
   NA2X0 p9912A (.Q(n_1536), 
	.B(FE_OFN117_n_24), 
	.A(n_2114));
   NO2I1X0 p38428A56157 (.Q(n_1535), 
	.B(n_2117), 
	.AN(n_2139));
   NA2X0 p18097A (.Q(n_1644), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_2025));
   NO2X0 p14647A (.Q(n_1534), 
	.B(n_2026), 
	.A(n_2028));
   NO2I1X1 p20630A (.Q(n_1779), 
	.B(FE_OFN119_n_2044), 
	.AN(n_2032));
   NA2X0 p14600A (.Q(n_1746), 
	.B(FE_OFN121_n_2044), 
	.A(n_2030));
   AND2X0 p15291A56158 (.Q(n_1645), 
	.B(FE_OFN51_fsm_op_aux_2_4_), 
	.A(FE_OFN119_n_2044));
   INX0 p9845A (.Q(n_1610), 
	.A(n_2015));
   INX0 p9948A (.Q(n_1532), 
	.A(n_2171));
   INX0 p10193A (.Q(n_1530), 
	.A(n_2162));
   INX0 p13833A (.Q(n_1528), 
	.A(n_2001));
   INX0 p35244A (.Q(n_1526), 
	.A(n_2049));
   INX0 p40641A (.Q(n_1524), 
	.A(n_2120));
   INX0 p40724A (.Q(n_1523), 
	.A(n_2051));
   INX0 p35736A (.Q(n_1522), 
	.A(n_2102));
   INX0 p13306A (.Q(n_1521), 
	.A(n_2026));
   INX0 p13624A (.Q(n_1520), 
	.A(n_2160));
   INX0 p11533A (.Q(n_1519), 
	.A(n_2116));
   INX0 p36128A56159 (.Q(n_1518), 
	.A(n_2112));
   INX0 p12487A (.Q(n_1517), 
	.A(n_2105));
   INX0 p41988A56162 (.Q(n_1513), 
	.A(n_2030));
   INX0 p9491A56164 (.Q(n_1511), 
	.A(n_2014));
   INX0 p12112A (.Q(n_1594), 
	.A(FE_OFN165_n_2181));
   INX0 p38328A (.Q(n_1509), 
	.A(n_2128));
   INX0 p11415A (.Q(n_1505), 
	.A(n_2002));
   INX0 p11768A (.Q(n_1504), 
	.A(n_2174));
   NA2I1X0 p8543A56166 (.Q(n_1870), 
	.B(n_1501), 
	.AN(fsm_int_vect_i[1]));
   INX0 p11559A (.Q(n_1501), 
	.A(fsm_int_vect_i[0]));
   INX0 p15129A (.Q(n_1500), 
	.A(fsm_sfr_data_i[3]));
   INX0 p7883A56167 (.Q(n_1499), 
	.A(fsm_pc_i[13]));
   INX0 p15136A (.Q(n_1498), 
	.A(fsm_sfr_data_i[6]));
   INX0 p15138A (.Q(n_1497), 
	.A(fsm_sfr_data_i[5]));
   INX0 p7866A56168 (.Q(n_1496), 
	.A(fsm_pc_i[14]));
   INX0 p15125A (.Q(n_1495), 
	.A(fsm_sfr_data_i[2]));
   INX0 p15119A (.Q(n_1494), 
	.A(fsm_sfr_data_i[7]));
   INX0 p15126A (.Q(n_1493), 
	.A(fsm_sfr_data_i[4]));
   INX0 p8173A (.Q(n_1492), 
	.A(fsm_pc_i[15]));
   AND2X0 p14596A (.Q(n_1575), 
	.B(n_376), 
	.A(FE_OFN40_n_198));
   NO2X0 p22181A (.Q(n_1491), 
	.B(FE_OFN26_n_19), 
	.A(FE_OFN29_n_1973));
   NA2X0 p15122A (.Q(n_1490), 
	.B(FE_OFN37_n_692), 
	.A(n_229));
   INX0 p8168A (.Q(n_1489), 
	.A(fsm_pc_i[12]));
   INX0 p7706A56169 (.Q(n_1488), 
	.A(fsm_pc_i[11]));
   INX0 p7704A56170 (.Q(n_1487), 
	.A(fsm_pc_i[10]));
   INX0 p7714A56171 (.Q(n_1486), 
	.A(fsm_pc_i[8]));
   INX0 p7705A (.Q(n_1485), 
	.A(fsm_pc_i[9]));
   NO2X0 p14953A (.Q(n_1626), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN39_n_23));
   SDFRQX2 \fsm_state_o_reg[1]  (.SE(DFT_sen), 
	.SD(FE_OFN31_fsm_opcode_7_), 
	.Q(n_19), 
	.D(n_1465), 
	.C(top_clock_i__L2_N4));
   NO2X0 p20412A (.Q(n_1465), 
	.B(FE_OFN28_n_1973), 
	.A(n_1974));
   DFFQX2 fsm_reset_core_o_b_reg (.Q(fsm_reset_core_o_b), 
	.D(fsm_reset_i_b), 
	.CN(top_clock_i__L2_N10));
   NA2X0 p11940A (.Q(fsm_sfr_addr_o[3]), 
	.B(n_1463), 
	.A(n_1464));
   NA3X2 p11134A (.Q(fsm_sfr_addr_o[4]), 
	.C(n_1460), 
	.B(n_1461), 
	.A(n_1462));
   NA3X0 p13486A (.Q(fsm_ram_addr_o[2]), 
	.C(n_1457), 
	.B(n_1458), 
	.A(n_1459));
   ON21X0 p11968A (.Q(n_1464), 
	.C(\fsm_op1[3] ), 
	.B(n_1455), 
	.A(n_1456));
   AO221X0 p2068A (.Q(fsm_ram_data_o[3]), 
	.E(n_1452), 
	.D(n_1453), 
	.C(fsm_pc_i[3]), 
	.B(n_1454), 
	.A(fsm_pc_i[11]));
   AO221X0 p2084A (.Q(fsm_ram_data_o[2]), 
	.E(n_1451), 
	.D(n_1453), 
	.C(fsm_pc_i[2]), 
	.B(n_1454), 
	.A(fsm_pc_i[10]));
   AO221X0 p2084A64290 (.Q(fsm_ram_data_o[1]), 
	.E(n_1450), 
	.D(n_1453), 
	.C(fsm_pc_i[1]), 
	.B(n_1454), 
	.A(fsm_pc_i[9]));
   ON21X0 p11206A (.Q(n_1462), 
	.C(FE_OFN101_fsm_op1_4_), 
	.B(n_1449), 
	.A(n_1456));
   AO221X0 p2438A (.Q(fsm_ram_data_o[6]), 
	.E(n_1448), 
	.D(n_1453), 
	.C(fsm_pc_i[6]), 
	.B(n_1454), 
	.A(fsm_pc_i[14]));
   AO221X0 p2438A64291 (.Q(fsm_ram_data_o[5]), 
	.E(n_1447), 
	.D(n_1453), 
	.C(fsm_pc_i[5]), 
	.B(n_1454), 
	.A(fsm_pc_i[13]));
   AO221X0 p2411A (.Q(fsm_ram_data_o[4]), 
	.E(n_1446), 
	.D(n_1453), 
	.C(fsm_pc_i[4]), 
	.B(n_1454), 
	.A(fsm_pc_i[12]));
   ON221X0 p13192A (.Q(fsm_ram_addr_o[0]), 
	.E(n_1443), 
	.D(n_1444), 
	.C(n_669), 
	.B(n_1445), 
	.A(n_35));
   AO221X0 p2084A64292 (.Q(fsm_ram_data_o[0]), 
	.E(n_1442), 
	.D(n_1453), 
	.C(fsm_pc_i[0]), 
	.B(n_1454), 
	.A(fsm_pc_i[8]));
   AO21X2 p16080A (.Q(fsm_sfr_data_o[5]), 
	.C(n_1440), 
	.B(FE_OFN77_n_1334), 
	.A(n_1441));
   AO21X2 p16068A (.Q(fsm_sfr_data_o[4]), 
	.C(n_1439), 
	.B(FE_OFN79_fsm_op_aux_1_4_), 
	.A(n_1441));
   AO21X2 p16077A (.Q(fsm_sfr_data_o[6]), 
	.C(n_1438), 
	.B(FE_OFN75_fsm_op_aux_1_6_), 
	.A(n_1441));
   AO221X0 p2411A64293 (.Q(fsm_ram_data_o[7]), 
	.E(n_1437), 
	.D(n_1453), 
	.C(fsm_pc_i[7]), 
	.B(n_1454), 
	.A(fsm_pc_i[15]));
   AO221X0 p15870D (.Q(fsm_sfr_data_o[0]), 
	.E(n_1434), 
	.D(FE_OFN66_fsm_op2_0_), 
	.C(n_1435), 
	.B(n_1436), 
	.A(FE_OFN89_n_1288));
   NA3X0 p11246A (.Q(fsm_sfr_addr_o[2]), 
	.C(n_1432), 
	.B(n_1461), 
	.A(n_1433));
   AO221X0 p15883D (.Q(fsm_sfr_data_o[2]), 
	.E(n_1430), 
	.D(FE_OFN72_fsm_op2_2_), 
	.C(n_1435), 
	.B(n_1431), 
	.A(FE_OFN84_fsm_op_aux_1_2_));
   AO221X0 p15870D64294 (.Q(fsm_sfr_data_o[1]), 
	.E(n_1428), 
	.D(FE_OFN63_fsm_op2_1_), 
	.C(n_1435), 
	.B(n_1429), 
	.A(FE_OFN86_fsm_op_aux_1_1_));
   AO221X0 p15880D (.Q(fsm_sfr_data_o[3]), 
	.E(n_1426), 
	.D(FE_OFN94_fsm_op2_3_), 
	.C(n_1435), 
	.B(n_1427), 
	.A(FE_OFN82_n_1402));
   AO221X0 p11007A (.Q(fsm_ram_addr_o[4]), 
	.E(n_1423), 
	.D(FE_OFN230_n_1424), 
	.C(FE_OFN101_fsm_op1_4_), 
	.B(fsm_psw_rs_i[1]), 
	.A(n_1425));
   AO221X0 p11002A (.Q(fsm_ram_addr_o[3]), 
	.E(n_1422), 
	.D(FE_OFN230_n_1424), 
	.C(\fsm_op1[3] ), 
	.B(fsm_psw_rs_i[0]), 
	.A(n_1425));
   NA2X1 p0047D (.Q(fsm_alu_op1_o[3]), 
	.B(n_1420), 
	.A(n_1421));
   NA2X1 p0065D (.Q(fsm_alu_op1_o[2]), 
	.B(n_1418), 
	.A(n_1419));
   NA2X1 p0068D (.Q(fsm_alu_op1_o[1]), 
	.B(n_1416), 
	.A(n_1417));
   ON21X4 p0714D (.Q(fsm_pcau_offset_o[1]), 
	.C(n_1413), 
	.B(n_1414), 
	.A(n_1415));
   NA6I3X4 p11378A65461 (.Q(fsm_sfr_addr_o[7]), 
	.F(n_1410), 
	.E(n_1411), 
	.D(n_1412), 
	.CN(n_1408), 
	.BN(n_1454), 
	.AN(n_1409));
   ON211X1 p13424A (.Q(fsm_ram_addr_o[1]), 
	.D(n_1405), 
	.C(n_1406), 
	.B(n_1414), 
	.A(n_1407));
   AN221X0 p9907A (.Q(n_1421), 
	.E(n_1401), 
	.D(FE_OFN82_n_1402), 
	.C(FE_OFN227_n_1403), 
	.B(n_1404), 
	.A(FE_OFN53_fsm_op_aux_2_3_));
   AN21X0 p10385A (.Q(n_1419), 
	.C(n_1400), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(FE_OFN227_n_1403));
   AN221X0 p10076A (.Q(n_1417), 
	.E(n_1399), 
	.D(FE_OFN86_fsm_op_aux_1_1_), 
	.C(FE_OFN227_n_1403), 
	.B(n_1404), 
	.A(FE_OFN58_fsm_op_aux_2_1_));
   NA3X0 p12397A (.Q(fsm_sfr_addr_o[6]), 
	.C(n_1396), 
	.B(n_1397), 
	.A(n_1398));
   AO221X4 p13196A (.Q(fsm_ram_addr_o[6]), 
	.E(n_1394), 
	.D(n_1395), 
	.C(FE_OFN75_fsm_op_aux_1_6_), 
	.B(FE_OFN230_n_1424), 
	.A(FE_OFN96_fsm_op1_6_));
   AO221X0 p13191A (.Q(fsm_ram_addr_o[5]), 
	.E(n_1393), 
	.D(n_1395), 
	.C(FE_OFN77_n_1334), 
	.B(FE_OFN230_n_1424), 
	.A(FE_OFN99_fsm_op1_5_));
   NA3X0 p11374A (.Q(fsm_sfr_addr_o[1]), 
	.C(n_1390), 
	.B(n_1391), 
	.A(n_1392));
   ON21X0 p11002A64295 (.Q(n_1433), 
	.C(FE_OFN103_fsm_op1_2_), 
	.B(n_1449), 
	.A(n_1389));
   NA2X2 p0475D (.Q(fsm_alu_op1_o[7]), 
	.B(n_1386), 
	.A(n_1387));
   NA2X1 p0470D (.Q(fsm_alu_op1_o[6]), 
	.B(n_1384), 
	.A(n_1385));
   NA2X1 p0428D (.Q(fsm_alu_op1_o[5]), 
	.B(n_1382), 
	.A(n_1383));
   NA2X1 p0459D (.Q(fsm_alu_op1_o[4]), 
	.B(n_1380), 
	.A(n_1381));
   NA2X1 p0058D (.Q(fsm_alu_op1_o[0]), 
	.B(n_1378), 
	.A(n_1379));
   AO211X1 p6672D (.Q(fsm_alu_op2_o[4]), 
	.D(n_1375), 
	.C(n_1376), 
	.B(FE_OFN79_fsm_op_aux_1_4_), 
	.A(n_1377));
   AO211X1 p8136D (.Q(fsm_alu_op2_o[6]), 
	.D(n_1373), 
	.C(n_1374), 
	.B(FE_OFN75_fsm_op_aux_1_6_), 
	.A(n_1377));
   ON211X1 p6145A (.Q(fsm_alu_op2_o[3]), 
	.D(n_1369), 
	.C(n_1370), 
	.B(n_1371), 
	.A(n_1372));
   NA3X1 p4186A (.Q(fsm_pcau_en_o), 
	.C(n_1366), 
	.B(n_1367), 
	.A(n_1368));
   AO211X2 p16053D (.Q(fsm_sfr_data_o[7]), 
	.D(n_1363), 
	.C(n_1364), 
	.B(FE_OFN45_fsm_op_aux_2_7_), 
	.A(n_1365));
   NA3X4 p0804D (.Q(fsm_pcau_offset_o[0]), 
	.C(n_1360), 
	.B(n_1361), 
	.A(n_1362));
   AO221X2 p1277A (.Q(fsm_pcau_offset_o[7]), 
	.E(n_1358), 
	.D(FE_OFN69_n_202), 
	.C(n_1359), 
	.B(n_1357), 
	.A(n_325));
   AO221X4 p0991D (.Q(fsm_pcau_offset_o[6]), 
	.E(n_1356), 
	.D(n_1359), 
	.C(FE_OFN70_fsm_op2_6_), 
	.B(n_1357), 
	.A(FE_OFN96_fsm_op1_6_));
   NA3X1 p1544A (.Q(fsm_pcau_offset_o[5]), 
	.C(n_1353), 
	.B(n_1354), 
	.A(n_1355));
   NA3X1 p1167A (.Q(fsm_pcau_offset_o[4]), 
	.C(n_1350), 
	.B(n_1351), 
	.A(n_1352));
   ON21X4 p0704D (.Q(fsm_pcau_offset_o[2]), 
	.C(n_1348), 
	.B(n_49), 
	.A(n_1349));
   NA2X1 p0795D (.Q(fsm_pcau_offset_o[3]), 
	.B(n_1346), 
	.A(n_1347));
   NA2X0 p1538A (.Q(n_1354), 
	.B(FE_OFN99_fsm_op1_5_), 
	.A(n_1357));
   NA2X1 p1160A (.Q(n_1351), 
	.B(FE_OFN101_fsm_op1_4_), 
	.A(n_1357));
   NA2X1 p0777D (.Q(n_1346), 
	.B(\fsm_op1[3] ), 
	.A(n_1357));
   OR2X0 p15775A (.Q(n_1441), 
	.B(n_1345), 
	.A(n_1427));
   ON211X0 p7917A65462 (.Q(n_1373), 
	.D(n_1342), 
	.C(n_1343), 
	.B(n_1344), 
	.A(n_1001));
   AO221X0 p12921A (.Q(n_1452), 
	.E(n_1339), 
	.D(n_1340), 
	.C(FE_OFN94_fsm_op2_3_), 
	.B(n_1341), 
	.A(FE_OFN82_n_1402));
   AO221X0 p12921A64296 (.Q(n_1450), 
	.E(n_1338), 
	.D(n_1340), 
	.C(FE_OFN63_fsm_op2_1_), 
	.B(n_1341), 
	.A(FE_OFN86_fsm_op_aux_1_1_));
   AO221X0 p12921A64297 (.Q(n_1451), 
	.E(n_1337), 
	.D(n_1340), 
	.C(FE_OFN72_fsm_op2_2_), 
	.B(n_1341), 
	.A(FE_OFN84_fsm_op_aux_1_2_));
   AN221X0 p9751A (.Q(n_1385), 
	.E(n_1335), 
	.D(FE_OFN96_fsm_op1_6_), 
	.C(FE_OFN228_n_1336), 
	.B(FE_OFN227_n_1403), 
	.A(FE_OFN75_fsm_op_aux_1_6_));
   AN221X0 p10534A (.Q(n_1383), 
	.E(n_1333), 
	.D(FE_OFN228_n_1336), 
	.C(FE_OFN99_fsm_op1_5_), 
	.B(FE_OFN227_n_1403), 
	.A(FE_OFN77_n_1334));
   AN221X0 p10494A (.Q(n_1381), 
	.E(n_1331), 
	.D(FE_OFN228_n_1336), 
	.C(FE_OFN101_fsm_op1_4_), 
	.B(FE_OFN227_n_1403), 
	.A(FE_OFN79_fsm_op_aux_1_4_));
   NA2X1 p7780A (.Q(fsm_alu_op2_o[5]), 
	.B(n_1329), 
	.A(n_1330));
   ON21X0 p13034A (.Q(n_1448), 
	.C(n_1327), 
	.B(n_961), 
	.A(n_1328));
   ON21X0 p13034A64298 (.Q(n_1447), 
	.C(n_1326), 
	.B(n_1254), 
	.A(n_1328));
   ON21X0 p13034A64299 (.Q(n_1446), 
	.C(n_1324), 
	.B(n_1325), 
	.A(n_1328));
   ON211X0 p6470A (.Q(n_1375), 
	.D(n_1342), 
	.C(n_1322), 
	.B(n_1323), 
	.A(n_1001));
   AO221X0 p12921A64300 (.Q(n_1442), 
	.E(n_1321), 
	.D(n_1340), 
	.C(FE_OFN66_fsm_op2_0_), 
	.B(n_1341), 
	.A(FE_OFN89_n_1288));
   AO211X2 p6236A (.Q(fsm_alu_op2_o[2]), 
	.D(n_1319), 
	.C(n_1320), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(n_1377));
   ON21X0 p13489A (.Q(n_1457), 
	.C(FE_OFN103_fsm_op1_2_), 
	.B(n_1317), 
	.A(n_1318));
   ON211X0 p15830A (.Q(n_1438), 
	.D(n_1315), 
	.C(n_1316), 
	.B(n_36), 
	.A(n_1282));
   ON211X0 p15832A (.Q(n_1440), 
	.D(n_1313), 
	.C(n_1316), 
	.B(n_1314), 
	.A(n_1282));
   ON211X0 p15820A (.Q(n_1439), 
	.D(n_1312), 
	.C(n_1316), 
	.B(n_1109), 
	.A(n_1282));
   ON21X0 p13034A64301 (.Q(n_1437), 
	.C(n_1311), 
	.B(n_1171), 
	.A(n_1328));
   NO3X0 p11145A (.Q(n_1412), 
	.C(n_1308), 
	.B(n_1309), 
	.A(n_1310));
   AN321X0 p13482A (.Q(n_1459), 
	.F(n_1305), 
	.E(n_1306), 
	.D(FE_OFN103_fsm_op1_2_), 
	.C(n_1307), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN38_n_692));
   ON211X1 p6476A (.Q(fsm_alu_op2_o[1]), 
	.D(n_1303), 
	.C(n_1304), 
	.B(n_93), 
	.A(n_1001));
   ON211X1 p11171D (.Q(fsm_sfr_addr_o[5]), 
	.D(n_1300), 
	.C(n_1301), 
	.B(n_1314), 
	.A(n_1302));
   NA6X1 p6165D (.Q(fsm_alu_op2_o[0]), 
	.F(n_1294), 
	.E(n_1295), 
	.D(n_1296), 
	.C(n_1297), 
	.B(n_1298), 
	.A(n_1299));
   AN221X0 p13298A (.Q(n_1443), 
	.E(n_1292), 
	.D(FE_OFN40_n_198), 
	.C(n_1293), 
	.B(n_1454), 
	.A(FE_OFN61_fsm_op_aux_2_0_));
   AO21X0 p10885A (.Q(n_1456), 
	.C(n_1389), 
	.B(FE_OFN113_n_325), 
	.A(n_1291));
   AN221X0 p9715A (.Q(n_1387), 
	.E(n_1289), 
	.D(DFT_sdo), 
	.C(FE_OFN226_n_1290), 
	.B(n_1404), 
	.A(FE_OFN45_fsm_op_aux_2_7_));
   AN221X0 p9873A (.Q(n_1379), 
	.E(n_1287), 
	.D(FE_OFN66_fsm_op2_0_), 
	.C(FE_OFN226_n_1290), 
	.B(FE_OFN227_n_1403), 
	.A(FE_OFN89_n_1288));
   ON211X1 p11416A (.Q(fsm_sfr_addr_o[0]), 
	.D(n_1283), 
	.C(n_1284), 
	.B(n_1285), 
	.A(n_1286));
   ON211X0 p15828A (.Q(n_1434), 
	.D(n_1281), 
	.C(n_1316), 
	.B(n_35), 
	.A(n_1282));
   AO211X1 p8322A (.Q(fsm_alu_op2_o[7]), 
	.D(n_1279), 
	.C(n_1280), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_1377));
   ON211X0 p15842A (.Q(n_1430), 
	.D(n_1278), 
	.C(n_1316), 
	.B(n_49), 
	.A(n_1282));
   ON211X0 p15828A64302 (.Q(n_1428), 
	.D(n_1277), 
	.C(n_1316), 
	.B(n_1414), 
	.A(n_1282));
   AO221X0 p15385A (.Q(n_1426), 
	.E(n_806), 
	.D(n_1276), 
	.C(\fsm_op1[3] ), 
	.B(n_1365), 
	.A(FE_OFN53_fsm_op_aux_2_3_));
   AO222X0 p9736A (.Q(n_1400), 
	.F(FE_OFN226_n_1290), 
	.E(FE_OFN72_fsm_op2_2_), 
	.D(FE_OFN228_n_1336), 
	.C(FE_OFN103_fsm_op1_2_), 
	.B(n_1404), 
	.A(FE_OFN56_fsm_op_aux_2_2_));
   NA2I1X0 p12857A (.Q(n_1424), 
	.B(n_1275), 
	.AN(n_1274));
   OR5X0 p12379A (.Q(fsm_alu_opcode_o[0]), 
	.E(n_463), 
	.D(n_1270), 
	.C(n_1271), 
	.B(n_1272), 
	.A(n_1273));
   AN211X0 p11505A (.Q(n_1391), 
	.D(n_1267), 
	.C(n_1268), 
	.B(FE_OFN86_fsm_op_aux_1_1_), 
	.A(n_1269));
   ON31X0 p12111A (.Q(n_1398), 
	.D(FE_OFN96_fsm_op1_6_), 
	.C(n_1264), 
	.B(n_1265), 
	.A(n_1266));
   NA2X1 p0784D (.Q(n_1360), 
	.B(FE_OFN107_fsm_op1_0_), 
	.A(n_1263));
   NO3X0 p3656A (.Q(n_1367), 
	.C(n_1260), 
	.B(n_1263), 
	.A(n_1261));
   NO2I1X2 p0714D64303 (.Q(n_1415), 
	.B(n_1259), 
	.AN(n_1258));
   NO3X0 p13552A (.Q(n_1407), 
	.C(n_1256), 
	.B(n_1257), 
	.A(n_1318));
   OA211X0 p7289A (.Q(n_1330), 
	.D(n_1252), 
	.C(n_1253), 
	.B(n_1254), 
	.A(n_1255));
   NA2X0 p6184A (.Q(n_1319), 
	.B(n_1250), 
	.A(n_1251));
   NA3X0 p11887A (.Q(fsm_alu_en_o), 
	.C(n_1247), 
	.B(n_1248), 
	.A(n_1249));
   NO2X2 p0833D (.Q(n_1347), 
	.B(n_1245), 
	.A(n_1246));
   AO221X0 p4788A (.Q(fsm_pcau_msb_o[2]), 
	.E(n_1242), 
	.D(n_1243), 
	.C(n_550), 
	.B(\fsm_op_aux_1_2[2] ), 
	.A(FE_OFN210_n_1244));
   NA3X1 p12175A (.Q(fsm_sfr_rd_o_b), 
	.C(n_1239), 
	.B(n_1240), 
	.A(n_1241));
   NO3X0 p12192A (.Q(n_1397), 
	.C(n_1236), 
	.B(n_1237), 
	.A(n_1238));
   AN211X0 p12203A (.Q(n_1396), 
	.D(n_1233), 
	.C(n_1234), 
	.B(FE_OFN75_fsm_op_aux_1_6_), 
	.A(n_1235));
   NO3X4 p0861D (.Q(n_1362), 
	.C(n_1230), 
	.B(n_1231), 
	.A(n_1232));
   NO2I1X2 p0704D64304 (.Q(n_1348), 
	.B(n_1229), 
	.AN(n_1228));
   AO221X0 p15426A (.Q(n_1431), 
	.E(n_1223), 
	.D(n_1224), 
	.C(n_1225), 
	.B(n_1226), 
	.A(n_1227));
   AO221X0 p15413A (.Q(n_1429), 
	.E(n_1223), 
	.D(n_1224), 
	.C(FE_OFN202_n_1221), 
	.B(n_1226), 
	.A(n_1222));
   AN311X0 p13236A (.Q(n_1445), 
	.E(n_1274), 
	.D(n_1317), 
	.C(n_1219), 
	.B(n_1220), 
	.A(FE_OFN40_n_198));
   ON211X0 p16085A (.Q(n_1363), 
	.D(n_1216), 
	.C(n_1217), 
	.B(n_2134), 
	.A(n_1218));
   AO221X0 p15413A64305 (.Q(n_1436), 
	.E(n_1223), 
	.D(n_1224), 
	.C(FE_OFN206_n_1214), 
	.B(n_1226), 
	.A(n_1215));
   AN221X0 p13478A (.Q(n_1405), 
	.E(n_1211), 
	.D(FE_OFN38_n_692), 
	.C(n_1212), 
	.B(n_1213), 
	.A(FE_OFN202_n_1221));
   NA3X1 p11752A (.Q(fsm_rom_rd_o_b), 
	.C(n_1208), 
	.B(n_1209), 
	.A(n_1210));
   AN321X0 p5671D (.Q(n_1299), 
	.F(n_1205), 
	.E(n_1206), 
	.D(FE_OFN89_n_1288), 
	.C(n_1207), 
	.B(FE_OFN116_n_24), 
	.A(FE_OFN66_fsm_op2_0_));
   NO2I1X1 p0665DT (.Q(n_1349), 
	.B(n_1259), 
	.AN(n_1204));
   NA2X4 p0804D64306 (.Q(n_1357), 
	.B(n_1204), 
	.A(n_1203));
   OR6X0 p12096A (.Q(fsm_alu_opcode_o[1]), 
	.F(n_1197), 
	.E(n_1198), 
	.D(n_1199), 
	.C(n_1200), 
	.B(n_1201), 
	.A(n_1202));
   AO222X0 p13531A (.Q(fsm_ram_addr_o[7]), 
	.F(n_1454), 
	.E(FE_OFN45_fsm_op_aux_2_7_), 
	.D(n_1195), 
	.C(n_325), 
	.B(n_1196), 
	.A(FE_OFN73_fsm_op_aux_1_7_));
   AO31X0 p12884A (.Q(n_1425), 
	.D(n_1293), 
	.C(n_1194), 
	.B(n_1974), 
	.A(n_321));
   NO3X1 p4062A (.Q(n_1368), 
	.C(FE_OFN211_n_1191), 
	.B(n_1192), 
	.A(n_1193));
   AO221X0 p9363A (.Q(n_1287), 
	.E(n_1190), 
	.D(n_1404), 
	.C(FE_OFN60_fsm_op_aux_2_0_), 
	.B(FE_OFN228_n_1336), 
	.A(FE_OFN107_fsm_op1_0_));
   AN31X0 p10764A (.Q(n_1389), 
	.D(n_2135), 
	.C(n_1187), 
	.B(n_1188), 
	.A(n_1189));
   AO21X0 p15361A (.Q(n_1427), 
	.C(n_1223), 
	.B(n_883), 
	.A(n_1226));
   AN221X2 p5731A (.Q(n_1369), 
	.E(n_1184), 
	.D(FE_OFN53_fsm_op_aux_2_3_), 
	.C(n_1185), 
	.B(FE_OFN217_n_1186), 
	.A(FE_OFN94_fsm_op2_3_));
   AN21X4 p0807D (.Q(n_1361), 
	.C(n_1182), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_1183));
   ON311X0 p11297A (.Q(n_1392), 
	.E(FE_OFN113_n_325), 
	.D(FE_OFN105_fsm_op1_1_), 
	.C(n_1179), 
	.B(n_1180), 
	.A(n_1181));
   AN22X0 p15723A (.Q(n_1315), 
	.D(FE_OFN47_fsm_op_aux_2_6_), 
	.C(n_1365), 
	.B(FE_OFN70_fsm_op2_6_), 
	.A(n_1178));
   AN22X0 p15725A (.Q(n_1313), 
	.D(FE_OFN49_fsm_op_aux_2_5_), 
	.C(n_1365), 
	.B(FE_OFN91_fsm_op2_5_), 
	.A(n_1178));
   AN22X0 p15713A (.Q(n_1312), 
	.D(FE_OFN51_fsm_op_aux_2_4_), 
	.C(n_1365), 
	.B(FE_OFN92_fsm_op2_4_), 
	.A(n_1178));
   AN222X0 p12960A (.Q(n_1311), 
	.F(FE_OFN73_fsm_op_aux_1_7_), 
	.E(FE_OFN5_n_1175), 
	.D(n_1176), 
	.C(n_325), 
	.B(n_1177), 
	.A(FE_OFN45_fsm_op_aux_2_7_));
   AN222X0 p12960A64307 (.Q(n_1327), 
	.F(FE_OFN75_fsm_op_aux_1_6_), 
	.E(FE_OFN5_n_1175), 
	.D(n_1176), 
	.C(FE_OFN96_fsm_op1_6_), 
	.B(n_1177), 
	.A(FE_OFN47_fsm_op_aux_2_6_));
   AN222X0 p12960A64308 (.Q(n_1326), 
	.F(FE_OFN77_n_1334), 
	.E(FE_OFN5_n_1175), 
	.D(n_1176), 
	.C(FE_OFN99_fsm_op1_5_), 
	.B(n_1177), 
	.A(FE_OFN49_fsm_op_aux_2_5_));
   AN222X0 p12960A64309 (.Q(n_1324), 
	.F(FE_OFN79_fsm_op_aux_1_4_), 
	.E(FE_OFN5_n_1175), 
	.D(n_1176), 
	.C(FE_OFN101_fsm_op1_4_), 
	.B(n_1177), 
	.A(FE_OFN51_fsm_op_aux_2_4_));
   AO22X0 p9506A65463 (.Q(n_1401), 
	.D(FE_OFN94_fsm_op2_3_), 
	.C(FE_OFN226_n_1290), 
	.B(\fsm_op1[3] ), 
	.A(FE_OFN228_n_1336));
   AO22X0 p9677A (.Q(n_1399), 
	.D(FE_OFN63_fsm_op2_1_), 
	.C(FE_OFN226_n_1290), 
	.B(FE_OFN105_fsm_op1_1_), 
	.A(FE_OFN228_n_1336));
   AN222X0 p6038A (.Q(n_1303), 
	.F(FE_OFN86_fsm_op_aux_1_1_), 
	.E(n_1377), 
	.D(n_1173), 
	.C(n_1174), 
	.B(FE_OFN217_n_1186), 
	.A(FE_OFN63_fsm_op2_1_));
   ON22X0 p16107A (.Q(n_1364), 
	.D(n_1171), 
	.C(n_1172), 
	.B(FE_OFN129_n_2135), 
	.A(n_1282));
   AO22X0 p9437A (.Q(n_1289), 
	.D(FE_OFN113_n_325), 
	.C(FE_OFN228_n_1336), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(FE_OFN227_n_1403));
   OR2X0 p15517A (.Q(n_1435), 
	.B(n_1345), 
	.A(n_1178));
   NA2X1 p1660A (.Q(n_1355), 
	.B(FE_OFN91_fsm_op2_5_), 
	.A(n_1359));
   NA2X1 p1282A (.Q(n_1352), 
	.B(FE_OFN92_fsm_op2_4_), 
	.A(n_1359));
   NO2I1X2 p0816D (.Q(n_1246), 
	.B(n_1170), 
	.AN(FE_OFN94_fsm_op2_3_));
   NO2X2 p0694D (.Q(n_1229), 
	.B(n_1168), 
	.A(n_1169));
   NA3X0 p13370A (.Q(n_1318), 
	.C(n_1165), 
	.B(n_1166), 
	.A(n_1167));
   ON211X0 p5286A (.Q(fsm_pcau_msb_o[0]), 
	.D(n_1162), 
	.C(n_1163), 
	.B(n_35), 
	.A(n_1164));
   ON211X0 p5466A (.Q(fsm_pcau_msb_o[1]), 
	.D(n_1160), 
	.C(n_1161), 
	.B(n_1414), 
	.A(n_1164));
   ON211X0 p13244A (.Q(n_1211), 
	.D(n_1157), 
	.C(n_1158), 
	.B(n_1414), 
	.A(n_1159));
   NO3X0 p11079A (.Q(n_1283), 
	.C(n_1454), 
	.B(n_1155), 
	.A(n_1156));
   AN211X1 p11389A (.Q(n_1210), 
	.D(n_1151), 
	.C(n_1152), 
	.B(n_1153), 
	.A(FE_OFN204_n_1154));
   AN211X0 p11478A (.Q(n_1301), 
	.D(n_1150), 
	.C(n_1236), 
	.B(FE_OFN77_n_1334), 
	.A(n_1235));
   ON211X0 p8249A (.Q(n_1279), 
	.D(n_1146), 
	.C(n_1147), 
	.B(n_1148), 
	.A(n_1149));
   AN21X0 p6262A (.Q(n_1342), 
	.C(n_1143), 
	.B(n_1144), 
	.A(n_1145));
   AND6X0 p11806A (.Q(n_1249), 
	.F(n_1137), 
	.E(n_1138), 
	.D(n_1139), 
	.C(n_1140), 
	.B(n_1141), 
	.A(n_1142));
   NA3X0 p12078A (.Q(n_1202), 
	.C(n_1137), 
	.B(n_1135), 
	.A(n_1136));
   ON311X0 p3869A (.Q(n_1193), 
	.E(n_1131), 
	.D(n_1132), 
	.C(n_1133), 
	.B(n_1134), 
	.A(FE_OFN131_n_114));
   NA3X2 p1243A (.Q(n_1182), 
	.C(n_1128), 
	.B(FE_OFN212_n_1129), 
	.A(n_1130));
   NA3X0 p11233A (.Q(n_1310), 
	.C(n_1125), 
	.B(n_1126), 
	.A(n_1127));
   AN321X0 p7627A (.Q(n_1343), 
	.F(n_1123), 
	.E(FE_OFN217_n_1186), 
	.D(FE_OFN70_fsm_op2_6_), 
	.C(FE_OFN215_n_1124), 
	.B(FE_OFN92_fsm_op2_4_), 
	.A(n_1323));
   AN211X0 p11334A (.Q(n_1286), 
	.D(n_1179), 
	.C(n_1121), 
	.B(n_162), 
	.A(n_1122));
   ON211X0 p5516A (.Q(fsm_pcau_msb_o[6]), 
	.D(n_1119), 
	.C(n_1120), 
	.B(n_36), 
	.A(n_1164));
   ON211X0 p5516A64310 (.Q(fsm_pcau_msb_o[5]), 
	.D(n_1117), 
	.C(n_1118), 
	.B(n_1314), 
	.A(n_1164));
   AN221X0 p11318A (.Q(n_1411), 
	.E(n_1112), 
	.D(n_1113), 
	.C(n_1114), 
	.B(n_1115), 
	.A(FE_OFN191_n_1116));
   ON211X0 p5148A (.Q(fsm_pcau_msb_o[3]), 
	.D(n_1110), 
	.C(n_1111), 
	.B(n_37), 
	.A(n_1164));
   ON211X0 p5137A (.Q(fsm_pcau_msb_o[4]), 
	.D(n_1107), 
	.C(n_1108), 
	.B(n_1109), 
	.A(n_1164));
   ON211X0 p4659A (.Q(n_1242), 
	.D(n_1105), 
	.C(n_1106), 
	.B(n_1168), 
	.A(n_1258));
   NA3X0 p12688A (.Q(n_1274), 
	.C(n_1103), 
	.B(n_1104), 
	.A(n_1167));
   AN211X0 p11163A (.Q(n_1302), 
	.D(n_1264), 
	.C(n_1101), 
	.B(n_325), 
	.A(n_1102));
   AN211X0 p7136A (.Q(n_1252), 
	.D(n_1099), 
	.C(n_1100), 
	.B(FE_OFN49_fsm_op_aux_2_5_), 
	.A(n_1185));
   AN21X1 p6014A (.Q(n_1370), 
	.C(n_1143), 
	.B(FE_OFN82_n_1402), 
	.A(n_1377));
   AN211X0 p6001A (.Q(n_1251), 
	.D(n_1098), 
	.C(n_1100), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(n_1185));
   AN211X0 p12836A (.Q(n_1275), 
	.D(n_1257), 
	.C(n_1097), 
	.B(FE_OFN125_n_2135), 
	.A(n_1291));
   AND6X0 p11288A (.Q(n_1300), 
	.F(n_1091), 
	.E(n_1092), 
	.D(n_1093), 
	.C(n_1094), 
	.B(n_1095), 
	.A(n_1096));
   AN21X0 p12901A (.Q(n_1328), 
	.C(n_1340), 
	.B(n_1089), 
	.A(n_1090));
   ON21X0 p5768A (.Q(n_1205), 
	.C(n_1086), 
	.B(n_1087), 
	.A(n_1088));
   OR3X0 p14859A (.Q(n_1223), 
	.C(n_1449), 
	.B(n_1084), 
	.A(n_1085));
   ON21X1 p0855A (.Q(n_1263), 
	.C(n_1081), 
	.B(n_1082), 
	.A(n_1083));
   ON211X0 p5515A (.Q(fsm_pcau_msb_o[7]), 
	.D(n_1079), 
	.C(n_1080), 
	.B(n_2135), 
	.A(n_1164));
   AN321X0 p6181A (.Q(n_1322), 
	.F(n_1078), 
	.E(FE_OFN217_n_1186), 
	.D(FE_OFN92_fsm_op2_4_), 
	.C(FE_OFN215_n_1124), 
	.B(FE_OFN70_fsm_op2_6_), 
	.A(n_1344));
   AN221X1 p5716A (.Q(n_1250), 
	.E(n_1076), 
	.D(FE_OFN72_fsm_op2_2_), 
	.C(FE_OFN217_n_1186), 
	.B(FE_OFN215_n_1124), 
	.A(n_1077));
   AO221X0 p7643A (.Q(n_1280), 
	.E(n_1074), 
	.D(n_1075), 
	.C(FE_OFN45_fsm_op_aux_2_7_), 
	.B(FE_OFN217_n_1186), 
	.A(DFT_sdo));
   AN21X1 p0790D (.Q(n_1413), 
	.C(n_1072), 
	.B(FE_OFN63_fsm_op2_1_), 
	.A(n_1073));
   ON21X1 p0840A (.Q(n_1232), 
	.C(n_1069), 
	.B(n_1070), 
	.A(n_1071));
   AO222X0 p12894A (.Q(n_1423), 
	.F(n_1068), 
	.E(FE_OFN92_fsm_op2_4_), 
	.D(n_1395), 
	.C(FE_OFN79_fsm_op_aux_1_4_), 
	.B(n_1454), 
	.A(FE_OFN51_fsm_op_aux_2_4_));
   AO22X0 p9648A (.Q(n_1335), 
	.D(FE_OFN70_fsm_op2_6_), 
	.C(FE_OFN226_n_1290), 
	.B(FE_OFN47_fsm_op_aux_2_6_), 
	.A(n_1404));
   AO22X0 p10305A (.Q(n_1333), 
	.D(FE_OFN91_fsm_op2_5_), 
	.C(FE_OFN226_n_1290), 
	.B(FE_OFN49_fsm_op_aux_2_5_), 
	.A(n_1404));
   AO222X0 p12891A (.Q(n_1422), 
	.F(n_1068), 
	.E(FE_OFN94_fsm_op2_3_), 
	.D(n_1395), 
	.C(FE_OFN82_n_1402), 
	.B(n_1454), 
	.A(FE_OFN53_fsm_op_aux_2_3_));
   AO22X0 p10262A (.Q(n_1331), 
	.D(FE_OFN92_fsm_op2_4_), 
	.C(FE_OFN226_n_1290), 
	.B(FE_OFN51_fsm_op_aux_2_4_), 
	.A(n_1404));
   AN22X0 p13573A (.Q(n_1458), 
	.D(FE_OFN56_fsm_op_aux_2_2_), 
	.C(n_1454), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(n_1395));
   AN222X0 p7922D (.Q(n_1329), 
	.F(n_1377), 
	.E(FE_OFN77_n_1334), 
	.D(n_1173), 
	.C(n_1066), 
	.B(n_73), 
	.A(n_1067));
   ON221X0 p11078A (.Q(n_1309), 
	.E(n_1063), 
	.D(n_1064), 
	.C(FE_OFN115_n_2221), 
	.B(n_1065), 
	.A(FE_OFN129_n_2135));
   ON211X0 p12256A (.Q(n_1273), 
	.D(n_1060), 
	.C(n_1061), 
	.B(n_702), 
	.A(n_1062));
   ON321X0 p12556A (.Q(n_1293), 
	.F(n_1057), 
	.E(n_1058), 
	.D(n_41), 
	.C(n_1059), 
	.B(n_2125), 
	.A(FE_OFN37_n_692));
   INX1 Fp0694D (.Q(n_1203), 
	.A(n_1259));
   ON21X4 p0698D (.Q(n_1259), 
	.C(n_1055), 
	.B(n_1056), 
	.A(n_1083));
   INX0 Fp15527A64311 (.Q(n_1282), 
	.A(n_1276));
   OR2X0 p15006A (.Q(n_1276), 
	.B(n_1053), 
	.A(n_1054));
   NO3X0 p15851A (.Q(n_1218), 
	.C(n_1101), 
	.B(n_1052), 
	.A(n_1085));
   NA2X0 p11311A (.Q(n_1267), 
	.B(n_1050), 
	.A(n_1051));
   NA2X0 p15757A (.Q(n_1278), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(n_1365));
   NA2X0 p15743A (.Q(n_1277), 
	.B(FE_OFN58_fsm_op_aux_2_1_), 
	.A(n_1365));
   NA2X0 p15743A64312 (.Q(n_1281), 
	.B(FE_OFN60_fsm_op_aux_2_0_), 
	.A(n_1365));
   OR2X0 p11225A (.Q(n_1150), 
	.B(n_1049), 
	.A(n_1409));
   NA2X0 p13507A (.Q(n_1195), 
	.B(n_1048), 
	.A(n_1103));
   NA2I1X0 p13451A (.Q(n_1306), 
	.B(n_1104), 
	.AN(n_1097));
   NO2X2 p1000A (.Q(n_1069), 
	.B(n_1047), 
	.A(n_1192));
   AO211X0 p12721A (.Q(n_1317), 
	.D(n_1043), 
	.C(n_1044), 
	.B(n_1045), 
	.A(n_1046));
   NA3X0 p5028A (.Q(fsm_pcau_direct_o), 
	.C(n_1040), 
	.B(n_1041), 
	.A(n_1042));
   ON311X0 p12547A (.Q(n_1175), 
	.E(n_1036), 
	.D(n_1037), 
	.C(n_1038), 
	.B(n_1039), 
	.A(FE_OFN141_n_2118));
   ON311X0 p12308A (.Q(n_1238), 
	.E(n_1096), 
	.D(n_1033), 
	.C(n_1034), 
	.B(n_871), 
	.A(n_1035));
   OR6X1 p13205A (.Q(fsm_sfr_wr_o_b), 
	.F(n_1027), 
	.E(n_1028), 
	.D(n_1029), 
	.C(n_1030), 
	.B(n_1031), 
	.A(n_1032));
   ON211X1 p11174A (.Q(n_1152), 
	.D(n_1023), 
	.C(n_1024), 
	.B(n_1025), 
	.A(n_1026));
   ON221X1 p12603A (.Q(n_1257), 
	.E(n_1020), 
	.D(n_1021), 
	.C(n_2117), 
	.B(n_1022), 
	.A(n_1039));
   OR5X0 p12758A (.Q(fsm_alu_opcode_o[3]), 
	.E(n_1016), 
	.D(n_463), 
	.C(n_1017), 
	.B(n_1018), 
	.A(n_1019));
   NA3X0 p10941A (.Q(n_1179), 
	.C(n_1015), 
	.B(n_1065), 
	.A(n_1187));
   ON321X1 p15126A65464 (.Q(n_1178), 
	.F(n_1172), 
	.E(n_1011), 
	.D(n_1012), 
	.C(n_1013), 
	.B(n_1014), 
	.A(FE_OFN141_n_2118));
   NO2I1X1 p0703D (.Q(n_1169), 
	.B(n_1010), 
	.AN(n_1009));
   NA2X2 p0814A (.Q(n_1183), 
	.B(n_1008), 
	.A(n_1366));
   OA321X0 p3420A (.Q(n_1131), 
	.F(n_1004), 
	.E(n_1005), 
	.D(FE_OFN40_n_198), 
	.C(n_1006), 
	.B(n_1007), 
	.A(n_550));
   ON21X0 p13319A (.Q(n_1307), 
	.C(n_1058), 
	.B(n_1002), 
	.A(n_1003));
   ON211X0 p5733A (.Q(n_1184), 
	.D(n_999), 
	.C(n_1000), 
	.B(n_91), 
	.A(n_1001));
   AN221X0 p5924A (.Q(n_1304), 
	.E(n_997), 
	.D(FE_OFN58_fsm_op_aux_2_1_), 
	.C(n_1185), 
	.B(n_998), 
	.A(FE_OFN215_n_1124));
   OR3X0 p11855A (.Q(n_1233), 
	.C(n_995), 
	.B(n_996), 
	.A(n_1409));
   AN211X0 p11283A (.Q(n_1284), 
	.D(n_993), 
	.C(n_994), 
	.B(FE_OFN89_n_1288), 
	.A(n_1269));
   ON211X1 p12541A (.Q(n_1341), 
	.D(n_1036), 
	.C(n_991), 
	.B(n_1039), 
	.A(n_992));
   NA3I1X0 p11313A (.Q(n_1308), 
	.C(n_989), 
	.B(n_990), 
	.AN(n_1235));
   ON211X0 p10731A (.Q(n_1264), 
	.D(n_1127), 
	.C(n_988), 
	.B(FE_OFN129_n_2135), 
	.A(n_1189));
   ON211X0 p9042D (.Q(n_1336), 
	.D(n_985), 
	.C(n_986), 
	.B(n_2125), 
	.A(n_987));
   NO2I1X1 p0761DT (.Q(n_1170), 
	.B(n_1010), 
	.AN(n_984));
   NA2X1 p1138A (.Q(n_1359), 
	.B(n_984), 
	.A(n_983));
   AN221X0 p12274A (.Q(n_1241), 
	.E(n_980), 
	.D(n_981), 
	.C(n_113), 
	.B(n_982), 
	.A(FE_OFN26_n_19));
   OR6X1 p11969A (.Q(fsm_bit_byte_flag_o), 
	.F(n_975), 
	.E(n_976), 
	.D(n_977), 
	.C(n_978), 
	.B(n_1291), 
	.A(n_979));
   NA3X2 p11706A (.Q(fsm_ram_wr_o_b), 
	.C(n_972), 
	.B(n_973), 
	.A(n_974));
   AO21X0 p12520A (.Q(n_1340), 
	.C(n_971), 
	.B(n_2135), 
	.A(n_1180));
   AN211X0 p6352A (.Q(n_1372), 
	.D(n_968), 
	.C(n_969), 
	.B(FE_OFN94_fsm_op2_3_), 
	.A(n_970));
   AN321X0 p6026A (.Q(n_1298), 
	.F(n_963), 
	.E(n_964), 
	.D(n_965), 
	.C(FE_OFN205_n_966), 
	.B(n_967), 
	.A(FE_OFN73_fsm_op_aux_1_7_));
   ON221X0 p12021A (.Q(n_1234), 
	.E(FE_OFCN298_n_959), 
	.D(n_960), 
	.C(n_961), 
	.B(n_962), 
	.A(n_36));
   AN211X1 p5685A (.Q(n_1086), 
	.D(n_957), 
	.C(n_1197), 
	.B(n_958), 
	.A(n_463));
   ON221X1 p1026A (.Q(n_1231), 
	.E(n_953), 
	.D(n_954), 
	.C(n_955), 
	.B(n_956), 
	.A(n_1003));
   AN222X0 p15717A (.Q(n_1216), 
	.F(FE_OFN107_fsm_op1_0_), 
	.E(n_950), 
	.D(n_888), 
	.C(n_951), 
	.B(n_952), 
	.A(FE_OFN73_fsm_op_aux_1_7_));
   AO22X0 p13608A (.Q(n_1394), 
	.D(FE_OFN70_fsm_op2_6_), 
	.C(n_1068), 
	.B(FE_OFN47_fsm_op_aux_2_6_), 
	.A(n_1454));
   ON211X0 p11224A (.Q(n_1112), 
	.D(n_947), 
	.C(n_948), 
	.B(n_1006), 
	.A(n_949));
   AO22X0 p13602A (.Q(n_1393), 
	.D(FE_OFN91_fsm_op2_5_), 
	.C(n_1068), 
	.B(FE_OFN49_fsm_op_aux_2_5_), 
	.A(n_1454));
   AN22X0 p13653A (.Q(n_1406), 
	.D(FE_OFN58_fsm_op_aux_2_1_), 
	.C(n_1454), 
	.B(FE_OFN86_fsm_op_aux_1_1_), 
	.A(n_946));
   AO222X0 p7879A (.Q(n_1374), 
	.F(n_943), 
	.E(n_944), 
	.D(n_1173), 
	.C(n_945), 
	.B(n_1185), 
	.A(FE_OFN47_fsm_op_aux_2_6_));
   AO221X0 p5489A (.Q(n_1143), 
	.E(n_1076), 
	.D(n_943), 
	.C(n_941), 
	.B(FE_OFN215_n_1124), 
	.A(n_942));
   AO222X0 p6435A (.Q(n_1376), 
	.F(n_943), 
	.E(n_945), 
	.D(n_1173), 
	.C(n_944), 
	.B(n_1185), 
	.A(FE_OFN51_fsm_op_aux_2_4_));
   AO22X0 p6206A (.Q(n_1320), 
	.D(n_939), 
	.C(n_1173), 
	.B(n_940), 
	.A(n_1067));
   NA2X0 p12536A (.Q(n_1167), 
	.B(FE_OFN125_n_2135), 
	.A(n_1102));
   NO2I1X0 p6145A64313 (.Q(n_968), 
	.B(FE_OFN94_fsm_op2_3_), 
	.AN(n_1173));
   INX0 Fp12867A (.Q(n_1444), 
	.A(n_1395));
   OR2X1 p12373A (.Q(n_1395), 
	.B(n_1453), 
	.A(n_946));
   AO211X0 p11761A (.Q(fsm_alu_opcode_o[2]), 
	.D(n_937), 
	.C(n_1180), 
	.B(FE_OFN146_n_134), 
	.A(n_938));
   NA2X0 p13797A (.Q(n_1256), 
	.B(n_935), 
	.A(n_936));
   NO3X0 p12272A (.Q(n_1036), 
	.C(n_932), 
	.B(n_933), 
	.A(n_934));
   NA2X1 p9536A (.Q(n_1404), 
	.B(n_1061), 
	.A(n_931));
   NO2X2 p1214A (.Q(n_1130), 
	.B(n_929), 
	.A(n_930));
   NA3X2 p0847A (.Q(n_1073), 
	.C(n_927), 
	.B(n_1164), 
	.A(n_928));
   NA3X1 p9223A (.Q(n_1403), 
	.C(n_1294), 
	.B(n_925), 
	.A(n_926));
   ON21X0 p10796A (.Q(n_1127), 
	.C(FE_OFN113_n_325), 
	.B(n_923), 
	.A(n_924));
   NA2X0 p10984A (.Q(n_1409), 
	.B(n_921), 
	.A(n_922));
   AN21X0 p12268A (.Q(n_1265), 
	.C(FE_OFN129_n_2135), 
	.B(n_919), 
	.A(n_920));
   ON321X0 p10832A (.Q(n_1156), 
	.F(n_916), 
	.E(n_1285), 
	.D(n_917), 
	.C(n_918), 
	.B(n_1133), 
	.A(FE_OFN153_n_174));
   NO2I1X4 p0700D (.Q(n_1083), 
	.B(n_912), 
	.AN(n_911));
   AO21X0 p15084A (.Q(n_1365), 
	.C(n_1454), 
	.B(n_909), 
	.A(n_910));
   AN211X0 p4740A (.Q(n_1042), 
	.D(n_905), 
	.C(n_906), 
	.B(FE_OFN193_n_907), 
	.A(n_908));
   AN211X0 p12210A (.Q(n_1239), 
	.D(n_901), 
	.C(n_902), 
	.B(n_903), 
	.A(n_904));
   ON21X0 p4381A (.Q(n_1261), 
	.C(n_899), 
	.B(FE_OFN115_n_2221), 
	.A(n_900));
   AN221X4 p10509A (.Q(n_1187), 
	.E(n_924), 
	.D(n_178), 
	.C(n_896), 
	.B(n_897), 
	.A(n_898));
   AO211X2 p10622A (.Q(fsm_ram_rd_o_b), 
	.D(n_893), 
	.C(n_894), 
	.B(FE_OFN37_n_692), 
	.A(n_895));
   ON221X0 p15025A (.Q(n_1053), 
	.E(n_890), 
	.D(n_891), 
	.C(n_41), 
	.B(n_892), 
	.A(n_202));
   AN321X0 p15669A (.Q(n_1217), 
	.F(n_886), 
	.E(n_887), 
	.D(FE_OFN107_fsm_op1_0_), 
	.C(n_888), 
	.B(FE_OFN145_n_2110), 
	.A(n_889));
   AN21X0 p12595A (.Q(n_1103), 
	.C(n_885), 
	.B(n_321), 
	.A(n_1212));
   AN311X0 p3116A (.Q(n_1004), 
	.E(n_881), 
	.D(n_882), 
	.C(n_883), 
	.B(n_884), 
	.A(n_163));
   NO2X0 p11118A (.Q(n_1126), 
	.B(n_1266), 
	.A(n_880));
   ON21X0 p13506A (.Q(n_1166), 
	.C(FE_OFN39_n_23), 
	.B(n_879), 
	.A(n_1212));
   ON21X0 p8391A (.Q(n_1147), 
	.C(n_877), 
	.B(n_878), 
	.A(FE_OFN215_n_1124));
   AN321X0 p7861A (.Q(n_1146), 
	.F(n_873), 
	.E(FE_OFN214_n_874), 
	.D(FE_OFN113_n_325), 
	.C(n_875), 
	.B(FE_OFN129_n_2135), 
	.A(n_876));
   AN21X0 p7414A (.Q(n_1253), 
	.C(n_1076), 
	.B(n_872), 
	.A(FE_OFN215_n_1124));
   AN221X1 p11684A (.Q(n_1209), 
	.E(n_868), 
	.D(n_869), 
	.C(n_387), 
	.B(n_870), 
	.A(n_871));
   ON311X0 p15157A (.Q(n_1054), 
	.E(n_865), 
	.D(n_989), 
	.C(n_1025), 
	.B(n_866), 
	.A(n_867));
   NA3I1X0 p4228A (.Q(n_1260), 
	.C(n_863), 
	.B(n_864), 
	.AN(n_929));
   AN211X0 p12413A (.Q(n_1058), 
	.D(n_860), 
	.C(n_861), 
	.B(FE_OFN117_n_24), 
	.A(n_862));
   ON311X0 p12354A (.Q(n_971), 
	.E(n_856), 
	.D(n_857), 
	.C(FE_OFN73_fsm_op_aux_1_7_), 
	.B(n_858), 
	.A(n_859));
   INX0 Fp0696D (.Q(n_983), 
	.A(n_1010));
   NA3X2 p0726D (.Q(n_1010), 
	.C(n_854), 
	.B(n_855), 
	.A(n_928));
   AN211X0 p12564A (.Q(n_1104), 
	.D(n_852), 
	.C(n_934), 
	.B(FE_OFN125_n_2135), 
	.A(n_853));
   ON21X0 p12509A (.Q(n_1272), 
	.C(n_850), 
	.B(n_114), 
	.A(n_851));
   AN211X0 p11134A64314 (.Q(n_1125), 
	.D(n_847), 
	.C(n_848), 
	.B(n_849), 
	.A(n_285));
   AN221X0 p11668A (.Q(n_1460), 
	.E(n_845), 
	.D(FE_OFN79_fsm_op_aux_1_4_), 
	.C(n_1269), 
	.B(n_846), 
	.A(FE_OFN92_fsm_op2_4_));
   AO211X0 p14264A (.Q(n_1084), 
	.D(n_843), 
	.C(n_887), 
	.B(FE_OFN113_n_325), 
	.A(n_844));
   NO3X0 p10943A (.Q(n_1063), 
	.C(n_840), 
	.B(n_841), 
	.A(n_842));
   AN21X0 p8746A (.Q(n_986), 
	.C(n_838), 
	.B(n_967), 
	.A(n_839));
   OA321X0 p6403A (.Q(n_1297), 
	.F(n_835), 
	.E(n_987), 
	.D(n_836), 
	.C(n_837), 
	.B(n_2134), 
	.A(n_202));
   AN221X0 p14508A (.Q(n_1172), 
	.E(n_833), 
	.D(FE_OFN113_n_325), 
	.C(n_1180), 
	.B(n_834), 
	.A(FE_OFN184_n_443));
   AN311X0 p12355A (.Q(n_1240), 
	.E(n_830), 
	.D(n_831), 
	.C(n_794), 
	.B(FE_OFN192_n_832), 
	.A(n_270));
   ON21X1 p1092A (.Q(n_1192), 
	.C(n_828), 
	.B(FE_OFN136_n_270), 
	.A(n_829));
   AO221X0 p5492A (.Q(n_1098), 
	.E(n_827), 
	.D(n_943), 
	.C(n_1066), 
	.B(FE_OFN214_n_874), 
	.A(FE_OFN103_fsm_op1_2_));
   AN311X1 p10814A (.Q(n_1023), 
	.E(n_824), 
	.D(n_825), 
	.C(n_826), 
	.B(n_177), 
	.A(n_174));
   NO2X2 p0784A (.Q(n_1366), 
	.B(n_822), 
	.A(n_823));
   AN211X0 p11927A (.Q(n_1136), 
	.D(n_818), 
	.C(n_819), 
	.B(n_820), 
	.A(n_821));
   AN321X0 p4403A (.Q(n_1105), 
	.F(n_814), 
	.E(n_815), 
	.D(FE_OFN56_fsm_op_aux_2_2_), 
	.C(n_816), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(n_817));
   AO222X0 p13090A (.Q(n_1292), 
	.F(n_1194), 
	.E(n_813), 
	.D(n_1213), 
	.C(FE_OFN206_n_1214), 
	.B(n_1068), 
	.A(FE_OFN66_fsm_op2_0_));
   AO221X0 p6645A (.Q(n_1099), 
	.E(n_812), 
	.D(n_943), 
	.C(n_939), 
	.B(FE_OFN214_n_874), 
	.A(FE_OFN99_fsm_op1_5_));
   AO211X0 p5243A (.Q(n_997), 
	.D(n_810), 
	.C(n_811), 
	.B(FE_OFN105_fsm_op1_1_), 
	.A(FE_OFN214_n_874));
   ON221X0 p14919A (.Q(n_1085), 
	.E(n_807), 
	.D(n_808), 
	.C(FE_OFN142_n_117), 
	.B(n_809), 
	.A(FE_OFN153_n_174));
   AN221X0 p12451A (.Q(n_1463), 
	.E(n_806), 
	.D(FE_OFN82_n_1402), 
	.C(n_1269), 
	.B(n_846), 
	.A(FE_OFN94_fsm_op2_3_));
   AN222X0 p11498A (.Q(n_1432), 
	.F(FE_OFN84_fsm_op_aux_1_2_), 
	.E(n_1269), 
	.D(n_846), 
	.C(FE_OFN72_fsm_op2_2_), 
	.B(n_1226), 
	.A(n_1225));
   AN321X0 p11367A (.Q(n_1051), 
	.F(n_803), 
	.E(n_804), 
	.D(FE_OFN105_fsm_op1_1_), 
	.C(n_805), 
	.B(FE_OFN202_n_1221), 
	.A(n_113));
   AO22X0 p13143A (.Q(n_1339), 
	.D(\fsm_op1[3] ), 
	.C(n_1176), 
	.B(FE_OFN53_fsm_op_aux_2_3_), 
	.A(n_1177));
   AO22X0 p13143A64315 (.Q(n_1337), 
	.D(FE_OFN103_fsm_op1_2_), 
	.C(n_1176), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(n_1177));
   AO22X0 p13143A64316 (.Q(n_1338), 
	.D(FE_OFN105_fsm_op1_1_), 
	.C(n_1176), 
	.B(FE_OFN58_fsm_op_aux_2_1_), 
	.A(n_1177));
   AO22X0 p13143A64317 (.Q(n_1321), 
	.D(FE_OFN107_fsm_op1_0_), 
	.C(n_1176), 
	.B(FE_OFN60_fsm_op_aux_2_0_), 
	.A(n_1177));
   AN222X0 p5361A (.Q(n_1080), 
	.F(DFT_sdo), 
	.E(n_802), 
	.D(n_1243), 
	.C(fsm_pc_i[15]), 
	.B(n_815), 
	.A(FE_OFN45_fsm_op_aux_2_7_));
   AN222X0 p5361A64318 (.Q(n_1120), 
	.F(FE_OFN70_fsm_op2_6_), 
	.E(n_802), 
	.D(n_1243), 
	.C(fsm_pc_i[14]), 
	.B(n_815), 
	.A(FE_OFN47_fsm_op_aux_2_6_));
   AN222X0 p5361A64319 (.Q(n_1118), 
	.F(FE_OFN91_fsm_op2_5_), 
	.E(n_802), 
	.D(n_1243), 
	.C(fsm_pc_i[13]), 
	.B(n_815), 
	.A(FE_OFN49_fsm_op_aux_2_5_));
   AN222X0 p4964A (.Q(n_1108), 
	.F(FE_OFN92_fsm_op2_4_), 
	.E(n_802), 
	.D(n_1243), 
	.C(fsm_pc_i[12]), 
	.B(n_815), 
	.A(FE_OFN51_fsm_op_aux_2_4_));
   AN222X0 p4999A (.Q(n_1110), 
	.F(FE_OFN94_fsm_op2_3_), 
	.E(n_802), 
	.D(fsm_pc_i[11]), 
	.C(n_1243), 
	.B(n_815), 
	.A(FE_OFN53_fsm_op_aux_2_3_));
   AN22X0 p5540A (.Q(n_1160), 
	.D(FE_OFN86_fsm_op_aux_1_1_), 
	.C(n_906), 
	.B(FE_OFN63_fsm_op2_1_), 
	.A(n_802));
   AN22X0 p5329A (.Q(n_1162), 
	.D(FE_OFN89_n_1288), 
	.C(n_906), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_802));
   AN321X0 p13087A (.Q(n_1157), 
	.F(n_800), 
	.E(n_801), 
	.D(FE_OFN38_n_692), 
	.C(n_860), 
	.B(FE_OFN38_n_692), 
	.A(n_202));
   OA221X0 p11999A (.Q(n_1060), 
	.E(n_797), 
	.D(n_982), 
	.C(n_798), 
	.B(n_799), 
	.A(n_1056));
   INX0 Fp5663A (.Q(n_1255), 
	.A(FE_OFN217_n_1186));
   AO221X0 p5114A (.Q(n_1186), 
	.E(n_793), 
	.D(n_794), 
	.C(n_795), 
	.B(n_796), 
	.A(FE_OFN116_n_24));
   NO2X1 p11293A (.Q(n_1454), 
	.B(FE_OFN115_n_2221), 
	.A(n_792));
   INX0 Fp10687A (.Q(n_1188), 
	.A(n_1102));
   NA2X1 p10689A (.Q(n_1102), 
	.B(n_1015), 
	.A(n_920));
   AND2X0 p11192A (.Q(n_1461), 
	.B(n_791), 
	.A(n_1390));
   NA2I1X0 p13599A (.Q(n_1196), 
	.B(n_790), 
	.AN(n_1453));
   AND2X0 p11307A (.Q(n_1449), 
	.B(FE_OFN113_n_325), 
	.A(n_1121));
   ON21X0 p6330A (.Q(n_835), 
	.C(FE_OFN66_fsm_op2_0_), 
	.B(n_789), 
	.A(n_1271));
   NA2X0 p11228A (.Q(n_1101), 
	.B(n_787), 
	.A(n_788));
   NA2X1 p10796A64320 (.Q(n_824), 
	.B(n_785), 
	.A(n_786));
   NO3X0 p12187A (.Q(n_1248), 
	.C(n_1199), 
	.B(n_1017), 
	.A(n_784));
   OR2X1 p5868A (.Q(n_1173), 
	.B(n_783), 
	.A(n_878));
   ON321X0 p9110A (.Q(n_1190), 
	.F(n_778), 
	.E(n_779), 
	.D(n_837), 
	.C(n_780), 
	.B(n_781), 
	.A(n_782));
   NA3X0 p12191A (.Q(n_980), 
	.C(n_775), 
	.B(n_776), 
	.A(n_777));
   ON21X0 p11443A (.Q(n_1093), 
	.C(FE_OFN99_fsm_op1_5_), 
	.B(n_773), 
	.A(n_774));
   NA3X2 p1241A (.Q(n_929), 
	.C(n_770), 
	.B(n_771), 
	.A(n_772));
   AN22X0 p5544A (.Q(n_999), 
	.D(n_943), 
	.C(n_769), 
	.B(\fsm_op1[3] ), 
	.A(FE_OFN214_n_874));
   ON211X0 p11461A (.Q(n_868), 
	.D(n_765), 
	.C(n_766), 
	.B(n_767), 
	.A(n_768));
   NO3X1 p11448A (.Q(n_973), 
	.C(n_762), 
	.B(n_763), 
	.A(n_764));
   AN222X0 p6567A (.Q(n_1295), 
	.F(FE_OFN60_fsm_op_aux_2_0_), 
	.E(n_758), 
	.D(n_759), 
	.C(FE_OFN66_fsm_op2_0_), 
	.B(n_760), 
	.A(n_761));
   AN321X0 p6406A (.Q(n_1296), 
	.F(n_811), 
	.E(n_755), 
	.D(n_756), 
	.C(n_757), 
	.B(n_348), 
	.A(n_965));
   ON211X0 p12516A (.Q(n_1019), 
	.D(n_752), 
	.C(n_753), 
	.B(n_754), 
	.A(n_702));
   AN211X0 p12352A (.Q(n_850), 
	.D(n_1018), 
	.C(n_749), 
	.B(n_750), 
	.A(n_751));
   ON211X0 p11349A (.Q(n_1268), 
	.D(n_747), 
	.C(n_1410), 
	.B(n_1133), 
	.A(n_748));
   ON31X0 p11007A64321 (.Q(n_842), 
	.D(n_960), 
	.C(n_745), 
	.B(FE_OFN208_n_231), 
	.A(n_746));
   ON311X0 p11152A (.Q(n_994), 
	.E(n_742), 
	.D(n_747), 
	.C(n_743), 
	.B(n_2042), 
	.A(n_744));
   NA2I1X4 p0979A (.Q(n_1230), 
	.B(n_741), 
	.AN(FE_OFN211_n_1191));
   OA321X0 p3884A (.Q(n_899), 
	.F(FE_OFN212_n_1129), 
	.E(n_739), 
	.D(FE_OFN175_n_322), 
	.C(n_743), 
	.B(n_740), 
	.A(n_1070));
   NA3X1 p3169A (.Q(n_881), 
	.C(n_736), 
	.B(n_737), 
	.A(n_738));
   AN21X0 p11248A (.Q(n_1096), 
	.C(n_841), 
	.B(FE_OFN184_n_443), 
	.A(n_397));
   AO31X1 p5015A65465 (.Q(n_1076), 
	.D(n_811), 
	.C(n_943), 
	.B(n_734), 
	.A(n_735));
   AO22X0 p5559A (.Q(n_1100), 
	.D(n_943), 
	.C(n_732), 
	.B(FE_OFN215_n_1124), 
	.A(n_733));
   AN311X0 p10885A64322 (.Q(n_947), 
	.E(n_728), 
	.D(n_729), 
	.C(n_730), 
	.B(n_731), 
	.A(FE_OFN139_n_270));
   ON21X0 p5196A (.Q(n_810), 
	.C(n_725), 
	.B(n_726), 
	.A(n_727));
   ON321X0 p5782A (.Q(n_963), 
	.F(n_721), 
	.E(n_722), 
	.D(n_35), 
	.C(n_723), 
	.B(FE_OFN121_n_2044), 
	.A(n_724));
   AO222X0 p10726A (.Q(n_1155), 
	.F(n_908), 
	.E(n_1113), 
	.D(n_719), 
	.C(FE_OFN153_n_174), 
	.B(n_720), 
	.A(n_216));
   ON21X0 p9406D (.Q(n_1290), 
	.C(n_717), 
	.B(n_702), 
	.A(n_718));
   INX0 Fp12553A (.Q(n_936), 
	.A(n_852));
   ON21X0 p12581A (.Q(n_852), 
	.C(n_715), 
	.B(FE_OFN113_n_325), 
	.A(n_716));
   ON21X0 p12303A (.Q(n_946), 
	.C(n_790), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_714));
   AND2X2 p1088A (.Q(n_1164), 
	.B(n_713), 
	.A(n_855));
   ON321X0 p7428AT (.Q(n_1074), 
	.F(n_708), 
	.E(n_709), 
	.D(n_710), 
	.C(n_711), 
	.B(n_712), 
	.A(FE_OFN139_n_270));
   AN211X0 p9245D (.Q(n_931), 
	.D(n_706), 
	.C(n_1016), 
	.B(FE_OFN200_n_707), 
	.A(n_755));
   OA321X0 p11540A (.Q(n_962), 
	.F(n_788), 
	.E(n_1013), 
	.D(n_704), 
	.C(n_705), 
	.B(n_1011), 
	.A(FE_OFN139_n_270));
   AND2X2 p1025A (.Q(n_953), 
	.B(n_737), 
	.A(n_703));
   ON222X0 p8853A (.Q(n_838), 
	.F(n_697), 
	.E(n_698), 
	.D(n_699), 
	.C(n_700), 
	.B(n_701), 
	.A(n_702));
   ON21X0 p11190A (.Q(n_880), 
	.C(n_959), 
	.B(FE_OFN29_n_1973), 
	.A(n_696));
   OA211X0 p11612A (.Q(n_1139), 
	.D(n_837), 
	.C(n_694), 
	.B(n_2136), 
	.A(n_695));
   INX1 Fp12441A (.Q(n_1020), 
	.A(n_1043));
   ON321X0 p12136A (.Q(n_1043), 
	.F(n_690), 
	.E(n_691), 
	.D(FE_OFN38_n_692), 
	.C(n_693), 
	.B(FE_OFN121_n_2044), 
	.A(n_1039));
   NA2X2 p0697D (.Q(n_912), 
	.B(n_688), 
	.A(n_689));
   AN321X0 p8920A (.Q(n_926), 
	.F(n_684), 
	.E(n_816), 
	.D(n_685), 
	.C(n_686), 
	.B(FE_OFN185_n_2018), 
	.A(n_687));
   INX0 Fp5850A64325 (.Q(n_1001), 
	.A(n_1067));
   NA2X1 p5782A64326 (.Q(n_1067), 
	.B(n_683), 
	.A(n_1149));
   ON211X1 p0969A (.Q(n_1047), 
	.D(n_681), 
	.C(n_682), 
	.B(n_1134), 
	.A(n_1012));
   AN221X0 p4932A (.Q(n_1163), 
	.E(n_679), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[0] ), 
	.B(n_680), 
	.A(FE_OFN61_fsm_op_aux_2_0_));
   AO22X0 p7425A (.Q(n_1123), 
	.D(FE_OFN96_fsm_op1_6_), 
	.C(FE_OFN214_n_874), 
	.B(n_1344), 
	.A(n_678));
   AO321X0 p4896A (.Q(n_957), 
	.F(n_676), 
	.E(n_938), 
	.D(FE_OFN189_n_543), 
	.C(n_760), 
	.B(n_677), 
	.A(FE_OFN66_fsm_op2_0_));
   ON221X0 p15698A (.Q(n_886), 
	.E(n_1316), 
	.D(n_674), 
	.C(n_1012), 
	.B(n_675), 
	.A(n_2134));
   AN221X1 p1089A (.Q(n_828), 
	.E(n_671), 
	.D(n_672), 
	.C(FE_OFN192_n_832), 
	.B(n_673), 
	.A(FE_OFN121_n_2044));
   ON32X1 p1142A (.Q(n_822), 
	.E(n_668), 
	.D(FE_OFN89_n_1288), 
	.C(n_669), 
	.B(n_670), 
	.A(FE_OFN140_n_2121));
   MU2X0 p6455A (.S(n_667), 
	.Q(n_1145), 
	.IN1(n_943), 
	.IN0(FE_OFN215_n_1124));
   ON211X0 p1763A (.Q(n_1358), 
	.D(n_666), 
	.C(n_608), 
	.B(n_2134), 
	.A(n_662));
   AO221X0 p0884D (.Q(n_1356), 
	.E(n_664), 
	.D(n_906), 
	.C(FE_OFN47_fsm_op_aux_2_6_), 
	.B(n_665), 
	.A(FE_OFN75_fsm_op_aux_1_6_));
   AN221X0 p1818A (.Q(n_1353), 
	.E(n_664), 
	.D(n_665), 
	.C(FE_OFN77_n_1334), 
	.B(n_906), 
	.A(FE_OFN49_fsm_op_aux_2_5_));
   AN221X1 p1441A (.Q(n_1350), 
	.E(n_664), 
	.D(n_665), 
	.C(FE_OFN79_fsm_op_aux_1_4_), 
	.B(n_906), 
	.A(FE_OFN51_fsm_op_aux_2_4_));
   AO221X4 p0817D (.Q(n_1245), 
	.E(n_664), 
	.D(FE_OFN53_fsm_op_aux_2_3_), 
	.C(n_906), 
	.B(n_665), 
	.A(FE_OFN82_n_1402));
   AN21X1 p0797A (.Q(n_1228), 
	.C(n_663), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(n_665));
   ON21X1 p1002A (.Q(n_1072), 
	.C(n_660), 
	.B(n_661), 
	.A(n_662));
   ON321X0 p13150A (.Q(n_1028), 
	.F(n_657), 
	.E(n_1025), 
	.D(n_658), 
	.C(n_659), 
	.B(FE_OFN113_n_325), 
	.A(n_871));
   AO211X1 p11618A (.Q(fsm_ext_ram_o), 
	.D(n_654), 
	.C(n_655), 
	.B(FE_OFN146_n_134), 
	.A(n_656));
   AO321X0 p10430A (.Q(n_1266), 
	.F(n_774), 
	.E(n_888), 
	.D(n_652), 
	.C(FE_OFN113_n_325), 
	.B(n_494), 
	.A(n_653));
   AO22X0 p13809A (.Q(n_1305), 
	.D(FE_OFN72_fsm_op2_2_), 
	.C(n_1068), 
	.B(n_1225), 
	.A(n_1213));
   AO22X0 p5979A (.Q(n_1078), 
	.D(FE_OFN101_fsm_op1_4_), 
	.C(FE_OFN214_n_874), 
	.B(n_1323), 
	.A(n_651));
   AN321X0 p11112A (.Q(n_915), 
	.F(n_649), 
	.E(n_650), 
	.D(n_903), 
	.C(n_216), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN174_n_551));
   AN222X0 p10957A (.Q(n_921), 
	.F(n_673), 
	.E(n_646), 
	.D(n_647), 
	.C(FE_OFN39_n_23), 
	.B(FE_OFCN297_n_648), 
	.A(FE_OFN191_n_1116));
   ON221X0 p11979A (.Q(n_901), 
	.E(n_643), 
	.D(n_644), 
	.C(n_550), 
	.B(n_645), 
	.A(n_22));
   AO321X0 p11704A (.Q(n_1200), 
	.F(n_641), 
	.E(n_1017), 
	.D(FE_OFN153_n_174), 
	.C(n_642), 
	.B(FE_OFN129_n_2135), 
	.A(n_876));
   ON32X0 p15853A (.Q(n_1052), 
	.E(n_638), 
	.D(n_639), 
	.C(n_640), 
	.B(n_866), 
	.A(FE_OFN140_n_2121));
   ON211X0 p12530A (.Q(n_885), 
	.D(n_635), 
	.C(n_636), 
	.B(FE_OFN154_n_174), 
	.A(n_637));
   AN221X0 p10718A (.Q(n_916), 
	.E(n_803), 
	.D(n_1226), 
	.C(FE_OFN206_n_1214), 
	.B(n_634), 
	.A(FE_OFN189_n_543));
   OA211X0 p10994A (.Q(n_990), 
	.D(n_988), 
	.C(n_632), 
	.B(n_705), 
	.A(n_633));
   AN21X0 p13476A (.Q(n_1048), 
	.C(n_631), 
	.B(n_41), 
	.A(n_656));
   NO2X0 p4384A (.Q(n_814), 
	.B(n_743), 
	.A(n_630));
   NO2X0 p11411A (.Q(n_1269), 
	.B(n_2134), 
	.A(n_714));
   NA2X1 p0678D (.Q(n_688), 
	.B(FE_OFN190_n_628), 
	.A(n_629));
   NO2X0 p12608A65466 (.Q(n_1022), 
	.B(n_897), 
	.A(n_627));
   AND2X0 p13453A (.Q(n_1165), 
	.B(n_636), 
	.A(n_991));
   NA2X0 p11186A (.Q(n_788), 
	.B(n_883), 
	.A(n_1224));
   NO2I1X1 p4947A (.Q(n_811), 
	.B(n_626), 
	.AN(n_876));
   NO2X2 p5488A (.Q(n_1149), 
	.B(n_1016), 
	.A(n_625));
   NO2X0 p5894A (.Q(n_878), 
	.B(n_2134), 
	.A(n_624));
   AN21X0 p13198A (.Q(n_1176), 
	.C(n_41), 
	.B(n_992), 
	.A(n_623));
   AND6X1 p11222A (.Q(n_974), 
	.F(n_617), 
	.E(n_618), 
	.D(n_619), 
	.C(n_620), 
	.B(n_621), 
	.A(n_622));
   NA2X0 p13476A64327 (.Q(n_631), 
	.B(n_715), 
	.A(n_690));
   NO2I1X0 p12134A (.Q(n_1201), 
	.B(n_616), 
	.AN(FE_OFN215_n_1124));
   AN21X0 p11462A (.Q(n_1235), 
	.C(n_2134), 
	.B(n_614), 
	.A(n_615));
   ON211X1 p10498A (.Q(n_893), 
	.D(n_611), 
	.C(n_612), 
	.B(n_270), 
	.A(n_613));
   NA3I1X0 p10587A (.Q(n_894), 
	.C(n_609), 
	.B(n_610), 
	.AN(n_826));
   NA2X1 p1393A (.Q(n_663), 
	.B(n_607), 
	.A(n_608));
   ON211X0 p10833A (.Q(n_841), 
	.D(n_603), 
	.C(n_604), 
	.B(n_605), 
	.A(n_606));
   AN311X0 p11258A (.Q(n_765), 
	.E(n_600), 
	.D(n_601), 
	.C(n_871), 
	.B(n_602), 
	.A(FE_OFN166_n_2154));
   AN321X0 p11983A (.Q(n_790), 
	.F(n_598), 
	.E(n_248), 
	.D(n_1122), 
	.C(n_494), 
	.B(n_599), 
	.A(FE_OFN115_n_2221));
   AO21X0 p11306A (.Q(n_937), 
	.C(n_596), 
	.B(n_597), 
	.A(n_821));
   OR3X0 p5921A (.Q(n_964), 
	.C(n_595), 
	.B(n_625), 
	.A(n_749));
   ON311X0 p10725A (.Q(n_728), 
	.E(n_592), 
	.D(n_593), 
	.C(n_605), 
	.B(n_594), 
	.A(n_1003));
   ON321X0 p11921A (.Q(n_818), 
	.F(n_590), 
	.E(n_709), 
	.D(n_100), 
	.C(n_1056), 
	.B(n_746), 
	.A(n_591));
   OA21X0 p7619A (.Q(n_873), 
	.C(n_589), 
	.B(n_970), 
	.A(n_943));
   AN221X0 p11609A (.Q(n_1091), 
	.E(n_729), 
	.D(FE_OFN182_n_585), 
	.C(n_586), 
	.B(n_587), 
	.A(FE_OFN196_n_588));
   AN21X0 p10865A (.Q(n_1390), 
	.C(n_993), 
	.B(FE_OFN196_n_588), 
	.A(n_584));
   ON221X0 p12490A (.Q(n_1455), 
	.E(n_787), 
	.D(FE_OFN129_n_2135), 
	.C(n_582), 
	.B(n_1013), 
	.A(n_583));
   ON221X0 p11237A (.Q(n_847), 
	.E(n_581), 
	.D(n_917), 
	.C(FE_OFN129_n_2135), 
	.B(n_1034), 
	.A(n_2042));
   AO31X0 p12046A (.Q(n_1453), 
	.D(n_580), 
	.C(n_405), 
	.B(n_494), 
	.A(FE_OFN114_n_2221));
   NO2X2 p0764A (.Q(n_928), 
	.B(n_578), 
	.A(n_579));
   AO221X0 p11968A64328 (.Q(n_860), 
	.E(n_576), 
	.D(n_731), 
	.C(n_817), 
	.B(FE_OFN193_n_907), 
	.A(FE_OFN159_n_577));
   NO3I1X0 p10367A (.Q(n_920), 
	.C(n_575), 
	.B(n_1180), 
	.AN(n_917));
   AN221X0 p5140A (.Q(n_1161), 
	.E(n_574), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[1] ), 
	.B(n_680), 
	.A(FE_OFN58_fsm_op_aux_2_1_));
   AN21X1 p0968A (.Q(n_703), 
	.C(n_572), 
	.B(n_573), 
	.A(n_673));
   AO221X0 p10770A (.Q(n_1121), 
	.E(n_570), 
	.D(n_586), 
	.C(n_571), 
	.B(n_285), 
	.A(FE_OFN189_n_543));
   AO21X4 p6058A (.Q(n_1377), 
	.C(n_1206), 
	.B(n_569), 
	.A(n_686));
   AO221X0 p11429A (.Q(n_995), 
	.E(n_806), 
	.D(n_568), 
	.C(n_1113), 
	.B(n_729), 
	.A(FE_OFN121_n_2044));
   AN321X0 p8982A (.Q(n_985), 
	.F(n_567), 
	.E(n_371), 
	.D(FE_OFN37_n_692), 
	.C(n_340), 
	.B(FE_OFN139_n_270), 
	.A(n_876));
   ON31X0 p13126A (.Q(n_1032), 
	.D(n_565), 
	.C(FE_OFN113_n_325), 
	.B(n_566), 
	.A(FE_OFN135_n_255));
   ON321X0 p11923A (.Q(n_819), 
	.F(n_563), 
	.E(n_753), 
	.D(n_174), 
	.C(n_723), 
	.B(n_564), 
	.A(n_100));
   AND2X0 p9175A (.Q(n_717), 
	.B(n_624), 
	.A(n_562));
   AN211X0 p11786A (.Q(n_1140), 
	.D(n_559), 
	.C(n_751), 
	.B(n_560), 
	.A(n_561));
   AN321X0 p10604A (.Q(n_959), 
	.F(n_554), 
	.E(n_586), 
	.D(FE_OFN188_n_555), 
	.C(n_556), 
	.B(n_557), 
	.A(n_558));
   AO311X0 p8211A (.Q(n_684), 
	.E(n_1197), 
	.D(n_552), 
	.C(n_553), 
	.B(FE_OFN121_n_2044), 
	.A(n_112));
   AN321X0 p10398A (.Q(n_786), 
	.F(n_548), 
	.E(n_549), 
	.D(n_550), 
	.C(n_307), 
	.B(FE_OFN174_n_551), 
	.A(n_161));
   AN221X0 p11591A (.Q(n_1142), 
	.E(n_938), 
	.D(FE_OFN203_n_17), 
	.C(n_646), 
	.B(n_547), 
	.A(FE_OFN165_n_2181));
   AN211X0 p13477A (.Q(n_1159), 
	.D(n_932), 
	.C(n_545), 
	.B(n_546), 
	.A(n_1219));
   ON21X0 p12543A (.Q(n_934), 
	.C(n_935), 
	.B(FE_OFN37_n_692), 
	.A(n_544));
   AN321X0 p11744A (.Q(n_797), 
	.F(n_542), 
	.E(n_755), 
	.D(FE_OFN189_n_543), 
	.C(FE_OFN203_n_17), 
	.B(n_560), 
	.A(FE_OFN164_n_425));
   ON211X0 p12166A (.Q(n_831), 
	.D(n_538), 
	.C(n_539), 
	.B(n_540), 
	.A(n_541));
   ON211X1 p1152A (.Q(n_930), 
	.D(n_864), 
	.C(n_536), 
	.B(n_537), 
	.A(n_954));
   ON31X1 p4887A (.Q(n_802), 
	.D(n_1258), 
	.C(n_702), 
	.B(n_743), 
	.A(n_535));
   ON21X0 p5836A (.Q(n_1000), 
	.C(FE_OFN215_n_1124), 
	.B(n_589), 
	.A(n_534));
   AN321X0 p11476AT (.Q(n_1141), 
	.F(n_749), 
	.E(n_533), 
	.D(n_730), 
	.C(n_967), 
	.B(n_2020), 
	.A(FE_OFN185_n_2018));
   ON21X1 p0823A (.Q(n_823), 
	.C(n_530), 
	.B(n_531), 
	.A(n_532));
   INX0 Fp11434A (.Q(n_996), 
	.A(n_948));
   AN321X0 p11080A (.Q(n_948), 
	.F(n_527), 
	.E(FE_OFN194_n_528), 
	.D(n_529), 
	.C(FE_OFN196_n_588), 
	.B(FE_OFN117_n_24), 
	.A(FE_OFN189_n_543));
   AO211X0 p12284A (.Q(n_1046), 
	.D(n_627), 
	.C(n_526), 
	.B(FE_OFN117_n_24), 
	.A(FE_OFN193_n_907));
   AO211X0 p4489A (.Q(n_793), 
	.D(n_525), 
	.C(n_542), 
	.B(n_677), 
	.A(n_371));
   ON21X0 p14442A (.Q(n_833), 
	.C(n_524), 
	.B(n_284), 
	.A(n_637));
   ON211X0 p13234A (.Q(n_1031), 
	.D(n_520), 
	.C(n_521), 
	.B(n_522), 
	.A(n_523));
   AN321X0 p8829A (.Q(n_925), 
	.F(n_517), 
	.E(n_371), 
	.D(n_518), 
	.C(FE_OFN203_n_17), 
	.B(FE_OFN160_n_418), 
	.A(n_519));
   AN221X0 p12102A (.Q(n_777), 
	.E(n_513), 
	.D(n_871), 
	.C(n_514), 
	.B(n_515), 
	.A(FE_OFN169_n_516));
   ON221X0 p10299A (.Q(n_924), 
	.E(n_511), 
	.D(n_954), 
	.C(n_383), 
	.B(n_693), 
	.A(n_512));
   ON321X0 p13462A (.Q(n_1027), 
	.F(n_508), 
	.E(n_509), 
	.D(n_20), 
	.C(FE_OFN175_n_322), 
	.B(n_510), 
	.A(FE_OFN121_n_2044));
   AN22X0 p10958A (.Q(n_792), 
	.D(n_284), 
	.C(n_504), 
	.B(FE_OFN159_n_577), 
	.A(n_816));
   AO22X0 p12279A (.Q(n_1212), 
	.D(FE_OFN184_n_443), 
	.C(n_285), 
	.B(FE_OFN185_n_2018), 
	.A(n_896));
   AN22X0 p5585A (.Q(n_1117), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[5] ), 
	.B(FE_OFN77_n_1334), 
	.A(n_906));
   AN222X0 p12174A (.Q(n_752), 
	.F(FE_OFN185_n_2018), 
	.E(n_502), 
	.D(n_503), 
	.C(n_560), 
	.B(n_547), 
	.A(FE_OFN158_n_577));
   AN22X0 p5188A (.Q(n_1107), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[4] ), 
	.B(FE_OFN79_fsm_op_aux_1_4_), 
	.A(n_906));
   AN221X0 p11283A64329 (.Q(n_1050), 
	.E(n_500), 
	.D(FE_OFN63_fsm_op2_1_), 
	.C(n_846), 
	.B(n_501), 
	.A(FE_OFN191_n_1116));
   ON321X0 p12114A (.Q(n_979), 
	.F(n_791), 
	.E(n_498), 
	.D(FE_OFN175_n_322), 
	.C(n_1133), 
	.B(n_499), 
	.A(n_1134));
   AN32X0 p1215A (.Q(n_1009), 
	.E(n_496), 
	.D(n_1227), 
	.C(n_553), 
	.B(n_1225), 
	.A(n_497));
   AN32X1 p1271A (.Q(n_927), 
	.E(n_496), 
	.D(n_1222), 
	.C(n_553), 
	.B(FE_OFN202_n_1221), 
	.A(n_497));
   AN22X1 p0932A (.Q(n_741), 
	.D(n_494), 
	.C(n_495), 
	.B(FE_OFN89_n_1288), 
	.A(n_882));
   AN22X1 p0840D (.Q(n_1071), 
	.D(FE_OFN107_fsm_op1_0_), 
	.C(n_908), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_493));
   AN22X0 p5585A64330 (.Q(n_1079), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[7] ), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_906));
   AN22X0 p5585A64331 (.Q(n_1119), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[6] ), 
	.B(FE_OFN75_fsm_op_aux_1_6_), 
	.A(n_906));
   AN22X0 p13406A (.Q(n_1158), 
	.D(FE_OFN86_fsm_op_aux_1_1_), 
	.C(n_580), 
	.B(FE_OFN63_fsm_op2_1_), 
	.A(n_1068));
   AN32X0 p11445A (.Q(n_1095), 
	.E(n_491), 
	.D(FE_OFN91_fsm_op2_5_), 
	.C(FE_OFN196_n_588), 
	.B(n_430), 
	.A(n_492));
   AN22X0 p5173A (.Q(n_1111), 
	.D(FE_OFN210_n_1244), 
	.C(\fsm_op_aux_1_2[3] ), 
	.B(FE_OFN82_n_1402), 
	.A(n_906));
   AN221X0 p10983A (.Q(n_922), 
	.E(n_487), 
	.D(n_1113), 
	.C(n_488), 
	.B(n_489), 
	.A(n_490));
   AN22X1 p0992A (.Q(n_855), 
	.D(FE_OFN142_n_117), 
	.C(n_816), 
	.B(FE_OFN203_n_17), 
	.A(n_486));
   ON221X0 p11374A64332 (.Q(n_764), 
	.E(n_481), 
	.D(n_482), 
	.C(n_483), 
	.B(n_484), 
	.A(n_485));
   AO22X0 p5212A (.Q(n_827), 
	.D(n_872), 
	.C(n_970), 
	.B(n_480), 
	.A(n_969));
   AN32X0 p12327A (.Q(n_856), 
	.E(n_477), 
	.D(FE_OFN182_n_585), 
	.C(n_478), 
	.B(n_479), 
	.A(FE_OFN117_n_24));
   AO32X0 p11813A (.Q(n_933), 
	.E(n_474), 
	.D(n_479), 
	.C(n_475), 
	.B(n_476), 
	.A(FE_OFN144_n_2110));
   AO22X0 p4852A (.Q(n_796), 
	.D(FE_OFN182_n_585), 
	.C(n_642), 
	.B(FE_OFN170_n_473), 
	.A(n_686));
   AN222X0 p14845A (.Q(n_865), 
	.F(n_284), 
	.E(n_470), 
	.D(n_586), 
	.C(n_471), 
	.B(n_337), 
	.A(n_472));
   ON221X0 p11234A (.Q(n_848), 
	.E(n_468), 
	.D(n_1013), 
	.C(n_469), 
	.B(n_770), 
	.A(n_202));
   AO22X0 p6366A (.Q(n_812), 
	.D(n_1077), 
	.C(n_970), 
	.B(n_92), 
	.A(n_969));
   AN222X0 p14576A (.Q(n_807), 
	.F(n_466), 
	.E(n_908), 
	.D(n_226), 
	.C(n_568), 
	.B(n_467), 
	.A(n_909));
   AO32X0 p4389A (.Q(n_905), 
	.E(n_816), 
	.D(n_465), 
	.C(n_821), 
	.B(n_430), 
	.A(FE_OFN139_n_270));
   AO321X0 p15015A (.Q(n_952), 
	.F(n_464), 
	.E(n_888), 
	.D(n_1220), 
	.C(n_285), 
	.B(FE_OFN189_n_543), 
	.A(FE_OFN184_n_443));
   AN33X0 p9085A (.Q(n_778), 
	.F(n_462), 
	.E(n_463), 
	.D(FE_OFN142_n_117), 
	.C(n_616), 
	.B(n_340), 
	.A(FE_OFN205_n_966));
   NA2X0 p5066A (.Q(n_1106), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(n_906));
   NA2X0 p11201A (.Q(n_742), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_846));
   NA2X0 p10740A (.Q(n_719), 
	.B(n_461), 
	.A(n_808));
   NA2X0 p2047A (.Q(n_666), 
	.B(FE_OFN45_fsm_op_aux_2_7_), 
	.A(n_906));
   NA2X1 p1393A64333 (.Q(n_607), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(n_906));
   NA2X1 p1267A (.Q(n_660), 
	.B(FE_OFN58_fsm_op_aux_2_1_), 
	.A(n_906));
   NA2I1X0 p11436A (.Q(n_1181), 
	.B(n_917), 
	.AN(n_570));
   AN21X1 p1413A (.Q(n_1055), 
	.C(n_1243), 
	.B(n_459), 
	.A(FE_OFN209_n_460));
   NO2I1X0 p10818A (.Q(n_1226), 
	.B(n_745), 
	.AN(FE_OFN190_n_628));
   NA2I1X0 p10351A (.Q(n_897), 
	.B(n_458), 
	.AN(n_526));
   NA2X0 p1322A (.Q(n_984), 
	.B(n_883), 
	.A(n_496));
   NA2X0 p11697A (.Q(n_656), 
	.B(n_544), 
	.A(n_691));
   AND2X0 p6141A (.Q(n_1271), 
	.B(n_22), 
	.A(n_938));
   NO2X1 p1088A64334 (.Q(n_671), 
	.B(n_1007), 
	.A(n_457));
   NO2X0 p12810A (.Q(n_932), 
	.B(n_455), 
	.A(n_456));
   NA2X0 p12370A (.Q(n_935), 
	.B(FE_OFN125_n_2135), 
	.A(n_454));
   INX0 Fp1412A64336 (.Q(n_664), 
	.A(n_608));
   NA2X4 p1353A (.Q(n_608), 
	.B(n_453), 
	.A(n_816));
   NA2X0 p1234A (.Q(n_713), 
	.B(n_452), 
	.A(n_816));
   AND2X1 p10979A (.Q(n_1291), 
	.B(FE_OFN190_n_628), 
	.A(n_475));
   NO2X1 p5730D (.Q(n_1124), 
	.B(FE_OFN141_n_2118), 
	.A(n_712));
   NA2X0 p5768A64337 (.Q(n_624), 
	.B(FE_OFN152_n_284), 
	.A(n_463));
   NA2I1X0 p13073A (.Q(n_991), 
	.B(n_284), 
	.AN(n_637));
   NO2X0 p6031A (.Q(n_783), 
	.B(FE_OFN139_n_270), 
	.A(n_712));
   NA2X0 p1510A (.Q(n_854), 
	.B(n_451), 
	.A(n_816));
   AND2X2 p0917A (.Q(n_681), 
	.B(n_450), 
	.A(n_1132));
   ON21X0 p5534A (.Q(n_721), 
	.C(n_552), 
	.B(n_1174), 
	.A(n_449));
   NA2X0 p11318A64338 (.Q(n_596), 
	.B(n_753), 
	.A(n_448));
   AN311X1 p10166A (.Q(n_611), 
	.E(n_445), 
	.D(n_446), 
	.C(n_549), 
	.B(FE_OFN165_n_2181), 
	.A(n_447));
   AO21X0 p12686A (.Q(n_1177), 
	.C(n_1068), 
	.B(n_453), 
	.A(n_444));
   NA3I1X1 p0991D64339 (.Q(n_1008), 
	.C(FE_OFN184_n_443), 
	.B(n_1215), 
	.AN(n_531));
   ON31X0 p16845A (.Q(n_2046), 
	.D(n_1057), 
	.C(n_1059), 
	.B(n_442), 
	.A(n_41));
   ON321X0 p12060A (.Q(n_976), 
	.F(n_440), 
	.E(n_566), 
	.D(n_441), 
	.C(FE_OFN175_n_322), 
	.B(n_1011), 
	.A(FE_OFN136_n_270));
   AO21X0 p12124A (.Q(n_862), 
	.C(n_896), 
	.B(FE_OFN141_n_2118), 
	.A(n_2033));
   AO21X0 p7142A (.Q(n_678), 
	.C(n_969), 
	.B(FE_OFN70_fsm_op2_6_), 
	.A(n_970));
   AO21X0 p5695A (.Q(n_651), 
	.C(n_969), 
	.B(FE_OFN92_fsm_op2_4_), 
	.A(n_970));
   AN21X0 p5354A (.Q(n_727), 
	.C(n_969), 
	.B(FE_OFN63_fsm_op2_1_), 
	.A(n_970));
   ON21X0 p4969A (.Q(n_725), 
	.C(n_943), 
	.B(n_439), 
	.A(n_449));
   AN21X0 p15158A (.Q(n_891), 
	.C(n_586), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_438));
   NA2X0 p13422A (.Q(n_879), 
	.B(n_456), 
	.A(n_437));
   ON21X0 p5715A (.Q(n_1197), 
	.C(n_1138), 
	.B(n_2136), 
	.A(n_436));
   AN31X0 p11728A (.Q(n_1094), 
	.D(n_435), 
	.C(FE_OFN196_n_588), 
	.B(FE_OFN190_n_628), 
	.A(FE_OFN153_n_174));
   ON21X0 p12306A (.Q(n_1018), 
	.C(n_837), 
	.B(n_704), 
	.A(n_1056));
   AN22X0 p10993AT (.Q(n_714), 
	.D(FE_OFN182_n_585), 
	.C(n_909), 
	.B(FE_OFN193_n_907), 
	.A(n_434));
   NO2X1 p0777A (.Q(n_579), 
	.B(n_433), 
	.A(n_532));
   AN21X0 p12413A64340 (.Q(n_716), 
	.C(n_977), 
	.B(n_687), 
	.A(n_432));
   AN21X0 p9359A (.Q(n_1061), 
	.C(n_1199), 
	.B(n_430), 
	.A(n_431));
   AN21X0 p11100A (.Q(n_1189), 
	.C(n_429), 
	.B(FE_OFN193_n_907), 
	.A(n_1115));
   AN321X0 p11471A (.Q(n_914), 
	.F(n_426), 
	.E(n_427), 
	.D(n_495), 
	.C(n_428), 
	.B(FE_OFN148_n_153), 
	.A(n_86));
   AND3X0 p10700A65467 (.Q(n_1224), 
	.C(n_687), 
	.B(FE_OFN145_n_2110), 
	.A(n_805));
   AN31X0 p11133A (.Q(n_1065), 
	.D(n_429), 
	.C(FE_OFN193_n_907), 
	.B(n_113), 
	.A(FE_OFN163_n_425));
   ON21X0 p10902A (.Q(n_803), 
	.C(n_468), 
	.B(n_423), 
	.A(n_424));
   AN311X0 p14209A (.Q(n_524), 
	.E(n_487), 
	.D(n_435), 
	.C(n_1089), 
	.B(n_422), 
	.A(n_171));
   AN21X0 p6781A (.Q(n_1294), 
	.C(n_421), 
	.B(n_113), 
	.A(n_533));
   AO31X0 p5678A (.Q(n_1206), 
	.D(n_420), 
	.C(n_821), 
	.B(FE_OFN182_n_585), 
	.A(FE_OFN173_n_551));
   AO31X0 p10440A (.Q(n_993), 
	.D(n_1237), 
	.C(FE_OFN194_n_528), 
	.B(FE_OFN189_n_543), 
	.A(FE_OFN139_n_270));
   ON31X0 p11498A64341 (.Q(n_1236), 
	.D(n_419), 
	.C(n_949), 
	.B(n_423), 
	.A(n_1003));
   AO321X0 p10215A (.Q(n_840), 
	.F(n_464), 
	.E(n_1113), 
	.D(n_416), 
	.C(n_417), 
	.B(FE_OFN160_n_418), 
	.A(n_687));
   NO3X0 p5488A64342 (.Q(n_625), 
	.C(FE_OFN156_n_2115), 
	.B(FE_OFN73_fsm_op_aux_1_7_), 
	.A(n_712));
   AO31X0 p11928A (.Q(n_845), 
	.D(n_415), 
	.C(n_646), 
	.B(n_226), 
	.A(FE_OFN121_n_2044));
   AN221X1 p10809A (.Q(n_622), 
	.E(n_412), 
	.D(n_202), 
	.C(n_826), 
	.B(n_413), 
	.A(n_414));
   OA21X0 p10942A (.Q(n_747), 
	.C(n_989), 
	.B(n_858), 
	.A(n_982));
   AN21X0 p12526A (.Q(n_851), 
	.C(n_1017), 
	.B(FE_OFN40_n_198), 
	.A(n_411));
   AO21X1 p4190A (.Q(n_525), 
	.C(n_759), 
	.B(n_410), 
	.A(n_503));
   NO3X0 p8848A (.Q(n_517), 
	.C(n_550), 
	.B(n_409), 
	.A(n_698));
   AN31X1 p12096A64343 (.Q(n_690), 
	.D(n_655), 
	.C(FE_OFN193_n_907), 
	.B(n_1089), 
	.A(n_685));
   ON21X0 p5224A (.Q(n_874), 
	.C(n_722), 
	.B(n_407), 
	.A(n_408));
   AN21X0 p15514A (.Q(n_675), 
	.C(n_1345), 
	.B(n_406), 
	.A(n_477));
   AO21X0 p11964A (.Q(n_627), 
	.C(n_474), 
	.B(n_2033), 
	.A(FE_OFN187_n_2173));
   AND3X0 p13280A (.Q(n_1213), 
	.C(FE_OFN190_n_628), 
	.B(n_405), 
	.A(n_2135));
   ON21X0 p12218A (.Q(n_830), 
	.C(n_402), 
	.B(n_403), 
	.A(n_404));
   ON21X0 p12398A (.Q(n_635), 
	.C(n_1089), 
	.B(n_478), 
	.A(n_401));
   NA3X1 p1546A (.Q(n_1258), 
	.C(FE_OFN120_n_2044), 
	.B(n_494), 
	.A(n_400));
   INX2 Fp0725A (.Q(n_662), 
	.A(n_665));
   AO31X4 p0776A (.Q(n_665), 
	.D(FE_OFN210_n_1244), 
	.C(n_398), 
	.B(n_1090), 
	.A(n_399));
   AN21X0 p14804A (.Q(n_809), 
	.C(n_444), 
	.B(FE_OFN180_n_396), 
	.A(n_397));
   AO21X0 p16784A (.Q(n_2104), 
	.C(n_394), 
	.B(n_395), 
	.A(FE_OFN196_n_588));
   AN21X0 p1079A (.Q(n_668), 
	.C(n_392), 
	.B(n_22), 
	.A(n_393));
   AN222X0 p14637A (.Q(n_890), 
	.F(n_466), 
	.E(n_390), 
	.D(n_226), 
	.C(FE_OFCN297_n_648), 
	.B(n_391), 
	.A(n_673));
   OA321X0 p11848A (.Q(n_1208), 
	.F(n_388), 
	.E(n_389), 
	.D(n_20), 
	.C(n_1059), 
	.B(n_564), 
	.A(n_22));
   AN321X0 p11304A (.Q(n_766), 
	.F(n_386), 
	.E(n_599), 
	.D(FE_OFN185_n_2018), 
	.C(FE_OFN159_n_577), 
	.B(n_387), 
	.A(FE_OFN182_n_585));
   AN31X2 p1145A (.Q(n_771), 
	.D(n_384), 
	.C(n_898), 
	.B(n_2119), 
	.A(n_385));
   ON321X0 p13402A (.Q(n_1030), 
	.F(n_381), 
	.E(n_382), 
	.D(n_403), 
	.C(n_383), 
	.B(n_455), 
	.A(FE_OFN141_n_2118));
   AN21X1 p0980A (.Q(n_682), 
	.C(n_379), 
	.B(FE_OFN61_fsm_op_aux_2_0_), 
	.A(n_380));
   AO22X0 p12402A (.Q(fsm_alu_opcode_o[4]), 
	.D(n_377), 
	.C(n_821), 
	.B(n_378), 
	.A(n_547));
   AN321X0 p10418A (.Q(n_592), 
	.F(n_470), 
	.E(n_501), 
	.D(n_1113), 
	.C(FE_OFN196_n_588), 
	.B(FE_OFN145_n_2110), 
	.A(n_155));
   AN321X0 p10304A (.Q(n_610), 
	.F(n_373), 
	.E(n_374), 
	.D(FE_OFN121_n_2044), 
	.C(n_375), 
	.B(n_376), 
	.A(FE_OFN113_n_325));
   AN32X0 p11325A (.Q(n_1064), 
	.E(FE_OFN196_n_588), 
	.D(n_113), 
	.C(n_755), 
	.B(FE_OFN113_n_325), 
	.A(n_372));
   AN22X0 p4322A (.Q(n_630), 
	.D(FE_OFN103_fsm_op1_2_), 
	.C(n_371), 
	.B(FE_OFN72_fsm_op2_2_), 
	.A(FE_OFN209_n_460));
   AO32X0 p8415A (.Q(n_567), 
	.E(n_547), 
	.D(n_370), 
	.C(n_502), 
	.B(n_161), 
	.A(FE_OFN145_n_2110));
   ON32X0 p13201A (.Q(n_800), 
	.E(n_366), 
	.D(n_367), 
	.C(n_368), 
	.B(n_1035), 
	.A(n_369));
   ON22X0 p12957A (.Q(n_1044), 
	.D(n_1039), 
	.C(n_458), 
	.B(FE_OFN154_n_174), 
	.A(n_1021));
   AO32X0 p5248A (.Q(n_679), 
	.E(n_504), 
	.D(FE_OFN184_n_443), 
	.C(n_430), 
	.B(n_362), 
	.A(FE_OFN153_n_174));
   AN222X0 p12081A (.Q(n_643), 
	.F(FE_OFN40_n_198), 
	.E(n_360), 
	.D(n_903), 
	.C(FE_OFN185_n_2018), 
	.B(n_361), 
	.A(n_396));
   AO22X0 p11412A (.Q(n_641), 
	.D(n_560), 
	.C(n_875), 
	.B(FE_OFN177_n_396), 
	.A(n_359));
   ON211X1 p1089A64345 (.Q(n_1191), 
	.D(n_357), 
	.C(n_358), 
	.B(n_866), 
	.A(n_754));
   AN221X0 p12773A (.Q(n_657), 
	.E(n_354), 
	.D(n_355), 
	.C(FE_OFN176_n_396), 
	.B(n_356), 
	.A(n_2010));
   AN22X0 p5503A (.Q(n_1088), 
	.D(n_353), 
	.C(n_439), 
	.B(n_492), 
	.A(n_462));
   MU2IX1 p0748D (.S(n_2134), 
	.Q(n_629), 
	.IN1(n_352), 
	.IN0(FE_OFN141_n_2118));
   AN321X0 p12244A (.Q(n_776), 
	.F(n_349), 
	.E(FE_OFN169_n_516), 
	.D(n_350), 
	.C(n_549), 
	.B(n_22), 
	.A(n_351));
   AN32X1 p1155A (.Q(n_536), 
	.E(FE_OFN190_n_628), 
	.D(n_599), 
	.C(n_430), 
	.B(n_347), 
	.A(n_348));
   AO32X0 p10956A (.Q(n_804), 
	.E(n_286), 
	.D(n_393), 
	.C(n_888), 
	.B(n_571), 
	.A(FE_OFN131_n_114));
   AN32X0 p9054A (.Q(n_562), 
	.E(n_757), 
	.D(n_346), 
	.C(n_821), 
	.B(n_406), 
	.A(FE_OFN184_n_443));
   ON22X0 p14400A (.Q(n_844), 
	.D(n_1014), 
	.C(n_344), 
	.B(n_345), 
	.A(n_992));
   AN311X0 p12940A (.Q(n_565), 
	.E(n_342), 
	.D(n_343), 
	.C(n_453), 
	.B(FE_OFN197_n_224), 
	.A(n_376));
   OA321X0 p11561A (.Q(n_1135), 
	.F(n_694), 
	.E(n_341), 
	.D(n_2136), 
	.C(n_987), 
	.B(FE_OFN164_n_425), 
	.A(FE_OFN122_n_295));
   AO32X0 p4478A (.Q(n_676), 
	.E(FE_OFN203_n_17), 
	.D(n_472), 
	.C(n_561), 
	.B(FE_OFN89_n_1288), 
	.A(n_569));
   AN22X0 p4727A (.Q(n_626), 
	.D(FE_OFN142_n_117), 
	.C(n_340), 
	.B(FE_OFN113_n_325), 
	.A(n_875));
   AO33X0 p9846A (.Q(n_774), 
	.F(n_888), 
	.E(FE_OFN131_n_114), 
	.D(FE_OFN39_n_23), 
	.C(FE_OFN113_n_325), 
	.B(FE_OFN193_n_907), 
	.A(n_178));
   AO32X0 p5513A (.Q(n_1185), 
	.E(n_339), 
	.D(FE_OFN203_n_17), 
	.C(n_875), 
	.B(FE_OFN200_n_707), 
	.A(n_550));
   INX0 Fp0778A (.Q(n_572), 
	.A(n_738));
   AN222X1 p0630A (.Q(n_738), 
	.F(n_673), 
	.E(n_350), 
	.D(n_466), 
	.C(n_869), 
	.B(n_337), 
	.A(n_338));
   ON22X0 p15038A (.Q(n_834), 
	.D(FE_OFN38_n_692), 
	.C(n_829), 
	.B(n_409), 
	.A(n_1038));
   AO32X0 p6151A (.Q(n_758), 
	.E(n_371), 
	.D(n_794), 
	.C(n_821), 
	.B(n_336), 
	.A(FE_OFN160_n_418));
   ON22X0 p6379A (.Q(n_1207), 
	.D(n_982), 
	.C(n_1056), 
	.B(n_1007), 
	.A(n_335));
   AO32X0 p8878A (.Q(n_706), 
	.E(n_759), 
	.D(FE_OFN177_n_396), 
	.C(FE_OFN203_n_17), 
	.B(n_334), 
	.A(FE_OFN173_n_551));
   AN32X0 p15669A64346 (.Q(n_638), 
	.E(n_888), 
	.D(n_452), 
	.C(FE_OFN113_n_325), 
	.B(n_417), 
	.A(FE_OFN161_n_173));
   AO22X0 p15790A (.Q(n_950), 
	.D(n_226), 
	.C(n_1115), 
	.B(n_285), 
	.A(n_333));
   AN33X0 p14956A (.Q(n_892), 
	.F(n_337), 
	.E(FE_OFN142_n_117), 
	.D(n_161), 
	.C(n_729), 
	.B(FE_OFN121_n_2044), 
	.A(n_376));
   AO22X0 p12218A64347 (.Q(n_853), 
	.D(n_332), 
	.C(n_397), 
	.B(n_248), 
	.A(n_333));
   OA211X0 p11877A (.Q(n_1198), 
	.D(n_327), 
	.C(n_351), 
	.B(FE_OFN122_n_295), 
	.A(n_616));
   OA33X0 p10140A (.Q(n_988), 
	.F(n_640), 
	.E(n_2043), 
	.D(FE_OFN140_n_2121), 
	.C(n_1013), 
	.B(n_602), 
	.A(n_639));
   AO32X0 p7911A (.Q(n_1075), 
	.E(n_339), 
	.D(n_967), 
	.C(n_821), 
	.B(FE_OFN200_n_707), 
	.A(FE_OFN161_n_173));
   AO22X0 p11794A (.Q(n_784), 
	.D(FE_OFN173_n_551), 
	.C(n_821), 
	.B(FE_OFN189_n_543), 
	.A(n_533));
   NA2X0 p1427A (.Q(n_1128), 
	.B(FE_OFN89_n_1288), 
	.A(FE_OFN210_n_1244));
   NA2X4 p0476D (.Q(n_1386), 
	.B(fsm_pc_i[7]), 
	.A(n_420));
   NA2X4 p0464D (.Q(n_1384), 
	.B(fsm_pc_i[6]), 
	.A(n_420));
   NA2X1 p0422D (.Q(n_1382), 
	.B(fsm_pc_i[5]), 
	.A(n_420));
   NA2X4 p0489D (.Q(n_1380), 
	.B(fsm_pc_i[4]), 
	.A(n_420));
   NA2X1 p0041D (.Q(n_1420), 
	.B(fsm_pc_i[3]), 
	.A(n_420));
   NA2X2 p0060D (.Q(n_1418), 
	.B(fsm_pc_i[2]), 
	.A(n_420));
   NA2X1 p0062D (.Q(n_1416), 
	.B(fsm_pc_i[1]), 
	.A(n_420));
   NA2X4 p0053D (.Q(n_1378), 
	.B(fsm_pc_i[0]), 
	.A(n_420));
   NO2X0 p11151A (.Q(n_846), 
	.B(n_330), 
	.A(n_674));
   NA2I1X0 p10579A (.Q(n_896), 
	.B(n_344), 
	.AN(FE_OFN193_n_907));
   INX0 Fp10442A (.Q(n_440), 
	.A(n_575));
   NO2I1X0 p10507A (.Q(n_575), 
	.B(n_329), 
	.AN(FE_OFN190_n_628));
   NO2I1X0 p10052A (.Q(n_693), 
	.B(n_328), 
	.AN(n_329));
   NO2X0 p9457A (.Q(n_1199), 
	.B(FE_OFN156_n_2115), 
	.A(n_461));
   NO2X4 p0976A (.Q(n_906), 
	.B(FE_OFN163_n_425), 
	.A(n_461));
   NA2X0 p11508A (.Q(n_614), 
	.B(FE_OFN182_n_585), 
	.A(n_438));
   NA2X0 p10968A (.Q(n_593), 
	.B(FE_OFN146_n_134), 
	.A(n_634));
   NA2X4 p1447A (.Q(n_433), 
	.B(FE_OFN145_n_2110), 
	.A(n_327));
   INX0 Fp11186A (.Q(n_806), 
	.A(n_1316));
   NA2X0 p11091A (.Q(n_1316), 
	.B(n_326), 
	.A(n_757));
   NO2X0 p10737A (.Q(n_475), 
	.B(FE_OFN208_n_231), 
	.A(n_367));
   AND2X0 p4316A (.Q(n_542), 
	.B(n_406), 
	.A(FE_OFN209_n_460));
   AND2X0 p16468A (.Q(n_2103), 
	.B(n_113), 
	.A(n_489));
   INX0 Fp10600A64350 (.Q(n_805), 
	.A(n_745));
   NA2X2 p10424A (.Q(n_745), 
	.B(n_325), 
	.A(n_405));
   INX0 Fp11086A (.Q(n_632), 
	.A(n_500));
   NO2X0 p11141A (.Q(n_500), 
	.B(n_1025), 
	.A(n_1005));
   AND2X0 p11710A (.Q(n_751), 
	.B(FE_OFN166_n_2154), 
	.A(n_553));
   OR2X0 p10094A (.Q(n_526), 
	.B(n_324), 
	.A(n_478));
   NA2X0 p10656A (.Q(n_808), 
	.B(n_430), 
	.A(n_285));
   NA2X0 p13255A (.Q(n_623), 
	.B(n_2134), 
	.A(n_909));
   NA2X1 p6249A (.Q(n_837), 
	.B(FE_OFN189_n_543), 
	.A(n_323));
   NA2X0 p5059A (.Q(n_722), 
	.B(n_406), 
	.A(n_323));
   NA2X0 p12746A (.Q(n_456), 
	.B(FE_OFN142_n_117), 
	.A(n_397));
   NO2I1X1 p1382A (.Q(n_496), 
	.B(n_1087), 
	.AN(n_497));
   NO2X0 p5222A (.Q(n_938), 
	.B(FE_OFN139_n_270), 
	.A(n_723));
   INX0 Fp11795A (.Q(n_598), 
	.A(n_857));
   NA2X0 p11653A (.Q(n_857), 
	.B(FE_OFN142_n_117), 
	.A(n_444));
   INX0 Fp5388A64353 (.Q(n_463), 
	.A(n_712));
   NA2X1 p5200A (.Q(n_712), 
	.B(FE_OFN166_n_2154), 
	.A(n_327));
   NO2X0 p6295A (.Q(n_552), 
	.B(n_867), 
	.A(n_1087));
   NO2X0 p11055A (.Q(n_923), 
	.B(n_345), 
	.A(n_458));
   NO2I1X0 p11493A (.Q(n_1017), 
	.B(FE_OFN175_n_322), 
	.AN(n_795));
   NO2X1 p5148A64355 (.Q(n_969), 
	.B(FE_OFN175_n_322), 
	.A(n_709));
   AND2X0 p5685A64356 (.Q(n_749), 
	.B(n_350), 
	.A(n_760));
   NA2X0 p11471A64357 (.Q(n_753), 
	.B(FE_OFN177_n_396), 
	.A(n_411));
   NO2X4 p0828A (.Q(n_816), 
	.B(FE_OFN175_n_322), 
	.A(n_723));
   AND2X1 p4874A (.Q(n_943), 
	.B(FE_OFN189_n_543), 
	.A(n_359));
   INX0 Fp11907A (.Q(n_545), 
	.A(n_544));
   NA2X0 p11640A (.Q(n_544), 
	.B(FE_OFN161_n_173), 
	.A(n_397));
   OR2X0 p9263A (.Q(n_779), 
	.B(n_202), 
	.A(n_616));
   NA2X0 p12739A (.Q(n_637), 
	.B(n_321), 
	.A(n_397));
   NO2I1X0 p11278A (.Q(n_527), 
	.B(n_829), 
	.AN(n_2020));
   INX0 Fp10744A (.Q(n_603), 
	.A(n_1345));
   NO2X0 p10356A (.Q(n_1345), 
	.B(FE_OFN140_n_2121), 
	.A(n_709));
   NO3X0 p11901A (.Q(n_655), 
	.C(FE_OFN175_n_322), 
	.B(n_320), 
	.A(n_1059));
   INX0 Fp4555A64358 (.Q(n_698), 
	.A(n_686));
   OR2X0 p4487A (.Q(n_686), 
	.B(n_642), 
	.A(n_503));
   ON211X0 p11327A (.Q(n_763), 
	.D(n_316), 
	.C(n_317), 
	.B(n_318), 
	.A(n_319));
   AN211X0 p12319A (.Q(n_1408), 
	.D(n_743), 
	.C(FE_OFN131_n_114), 
	.B(n_315), 
	.A(n_605));
   AN21X0 p5150A (.Q(n_1041), 
	.C(n_1243), 
	.B(n_314), 
	.A(n_486));
   AN31X0 p4659A64359 (.Q(n_900), 
	.D(n_313), 
	.C(FE_OFN193_n_907), 
	.B(n_118), 
	.A(FE_OFN146_n_134));
   NO3X1 p12495A (.Q(n_1068), 
	.C(n_330), 
	.B(n_1011), 
	.A(DFT_sdo));
   NA2X1 p1202A (.Q(n_384), 
	.B(n_2100), 
	.A(n_312));
   INX0 Fp11263A (.Q(n_491), 
	.A(n_960));
   NA3X0 p11111A (.Q(n_960), 
	.C(n_86), 
	.B(DFT_sdo), 
	.A(n_438));
   NA2X1 p0850D (.Q(n_493), 
	.B(n_310), 
	.A(n_311));
   AN31X0 p12558A (.Q(n_1247), 
	.D(n_1270), 
	.C(n_200), 
	.B(n_383), 
	.A(n_967));
   AN32X0 p11128A (.Q(n_448), 
	.E(FE_OFN203_n_17), 
	.D(FE_OFCN297_n_648), 
	.C(n_308), 
	.B(n_967), 
	.A(n_309));
   AN21X0 p11744A64360 (.Q(n_748), 
	.C(n_393), 
	.B(n_750), 
	.A(n_307));
   NA3X0 p5726A (.Q(n_1138), 
	.C(n_155), 
	.B(FE_OFN193_n_907), 
	.A(n_494));
   AN21X1 p1048A (.Q(n_457), 
	.C(n_306), 
	.B(n_114), 
	.A(n_673));
   AO221X0 p12214A (.Q(n_902), 
	.E(n_304), 
	.D(n_396), 
	.C(FE_OFN160_n_418), 
	.B(n_305), 
	.A(n_227));
   ON21X0 p11700A (.Q(n_590), 
	.C(n_502), 
	.B(n_560), 
	.A(FE_OFN185_n_2018));
   ON21X0 p10774A (.Q(n_570), 
	.C(n_582), 
	.B(n_704), 
	.A(n_670));
   AO21X0 p12491A (.Q(n_861), 
	.C(n_477), 
	.B(FE_OFN142_n_117), 
	.A(n_307));
   AO21X0 p11701A (.Q(n_576), 
	.C(n_478), 
	.B(FE_OFN131_n_114), 
	.A(n_556));
   AND3X0 p17878A (.Q(n_2131), 
	.C(FE_OFN159_n_577), 
	.B(FE_OFN180_n_396), 
	.A(FE_OFN194_n_528));
   OR3X0 p10794A (.Q(n_468), 
	.C(FE_OFN121_n_2044), 
	.B(n_670), 
	.A(n_317));
   ON21X0 p4499A (.Q(n_863), 
	.C(n_301), 
	.B(n_750), 
	.A(n_302));
   NO3X0 p10842A (.Q(n_487), 
	.C(FE_OFN117_n_24), 
	.B(n_330), 
	.A(n_1056));
   NO3I1X0 p5520A (.Q(n_1016), 
	.C(FE_OFN156_n_2115), 
	.B(n_1087), 
	.AN(FE_OFN145_n_2110));
   AO21X0 p10190A (.Q(n_1237), 
	.C(n_975), 
	.B(FE_OFN191_n_1116), 
	.A(n_300));
   INX0 Fp10432A (.Q(n_554), 
	.A(n_1092));
   AN321X0 p10100A (.Q(n_1092), 
	.F(n_415), 
	.E(n_1113), 
	.D(n_569), 
	.C(n_299), 
	.B(FE_OFN141_n_2118), 
	.A(n_560));
   NO3X0 p10216A (.Q(n_464), 
	.C(FE_OFN153_n_174), 
	.B(n_1038), 
	.A(n_705));
   NO3X0 p12195A (.Q(n_977), 
	.C(FE_OFN136_n_270), 
	.B(FE_OFN185_n_2018), 
	.A(n_954));
   AN21X0 p9733A (.Q(n_718), 
	.C(n_298), 
	.B(FE_OFN187_n_2173), 
	.A(n_677));
   AO221X2 p9547A (.Q(n_445), 
	.E(n_294), 
	.D(FE_OFN176_n_396), 
	.C(FE_OFN122_n_295), 
	.B(n_296), 
	.A(n_297));
   NO3X0 p5891A (.Q(n_574), 
	.C(n_202), 
	.B(n_1056), 
	.A(n_293));
   AN21X0 p12405A (.Q(n_715), 
	.C(n_654), 
	.B(n_292), 
	.A(n_2033));
   AN21X0 p11567A (.Q(n_695), 
	.C(n_290), 
	.B(FE_OFN158_n_577), 
	.A(n_291));
   NA3X0 p13236A64361 (.Q(n_1037), 
	.C(n_898), 
	.B(n_324), 
	.A(FE_OFN125_n_2135));
   AND3X0 p4532A (.Q(n_815), 
	.C(n_289), 
	.B(n_340), 
	.A(n_430));
   AN21X0 p8716A (.Q(n_699), 
	.C(n_875), 
	.B(FE_OFN158_n_577), 
	.A(n_340));
   NA3I1X0 p7786A65468 (.Q(n_708), 
	.C(n_288), 
	.B(n_757), 
	.AN(n_1148));
   AND3X0 p12948A (.Q(n_1097), 
	.C(n_41), 
	.B(n_287), 
	.A(n_1219));
   AN31X0 p11142AT (.Q(n_773), 
	.D(n_1013), 
	.C(n_566), 
	.B(n_469), 
	.A(n_867));
   NA3X0 p11390A (.Q(n_787), 
	.C(n_284), 
	.B(n_285), 
	.A(n_286));
   NO3I1X0 p17376A (.Q(n_2106), 
	.C(FE_OFN155_n_2115), 
	.B(n_858), 
	.AN(FE_OFN180_n_396));
   AO221X0 p10516A (.Q(n_650), 
	.E(n_282), 
	.D(FE_OFN184_n_443), 
	.C(FE_OFN40_n_198), 
	.B(n_283), 
	.A(FE_OFN121_n_2044));
   NO2X0 p1111A (.Q(n_379), 
	.B(n_281), 
	.A(n_1006));
   AND3X4 p0758A (.Q(n_882), 
	.C(FE_OFN38_n_692), 
	.B(n_337), 
	.A(n_398));
   AN31X0 p11192A64362 (.Q(n_633), 
	.D(n_393), 
	.C(FE_OFN165_n_2181), 
	.B(FE_OFN160_n_418), 
	.A(n_162));
   AO221X0 p12098A (.Q(n_514), 
	.E(n_280), 
	.D(n_2134), 
	.C(n_1089), 
	.B(n_515), 
	.A(FE_OFN152_n_284));
   AN22X0 p11877A64363 (.Q(n_1026), 
	.D(FE_OFN26_n_19), 
	.C(n_278), 
	.B(FE_OFN135_n_255), 
	.A(n_279));
   ON22X0 p16926A (.Q(n_2196), 
	.D(n_1002), 
	.C(n_368), 
	.B(n_859), 
	.A(n_277));
   AN33X1 p1172A (.Q(n_772), 
	.F(n_1220), 
	.E(n_653), 
	.D(FE_OFN179_n_396), 
	.C(n_276), 
	.B(FE_OFN32_n_78), 
	.A(n_385));
   AN33X0 p11527A (.Q(n_913), 
	.F(n_273), 
	.E(n_274), 
	.D(n_94), 
	.C(n_291), 
	.B(FE_OFN199_n_275), 
	.A(FE_OFN26_n_19));
   ON22X1 p1194A (.Q(n_392), 
	.D(n_1007), 
	.C(n_866), 
	.B(n_2043), 
	.A(n_272));
   AN32X0 p11631A (.Q(n_1024), 
	.E(FE_OFN196_n_588), 
	.D(n_271), 
	.C(n_849), 
	.B(n_177), 
	.A(FE_OFN135_n_255));
   AO22X0 p10715A (.Q(n_647), 
	.D(FE_OFN184_n_443), 
	.C(n_337), 
	.B(FE_OFN142_n_117), 
	.A(FE_OFN196_n_588));
   AN32X0 p10695A (.Q(n_604), 
	.E(n_268), 
	.D(n_299), 
	.C(FE_OFN196_n_588), 
	.B(n_269), 
	.A(FE_OFN139_n_270));
   AN222X0 p13208A (.Q(n_508), 
	.F(n_903), 
	.E(n_265), 
	.D(n_266), 
	.C(FE_OFN39_n_23), 
	.B(n_267), 
	.A(n_677));
   AN32X0 p10262A64364 (.Q(n_511), 
	.E(n_264), 
	.D(n_248), 
	.C(FE_OFN193_n_907), 
	.B(n_898), 
	.A(FE_OFN136_n_270));
   AN31X1 p0950A (.Q(n_530), 
	.D(n_262), 
	.C(n_263), 
	.B(n_669), 
	.A(n_74));
   ON21X0 p1296A (.Q(n_505), 
	.C(n_260), 
	.B(n_261), 
	.A(n_670));
   AN22X1 p1200A (.Q(n_864), 
	.D(n_560), 
	.C(n_673), 
	.B(n_385), 
	.A(n_259));
   AN22X0 p4249A (.Q(n_739), 
	.D(FE_OFN148_n_153), 
	.C(n_346), 
	.B(n_257), 
	.A(n_599));
   INX0 Fp11472A (.Q(n_1033), 
	.A(n_1049));
   AO33X0 p11099A (.Q(n_1049), 
	.F(n_1114), 
	.E(n_981), 
	.D(n_142), 
	.C(n_256), 
	.B(n_86), 
	.A(n_453));
   AO22X0 p13241A (.Q(n_801), 
	.D(n_2033), 
	.C(n_1220), 
	.B(FE_OFN194_n_528), 
	.A(n_453));
   ON221X0 p10762A (.Q(n_412), 
	.E(n_252), 
	.D(n_253), 
	.C(FE_OFN146_n_134), 
	.B(n_254), 
	.A(FE_OFN135_n_255));
   ON32X0 p16584A (.Q(n_394), 
	.E(n_251), 
	.D(n_2042), 
	.C(n_1059), 
	.B(FE_OFN168_n_2183), 
	.A(n_199));
   AN22X0 p13340A (.Q(n_520), 
	.D(n_476), 
	.C(n_549), 
	.B(n_2052), 
	.A(n_479));
   NO2X4 p0782D (.Q(n_532), 
	.B(n_249), 
	.A(n_250));
   AN31X1 p0948A (.Q(n_1132), 
	.D(n_247), 
	.C(n_248), 
	.B(FE_OFN200_n_707), 
	.A(n_309));
   AO32X0 p10850A (.Q(n_600), 
	.E(n_244), 
	.D(n_2119), 
	.C(n_245), 
	.B(n_246), 
	.A(FE_OFN32_n_78));
   ON211X0 p11254A (.Q(n_619), 
	.D(n_730), 
	.C(FE_OFN135_n_255), 
	.B(FE_OFN208_n_231), 
	.A(FE_OFN113_n_325));
   AO22X0 p1328A (.Q(n_400), 
	.D(FE_OFN184_n_443), 
	.C(n_314), 
	.B(FE_OFN36_fsm_opcode_5_), 
	.A(FE_OFN193_n_907));
   AN32X0 p0744D (.Q(n_689), 
	.E(n_364), 
	.D(n_884), 
	.C(n_422), 
	.B(FE_OFN144_n_2110), 
	.A(FE_OFN146_n_134));
   AN32X0 p13518A (.Q(n_437), 
	.E(n_337), 
	.D(n_492), 
	.C(FE_OFN185_n_2018), 
	.B(n_2033), 
	.A(n_114));
   AN321X0 p12357A (.Q(n_402), 
	.F(n_243), 
	.E(FE_OFN190_n_628), 
	.D(n_297), 
	.C(FE_OFN129_n_2135), 
	.B(FE_OFN116_n_24), 
	.A(n_903));
   AN222X0 p11624A (.Q(n_972), 
	.F(n_114), 
	.E(n_240), 
	.D(n_241), 
	.C(FE_OFN168_n_2183), 
	.B(n_430), 
	.A(n_242));
   AN32X0 p1655A (.Q(n_1081), 
	.E(n_238), 
	.D(n_239), 
	.C(n_372), 
	.B(n_348), 
	.A(n_163));
   AO32X0 p12005A (.Q(n_454), 
	.E(n_337), 
	.D(n_237), 
	.C(FE_OFN189_n_543), 
	.B(n_558), 
	.A(n_171));
   AN321X0 p11025A (.Q(n_481), 
	.F(n_236), 
	.E(n_2177), 
	.D(FE_OFN146_n_134), 
	.C(n_571), 
	.B(n_297), 
	.A(FE_OFN121_n_2044));
   OA211X0 p13129A (.Q(n_1029), 
	.D(n_981), 
	.C(n_235), 
	.B(FE_OFN208_n_231), 
	.A(FE_OFN129_n_2135));
   AO32X0 p10683A (.Q(n_429), 
	.E(n_328), 
	.D(n_178), 
	.C(n_248), 
	.B(FE_OFN189_n_543), 
	.A(n_348));
   AO22X0 p11630A (.Q(n_474), 
	.D(FE_OFN187_n_2173), 
	.C(n_466), 
	.B(FE_OFN142_n_117), 
	.A(n_417));
   NO2X0 p11392A (.Q(n_918), 
	.B(n_731), 
	.A(FE_OFN196_n_588));
   NA2X0 p0846D (.Q(n_310), 
	.B(FE_OFN206_n_1214), 
	.A(n_884));
   OR2X0 p8654A (.Q(n_616), 
	.B(n_942), 
	.A(n_234));
   NA2X0 p11101A (.Q(n_674), 
	.B(DFT_sdo), 
	.A(n_226));
   NA2X0 p6061A (.Q(n_998), 
	.B(n_781), 
	.A(n_233));
   AND2X0 p5077A (.Q(n_504), 
	.B(FE_OFN180_n_396), 
	.A(n_362));
   NA2X0 p12863A (.Q(n_1021), 
	.B(n_232), 
	.A(FE_OFN193_n_907));
   OR2X0 p10555A (.Q(n_582), 
	.B(n_1038), 
	.A(n_330));
   AND2X4 p1162A (.Q(n_1243), 
	.B(n_362), 
	.A(n_238));
   NA2X0 p9976A65469 (.Q(n_329), 
	.B(n_284), 
	.A(FE_OFN193_n_907));
   NO2X0 p11098A (.Q(n_489), 
	.B(FE_OFN141_n_2118), 
	.A(n_1059));
   NA2X4 p1013A (.Q(n_461), 
	.B(n_794), 
	.A(FE_OFN194_n_528));
   OR2X0 p12102A64365 (.Q(n_1137), 
	.B(n_423), 
	.A(n_911));
   NA2X0 p12569A (.Q(n_636), 
	.B(n_248), 
	.A(n_584));
   AND2X4 p5263A (.Q(n_420), 
	.B(FE_OFN193_n_907), 
	.A(n_298));
   NA2X0 p10812A (.Q(n_989), 
	.B(FE_OFN193_n_907), 
	.A(n_1122));
   NA2X0 p11706A64366 (.Q(n_1410), 
	.B(FE_OFN193_n_907), 
	.A(n_339));
   INX0 Fp1463A (.Q(n_301), 
	.A(n_954));
   NA2X1 p1415A (.Q(n_954), 
	.B(FE_OFN189_n_543), 
	.A(FE_OFN193_n_907));
   NO2X1 p0773D (.Q(n_249), 
	.B(FE_OFN155_n_2115), 
	.A(FE_OFN208_n_231));
   NO2X4 p0831D (.Q(n_250), 
	.B(FE_OFN141_n_2118), 
	.A(n_883));
   NO2X1 p1354A (.Q(n_460), 
	.B(n_591), 
	.A(n_702));
   NA2X0 p11542A (.Q(n_691), 
	.B(n_112), 
	.A(n_248));
   INX0 Fp4067A (.Q(n_431), 
	.A(n_1005));
   NA2X1 p3945A (.Q(n_1005), 
	.B(n_289), 
	.A(n_248));
   NO2X1 p5284A (.Q(n_970), 
	.B(n_230), 
	.A(n_702));
   NO2X0 p8445A (.Q(n_547), 
	.B(n_407), 
	.A(n_1056));
   NA2X0 p11142A (.Q(n_1015), 
	.B(n_248), 
	.A(n_494));
   INX2 Fp0792A (.Q(n_306), 
	.A(n_344));
   NA2X4 p0785A (.Q(n_344), 
	.B(n_229), 
	.A(n_466));
   NO2X0 p5135A (.Q(n_323), 
	.B(n_499), 
	.A(n_702));
   NO2X0 p10921A (.Q(n_438), 
	.B(FE_OFN153_n_174), 
	.A(n_1011));
   NO2X2 p1302A (.Q(n_553), 
	.B(n_100), 
	.A(n_702));
   AND2X2 p10231A (.Q(n_1180), 
	.B(n_340), 
	.A(n_1122));
   INX0 Fp10164A (.Q(n_405), 
	.A(n_367));
   NA2X0 p9776A (.Q(n_367), 
	.B(FE_OFN159_n_577), 
	.A(n_466));
   AND2X4 p4117A (.Q(n_759), 
	.B(n_1220), 
	.A(n_340));
   NO2X0 p8354A (.Q(n_502), 
	.B(n_284), 
	.A(n_1056));
   NO2X0 p4784A (.Q(n_875), 
	.B(FE_OFN141_n_2118), 
	.A(n_702));
   INX0 Fp0833A (.Q(n_1090), 
	.A(n_365));
   NA2X1 p0840A64369 (.Q(n_365), 
	.B(FE_OFN159_n_577), 
	.A(n_417));
   INX0 Fp5323A (.Q(n_1040), 
	.A(n_680));
   NO2X0 p5240A (.Q(n_680), 
	.B(n_1056), 
	.A(n_911));
   INX0 Fp10524A (.Q(n_401), 
	.A(n_458));
   NA2X0 p10319A (.Q(n_458), 
	.B(FE_OFN130_n_114), 
	.A(n_248));
   NO2X0 p12821A (.Q(n_1219), 
	.B(n_423), 
	.A(FE_OFN113_n_325));
   NA2X4 p1092A64370 (.Q(n_1006), 
	.B(FE_OFN161_n_173), 
	.A(n_248));
   AND2X1 p6521A (.Q(n_755), 
	.B(n_309), 
	.A(n_340));
   NO2X0 p6619A (.Q(n_757), 
	.B(FE_OFN175_n_322), 
	.A(n_1056));
   NO2I1X0 p10037A (.Q(n_324), 
	.B(n_1038), 
	.AN(n_451));
   NO2X0 p11849A (.Q(n_444), 
	.B(n_1038), 
	.A(n_1133));
   INX1 Fp1600A64373 (.Q(n_397), 
	.A(n_829));
   NA2X1 p1350A (.Q(n_829), 
	.B(n_202), 
	.A(n_417));
   NA2X0 p13124A (.Q(n_992), 
	.B(n_228), 
	.A(n_417));
   INX0 Fp10345A64374 (.Q(n_470), 
	.A(n_419));
   NA2X0 p10125A (.Q(n_419), 
	.B(n_227), 
	.A(n_337));
   NO2X4 p1198A (.Q(n_393), 
	.B(FE_OFN130_n_114), 
	.A(n_1011));
   INX1 Fp10368A64380 (.Q(n_285), 
	.A(n_858));
   NA2X1 p10260A (.Q(n_858), 
	.B(n_202), 
	.A(n_226));
   NA2X1 p1354A64381 (.Q(n_770), 
	.B(n_529), 
	.A(n_226));
   NO2X0 p12420A (.Q(n_477), 
	.B(n_199), 
	.A(n_1011));
   NO2X0 p11089A (.Q(n_909), 
	.B(FE_OFN163_n_425), 
	.A(n_1011));
   INX12 Fp4107A64384 (.Q(n_371), 
	.A(n_408));
   NA2X0 p3820A (.Q(n_408), 
	.B(n_309), 
	.A(FE_OFN203_n_17));
   INX1 Fp1255A (.Q(n_327), 
	.A(n_1087));
   NA2X4 p1136A (.Q(n_1087), 
	.B(FE_OFN189_n_543), 
	.A(FE_OFN203_n_17));
   NA2X1 p4814A (.Q(n_709), 
	.B(n_118), 
	.A(n_340));
   NA2X1 p1375A (.Q(n_312), 
	.B(n_332), 
	.A(n_337));
   NO2X0 p6481A (.Q(n_789), 
	.B(n_225), 
	.A(n_702));
   NO2X0 p4837A (.Q(n_359), 
	.B(n_836), 
	.A(n_702));
   NO2X0 p6728A (.Q(n_533), 
	.B(n_740), 
	.A(n_1056));
   NO2X0 p5722A (.Q(n_795), 
	.B(n_257), 
	.A(n_1056));
   NO2X1 p9984A (.Q(n_478), 
	.B(FE_OFN141_n_2118), 
	.A(n_670));
   INX0 Fp9719A (.Q(n_888), 
	.A(n_1013));
   NA2X4 p9601A (.Q(n_1013), 
	.B(FE_OFN113_n_325), 
	.A(n_337));
   NO2X0 p4244A (.Q(n_503), 
	.B(FE_OFN161_n_173), 
	.A(n_1056));
   NO2X0 p5282A (.Q(n_760), 
	.B(FE_OFN156_n_2115), 
	.A(n_702));
   INX0 Fp0786A64394 (.Q(n_411), 
	.A(n_723));
   NA2X4 p0740A (.Q(n_723), 
	.B(FE_OFN185_n_2018), 
	.A(FE_OFN203_n_17));
   NA2X0 p6668A (.Q(n_987), 
	.B(n_794), 
	.A(FE_OFN203_n_17));
   NO2X0 p10654A (.Q(n_586), 
	.B(FE_OFN152_n_284), 
	.A(n_670));
   NA2X0 p1132D (.Q(n_281), 
	.B(FE_OFN117_n_24), 
	.A(n_677));
   NO2X1 p4294A (.Q(n_821), 
	.B(FE_OFN116_n_24), 
	.A(n_702));
   NO2X1 p4569A (.Q(n_642), 
	.B(FE_OFN139_n_270), 
	.A(n_702));
   NO2I1X0 p14361A (.Q(n_887), 
	.B(n_670), 
	.AN(FE_OFN205_n_966));
   AN321X0 p12210A64395 (.Q(n_538), 
	.F(n_222), 
	.E(n_223), 
	.D(n_396), 
	.C(FE_OFN184_n_443), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN197_n_224));
   AN211X0 p7316A (.Q(n_711), 
	.D(n_942), 
	.C(n_534), 
	.B(FE_OFN94_fsm_op2_3_), 
	.A(n_91));
   ON21X1 p0852D (.Q(n_1215), 
	.C(n_221), 
	.B(n_32), 
	.A(n_965));
   ON21X0 p5391A (.Q(n_462), 
	.C(n_233), 
	.B(n_220), 
	.A(n_726));
   NA3X1 p1222A (.Q(n_450), 
	.C(FE_OFN66_fsm_op2_0_), 
	.B(n_451), 
	.A(n_313));
   AN21X0 p12418A (.Q(n_349), 
	.C(n_522), 
	.B(n_218), 
	.A(n_219));
   AN21X0 p12023A (.Q(n_498), 
	.C(n_432), 
	.B(FE_OFN148_n_153), 
	.A(n_217));
   NA3X0 p1177A (.Q(n_357), 
	.C(FE_OFN31_fsm_opcode_7_), 
	.B(n_377), 
	.A(FE_OFN193_n_907));
   NA3X0 p13375A (.Q(n_1057), 
	.C(FE_OFN182_n_585), 
	.B(n_216), 
	.A(n_453));
   NO3I1X0 p5919A (.Q(n_595), 
	.C(n_383), 
	.B(n_780), 
	.AN(n_422));
   ON321X0 p10141A (.Q(n_373), 
	.F(n_215), 
	.E(FE_OFN129_n_2135), 
	.D(n_704), 
	.C(n_871), 
	.B(n_700), 
	.A(n_114));
   AN321X1 p11159A (.Q(n_621), 
	.F(n_211), 
	.E(n_212), 
	.D(n_213), 
	.C(n_273), 
	.B(n_687), 
	.A(n_214));
   NO2I1X0 p0755D (.Q(n_352), 
	.B(n_210), 
	.AN(FE_OFN155_n_2115));
   OA21X0 p13925A (.Q(n_843), 
	.C(n_226), 
	.B(n_820), 
	.A(n_300));
   AO21X0 p9822A65470 (.Q(n_975), 
	.C(n_209), 
	.B(n_299), 
	.A(FE_OFN205_n_966));
   NA2X0 p11405A (.Q(n_615), 
	.B(FE_OFN193_n_907), 
	.A(n_434));
   OA21X0 p12044A (.Q(n_978), 
	.C(n_653), 
	.B(FE_OFN205_n_966), 
	.A(n_584));
   OR3X0 p11776A (.Q(n_563), 
	.C(n_483), 
	.B(n_2134), 
	.A(n_780));
   AN21X0 p11965A (.Q(n_559), 
	.C(n_702), 
	.B(n_208), 
	.A(n_537));
   ON221X0 p9370A (.Q(n_294), 
	.E(n_207), 
	.D(n_871), 
	.C(n_697), 
	.B(n_746), 
	.A(n_658));
   NA3X1 p10414A (.Q(n_917), 
	.C(FE_OFN37_n_692), 
	.B(n_351), 
	.A(FE_OFN193_n_907));
   AND3X0 p9944A (.Q(n_415), 
	.C(n_406), 
	.B(n_104), 
	.A(FE_OFN193_n_907));
   AO21X0 p6204A (.Q(n_756), 
	.C(n_291), 
	.B(FE_OFN189_n_543), 
	.A(n_108));
   AN311X0 p10261A (.Q(n_609), 
	.E(n_204), 
	.D(n_205), 
	.C(FE_OFN73_fsm_op_aux_1_7_), 
	.B(n_428), 
	.A(n_206));
   AN222X0 p13114A (.Q(n_382), 
	.F(FE_OFN170_n_473), 
	.E(n_302), 
	.D(n_2017), 
	.C(n_202), 
	.B(FE_OFN129_n_2135), 
	.A(n_203));
   AN21X0 p13827A (.Q(n_523), 
	.C(n_372), 
	.B(FE_OFN182_n_585), 
	.A(n_2134));
   ON31X0 p10968A64396 (.Q(n_825), 
	.D(n_201), 
	.C(n_2042), 
	.B(n_700), 
	.A(n_114));
   AN21X0 p12718A (.Q(n_1062), 
	.C(n_377), 
	.B(n_202), 
	.A(n_200));
   INX0 Fp6934A (.Q(n_694), 
	.A(n_421));
   NO3I1X0 p6839A (.Q(n_421), 
	.C(n_744), 
	.B(n_743), 
	.AN(n_2033));
   NO3X0 p11127A (.Q(n_729), 
	.C(FE_OFN40_n_198), 
	.B(n_199), 
	.A(n_1038));
   AND3X0 p10742A (.Q(n_634), 
	.C(n_177), 
	.B(n_155), 
	.A(n_297));
   NA3X0 p5909A (.Q(n_683), 
	.C(FE_OFN146_n_134), 
	.B(n_288), 
	.A(n_340));
   ON222X0 p12939A (.Q(n_342), 
	.F(n_195), 
	.E(FE_OFN164_n_425), 
	.D(n_196), 
	.C(n_1974), 
	.B(n_197), 
	.A(FE_OFN26_n_19));
   AO21X0 p10673A (.Q(n_895), 
	.C(n_331), 
	.B(n_871), 
	.A(n_194));
   INX0 Fp4423A (.Q(n_335), 
	.A(n_561));
   ON21X2 p4367A (.Q(n_561), 
	.C(n_702), 
	.B(FE_OFN161_n_173), 
	.A(n_2136));
   NO3X0 p11998A (.Q(n_654), 
	.C(n_1003), 
	.B(n_1038), 
	.A(FE_OFN175_n_322));
   ON221X0 p13935A (.Q(n_1997), 
	.E(n_251), 
	.D(n_192), 
	.C(n_41), 
	.B(n_193), 
	.A(FE_OFN135_n_255));
   AO21X0 p13176A (.Q(n_2027), 
	.C(n_2003), 
	.B(n_191), 
	.A(FE_OFN180_n_396));
   AN321X0 p12809A (.Q(n_521), 
	.F(n_188), 
	.E(n_189), 
	.D(n_414), 
	.C(FE_OFN129_n_2135), 
	.B(FE_OFN146_n_134), 
	.A(n_190));
   AND3X0 p17408A (.Q(n_2107), 
	.C(n_289), 
	.B(FE_OFN180_n_396), 
	.A(n_337));
   AN221X0 p12241A (.Q(n_775), 
	.E(n_185), 
	.D(FE_OFN37_n_692), 
	.C(n_186), 
	.B(n_187), 
	.A(FE_OFN197_n_224));
   AN222X0 p13018A (.Q(n_381), 
	.F(n_183), 
	.E(n_871), 
	.D(FE_OFN165_n_2181), 
	.C(n_184), 
	.B(n_245), 
	.A(n_161));
   AO33X0 p10808A (.Q(n_649), 
	.F(n_256), 
	.E(n_685), 
	.D(FE_OFN185_n_2018), 
	.C(n_182), 
	.B(n_903), 
	.A(n_20));
   ON21X1 p1154D (.Q(n_672), 
	.C(n_181), 
	.B(FE_OFN152_n_284), 
	.A(n_219));
   AO33X0 p11797A (.Q(n_360), 
	.F(n_871), 
	.E(n_453), 
	.D(n_550), 
	.C(n_2174), 
	.B(FE_OFN174_n_551), 
	.A(n_385));
   AO221X0 p12287A (.Q(n_513), 
	.E(FE_OFN29_n_1973), 
	.D(n_180), 
	.C(FE_OFN26_n_19), 
	.B(n_2052), 
	.A(FE_OFN182_n_585));
   AN22X1 p1119A (.Q(n_358), 
	.D(n_385), 
	.C(n_178), 
	.B(FE_OFN197_n_224), 
	.A(n_179));
   ON211X0 p11061A (.Q(n_785), 
	.D(n_2122), 
	.C(FE_OFN26_n_19), 
	.B(n_377), 
	.A(n_597));
   AO22X0 p13625A (.Q(n_1194), 
	.D(FE_OFN148_n_153), 
	.C(FE_OFN185_n_2018), 
	.B(FE_OFN141_n_2118), 
	.A(n_177));
   AO321X0 p12049A (.Q(n_304), 
	.F(n_2005), 
	.E(n_186), 
	.D(n_175), 
	.C(n_492), 
	.B(n_176), 
	.A(n_22));
   AN32X0 p12662A (.Q(n_541), 
	.E(FE_OFN182_n_585), 
	.D(FE_OFN153_n_174), 
	.C(FE_OFN115_n_2221), 
	.B(FE_OFN156_n_2115), 
	.A(FE_OFN39_n_23));
   AO222X0 p11228A64397 (.Q(n_870), 
	.F(n_2117), 
	.E(FE_OFN146_n_134), 
	.D(n_172), 
	.C(FE_OFN136_n_270), 
	.B(FE_OFN179_n_396), 
	.A(FE_OFN161_n_173));
   AN32X1 p1169A (.Q(n_737), 
	.E(n_170), 
	.D(n_385), 
	.C(n_171), 
	.B(n_652), 
	.A(n_22));
   ON22X0 p11426A (.Q(n_426), 
	.D(n_195), 
	.C(n_2139), 
	.B(n_767), 
	.A(n_169));
   INX6 Fp0790D64403 (.Q(n_883), 
	.A(FE_OFN208_n_231));
   NO2X4 p0795D64404 (.Q(n_231), 
	.B(n_1222), 
	.A(FE_OFN202_n_1221));
   NO2X0 p0742D (.Q(n_210), 
	.B(FE_OFN130_n_114), 
	.A(n_168));
   NO2I1X1 p0731D (.Q(n_364), 
	.B(n_167), 
	.AN(n_2134));
   NA2I1X0 p5221A (.Q(n_942), 
	.B(n_166), 
	.AN(n_165));
   NO2X0 p5207A (.Q(n_233), 
	.B(n_165), 
	.A(n_234));
   NO2X0 p1270A (.Q(n_347), 
	.B(n_1070), 
	.A(n_35));
   NA2I1X0 p5309A (.Q(n_733), 
	.B(n_166), 
	.AN(n_234));
   OR2X0 p4723A (.Q(n_449), 
	.B(n_941), 
	.A(n_732));
   NO2X1 p10479D (.Q(n_588), 
	.B(n_767), 
	.A(n_871));
   NO2X0 p12059A (.Q(n_580), 
	.B(n_2043), 
	.A(n_436));
   OR2X1 p11871A (.Q(n_479), 
	.B(n_1045), 
	.A(FE_OFN182_n_585));
   NO2X1 p1499A (.Q(n_495), 
	.B(FE_OFN164_n_425), 
	.A(n_1134));
   NO2X1 p1325A (.Q(n_599), 
	.B(FE_OFN136_n_270), 
	.A(n_1134));
   INX0 Fp10973A64405 (.Q(n_556), 
	.A(n_1059));
   NA2X1 p10912A (.Q(n_1059), 
	.B(n_120), 
	.A(n_653));
   INX0 Fp1025A (.Q(n_277), 
	.A(FE_OFN194_n_528));
   NO2X1 p1003A (.Q(n_528), 
	.B(n_1035), 
	.A(n_540));
   NO2I1X1 p1280A (.Q(n_362), 
	.B(n_1974), 
	.AN(n_239));
   AND2X0 p12335A (.Q(n_1270), 
	.B(n_314), 
	.A(n_298));
   INX2 Fp0737A64430 (.Q(n_702), 
	.A(FE_OFN203_n_17));
   NO2X2 p0647A (.Q(n_17), 
	.B(n_1070), 
	.A(n_1974));
   INX0 Fp1215A (.Q(n_956), 
	.A(n_313));
   NO2X1 p1198A64432 (.Q(n_313), 
	.B(n_1070), 
	.A(n_164));
   AND2X2 p0659A (.Q(n_907), 
	.B(FE_OFN135_n_255), 
	.A(n_2033));
   INX2 Fp1034A64438 (.Q(n_226), 
	.A(n_1011));
   NA2X4 p1030A (.Q(n_1011), 
	.B(n_120), 
	.A(n_163));
   AND2X0 p10157A (.Q(n_328), 
	.B(FE_OFN136_n_270), 
	.A(n_2033));
   INX6 Fp0642A64440 (.Q(n_466), 
	.A(n_866));
   NA2X4 p0604A (.Q(n_866), 
	.B(n_163), 
	.A(n_1974));
   NO2I1X1 p11879A (.Q(n_432), 
	.B(n_782), 
	.AN(n_2033));
   INX2 Fp0731A64447 (.Q(n_248), 
	.A(n_423));
   NA2X4 p0708A (.Q(n_423), 
	.B(FE_OFN32_n_78), 
	.A(n_2033));
   INX4 Fp1521A64456 (.Q(n_340), 
	.A(n_1056));
   NA2X2 p1491A (.Q(n_1056), 
	.B(n_162), 
	.A(n_871));
   NO2I1X0 p18842A (.Q(n_2008), 
	.B(n_949), 
	.AN(n_2010));
   AND2X0 p13133A (.Q(n_2045), 
	.B(FE_OFN135_n_255), 
	.A(n_339));
   OR2X4 p0894D (.Q(n_677), 
	.B(FE_OFN170_n_473), 
	.A(FE_OFN182_n_585));
   NA2X2 p0902D (.Q(n_911), 
	.B(FE_OFN117_n_24), 
	.A(n_720));
   INX8 Fp0693A64464 (.Q(n_417), 
	.A(n_1038));
   NA2X4 p0554A (.Q(n_1038), 
	.B(n_120), 
	.A(n_162));
   INX6 Fp0519A (.Q(n_337), 
	.A(n_670));
   OR2X4 p0529A (.Q(n_670), 
	.B(n_1082), 
	.A(n_871));
   NO2X0 p11534A (.Q(n_435), 
	.B(n_1082), 
	.A(n_424));
   OR2X0 p11965A64479 (.Q(n_515), 
	.B(n_161), 
	.A(FE_OFN182_n_585));
   NA2X0 p12457A (.Q(n_798), 
	.B(FE_OFN185_n_2018), 
	.A(n_967));
   NA2X0 p5666A (.Q(n_780), 
	.B(n_967), 
	.A(FE_OFN189_n_543));
   AND2X0 p40672A (.Q(n_2051), 
	.B(FE_OFN135_n_255), 
	.A(FE_OFN205_n_966));
   AND2X0 p16528A (.Q(n_2047), 
	.B(FE_OFN135_n_255), 
	.A(n_298));
   AND2X0 p13846A (.Q(n_2007), 
	.B(FE_OFN154_n_174), 
	.A(FE_OFN204_n_1154));
   NO2I1X0 p13067A (.Q(n_2003), 
	.B(FE_OFN155_n_2115), 
	.AN(FE_OFN204_n_1154));
   AO211X0 p13151A (.Q(n_1996), 
	.D(n_160), 
	.C(n_309), 
	.B(FE_OFN32_n_78), 
	.A(n_370));
   NA2X1 p0798D (.Q(n_1214), 
	.B(n_158), 
	.A(n_159));
   AO21X0 p14956A64480 (.Q(n_910), 
	.C(n_1114), 
	.B(n_898), 
	.A(DFT_sdo));
   AN321X0 p12123A (.Q(n_539), 
	.F(n_157), 
	.E(n_2010), 
	.D(n_560), 
	.C(n_297), 
	.B(FE_OFN170_n_473), 
	.A(FE_OFN142_n_117));
   NO2X1 p1056A (.Q(n_247), 
	.B(n_156), 
	.A(n_330));
   AO21X2 p1243A64481 (.Q(n_506), 
	.C(FE_OFN191_n_1116), 
	.B(n_385), 
	.A(n_155));
   AN21X0 p0967A (.Q(n_263), 
	.C(n_2043), 
	.B(n_2134), 
	.A(n_154));
   NO3I1X0 p11178A (.Q(n_244), 
	.C(n_376), 
	.B(n_261), 
	.AN(FE_OFN148_n_153));
   AO21X0 p14356A (.Q(n_390), 
	.C(n_488), 
	.B(FE_OFN184_n_443), 
	.A(n_467));
   ON311X0 p11244A (.Q(n_211), 
	.E(n_192), 
	.D(n_407), 
	.C(FE_OFN129_n_2135), 
	.B(n_100), 
	.A(n_152));
   AO21X0 p14374A (.Q(n_391), 
	.C(n_569), 
	.B(FE_OFN139_n_270), 
	.A(n_406));
   AN21X0 p12022A (.Q(n_341), 
	.C(n_151), 
	.B(n_560), 
	.A(FE_OFN142_n_117));
   OA21X0 p11755A (.Q(n_799), 
	.C(n_254), 
	.B(FE_OFN156_n_2115), 
	.A(n_150));
   AN21X0 p11160A (.Q(n_581), 
	.C(n_209), 
	.B(FE_OFN191_n_1116), 
	.A(n_149));
   AO21X0 p11582A (.Q(n_279), 
	.C(n_177), 
	.B(FE_OFN26_n_19), 
	.A(n_309));
   ON311X0 p12856A (.Q(n_343), 
	.E(n_147), 
	.D(n_142), 
	.C(DFT_sdo), 
	.B(n_148), 
	.A(n_318));
   AN31X1 p9275A (.Q(n_207), 
	.D(n_227), 
	.C(n_218), 
	.B(FE_OFN169_n_516), 
	.A(FE_OFN161_n_173));
   AN311X0 p9835D (.Q(n_215), 
	.E(n_185), 
	.D(n_146), 
	.C(n_2101), 
	.B(FE_OFN142_n_117), 
	.A(FE_OFN146_n_134));
   AO211X0 p12371A (.Q(n_356), 
	.D(FE_OFN183_n_585), 
	.C(FE_OFN166_n_2154), 
	.B(n_94), 
	.A(n_1974));
   AN31X0 p13220A (.Q(n_509), 
	.D(n_145), 
	.C(n_186), 
	.B(n_602), 
	.A(n_376));
   AO21X0 p5871A (.Q(n_291), 
	.C(n_399), 
	.B(n_447), 
	.A(FE_OFN115_n_2221));
   NO3X0 p8844A (.Q(n_701), 
	.C(n_569), 
	.B(n_568), 
	.A(n_144));
   OA21X0 p11626A (.Q(n_389), 
	.C(n_436), 
	.B(FE_OFN135_n_255), 
	.A(n_424));
   OR3X0 p12915A (.Q(n_2155), 
	.C(n_2052), 
	.B(n_267), 
	.A(n_143));
   AO21X0 p8993A (.Q(n_839), 
	.C(n_151), 
	.B(n_289), 
	.A(n_794));
   AND3X4 p1059D (.Q(n_262), 
	.C(n_142), 
	.B(FE_OFN142_n_117), 
	.A(FE_OFN204_n_1154));
   AN311X0 p10418A64482 (.Q(n_252), 
	.E(n_145), 
	.D(n_140), 
	.C(FE_OFN73_fsm_op_aux_1_7_), 
	.B(n_141), 
	.A(FE_OFN37_n_692));
   AO222X0 p9854A (.Q(n_204), 
	.F(n_138), 
	.E(n_139), 
	.D(n_571), 
	.C(n_2119), 
	.B(n_2010), 
	.A(FE_OFN37_n_692));
   AO211X0 p12146A (.Q(n_188), 
	.D(n_137), 
	.C(n_385), 
	.B(n_471), 
	.A(n_871));
   AN321X0 p13267A (.Q(n_659), 
	.F(n_136), 
	.E(n_2010), 
	.D(FE_OFN40_n_198), 
	.C(FE_OFN189_n_543), 
	.B(n_202), 
	.A(FE_OFN158_n_577));
   AN321X0 p10466A (.Q(n_612), 
	.F(n_135), 
	.E(n_176), 
	.D(FE_OFN174_n_551), 
	.C(FE_OFN113_n_325), 
	.B(n_255), 
	.A(FE_OFN168_n_2183));
   AN321X0 p10571A (.Q(n_613), 
	.F(n_601), 
	.E(n_133), 
	.D(n_176), 
	.C(FE_OFN113_n_325), 
	.B(FE_OFN146_n_134), 
	.A(n_2174));
   AN21X1 p0830D (.Q(n_221), 
	.C(n_132), 
	.B(FE_OFN56_fsm_op_aux_2_2_), 
	.A(n_480));
   ON321X0 p11017A (.Q(n_236), 
	.F(n_131), 
	.E(n_1974), 
	.D(FE_OFN146_n_134), 
	.C(n_261), 
	.B(n_270), 
	.A(FE_OFN32_n_78));
   AO22X0 p13325A (.Q(n_2133), 
	.D(n_2122), 
	.C(n_268), 
	.B(n_2177), 
	.A(n_334));
   AN32X0 p11141A64483 (.Q(n_696), 
	.E(n_130), 
	.D(FE_OFN169_n_516), 
	.C(n_494), 
	.B(n_1974), 
	.A(n_453));
   AO222X0 p12248A (.Q(n_354), 
	.F(n_305), 
	.E(FE_OFN184_n_443), 
	.D(n_140), 
	.C(FE_OFN121_n_2044), 
	.B(n_129), 
	.A(n_981));
   AO32X0 p12208A (.Q(n_243), 
	.E(n_128), 
	.D(FE_OFN169_n_516), 
	.C(FE_OFN184_n_443), 
	.B(n_120), 
	.A(FE_OFN37_n_692));
   AO22X0 p11497A (.Q(n_278), 
	.D(FE_OFN161_n_173), 
	.C(n_2174), 
	.B(FE_OFN166_n_2154), 
	.A(n_2177));
   AO32X1 p0806D (.Q(n_259), 
	.E(n_898), 
	.D(n_126), 
	.C(FE_OFN144_n_2110), 
	.B(n_2020), 
	.A(n_41));
   NA2X1 p0968D (.Q(n_1225), 
	.B(n_124), 
	.A(n_125));
   INX1 Fp1239A64484 (.Q(n_653), 
	.A(n_767));
   NA2X1 p1236A (.Q(n_767), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN148_n_153));
   AND2X4 p0415A (.Q(n_2033), 
	.B(FE_OFN148_n_153), 
	.A(n_871));
   NA2X2 p0785D (.Q(n_1222), 
	.B(n_122), 
	.A(n_125));
   INX1 Fp10714A64488 (.Q(n_216), 
	.A(n_1002));
   NA2X1 p10392A (.Q(n_1002), 
	.B(FE_OFN148_n_153), 
	.A(n_176));
   NA2X2 p0807D64489 (.Q(n_1221), 
	.B(n_124), 
	.A(n_121));
   NA2X0 p11123A (.Q(n_308), 
	.B(n_700), 
	.A(n_150));
   INX2 Fp9984A (.Q(n_274), 
	.A(n_2042));
   NA2X4 p9954A (.Q(n_2042), 
	.B(FE_OFN148_n_153), 
	.A(n_1974));
   INX0 Fp11025A (.Q(n_605), 
	.A(n_256));
   AND2X0 p10618A (.Q(n_256), 
	.B(FE_OFN148_n_153), 
	.A(n_297));
   NA2X4 p1154A (.Q(n_156), 
	.B(FE_OFN148_n_153), 
	.A(n_2122));
   NA2X2 p1209A (.Q(n_2100), 
	.B(n_385), 
	.A(FE_OFN29_n_1973));
   INX1 Fp10961A (.Q(n_307), 
	.A(n_315));
   NA2X0 p10730A (.Q(n_315), 
	.B(n_120), 
	.A(FE_OFN148_n_153));
   NA2X0 p1164D (.Q(n_1227), 
	.B(n_122), 
	.A(n_121));
   INX0 Fp1225A (.Q(n_387), 
	.A(n_1134));
   NA2X1 p1192A (.Q(n_1134), 
	.B(FE_OFN135_n_255), 
	.A(FE_OFN148_n_153));
   OR2X0 p4796A (.Q(n_165), 
	.B(n_1077), 
	.A(n_872));
   OR2X0 p4335A (.Q(n_941), 
	.B(n_1066), 
	.A(n_939));
   INX1 Fp1210A64496 (.Q(n_177), 
	.A(n_1035));
   NA2X1 p1176A (.Q(n_1035), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(FE_OFN148_n_153));
   NA2I1X0 p5585A64498 (.Q(n_769), 
	.B(n_119), 
	.AN(n_877));
   NO2X1 p9750A (.Q(n_2108), 
	.B(n_385), 
	.A(n_142));
   NO2X1 p0946D (.Q(n_219), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN171_n_2175));
   AND2X0 p9647A (.Q(n_209), 
	.B(n_731), 
	.A(n_290));
   NA2X1 p1426D (.Q(n_1204), 
	.B(n_314), 
	.A(n_908));
   NO2X1 p1128D (.Q(n_486), 
	.B(n_483), 
	.A(n_743));
   INX8 Fp0816A64499 (.Q(n_673), 
	.A(n_2043));
   NA2X4 p0688A (.Q(n_2043), 
	.B(n_131), 
	.A(n_1974));
   AND2X1 p14626A (.Q(n_2030), 
	.B(n_118), 
	.A(n_826));
   AND2X0 p14263A (.Q(n_2006), 
	.B(n_898), 
	.A(FE_OFN199_n_275));
   AND2X0 p1258A (.Q(n_239), 
	.B(FE_OFN123_n_295), 
	.A(n_131));
   NO2X0 p15896A (.Q(n_2132), 
	.B(n_192), 
	.A(n_1133));
   AND2X0 p13889A (.Q(n_2009), 
	.B(n_112), 
	.A(n_826));
   NA2X4 p0924D (.Q(n_330), 
	.B(FE_OFN142_n_117), 
	.A(n_898));
   INX4 Fp0454A64506 (.Q(n_163), 
	.A(n_1070));
   NA2X4 p0410A (.Q(n_1070), 
	.B(FE_OFN135_n_255), 
	.A(n_131));
   NA2X0 p1179D (.Q(n_531), 
	.B(n_116), 
	.A(FE_OFN190_n_628));
   NO2X0 p10874A (.Q(n_1114), 
	.B(FE_OFN123_n_295), 
	.A(n_743));
   NA2X0 p11995A (.Q(n_791), 
	.B(FE_OFN191_n_1116), 
	.A(n_568));
   NA2X0 p11459A (.Q(n_949), 
	.B(n_550), 
	.A(n_113));
   NO2I1X1 p13904D (.Q(n_2031), 
	.B(n_522), 
	.AN(n_876));
   AND2X0 p12647A (.Q(n_2001), 
	.B(n_2122), 
	.A(n_646));
   AND2X0 p12600A (.Q(n_2028), 
	.B(n_113), 
	.A(n_2012));
   NA2X1 p0729D (.Q(n_585), 
	.B(n_41), 
	.A(n_115));
   INX4 Fp0458A64510 (.Q(n_162), 
	.A(n_1082));
   NA2X4 p0422A (.Q(n_1082), 
	.B(FE_OFN32_n_78), 
	.A(n_131));
   INX0 Fp1181A (.Q(n_441), 
	.A(n_171));
   AND2X1 p1136A64512 (.Q(n_171), 
	.B(n_131), 
	.A(n_120));
   INX1 Fp4228A64513 (.Q(n_967), 
	.A(n_2136));
   NA2X1 p3927A (.Q(n_2136), 
	.B(n_131), 
	.A(n_871));
   NA2X0 p1342D (.Q(n_459), 
	.B(n_490), 
	.A(n_743));
   NO2X2 p0707DT (.Q(n_720), 
	.B(FE_OFN141_n_2118), 
	.A(n_743));
   NA2X0 p11523A (.Q(n_1034), 
	.B(FE_OFN161_n_173), 
	.A(n_430));
   AND2X0 p10948A (.Q(n_597), 
	.B(n_114), 
	.A(n_406));
   AND2X1 p11334A64520 (.Q(n_584), 
	.B(FE_OFN136_n_270), 
	.A(FE_OFN190_n_628));
   OR2X0 p13262A (.Q(n_546), 
	.B(n_1220), 
	.A(n_333));
   AND2X2 p9782A (.Q(n_1122), 
	.B(n_309), 
	.A(n_113));
   NA2X2 p1372D (.Q(n_1012), 
	.B(FE_OFN159_n_577), 
	.A(n_113));
   NO2X1 p5753A (.Q(n_339), 
	.B(n_483), 
	.A(n_1025));
   INX0 Fp6482A (.Q(n_151), 
	.A(n_225));
   NA2X0 p6295A64521 (.Q(n_225), 
	.B(FE_OFN142_n_117), 
	.A(n_406));
   INX0 Fp10245A (.Q(n_583), 
	.A(n_264));
   NA2I1X0 p10009A (.Q(n_264), 
	.B(n_566), 
	.AN(n_237));
   NO2X0 p13797A64522 (.Q(n_193), 
	.B(n_112), 
	.A(n_395));
   OR2X0 p9824A65471 (.Q(n_300), 
	.B(n_149), 
	.A(n_1115));
   NO2X0 p6878A (.Q(n_966), 
	.B(FE_OFN141_n_2118), 
	.A(n_164));
   NO2X2 p1003D (.Q(n_1154), 
	.B(FE_OFN32_n_78), 
	.A(n_164));
   INX0 Fp6421A (.Q(n_200), 
	.A(n_982));
   NA2X1 p6026A64524 (.Q(n_982), 
	.B(n_284), 
	.A(n_794));
   NO2X4 p5224A64525 (.Q(n_298), 
	.B(n_1025), 
	.A(n_535));
   OA21X1 p10145A (.Q(n_145), 
	.C(n_903), 
	.B(n_111), 
	.A(FE_OFN115_n_2221));
   AO21X0 p4799A (.Q(n_234), 
	.C(n_534), 
	.B(n_1144), 
	.A(n_110));
   NA3X0 p1253A (.Q(n_260), 
	.C(n_385), 
	.B(n_687), 
	.A(n_189));
   NA3X1 p0814D (.Q(n_398), 
	.C(n_2135), 
	.B(n_108), 
	.A(n_109));
   NA2X1 p0582DT (.Q(n_167), 
	.B(n_107), 
	.A(n_154));
   NO2I1X1 p0785D64526 (.Q(n_168), 
	.B(n_106), 
	.AN(n_107));
   NO3X0 p12436A (.Q(n_1153), 
	.C(n_20), 
	.B(FE_OFN142_n_117), 
	.A(FE_OFN121_n_2044));
   AO21X0 p10868A (.Q(n_488), 
	.C(n_144), 
	.B(FE_OFN153_n_174), 
	.A(n_560));
   AN21X1 p10823A (.Q(n_254), 
	.C(n_472), 
	.B(n_399), 
	.A(FE_OFN158_n_577));
   AO21X0 p12046A64527 (.Q(n_280), 
	.C(FE_OFN26_n_19), 
	.B(FE_OFN117_n_24), 
	.A(FE_OFN188_n_555));
   OA21X0 p39944A (.Q(n_2029), 
	.C(n_898), 
	.B(n_266), 
	.A(FE_OFN199_n_275));
   INX1 Fp0932A (.Q(n_380), 
	.A(n_736));
   NA3X4 p1060A (.Q(n_736), 
	.C(n_105), 
	.B(FE_OFN142_n_117), 
	.A(FE_OFN192_n_832));
   OA211X0 p11875A (.Q(n_157), 
	.D(FE_OFN129_n_2135), 
	.C(FE_OFN169_n_516), 
	.B(n_270), 
	.A(n_2020));
   NA3X0 p12711A (.Q(n_919), 
	.C(n_202), 
	.B(n_529), 
	.A(FE_OFN191_n_1116));
   NO3X0 p1092A64528 (.Q(n_179), 
	.C(FE_OFN26_n_19), 
	.B(n_41), 
	.A(n_442));
   AO21X0 p10501A (.Q(n_194), 
	.C(n_378), 
	.B(n_104), 
	.A(FE_OFN113_n_325));
   ON21X0 p4657A (.Q(n_732), 
	.C(n_119), 
	.B(n_103), 
	.A(n_110));
   ON21X0 p10552A (.Q(n_282), 
	.C(n_102), 
	.B(FE_OFN152_n_284), 
	.A(n_482));
   ON21X0 p10878A (.Q(n_283), 
	.C(n_115), 
	.B(n_202), 
	.A(n_101));
   ON222X0 p9663A (.Q(n_296), 
	.F(n_98), 
	.E(FE_OFN121_n_2044), 
	.D(n_99), 
	.C(n_41), 
	.B(FE_OFN115_n_2221), 
	.A(n_100));
   AN21X0 p7891A (.Q(n_710), 
	.C(FE_OFN177_n_396), 
	.B(FE_OFN146_n_134), 
	.A(n_1148));
   AN21X0 p12507A (.Q(n_404), 
	.C(n_149), 
	.B(n_97), 
	.A(n_529));
   NA2X1 p0832DT (.Q(n_238), 
	.B(n_743), 
	.A(n_96));
   NO2I1X0 p5880A (.Q(n_293), 
	.B(n_430), 
	.AN(n_96));
   ON21X1 p1122D (.Q(n_276), 
	.C(n_148), 
	.B(n_2117), 
	.A(FE_OFN175_n_322));
   AND3X0 p13101A (.Q(n_2026), 
	.C(FE_OFN32_n_78), 
	.B(n_289), 
	.A(FE_OFN180_n_396));
   AO21X0 p11548A (.Q(n_241), 
	.C(FE_OFN184_n_443), 
	.B(n_214), 
	.A(n_529));
   AN21X0 p12100A (.Q(n_223), 
	.C(n_95), 
	.B(n_199), 
	.A(n_469));
   AO21X0 p12438A (.Q(n_904), 
	.C(n_476), 
	.B(n_94), 
	.A(n_228));
   AN32X0 p11485A (.Q(n_319), 
	.E(n_100), 
	.D(FE_OFN152_n_284), 
	.C(DFT_sdo), 
	.B(FE_OFN168_n_2183), 
	.A(n_114));
   AN22X1 p0806D64529 (.Q(n_159), 
	.D(FE_OFN45_fsm_op_aux_2_7_), 
	.C(n_1148), 
	.B(FE_OFN58_fsm_op_aux_2_1_), 
	.A(n_93));
   AN22X1 p0797D (.Q(n_158), 
	.D(FE_OFN53_fsm_op_aux_2_3_), 
	.C(n_91), 
	.B(FE_OFN49_fsm_op_aux_2_5_), 
	.A(n_92));
   NA2X1 p0830D64530 (.Q(n_132), 
	.B(n_89), 
	.A(n_90));
   AN211X0 p11525A (.Q(n_386), 
	.D(n_1974), 
	.C(n_20), 
	.B(n_94), 
	.A(FE_OFN165_n_2181));
   AO32X0 p12201A (.Q(n_187), 
	.E(n_88), 
	.D(FE_OFN158_n_577), 
	.C(FE_OFN160_n_418), 
	.B(FE_OFN146_n_134), 
	.A(n_174));
   ON22X0 p10268A (.Q(n_446), 
	.D(n_87), 
	.C(n_871), 
	.B(n_594), 
	.A(n_186));
   AO22X0 p1202D (.Q(n_507), 
	.D(FE_OFN37_n_692), 
	.C(n_750), 
	.B(FE_OFN39_n_23), 
	.A(n_453));
   AO32X0 p10222A (.Q(n_205), 
	.E(n_414), 
	.D(n_270), 
	.C(n_1974), 
	.B(n_2174), 
	.A(n_376));
   ON211X0 p11709A (.Q(n_617), 
	.D(FE_OFN113_n_325), 
	.C(FE_OFN152_n_284), 
	.B(n_86), 
	.A(n_213));
   ON22X0 p11614A (.Q(n_240), 
	.D(FE_OFN135_n_255), 
	.C(n_68), 
	.B(FE_OFN37_n_692), 
	.A(n_640));
   ON22X0 p11126D (.Q(n_413), 
	.D(n_550), 
	.C(n_1003), 
	.B(n_442), 
	.A(FE_OFN129_n_2135));
   AN21X0 p11478A64531 (.Q(n_620), 
	.C(n_85), 
	.B(FE_OFN176_n_396), 
	.A(n_104));
   AO22X0 p10141A64532 (.Q(n_374), 
	.D(FE_OFN168_n_2183), 
	.C(n_1974), 
	.B(FE_OFN134_n_255), 
	.A(n_571));
   AO22X0 p10032A (.Q(n_375), 
	.D(n_2117), 
	.C(n_903), 
	.B(n_348), 
	.A(n_871));
   ON221X0 p0691D (.Q(n_338), 
	.E(n_83), 
	.D(n_84), 
	.C(FE_OFN37_n_692), 
	.B(FE_OFN146_n_134), 
	.A(n_229));
   ON22X0 p11707A (.Q(n_271), 
	.D(n_41), 
	.C(FE_OFN139_n_270), 
	.B(FE_OFN141_n_2118), 
	.A(n_82));
   AN22X0 p11885A (.Q(n_388), 
	.D(n_871), 
	.C(n_2012), 
	.B(FE_OFN169_n_516), 
	.A(FE_OFN189_n_543));
   AN32X0 p12249A (.Q(n_644), 
	.E(n_981), 
	.D(FE_OFN170_n_473), 
	.C(FE_OFN115_n_2221), 
	.B(n_297), 
	.A(FE_OFN189_n_543));
   ON21X0 p11546A (.Q(n_587), 
	.C(n_81), 
	.B(FE_OFN40_n_198), 
	.A(n_469));
   AN33X0 p11072A (.Q(n_316), 
	.F(FE_OFN73_fsm_op_aux_1_7_), 
	.E(n_80), 
	.D(FE_OFN166_n_2154), 
	.C(n_577), 
	.B(n_2105), 
	.A(FE_OFN160_n_418));
   AN22X0 p12079A (.Q(n_768), 
	.D(FE_OFN37_n_692), 
	.C(n_114), 
	.B(n_550), 
	.A(n_269));
   AN22X0 p12104A (.Q(n_645), 
	.D(n_453), 
	.C(FE_OFN169_n_516), 
	.B(n_228), 
	.A(n_331));
   AO221X0 p11241A (.Q(n_762), 
	.E(n_245), 
	.D(n_871), 
	.C(n_105), 
	.B(n_2101), 
	.A(FE_OFN184_n_443));
   AN21X1 p11360A (.Q(n_484), 
	.C(n_79), 
	.B(n_133), 
	.A(n_529));
   AO221X0 p12502A (.Q(n_143), 
	.E(n_114), 
	.D(n_55), 
	.C(FE_OFN32_n_78), 
	.B(n_2174), 
	.A(FE_OFN154_n_174));
   NA2X0 p6810A (.Q(n_781), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_108));
   NO2X0 p5740A (.Q(n_439), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(n_965));
   INX0 Fp0399A64535 (.Q(n_146), 
	.A(FE_OFN148_n_153));
   NO2X2 p0350A (.Q(n_153), 
	.B(FE_OFN26_n_19), 
	.A(FE_OFN28_n_1973));
   NA2X1 p0820D (.Q(n_122), 
	.B(n_77), 
	.A(n_735));
   NA2X0 p0852D64539 (.Q(n_90), 
	.B(FE_OFN51_fsm_op_aux_2_4_), 
	.A(n_1323));
   NO2I1X0 p6860A (.Q(n_945), 
	.B(FE_OFN70_fsm_op2_6_), 
	.AN(n_1344));
   NO2X0 p4380A (.Q(n_939), 
	.B(FE_OFN72_fsm_op2_2_), 
	.A(n_940));
   NO2X0 p4849A (.Q(n_534), 
	.B(n_75), 
	.A(n_76));
   NA2I1X0 p5365A (.Q(n_166), 
	.B(n_735), 
	.AN(n_734));
   NO2X0 p4740A64540 (.Q(n_1077), 
	.B(n_1254), 
	.A(n_73));
   NO2X0 p4836A (.Q(n_872), 
	.B(n_1168), 
	.A(n_940));
   NO2I1X0 p5418A (.Q(n_877), 
	.B(DFT_sdo), 
	.AN(n_1148));
   NO2I1X0 p5681A (.Q(n_589), 
	.B(n_1171), 
	.AN(n_1148));
   NA2X0 p1058D (.Q(n_272), 
	.B(n_74), 
	.A(FE_OFN87_fsm_op_aux_1_1_));
   NO2I1X0 p6565A (.Q(n_944), 
	.B(FE_OFN92_fsm_op2_4_), 
	.AN(n_1323));
   NO2X0 p4244A64541 (.Q(n_1066), 
	.B(FE_OFN91_fsm_op2_5_), 
	.A(n_73));
   NA2X1 p0822D (.Q(n_89), 
	.B(FE_OFN47_fsm_op_aux_2_6_), 
	.A(n_1344));
   NO2X0 p6256A (.Q(n_1174), 
	.B(FE_OFN63_fsm_op2_1_), 
	.A(n_726));
   NA2I1X0 p4509A (.Q(n_119), 
	.B(n_76), 
	.AN(n_75));
   NO2X2 p0913A (.Q(n_385), 
	.B(FE_OFN26_n_19), 
	.A(n_871));
   NO2X4 p0314D (.Q(n_131), 
	.B(n_20), 
	.A(FE_OFN29_n_1973));
   NO2X2 p0946A (.Q(n_832), 
	.B(FE_OFN26_n_19), 
	.A(n_540));
   NA2I1X0 p11167A (.Q(n_212), 
	.B(n_744), 
	.AN(n_422));
   NA2X0 p11082A (.Q(n_150), 
	.B(n_88), 
	.A(FE_OFN115_n_2221));
   AND2X1 p39893A (.Q(n_2032), 
	.B(n_71), 
	.A(n_334));
   NO2X0 p13158A (.Q(n_203), 
	.B(FE_OFN154_n_174), 
	.A(n_594));
   NO2X1 p9695A (.Q(n_731), 
	.B(FE_OFN29_n_1973), 
	.A(n_403));
   NA2X0 p10696A (.Q(n_317), 
	.B(FE_OFN146_n_134), 
	.A(n_289));
   NO2X0 p6838A (.Q(n_761), 
	.B(n_35), 
	.A(n_407));
   NO2X1 p5045A (.Q(n_472), 
	.B(FE_OFN154_n_174), 
	.A(n_102));
   NA2X0 p1082D (.Q(n_181), 
	.B(FE_OFN168_n_2183), 
	.A(n_529));
   NO2I1X1 p9678A (.Q(n_185), 
	.B(n_594), 
	.AN(n_428));
   NO2I1X0 p10449A (.Q(n_601), 
	.B(n_746), 
	.AN(FE_OFN169_n_516));
   AND2X1 p4518A (.Q(n_569), 
	.B(n_269), 
	.A(FE_OFN145_n_2110));
   NO2I1X1 p0833D64542 (.Q(n_170), 
	.B(n_594), 
	.AN(n_451));
   AND2X0 p11959A (.Q(n_2005), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN199_n_275));
   AND2X0 p10538A (.Q(n_501), 
	.B(n_353), 
	.A(FE_OFN177_n_396));
   INX0 Fp11196A (.Q(n_606), 
	.A(n_467));
   NO2X0 p11078A64543 (.Q(n_467), 
	.B(n_407), 
	.A(FE_OFN115_n_2221));
   NO2I1X1 p5140A64544 (.Q(n_876), 
	.B(n_383), 
	.AN(FE_OFN177_n_396));
   NO2X2 p0967DT (.Q(n_377), 
	.B(FE_OFN146_n_134), 
	.A(n_70));
   NA2X1 p1184D (.Q(n_363), 
	.B(n_100), 
	.A(FE_OFN174_n_551));
   NA2I1X0 p11638A (.Q(n_427), 
	.B(n_407), 
	.AN(n_350));
   NA2X0 p13177A (.Q(n_160), 
	.B(n_2165), 
	.A(n_510));
   NA2I1X0 p10234A (.Q(n_378), 
	.B(n_591), 
	.AN(n_138));
   NO2X0 p13059A (.Q(n_197), 
	.B(n_69), 
	.A(n_658));
   NO2X0 p10976A (.Q(n_646), 
	.B(n_284), 
	.A(n_407));
   AND2X4 p0868D (.Q(n_884), 
	.B(FE_OFN146_n_134), 
	.A(n_497));
   NO2I1X0 p9846A64545 (.Q(n_237), 
	.B(n_100), 
	.AN(n_1220));
   AND2X0 p41612A (.Q(n_2000), 
	.B(n_100), 
	.A(n_266));
   NO2X1 p1151D (.Q(n_1116), 
	.B(FE_OFN29_n_1973), 
	.A(n_540));
   AND2X0 p13182A (.Q(n_2004), 
	.B(n_86), 
	.A(n_266));
   NA2I1X0 p13626A (.Q(n_1976), 
	.B(n_490), 
	.AN(n_1089));
   AND2X0 p15190A (.Q(n_2002), 
	.B(FE_OFN37_n_692), 
	.A(n_266));
   INX8 Fp0717D64547 (.Q(n_430), 
	.A(n_743));
   NA2X4 p0751D (.Q(n_743), 
	.B(FE_OFN180_n_396), 
	.A(FE_OFN120_n_2044));
   NA2X0 p11482A (.Q(n_79), 
	.B(n_148), 
	.A(n_469));
   NO2X0 p14140A (.Q(n_813), 
	.B(n_409), 
	.A(n_871));
   NO2X1 p0996DT (.Q(n_178), 
	.B(n_409), 
	.A(n_68));
   NA2X0 p14540A (.Q(n_1014), 
	.B(n_74), 
	.A(FE_OFN144_n_2110));
   AND2X1 p11022A (.Q(n_826), 
	.B(FE_OFN134_n_255), 
	.A(FE_OFN176_n_396));
   NA2X0 p1139D (.Q(n_96), 
	.B(FE_OFN130_n_114), 
	.A(FE_OFN180_n_396));
   NO2X1 p0894D64556 (.Q(n_628), 
	.B(n_68), 
	.A(FE_OFN175_n_322));
   NA2X1 p1316D (.Q(n_537), 
	.B(FE_OFN117_n_24), 
	.A(n_302));
   NA2X1 p5734A (.Q(n_436), 
	.B(n_396), 
	.A(n_273));
   INX0 Fp12110A (.Q(n_232), 
	.A(n_1039));
   NA2X0 p11992A (.Q(n_1039), 
	.B(n_74), 
	.A(FE_OFN125_n_2135));
   INX4 Fp1060D64565 (.Q(n_113), 
	.A(n_1133));
   NA2X4 p0807D64566 (.Q(n_1133), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN189_n_543));
   INX0 Fp10830A (.Q(n_130), 
	.A(n_424));
   NA2X1 p10594A (.Q(n_424), 
	.B(FE_OFN189_n_543), 
	.A(n_326));
   AND2X0 p12687A (.Q(n_196), 
	.B(n_152), 
	.A(n_482));
   NO2X0 p12463A (.Q(n_333), 
	.B(FE_OFN163_n_425), 
	.A(FE_OFN175_n_322));
   INX0 Fp0781D64567 (.Q(n_345), 
	.A(n_898));
   NO2X4 p0839D (.Q(n_898), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(n_409));
   NO2X0 p11205A (.Q(n_434), 
	.B(FE_OFN140_n_2121), 
	.A(n_836));
   NA2X0 p14338A (.Q(n_2160), 
	.B(n_409), 
	.A(FE_OFN175_n_322));
   NO2I1X0 p9529A (.Q(n_290), 
	.B(n_84), 
	.AN(n_396));
   AND2X1 p4070A (.Q(n_406), 
	.B(FE_OFN160_n_418), 
	.A(n_269));
   INX0 Fp10127A (.Q(n_286), 
	.A(n_705));
   NA2X1 p9806A (.Q(n_705), 
	.B(FE_OFN189_n_543), 
	.A(FE_OFN113_n_325));
   NA2X0 p13392A (.Q(n_287), 
	.B(n_867), 
	.A(n_469));
   AND2X0 p13650A (.Q(n_395), 
	.B(n_321), 
	.A(n_289));
   AND2X0 p8858A (.Q(n_144), 
	.B(FE_OFN185_n_2018), 
	.A(FE_OFN177_n_396));
   INX2 Fp1024D (.Q(n_794), 
	.A(n_1025));
   NA2X4 p0833D64580 (.Q(n_1025), 
	.B(FE_OFN177_n_396), 
	.A(FE_OFN115_n_2221));
   AND2X0 p13239A (.Q(n_136), 
	.B(n_2174), 
	.A(n_396));
   NA2X1 p1156DT (.Q(n_754), 
	.B(FE_OFN177_n_396), 
	.A(n_492));
   AND2X0 p8696A (.Q(n_568), 
	.B(FE_OFN177_n_396), 
	.A(n_492));
   AND2X0 p40243A (.Q(n_1998), 
	.B(FE_OFN188_n_555), 
	.A(n_266));
   NA2I1X4 p9952A (.Q(n_566), 
	.B(FE_OFN189_n_543), 
	.AN(n_84));
   AND2X1 p1166D (.Q(n_908), 
	.B(FE_OFN189_n_543), 
	.A(n_416));
   NO2X0 p9910A (.Q(n_149), 
	.B(n_152), 
	.A(FE_OFN175_n_322));
   NA2X2 p0803DT (.Q(n_164), 
	.B(FE_OFN185_n_2018), 
	.A(FE_OFN189_n_543));
   NO2X2 p1127D (.Q(n_494), 
	.B(n_257), 
	.A(FE_OFN175_n_322));
   NO2X1 p9988A (.Q(n_1115), 
	.B(n_98), 
	.A(FE_OFN175_n_322));
   NO2X0 p0870DT (.Q(n_707), 
	.B(n_409), 
	.A(n_66));
   NA2X1 p1043D (.Q(n_512), 
	.B(FE_OFN160_n_418), 
	.A(n_74));
   NA2I1X1 p0816D64581 (.Q(n_124), 
	.B(n_65), 
	.AN(n_64));
   NA2X1 p0813D (.Q(n_125), 
	.B(n_62), 
	.A(n_63));
   NO2X1 p0566DT (.Q(n_154), 
	.B(n_60), 
	.A(n_61));
   NA2X0 p0834D (.Q(n_106), 
	.B(n_58), 
	.A(n_59));
   NA2X1 p0818D (.Q(n_121), 
	.B(n_56), 
	.A(n_57));
   NA3X0 p13225A (.Q(n_366), 
	.C(n_133), 
	.B(FE_OFN87_fsm_op_aux_1_1_), 
	.A(n_129));
   AND3X0 p16075A (.Q(n_951), 
	.C(FE_OFN39_n_23), 
	.B(FE_OFN123_n_295), 
	.A(n_422));
   NA3X0 p5309A64582 (.Q(n_230), 
	.C(n_22), 
	.B(n_118), 
	.A(FE_OFN73_fsm_op_aux_1_7_));
   AO21X0 p8833A (.Q(n_518), 
	.C(n_321), 
	.B(n_41), 
	.A(n_105));
   NO3X0 p6245A (.Q(n_958), 
	.C(FE_OFN153_n_174), 
	.B(n_2134), 
	.A(n_965));
   AN21X0 p11107A (.Q(n_253), 
	.C(n_71), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN184_n_443));
   ON21X0 p11803A (.Q(n_618), 
	.C(FE_OFN169_n_516), 
	.B(n_202), 
	.A(n_50));
   AO21X0 p10935A (.Q(n_172), 
	.C(FE_OFN188_n_555), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN145_n_2110));
   AN21X0 p11591A64583 (.Q(n_81), 
	.C(n_292), 
	.B(FE_OFN184_n_443), 
	.A(n_50));
   ON21X0 p12111A64584 (.Q(n_180), 
	.C(n_2116), 
	.B(FE_OFN32_n_78), 
	.A(n_55));
   OA21X0 p12193A (.Q(n_361), 
	.C(n_114), 
	.B(FE_OFN122_n_295), 
	.A(n_903));
   AO21X0 p11520A (.Q(n_242), 
	.C(n_355), 
	.B(n_270), 
	.A(n_120));
   ON21X0 p12798A (.Q(n_147), 
	.C(FE_OFN169_n_516), 
	.B(n_50), 
	.A(n_97));
   NO3I1X0 p12373A64585 (.Q(n_820), 
	.C(n_199), 
	.B(n_66), 
	.AN(n_687));
   NO3I1X0 p12095A (.Q(n_222), 
	.C(n_202), 
	.B(n_195), 
	.AN(n_309));
   AND3X0 p10329A (.Q(n_135), 
	.C(n_94), 
	.B(n_55), 
	.A(FE_OFN169_n_516));
   ON21X0 p4818A (.Q(n_465), 
	.C(FE_OFN163_n_425), 
	.B(FE_OFN161_n_173), 
	.A(FE_OFN115_n_2221));
   NO3X0 p40364A (.Q(n_2025), 
	.C(FE_OFN32_n_78), 
	.B(FE_OFN140_n_2121), 
	.A(n_836));
   NA3X0 p14005A (.Q(n_251), 
	.C(n_321), 
	.B(n_2119), 
	.A(FE_OFN185_n_2018));
   AO21X0 p10489A (.Q(n_182), 
	.C(n_849), 
	.B(n_202), 
	.A(n_451));
   AO21X0 p12856A64586 (.Q(n_183), 
	.C(FE_OFN37_n_692), 
	.B(n_2166), 
	.A(FE_OFN115_n_2221));
   AO21X0 p11774A (.Q(n_217), 
	.C(n_428), 
	.B(n_2119), 
	.A(FE_OFN166_n_2154));
   INX0 Fp13878A (.Q(n_2145), 
	.A(n_54));
   INX0 Fp13832A (.Q(n_2170), 
	.A(n_53));
   HAX0 p13470A (.S(n_54), 
	.CO(n_53), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN152_n_284));
   INX0 Fp13324A (.Q(n_2148), 
	.A(n_52));
   HAX0 p12874A (.S(n_52), 
	.CO(n_184), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN32_n_78));
   AN22X0 p11390A64587 (.Q(n_169), 
	.D(n_22), 
	.C(n_2117), 
	.B(n_557), 
	.A(FE_OFN166_n_2154));
   AN22X0 p10917A (.Q(n_201), 
	.D(n_2117), 
	.C(n_305), 
	.B(n_51), 
	.A(FE_OFN187_n_2173));
   AO22X0 p11759A (.Q(n_137), 
	.D(n_51), 
	.C(n_191), 
	.B(n_2138), 
	.A(n_305));
   AO211X0 p11866A (.Q(n_175), 
	.D(n_2017), 
	.C(n_50), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN142_n_117));
   ON22X0 p1240D (.Q(n_573), 
	.D(FE_OFN43_fsm_opcode_1_), 
	.C(n_83), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(FE_OFN163_n_425));
   ON22X0 p11956A (.Q(n_128), 
	.D(n_270), 
	.C(n_383), 
	.B(FE_OFN185_n_2018), 
	.A(n_101));
   NO2X1 p0784D64594 (.Q(n_1148), 
	.B(n_49), 
	.A(n_103));
   INX1 Fp0821D (.Q(n_108), 
	.A(n_965));
   NA2X1 p0799D (.Q(n_965), 
	.B(n_35), 
	.A(n_735));
   NO2I1X1 p0803D (.Q(n_1344), 
	.B(n_75), 
	.AN(FE_OFN105_fsm_op1_1_));
   INX0 Fp0816D64598 (.Q(n_726), 
	.A(n_93));
   AND2X1 p0840D64600 (.Q(n_93), 
	.B(FE_OFN107_fsm_op1_0_), 
	.A(n_735));
   NO2I1X1 p0832D (.Q(n_1323), 
	.B(n_75), 
	.AN(n_1414));
   NO2X0 p16327A (.Q(n_889), 
	.B(FE_OFN140_n_2121), 
	.A(n_1171));
   INX0 Fp0840D (.Q(n_1371), 
	.A(n_91));
   NO2X1 p0832D64602 (.Q(n_91), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(n_103));
   AND2X1 p1181D (.Q(n_314), 
	.B(n_116), 
	.A(n_871));
   NO2X4 p1261D (.Q(n_422), 
	.B(FE_OFN163_n_425), 
	.A(n_2134));
   AND2X0 p9717A (.Q(n_139), 
	.B(n_51), 
	.A(FE_OFN121_n_2044));
   NO2X0 p0935DT (.Q(n_480), 
	.B(FE_OFN107_fsm_op1_0_), 
	.A(n_48));
   NA2X0 p4178A (.Q(n_940), 
	.B(n_35), 
	.A(n_57));
   INX0 Fp0810D64605 (.Q(n_73), 
	.A(n_92));
   NO2X1 p0889D (.Q(n_92), 
	.B(n_35), 
	.A(n_47));
   NO2I1X0 p11846A (.Q(n_1045), 
	.B(FE_OFN113_n_325), 
	.AN(FE_OFN170_n_473));
   NA2I1X0 p4626A (.Q(n_817), 
	.B(FE_OFN163_n_425), 
	.AN(n_452));
   AND2X4 p0654D (.Q(n_396), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN146_n_134));
   NO2X4 p1242DT (.Q(n_560), 
	.B(n_550), 
	.A(FE_OFN146_n_134));
   NA2X4 p4897A (.Q(n_102), 
	.B(FE_OFN116_n_24), 
	.A(n_100));
   AND2X0 p11089A64608 (.Q(n_88), 
	.B(FE_OFN122_n_295), 
	.A(FE_OFN170_n_473));
   NA2I1X0 p13774A (.Q(n_1991), 
	.B(n_499), 
	.AN(n_126));
   NO2I1X1 p10302A (.Q(n_549), 
	.B(FE_OFN115_n_2221), 
	.AN(FE_OFN169_n_516));
   NA2X1 p10701A (.Q(n_640), 
	.B(FE_OFN145_n_2110), 
	.A(FE_OFN113_n_325));
   NA2X4 p0987D (.Q(n_594), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN168_n_2183));
   NA2X0 p13361A (.Q(n_265), 
	.B(FE_OFN152_n_284), 
	.A(n_82));
   INX0 Fp10693A64609 (.Q(n_268), 
	.A(n_368));
   NA2X0 p10462A (.Q(n_368), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN142_n_117));
   INX0 Fp11357A (.Q(n_208), 
	.A(FE_OFCN297_n_648));
   NO2X0 p11331A (.Q(n_648), 
	.B(FE_OFN146_n_134), 
	.A(FE_OFN156_n_2115));
   NO2I1X0 p11209A (.Q(n_80), 
	.B(n_22), 
	.AN(n_2119));
   NO2X2 p0835DT (.Q(n_348), 
	.B(FE_OFN116_n_24), 
	.A(FE_OFN164_n_425));
   NA2X0 p1490D (.Q(n_591), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(FE_OFN142_n_117));
   NA2X0 p13021A (.Q(n_510), 
	.B(FE_OFN154_n_174), 
	.A(n_2101));
   INX0 Fp9823A (.Q(n_141), 
	.A(n_658));
   NA2X0 p9520A (.Q(n_658), 
	.B(n_550), 
	.A(n_2119));
   NO2X0 p12915A64610 (.Q(n_267), 
	.B(FE_OFN32_n_78), 
	.A(n_499));
   NA2I1X0 p8596A (.Q(n_370), 
	.B(n_174), 
	.AN(FE_OFN165_n_2181));
   OR2X1 p10244A (.Q(n_704), 
	.B(n_84), 
	.A(n_100));
   NA2X1 p0955D (.Q(n_322), 
	.B(n_22), 
	.A(FE_OFN146_n_134));
   NA2X1 p1389DT (.Q(n_490), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN146_n_134));
   NO2X1 p1635D (.Q(n_372), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(n_100));
   NO2X0 p10388A (.Q(n_414), 
	.B(n_100), 
	.A(n_871));
   NO2X1 p9942A (.Q(n_571), 
	.B(n_100), 
	.A(n_257));
   NO2X0 p11483A (.Q(n_85), 
	.B(n_195), 
	.A(n_485));
   NO2X0 p9980A (.Q(n_299), 
	.B(FE_OFN29_n_1973), 
	.A(n_95));
   AND2X0 p9909A (.Q(n_1113), 
	.B(n_142), 
	.A(n_297));
   OR2X0 p13017A (.Q(n_2171), 
	.B(FE_OFN170_n_473), 
	.A(n_43));
   NO2X2 p1198D (.Q(n_1007), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN170_n_473));
   AND2X0 p12219A (.Q(n_476), 
	.B(n_43), 
	.A(FE_OFN129_n_2135));
   INX0 Fp4181A64626 (.Q(n_346), 
	.A(n_782));
   NA2X0 p3895A (.Q(n_782), 
	.B(FE_OFN139_n_270), 
	.A(FE_OFN166_n_2154));
   INX3 Fp0867D64627 (.Q(n_453), 
	.A(n_1003));
   OR2X4 p0884D64636 (.Q(n_1003), 
	.B(FE_OFN141_n_2118), 
	.A(FE_OFN115_n_2221));
   NA2I1X0 p13539A (.Q(n_2153), 
	.B(n_697), 
	.AN(FE_OFN168_n_2183));
   INX1 Fp9714A64637 (.Q(n_730), 
	.A(n_746));
   NA2X2 p9218A (.Q(n_746), 
	.B(n_22), 
	.A(FE_OFN168_n_2183));
   NA2X4 p0844D (.Q(n_148), 
	.B(n_2020), 
	.A(FE_OFN168_n_2183));
   AND2X0 p9207A (.Q(n_519), 
	.B(n_321), 
	.A(FE_OFN165_n_2181));
   NO2X4 p0773D64639 (.Q(n_497), 
	.B(n_199), 
	.A(n_68));
   AND2X1 p1237D (.Q(n_332), 
	.B(n_229), 
	.A(n_687));
   AND2X1 p9477A (.Q(n_331), 
	.B(n_550), 
	.A(FE_OFN169_n_516));
   INX2 Fp5586A (.Q(n_227), 
	.A(n_407));
   OR2X4 p5425A (.Q(n_407), 
	.B(FE_OFN140_n_2121), 
	.A(n_69));
   NO2X1 p11625A (.Q(n_275), 
	.B(FE_OFN156_n_2115), 
	.A(n_2116));
   NO2X1 p9167A (.Q(n_334), 
	.B(FE_OFN140_n_2121), 
	.A(n_383));
   NO2X1 p1007D (.Q(n_350), 
	.B(FE_OFN40_n_198), 
	.A(n_68));
   NA2X0 p39973A (.Q(n_2179), 
	.B(n_68), 
	.A(n_383));
   NO2X0 p1236D (.Q(n_189), 
	.B(n_68), 
	.A(n_2119));
   NO2X0 p11222A64642 (.Q(n_71), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN141_n_2118));
   INX0 Fp9552A (.Q(n_235), 
	.A(n_218));
   NA2X1 p9490A65472 (.Q(n_218), 
	.B(n_376), 
	.A(n_50));
   OR2X0 p13220A64643 (.Q(n_2049), 
	.B(FE_OFN165_n_2181), 
	.A(n_2163));
   AND2X0 p40034A (.Q(n_2011), 
	.B(n_376), 
	.A(n_2101));
   OR2X4 p11008A (.Q(n_192), 
	.B(n_199), 
	.A(n_2116));
   INX2 Fp0902D64646 (.Q(n_118), 
	.A(n_483));
   NA2X4 p0804D64648 (.Q(n_483), 
	.B(n_2154), 
	.A(FE_OFN158_n_577));
   NO2X0 p10620A65473 (.Q(n_326), 
	.B(n_499), 
	.A(n_66));
   INX0 Fp5170A64649 (.Q(n_288), 
	.A(n_535));
   NA2X1 p4780A (.Q(n_535), 
	.B(FE_OFN166_n_2154), 
	.A(FE_OFN142_n_117));
   NO2X0 p12270A (.Q(n_2012), 
	.B(FE_OFN135_n_255), 
	.A(n_499));
   NA2X0 p12297A (.Q(n_522), 
	.B(FE_OFN135_n_255), 
	.A(FE_OFN142_n_117));
   OR2X0 p12652A (.Q(n_2120), 
	.B(n_126), 
	.A(n_2119));
   AND2X0 p11811A (.Q(n_2052), 
	.B(FE_OFN117_n_24), 
	.A(n_2119));
   AND2X0 p10947A (.Q(n_981), 
	.B(n_2119), 
	.A(n_1974));
   INX1 Fp4960A64652 (.Q(n_112), 
	.A(n_836));
   NA2X1 p4862A (.Q(n_836), 
	.B(FE_OFN184_n_443), 
	.A(FE_OFN166_n_2154));
   NA2X0 p10486A (.Q(n_482), 
	.B(n_94), 
	.A(FE_OFN115_n_2221));
   NO2X0 p10675A (.Q(n_140), 
	.B(n_2128), 
	.A(n_1974));
   INX1 Fp10507A64655 (.Q(n_86), 
	.A(n_639));
   NA2X0 p10259A (.Q(n_639), 
	.B(FE_OFN123_n_295), 
	.A(n_321));
   NO2X1 p0970DT (.Q(n_224), 
	.B(FE_OFN135_n_255), 
	.A(n_369));
   NA2X0 p9410A (.Q(n_403), 
	.B(FE_OFN32_n_78), 
	.A(n_120));
   NO2X0 p10693A (.Q(n_206), 
	.B(FE_OFN140_n_2121), 
	.A(n_1974));
   NO2X1 p4273A (.Q(n_269), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN140_n_2121));
   INX0 Fp1021D64659 (.Q(n_155), 
	.A(n_442));
   NA2X2 p0956D (.Q(n_442), 
	.B(FE_OFN159_n_577), 
	.A(FE_OFN121_n_2044));
   NA2X0 p13094A (.Q(n_859), 
	.B(FE_OFN131_n_114), 
	.A(n_321));
   NA2X1 p6303A (.Q(n_867), 
	.B(n_202), 
	.A(FE_OFN184_n_443));
   NO2X1 p4023A (.Q(n_289), 
	.B(FE_OFN141_n_2118), 
	.A(n_257));
   NA2X1 p10834A (.Q(n_555), 
	.B(n_41), 
	.A(n_2016));
   INX1 Fp1052D64662 (.Q(n_70), 
	.A(FE_OFN173_n_551));
   NO2X4 p0908D (.Q(n_551), 
	.B(FE_OFN141_n_2118), 
	.A(FE_OFN121_n_2044));
   NO2X1 p1060DT (.Q(n_302), 
	.B(FE_OFN156_n_2115), 
	.A(FE_OFN121_n_2044));
   NA2X1 p11928A64663 (.Q(n_564), 
	.B(FE_OFN158_n_577), 
	.A(FE_OFN115_n_2221));
   NO2X1 p0855DT (.Q(n_529), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN156_n_2115));
   NA2X0 p6866A (.Q(n_724), 
	.B(n_22), 
	.A(FE_OFN158_n_577));
   NO2X0 p12366A (.Q(n_129), 
	.B(FE_OFN40_n_198), 
	.A(n_257));
   NO2X1 p10436A (.Q(n_351), 
	.B(FE_OFN116_n_24), 
	.A(n_199));
   NO2X1 p13092A (.Q(n_266), 
	.B(FE_OFN141_n_2118), 
	.A(n_318));
   OR2X0 p11876A (.Q(n_228), 
	.B(n_451), 
	.A(FE_OFN161_n_173));
   NO2X0 p10322A (.Q(n_138), 
	.B(FE_OFN116_n_24), 
	.A(FE_OFN141_n_2118));
   NO2X1 p9804A (.Q(n_2010), 
	.B(FE_OFN133_n_255), 
	.A(FE_OFN141_n_2118));
   NO2X1 p11807A (.Q(n_1089), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN140_n_2121));
   NO2X2 p1397D (.Q(n_1220), 
	.B(FE_OFN161_n_173), 
	.A(n_257));
   AND2X0 p6343A (.Q(n_336), 
	.B(FE_OFN161_n_173), 
	.A(n_557));
   NO2X2 p1020D (.Q(n_492), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN141_n_2118));
   NO2X1 p10185A (.Q(n_111), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN185_n_2018));
   NO2X1 p0872D (.Q(n_869), 
	.B(n_22), 
	.A(n_257));
   NA2X4 p0676DT (.Q(n_409), 
	.B(FE_OFN40_n_198), 
	.A(n_321));
   NO2X1 p0828D (.Q(n_74), 
	.B(n_22), 
	.A(FE_OFN140_n_2121));
   NO2X0 p11664A (.Q(n_213), 
	.B(FE_OFN40_n_198), 
	.A(n_318));
   NO2X0 p10536A (.Q(n_849), 
	.B(n_22), 
	.A(FE_OFN156_n_2115));
   NA2X1 p0753DT (.Q(n_540), 
	.B(FE_OFN135_n_255), 
	.A(n_120));
   NO2X0 p10314A (.Q(n_176), 
	.B(FE_OFN32_n_78), 
	.A(n_369));
   NO2X2 p1159D (.Q(n_309), 
	.B(FE_OFN116_n_24), 
	.A(FE_OFN156_n_2115));
   INX0 Fp13091A (.Q(n_190), 
	.A(n_2165));
   NA2X0 p12885A (.Q(n_2165), 
	.B(n_114), 
	.A(n_2174));
   INX1 Fp5424A64667 (.Q(n_273), 
	.A(n_87));
   NA2X0 p5205A (.Q(n_87), 
	.B(FE_OFN152_n_284), 
	.A(FE_OFN160_n_418));
   NA2X1 p11053A (.Q(n_469), 
	.B(n_270), 
	.A(FE_OFN185_n_2018));
   NO2X0 p11480A (.Q(n_292), 
	.B(FE_OFN140_n_2121), 
	.A(n_84));
   AND2X1 p0998D (.Q(n_416), 
	.B(n_750), 
	.A(FE_OFN185_n_2018));
   NA2X0 p13241A64669 (.Q(n_2111), 
	.B(n_84), 
	.A(n_98));
   NA2I1X0 p14376A (.Q(n_2180), 
	.B(n_697), 
	.AN(n_2157));
   NA2X0 p11846A64670 (.Q(n_320), 
	.B(FE_OFN160_n_418), 
	.A(FE_OFN184_n_443));
   NO2X1 p9706A (.Q(n_428), 
	.B(n_199), 
	.A(n_318));
   NO2X0 p9619A (.Q(n_99), 
	.B(FE_OFN184_n_443), 
	.A(FE_OFN158_n_577));
   OR2X0 p12939A64671 (.Q(n_2050), 
	.B(n_2122), 
	.A(n_2174));
   NA3X1 p0681DT (.Q(n_61), 
	.C(n_38), 
	.B(n_39), 
	.A(n_40));
   NO3X1 p0829D (.Q(n_59), 
	.C(FE_OFN79_fsm_op_aux_1_4_), 
	.B(FE_OFN84_fsm_op_aux_1_2_), 
	.A(FE_OFN81_n_1402));
   AND4X1 p0795D64672 (.Q(n_109), 
	.D(n_1314), 
	.C(n_36), 
	.B(n_1109), 
	.A(n_37));
   ON21X1 p0807D64673 (.Q(n_2175), 
	.C(n_115), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN43_fsm_opcode_1_));
   AO21X0 p13099A (.Q(n_2162), 
	.C(n_558), 
	.B(n_114), 
	.A(FE_OFN123_n_295));
   AO21X0 p13301A (.Q(n_2048), 
	.C(n_2177), 
	.B(FE_OFN152_n_284), 
	.A(FE_OFN32_n_78));
   NA3X0 p1345D (.Q(n_955), 
	.C(FE_OFN117_n_24), 
	.B(n_750), 
	.A(FE_OFN107_fsm_op1_0_));
   AO21X0 p13528A (.Q(n_2129), 
	.C(n_447), 
	.B(n_22), 
	.A(n_202));
   AN22X1 p0814D64674 (.Q(n_65), 
	.D(n_33), 
	.C(FE_OFN107_fsm_op1_0_), 
	.B(n_34), 
	.A(n_35));
   ON22X0 p0814D64675 (.Q(n_77), 
	.D(n_31), 
	.C(n_35), 
	.B(n_32), 
	.A(FE_OFN107_fsm_op1_0_));
   ON22X0 p5101A65474 (.Q(n_734), 
	.D(FE_OFN63_fsm_op2_1_), 
	.C(n_35), 
	.B(FE_OFN66_fsm_op2_0_), 
	.A(FE_OFN107_fsm_op1_0_));
   AN22X1 p0831D64676 (.Q(n_56), 
	.D(n_29), 
	.C(FE_OFN107_fsm_op1_0_), 
	.B(n_30), 
	.A(n_35));
   AN22X0 p0816D64677 (.Q(n_62), 
	.D(n_27), 
	.C(FE_OFN107_fsm_op1_0_), 
	.B(n_28), 
	.A(n_35));
   ON22X0 p4509A64678 (.Q(n_76), 
	.D(n_1414), 
	.C(FE_OFN70_fsm_op2_6_), 
	.B(FE_OFN105_fsm_op1_1_), 
	.A(FE_OFN92_fsm_op2_4_));
   INX0 Fp4644A (.Q(n_667), 
	.A(n_110));
   OA22X0 p4468A (.Q(n_110), 
	.D(n_49), 
	.C(DFT_sdo), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(FE_OFN94_fsm_op2_3_));
   EN2X0 p13669A (.Q(n_2161), 
	.B(FE_OFN139_n_270), 
	.A(FE_OFN37_n_692));
   NA2X1 p0838D (.Q(n_75), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(n_35));
   NA2X0 p0674DT (.Q(n_60), 
	.B(n_21), 
	.A(n_26));
   NO2X1 p0807D64680 (.Q(n_58), 
	.B(FE_OFN75_fsm_op_aux_1_6_), 
	.A(FE_OFN77_n_1334));
   INX0 Fp0832D (.Q(n_48), 
	.A(n_57));
   NO2X0 p0874D (.Q(n_57), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(n_1414));
   NA2X1 p0847D (.Q(n_64), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(FE_OFN105_fsm_op1_1_));
   NO2X1 p0751D64681 (.Q(n_107), 
	.B(FE_OFN89_n_1288), 
	.A(FE_OFN87_fsm_op_aux_1_1_));
   INX0 Fp0787D64682 (.Q(n_1144), 
	.A(n_103));
   NA2X2 p0798D64683 (.Q(n_103), 
	.B(FE_OFN107_fsm_op1_0_), 
	.A(FE_OFN105_fsm_op1_1_));
   INX0 Fp0819D (.Q(n_63), 
	.A(n_47));
   NA2X0 p0830D64684 (.Q(n_47), 
	.B(FE_OFN103_fsm_op1_2_), 
	.A(n_1414));
   AND2X4 p0776D (.Q(n_735), 
	.B(n_49), 
	.A(n_1414));
   NA2X0 p11342A (.Q(n_1285), 
	.B(FE_OFN107_fsm_op1_0_), 
	.A(FE_OFN113_n_325));
   NO2X0 p1103D (.Q(n_116), 
	.B(FE_OFN29_n_1973), 
	.A(FE_OFN32_n_78));
   NO2X0 p9700A (.Q(n_51), 
	.B(n_376), 
	.A(n_1974));
   NO2X4 p0725D (.Q(n_134), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN39_n_23));
   NA2X1 p0728D (.Q(n_115), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN43_fsm_opcode_1_));
   NO2X0 p12398A64712 (.Q(n_43), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN40_n_198));
   NO2X2 p0936D (.Q(n_473), 
	.B(n_376), 
	.A(n_22));
   NO2X0 p13681A (.Q(n_2113), 
	.B(FE_OFN39_n_23), 
	.A(n_550));
   NO2X0 p13514A (.Q(n_2123), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN32_n_78));
   NO2X0 p12127A (.Q(n_2138), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN152_n_284));
   NO2X0 p11406A (.Q(n_2105), 
	.B(n_376), 
	.A(FE_OFN133_n_255));
   NO2X0 p11810A (.Q(n_2017), 
	.B(n_376), 
	.A(n_114));
   NO2X0 p11593A (.Q(n_355), 
	.B(n_202), 
	.A(n_871));
   INX1 Fp1077D64713 (.Q(n_399), 
	.A(n_700));
   NA2X1 p1003D64715 (.Q(n_700), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN115_n_2221));
   NO2X1 p8970A (.Q(n_516), 
	.B(FE_OFN134_n_255), 
	.A(n_1974));
   NO2X1 p9981A (.Q(n_297), 
	.B(FE_OFN32_n_78), 
	.A(n_871));
   NA2X0 p40462A (.Q(n_2102), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN154_n_174));
   NA2X0 p12802A (.Q(n_455), 
	.B(n_22), 
	.A(FE_OFN125_n_2135));
   NO2I1X1 p0761D (.Q(n_2183), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.AN(n_41));
   NA2X0 p11433A (.Q(n_485), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN113_n_325));
   NO2X2 p1039D (.Q(n_687), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN40_n_198));
   NO2X1 p1034D (.Q(n_105), 
	.B(n_22), 
	.A(FE_OFN121_n_2044));
   NO2X0 p13412A (.Q(n_2124), 
	.B(FE_OFN37_n_692), 
	.A(n_550));
   NO2X1 p9500A (.Q(n_685), 
	.B(FE_OFN130_n_114), 
	.A(FE_OFN121_n_2044));
   NA2X0 p5329A64716 (.Q(n_69), 
	.B(n_22), 
	.A(FE_OFN122_n_295));
   NA2X0 p11709A64717 (.Q(n_82), 
	.B(FE_OFN40_n_198), 
	.A(n_202));
   NA2X4 p0654DT (.Q(n_68), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN117_n_24));
   NO2X1 p0859D (.Q(n_2110), 
	.B(FE_OFN31_fsm_opcode_7_), 
	.A(FE_OFN43_fsm_opcode_1_));
   NO2X2 p0678DT (.Q(n_2154), 
	.B(FE_OFN122_n_295), 
	.A(FE_OFN116_n_24));
   NA2X1 p5219A (.Q(n_383), 
	.B(n_550), 
	.A(n_202));
   NA2X0 p15507A (.Q(n_2109), 
	.B(FE_OFN32_n_78), 
	.A(n_202));
   NO2X0 p11321A (.Q(n_558), 
	.B(FE_OFN131_n_114), 
	.A(FE_OFN123_n_295));
   NO2X0 p1139D64731 (.Q(n_452), 
	.B(FE_OFN36_fsm_opcode_5_), 
	.A(n_2221));
   NA2X0 p13899A (.Q(n_2114), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN32_n_78));
   NO2X0 p14102A (.Q(n_2146), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN32_n_78));
   INX2 Fp1664A64734 (.Q(n_50), 
	.A(n_261));
   NA2X1 p1592D (.Q(n_261), 
	.B(n_22), 
	.A(FE_OFN116_n_24));
   NO2X1 p9998A (.Q(n_2101), 
	.B(FE_OFN32_n_78), 
	.A(n_550));
   NO2X1 p11463A (.Q(n_2177), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN152_n_284));
   NO2X1 p8575A (.Q(n_2181), 
	.B(n_114), 
	.A(FE_OFN116_n_24));
   NA2X0 p10685A (.Q(n_2116), 
	.B(FE_OFN32_n_78), 
	.A(n_550));
   NO2X0 p12935A65475 (.Q(n_2163), 
	.B(FE_OFN152_n_284), 
	.A(n_550));
   INX0 Fp6541A64736 (.Q(n_353), 
	.A(n_2125));
   NA2X1 p6500A (.Q(n_2125), 
	.B(FE_OFN154_n_174), 
	.A(n_202));
   NO2X0 p13115A (.Q(n_2166), 
	.B(n_22), 
	.A(FE_OFN139_n_270));
   INX1 Fp0966D (.Q(n_2117), 
	.A(n_499));
   NA2X2 p0817D64743 (.Q(n_499), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.A(FE_OFN31_fsm_opcode_7_));
   NO2X2 p1127D64744 (.Q(n_2119), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN35_fsm_opcode_5_));
   NO2X0 p0902D64745 (.Q(n_126), 
	.B(n_229), 
	.A(FE_OFN135_n_255));
   NA2X1 p0824DT (.Q(n_425), 
	.B(n_229), 
	.A(n_114));
   NO2X1 p0858D (.Q(n_117), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.A(FE_OFN42_fsm_opcode_4_));
   NA2X1 p0749DT (.Q(n_2118), 
	.B(FE_OFN42_fsm_opcode_4_), 
	.A(FE_OFN35_fsm_opcode_5_));
   NO2X1 p1398D (.Q(n_173), 
	.B(n_229), 
	.A(n_114));
   NO2X1 p9851A (.Q(n_2173), 
	.B(FE_OFN154_n_174), 
	.A(n_550));
   NO2X0 p13876A (.Q(n_2014), 
	.B(n_376), 
	.A(FE_OFN154_n_174));
   NO2X0 p13274A (.Q(n_2158), 
	.B(n_376), 
	.A(FE_OFN32_n_78));
   INX8 Fp0591D64779 (.Q(n_321), 
	.A(FE_OFN140_n_2121));
   NA2I1X4 p0580D (.Q(n_2121), 
	.B(FE_OFN39_n_23), 
	.AN(FE_OFN37_n_692));
   INX0 Fp11067A (.Q(n_97), 
	.A(n_246));
   NA2X0 p11159A64787 (.Q(n_246), 
	.B(n_376), 
	.A(n_202));
   NO2X0 p40603A (.Q(n_2150), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN135_n_255));
   NO2X0 p10755A (.Q(n_133), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN121_n_2044));
   NO2X1 p12669A (.Q(n_471), 
	.B(n_376), 
	.A(n_550));
   INX1 Fp8773A64791 (.Q(n_161), 
	.A(n_2016));
   NA2X1 p8358A (.Q(n_2016), 
	.B(FE_OFN39_n_23), 
	.A(n_22));
   INX1 Fp10382A64793 (.Q(n_94), 
	.A(n_101));
   NA2X1 p10278A (.Q(n_101), 
	.B(n_376), 
	.A(FE_OFN40_n_198));
   NO2X0 p12715A (.Q(n_2182), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN117_n_24));
   NO2X0 p13550A (.Q(n_2015), 
	.B(FE_OFN39_n_23), 
	.A(FE_OFN139_n_270));
   INX0 Fp9977A64797 (.Q(n_214), 
	.A(n_95));
   NA2X0 p9615A (.Q(n_95), 
	.B(FE_OFN32_n_78), 
	.A(n_1974));
   NO2X0 p10869A (.Q(n_245), 
	.B(FE_OFN152_n_284), 
	.A(n_1974));
   NA2X0 p11152A64798 (.Q(n_195), 
	.B(n_22), 
	.A(n_871));
   NO2I1X4 p0430DT (.Q(n_120), 
	.B(n_871), 
	.AN(FE_OFN31_fsm_opcode_7_));
   NA2X1 p0946D64802 (.Q(n_369), 
	.B(n_550), 
	.A(n_1974));
   NO2X1 p9972A (.Q(n_903), 
	.B(FE_OFN32_n_78), 
	.A(n_1974));
   NO2X1 p10966A (.Q(n_305), 
	.B(n_1974), 
	.A(FE_OFN115_n_2221));
   NO2X1 p9927A (.Q(n_186), 
	.B(n_1974), 
	.A(FE_OFN113_n_325));
   NO2X2 p0849D (.Q(n_750), 
	.B(n_229), 
	.A(FE_OFN115_n_2221));
   NO2X0 p40627A (.Q(n_2112), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN123_n_295));
   NO2X0 p14473A (.Q(n_2157), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN117_n_24));
   NO2X1 p0845DT (.Q(n_418), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(FE_OFN121_n_2044));
   NA2X1 p1056D (.Q(n_66), 
	.B(FE_OFN122_n_295), 
	.A(FE_OFN115_n_2221));
   NO2X1 p10297A (.Q(n_602), 
	.B(FE_OFN154_n_174), 
	.A(FE_OFN121_n_2044));
   INX0 Fp4548A (.Q(n_410), 
	.A(n_697));
   NA2X1 p4277A (.Q(n_697), 
	.B(FE_OFN37_n_692), 
	.A(FE_OFN116_n_24));
   NO2X0 p6362A (.Q(n_557), 
	.B(FE_OFN37_n_692), 
	.A(n_22));
   NO2X4 p0839D64808 (.Q(n_451), 
	.B(n_114), 
	.A(FE_OFN115_n_2221));
   NA2X2 p0652D (.Q(n_84), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(n_229));
   INX0 Fp7085A64809 (.Q(n_191), 
	.A(n_744));
   NA2X0 p6725A (.Q(n_744), 
	.B(n_284), 
	.A(FE_OFN123_n_295));
   NA2X4 p0743DT (.Q(n_257), 
	.B(FE_OFN43_fsm_opcode_1_), 
	.A(FE_OFN117_n_24));
   NO2X2 p0869D (.Q(n_2018), 
	.B(n_550), 
	.A(FE_OFN122_n_295));
   NO2X0 p13729A (.Q(n_2019), 
	.B(FE_OFN133_n_255), 
	.A(n_202));
   NO2X0 p1088DT (.Q(n_652), 
	.B(n_284), 
	.A(FE_OFN123_n_295));
   NA2X0 p9938A (.Q(n_152), 
	.B(n_202), 
	.A(n_114));
   NA2X0 p9762A (.Q(n_98), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN154_n_174));
   NO2X0 p13833A65476 (.Q(n_2149), 
	.B(FE_OFN123_n_295), 
	.A(FE_OFN32_n_78));
   NO2X1 p6083A (.Q(n_447), 
	.B(n_22), 
	.A(n_202));
   NO2X0 p15645A (.Q(n_2126), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN135_n_255));
   NA2X0 p13372A (.Q(n_2127), 
	.B(n_22), 
	.A(n_550));
   NA2X0 p0578DT (.Q(n_83), 
	.B(FE_OFN40_n_198), 
	.A(n_114));
   NO2X2 p0885D (.Q(n_2020), 
	.B(n_22), 
	.A(FE_OFN42_fsm_opcode_4_));
   NA2X0 p13368A (.Q(n_1999), 
	.B(FE_OFN40_n_198), 
	.A(FE_OFN117_n_24));
   NA2X0 p10714A (.Q(n_2128), 
	.B(FE_OFN154_n_174), 
	.A(n_22));
   NO2X0 p40530A (.Q(n_2156), 
	.B(n_22), 
	.A(FE_OFN154_n_174));
   INX1 Fp9991A (.Q(n_104), 
	.A(n_2139));
   NA2X1 p9652A (.Q(n_2139), 
	.B(n_550), 
	.A(n_114));
   NO2X1 p10125A64821 (.Q(n_2174), 
	.B(FE_OFN134_n_255), 
	.A(n_550));
   NO2X0 p13403A (.Q(n_2178), 
	.B(FE_OFN152_n_284), 
	.A(FE_OFN133_n_255));
   INX0 Fp4642A64823 (.Q(n_55), 
	.A(n_740));
   NA2X1 p4359A (.Q(n_740), 
	.B(n_550), 
	.A(n_270));
   NA2X4 p0686DT (.Q(n_199), 
	.B(FE_OFN35_fsm_opcode_5_), 
	.A(n_114));
   NO2X1 p1504D (.Q(n_443), 
	.B(FE_OFN149_n_284), 
	.A(n_270));
   INX2 Fp0848D64838 (.Q(n_2122), 
	.A(n_318));
   OR2X4 p0812D (.Q(n_318), 
	.B(FE_OFN32_n_78), 
	.A(FE_OFN117_n_24));
   NO2X0 p15671A (.Q(n_2152), 
	.B(n_114), 
	.A(FE_OFN32_n_78));
   NO2X0 p14501A (.Q(n_2013), 
	.B(FE_OFN154_n_174), 
	.A(FE_OFN135_n_255));
   NO2X1 p0709DT (.Q(n_577), 
	.B(n_114), 
	.A(FE_OFN35_fsm_opcode_5_));
   NA2X2 p0965D (.Q(n_2115), 
	.B(FE_OFN42_fsm_opcode_4_), 
	.A(n_229));
   INX1 Fp0684D64857 (.Q(n_36), 
	.A(FE_OFN96_fsm_op1_6_));
   INX0 Fp2734A (.Q(n_961), 
	.A(FE_OFN70_fsm_op2_6_));
   INX0 Fp0543D (.Q(n_661), 
	.A(FE_OFN86_fsm_op_aux_1_1_));
   INX1 Fp0645D64859 (.Q(n_1314), 
	.A(FE_OFN99_fsm_op1_5_));
   INX6 Fp0710D64876 (.Q(n_1414), 
	.A(FE_OFN105_fsm_op1_1_));
   INX0 Fp0800D64881 (.Q(n_40), 
	.A(FE_OFN81_n_1402));
   INX2 Fp0610D64932 (.Q(n_174), 
	.A(n_270));
   INX3 Fp0610D64938 (.Q(n_270), 
	.A(FE_OFN35_fsm_opcode_5_));
   INX6 Fp0610D64939 (.Q(n_229), 
	.A(FE_OFN35_fsm_opcode_5_));
   INX3 Fp0557D64969 (.Q(n_376), 
	.A(FE_OFN39_n_23));
   INX1 Fp0990D (.Q(n_34), 
	.A(FE_OFN47_fsm_op_aux_2_6_));
   INX0 Fp2224A (.Q(n_220), 
	.A(FE_OFN63_fsm_op2_1_));
   INX0 Fp0613D (.Q(n_38), 
	.A(FE_OFN79_fsm_op_aux_1_4_));
   INX8 Fp0719D65011 (.Q(n_22), 
	.A(FE_OFN40_n_198));
   INX8 Fp0380D65045 (.Q(n_1974), 
	.A(n_871));
   INX0 Fp2877A (.Q(n_1325), 
	.A(FE_OFN92_fsm_op2_4_));
   INX0 Fp0628D (.Q(n_39), 
	.A(FE_OFN84_fsm_op_aux_1_2_));
   INX1 Fp0561D (.Q(n_26), 
	.A(FE_OFN75_fsm_op_aux_1_6_));
   INX3 Fp0517D65084 (.Q(n_41), 
	.A(FE_OFN37_n_692));
   INX8 Fp0420D65133 (.Q(n_255), 
	.A(FE_OFN32_n_78));
   INX1 Fp0991D (.Q(n_28), 
	.A(FE_OFN51_fsm_op_aux_2_4_));
   INX1 Fp0818D65144 (.Q(n_1109), 
	.A(FE_OFN101_fsm_op1_4_));
   INX4 Fp0749D65152 (.Q(n_49), 
	.A(FE_OFN103_fsm_op1_2_));
   INX1 Fp2807A (.Q(n_1171), 
	.A(FE_OFN69_n_202));
   INX8 Fp0679D65177 (.Q(n_35), 
	.A(FE_OFN107_fsm_op1_0_));
   INX1 Fp0979D (.Q(n_31), 
	.A(FE_OFN58_fsm_op_aux_2_1_));
   INX8 Fp0670D (.Q(n_114), 
	.A(FE_OFN42_fsm_opcode_4_));
   INX4 Fp0670D65218 (.Q(n_284), 
	.A(n_114));
   INX0 Fp2190A65229 (.Q(n_1168), 
	.A(FE_OFN72_fsm_op2_2_));
   INX1 Fp1036D (.Q(n_30), 
	.A(FE_OFN56_fsm_op_aux_2_2_));
   INX2 Fp0758D65235 (.Q(n_2134), 
	.A(FE_OFN73_fsm_op_aux_1_7_));
   INX1 Fp0289D65255 (.Q(n_142), 
	.A(FE_OFN29_n_1973));
   INX1 Fp0598D (.Q(n_37), 
	.A(\fsm_op1[3] ));
   INX1 Fp1116D (.Q(n_29), 
	.A(FE_OFN53_fsm_op_aux_2_3_));
   INX6 Fp1074D65298 (.Q(n_2135), 
	.A(n_325));
   INX1 Fp3291A (.Q(n_1254), 
	.A(FE_OFN91_fsm_op2_5_));
   INX16 Fp0574D65319 (.Q(n_202), 
	.A(FE_OFN122_n_295));
   INX6 Fp0574D65343 (.Q(n_295), 
	.A(FE_OFN43_fsm_opcode_1_));
   INX0 Fp0774D65357 (.Q(n_669), 
	.A(FE_OFN89_n_1288));
   INX1 Fp1073D (.Q(n_32), 
	.A(FE_OFN60_fsm_op_aux_2_0_));
   INX8 Fp0658D65397 (.Q(n_2044), 
	.A(FE_OFN114_n_2221));
   INX1 Fp1051D (.Q(n_33), 
	.A(FE_OFN45_fsm_op_aux_2_7_));
   INX8 Fp0637D65449 (.Q(n_550), 
	.A(FE_OFN116_n_24));
   INX8 Fp0637D65450 (.Q(n_24), 
	.A(FE_OFN31_fsm_opcode_7_));
   INX2 Fp1058D (.Q(n_27), 
	.A(FE_OFN49_fsm_op_aux_2_5_));
   INX0 Fp0757D65460 (.Q(n_21), 
	.A(FE_OFN77_n_1334));
   INX8 fopt65465 (.Q(n_20), 
	.A(FE_OFN26_n_19));
   LOGIC1 tie_1_cell (.Q(logic_1_1_net));
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
	mem_ctrl_ram_data_o, 
	top_clock_mem_i__L1_N1);
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
   input top_clock_mem_i__L1_N1;

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
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_22;
   wire n_59;
   wire n_60;
   wire n_62;
   wire n_63;
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
   wire n_113;
   wire n_115;
   wire n_118;

   SPRAM128X8 internal_ram (.WEB(n_113), 
	.Q({ \int_ram_data_o[7] ,
		\int_ram_data_o[6] ,
		\int_ram_data_o[5] ,
		\int_ram_data_o[4] ,
		\int_ram_data_o[3] ,
		\int_ram_data_o[2] ,
		\int_ram_data_o[1] ,
		\int_ram_data_o[0]  }), 
	.OEB(n_115), 
	.ENB(n_22), 
	.D({ n_89,
		n_88,
		n_87,
		n_86,
		n_85,
		n_84,
		n_83,
		n_82 }), 
	.CLK(mem_ctrl_clk_i), 
	.ADR({ n_94,
		n_90,
		n_104,
		n_81,
		n_80,
		n_79,
		n_78 }), 
	.ramvdd(n_63), 
	.ramgnd(n_62));
   ROM4096X8 internal_rom (.Q({ \int_rom_data_o[7] ,
		\int_rom_data_o[6] ,
		\int_rom_data_o[5] ,
		\int_rom_data_o[4] ,
		\int_rom_data_o[3] ,
		\int_rom_data_o[2] ,
		\int_rom_data_o[1] ,
		\int_rom_data_o[0]  }), 
	.OEB(n_118), 
	.ENB(n_118), 
	.CLK(top_clock_mem_i__L1_N1), 
	.ADR({ n_95,
		n_93,
		n_92,
		n_91,
		n_103,
		n_102,
		n_101,
		n_100,
		n_99,
		n_98,
		n_97,
		n_96 }), 
	.romvdd(n_60), 
	.romgnd(n_59));
   AO22X1 p4223A (.Q(mem_ctrl_rom_data_o[7]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[7]), 
	.B(n_11), 
	.A(\int_rom_data_o[7] ));
   AO22X0 p4218A (.Q(mem_ctrl_rom_data_o[4]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[4]), 
	.B(n_11), 
	.A(\int_rom_data_o[4] ));
   AO22X1 p3998A (.Q(mem_ctrl_rom_data_o[1]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[1]), 
	.B(n_11), 
	.A(\int_rom_data_o[1] ));
   AO22X0 p3978A (.Q(mem_ctrl_ram_data_o[1]), 
	.D(mem_ctrl_bus_ctrl_data_i[1]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[1] ), 
	.A(n_9));
   AO22X0 p3978A1646 (.Q(mem_ctrl_ram_data_o[0]), 
	.D(mem_ctrl_bus_ctrl_data_i[0]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[0] ), 
	.A(n_9));
   AO22X0 p3998A1647 (.Q(mem_ctrl_rom_data_o[0]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[0]), 
	.B(n_11), 
	.A(\int_rom_data_o[0] ));
   AO22X0 p4218A1648 (.Q(mem_ctrl_rom_data_o[3]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[3]), 
	.B(n_11), 
	.A(\int_rom_data_o[3] ));
   AO22X0 p4024A (.Q(mem_ctrl_ram_data_o[7]), 
	.D(mem_ctrl_bus_ctrl_data_i[7]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[7] ), 
	.A(n_9));
   AO22X0 p4024A1649 (.Q(mem_ctrl_ram_data_o[6]), 
	.D(mem_ctrl_bus_ctrl_data_i[6]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[6] ), 
	.A(n_9));
   AO22X0 p4167A (.Q(mem_ctrl_rom_data_o[6]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[6]), 
	.B(n_11), 
	.A(\int_rom_data_o[6] ));
   AO22X0 p4167A1650 (.Q(mem_ctrl_rom_data_o[5]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[5]), 
	.B(n_11), 
	.A(\int_rom_data_o[5] ));
   AO22X0 p4024A1651 (.Q(mem_ctrl_ram_data_o[5]), 
	.D(mem_ctrl_bus_ctrl_data_i[5]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[5] ), 
	.A(n_9));
   AO22X0 p4218A1652 (.Q(mem_ctrl_rom_data_o[2]), 
	.D(n_10), 
	.C(mem_ctrl_bus_ctrl_data_i[2]), 
	.B(n_11), 
	.A(\int_rom_data_o[2] ));
   AO22X0 p3966A (.Q(mem_ctrl_ram_data_o[4]), 
	.D(mem_ctrl_bus_ctrl_data_i[4]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[4] ), 
	.A(n_9));
   AO22X0 p3966A1653 (.Q(mem_ctrl_ram_data_o[3]), 
	.D(mem_ctrl_bus_ctrl_data_i[3]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[3] ), 
	.A(n_9));
   AO22X0 p3968A (.Q(mem_ctrl_ram_data_o[2]), 
	.D(mem_ctrl_bus_ctrl_data_i[2]), 
	.C(mem_ctrl_ext_ram_i), 
	.B(\int_ram_data_o[2] ), 
	.A(n_9));
   INX0 Fp4934A1656 (.Q(n_11), 
	.A(n_10));
   INX0 Fp16665A1658 (.Q(n_9), 
	.A(mem_ctrl_ext_ram_i));
   AO22X0 p2358A (.Q(mem_ctrl_bus_ctrl_addr_o[7]), 
	.D(mem_ctrl_ram_addr_i[7]), 
	.C(n_3), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[7]));
   AO22X0 p2505A (.Q(mem_ctrl_bus_ctrl_addr_o[3]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[3]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[3]));
   AO22X0 p2358A1890 (.Q(mem_ctrl_bus_ctrl_addr_o[2]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[2]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[2]));
   AO22X0 p2358A1891 (.Q(mem_ctrl_bus_ctrl_addr_o[1]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[1]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[1]));
   AO22X0 p2358A1892 (.Q(mem_ctrl_bus_ctrl_addr_o[0]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[0]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[0]));
   AO22X1 p2358A1893 (.Q(mem_ctrl_bus_ctrl_addr_o[6]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[6]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[6]));
   AO22X0 p2358A1894 (.Q(mem_ctrl_bus_ctrl_addr_o[5]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[5]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[5]));
   AO22X0 p2505A1895 (.Q(mem_ctrl_bus_ctrl_addr_o[4]), 
	.D(n_3), 
	.C(mem_ctrl_ram_addr_i[4]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[4]));
   AND2X0 p2337A (.Q(mem_ctrl_bus_ctrl_addr_o[10]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[10]));
   NO2I1X1 p5299A (.Q(n_97), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[1]));
   AND2X0 p2337A1896 (.Q(mem_ctrl_bus_ctrl_addr_o[9]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[9]));
   NO2I1X1 p5299A1897 (.Q(n_101), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[5]));
   AND2X0 p2337A1898 (.Q(mem_ctrl_bus_ctrl_addr_o[8]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[8]));
   AND2X0 p2337A1899 (.Q(mem_ctrl_bus_ctrl_addr_o[11]), 
	.B(n_7), 
	.A(mem_ctrl_rom_addr_i[11]));
   NO2I1X1 p5299A1900 (.Q(n_95), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[11]));
   NO2I1X1 p5299A1901 (.Q(n_93), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[10]));
   NO2I1X1 p5299A1902 (.Q(n_92), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[9]));
   NO2I1X1 p5299A1903 (.Q(n_91), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[8]));
   NO2I1X1 p5299A1904 (.Q(n_103), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[7]));
   NO2I1X1 p5299A1905 (.Q(n_102), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[6]));
   NO2I1X1 p5299A1906 (.Q(n_100), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[4]));
   NO2I1X1 p5299A1907 (.Q(n_99), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[3]));
   NO2I1X1 p5299A1908 (.Q(n_98), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[2]));
   NO2I1X1 p5299A1909 (.Q(n_96), 
	.B(n_118), 
	.AN(mem_ctrl_rom_addr_i[0]));
   AO22X1 p12981A (.Q(n_81), 
	.D(mem_ctrl_ram_addr_i[6]), 
	.C(n_5), 
	.B(n_6), 
	.A(mem_ctrl_ram_addr_i[3]));
   AO22X1 p15191A (.Q(n_80), 
	.D(mem_ctrl_ram_addr_i[5]), 
	.C(n_5), 
	.B(mem_ctrl_ram_addr_i[2]), 
	.A(n_6));
   AO22X1 p13050A (.Q(n_79), 
	.D(n_5), 
	.C(mem_ctrl_ram_addr_i[4]), 
	.B(mem_ctrl_ram_addr_i[1]), 
	.A(n_6));
   AO22X1 p13050A1910 (.Q(n_78), 
	.D(n_5), 
	.C(mem_ctrl_ram_addr_i[3]), 
	.B(mem_ctrl_ram_addr_i[0]), 
	.A(n_6));
   AND2X0 p3041A (.Q(mem_ctrl_bus_ctrl_addr_o[13]), 
	.B(mem_ctrl_rom_addr_i[13]), 
	.A(n_4));
   AND2X0 p3014A (.Q(mem_ctrl_bus_ctrl_addr_o[12]), 
	.B(mem_ctrl_rom_addr_i[12]), 
	.A(n_4));
   AND2X0 p3014A1911 (.Q(mem_ctrl_bus_ctrl_addr_o[15]), 
	.B(mem_ctrl_rom_addr_i[15]), 
	.A(n_4));
   AND2X1 p15228A (.Q(n_94), 
	.B(mem_ctrl_ram_addr_i[6]), 
	.A(n_6));
   AND2X1 p13069A (.Q(n_104), 
	.B(n_6), 
	.A(mem_ctrl_ram_addr_i[4]));
   AND2X0 p3041A1912 (.Q(mem_ctrl_bus_ctrl_addr_o[14]), 
	.B(mem_ctrl_rom_addr_i[14]), 
	.A(n_4));
   OR2X2 p3856A (.Q(n_118), 
	.B(n_10), 
	.A(mem_ctrl_rom_rd_b_i));
   INX0 Fp1170A1915 (.Q(n_7), 
	.A(mem_ctrl_bus_ctrl_ext_rom_rd_b_o));
   NA2X4 p0904D (.Q(mem_ctrl_bus_ctrl_ext_rom_rd_b_o), 
	.B(n_10), 
	.A(n_4));
   AO21X1 p15192A (.Q(n_90), 
	.C(n_5), 
	.B(n_2), 
	.A(mem_ctrl_ram_addr_i[5]));
   NO2I1X0 p2738A (.Q(mem_ctrl_bus_ctrl_data_o[7]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[7]));
   AND2X0 p7320A (.Q(n_86), 
	.B(mem_ctrl_ram_data_i[4]), 
	.A(n_2));
   AND2X0 p6977A (.Q(n_85), 
	.B(mem_ctrl_ram_data_i[3]), 
	.A(n_2));
   AND2X0 p7008A (.Q(n_84), 
	.B(mem_ctrl_ram_data_i[2]), 
	.A(n_2));
   AND2X0 p7008A1917 (.Q(n_82), 
	.B(mem_ctrl_ram_data_i[0]), 
	.A(n_2));
   NO2I1X0 p2425A (.Q(mem_ctrl_bus_ctrl_data_o[2]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[2]));
   AND2X0 p7320A1918 (.Q(n_89), 
	.B(mem_ctrl_ram_data_i[7]), 
	.A(n_2));
   NO2I1X0 p2425A1919 (.Q(mem_ctrl_bus_ctrl_data_o[1]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[1]));
   AND2X0 p7008A1920 (.Q(n_83), 
	.B(mem_ctrl_ram_data_i[1]), 
	.A(n_2));
   NO2I1X0 p2766A (.Q(mem_ctrl_bus_ctrl_data_o[6]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[6]));
   NO2I1X0 p2425A1921 (.Q(mem_ctrl_bus_ctrl_data_o[0]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[0]));
   NO2I1X0 p2766A1922 (.Q(mem_ctrl_bus_ctrl_data_o[5]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[5]));
   NO2X0 p14664A (.Q(n_6), 
	.B(mem_ctrl_bit_byte_flag_i), 
	.A(n_22));
   AND2X0 p14804A (.Q(n_5), 
	.B(mem_ctrl_bit_byte_flag_i), 
	.A(n_2));
   NO2X4 p11972A (.Q(n_4), 
	.B(mem_ctrl_rom_rd_b_i), 
	.A(n_3));
   AND2X0 p7348A (.Q(n_87), 
	.B(mem_ctrl_ram_data_i[5]), 
	.A(n_2));
   NO2I1X0 p2395A (.Q(mem_ctrl_bus_ctrl_data_o[3]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[3]));
   NO2I1X0 p2738A1923 (.Q(mem_ctrl_bus_ctrl_data_o[4]), 
	.B(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.AN(mem_ctrl_ram_data_i[4]));
   AND2X0 p7348A1924 (.Q(n_88), 
	.B(mem_ctrl_ram_data_i[6]), 
	.A(n_2));
   OR5X1 p0852D (.Q(n_10), 
	.E(n_0), 
	.D(mem_ctrl_rom_addr_i[13]), 
	.C(mem_ctrl_rom_addr_i[14]), 
	.B(mem_ctrl_rom_addr_i[15]), 
	.A(mem_ctrl_rom_addr_i[12]));
   AND2X4 p11899A (.Q(n_3), 
	.B(mem_ctrl_ext_ram_i), 
	.A(n_1));
   INX0 Fp14071A1928 (.Q(n_2), 
	.A(n_22));
   AO21X1 p13993AT (.Q(n_22), 
	.C(mem_ctrl_ext_ram_i), 
	.B(mem_ctrl_ram_rd_b_i), 
	.A(mem_ctrl_ram_wr_b_i));
   NA3I1X4 p12120D (.Q(mem_ctrl_bus_ctrl_ext_ram_wr_b_o), 
	.C(mem_ctrl_ext_ram_i), 
	.B(mem_ctrl_ram_rd_b_i), 
	.AN(mem_ctrl_ram_wr_b_i));
   NA3I2X1 p16418A (.Q(n_113), 
	.C(mem_ctrl_ram_rd_b_i), 
	.BN(mem_ctrl_ext_ram_i), 
	.AN(mem_ctrl_ram_wr_b_i));
   NA2X1 p11789A (.Q(n_1), 
	.B(mem_ctrl_ram_rd_b_i), 
	.A(mem_ctrl_ram_wr_b_i));
   NA2I1X1 p12178A (.Q(mem_ctrl_bus_ctrl_ext_ram_rd_b_o), 
	.B(mem_ctrl_ext_ram_i), 
	.AN(mem_ctrl_ram_rd_b_i));
   OR2X1 p14252A (.Q(n_115), 
	.B(mem_ctrl_ext_ram_i), 
	.A(mem_ctrl_ram_rd_b_i));
   INX0 Fp9978817A (.Q(n_0), 
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
	FE_PT1_top_p1_y_i_6_, 
	top_clock_mem_i__L1_N1, 
	top_clock_mem_i__L1_N3);
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
   input FE_PT1_top_p1_y_i_6_;
   input top_clock_mem_i__L1_N1;
   input top_clock_mem_i__L1_N3;

   // Internal wires
   wire FE_OFN24_SPCASCAN_N0;
   wire FE_OFN23_SPCASCAN_N0;
   wire FE_OFN22_pcau_fsm_pc_12_;
   wire FE_OFN21_pcau_fsm_pc_12_;
   wire FE_OFN20_pcau_fsm_pc_12_;
   wire FE_OFN19_pcau_fsm_pc_13_;
   wire FE_OFN18_pcau_fsm_pc_14_;
   wire FE_OFN17_pcau_fsm_pc_14_;
   wire FE_OFN16_n_222;
   wire FE_OFN15_n_222;
   wire FE_OFN14_pcau_fsm_pc_3_;
   wire FE_OFN13_pcau_fsm_pc_3_;
   wire FE_OFN12_pcau_fsm_pc_4_;
   wire FE_OFN10_pcau_fsm_pc_5_;
   wire logic_1_1_net;
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

   BUX8 FE_RC_120_0 (.Q(pcau_pc_o[5]), 
	.A(FE_OFN10_pcau_fsm_pc_5_));
   EN2X0 FE_RC_119_0 (.Q(n_84), 
	.B(n_0), 
	.A(n_80));
   INX4 FE_OFC24_SPCASCAN_N0 (.Q(pcau_pc_o[0]), 
	.A(FE_OFN24_SPCASCAN_N0));
   INX2 FE_OFC23_SPCASCAN_N0 (.Q(FE_OFN24_SPCASCAN_N0), 
	.A(FE_OFN23_SPCASCAN_N0));
   INX1 FE_OFC22_pcau_fsm_pc_12_ (.Q(pcau_pc_o[12]), 
	.A(FE_OFN21_pcau_fsm_pc_12_));
   INX1 FE_OFC20_pcau_fsm_pc_12_ (.Q(FE_OFN21_pcau_fsm_pc_12_), 
	.A(FE_OFN20_pcau_fsm_pc_12_));
   BUX1 FE_OFC19_pcau_fsm_pc_13_ (.Q(pcau_pc_o[13]), 
	.A(FE_OFN19_pcau_fsm_pc_13_));
   INX1 FE_OFC18_pcau_fsm_pc_14_ (.Q(pcau_pc_o[14]), 
	.A(FE_OFN18_pcau_fsm_pc_14_));
   INX1 FE_OFC17_pcau_fsm_pc_14_ (.Q(FE_OFN18_pcau_fsm_pc_14_), 
	.A(FE_OFN17_pcau_fsm_pc_14_));
   INX1 FE_OFC16_n_222 (.Q(pcau_pc_o[15]), 
	.A(FE_OFN16_n_222));
   INX1 FE_OFC15_n_222 (.Q(FE_OFN16_n_222), 
	.A(FE_OFN15_n_222));
   INX4 FE_OFC14_pcau_fsm_pc_3_ (.Q(pcau_pc_o[3]), 
	.A(FE_OFN14_pcau_fsm_pc_3_));
   INX1 FE_OFC13_pcau_fsm_pc_3_ (.Q(FE_OFN14_pcau_fsm_pc_3_), 
	.A(FE_OFN13_pcau_fsm_pc_3_));
   BUX6 FE_OFC12_pcau_fsm_pc_4_ (.Q(pcau_pc_o[4]), 
	.A(FE_OFN12_pcau_fsm_pc_4_));
   SDFFQX2 \pcau_pc_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(FE_OFN23_SPCASCAN_N0), 
	.D(n_37), 
	.CN(top_clock_mem_i__L1_N1));
   SDFFQX1 \pcau_pc_o_reg[10]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[9]), 
	.Q(pcau_pc_o[10]), 
	.D(n_87), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[11]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[10]), 
	.Q(pcau_pc_o[11]), 
	.D(n_98), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[12]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[11]), 
	.Q(FE_OFN20_pcau_fsm_pc_12_), 
	.D(n_101), 
	.CN(pcau_clock_mem_i));
   SDFFQX1 \pcau_pc_o_reg[13]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[12]), 
	.Q(FE_OFN19_pcau_fsm_pc_13_), 
	.D(n_107), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX1 \pcau_pc_o_reg[14]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[13]), 
	.Q(FE_OFN17_pcau_fsm_pc_14_), 
	.D(n_108), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFX1 \pcau_pc_o_reg[15]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[14]), 
	.Q(FE_OFN15_n_222), 
	.D(n_109), 
	.CN(pcau_clock_mem_i));
   SDFFQX2 \pcau_pc_o_reg[1]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[2]), 
	.Q(pcau_pc_o[1]), 
	.D(n_42), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX4 \pcau_pc_o_reg[2]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[5]), 
	.Q(pcau_pc_o[2]), 
	.D(n_44), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX2 \pcau_pc_o_reg[3]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p1_y_i_6_), 
	.Q(FE_OFN13_pcau_fsm_pc_3_), 
	.D(n_47), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFSX4 \pcau_pc_o_reg[4]  (.SN(logic_1_1_net), 
	.SE(DFT_sen), 
	.SD(pcau_pc_o[3]), 
	.Q(FE_OFN12_pcau_fsm_pc_4_), 
	.D(n_52), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFSQX2 \pcau_pc_o_reg[5]  (.SN(logic_1_1_net), 
	.SE(DFT_sen), 
	.SD(pcau_pc_o[4]), 
	.Q(FE_OFN10_pcau_fsm_pc_5_), 
	.D(n_59), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX4 \pcau_pc_o_reg[6]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[1]), 
	.Q(pcau_pc_o[6]), 
	.D(n_62), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX4 \pcau_pc_o_reg[7]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[6]), 
	.Q(pcau_pc_o[7]), 
	.D(n_66), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX1 \pcau_pc_o_reg[8]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[7]), 
	.Q(pcau_pc_o[8]), 
	.D(n_72), 
	.CN(top_clock_mem_i__L1_N3));
   SDFFQX1 \pcau_pc_o_reg[9]  (.SE(DFT_sen), 
	.SD(pcau_pc_o[8]), 
	.Q(pcau_pc_o[9]), 
	.D(n_79), 
	.CN(pcau_clock_mem_i));
   ON21X1 p1337D (.Q(n_109), 
	.C(n_33), 
	.B(n_26), 
	.A(n_106));
   ON21X0 p1450D (.Q(n_108), 
	.C(n_34), 
	.B(n_26), 
	.A(n_105));
   ON21X1 p1533D (.Q(n_107), 
	.C(n_32), 
	.B(n_26), 
	.A(n_103));
   EO3X1 p1264D (.Q(n_106), 
	.C(pcau_pc_o[14]), 
	.B(pcau_pc_o[15]), 
	.A(n_104));
   EO3X0 p1580D (.Q(n_105), 
	.C(pcau_pc_o[14]), 
	.B(pcau_pc_o[13]), 
	.A(n_95));
   ON21X1 p1059D (.Q(n_104), 
	.C(n_102), 
	.B(pcau_pc_o[14]), 
	.A(n_96));
   EO2X1 p1391D (.Q(n_103), 
	.B(pcau_pc_o[13]), 
	.A(n_100));
   NA2X2 p1042D (.Q(n_102), 
	.B(pcau_pc_o[13]), 
	.A(n_99));
   AO222X2 p1092D (.Q(n_101), 
	.F(n_13), 
	.E(pcau_pc_o[12]), 
	.D(n_24), 
	.C(pcau_pc_msb_i[4]), 
	.B(n_94), 
	.A(n_25));
   NO2I1X1 p1199D (.Q(n_100), 
	.B(n_96), 
	.AN(n_97));
   NA2X2 p0953D (.Q(n_99), 
	.B(pcau_pc_o[14]), 
	.A(n_97));
   AO222X1 p1215D (.Q(n_98), 
	.F(n_13), 
	.E(pcau_pc_o[11]), 
	.D(n_24), 
	.C(pcau_pc_msb_i[3]), 
	.B(n_91), 
	.A(n_25));
   NA2X2 p0903D (.Q(n_97), 
	.B(pcau_pc_o[12]), 
	.A(n_92));
   NO2X1 p1153D (.Q(n_96), 
	.B(pcau_pc_o[12]), 
	.A(n_92));
   ON21X1 p1378D (.Q(n_95), 
	.C(n_93), 
	.B(pcau_pc_o[13]), 
	.A(n_18));
   EN2X1 p0938D (.Q(n_94), 
	.B(n_31), 
	.A(n_89));
   NA2X1 p1361D (.Q(n_93), 
	.B(n_30), 
	.A(n_89));
   ON21X1 p0877D (.Q(n_92), 
	.C(n_90), 
	.B(pcau_pc_o[12]), 
	.A(n_86));
   EO3X0 p1170D (.Q(n_91), 
	.C(pcau_pc_o[11]), 
	.B(pcau_pc_o[10]), 
	.A(n_82));
   NA2X4 p0874D (.Q(n_90), 
	.B(pcau_pc_o[11]), 
	.A(n_88));
   ON21X1 p0994D (.Q(n_89), 
	.C(n_85), 
	.B(pcau_pc_o[11]), 
	.A(n_86));
   NA2X4 p0881D (.Q(n_88), 
	.B(pcau_pc_o[12]), 
	.A(n_85));
   AO222X1 p1606D (.Q(n_87), 
	.F(n_13), 
	.E(pcau_pc_o[10]), 
	.D(n_24), 
	.C(pcau_pc_msb_i[2]), 
	.B(n_84), 
	.A(n_25));
   AND2X4 p0806D (.Q(n_86), 
	.B(n_0), 
	.A(n_82));
   NA2X4 p0876D (.Q(n_85), 
	.B(pcau_pc_o[10]), 
	.A(n_81));
   AN21X1 p0684DT (.Q(n_82), 
	.C(n_77), 
	.B(n_0), 
	.A(n_78));
   AO21X4 p0815D (.Q(n_81), 
	.C(n_77), 
	.B(n_0), 
	.A(n_78));
   NA2I1X0 p1103D (.Q(n_80), 
	.B(n_78), 
	.AN(n_77));
   ON21X0 p2919A (.Q(n_79), 
	.C(n_35), 
	.B(n_26), 
	.A(n_76));
   NA2I1X4 p0796D (.Q(n_78), 
	.B(n_75), 
	.AN(pcau_pc_o[9]));
   NO2I1X2 p0799D (.Q(n_77), 
	.B(n_75), 
	.AN(pcau_pc_o[9]));
   EO2X0 p2807A (.Q(n_76), 
	.B(pcau_pc_o[9]), 
	.A(n_73));
   NO2X4 p0785D (.Q(n_75), 
	.B(n_70), 
	.A(n_74));
   NO2X2 p0795D (.Q(n_74), 
	.B(pcau_pc_o[9]), 
	.A(n_71));
   NO2X0 p2620A (.Q(n_73), 
	.B(n_71), 
	.A(n_70));
   AO222X0 p2741A (.Q(n_72), 
	.F(n_13), 
	.E(pcau_pc_o[8]), 
	.D(n_69), 
	.C(n_25), 
	.B(n_24), 
	.A(pcau_pc_msb_i[0]));
   NO2I1X2 p0833D (.Q(n_71), 
	.B(n_68), 
	.AN(pcau_offset_i[7]));
   NO2X2 p0832D (.Q(n_70), 
	.B(n_67), 
	.A(pcau_offset_i[7]));
   EN2X0 p2615A (.Q(n_69), 
	.B(pcau_pc_o[8]), 
	.A(n_65));
   ON21X1 p0681DT (.Q(n_68), 
	.C(n_20), 
	.B(n_2), 
	.A(n_63));
   AN21X1 p0825D (.Q(n_67), 
	.C(n_21), 
	.B(n_3), 
	.A(n_64));
   AO222X0 p2916A (.Q(n_66), 
	.F(n_13), 
	.E(pcau_pc_o[7]), 
	.D(n_25), 
	.C(n_61), 
	.B(n_24), 
	.A(pcau_offset_i[7]));
   EN2X0 p2359A (.Q(n_65), 
	.B(n_64), 
	.A(pcau_offset_i[7]));
   ON21X1 p0669DT (.Q(n_64), 
	.C(n_15), 
	.B(n_11), 
	.A(n_58));
   NO2I1X2 p0828D (.Q(n_63), 
	.B(n_60), 
	.AN(n_15));
   AO222X0 p3165A (.Q(n_62), 
	.F(n_13), 
	.E(pcau_pc_o[6]), 
	.D(n_25), 
	.C(n_57), 
	.B(n_24), 
	.A(pcau_offset_i[6]));
   EN3X0 p2284A (.Q(n_61), 
	.C(pcau_pc_o[7]), 
	.B(n_58), 
	.A(pcau_offset_i[7]));
   NO2X1 p0814D (.Q(n_60), 
	.B(n_11), 
	.A(n_58));
   AO222X0 p3082A (.Q(n_59), 
	.F(n_13), 
	.E(pcau_pc_o[5]), 
	.D(n_25), 
	.C(n_54), 
	.B(n_24), 
	.A(pcau_offset_i[5]));
   NO2I1X4 p0810D (.Q(n_58), 
	.B(n_56), 
	.AN(n_17));
   EN2X0 p3020A (.Q(n_57), 
	.B(n_29), 
	.A(n_55));
   NO2X4 p0781D (.Q(n_56), 
	.B(n_1), 
	.A(n_53));
   INX0 Fp0802D (.Q(n_55), 
	.A(n_53));
   EO3X0 p2555A (.Q(n_54), 
	.C(pcau_pc_o[5]), 
	.B(n_50), 
	.A(pcau_offset_i[5]));
   NO2X4 p0812D (.Q(n_53), 
	.B(n_6), 
	.A(n_51));
   AO222X0 p3341A (.Q(n_52), 
	.F(n_13), 
	.E(pcau_pc_o[4]), 
	.D(n_25), 
	.C(n_49), 
	.B(n_24), 
	.A(pcau_offset_i[4]));
   NO2X2 p0787D (.Q(n_51), 
	.B(n_8), 
	.A(n_48));
   INX0 Fp0797D (.Q(n_50), 
	.A(n_48));
   EO3X0 p2814A (.Q(n_49), 
	.C(pcau_pc_o[4]), 
	.B(n_45), 
	.A(pcau_offset_i[4]));
   AN21X1 p0812D2085 (.Q(n_48), 
	.C(n_9), 
	.B(n_4), 
	.A(n_45));
   AO222X0 p3639A (.Q(n_47), 
	.F(n_13), 
	.E(pcau_pc_o[3]), 
	.D(n_25), 
	.C(n_46), 
	.B(n_24), 
	.A(pcau_offset_i[3]));
   EO3X0 p3120A (.Q(n_46), 
	.C(pcau_pc_o[3]), 
	.B(n_41), 
	.A(pcau_offset_i[3]));
   NA2X4 p0808D (.Q(n_45), 
	.B(n_16), 
	.A(n_43));
   AO222X0 p4186A (.Q(n_44), 
	.F(n_13), 
	.E(pcau_pc_o[2]), 
	.D(n_25), 
	.C(n_40), 
	.B(n_24), 
	.A(pcau_offset_i[2]));
   NA2X4 p0814D2087 (.Q(n_43), 
	.B(n_10), 
	.A(n_41));
   AO222X0 p4400A (.Q(n_42), 
	.F(n_13), 
	.E(pcau_pc_o[1]), 
	.D(n_25), 
	.C(n_36), 
	.B(n_24), 
	.A(pcau_offset_i[1]));
   NA2X4 p0803D (.Q(n_41), 
	.B(n_19), 
	.A(n_39));
   EN2X0 p4096A (.Q(n_40), 
	.B(n_27), 
	.A(n_38));
   NA2X2 p0811D (.Q(n_39), 
	.B(n_7), 
	.A(n_38));
   ON21X1 p0896D (.Q(n_38), 
	.C(n_14), 
	.B(n_12), 
	.A(n_5));
   AO222X0 p4646A (.Q(n_37), 
	.F(n_13), 
	.E(pcau_pc_o[0]), 
	.D(n_25), 
	.C(n_23), 
	.B(n_24), 
	.A(pcau_offset_i[0]));
   EN2X0 p4275A (.Q(n_36), 
	.B(n_5), 
	.A(n_28));
   AN22X0 p5210A (.Q(n_35), 
	.D(pcau_pc_o[9]), 
	.C(n_13), 
	.B(pcau_pc_msb_i[1]), 
	.A(n_24));
   AN22X0 p5210A2090 (.Q(n_34), 
	.D(pcau_pc_o[14]), 
	.C(n_13), 
	.B(pcau_pc_msb_i[6]), 
	.A(n_24));
   AN22X0 p5210A2091 (.Q(n_33), 
	.D(pcau_pc_o[15]), 
	.C(n_13), 
	.B(pcau_pc_msb_i[7]), 
	.A(n_24));
   AN22X0 p5210A2092 (.Q(n_32), 
	.D(pcau_pc_o[13]), 
	.C(n_13), 
	.B(pcau_pc_msb_i[5]), 
	.A(n_24));
   NO2I1X0 p17823A (.Q(n_31), 
	.B(n_18), 
	.AN(n_22));
   NA2X0 p18712A (.Q(n_30), 
	.B(pcau_pc_o[13]), 
	.A(n_22));
   NA2I1X0 p3850A (.Q(n_29), 
	.B(n_17), 
	.AN(n_1));
   NO2I1X0 p3975A (.Q(n_28), 
	.B(n_12), 
	.AN(n_14));
   NA2X0 p4033A (.Q(n_27), 
	.B(n_19), 
	.A(n_7));
   INX0 Fp4632A (.Q(n_26), 
	.A(n_25));
   NO3I2X1 p4409A (.Q(n_25), 
	.C(pcau_pc_direct_i), 
	.BN(pcau_reset_i_b), 
	.AN(pcau_en_i));
   AND3X1 p4385A (.Q(n_24), 
	.C(pcau_reset_i_b), 
	.B(pcau_pc_direct_i), 
	.A(pcau_en_i));
   EO2X0 p4340A (.Q(n_23), 
	.B(pcau_pc_o[0]), 
	.A(pcau_offset_i[0]));
   NA2X0 p17615A (.Q(n_22), 
	.B(pcau_pc_o[12]), 
	.A(pcau_pc_o[11]));
   INX0 Fp2462A (.Q(n_21), 
	.A(n_20));
   NA2X0 p2246A (.Q(n_20), 
	.B(pcau_pc_o[8]), 
	.A(pcau_offset_i[7]));
   NA2X1 p1290A (.Q(n_19), 
	.B(pcau_pc_o[2]), 
	.A(pcau_offset_i[2]));
   NO2X0 p17899A (.Q(n_18), 
	.B(pcau_pc_o[12]), 
	.A(pcau_pc_o[11]));
   NA2X1 p2060A (.Q(n_17), 
	.B(pcau_pc_o[6]), 
	.A(pcau_offset_i[6]));
   NA2X1 p1460A (.Q(n_16), 
	.B(pcau_pc_o[3]), 
	.A(pcau_offset_i[3]));
   NA2X0 p2145A (.Q(n_15), 
	.B(pcau_pc_o[7]), 
	.A(pcau_offset_i[7]));
   NA2X2 p1003A (.Q(n_14), 
	.B(pcau_pc_o[1]), 
	.A(pcau_offset_i[1]));
   NO2I1X1 p5068A (.Q(n_13), 
	.B(pcau_en_i), 
	.AN(pcau_reset_i_b));
   NO2X4 p0913D (.Q(n_12), 
	.B(pcau_pc_o[1]), 
	.A(pcau_offset_i[1]));
   NO2X1 p2264A (.Q(n_11), 
	.B(pcau_pc_o[7]), 
	.A(pcau_offset_i[7]));
   OR2X4 p0952D (.Q(n_10), 
	.B(pcau_pc_o[3]), 
	.A(pcau_offset_i[3]));
   AND2X1 p1513A (.Q(n_9), 
	.B(pcau_pc_o[4]), 
	.A(pcau_offset_i[4]));
   NO2X1 p1832A (.Q(n_8), 
	.B(pcau_pc_o[5]), 
	.A(pcau_offset_i[5]));
   OR2X4 p0929D (.Q(n_7), 
	.B(pcau_pc_o[2]), 
	.A(pcau_offset_i[2]));
   AND2X1 p1813A (.Q(n_6), 
	.B(pcau_pc_o[5]), 
	.A(pcau_offset_i[5]));
   NA2X4 p0906D (.Q(n_5), 
	.B(pcau_pc_o[0]), 
	.A(pcau_offset_i[0]));
   OR2X1 p1423A (.Q(n_4), 
	.B(pcau_pc_o[4]), 
	.A(pcau_offset_i[4]));
   INX0 Fp2389A (.Q(n_3), 
	.A(n_2));
   NO2X0 p2316A (.Q(n_2), 
	.B(pcau_pc_o[8]), 
	.A(pcau_offset_i[7]));
   NO2X1 p1980A (.Q(n_1), 
	.B(pcau_pc_o[6]), 
	.A(pcau_offset_i[6]));
   INX0 Fp9999763A2094 (.Q(n_0), 
	.A(pcau_pc_o[10]));
   LOGIC1 tie_1_cell (.Q(logic_1_1_net));
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
	reg_ctrl_timers_tacph0_o, 
	reg_ctrl_timers_tacph1_o, 
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
	DFT_sdi_3, 
	DFT_sdi_4, 
	DFT_sdo_5, 
	DFT_sdi_6, 
	DFT_sdo_7, 
	DFT_sdi_8, 
	FE_PT1_top_p4_a_o_5_, 
	SPCASCAN_N11, 
	FE_PT1_top_p3_en_o_5_, 
	FE_PT1_top_p3_en_o_4_, 
	FE_PT1_top_p3_en_o_3_, 
	FE_PT1_top_p3_en_o_2_, 
	FE_PT1_top_p3_en_o_1_, 
	FE_PT1_top_p3_en_o_0_, 
	top_clock_mem_i__L1_N2, 
	top_clock_mem_i__L1_N3, 
	top_clock_mem_i__L1_N4, 
	top_clock_mem_i__L1_N5, 
	top_clock_mem_i__L1_N6, 
	top_clock_mem_i__L1_N7, 
	top_clock_mem_i__L1_N8, 
	top_clock_mem_i__L1_N9);
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
   output [7:0] reg_ctrl_timers_tacph0_o;
   output [7:0] reg_ctrl_timers_tacph1_o;
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
   input DFT_sdi_3;
   input DFT_sdi_4;
   output DFT_sdo_5;
   input DFT_sdi_6;
   output DFT_sdo_7;
   input DFT_sdi_8;
   input FE_PT1_top_p4_a_o_5_;
   output SPCASCAN_N11;
   input FE_PT1_top_p3_en_o_5_;
   input FE_PT1_top_p3_en_o_4_;
   input FE_PT1_top_p3_en_o_3_;
   input FE_PT1_top_p3_en_o_2_;
   input FE_PT1_top_p3_en_o_1_;
   input FE_PT1_top_p3_en_o_0_;
   input top_clock_mem_i__L1_N2;
   input top_clock_mem_i__L1_N3;
   input top_clock_mem_i__L1_N4;
   input top_clock_mem_i__L1_N5;
   input top_clock_mem_i__L1_N6;
   input top_clock_mem_i__L1_N7;
   input top_clock_mem_i__L1_N8;
   input top_clock_mem_i__L1_N9;

   // Internal wires
   wire FE_OFCN296_core_ports_p1en_o_1_;
   wire FE_OFCN295_core_interrupt_ie_o_2_;
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
   wire n_902;
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
   wire \sfr[4][4] ;
   wire \sfr[4][5] ;
   wire \sfr[4][6] ;
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
   wire \sfr[28][0] ;
   wire \sfr[28][1] ;
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
   wire \sfr[34][0] ;
   wire \sfr[34][1] ;
   wire \sfr[34][5] ;
   wire \sfr[36][0] ;
   wire \sfr[36][1] ;
   wire \sfr[36][2] ;
   wire \sfr[36][3] ;
   wire \sfr[36][4] ;
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

   BUX1 FE_OFCC296_core_ports_p1en_o_1_ (.Q(FE_OFCN296_core_ports_p1en_o_1_), 
	.A(reg_ctrl_ports_p1en_o[1]));
   BUX1 FE_OFCC295_core_interrupt_ie_o_2_ (.Q(reg_ctrl_interrupt_ie_o[2]), 
	.A(FE_OFCN295_core_interrupt_ie_o_2_));
   SDFRQX0 load_sbuf_prev_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(load_sbuf_prev), 
	.D(n_935), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \read_data_reg[0]  (.SE(DFT_sen), 
	.SD(\sfr[3][4] ), 
	.Q(reg_ctrl_fsm_data_o[0]), 
	.D(n_934), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \read_data_reg[1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[5]), 
	.Q(reg_ctrl_fsm_data_o[1]), 
	.D(n_933), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \read_data_reg[2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[6]), 
	.Q(reg_ctrl_fsm_data_o[2]), 
	.D(n_932), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX2 \read_data_reg[3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[0]), 
	.Q(reg_ctrl_fsm_data_o[3]), 
	.D(n_931), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX2 \read_data_reg[4]  (.SE(DFT_sen), 
	.SD(\sfr[3][1] ), 
	.Q(reg_ctrl_fsm_data_o[4]), 
	.D(n_930), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \read_data_reg[5]  (.SE(DFT_sen), 
	.SD(\sfr[3][2] ), 
	.Q(reg_ctrl_fsm_data_o[5]), 
	.D(n_929), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \read_data_reg[6]  (.SE(DFT_sen), 
	.SD(load_sbuf_prev), 
	.Q(reg_ctrl_fsm_data_o[6]), 
	.D(n_928), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX2 \read_data_reg[7]  (.SE(DFT_sen), 
	.SD(\sfr[1][4] ), 
	.Q(reg_ctrl_fsm_data_o[7]), 
	.D(n_927), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 serial_status_reg (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[3]), 
	.Q(serial_status), 
	.D(n_926), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 serial_tx_tmp_reg (.SE(DFT_sen), 
	.SD(serial_status), 
	.Q(reg_ctrl_serial_tx_o), 
	.D(n_925), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[0][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[1]), 
	.Q(reg_ctrl_ports_p0_o[0]), 
	.D(n_924), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[0][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[2]), 
	.Q(reg_ctrl_ports_p0_o[1]), 
	.D(n_923), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[0][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_tx_o), 
	.Q(reg_ctrl_ports_p0_o[2]), 
	.D(n_922), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[0][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[4]), 
	.Q(reg_ctrl_ports_p0_o[3]), 
	.D(n_921), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[0][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[3]), 
	.Q(reg_ctrl_ports_p0_o[4]), 
	.D(n_920), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[0][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[6]), 
	.Q(reg_ctrl_ports_p0_o[5]), 
	.D(n_919), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[0][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[7]), 
	.Q(reg_ctrl_ports_p0_o[6]), 
	.D(n_918), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[0][7]  (.SE(DFT_sen), 
	.SD(\sfr[1][7] ), 
	.Q(reg_ctrl_ports_p0_o[7]), 
	.D(n_917), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[10][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_tf1_o), 
	.Q(reg_ctrl_timers_tl0_o[0]), 
	.D(n_916), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[1]), 
	.Q(reg_ctrl_timers_tl0_o[1]), 
	.D(n_915), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[1]), 
	.Q(reg_ctrl_timers_tl0_o[2]), 
	.D(n_914), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[4]), 
	.Q(reg_ctrl_timers_tl0_o[3]), 
	.D(n_913), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[6]), 
	.Q(reg_ctrl_timers_tl0_o[4]), 
	.D(n_912), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[3]), 
	.Q(reg_ctrl_timers_tl0_o[5]), 
	.D(n_911), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[2]), 
	.Q(reg_ctrl_timers_tl0_o[6]), 
	.D(n_910), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[10][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[5]), 
	.Q(reg_ctrl_timers_tl0_o[7]), 
	.D(n_909), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[11][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[0]), 
	.Q(reg_ctrl_timers_tl1_o[0]), 
	.D(n_908), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[11][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[0]), 
	.Q(reg_ctrl_timers_tl1_o[1]), 
	.D(n_907), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX2 \sfr_reg[11][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[1]), 
	.Q(reg_ctrl_timers_tl1_o[2]), 
	.D(n_906), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[11][3]  (.SE(DFT_sen), 
	.SD(DFT_sdi_2), 
	.Q(reg_ctrl_timers_tl1_o[3]), 
	.D(n_905), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[11][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[3]), 
	.Q(reg_ctrl_timers_tl1_o[4]), 
	.D(n_904), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[11][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[4]), 
	.Q(reg_ctrl_timers_tl1_o[5]), 
	.D(n_903), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[11][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[5]), 
	.Q(reg_ctrl_timers_tl1_o[6]), 
	.D(n_902), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[11][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[5]), 
	.Q(reg_ctrl_timers_tl1_o[7]), 
	.D(n_901), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[3]), 
	.Q(reg_ctrl_timers_th0_o[0]), 
	.D(n_900), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[0]), 
	.Q(reg_ctrl_timers_th0_o[1]), 
	.D(n_899), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[1]), 
	.Q(reg_ctrl_timers_th0_o[2]), 
	.D(n_898), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[2]), 
	.Q(reg_ctrl_timers_th0_o[3]), 
	.D(n_897), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[0]), 
	.Q(reg_ctrl_timers_th0_o[4]), 
	.D(n_896), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[4]), 
	.Q(reg_ctrl_timers_th0_o[5]), 
	.D(n_895), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[7]), 
	.Q(reg_ctrl_timers_th0_o[6]), 
	.D(n_894), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[12][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[5]), 
	.Q(reg_ctrl_timers_th0_o[7]), 
	.D(n_893), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[6]), 
	.Q(reg_ctrl_timers_th1_o[0]), 
	.D(n_892), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[7]), 
	.Q(reg_ctrl_timers_th1_o[1]), 
	.D(n_891), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[1]), 
	.Q(reg_ctrl_timers_th1_o[2]), 
	.D(n_890), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[5]), 
	.Q(reg_ctrl_timers_th1_o[3]), 
	.D(n_889), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[3]), 
	.Q(reg_ctrl_timers_th1_o[4]), 
	.D(n_888), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[2]), 
	.Q(reg_ctrl_timers_th1_o[5]), 
	.D(n_887), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[6]), 
	.Q(reg_ctrl_timers_th1_o[6]), 
	.D(n_886), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[13][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[0]), 
	.Q(reg_ctrl_timers_th1_o[7]), 
	.D(n_885), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[14][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[1]), 
	.Q(reg_ctrl_timers_tm0_o[0]), 
	.D(n_884), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[2]), 
	.Q(reg_ctrl_timers_tm0_o[1]), 
	.D(n_883), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[5]), 
	.Q(reg_ctrl_timers_tm0_o[2]), 
	.D(n_882), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[4]), 
	.Q(reg_ctrl_timers_tm0_o[3]), 
	.D(n_881), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[0]), 
	.Q(reg_ctrl_timers_tm0_o[4]), 
	.D(n_880), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[6]), 
	.Q(reg_ctrl_timers_tm0_o[5]), 
	.D(n_879), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[6]), 
	.Q(reg_ctrl_timers_tm0_o[6]), 
	.D(n_878), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[14][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[3]), 
	.Q(reg_ctrl_timers_tm0_o[7]), 
	.D(n_877), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[15][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[3]), 
	.Q(reg_ctrl_timers_tm1_o[0]), 
	.D(n_876), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[2]), 
	.Q(reg_ctrl_timers_tm1_o[1]), 
	.D(n_875), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th0_o[1]), 
	.Q(reg_ctrl_timers_tm1_o[2]), 
	.D(n_874), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[4]), 
	.Q(reg_ctrl_timers_tm1_o[3]), 
	.D(n_873), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[6]), 
	.Q(reg_ctrl_timers_tm1_o[4]), 
	.D(n_872), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl1_o[7]), 
	.Q(reg_ctrl_timers_tm1_o[5]), 
	.D(n_871), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm1_o[7]), 
	.Q(reg_ctrl_timers_tm1_o[6]), 
	.D(n_870), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[15][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tm0_o[7]), 
	.Q(reg_ctrl_timers_tm1_o[7]), 
	.D(n_869), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX2 \sfr_reg[16][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_th1_o[4]), 
	.Q(reg_ctrl_ports_p1_o[0]), 
	.D(n_868), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX2 \sfr_reg[16][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[0]), 
	.Q(reg_ctrl_ports_p1_o[1]), 
	.D(n_867), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX2 \sfr_reg[16][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[1]), 
	.Q(reg_ctrl_ports_p1_o[2]), 
	.D(n_866), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX2 \sfr_reg[16][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[2]), 
	.Q(reg_ctrl_ports_p1_o[3]), 
	.D(n_865), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX2 \sfr_reg[16][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[3]), 
	.Q(reg_ctrl_ports_p1_o[4]), 
	.D(n_864), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX2 \sfr_reg[16][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[4]), 
	.Q(reg_ctrl_ports_p1_o[5]), 
	.D(n_863), 
	.C(reg_ctrl_clk_i));
   SDFRQX2 \sfr_reg[16][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[5]), 
	.Q(reg_ctrl_ports_p1_o[6]), 
	.D(n_862), 
	.C(reg_ctrl_clk_i));
   SDFRQX2 \sfr_reg[16][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[6]), 
	.Q(reg_ctrl_ports_p1_o[7]), 
	.D(n_861), 
	.C(reg_ctrl_clk_i));
   SDFRQX0 \sfr_reg[17][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ti_o), 
	.Q(reg_ctrl_interrupt_ri_o), 
	.D(n_860), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[17][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_o[7]), 
	.Q(reg_ctrl_interrupt_ti_o), 
	.D(n_859), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[17][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_tb8_o), 
	.Q(\sfr[17][2] ), 
	.D(n_858), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[17][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_ren_o), 
	.Q(reg_ctrl_serial_tb8_o), 
	.D(n_857), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[17][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ri_o), 
	.Q(reg_ctrl_serial_ren_o), 
	.D(n_856), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX2 \sfr_reg[17][5]  (.SE(DFT_sen), 
	.SD(\sfr[17][2] ), 
	.Q(reg_ctrl_baudrate_sm2_o), 
	.D(n_855), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX2 \sfr_reg[17][6]  (.SE(DFT_sen), 
	.SD(DFT_sdi_3), 
	.Q(reg_ctrl_baudrate_sm1_o), 
	.D(n_854), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX2 \sfr_reg[17][7]  (.SE(DFT_sen), 
	.SD(\sfr[18][3] ), 
	.Q(reg_ctrl_baudrate_sm0_o), 
	.D(n_853), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[18][0]  (.SE(DFT_sen), 
	.SD(\sfr[18][5] ), 
	.Q(\sfr[18][0] ), 
	.D(n_852), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_sm1_o), 
	.Q(\sfr[18][1] ), 
	.D(n_851), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][2]  (.SE(DFT_sen), 
	.SD(\sfr[18][1] ), 
	.Q(\sfr[18][2] ), 
	.D(n_850), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][3]  (.SE(DFT_sen), 
	.SD(\sfr[18][0] ), 
	.Q(\sfr[18][3] ), 
	.D(n_849), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][4]  (.SE(DFT_sen), 
	.SD(\sfr[18][6] ), 
	.Q(\sfr[18][4] ), 
	.D(n_848), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[7]), 
	.Q(\sfr[18][5] ), 
	.D(n_847), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][6]  (.SE(DFT_sen), 
	.SD(\sfr[18][7] ), 
	.Q(\sfr[18][6] ), 
	.D(n_846), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[18][7]  (.SE(DFT_sen), 
	.SD(\sfr[18][2] ), 
	.Q(\sfr[18][7] ), 
	.D(n_845), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][0]  (.SE(DFT_sen), 
	.SD(\sfr[18][4] ), 
	.Q(reg_ctrl_serial_sbuf_tx_o[0]), 
	.D(n_844), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[2]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[1]), 
	.D(n_843), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[0]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[2]), 
	.D(n_842), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[1]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[3]), 
	.D(n_841), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[3]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[4]), 
	.D(n_840), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[4]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[5]), 
	.D(n_839), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[5]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[6]), 
	.D(n_838), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[19][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_serial_sbuf_tx_o[6]), 
	.Q(reg_ctrl_serial_sbuf_tx_o[7]), 
	.D(n_837), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[1][0]  (.SE(DFT_sen), 
	.SD(\sfr[1][3] ), 
	.Q(\sfr[1][0] ), 
	.D(n_836), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][1]  (.SE(DFT_sen), 
	.SD(\sfr[1][0] ), 
	.Q(\sfr[1][1] ), 
	.D(n_835), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][2]  (.SE(DFT_sen), 
	.SD(\sfr[1][1] ), 
	.Q(\sfr[1][2] ), 
	.D(n_834), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[5]), 
	.Q(\sfr[1][3] ), 
	.D(n_833), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][4]  (.SE(DFT_sen), 
	.SD(\sfr[1][5] ), 
	.Q(\sfr[1][4] ), 
	.D(n_832), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][5]  (.SE(DFT_sen), 
	.SD(\sfr[1][6] ), 
	.Q(\sfr[1][5] ), 
	.D(n_831), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[2]), 
	.Q(\sfr[1][6] ), 
	.D(n_830), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[1][7]  (.SE(DFT_sen), 
	.SD(\sfr[2][0] ), 
	.Q(\sfr[1][7] ), 
	.D(n_829), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[20][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[5]), 
	.Q(reg_ctrl_ports_p2_o[0]), 
	.D(n_828), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[3]), 
	.Q(reg_ctrl_ports_p2_o[1]), 
	.D(n_827), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[1]), 
	.Q(reg_ctrl_ports_p2_o[2]), 
	.D(n_826), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[0]), 
	.Q(reg_ctrl_ports_p2_o[3]), 
	.D(n_825), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[0]), 
	.Q(reg_ctrl_ports_p2_o[4]), 
	.D(n_824), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[4]), 
	.Q(reg_ctrl_ports_p2_o[5]), 
	.D(n_823), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[2]), 
	.Q(reg_ctrl_ports_p2_o[6]), 
	.D(n_822), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[20][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[6]), 
	.Q(reg_ctrl_ports_p2_o[7]), 
	.D(n_821), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX2 \sfr_reg[21][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[5]), 
	.Q(reg_ctrl_interrupt_ie_o[0]), 
	.D(n_820), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[21][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_sm0_o), 
	.Q(reg_ctrl_interrupt_ie_o[1]), 
	.D(n_819), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[21][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[1]), 
	.Q(FE_OFCN295_core_interrupt_ie_o_2_), 
	.D(n_818), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[21][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[4]), 
	.Q(reg_ctrl_interrupt_ie_o[3]), 
	.D(n_817), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[21][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[7]), 
	.Q(reg_ctrl_interrupt_ie_o[4]), 
	.D(n_816), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[21][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[6]), 
	.Q(reg_ctrl_interrupt_ie_o[5]), 
	.D(n_815), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[21][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[3]), 
	.Q(reg_ctrl_interrupt_ie_o[6]), 
	.D(n_814), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX2 \sfr_reg[21][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie_o[2]), 
	.Q(reg_ctrl_interrupt_ie_o[7]), 
	.D(n_813), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[22][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2_o[7]), 
	.Q(reg_ctrl_ports_p4_o[0]), 
	.D(n_812), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[0]), 
	.Q(reg_ctrl_ports_p4_o[1]), 
	.D(n_811), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[1]), 
	.Q(reg_ctrl_ports_p4_o[2]), 
	.D(n_810), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[2]), 
	.Q(reg_ctrl_ports_p4_o[3]), 
	.D(n_809), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[3]), 
	.Q(reg_ctrl_ports_p4_o[4]), 
	.D(n_808), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[4]), 
	.Q(reg_ctrl_ports_p4_o[5]), 
	.D(n_807), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[5]), 
	.Q(reg_ctrl_ports_p4_o[6]), 
	.D(n_806), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[22][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[6]), 
	.Q(reg_ctrl_ports_p4_o[7]), 
	.D(n_805), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX2 \sfr_reg[23][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p4_o[7]), 
	.Q(reg_ctrl_ports_p3_o[0]), 
	.D(n_804), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX2 \sfr_reg[23][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[0]), 
	.Q(reg_ctrl_ports_p3_o[1]), 
	.D(n_803), 
	.C(reg_ctrl_clk_i));
   SDFRQX2 \sfr_reg[23][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[1]), 
	.Q(reg_ctrl_interrupt_int0_o), 
	.D(n_802), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX2 \sfr_reg[23][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_int0_o), 
	.Q(reg_ctrl_interrupt_int1_o), 
	.D(n_801), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX2 \sfr_reg[23][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_int1_o), 
	.Q(reg_ctrl_ports_p3_o[4]), 
	.D(n_800), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX2 \sfr_reg[23][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[4]), 
	.Q(reg_ctrl_ports_p3_o[5]), 
	.D(n_799), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[23][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[5]), 
	.Q(reg_ctrl_ports_p3_o[6]), 
	.D(n_798), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[23][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[6]), 
	.Q(reg_ctrl_ports_p3_o[7]), 
	.D(n_797), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[24][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3_o[7]), 
	.Q(reg_ctrl_interrupt_ip_o[0]), 
	.D(n_796), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[24][1]  (.SE(DFT_sen), 
	.SD(\sfr[25][0] ), 
	.Q(reg_ctrl_interrupt_ip_o[1]), 
	.D(n_795), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[24][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[3]), 
	.Q(reg_ctrl_interrupt_ip_o[2]), 
	.D(n_794), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[24][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[4]), 
	.Q(reg_ctrl_interrupt_ip_o[3]), 
	.D(n_793), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[24][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[5]), 
	.Q(reg_ctrl_interrupt_ip_o[4]), 
	.D(n_792), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[24][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[1]), 
	.Q(reg_ctrl_interrupt_ip_o[5]), 
	.D(n_791), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[24][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[2]), 
	.Q(reg_ctrl_interrupt_ip_o[6]), 
	.D(n_790), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[24][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ip_o[6]), 
	.Q(\sfr[24][7] ), 
	.D(n_789), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[25][0]  (.SE(DFT_sen), 
	.SD(\sfr[25][1] ), 
	.Q(\sfr[25][0] ), 
	.D(n_788), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][1]  (.SE(DFT_sen), 
	.SD(\sfr[29][7] ), 
	.Q(\sfr[25][1] ), 
	.D(n_787), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][2]  (.SE(DFT_sen), 
	.SD(\sfr[25][3] ), 
	.Q(\sfr[25][2] ), 
	.D(n_786), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][3]  (.SE(DFT_sen), 
	.SD(\sfr[25][6] ), 
	.Q(\sfr[25][3] ), 
	.D(n_785), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][4]  (.SE(DFT_sen), 
	.SD(\sfr[28][4] ), 
	.Q(\sfr[25][4] ), 
	.D(n_784), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][5]  (.SE(DFT_sen), 
	.SD(\sfr[25][4] ), 
	.Q(\sfr[25][5] ), 
	.D(n_783), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][6]  (.SE(DFT_sen), 
	.SD(\sfr[25][5] ), 
	.Q(\sfr[25][6] ), 
	.D(n_782), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[25][7]  (.SE(DFT_sen), 
	.SD(\sfr[25][2] ), 
	.Q(\sfr[25][7] ), 
	.D(n_781), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[26][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[6]), 
	.Q(reg_ctrl_timers_tacpl_o[0]), 
	.D(n_780), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[26][1]  (.SE(DFT_sen), 
	.SD(\sfr[24][7] ), 
	.Q(reg_ctrl_timers_tacpl_o[1]), 
	.D(n_779), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[26][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[3]), 
	.Q(reg_ctrl_timers_tacpl_o[2]), 
	.D(n_778), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[26][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[4]), 
	.Q(reg_ctrl_timers_tacpl_o[3]), 
	.D(n_777), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[26][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[6]), 
	.Q(reg_ctrl_timers_tacpl_o[4]), 
	.D(n_776), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[26][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[1]), 
	.Q(reg_ctrl_timers_tacpl_o[5]), 
	.D(n_775), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[26][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[5]), 
	.Q(reg_ctrl_timers_tacpl_o[6]), 
	.D(n_774), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[26][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[2]), 
	.Q(reg_ctrl_timers_tacpl_o[7]), 
	.D(n_773), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[7]), 
	.Q(reg_ctrl_timers_tacph0_o[0]), 
	.D(n_772), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[2]), 
	.Q(reg_ctrl_timers_tacph0_o[1]), 
	.D(n_771), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[7]), 
	.Q(reg_ctrl_timers_tacph0_o[2]), 
	.D(n_770), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[1]), 
	.Q(reg_ctrl_timers_tacph0_o[3]), 
	.D(n_769), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[3]), 
	.Q(reg_ctrl_timers_tacph0_o[4]), 
	.D(n_768), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[0]), 
	.Q(reg_ctrl_timers_tacph0_o[5]), 
	.D(n_767), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[5]), 
	.Q(reg_ctrl_timers_tacph0_o[6]), 
	.D(n_766), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[27][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph0_o[4]), 
	.Q(reg_ctrl_timers_tacph0_o[7]), 
	.D(n_765), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[28][0]  (.SE(DFT_sen), 
	.SD(\sfr[28][3] ), 
	.Q(\sfr[28][0] ), 
	.D(n_764), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][1]  (.SE(DFT_sen), 
	.SD(\sfr[25][7] ), 
	.Q(\sfr[28][1] ), 
	.D(n_763), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][2]  (.SE(DFT_sen), 
	.SD(\sfr[28][7] ), 
	.Q(\sfr[28][2] ), 
	.D(n_762), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][3]  (.SE(DFT_sen), 
	.SD(\sfr[28][2] ), 
	.Q(\sfr[28][3] ), 
	.D(n_761), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][4]  (.SE(DFT_sen), 
	.SD(\sfr[28][0] ), 
	.Q(\sfr[28][4] ), 
	.D(n_760), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[4]), 
	.Q(\sfr[28][5] ), 
	.D(n_759), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][6]  (.SE(DFT_sen), 
	.SD(\sfr[28][5] ), 
	.Q(\sfr[28][6] ), 
	.D(n_758), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[28][7]  (.SE(DFT_sen), 
	.SD(\sfr[28][6] ), 
	.Q(\sfr[28][7] ), 
	.D(n_757), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[29][0]  (.SE(DFT_sen), 
	.SD(\sfr[28][1] ), 
	.Q(\sfr[29][0] ), 
	.D(n_756), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[29][1]  (.SE(DFT_sen), 
	.SD(\sfr[29][0] ), 
	.Q(\sfr[29][1] ), 
	.D(n_755), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[29][2]  (.SE(DFT_sen), 
	.SD(\sfr[29][1] ), 
	.Q(\sfr[29][2] ), 
	.D(n_754), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[29][3]  (.SE(DFT_sen), 
	.SD(\sfr[29][2] ), 
	.Q(\sfr[29][3] ), 
	.D(n_753), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[29][4]  (.SE(DFT_sen), 
	.SD(\sfr[29][3] ), 
	.Q(\sfr[29][4] ), 
	.D(n_752), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[29][5]  (.SE(DFT_sen), 
	.SD(\sfr[29][4] ), 
	.Q(\sfr[29][5] ), 
	.D(n_751), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[29][6]  (.SE(DFT_sen), 
	.SD(\sfr[29][5] ), 
	.Q(\sfr[29][6] ), 
	.D(n_750), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[29][7]  (.SE(DFT_sen), 
	.SD(\sfr[29][6] ), 
	.Q(\sfr[29][7] ), 
	.D(n_749), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[2][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[1]), 
	.Q(\sfr[2][0] ), 
	.D(n_748), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[2][1]  (.SE(DFT_sen), 
	.SD(\sfr[1][2] ), 
	.Q(\sfr[2][1] ), 
	.D(n_747), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[2][2]  (.SE(DFT_sen), 
	.SD(\sfr[2][6] ), 
	.Q(\sfr[2][2] ), 
	.D(n_746), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[2][3]  (.SE(DFT_sen), 
	.SD(\sfr[2][4] ), 
	.Q(\sfr[2][3] ), 
	.D(n_745), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[2][4]  (.SE(DFT_sen), 
	.SD(\sfr[2][5] ), 
	.Q(\sfr[2][4] ), 
	.D(n_744), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[2][5]  (.SE(DFT_sen), 
	.SD(\sfr[2][1] ), 
	.Q(\sfr[2][5] ), 
	.D(n_743), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[2][6]  (.SE(DFT_sen), 
	.SD(\sfr[2][3] ), 
	.Q(\sfr[2][6] ), 
	.D(n_742), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[2][7]  (.SE(DFT_sen), 
	.SD(\sfr[2][2] ), 
	.Q(\sfr[2][7] ), 
	.D(n_741), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[30][0]  (.SE(DFT_sen), 
	.SD(\sfr[30][1] ), 
	.Q(\sfr[30][0] ), 
	.D(n_740), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[30][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacpl_o[0]), 
	.Q(\sfr[30][1] ), 
	.D(n_739), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[30][2]  (.SE(DFT_sen), 
	.SD(\sfr[30][0] ), 
	.Q(\sfr[30][2] ), 
	.D(n_738), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[30][3]  (.SE(DFT_sen), 
	.SD(\sfr[30][2] ), 
	.Q(DFT_sdo_5), 
	.D(n_737), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[30][4]  (.SE(DFT_sen), 
	.SD(DFT_sdi_6), 
	.Q(\sfr[30][4] ), 
	.D(n_736), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[30][5]  (.SE(DFT_sen), 
	.SD(\sfr[30][6] ), 
	.Q(\sfr[30][5] ), 
	.D(n_735), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[30][6]  (.SE(DFT_sen), 
	.SD(\sfr[30][7] ), 
	.Q(\sfr[30][6] ), 
	.D(n_734), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[30][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_tf2_o), 
	.Q(\sfr[30][7] ), 
	.D(n_733), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[31][0]  (.SE(DFT_sen), 
	.SD(\sfr[31][5] ), 
	.Q(\sfr[31][0] ), 
	.D(n_732), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[31][1]  (.SE(DFT_sen), 
	.SD(\sfr[31][0] ), 
	.Q(\sfr[31][1] ), 
	.D(n_731), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[31][2]  (.SE(DFT_sen), 
	.SD(\sfr[31][3] ), 
	.Q(\sfr[31][2] ), 
	.D(n_730), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[31][3]  (.SE(DFT_sen), 
	.SD(\sfr[31][4] ), 
	.Q(\sfr[31][3] ), 
	.D(n_729), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[31][4]  (.SE(DFT_sen), 
	.SD(\sfr[31][7] ), 
	.Q(\sfr[31][4] ), 
	.D(n_728), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[31][5]  (.SE(DFT_sen), 
	.SD(\sfr[30][4] ), 
	.Q(\sfr[31][5] ), 
	.D(n_727), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[31][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfp_o[2]), 
	.Q(\sfr[31][6] ), 
	.D(n_726), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[31][7]  (.SE(DFT_sen), 
	.SD(\sfr[31][6] ), 
	.Q(\sfr[31][7] ), 
	.D(n_725), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \sfr_reg[32][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[1]), 
	.Q(reg_ctrl_ports_p0en_o[0]), 
	.D(n_724), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[2]), 
	.Q(reg_ctrl_ports_p0en_o[1]), 
	.D(n_723), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[3]), 
	.Q(reg_ctrl_ports_p0en_o[2]), 
	.D(n_722), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[4]), 
	.Q(reg_ctrl_ports_p0en_o[3]), 
	.D(n_721), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[6]), 
	.Q(reg_ctrl_ports_p0en_o[4]), 
	.D(n_720), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[7]), 
	.Q(reg_ctrl_ports_p0en_o[5]), 
	.D(n_719), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[5]), 
	.Q(reg_ctrl_ports_p0en_o[6]), 
	.D(n_718), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX2 \sfr_reg[32][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[7]), 
	.Q(reg_ctrl_ports_p0en_o[7]), 
	.D(n_717), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[33][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[5]), 
	.Q(reg_ctrl_ports_p1en_o[0]), 
	.D(n_716), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[33][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[4]), 
	.Q(reg_ctrl_ports_p1en_o[1]), 
	.D(n_715), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[33][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[1]), 
	.Q(reg_ctrl_ports_p1en_o[2]), 
	.D(n_714), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[33][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[2]), 
	.Q(reg_ctrl_ports_p1en_o[3]), 
	.D(n_713), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[33][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[6]), 
	.Q(reg_ctrl_ports_p1en_o[4]), 
	.D(n_712), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[33][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[3]), 
	.Q(reg_ctrl_ports_p1en_o[5]), 
	.D(n_711), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[33][6]  (.SE(DFT_sen), 
	.SD(\sfr[31][2] ), 
	.Q(reg_ctrl_ports_p1en_o[6]), 
	.D(n_710), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX2 \sfr_reg[33][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1en_o[0]), 
	.Q(reg_ctrl_ports_p1en_o[7]), 
	.D(n_709), 
	.C(top_clock_mem_i__L1_N4));
   SDFRQX0 \sfr_reg[34][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_alu_ov_o), 
	.Q(\sfr[34][0] ), 
	.D(n_708), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[34][1]  (.SE(DFT_sen), 
	.SD(\sfr[30][5] ), 
	.Q(\sfr[34][1] ), 
	.D(n_707), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[34][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_alu_ac_o), 
	.Q(reg_ctrl_alu_ov_o), 
	.D(n_706), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[34][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_psw_rs_o[1]), 
	.Q(reg_ctrl_fsm_psw_rs_o[0]), 
	.D(n_705), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[34][4]  (.SE(DFT_sen), 
	.SD(\sfr[34][5] ), 
	.Q(reg_ctrl_fsm_psw_rs_o[1]), 
	.D(n_704), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[34][5]  (.SE(DFT_sen), 
	.SD(\sfr[34][1] ), 
	.Q(\sfr[34][5] ), 
	.D(n_703), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[34][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_alu_cy_o), 
	.Q(reg_ctrl_alu_ac_o), 
	.D(n_702), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX2 \sfr_reg[34][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_psw_rs_o[0]), 
	.Q(reg_ctrl_alu_cy_o), 
	.D(n_701), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[35][0]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p4_a_o_5_), 
	.Q(reg_ctrl_timers_edgsel_o), 
	.D(n_700), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[35][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfp_o[1]), 
	.Q(reg_ctrl_timers_dfsel_o), 
	.D(n_699), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX2 \sfr_reg[35][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_dfsel_o), 
	.Q(reg_ctrl_timers_dfp_o[0]), 
	.D(n_698), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[35][3]  (.SE(DFT_sen), 
	.SD(\sfr[31][1] ), 
	.Q(reg_ctrl_timers_dfp_o[1]), 
	.D(n_697), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[35][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[5]), 
	.Q(reg_ctrl_timers_dfp_o[2]), 
	.D(n_696), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[35][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tr2_o), 
	.Q(reg_ctrl_interrupt_tf2_o), 
	.D(n_695), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[35][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_txrxf_o), 
	.Q(reg_ctrl_timers_tr2_o), 
	.D(n_694), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[35][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0en_o[0]), 
	.Q(reg_ctrl_interrupt_txrxf_o), 
	.D(n_693), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[36][0]  (.SE(DFT_sen), 
	.SD(\sfr[36][1] ), 
	.Q(\sfr[36][0] ), 
	.D(n_692), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[36][1]  (.SE(DFT_sen), 
	.SD(\sfr[34][0] ), 
	.Q(\sfr[36][1] ), 
	.D(n_691), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[36][2]  (.SE(DFT_sen), 
	.SD(\sfr[36][3] ), 
	.Q(\sfr[36][2] ), 
	.D(n_690), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[36][3]  (.SE(DFT_sen), 
	.SD(\sfr[36][0] ), 
	.Q(\sfr[36][3] ), 
	.D(n_689), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[36][4]  (.SE(DFT_sen), 
	.SD(\sfr[36][2] ), 
	.Q(\sfr[36][4] ), 
	.D(n_688), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[36][5]  (.SE(DFT_sen), 
	.SD(\sfr[36][4] ), 
	.Q(DFT_sdo_7), 
	.D(n_687), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[36][6]  (.SE(DFT_sen), 
	.SD(DFT_sdi_8), 
	.Q(\sfr[36][6] ), 
	.D(n_686), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[36][7]  (.SE(DFT_sen), 
	.SD(\sfr[36][6] ), 
	.Q(SPCASCAN_N11), 
	.D(n_685), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX2 \sfr_reg[37][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[4]), 
	.Q(reg_ctrl_ports_p2en_o[0]), 
	.D(n_684), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[37][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[2]), 
	.Q(reg_ctrl_ports_p2en_o[1]), 
	.D(n_683), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX2 \sfr_reg[37][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[5]), 
	.Q(reg_ctrl_ports_p2en_o[2]), 
	.D(n_682), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX2 \sfr_reg[37][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[1]), 
	.Q(reg_ctrl_ports_p2en_o[3]), 
	.D(n_681), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[37][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[7]), 
	.Q(reg_ctrl_ports_p2en_o[4]), 
	.D(n_680), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[37][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[0]), 
	.Q(reg_ctrl_ports_p2en_o[5]), 
	.D(n_679), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX2 \sfr_reg[37][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[3]), 
	.Q(reg_ctrl_ports_p2en_o[6]), 
	.D(n_678), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[37][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p2en_o[6]), 
	.Q(reg_ctrl_ports_p2en_o[7]), 
	.D(n_677), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[38][0]  (.SE(DFT_sen), 
	.SD(\sfr[38][1] ), 
	.Q(\sfr[38][0] ), 
	.D(n_676), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[38][1]  (.SE(DFT_sen), 
	.SD(\sfr[38][2] ), 
	.Q(\sfr[38][1] ), 
	.D(n_675), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[38][2]  (.SE(DFT_sen), 
	.SD(\sfr[38][3] ), 
	.Q(\sfr[38][2] ), 
	.D(n_674), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[38][3]  (.SE(DFT_sen), 
	.SD(\sfr[38][5] ), 
	.Q(\sfr[38][3] ), 
	.D(n_673), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[38][4]  (.SE(DFT_sen), 
	.SD(\sfr[38][6] ), 
	.Q(\sfr[38][4] ), 
	.D(n_672), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[38][5]  (.SE(DFT_sen), 
	.SD(\sfr[38][4] ), 
	.Q(\sfr[38][5] ), 
	.D(n_671), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[38][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p1_i[7]), 
	.Q(\sfr[38][6] ), 
	.D(n_670), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \sfr_reg[38][7]  (.SE(DFT_sen), 
	.SD(\sfr[38][0] ), 
	.Q(\sfr[38][7] ), 
	.D(n_669), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[39][0]  (.SE(DFT_sen), 
	.SD(\sfr[38][7] ), 
	.Q(reg_ctrl_ports_p3en_o[0]), 
	.D(n_668), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \sfr_reg[39][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[0]), 
	.Q(reg_ctrl_ports_p3en_o[1]), 
	.D(n_667), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \sfr_reg[39][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[4]), 
	.Q(reg_ctrl_ports_p3en_o[2]), 
	.D(n_666), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX2 \sfr_reg[39][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[0]), 
	.Q(reg_ctrl_ports_p3en_o[3]), 
	.D(n_665), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[39][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[5]), 
	.Q(reg_ctrl_ports_p3en_o[4]), 
	.D(n_664), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \sfr_reg[39][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[6]), 
	.Q(reg_ctrl_ports_p3en_o[5]), 
	.D(n_663), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX2 \sfr_reg[39][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[7]), 
	.Q(reg_ctrl_ports_p3en_o[6]), 
	.D(n_662), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX2 \sfr_reg[39][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[1]), 
	.Q(reg_ctrl_ports_p3en_o[7]), 
	.D(n_661), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][0]  (.SE(DFT_sen), 
	.SD(\sfr[2][7] ), 
	.Q(\sfr[3][0] ), 
	.D(n_660), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][1]  (.SE(DFT_sen), 
	.SD(\sfr[3][0] ), 
	.Q(\sfr[3][1] ), 
	.D(n_659), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][2]  (.SE(DFT_sen), 
	.SD(\sfr[3][6] ), 
	.Q(\sfr[3][2] ), 
	.D(n_658), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][3]  (.SE(DFT_sen), 
	.SD(\sfr[3][7] ), 
	.Q(\sfr[3][3] ), 
	.D(n_657), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][4]  (.SE(DFT_sen), 
	.SD(\sfr[3][5] ), 
	.Q(\sfr[3][4] ), 
	.D(n_656), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[4]), 
	.Q(\sfr[3][5] ), 
	.D(n_655), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][6]  (.SE(DFT_sen), 
	.SD(\sfr[3][3] ), 
	.Q(\sfr[3][6] ), 
	.D(n_654), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[3][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_fsm_data_o[7]), 
	.Q(\sfr[3][7] ), 
	.D(n_653), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[40][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[2]), 
	.Q(reg_ctrl_timers_tacph1_o[0]), 
	.D(n_652), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \sfr_reg[40][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[3]), 
	.Q(reg_ctrl_timers_tacph1_o[1]), 
	.D(n_651), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[40][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p3en_o[3]), 
	.Q(reg_ctrl_timers_tacph1_o[2]), 
	.D(n_650), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[40][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[2]), 
	.Q(reg_ctrl_timers_tacph1_o[3]), 
	.D(n_649), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[40][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[5]), 
	.Q(reg_ctrl_timers_tacph1_o[4]), 
	.D(n_648), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[40][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[6]), 
	.Q(reg_ctrl_timers_tacph1_o[5]), 
	.D(n_647), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[40][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[1]), 
	.Q(reg_ctrl_timers_tacph1_o[6]), 
	.D(n_646), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[40][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tacph1_o[4]), 
	.Q(reg_ctrl_timers_tacph1_o[7]), 
	.D(n_645), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[4][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_ports_p0_o[0]), 
	.Q(\sfr[4][0] ), 
	.D(n_644), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[4][1]  (.SE(DFT_sen), 
	.SD(\sfr[4][0] ), 
	.Q(\sfr[4][1] ), 
	.D(n_643), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[4][2]  (.SE(DFT_sen), 
	.SD(\sfr[4][1] ), 
	.Q(\sfr[4][2] ), 
	.D(n_642), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[4][3]  (.SE(DFT_sen), 
	.SD(\sfr[4][2] ), 
	.Q(\sfr[4][3] ), 
	.D(n_641), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[4][4]  (.SE(DFT_sen), 
	.SD(\sfr[4][3] ), 
	.Q(\sfr[4][4] ), 
	.D(n_640), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[4][5]  (.SE(DFT_sen), 
	.SD(\sfr[4][4] ), 
	.Q(\sfr[4][5] ), 
	.D(n_639), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[4][6]  (.SE(DFT_sen), 
	.SD(\sfr[4][5] ), 
	.Q(\sfr[4][6] ), 
	.D(n_638), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[4][7]  (.SE(DFT_sen), 
	.SD(\sfr[4][6] ), 
	.Q(DFT_sdo), 
	.D(n_637), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][0]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(\sfr[5][0] ), 
	.D(n_636), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][1]  (.SE(DFT_sen), 
	.SD(\sfr[5][6] ), 
	.Q(\sfr[5][1] ), 
	.D(n_635), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][2]  (.SE(DFT_sen), 
	.SD(\sfr[5][1] ), 
	.Q(\sfr[5][2] ), 
	.D(n_634), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][3]  (.SE(DFT_sen), 
	.SD(\sfr[5][2] ), 
	.Q(\sfr[5][3] ), 
	.D(n_633), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][4]  (.SE(DFT_sen), 
	.SD(\sfr[5][3] ), 
	.Q(\sfr[5][4] ), 
	.D(n_632), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][5]  (.SE(DFT_sen), 
	.SD(\sfr[5][4] ), 
	.Q(\sfr[5][5] ), 
	.D(n_631), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][6]  (.SE(DFT_sen), 
	.SD(\sfr[5][7] ), 
	.Q(\sfr[5][6] ), 
	.D(n_630), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[5][7]  (.SE(DFT_sen), 
	.SD(\sfr[5][0] ), 
	.Q(\sfr[5][7] ), 
	.D(n_629), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[6][0]  (.SE(DFT_sen), 
	.SD(\sfr[6][2] ), 
	.Q(\sfr[6][0] ), 
	.D(n_628), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[6][1]  (.SE(DFT_sen), 
	.SD(\sfr[6][0] ), 
	.Q(\sfr[6][1] ), 
	.D(n_627), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[6][2]  (.SE(DFT_sen), 
	.SD(\sfr[6][3] ), 
	.Q(\sfr[6][2] ), 
	.D(n_626), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[6][3]  (.SE(DFT_sen), 
	.SD(\sfr[6][6] ), 
	.Q(\sfr[6][3] ), 
	.D(n_625), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[6][4]  (.SE(DFT_sen), 
	.SD(\sfr[5][5] ), 
	.Q(\sfr[6][4] ), 
	.D(n_624), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[6][5]  (.SE(DFT_sen), 
	.SD(\sfr[6][4] ), 
	.Q(\sfr[6][5] ), 
	.D(n_623), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[6][6]  (.SE(DFT_sen), 
	.SD(\sfr[6][5] ), 
	.Q(\sfr[6][6] ), 
	.D(n_622), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[6][7]  (.SE(DFT_sen), 
	.SD(\sfr[6][1] ), 
	.Q(\sfr[6][7] ), 
	.D(n_621), 
	.C(top_clock_mem_i__L1_N5));
   SDFRQX0 \sfr_reg[7][0]  (.SE(DFT_sen), 
	.SD(\sfr[6][7] ), 
	.Q(\sfr[7][0] ), 
	.D(n_620), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[7][1]  (.SE(DFT_sen), 
	.SD(\sfr[7][0] ), 
	.Q(\sfr[7][1] ), 
	.D(n_619), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \sfr_reg[7][2]  (.SE(DFT_sen), 
	.SD(\sfr[7][1] ), 
	.Q(reg_ctrl_baudrate_rs232_o), 
	.D(n_618), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[7][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_smod_o), 
	.Q(\sfr[7][3] ), 
	.D(n_617), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[7][4]  (.SE(DFT_sen), 
	.SD(\sfr[7][3] ), 
	.Q(\sfr[7][4] ), 
	.D(n_616), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[7][5]  (.SE(DFT_sen), 
	.SD(\sfr[7][4] ), 
	.Q(\sfr[7][5] ), 
	.D(n_615), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[7][6]  (.SE(DFT_sen), 
	.SD(\sfr[7][5] ), 
	.Q(\sfr[7][6] ), 
	.D(n_614), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX2 \sfr_reg[7][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_baudrate_rs232_o), 
	.Q(reg_ctrl_baudrate_smod_o), 
	.D(n_613), 
	.C(top_clock_mem_i__L1_N6));
   SDFRQX0 \sfr_reg[8][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_ie1_o), 
	.Q(reg_ctrl_interrupt_it0_o), 
	.D(n_612), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[8][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_it1_o), 
	.Q(reg_ctrl_interrupt_ie0_o), 
	.D(n_611), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[8][2]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_it0_o), 
	.Q(reg_ctrl_interrupt_it1_o), 
	.D(n_610), 
	.C(top_clock_mem_i__L1_N7));
   SDFRQX0 \sfr_reg[8][3]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tr0_o), 
	.Q(reg_ctrl_interrupt_ie1_o), 
	.D(n_609), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[8][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tl0_o[7]), 
	.Q(reg_ctrl_timers_tr0_o), 
	.D(n_608), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[8][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_tr1_o), 
	.Q(reg_ctrl_interrupt_tf0_o), 
	.D(n_607), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[8][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m0_t0_o), 
	.Q(reg_ctrl_timers_tr1_o), 
	.D(n_606), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[8][7]  (.SE(DFT_sen), 
	.SD(reg_ctrl_interrupt_tf0_o), 
	.Q(reg_ctrl_interrupt_tf1_o), 
	.D(n_605), 
	.C(top_clock_mem_i__L1_N9));
   SDFRQX0 \sfr_reg[9][0]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m1_t0_o), 
	.Q(reg_ctrl_timers_m0_t0_o), 
	.D(n_604), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][1]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m0_t1_o), 
	.Q(reg_ctrl_timers_m1_t0_o), 
	.D(n_603), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][2]  (.SE(DFT_sen), 
	.SD(\sfr[9][6] ), 
	.Q(\sfr[9][2] ), 
	.D(n_602), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][3]  (.SE(DFT_sen), 
	.SD(\sfr[9][2] ), 
	.Q(reg_ctrl_timers_gate_t0_o), 
	.D(n_601), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][4]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_m1_t1_o), 
	.Q(reg_ctrl_timers_m0_t1_o), 
	.D(n_600), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][5]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_gate_t0_o), 
	.Q(reg_ctrl_timers_m1_t1_o), 
	.D(n_599), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][6]  (.SE(DFT_sen), 
	.SD(reg_ctrl_timers_gate_t1_o), 
	.Q(\sfr[9][6] ), 
	.D(n_598), 
	.C(top_clock_mem_i__L1_N2));
   SDFRQX0 \sfr_reg[9][7]  (.SE(DFT_sen), 
	.SD(\sfr[7][6] ), 
	.Q(reg_ctrl_timers_gate_t1_o), 
	.D(n_597), 
	.C(top_clock_mem_i__L1_N4));
   NO2I1X0 p22890A (.Q(n_935), 
	.B(n_200), 
	.AN(reg_ctrl_serial_load_sbuf_i));
   NA6X0 p15006A (.Q(n_934), 
	.F(n_591), 
	.E(n_592), 
	.D(n_593), 
	.C(n_594), 
	.B(n_595), 
	.A(n_596));
   NA6X0 p15017A22034 (.Q(n_933), 
	.F(n_585), 
	.E(n_586), 
	.D(n_587), 
	.C(n_588), 
	.B(n_589), 
	.A(n_590));
   NA6X0 p14927A (.Q(n_932), 
	.F(n_579), 
	.E(n_580), 
	.D(n_581), 
	.C(n_582), 
	.B(n_583), 
	.A(n_584));
   NA6X4 p15028A (.Q(n_931), 
	.F(n_573), 
	.E(n_574), 
	.D(n_575), 
	.C(n_576), 
	.B(n_577), 
	.A(n_578));
   NA6X0 p14959A (.Q(n_930), 
	.F(n_567), 
	.E(n_568), 
	.D(n_569), 
	.C(n_570), 
	.B(n_571), 
	.A(n_572));
   OR3X4 p15084A (.Q(n_929), 
	.C(n_564), 
	.B(n_565), 
	.A(n_566));
   NA6X1 p15017A (.Q(n_928), 
	.F(n_558), 
	.E(n_559), 
	.D(n_560), 
	.C(n_561), 
	.B(n_562), 
	.A(n_563));
   NA6X0 p14981A (.Q(n_927), 
	.F(n_552), 
	.E(n_553), 
	.D(n_554), 
	.C(n_555), 
	.B(n_556), 
	.A(n_557));
   NO2X0 p16048A (.Q(n_926), 
	.B(n_551), 
	.A(reg_ctrl_interrupt_ti_o));
   AO32X0 p17167A (.Q(n_925), 
	.E(reg_ctrl_serial_tx_o), 
	.D(n_200), 
	.C(n_549), 
	.B(n_550), 
	.A(reg_ctrl_reset_b_i));
   AO221X0 p5080A (.Q(n_924), 
	.E(n_546), 
	.D(reg_ctrl_ports_p0_o[0]), 
	.C(n_547), 
	.B(reg_ctrl_bus_ctrl_p0_i[0]), 
	.A(n_548));
   AO221X0 p5080A22035 (.Q(n_923), 
	.E(n_544), 
	.D(reg_ctrl_ports_p0_o[1]), 
	.C(n_545), 
	.B(reg_ctrl_bus_ctrl_p0_i[1]), 
	.A(n_548));
   AO221X0 p5080A22036 (.Q(n_922), 
	.E(n_542), 
	.D(reg_ctrl_ports_p0_o[2]), 
	.C(n_543), 
	.B(reg_ctrl_bus_ctrl_p0_i[2]), 
	.A(n_548));
   AO221X0 p5080A22037 (.Q(n_921), 
	.E(n_540), 
	.D(reg_ctrl_ports_p0_o[3]), 
	.C(n_541), 
	.B(reg_ctrl_bus_ctrl_p0_i[3]), 
	.A(n_548));
   AO221X0 p5080A22038 (.Q(n_920), 
	.E(n_538), 
	.D(reg_ctrl_ports_p0_o[4]), 
	.C(n_539), 
	.B(reg_ctrl_bus_ctrl_p0_i[4]), 
	.A(n_548));
   AO221X0 p5080A22039 (.Q(n_919), 
	.E(n_536), 
	.D(reg_ctrl_ports_p0_o[5]), 
	.C(n_537), 
	.B(reg_ctrl_bus_ctrl_p0_i[5]), 
	.A(n_548));
   AO221X0 p5080A22040 (.Q(n_918), 
	.E(n_534), 
	.D(reg_ctrl_ports_p0_o[6]), 
	.C(n_535), 
	.B(reg_ctrl_bus_ctrl_p0_i[6]), 
	.A(n_548));
   AO221X0 p5080A22041 (.Q(n_917), 
	.E(n_532), 
	.D(reg_ctrl_ports_p0_o[7]), 
	.C(n_533), 
	.B(reg_ctrl_bus_ctrl_p0_i[7]), 
	.A(n_548));
   AO22X0 p15179A (.Q(n_916), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[0]));
   AO22X0 p15179A22484 (.Q(n_915), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[1]));
   AO22X0 p15179A22486 (.Q(n_914), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[2]));
   AO22X0 p15179A22490 (.Q(n_913), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[3]));
   AO22X0 p15179A22492 (.Q(n_912), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[4]));
   AO22X0 p15179A22494 (.Q(n_911), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[5]));
   AO22X0 p15179A22498 (.Q(n_910), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[6]));
   AO22X0 p15179A22500 (.Q(n_909), 
	.D(n_530), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_531), 
	.A(reg_ctrl_timers_tl0_i[7]));
   AO22X0 p15179A22501 (.Q(n_908), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[0]));
   AO22X0 p15179A22502 (.Q(n_907), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[1]));
   AO22X0 p15179A22503 (.Q(n_906), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[2]));
   AO22X0 p15179A22504 (.Q(n_905), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[3]));
   AO22X0 p15179A22505 (.Q(n_904), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[4]));
   AO22X0 p15179A22510 (.Q(n_903), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[5]));
   AO22X0 p15179A22512 (.Q(n_902), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[6]));
   AO22X0 p15179A22515 (.Q(n_901), 
	.D(n_528), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_529), 
	.A(reg_ctrl_timers_tl1_i[7]));
   AO22X0 p15119A22644 (.Q(n_900), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[0]));
   AO22X0 p15119A22645 (.Q(n_899), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[1]));
   AO22X0 p15119A22647 (.Q(n_898), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[2]));
   AO22X0 p15119A (.Q(n_897), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[3]));
   AO22X0 p15119A22648 (.Q(n_896), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[4]));
   AO22X0 p15119A22664 (.Q(n_895), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[5]));
   AO22X0 p15119A22651 (.Q(n_894), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[6]));
   AO22X0 p15119A22652 (.Q(n_893), 
	.D(n_526), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_527), 
	.A(reg_ctrl_timers_th0_i[7]));
   AO22X0 p15119A22653 (.Q(n_892), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[0]));
   AO22X0 p15119A22657 (.Q(n_891), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[1]));
   AO22X0 p15119A22658 (.Q(n_890), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[2]));
   AO22X0 p15119A22659 (.Q(n_889), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[3]));
   AO22X0 p15119A22660 (.Q(n_888), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[4]));
   AO22X0 p15119A22661 (.Q(n_887), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[5]));
   AO22X0 p15119A22662 (.Q(n_886), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[6]));
   AO22X0 p15119A22663 (.Q(n_885), 
	.D(n_524), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_525), 
	.A(reg_ctrl_timers_th1_i[7]));
   AO22X0 p15179A22523 (.Q(n_884), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[0]));
   AO22X0 p15179A22524 (.Q(n_883), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[1]));
   AO22X0 p15179A22525 (.Q(n_882), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[2]));
   AO22X0 p15179A22526 (.Q(n_881), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[3]));
   AO22X0 p15179A22527 (.Q(n_880), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[4]));
   AO22X0 p15179A22528 (.Q(n_879), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[5]));
   AO22X0 p15179A22529 (.Q(n_878), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[6]));
   AO22X0 p15179A22530 (.Q(n_877), 
	.D(n_522), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_523), 
	.A(reg_ctrl_timers_tm0_i[7]));
   AO22X0 p15149A (.Q(n_876), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[0]));
   AO22X0 p15149A22531 (.Q(n_875), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[1]));
   AO22X0 p15149A22532 (.Q(n_874), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[2]));
   AO22X0 p15149A22533 (.Q(n_873), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[3]));
   AO22X0 p15149A22534 (.Q(n_872), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[4]));
   AO22X0 p15149A22535 (.Q(n_871), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[5]));
   AO22X0 p15149A22536 (.Q(n_870), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[6]));
   AO22X0 p15149A22537 (.Q(n_869), 
	.D(n_520), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_521), 
	.A(reg_ctrl_timers_tm1_i[7]));
   AO321X0 p15141A (.Q(n_868), 
	.F(n_517), 
	.E(reg_ctrl_ports_p1_o[0]), 
	.D(n_518), 
	.C(reg_ctrl_ports_p1en_o[0]), 
	.B(reg_ctrl_fsm_data_i[0]), 
	.A(n_519));
   AO321X0 p15141A22142 (.Q(n_867), 
	.F(n_515), 
	.E(reg_ctrl_ports_p1_o[1]), 
	.D(n_516), 
	.C(reg_ctrl_ports_p1en_o[1]), 
	.B(reg_ctrl_fsm_data_i[1]), 
	.A(n_519));
   AO321X0 p15088A (.Q(n_866), 
	.F(n_513), 
	.E(reg_ctrl_ports_p1_o[2]), 
	.D(n_514), 
	.C(reg_ctrl_ports_p1en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_519));
   AO321X0 p15141A22143 (.Q(n_865), 
	.F(n_511), 
	.E(reg_ctrl_ports_p1_o[3]), 
	.D(n_512), 
	.C(reg_ctrl_ports_p1en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_519));
   AO321X0 p15141A22144 (.Q(n_864), 
	.F(n_509), 
	.E(reg_ctrl_ports_p1_o[4]), 
	.D(n_510), 
	.C(reg_ctrl_ports_p1en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_519));
   AO321X0 p15141A22145 (.Q(n_863), 
	.F(n_507), 
	.E(reg_ctrl_ports_p1_o[5]), 
	.D(n_508), 
	.C(reg_ctrl_ports_p1en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_519));
   AO321X0 p15141A22146 (.Q(n_862), 
	.F(n_505), 
	.E(reg_ctrl_ports_p1_o[6]), 
	.D(n_506), 
	.C(reg_ctrl_ports_p1en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_519));
   AO321X0 p15088A22147 (.Q(n_861), 
	.F(n_503), 
	.E(reg_ctrl_ports_p1_o[7]), 
	.D(n_504), 
	.C(reg_ctrl_ports_p1en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_519));
   ON22X0 p16305A (.Q(n_860), 
	.D(n_499), 
	.C(n_52), 
	.B(n_501), 
	.A(n_502));
   ON22X0 p16305A22666 (.Q(n_859), 
	.D(n_499), 
	.C(n_51), 
	.B(n_501), 
	.A(n_500));
   AO22X0 p15527A (.Q(n_858), 
	.D(n_497), 
	.C(\sfr[17][2] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_rb8_i));
   AO22X0 p15775A22667 (.Q(n_857), 
	.D(n_495), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_496), 
	.A(reg_ctrl_serial_tb8_o));
   AO22X0 p15775A22668 (.Q(n_856), 
	.D(n_495), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_496), 
	.A(reg_ctrl_serial_ren_o));
   AO22X0 p15762A22669 (.Q(n_855), 
	.D(n_495), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_496), 
	.A(reg_ctrl_baudrate_sm2_o));
   AO22X0 p15775A22670 (.Q(n_854), 
	.D(n_495), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_496), 
	.A(reg_ctrl_baudrate_sm1_o));
   AO22X0 p16030A (.Q(n_853), 
	.D(n_495), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_496), 
	.A(reg_ctrl_baudrate_sm0_o));
   AO22X0 p15910A (.Q(n_852), 
	.D(n_497), 
	.C(\sfr[18][0] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[0]));
   AO22X0 p15910A22749 (.Q(n_851), 
	.D(n_497), 
	.C(\sfr[18][1] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[1]));
   AO22X0 p15910A22757 (.Q(n_850), 
	.D(n_497), 
	.C(\sfr[18][2] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[2]));
   AO22X0 p15910A22750 (.Q(n_849), 
	.D(n_497), 
	.C(\sfr[18][3] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[3]));
   AO22X0 p15910A22752 (.Q(n_848), 
	.D(n_497), 
	.C(\sfr[18][4] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[4]));
   AO22X0 p15910A22753 (.Q(n_847), 
	.D(n_497), 
	.C(\sfr[18][5] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[5]));
   AO22X0 p15910A22754 (.Q(n_846), 
	.D(n_497), 
	.C(\sfr[18][6] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[6]));
   AO22X0 p15910A22755 (.Q(n_845), 
	.D(n_497), 
	.C(\sfr[18][7] ), 
	.B(n_498), 
	.A(reg_ctrl_serial_sbuf_rx_i[7]));
   AO22X0 p15674A22671 (.Q(n_844), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[0]));
   AO22X0 p15620A (.Q(n_843), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[1]));
   AO22X0 p15620A22672 (.Q(n_842), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[2]));
   AO22X0 p15620A22673 (.Q(n_841), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[3]));
   AO22X0 p15620A22675 (.Q(n_840), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[4]));
   AO22X0 p15620A22676 (.Q(n_839), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[5]));
   AO22X0 p15620A22677 (.Q(n_838), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[6]));
   AO22X0 p15674A22678 (.Q(n_837), 
	.D(n_493), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_494), 
	.A(reg_ctrl_serial_sbuf_tx_o[7]));
   ON211X0 p16015A (.Q(n_836), 
	.D(n_491), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_52), 
	.A(n_492));
   ON211X0 p16015A22566 (.Q(n_835), 
	.D(n_490), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_51), 
	.A(n_492));
   ON211X0 p16015A22567 (.Q(n_834), 
	.D(n_488), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_489), 
	.A(n_492));
   AO22X0 p15775A22680 (.Q(n_833), 
	.D(n_486), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_487), 
	.A(\sfr[1][3] ));
   AO22X0 p15775A22681 (.Q(n_832), 
	.D(n_486), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_487), 
	.A(\sfr[1][4] ));
   AO22X0 p15775A22682 (.Q(n_831), 
	.D(n_486), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_487), 
	.A(\sfr[1][5] ));
   AO22X0 p15775A22683 (.Q(n_830), 
	.D(n_486), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_487), 
	.A(\sfr[1][6] ));
   AO22X0 p15775A22684 (.Q(n_829), 
	.D(n_486), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_487), 
	.A(\sfr[1][7] ));
   ON321X0 p5558A22132 (.Q(n_828), 
	.F(n_481), 
	.E(n_482), 
	.D(n_483), 
	.C(reg_ctrl_ports_p2en_o[0]), 
	.B(n_484), 
	.A(n_485));
   ON321X0 p5558A22133 (.Q(n_827), 
	.F(n_477), 
	.E(n_478), 
	.D(n_479), 
	.C(reg_ctrl_ports_p2en_o[1]), 
	.B(n_484), 
	.A(n_480));
   ON321X0 p5558A22134 (.Q(n_826), 
	.F(n_473), 
	.E(n_474), 
	.D(n_475), 
	.C(reg_ctrl_ports_p2en_o[2]), 
	.B(n_484), 
	.A(n_476));
   ON321X0 p5558A22135 (.Q(n_825), 
	.F(n_469), 
	.E(n_470), 
	.D(n_471), 
	.C(reg_ctrl_ports_p2en_o[3]), 
	.B(n_484), 
	.A(n_472));
   ON321X0 p5558A22136 (.Q(n_824), 
	.F(n_465), 
	.E(n_466), 
	.D(n_467), 
	.C(reg_ctrl_ports_p2en_o[4]), 
	.B(n_484), 
	.A(n_468));
   ON321X0 p5558A22137 (.Q(n_823), 
	.F(n_461), 
	.E(n_462), 
	.D(n_463), 
	.C(reg_ctrl_ports_p2en_o[5]), 
	.B(n_484), 
	.A(n_464));
   ON321X0 p5558A22138 (.Q(n_822), 
	.F(n_457), 
	.E(n_458), 
	.D(n_459), 
	.C(reg_ctrl_ports_p2en_o[6]), 
	.B(n_484), 
	.A(n_460));
   ON321X0 p5558A (.Q(n_821), 
	.F(n_453), 
	.E(n_454), 
	.D(n_455), 
	.C(reg_ctrl_ports_p2en_o[7]), 
	.B(n_484), 
	.A(n_456));
   AO22X0 p16685A (.Q(n_820), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[0]));
   AO22X0 p16685A22576 (.Q(n_819), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[1]));
   AO22X0 p16685A22577 (.Q(n_818), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[2]));
   AO22X0 p16685A22578 (.Q(n_817), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[3]));
   AO22X0 p16685A22579 (.Q(n_816), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[4]));
   AO22X0 p16685A22580 (.Q(n_815), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[5]));
   AO22X0 p16685A22581 (.Q(n_814), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[6]));
   AO22X0 p16347A (.Q(n_813), 
	.D(n_451), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_452), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   AO222X0 p4998A (.Q(n_812), 
	.F(reg_ctrl_fsm_data_i[0]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[0]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[0]), 
	.A(n_450));
   AO222X0 p4998A22148 (.Q(n_811), 
	.F(reg_ctrl_fsm_data_i[1]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[1]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[1]), 
	.A(n_450));
   AO222X0 p4998A22149 (.Q(n_810), 
	.F(reg_ctrl_fsm_data_i[2]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[2]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[2]), 
	.A(n_450));
   AO222X0 p4998A22150 (.Q(n_809), 
	.F(reg_ctrl_fsm_data_i[3]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[3]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[3]), 
	.A(n_450));
   AO222X0 p4998A22151 (.Q(n_808), 
	.F(reg_ctrl_fsm_data_i[4]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[4]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[4]), 
	.A(n_450));
   AO222X0 p4998A22152 (.Q(n_807), 
	.F(reg_ctrl_fsm_data_i[5]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[5]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[5]), 
	.A(n_450));
   AO222X0 p4998A22153 (.Q(n_806), 
	.F(reg_ctrl_fsm_data_i[6]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[6]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[6]), 
	.A(n_450));
   AO222X0 p4998A22154 (.Q(n_805), 
	.F(reg_ctrl_fsm_data_i[7]), 
	.E(n_448), 
	.D(reg_ctrl_bus_ctrl_p4_i[7]), 
	.C(n_449), 
	.B(reg_ctrl_ports_p4_o[7]), 
	.A(n_450));
   ON222X0 p15348A (.Q(n_804), 
	.F(reg_ctrl_reset_b_i), 
	.E(n_444), 
	.D(FE_PT1_top_p3_en_o_0_), 
	.C(n_446), 
	.B(reg_ctrl_ports_p3en_o[0]), 
	.A(n_447));
   ON222X0 p14958A (.Q(n_803), 
	.F(reg_ctrl_reset_b_i), 
	.E(n_440), 
	.D(FE_PT1_top_p3_en_o_1_), 
	.C(n_442), 
	.B(reg_ctrl_ports_p3en_o[1]), 
	.A(n_443));
   AO321X0 p15027A (.Q(n_802), 
	.F(n_437), 
	.E(reg_ctrl_interrupt_int0_o), 
	.D(n_438), 
	.C(reg_ctrl_ports_p3en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_439));
   AO321X0 p15003A (.Q(n_801), 
	.F(n_435), 
	.E(reg_ctrl_interrupt_int1_o), 
	.D(n_436), 
	.C(reg_ctrl_ports_p3en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_439));
   AO321X0 p15027A22140 (.Q(n_800), 
	.F(n_433), 
	.E(reg_ctrl_ports_p3_o[4]), 
	.D(n_434), 
	.C(reg_ctrl_ports_p3en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_439));
   AO321X0 p15027A22141 (.Q(n_799), 
	.F(n_431), 
	.E(reg_ctrl_ports_p3_o[5]), 
	.D(n_432), 
	.C(reg_ctrl_ports_p3en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_439));
   ON21X0 p5794A (.Q(n_798), 
	.C(n_429), 
	.B(n_171), 
	.A(n_430));
   ON21X0 p5817A (.Q(n_797), 
	.C(n_427), 
	.B(n_171), 
	.A(n_428));
   AO22X0 p16685A22583 (.Q(n_796), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[0]));
   AO22X0 p16685A22584 (.Q(n_795), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[1]));
   AO22X0 p16685A22585 (.Q(n_794), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[2]));
   AO22X0 p16685A22586 (.Q(n_793), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[3]));
   AO22X0 p16685A22587 (.Q(n_792), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[4]));
   AO22X0 p16685A22588 (.Q(n_791), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[5]));
   AO22X0 p16685A22589 (.Q(n_790), 
	.D(n_425), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_426), 
	.A(reg_ctrl_interrupt_ip_o[6]));
   AND2X0 p16116A22697 (.Q(n_789), 
	.B(n_426), 
	.A(\sfr[24][7] ));
   AO22X0 p15775A22590 (.Q(n_788), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_424), 
	.A(\sfr[25][0] ));
   AO22X0 p15775A22591 (.Q(n_787), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_424), 
	.A(\sfr[25][1] ));
   AO22X0 p15775A22592 (.Q(n_786), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_424), 
	.A(\sfr[25][2] ));
   AO22X0 p15775A22593 (.Q(n_785), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_424), 
	.A(\sfr[25][3] ));
   AO22X0 p15775A22594 (.Q(n_784), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_424), 
	.A(\sfr[25][4] ));
   AO22X0 p15775A22595 (.Q(n_783), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_424), 
	.A(\sfr[25][5] ));
   AO22X0 p15775A22596 (.Q(n_782), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_424), 
	.A(\sfr[25][6] ));
   AO22X0 p15775A22597 (.Q(n_781), 
	.D(n_423), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_424), 
	.A(\sfr[25][7] ));
   AO22X0 p15775A22431 (.Q(n_780), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[0]));
   AO22X0 p15775A22432 (.Q(n_779), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[1]));
   AO22X0 p15775A22433 (.Q(n_778), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[2]));
   AO22X0 p15775A22434 (.Q(n_777), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[3]));
   AO22X0 p15775A22435 (.Q(n_776), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[4]));
   AO22X0 p15775A22436 (.Q(n_775), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[5]));
   AO22X0 p15775A22437 (.Q(n_774), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[6]));
   AO22X0 p15775A22438 (.Q(n_773), 
	.D(n_421), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_422), 
	.A(reg_ctrl_timers_tacpl_o[7]));
   AO22X0 p15775A22439 (.Q(n_772), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[0]));
   AO22X0 p15775A22440 (.Q(n_771), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[1]));
   AO22X0 p15775A22441 (.Q(n_770), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[2]));
   AO22X0 p15775A22442 (.Q(n_769), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[3]));
   AO22X0 p15775A22443 (.Q(n_768), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[4]));
   AO22X0 p15775A22444 (.Q(n_767), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[5]));
   AO22X0 p15775A22445 (.Q(n_766), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[6]));
   AO22X0 p15775A22446 (.Q(n_765), 
	.D(n_419), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_420), 
	.A(reg_ctrl_timers_tacph0_o[7]));
   AO22X0 p15775A22598 (.Q(n_764), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_418), 
	.A(\sfr[28][0] ));
   AO22X0 p15775A22599 (.Q(n_763), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_418), 
	.A(\sfr[28][1] ));
   AO22X0 p15775A22600 (.Q(n_762), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_418), 
	.A(\sfr[28][2] ));
   AO22X0 p15775A22601 (.Q(n_761), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_418), 
	.A(\sfr[28][3] ));
   AO22X0 p15775A22602 (.Q(n_760), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_418), 
	.A(\sfr[28][4] ));
   AO22X0 p15775A22603 (.Q(n_759), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_418), 
	.A(\sfr[28][5] ));
   AO22X0 p15775A22604 (.Q(n_758), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_418), 
	.A(\sfr[28][6] ));
   AO22X0 p15775A22605 (.Q(n_757), 
	.D(n_417), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_418), 
	.A(\sfr[28][7] ));
   AO22X0 p15775A22606 (.Q(n_756), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_416), 
	.A(\sfr[29][0] ));
   AO22X0 p15775A22607 (.Q(n_755), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_416), 
	.A(\sfr[29][1] ));
   AO22X0 p15775A22608 (.Q(n_754), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_416), 
	.A(\sfr[29][2] ));
   AO22X0 p15775A22609 (.Q(n_753), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_416), 
	.A(\sfr[29][3] ));
   AO22X0 p15775A22610 (.Q(n_752), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_416), 
	.A(\sfr[29][4] ));
   AO22X0 p15775A22611 (.Q(n_751), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_416), 
	.A(\sfr[29][5] ));
   AO22X0 p15775A22612 (.Q(n_750), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_416), 
	.A(\sfr[29][6] ));
   AO22X0 p15775A22613 (.Q(n_749), 
	.D(n_415), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_416), 
	.A(\sfr[29][7] ));
   AO22X0 p15775A22447 (.Q(n_748), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_414), 
	.A(\sfr[2][0] ));
   AO22X0 p15775A22448 (.Q(n_747), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_414), 
	.A(\sfr[2][1] ));
   AO22X0 p15775A22449 (.Q(n_746), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_414), 
	.A(\sfr[2][2] ));
   AO22X0 p15775A22450 (.Q(n_745), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_414), 
	.A(\sfr[2][3] ));
   AO22X0 p15775A22451 (.Q(n_744), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_414), 
	.A(\sfr[2][4] ));
   AO22X0 p15775A22452 (.Q(n_743), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_414), 
	.A(\sfr[2][5] ));
   AO22X0 p15775A22453 (.Q(n_742), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_414), 
	.A(\sfr[2][6] ));
   AO22X0 p15775A22454 (.Q(n_741), 
	.D(n_413), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_414), 
	.A(\sfr[2][7] ));
   AO22X0 p15775A22455 (.Q(n_740), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_412), 
	.A(\sfr[30][0] ));
   AO22X0 p15775A22456 (.Q(n_739), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_412), 
	.A(\sfr[30][1] ));
   AO22X0 p15775A22457 (.Q(n_738), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_412), 
	.A(\sfr[30][2] ));
   AO22X0 p15775A22458 (.Q(n_737), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_412), 
	.A(DFT_sdo_5));
   AO22X0 p15775A22459 (.Q(n_736), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_412), 
	.A(\sfr[30][4] ));
   AO22X0 p15775A22460 (.Q(n_735), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_412), 
	.A(\sfr[30][5] ));
   AO22X0 p15775A22461 (.Q(n_734), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_412), 
	.A(\sfr[30][6] ));
   AO22X0 p15775A22462 (.Q(n_733), 
	.D(n_411), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_412), 
	.A(\sfr[30][7] ));
   AO22X0 p15775A22463 (.Q(n_732), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_410), 
	.A(\sfr[31][0] ));
   AO22X0 p15775A22464 (.Q(n_731), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_410), 
	.A(\sfr[31][1] ));
   AO22X0 p15775A22465 (.Q(n_730), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_410), 
	.A(\sfr[31][2] ));
   AO22X0 p15775A22466 (.Q(n_729), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_410), 
	.A(\sfr[31][3] ));
   AO22X0 p15775A22467 (.Q(n_728), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_410), 
	.A(\sfr[31][4] ));
   AO22X0 p15775A22468 (.Q(n_727), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_410), 
	.A(\sfr[31][5] ));
   AO22X0 p15775A22469 (.Q(n_726), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_410), 
	.A(\sfr[31][6] ));
   AO22X0 p15775A22470 (.Q(n_725), 
	.D(n_409), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_410), 
	.A(\sfr[31][7] ));
   AO222X0 p5206A (.Q(n_724), 
	.F(reg_ctrl_fsm_data_i[0]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[0]), 
	.B(reg_ctrl_ports_p0en_o[0]), 
	.A(n_408));
   AO222X0 p5206A22155 (.Q(n_723), 
	.F(reg_ctrl_fsm_data_i[1]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[1]), 
	.B(reg_ctrl_ports_p0en_o[1]), 
	.A(n_408));
   AO222X0 p5206A22156 (.Q(n_722), 
	.F(reg_ctrl_fsm_data_i[2]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[2]), 
	.B(reg_ctrl_ports_p0en_o[2]), 
	.A(n_408));
   AO222X0 p5206A22157 (.Q(n_721), 
	.F(reg_ctrl_fsm_data_i[3]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[3]), 
	.B(reg_ctrl_ports_p0en_o[3]), 
	.A(n_408));
   AO222X0 p5206A22158 (.Q(n_720), 
	.F(reg_ctrl_fsm_data_i[4]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[4]), 
	.B(reg_ctrl_ports_p0en_o[4]), 
	.A(n_408));
   AO222X0 p5206A22159 (.Q(n_719), 
	.F(reg_ctrl_fsm_data_i[5]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[5]), 
	.B(reg_ctrl_ports_p0en_o[5]), 
	.A(n_408));
   AO222X0 p5206A22160 (.Q(n_718), 
	.F(reg_ctrl_fsm_data_i[6]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[6]), 
	.B(reg_ctrl_ports_p0en_o[6]), 
	.A(n_408));
   AO222X0 p5206A22161 (.Q(n_717), 
	.F(reg_ctrl_fsm_data_i[7]), 
	.E(n_406), 
	.D(n_407), 
	.C(reg_ctrl_bus_ctrl_p0en_i[7]), 
	.B(reg_ctrl_ports_p0en_o[7]), 
	.A(n_408));
   AO22X0 p15732A (.Q(n_716), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[0]));
   AO22X0 p15732A22615 (.Q(n_715), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[1]));
   AO22X0 p15721A (.Q(n_714), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[2]));
   AO22X0 p15732A22616 (.Q(n_713), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[3]));
   AO22X0 p15732A22617 (.Q(n_712), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[4]));
   AO22X0 p15732A22665 (.Q(n_711), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[5]));
   AO22X0 p15732A22618 (.Q(n_710), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[6]));
   AO22X0 p15721A22619 (.Q(n_709), 
	.D(n_404), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_405), 
	.A(reg_ctrl_ports_p1en_o[7]));
   NO2I1X0 p15379A (.Q(n_708), 
	.B(n_403), 
	.AN(reg_ctrl_reset_b_i));
   AND2X0 p16116A (.Q(n_707), 
	.B(n_402), 
	.A(\sfr[34][1] ));
   AO22X0 p4097A (.Q(n_706), 
	.D(n_401), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_402), 
	.A(reg_ctrl_alu_ov_i));
   AO22X0 p15830A (.Q(n_705), 
	.D(n_401), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_402), 
	.A(reg_ctrl_fsm_psw_rs_o[0]));
   AO22X0 p15830A22279 (.Q(n_704), 
	.D(n_401), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_402), 
	.A(reg_ctrl_fsm_psw_rs_o[1]));
   AO22X0 p15775A (.Q(n_703), 
	.D(n_401), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_402), 
	.A(\sfr[34][5] ));
   AO22X0 p5596A (.Q(n_702), 
	.D(n_401), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_402), 
	.A(reg_ctrl_alu_ac_i));
   AO22X0 p4572A (.Q(n_701), 
	.D(n_401), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_402), 
	.A(reg_ctrl_alu_cy_i));
   AO22X0 p15762A (.Q(n_700), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_400), 
	.A(reg_ctrl_timers_edgsel_o));
   AO22X0 p15762A22620 (.Q(n_699), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_400), 
	.A(reg_ctrl_timers_dfsel_o));
   AO22X0 p15838A (.Q(n_698), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_400), 
	.A(reg_ctrl_timers_dfp_o[0]));
   AO22X0 p15762A22621 (.Q(n_697), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_400), 
	.A(reg_ctrl_timers_dfp_o[1]));
   AO22X0 p15838A22622 (.Q(n_696), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_400), 
	.A(reg_ctrl_timers_dfp_o[2]));
   AO22X0 p13220A (.Q(n_695), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_400), 
	.A(n_398));
   AO22X0 p15775A22623 (.Q(n_694), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_400), 
	.A(reg_ctrl_timers_tr2_o));
   AO22X0 p13220A22624 (.Q(n_693), 
	.D(n_399), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_400), 
	.A(n_397));
   AO22X0 p15740A (.Q(n_692), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_396), 
	.A(\sfr[36][0] ));
   AO22X0 p15740A22471 (.Q(n_691), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_396), 
	.A(\sfr[36][1] ));
   AO22X0 p15740A22472 (.Q(n_690), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_396), 
	.A(\sfr[36][2] ));
   AO22X0 p15740A22473 (.Q(n_689), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_396), 
	.A(\sfr[36][3] ));
   AO22X0 p15740A22474 (.Q(n_688), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_396), 
	.A(\sfr[36][4] ));
   AO22X0 p15740A22475 (.Q(n_687), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_396), 
	.A(DFT_sdo_7));
   AO22X0 p15740A22476 (.Q(n_686), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_396), 
	.A(\sfr[36][6] ));
   AO22X0 p15740A22477 (.Q(n_685), 
	.D(n_395), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_396), 
	.A(SPCASCAN_N11));
   AO222X0 p5523A (.Q(n_684), 
	.F(reg_ctrl_fsm_data_i[0]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[0]), 
	.B(reg_ctrl_ports_p2en_o[0]), 
	.A(n_394));
   AO222X0 p5523A22280 (.Q(n_683), 
	.F(reg_ctrl_fsm_data_i[1]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[1]), 
	.B(reg_ctrl_ports_p2en_o[1]), 
	.A(n_394));
   AO222X0 p5523A22281 (.Q(n_682), 
	.F(reg_ctrl_fsm_data_i[2]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[2]), 
	.B(reg_ctrl_ports_p2en_o[2]), 
	.A(n_394));
   AO222X0 p5523A22282 (.Q(n_681), 
	.F(reg_ctrl_fsm_data_i[3]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[3]), 
	.B(reg_ctrl_ports_p2en_o[3]), 
	.A(n_394));
   AO222X0 p5523A22283 (.Q(n_680), 
	.F(reg_ctrl_fsm_data_i[4]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[4]), 
	.B(reg_ctrl_ports_p2en_o[4]), 
	.A(n_394));
   AO222X0 p5523A22284 (.Q(n_679), 
	.F(reg_ctrl_fsm_data_i[5]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[5]), 
	.B(reg_ctrl_ports_p2en_o[5]), 
	.A(n_394));
   AO222X0 p5523A22285 (.Q(n_678), 
	.F(reg_ctrl_fsm_data_i[6]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[6]), 
	.B(reg_ctrl_ports_p2en_o[6]), 
	.A(n_394));
   AO222X0 p5523A22286 (.Q(n_677), 
	.F(reg_ctrl_fsm_data_i[7]), 
	.E(n_392), 
	.D(n_393), 
	.C(reg_ctrl_bus_ctrl_p2en_i[7]), 
	.B(reg_ctrl_ports_p2en_o[7]), 
	.A(n_394));
   AO22X0 p15775A22287 (.Q(n_676), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_391), 
	.A(\sfr[38][0] ));
   AO22X0 p15775A22288 (.Q(n_675), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_391), 
	.A(\sfr[38][1] ));
   AO22X0 p15775A22289 (.Q(n_674), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_391), 
	.A(\sfr[38][2] ));
   AO22X0 p15775A22290 (.Q(n_673), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_391), 
	.A(\sfr[38][3] ));
   AO22X0 p15775A22291 (.Q(n_672), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_391), 
	.A(\sfr[38][4] ));
   AO22X0 p15775A22292 (.Q(n_671), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_391), 
	.A(\sfr[38][5] ));
   AO22X0 p15775A22293 (.Q(n_670), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_391), 
	.A(\sfr[38][6] ));
   AO22X0 p15775A22294 (.Q(n_669), 
	.D(n_390), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_391), 
	.A(\sfr[38][7] ));
   MU2IX0 p15957A (.S(n_389), 
	.Q(n_668), 
	.IN1(n_387), 
	.IN0(n_388));
   MU2IX0 p15957A22277 (.S(n_389), 
	.Q(n_667), 
	.IN1(n_385), 
	.IN0(n_386));
   AN21X0 p16020A (.Q(n_666), 
	.C(n_384), 
	.B(reg_ctrl_interrupt_ie_o[0]), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   AN21X0 p16008A (.Q(n_665), 
	.C(n_383), 
	.B(FE_OFCN295_core_interrupt_ie_o_2_), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   AO22X0 p15732A22626 (.Q(n_664), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[4]));
   AO22X0 p15732A22627 (.Q(n_663), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[5]));
   AO22X0 p5576A (.Q(n_662), 
	.D(n_378), 
	.C(reg_ctrl_bus_ctrl_p3en_6_i), 
	.B(n_379), 
	.A(n_380));
   AO22X0 p5576A22295 (.Q(n_661), 
	.D(n_378), 
	.C(reg_ctrl_bus_ctrl_p3en_7_i), 
	.B(n_379), 
	.A(n_377));
   AO22X0 p15775A22478 (.Q(n_660), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_376), 
	.A(\sfr[3][0] ));
   AO22X0 p15775A22479 (.Q(n_659), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_376), 
	.A(\sfr[3][1] ));
   AO22X0 p15775A22480 (.Q(n_658), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_376), 
	.A(\sfr[3][2] ));
   AO22X0 p15775A22481 (.Q(n_657), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_376), 
	.A(\sfr[3][3] ));
   AO22X0 p15775A22482 (.Q(n_656), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_376), 
	.A(\sfr[3][4] ));
   AO22X0 p15775A22483 (.Q(n_655), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_376), 
	.A(\sfr[3][5] ));
   AO22X0 p15775A22485 (.Q(n_654), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_376), 
	.A(\sfr[3][6] ));
   AO22X0 p15775A22487 (.Q(n_653), 
	.D(n_375), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_376), 
	.A(\sfr[3][7] ));
   AO22X0 p15775A22488 (.Q(n_652), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[0]));
   AO22X0 p15775A22489 (.Q(n_651), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[1]));
   AO22X0 p15775A22491 (.Q(n_650), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[2]));
   AO22X0 p15775A22493 (.Q(n_649), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[3]));
   AO22X0 p15775A22495 (.Q(n_648), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[4]));
   AO22X0 p15775A22496 (.Q(n_647), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[5]));
   AO22X0 p15775A22497 (.Q(n_646), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[6]));
   AO22X0 p15775A22499 (.Q(n_645), 
	.D(n_373), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_374), 
	.A(reg_ctrl_timers_tacph1_o[7]));
   AO22X0 p15178A (.Q(n_644), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[0]));
   AO22X0 p15178A22629 (.Q(n_643), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[1]));
   AO22X0 p15178A22630 (.Q(n_642), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[2]));
   AO22X0 p15178A22631 (.Q(n_641), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[3]));
   AO22X0 p15178A22632 (.Q(n_640), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[4]));
   AO22X0 p15178A22633 (.Q(n_639), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[5]));
   AO22X0 p15178A22634 (.Q(n_638), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[6]));
   AO22X0 p15178A22635 (.Q(n_637), 
	.D(n_371), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_372), 
	.A(reg_ctrl_timers_acrl_i[7]));
   AO22X0 p15178A22636 (.Q(n_636), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[0]));
   AO22X0 p15178A22637 (.Q(n_635), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[1]));
   AO22X0 p15178A22638 (.Q(n_634), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[2]));
   AO22X0 p15178A22639 (.Q(n_633), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[3]));
   AO22X0 p15178A22640 (.Q(n_632), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[4]));
   AO22X0 p15178A22641 (.Q(n_631), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[5]));
   AO22X0 p15178A22642 (.Q(n_630), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[6]));
   AO22X0 p15178A22643 (.Q(n_629), 
	.D(n_369), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_370), 
	.A(reg_ctrl_timers_acrm_i[7]));
   AO22X0 p15177A (.Q(n_628), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[0]));
   AO22X0 p15177A22506 (.Q(n_627), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[1]));
   AO22X0 p15177A22507 (.Q(n_626), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[2]));
   AO22X0 p15177A22508 (.Q(n_625), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[3]));
   AO22X0 p15177A22509 (.Q(n_624), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[4]));
   AO22X0 p15177A22511 (.Q(n_623), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[5]));
   AO22X0 p15177A22513 (.Q(n_622), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[6]));
   AO22X0 p15177A22514 (.Q(n_621), 
	.D(n_367), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_368), 
	.A(reg_ctrl_timers_acrh_i[7]));
   AND2X0 p16116A22550 (.Q(n_620), 
	.B(n_366), 
	.A(\sfr[7][0] ));
   AO22X0 p15775A22516 (.Q(n_619), 
	.D(n_365), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_366), 
	.A(\sfr[7][1] ));
   AO22X0 p15775A22517 (.Q(n_618), 
	.D(n_365), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_366), 
	.A(reg_ctrl_baudrate_rs232_o));
   AO22X0 p15775A22518 (.Q(n_617), 
	.D(n_365), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_366), 
	.A(\sfr[7][3] ));
   AND2X0 p16116A22552 (.Q(n_616), 
	.B(n_366), 
	.A(\sfr[7][4] ));
   AND2X0 p16116A22553 (.Q(n_615), 
	.B(n_366), 
	.A(\sfr[7][5] ));
   AND2X0 p16116A22551 (.Q(n_614), 
	.B(n_366), 
	.A(\sfr[7][6] ));
   AO22X0 p15775A22519 (.Q(n_613), 
	.D(n_365), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_366), 
	.A(reg_ctrl_baudrate_smod_o));
   AO22X0 p15755A22646 (.Q(n_612), 
	.D(n_363), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_364), 
	.A(reg_ctrl_interrupt_it0_o));
   AO22X0 p13299A (.Q(n_611), 
	.D(n_361), 
	.C(reg_ctrl_interrupt_ie0_i), 
	.B(n_362), 
	.A(reg_ctrl_interrupt_ie0_o));
   AO22X0 p15755A (.Q(n_610), 
	.D(n_363), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_364), 
	.A(reg_ctrl_interrupt_it1_o));
   AO22X0 p13299A22520 (.Q(n_609), 
	.D(n_361), 
	.C(reg_ctrl_interrupt_ie1_i), 
	.B(n_362), 
	.A(reg_ctrl_interrupt_ie1_o));
   AO22X0 p15844A (.Q(n_608), 
	.D(n_363), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_364), 
	.A(reg_ctrl_timers_tr0_o));
   AO22X0 p13299A22521 (.Q(n_607), 
	.D(n_361), 
	.C(reg_ctrl_interrupt_tf0_i), 
	.B(n_362), 
	.A(reg_ctrl_timers_tf0_i));
   AO22X0 p15844A22649 (.Q(n_606), 
	.D(n_363), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_364), 
	.A(reg_ctrl_timers_tr1_o));
   AO22X0 p13299A22522 (.Q(n_605), 
	.D(n_361), 
	.C(reg_ctrl_interrupt_tf1_i), 
	.B(n_362), 
	.A(reg_ctrl_timers_tf1_i));
   AO22X0 p15845A22650 (.Q(n_604), 
	.D(n_359), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_360), 
	.A(reg_ctrl_timers_m0_t0_o));
   AO22X0 p15845A (.Q(n_603), 
	.D(n_359), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_360), 
	.A(reg_ctrl_timers_m1_t0_o));
   AND2X0 p16170A (.Q(n_602), 
	.B(n_360), 
	.A(\sfr[9][2] ));
   AO22X0 p15903A (.Q(n_601), 
	.D(n_359), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_360), 
	.A(reg_ctrl_timers_gate_t0_o));
   AO22X0 p15845A22654 (.Q(n_600), 
	.D(n_359), 
	.C(reg_ctrl_fsm_data_i[4]), 
	.B(n_360), 
	.A(reg_ctrl_timers_m0_t1_o));
   AO22X0 p15845A22655 (.Q(n_599), 
	.D(n_359), 
	.C(reg_ctrl_fsm_data_i[5]), 
	.B(n_360), 
	.A(reg_ctrl_timers_m1_t1_o));
   AND2X0 p16116A22702 (.Q(n_598), 
	.B(n_360), 
	.A(\sfr[9][6] ));
   AO22X0 p15903A22656 (.Q(n_597), 
	.D(n_359), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_360), 
	.A(reg_ctrl_timers_gate_t1_o));
   AN221X0 p14921A (.Q(n_596), 
	.E(n_356), 
	.D(n_357), 
	.C(reg_ctrl_ports_p0en_o[0]), 
	.B(reg_ctrl_timers_m0_t0_o), 
	.A(n_358));
   AN221X0 p14921A22051 (.Q(n_595), 
	.E(n_353), 
	.D(n_354), 
	.C(\sfr[36][0] ), 
	.B(reg_ctrl_ports_p0_o[0]), 
	.A(n_355));
   AND6X0 p14777A (.Q(n_594), 
	.F(n_347), 
	.E(n_348), 
	.D(n_349), 
	.C(n_350), 
	.B(n_351), 
	.A(n_352));
   AN221X0 p14894A (.Q(n_593), 
	.E(n_344), 
	.D(n_345), 
	.C(reg_ctrl_ports_p2en_o[0]), 
	.B(reg_ctrl_timers_th1_o[0]), 
	.A(n_346));
   AN221X0 p14839A (.Q(n_592), 
	.E(n_341), 
	.D(n_342), 
	.C(reg_ctrl_timers_edgsel_o), 
	.B(reg_ctrl_ports_p4_o[0]), 
	.A(n_343));
   AN22X0 p15172A (.Q(n_591), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[0]), 
	.B(n_340), 
	.A(reg_ctrl_ports_p3_o[0]));
   AND6X1 p14793A (.Q(n_590), 
	.F(n_333), 
	.E(n_334), 
	.D(n_335), 
	.C(n_336), 
	.B(n_337), 
	.A(n_338));
   AN221X0 p14932A22704 (.Q(n_589), 
	.E(n_330), 
	.D(n_331), 
	.C(\sfr[25][1] ), 
	.B(\sfr[18][1] ), 
	.A(n_332));
   AN221X0 p14971A (.Q(n_588), 
	.E(n_328), 
	.D(n_342), 
	.C(reg_ctrl_timers_dfsel_o), 
	.B(\sfr[3][1] ), 
	.A(n_329));
   AN222X0 p14922A22614 (.Q(n_587), 
	.F(n_340), 
	.E(reg_ctrl_ports_p3_o[1]), 
	.D(reg_ctrl_fsm_data_o[1]), 
	.C(n_326), 
	.B(\sfr[1][1] ), 
	.A(n_327));
   AN22X0 p15189A (.Q(n_586), 
	.D(n_324), 
	.C(\sfr[31][1] ), 
	.B(n_325), 
	.A(\sfr[7][1] ));
   AN22X0 p15197A (.Q(n_585), 
	.D(n_322), 
	.C(\sfr[38][1] ), 
	.B(n_323), 
	.A(\sfr[2][1] ));
   AN221X0 p14920A (.Q(n_584), 
	.E(n_321), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[2]), 
	.B(reg_ctrl_ports_p0_o[2]), 
	.A(n_355));
   AN221X0 p15018A (.Q(n_583), 
	.E(n_320), 
	.D(n_342), 
	.C(reg_ctrl_timers_dfp_o[0]), 
	.B(reg_ctrl_interrupt_int0_o), 
	.A(n_340));
   AND6X0 p14811A22130 (.Q(n_582), 
	.F(n_314), 
	.E(n_315), 
	.D(n_316), 
	.C(n_317), 
	.B(n_318), 
	.A(n_319));
   AN211X0 p14909A (.Q(n_581), 
	.D(n_312), 
	.C(n_313), 
	.B(n_358), 
	.A(\sfr[9][2] ));
   AN221X0 p14837A (.Q(n_580), 
	.E(n_309), 
	.D(n_310), 
	.C(reg_ctrl_ports_p1en_o[2]), 
	.B(reg_ctrl_ports_p1_o[2]), 
	.A(n_311));
   AN22X0 p15174A (.Q(n_579), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[2]), 
	.B(n_308), 
	.A(reg_ctrl_interrupt_it1_o));
   AND6X0 p14806A (.Q(n_578), 
	.F(n_302), 
	.E(n_303), 
	.D(n_304), 
	.C(n_305), 
	.B(n_306), 
	.A(n_307));
   AN221X0 p14922A (.Q(n_577), 
	.E(n_300), 
	.D(n_301), 
	.C(reg_ctrl_ports_p2_o[3]), 
	.B(reg_ctrl_ports_p0_o[3]), 
	.A(n_355));
   AN221X0 p14935A22139 (.Q(n_576), 
	.E(n_298), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[3]), 
	.B(reg_ctrl_fsm_psw_rs_o[0]), 
	.A(n_299));
   AN221X0 p14888A (.Q(n_575), 
	.E(n_296), 
	.D(n_342), 
	.C(reg_ctrl_timers_dfp_o[1]), 
	.B(reg_ctrl_serial_tb8_o), 
	.A(n_297));
   AN22X0 p15146A (.Q(n_574), 
	.D(n_345), 
	.C(reg_ctrl_ports_p2en_o[3]), 
	.B(n_310), 
	.A(reg_ctrl_ports_p1en_o[3]));
   AN22X0 p15204A (.Q(n_573), 
	.D(n_357), 
	.C(reg_ctrl_ports_p0en_o[3]), 
	.B(n_311), 
	.A(reg_ctrl_ports_p1_o[3]));
   AN221X0 p14748A (.Q(n_572), 
	.E(n_295), 
	.D(n_301), 
	.C(reg_ctrl_ports_p2_o[4]), 
	.B(reg_ctrl_ports_p0_o[4]), 
	.A(n_355));
   AN221X0 p14960A (.Q(n_571), 
	.E(n_294), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[4]), 
	.B(reg_ctrl_fsm_psw_rs_o[1]), 
	.A(n_299));
   AND6X0 p14811A22131 (.Q(n_570), 
	.F(n_288), 
	.E(n_289), 
	.D(n_290), 
	.C(n_291), 
	.B(n_292), 
	.A(n_293));
   AN221X0 p14915A (.Q(n_569), 
	.E(n_287), 
	.D(n_340), 
	.C(reg_ctrl_ports_p3_o[4]), 
	.B(reg_ctrl_timers_tr0_o), 
	.A(n_308));
   AN221X0 p14832A (.Q(n_568), 
	.E(n_286), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[4]), 
	.B(reg_ctrl_ports_p1en_o[4]), 
	.A(n_310));
   AN22X0 p15160A (.Q(n_567), 
	.D(n_285), 
	.C(reg_ctrl_timers_tacph0_o[4]), 
	.B(n_354), 
	.A(\sfr[36][4] ));
   NA3X1 p14976A (.Q(n_566), 
	.C(n_282), 
	.B(n_283), 
	.A(n_284));
   ON211X0 p15023A (.Q(n_565), 
	.D(n_278), 
	.C(n_279), 
	.B(n_280), 
	.A(n_281));
   NA3X0 p15082A (.Q(n_564), 
	.C(n_275), 
	.B(n_276), 
	.A(n_277));
   AND6X2 p14814A (.Q(n_563), 
	.F(n_269), 
	.E(n_270), 
	.D(n_271), 
	.C(n_272), 
	.B(n_273), 
	.A(n_274));
   AN221X0 p14925A (.Q(n_562), 
	.E(n_268), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[6]), 
	.B(reg_ctrl_ports_p0_o[6]), 
	.A(n_355));
   AN221X0 p14808A (.Q(n_561), 
	.E(n_267), 
	.D(n_345), 
	.C(reg_ctrl_ports_p2en_o[6]), 
	.B(reg_ctrl_ports_p0en_o[6]), 
	.A(n_357));
   AN22X0 p15220A (.Q(n_560), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[6]), 
	.B(n_311), 
	.A(reg_ctrl_ports_p1_o[6]));
   AN221X0 p14873A (.Q(n_559), 
	.E(n_266), 
	.D(n_297), 
	.C(reg_ctrl_baudrate_sm1_o), 
	.B(reg_ctrl_ports_p3_o[6]), 
	.A(n_340));
   AN221X0 p14987A (.Q(n_558), 
	.E(n_264), 
	.D(n_308), 
	.C(reg_ctrl_timers_tr1_o), 
	.B(reg_ctrl_timers_tm0_o[6]), 
	.A(n_265));
   AN221X0 p14935A (.Q(n_557), 
	.E(n_263), 
	.D(n_301), 
	.C(reg_ctrl_ports_p2_o[7]), 
	.B(reg_ctrl_ports_p0_o[7]), 
	.A(n_355));
   AN221X0 p14945A (.Q(n_556), 
	.E(n_262), 
	.D(n_357), 
	.C(reg_ctrl_ports_p0en_o[7]), 
	.B(reg_ctrl_timers_gate_t1_o), 
	.A(n_358));
   AND6X0 p14811A (.Q(n_555), 
	.F(n_256), 
	.E(n_257), 
	.D(n_258), 
	.C(n_259), 
	.B(n_260), 
	.A(n_261));
   AN221X0 p14852A (.Q(n_554), 
	.E(n_255), 
	.D(n_310), 
	.C(reg_ctrl_ports_p1en_o[7]), 
	.B(reg_ctrl_baudrate_sm0_o), 
	.A(n_297));
   AN221X0 p14855A (.Q(n_553), 
	.E(n_254), 
	.D(n_354), 
	.C(SPCASCAN_N11), 
	.B(reg_ctrl_ports_p3_o[7]), 
	.A(n_340));
   AN22X0 p15183A (.Q(n_552), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[7]), 
	.B(n_345), 
	.A(reg_ctrl_ports_p2en_o[7]));
   AN21X0 p15948A (.Q(n_551), 
	.C(n_493), 
	.B(reg_ctrl_reset_b_i), 
	.A(serial_status));
   NO2X0 p17315A (.Q(n_550), 
	.B(reg_ctrl_fsm_addr_i[5]), 
	.A(n_253));
   NO2I1X1 p15286A (.Q(n_549), 
	.B(n_252), 
	.AN(n_251));
   NO2I1X1 p15760A (.Q(n_548), 
	.B(n_250), 
	.AN(reg_ctrl_ext_ram_wr_i));
   ON221X0 p5544A (.Q(n_547), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[0]), 
	.C(n_247), 
	.B(n_248), 
	.A(n_249));
   AO32X0 p5027A (.Q(n_546), 
	.E(n_245), 
	.D(reg_ctrl_ports_p0_i[0]), 
	.C(reg_ctrl_ports_p0en_o[0]), 
	.B(reg_ctrl_fsm_data_i[0]), 
	.A(n_246));
   ON221X0 p5544A22097 (.Q(n_545), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[1]), 
	.C(n_247), 
	.B(n_244), 
	.A(n_249));
   AO32X0 p5027A22042 (.Q(n_544), 
	.E(n_243), 
	.D(reg_ctrl_ports_p0_i[1]), 
	.C(reg_ctrl_ports_p0en_o[1]), 
	.B(reg_ctrl_fsm_data_i[1]), 
	.A(n_246));
   ON221X0 p5544A22098 (.Q(n_543), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[2]), 
	.C(n_247), 
	.B(n_242), 
	.A(n_249));
   AO32X0 p5027A22043 (.Q(n_542), 
	.E(n_241), 
	.D(reg_ctrl_ports_p0_i[2]), 
	.C(reg_ctrl_ports_p0en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_246));
   ON221X0 p5544A22099 (.Q(n_541), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[3]), 
	.C(n_247), 
	.B(n_240), 
	.A(n_249));
   AO32X0 p5027A22044 (.Q(n_540), 
	.E(n_239), 
	.D(reg_ctrl_ports_p0_i[3]), 
	.C(reg_ctrl_ports_p0en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_246));
   ON221X0 p5544A22100 (.Q(n_539), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[4]), 
	.C(n_247), 
	.B(n_238), 
	.A(n_249));
   AO32X0 p5027A22045 (.Q(n_538), 
	.E(n_237), 
	.D(reg_ctrl_ports_p0_i[4]), 
	.C(reg_ctrl_ports_p0en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_246));
   ON221X0 p5544A22101 (.Q(n_537), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[5]), 
	.C(n_247), 
	.B(n_236), 
	.A(n_249));
   AO32X0 p5027A22046 (.Q(n_536), 
	.E(n_235), 
	.D(reg_ctrl_ports_p0_i[5]), 
	.C(reg_ctrl_ports_p0en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_246));
   ON221X0 p5544A22102 (.Q(n_535), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[6]), 
	.C(n_247), 
	.B(n_234), 
	.A(n_249));
   AO32X0 p5027A22047 (.Q(n_534), 
	.E(n_233), 
	.D(reg_ctrl_ports_p0_i[6]), 
	.C(reg_ctrl_ports_p0en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_246));
   ON221X0 p5544A22103 (.Q(n_533), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p0en_o[7]), 
	.C(n_247), 
	.B(n_232), 
	.A(n_249));
   AO32X0 p5027A22048 (.Q(n_532), 
	.E(n_231), 
	.D(reg_ctrl_ports_p0_i[7]), 
	.C(reg_ctrl_ports_p0en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_246));
   NA2X0 p14944A (.Q(n_531), 
	.B(n_229), 
	.A(n_230));
   NO2I1X0 p15110A (.Q(n_530), 
	.B(n_228), 
	.AN(n_227));
   NA2X0 p14944A22701 (.Q(n_529), 
	.B(n_225), 
	.A(n_226));
   AND2X0 p15246A (.Q(n_528), 
	.B(n_223), 
	.A(n_224));
   NA2X0 p14944A22742 (.Q(n_527), 
	.B(n_222), 
	.A(n_230));
   NO2I1X0 p15110A22765 (.Q(n_526), 
	.B(n_221), 
	.AN(n_227));
   NA2X0 p14944A22734 (.Q(n_525), 
	.B(n_220), 
	.A(n_226));
   NO2I1X0 p15110A22759 (.Q(n_524), 
	.B(n_219), 
	.AN(n_223));
   NA2X0 p14944A22703 (.Q(n_523), 
	.B(n_218), 
	.A(n_230));
   AND2X0 p15246A22738 (.Q(n_522), 
	.B(n_227), 
	.A(n_217));
   NA2I1X0 p14933A (.Q(n_521), 
	.B(n_226), 
	.AN(n_216));
   AND2X0 p15246A22739 (.Q(n_520), 
	.B(n_223), 
	.A(n_65));
   NO2X1 p16390A (.Q(n_519), 
	.B(n_214), 
	.A(n_215));
   ON221X0 p15051A (.Q(n_518), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[0]), 
	.C(n_211), 
	.B(n_212), 
	.A(n_213));
   NO3I1X0 p15351A (.Q(n_517), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[0]), 
	.AN(reg_ctrl_ports_p1_i[0]));
   ON221X0 p15051A22560 (.Q(n_516), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[1]), 
	.C(n_211), 
	.B(n_209), 
	.A(n_213));
   NO3I1X0 p15351A22424 (.Q(n_515), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[1]), 
	.AN(reg_ctrl_ports_p1_i[1]));
   ON221X0 p15030A (.Q(n_514), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[2]), 
	.C(n_211), 
	.B(n_208), 
	.A(n_213));
   NO3I1X0 p15334A (.Q(n_513), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[2]), 
	.AN(reg_ctrl_ports_p1_i[2]));
   ON221X0 p15051A22561 (.Q(n_512), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[3]), 
	.C(n_211), 
	.B(n_207), 
	.A(n_213));
   NO3I1X0 p15351A22426 (.Q(n_511), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[3]), 
	.AN(reg_ctrl_ports_p1_i[3]));
   ON221X0 p15051A22562 (.Q(n_510), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[4]), 
	.C(n_211), 
	.B(n_206), 
	.A(n_213));
   NO3I1X0 p15351A22427 (.Q(n_509), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[4]), 
	.AN(reg_ctrl_ports_p1_i[4]));
   ON221X0 p15051A22563 (.Q(n_508), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[5]), 
	.C(n_211), 
	.B(n_205), 
	.A(n_213));
   NO3I1X0 p15351A22428 (.Q(n_507), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[5]), 
	.AN(reg_ctrl_ports_p1_i[5]));
   ON221X0 p15051A22564 (.Q(n_506), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[6]), 
	.C(n_211), 
	.B(n_204), 
	.A(n_213));
   NO3I1X0 p15351A22429 (.Q(n_505), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[6]), 
	.AN(reg_ctrl_ports_p1_i[6]));
   ON221X0 p15030A22565 (.Q(n_504), 
	.E(reg_ctrl_reset_b_i), 
	.D(reg_ctrl_ports_p1en_o[7]), 
	.C(n_211), 
	.B(n_203), 
	.A(n_213));
   NO3I1X0 p15334A22430 (.Q(n_503), 
	.C(n_210), 
	.B(reg_ctrl_ports_p1en_o[7]), 
	.AN(reg_ctrl_ports_p1_i[7]));
   MU2IX0 p16208A (.S(n_202), 
	.Q(n_502), 
	.IN1(reg_ctrl_interrupt_ri_o), 
	.IN0(reg_ctrl_serial_ri_i));
   INX0 Fp16650A (.Q(n_501), 
	.A(n_496));
   MU2IX0 p16208A22793 (.S(n_202), 
	.Q(n_500), 
	.IN1(reg_ctrl_interrupt_ti_o), 
	.IN0(reg_ctrl_serial_ti_i));
   INX0 Fp17090A (.Q(n_499), 
	.A(n_495));
   AND2X0 p21704A (.Q(n_498), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_201));
   NO2X0 p21770A (.Q(n_497), 
	.B(n_200), 
	.A(n_201));
   NA2X0 p16452A (.Q(n_496), 
	.B(n_198), 
	.A(n_199));
   NO2I1X0 p16437A22770 (.Q(n_495), 
	.B(n_215), 
	.AN(n_197));
   NA2X0 p16265A (.Q(n_494), 
	.B(n_196), 
	.A(n_199));
   AND2X0 p16561A (.Q(n_493), 
	.B(n_197), 
	.A(n_549));
   NA2X0 p16752A (.Q(n_492), 
	.B(n_59), 
	.A(n_549));
   NA2X0 p15862A22740 (.Q(n_491), 
	.B(n_492), 
	.A(\sfr[1][0] ));
   NA2X0 p15862A22741 (.Q(n_490), 
	.B(n_492), 
	.A(\sfr[1][1] ));
   INX0 Fp16735A (.Q(n_489), 
	.A(reg_ctrl_fsm_data_i[2]));
   NA2X0 p15862A (.Q(n_488), 
	.B(n_492), 
	.A(\sfr[1][2] ));
   NA2X0 p16415A (.Q(n_487), 
	.B(n_195), 
	.A(n_196));
   NO2I1X0 p16715A (.Q(n_486), 
	.B(n_194), 
	.AN(n_549));
   INX0 Fp9975088A (.Q(n_485), 
	.A(reg_ctrl_ports_p2_i[0]));
   NA2X0 p5537A (.Q(n_484), 
	.B(n_193), 
	.A(reg_ctrl_reset_b_i));
   AN21X0 p6091A22568 (.Q(n_483), 
	.C(n_192), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[0]));
   INX0 Fp5730A22875 (.Q(n_482), 
	.A(reg_ctrl_ports_p2_o[0]));
   AN32X0 p5711A (.Q(n_481), 
	.E(reg_ctrl_bus_ctrl_p2_i[0]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[0]), 
	.B(reg_ctrl_fsm_data_i[0]), 
	.A(n_191));
   INX0 Fp9975088A22845 (.Q(n_480), 
	.A(reg_ctrl_ports_p2_i[1]));
   AN21X0 p6091A22569 (.Q(n_479), 
	.C(n_189), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[1]));
   INX0 Fp5711A (.Q(n_478), 
	.A(reg_ctrl_ports_p2_o[1]));
   AN32X0 p5711A22538 (.Q(n_477), 
	.E(reg_ctrl_bus_ctrl_p2_i[1]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[1]), 
	.B(reg_ctrl_fsm_data_i[1]), 
	.A(n_191));
   INX0 Fp9975088A22827 (.Q(n_476), 
	.A(reg_ctrl_ports_p2_i[2]));
   AN21X0 p6091A22570 (.Q(n_475), 
	.C(n_188), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[2]));
   INX0 Fp5730A22891 (.Q(n_474), 
	.A(reg_ctrl_ports_p2_o[2]));
   AN32X0 p5711A22539 (.Q(n_473), 
	.E(reg_ctrl_bus_ctrl_p2_i[2]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[2]), 
	.B(reg_ctrl_fsm_data_i[2]), 
	.A(n_191));
   INX0 Fp9975088A22864 (.Q(n_472), 
	.A(reg_ctrl_ports_p2_i[3]));
   AN21X0 p6091A22571 (.Q(n_471), 
	.C(n_187), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[3]));
   INX0 Fp5705A22854 (.Q(n_470), 
	.A(reg_ctrl_ports_p2_o[3]));
   AN32X0 p5711A22540 (.Q(n_469), 
	.E(reg_ctrl_bus_ctrl_p2_i[3]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[3]), 
	.B(reg_ctrl_fsm_data_i[3]), 
	.A(n_191));
   INX0 Fp9975088A22824 (.Q(n_468), 
	.A(reg_ctrl_ports_p2_i[4]));
   AN21X0 p6091A22572 (.Q(n_467), 
	.C(n_186), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[4]));
   INX0 Fp5705A22828 (.Q(n_466), 
	.A(reg_ctrl_ports_p2_o[4]));
   AN32X0 p5713A22541 (.Q(n_465), 
	.E(reg_ctrl_bus_ctrl_p2_i[4]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[4]), 
	.B(reg_ctrl_fsm_data_i[4]), 
	.A(n_191));
   INX0 Fp9975088A22823 (.Q(n_464), 
	.A(reg_ctrl_ports_p2_i[5]));
   AN21X0 p6091A22573 (.Q(n_463), 
	.C(n_185), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[5]));
   INX0 Fp5705A (.Q(n_462), 
	.A(reg_ctrl_ports_p2_o[5]));
   AN32X0 p5713A22542 (.Q(n_461), 
	.E(reg_ctrl_bus_ctrl_p2_i[5]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[5]), 
	.B(reg_ctrl_fsm_data_i[5]), 
	.A(n_191));
   INX0 Fp9975088A22878 (.Q(n_460), 
	.A(reg_ctrl_ports_p2_i[6]));
   AN21X0 p6091A (.Q(n_459), 
	.C(n_184), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[6]));
   INX0 Fp5730A (.Q(n_458), 
	.A(reg_ctrl_ports_p2_o[6]));
   AN32X0 p5713A22543 (.Q(n_457), 
	.E(reg_ctrl_bus_ctrl_p2_i[6]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_191));
   INX0 Fp9975088A22815 (.Q(n_456), 
	.A(reg_ctrl_ports_p2_i[7]));
   AN21X0 p6091A22558 (.Q(n_455), 
	.C(n_183), 
	.B(n_193), 
	.A(reg_ctrl_ports_p2en_o[7]));
   INX0 Fp5705A22860 (.Q(n_454), 
	.A(reg_ctrl_ports_p2_o[7]));
   AN32X0 p5713A (.Q(n_453), 
	.E(reg_ctrl_bus_ctrl_p2_i[7]), 
	.D(n_190), 
	.C(reg_ctrl_ports_p2en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_191));
   NA2I1X0 p16315A (.Q(n_452), 
	.B(n_198), 
	.AN(n_182));
   NO2X0 p16712A (.Q(n_451), 
	.B(n_181), 
	.A(n_215));
   OA21X0 p5246A22557 (.Q(n_450), 
	.C(n_379), 
	.B(n_216), 
	.A(n_182));
   OA21X0 p4937A (.Q(n_449), 
	.C(n_378), 
	.B(n_179), 
	.A(n_180));
   NO2X0 p16466A (.Q(n_448), 
	.B(n_181), 
	.A(n_180));
   AN22X0 p15674A (.Q(n_447), 
	.D(n_170), 
	.C(reg_ctrl_ports_p3_o[0]), 
	.B(reg_ctrl_ports_p3_i[0]), 
	.A(n_178));
   AN321X0 p15056A (.Q(n_446), 
	.F(n_175), 
	.E(reg_ctrl_serial_p3_0_i), 
	.D(n_176), 
	.C(n_389), 
	.B(n_177), 
	.A(reg_ctrl_ports_p3_o[0]));
   INX0 Fp5102A (.Q(n_444), 
	.A(reg_ctrl_ports_p3_o[0]));
   AN22X0 p15654A (.Q(n_443), 
	.D(n_170), 
	.C(reg_ctrl_ports_p3_o[1]), 
	.B(reg_ctrl_ports_p3_i[1]), 
	.A(n_178));
   AN321X0 p14745A (.Q(n_442), 
	.F(n_174), 
	.E(reg_ctrl_serial_p3_1_i), 
	.D(n_176), 
	.C(n_389), 
	.B(n_177), 
	.A(reg_ctrl_ports_p3_o[1]));
   INX0 Fp21706A22820 (.Q(n_440), 
	.A(reg_ctrl_ports_p3_o[1]));
   NO2I1X1 p15725A (.Q(n_439), 
	.B(n_215), 
	.AN(n_173));
   ON221X0 p15057A (.Q(n_438), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_172), 
	.C(n_170), 
	.B(reg_ctrl_ports_p3en_o[2]), 
	.A(n_177));
   NO3I1X0 p15352A (.Q(n_437), 
	.C(n_171), 
	.B(reg_ctrl_ports_p3en_o[2]), 
	.AN(reg_ctrl_ports_p3_i[2]));
   ON221X0 p15040A (.Q(n_436), 
	.E(reg_ctrl_reset_b_i), 
	.D(FE_PT1_top_p3_en_o_3_), 
	.C(n_170), 
	.B(reg_ctrl_ports_p3en_o[3]), 
	.A(n_177));
   NO3I1X0 p15336A (.Q(n_435), 
	.C(n_171), 
	.B(reg_ctrl_ports_p3en_o[3]), 
	.AN(reg_ctrl_ports_p3_i[3]));
   ON221X0 p15057A22574 (.Q(n_434), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_168), 
	.C(n_170), 
	.B(reg_ctrl_ports_p3en_o[4]), 
	.A(n_177));
   NO3I1X0 p15352A22422 (.Q(n_433), 
	.C(n_171), 
	.B(reg_ctrl_ports_p3en_o[4]), 
	.AN(reg_ctrl_ports_p3_i[4]));
   ON221X0 p15057A22575 (.Q(n_432), 
	.E(reg_ctrl_reset_b_i), 
	.D(n_167), 
	.C(n_170), 
	.B(reg_ctrl_ports_p3en_o[5]), 
	.A(n_177));
   NO3I1X0 p15352A22423 (.Q(n_431), 
	.C(n_171), 
	.B(reg_ctrl_ports_p3en_o[5]), 
	.AN(reg_ctrl_ports_p3_i[5]));
   MU2IX0 p5711A22791 (.S(n_379), 
	.Q(n_430), 
	.IN1(n_166), 
	.IN0(reg_ctrl_bus_ctrl_p3_6_i));
   AN32X0 p6033A (.Q(n_429), 
	.E(reg_ctrl_ports_p3_o[6]), 
	.D(n_165), 
	.C(reg_ctrl_ports_p3en_o[6]), 
	.B(reg_ctrl_fsm_data_i[6]), 
	.A(n_439));
   MU2IX0 p5758A (.S(n_379), 
	.Q(n_428), 
	.IN1(n_164), 
	.IN0(reg_ctrl_bus_ctrl_p3_7_i));
   AN32X0 p6033A22278 (.Q(n_427), 
	.E(reg_ctrl_ports_p3_o[7]), 
	.D(n_163), 
	.C(reg_ctrl_ports_p3en_o[7]), 
	.B(reg_ctrl_fsm_data_i[7]), 
	.A(n_439));
   NA2X0 p16453A (.Q(n_426), 
	.B(n_162), 
	.A(n_198));
   NO2I1X0 p16671A (.Q(n_425), 
	.B(n_215), 
	.AN(n_161));
   NA2X0 p16262A22735 (.Q(n_424), 
	.B(n_162), 
	.A(n_196));
   AND2X0 p16717A (.Q(n_423), 
	.B(n_161), 
	.A(n_549));
   NA2X0 p16135A (.Q(n_422), 
	.B(n_162), 
	.A(n_229));
   NO2I1X0 p16389A (.Q(n_421), 
	.B(n_228), 
	.AN(n_161));
   NA2X0 p16135A22698 (.Q(n_420), 
	.B(n_162), 
	.A(n_225));
   AND2X0 p16403A (.Q(n_419), 
	.B(n_161), 
	.A(n_224));
   NA2X0 p16262A (.Q(n_418), 
	.B(n_162), 
	.A(n_222));
   NO2I1X0 p16537A (.Q(n_417), 
	.B(n_221), 
	.AN(n_161));
   NA2X0 p16262A22733 (.Q(n_416), 
	.B(n_162), 
	.A(n_220));
   NO2I1X0 p16537A22761 (.Q(n_415), 
	.B(n_219), 
	.AN(n_161));
   NA2X0 p16139A (.Q(n_414), 
	.B(n_229), 
	.A(n_195));
   NO2X0 p16422A (.Q(n_413), 
	.B(n_194), 
	.A(n_228));
   NA2X0 p16135A22699 (.Q(n_412), 
	.B(n_162), 
	.A(n_218));
   AND2X0 p16403A22732 (.Q(n_411), 
	.B(n_161), 
	.A(n_217));
   NA2I1X0 p15981A (.Q(n_410), 
	.B(n_162), 
	.AN(n_216));
   NO2I1X0 p16437A (.Q(n_409), 
	.B(n_180), 
	.AN(n_161));
   OA21X1 p5246A (.Q(n_408), 
	.C(n_379), 
	.B(n_159), 
	.A(n_160));
   OA21X0 p5085A (.Q(n_407), 
	.C(n_378), 
	.B(n_157), 
	.A(n_158));
   NO2X0 p16445A (.Q(n_406), 
	.B(n_194), 
	.A(n_156));
   NA2X0 p16494A (.Q(n_405), 
	.B(n_154), 
	.A(n_155));
   NO2X0 p16449A (.Q(n_404), 
	.B(n_153), 
	.A(n_156));
   EN3X0 p14890A (.Q(n_403), 
	.C(n_150), 
	.B(n_151), 
	.A(n_152));
   NA2I1X0 p16344A (.Q(n_402), 
	.B(n_149), 
	.AN(n_148));
   NO2X0 p16969A (.Q(n_401), 
	.B(n_214), 
	.A(n_156));
   NA2X1 p16538A (.Q(n_400), 
	.B(n_154), 
	.A(n_199));
   NO2I1X1 p16752A22768 (.Q(n_399), 
	.B(n_156), 
	.AN(n_197));
   MU2X0 p12999A (.S(reg_ctrl_interrupt_clear_i), 
	.Q(n_398), 
	.IN1(reg_ctrl_interrupt_tf2_i), 
	.IN0(reg_ctrl_timers_tf2_i));
   MU2X0 p12999A22797 (.S(reg_ctrl_interrupt_clear_i), 
	.Q(n_397), 
	.IN1(reg_ctrl_interrupt_txrxf_i), 
	.IN0(reg_ctrl_interrupt_txrxf_o));
   AO21X0 p16123A (.Q(n_396), 
	.C(n_160), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_147));
   NO2X0 p16780A (.Q(n_395), 
	.B(n_146), 
	.A(n_156));
   NO2I1X0 p5765A (.Q(n_394), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.AN(n_145));
   AND2X0 p5389A (.Q(n_393), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.A(n_145));
   NO2X0 p16775A (.Q(n_392), 
	.B(n_181), 
	.A(n_156));
   NA2X0 p16291A (.Q(n_391), 
	.B(n_149), 
	.A(n_144));
   NO2I1X0 p16662A (.Q(n_390), 
	.B(n_156), 
	.AN(n_173));
   NO2X1 p14820A (.Q(n_389), 
	.B(reg_ctrl_serial_ren_o), 
	.A(serial_status));
   NA2X0 p22577A22804 (.Q(n_388), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_serial_p3en_0_i));
   AN22X0 p15736A (.Q(n_387), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[0]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[0]));
   NA2X0 p22577A (.Q(n_386), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_serial_p3en_1_i));
   AN22X0 p15736A22625 (.Q(n_385), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[1]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[1]));
   AN22X0 p15800A (.Q(n_384), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[2]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[2]));
   AN22X0 p15786A (.Q(n_383), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[3]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[3]));
   NA2X0 p15852A (.Q(n_382), 
	.B(n_162), 
	.A(n_154));
   NO2I1X0 p16148A (.Q(n_381), 
	.B(n_156), 
	.AN(n_161));
   AO22X0 p15112A (.Q(n_380), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[6]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[6]));
   NO3X1 p4212A (.Q(n_379), 
	.C(reg_ctrl_ext_rom_rd_i), 
	.B(reg_ctrl_ext_ram_rd_i), 
	.A(reg_ctrl_ext_ram_wr_i));
   NO2X0 p4809A (.Q(n_378), 
	.B(n_200), 
	.A(n_379));
   AO22X0 p15112A22628 (.Q(n_377), 
	.D(n_381), 
	.C(reg_ctrl_fsm_data_i[7]), 
	.B(n_382), 
	.A(reg_ctrl_ports_p3en_o[7]));
   NA2X0 p16139A22700 (.Q(n_376), 
	.B(n_225), 
	.A(n_195));
   NO2I1X0 p16274A (.Q(n_375), 
	.B(n_194), 
	.AN(n_224));
   AO211X0 p15337A (.Q(n_374), 
	.D(n_63), 
	.C(n_216), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_143));
   NO2I1X0 p16437A22737 (.Q(n_373), 
	.B(n_180), 
	.AN(n_173));
   NA2X0 p14932A22736 (.Q(n_372), 
	.B(n_142), 
	.A(n_222));
   NO2I1X0 p15018A22766 (.Q(n_371), 
	.B(n_221), 
	.AN(n_141));
   NA2X0 p14932A22729 (.Q(n_370), 
	.B(n_142), 
	.A(n_220));
   NO2I1X0 p15018A22764 (.Q(n_369), 
	.B(n_219), 
	.AN(n_141));
   NA2X0 p14932A (.Q(n_368), 
	.B(n_142), 
	.A(n_218));
   AND2X0 p15182A (.Q(n_367), 
	.B(n_141), 
	.A(n_217));
   NA2I1X0 p16012A (.Q(n_366), 
	.B(n_195), 
	.AN(n_216));
   NO2X0 p16829A (.Q(n_365), 
	.B(n_194), 
	.A(n_180));
   NA2X0 p16101A (.Q(n_364), 
	.B(n_155), 
	.A(n_198));
   NO2X0 p16829A22774 (.Q(n_363), 
	.B(n_153), 
	.A(n_215));
   NO2I1X0 p13296A (.Q(n_362), 
	.B(reg_ctrl_interrupt_clear_i), 
	.AN(n_364));
   AND2X0 p13209A (.Q(n_361), 
	.B(n_364), 
	.A(reg_ctrl_interrupt_clear_i));
   NA2X0 p16278A (.Q(n_360), 
	.B(n_155), 
	.A(n_196));
   NO2I1X0 p16629A (.Q(n_359), 
	.B(n_153), 
	.AN(n_549));
   NO2I1X1 p14363A (.Q(n_358), 
	.B(n_153), 
	.AN(n_140));
   NO2X1 p14938A (.Q(n_357), 
	.B(n_194), 
	.A(n_139));
   NA3X0 p15635A (.Q(n_356), 
	.C(n_136), 
	.B(n_137), 
	.A(n_138));
   AO21X0 p14752A (.Q(n_355), 
	.C(n_133), 
	.B(n_134), 
	.A(n_135));
   NO2X1 p15279A (.Q(n_354), 
	.B(n_146), 
	.A(n_139));
   AO22X0 p14491A (.Q(n_353), 
	.D(n_285), 
	.C(reg_ctrl_timers_tacph0_o[0]), 
	.B(n_301), 
	.A(reg_ctrl_ports_p2_o[0]));
   AN221X0 p14422A22555 (.Q(n_352), 
	.E(n_130), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[0]), 
	.B(reg_ctrl_timers_tacpl_o[0]), 
	.A(n_132));
   AN22X0 p14742A22748 (.Q(n_351), 
	.D(n_128), 
	.C(\sfr[29][0] ), 
	.B(n_129), 
	.A(\sfr[28][0] ));
   AN222X0 p14488A (.Q(n_350), 
	.F(n_311), 
	.E(reg_ctrl_ports_p1_o[0]), 
	.D(reg_ctrl_fsm_data_o[0]), 
	.C(n_326), 
	.B(\sfr[1][0] ), 
	.A(n_327));
   AN22X0 p14720A22746 (.Q(n_349), 
	.D(n_331), 
	.C(\sfr[25][0] ), 
	.B(n_332), 
	.A(\sfr[18][0] ));
   AN22X0 p14708A22685 (.Q(n_348), 
	.D(n_322), 
	.C(\sfr[38][0] ), 
	.B(n_323), 
	.A(\sfr[2][0] ));
   AN22X0 p14720A22728 (.Q(n_347), 
	.D(n_324), 
	.C(\sfr[31][0] ), 
	.B(n_325), 
	.A(\sfr[7][0] ));
   NO2X0 p14854A (.Q(n_346), 
	.B(n_153), 
	.A(n_127));
   NO2X1 p15475A (.Q(n_345), 
	.B(n_181), 
	.A(n_139));
   NA3X0 p15070A (.Q(n_344), 
	.C(n_124), 
	.B(n_125), 
	.A(n_126));
   NO2I1X0 p14860A (.Q(n_343), 
	.B(n_181), 
	.AN(n_123));
   NO2I1X1 p13921A (.Q(n_342), 
	.B(n_139), 
	.AN(n_197));
   AO22X0 p14405A (.Q(n_341), 
	.D(n_310), 
	.C(reg_ctrl_ports_p1en_o[0]), 
	.B(n_308), 
	.A(reg_ctrl_interrupt_it0_o));
   NO2I1X1 p15223A (.Q(n_340), 
	.B(n_122), 
	.AN(n_173));
   NO2I1X1 p15577A (.Q(n_339), 
	.B(n_139), 
	.AN(n_161));
   AN221X0 p14410A (.Q(n_338), 
	.E(n_121), 
	.D(n_357), 
	.C(reg_ctrl_ports_p0en_o[1]), 
	.B(reg_ctrl_timers_m1_t0_o), 
	.A(n_358));
   AN221X0 p14454A (.Q(n_337), 
	.E(n_120), 
	.D(n_311), 
	.C(reg_ctrl_ports_p1_o[1]), 
	.B(reg_ctrl_timers_th1_o[1]), 
	.A(n_346));
   AN221X0 p14450A (.Q(n_336), 
	.E(n_119), 
	.D(n_285), 
	.C(reg_ctrl_timers_tacph0_o[1]), 
	.B(reg_ctrl_ports_p2_o[1]), 
	.A(n_301));
   AN22X0 p14753A (.Q(n_335), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[1]), 
	.B(n_355), 
	.A(reg_ctrl_ports_p0_o[1]));
   AN22X0 p14709A (.Q(n_334), 
	.D(n_354), 
	.C(\sfr[36][1] ), 
	.B(n_132), 
	.A(reg_ctrl_timers_tacpl_o[1]));
   AN22X0 p14707A (.Q(n_333), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[1]), 
	.B(n_345), 
	.A(reg_ctrl_ports_p2en_o[1]));
   AND2X0 p15236A (.Q(n_332), 
	.B(n_197), 
	.A(n_140));
   AND2X0 p14999A22786 (.Q(n_331), 
	.B(n_161), 
	.A(n_140));
   AO22X0 p14491A22756 (.Q(n_330), 
	.D(n_128), 
	.C(\sfr[29][1] ), 
	.B(n_129), 
	.A(\sfr[28][1] ));
   NO2X1 p14799A22772 (.Q(n_329), 
	.B(n_194), 
	.A(n_118));
   AO22X0 p14523A (.Q(n_328), 
	.D(n_117), 
	.C(\sfr[30][1] ), 
	.B(n_299), 
	.A(\sfr[34][1] ));
   NO2I1X0 p15082A22784 (.Q(n_327), 
	.B(n_194), 
	.AN(n_140));
   NO2I1X1 p15644A (.Q(n_326), 
	.B(n_200), 
	.AN(reg_ctrl_fsm_rd_b_i));
   NO2I1X1 p14730A (.Q(n_325), 
	.B(n_194), 
	.AN(n_123));
   AND2X0 p14842A (.Q(n_324), 
	.B(n_161), 
	.A(n_123));
   NO2X0 p14794A (.Q(n_323), 
	.B(n_194), 
	.A(n_116));
   NO2I1X0 p15002A22743 (.Q(n_322), 
	.B(n_139), 
	.AN(n_173));
   AO22X0 p14485A (.Q(n_321), 
	.D(n_354), 
	.C(\sfr[36][2] ), 
	.B(n_301), 
	.A(reg_ctrl_ports_p2_o[2]));
   AO221X0 p15029A (.Q(n_320), 
	.E(n_113), 
	.D(\sfr[5][2] ), 
	.C(n_114), 
	.B(\sfr[6][2] ), 
	.A(n_115));
   AN221X0 p14422A (.Q(n_319), 
	.E(n_112), 
	.D(n_332), 
	.C(\sfr[18][2] ), 
	.B(\sfr[1][2] ), 
	.A(n_327));
   AN221X0 p14426A22554 (.Q(n_318), 
	.E(n_111), 
	.D(n_285), 
	.C(reg_ctrl_timers_tacph0_o[2]), 
	.B(reg_ctrl_timers_tacpl_o[2]), 
	.A(n_132));
   AN22X0 p14750A (.Q(n_317), 
	.D(n_322), 
	.C(\sfr[38][2] ), 
	.B(n_117), 
	.A(\sfr[30][2] ));
   AN22X0 p14720A22758 (.Q(n_316), 
	.D(n_129), 
	.C(\sfr[28][2] ), 
	.B(n_331), 
	.A(\sfr[25][2] ));
   AN22X0 p14708A (.Q(n_315), 
	.D(n_299), 
	.C(reg_ctrl_alu_ov_o), 
	.B(n_297), 
	.A(\sfr[17][2] ));
   AN22X0 p14720A22720 (.Q(n_314), 
	.D(n_128), 
	.C(\sfr[29][2] ), 
	.B(n_329), 
	.A(\sfr[3][2] ));
   AO222X0 p14259A (.Q(n_313), 
	.F(reg_ctrl_fsm_data_o[2]), 
	.E(n_326), 
	.D(reg_ctrl_timers_th0_o[2]), 
	.C(n_110), 
	.B(reg_ctrl_timers_th1_o[2]), 
	.A(n_346));
   AO22X0 p14563A (.Q(n_312), 
	.D(n_345), 
	.C(reg_ctrl_ports_p2en_o[2]), 
	.B(n_357), 
	.A(reg_ctrl_ports_p0en_o[2]));
   NO2X1 p15045A (.Q(n_311), 
	.B(n_214), 
	.A(n_122));
   NO2X1 p14262A (.Q(n_310), 
	.B(n_153), 
	.A(n_139));
   AO221X0 p14887A (.Q(n_309), 
	.E(n_108), 
	.D(reg_ctrl_timers_tm1_o[2]), 
	.C(n_109), 
	.B(reg_ctrl_timers_tm0_o[2]), 
	.A(n_265));
   NO2X1 p13891A (.Q(n_308), 
	.B(n_153), 
	.A(n_122));
   AN221X0 p14469A (.Q(n_307), 
	.E(n_107), 
	.D(n_346), 
	.C(reg_ctrl_timers_th1_o[3]), 
	.B(reg_ctrl_timers_th0_o[3]), 
	.A(n_110));
   AN22X0 p14743A (.Q(n_306), 
	.D(n_129), 
	.C(\sfr[28][3] ), 
	.B(n_331), 
	.A(\sfr[25][3] ));
   AN221X0 p14450A22425 (.Q(n_305), 
	.E(n_106), 
	.D(n_322), 
	.C(\sfr[38][3] ), 
	.B(\sfr[2][3] ), 
	.A(n_323));
   AN22X0 p14721A22747 (.Q(n_304), 
	.D(n_332), 
	.C(\sfr[18][3] ), 
	.B(n_327), 
	.A(\sfr[1][3] ));
   AN22X0 p14709A22723 (.Q(n_303), 
	.D(n_132), 
	.C(reg_ctrl_timers_tacpl_o[3]), 
	.B(n_329), 
	.A(\sfr[3][3] ));
   AN22X0 p14721A22722 (.Q(n_302), 
	.D(n_128), 
	.C(\sfr[29][3] ), 
	.B(n_117), 
	.A(DFT_sdo_5));
   NO2X0 p15382A (.Q(n_301), 
	.B(n_146), 
	.A(n_122));
   AO22X0 p14455A (.Q(n_300), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[3]), 
	.B(n_354), 
	.A(\sfr[36][3] ));
   NO2X1 p14742A (.Q(n_299), 
	.B(n_214), 
	.A(n_139));
   NA3X0 p14951A (.Q(n_298), 
	.C(n_103), 
	.B(n_104), 
	.A(n_105));
   NO2I1X1 p14937A (.Q(n_297), 
	.B(n_122), 
	.AN(n_197));
   AO22X0 p14438A (.Q(n_296), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[3]), 
	.B(n_285), 
	.A(reg_ctrl_timers_tacph0_o[3]));
   AO222X0 p14138A (.Q(n_295), 
	.F(reg_ctrl_timers_th1_o[4]), 
	.E(n_346), 
	.D(reg_ctrl_ports_p1_o[4]), 
	.C(n_311), 
	.B(reg_ctrl_timers_th0_o[4]), 
	.A(n_110));
   AO221X0 p14962A (.Q(n_294), 
	.E(n_102), 
	.D(\sfr[5][4] ), 
	.C(n_114), 
	.B(\sfr[6][4] ), 
	.A(n_115));
   AN221X0 p14422A22556 (.Q(n_293), 
	.E(n_101), 
	.D(n_332), 
	.C(\sfr[18][4] ), 
	.B(\sfr[1][4] ), 
	.A(n_327));
   AN221X0 p14445A (.Q(n_292), 
	.E(n_100), 
	.D(n_324), 
	.C(\sfr[31][4] ), 
	.B(reg_ctrl_timers_dfp_o[2]), 
	.A(n_342));
   AN22X0 p14750A22726 (.Q(n_291), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[4]), 
	.B(n_117), 
	.A(\sfr[30][4] ));
   AN22X0 p14720A22751 (.Q(n_290), 
	.D(n_129), 
	.C(\sfr[28][4] ), 
	.B(n_331), 
	.A(\sfr[25][4] ));
   AN22X0 p14708A22679 (.Q(n_289), 
	.D(n_297), 
	.C(reg_ctrl_serial_ren_o), 
	.B(n_132), 
	.A(reg_ctrl_timers_tacpl_o[4]));
   AN22X0 p14720A22725 (.Q(n_288), 
	.D(n_128), 
	.C(\sfr[29][4] ), 
	.B(n_329), 
	.A(\sfr[3][4] ));
   NA3X0 p14825A (.Q(n_287), 
	.C(n_97), 
	.B(n_98), 
	.A(n_99));
   AO22X0 p14412A (.Q(n_286), 
	.D(n_345), 
	.C(reg_ctrl_ports_p2en_o[4]), 
	.B(n_357), 
	.A(reg_ctrl_ports_p0en_o[4]));
   NO2I1X0 p15239A22767 (.Q(n_285), 
	.B(n_118), 
	.AN(n_161));
   AN211X0 p14660A (.Q(n_284), 
	.D(n_95), 
	.C(n_96), 
	.B(n_345), 
	.A(reg_ctrl_ports_p2en_o[5]));
   AN221X0 p14784A (.Q(n_283), 
	.E(n_94), 
	.D(n_301), 
	.C(reg_ctrl_ports_p2_o[5]), 
	.B(reg_ctrl_ports_p0_o[5]), 
	.A(n_355));
   AN221X0 p14799A (.Q(n_282), 
	.E(n_93), 
	.D(n_339), 
	.C(reg_ctrl_ports_p3en_o[5]), 
	.B(reg_ctrl_baudrate_sm2_o), 
	.A(n_297));
   INX0 Fp22044A (.Q(n_281), 
	.A(\sfr[29][5] ));
   INX0 Fp15720A (.Q(n_280), 
	.A(n_128));
   AN222X0 p14760A (.Q(n_279), 
	.F(n_346), 
	.E(reg_ctrl_timers_th1_o[5]), 
	.D(reg_ctrl_fsm_data_o[5]), 
	.C(n_326), 
	.B(reg_ctrl_timers_th0_o[5]), 
	.A(n_110));
   AN221X0 p14644A (.Q(n_278), 
	.E(n_92), 
	.D(n_332), 
	.C(\sfr[18][5] ), 
	.B(\sfr[1][5] ), 
	.A(n_327));
   AN221X0 p14641A (.Q(n_277), 
	.E(n_91), 
	.D(n_322), 
	.C(\sfr[38][5] ), 
	.B(\sfr[2][5] ), 
	.A(n_323));
   AN22X0 p14977A (.Q(n_276), 
	.D(n_117), 
	.C(\sfr[30][5] ), 
	.B(n_299), 
	.A(\sfr[34][5] ));
   AN22X0 p14982A (.Q(n_275), 
	.D(n_132), 
	.C(reg_ctrl_timers_tacpl_o[5]), 
	.B(n_329), 
	.A(\sfr[3][5] ));
   AN221X0 p14423A (.Q(n_274), 
	.E(n_90), 
	.D(n_332), 
	.C(\sfr[18][6] ), 
	.B(\sfr[1][6] ), 
	.A(n_327));
   AN221X0 p14427A (.Q(n_273), 
	.E(n_89), 
	.D(n_322), 
	.C(\sfr[38][6] ), 
	.B(\sfr[2][6] ), 
	.A(n_323));
   AN22X0 p14751A (.Q(n_272), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[6]), 
	.B(n_117), 
	.A(\sfr[30][6] ));
   AN22X0 p14721A22744 (.Q(n_271), 
	.D(n_129), 
	.C(\sfr[28][6] ), 
	.B(n_331), 
	.A(\sfr[25][6] ));
   AN22X0 p14709A22716 (.Q(n_270), 
	.D(n_128), 
	.C(\sfr[29][6] ), 
	.B(n_329), 
	.A(\sfr[3][6] ));
   AN22X0 p14721A (.Q(n_269), 
	.D(n_285), 
	.C(reg_ctrl_timers_tacph0_o[6]), 
	.B(n_132), 
	.A(reg_ctrl_timers_tacpl_o[6]));
   AO22X0 p14491A22582 (.Q(n_268), 
	.D(n_354), 
	.C(\sfr[36][6] ), 
	.B(n_301), 
	.A(reg_ctrl_ports_p2_o[6]));
   AO221X0 p14370A (.Q(n_267), 
	.E(n_88), 
	.D(reg_ctrl_timers_th0_o[6]), 
	.C(n_110), 
	.B(reg_ctrl_timers_th1_o[6]), 
	.A(n_346));
   AO22X0 p14382A (.Q(n_266), 
	.D(n_342), 
	.C(reg_ctrl_timers_tr2_o), 
	.B(n_310), 
	.A(reg_ctrl_ports_p1en_o[6]));
   NO2X0 p14748A22773 (.Q(n_265), 
	.B(n_153), 
	.A(n_87));
   AO22X0 p15444A (.Q(n_264), 
	.D(n_85), 
	.C(reg_ctrl_timers_tl1_o[6]), 
	.B(n_86), 
	.A(reg_ctrl_timers_tl0_o[6]));
   AO22X0 p14485A22719 (.Q(n_263), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[7]), 
	.B(n_285), 
	.A(reg_ctrl_timers_tacph0_o[7]));
   NA3X0 p15202A (.Q(n_262), 
	.C(n_82), 
	.B(n_83), 
	.A(n_84));
   AN222X0 p14456A (.Q(n_261), 
	.F(n_311), 
	.E(reg_ctrl_ports_p1_o[7]), 
	.D(\sfr[18][7] ), 
	.C(n_332), 
	.B(\sfr[1][7] ), 
	.A(n_327));
   AN221X0 p14426A (.Q(n_260), 
	.E(n_81), 
	.D(n_322), 
	.C(\sfr[38][7] ), 
	.B(\sfr[2][7] ), 
	.A(n_323));
   AN22X0 p14750A22715 (.Q(n_259), 
	.D(n_117), 
	.C(\sfr[30][7] ), 
	.B(n_325), 
	.A(reg_ctrl_baudrate_smod_o));
   AN22X0 p14720A22745 (.Q(n_258), 
	.D(n_129), 
	.C(\sfr[28][7] ), 
	.B(n_331), 
	.A(\sfr[25][7] ));
   AN22X0 p14708A22718 (.Q(n_257), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[7]), 
	.B(n_132), 
	.A(reg_ctrl_timers_tacpl_o[7]));
   AN22X0 p14720A (.Q(n_256), 
	.D(n_128), 
	.C(\sfr[29][7] ), 
	.B(n_329), 
	.A(\sfr[3][7] ));
   AO221X0 p14504A (.Q(n_255), 
	.E(n_80), 
	.D(reg_ctrl_fsm_data_o[7]), 
	.C(n_326), 
	.B(reg_ctrl_timers_tm0_o[7]), 
	.A(n_265));
   AO22X0 p14546A (.Q(n_254), 
	.D(n_346), 
	.C(reg_ctrl_timers_th1_o[7]), 
	.B(n_110), 
	.A(reg_ctrl_timers_th0_o[7]));
   NA2X0 p12957A (.Q(n_253), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(reg_ctrl_fsm_addr_i[4]));
   NA2X0 p14380A (.Q(n_252), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(n_79));
   NO2I1X2 p13862A (.Q(n_251), 
	.B(reg_ctrl_fsm_bit_byte_flag_i), 
	.AN(n_78));
   AN32X0 p13626A (.Q(n_250), 
	.E(n_75), 
	.D(reg_ctrl_reset_b_i), 
	.C(n_76), 
	.B(n_77), 
	.A(n_148));
   NA2X1 p5412A (.Q(n_249), 
	.B(n_379), 
	.A(n_247));
   INX0 Fp5260A22862 (.Q(n_248), 
	.A(reg_ctrl_ports_p0en_o[0]));
   AO31X1 p15167A (.Q(n_247), 
	.D(n_75), 
	.C(n_76), 
	.B(n_77), 
	.A(reg_ctrl_fsm_addr_i[5]));
   NO2X1 p15766A (.Q(n_246), 
	.B(n_194), 
	.A(n_215));
   ON21X0 p4961A (.Q(n_245), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[0]));
   INX0 Fp5329A (.Q(n_244), 
	.A(reg_ctrl_ports_p0en_o[1]));
   ON21X0 p4961A22052 (.Q(n_243), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[1]));
   INX0 Fp5329A22886 (.Q(n_242), 
	.A(reg_ctrl_ports_p0en_o[2]));
   ON21X0 p4961A22053 (.Q(n_241), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[2]));
   INX0 Fp5260A22882 (.Q(n_240), 
	.A(reg_ctrl_ports_p0en_o[3]));
   ON21X0 p4961A22054 (.Q(n_239), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[3]));
   INX0 Fp5329A22816 (.Q(n_238), 
	.A(reg_ctrl_ports_p0en_o[4]));
   ON21X0 p4961A22055 (.Q(n_237), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[4]));
   INX0 Fp5329A22856 (.Q(n_236), 
	.A(reg_ctrl_ports_p0en_o[5]));
   ON21X0 p4961A22056 (.Q(n_235), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[5]));
   INX0 Fp5260A22876 (.Q(n_234), 
	.A(reg_ctrl_ports_p0en_o[6]));
   ON21X0 p4961A22057 (.Q(n_233), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[6]));
   INX0 Fp5260A (.Q(n_232), 
	.A(reg_ctrl_ports_p0en_o[7]));
   ON21X0 p4961A22058 (.Q(n_231), 
	.C(n_73), 
	.B(n_74), 
	.A(reg_ctrl_ports_p0en_o[7]));
   AN21X0 p14720A22790 (.Q(n_230), 
	.C(n_72), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_timers_tr0_o));
   NA2X0 p15960A (.Q(n_229), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_228));
   NA2X1 p15858A (.Q(n_228), 
	.B(n_70), 
	.A(n_71));
   NO2X0 p14730A22783 (.Q(n_227), 
	.B(n_153), 
	.A(reg_ctrl_timers_tr0_o));
   AN21X0 p14708A22789 (.Q(n_226), 
	.C(n_72), 
	.B(reg_ctrl_reset_b_i), 
	.A(reg_ctrl_timers_tr1_o));
   OR2X0 p15883A (.Q(n_225), 
	.B(n_200), 
	.A(n_224));
   AND2X0 p15572A (.Q(n_224), 
	.B(n_69), 
	.A(n_71));
   NO2X0 p14760A22785 (.Q(n_223), 
	.B(n_153), 
	.A(reg_ctrl_timers_tr1_o));
   NA2X0 p16120A (.Q(n_222), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_221));
   NA2X1 p16003A22787 (.Q(n_221), 
	.B(n_68), 
	.A(n_251));
   NA2X0 p16120A22763 (.Q(n_220), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_219));
   NA2X1 p16003A (.Q(n_219), 
	.B(n_67), 
	.A(n_251));
   OR2X0 p15892A (.Q(n_218), 
	.B(n_200), 
	.A(n_217));
   AND2X4 p15607A (.Q(n_217), 
	.B(n_66), 
	.A(n_71));
   NO2X1 p15159A (.Q(n_216), 
	.B(n_200), 
	.A(n_65));
   NA2X1 p15434A (.Q(n_215), 
	.B(n_78), 
	.A(n_64));
   NA2X0 p14543A (.Q(n_214), 
	.B(n_63), 
	.A(n_53));
   NO2X1 p15231A (.Q(n_213), 
	.B(reg_ctrl_fsm_addr_i[5]), 
	.A(n_62));
   INX0 Fp20515A (.Q(n_212), 
	.A(reg_ctrl_ports_p1en_o[0]));
   OR3X0 p15631A (.Q(n_211), 
	.C(reg_ctrl_fsm_addr_i[5]), 
	.B(n_143), 
	.A(n_215));
   NO2I1X1 p15239A (.Q(n_210), 
	.B(n_148), 
	.AN(n_61));
   INX0 Fp20095A (.Q(n_209), 
	.A(reg_ctrl_ports_p1en_o[1]));
   INX0 Fp20484A (.Q(n_208), 
	.A(reg_ctrl_ports_p1en_o[2]));
   INX0 Fp20503A (.Q(n_207), 
	.A(reg_ctrl_ports_p1en_o[3]));
   INX0 Fp20491A (.Q(n_206), 
	.A(reg_ctrl_ports_p1en_o[4]));
   INX0 Fp19544A (.Q(n_205), 
	.A(reg_ctrl_ports_p1en_o[5]));
   INX0 Fp20515A22825 (.Q(n_204), 
	.A(reg_ctrl_ports_p1en_o[6]));
   INX0 Fp20484A22874 (.Q(n_203), 
	.A(reg_ctrl_ports_p1en_o[7]));
   NA2X0 p15866A (.Q(n_202), 
	.B(reg_ctrl_interrupt_ie_o[4]), 
	.A(reg_ctrl_interrupt_ie_o[7]));
   NO2I1X0 p21522A (.Q(n_201), 
	.B(reg_ctrl_serial_load_sbuf_i), 
	.AN(load_sbuf_prev));
   INX0 Fp9980910A (.Q(n_200), 
	.A(reg_ctrl_reset_b_i));
   AN21X0 p16439A (.Q(n_199), 
	.C(n_148), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_253));
   NA2X0 p15852A22771 (.Q(n_198), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_215));
   NO2X1 p13809A (.Q(n_197), 
	.B(n_144), 
	.A(n_253));
   OR2X0 p16024A (.Q(n_196), 
	.B(n_200), 
	.A(n_549));
   NA2X0 p16251A (.Q(n_195), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_60));
   NA2X1 p12577A (.Q(n_194), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_59));
   NO2X0 p5400A (.Q(n_193), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.A(n_58));
   ON21X0 p15483A22708 (.Q(n_192), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[0]));
   NO2X0 p16270A (.Q(n_191), 
	.B(n_146), 
	.A(n_215));
   AND3X0 p5352A (.Q(n_190), 
	.C(reg_ctrl_ext_rom_rd_i), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_57));
   ON21X0 p15483A22709 (.Q(n_189), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[1]));
   ON21X0 p15483A22710 (.Q(n_188), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[2]));
   ON21X0 p15483A22711 (.Q(n_187), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[3]));
   ON21X0 p15483A22712 (.Q(n_186), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[4]));
   ON21X0 p15483A22713 (.Q(n_185), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[5]));
   ON21X0 p15483A (.Q(n_184), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[6]));
   ON21X0 p15483A22707 (.Q(n_183), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_57), 
	.A(reg_ctrl_ports_p2en_o[7]));
   AND2X0 p15478A (.Q(n_182), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_179));
   OR2X0 p12577A22792 (.Q(n_181), 
	.B(n_56), 
	.A(n_14));
   NA2I1X1 p14771A (.Q(n_180), 
	.B(n_71), 
	.AN(n_55));
   NA2X0 p15437A (.Q(n_179), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(n_15));
   INX0 Fp16111A22696 (.Q(n_178), 
	.A(n_171));
   NA3X0 p15838A22781 (.Q(n_177), 
	.C(reg_ctrl_fsm_addr_i[5]), 
	.B(n_53), 
	.A(n_54));
   NO2X0 p15047A (.Q(n_176), 
	.B(n_171), 
	.A(n_389));
   NO2I1X0 p16491A (.Q(n_175), 
	.B(n_52), 
	.AN(n_439));
   NO2I1X0 p16491A22730 (.Q(n_174), 
	.B(n_51), 
	.AN(n_439));
   NO2I1X0 p14664A (.Q(n_173), 
	.B(n_143), 
	.AN(n_148));
   INX0 Fp20463A (.Q(n_172), 
	.A(reg_ctrl_ports_p3en_o[2]));
   AND2X1 p15447A (.Q(n_171), 
	.B(n_61), 
	.A(n_144));
   INX0 Fp16164A22778 (.Q(n_170), 
	.A(n_177));
   INX0 Fp20451A22811 (.Q(n_168), 
	.A(reg_ctrl_ports_p3en_o[4]));
   INX0 Fp20451A (.Q(n_167), 
	.A(reg_ctrl_ports_p3en_o[5]));
   NO2I1X1 p15696A (.Q(n_166), 
	.B(reg_ctrl_ports_p3en_o[6]), 
	.AN(reg_ctrl_ports_p3_i[6]));
   ON211X0 p5842A (.Q(n_165), 
	.D(reg_ctrl_reset_b_i), 
	.C(n_50), 
	.B(n_177), 
	.A(reg_ctrl_ports_p3en_o[6]));
   NO2I1X1 p15696A22805 (.Q(n_164), 
	.B(reg_ctrl_ports_p3en_o[7]), 
	.AN(reg_ctrl_ports_p3_i[7]));
   ON211X0 p5842A22559 (.Q(n_163), 
	.D(reg_ctrl_reset_b_i), 
	.C(n_49), 
	.B(n_177), 
	.A(reg_ctrl_ports_p3en_o[7]));
   ON21X1 p15141D (.Q(n_162), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_44), 
	.A(n_253));
   NO2I1X1 p13101A (.Q(n_161), 
	.B(n_253), 
	.AN(n_148));
   NO2I1X0 p15269A (.Q(n_160), 
	.B(n_200), 
	.AN(n_158));
   NO2X0 p15830A22796 (.Q(n_159), 
	.B(n_200), 
	.A(n_4));
   NA2X0 p15215A (.Q(n_158), 
	.B(n_47), 
	.A(n_48));
   NA2X0 p11467A (.Q(n_157), 
	.B(n_44), 
	.A(n_43));
   NA2X1 p15147A (.Q(n_156), 
	.B(n_47), 
	.A(n_64));
   NA2X0 p15389A (.Q(n_155), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_46));
   NA2X0 p15566A (.Q(n_154), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_156));
   OR2X1 p13533A (.Q(n_153), 
	.B(n_200), 
	.A(n_46));
   EN3X0 p14639A (.Q(n_152), 
	.C(\sfr[36][0] ), 
	.B(\sfr[36][1] ), 
	.A(n_45));
   EO2X0 p14596A (.Q(n_151), 
	.B(SPCASCAN_N11), 
	.A(\sfr[36][6] ));
   EO2X0 p14568A (.Q(n_150), 
	.B(DFT_sdo_7), 
	.A(\sfr[36][4] ));
   AN21X0 p16020A22705 (.Q(n_149), 
	.C(n_160), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_43));
   NO2X0 p12355A (.Q(n_148), 
	.B(n_200), 
	.A(n_44));
   NA2X0 p15077A (.Q(n_147), 
	.B(reg_ctrl_fsm_addr_i[5]), 
	.A(n_43));
   OR2X0 p13475A (.Q(n_146), 
	.B(n_56), 
	.A(reg_ctrl_fsm_addr_i[3]));
   NA2I1X0 p15732A22731 (.Q(n_145), 
	.B(n_154), 
	.AN(n_182));
   NA2X0 p13505A (.Q(n_144), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_44));
   NA2X0 p13304A (.Q(n_143), 
	.B(reg_ctrl_fsm_addr_i[4]), 
	.A(n_14));
   ON21X0 p14616A (.Q(n_142), 
	.C(reg_ctrl_reset_b_i), 
	.B(n_60), 
	.A(reg_ctrl_timers_tr2_o));
   NO2X0 p14660A22782 (.Q(n_141), 
	.B(n_194), 
	.A(reg_ctrl_timers_tr2_o));
   NO2X0 p14320A (.Q(n_140), 
	.B(n_252), 
	.A(n_42));
   OR2X1 p13255A (.Q(n_139), 
	.B(n_40), 
	.A(n_41));
   AN222X0 p15244A (.Q(n_138), 
	.F(n_114), 
	.E(\sfr[5][0] ), 
	.D(reg_ctrl_interrupt_ip_o[0]), 
	.C(n_38), 
	.B(reg_ctrl_interrupt_ie_o[0]), 
	.A(n_39));
   AN22X0 p15598A (.Q(n_137), 
	.D(n_297), 
	.C(reg_ctrl_interrupt_ri_o), 
	.B(n_299), 
	.A(\sfr[34][0] ));
   AN22X0 p15546A (.Q(n_136), 
	.D(n_115), 
	.C(\sfr[6][0] ), 
	.B(n_37), 
	.A(\sfr[4][0] ));
   NO2X0 p12951A (.Q(n_135), 
	.B(reg_ctrl_fsm_bit_byte_flag_i), 
	.A(reg_ctrl_fsm_rd_b_i));
   AO321X0 p13965A (.Q(n_134), 
	.F(n_34), 
	.E(n_35), 
	.D(reg_ctrl_reset_b_i), 
	.C(n_36), 
	.B(n_253), 
	.A(n_148));
   ON33X0 p14687A (.Q(n_133), 
	.F(reg_ctrl_fsm_addr_i[7]), 
	.E(reg_ctrl_fsm_rd_b_i), 
	.D(n_200), 
	.C(n_41), 
	.B(reg_ctrl_fsm_addr_i[6]), 
	.A(n_194));
   NO2I1X0 p15295A (.Q(n_132), 
	.B(n_116), 
	.AN(n_161));
   AND2X0 p14840A (.Q(n_131), 
	.B(n_173), 
	.A(n_123));
   AO22X0 p13973A22727 (.Q(n_130), 
	.D(n_117), 
	.C(\sfr[30][0] ), 
	.B(n_329), 
	.A(\sfr[3][0] ));
   AND2X0 p15155A (.Q(n_129), 
	.B(n_161), 
	.A(n_33));
   NO2I1X0 p15505A (.Q(n_128), 
	.B(n_127), 
	.AN(n_161));
   NA2I1X0 p12695A (.Q(n_127), 
	.B(n_67), 
	.AN(n_42));
   AN22X0 p15440A22717 (.Q(n_126), 
	.D(n_85), 
	.C(reg_ctrl_timers_tl1_o[0]), 
	.B(n_86), 
	.A(reg_ctrl_timers_tl0_o[0]));
   AN22X0 p15257A (.Q(n_125), 
	.D(n_109), 
	.C(reg_ctrl_timers_tm1_o[0]), 
	.B(n_265), 
	.A(reg_ctrl_timers_tm0_o[0]));
   NA2X0 p14965A (.Q(n_124), 
	.B(n_110), 
	.A(reg_ctrl_timers_th0_o[0]));
   NO2X1 p13974A (.Q(n_123), 
	.B(n_55), 
	.A(n_32));
   NA2I1X1 p12246A (.Q(n_122), 
	.B(n_77), 
	.AN(n_41));
   NA3X0 p15123A (.Q(n_121), 
	.C(n_29), 
	.B(n_30), 
	.A(n_31));
   NA3X0 p14545A (.Q(n_120), 
	.C(n_26), 
	.B(n_27), 
	.A(n_28));
   AO22X0 p13959A (.Q(n_119), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[1]), 
	.B(n_310), 
	.A(FE_OFCN296_core_ports_p1en_o_1_));
   NA2X0 p14225A (.Q(n_118), 
	.B(n_69), 
	.A(n_25));
   NO2I1X0 p14890A22760 (.Q(n_117), 
	.B(n_87), 
	.AN(n_161));
   NA2X0 p13801A (.Q(n_116), 
	.B(n_70), 
	.A(n_25));
   NO2X0 p13850A (.Q(n_115), 
	.B(n_194), 
	.A(n_87));
   NO2X0 p12989A (.Q(n_114), 
	.B(n_194), 
	.A(n_127));
   AO222X0 p14379A (.Q(n_113), 
	.F(reg_ctrl_interrupt_ip_o[2]), 
	.E(n_38), 
	.D(\sfr[4][2] ), 
	.C(n_37), 
	.B(FE_OFCN295_core_interrupt_ie_o_2_), 
	.A(n_39));
   AO22X0 p13973A (.Q(n_112), 
	.D(n_324), 
	.C(\sfr[31][2] ), 
	.B(n_323), 
	.A(\sfr[2][2] ));
   AO22X0 p13977A22721 (.Q(n_111), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[2]), 
	.B(n_325), 
	.A(reg_ctrl_baudrate_rs232_o));
   NO2I1X0 p14842A22788 (.Q(n_110), 
	.B(n_153), 
	.AN(n_33));
   NO2I1X0 p14042A (.Q(n_109), 
	.B(n_153), 
	.AN(n_123));
   AO22X0 p14700A (.Q(n_108), 
	.D(n_85), 
	.C(reg_ctrl_timers_tl1_o[2]), 
	.B(n_86), 
	.A(reg_ctrl_timers_tl0_o[2]));
   AO221X0 p13831A (.Q(n_107), 
	.E(n_24), 
	.D(reg_ctrl_fsm_data_o[3]), 
	.C(n_326), 
	.B(reg_ctrl_timers_gate_t0_o), 
	.A(n_358));
   AO22X0 p14002A (.Q(n_106), 
	.D(n_324), 
	.C(\sfr[31][3] ), 
	.B(n_325), 
	.A(\sfr[7][3] ));
   AN22X0 p15524A (.Q(n_105), 
	.D(n_85), 
	.C(reg_ctrl_timers_tl1_o[3]), 
	.B(n_86), 
	.A(reg_ctrl_timers_tl0_o[3]));
   AN22X0 p15148A (.Q(n_104), 
	.D(n_109), 
	.C(reg_ctrl_timers_tm1_o[3]), 
	.B(n_265), 
	.A(reg_ctrl_timers_tm0_o[3]));
   NA2X0 p14824A (.Q(n_103), 
	.B(n_340), 
	.A(reg_ctrl_interrupt_int1_o));
   AO222X0 p14334A (.Q(n_102), 
	.F(reg_ctrl_interrupt_ip_o[4]), 
	.E(n_38), 
	.D(reg_ctrl_interrupt_ie_o[4]), 
	.C(n_39), 
	.B(\sfr[4][4] ), 
	.A(n_37));
   AO22X0 p13973A22724 (.Q(n_101), 
	.D(n_326), 
	.C(reg_ctrl_fsm_data_o[4]), 
	.B(n_323), 
	.A(\sfr[2][4] ));
   AO22X0 p13977A22674 (.Q(n_100), 
	.D(n_322), 
	.C(\sfr[38][4] ), 
	.B(n_325), 
	.A(\sfr[7][4] ));
   AN22X0 p15440A (.Q(n_99), 
	.D(n_85), 
	.C(reg_ctrl_timers_tl1_o[4]), 
	.B(n_86), 
	.A(reg_ctrl_timers_tl0_o[4]));
   AN22X0 p14999A (.Q(n_98), 
	.D(n_109), 
	.C(reg_ctrl_timers_tm1_o[4]), 
	.B(n_265), 
	.A(reg_ctrl_timers_tm0_o[4]));
   NA2X0 p14684A (.Q(n_97), 
	.B(n_358), 
	.A(reg_ctrl_timers_m0_t1_o));
   AO221X0 p14124A (.Q(n_96), 
	.E(n_23), 
	.D(reg_ctrl_timers_tm0_o[5]), 
	.C(n_265), 
	.B(reg_ctrl_ports_p0en_o[5]), 
	.A(n_357));
   AO221X0 p14014A (.Q(n_95), 
	.E(n_22), 
	.D(reg_ctrl_ports_p3_o[5]), 
	.C(n_340), 
	.B(reg_ctrl_ports_p1_o[5]), 
	.A(n_311));
   AO22X0 p14316A (.Q(n_94), 
	.D(n_131), 
	.C(reg_ctrl_timers_tacph1_o[5]), 
	.B(n_354), 
	.A(DFT_sdo_7));
   AO22X0 p14370A22714 (.Q(n_93), 
	.D(n_343), 
	.C(reg_ctrl_ports_p4_o[5]), 
	.B(n_285), 
	.A(reg_ctrl_timers_tacph0_o[5]));
   AO22X0 p14196A (.Q(n_92), 
	.D(n_129), 
	.C(\sfr[28][5] ), 
	.B(n_331), 
	.A(\sfr[25][5] ));
   AO22X0 p14191A (.Q(n_91), 
	.D(n_324), 
	.C(\sfr[31][5] ), 
	.B(n_325), 
	.A(\sfr[7][5] ));
   AO221X0 p13703A (.Q(n_90), 
	.E(n_21), 
	.D(reg_ctrl_alu_ac_o), 
	.C(n_299), 
	.B(\sfr[9][6] ), 
	.A(n_358));
   AO22X0 p13978A (.Q(n_89), 
	.D(n_324), 
	.C(\sfr[31][6] ), 
	.B(n_325), 
	.A(\sfr[7][6] ));
   AO22X0 p14213A (.Q(n_88), 
	.D(n_326), 
	.C(reg_ctrl_fsm_data_o[6]), 
	.B(n_109), 
	.A(reg_ctrl_timers_tm1_o[6]));
   NA2X0 p13667A (.Q(n_87), 
	.B(n_66), 
	.A(n_25));
   NO2X0 p14039A (.Q(n_86), 
	.B(n_153), 
	.A(n_116));
   NO2X0 p14462A (.Q(n_85), 
	.B(n_153), 
	.A(n_118));
   AN222X0 p14856A (.Q(n_84), 
	.F(n_39), 
	.E(reg_ctrl_interrupt_ie_o[7]), 
	.D(reg_ctrl_interrupt_txrxf_o), 
	.C(n_342), 
	.B(reg_ctrl_interrupt_tf1_o), 
	.A(n_308));
   AN22X0 p15211A (.Q(n_83), 
	.D(n_299), 
	.C(reg_ctrl_alu_cy_o), 
	.B(n_114), 
	.A(\sfr[5][7] ));
   AN22X0 p15552A (.Q(n_82), 
	.D(n_115), 
	.C(\sfr[6][7] ), 
	.B(n_37), 
	.A(DFT_sdo));
   AO22X0 p13977A (.Q(n_81), 
	.D(n_324), 
	.C(\sfr[31][7] ), 
	.B(n_38), 
	.A(\sfr[24][7] ));
   AO222X0 p13759A (.Q(n_80), 
	.F(reg_ctrl_timers_tl1_o[7]), 
	.E(n_85), 
	.D(reg_ctrl_timers_tm1_o[7]), 
	.C(n_109), 
	.B(reg_ctrl_timers_tl0_o[7]), 
	.A(n_86));
   NO2X0 p13130A (.Q(n_79), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(reg_ctrl_fsm_addr_i[2]));
   NO2I1X0 p13155A (.Q(n_78), 
	.B(reg_ctrl_fsm_wr_b_i), 
	.AN(n_77));
   NO2X0 p12266A (.Q(n_77), 
	.B(n_3), 
	.A(reg_ctrl_fsm_addr_i[6]));
   ON31X0 p13966A (.Q(n_76), 
	.D(n_253), 
	.C(n_20), 
	.B(n_55), 
	.A(n_11));
   AO221X0 p12853A (.Q(n_75), 
	.E(reg_ctrl_fsm_wr_b_i), 
	.D(n_18), 
	.C(n_64), 
	.B(n_19), 
	.A(n_77));
   OR2X1 p13804A (.Q(n_74), 
	.B(n_250), 
	.A(reg_ctrl_ext_ram_wr_i));
   ON21X1 p4386A (.Q(n_73), 
	.C(n_17), 
	.B(reg_ctrl_ext_rom_rd_i), 
	.A(reg_ctrl_ext_ram_rd_i));
   INX0 Fp15852A (.Q(n_72), 
	.A(n_155));
   AND2X0 p14360A (.Q(n_71), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_251));
   NO2X0 p11546A (.Q(n_70), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(reg_ctrl_fsm_addr_i[2]));
   NO2I1X0 p14615A (.Q(n_69), 
	.B(reg_ctrl_fsm_addr_i[2]), 
	.AN(reg_ctrl_fsm_addr_i[0]));
   AND2X0 p13481A (.Q(n_68), 
	.B(n_11), 
	.A(n_66));
   NO2X0 p13045A (.Q(n_67), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_55));
   NO2I1X0 p13277A (.Q(n_66), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.AN(reg_ctrl_fsm_addr_i[2]));
   INX0 Fp15028A (.Q(n_65), 
	.A(n_180));
   NA2I1X1 p11750A (.Q(n_64), 
	.B(n_16), 
	.AN(reg_ctrl_fsm_bit_byte_flag_i));
   INX0 Fp13925A (.Q(n_63), 
	.A(n_144));
   NA3X0 p14945A22775 (.Q(n_62), 
	.C(reg_ctrl_fsm_addr_i[4]), 
	.B(n_78), 
	.A(n_48));
   NA2X0 p15101A (.Q(n_61), 
	.B(reg_ctrl_reset_b_i), 
	.A(n_62));
   NA2X2 p12234A (.Q(n_60), 
	.B(n_14), 
	.A(n_4));
   INX0 Fp12513A (.Q(n_59), 
	.A(n_60));
   INX0 Fp16051A (.Q(n_58), 
	.A(n_57));
   NA3X0 p15887A (.Q(n_57), 
	.C(n_15), 
	.B(n_78), 
	.A(n_48));
   NA2X0 p12323A (.Q(n_56), 
	.B(n_148), 
	.A(n_43));
   NA2X0 p12625A (.Q(n_55), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(reg_ctrl_fsm_addr_i[2]));
   INX0 Fp15590A (.Q(n_54), 
	.A(n_215));
   INX0 Fp13989A22802 (.Q(n_53), 
	.A(n_143));
   INX1 Fp16720A22870 (.Q(n_52), 
	.A(reg_ctrl_fsm_data_i[0]));
   INX1 Fp16726A22813 (.Q(n_51), 
	.A(reg_ctrl_fsm_data_i[1]));
   NA3X0 p5700A (.Q(n_50), 
	.C(n_379), 
	.B(n_177), 
	.A(reg_ctrl_ports_p3en_o[6]));
   NA3X0 p5700A22706 (.Q(n_49), 
	.C(n_379), 
	.B(n_177), 
	.A(reg_ctrl_ports_p3en_o[7]));
   AND2X0 p12360A (.Q(n_48), 
	.B(n_14), 
	.A(n_64));
   NO2X0 p15038A (.Q(n_47), 
	.B(reg_ctrl_fsm_wr_b_i), 
	.A(n_40));
   NA2X0 p13434A (.Q(n_46), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(n_4));
   EN2X0 p14679A (.Q(n_45), 
	.B(\sfr[36][3] ), 
	.A(\sfr[36][2] ));
   INX0 Fp11663A22867 (.Q(n_44), 
	.A(reg_ctrl_fsm_addr_i[5]));
   INX0 Fp11406A22839 (.Q(n_43), 
	.A(reg_ctrl_fsm_addr_i[4]));
   NA2X2 p12336A (.Q(n_42), 
	.B(n_135), 
	.A(n_77));
   NA2I1X0 p11994A (.Q(n_41), 
	.B(n_64), 
	.AN(reg_ctrl_fsm_rd_b_i));
   NA2X0 p13132A (.Q(n_40), 
	.B(reg_ctrl_fsm_addr_i[7]), 
	.A(reg_ctrl_fsm_addr_i[6]));
   NO2X0 p13020A (.Q(n_39), 
	.B(n_181), 
	.A(n_122));
   NO2I1X1 p13323A (.Q(n_38), 
	.B(n_122), 
	.AN(n_161));
   NO2I1X0 p13749A (.Q(n_37), 
	.B(n_194), 
	.AN(n_33));
   AO22X0 p14110A (.Q(n_36), 
	.D(n_11), 
	.C(reg_ctrl_fsm_addr_i[2]), 
	.B(reg_ctrl_fsm_addr_i[1]), 
	.A(n_55));
   ON321X0 p14021A (.Q(n_35), 
	.F(n_12), 
	.E(n_143), 
	.D(n_13), 
	.C(n_43), 
	.B(n_79), 
	.A(reg_ctrl_fsm_addr_i[5]));
   ON22X0 p14049A (.Q(n_34), 
	.D(n_56), 
	.C(n_13), 
	.B(n_146), 
	.A(n_11));
   NO2I1X1 p13694A (.Q(n_33), 
	.B(n_42), 
	.AN(n_68));
   INX0 Fp13665A (.Q(n_32), 
	.A(n_25));
   AN222X0 p14722A (.Q(n_31), 
	.F(n_38), 
	.E(reg_ctrl_interrupt_ip_o[1]), 
	.D(reg_ctrl_interrupt_ie_o[1]), 
	.C(n_39), 
	.B(\sfr[5][1] ), 
	.A(n_114));
   AN22X0 p15002A (.Q(n_30), 
	.D(n_297), 
	.C(reg_ctrl_interrupt_ti_o), 
	.B(n_308), 
	.A(reg_ctrl_interrupt_ie0_o));
   AN22X0 p15035A (.Q(n_29), 
	.D(n_115), 
	.C(\sfr[6][1] ), 
	.B(n_37), 
	.A(\sfr[4][1] ));
   AN22X0 p14980A (.Q(n_28), 
	.D(n_85), 
	.C(reg_ctrl_timers_tl1_o[1]), 
	.B(n_86), 
	.A(reg_ctrl_timers_tl0_o[1]));
   AN22X0 p14733A (.Q(n_27), 
	.D(n_109), 
	.C(reg_ctrl_timers_tm1_o[1]), 
	.B(n_265), 
	.A(reg_ctrl_timers_tm0_o[1]));
   NA2X0 p14441A (.Q(n_26), 
	.B(n_110), 
	.A(reg_ctrl_timers_th0_o[1]));
   NO2X0 p13596A (.Q(n_25), 
	.B(n_11), 
	.A(n_42));
   NA3X1 p14313A (.Q(n_24), 
	.C(n_8), 
	.B(n_9), 
	.A(n_10));
   AO222X0 p13858A (.Q(n_23), 
	.F(reg_ctrl_timers_tl1_o[5]), 
	.E(n_85), 
	.D(reg_ctrl_timers_tm1_o[5]), 
	.C(n_109), 
	.B(reg_ctrl_timers_tl0_o[5]), 
	.A(n_86));
   AO221X0 p13411A (.Q(n_22), 
	.E(n_7), 
	.D(reg_ctrl_timers_m1_t1_o), 
	.C(n_358), 
	.B(reg_ctrl_ports_p1en_o[5]), 
	.A(n_310));
   AO221X0 p13645A (.Q(n_21), 
	.E(n_6), 
	.D(\sfr[6][6] ), 
	.C(n_115), 
	.B(\sfr[4][6] ), 
	.A(n_37));
   NO2X0 p13820A (.Q(n_20), 
	.B(reg_ctrl_fsm_addr_i[3]), 
	.A(reg_ctrl_fsm_addr_i[4]));
   ON32X0 p12865A (.Q(n_19), 
	.E(n_48), 
	.D(n_157), 
	.C(n_14), 
	.B(n_5), 
	.A(reg_ctrl_fsm_addr_i[5]));
   ON21X0 p13198A (.Q(n_18), 
	.C(n_40), 
	.B(n_3), 
	.A(n_4));
   INX0 Fp14610A (.Q(n_17), 
	.A(n_74));
   NA2X0 p11598A (.Q(n_16), 
	.B(n_11), 
	.A(n_70));
   INX0 Fp15248A22801 (.Q(n_15), 
	.A(n_147));
   INX0 Fp12206A (.Q(n_14), 
	.A(reg_ctrl_fsm_addr_i[3]));
   NA2X0 p14152A (.Q(n_13), 
	.B(reg_ctrl_fsm_addr_i[0]), 
	.A(n_11));
   NA2X0 p13920A (.Q(n_12), 
	.B(reg_ctrl_fsm_addr_i[6]), 
	.A(n_16));
   INX0 Fp11740A22847 (.Q(n_11), 
	.A(reg_ctrl_fsm_addr_i[1]));
   AN222X0 p13924A (.Q(n_10), 
	.F(n_38), 
	.E(reg_ctrl_interrupt_ip_o[3]), 
	.D(reg_ctrl_interrupt_ie_o[3]), 
	.C(n_39), 
	.B(reg_ctrl_interrupt_ie1_o), 
	.A(n_308));
   AN22X0 p14274A (.Q(n_9), 
	.D(n_115), 
	.C(\sfr[6][3] ), 
	.B(n_37), 
	.A(\sfr[4][3] ));
   NA2X0 p14525A (.Q(n_8), 
	.B(n_114), 
	.A(\sfr[5][3] ));
   NA3X2 p14056A (.Q(n_7), 
	.C(n_0), 
	.B(n_1), 
	.A(n_2));
   AO222X0 p13071A (.Q(n_6), 
	.F(reg_ctrl_interrupt_ip_o[6]), 
	.E(n_38), 
	.D(reg_ctrl_interrupt_ie_o[6]), 
	.C(n_39), 
	.B(\sfr[5][6] ), 
	.A(n_114));
   INX0 Fp13268A (.Q(n_5), 
	.A(n_79));
   INX0 Fp12005A22798 (.Q(n_4), 
	.A(n_157));
   INX0 Fp12213A22810 (.Q(n_3), 
	.A(reg_ctrl_fsm_addr_i[7]));
   AN222X0 p13678A (.Q(n_2), 
	.F(n_38), 
	.E(reg_ctrl_interrupt_ip_o[5]), 
	.D(reg_ctrl_interrupt_ie_o[5]), 
	.C(n_39), 
	.B(\sfr[5][5] ), 
	.A(n_114));
   AN22X0 p13996A (.Q(n_1), 
	.D(n_342), 
	.C(reg_ctrl_interrupt_tf2_o), 
	.B(n_308), 
	.A(reg_ctrl_interrupt_tf0_o));
   AN22X0 p14029A (.Q(n_0), 
	.D(n_115), 
	.C(\sfr[6][5] ), 
	.B(n_37), 
	.A(\sfr[4][5] ));
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
	core_timers_tacph1_o, 
	core_timers_tacph0_o, 
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
	DFT_sdi_9, 
	DFT_sdi_10, 
	DFT_sdo_11, 
	DFT_sdi_12, 
	DFT_sdo_13, 
	DFT_sdi_14, 
	DFT_sdo_15, 
	DFT_sdi_16, 
	DFT_sdo_17, 
	SPCASCAN_N0, 
	FE_PT1_top_p4_a_o_5_, 
	FE_PT1_top_p3_en_o_5_, 
	FE_PT1_top_p3_en_o_4_, 
	FE_PT1_top_p3_en_o_3_, 
	FE_PT1_top_p3_en_o_2_, 
	FE_PT1_top_p3_en_o_1_, 
	FE_PT1_top_p3_en_o_0_, 
	top_clock_mem_i__L1_N1, 
	top_clock_mem_i__L1_N2, 
	top_clock_mem_i__L1_N3, 
	top_clock_mem_i__L1_N4, 
	top_clock_mem_i__L1_N5, 
	top_clock_mem_i__L1_N6, 
	top_clock_mem_i__L1_N7, 
	top_clock_mem_i__L1_N8, 
	top_clock_mem_i__L1_N9, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N2, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N8);
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
   output [7:0] core_timers_tacph1_o;
   output [7:0] core_timers_tacph0_o;
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
   input DFT_sdi_9;
   input DFT_sdi_10;
   output DFT_sdo_11;
   input DFT_sdi_12;
   output DFT_sdo_13;
   input DFT_sdi_14;
   output DFT_sdo_15;
   input DFT_sdi_16;
   output DFT_sdo_17;
   output SPCASCAN_N0;
   input FE_PT1_top_p4_a_o_5_;
   input FE_PT1_top_p3_en_o_5_;
   input FE_PT1_top_p3_en_o_4_;
   input FE_PT1_top_p3_en_o_3_;
   input FE_PT1_top_p3_en_o_2_;
   input FE_PT1_top_p3_en_o_1_;
   input FE_PT1_top_p3_en_o_0_;
   input top_clock_mem_i__L1_N1;
   input top_clock_mem_i__L1_N2;
   input top_clock_mem_i__L1_N3;
   input top_clock_mem_i__L1_N4;
   input top_clock_mem_i__L1_N5;
   input top_clock_mem_i__L1_N6;
   input top_clock_mem_i__L1_N7;
   input top_clock_mem_i__L1_N8;
   input top_clock_mem_i__L1_N9;
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N2;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N8;

   // Internal wires
   wire FE_OFCN299_mem_ctrl_fsm_rom_data_3_;
   wire FE_OFN261_fsm_pcau_offset_7_;
   wire FE_OFN260_fsm_pcau_offset_7_;
   wire FE_OFN257_fsm_alu_operand1_3_;
   wire FE_OFN256_fsm_alu_operand1_3_;
   wire FE_OFN255_fsm_alu_operand1_2_;
   wire FE_OFN254_fsm_alu_operand1_2_;
   wire FE_OFN253_fsm_alu_operand1_1_;
   wire FE_OFN252_fsm_alu_operand1_1_;
   wire FE_OFN251_fsm_mem_ctrl_ram_addr_6_;
   wire FE_OFN250_fsm_mem_ctrl_ram_addr_6_;
   wire FE_OFN249_fsm_alu_operand1_7_;
   wire FE_OFN247_fsm_alu_operand1_6_;
   wire FE_OFN245_fsm_alu_operand1_5_;
   wire FE_OFN244_fsm_alu_operand1_4_;
   wire FE_OFN243_fsm_alu_operand1_4_;
   wire FE_OFN242_fsm_alu_operand1_0_;
   wire FE_OFN241_fsm_alu_operand1_0_;
   wire FE_OFN240_fsm_alu_operand2_3_;
   wire FE_OFN239_fsm_alu_operand2_3_;
   wire FE_OFN237_fsm_alu_operand2_5_;
   wire FE_OFN236_fsm_alu_operand2_5_;
   wire FE_OFN233_fsm_alu_operand2_2_;
   wire FE_OFN232_fsm_alu_operand2_1_;
   wire FE_OFN231_fsm_alu_operand2_1_;
   wire FE_OFN225_fsm_ext_ram;
   wire FE_OFN224_fsm_ext_ram;
   wire FE_OFN223_fsm_mem_ctrl_rom_rd_b;
   wire FE_OFN222_fsm_mem_ctrl_ram_wr_b;
   wire FE_OFN221_fsm_mem_ctrl_ram_wr_b;
   wire FE_OFN219_fsm_mem_ctrl_ram_rd_b;
   wire FE_OFN218_fsm_mem_ctrl_ram_rd_b;
   wire FE_OFN4_fsm_reg_ctrl_data_1_;
   wire FE_OFN3_fsm_reg_ctrl_data_2_;
   wire FE_OFN2_fsm_reg_ctrl_data_0_;
   wire FE_OFN1_fsm_reg_ctrl_data_3_;
   wire FE_OFN0_fsm_mem_ctrl_ram_addr_0_;
   wire SPCASCAN_N11;
   wire UNCONNECTED3;
   wire UNCONNECTED4;
   wire UNCONNECTED5;
   wire UNCONNECTED6;
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
   wire \alu_fsm_result_temp[0] ;
   wire \alu_fsm_result_temp[1] ;
   wire \alu_fsm_result_temp[2] ;
   wire \alu_fsm_result_temp[3] ;
   wire \alu_fsm_result_temp[4] ;
   wire \alu_fsm_result_temp[5] ;
   wire \alu_fsm_result_temp[6] ;
   wire \alu_fsm_result_temp[7] ;
   wire \alu_fsm_result_temp[8] ;
   wire \alu_fsm_result_temp[9] ;
   wire \alu_fsm_result_temp[10] ;
   wire \alu_fsm_result_temp[11] ;
   wire \alu_fsm_result_temp[12] ;
   wire \alu_fsm_result_temp[13] ;
   wire \alu_fsm_result_temp[14] ;
   wire \alu_fsm_result_temp[15] ;
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
   wire n_8;
   wire n_9;
   wire n_10;
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

   BUX1 FE_OFCC299_mem_ctrl_fsm_rom_data_3_ (.Q(FE_OFCN299_mem_ctrl_fsm_rom_data_3_), 
	.A(\mem_ctrl_fsm_rom_data[3] ));
   BUX4 FE_RC_4_0 (.Q(FE_OFN247_fsm_alu_operand1_6_), 
	.A(\fsm_alu_operand1[6] ));
   BUX6 FE_RC_0_0 (.Q(FE_OFN249_fsm_alu_operand1_7_), 
	.A(\fsm_alu_operand1[7] ));
   INX1 FE_OFC261_fsm_pcau_offset_7_ (.Q(FE_OFN261_fsm_pcau_offset_7_), 
	.A(FE_OFN260_fsm_pcau_offset_7_));
   INX1 FE_OFC260_fsm_pcau_offset_7_ (.Q(FE_OFN260_fsm_pcau_offset_7_), 
	.A(\fsm_pcau_offset[7] ));
   INX4 FE_OFC257_fsm_alu_operand1_3_ (.Q(FE_OFN257_fsm_alu_operand1_3_), 
	.A(FE_OFN256_fsm_alu_operand1_3_));
   INX1 FE_OFC256_fsm_alu_operand1_3_ (.Q(FE_OFN256_fsm_alu_operand1_3_), 
	.A(\fsm_alu_operand1[3] ));
   INX6 FE_OFC255_fsm_alu_operand1_2_ (.Q(FE_OFN255_fsm_alu_operand1_2_), 
	.A(FE_OFN254_fsm_alu_operand1_2_));
   INX1 FE_OFC254_fsm_alu_operand1_2_ (.Q(FE_OFN254_fsm_alu_operand1_2_), 
	.A(\fsm_alu_operand1[2] ));
   INX6 FE_OFC253_fsm_alu_operand1_1_ (.Q(FE_OFN253_fsm_alu_operand1_1_), 
	.A(FE_OFN252_fsm_alu_operand1_1_));
   INX1 FE_OFC252_fsm_alu_operand1_1_ (.Q(FE_OFN252_fsm_alu_operand1_1_), 
	.A(\fsm_alu_operand1[1] ));
   INX2 FE_OFC251_fsm_mem_ctrl_ram_addr_6_ (.Q(FE_OFN251_fsm_mem_ctrl_ram_addr_6_), 
	.A(FE_OFN250_fsm_mem_ctrl_ram_addr_6_));
   INX1 FE_OFC250_fsm_mem_ctrl_ram_addr_6_ (.Q(FE_OFN250_fsm_mem_ctrl_ram_addr_6_), 
	.A(\fsm_mem_ctrl_ram_addr[6] ));
   BUX6 FE_OFC245_fsm_alu_operand1_5_ (.Q(FE_OFN245_fsm_alu_operand1_5_), 
	.A(\fsm_alu_operand1[5] ));
   INX4 FE_OFC244_fsm_alu_operand1_4_ (.Q(FE_OFN244_fsm_alu_operand1_4_), 
	.A(FE_OFN243_fsm_alu_operand1_4_));
   INX3 FE_OFC243_fsm_alu_operand1_4_ (.Q(FE_OFN243_fsm_alu_operand1_4_), 
	.A(\fsm_alu_operand1[4] ));
   INX4 FE_OFC242_fsm_alu_operand1_0_ (.Q(FE_OFN242_fsm_alu_operand1_0_), 
	.A(FE_OFN241_fsm_alu_operand1_0_));
   INX1 FE_OFC241_fsm_alu_operand1_0_ (.Q(FE_OFN241_fsm_alu_operand1_0_), 
	.A(\fsm_alu_operand1[0] ));
   INX16 FE_OFC240_fsm_alu_operand2_3_ (.Q(FE_OFN240_fsm_alu_operand2_3_), 
	.A(FE_OFN239_fsm_alu_operand2_3_));
   INX1 FE_OFC239_fsm_alu_operand2_3_ (.Q(FE_OFN239_fsm_alu_operand2_3_), 
	.A(\fsm_alu_operand2[3] ));
   INX1 FE_OFC237_fsm_alu_operand2_5_ (.Q(FE_OFN237_fsm_alu_operand2_5_), 
	.A(FE_OFN236_fsm_alu_operand2_5_));
   INX1 FE_OFC236_fsm_alu_operand2_5_ (.Q(FE_OFN236_fsm_alu_operand2_5_), 
	.A(\fsm_alu_operand2[5] ));
   INX1 FE_OFC233_fsm_alu_operand2_2_ (.Q(FE_OFN233_fsm_alu_operand2_2_), 
	.A(\fsm_alu_operand2[2] ));
   INX6 FE_OFC232_fsm_alu_operand2_1_ (.Q(FE_OFN232_fsm_alu_operand2_1_), 
	.A(FE_OFN231_fsm_alu_operand2_1_));
   INX1 FE_OFC231_fsm_alu_operand2_1_ (.Q(FE_OFN231_fsm_alu_operand2_1_), 
	.A(\fsm_alu_operand2[1] ));
   INX2 FE_OFC225_fsm_ext_ram (.Q(FE_OFN225_fsm_ext_ram), 
	.A(FE_OFN224_fsm_ext_ram));
   INX1 FE_OFC224_fsm_ext_ram (.Q(FE_OFN224_fsm_ext_ram), 
	.A(fsm_ext_ram));
   BUX2 FE_OFC223_fsm_mem_ctrl_rom_rd_b (.Q(FE_OFN223_fsm_mem_ctrl_rom_rd_b), 
	.A(fsm_mem_ctrl_rom_rd_b));
   INX16 FE_OFC222_fsm_mem_ctrl_ram_wr_b (.Q(FE_OFN222_fsm_mem_ctrl_ram_wr_b), 
	.A(FE_OFN221_fsm_mem_ctrl_ram_wr_b));
   INX1 FE_OFC221_fsm_mem_ctrl_ram_wr_b (.Q(FE_OFN221_fsm_mem_ctrl_ram_wr_b), 
	.A(fsm_mem_ctrl_ram_wr_b));
   INX4 FE_OFC219_fsm_mem_ctrl_ram_rd_b (.Q(FE_OFN219_fsm_mem_ctrl_ram_rd_b), 
	.A(FE_OFN218_fsm_mem_ctrl_ram_rd_b));
   INX2 FE_OFC218_fsm_mem_ctrl_ram_rd_b (.Q(FE_OFN218_fsm_mem_ctrl_ram_rd_b), 
	.A(fsm_mem_ctrl_ram_rd_b));
   BUX1 FE_OFC4_fsm_reg_ctrl_data_1_ (.Q(FE_OFN4_fsm_reg_ctrl_data_1_), 
	.A(\fsm_reg_ctrl_data[1] ));
   BUX1 FE_OFC3_fsm_reg_ctrl_data_2_ (.Q(FE_OFN3_fsm_reg_ctrl_data_2_), 
	.A(\fsm_reg_ctrl_data[2] ));
   BUX1 FE_OFC2_fsm_reg_ctrl_data_0_ (.Q(FE_OFN2_fsm_reg_ctrl_data_0_), 
	.A(\fsm_reg_ctrl_data[0] ));
   BUX1 FE_OFC1_fsm_reg_ctrl_data_3_ (.Q(FE_OFN1_fsm_reg_ctrl_data_3_), 
	.A(\fsm_reg_ctrl_data[3] ));
   BUX0 FE_OFC0_fsm_mem_ctrl_ram_addr_0_ (.Q(FE_OFN0_fsm_mem_ctrl_ram_addr_0_), 
	.A(\fsm_mem_ctrl_ram_addr[0] ));
   core_alu alu (.alu_en_i(fsm_alu_en), 
	.alu_operand1_i({ FE_OFN249_fsm_alu_operand1_7_,
		FE_OFN247_fsm_alu_operand1_6_,
		FE_OFN245_fsm_alu_operand1_5_,
		FE_OFN244_fsm_alu_operand1_4_,
		FE_OFN257_fsm_alu_operand1_3_,
		FE_OFN255_fsm_alu_operand1_2_,
		FE_OFN253_fsm_alu_operand1_1_,
		FE_OFN242_fsm_alu_operand1_0_ }), 
	.alu_operand2_i({ \fsm_alu_operand2[7] ,
		\fsm_alu_operand2[6] ,
		FE_OFN237_fsm_alu_operand2_5_,
		\fsm_alu_operand2[4] ,
		FE_OFN240_fsm_alu_operand2_3_,
		FE_OFN233_fsm_alu_operand2_2_,
		FE_OFN232_fsm_alu_operand2_1_,
		\fsm_alu_operand2[0]  }), 
	.alu_opcode_i({ \fsm_alu_opcode[4] ,
		\fsm_alu_opcode[3] ,
		\fsm_alu_opcode[2] ,
		\fsm_alu_opcode[1] ,
		\fsm_alu_opcode[0]  }), 
	.alu_cy_i(reg_ctrl_alu_cy), 
	.alu_ac_i(reg_ctrl_alu_ac), 
	.alu_ov_i(reg_ctrl_alu_ov), 
	.alu_result_o({ \alu_fsm_result_temp[15] ,
		\alu_fsm_result_temp[14] ,
		\alu_fsm_result_temp[13] ,
		\alu_fsm_result_temp[12] ,
		\alu_fsm_result_temp[11] ,
		\alu_fsm_result_temp[10] ,
		\alu_fsm_result_temp[9] ,
		\alu_fsm_result_temp[8] ,
		\alu_fsm_result_temp[7] ,
		\alu_fsm_result_temp[6] ,
		\alu_fsm_result_temp[5] ,
		\alu_fsm_result_temp[4] ,
		\alu_fsm_result_temp[3] ,
		\alu_fsm_result_temp[2] ,
		\alu_fsm_result_temp[1] ,
		\alu_fsm_result_temp[0]  }), 
	.alu_cy_o(alu_reg_ctrl_cy), 
	.alu_ac_o(alu_reg_ctrl_ac), 
	.alu_ov_o(alu_reg_ctrl_ov));
   core_fsm fsm (.fsm_clock_i(core_clk_i), 
	.fsm_reset_i_b(core_reset_i), 
	.fsm_reset_core_o_b(core_reset_o), 
	.fsm_alu_result_i({ DFT_sdo_17,
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
	.fsm_rom_addr_o({ UNCONNECTED3,
		UNCONNECTED4,
		UNCONNECTED5,
		UNCONNECTED6,
		UNCONNECTED7,
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
		UNCONNECTED18 }), 
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
		FE_OFCN299_mem_ctrl_fsm_rom_data_3_,
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
	.fsm_pc_i({ DFT_sdo_15,
		\pcau_fsm_pc[14] ,
		\pcau_fsm_pc[13] ,
		\pcau_fsm_pc[12] ,
		\pcau_fsm_pc[11] ,
		\pcau_fsm_pc[10] ,
		\pcau_fsm_pc[9] ,
		\pcau_fsm_pc[8] ,
		\pcau_fsm_pc[7] ,
		\pcau_fsm_pc[6] ,
		\pcau_fsm_pc[5] ,
		\pcau_fsm_pc[4] ,
		\pcau_fsm_pc[3] ,
		\pcau_fsm_pc[2] ,
		\pcau_fsm_pc[1] ,
		SPCASCAN_N0 }), 
	.fsm_int_vect_i({ core_interrupt_vect_i[2],
		core_interrupt_vect_i[1],
		core_interrupt_vect_i[0] }), 
	.fsm_int_na_o(core_interrupt_na_o), 
	.fsm_int_rdy_o(core_interrupt_rdy_o), 
	.fsm_ext_ram_o(fsm_ext_ram), 
	.fsm_state_o({ UNCONNECTED19,
		UNCONNECTED20,
		UNCONNECTED21 }), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_1), 
	.DFT_sdo_2(DFT_sdo_2), 
	.DFT_sdi_3(DFT_sdi_3), 
	.DFT_sdo_4(DFT_sdo_4), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N2(top_clock_i__L2_N2), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8));
   core_mem_ctrl mem_ctrl (.mem_ctrl_clk_i(core_mem_clk_i), 
	.mem_ctrl_rom_rd_b_i(FE_OFN223_fsm_mem_ctrl_rom_rd_b), 
	.mem_ctrl_ram_rd_b_i(FE_OFN219_fsm_mem_ctrl_ram_rd_b), 
	.mem_ctrl_ram_wr_b_i(FE_OFN222_fsm_mem_ctrl_ram_wr_b), 
	.mem_ctrl_bit_byte_flag_i(fsm_bit_byte_flag), 
	.mem_ctrl_ext_ram_i(FE_OFN225_fsm_ext_ram), 
	.mem_ctrl_rom_addr_i({ DFT_sdo_15,
		\pcau_fsm_pc[14] ,
		\pcau_fsm_pc[13] ,
		\pcau_fsm_pc[12] ,
		\pcau_fsm_pc[11] ,
		\pcau_fsm_pc[10] ,
		\pcau_fsm_pc[9] ,
		\pcau_fsm_pc[8] ,
		\pcau_fsm_pc[7] ,
		\pcau_fsm_pc[6] ,
		\pcau_fsm_pc[5] ,
		\pcau_fsm_pc[4] ,
		\pcau_fsm_pc[3] ,
		\pcau_fsm_pc[2] ,
		\pcau_fsm_pc[1] ,
		SPCASCAN_N0 }), 
	.mem_ctrl_ram_addr_i({ \fsm_mem_ctrl_ram_addr[7] ,
		FE_OFN251_fsm_mem_ctrl_ram_addr_6_,
		\fsm_mem_ctrl_ram_addr[5] ,
		\fsm_mem_ctrl_ram_addr[4] ,
		\fsm_mem_ctrl_ram_addr[3] ,
		\fsm_mem_ctrl_ram_addr[2] ,
		\fsm_mem_ctrl_ram_addr[1] ,
		FE_OFN0_fsm_mem_ctrl_ram_addr_0_ }), 
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
		\mem_ctrl_fsm_ram_data[0]  }), 
	.top_clock_mem_i__L1_N1(top_clock_mem_i__L1_N1));
   core_pcau pcau (.pcau_clock_mem_i(core_mem_clk_i), 
	.pcau_reset_i_b(core_reset_o), 
	.pcau_offset_i({ FE_OFN261_fsm_pcau_offset_7_,
		\fsm_pcau_offset[6] ,
		\fsm_pcau_offset[5] ,
		\fsm_pcau_offset[4] ,
		\fsm_pcau_offset[3] ,
		\fsm_pcau_offset[2] ,
		\fsm_pcau_offset[1] ,
		\fsm_pcau_offset[0]  }), 
	.pcau_en_i(fsm_pcau_en), 
	.pcau_pc_o({ DFT_sdo_15,
		\pcau_fsm_pc[14] ,
		\pcau_fsm_pc[13] ,
		\pcau_fsm_pc[12] ,
		\pcau_fsm_pc[11] ,
		\pcau_fsm_pc[10] ,
		\pcau_fsm_pc[9] ,
		\pcau_fsm_pc[8] ,
		\pcau_fsm_pc[7] ,
		\pcau_fsm_pc[6] ,
		\pcau_fsm_pc[5] ,
		\pcau_fsm_pc[4] ,
		\pcau_fsm_pc[3] ,
		\pcau_fsm_pc[2] ,
		\pcau_fsm_pc[1] ,
		SPCASCAN_N0 }), 
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
	.DFT_sdi(DFT_sdi_14), 
	.DFT_sen(DFT_sen), 
	.FE_PT1_top_p1_y_i_6_(core_ports_p1_i[6]), 
	.top_clock_mem_i__L1_N1(top_clock_mem_i__L1_N1), 
	.top_clock_mem_i__L1_N3(top_clock_mem_i__L1_N3));
   core_reg_ctrl reg_ctrl (.reg_ctrl_clk_i(top_clock_mem_i__L1_N1), 
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
		FE_OFN1_fsm_reg_ctrl_data_3_,
		FE_OFN3_fsm_reg_ctrl_data_2_,
		FE_OFN4_fsm_reg_ctrl_data_1_,
		FE_OFN2_fsm_reg_ctrl_data_0_ }), 
	.reg_ctrl_ext_ram_rd_i(n_9), 
	.reg_ctrl_ext_ram_wr_i(n_8), 
	.reg_ctrl_ext_rom_rd_i(n_10), 
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
	.reg_ctrl_bus_ctrl_p0_o({ UNCONNECTED22,
		UNCONNECTED23,
		UNCONNECTED24,
		UNCONNECTED25,
		UNCONNECTED26,
		UNCONNECTED27,
		UNCONNECTED28,
		UNCONNECTED29 }), 
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
		UNCONNECTED30,
		UNCONNECTED31,
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
	.reg_ctrl_serial_sm0_o(UNCONNECTED32), 
	.reg_ctrl_serial_ren_o(core_serial_ren_o), 
	.reg_ctrl_serial_p3_0_o(UNCONNECTED33), 
	.reg_ctrl_serial_sbuf_tx_o({ core_serial_sbuf_tx_o[7],
		core_serial_sbuf_tx_o[6],
		core_serial_sbuf_tx_o[5],
		core_serial_sbuf_tx_o[4],
		core_serial_sbuf_tx_o[3],
		core_serial_sbuf_tx_o[2],
		core_serial_sbuf_tx_o[1],
		core_serial_sbuf_tx_o[0] }), 
	.reg_ctrl_serial_tb8_o(core_serial_tb8_o), 
	.reg_ctrl_serial_ti_o(UNCONNECTED34), 
	.reg_ctrl_serial_ri_o(UNCONNECTED35), 
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
	.reg_ctrl_timers_tf0_o(UNCONNECTED36), 
	.reg_ctrl_timers_int0_o(UNCONNECTED37), 
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
	.reg_ctrl_timers_tf1_o(UNCONNECTED38), 
	.reg_ctrl_timers_int1_o(UNCONNECTED39), 
	.reg_ctrl_timers_tacph0_o({ core_timers_tacph0_o[7],
		core_timers_tacph0_o[6],
		core_timers_tacph0_o[5],
		core_timers_tacph0_o[4],
		core_timers_tacph0_o[3],
		core_timers_tacph0_o[2],
		core_timers_tacph0_o[1],
		core_timers_tacph0_o[0] }), 
	.reg_ctrl_timers_tacph1_o({ core_timers_tacph1_o[7],
		core_timers_tacph1_o[6],
		core_timers_tacph1_o[5],
		core_timers_tacph1_o[4],
		core_timers_tacph1_o[3],
		core_timers_tacph1_o[2],
		core_timers_tacph1_o[1],
		core_timers_tacph1_o[0] }), 
	.reg_ctrl_timers_tacpl_o({ core_timers_tacpl_o[7],
		core_timers_tacpl_o[6],
		core_timers_tacpl_o[5],
		core_timers_tacpl_o[4],
		core_timers_tacpl_o[3],
		core_timers_tacpl_o[2],
		core_timers_tacpl_o[1],
		core_timers_tacpl_o[0] }), 
	.reg_ctrl_timers_tr2_o(core_timers_tr2_o), 
	.reg_ctrl_timers_tf2_o(UNCONNECTED40), 
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
	.DFT_sdi_3(DFT_sdi_9), 
	.DFT_sdi_4(DFT_sdi_10), 
	.DFT_sdo_5(DFT_sdo_11), 
	.DFT_sdi_6(DFT_sdi_12), 
	.DFT_sdo_7(DFT_sdo_13), 
	.DFT_sdi_8(DFT_sdi_16), 
	.FE_PT1_top_p4_a_o_5_(FE_PT1_top_p4_a_o_5_), 
	.SPCASCAN_N11(SPCASCAN_N11), 
	.FE_PT1_top_p3_en_o_5_(FE_PT1_top_p3_en_o_5_), 
	.FE_PT1_top_p3_en_o_4_(FE_PT1_top_p3_en_o_4_), 
	.FE_PT1_top_p3_en_o_3_(FE_PT1_top_p3_en_o_3_), 
	.FE_PT1_top_p3_en_o_2_(FE_PT1_top_p3_en_o_2_), 
	.FE_PT1_top_p3_en_o_1_(FE_PT1_top_p3_en_o_1_), 
	.FE_PT1_top_p3_en_o_0_(FE_PT1_top_p3_en_o_0_), 
	.top_clock_mem_i__L1_N2(top_clock_mem_i__L1_N2), 
	.top_clock_mem_i__L1_N3(top_clock_mem_i__L1_N3), 
	.top_clock_mem_i__L1_N4(top_clock_mem_i__L1_N4), 
	.top_clock_mem_i__L1_N5(top_clock_mem_i__L1_N5), 
	.top_clock_mem_i__L1_N6(top_clock_mem_i__L1_N6), 
	.top_clock_mem_i__L1_N7(top_clock_mem_i__L1_N7), 
	.top_clock_mem_i__L1_N8(top_clock_mem_i__L1_N8), 
	.top_clock_mem_i__L1_N9(top_clock_mem_i__L1_N9));
   SDFRQX4 \alu_fsm_result_reg[0]  (.SE(DFT_sen), 
	.SD(SPCASCAN_N11), 
	.Q(\alu_fsm_result[0] ), 
	.D(\alu_fsm_result_temp[0] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \alu_fsm_result_reg[10]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[9] ), 
	.Q(\alu_fsm_result[10] ), 
	.D(\alu_fsm_result_temp[10] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \alu_fsm_result_reg[11]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[10] ), 
	.Q(\alu_fsm_result[11] ), 
	.D(\alu_fsm_result_temp[11] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \alu_fsm_result_reg[12]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[11] ), 
	.Q(\alu_fsm_result[12] ), 
	.D(\alu_fsm_result_temp[12] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \alu_fsm_result_reg[13]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[12] ), 
	.Q(\alu_fsm_result[13] ), 
	.D(\alu_fsm_result_temp[13] ), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX1 \alu_fsm_result_reg[14]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[13] ), 
	.Q(\alu_fsm_result[14] ), 
	.D(\alu_fsm_result_temp[14] ), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX0 \alu_fsm_result_reg[15]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[14] ), 
	.Q(DFT_sdo_17), 
	.D(\alu_fsm_result_temp[15] ), 
	.C(top_clock_mem_i__L1_N3));
   SDFRQX4 \alu_fsm_result_reg[1]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[0] ), 
	.Q(\alu_fsm_result[1] ), 
	.D(\alu_fsm_result_temp[1] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX1 \alu_fsm_result_reg[2]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[1] ), 
	.Q(\alu_fsm_result[2] ), 
	.D(\alu_fsm_result_temp[2] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX1 \alu_fsm_result_reg[3]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[2] ), 
	.Q(\alu_fsm_result[3] ), 
	.D(\alu_fsm_result_temp[3] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX4 \alu_fsm_result_reg[4]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[3] ), 
	.Q(\alu_fsm_result[4] ), 
	.D(\alu_fsm_result_temp[4] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX1 \alu_fsm_result_reg[5]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[4] ), 
	.Q(\alu_fsm_result[5] ), 
	.D(\alu_fsm_result_temp[5] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX1 \alu_fsm_result_reg[6]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[7] ), 
	.Q(\alu_fsm_result[6] ), 
	.D(\alu_fsm_result_temp[6] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX1 \alu_fsm_result_reg[7]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[5] ), 
	.Q(\alu_fsm_result[7] ), 
	.D(\alu_fsm_result_temp[7] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX1 \alu_fsm_result_reg[8]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[6] ), 
	.Q(\alu_fsm_result[8] ), 
	.D(\alu_fsm_result_temp[8] ), 
	.C(top_clock_mem_i__L1_N8));
   SDFRQX0 \alu_fsm_result_reg[9]  (.SE(DFT_sen), 
	.SD(\alu_fsm_result[8] ), 
	.Q(\alu_fsm_result[9] ), 
	.D(\alu_fsm_result_temp[9] ), 
	.C(top_clock_mem_i__L1_N8));
   INX0 p4338A (.Q(n_10), 
	.A(core_bus_ctrl_ext_rom_rd_b_o));
   INX0 p11402A (.Q(n_9), 
	.A(core_bus_ctrl_ext_ram_rd_b_o));
   INX0 p11049A (.Q(n_8), 
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
	DFT_sdo_2, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N9);
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
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N9;

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
   wire n_152;
   wire n_153;
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
   wire n_197;
   wire n_203;
   wire n_204;
   wire n_205;
   wire n_207;
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
	.CN(top_clock_i__L2_N6));
   SDFRQX0 \flag_out_reg_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(n_152), 
	.D(n_127), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \flag_out_reg_reg[1]  (.SE(DFT_sen), 
	.SD(n_152), 
	.Q(DFT_sdo), 
	.D(n_126), 
	.C(top_clock_i__L2_N6));
   SDFFQX0 \hi_ok_reg[0][0]  (.SE(DFT_sen), 
	.SD(\flag_intx_next[1][1] ), 
	.Q(\hi_ok[0] ), 
	.D(n_134), 
	.CN(top_clock_i__L2_N6));
   SDFFQX0 \hi_ok_reg[1][0]  (.SE(DFT_sen), 
	.SD(\hi_ok[0] ), 
	.Q(\hi_ok[1] ), 
	.D(n_133), 
	.CN(top_clock_i__L2_N6));
   SDFFQX0 \ier_ctr_reg[0]  (.SE(DFT_sen), 
	.SD(\hi_ok[1] ), 
	.Q(\ier_ctr[0] ), 
	.D(n_141), 
	.CN(top_clock_i__L2_N9));
   SDFFQX0 \ier_ctr_reg[1]  (.SE(DFT_sen), 
	.SD(\ier_ctr[0] ), 
	.Q(\ier_ctr[1] ), 
	.D(n_76), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_ctr_reg[2]  (.SE(DFT_sen), 
	.SD(\ier_ctr[1] ), 
	.Q(\ier_ctr[2] ), 
	.D(n_140), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_ctr_reg[3]  (.SE(DFT_sen), 
	.SD(\ier_ctr[2] ), 
	.Q(\ier_ctr[3] ), 
	.D(n_89), 
	.CN(top_clock_i__L2_N9));
   SDFFQX0 \ier_ctr_reg[4]  (.SE(DFT_sen), 
	.SD(\ier_ctr[3] ), 
	.Q(\ier_ctr[4] ), 
	.D(n_139), 
	.CN(top_clock_i__L2_N9));
   SDFFQX0 \ier_ctr_reg[5]  (.SE(DFT_sen), 
	.SD(\ier_ctr[4] ), 
	.Q(\ier_ctr[5] ), 
	.D(n_82), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_ctr_reg[6]  (.SE(DFT_sen), 
	.SD(\ier_ctr[5] ), 
	.Q(\ier_ctr[6] ), 
	.D(n_81), 
	.CN(top_clock_i__L2_N9));
   SDFFQX0 \ier_reg[0]  (.SE(DFT_sen), 
	.SD(\ier_ctr[6] ), 
	.Q(\ier[0] ), 
	.D(n_132), 
	.CN(top_clock_i__L2_N5));
   SDFFQX0 \ier_reg[1]  (.SE(DFT_sen), 
	.SD(\ier[0] ), 
	.Q(\ier[1] ), 
	.D(n_83), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_reg[2]  (.SE(DFT_sen), 
	.SD(\ier[1] ), 
	.Q(\ier[2] ), 
	.D(n_131), 
	.CN(top_clock_i__L2_N5));
   SDFFQX0 \ier_reg[3]  (.SE(DFT_sen), 
	.SD(\ier[2] ), 
	.Q(\ier[3] ), 
	.D(n_79), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_reg[4]  (.SE(DFT_sen), 
	.SD(\ier[3] ), 
	.Q(\ier[4] ), 
	.D(n_130), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_reg[5]  (.SE(DFT_sen), 
	.SD(\ier[4] ), 
	.Q(\ier[5] ), 
	.D(n_78), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \ier_reg[6]  (.SE(DFT_sen), 
	.SD(\ier[5] ), 
	.Q(\ier[6] ), 
	.D(n_90), 
	.CN(top_clock_i__L2_N10));
   SDFFQX0 \lo_ok_reg[0][0]  (.SE(DFT_sen), 
	.SD(\ier[6] ), 
	.Q(n_150), 
	.D(n_129), 
	.CN(clk));
   SDFFQX0 \lo_ok_reg[1][0]  (.SE(DFT_sen), 
	.SD(n_150), 
	.Q(n_149), 
	.D(n_128), 
	.CN(top_clock_i__L2_N3));
   SDFFQX0 reset_reg (.SE(DFT_sen), 
	.SD(n_149), 
	.Q(reset), 
	.D(int_rst_sync_b_i), 
	.CN(clk));
   SDFFQX0 \vect_register_reg[0]  (.SE(DFT_sen), 
	.SD(n_207), 
	.Q(\vect_register[0] ), 
	.D(n_102), 
	.CN(top_clock_i__L2_N5));
   SDFFQX0 \vect_register_reg[1]  (.SE(DFT_sen), 
	.SD(\vect_register[0] ), 
	.Q(\vect_register[1] ), 
	.D(n_101), 
	.CN(top_clock_i__L2_N5));
   SDFFQX0 \vect_register_reg[2]  (.SE(DFT_sen), 
	.SD(\vect_register[1] ), 
	.Q(DFT_sdo_2), 
	.D(n_108), 
	.CN(top_clock_i__L2_N5));
   ON21X0 p15309A (.Q(n_147), 
	.C(n_121), 
	.B(n_64), 
	.A(n_143));
   ON21X0 p15309A6162 (.Q(n_146), 
	.C(n_120), 
	.B(n_64), 
	.A(n_142));
   AN21X0 p15431A (.Q(n_145), 
	.C(n_64), 
	.B(n_135), 
	.A(n_138));
   AN21X0 p15431A6166 (.Q(n_144), 
	.C(n_64), 
	.B(n_137), 
	.A(n_136));
   AN32X0 p15176A (.Q(n_143), 
	.E(\function_TASK_DEFAULT[1] ), 
	.D(n_106), 
	.C(n_66), 
	.B(n_105), 
	.A(n_123));
   AN32X0 p15176A6174 (.Q(n_142), 
	.E(\flag_intx_next[1][1] ), 
	.D(n_111), 
	.C(n_71), 
	.B(n_110), 
	.A(n_124));
   AO22X0 p15177A (.Q(n_141), 
	.D(\ier_ctr[0] ), 
	.C(n_125), 
	.B(n_179), 
	.A(n_122));
   AO22X0 p15177A6175 (.Q(n_140), 
	.D(\ier_ctr[2] ), 
	.C(n_125), 
	.B(n_185), 
	.A(n_122));
   AO22X0 p15177A6176 (.Q(n_139), 
	.D(\ier_ctr[4] ), 
	.C(n_125), 
	.B(n_187), 
	.A(n_122));
   NA3I1X0 p15258A (.Q(n_138), 
	.C(n_112), 
	.B(n_119), 
	.AN(n_150));
   ON21X0 p15318A (.Q(n_137), 
	.C(\flag_intx_next[1][0] ), 
	.B(n_77), 
	.A(n_113));
   NA3I1X0 p15258A6179 (.Q(n_136), 
	.C(n_112), 
	.B(n_117), 
	.AN(n_149));
   ON21X0 p15318A6180 (.Q(n_135), 
	.C(\function_TASK_DEFAULT[0] ), 
	.B(n_73), 
	.A(n_113));
   ON221X0 p15549A (.Q(n_134), 
	.E(n_115), 
	.D(n_66), 
	.C(n_104), 
	.B(n_105), 
	.A(n_116));
   ON221X0 p15549A6181 (.Q(n_133), 
	.E(n_115), 
	.D(n_71), 
	.C(n_104), 
	.B(n_110), 
	.A(n_116));
   AO22X0 p14964A (.Q(n_132), 
	.D(n_97), 
	.C(n_178), 
	.B(\ier[0] ), 
	.A(n_114));
   AO22X0 p14964A6182 (.Q(n_131), 
	.D(n_97), 
	.C(n_186), 
	.B(\ier[2] ), 
	.A(n_114));
   AO22X0 p14941A (.Q(n_130), 
	.D(n_97), 
	.C(n_188), 
	.B(\ier[4] ), 
	.A(n_114));
   ON221X0 p15333A (.Q(n_129), 
	.E(n_115), 
	.D(n_65), 
	.C(n_104), 
	.B(n_119), 
	.A(n_116));
   ON221X0 p15333A6183 (.Q(n_128), 
	.E(n_115), 
	.D(n_67), 
	.C(n_104), 
	.B(n_117), 
	.A(n_116));
   NO3X0 p15577A (.Q(n_127), 
	.C(n_84), 
	.B(n_99), 
	.A(n_109));
   NO3X0 p15577A6184 (.Q(n_126), 
	.C(n_84), 
	.B(n_98), 
	.A(n_107));
   ON31X0 p15105A (.Q(n_125), 
	.D(n_95), 
	.C(n_189), 
	.B(n_75), 
	.A(n_64));
   ON21X0 p15095A (.Q(n_124), 
	.C(n_118), 
	.B(DFT_sdo), 
	.A(n_103));
   ON21X0 p15095A6185 (.Q(n_123), 
	.C(n_118), 
	.B(n_152), 
	.A(n_103));
   ON31X0 p15180A (.Q(n_122), 
	.D(n_96), 
	.C(n_86), 
	.B(n_87), 
	.A(int_cm_i));
   ON221X0 p15037A (.Q(n_121), 
	.E(\function_TASK_DEFAULT[1] ), 
	.D(n_91), 
	.C(n_88), 
	.B(n_94), 
	.A(n_100));
   ON221X0 p15037A6186 (.Q(n_120), 
	.E(\flag_intx_next[1][1] ), 
	.D(n_91), 
	.C(n_74), 
	.B(n_93), 
	.A(n_100));
   NO2X0 p15121A (.Q(n_119), 
	.B(int_intx_b_i[0]), 
	.A(n_99));
   OR2X0 p15010A (.Q(n_118), 
	.B(n_100), 
	.A(n_183));
   NO2X0 p15121A6190 (.Q(n_117), 
	.B(int_intx_b_i[1]), 
	.A(n_98));
   AN31X0 p15049A (.Q(n_116), 
	.D(n_104), 
	.C(n_70), 
	.B(reg_ie_i[7]), 
	.A(n_69));
   AN21X0 p15241A (.Q(n_115), 
	.C(n_64), 
	.B(n_80), 
	.A(n_70));
   ON31X0 p14973A (.Q(n_114), 
	.D(n_95), 
	.C(n_85), 
	.B(n_182), 
	.A(n_64));
   INX0 Fp15228A (.Q(n_112), 
	.A(n_113));
   AO22X0 p14863A (.Q(n_113), 
	.D(int_cm_i), 
	.C(n_70), 
	.B(n_69), 
	.A(n_92));
   NA2X0 p15333A6199 (.Q(n_111), 
	.B(reg_ie_i[2]), 
	.A(n_84));
   NO2I1X0 p15055A (.Q(n_110), 
	.B(n_77), 
	.AN(reg_tcon_i[2]));
   NA2X0 p15670A (.Q(n_109), 
	.B(reset), 
	.A(\function_TASK_DEFAULT[0] ));
   NO2I1X0 p14598A (.Q(n_108), 
	.B(n_87), 
	.AN(n_205));
   NA2X0 p15670A6200 (.Q(n_107), 
	.B(reset), 
	.A(\flag_intx_next[1][0] ));
   NA2X0 p15333A6201 (.Q(n_106), 
	.B(reg_ie_i[0]), 
	.A(n_84));
   NO2I1X0 p15055A6202 (.Q(n_105), 
	.B(n_73), 
	.AN(reg_tcon_i[0]));
   INX0 Fp15114A6203 (.Q(n_103), 
	.A(n_104));
   AND2X0 p14780A (.Q(n_104), 
	.B(int_cm_i), 
	.A(n_80));
   NO2I1X0 p14599A (.Q(n_102), 
	.B(n_87), 
	.AN(n_203));
   NO2I1X0 p14608A (.Q(n_101), 
	.B(n_87), 
	.AN(n_204));
   ON21X0 p14640A (.Q(n_100), 
	.C(reg_ie_i[7]), 
	.B(n_72), 
	.A(n_69));
   ON21X0 p14871A (.Q(n_99), 
	.C(reg_ie_i[0]), 
	.B(n_68), 
	.A(\function_TASK_DEFAULT[1] ));
   ON21X0 p14871A6204 (.Q(n_98), 
	.C(reg_ie_i[2]), 
	.B(n_63), 
	.A(\flag_intx_next[1][1] ));
   INX0 Fp15185A (.Q(n_96), 
	.A(n_97));
   NO3I1X0 p15028A (.Q(n_97), 
	.C(n_72), 
	.B(n_87), 
	.AN(n_197));
   AN21X0 p14702A (.Q(n_95), 
	.C(n_91), 
	.B(int_rst_sync_b_i), 
	.A(n_69));
   EN2X0 p14900A (.Q(n_94), 
	.B(int_intx_b_i[0]), 
	.A(n_68));
   EN2X0 p14900A6205 (.Q(n_93), 
	.B(int_intx_b_i[1]), 
	.A(n_63));
   NA2X0 p14940A (.Q(n_92), 
	.B(n_207), 
	.A(reg_ie_i[7]));
   NO2X0 p14762A (.Q(n_91), 
	.B(n_64), 
	.A(n_183));
   NO2I1X0 p14906A (.Q(n_90), 
	.B(n_64), 
	.AN(ier_next_4620));
   NO2I1X0 p15533A (.Q(n_89), 
	.B(n_64), 
	.AN(ier_ctr_next_4618));
   NO2X0 p15885A (.Q(n_88), 
	.B(n_64), 
	.A(n_152));
   NA2X0 p14588A (.Q(n_87), 
	.B(int_rst_sync_b_i), 
	.A(reg_ie_i[7]));
   NA2X0 p39862A (.Q(n_86), 
	.B(n_207), 
	.A(n_180));
   OR2X0 p15233A (.Q(n_85), 
	.B(n_181), 
	.A(n_184));
   NA2X0 p15017A (.Q(n_84), 
	.B(n_69), 
	.A(n_183));
   NO2I1X0 p15176A6207 (.Q(n_83), 
	.B(n_64), 
	.AN(ier_next_4623));
   NO2I1X0 p15448A (.Q(n_82), 
	.B(n_64), 
	.AN(ier_ctr_next_4617));
   NO2I1X0 p15408A (.Q(n_81), 
	.B(n_64), 
	.AN(ier_ctr_next_4616));
   NO2I1X0 p14641A (.Q(n_80), 
	.B(n_207), 
	.AN(reg_ie_i[7]));
   NO2I1X0 p15143A (.Q(n_79), 
	.B(n_64), 
	.AN(ier_next_4622));
   NO2I1X0 p15147A (.Q(n_78), 
	.B(n_64), 
	.AN(ier_next_4621));
   NA2X0 p15074A (.Q(n_77), 
	.B(reg_ie_i[2]), 
	.A(int_intx_b_i[1]));
   NO2I1X0 p15533A6208 (.Q(n_76), 
	.B(n_64), 
	.AN(ier_ctr_next_4619));
   AND2X0 p15546A (.Q(n_75), 
	.B(int_rdy_i), 
	.A(n_153));
   NO2X0 p15885A6209 (.Q(n_74), 
	.B(n_64), 
	.A(DFT_sdo));
   NA2X0 p15074A6210 (.Q(n_73), 
	.B(reg_ie_i[0]), 
	.A(int_intx_b_i[0]));
   INX0 Fp45915A (.Q(n_72), 
	.A(n_207));
   INX0 Fp9999860A (.Q(n_71), 
	.A(\hi_ok[1] ));
   INX0 Fp14745A (.Q(n_70), 
	.A(n_183));
   INX0 Fp14564A (.Q(n_69), 
	.A(int_cm_i));
   INX0 Fp14844A (.Q(n_68), 
	.A(reg_tcon_i[0]));
   INX0 Fp9999839A (.Q(n_67), 
	.A(n_149));
   INX0 Fp9999860A6218 (.Q(n_66), 
	.A(\hi_ok[0] ));
   INX0 Fp9999839A6219 (.Q(n_65), 
	.A(n_150));
   INX0 Fp45766A6229 (.Q(n_64), 
	.A(int_rst_sync_b_i));
   INX0 Fp14844A6230 (.Q(n_63), 
	.A(reg_tcon_i[2]));
   SDFFQX0 state_reg (.SE(DFT_sen), 
	.SD(reset), 
	.Q(n_207), 
	.D(int_cm_i), 
	.CN(clk));
   NO2I1X0 p13046A (.Q(reg_tcon_o[1]), 
	.B(n_62), 
	.AN(int_reg_clr_o));
   NO2I1X0 p13046A6861 (.Q(reg_tcon_o[0]), 
	.B(n_61), 
	.AN(int_reg_clr_o));
   NO2I1X0 p13046A6862 (.Q(reg_tcon_o[3]), 
	.B(n_60), 
	.AN(int_reg_clr_o));
   NO2I1X0 p13046A6863 (.Q(reg_tcon_o[2]), 
	.B(n_59), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12448A (.Q(reg_tcon2_o[1]), 
	.B(n_58), 
	.AN(int_reg_clr_o));
   NO2I1X0 p12448A6864 (.Q(reg_tcon2_o[0]), 
	.B(n_57), 
	.AN(int_reg_clr_o));
   AN31X0 p12143A (.Q(int_reg_clr_o), 
	.D(n_53), 
	.C(n_54), 
	.B(n_55), 
	.A(n_56));
   AN21X0 p12024A (.Q(n_55), 
	.C(n_52), 
	.B(reg_tcon2_i[1]), 
	.A(n_58));
   AN222X0 p11938A (.Q(n_54), 
	.F(n_57), 
	.E(reg_tcon2_i[0]), 
	.D(n_59), 
	.C(reg_tcon_i[4]), 
	.B(reg_tcon_i[5]), 
	.A(n_60));
   AND2X0 p9736A (.Q(int_vect_o[0]), 
	.B(reg_ie_i[7]), 
	.A(n_203));
   AND2X0 p10108A (.Q(int_vect_o[2]), 
	.B(reg_ie_i[7]), 
	.A(n_205));
   AND2X0 p9674A (.Q(int_vect_o[1]), 
	.B(reg_ie_i[7]), 
	.A(n_204));
   NA2X0 p11985A (.Q(n_58), 
	.B(reg_tcon2_i[1]), 
	.A(n_51));
   NA2X0 p11985A6865 (.Q(n_57), 
	.B(reg_tcon2_i[0]), 
	.A(n_50));
   NA2X0 p11829A (.Q(n_60), 
	.B(reg_tcon_i[5]), 
	.A(n_49));
   ON21X0 p12035A (.Q(n_51), 
	.C(reg_ie_i[6]), 
	.B(ier_ctr_next_4616), 
	.A(ier_next_4620));
   ON21X0 p12060A (.Q(n_50), 
	.C(reg_ie_i[5]), 
	.B(ier_ctr_next_4617), 
	.A(ier_next_4621));
   NA3X0 p9527A (.Q(n_203), 
	.C(n_46), 
	.B(n_47), 
	.A(n_48));
   NA3X0 p9927A (.Q(n_205), 
	.C(n_44), 
	.B(n_45), 
	.A(n_48));
   NA3I1X0 p9348A (.Q(n_204), 
	.C(n_43), 
	.B(n_47), 
	.AN(n_42));
   NA2X0 p9327A (.Q(n_42), 
	.B(n_45), 
	.A(n_41));
   NA2X0 p11893A (.Q(n_59), 
	.B(reg_tcon_i[4]), 
	.A(n_40));
   ON21X0 p11862A (.Q(n_49), 
	.C(reg_ie_i[3]), 
	.B(ier_ctr_next_4618), 
	.A(ier_next_4622));
   AN221X0 p9087A (.Q(n_48), 
	.E(n_35), 
	.D(n_36), 
	.C(n_37), 
	.B(n_38), 
	.A(n_39));
   ON21X0 p11961A (.Q(n_40), 
	.C(reg_ie_i[1]), 
	.B(ier_ctr_next_4619), 
	.A(ier_next_4623));
   AN22X0 p9059A (.Q(n_45), 
	.D(n_36), 
	.C(n_187), 
	.B(n_39), 
	.A(n_188));
   AO22X0 p11616A (.Q(ier_next_4620), 
	.D(\ier[6] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_34));
   AO22X0 p11661A (.Q(ier_next_4621), 
	.D(\ier[5] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_38));
   INX0 Fp9017A (.Q(n_35), 
	.A(n_41));
   AN22X0 p8690A (.Q(n_41), 
	.D(n_36), 
	.C(n_31), 
	.B(n_39), 
	.A(n_34));
   AO22X0 p11442A (.Q(ier_next_4622), 
	.D(\ier[3] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_30));
   AN222X0 p9984A (.Q(n_44), 
	.F(n_39), 
	.E(n_30), 
	.D(DFT_sdo_2), 
	.C(n_28), 
	.B(n_29), 
	.A(n_36));
   AN22X0 p9568A (.Q(n_47), 
	.D(n_185), 
	.C(n_36), 
	.B(n_39), 
	.A(n_186));
   NO2X0 p9140A (.Q(n_38), 
	.B(n_26), 
	.A(n_27));
   NO3I1X0 p8638A (.Q(n_34), 
	.C(n_25), 
	.B(n_27), 
	.AN(n_24));
   NO3I1X0 p8901A (.Q(n_188), 
	.C(n_24), 
	.B(n_27), 
	.AN(n_26));
   AO22X0 p11549A (.Q(ier_next_4623), 
	.D(\ier[1] ), 
	.C(n_32), 
	.B(n_33), 
	.A(n_23));
   AN222X0 p9506A (.Q(n_43), 
	.F(n_39), 
	.E(n_23), 
	.D(\vect_register[1] ), 
	.C(n_28), 
	.B(n_36), 
	.A(n_22));
   NO2X0 p9633A (.Q(n_186), 
	.B(n_20), 
	.A(n_21));
   NA3I1X0 p8314A (.Q(n_27), 
	.C(n_19), 
	.B(n_20), 
	.AN(n_21));
   NO3I1X0 p10008A (.Q(n_30), 
	.C(n_19), 
	.B(n_21), 
	.AN(n_20));
   AN222X0 p9627A (.Q(n_46), 
	.F(n_39), 
	.E(n_178), 
	.D(\vect_register[0] ), 
	.C(n_28), 
	.B(n_36), 
	.A(n_179));
   AO22X0 p11867A (.Q(ier_ctr_next_4616), 
	.D(\ier_ctr[6] ), 
	.C(n_17), 
	.B(n_18), 
	.A(n_31));
   NA2I1X0 p7831A (.Q(n_21), 
	.B(n_16), 
	.AN(n_15));
   NO2X0 p9624A (.Q(n_23), 
	.B(n_16), 
	.A(n_15));
   AO22X0 p11912A (.Q(ier_ctr_next_4617), 
	.D(\ier_ctr[5] ), 
	.C(n_17), 
	.B(n_18), 
	.A(n_37));
   NO2X0 p9326A (.Q(n_31), 
	.B(n_13), 
	.A(n_14));
   NA3I1X0 p7614A (.Q(n_15), 
	.C(n_12), 
	.B(n_13), 
	.AN(n_14));
   NO3I1X0 p9818A (.Q(n_178), 
	.C(n_12), 
	.B(n_14), 
	.AN(n_13));
   AO22X0 p11693A (.Q(ier_ctr_next_4618), 
	.D(\ier_ctr[3] ), 
	.C(n_17), 
	.B(n_18), 
	.A(n_29));
   AO22X0 p11845A (.Q(ier_ctr_next_4619), 
	.D(\ier_ctr[1] ), 
	.C(n_17), 
	.B(n_22), 
	.A(n_18));
   NO2I1X0 p11227A (.Q(n_33), 
	.B(n_11), 
	.AN(n_18));
   NO2X0 p9724A (.Q(n_37), 
	.B(n_9), 
	.A(n_10));
   NA3I1X0 p7118A (.Q(n_14), 
	.C(n_9), 
	.B(n_8), 
	.AN(n_10));
   NO3I1X0 p9655A (.Q(n_187), 
	.C(n_8), 
	.B(n_10), 
	.AN(n_9));
   AND2X0 p10806A (.Q(n_18), 
	.B(reg_ie_i[7]), 
	.A(n_36));
   NO2I1X0 p8622A (.Q(n_39), 
	.B(n_11), 
	.AN(n_36));
   NA2X0 p6863A (.Q(n_10), 
	.B(n_6), 
	.A(n_7));
   NO2I1X0 p10169A (.Q(n_29), 
	.B(n_6), 
	.AN(n_7));
   AO21X0 p11244A (.Q(n_32), 
	.C(n_17), 
	.B(n_5), 
	.A(n_153));
   NO3X0 p14932A (.Q(n_197), 
	.C(int_cm_i), 
	.B(n_153), 
	.A(n_11));
   OA21X0 p15502A (.Q(n_189), 
	.C(int_na_i), 
	.B(int_rdy_i), 
	.A(n_153));
   NO2I1X0 p39131A (.Q(n_180), 
	.B(n_153), 
	.AN(n_11));
   NO2I1X0 p15370A (.Q(n_182), 
	.B(n_153), 
	.AN(int_rdy_i));
   NO2I1X0 p15103A (.Q(n_181), 
	.B(n_153), 
	.AN(int_na_i));
   NO2X0 p8592A (.Q(n_36), 
	.B(n_4), 
	.A(n_153));
   NO3X0 p6921A (.Q(n_7), 
	.C(n_179), 
	.B(n_2), 
	.A(n_3));
   NO3I1X0 p10240A (.Q(n_185), 
	.C(n_179), 
	.B(n_2), 
	.AN(n_3));
   EO2X0 p13281A (.Q(n_56), 
	.B(reg_tcon_i[1]), 
	.A(n_61));
   EN2X0 p13072A (.Q(n_52), 
	.B(reg_tcon_i[3]), 
	.A(n_62));
   NA2I1X0 p7245A (.Q(n_8), 
	.B(reg_ip_i[4]), 
	.AN(n_24));
   NA2X0 p14361A (.Q(n_53), 
	.B(int_cm_i), 
	.A(n_183));
   NO2I1X0 p10015A (.Q(n_22), 
	.B(n_179), 
	.AN(n_2));
   OR5X0 p8978A (.Q(n_11), 
	.E(\ier[0] ), 
	.D(\ier[2] ), 
	.C(\ier[5] ), 
	.B(\ier[6] ), 
	.A(n_1));
   OR5X0 p8452A (.Q(n_153), 
	.E(\ier_ctr[0] ), 
	.D(\ier_ctr[2] ), 
	.C(\ier_ctr[5] ), 
	.B(\ier_ctr[6] ), 
	.A(n_0));
   ON211X0 p11380A (.Q(n_17), 
	.D(n_183), 
	.C(int_cm_i), 
	.B(int_na_i), 
	.A(int_rdy_i));
   NO2X0 p15061A (.Q(n_28), 
	.B(n_207), 
	.A(int_cm_i));
   NO2I1X0 p10609A (.Q(n_183), 
	.B(n_207), 
	.AN(reg_ie_i[7]));
   NA2I1X0 p7286A (.Q(n_9), 
	.B(reg_ip_i[5]), 
	.AN(n_26));
   NO2I1X0 p6362A (.Q(n_179), 
	.B(n_12), 
	.AN(reg_ip_i[0]));
   NO2I1X0 p6597A (.Q(n_2), 
	.B(n_16), 
	.AN(reg_ip_i[1]));
   NO2I1X0 p6732A (.Q(n_3), 
	.B(n_20), 
	.AN(reg_ip_i[2]));
   NA2I1X0 p11127A (.Q(n_4), 
	.B(n_207), 
	.AN(int_cm_i));
   NA2I1X0 p6909A (.Q(n_6), 
	.B(reg_ip_i[3]), 
	.AN(n_19));
   OR3X0 p8182A (.Q(n_0), 
	.C(\ier_ctr[4] ), 
	.B(\ier_ctr[3] ), 
	.A(\ier_ctr[1] ));
   ON21X0 p7220A (.Q(n_24), 
	.C(reg_ie_i[4]), 
	.B(reg_scon_i[0]), 
	.A(reg_scon_i[1]));
   NA3X0 p9527A6866 (.Q(n_25), 
	.C(reg_tcon2_i[1]), 
	.B(reg_ie_i[6]), 
	.A(n_26));
   OR3X0 p8762A (.Q(n_1), 
	.C(\ier[4] ), 
	.B(\ier[3] ), 
	.A(\ier[1] ));
   NA3X0 p8050A (.Q(n_13), 
	.C(reg_ie_i[6]), 
	.B(reg_tcon2_i[1]), 
	.A(reg_ip_i[6]));
   MU2IX0 p13318A (.S(reg_ie_i[0]), 
	.Q(n_61), 
	.IN1(n_152), 
	.IN0(reg_tcon_i[1]));
   MU2IX0 p13137A (.S(reg_ie_i[2]), 
	.Q(n_62), 
	.IN1(DFT_sdo), 
	.IN0(reg_tcon_i[3]));
   NA2X0 p6260A (.Q(n_12), 
	.B(reg_tcon_i[1]), 
	.A(reg_ie_i[0]));
   NA2X0 p7120A (.Q(n_26), 
	.B(reg_tcon2_i[0]), 
	.A(reg_ie_i[5]));
   NA2X0 p6588A (.Q(n_20), 
	.B(reg_tcon_i[3]), 
	.A(reg_ie_i[2]));
   NA2X0 p6506A (.Q(n_16), 
	.B(reg_tcon_i[4]), 
	.A(reg_ie_i[1]));
   INX0 Fp12146A (.Q(n_184), 
	.A(n_5));
   NA2X0 p12082A (.Q(n_5), 
	.B(int_rdy_i), 
	.A(int_na_i));
   NA2X0 p6794A (.Q(n_19), 
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
   NA2I1X1 p214748365A185 (.Q(en_port1_o[0]), 
	.B(ports_sfr_P1EN_i[0]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A186 (.Q(en_port2_o[7]), 
	.B(n_56), 
	.A(n_48));
   NA2I1X1 p214748365A187 (.Q(en_port1_o[7]), 
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
   NA2I1X1 p214748365A191 (.Q(en_port1_o[6]), 
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
   NA2I1X1 p214748365A199 (.Q(en_port1_o[4]), 
	.B(ports_sfr_P1EN_i[4]), 
	.AN(ports_test_mode_i));
   AND2X0 p214748365A200 (.Q(en_port2_o[0]), 
	.B(n_56), 
	.A(n_52));
   NA2I1X1 p214748365A201 (.Q(en_port1_o[3]), 
	.B(ports_sfr_P1EN_i[3]), 
	.AN(ports_test_mode_i));
   NA2I1X0 p214748365A202 (.Q(en_port0_o[1]), 
	.B(ports_sfr_P0EN_i[1]), 
	.AN(ports_test_mode_i));
   NA2I1X1 p214748365A203 (.Q(en_port1_o[2]), 
	.B(ports_sfr_P1EN_i[2]), 
	.AN(ports_test_mode_i));
   NA2I1X1 p214748365A204 (.Q(en_port1_o[1]), 
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

   AO32X0 p14385A (.Q(serial_p3_1_o), 
	.E(n_3), 
	.D(n_0), 
	.C(serial_p3_0_o), 
	.B(serial_scon7_sm0_internal_i), 
	.A(serial_data_en_internal_i));
   MU2IX0 p14495A (.S(serial_br_internal_i), 
	.Q(n_3), 
	.IN1(serial_receive_internal_i), 
	.IN0(n_2));
   NO2I1X0 p21011A (.Q(n_2), 
	.B(serial_receive_internal_i), 
	.AN(serial_send_internal_i));
   AND2X0 p14273A (.Q(serial_p3_0_o), 
	.B(serial_send_internal_i), 
	.A(serial_data_tx_internal_i));
   INX0 Fp14635A (.Q(n_0), 
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
	DFT_sdo, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N9);
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
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N9;

   // Internal wires
   wire aux2_tran_det;
   wire aux_tran_det;
   wire logic_0_1_net;
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
   wire n_20;
   wire n_23;
   wire n_25;
   wire n_26;
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
   wire n_61;
   wire n_62;
   wire n_81;
   wire \state_rx[0] ;
   wire \state_rx[1] ;
   wire \state_rx[2] ;

   SDFRX0 aux_tran_det_reg (.SE(DFT_sen), 
	.SD(aux2_tran_det), 
	.QN(aux_tran_det), 
	.Q(n_81), 
	.D(n_33), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \state_rx_reg[0]  (.SE(DFT_sen), 
	.SD(serial_start_input_shift_reg_o), 
	.Q(\state_rx[0] ), 
	.D(n_59), 
	.C(serial_clock_i));
   SDFRQX0 \state_rx_reg[2]  (.SE(DFT_sen), 
	.SD(\state_rx[1] ), 
	.Q(\state_rx[2] ), 
	.D(n_58), 
	.C(serial_clock_i));
   ON221X0 p15509A (.Q(n_59), 
	.E(n_49), 
	.D(n_32), 
	.C(n_51), 
	.B(\state_rx[0] ), 
	.A(n_55));
   SDFRQX0 \state_rx_reg[1]  (.SE(DFT_sen), 
	.SD(\state_rx[0] ), 
	.Q(\state_rx[1] ), 
	.D(n_57), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \state_rx_reg[3]  (.SE(DFT_sen), 
	.SD(\state_rx[2] ), 
	.Q(DFT_sdo), 
	.D(n_54), 
	.C(top_clock_i__L2_N3));
   AO221X0 p15087A (.Q(n_58), 
	.E(n_52), 
	.D(n_53), 
	.C(\state_rx[0] ), 
	.B(n_20), 
	.A(n_56));
   AO211X0 p15104A (.Q(n_57), 
	.D(n_48), 
	.C(n_56), 
	.B(n_61), 
	.A(n_43));
   AN21X0 p15509A1365 (.Q(n_55), 
	.C(n_45), 
	.B(n_61), 
	.A(n_50));
   AO321X0 p19465A (.Q(n_54), 
	.F(n_41), 
	.E(n_53), 
	.D(DFT_sdo), 
	.C(n_38), 
	.B(\state_rx[1] ), 
	.A(serial_transition_detected_i));
   NO3I1X0 p15087A1366 (.Q(n_56), 
	.C(n_44), 
	.B(DFT_sdo), 
	.AN(serial_scon7_sm0_i));
   ON221X0 p19518A (.Q(n_52), 
	.E(n_39), 
	.D(n_42), 
	.C(n_31), 
	.B(n_51), 
	.A(n_40));
   NA2I1X0 p19243A (.Q(n_50), 
	.B(n_51), 
	.AN(n_53));
   AN32X0 p20033A (.Q(n_49), 
	.E(n_46), 
	.D(\state_rx[1] ), 
	.C(n_47), 
	.B(n_30), 
	.A(\state_rx[0] ));
   AO321X0 p19017A (.Q(n_48), 
	.F(n_46), 
	.E(n_47), 
	.D(n_20), 
	.C(n_25), 
	.B(n_36), 
	.A(\state_rx[0] ));
   INX0 p15509A1367 (.Q(n_45), 
	.A(n_44));
   ON22X0 p19374A (.Q(n_43), 
	.D(n_23), 
	.C(n_51), 
	.B(serial_end_bit_i), 
	.A(n_42));
   NA2X0 p15084A (.Q(n_44), 
	.B(n_37), 
	.A(serial_scon4_ren_i));
   NA2I1X0 p19246A (.Q(n_53), 
	.B(n_42), 
	.AN(n_47));
   NO2I1X0 p19464A (.Q(n_41), 
	.B(n_51), 
	.AN(n_40));
   SDFRQX0 aux2_tran_det_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(aux2_tran_det), 
	.D(n_34), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 br_detect_reg (.SE(DFT_sen), 
	.SD(n_81), 
	.Q(n_61), 
	.D(n_35), 
	.C(top_clock_i__L2_N7));
   INX0 p19756A (.Q(n_39), 
	.A(n_46));
   NO2I1X0 p19017A1370 (.Q(n_46), 
	.B(serial_transition_detected_i), 
	.AN(n_38));
   NO3I1X0 p17431A (.Q(n_37), 
	.C(serial_scon0_ri_i), 
	.B(\state_rx[2] ), 
	.AN(n_36));
   NA2X0 p19374A1371 (.Q(n_51), 
	.B(DFT_sdo), 
	.A(n_36));
   NA2X0 p19244A (.Q(n_42), 
	.B(\state_rx[2] ), 
	.A(n_36));
   NO3I1X0 p21315A (.Q(n_35), 
	.C(aux2_tran_det), 
	.B(aux_tran_det), 
	.AN(serial_reset_i_b));
   NO2I1X0 p21393A (.Q(n_34), 
	.B(aux_tran_det), 
	.AN(serial_reset_i_b));
   NO3I1X0 p19011A (.Q(n_38), 
	.C(n_20), 
	.B(n_26), 
	.AN(serial_reset_i_b));
   NO2I1X0 p19192A (.Q(n_36), 
	.B(\state_rx[1] ), 
	.AN(serial_reset_i_b));
   AND2X0 p16241A (.Q(n_33), 
	.B(serial_reset_i_b), 
	.A(serial_br_i));
   AND2X0 p19357A (.Q(n_47), 
	.B(serial_reset_i_b), 
	.A(n_62));
   OA22X0 p32330A (.Q(n_32), 
	.D(n_20), 
	.C(n_61), 
	.B(\state_rx[2] ), 
	.A(n_29));
   OA21X0 p32210A (.Q(n_31), 
	.C(n_61), 
	.B(n_28), 
	.A(DFT_sdo));
   NA3X0 p31577A (.Q(n_40), 
	.C(serial_data_mode2_i), 
	.B(\state_rx[0] ), 
	.A(n_61));
   NO2I1X0 p32770A (.Q(n_30), 
	.B(n_28), 
	.AN(DFT_sdo));
   NO2X0 p32356A (.Q(n_29), 
	.B(serial_data_mode2_i), 
	.A(n_20));
   INX0 p32537A (.Q(n_28), 
	.A(serial_end_bit_i));
   OR2X0 p31069A (.Q(n_26), 
	.B(DFT_sdo), 
	.A(n_23));
   NA2I1X0 p31856A (.Q(n_25), 
	.B(DFT_sdo), 
	.AN(n_61));
   INX0 p32767A (.Q(n_23), 
	.A(\state_rx[2] ));
   INX0 p32356A1373 (.Q(n_20), 
	.A(\state_rx[0] ));
   SDFRQX0 serial_scon0_ri_o_reg (.SE(DFT_sen), 
	.SD(serial_receive_o), 
	.Q(serial_scon0_ri_o), 
	.D(n_17), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 serial_load_sbuf_o_reg (.SE(DFT_sen), 
	.SD(serial_clear_count_o), 
	.Q(serial_load_sbuf_o), 
	.D(n_16), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 serial_receive_o_reg (.SE(DFT_sen), 
	.SD(serial_p3en_1_o), 
	.Q(serial_receive_o), 
	.D(n_15), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 serial_start_input_shift_reg_o_reg (.SE(DFT_sen), 
	.SD(serial_shift_input_shift_reg_o), 
	.Q(serial_start_input_shift_reg_o), 
	.D(n_14), 
	.C(serial_clock_i));
   SDFRQX0 serial_clear_count_o_reg (.SE(DFT_sen), 
	.SD(n_61), 
	.Q(serial_clear_count_o), 
	.D(n_13), 
	.C(serial_clock_i));
   SDFRQX0 serial_shift_input_shift_reg_o_reg (.SE(DFT_sen), 
	.SD(serial_scon0_ri_o), 
	.Q(serial_shift_input_shift_reg_o), 
	.D(n_12), 
	.C(serial_clock_i));
   SDFRQX0 serial_p3en_1_o_reg (.SE(DFT_sen), 
	.SD(serial_p3en_0_o), 
	.Q(serial_p3en_1_o), 
	.D(serial_reset_i_b), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 serial_p3en_0_o_reg (.SE(DFT_sen), 
	.SD(serial_load_sbuf_o), 
	.Q(serial_p3en_0_o), 
	.D(logic_0_1_net), 
	.C(top_clock_i__L2_N9));
   MU2X0 p16558A (.S(n_11), 
	.Q(n_17), 
	.IN1(n_10), 
	.IN0(serial_scon0_ri_i));
   NO2I1X0 p22428A (.Q(n_16), 
	.B(n_9), 
	.AN(serial_reset_i_b));
   OA21X0 p22450A1148 (.Q(n_15), 
	.C(serial_reset_i_b), 
	.B(n_62), 
	.A(n_8));
   OA21X0 p22450A (.Q(n_14), 
	.C(serial_reset_i_b), 
	.B(n_6), 
	.A(n_7));
   AND2X0 p22436A (.Q(n_13), 
	.B(serial_reset_i_b), 
	.A(n_6));
   AND3X0 p22372A (.Q(n_12), 
	.C(serial_reset_i_b), 
	.B(\state_rx[0] ), 
	.A(n_62));
   NA2X0 p21957A (.Q(n_11), 
	.B(serial_reset_i_b), 
	.A(n_5));
   AND2X0 p21968A (.Q(n_10), 
	.B(serial_reset_i_b), 
	.A(n_4));
   AN22X0 p32371A (.Q(n_9), 
	.D(DFT_sdo), 
	.C(n_4), 
	.B(n_2), 
	.A(n_3));
   NO2I1X0 p32297A (.Q(n_8), 
	.B(n_3), 
	.AN(n_2));
   NO3I1X0 p31922A (.Q(n_7), 
	.C(\state_rx[1] ), 
	.B(\state_rx[2] ), 
	.AN(n_3));
   NO3X0 p32373A (.Q(n_6), 
	.C(\state_rx[2] ), 
	.B(\state_rx[0] ), 
	.A(n_1));
   INX0 Fp32221A (.Q(n_5), 
	.A(n_4));
   NO3I2X0 p31917A (.Q(n_4), 
	.C(\state_rx[0] ), 
	.BN(\state_rx[1] ), 
	.AN(\state_rx[2] ));
   NO2I1X0 p32169A (.Q(n_3), 
	.B(DFT_sdo), 
	.AN(\state_rx[0] ));
   NO2I1X0 p32445A (.Q(n_2), 
	.B(\state_rx[1] ), 
	.AN(\state_rx[2] ));
   NA2I1X0 p32377A (.Q(n_1), 
	.B(DFT_sdo), 
	.AN(\state_rx[1] ));
   NO2I1X0 p31060A (.Q(n_62), 
	.B(\state_rx[2] ), 
	.AN(\state_rx[1] ));
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
	DFT_sen, 
	DFT_sdo, 
	DFT_sdi_1, 
	SPCASCAN_N2, 
	p3en_1_temp2, 
	top_clock_i__L2_N7);
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
   output DFT_sdo;
   input DFT_sdi_1;
   output SPCASCAN_N2;
   input p3en_1_temp2;
   input top_clock_i__L2_N7;

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
   wire n_42;

   SDFRQX0 \counter_reg[3]  (.SE(DFT_sen), 
	.SD(\counter[0] ), 
	.Q(\counter[3] ), 
	.D(n_32), 
	.C(serial_br_trans_i));
   SDFRQX0 clear_reg (.SE(DFT_sen), 
	.SD(serial_sample_detected_o), 
	.Q(n_40), 
	.D(n_31), 
	.C(top_clock_i__L2_N7));
   NO2X0 p33236A (.Q(n_32), 
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
	.Q(SPCASCAN_N2), 
	.D(n_29), 
	.C(serial_br_trans_i));
   OA21X0 p22480A (.Q(n_31), 
	.C(serial_reset_i_b), 
	.B(serial_clear_count_i), 
	.A(n_25));
   EN2X0 p33125A (.Q(n_30), 
	.B(\counter[3] ), 
	.A(n_20));
   NO2X0 p33347A (.Q(n_29), 
	.B(n_21), 
	.A(n_42));
   ON32X0 p15724A (.Q(n_28), 
	.E(n_13), 
	.D(n_24), 
	.C(n_19), 
	.B(n_17), 
	.A(n_7));
   ON22X0 p15750A (.Q(n_27), 
	.D(n_16), 
	.C(n_17), 
	.B(n_24), 
	.A(n_10));
   ON22X0 p15750A840 (.Q(n_26), 
	.D(n_15), 
	.C(n_17), 
	.B(n_24), 
	.A(n_14));
   SDFRQX0 aux_reset1_reg (.SE(DFT_sen), 
	.SD(aux3_bit_det), 
	.Q(DFT_sdo), 
	.D(n_22), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \counter_reg[1]  (.SE(DFT_sen), 
	.SD(\counter[3] ), 
	.Q(\counter[1] ), 
	.D(n_23), 
	.C(serial_br_trans_i));
   NO2I1X0 p32972A (.Q(n_25), 
	.B(clear_br), 
	.AN(n_40));
   SDFRQX0 clear_br_reg (.SE(DFT_sen), 
	.SD(aux_tran_det), 
	.Q(clear_br), 
	.D(n_18), 
	.C(serial_br_trans_i));
   NA2I1X0 p15532A (.Q(n_24), 
	.B(serial_rxd_data_i), 
	.AN(n_17));
   NO2X0 p33346A (.Q(n_23), 
	.B(n_19), 
	.A(n_42));
   MU2X0 p22124A (.S(n_11), 
	.Q(n_22), 
	.IN1(DFT_sdo), 
	.IN0(n_39));
   EO2X0 p33102A (.Q(n_21), 
	.B(SPCASCAN_N2), 
	.A(n_13));
   SDFRQX0 \counter_reg[0]  (.SE(DFT_sen), 
	.SD(aux_reset2), 
	.Q(\counter[0] ), 
	.D(n_9), 
	.C(serial_br_trans_i));
   NO2I1X0 p32898A (.Q(n_20), 
	.B(n_13), 
	.AN(SPCASCAN_N2));
   AND2X0 p32874A (.Q(n_19), 
	.B(n_10), 
	.A(n_14));
   NO3I1X0 p33036A (.Q(n_18), 
	.C(DFT_sdo), 
	.B(n_8), 
	.AN(n_40));
   NA3I1X0 p32494A (.Q(n_17), 
	.C(SPCASCAN_N2), 
	.B(n_12), 
	.AN(n_40));
   SDFRQX0 aux_reset2_reg (.SE(DFT_sen), 
	.SD(clear_br), 
	.Q(aux_reset2), 
	.D(DFT_sdo), 
	.C(serial_br_trans_i));
   NA2X0 p33279A (.Q(n_16), 
	.B(\counter[1] ), 
	.A(aux1_bit_det));
   NA2X0 p33265A (.Q(n_15), 
	.B(\counter[0] ), 
	.A(aux2_bit_det));
   NA2I1X0 p32598A (.Q(n_14), 
	.B(\counter[1] ), 
	.AN(\counter[0] ));
   NA2X0 p32686A (.Q(n_13), 
	.B(\counter[1] ), 
	.A(\counter[0] ));
   NO2X0 p32467A (.Q(n_12), 
	.B(DFT_sdo), 
	.A(\counter[3] ));
   NO2I1X0 p21964A (.Q(n_11), 
	.B(aux_reset2), 
	.AN(serial_reset_i_b));
   NA2I1X0 p32580A (.Q(n_10), 
	.B(\counter[0] ), 
	.AN(\counter[1] ));
   NO2X0 p33346A846 (.Q(n_9), 
	.B(\counter[0] ), 
	.A(n_42));
   INX0 Fp33054A (.Q(n_8), 
	.A(n_42));
   INX0 Fp12876A (.Q(n_7), 
	.A(aux3_bit_det));
   SDFRQX0 serial_transition_detected_o_reg (.SE(DFT_sen), 
	.SD(p3en_1_temp2), 
	.Q(serial_transition_detected_o), 
	.D(n_6), 
	.C(serial_clock_i));
   SDFRQX0 serial_sample_detected_o_reg (.SE(DFT_sen), 
	.SD(serial_shift_o), 
	.Q(serial_sample_detected_o), 
	.D(n_5), 
	.C(serial_br_trans_i));
   SDFRQX0 aux2_tran_det_reg (.SE(DFT_sen), 
	.SD(aux2_bit_det), 
	.Q(aux2_tran_det), 
	.D(n_4), 
	.C(serial_clock_i));
   SDFRQX0 serial_shift_o_reg (.SE(DFT_sen), 
	.SD(serial_transition_detected_o), 
	.Q(serial_shift_o), 
	.D(n_3), 
	.C(serial_br_trans_i));
   SDFRQX0 aux_tran_det_reg (.SE(DFT_sen), 
	.SD(n_40), 
	.Q(aux_tran_det), 
	.D(n_2), 
	.C(top_clock_i__L2_N7));
   NO3I1X0 p22585A (.Q(n_6), 
	.C(aux_tran_det), 
	.B(n_39), 
	.AN(aux2_tran_det));
   AN21X0 p32879A (.Q(n_5), 
	.C(DFT_sdo), 
	.B(n_0), 
	.A(n_1));
   NO2I1X0 p22625A (.Q(n_4), 
	.B(n_39), 
	.AN(aux_tran_det));
   NO5I3X0 p32750A (.Q(n_3), 
	.E(\counter[3] ), 
	.D(n_42), 
	.CN(\counter[0] ), 
	.BN(SPCASCAN_N2), 
	.AN(\counter[1] ));
   AND2X0 p15936A (.Q(n_2), 
	.B(serial_reset_i_b), 
	.A(serial_rxd_data_i));
   ON21X0 p33060A (.Q(n_1), 
	.C(aux1_bit_det), 
	.B(aux3_bit_det), 
	.A(aux2_bit_det));
   NA2X0 p33139A (.Q(n_0), 
	.B(aux3_bit_det), 
	.A(aux2_bit_det));
   OR2X0 p32466A (.Q(n_42), 
	.B(DFT_sdo), 
	.A(n_40));
   INX0 Fp22574A (.Q(n_39), 
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
	FE_PT1_top_p2_a_o_2_, 
	SPCASCAN_N4, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N9);
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
   input FE_PT1_top_p2_a_o_2_;
   output SPCASCAN_N4;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N9;

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
	.Q(\data_received[2] ), 
	.D(n_29), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \data_received_reg[6]  (.SE(DFT_sen), 
	.SD(\data_received[3] ), 
	.Q(\data_received[6] ), 
	.D(n_25), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \data_received_reg[7]  (.SE(DFT_sen), 
	.SD(\data_received[6] ), 
	.Q(\data_received[7] ), 
	.D(n_32), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \data_received_reg[8]  (.SE(DFT_sen), 
	.SD(\data_received[7] ), 
	.Q(SPCASCAN_N3), 
	.D(n_31), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \data_received_reg[9]  (.SE(DFT_sen), 
	.SD(serial_end_bit_o), 
	.Q(\data_received[9] ), 
	.D(n_30), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \data_received_reg[3]  (.SE(DFT_sen), 
	.SD(serial_scon2_rb8_o), 
	.Q(\data_received[3] ), 
	.D(n_28), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \data_received_reg[4]  (.SE(DFT_sen), 
	.SD(\data_received[5] ), 
	.Q(\data_received[4] ), 
	.D(n_27), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \data_received_reg[5]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[0]), 
	.Q(\data_received[5] ), 
	.D(n_26), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \data_received_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(SPCASCAN_N4), 
	.D(n_24), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \data_received_reg[1]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p2_a_o_2_), 
	.Q(\data_received[1] ), 
	.D(n_21), 
	.C(top_clock_i__L2_N9));
   AO221X0 p14854A (.Q(n_32), 
	.E(n_22), 
	.D(\data_received[7] ), 
	.C(n_19), 
	.B(\data_received[6] ), 
	.A(n_18));
   AO221X0 p14854A781 (.Q(n_31), 
	.E(n_22), 
	.D(SPCASCAN_N3), 
	.C(n_19), 
	.B(\data_received[7] ), 
	.A(n_18));
   AO221X0 p14854A782 (.Q(n_30), 
	.E(n_22), 
	.D(\data_received[9] ), 
	.C(n_19), 
	.B(SPCASCAN_N3), 
	.A(n_18));
   AO221X0 p14854A783 (.Q(n_29), 
	.E(n_22), 
	.D(\data_received[2] ), 
	.C(n_19), 
	.B(\data_received[1] ), 
	.A(n_18));
   AO221X0 p14854A784 (.Q(n_28), 
	.E(n_22), 
	.D(\data_received[3] ), 
	.C(n_19), 
	.B(\data_received[2] ), 
	.A(n_18));
   AO221X0 p14854A785 (.Q(n_27), 
	.E(n_22), 
	.D(\data_received[4] ), 
	.C(n_19), 
	.B(\data_received[3] ), 
	.A(n_18));
   AO221X0 p14854A786 (.Q(n_26), 
	.E(n_22), 
	.D(\data_received[5] ), 
	.C(n_19), 
	.B(\data_received[4] ), 
	.A(n_18));
   AO221X0 p14854A787 (.Q(n_25), 
	.E(n_22), 
	.D(\data_received[6] ), 
	.C(n_19), 
	.B(\data_received[5] ), 
	.A(n_18));
   ON21X0 p15363A (.Q(n_24), 
	.C(n_23), 
	.B(n_15), 
	.A(n_20));
   INX0 Fp14807A (.Q(n_23), 
	.A(n_22));
   OA21X0 p14224A (.Q(n_22), 
	.C(serial_start_input_shift_reg_i), 
	.B(n_12), 
	.A(n_17));
   AO22X0 p21606A (.Q(n_21), 
	.D(n_19), 
	.C(\data_received[1] ), 
	.B(n_18), 
	.A(SPCASCAN_N4));
   SDFRQX0 serial_scon2_rb8_o_reg (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[5]), 
	.Q(serial_scon2_rb8_o), 
	.D(n_16), 
	.C(top_clock_i__L2_N5));
   AN32X0 p15264A (.Q(n_20), 
	.E(SPCASCAN_N4), 
	.D(n_13), 
	.C(serial_data_i), 
	.B(n_11), 
	.A(serial_receive_i));
   NO2I1X0 p21281A (.Q(n_19), 
	.B(n_15), 
	.AN(n_14));
   NO2X0 p21163A (.Q(n_18), 
	.B(n_14), 
	.A(n_15));
   AN21X0 p14226A (.Q(n_17), 
	.C(n_35), 
	.B(serial_reset_i_b), 
	.A(serial_scon7_sm0_i));
   AO22X0 p15356A (.Q(n_16), 
	.D(n_41), 
	.C(\data_received[1] ), 
	.B(serial_scon2_rb8_o), 
	.A(n_40));
   NA2I1X0 p21008A (.Q(n_15), 
	.B(serial_reset_i_b), 
	.AN(serial_start_input_shift_reg_i));
   NA2X0 p46465A (.Q(n_14), 
	.B(serial_shift_input_shift_reg_i), 
	.A(serial_receive_i));
   INX0 Fp46483A (.Q(n_13), 
	.A(serial_receive_i));
   INX0 Fp14221A (.Q(n_12), 
	.A(n_37));
   INX0 Fp46477A (.Q(n_11), 
	.A(serial_shift_input_shift_reg_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[7]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[2]), 
	.Q(serial_sbuf_rx_o[7]), 
	.D(n_10), 
	.C(serial_clock_i));
   SDFRQX0 \serial_sbuf_rx_o_reg[6]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[3]), 
	.Q(serial_sbuf_rx_o[6]), 
	.D(n_9), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \serial_sbuf_rx_o_reg[4]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[6]), 
	.Q(serial_sbuf_rx_o[4]), 
	.D(n_8), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \serial_sbuf_rx_o_reg[0]  (.SE(DFT_sen), 
	.SD(\data_received[9] ), 
	.Q(serial_sbuf_rx_o[0]), 
	.D(n_7), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \serial_sbuf_rx_o_reg[3]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[7]), 
	.Q(serial_sbuf_rx_o[3]), 
	.D(n_6), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \serial_sbuf_rx_o_reg[5]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[4]), 
	.Q(serial_sbuf_rx_o[5]), 
	.D(n_5), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \serial_sbuf_rx_o_reg[2]  (.SE(DFT_sen), 
	.SD(serial_sbuf_rx_o[1]), 
	.Q(serial_sbuf_rx_o[2]), 
	.D(n_4), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \serial_sbuf_rx_o_reg[1]  (.SE(DFT_sen), 
	.SD(\data_received[4] ), 
	.Q(serial_sbuf_rx_o[1]), 
	.D(n_3), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 serial_end_bit_o_reg (.SE(DFT_sen), 
	.SD(\data_received[2] ), 
	.Q(serial_end_bit_o), 
	.D(n_2), 
	.C(top_clock_i__L2_N10));
   AO22X0 p15442A715 (.Q(n_10), 
	.D(n_41), 
	.C(\data_received[9] ), 
	.B(n_40), 
	.A(SPCASCAN_N3));
   AO22X0 p15442A714 (.Q(n_9), 
	.D(n_41), 
	.C(SPCASCAN_N3), 
	.B(n_40), 
	.A(\data_received[7] ));
   AO22X0 p15442A712 (.Q(n_8), 
	.D(n_41), 
	.C(\data_received[6] ), 
	.B(n_40), 
	.A(\data_received[5] ));
   AO22X0 p15442A (.Q(n_7), 
	.D(n_41), 
	.C(\data_received[2] ), 
	.B(n_40), 
	.A(\data_received[1] ));
   AO22X0 p15442A711 (.Q(n_6), 
	.D(n_41), 
	.C(\data_received[5] ), 
	.B(n_40), 
	.A(\data_received[4] ));
   AO22X0 p15442A713 (.Q(n_5), 
	.D(n_41), 
	.C(\data_received[7] ), 
	.B(n_40), 
	.A(\data_received[6] ));
   AO22X0 p15442A710 (.Q(n_4), 
	.D(n_41), 
	.C(\data_received[4] ), 
	.B(n_40), 
	.A(\data_received[3] ));
   AO22X0 p15442A709 (.Q(n_3), 
	.D(n_41), 
	.C(\data_received[3] ), 
	.B(n_40), 
	.A(\data_received[2] ));
   AND2X0 p15615A (.Q(n_2), 
	.B(serial_reset_i_b), 
	.A(n_1));
   MU2IX0 p15706A (.S(serial_scon7_sm0_i), 
	.Q(n_1), 
	.IN1(\data_received[9] ), 
	.IN0(SPCASCAN_N3));
   NO2I1X0 p15028A (.Q(n_41), 
	.B(n_0), 
	.AN(serial_scon7_sm0_i));
   NO2X0 p15043A (.Q(n_40), 
	.B(n_0), 
	.A(serial_scon7_sm0_i));
   NA2X0 p21394A (.Q(n_0), 
	.B(serial_load_sbuf_i), 
	.A(serial_reset_i_b));
   NA2X0 p14174A (.Q(n_37), 
	.B(serial_reset_i_b), 
	.A(serial_scon7_sm0_i));
   NA2I1X0 p14112A (.Q(n_35), 
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
	SPCASCAN_N2, 
	p3en_1_temp2, 
	SPCASCAN_N3, 
	FE_PT1_top_p2_a_o_2_, 
	SPCASCAN_N4, 
	SPCASCAN_N5, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N9);
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
   output SPCASCAN_N2;
   input p3en_1_temp2;
   output SPCASCAN_N3;
   input FE_PT1_top_p2_a_o_2_;
   output SPCASCAN_N4;
   input SPCASCAN_N5;
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N9;

   // Internal wires
   wire CLEAR_COUNT;
   wire DATA_MODE2;
   wire END_BIT;
   wire SERIAL_SHIFT;
   wire SHIFT_BR;
   wire SHIFT_INPUT_SHIFT_REG;
   wire START_INPUT_SHIFT_REG;
   wire TRANSITION_DETECTED;
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
	.serial_transition_detected_i(TRANSITION_DETECTED), 
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
	.DFT_sdo(n_22), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   serial_rx_detector serial_rx_detector (.serial_rxd_data_i(serial_data_mode0_i), 
	.serial_br_trans_i(serial_br_trans_i), 
	.serial_clear_count_i(CLEAR_COUNT), 
	.serial_clock_i(top_clock_i__L2_N3), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_sample_detected_o(DATA_MODE2), 
	.serial_transition_detected_o(TRANSITION_DETECTED), 
	.serial_shift_o(SERIAL_SHIFT), 
	.DFT_sdi(n_22), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_1), 
	.SPCASCAN_N2(SPCASCAN_N2), 
	.p3en_1_temp2(p3en_1_temp2), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7));
   serial_rx_input_shifter_reg serial_rx_input_shifter_reg (.serial_clock_i(top_clock_i__L2_N1), 
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
	.DFT_sdi(SPCASCAN_N5), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.FE_PT1_top_p2_a_o_2_(FE_PT1_top_p2_a_o_2_), 
	.SPCASCAN_N4(SPCASCAN_N4), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   MU2X0 p15060A (.S(serial_scon7_sm0_i), 
	.Q(data_mode), 
	.IN1(DATA_MODE2), 
	.IN0(serial_data_mode0_i));
   MU2X0 p15444A (.S(serial_scon7_sm0_i), 
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
	serial_start_idle_o, 
	DFT_sdi, 
	DFT_sen, 
	DFT_sdi_1, 
	DFT_sdo, 
	SPCASCAN_N3, 
	SPCASCAN_N4, 
	SPCASCAN_N5, 
	FE_PT1_top_p0_y_i_2_, 
	DATA_TX_INTERNAL, 
	SPCASCAN_N7, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N9);
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
   output serial_start_idle_o;
   input DFT_sdi;
   input DFT_sen;
   input DFT_sdi_1;
   output DFT_sdo;
   input SPCASCAN_N3;
   input SPCASCAN_N4;
   output SPCASCAN_N5;
   input FE_PT1_top_p0_y_i_2_;
   input DATA_TX_INTERNAL;
   input SPCASCAN_N7;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N9;

   // Internal wires
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
   wire n_26;
   wire n_27;
   wire n_28;
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
   wire n_77;
   wire n_79;
   wire n_80;
   wire n_81;
   wire n_83;
   wire n_86;
   wire n_87;
   wire n_88;
   wire n_89;
   wire n_101;
   wire n_102;
   wire n_103;
   wire n_105;
   wire n_106;
   wire n_107;
   wire n_110;
   wire \state_tx[0] ;
   wire \state_tx[1] ;
   wire \state_tx[2] ;

   SDFRX0 aux_tran_det_reg (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_2_), 
	.QN(aux_tran_det), 
	.Q(n_110), 
	.D(n_35), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \state_tx_reg[1]  (.SE(DFT_sen), 
	.SD(DFT_sdo), 
	.Q(\state_tx[1] ), 
	.D(n_74), 
	.C(serial_clock_i));
   SDFRQX0 \state_tx_reg[0]  (.SE(DFT_sen), 
	.SD(serial_stop_bit_gen_o), 
	.Q(\state_tx[0] ), 
	.D(n_73), 
	.C(top_clock_i__L2_N6));
   NA3X0 p15640A (.Q(n_74), 
	.C(n_68), 
	.B(n_61), 
	.A(n_72));
   ON211X0 p15917A (.Q(n_73), 
	.D(n_71), 
	.C(n_62), 
	.B(n_42), 
	.A(serial_scon7_sm0_i));
   SDFRQX0 \state_tx_reg[3]  (.SE(DFT_sen), 
	.SD(\state_tx[0] ), 
	.Q(DFT_sdo), 
	.D(n_69), 
	.C(serial_clock_i));
   AN21X0 p19753A (.Q(n_72), 
	.C(n_70), 
	.B(serial_end_bit_i), 
	.A(n_55));
   SDFRQX0 \state_tx_reg[2]  (.SE(DFT_sen), 
	.SD(\state_tx[1] ), 
	.Q(\state_tx[2] ), 
	.D(n_67), 
	.C(serial_clock_i));
   NO3I1X0 p19687A (.Q(n_71), 
	.C(n_65), 
	.B(n_64), 
	.AN(n_54));
   ON311X0 p19755A (.Q(n_70), 
	.E(n_63), 
	.D(n_58), 
	.C(n_47), 
	.B(n_88), 
	.A(br_detect1));
   NA2X0 p15731A (.Q(n_69), 
	.B(n_68), 
	.A(n_66));
   AO31X0 p19565A (.Q(n_67), 
	.D(n_60), 
	.C(n_53), 
	.B(\state_tx[0] ), 
	.A(n_77));
   AN221X0 p19840A (.Q(n_66), 
	.E(n_65), 
	.D(n_49), 
	.C(serial_reset_i_b), 
	.B(n_26), 
	.A(n_45));
   ON211X0 p19877A (.Q(n_64), 
	.D(n_50), 
	.C(n_51), 
	.B(n_77), 
	.A(n_57));
   AN22X0 p19754A (.Q(n_63), 
	.D(serial_reset_i_b), 
	.C(n_81), 
	.B(n_77), 
	.A(n_52));
   ON21X0 p19854A (.Q(n_62), 
	.C(n_77), 
	.B(n_46), 
	.A(n_56));
   NO2I1X0 p19532A (.Q(n_61), 
	.B(n_65), 
	.AN(n_59));
   NA3X0 p19565A1946 (.Q(n_60), 
	.C(n_57), 
	.B(n_58), 
	.A(n_59));
   AN31X0 p15639A (.Q(n_68), 
	.D(n_56), 
	.C(n_101), 
	.B(serial_scon7_sm0_i), 
	.A(n_41));
   INX0 p19862A (.Q(n_55), 
	.A(n_54));
   AN21X0 p19716A (.Q(n_54), 
	.C(n_48), 
	.B(serial_reset_i_b), 
	.A(n_83));
   SDFRQX0 do_first_shift_flag_reg (.SE(DFT_sen), 
	.SD(br_detect1), 
	.Q(SPCASCAN_N5), 
	.D(n_44), 
	.C(top_clock_i__L2_N6));
   AND3X0 p19688A (.Q(n_65), 
	.C(n_26), 
	.B(\state_tx[0] ), 
	.A(n_53));
   NO2I1X0 p19855A (.Q(n_56), 
	.B(\state_tx[0] ), 
	.AN(n_53));
   INX0 p19756A (.Q(n_52), 
	.A(n_57));
   OA21X0 p19521A (.Q(n_59), 
	.C(n_50), 
	.B(n_26), 
	.A(n_51));
   AO222X0 p30802A (.Q(n_49), 
	.F(n_38), 
	.E(SPCASCAN_N5), 
	.D(n_83), 
	.C(n_28), 
	.B(n_106), 
	.A(n_26));
   NA2X0 p19755A1948 (.Q(n_57), 
	.B(serial_reset_i_b), 
	.A(n_43));
   NO3I1X0 p19713A (.Q(n_48), 
	.C(n_88), 
	.B(n_47), 
	.AN(br_detect1));
   SDFRQX0 br_detect1_reg (.SE(DFT_sen), 
	.SD(aux2_tran_det), 
	.Q(br_detect1), 
	.D(n_39), 
	.C(top_clock_i__L2_N3));
   AN21X0 p20044A (.Q(n_58), 
	.C(n_46), 
	.B(serial_reset_i_b), 
	.A(n_107));
   NO2I1X0 p19687A1950 (.Q(n_53), 
	.B(n_47), 
	.AN(DFT_sdo));
   SDFRQX0 aux2_tran_det_reg (.SE(DFT_sen), 
	.SD(n_77), 
	.Q(aux2_tran_det), 
	.D(n_36), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 br_detect_reg (.SE(DFT_sen), 
	.SD(n_110), 
	.Q(n_77), 
	.D(n_37), 
	.C(top_clock_i__L2_N3));
   INX0 p20100A (.Q(n_45), 
	.A(n_51));
   AN211X0 p20796A (.Q(n_44), 
	.D(n_102), 
	.C(n_40), 
	.B(\state_tx[0] ), 
	.A(n_22));
   NO3I1X0 p31253A (.Q(n_43), 
	.C(\state_tx[1] ), 
	.B(n_87), 
	.AN(\state_tx[2] ));
   NA2X0 p15916A (.Q(n_42), 
	.B(n_41), 
	.A(n_101));
   NA3X0 p20009A (.Q(n_50), 
	.C(n_77), 
	.B(serial_reset_i_b), 
	.A(n_106));
   OR3X0 p19521A1953 (.Q(n_51), 
	.C(n_0), 
	.B(n_27), 
	.A(n_89));
   NO3X0 p20043A (.Q(n_46), 
	.C(n_0), 
	.B(n_40), 
	.A(n_88));
   NA2I1X0 p19688A1954 (.Q(n_47), 
	.B(serial_reset_i_b), 
	.AN(n_86));
   AO32X0 p20843A (.Q(n_39), 
	.E(br_detect1), 
	.D(n_0), 
	.C(serial_reset_i_b), 
	.B(aux_tran_det), 
	.A(aux2_tran_det));
   INX0 p15640A1955 (.Q(n_41), 
	.A(n_103));
   INX0 p31117A (.Q(n_38), 
	.A(n_105));
   NO3X0 p21267A (.Q(n_37), 
	.C(aux2_tran_det), 
	.B(aux_tran_det), 
	.A(n_0));
   NO2X0 p21422A (.Q(n_36), 
	.B(aux_tran_det), 
	.A(n_0));
   NO2I1X0 p21393A (.Q(n_35), 
	.B(n_0), 
	.AN(serial_br_i));
   INX0 p32400A (.Q(n_28), 
	.A(serial_end_bit_i));
   NA2X0 p31579A (.Q(n_27), 
	.B(DFT_sdo), 
	.A(\state_tx[0] ));
   NA2X0 p32199A (.Q(n_40), 
	.B(\state_tx[2] ), 
	.A(\state_tx[1] ));
   INX0 p32669A (.Q(n_26), 
	.A(n_77));
   INX0 p33509A (.Q(n_22), 
	.A(SPCASCAN_N5));
   SDFRQX0 serial_scon1_ti_o_reg (.SE(DFT_sen), 
	.SD(serial_p3en_0_o), 
	.Q(serial_scon1_ti_o), 
	.D(n_21), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_p3en_0_o_reg (.SE(DFT_sen), 
	.SD(serial_data_en_o), 
	.Q(serial_p3en_0_o), 
	.D(n_20), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_send_o_reg (.SE(DFT_sen), 
	.SD(serial_scon1_ti_o), 
	.Q(serial_send_o), 
	.D(n_19), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_p3en_1_o_reg (.SE(DFT_sen), 
	.SD(SPCASCAN_N3), 
	.Q(serial_p3en_1_o), 
	.D(n_18), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 serial_data_en_o_reg (.SE(DFT_sen), 
	.SD(SPCASCAN_N4), 
	.Q(serial_data_en_o), 
	.D(n_17), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_shift_o_reg (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(serial_shift_o), 
	.D(n_16), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 serial_start_idle_o_reg (.SE(DFT_sen), 
	.SD(DATA_TX_INTERNAL), 
	.Q(serial_start_idle_o), 
	.D(n_15), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_start_shifter_reg_o_reg (.SE(DFT_sen), 
	.SD(\state_tx[2] ), 
	.Q(serial_start_shifter_reg_o), 
	.D(n_14), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_stop_bit_gen_o_reg (.SE(DFT_sen), 
	.SD(SPCASCAN_N7), 
	.Q(serial_stop_bit_gen_o), 
	.D(n_13), 
	.C(top_clock_i__L2_N9));
   AO33X0 p16134AT (.Q(n_21), 
	.F(n_10), 
	.E(serial_scon1_ti_i), 
	.D(serial_reset_i_b), 
	.C(n_11), 
	.B(n_12), 
	.A(serial_reset_i_b));
   NO2I1X0 p15687A (.Q(n_20), 
	.B(n_102), 
	.AN(n_9));
   OA21X0 p22485A (.Q(n_19), 
	.C(serial_reset_i_b), 
	.B(n_7), 
	.A(n_8));
   AN321X0 p16067AT (.Q(n_18), 
	.F(n_0), 
	.E(\state_tx[2] ), 
	.D(DFT_sdo), 
	.C(n_79), 
	.B(serial_reset_i_b), 
	.A(n_103));
   NO2I1X0 p22641A (.Q(n_17), 
	.B(n_0), 
	.AN(n_7));
   AN21X0 p22625A (.Q(n_16), 
	.C(n_0), 
	.B(n_105), 
	.A(n_80));
   NO3I1X0 p22597A (.Q(n_15), 
	.C(n_0), 
	.B(n_86), 
	.AN(DFT_sdo));
   NO2I1X0 p22641A1839 (.Q(n_14), 
	.B(n_0), 
	.AN(n_107));
   NO2I1X0 p22641A1840 (.Q(n_13), 
	.B(n_0), 
	.AN(n_106));
   INX0 Fp31467A (.Q(n_12), 
	.A(n_10));
   NA2X0 p22070A (.Q(n_11), 
	.B(serial_reset_i_b), 
	.A(n_10));
   AN21X0 p31297A (.Q(n_10), 
	.C(n_5), 
	.B(serial_end_bit_i), 
	.A(n_83));
   ON321X0 p15240A (.Q(n_9), 
	.F(n_3), 
	.E(n_86), 
	.D(\state_tx[0] ), 
	.C(\state_tx[2] ), 
	.B(serial_scon7_sm0_i), 
	.A(n_4));
   NO2X0 p32198A (.Q(n_8), 
	.B(DFT_sdo), 
	.A(n_2));
   EO2X0 p32047A (.Q(n_7), 
	.B(DFT_sdo), 
	.A(\state_tx[2] ));
   NO2X0 p31530A (.Q(n_5), 
	.B(n_87), 
	.A(n_86));
   NO2I1X0 p15417A (.Q(n_4), 
	.B(\state_tx[0] ), 
	.AN(n_103));
   ON21X0 p32090A (.Q(n_3), 
	.C(n_1), 
	.B(\state_tx[0] ), 
	.A(\state_tx[1] ));
   EN2X0 p32199A1960 (.Q(n_2), 
	.B(\state_tx[0] ), 
	.A(\state_tx[1] ));
   INX0 Fp30788A (.Q(n_1), 
	.A(n_89));
   NO2X0 p30960A (.Q(n_83), 
	.B(SPCASCAN_N5), 
	.A(n_105));
   NO2I1X0 p21889A (.Q(n_101), 
	.B(n_0), 
	.AN(n_79));
   INX0 Fp31552A (.Q(n_81), 
	.A(n_80));
   OR2X0 p31428A (.Q(n_80), 
	.B(n_87), 
	.A(n_89));
   NO2X0 p31938A (.Q(n_79), 
	.B(n_88), 
	.A(n_89));
   NA3I1X0 p30660A (.Q(n_105), 
	.C(\state_tx[2] ), 
	.B(\state_tx[1] ), 
	.AN(n_87));
   NO3I1X0 p31638A (.Q(n_107), 
	.C(\state_tx[1] ), 
	.B(n_88), 
	.AN(\state_tx[2] ));
   NO3I1X0 p30889A (.Q(n_106), 
	.C(\state_tx[0] ), 
	.B(n_89), 
	.AN(DFT_sdo));
   NA2I1X0 p30408A (.Q(n_87), 
	.B(\state_tx[0] ), 
	.AN(DFT_sdo));
   OR2X0 p30632A (.Q(n_89), 
	.B(\state_tx[2] ), 
	.A(\state_tx[1] ));
   NA2I1X0 p22314A (.Q(n_102), 
	.B(serial_reset_i_b), 
	.AN(DFT_sdo));
   NA2I1X0 p15094A (.Q(n_103), 
	.B(serial_serial_tx_i), 
	.AN(serial_scon1_ti_i));
   OR2X0 p31439A (.Q(n_88), 
	.B(\state_tx[0] ), 
	.A(DFT_sdo));
   NA2I1X0 p30819A (.Q(n_86), 
	.B(\state_tx[1] ), 
	.AN(\state_tx[2] ));
   INX0 Fp21928A (.Q(n_0), 
	.A(serial_reset_i_b));
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
	serial_start_idle_i, 
	serial_data_tx_o, 
	serial_end_bit_o, 
	DFT_sdi, 
	DFT_sen, 
	SPCASCAN_N6, 
	START_SHIFTER_REG, 
	SPCASCAN_N7, 
	FE_PT1_top_p0_y_i_3_, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N9);
   input serial_clock_i;
   input serial_reset_i_b;
   input [7:0] serial_data_sbuf_i;
   input serial_start_shifter_reg_i;
   input serial_shift_i;
   input serial_stop_bit_gen_i;
   input serial_scon3_tb8_i;
   input serial_scon7_sm0_i;
   input serial_start_idle_i;
   output serial_data_tx_o;
   output serial_end_bit_o;
   input DFT_sdi;
   input DFT_sen;
   output SPCASCAN_N6;
   input START_SHIFTER_REG;
   output SPCASCAN_N7;
   input FE_PT1_top_p0_y_i_3_;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N9;

   // Internal wires
   wire \data_to_transmit[0] ;
   wire \data_to_transmit[1] ;
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
   wire n_41;
   wire n_42;
   wire n_49;

   SDFRQX0 \data_to_transmit_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(\data_to_transmit[0] ), 
	.D(n_37), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \data_to_transmit_reg[1]  (.SE(DFT_sen), 
	.SD(serial_shift_i), 
	.Q(\data_to_transmit[1] ), 
	.D(n_36), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[2]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[1] ), 
	.Q(\data_to_transmit[2] ), 
	.D(n_31), 
	.C(serial_clock_i));
   SDFRQX0 \data_to_transmit_reg[3]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[2] ), 
	.Q(\data_to_transmit[3] ), 
	.D(n_29), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \data_to_transmit_reg[4]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[5] ), 
	.Q(SPCASCAN_N6), 
	.D(n_35), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \data_to_transmit_reg[5]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[7] ), 
	.Q(\data_to_transmit[5] ), 
	.D(n_34), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \data_to_transmit_reg[6]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[8] ), 
	.Q(\data_to_transmit[6] ), 
	.D(n_33), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \data_to_transmit_reg[7]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[9] ), 
	.Q(\data_to_transmit[7] ), 
	.D(n_32), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \data_to_transmit_reg[8]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[3] ), 
	.Q(\data_to_transmit[8] ), 
	.D(n_30), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 \data_to_transmit_reg[9]  (.SE(DFT_sen), 
	.SD(\data_to_transmit[6] ), 
	.Q(\data_to_transmit[9] ), 
	.D(n_28), 
	.C(top_clock_i__L2_N5));
   SDFRQX0 flag_end_bit_reg (.SE(DFT_sen), 
	.SD(\data_to_transmit[0] ), 
	.Q(SPCASCAN_N7), 
	.D(n_42), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 serial_data_tx_o_reg (.SE(DFT_sen), 
	.SD(START_SHIFTER_REG), 
	.Q(serial_data_tx_o), 
	.D(n_41), 
	.C(top_clock_i__L2_N9));
   AO22X0 p14615A (.Q(n_42), 
	.D(serial_stop_bit_gen_i), 
	.C(n_13), 
	.B(n_40), 
	.A(SPCASCAN_N7));
   AO222X0 p14362A (.Q(n_41), 
	.F(serial_reset_i_b), 
	.E(serial_start_idle_i), 
	.D(\data_to_transmit[0] ), 
	.C(n_38), 
	.B(n_39), 
	.A(serial_scon7_sm0_i));
   NA2I1X0 p14441A (.Q(n_40), 
	.B(n_11), 
	.AN(n_38));
   ON31X0 p14258A (.Q(n_39), 
	.D(n_7), 
	.C(n_27), 
	.B(n_9), 
	.A(n_5));
   AO21X0 p13968A (.Q(n_38), 
	.C(n_8), 
	.B(serial_reset_i_b), 
	.A(n_27));
   AN21X0 p15467A (.Q(n_37), 
	.C(n_49), 
	.B(n_12), 
	.A(n_19));
   AO221X0 p14381A (.Q(n_36), 
	.E(n_23), 
	.D(n_14), 
	.C(serial_data_sbuf_i[0]), 
	.B(\data_to_transmit[1] ), 
	.A(n_13));
   AO221X0 p14381A1259 (.Q(n_35), 
	.E(n_25), 
	.D(n_14), 
	.C(serial_data_sbuf_i[3]), 
	.B(SPCASCAN_N6), 
	.A(n_13));
   AO221X0 p14381A1260 (.Q(n_34), 
	.E(n_24), 
	.D(n_14), 
	.C(serial_data_sbuf_i[4]), 
	.B(\data_to_transmit[5] ), 
	.A(n_13));
   AO221X0 p14381A1261 (.Q(n_33), 
	.E(n_22), 
	.D(n_14), 
	.C(serial_data_sbuf_i[5]), 
	.B(\data_to_transmit[6] ), 
	.A(n_13));
   AO221X0 p14381A1262 (.Q(n_32), 
	.E(n_21), 
	.D(n_14), 
	.C(serial_data_sbuf_i[6]), 
	.B(\data_to_transmit[7] ), 
	.A(n_13));
   AO221X0 p14381A1263 (.Q(n_31), 
	.E(n_20), 
	.D(n_14), 
	.C(serial_data_sbuf_i[1]), 
	.B(\data_to_transmit[2] ), 
	.A(n_13));
   AO221X0 p14426A (.Q(n_30), 
	.E(n_18), 
	.D(\data_to_transmit[9] ), 
	.C(n_15), 
	.B(\data_to_transmit[8] ), 
	.A(n_13));
   AO221X0 p14358A (.Q(n_29), 
	.E(n_26), 
	.D(n_16), 
	.C(serial_data_sbuf_i[3]), 
	.B(SPCASCAN_N6), 
	.A(n_15));
   AO22X0 p14698A (.Q(n_28), 
	.D(serial_scon3_tb8_i), 
	.C(n_14), 
	.B(n_13), 
	.A(n_6));
   OR5X0 p31403A (.Q(n_27), 
	.E(\data_to_transmit[9] ), 
	.D(\data_to_transmit[3] ), 
	.C(\data_to_transmit[1] ), 
	.B(\data_to_transmit[2] ), 
	.A(n_17));
   AO22X0 p13942A (.Q(n_26), 
	.D(serial_data_sbuf_i[2]), 
	.C(n_14), 
	.B(n_13), 
	.A(\data_to_transmit[3] ));
   AO22X0 p13970A (.Q(n_25), 
	.D(serial_data_sbuf_i[4]), 
	.C(n_16), 
	.B(n_15), 
	.A(\data_to_transmit[5] ));
   AO22X0 p13970A1264 (.Q(n_24), 
	.D(serial_data_sbuf_i[5]), 
	.C(n_16), 
	.B(n_15), 
	.A(\data_to_transmit[6] ));
   AO22X0 p13970A1265 (.Q(n_23), 
	.D(serial_data_sbuf_i[1]), 
	.C(n_16), 
	.B(n_15), 
	.A(\data_to_transmit[2] ));
   AO22X0 p13970A1266 (.Q(n_22), 
	.D(serial_data_sbuf_i[6]), 
	.C(n_16), 
	.B(n_15), 
	.A(\data_to_transmit[7] ));
   AO22X0 p13970A1267 (.Q(n_21), 
	.D(serial_data_sbuf_i[7]), 
	.C(n_16), 
	.B(n_15), 
	.A(\data_to_transmit[8] ));
   AO22X0 p13970A1268 (.Q(n_20), 
	.D(serial_data_sbuf_i[2]), 
	.C(n_16), 
	.B(n_15), 
	.A(\data_to_transmit[3] ));
   OR2X0 p15241A (.Q(n_19), 
	.B(serial_start_shifter_reg_i), 
	.A(n_10));
   AO21X0 p14208A (.Q(n_18), 
	.C(n_16), 
	.B(serial_data_sbuf_i[7]), 
	.A(n_8));
   OR5X0 p30924A (.Q(n_17), 
	.E(\data_to_transmit[5] ), 
	.D(SPCASCAN_N6), 
	.C(\data_to_transmit[6] ), 
	.B(\data_to_transmit[7] ), 
	.A(\data_to_transmit[8] ));
   NO2I1X0 p13833A (.Q(n_16), 
	.B(serial_scon7_sm0_i), 
	.AN(n_8));
   NO2I1X0 p13835A (.Q(n_15), 
	.B(n_5), 
	.AN(serial_shift_i));
   AND2X0 p13838A (.Q(n_14), 
	.B(serial_scon7_sm0_i), 
	.A(n_8));
   NO2X0 p13800A (.Q(n_13), 
	.B(serial_shift_i), 
	.A(n_5));
   NA3I1X0 p15388A (.Q(n_12), 
	.C(serial_data_sbuf_i[0]), 
	.B(serial_start_shifter_reg_i), 
	.AN(serial_scon7_sm0_i));
   ON21X0 p21831A (.Q(n_11), 
	.C(serial_reset_i_b), 
	.B(serial_shift_i), 
	.A(\data_to_transmit[0] ));
   MU2IX0 p32986A (.S(serial_shift_i), 
	.Q(n_10), 
	.IN1(\data_to_transmit[1] ), 
	.IN0(\data_to_transmit[0] ));
   NO2X0 p32250A (.Q(n_9), 
	.B(serial_data_tx_o), 
	.A(SPCASCAN_N7));
   AND2X0 p13698A (.Q(n_8), 
	.B(serial_reset_i_b), 
	.A(serial_start_shifter_reg_i));
   NA2X0 p21362A (.Q(n_7), 
	.B(serial_reset_i_b), 
	.A(\data_to_transmit[0] ));
   OR2X0 p32921A (.Q(n_6), 
	.B(serial_stop_bit_gen_i), 
	.A(\data_to_transmit[9] ));
   NA2I1X0 p13518A (.Q(n_5), 
	.B(serial_reset_i_b), 
	.AN(serial_start_shifter_reg_i));
   SDFRQX0 serial_end_bit_o_reg (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_3_), 
	.Q(serial_end_bit_o), 
	.D(n_4), 
	.C(top_clock_i__L2_N9));
   NO3X0 p15612A (.Q(n_4), 
	.C(n_49), 
	.B(n_2), 
	.A(n_3));
   OR5X0 p32724A (.Q(n_3), 
	.E(\data_to_transmit[2] ), 
	.D(\data_to_transmit[6] ), 
	.C(\data_to_transmit[3] ), 
	.B(\data_to_transmit[9] ), 
	.A(n_1));
   MU2IX0 p15683A (.S(serial_scon7_sm0_i), 
	.Q(n_2), 
	.IN1(n_0), 
	.IN0(\data_to_transmit[1] ));
   OR4X0 p32557A (.Q(n_1), 
	.D(\data_to_transmit[5] ), 
	.C(\data_to_transmit[7] ), 
	.B(SPCASCAN_N6), 
	.A(\data_to_transmit[8] ));
   NO2I1X0 p32745A (.Q(n_0), 
	.B(\data_to_transmit[1] ), 
	.AN(\data_to_transmit[0] ));
   INX0 Fp22715A (.Q(n_49), 
	.A(serial_reset_i_b));
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
	DFT_sdi_1, 
	DFT_sdo, 
	SPCASCAN_N3, 
	SPCASCAN_N4, 
	SPCASCAN_N5, 
	FE_PT1_top_p0_y_i_2_, 
	SPCASCAN_N6, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N9);
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
   input DFT_sdi_1;
   output DFT_sdo;
   input SPCASCAN_N3;
   input SPCASCAN_N4;
   output SPCASCAN_N5;
   input FE_PT1_top_p0_y_i_2_;
   output SPCASCAN_N6;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N9;

   // Internal wires
   wire SPCASCAN_N7;
   wire DO_IDLE;
   wire SHIFT;
   wire START_OUTPUT;
   wire START_SHIFTER_REG;
   wire STOP_BIT_GEN;
   wire n_24;

   serial_tx_control serial_tx_control (.serial_br_i(serial_br_i), 
	.serial_clock_i(serial_clock_i), 
	.serial_reset_i_b(serial_reset_i_b), 
	.serial_scon7_sm0_i(serial_scon7_sm0_i), 
	.serial_scon1_ti_i(serial_scon1_ti_i), 
	.serial_end_bit_i(DFT_sdo), 
	.serial_serial_tx_i(serial_serial_tx_i), 
	.serial_p3en_0_o(serial_p3en_0_o), 
	.serial_p3en_1_o(serial_p3en_1_o), 
	.serial_data_en_o(serial_data_en_o), 
	.serial_send_o(serial_send_o), 
	.serial_scon1_ti_o(serial_scon1_ti_o), 
	.serial_shift_o(SHIFT), 
	.serial_stop_bit_gen_o(STOP_BIT_GEN), 
	.serial_start_shifter_reg_o(START_SHIFTER_REG), 
	.serial_start_idle_o(DO_IDLE), 
	.DFT_sdi(DFT_sdi), 
	.DFT_sen(DFT_sen), 
	.DFT_sdi_1(DO_IDLE), 
	.DFT_sdo(n_24), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.SPCASCAN_N4(SPCASCAN_N4), 
	.SPCASCAN_N5(SPCASCAN_N5), 
	.FE_PT1_top_p0_y_i_2_(FE_PT1_top_p0_y_i_2_), 
	.DATA_TX_INTERNAL(serial_data_tx_o), 
	.SPCASCAN_N7(SPCASCAN_N7), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   serial_tx_output_shifter_reg serial_tx_output_shifter_reg (.serial_clock_i(top_clock_i__L2_N10), 
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
	.serial_start_idle_i(DO_IDLE), 
	.serial_data_tx_o(serial_data_tx_o), 
	.serial_end_bit_o(DFT_sdo), 
	.DFT_sdi(DFT_sdo), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N6(SPCASCAN_N6), 
	.START_SHIFTER_REG(START_SHIFTER_REG), 
	.SPCASCAN_N7(SPCASCAN_N7), 
	.FE_PT1_top_p0_y_i_3_(DFT_sdi_1), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   MU2X0 p13301A (.S(serial_scon7_sm0_i), 
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
	SPCASCAN_N2, 
	FE_PT1_top_p2_a_o_2_, 
	SPCASCAN_N6, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N9);
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
   output SPCASCAN_N2;
   input FE_PT1_top_p2_a_o_2_;
   output SPCASCAN_N6;
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N9;

   // Internal wires
   wire SPCASCAN_N5;
   wire SPCASCAN_N4;
   wire SPCASCAN_N3;
   wire DATA_EN_INTERNAL;
   wire DATA_TX_INTERNAL;
   wire RECEIVE_INTERNAL;
   wire UNCONNECTED41;
   wire UNCONNECTED42;
   wire UNCONNECTED43;
   wire UNCONNECTED44;
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
	.serial_data_tx_internal_i(DATA_TX_INTERNAL), 
	.serial_scon7_sm0_internal_i(serial_scon7_sm0_i), 
	.serial_p3en_0_internal_i(1'b0), 
	.serial_p3en_1_internal_i(1'b0), 
	.serial_receive_internal_i(RECEIVE_INTERNAL), 
	.serial_send_internal_i(DFT_sdo_2), 
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
	.serial_p3en_0_o(UNCONNECTED41), 
	.serial_p3en_1_o(UNCONNECTED42), 
	.serial_p3_0_o(serial_p3_0_o), 
	.serial_p3_1_o(serial_p3_1_o), 
	.serial_scon0_ri_o(UNCONNECTED43), 
	.serial_scon1_ti_o(UNCONNECTED44), 
	.serial_scon2_rb8_o(UNCONNECTED45), 
	.serial_data_sbuf_o({ UNCONNECTED46,
		UNCONNECTED47,
		UNCONNECTED48,
		UNCONNECTED49,
		UNCONNECTED50,
		UNCONNECTED51,
		UNCONNECTED52,
		UNCONNECTED53 }), 
	.serial_load_sbuf_o(UNCONNECTED54));
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
	.SPCASCAN_N2(SPCASCAN_N2), 
	.p3en_1_temp2(p3en_1_temp2), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.FE_PT1_top_p2_a_o_2_(FE_PT1_top_p2_a_o_2_), 
	.SPCASCAN_N4(SPCASCAN_N4), 
	.SPCASCAN_N5(SPCASCAN_N5), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
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
	.serial_send_o(DFT_sdo_2), 
	.serial_data_en_o(DATA_EN_INTERNAL), 
	.serial_data_tx_o(DATA_TX_INTERNAL), 
	.DFT_sdi(serial_scon2_rb8_o), 
	.DFT_sen(DFT_sen), 
	.DFT_sdi_1(DFT_sdi_3), 
	.DFT_sdo(DFT_sdo_4), 
	.SPCASCAN_N3(SPCASCAN_N3), 
	.SPCASCAN_N4(SPCASCAN_N4), 
	.SPCASCAN_N5(SPCASCAN_N5), 
	.FE_PT1_top_p0_y_i_2_(DFT_sdi_1), 
	.SPCASCAN_N6(SPCASCAN_N6), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   OR2X0 p22226A (.Q(serial_p3en_0_o), 
	.B(p3en_0_temp2), 
	.A(p3en_0_temp1));
   OR2X0 p22226A10 (.Q(serial_p3en_1_o), 
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

   EN2X0 p11282A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_53));
   ON21X0 p11670A (.Q(Z[22]), 
	.C(n_53), 
	.B(n_2), 
	.A(n_51));
   NA2X0 p11294A (.Q(n_53), 
	.B(n_2), 
	.A(n_51));
   AO21X0 p11507A (.Q(Z[21]), 
	.C(n_51), 
	.B(A[21]), 
	.A(n_49));
   NO2X0 p10987A (.Q(n_51), 
	.B(A[21]), 
	.A(n_49));
   ON21X0 p12005A (.Q(Z[20]), 
	.C(n_49), 
	.B(n_10), 
	.A(n_47));
   NA2X0 p10926A (.Q(n_49), 
	.B(n_10), 
	.A(n_47));
   AO21X0 p11838A (.Q(Z[19]), 
	.C(n_47), 
	.B(A[19]), 
	.A(n_45));
   NO2X0 p10615A (.Q(n_47), 
	.B(A[19]), 
	.A(n_45));
   ON21X0 p12336A (.Q(Z[18]), 
	.C(n_45), 
	.B(n_5), 
	.A(n_43));
   NA2X0 p10554A (.Q(n_45), 
	.B(n_5), 
	.A(n_43));
   AO21X0 p12157A (.Q(Z[17]), 
	.C(n_43), 
	.B(A[17]), 
	.A(n_41));
   NO2X0 p10232A (.Q(n_43), 
	.B(A[17]), 
	.A(n_41));
   ON21X0 p12656A (.Q(Z[16]), 
	.C(n_41), 
	.B(n_7), 
	.A(n_39));
   NA2X0 p10171A (.Q(n_41), 
	.B(n_7), 
	.A(n_39));
   AO21X0 p12492A (.Q(Z[15]), 
	.C(n_39), 
	.B(A[15]), 
	.A(n_37));
   NO2X0 p9864A (.Q(n_39), 
	.B(A[15]), 
	.A(n_37));
   ON21X0 p12991A (.Q(Z[14]), 
	.C(n_37), 
	.B(n_0), 
	.A(n_35));
   NA2X0 p9803A (.Q(n_37), 
	.B(n_0), 
	.A(n_35));
   AO21X0 p12827A (.Q(Z[13]), 
	.C(n_35), 
	.B(A[13]), 
	.A(n_33));
   NO2X0 p9495A (.Q(n_35), 
	.B(A[13]), 
	.A(n_33));
   ON21X0 p13326A (.Q(Z[12]), 
	.C(n_33), 
	.B(n_3), 
	.A(n_31));
   NA2X0 p9434A (.Q(n_33), 
	.B(n_3), 
	.A(n_31));
   AO21X0 p13131A (.Q(Z[11]), 
	.C(n_31), 
	.B(A[11]), 
	.A(n_29));
   NO2X0 p9096A (.Q(n_31), 
	.B(A[11]), 
	.A(n_29));
   ON21X0 p13630A (.Q(Z[10]), 
	.C(n_29), 
	.B(n_4), 
	.A(n_27));
   NA2X0 p9036A (.Q(n_29), 
	.B(n_4), 
	.A(n_27));
   AO21X0 p13460A (.Q(Z[9]), 
	.C(n_27), 
	.B(A[9]), 
	.A(n_25));
   NO2X0 p8728A (.Q(n_27), 
	.B(A[9]), 
	.A(n_25));
   ON21X0 p13921A (.Q(Z[8]), 
	.C(n_25), 
	.B(n_6), 
	.A(n_23));
   NA2X0 p8668A (.Q(n_25), 
	.B(n_6), 
	.A(n_23));
   AO21X0 p13725A (.Q(Z[7]), 
	.C(n_23), 
	.B(A[7]), 
	.A(n_21));
   NO2X0 p8372A (.Q(n_23), 
	.B(A[7]), 
	.A(n_21));
   ON21X0 p14216A (.Q(Z[6]), 
	.C(n_21), 
	.B(n_8), 
	.A(n_19));
   NA2X0 p8312A (.Q(n_21), 
	.B(n_8), 
	.A(n_19));
   AO21X0 p14018A (.Q(Z[5]), 
	.C(n_19), 
	.B(A[5]), 
	.A(n_17));
   NO2X0 p7960A (.Q(n_19), 
	.B(A[5]), 
	.A(n_17));
   ON21X0 p14493A (.Q(Z[4]), 
	.C(n_17), 
	.B(n_1), 
	.A(n_15));
   NA2X0 p7896A (.Q(n_17), 
	.B(n_1), 
	.A(n_15));
   AO21X0 p14513A (.Q(Z[3]), 
	.C(n_15), 
	.B(A[3]), 
	.A(n_13));
   NO2X0 p7567A (.Q(n_15), 
	.B(A[3]), 
	.A(n_13));
   ON21X0 p14978A (.Q(Z[2]), 
	.C(n_13), 
	.B(n_9), 
	.A(n_11));
   NA2X0 p7503A (.Q(n_13), 
	.B(n_9), 
	.A(n_11));
   AO21X0 p14905A (.Q(Z[1]), 
	.C(n_11), 
	.B(A[0]), 
	.A(A[1]));
   NO2X0 p7236A (.Q(n_11), 
	.B(A[0]), 
	.A(A[1]));
   INX0 Fp13991A (.Q(n_10), 
	.A(A[20]));
   INX0 Fp7715A (.Q(n_9), 
	.A(A[2]));
   INX0 Fp9123A (.Q(n_8), 
	.A(A[6]));
   INX0 Fp12634A (.Q(n_7), 
	.A(A[16]));
   INX0 Fp9826A (.Q(n_6), 
	.A(A[8]));
   INX0 Fp13337A (.Q(n_5), 
	.A(A[18]));
   INX0 Fp10529A (.Q(n_4), 
	.A(A[10]));
   INX0 Fp11232A (.Q(n_3), 
	.A(A[12]));
   INX0 Fp14505A (.Q(n_2), 
	.A(A[22]));
   INX0 Fp8420A (.Q(n_1), 
	.A(A[4]));
   INX0 Fp11935A (.Q(n_0), 
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

   EN2X0 p11674A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p11850A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p11434A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p12009A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p11127A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p12185A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p10835A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p12344A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p10527A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p12520A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p10235A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p12679A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p9928A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p12855A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p9636A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p13012A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p9326A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p13190A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p9037A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p13344A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p8724A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p13525A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p8437A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p13674A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p8091A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p13860A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p7838A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p14002A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p7406A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p14195A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p7155A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p14313A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p6708A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p14528A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p6469A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p14599A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p6042A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p14822A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p5787A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p14440A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p5372A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p14681A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p5127A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p14610A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p4934A (.Q(n_0), 
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
	DFT_sdi_1, 
	SPCASCAN_N6, 
	FE_PT1_top_p0_y_i_4_);
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
   input DFT_sdi_1;
   input SPCASCAN_N6;
   input FE_PT1_top_p0_y_i_4_;

   // Internal wires
   wire UNCONNECTED55;
   wire UNCONNECTED56;
   wire UNCONNECTED57;
   wire UNCONNECTED58;
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
	.Z({ UNCONNECTED55,
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
		UNCONNECTED56 }));
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
	.Z({ UNCONNECTED57,
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
		UNCONNECTED58 }));
   SDFRQX0 \timers_sfr_th0_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(timers_sfr_th0_o[0]), 
	.D(n_49), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[0]), 
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
	.SD(timers_sfr_th0_o[1]), 
	.Q(timers_sfr_th0_o[4]), 
	.D(n_45), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[2]), 
	.Q(timers_sfr_th0_o[5]), 
	.D(n_44), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[5]), 
	.Q(timers_sfr_th0_o[6]), 
	.D(n_43), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th0_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[6]), 
	.Q(timers_sfr_th0_o[7]), 
	.D(n_42), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_th0_o[7]), 
	.Q(timers_sfr_tl0_o[0]), 
	.D(n_41), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[0]), 
	.Q(timers_sfr_tl0_o[1]), 
	.D(n_40), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[1]), 
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
	.SD(SPCASCAN_N6), 
	.Q(timers_sfr_tl0_o[5]), 
	.D(n_36), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[2]), 
	.Q(timers_sfr_tl0_o[6]), 
	.D(n_35), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl0_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[6]), 
	.Q(timers_sfr_tl0_o[7]), 
	.D(n_34), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl0_o[7]), 
	.Q(timers_sfr_tm0_o[0]), 
	.D(n_33), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[0]), 
	.Q(timers_sfr_tm0_o[1]), 
	.D(n_32), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[1]), 
	.Q(timers_sfr_tm0_o[2]), 
	.D(n_31), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[2]), 
	.Q(timers_sfr_tm0_o[3]), 
	.D(n_30), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[4]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(timers_sfr_tm0_o[4]), 
	.D(n_29), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[5]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_4_), 
	.Q(timers_sfr_tm0_o[5]), 
	.D(n_28), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[4]), 
	.Q(timers_sfr_tm0_o[6]), 
	.D(n_27), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm0_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm0_o[6]), 
	.Q(timers_sfr_tm0_o[7]), 
	.D(n_26), 
	.C(timers_clock_i));
   AO222X0 p12620A (.Q(n_49), 
	.F(n_88), 
	.E(n_23), 
	.D(n_63), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[0]));
   AO222X0 p12444A (.Q(n_48), 
	.F(n_87), 
	.E(n_23), 
	.D(n_62), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[1]));
   AO222X0 p12285A (.Q(n_47), 
	.F(n_86), 
	.E(n_23), 
	.D(n_61), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[2]));
   AO222X0 p12109A (.Q(n_46), 
	.F(n_85), 
	.E(n_23), 
	.D(n_60), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[3]));
   AO222X0 p11950A (.Q(n_45), 
	.F(n_84), 
	.E(n_23), 
	.D(n_59), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[4]));
   AO222X0 p11774A (.Q(n_44), 
	.F(n_83), 
	.E(n_23), 
	.D(n_58), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[5]));
   AO222X0 p11614A (.Q(n_43), 
	.F(n_82), 
	.E(n_23), 
	.D(n_57), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[6]));
   AO222X0 p11398A (.Q(n_42), 
	.F(n_81), 
	.E(n_23), 
	.D(n_56), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th0_i[7]));
   AO32X0 p15047A (.Q(n_41), 
	.E(n_25), 
	.D(timers_sfr_tl0_i[0]), 
	.C(n_21), 
	.B(timers_reset_i_b), 
	.A(n_22));
   AO222X0 p14654A (.Q(n_40), 
	.F(n_24), 
	.E(n_80), 
	.D(n_25), 
	.C(timers_sfr_tl0_i[1]), 
	.B(n_23), 
	.A(n_103));
   AO222X0 p14654A1858 (.Q(n_39), 
	.F(n_24), 
	.E(n_78), 
	.D(n_25), 
	.C(timers_sfr_tl0_i[2]), 
	.B(n_23), 
	.A(n_102));
   AO222X0 p14572A (.Q(n_38), 
	.F(n_77), 
	.E(n_24), 
	.D(n_25), 
	.C(timers_sfr_tl0_i[3]), 
	.B(n_23), 
	.A(n_101));
   AO222X0 p14534A (.Q(n_37), 
	.F(n_100), 
	.E(n_23), 
	.D(n_76), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[4]));
   AO222X0 p14447A (.Q(n_36), 
	.F(n_99), 
	.E(n_23), 
	.D(n_75), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[5]));
   AO222X0 p14295A (.Q(n_35), 
	.F(n_98), 
	.E(n_23), 
	.D(n_74), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[6]));
   AO222X0 p14119A (.Q(n_34), 
	.F(n_97), 
	.E(n_23), 
	.D(n_73), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl0_i[7]));
   AO222X0 p13960A (.Q(n_33), 
	.F(n_96), 
	.E(n_23), 
	.D(n_72), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[0]));
   AO222X0 p13784A (.Q(n_32), 
	.F(n_95), 
	.E(n_23), 
	.D(n_71), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[1]));
   AO222X0 p13625A (.Q(n_31), 
	.F(n_94), 
	.E(n_23), 
	.D(n_70), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[2]));
   AO222X0 p13449A (.Q(n_30), 
	.F(n_93), 
	.E(n_23), 
	.D(n_69), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[3]));
   AO222X0 p13290A (.Q(n_29), 
	.F(n_92), 
	.E(n_23), 
	.D(n_67), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[4]));
   AO222X0 p13114A (.Q(n_28), 
	.F(n_91), 
	.E(n_23), 
	.D(n_66), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[5]));
   AO222X0 p12955A (.Q(n_27), 
	.F(n_90), 
	.E(n_23), 
	.D(n_65), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[6]));
   AO222X0 p12779A (.Q(n_26), 
	.F(n_89), 
	.E(n_23), 
	.D(n_64), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm0_i[7]));
   NO2I1X1 p14345A (.Q(n_25), 
	.B(n_21), 
	.AN(timers_reset_i_b));
   NO3I1X1 p14337A (.Q(n_24), 
	.C(n_50), 
	.B(n_52), 
	.AN(timers_reset_i_b));
   AND3X1 p14325A (.Q(n_23), 
	.C(n_20), 
	.B(n_51), 
	.A(timers_reset_i_b));
   INX0 Fp13825A (.Q(n_22), 
	.A(timers_sfr_tl0_i[0]));
   NO2X0 p14326A (.Q(n_21), 
	.B(n_52), 
	.A(n_19));
   INX0 Fp13620A1859 (.Q(n_20), 
	.A(n_52));
   EO2X0 p14037A (.Q(n_19), 
	.B(timers_sfr_tmod_m0t0_i), 
	.A(timers_sfr_tmod_m1t0_i));
   AO321X0 p14048A (.Q(timers_sfr_tcon_tf0_o), 
	.F(timers_sfr_tcon_tf0_i), 
	.E(n_13), 
	.D(n_14), 
	.C(n_15), 
	.B(n_16), 
	.A(n_17));
   AND6X0 p13926A (.Q(n_15), 
	.F(timers_sfr_tm0_i[2]), 
	.E(timers_sfr_tl0_i[7]), 
	.D(n_11), 
	.C(timers_sfr_tm0_i[1]), 
	.B(timers_sfr_tm0_i[0]), 
	.A(n_12));
   NO6X0 p13750A (.Q(n_14), 
	.F(timers_sfr_tm0_i[2]), 
	.E(timers_sfr_tm0_i[0]), 
	.D(n_9), 
	.C(timers_sfr_tl0_i[7]), 
	.B(timers_sfr_tm0_i[1]), 
	.A(n_10));
   NA3X0 p13748A (.Q(n_10), 
	.C(n_7), 
	.B(n_8), 
	.A(n_51));
   NO3X0 p14042A (.Q(n_12), 
	.C(n_5), 
	.B(n_6), 
	.A(n_50));
   NO6X0 p13830A (.Q(n_13), 
	.F(timers_sfr_th0_i[4]), 
	.E(timers_sfr_th0_i[2]), 
	.D(n_3), 
	.C(timers_sfr_th0_i[1]), 
	.B(timers_sfr_th0_i[3]), 
	.A(n_4));
   OR5X0 p13665A (.Q(n_4), 
	.E(timers_sfr_tl0_i[2]), 
	.D(timers_sfr_th0_i[0]), 
	.C(timers_sfr_tl0_i[1]), 
	.B(timers_sfr_tm0_i[7]), 
	.A(n_52));
   AND5X0 p13999A (.Q(n_17), 
	.E(timers_sfr_tl0_i[1]), 
	.D(timers_sfr_tl0_i[2]), 
	.C(timers_sfr_th0_i[0]), 
	.B(timers_sfr_tm0_i[7]), 
	.A(n_20));
   AND5X0 p14105A (.Q(n_16), 
	.E(timers_sfr_th0_i[1]), 
	.D(timers_sfr_th0_i[2]), 
	.C(timers_sfr_th0_i[4]), 
	.B(timers_sfr_th0_i[3]), 
	.A(n_1));
   ON21X0 p13461A (.Q(n_52), 
	.C(timers_sfr_tcon_tr0_i), 
	.B(timers_int0_i), 
	.A(n_0));
   AND4X0 p14045A (.Q(n_11), 
	.D(timers_sfr_tm0_i[4]), 
	.C(timers_sfr_tm0_i[5]), 
	.B(timers_sfr_tm0_i[6]), 
	.A(timers_sfr_tm0_i[3]));
   OR4X0 p13765A (.Q(n_9), 
	.D(timers_sfr_tm0_i[5]), 
	.C(timers_sfr_tm0_i[6]), 
	.B(timers_sfr_tm0_i[3]), 
	.A(timers_sfr_tm0_i[4]));
   OR4X0 p13832A (.Q(n_3), 
	.D(timers_sfr_th0_i[6]), 
	.C(timers_sfr_tl0_i[0]), 
	.B(timers_sfr_th0_i[5]), 
	.A(timers_sfr_th0_i[7]));
   AND4X0 p14018A (.Q(n_1), 
	.D(timers_sfr_tl0_i[0]), 
	.C(timers_sfr_th0_i[6]), 
	.B(timers_sfr_th0_i[5]), 
	.A(timers_sfr_th0_i[7]));
   NO2X0 p13790A (.Q(n_8), 
	.B(timers_sfr_tl0_i[6]), 
	.A(timers_sfr_tl0_i[5]));
   NA2X0 p14000A (.Q(n_5), 
	.B(timers_sfr_tl0_i[5]), 
	.A(timers_sfr_tl0_i[6]));
   NO2X0 p13713A (.Q(n_51), 
	.B(timers_sfr_tmod_m0t0_i), 
	.A(timers_sfr_tmod_m1t0_i));
   NA2X0 p13804A (.Q(n_50), 
	.B(timers_sfr_tmod_m0t0_i), 
	.A(timers_sfr_tmod_m1t0_i));
   NA2X0 p14007A (.Q(n_6), 
	.B(timers_sfr_tl0_i[3]), 
	.A(timers_sfr_tl0_i[4]));
   NO2X0 p13765A1860 (.Q(n_7), 
	.B(timers_sfr_tl0_i[4]), 
	.A(timers_sfr_tl0_i[3]));
   INX0 Fp13442A (.Q(n_0), 
	.A(timers_sfr_tmod_gate_t0_i));
endmodule

module decrement_unsigned_166_167_4571 (
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

   EN2X0 p11282A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_53));
   ON21X0 p11670A (.Q(Z[22]), 
	.C(n_53), 
	.B(n_2), 
	.A(n_51));
   NA2X0 p11294A (.Q(n_53), 
	.B(n_2), 
	.A(n_51));
   AO21X0 p11507A (.Q(Z[21]), 
	.C(n_51), 
	.B(A[21]), 
	.A(n_49));
   NO2X0 p10987A (.Q(n_51), 
	.B(A[21]), 
	.A(n_49));
   ON21X0 p12005A (.Q(Z[20]), 
	.C(n_49), 
	.B(n_10), 
	.A(n_47));
   NA2X0 p10926A (.Q(n_49), 
	.B(n_10), 
	.A(n_47));
   AO21X0 p11838A (.Q(Z[19]), 
	.C(n_47), 
	.B(A[19]), 
	.A(n_45));
   NO2X0 p10615A (.Q(n_47), 
	.B(A[19]), 
	.A(n_45));
   ON21X0 p12336A (.Q(Z[18]), 
	.C(n_45), 
	.B(n_5), 
	.A(n_43));
   NA2X0 p10554A (.Q(n_45), 
	.B(n_5), 
	.A(n_43));
   AO21X0 p12157A (.Q(Z[17]), 
	.C(n_43), 
	.B(A[17]), 
	.A(n_41));
   NO2X0 p10232A (.Q(n_43), 
	.B(A[17]), 
	.A(n_41));
   ON21X0 p12656A (.Q(Z[16]), 
	.C(n_41), 
	.B(n_7), 
	.A(n_39));
   NA2X0 p10171A (.Q(n_41), 
	.B(n_7), 
	.A(n_39));
   AO21X0 p12492A (.Q(Z[15]), 
	.C(n_39), 
	.B(A[15]), 
	.A(n_37));
   NO2X0 p9864A (.Q(n_39), 
	.B(A[15]), 
	.A(n_37));
   ON21X0 p12991A (.Q(Z[14]), 
	.C(n_37), 
	.B(n_0), 
	.A(n_35));
   NA2X0 p9803A (.Q(n_37), 
	.B(n_0), 
	.A(n_35));
   AO21X0 p12827A (.Q(Z[13]), 
	.C(n_35), 
	.B(A[13]), 
	.A(n_33));
   NO2X0 p9495A (.Q(n_35), 
	.B(A[13]), 
	.A(n_33));
   ON21X0 p13326A (.Q(Z[12]), 
	.C(n_33), 
	.B(n_3), 
	.A(n_31));
   NA2X0 p9434A (.Q(n_33), 
	.B(n_3), 
	.A(n_31));
   AO21X0 p13131A (.Q(Z[11]), 
	.C(n_31), 
	.B(A[11]), 
	.A(n_29));
   NO2X0 p9096A (.Q(n_31), 
	.B(A[11]), 
	.A(n_29));
   ON21X0 p13630A (.Q(Z[10]), 
	.C(n_29), 
	.B(n_4), 
	.A(n_27));
   NA2X0 p9036A (.Q(n_29), 
	.B(n_4), 
	.A(n_27));
   AO21X0 p13460A (.Q(Z[9]), 
	.C(n_27), 
	.B(A[9]), 
	.A(n_25));
   NO2X0 p8728A (.Q(n_27), 
	.B(A[9]), 
	.A(n_25));
   ON21X0 p13921A (.Q(Z[8]), 
	.C(n_25), 
	.B(n_6), 
	.A(n_23));
   NA2X0 p8668A (.Q(n_25), 
	.B(n_6), 
	.A(n_23));
   AO21X0 p13725A (.Q(Z[7]), 
	.C(n_23), 
	.B(A[7]), 
	.A(n_21));
   NO2X0 p8372A (.Q(n_23), 
	.B(A[7]), 
	.A(n_21));
   ON21X0 p14216A (.Q(Z[6]), 
	.C(n_21), 
	.B(n_8), 
	.A(n_19));
   NA2X0 p8312A (.Q(n_21), 
	.B(n_8), 
	.A(n_19));
   AO21X0 p14018A (.Q(Z[5]), 
	.C(n_19), 
	.B(A[5]), 
	.A(n_17));
   NO2X0 p7960A (.Q(n_19), 
	.B(A[5]), 
	.A(n_17));
   ON21X0 p14493A (.Q(Z[4]), 
	.C(n_17), 
	.B(n_1), 
	.A(n_15));
   NA2X0 p7896A (.Q(n_17), 
	.B(n_1), 
	.A(n_15));
   AO21X0 p14513A (.Q(Z[3]), 
	.C(n_15), 
	.B(A[3]), 
	.A(n_13));
   NO2X0 p7567A (.Q(n_15), 
	.B(A[3]), 
	.A(n_13));
   ON21X0 p14978A (.Q(Z[2]), 
	.C(n_13), 
	.B(n_9), 
	.A(n_11));
   NA2X0 p7503A (.Q(n_13), 
	.B(n_9), 
	.A(n_11));
   AO21X0 p14905A (.Q(Z[1]), 
	.C(n_11), 
	.B(A[0]), 
	.A(A[1]));
   NO2X0 p7236A (.Q(n_11), 
	.B(A[0]), 
	.A(A[1]));
   INX0 Fp13991A (.Q(n_10), 
	.A(A[20]));
   INX0 Fp7715A (.Q(n_9), 
	.A(A[2]));
   INX0 Fp9123A (.Q(n_8), 
	.A(A[6]));
   INX0 Fp12634A (.Q(n_7), 
	.A(A[16]));
   INX0 Fp9826A (.Q(n_6), 
	.A(A[8]));
   INX0 Fp13337A (.Q(n_5), 
	.A(A[18]));
   INX0 Fp10529A (.Q(n_4), 
	.A(A[10]));
   INX0 Fp11232A (.Q(n_3), 
	.A(A[12]));
   INX0 Fp14505A (.Q(n_2), 
	.A(A[22]));
   INX0 Fp8420A (.Q(n_1), 
	.A(A[4]));
   INX0 Fp11935A (.Q(n_0), 
	.A(A[14]));
endmodule

module increment_unsigned_164_165_4570 (
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

   EN2X0 p11674A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p11850A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p11434A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p12009A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p11127A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p12185A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p10835A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p12344A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p10527A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p12520A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p10235A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p12679A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p9928A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p12855A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p9636A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p13012A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p9326A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p13190A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p9037A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p13344A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p8724A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p13525A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p8437A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p13674A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p8091A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p13860A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p7838A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p14002A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p7406A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p14195A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p7155A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p14313A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p6708A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p14528A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p6469A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p14599A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p6042A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p14822A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p5787A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p14440A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p5372A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p14681A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p5127A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p14610A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p4934A (.Q(n_0), 
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
	FE_PT1__top_timers_sfr_tm0_o_7__);
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
   input FE_PT1__top_timers_sfr_tm0_o_7__;

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

   decrement_unsigned_166_167_4571 dec_sub_167_61 (.A({ timers_sfr_th1_i[7],
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
   increment_unsigned_164_165_4570 inc_add_140_57 (.A({ timers_sfr_th1_i[7],
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
   SDFRQX0 \timers_sfr_th1_o_reg[0]  (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(timers_sfr_th1_o[0]), 
	.D(n_49), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[0]), 
	.Q(timers_sfr_th1_o[1]), 
	.D(n_48), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[3]), 
	.Q(timers_sfr_th1_o[2]), 
	.D(n_47), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[1]), 
	.Q(timers_sfr_th1_o[3]), 
	.D(n_46), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[2]), 
	.Q(timers_sfr_th1_o[4]), 
	.D(n_45), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[4]), 
	.Q(timers_sfr_th1_o[5]), 
	.D(n_44), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[5]), 
	.Q(timers_sfr_th1_o[6]), 
	.D(n_43), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_th1_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[6]), 
	.Q(timers_sfr_th1_o[7]), 
	.D(n_42), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_th1_o[7]), 
	.Q(timers_sfr_tl1_o[0]), 
	.D(n_41), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[2]), 
	.Q(timers_sfr_tl1_o[1]), 
	.D(n_40), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tl1_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[3]), 
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
	.SD(timers_sfr_tm1_o[0]), 
	.Q(timers_sfr_tl1_o[7]), 
	.D(n_34), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[1]), 
	.Q(timers_sfr_tm1_o[0]), 
	.D(n_33), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[2]), 
	.Q(timers_sfr_tm1_o[1]), 
	.D(n_32), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[3]), 
	.Q(timers_sfr_tm1_o[2]), 
	.D(n_31), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[4]), 
	.Q(timers_sfr_tm1_o[3]), 
	.D(n_30), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[4]  (.SE(DFT_sen), 
	.SD(FE_PT1__top_timers_sfr_tm0_o_7__), 
	.Q(timers_sfr_tm1_o[4]), 
	.D(n_29), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[6]), 
	.Q(timers_sfr_tm1_o[5]), 
	.D(n_28), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_tm1_o[7]), 
	.Q(timers_sfr_tm1_o[6]), 
	.D(n_27), 
	.C(timers_clock_i));
   SDFRQX0 \timers_sfr_tm1_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_tl1_o[1]), 
	.Q(timers_sfr_tm1_o[7]), 
	.D(n_26), 
	.C(timers_clock_i));
   AO222X0 p12620A (.Q(n_49), 
	.F(n_88), 
	.E(n_23), 
	.D(n_63), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[0]));
   AO222X0 p12444A (.Q(n_48), 
	.F(n_87), 
	.E(n_23), 
	.D(n_62), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[1]));
   AO222X0 p12285A (.Q(n_47), 
	.F(n_86), 
	.E(n_23), 
	.D(n_61), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[2]));
   AO222X0 p12109A (.Q(n_46), 
	.F(n_85), 
	.E(n_23), 
	.D(n_60), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[3]));
   AO222X0 p11950A (.Q(n_45), 
	.F(n_84), 
	.E(n_23), 
	.D(n_59), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[4]));
   AO222X0 p11774A (.Q(n_44), 
	.F(n_83), 
	.E(n_23), 
	.D(n_58), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[5]));
   AO222X0 p11614A (.Q(n_43), 
	.F(n_82), 
	.E(n_23), 
	.D(n_57), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[6]));
   AO222X0 p11398A (.Q(n_42), 
	.F(n_81), 
	.E(n_23), 
	.D(n_56), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_th1_i[7]));
   AO32X0 p15047A (.Q(n_41), 
	.E(n_25), 
	.D(timers_sfr_tl1_i[0]), 
	.C(n_21), 
	.B(timers_reset_i_b), 
	.A(n_22));
   AO222X0 p14654A (.Q(n_40), 
	.F(n_24), 
	.E(n_80), 
	.D(n_25), 
	.C(timers_sfr_tl1_i[1]), 
	.B(n_23), 
	.A(n_103));
   AO222X0 p14654A1854 (.Q(n_39), 
	.F(n_24), 
	.E(n_78), 
	.D(n_25), 
	.C(timers_sfr_tl1_i[2]), 
	.B(n_23), 
	.A(n_102));
   AO222X0 p14572A (.Q(n_38), 
	.F(n_77), 
	.E(n_24), 
	.D(n_25), 
	.C(timers_sfr_tl1_i[3]), 
	.B(n_23), 
	.A(n_101));
   AO222X0 p14534A (.Q(n_37), 
	.F(n_100), 
	.E(n_23), 
	.D(n_76), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[4]));
   AO222X0 p14447A (.Q(n_36), 
	.F(n_99), 
	.E(n_23), 
	.D(n_75), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[5]));
   AO222X0 p14295A (.Q(n_35), 
	.F(n_98), 
	.E(n_23), 
	.D(n_74), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[6]));
   AO222X0 p14119A (.Q(n_34), 
	.F(n_97), 
	.E(n_23), 
	.D(n_73), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tl1_i[7]));
   AO222X0 p13960A (.Q(n_33), 
	.F(n_96), 
	.E(n_23), 
	.D(n_72), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[0]));
   AO222X0 p13784A (.Q(n_32), 
	.F(n_95), 
	.E(n_23), 
	.D(n_71), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[1]));
   AO222X0 p13625A (.Q(n_31), 
	.F(n_94), 
	.E(n_23), 
	.D(n_70), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[2]));
   AO222X0 p13449A (.Q(n_30), 
	.F(n_93), 
	.E(n_23), 
	.D(n_69), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[3]));
   AO222X0 p13290A (.Q(n_29), 
	.F(n_92), 
	.E(n_23), 
	.D(n_67), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[4]));
   AO222X0 p13114A (.Q(n_28), 
	.F(n_91), 
	.E(n_23), 
	.D(n_66), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[5]));
   AO222X0 p12955A (.Q(n_27), 
	.F(n_90), 
	.E(n_23), 
	.D(n_65), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[6]));
   AO222X0 p12779A (.Q(n_26), 
	.F(n_89), 
	.E(n_23), 
	.D(n_64), 
	.C(n_24), 
	.B(n_25), 
	.A(timers_sfr_tm1_i[7]));
   NO2I1X1 p14345A (.Q(n_25), 
	.B(n_21), 
	.AN(timers_reset_i_b));
   NO3I1X1 p14337A (.Q(n_24), 
	.C(n_50), 
	.B(n_52), 
	.AN(timers_reset_i_b));
   AND3X1 p14325A (.Q(n_23), 
	.C(n_20), 
	.B(n_51), 
	.A(timers_reset_i_b));
   INX0 Fp13825A (.Q(n_22), 
	.A(timers_sfr_tl1_i[0]));
   NO2X0 p14326A (.Q(n_21), 
	.B(n_52), 
	.A(n_19));
   INX0 Fp13620A1855 (.Q(n_20), 
	.A(n_52));
   EO2X0 p14037A (.Q(n_19), 
	.B(timers_sfr_tmod_m0t1_i), 
	.A(timers_sfr_tmod_m1t1_i));
   AO321X0 p14048A (.Q(timers_sfr_tcon_tf1_o), 
	.F(timers_sfr_tcon_tf1_i), 
	.E(n_13), 
	.D(n_14), 
	.C(n_15), 
	.B(n_16), 
	.A(n_17));
   AND6X0 p13926A (.Q(n_15), 
	.F(timers_sfr_tm1_i[2]), 
	.E(timers_sfr_tl1_i[7]), 
	.D(n_11), 
	.C(timers_sfr_tm1_i[1]), 
	.B(timers_sfr_tm1_i[0]), 
	.A(n_12));
   NO6X0 p13750A (.Q(n_14), 
	.F(timers_sfr_tm1_i[2]), 
	.E(timers_sfr_tm1_i[0]), 
	.D(n_9), 
	.C(timers_sfr_tl1_i[7]), 
	.B(timers_sfr_tm1_i[1]), 
	.A(n_10));
   NA3X0 p13748A (.Q(n_10), 
	.C(n_7), 
	.B(n_8), 
	.A(n_51));
   NO3X0 p14042A (.Q(n_12), 
	.C(n_5), 
	.B(n_6), 
	.A(n_50));
   NO6X0 p13830A (.Q(n_13), 
	.F(timers_sfr_th1_i[4]), 
	.E(timers_sfr_th1_i[2]), 
	.D(n_3), 
	.C(timers_sfr_th1_i[1]), 
	.B(timers_sfr_th1_i[3]), 
	.A(n_4));
   OR5X0 p13665A (.Q(n_4), 
	.E(timers_sfr_tl1_i[2]), 
	.D(timers_sfr_th1_i[0]), 
	.C(timers_sfr_tl1_i[1]), 
	.B(timers_sfr_tm1_i[7]), 
	.A(n_52));
   AND5X0 p13999A (.Q(n_17), 
	.E(timers_sfr_tl1_i[1]), 
	.D(timers_sfr_tl1_i[2]), 
	.C(timers_sfr_th1_i[0]), 
	.B(timers_sfr_tm1_i[7]), 
	.A(n_20));
   AND5X0 p14105A (.Q(n_16), 
	.E(timers_sfr_th1_i[1]), 
	.D(timers_sfr_th1_i[2]), 
	.C(timers_sfr_th1_i[4]), 
	.B(timers_sfr_th1_i[3]), 
	.A(n_1));
   ON21X0 p13461A (.Q(n_52), 
	.C(timers_sfr_tcon_tr1_i), 
	.B(timers_int1_i), 
	.A(n_0));
   AND4X0 p14045A (.Q(n_11), 
	.D(timers_sfr_tm1_i[4]), 
	.C(timers_sfr_tm1_i[5]), 
	.B(timers_sfr_tm1_i[6]), 
	.A(timers_sfr_tm1_i[3]));
   OR4X0 p13765A (.Q(n_9), 
	.D(timers_sfr_tm1_i[5]), 
	.C(timers_sfr_tm1_i[6]), 
	.B(timers_sfr_tm1_i[3]), 
	.A(timers_sfr_tm1_i[4]));
   OR4X0 p13832A (.Q(n_3), 
	.D(timers_sfr_th1_i[6]), 
	.C(timers_sfr_tl1_i[0]), 
	.B(timers_sfr_th1_i[5]), 
	.A(timers_sfr_th1_i[7]));
   AND4X0 p14018A (.Q(n_1), 
	.D(timers_sfr_tl1_i[0]), 
	.C(timers_sfr_th1_i[6]), 
	.B(timers_sfr_th1_i[5]), 
	.A(timers_sfr_th1_i[7]));
   NO2X0 p13790A (.Q(n_8), 
	.B(timers_sfr_tl1_i[6]), 
	.A(timers_sfr_tl1_i[5]));
   NA2X0 p14000A (.Q(n_5), 
	.B(timers_sfr_tl1_i[5]), 
	.A(timers_sfr_tl1_i[6]));
   NO2X0 p13713A (.Q(n_51), 
	.B(timers_sfr_tmod_m0t1_i), 
	.A(timers_sfr_tmod_m1t1_i));
   NA2X0 p13804A (.Q(n_50), 
	.B(timers_sfr_tmod_m0t1_i), 
	.A(timers_sfr_tmod_m1t1_i));
   NA2X0 p14007A (.Q(n_6), 
	.B(timers_sfr_tl1_i[3]), 
	.A(timers_sfr_tl1_i[4]));
   NO2X0 p13765A1856 (.Q(n_7), 
	.B(timers_sfr_tl1_i[4]), 
	.A(timers_sfr_tl1_i[3]));
   INX0 Fp13442A (.Q(n_0), 
	.A(timers_sfr_tmod_gate_t1_i));
endmodule

module decrement_unsigned_166_167_4595 (
	A, 
	CI, 
	Z, 
	n_48, 
	FE_PT1_n_27, 
	n_32, 
	FE_PT1_n_51, 
	n_60, 
	n_26, 
	n_55, 
	FE_PT1_n_53, 
	n_56, 
	FE_PT1_n_19, 
	n_30);
   input [23:0] A;
   input CI;
   output [24:0] Z;
   input n_48;
   input FE_PT1_n_27;
   input n_32;
   input FE_PT1_n_51;
   input n_60;
   input n_26;
   input n_55;
   input FE_PT1_n_53;
   input n_56;
   input FE_PT1_n_19;
   input n_30;

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

   EN2X0 p28696A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_53));
   ON21X0 p29061A (.Q(Z[22]), 
	.C(n_53), 
	.B(n_60), 
	.A(n_51));
   NA2X0 p28681A (.Q(n_53), 
	.B(n_60), 
	.A(n_51));
   AO21X0 p28890A (.Q(Z[21]), 
	.C(n_51), 
	.B(A[21]), 
	.A(n_49));
   NO2X0 p28378A (.Q(n_51), 
	.B(A[21]), 
	.A(n_49));
   ON21X0 p29388A (.Q(Z[20]), 
	.C(n_49), 
	.B(n_26), 
	.A(n_47));
   NA2X0 p28317A (.Q(n_49), 
	.B(n_26), 
	.A(n_47));
   AO21X0 p29204A (.Q(Z[19]), 
	.C(n_47), 
	.B(A[19]), 
	.A(n_45));
   NO2X0 p28010A (.Q(n_47), 
	.B(A[19]), 
	.A(n_45));
   ON21X0 p29724A (.Q(Z[18]), 
	.C(n_45), 
	.B(n_55), 
	.A(n_43));
   NA2X0 p27949A (.Q(n_45), 
	.B(n_55), 
	.A(n_43));
   AO21X0 p29559A (.Q(Z[17]), 
	.C(n_43), 
	.B(A[17]), 
	.A(n_41));
   NO2X0 p27638A (.Q(n_43), 
	.B(A[17]), 
	.A(n_41));
   ON21X0 p30045A (.Q(Z[16]), 
	.C(n_41), 
	.B(FE_PT1_n_53), 
	.A(n_39));
   NA2X0 p27577A (.Q(n_41), 
	.B(FE_PT1_n_53), 
	.A(n_39));
   AO21X0 p29849A (.Q(Z[15]), 
	.C(n_39), 
	.B(A[15]), 
	.A(n_37));
   NO2X0 p27269A (.Q(n_39), 
	.B(A[15]), 
	.A(n_37));
   ON21X0 p30312A (.Q(Z[14]), 
	.C(n_37), 
	.B(n_56), 
	.A(n_35));
   NA2X0 p27208A (.Q(n_37), 
	.B(n_56), 
	.A(n_35));
   AO21X0 p30116A (.Q(Z[13]), 
	.C(n_35), 
	.B(A[13]), 
	.A(n_33));
   NO2X0 p26888A (.Q(n_35), 
	.B(A[13]), 
	.A(n_33));
   ON21X0 p30579A (.Q(Z[12]), 
	.C(n_33), 
	.B(FE_PT1_n_19), 
	.A(n_31));
   NA2X0 p26827A (.Q(n_33), 
	.B(FE_PT1_n_19), 
	.A(n_31));
   AO21X0 p30383A (.Q(Z[11]), 
	.C(n_31), 
	.B(A[11]), 
	.A(n_29));
   NO2X0 p26458A (.Q(n_31), 
	.B(A[11]), 
	.A(n_29));
   ON21X0 p30864A (.Q(Z[10]), 
	.C(n_29), 
	.B(n_30), 
	.A(n_27));
   NA2X0 p26399A (.Q(n_29), 
	.B(n_30), 
	.A(n_27));
   AO21X0 p30662A (.Q(Z[9]), 
	.C(n_27), 
	.B(A[9]), 
	.A(n_25));
   NO2X0 p26104A (.Q(n_27), 
	.B(A[9]), 
	.A(n_25));
   ON21X0 p31116A (.Q(Z[8]), 
	.C(n_25), 
	.B(n_48), 
	.A(n_23));
   NA2X0 p26050A (.Q(n_25), 
	.B(n_48), 
	.A(n_23));
   AO21X0 p30918A (.Q(Z[7]), 
	.C(n_23), 
	.B(A[7]), 
	.A(n_21));
   NO2X0 p25734A (.Q(n_23), 
	.B(A[7]), 
	.A(n_21));
   ON21X0 p31382A (.Q(Z[6]), 
	.C(n_21), 
	.B(FE_PT1_n_27), 
	.A(n_19));
   NA2X0 p25630A (.Q(n_21), 
	.B(FE_PT1_n_27), 
	.A(n_19));
   AO21X0 p31226A (.Q(Z[5]), 
	.C(n_19), 
	.B(A[5]), 
	.A(n_17));
   NO2X0 p25371A (.Q(n_19), 
	.B(A[5]), 
	.A(n_17));
   ON21X0 p31694A (.Q(Z[4]), 
	.C(n_17), 
	.B(n_32), 
	.A(n_15));
   NA2X0 p25291A (.Q(n_17), 
	.B(n_32), 
	.A(n_15));
   AO21X0 p31488A (.Q(Z[3]), 
	.C(n_15), 
	.B(A[3]), 
	.A(n_13));
   NO2X0 p24998A (.Q(n_15), 
	.B(A[3]), 
	.A(n_13));
   ON21X0 p31993A (.Q(Z[2]), 
	.C(n_13), 
	.B(FE_PT1_n_51), 
	.A(n_11));
   NA2X0 p24973A (.Q(n_13), 
	.B(FE_PT1_n_51), 
	.A(n_11));
   AO21X0 p31805A (.Q(Z[1]), 
	.C(n_11), 
	.B(A[0]), 
	.A(A[1]));
   NO2X0 p24838A (.Q(n_11), 
	.B(A[0]), 
	.A(A[1]));
endmodule

module addsub_unsigned_489 (
	A, 
	B, 
	AS, 
	Z);
   input [25:0] A;
   input [25:0] B;
   input AS;
   output [23:0] Z;

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
   wire n_26;
   wire n_28;
   wire n_30;
   wire n_32;
   wire n_34;
   wire n_36;
   wire n_38;
   wire n_40;
   wire n_42;
   wire n_44;
   wire n_46;
   wire n_48;
   wire n_50;
   wire n_52;
   wire n_54;
   wire n_56;
   wire n_58;
   wire n_60;
   wire n_62;
   wire n_64;
   wire n_66;
   wire n_68;

   EN3X0 p26214A (.Q(Z[23]), 
	.C(A[23]), 
	.B(n_12), 
	.A(n_68));
   FAX0 p25880A (.S(Z[22]), 
	.CO(n_68), 
	.CI(n_4), 
	.B(A[22]), 
	.A(n_66));
   FAX0 p25374A (.S(Z[21]), 
	.CO(n_66), 
	.CI(n_8), 
	.B(A[21]), 
	.A(n_64));
   FAX0 p24866A (.S(Z[20]), 
	.CO(n_64), 
	.CI(n_9), 
	.B(A[20]), 
	.A(n_62));
   FAX0 p24358A (.S(Z[19]), 
	.CO(n_62), 
	.CI(n_17), 
	.B(A[19]), 
	.A(n_60));
   FAX0 p23850A (.S(Z[18]), 
	.CO(n_60), 
	.CI(n_20), 
	.B(A[18]), 
	.A(n_58));
   FAX0 p23342A (.S(Z[17]), 
	.CO(n_58), 
	.CI(n_21), 
	.B(A[17]), 
	.A(n_56));
   FAX0 p22834A (.S(Z[16]), 
	.CO(n_56), 
	.CI(n_1), 
	.B(A[16]), 
	.A(n_54));
   FAX0 p22335A (.S(Z[15]), 
	.CO(n_54), 
	.CI(n_6), 
	.B(A[15]), 
	.A(n_52));
   FAX0 p21841A (.S(Z[14]), 
	.CO(n_52), 
	.CI(n_16), 
	.B(A[14]), 
	.A(n_50));
   FAX0 p21337A (.S(Z[13]), 
	.CO(n_50), 
	.CI(n_14), 
	.B(A[13]), 
	.A(n_48));
   FAX0 p20829A (.S(Z[12]), 
	.CO(n_48), 
	.CI(n_10), 
	.B(A[12]), 
	.A(n_46));
   FAX0 p20321A (.S(Z[11]), 
	.CO(n_46), 
	.CI(n_5), 
	.B(A[11]), 
	.A(n_44));
   FAX0 p19813A (.S(Z[10]), 
	.CO(n_44), 
	.CI(n_3), 
	.B(A[10]), 
	.A(n_42));
   FAX0 p19305A (.S(Z[9]), 
	.CO(n_42), 
	.CI(n_0), 
	.B(A[9]), 
	.A(n_40));
   FAX0 p18797A (.S(Z[8]), 
	.CO(n_40), 
	.CI(n_22), 
	.B(A[8]), 
	.A(n_38));
   FAX0 p18289A (.S(Z[7]), 
	.CO(n_38), 
	.CI(n_23), 
	.B(A[7]), 
	.A(n_36));
   FAX0 p17780A (.S(Z[6]), 
	.CO(n_36), 
	.CI(n_19), 
	.B(A[6]), 
	.A(n_34));
   FAX0 p17272A (.S(Z[5]), 
	.CO(n_34), 
	.CI(n_18), 
	.B(A[5]), 
	.A(n_32));
   FAX0 p16764A (.S(Z[4]), 
	.CO(n_32), 
	.CI(n_15), 
	.B(A[4]), 
	.A(n_30));
   FAX0 p16258A (.S(Z[3]), 
	.CO(n_30), 
	.CI(n_2), 
	.B(A[3]), 
	.A(n_28));
   FAX0 p15751A (.S(Z[2]), 
	.CO(n_28), 
	.CI(A[2]), 
	.B(n_13), 
	.A(n_26));
   FAX0 p15243A (.S(Z[1]), 
	.CO(n_26), 
	.CI(A[1]), 
	.B(n_11), 
	.A(n_24));
   FAX0 p14878A (.S(Z[0]), 
	.CO(n_24), 
	.CI(A[0]), 
	.B(AS), 
	.A(n_7));
   EO2X0 p19721A (.Q(n_23), 
	.B(B[7]), 
	.A(AS));
   EO2X0 p20481A (.Q(n_22), 
	.B(B[8]), 
	.A(AS));
   EO2X0 p27202A (.Q(n_21), 
	.B(B[17]), 
	.A(AS));
   EO2X0 p27962A (.Q(n_20), 
	.B(B[18]), 
	.A(AS));
   EO2X0 p18988A (.Q(n_19), 
	.B(B[6]), 
	.A(AS));
   EO2X0 p18241A (.Q(n_18), 
	.B(B[5]), 
	.A(AS));
   EO2X0 p28722A (.Q(n_17), 
	.B(B[19]), 
	.A(AS));
   EO2X0 p24987A (.Q(n_16), 
	.B(B[14]), 
	.A(AS));
   EO2X0 p17494A (.Q(n_15), 
	.B(B[4]), 
	.A(AS));
   EO2X0 p24227A (.Q(n_14), 
	.B(B[13]), 
	.A(AS));
   EO2X0 p15970A (.Q(n_13), 
	.B(B[2]), 
	.A(AS));
   EN2X0 p31264A (.Q(n_12), 
	.B(B[23]), 
	.A(AS));
   EO2X0 p15234A (.Q(n_11), 
	.B(B[1]), 
	.A(AS));
   EO2X0 p23467A (.Q(n_10), 
	.B(B[12]), 
	.A(AS));
   EO2X0 p29482A (.Q(n_9), 
	.B(B[20]), 
	.A(AS));
   EO2X0 p30242A (.Q(n_8), 
	.B(B[21]), 
	.A(AS));
   EO2X0 p14487A (.Q(n_7), 
	.B(B[0]), 
	.A(AS));
   EO2X0 p25690A (.Q(n_6), 
	.B(B[15]), 
	.A(AS));
   EO2X0 p22707A (.Q(n_5), 
	.B(B[11]), 
	.A(AS));
   EO2X0 p31002A (.Q(n_4), 
	.B(B[22]), 
	.A(AS));
   EO2X0 p21960A (.Q(n_3), 
	.B(B[10]), 
	.A(AS));
   EO2X0 p16748A (.Q(n_2), 
	.B(B[3]), 
	.A(AS));
   EO2X0 p26442A (.Q(n_1), 
	.B(B[16]), 
	.A(AS));
   EO2X0 p21200A (.Q(n_0), 
	.B(B[9]), 
	.A(AS));
endmodule

module increment_unsigned_164_165_4594 (
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

   EN2X0 p35907A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p36078A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p35662A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p36251A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p35367A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p36422A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p35071A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p36595A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p34776A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p36766A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p34481A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p36938A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p34186A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p37110A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p33890A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p37282A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p33595A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p37454A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p33300A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p37626A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p33005A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p37798A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p32709A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p37974A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p32418A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p38141A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p32118A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p38328A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p31838A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p38485A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p31528A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p38684A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p31259A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p38832A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p30940A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p39040A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p30681A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p39177A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p30351A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p39415A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p30122A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p39691A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p29918A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p39750A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p29811A (.Q(n_0), 
	.B(A[1]), 
	.A(A[0]));
endmodule

module increment_unsigned_164_165_4593 (
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

   EN2X0 p28481A (.Q(Z[23]), 
	.B(A[23]), 
	.A(n_42));
   EN2X0 p28654A (.Q(Z[22]), 
	.B(A[22]), 
	.A(n_40));
   NA2I1X0 p28236A (.Q(n_42), 
	.B(A[22]), 
	.AN(n_40));
   EN2X0 p28825A (.Q(Z[21]), 
	.B(A[21]), 
	.A(n_38));
   NA2I1X0 p27941A (.Q(n_40), 
	.B(A[21]), 
	.AN(n_38));
   EN2X0 p28997A (.Q(Z[20]), 
	.B(A[20]), 
	.A(n_36));
   NA2I1X0 p27646A (.Q(n_38), 
	.B(A[20]), 
	.AN(n_36));
   EN2X0 p29169A (.Q(Z[19]), 
	.B(A[19]), 
	.A(n_34));
   NA2I1X0 p27351A (.Q(n_36), 
	.B(A[19]), 
	.AN(n_34));
   EN2X0 p29341A (.Q(Z[18]), 
	.B(A[18]), 
	.A(n_32));
   NA2I1X0 p27056A (.Q(n_34), 
	.B(A[18]), 
	.AN(n_32));
   EN2X0 p29513A (.Q(Z[17]), 
	.B(A[17]), 
	.A(n_30));
   NA2I1X0 p26760A (.Q(n_32), 
	.B(A[17]), 
	.AN(n_30));
   EN2X0 p29685A (.Q(Z[16]), 
	.B(A[16]), 
	.A(n_28));
   NA2I1X0 p26465A (.Q(n_30), 
	.B(A[16]), 
	.AN(n_28));
   EN2X0 p29856A (.Q(Z[15]), 
	.B(A[15]), 
	.A(n_26));
   NA2I1X0 p26170A (.Q(n_28), 
	.B(A[15]), 
	.AN(n_26));
   EN2X0 p30029A (.Q(Z[14]), 
	.B(A[14]), 
	.A(n_24));
   NA2I1X0 p25874A (.Q(n_26), 
	.B(A[14]), 
	.AN(n_24));
   EN2X0 p30200A (.Q(Z[13]), 
	.B(A[13]), 
	.A(n_22));
   NA2I1X0 p25579A (.Q(n_24), 
	.B(A[13]), 
	.AN(n_22));
   EN2X0 p30372A (.Q(Z[12]), 
	.B(A[12]), 
	.A(n_20));
   NA2I1X0 p25284A (.Q(n_22), 
	.B(A[12]), 
	.AN(n_20));
   EN2X0 p30548A (.Q(Z[11]), 
	.B(A[11]), 
	.A(n_18));
   NA2I1X0 p24992A (.Q(n_20), 
	.B(A[11]), 
	.AN(n_18));
   EN2X0 p30716A (.Q(Z[10]), 
	.B(A[10]), 
	.A(n_16));
   NA2I1X0 p24693A (.Q(n_18), 
	.B(A[10]), 
	.AN(n_16));
   EN2X0 p30902A (.Q(Z[9]), 
	.B(A[9]), 
	.A(n_14));
   NA2I1X0 p24412A (.Q(n_16), 
	.B(A[9]), 
	.AN(n_14));
   EN2X0 p31060A (.Q(Z[8]), 
	.B(A[8]), 
	.A(n_12));
   NA2I1X0 p24103A (.Q(n_14), 
	.B(A[8]), 
	.AN(n_12));
   EN2X0 p31258A (.Q(Z[7]), 
	.B(A[7]), 
	.A(n_10));
   NA2I1X0 p23834A (.Q(n_12), 
	.B(A[7]), 
	.AN(n_10));
   EN2X0 p31407A (.Q(Z[6]), 
	.B(A[6]), 
	.A(n_8));
   NA2I1X0 p23515A (.Q(n_10), 
	.B(A[6]), 
	.AN(n_8));
   EN2X0 p31561A (.Q(Z[5]), 
	.B(A[5]), 
	.A(n_6));
   NA2I1X0 p23255A (.Q(n_8), 
	.B(A[5]), 
	.AN(n_6));
   EN2X0 p31699A (.Q(Z[4]), 
	.B(A[4]), 
	.A(n_4));
   NA2I1X0 p22905A (.Q(n_6), 
	.B(A[4]), 
	.AN(n_4));
   EN2X0 p31937A (.Q(Z[3]), 
	.B(A[3]), 
	.A(n_2));
   NA2I1X0 p22673A (.Q(n_4), 
	.B(A[3]), 
	.AN(n_2));
   EN2X0 p32205A (.Q(Z[2]), 
	.B(A[2]), 
	.A(n_0));
   NA2I1X0 p22458A (.Q(n_2), 
	.B(A[2]), 
	.AN(n_0));
   EO2X0 p32235A (.Q(Z[1]), 
	.B(A[0]), 
	.A(A[1]));
   NA2X0 p22353A (.Q(n_0), 
	.B(A[0]), 
	.A(A[1]));
endmodule

module timers_timer2_acg (
	timers_timer2_acg_clock_i, 
	timers_timer2_acg_reset_i_b, 
	timers_timer2_acg_pdf_pht_i, 
	timers_sfr_tacpl_i, 
	timers_sfr_tacpm_i, 
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
	DFT_sdi_2, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N8, 
	top_clock_i__L2_N9);
   input timers_timer2_acg_clock_i;
   input timers_timer2_acg_reset_i_b;
   input timers_timer2_acg_pdf_pht_i;
   input [7:0] timers_sfr_tacpl_i;
   input [7:0] timers_sfr_tacpm_i;
   input [7:0] timers_sfr_tacph_i;
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
   input DFT_sdi_2;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N8;
   input top_clock_i__L2_N9;

   // Internal wires
   wire UNCONNECTED63;
   wire UNCONNECTED64;
   wire UNCONNECTED65;
   wire UNCONNECTED66;
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
   wire \angle_clk[10] ;
   wire \angle_clk[11] ;
   wire \angle_clk[12] ;
   wire \angle_clk[13] ;
   wire \angle_clk[14] ;
   wire \angle_clk[15] ;
   wire \angle_clk[16] ;
   wire \angle_clk[17] ;
   wire \angle_clk[18] ;
   wire \angle_clk[19] ;
   wire \angle_clk[20] ;
   wire \angle_clk[21] ;
   wire \angle_clk[22] ;
   wire \angle_clk[23] ;
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
   wire \angle_clk_period[11] ;
   wire \angle_clk_period[12] ;
   wire \angle_clk_period[13] ;
   wire \angle_clk_period[14] ;
   wire \angle_clk_period[15] ;
   wire \angle_clk_period[16] ;
   wire \angle_clk_period[17] ;
   wire \angle_clk_period[18] ;
   wire \angle_clk_period[19] ;
   wire \angle_clk_period[20] ;
   wire \angle_clk_period[21] ;
   wire \angle_clk_period[22] ;
   wire \angle_clk_period[23] ;
   wire decre_254;
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
   wire n_372;
   wire n_373;
   wire n_374;
   wire n_375;
   wire n_376;
   wire n_399;
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
   wire \state[0] ;
   wire \state[1] ;

   decrement_unsigned_166_167_4595 dec_sub_139_62 (.A({ \angle_clk_period[23] ,
		\angle_clk_period[22] ,
		\angle_clk_period[21] ,
		\angle_clk_period[20] ,
		\angle_clk_period[19] ,
		\angle_clk_period[18] ,
		\angle_clk_period[17] ,
		\angle_clk_period[16] ,
		\angle_clk_period[15] ,
		\angle_clk_period[14] ,
		\angle_clk_period[13] ,
		\angle_clk_period[12] ,
		\angle_clk_period[11] ,
		DFT_sdo,
		\angle_clk_period[9] ,
		\angle_clk_period[8] ,
		\angle_clk_period[7] ,
		\angle_clk_period[6] ,
		\angle_clk_period[5] ,
		\angle_clk_period[4] ,
		\angle_clk_period[3] ,
		\angle_clk_period[2] ,
		\angle_clk_period[1] ,
		\angle_clk_period[0]  }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED63,
		n_402,
		n_403,
		n_404,
		n_405,
		n_406,
		n_407,
		n_408,
		n_409,
		n_410,
		n_411,
		n_412,
		n_413,
		n_416,
		n_417,
		n_419,
		n_421,
		n_422,
		n_435,
		n_453,
		n_473,
		n_474,
		n_475,
		n_476,
		UNCONNECTED64 }), 
	.n_48(n_48), 
	.FE_PT1_n_27(n_27), 
	.n_32(n_32), 
	.FE_PT1_n_51(n_51), 
	.n_60(n_60), 
	.n_26(n_26), 
	.n_55(n_55), 
	.FE_PT1_n_53(n_53), 
	.n_56(n_56), 
	.FE_PT1_n_19(n_19), 
	.n_30(n_30));
   addsub_unsigned_489 final_adder_sub_107_39_Y_sub_119_51 (.A({ 1'b0,
		1'b0,
		n_447,
		n_446,
		n_445,
		n_444,
		n_443,
		n_442,
		n_441,
		n_440,
		n_439,
		n_438,
		n_437,
		n_436,
		n_434,
		n_433,
		n_432,
		n_431,
		n_430,
		n_429,
		n_428,
		n_427,
		n_426,
		n_425,
		n_424,
		n_423 }), 
	.B({ 1'b0,
		1'b0,
		\angle_clk[23] ,
		\angle_clk[22] ,
		\angle_clk[21] ,
		\angle_clk[20] ,
		\angle_clk[19] ,
		\angle_clk[18] ,
		\angle_clk[17] ,
		\angle_clk[16] ,
		\angle_clk[15] ,
		\angle_clk[14] ,
		\angle_clk[13] ,
		\angle_clk[12] ,
		\angle_clk[11] ,
		\angle_clk[10] ,
		\angle_clk[9] ,
		\angle_clk[8] ,
		\angle_clk[7] ,
		\angle_clk[6] ,
		\angle_clk[5] ,
		\angle_clk[4] ,
		\angle_clk[3] ,
		\angle_clk[2] ,
		\angle_clk[1] ,
		\angle_clk[0]  }), 
	.AS(n_375), 
	.Z({ n_472,
		n_471,
		n_470,
		n_469,
		n_468,
		n_467,
		n_466,
		n_465,
		n_464,
		n_463,
		n_462,
		n_461,
		n_460,
		n_459,
		n_458,
		n_457,
		n_456,
		n_455,
		n_454,
		n_452,
		n_451,
		n_450,
		n_449,
		n_448 }));
   increment_unsigned_164_165_4594 inc_add_278_55 (.A({ timers_sfr_acrh_o[7],
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
	.Z({ UNCONNECTED65,
		n_297,
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
		n_312,
		n_313,
		n_314,
		n_315,
		n_316,
		n_317,
		n_318,
		n_319,
		UNCONNECTED66 }));
   increment_unsigned_164_165_4593 inc_add_99_50 (.A({ \angle_clk_period[23] ,
		\angle_clk_period[22] ,
		\angle_clk_period[21] ,
		\angle_clk_period[20] ,
		\angle_clk_period[19] ,
		\angle_clk_period[18] ,
		\angle_clk_period[17] ,
		\angle_clk_period[16] ,
		\angle_clk_period[15] ,
		\angle_clk_period[14] ,
		\angle_clk_period[13] ,
		\angle_clk_period[12] ,
		\angle_clk_period[11] ,
		DFT_sdo,
		\angle_clk_period[9] ,
		\angle_clk_period[8] ,
		\angle_clk_period[7] ,
		\angle_clk_period[6] ,
		\angle_clk_period[5] ,
		\angle_clk_period[4] ,
		\angle_clk_period[3] ,
		\angle_clk_period[2] ,
		\angle_clk_period[1] ,
		\angle_clk_period[0]  }), 
	.CI(1'b0), 
	.Z({ UNCONNECTED67,
		n_320,
		n_321,
		n_322,
		n_323,
		n_324,
		n_325,
		n_326,
		n_327,
		n_328,
		n_329,
		n_330,
		n_331,
		n_332,
		n_333,
		n_334,
		n_335,
		n_336,
		n_337,
		n_338,
		n_339,
		n_340,
		n_341,
		n_342,
		UNCONNECTED68 }));
   SDFRQX0 acr_inc_reg (.SE(DFT_sen), 
	.SD(DFT_sdi), 
	.Q(acr_inc), 
	.D(n_204), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[0]  (.SE(DFT_sen), 
	.SD(acr_inc), 
	.Q(\angle_clk_period[0] ), 
	.D(n_198), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \angle_clk_period_reg[10]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[9] ), 
	.Q(DFT_sdo), 
	.D(n_226), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[11]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[12] ), 
	.Q(\angle_clk_period[11] ), 
	.D(n_246), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[12]  (.SE(DFT_sen), 
	.SD(\angle_clk[0] ), 
	.Q(\angle_clk_period[12] ), 
	.D(n_248), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[13]  (.SE(DFT_sen), 
	.SD(DFT_sdi_1), 
	.Q(\angle_clk_period[13] ), 
	.D(n_247), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[14]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[13] ), 
	.Q(\angle_clk_period[14] ), 
	.D(n_245), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[15]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[14] ), 
	.Q(\angle_clk_period[15] ), 
	.D(n_243), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_period_reg[16]  (.SE(DFT_sen), 
	.SD(\angle_clk[16] ), 
	.Q(\angle_clk_period[16] ), 
	.D(n_244), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \angle_clk_period_reg[17]  (.SE(DFT_sen), 
	.SD(\angle_clk[5] ), 
	.Q(\angle_clk_period[17] ), 
	.D(n_242), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_period_reg[18]  (.SE(DFT_sen), 
	.SD(\angle_clk[18] ), 
	.Q(\angle_clk_period[18] ), 
	.D(n_241), 
	.C(top_clock_i__L2_N11));
   SDFRQX0 \angle_clk_period_reg[19]  (.SE(DFT_sen), 
	.SD(\angle_clk[9] ), 
	.Q(\angle_clk_period[19] ), 
	.D(n_240), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \angle_clk_period_reg[1]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[0] ), 
	.Q(\angle_clk_period[1] ), 
	.D(n_239), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \angle_clk_period_reg[20]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[19] ), 
	.Q(\angle_clk_period[20] ), 
	.D(n_238), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_period_reg[21]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[20] ), 
	.Q(\angle_clk_period[21] ), 
	.D(n_237), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_period_reg[22]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[21] ), 
	.Q(\angle_clk_period[22] ), 
	.D(n_236), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[23]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[22] ), 
	.Q(\angle_clk_period[23] ), 
	.D(n_235), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[2]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[1] ), 
	.Q(\angle_clk_period[2] ), 
	.D(n_234), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_period_reg[3]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[2] ), 
	.Q(\angle_clk_period[3] ), 
	.D(n_233), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_period_reg[4]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[3] ), 
	.Q(\angle_clk_period[4] ), 
	.D(n_232), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_period_reg[5]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[4] ), 
	.Q(\angle_clk_period[5] ), 
	.D(n_231), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_period_reg[6]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[5] ), 
	.Q(\angle_clk_period[6] ), 
	.D(n_230), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_period_reg[7]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[6] ), 
	.Q(\angle_clk_period[7] ), 
	.D(n_229), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \angle_clk_period_reg[8]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[7] ), 
	.Q(\angle_clk_period[8] ), 
	.D(n_228), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \angle_clk_period_reg[9]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[8] ), 
	.Q(\angle_clk_period[9] ), 
	.D(n_227), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_reg[0]  (.SE(DFT_sen), 
	.SD(\angle_clk[1] ), 
	.Q(\angle_clk[0] ), 
	.D(n_279), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_reg[10]  (.SE(DFT_sen), 
	.SD(\angle_clk[20] ), 
	.Q(\angle_clk[10] ), 
	.D(n_278), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[11]  (.SE(DFT_sen), 
	.SD(\angle_clk[19] ), 
	.Q(\angle_clk[11] ), 
	.D(n_277), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[12]  (.SE(DFT_sen), 
	.SD(\angle_clk[11] ), 
	.Q(\angle_clk[12] ), 
	.D(n_276), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[13]  (.SE(DFT_sen), 
	.SD(\angle_clk[2] ), 
	.Q(\angle_clk[13] ), 
	.D(n_275), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_reg[14]  (.SE(DFT_sen), 
	.SD(\angle_clk[3] ), 
	.Q(\angle_clk[14] ), 
	.D(n_274), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[15]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[15] ), 
	.Q(\angle_clk[15] ), 
	.D(n_273), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[16]  (.SE(DFT_sen), 
	.SD(\angle_clk[15] ), 
	.Q(\angle_clk[16] ), 
	.D(n_296), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \angle_clk_reg[17]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[17] ), 
	.Q(\angle_clk[17] ), 
	.D(n_295), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \angle_clk_reg[18]  (.SE(DFT_sen), 
	.SD(\angle_clk[17] ), 
	.Q(\angle_clk[18] ), 
	.D(n_294), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \angle_clk_reg[19]  (.SE(DFT_sen), 
	.SD(\angle_clk[10] ), 
	.Q(\angle_clk[19] ), 
	.D(n_293), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[1]  (.SE(DFT_sen), 
	.SD(\angle_clk[13] ), 
	.Q(\angle_clk[1] ), 
	.D(n_292), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_reg[20]  (.SE(DFT_sen), 
	.SD(\angle_clk[21] ), 
	.Q(\angle_clk[20] ), 
	.D(n_291), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[21]  (.SE(DFT_sen), 
	.SD(\angle_clk[22] ), 
	.Q(\angle_clk[21] ), 
	.D(n_290), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[22]  (.SE(DFT_sen), 
	.SD(\angle_clk[23] ), 
	.Q(\angle_clk[22] ), 
	.D(n_289), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_reg[23]  (.SE(DFT_sen), 
	.SD(\state[0] ), 
	.Q(\angle_clk[23] ), 
	.D(n_287), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_reg[2]  (.SE(DFT_sen), 
	.SD(\angle_clk[14] ), 
	.Q(\angle_clk[2] ), 
	.D(n_288), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[3]  (.SE(DFT_sen), 
	.SD(\angle_clk[12] ), 
	.Q(\angle_clk[3] ), 
	.D(n_286), 
	.C(top_clock_i__L2_N8));
   SDFRQX0 \angle_clk_reg[4]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[16] ), 
	.Q(\angle_clk[4] ), 
	.D(n_285), 
	.C(top_clock_i__L2_N10));
   SDFRQX0 \angle_clk_reg[5]  (.SE(DFT_sen), 
	.SD(\angle_clk[4] ), 
	.Q(\angle_clk[5] ), 
	.D(n_284), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \angle_clk_reg[6]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[18] ), 
	.Q(\angle_clk[6] ), 
	.D(n_283), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \angle_clk_reg[7]  (.SE(DFT_sen), 
	.SD(\angle_clk[6] ), 
	.Q(\angle_clk[7] ), 
	.D(n_282), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \angle_clk_reg[8]  (.SE(DFT_sen), 
	.SD(\angle_clk[7] ), 
	.Q(\angle_clk[8] ), 
	.D(n_281), 
	.C(top_clock_i__L2_N4));
   SDFRQX0 \angle_clk_reg[9]  (.SE(DFT_sen), 
	.SD(\angle_clk[8] ), 
	.Q(\angle_clk[9] ), 
	.D(n_280), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \state_reg[0]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[23] ), 
	.Q(\state[0] ), 
	.D(n_137), 
	.C(top_clock_i__L2_N7));
   SDFRQX0 \state_reg[1]  (.SE(DFT_sen), 
	.SD(\angle_clk_period[11] ), 
	.Q(\state[1] ), 
	.D(n_131), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrh_o_reg[0]  (.SE(DFT_sen), 
	.SD(\state[1] ), 
	.Q(timers_sfr_acrh_o[0]), 
	.D(n_162), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrh_o_reg[1]  (.SE(DFT_sen), 
	.SD(DFT_sdi_2), 
	.Q(timers_sfr_acrh_o[1]), 
	.D(n_161), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrh_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[7]), 
	.Q(timers_sfr_acrh_o[2]), 
	.D(n_160), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[2]), 
	.Q(timers_sfr_acrh_o[3]), 
	.D(n_159), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrh_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[3]), 
	.Q(timers_sfr_acrh_o[4]), 
	.D(n_168), 
	.C(top_clock_i__L2_N3));
   SDFRQX2 \timers_sfr_acrh_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[4]), 
	.Q(timers_sfr_acrh_o[5]), 
	.D(n_167), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrh_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[1]), 
	.Q(timers_sfr_acrh_o[6]), 
	.D(n_158), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrh_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[1]), 
	.Q(timers_sfr_acrh_o[7]), 
	.D(n_157), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrh_o[6]), 
	.Q(timers_sfr_acrl_o[0]), 
	.D(n_141), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrl_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[2]), 
	.Q(timers_sfr_acrl_o[1]), 
	.D(n_164), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[3]), 
	.Q(timers_sfr_acrl_o[2]), 
	.D(n_156), 
	.C(top_clock_i__L2_N12));
   SDFRQX0 \timers_sfr_acrl_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[4]), 
	.Q(timers_sfr_acrl_o[3]), 
	.D(n_145), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrl_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[0]), 
	.Q(timers_sfr_acrl_o[4]), 
	.D(n_155), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrl_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[1]), 
	.Q(timers_sfr_acrl_o[5]), 
	.D(n_154), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrl_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[0]), 
	.Q(timers_sfr_acrl_o[6]), 
	.D(n_153), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrl_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[6]), 
	.Q(timers_sfr_acrl_o[7]), 
	.D(n_143), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrm_o_reg[0]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[5]), 
	.Q(timers_sfr_acrm_o[0]), 
	.D(n_152), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[1]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[2]), 
	.Q(timers_sfr_acrm_o[1]), 
	.D(n_165), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrm_o_reg[2]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[3]), 
	.Q(timers_sfr_acrm_o[2]), 
	.D(n_151), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \timers_sfr_acrm_o_reg[3]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[4]), 
	.Q(timers_sfr_acrm_o[3]), 
	.D(n_150), 
	.C(timers_timer2_acg_clock_i));
   SDFRQX0 \timers_sfr_acrm_o_reg[4]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[7]), 
	.Q(timers_sfr_acrm_o[4]), 
	.D(n_149), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrm_o_reg[5]  (.SE(DFT_sen), 
	.SD(timers_sfr_tcon2_tf2_o), 
	.Q(timers_sfr_acrm_o[5]), 
	.D(n_163), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrm_o_reg[6]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrl_o[7]), 
	.Q(timers_sfr_acrm_o[6]), 
	.D(n_148), 
	.C(top_clock_i__L2_N6));
   SDFRQX0 \timers_sfr_acrm_o_reg[7]  (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[5]), 
	.Q(timers_sfr_acrm_o[7]), 
	.D(n_166), 
	.C(top_clock_i__L2_N9));
   ON211X0 p14694A (.Q(n_296), 
	.D(n_224), 
	.C(n_272), 
	.B(n_200), 
	.A(n_29));
   ON211X0 p14694A3819 (.Q(n_295), 
	.D(n_223), 
	.C(n_271), 
	.B(n_200), 
	.A(n_24));
   ON211X0 p14694A3820 (.Q(n_294), 
	.D(n_222), 
	.C(n_270), 
	.B(n_200), 
	.A(n_57));
   ON211X0 p14694A3821 (.Q(n_293), 
	.D(n_221), 
	.C(n_269), 
	.B(n_200), 
	.A(n_62));
   ON211X0 p14715A (.Q(n_292), 
	.D(n_220), 
	.C(n_268), 
	.B(n_200), 
	.A(n_42));
   ON211X0 p14694A3822 (.Q(n_291), 
	.D(n_219), 
	.C(n_267), 
	.B(n_200), 
	.A(n_21));
   ON211X0 p14694A3823 (.Q(n_290), 
	.D(n_218), 
	.C(n_266), 
	.B(n_200), 
	.A(n_49));
   ON211X0 p14715A3824 (.Q(n_289), 
	.D(n_217), 
	.C(n_265), 
	.B(n_200), 
	.A(n_58));
   ON211X0 p14715A3825 (.Q(n_288), 
	.D(n_215), 
	.C(n_263), 
	.B(n_200), 
	.A(n_61));
   ON211X0 p14715A3826 (.Q(n_287), 
	.D(n_216), 
	.C(n_264), 
	.B(n_200), 
	.A(n_22));
   ON211X0 p14715A3827 (.Q(n_286), 
	.D(n_214), 
	.C(n_262), 
	.B(n_200), 
	.A(n_59));
   ON211X0 p14715A3828 (.Q(n_285), 
	.D(n_213), 
	.C(n_261), 
	.B(n_200), 
	.A(n_43));
   ON211X0 p14715A3829 (.Q(n_284), 
	.D(n_212), 
	.C(n_260), 
	.B(n_200), 
	.A(n_44));
   ON211X0 p14715A3830 (.Q(n_283), 
	.D(n_211), 
	.C(n_259), 
	.B(n_200), 
	.A(n_20));
   ON211X0 p14715A3831 (.Q(n_282), 
	.D(n_210), 
	.C(n_258), 
	.B(n_200), 
	.A(n_54));
   ON211X0 p14715A3832 (.Q(n_281), 
	.D(n_209), 
	.C(n_257), 
	.B(n_200), 
	.A(n_23));
   ON211X0 p14715A3833 (.Q(n_280), 
	.D(n_208), 
	.C(n_256), 
	.B(n_200), 
	.A(n_34));
   ON211X0 p14715A3834 (.Q(n_279), 
	.D(n_225), 
	.C(n_255), 
	.B(n_200), 
	.A(n_63));
   ON211X0 p14694A3835 (.Q(n_278), 
	.D(n_207), 
	.C(n_254), 
	.B(n_200), 
	.A(n_31));
   ON211X0 p14694A3836 (.Q(n_277), 
	.D(n_206), 
	.C(n_253), 
	.B(n_200), 
	.A(n_39));
   ON211X0 p14694A3837 (.Q(n_276), 
	.D(n_205), 
	.C(n_252), 
	.B(n_200), 
	.A(n_50));
   ON211X0 p14694A3838 (.Q(n_275), 
	.D(n_203), 
	.C(n_251), 
	.B(n_200), 
	.A(n_52));
   ON211X0 p14694A3839 (.Q(n_274), 
	.D(n_202), 
	.C(n_250), 
	.B(n_200), 
	.A(n_35));
   ON211X0 p14694A3840 (.Q(n_273), 
	.D(n_201), 
	.C(n_249), 
	.B(n_200), 
	.A(n_40));
   AN21X0 p14702A (.Q(n_272), 
	.C(n_101), 
	.B(\angle_clk_period[16] ), 
	.A(n_199));
   AN21X0 p14702A3865 (.Q(n_271), 
	.C(n_87), 
	.B(\angle_clk_period[17] ), 
	.A(n_199));
   AN21X0 p14702A3866 (.Q(n_270), 
	.C(n_72), 
	.B(\angle_clk_period[18] ), 
	.A(n_199));
   AN21X0 p14702A3867 (.Q(n_269), 
	.C(n_88), 
	.B(\angle_clk_period[19] ), 
	.A(n_199));
   AN21X0 p14702A3868 (.Q(n_268), 
	.C(n_86), 
	.B(\angle_clk_period[1] ), 
	.A(n_199));
   AN21X0 p14702A3869 (.Q(n_267), 
	.C(n_90), 
	.B(\angle_clk_period[20] ), 
	.A(n_199));
   AN21X0 p14702A3870 (.Q(n_266), 
	.C(n_75), 
	.B(\angle_clk_period[21] ), 
	.A(n_199));
   AN21X0 p14702A3871 (.Q(n_265), 
	.C(n_82), 
	.B(\angle_clk_period[22] ), 
	.A(n_199));
   AN21X0 p14702A3872 (.Q(n_264), 
	.C(n_102), 
	.B(\angle_clk_period[23] ), 
	.A(n_199));
   AN21X0 p14702A3873 (.Q(n_263), 
	.C(n_67), 
	.B(\angle_clk_period[2] ), 
	.A(n_199));
   AN21X0 p14702A3874 (.Q(n_262), 
	.C(n_73), 
	.B(\angle_clk_period[3] ), 
	.A(n_199));
   AN21X0 p14702A3875 (.Q(n_261), 
	.C(n_89), 
	.B(\angle_clk_period[4] ), 
	.A(n_199));
   AN21X0 p14702A3876 (.Q(n_260), 
	.C(n_81), 
	.B(\angle_clk_period[5] ), 
	.A(n_199));
   AN21X0 p14702A3877 (.Q(n_259), 
	.C(n_80), 
	.B(\angle_clk_period[6] ), 
	.A(n_199));
   AN21X0 p14702A3878 (.Q(n_258), 
	.C(n_79), 
	.B(\angle_clk_period[7] ), 
	.A(n_199));
   AN21X0 p14702A3879 (.Q(n_257), 
	.C(n_78), 
	.B(\angle_clk_period[8] ), 
	.A(n_199));
   AN21X0 p14702A3880 (.Q(n_256), 
	.C(n_77), 
	.B(\angle_clk_period[9] ), 
	.A(n_199));
   AN21X0 p14702A3881 (.Q(n_255), 
	.C(n_70), 
	.B(\angle_clk_period[0] ), 
	.A(n_199));
   AN21X0 p14702A3882 (.Q(n_254), 
	.C(n_66), 
	.B(DFT_sdo), 
	.A(n_199));
   AN21X0 p14702A3883 (.Q(n_253), 
	.C(n_71), 
	.B(\angle_clk_period[11] ), 
	.A(n_199));
   AN21X0 p14702A3884 (.Q(n_252), 
	.C(n_83), 
	.B(\angle_clk_period[12] ), 
	.A(n_199));
   AN21X0 p14702A3885 (.Q(n_251), 
	.C(n_74), 
	.B(\angle_clk_period[13] ), 
	.A(n_199));
   AN21X0 p14702A3886 (.Q(n_250), 
	.C(n_98), 
	.B(\angle_clk_period[14] ), 
	.A(n_199));
   AN21X0 p14702A3887 (.Q(n_249), 
	.C(n_95), 
	.B(\angle_clk_period[15] ), 
	.A(n_199));
   ON21X0 p14918A (.Q(n_248), 
	.C(n_196), 
	.B(n_19), 
	.A(n_138));
   ON21X0 p14918A3889 (.Q(n_247), 
	.C(n_195), 
	.B(n_25), 
	.A(n_138));
   ON21X0 p14918A3890 (.Q(n_246), 
	.C(n_197), 
	.B(n_37), 
	.A(n_138));
   ON21X0 p14918A3891 (.Q(n_245), 
	.C(n_194), 
	.B(n_56), 
	.A(n_138));
   ON21X0 p14918A3892 (.Q(n_244), 
	.C(n_192), 
	.B(n_53), 
	.A(n_138));
   ON21X0 p14918A3893 (.Q(n_243), 
	.C(n_193), 
	.B(n_18), 
	.A(n_138));
   ON21X0 p14918A3894 (.Q(n_242), 
	.C(n_191), 
	.B(n_16), 
	.A(n_138));
   ON21X0 p14918A3895 (.Q(n_241), 
	.C(n_190), 
	.B(n_55), 
	.A(n_138));
   ON21X0 p14918A3896 (.Q(n_240), 
	.C(n_189), 
	.B(n_41), 
	.A(n_138));
   ON21X0 p14850A (.Q(n_239), 
	.C(n_188), 
	.B(n_45), 
	.A(n_138));
   ON21X0 p14918A3897 (.Q(n_238), 
	.C(n_187), 
	.B(n_26), 
	.A(n_138));
   ON21X0 p14918A3898 (.Q(n_237), 
	.C(n_186), 
	.B(n_33), 
	.A(n_138));
   ON21X0 p14918A3899 (.Q(n_236), 
	.C(n_185), 
	.B(n_60), 
	.A(n_138));
   ON21X0 p14918A3900 (.Q(n_235), 
	.C(n_184), 
	.B(n_65), 
	.A(n_138));
   ON21X0 p14850A3901 (.Q(n_234), 
	.C(n_183), 
	.B(n_51), 
	.A(n_138));
   ON21X0 p14850A3902 (.Q(n_233), 
	.C(n_182), 
	.B(n_28), 
	.A(n_138));
   ON21X0 p14850A3903 (.Q(n_232), 
	.C(n_181), 
	.B(n_32), 
	.A(n_138));
   ON21X0 p14850A3904 (.Q(n_231), 
	.C(n_180), 
	.B(n_38), 
	.A(n_138));
   ON21X0 p14919A (.Q(n_230), 
	.C(n_179), 
	.B(n_27), 
	.A(n_138));
   ON21X0 p14918A3905 (.Q(n_229), 
	.C(n_178), 
	.B(n_17), 
	.A(n_138));
   ON21X0 p14918A3906 (.Q(n_228), 
	.C(n_177), 
	.B(n_48), 
	.A(n_138));
   ON21X0 p14918A3907 (.Q(n_227), 
	.C(n_176), 
	.B(n_36), 
	.A(n_138));
   ON21X0 p14918A3908 (.Q(n_226), 
	.C(n_175), 
	.B(n_30), 
	.A(n_138));
   AN22X0 p14611A (.Q(n_225), 
	.D(n_64), 
	.C(n_174), 
	.B(\angle_clk[0] ), 
	.A(n_169));
   AN22X0 p14606A (.Q(n_224), 
	.D(n_174), 
	.C(n_409), 
	.B(\angle_clk[16] ), 
	.A(n_169));
   AN22X0 p14606A3909 (.Q(n_223), 
	.D(n_174), 
	.C(n_408), 
	.B(\angle_clk[17] ), 
	.A(n_169));
   AN22X0 p14606A3910 (.Q(n_222), 
	.D(n_174), 
	.C(n_407), 
	.B(\angle_clk[18] ), 
	.A(n_169));
   AN22X0 p14606A3911 (.Q(n_221), 
	.D(n_174), 
	.C(n_406), 
	.B(\angle_clk[19] ), 
	.A(n_169));
   AN22X0 p14611A3912 (.Q(n_220), 
	.D(n_476), 
	.C(n_174), 
	.B(\angle_clk[1] ), 
	.A(n_169));
   AN22X0 p14606A3913 (.Q(n_219), 
	.D(n_174), 
	.C(n_405), 
	.B(\angle_clk[20] ), 
	.A(n_169));
   AN22X0 p14606A3914 (.Q(n_218), 
	.D(n_174), 
	.C(n_404), 
	.B(\angle_clk[21] ), 
	.A(n_169));
   AN22X0 p14606A3915 (.Q(n_217), 
	.D(n_174), 
	.C(n_403), 
	.B(\angle_clk[22] ), 
	.A(n_169));
   AN22X0 p14606A3916 (.Q(n_216), 
	.D(n_174), 
	.C(n_402), 
	.B(\angle_clk[23] ), 
	.A(n_169));
   AN22X0 p14611A3917 (.Q(n_215), 
	.D(n_475), 
	.C(n_174), 
	.B(\angle_clk[2] ), 
	.A(n_169));
   AN22X0 p14611A3918 (.Q(n_214), 
	.D(n_474), 
	.C(n_174), 
	.B(\angle_clk[3] ), 
	.A(n_169));
   AN22X0 p14611A3919 (.Q(n_213), 
	.D(n_473), 
	.C(n_174), 
	.B(\angle_clk[4] ), 
	.A(n_169));
   AN22X0 p14611A3920 (.Q(n_212), 
	.D(n_453), 
	.C(n_174), 
	.B(\angle_clk[5] ), 
	.A(n_169));
   AN22X0 p14611A3921 (.Q(n_211), 
	.D(n_435), 
	.C(n_174), 
	.B(\angle_clk[6] ), 
	.A(n_169));
   AN22X0 p14611A3922 (.Q(n_210), 
	.D(n_422), 
	.C(n_174), 
	.B(\angle_clk[7] ), 
	.A(n_169));
   AN22X0 p14611A3923 (.Q(n_209), 
	.D(n_421), 
	.C(n_174), 
	.B(\angle_clk[8] ), 
	.A(n_169));
   AN22X0 p14606A3924 (.Q(n_208), 
	.D(n_174), 
	.C(n_419), 
	.B(\angle_clk[9] ), 
	.A(n_169));
   AN22X0 p14606A3925 (.Q(n_207), 
	.D(n_174), 
	.C(n_417), 
	.B(\angle_clk[10] ), 
	.A(n_169));
   AN22X0 p14606A3926 (.Q(n_206), 
	.D(n_174), 
	.C(n_416), 
	.B(\angle_clk[11] ), 
	.A(n_169));
   AN22X0 p14606A3927 (.Q(n_205), 
	.D(n_174), 
	.C(n_413), 
	.B(\angle_clk[12] ), 
	.A(n_169));
   ON222X0 p14991A (.Q(n_204), 
	.F(n_418), 
	.E(n_170), 
	.D(n_173), 
	.C(decre_254), 
	.B(n_170), 
	.A(n_132));
   AN22X0 p14606A3928 (.Q(n_203), 
	.D(n_174), 
	.C(n_412), 
	.B(\angle_clk[13] ), 
	.A(n_169));
   AN22X0 p14606A3929 (.Q(n_202), 
	.D(n_174), 
	.C(n_411), 
	.B(\angle_clk[14] ), 
	.A(n_169));
   AN22X0 p14606A3930 (.Q(n_201), 
	.D(n_174), 
	.C(n_410), 
	.B(\angle_clk[15] ), 
	.A(n_169));
   NA2X1 p14571A (.Q(n_200), 
	.B(n_399), 
	.A(n_172));
   NO2X1 p13252A (.Q(n_199), 
	.B(n_92), 
	.A(n_171));
   ON221X0 p15055A (.Q(n_198), 
	.E(n_69), 
	.D(n_144), 
	.C(\angle_clk_period[0] ), 
	.B(n_138), 
	.A(n_64));
   AN221X0 p14625A (.Q(n_197), 
	.E(n_71), 
	.D(n_142), 
	.C(n_416), 
	.B(n_332), 
	.A(n_134));
   AN221X0 p14625A3931 (.Q(n_196), 
	.E(n_83), 
	.D(n_142), 
	.C(n_413), 
	.B(n_331), 
	.A(n_134));
   AN221X0 p14625A3932 (.Q(n_195), 
	.E(n_74), 
	.D(n_142), 
	.C(n_412), 
	.B(n_330), 
	.A(n_134));
   AN221X0 p14625A3933 (.Q(n_194), 
	.E(n_98), 
	.D(n_142), 
	.C(n_411), 
	.B(n_329), 
	.A(n_134));
   AN221X0 p14625A3934 (.Q(n_193), 
	.E(n_95), 
	.D(n_142), 
	.C(n_410), 
	.B(n_328), 
	.A(n_134));
   AN221X0 p14625A3935 (.Q(n_192), 
	.E(n_101), 
	.D(n_142), 
	.C(n_409), 
	.B(n_327), 
	.A(n_134));
   AN221X0 p14625A3936 (.Q(n_191), 
	.E(n_87), 
	.D(n_142), 
	.C(n_408), 
	.B(n_326), 
	.A(n_134));
   AN221X0 p14625A3937 (.Q(n_190), 
	.E(n_72), 
	.D(n_142), 
	.C(n_407), 
	.B(n_325), 
	.A(n_134));
   AN221X0 p14625A3938 (.Q(n_189), 
	.E(n_88), 
	.D(n_142), 
	.C(n_406), 
	.B(n_324), 
	.A(n_134));
   AN221X0 p14576A (.Q(n_188), 
	.E(n_86), 
	.D(n_476), 
	.C(n_142), 
	.B(n_134), 
	.A(n_342));
   AN221X0 p14625A3939 (.Q(n_187), 
	.E(n_90), 
	.D(n_142), 
	.C(n_405), 
	.B(n_323), 
	.A(n_134));
   AN221X0 p14625A3940 (.Q(n_186), 
	.E(n_75), 
	.D(n_142), 
	.C(n_404), 
	.B(n_322), 
	.A(n_134));
   AN221X0 p14625A3941 (.Q(n_185), 
	.E(n_82), 
	.D(n_142), 
	.C(n_403), 
	.B(n_321), 
	.A(n_134));
   AN221X0 p14625A3942 (.Q(n_184), 
	.E(n_102), 
	.D(n_142), 
	.C(n_402), 
	.B(n_320), 
	.A(n_134));
   AN221X0 p14576A3943 (.Q(n_183), 
	.E(n_67), 
	.D(n_475), 
	.C(n_142), 
	.B(n_134), 
	.A(n_341));
   AN221X0 p14576A3944 (.Q(n_182), 
	.E(n_73), 
	.D(n_474), 
	.C(n_142), 
	.B(n_134), 
	.A(n_340));
   AN221X0 p14576A3945 (.Q(n_181), 
	.E(n_89), 
	.D(n_473), 
	.C(n_142), 
	.B(n_134), 
	.A(n_339));
   AN221X0 p14576A3946 (.Q(n_180), 
	.E(n_81), 
	.D(n_453), 
	.C(n_142), 
	.B(n_134), 
	.A(n_338));
   AN221X0 p14625A3947 (.Q(n_179), 
	.E(n_80), 
	.D(n_142), 
	.C(n_435), 
	.B(n_337), 
	.A(n_134));
   AN221X0 p14625A3948 (.Q(n_178), 
	.E(n_79), 
	.D(n_142), 
	.C(n_422), 
	.B(n_336), 
	.A(n_134));
   AN221X0 p14625A3949 (.Q(n_177), 
	.E(n_78), 
	.D(n_142), 
	.C(n_421), 
	.B(n_335), 
	.A(n_134));
   AN221X0 p14625A3950 (.Q(n_176), 
	.E(n_77), 
	.D(n_142), 
	.C(n_419), 
	.B(n_334), 
	.A(n_134));
   AN221X0 p14625A3951 (.Q(n_175), 
	.E(n_66), 
	.D(n_142), 
	.C(n_417), 
	.B(n_333), 
	.A(n_134));
   NO3X1 p14462A (.Q(n_174), 
	.C(n_374), 
	.B(n_92), 
	.A(n_140));
   AN22X0 p14929A (.Q(n_173), 
	.D(acr_inc), 
	.C(n_147), 
	.B(n_91), 
	.A(n_136));
   ON22X0 p14588A (.Q(n_172), 
	.D(n_96), 
	.C(n_94), 
	.B(n_47), 
	.A(n_140));
   AN22X0 p30013A (.Q(n_171), 
	.D(timers_timer2_acg_pdf_pht_i), 
	.C(n_93), 
	.B(n_374), 
	.A(n_139));
   NA2X0 p14924A (.Q(n_170), 
	.B(decre_254), 
	.A(n_147));
   NO3X1 p12255A (.Q(n_169), 
	.C(decre_254), 
	.B(n_375), 
	.A(n_146));
   NO2X0 p15509A (.Q(n_168), 
	.B(n_47), 
	.A(n_128));
   NO2X0 p15509A3978 (.Q(n_167), 
	.B(n_47), 
	.A(n_121));
   NO2X0 p15509A3979 (.Q(n_166), 
	.B(n_47), 
	.A(n_108));
   NO2X0 p15509A3980 (.Q(n_165), 
	.B(n_47), 
	.A(n_114));
   NO2X0 p15509A3981 (.Q(n_164), 
	.B(n_47), 
	.A(n_118));
   NO2X0 p15509A3982 (.Q(n_163), 
	.B(n_47), 
	.A(n_112));
   NO2X0 p15509A3983 (.Q(n_162), 
	.B(n_47), 
	.A(n_124));
   NO2X0 p15509A3984 (.Q(n_161), 
	.B(n_47), 
	.A(n_123));
   NO2X0 p15509A3985 (.Q(n_160), 
	.B(n_47), 
	.A(n_110));
   NO2X0 p15509A3986 (.Q(n_159), 
	.B(n_47), 
	.A(n_122));
   NO2X0 p15509A3987 (.Q(n_158), 
	.B(n_47), 
	.A(n_120));
   NO2X0 p15509A3988 (.Q(n_157), 
	.B(n_47), 
	.A(n_119));
   NO2X0 p15509A3989 (.Q(n_156), 
	.B(n_47), 
	.A(n_109));
   NO2X0 p15509A3990 (.Q(n_155), 
	.B(n_47), 
	.A(n_127));
   NO2X0 p15509A3991 (.Q(n_154), 
	.B(n_47), 
	.A(n_116));
   NO2X0 p15509A3992 (.Q(n_153), 
	.B(n_47), 
	.A(n_129));
   NO2X0 p15509A3993 (.Q(n_152), 
	.B(n_47), 
	.A(n_126));
   NO2X0 p15509A3994 (.Q(n_151), 
	.B(n_47), 
	.A(n_130));
   NO2X0 p15509A3995 (.Q(n_150), 
	.B(n_47), 
	.A(n_113));
   NO2X0 p15509A3996 (.Q(n_149), 
	.B(n_47), 
	.A(n_125));
   NO2X0 p15509A3997 (.Q(n_148), 
	.B(n_47), 
	.A(n_111));
   NA2X0 p14919A3998 (.Q(n_147), 
	.B(n_96), 
	.A(n_135));
   NO2I1X0 p12221A (.Q(n_146), 
	.B(n_68), 
	.AN(n_135));
   NO2X0 p15509A3999 (.Q(n_145), 
	.B(n_47), 
	.A(n_117));
   NO2X0 p15097A (.Q(n_144), 
	.B(n_133), 
	.A(n_134));
   NO2X0 p15509A4000 (.Q(n_143), 
	.B(n_47), 
	.A(n_115));
   AND2X1 p14200A (.Q(n_142), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(n_133));
   NO2X0 p15509A4001 (.Q(n_141), 
	.B(n_47), 
	.A(n_107));
   INX0 Fp29875A (.Q(n_139), 
	.A(n_140));
   AN211X0 p30002D (.Q(n_140), 
	.D(n_375), 
	.C(decre_254), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(n_76));
   OA21X1 p14527A (.Q(n_138), 
	.C(n_135), 
	.B(n_96), 
	.A(n_15));
   AO22X0 p15154A (.Q(n_137), 
	.D(n_46), 
	.C(n_99), 
	.B(n_68), 
	.A(n_105));
   AO22X0 p31827A (.Q(n_136), 
	.D(timers_timer2_acg_pdf_pht_i), 
	.C(n_100), 
	.B(\state[1] ), 
	.A(n_104));
   NA2I1X0 p12136A (.Q(n_135), 
	.B(timers_timer2_acg_reset_i_b), 
	.AN(n_106));
   AND2X1 p14174A (.Q(n_134), 
	.B(n_68), 
	.A(n_106));
   NO3I1X0 p14127A (.Q(n_133), 
	.C(n_47), 
	.B(n_374), 
	.AN(n_76));
   NO3I1X0 p32824A (.Q(n_132), 
	.C(n_372), 
	.B(n_103), 
	.AN(n_414));
   AO22X0 p15100A (.Q(n_131), 
	.D(n_46), 
	.C(\state[1] ), 
	.B(n_97), 
	.A(\state[0] ));
   AN22X0 p15330A (.Q(n_130), 
	.D(timers_sfr_acrm_o[2]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_310));
   AN22X0 p15330A4002 (.Q(n_129), 
	.D(timers_sfr_acrl_o[6]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_314));
   AN22X0 p15330A4003 (.Q(n_128), 
	.D(timers_sfr_acrh_o[4]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_300));
   AN22X0 p15330A4004 (.Q(n_127), 
	.D(timers_sfr_acrl_o[4]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_316));
   AN22X0 p15330A4005 (.Q(n_126), 
	.D(timers_sfr_acrm_o[0]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_312));
   AN22X0 p15330A4006 (.Q(n_125), 
	.D(timers_sfr_acrm_o[4]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_308));
   AN22X0 p15330A4007 (.Q(n_124), 
	.D(timers_sfr_acrh_o[0]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_304));
   AN22X0 p15330A4008 (.Q(n_123), 
	.D(timers_sfr_acrh_o[1]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_303));
   AN22X0 p15330A4009 (.Q(n_122), 
	.D(timers_sfr_acrh_o[3]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_301));
   AN22X0 p15330A4010 (.Q(n_121), 
	.D(timers_sfr_acrh_o[5]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_299));
   AN22X0 p15330A4011 (.Q(n_120), 
	.D(timers_sfr_acrh_o[6]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_298));
   AN22X0 p15330A4012 (.Q(n_119), 
	.D(timers_sfr_acrh_o[7]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_297));
   AN22X0 p15330A4013 (.Q(n_118), 
	.D(timers_sfr_acrl_o[1]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_319));
   AN22X0 p15330A4014 (.Q(n_117), 
	.D(timers_sfr_acrl_o[3]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_317));
   AN22X0 p15330A4015 (.Q(n_116), 
	.D(timers_sfr_acrl_o[5]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_315));
   AN22X0 p15330A4016 (.Q(n_115), 
	.D(timers_sfr_acrl_o[7]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_313));
   AN22X0 p15330A4017 (.Q(n_114), 
	.D(timers_sfr_acrm_o[1]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_311));
   AN22X0 p15330A4018 (.Q(n_113), 
	.D(timers_sfr_acrm_o[3]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_309));
   AN22X0 p15330A4019 (.Q(n_112), 
	.D(timers_sfr_acrm_o[5]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_307));
   AN22X0 p15330A4020 (.Q(n_111), 
	.D(timers_sfr_acrm_o[6]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_306));
   AN22X0 p15330A4021 (.Q(n_110), 
	.D(timers_sfr_acrh_o[2]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_302));
   AN22X0 p15330A4022 (.Q(n_109), 
	.D(timers_sfr_acrl_o[2]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_318));
   AN22X0 p15330A4023 (.Q(n_108), 
	.D(timers_sfr_acrm_o[7]), 
	.C(n_85), 
	.B(n_84), 
	.A(n_305));
   EN2X0 p15345A (.Q(n_107), 
	.B(timers_sfr_acrl_o[0]), 
	.A(n_84));
   NA2I1X0 p29046A (.Q(n_106), 
	.B(n_94), 
	.AN(n_76));
   INX0 Fp31825A (.Q(n_105), 
	.A(n_104));
   NO2X0 p31794A (.Q(n_104), 
	.B(\state[0] ), 
	.A(n_93));
   NA3I1X0 p32752A (.Q(n_103), 
	.C(n_420), 
	.B(n_415), 
	.AN(n_373));
   NO2I1X0 p15191A (.Q(n_102), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[7]));
   NO2I1X0 p15191A4024 (.Q(n_101), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[0]));
   INX0 Fp34439A (.Q(n_100), 
	.A(n_99));
   NO2X0 p34205A (.Q(n_99), 
	.B(\state[0] ), 
	.A(\state[1] ));
   NO2I1X0 p15191A4025 (.Q(n_98), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[6]));
   INX0 Fp14479A (.Q(n_97), 
	.A(n_96));
   NA2X0 p14173A (.Q(n_96), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(timers_timer2_acg_reset_i_b));
   NO2I1X0 p15191A4026 (.Q(n_95), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[7]));
   INX0 Fp29022A (.Q(n_93), 
	.A(n_94));
   NA2I1X0 p28624A (.Q(n_94), 
	.B(n_374), 
	.AN(n_376));
   INX0 Fp13229A (.Q(n_91), 
	.A(n_92));
   OR2X0 p12591A (.Q(n_92), 
	.B(n_47), 
	.A(n_399));
   NO2I1X0 p15191A4028 (.Q(n_90), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[4]));
   NO2I1X0 p15191A4029 (.Q(n_89), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[4]));
   NO2I1X0 p15191A4030 (.Q(n_88), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[3]));
   NO2I1X0 p15191A4031 (.Q(n_87), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[1]));
   NO2I1X0 p15191A4032 (.Q(n_86), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[1]));
   INX0 Fp15208A4033 (.Q(n_85), 
	.A(n_84));
   AND2X1 p14988A (.Q(n_84), 
	.B(timers_sfr_tcon2_tr2_i), 
	.A(acr_inc));
   NO2I1X0 p15191A4034 (.Q(n_83), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[4]));
   NO2I1X0 p15191A4035 (.Q(n_82), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[6]));
   NO2I1X0 p15191A4036 (.Q(n_81), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[5]));
   NO2I1X0 p15191A4037 (.Q(n_80), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[6]));
   NO2I1X0 p15191A4038 (.Q(n_79), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[7]));
   NO2I1X0 p15191A4039 (.Q(n_78), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[0]));
   NO2I1X0 p15191A4040 (.Q(n_77), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[1]));
   AND2X0 p30779A (.Q(n_76), 
	.B(\state[0] ), 
	.A(\state[1] ));
   NO2I1X0 p15191A4041 (.Q(n_75), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[5]));
   NO2I1X0 p15191A4042 (.Q(n_74), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[5]));
   NO2I1X0 p15191A4043 (.Q(n_73), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[3]));
   NO2I1X0 p15191A4044 (.Q(n_72), 
	.B(n_46), 
	.AN(timers_sfr_tacph_i[2]));
   NO2I1X0 p15191A4045 (.Q(n_71), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[3]));
   INX0 Fp15196A (.Q(n_70), 
	.A(n_69));
   NA2X0 p15046A (.Q(n_69), 
	.B(timers_sfr_tacpl_i[0]), 
	.A(n_47));
   NO2X0 p11943A (.Q(n_68), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(n_47));
   NO2I1X0 p15191A4046 (.Q(n_67), 
	.B(n_46), 
	.AN(timers_sfr_tacpl_i[2]));
   NO2I1X0 p15191A4047 (.Q(n_66), 
	.B(n_46), 
	.AN(timers_sfr_tacpm_i[2]));
   INX0 Fp12591A (.Q(n_65), 
	.A(\angle_clk_period[23] ));
   INX0 Fp10560A (.Q(n_64), 
	.A(\angle_clk_period[0] ));
   INX0 Fp32091A (.Q(n_63), 
	.A(n_448));
   INX0 Fp27381A (.Q(n_62), 
	.A(n_468));
   INX0 Fp31775A (.Q(n_61), 
	.A(n_450));
   INX0 Fp12549A (.Q(n_60), 
	.A(\angle_clk_period[22] ));
   INX0 Fp31523A (.Q(n_59), 
	.A(n_451));
   INX0 Fp26612A (.Q(n_58), 
	.A(n_471));
   INX0 Fp27633A (.Q(n_57), 
	.A(n_467));
   INX0 Fp11885A (.Q(n_56), 
	.A(\angle_clk_period[14] ));
   INX0 Fp12217A (.Q(n_55), 
	.A(\angle_clk_period[18] ));
   INX0 Fp30472A (.Q(n_54), 
	.A(n_456));
   INX0 Fp12051A (.Q(n_53), 
	.A(\angle_clk_period[16] ));
   INX0 Fp28918A (.Q(n_52), 
	.A(n_462));
   INX0 Fp10887A (.Q(n_51), 
	.A(\angle_clk_period[2] ));
   INX0 Fp29172A (.Q(n_50), 
	.A(n_461));
   INX0 Fp26870A (.Q(n_49), 
	.A(n_470));
   INX0 Fp11386A (.Q(n_48), 
	.A(\angle_clk_period[8] ));
   INX0 Fp11994A4054 (.Q(n_46), 
	.A(n_47));
   INX1 Fp11994A4057 (.Q(n_47), 
	.A(timers_timer2_acg_reset_i_b));
   INX0 Fp10804A (.Q(n_45), 
	.A(\angle_clk_period[1] ));
   INX0 Fp31011A (.Q(n_44), 
	.A(n_454));
   INX0 Fp31262A (.Q(n_43), 
	.A(n_452));
   INX0 Fp32002A (.Q(n_42), 
	.A(n_449));
   INX0 Fp12300A (.Q(n_41), 
	.A(\angle_clk_period[19] ));
   INX0 Fp28394A (.Q(n_40), 
	.A(n_464));
   INX0 Fp29427A (.Q(n_39), 
	.A(n_460));
   INX0 Fp11137A (.Q(n_38), 
	.A(\angle_clk_period[5] ));
   INX0 Fp11635A (.Q(n_37), 
	.A(\angle_clk_period[11] ));
   INX0 Fp11469A (.Q(n_36), 
	.A(\angle_clk_period[9] ));
   INX0 Fp28661A (.Q(n_35), 
	.A(n_463));
   INX0 Fp29952A (.Q(n_34), 
	.A(n_458));
   INX0 Fp12466A (.Q(n_33), 
	.A(\angle_clk_period[21] ));
   INX0 Fp11054A (.Q(n_32), 
	.A(\angle_clk_period[4] ));
   INX0 Fp29710A (.Q(n_31), 
	.A(n_459));
   INX0 Fp11552A (.Q(n_30), 
	.A(DFT_sdo));
   INX0 Fp28139A (.Q(n_29), 
	.A(n_465));
   INX0 Fp10970A (.Q(n_28), 
	.A(\angle_clk_period[3] ));
   INX0 Fp11220A (.Q(n_27), 
	.A(\angle_clk_period[6] ));
   INX0 Fp12383A (.Q(n_26), 
	.A(\angle_clk_period[20] ));
   INX0 Fp11802A (.Q(n_25), 
	.A(\angle_clk_period[13] ));
   INX0 Fp27889A (.Q(n_24), 
	.A(n_466));
   INX0 Fp30230A (.Q(n_23), 
	.A(n_457));
   INX0 Fp26356A (.Q(n_22), 
	.A(n_472));
   INX0 Fp27123A (.Q(n_21), 
	.A(n_469));
   INX0 Fp30750A (.Q(n_20), 
	.A(n_455));
   INX0 Fp11718A (.Q(n_19), 
	.A(\angle_clk_period[12] ));
   INX0 Fp11968A (.Q(n_18), 
	.A(\angle_clk_period[15] ));
   INX0 Fp11303A (.Q(n_17), 
	.A(\angle_clk_period[7] ));
   INX0 Fp12134A (.Q(n_16), 
	.A(\angle_clk_period[17] ));
   INX0 Fp28576A (.Q(n_15), 
	.A(n_374));
   SDFRQX0 timers_sfr_tcon2_tf2_o_reg (.SE(DFT_sen), 
	.SD(timers_sfr_acrm_o[6]), 
	.Q(timers_sfr_tcon2_tf2_o), 
	.D(n_14), 
	.C(top_clock_i__L2_N6));
   MU2X0 p15258A (.S(n_13), 
	.Q(n_14), 
	.IN1(n_12), 
	.IN0(timers_sfr_tcon2_tf2_i));
   NA2I1X0 p15005A (.Q(n_13), 
	.B(timers_timer2_acg_reset_i_b), 
	.AN(n_12));
   AND6X0 p14674A (.Q(n_12), 
	.F(timers_sfr_acrh_o[6]), 
	.E(timers_timer2_acg_reset_i_b), 
	.D(n_9), 
	.C(timers_sfr_acrh_o[7]), 
	.B(n_10), 
	.A(n_11));
   AND6X0 p38264A (.Q(n_11), 
	.F(timers_sfr_acrl_o[3]), 
	.E(timers_sfr_acrl_o[0]), 
	.D(n_7), 
	.C(timers_sfr_acrl_o[2]), 
	.B(timers_sfr_acrl_o[1]), 
	.A(n_8));
   AND2X0 p39062A (.Q(n_10), 
	.B(timers_sfr_acrh_o[4]), 
	.A(timers_sfr_acrh_o[5]));
   AND4X0 p38965A (.Q(n_9), 
	.D(timers_sfr_acrh_o[1]), 
	.C(timers_sfr_acrh_o[0]), 
	.B(timers_sfr_acrh_o[2]), 
	.A(timers_sfr_acrh_o[3]));
   AND5X0 p38075A (.Q(n_8), 
	.E(timers_sfr_acrm_o[0]), 
	.D(timers_sfr_acrm_o[3]), 
	.C(timers_sfr_acrm_o[1]), 
	.B(timers_sfr_acrm_o[2]), 
	.A(n_6));
   AND4X0 p38453A (.Q(n_7), 
	.D(timers_sfr_acrl_o[5]), 
	.C(timers_sfr_acrl_o[4]), 
	.B(timers_sfr_acrl_o[6]), 
	.A(timers_sfr_acrl_o[7]));
   AND4X0 p38080A (.Q(n_6), 
	.D(timers_sfr_acrm_o[5]), 
	.C(timers_sfr_acrm_o[4]), 
	.B(timers_sfr_acrm_o[6]), 
	.A(timers_sfr_acrm_o[7]));
   AO21X0 p31125A (.Q(n_447), 
	.C(decre_254), 
	.B(\angle_clk_period[23] ), 
	.A(n_375));
   AO21X0 p29523A (.Q(n_444), 
	.C(decre_254), 
	.B(\angle_clk_period[20] ), 
	.A(n_375));
   AO21X0 p28763A (.Q(n_443), 
	.C(decre_254), 
	.B(\angle_clk_period[19] ), 
	.A(n_375));
   AO21X0 p28003A (.Q(n_442), 
	.C(decre_254), 
	.B(\angle_clk_period[18] ), 
	.A(n_375));
   AO21X0 p27243A (.Q(n_441), 
	.C(decre_254), 
	.B(\angle_clk_period[17] ), 
	.A(n_375));
   AO21X0 p26483A (.Q(n_440), 
	.C(decre_254), 
	.B(\angle_clk_period[16] ), 
	.A(n_375));
   AO21X0 p25723A (.Q(n_439), 
	.C(decre_254), 
	.B(\angle_clk_period[15] ), 
	.A(n_375));
   AO21X0 p24994A (.Q(n_438), 
	.C(decre_254), 
	.B(\angle_clk_period[14] ), 
	.A(n_375));
   AO21X0 p24234A (.Q(n_437), 
	.C(decre_254), 
	.B(\angle_clk_period[13] ), 
	.A(n_375));
   AO21X0 p23484A (.Q(n_436), 
	.C(decre_254), 
	.B(\angle_clk_period[12] ), 
	.A(n_375));
   AO21X0 p22724A (.Q(n_434), 
	.C(decre_254), 
	.B(\angle_clk_period[11] ), 
	.A(n_375));
   AO21X0 p21978A (.Q(n_433), 
	.C(decre_254), 
	.B(DFT_sdo), 
	.A(n_375));
   AO21X0 p30966A (.Q(n_446), 
	.C(decre_254), 
	.B(\angle_clk_period[22] ), 
	.A(n_375));
   AO21X0 p21218A (.Q(n_432), 
	.C(decre_254), 
	.B(\angle_clk_period[9] ), 
	.A(n_375));
   AO21X0 p20472A (.Q(n_431), 
	.C(decre_254), 
	.B(\angle_clk_period[8] ), 
	.A(n_375));
   AO21X0 p19712A (.Q(n_430), 
	.C(decre_254), 
	.B(\angle_clk_period[7] ), 
	.A(n_375));
   AO21X0 p18959A (.Q(n_429), 
	.C(decre_254), 
	.B(\angle_clk_period[6] ), 
	.A(n_375));
   AO21X0 p18223A (.Q(n_428), 
	.C(decre_254), 
	.B(\angle_clk_period[5] ), 
	.A(n_375));
   AO21X0 p30237A (.Q(n_445), 
	.C(decre_254), 
	.B(\angle_clk_period[21] ), 
	.A(n_375));
   AO21X0 p17463A (.Q(n_427), 
	.C(decre_254), 
	.B(\angle_clk_period[4] ), 
	.A(n_375));
   AO21X0 p16703A (.Q(n_426), 
	.C(decre_254), 
	.B(\angle_clk_period[3] ), 
	.A(n_375));
   AO21X0 p15973A (.Q(n_425), 
	.C(decre_254), 
	.B(\angle_clk_period[2] ), 
	.A(n_375));
   AO21X0 p15213A (.Q(n_424), 
	.C(decre_254), 
	.B(\angle_clk_period[1] ), 
	.A(n_375));
   AO21X0 p14453A (.Q(n_423), 
	.C(decre_254), 
	.B(\angle_clk_period[0] ), 
	.A(n_375));
   NO2I1X1 p13898A (.Q(decre_254), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.AN(n_399));
   AND2X2 p13354A (.Q(n_375), 
	.B(timers_timer2_acg_pdf_pht_i), 
	.A(n_399));
   NO2X0 p12668A (.Q(n_399), 
	.B(n_376), 
	.A(n_374));
   AND3X0 p12444A (.Q(n_374), 
	.C(n_415), 
	.B(n_4), 
	.A(n_5));
   NO3I1X0 p12362A (.Q(n_5), 
	.C(n_373), 
	.B(n_3), 
	.AN(n_418));
   NO2I1X0 p12358A (.Q(n_4), 
	.B(\angle_clk[0] ), 
	.AN(n_420));
   NA2I1X0 p12127A (.Q(n_3), 
	.B(n_414), 
	.AN(n_372));
   NO3I1X0 p12015A (.Q(n_414), 
	.C(\angle_clk[5] ), 
	.B(\angle_clk[4] ), 
	.AN(n_2));
   NO3I1X0 p12151A (.Q(n_420), 
	.C(\angle_clk[13] ), 
	.B(\angle_clk[12] ), 
	.AN(n_1));
   OR4X0 p12463A (.Q(n_373), 
	.D(\angle_clk[18] ), 
	.C(\angle_clk[19] ), 
	.B(\angle_clk[16] ), 
	.A(\angle_clk[17] ));
   NO3X0 p12798A (.Q(n_415), 
	.C(\angle_clk[3] ), 
	.B(\angle_clk[2] ), 
	.A(\angle_clk[1] ));
   NO3I1X0 p12151A2120 (.Q(n_418), 
	.C(\angle_clk[21] ), 
	.B(\angle_clk[20] ), 
	.AN(n_0));
   OR4X0 p12082A (.Q(n_372), 
	.D(\angle_clk[10] ), 
	.C(\angle_clk[11] ), 
	.B(\angle_clk[8] ), 
	.A(\angle_clk[9] ));
   NO2X0 p12148A (.Q(n_2), 
	.B(\angle_clk[7] ), 
	.A(\angle_clk[6] ));
   NO2X0 p12284A (.Q(n_1), 
	.B(\angle_clk[15] ), 
	.A(\angle_clk[14] ));
   NA2I1X0 p13072A (.Q(n_376), 
	.B(\state[1] ), 
	.AN(\state[0] ));
   NO2X0 p12284A2121 (.Q(n_0), 
	.B(\angle_clk[23] ), 
	.A(\angle_clk[22] ));
endmodule

module timers_timer2_pdcf (
	timers_timer2_pdcf_reset_i_b, 
	timers_timer2_pdcf_clock_i, 
	timers_sfr_tcon2_dfp_i, 
	timers_timer2_pdcf_clkdiv_o, 
	DFT_sdi, 
	DFT_sen, 
	SPCASCAN_N9, 
	FE_PT1_top_p0_y_i_7_, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N7);
   input timers_timer2_pdcf_reset_i_b;
   input timers_timer2_pdcf_clock_i;
   input [2:0] timers_sfr_tcon2_dfp_i;
   output timers_timer2_pdcf_clkdiv_o;
   input DFT_sdi;
   input DFT_sen;
   output SPCASCAN_N9;
   input FE_PT1_top_p0_y_i_7_;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N7;

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
	.SD(timers_timer2_pdcf_clkdiv_o), 
	.Q(\contador[6] ), 
	.D(n_41), 
	.C(timers_timer2_pdcf_clock_i));
   NO2I1X0 p15205A (.Q(n_41), 
	.B(n_40), 
	.AN(timers_timer2_pdcf_reset_i_b));
   SDFRQX0 \contador_reg[5]  (.SE(DFT_sen), 
	.SD(\contador[6] ), 
	.Q(\contador[5] ), 
	.D(n_39), 
	.C(top_clock_i__L2_N12));
   AN22X0 p15034A (.Q(n_40), 
	.D(\contador[6] ), 
	.C(n_13), 
	.B(n_12), 
	.A(n_37));
   NO2I1X0 p15205A471 (.Q(n_39), 
	.B(n_38), 
	.AN(timers_timer2_pdcf_reset_i_b));
   AN22X0 p15034A472 (.Q(n_38), 
	.D(\contador[5] ), 
	.C(n_13), 
	.B(n_12), 
	.A(n_34));
   EN2X0 p39142A (.Q(n_37), 
	.B(\contador[6] ), 
	.A(n_33));
   SDFRQX0 \contador_reg[4]  (.SE(DFT_sen), 
	.SD(\contador[5] ), 
	.Q(SPCASCAN_N9), 
	.D(n_36), 
	.C(top_clock_i__L2_N11));
   NO2I1X0 p15205A474 (.Q(n_36), 
	.B(n_35), 
	.AN(timers_timer2_pdcf_reset_i_b));
   AN22X0 p15034A475 (.Q(n_35), 
	.D(SPCASCAN_N9), 
	.C(n_13), 
	.B(n_12), 
	.A(n_30));
   EN2X0 p39198A (.Q(n_34), 
	.B(\contador[5] ), 
	.A(n_29));
   SDFRQX0 \contador_reg[3]  (.SE(DFT_sen), 
	.SD(\contador[1] ), 
	.Q(\contador[3] ), 
	.D(n_32), 
	.C(timers_timer2_pdcf_clock_i));
   NA2I1X0 p38761A (.Q(n_33), 
	.B(\contador[5] ), 
	.AN(n_29));
   NO2I1X0 p15205A477 (.Q(n_32), 
	.B(n_31), 
	.AN(timers_timer2_pdcf_reset_i_b));
   AN22X0 p15034A478 (.Q(n_31), 
	.D(\contador[3] ), 
	.C(n_13), 
	.B(n_12), 
	.A(n_26));
   EN2X0 p39437A (.Q(n_30), 
	.B(SPCASCAN_N9), 
	.A(n_25));
   SDFRQX0 \contador_reg[2]  (.SE(DFT_sen), 
	.SD(FE_PT1_top_p0_y_i_7_), 
	.Q(\contador[2] ), 
	.D(n_28), 
	.C(top_clock_i__L2_N5));
   NA2I1X0 p38520A (.Q(n_29), 
	.B(SPCASCAN_N9), 
	.AN(n_25));
   NO2I1X0 p15205A480 (.Q(n_28), 
	.B(n_27), 
	.AN(timers_timer2_pdcf_reset_i_b));
   SDFRQX0 timers_timer2_pdcf_clkdiv_o_reg (.SE(DFT_sen), 
	.SD(\contador[3] ), 
	.Q(timers_timer2_pdcf_clkdiv_o), 
	.D(n_24), 
	.C(top_clock_i__L2_N11));
   AN22X0 p15034A482 (.Q(n_27), 
	.D(\contador[2] ), 
	.C(n_13), 
	.B(n_12), 
	.A(n_18));
   EN2X0 p39500A (.Q(n_26), 
	.B(\contador[3] ), 
	.A(n_17));
   SDFRQX0 \contador_reg[1]  (.SE(DFT_sen), 
	.SD(\contador[0] ), 
	.Q(\contador[1] ), 
	.D(n_23), 
	.C(top_clock_i__L2_N7));
   NA2I1X0 p38105A (.Q(n_25), 
	.B(\contador[3] ), 
	.AN(n_17));
   AO21X0 p14834A (.Q(n_24), 
	.C(n_22), 
	.B(timers_sfr_tcon2_dfp_i[1]), 
	.A(n_20));
   SDFRQX0 \contador_reg[0]  (.SE(DFT_sen), 
	.SD(\contador[2] ), 
	.Q(\contador[0] ), 
	.D(n_21), 
	.C(top_clock_i__L2_N11));
   NO2I1X0 p15205A485 (.Q(n_23), 
	.B(n_19), 
	.AN(timers_timer2_pdcf_reset_i_b));
   ON321X0 p14600A (.Q(n_22), 
	.F(n_16), 
	.E(n_14), 
	.D(n_8), 
	.C(n_3), 
	.B(n_10), 
	.A(timers_sfr_tcon2_dfp_i[1]));
   NO2I1X0 p15222A (.Q(n_21), 
	.B(n_15), 
	.AN(timers_timer2_pdcf_reset_i_b));
   ON321X0 p14786A (.Q(n_20), 
	.F(n_11), 
	.E(n_0), 
	.D(n_10), 
	.C(n_2), 
	.B(n_5), 
	.A(timers_sfr_tcon2_dfp_i[0]));
   AN22X0 p15034A486 (.Q(n_19), 
	.D(\contador[1] ), 
	.C(n_13), 
	.B(n_12), 
	.A(n_9));
   EN2X0 p39722A (.Q(n_18), 
	.B(\contador[2] ), 
	.A(n_7));
   NA2I1X0 p37850A (.Q(n_17), 
	.B(\contador[2] ), 
	.AN(n_7));
   AN32X0 p14492A (.Q(n_16), 
	.E(timers_timer2_pdcf_clkdiv_o), 
	.D(n_2), 
	.C(\contador[3] ), 
	.B(n_6), 
	.A(timers_timer2_pdcf_reset_i_b));
   EN2X0 p15037A (.Q(n_15), 
	.B(\contador[0] ), 
	.A(n_12));
   AN221X0 p14466A (.Q(n_14), 
	.E(n_6), 
	.D(n_1), 
	.C(\contador[1] ), 
	.B(\contador[0] ), 
	.A(n_4));
   INX0 Fp14997A (.Q(n_13), 
	.A(n_12));
   NA2I1X0 p14870A (.Q(n_12), 
	.B(n_6), 
	.AN(timers_sfr_tcon2_dfp_i[2]));
   NA3I1X0 p14534A (.Q(n_11), 
	.C(timers_sfr_tcon2_dfp_i[0]), 
	.B(\contador[2] ), 
	.AN(n_8));
   NA3X0 p14702A (.Q(n_10), 
	.C(timers_sfr_tcon2_dfp_i[2]), 
	.B(timers_sfr_tcon2_dfp_i[0]), 
	.A(timers_timer2_pdcf_reset_i_b));
   EO2X0 p39593A (.Q(n_9), 
	.B(\contador[1] ), 
	.A(\contador[0] ));
   NA2I1X0 p14378A (.Q(n_8), 
	.B(timers_timer2_pdcf_reset_i_b), 
	.AN(timers_sfr_tcon2_dfp_i[2]));
   NA2X0 p37572A (.Q(n_7), 
	.B(\contador[1] ), 
	.A(\contador[0] ));
   NO2X0 p14562A (.Q(n_6), 
	.B(timers_sfr_tcon2_dfp_i[1]), 
	.A(timers_sfr_tcon2_dfp_i[0]));
   NA2X0 p15022A (.Q(n_5), 
	.B(timers_sfr_tcon2_dfp_i[2]), 
	.A(\contador[5] ));
   INX0 Fp14431A (.Q(n_4), 
	.A(timers_sfr_tcon2_dfp_i[1]));
   INX0 Fp46074A (.Q(n_3), 
	.A(SPCASCAN_N9));
   INX0 Fp14329A489 (.Q(n_2), 
	.A(timers_timer2_pdcf_reset_i_b));
   INX0 Fp14527A (.Q(n_1), 
	.A(timers_sfr_tcon2_dfp_i[0]));
   INX0 Fp46662A (.Q(n_0), 
	.A(\contador[6] ));
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
	SPCASCAN_N9, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N9);
   input timers_timer2_pdf_enable_i;
   input timers_timer2_clock_i_b;
   input timers_timer2_pht_i;
   input timers_timer2_reset_i;
   input timers_sfr_tcon2_dfsel_i;
   input timers_sfr_tcon2_edsel_i;
   output timers_timer2_pdfoutput_o;
   input DFT_sen;
   input SPCASCAN_N9;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N9;

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
   wire n_20;
   wire n_21;
   wire n_31;
   wire \pdf_2sample[0] ;
   wire \pdf_2sample[1] ;
   wire \pdf_2sample[2] ;
   wire pdf_out;
   wire q_flop;

   SDFRX0 q_flop_reg (.SE(DFT_sen), 
	.SD(\pdf_2sample[2] ), 
	.QN(q_flop), 
	.Q(n_31), 
	.D(n_18), 
	.C(top_clock_i__L2_N11));
   SDFRQX2 timers_timer2_pdfoutput_o_reg (.SE(DFT_sen), 
	.SD(pdf_out), 
	.Q(timers_timer2_pdfoutput_o), 
	.D(n_21), 
	.C(timers_timer2_clock_i_b));
   NO2X0 p15969A (.Q(n_21), 
	.B(n_17), 
	.A(n_20));
   AN31X0 p15968A (.Q(n_20), 
	.D(n_19), 
	.C(pdf_out), 
	.B(timers_sfr_tcon2_edsel_i), 
	.A(q_flop));
   NO3X0 p15970A (.Q(n_19), 
	.C(q_flop), 
	.B(timers_sfr_tcon2_edsel_i), 
	.A(pdf_out));
   NO2I1X0 p15972A (.Q(n_18), 
	.B(n_17), 
	.AN(pdf_out));
   INX0 p15969A296 (.Q(n_17), 
	.A(timers_timer2_reset_i));
   SDFRQX0 \pdf_2sample_reg[0]  (.SE(DFT_sen), 
	.SD(\ff_sync[0] ), 
	.Q(\pdf_2sample[0] ), 
	.D(n_15), 
	.C(timers_timer2_clock_i_b));
   SDFRQX0 pdf_out_reg (.SE(DFT_sen), 
	.SD(n_31), 
	.Q(pdf_out), 
	.D(n_14), 
	.C(timers_timer2_clock_i_b));
   NO2I1X0 p15672A (.Q(n_15), 
	.B(n_13), 
	.AN(timers_timer2_reset_i));
   AO31X0 p15202A (.Q(n_14), 
	.D(n_12), 
	.C(pdf_out), 
	.B(n_11), 
	.A(timers_timer2_reset_i));
   MU2IX0 p33173A (.S(timers_timer2_pdf_enable_i), 
	.Q(n_13), 
	.IN1(\ff_sync[1] ), 
	.IN0(\pdf_2sample[0] ));
   SDFRQX0 \ff_sync_reg[1]  (.SE(DFT_sen), 
	.SD(SPCASCAN_N9), 
	.Q(\ff_sync[1] ), 
	.D(n_8), 
	.C(top_clock_i__L2_N9));
   SDFRQX0 \pdf_2sample_reg[1]  (.SE(DFT_sen), 
	.SD(\pdf_2sample[0] ), 
	.Q(\pdf_2sample[1] ), 
	.D(n_10), 
	.C(top_clock_i__L2_N3));
   SDFRQX0 \pdf_2sample_reg[2]  (.SE(DFT_sen), 
	.SD(\pdf_2sample[1] ), 
	.Q(\pdf_2sample[2] ), 
	.D(n_7), 
	.C(top_clock_i__L2_N11));
   AN211X0 p15216A (.Q(n_12), 
	.D(n_6), 
	.C(n_17), 
	.B(timers_sfr_tcon2_dfsel_i), 
	.A(n_0));
   AN31X0 p15221A (.Q(n_11), 
	.D(n_9), 
	.C(timers_timer2_pdf_enable_i), 
	.B(n_1), 
	.A(n_3));
   NO2I1X0 p15672A383 (.Q(n_10), 
	.B(n_4), 
	.AN(timers_timer2_reset_i));
   NO2X0 p15096A (.Q(n_9), 
	.B(n_3), 
	.A(n_6));
   AND2X0 p15697A (.Q(n_8), 
	.B(\ff_sync[0] ), 
	.A(timers_timer2_reset_i));
   NO2I1X0 p15672A384 (.Q(n_7), 
	.B(n_5), 
	.AN(timers_timer2_reset_i));
   SDFRQX0 \ff_sync_reg[0]  (.SE(DFT_sen), 
	.SD(\ff_sync[1] ), 
	.Q(\ff_sync[0] ), 
	.D(n_2), 
	.C(top_clock_i__L2_N6));
   NA3X0 p32349A (.Q(n_6), 
	.C(\pdf_2sample[0] ), 
	.B(\pdf_2sample[1] ), 
	.A(timers_timer2_pdf_enable_i));
   MU2IX0 p33173A386 (.S(timers_timer2_pdf_enable_i), 
	.Q(n_5), 
	.IN1(\pdf_2sample[1] ), 
	.IN0(\pdf_2sample[2] ));
   MU2IX0 p33173A387 (.S(timers_timer2_pdf_enable_i), 
	.Q(n_4), 
	.IN1(\pdf_2sample[0] ), 
	.IN0(\pdf_2sample[1] ));
   NA2X0 p15050A (.Q(n_3), 
	.B(timers_sfr_tcon2_dfsel_i), 
	.A(\pdf_2sample[2] ));
   AND2X0 p15696A (.Q(n_2), 
	.B(timers_timer2_pht_i), 
	.A(timers_timer2_reset_i));
   NO2X0 p39527A (.Q(n_1), 
	.B(\pdf_2sample[1] ), 
	.A(\pdf_2sample[0] ));
   INX0 Fp46523A (.Q(n_0), 
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
	top_timer2_sfr_tacpm_i, 
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
	DFT_sdi_2, 
	DFT_sdo_3, 
	FE_PT1_top_p0_y_i_7_, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N8, 
	top_clock_i__L2_N9);
   input top_timer2_reset_i;
   input top_timer2_clock_i_d;
   input top_timer2_pht_i;
   input [2:0] top_timer2_sfr_tcon2_dfp_i;
   input top_timer2_sfr_tcon2_dfsel_i;
   input top_timer2_sfr_tcon2_edsel_i;
   input [7:0] top_timer2_sfr_tacph_i;
   input [7:0] top_timer2_sfr_tacpm_i;
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
   input DFT_sdi_2;
   output DFT_sdo_3;
   input FE_PT1_top_p0_y_i_7_;
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N8;
   input top_clock_i__L2_N9;

   // Internal wires
   wire SPCASCAN_N9;
   wire pdcf_out_tmp;

   timers_timer2_acg top_acg (.timers_timer2_acg_clock_i(top_timer2_clock_i_d), 
	.timers_timer2_acg_reset_i_b(top_timer2_reset_i), 
	.timers_timer2_acg_pdf_pht_i(DFT_sdo_3), 
	.timers_sfr_tacpl_i({ top_timer2_sfr_tacpl_i[7],
		top_timer2_sfr_tacpl_i[6],
		top_timer2_sfr_tacpl_i[5],
		top_timer2_sfr_tacpl_i[4],
		top_timer2_sfr_tacpl_i[3],
		top_timer2_sfr_tacpl_i[2],
		top_timer2_sfr_tacpl_i[1],
		top_timer2_sfr_tacpl_i[0] }), 
	.timers_sfr_tacpm_i({ top_timer2_sfr_tacpm_i[7],
		top_timer2_sfr_tacpm_i[6],
		top_timer2_sfr_tacpm_i[5],
		top_timer2_sfr_tacpm_i[4],
		top_timer2_sfr_tacpm_i[3],
		top_timer2_sfr_tacpm_i[2],
		top_timer2_sfr_tacpm_i[1],
		top_timer2_sfr_tacpm_i[0] }), 
	.timers_sfr_tacph_i({ top_timer2_sfr_tacph_i[7],
		top_timer2_sfr_tacph_i[6],
		top_timer2_sfr_tacph_i[5],
		top_timer2_sfr_tacph_i[4],
		top_timer2_sfr_tacph_i[3],
		top_timer2_sfr_tacph_i[2],
		top_timer2_sfr_tacph_i[1],
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
	.DFT_sdi_2(DFT_sdi_2), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   timers_timer2_pdcf top_pdcf (.timers_timer2_pdcf_reset_i_b(top_timer2_reset_i), 
	.timers_timer2_pdcf_clock_i(top_clock_i__L2_N1), 
	.timers_sfr_tcon2_dfp_i({ top_timer2_sfr_tcon2_dfp_i[2],
		top_timer2_sfr_tcon2_dfp_i[1],
		top_timer2_sfr_tcon2_dfp_i[0] }), 
	.timers_timer2_pdcf_clkdiv_o(pdcf_out_tmp), 
	.DFT_sdi(top_timer2_sfr_tcon2_tf2_o), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N9(SPCASCAN_N9), 
	.FE_PT1_top_p0_y_i_7_(FE_PT1_top_p0_y_i_7_), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7));
   timers_timer2_pdf top_pdf (.timers_timer2_pdf_enable_i(pdcf_out_tmp), 
	.timers_timer2_clock_i_b(top_clock_i__L2_N1), 
	.timers_timer2_pht_i(top_timer2_pht_i), 
	.timers_timer2_reset_i(top_timer2_reset_i), 
	.timers_sfr_tcon2_dfsel_i(top_timer2_sfr_tcon2_dfsel_i), 
	.timers_sfr_tcon2_edsel_i(top_timer2_sfr_tcon2_edsel_i), 
	.timers_timer2_pdfoutput_o(DFT_sdo_3), 
	.DFT_sen(DFT_sen), 
	.SPCASCAN_N9(SPCASCAN_N9), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
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
	top_timers_sfr_tacpm_i, 
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
	DFT_sdi_5, 
	DFT_sdo_6, 
	SPCASCAN_N6, 
	FE_PT1_top_p0_y_i_4_, 
	FE_PT1_top_p0_y_i_7_, 
	top_clock_i__L2_N0, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N8, 
	top_clock_i__L2_N9);
   input top_timers_reset_i;
   input top_timers_clock_i;
   input top_timers_machine_cycle_i;
   input top_timers_pht_i;
   input [2:0] top_timers_sfr_tcon2_dfp_i;
   input top_timers_sfr_tcon2_dfsel_i;
   input top_timers_sfr_tcon2_edsel_i;
   input [7:0] top_timers_sfr_tacph_i;
   input [7:0] top_timers_sfr_tacpm_i;
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
   input DFT_sdi_5;
   output DFT_sdo_6;
   input SPCASCAN_N6;
   input FE_PT1_top_p0_y_i_4_;
   input FE_PT1_top_p0_y_i_7_;
   input top_clock_i__L2_N0;
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N8;
   input top_clock_i__L2_N9;

   // Internal wires
   wire n_85__L1_N0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_85;

   BUCX16 n_85__L1_I0 (.Q(n_85__L1_N0), 
	.A(n_85));
   timer0 dut_timer0 (.timers_clock_i(n_85__L1_N0), 
	.timers_reset_i_b(DFT_sdo_3), 
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
	.DFT_sdi_1(DFT_sdi_1), 
	.SPCASCAN_N6(SPCASCAN_N6), 
	.FE_PT1_top_p0_y_i_4_(FE_PT1_top_p0_y_i_4_));
   timer1 dut_timer1 (.timers_clock_i(n_85__L1_N0), 
	.timers_reset_i_b(DFT_sdo_3), 
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
	.DFT_sdi(top_timers_sfr_tm1_o[5]), 
	.DFT_sen(DFT_sen), 
	.FE_PT1__top_timers_sfr_tm0_o_7__(top_timers_sfr_tm0_o[7]));
   top_timer2 dut_timer2 (.top_timer2_reset_i(DFT_sdo_3), 
	.top_timer2_clock_i_d(top_clock_i__L2_N0), 
	.top_timer2_pht_i(top_timers_pht_i), 
	.top_timer2_sfr_tcon2_dfp_i({ top_timers_sfr_tcon2_dfp_i[2],
		top_timers_sfr_tcon2_dfp_i[1],
		top_timers_sfr_tcon2_dfp_i[0] }), 
	.top_timer2_sfr_tcon2_dfsel_i(top_timers_sfr_tcon2_dfsel_i), 
	.top_timer2_sfr_tcon2_edsel_i(top_timers_sfr_tcon2_edsel_i), 
	.top_timer2_sfr_tacph_i({ top_timers_sfr_tacph_i[7],
		top_timers_sfr_tacph_i[6],
		top_timers_sfr_tacph_i[5],
		top_timers_sfr_tacph_i[4],
		top_timers_sfr_tacph_i[3],
		top_timers_sfr_tacph_i[2],
		top_timers_sfr_tacph_i[1],
		top_timers_sfr_tacph_i[0] }), 
	.top_timer2_sfr_tacpm_i({ top_timers_sfr_tacpm_i[7],
		top_timers_sfr_tacpm_i[6],
		top_timers_sfr_tacpm_i[5],
		top_timers_sfr_tacpm_i[4],
		top_timers_sfr_tacpm_i[3],
		top_timers_sfr_tacpm_i[2],
		top_timers_sfr_tacpm_i[1],
		top_timers_sfr_tacpm_i[0] }), 
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
	.DFT_sdi(top_timers_sfr_tl1_o[0]), 
	.DFT_sen(DFT_sen), 
	.DFT_sdo(DFT_sdo), 
	.DFT_sdi_1(DFT_sdi_4), 
	.DFT_sdi_2(DFT_sdi_5), 
	.DFT_sdo_3(DFT_sdo_6), 
	.FE_PT1_top_p0_y_i_7_(FE_PT1_top_p0_y_i_7_), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   MU2X0 p214748365A (.S(DFT_in), 
	.Q(n_85), 
	.IN1(top_timers_clock_i), 
	.IN0(top_timers_machine_cycle_i));
   SDFFQX2 reset_aux_reg (.SE(DFT_sen), 
	.SD(DFT_sdi_2), 
	.Q(DFT_sdo_3), 
	.D(n_3), 
	.CN(top_clock_i__L2_N9));
   AO33X0 p15580AT (.Q(n_3), 
	.F(DFT_sdo_3), 
	.E(n_1), 
	.D(top_timers_reset_i), 
	.C(n_2), 
	.B(top_timers_machine_cycle_i), 
	.A(top_timers_reset_i));
   NA2X0 p15746A (.Q(n_2), 
	.B(top_timers_reset_i), 
	.A(n_1));
   INX0 Fp15747A38 (.Q(n_1), 
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
	SPCASCAN_N8, 
	SPCASCAN_N10, 
	top_clock_mem_i__L1_N1, 
	top_clock_mem_i__L1_N2, 
	top_clock_mem_i__L1_N3, 
	top_clock_mem_i__L1_N4, 
	top_clock_mem_i__L1_N5, 
	top_clock_mem_i__L1_N6, 
	top_clock_mem_i__L1_N7, 
	top_clock_mem_i__L1_N8, 
	top_clock_mem_i__L1_N9, 
	top_clock_i__L2_N0, 
	top_clock_i__L2_N1, 
	top_clock_i__L2_N10, 
	top_clock_i__L2_N11, 
	top_clock_i__L2_N12, 
	top_clock_i__L2_N2, 
	top_clock_i__L2_N3, 
	top_clock_i__L2_N4, 
	top_clock_i__L2_N5, 
	top_clock_i__L2_N6, 
	top_clock_i__L2_N7, 
	top_clock_i__L2_N8, 
	top_clock_i__L2_N9);
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
   output SPCASCAN_N8;
   output SPCASCAN_N10;
   input top_clock_mem_i__L1_N1;
   input top_clock_mem_i__L1_N2;
   input top_clock_mem_i__L1_N3;
   input top_clock_mem_i__L1_N4;
   input top_clock_mem_i__L1_N5;
   input top_clock_mem_i__L1_N6;
   input top_clock_mem_i__L1_N7;
   input top_clock_mem_i__L1_N8;
   input top_clock_mem_i__L1_N9;
   input top_clock_i__L2_N0;
   input top_clock_i__L2_N1;
   input top_clock_i__L2_N10;
   input top_clock_i__L2_N11;
   input top_clock_i__L2_N12;
   input top_clock_i__L2_N2;
   input top_clock_i__L2_N3;
   input top_clock_i__L2_N4;
   input top_clock_i__L2_N5;
   input top_clock_i__L2_N6;
   input top_clock_i__L2_N7;
   input top_clock_i__L2_N8;
   input top_clock_i__L2_N9;

   // Internal wires
   wire n_145__L1_N0;
   wire SPCASCAN_N6;
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
   wire \core_timers_tacph_o[2] ;
   wire \core_timers_tacph_o[3] ;
   wire \core_timers_tacph_o[4] ;
   wire \core_timers_tacph_o[5] ;
   wire \core_timers_tacph_o[6] ;
   wire \core_timers_tacph_o[7] ;
   wire \core_timers_tacpl_o[0] ;
   wire \core_timers_tacpl_o[1] ;
   wire \core_timers_tacpl_o[2] ;
   wire \core_timers_tacpl_o[3] ;
   wire \core_timers_tacpl_o[4] ;
   wire \core_timers_tacpl_o[5] ;
   wire \core_timers_tacpl_o[6] ;
   wire \core_timers_tacpl_o[7] ;
   wire \core_timers_tacpm_o[0] ;
   wire \core_timers_tacpm_o[1] ;
   wire \core_timers_tacpm_o[2] ;
   wire \core_timers_tacpm_o[3] ;
   wire \core_timers_tacpm_o[4] ;
   wire \core_timers_tacpm_o[5] ;
   wire \core_timers_tacpm_o[6] ;
   wire \core_timers_tacpm_o[7] ;
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
   wire n_151;
   wire n_155;
   wire n_156;
   wire n_163;
   wire n_169;
   wire n_170;
   wire n_202;
   wire n_205;
   wire n_214;
   wire n_218;
   wire n_222;
   wire n_226;
   wire n_230;
   wire n_234;
   wire n_242;
   wire n_246;
   wire n_254;
   wire n_258;
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

   BUCX16 n_145__L1_I0 (.Q(n_145__L1_N0), 
	.A(n_145));
   baud_rate BAUD_RATE_INSTANCE (.system_clk_i(top_clock_i__L2_N0), 
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
	.DFT_sdo(n_151), 
	.SPCASCAN_N1(SPCASCAN_N1), 
	.FE_PT1_top_p2_a_o_0_(top_p2_a_o[0]), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N2(top_clock_i__L2_N2), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8));
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
	.bus_control_core_p3en_6_i(\core_ports_p3en_o[6] ), 
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
   core CORE_INSTANCE (.core_clk_i(top_clock_i__L2_N0), 
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
		SPCASCAN_N8,
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
	.core_timers_tacph1_o({ \core_timers_tacph_o[7] ,
		\core_timers_tacph_o[6] ,
		\core_timers_tacph_o[5] ,
		\core_timers_tacph_o[4] ,
		\core_timers_tacph_o[3] ,
		\core_timers_tacph_o[2] ,
		\core_timers_tacph_o[1] ,
		\core_timers_tacph_o[0]  }), 
	.core_timers_tacph0_o({ \core_timers_tacpm_o[7] ,
		\core_timers_tacpm_o[6] ,
		\core_timers_tacpm_o[5] ,
		\core_timers_tacpm_o[4] ,
		\core_timers_tacpm_o[3] ,
		\core_timers_tacpm_o[2] ,
		\core_timers_tacpm_o[1] ,
		\core_timers_tacpm_o[0]  }), 
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
		SPCASCAN_N10 }), 
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
		\core_ports_p3en_o[6] ,
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
	.DFT_sdi(n_151), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_202), 
	.DFT_sdi_1(top_p0_y_i[1]), 
	.DFT_sdo_2(n_155), 
	.DFT_sdi_3(top_p0_y_i[5]), 
	.DFT_sdo_4(n_169), 
	.DFT_sdi_5(top_p1_y_i[0]), 
	.DFT_sdo_6(n_258), 
	.DFT_sdi_7(\core_interrupt_tcon_o[1] ), 
	.DFT_sdi_8(top_p1_y_i[2]), 
	.DFT_sdi_9(top_p1_y_i[3]), 
	.DFT_sdi_10(top_p1_y_i[4]), 
	.DFT_sdo_11(n_214), 
	.DFT_sdi_12(core_timers_edgsel_o), 
	.DFT_sdo_13(n_218), 
	.DFT_sdi_14(top_p4_a_o[6]), 
	.DFT_sdo_15(n_222), 
	.DFT_sdi_16(\core_ports_p2en_o[7] ), 
	.DFT_sdo_17(n_226), 
	.SPCASCAN_N0(SPCASCAN_N0), 
	.FE_PT1_top_p4_a_o_5_(top_p4_a_o[5]), 
	.FE_PT1_top_p3_en_o_5_(top_p3_en_o[5]), 
	.FE_PT1_top_p3_en_o_4_(top_p3_en_o[4]), 
	.FE_PT1_top_p3_en_o_3_(top_p3_en_o[3]), 
	.FE_PT1_top_p3_en_o_2_(top_p3_en_o[2]), 
	.FE_PT1_top_p3_en_o_1_(top_p3_en_o[1]), 
	.FE_PT1_top_p3_en_o_0_(top_p3_en_o[0]), 
	.top_clock_mem_i__L1_N1(top_clock_mem_i__L1_N1), 
	.top_clock_mem_i__L1_N2(top_clock_mem_i__L1_N2), 
	.top_clock_mem_i__L1_N3(top_clock_mem_i__L1_N3), 
	.top_clock_mem_i__L1_N4(top_clock_mem_i__L1_N4), 
	.top_clock_mem_i__L1_N5(top_clock_mem_i__L1_N5), 
	.top_clock_mem_i__L1_N6(top_clock_mem_i__L1_N6), 
	.top_clock_mem_i__L1_N7(top_clock_mem_i__L1_N7), 
	.top_clock_mem_i__L1_N8(top_clock_mem_i__L1_N8), 
	.top_clock_mem_i__L1_N9(top_clock_mem_i__L1_N9), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N2(top_clock_i__L2_N2), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8));
   INTERRUPT INTERRUPT_INSTANCE (.int_intx_b_i({ top_p3_a_o[3],
		top_p3_a_o[2] }), 
	.int_rst_sync_b_i(core_reset_o), 
	.clk(top_clock_i__L2_N0), 
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
	.DFT_sdi(n_155), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_156), 
	.DFT_sdi_1(n_169), 
	.DFT_sdo_2(n_170), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
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
   serial_top SERIAL_INSTANCE (.serial_clock_i(top_clock_i__L2_N0), 
	.serial_reset_i_b(core_reset_o), 
	.serial_br_i(baud_rate_br_o), 
	.serial_br_trans_i(n_145__L1_N0), 
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
	.DFT_sdi(n_156), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdo(n_230), 
	.DFT_sdi_1(top_p0_y_i[2]), 
	.DFT_sdo_2(n_234), 
	.DFT_sdi_3(top_p0_y_i[3]), 
	.DFT_sdo_4(n_163), 
	.SPCASCAN_N2(SPCASCAN_N2), 
	.FE_PT1_top_p2_a_o_2_(top_p2_a_o[2]), 
	.SPCASCAN_N6(SPCASCAN_N6), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   top_timers TIMERS_INSTANCE (.top_timers_reset_i(core_reset_o), 
	.top_timers_clock_i(top_clock_i), 
	.top_timers_machine_cycle_i(top_cycle_machine), 
	.top_timers_pht_i(top_pht_i), 
	.top_timers_sfr_tcon2_dfp_i({ \core_timers_dfp_o[2] ,
		\core_timers_dfp_o[1] ,
		SPCASCAN_N10 }), 
	.top_timers_sfr_tcon2_dfsel_i(core_timers_dfsel_o), 
	.top_timers_sfr_tcon2_edsel_i(core_timers_edgsel_o), 
	.top_timers_sfr_tacph_i({ \core_timers_tacph_o[7] ,
		\core_timers_tacph_o[6] ,
		\core_timers_tacph_o[5] ,
		\core_timers_tacph_o[4] ,
		\core_timers_tacph_o[3] ,
		\core_timers_tacph_o[2] ,
		\core_timers_tacph_o[1] ,
		\core_timers_tacph_o[0]  }), 
	.top_timers_sfr_tacpm_i({ \core_timers_tacpm_o[7] ,
		\core_timers_tacpm_o[6] ,
		\core_timers_tacpm_o[5] ,
		\core_timers_tacpm_o[4] ,
		\core_timers_tacpm_o[3] ,
		\core_timers_tacpm_o[2] ,
		\core_timers_tacpm_o[1] ,
		\core_timers_tacpm_o[0]  }), 
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
		SPCASCAN_N8,
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
	.DFT_sdi(\top_timers_sfr_tl0_o[3] ), 
	.DFT_sen(top_scan_enable_b_i), 
	.DFT_sdi_1(\top_timers_sfr_tm0_o[5] ), 
	.DFT_sdo(n_242), 
	.DFT_sdi_2(n_170), 
	.DFT_sdo_3(n_246), 
	.DFT_sdi_4(top_p0_y_i[6]), 
	.DFT_sdi_5(top_p2_a_o[7]), 
	.DFT_sdo_6(n_254), 
	.SPCASCAN_N6(SPCASCAN_N6), 
	.FE_PT1_top_p0_y_i_4_(top_p0_y_i[4]), 
	.FE_PT1_top_p0_y_i_7_(top_p0_y_i[7]), 
	.top_clock_i__L2_N0(top_clock_i__L2_N0), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
   INX4 p214748365A95 (.Q(top_p3_en_o[7]), 
	.A(\core_ports_p3en_o[7] ));
   INX1 p214748365A96 (.Q(top_p3_en_o[3]), 
	.A(\core_ports_p3en_o[3] ));
   INX4 p214748365A97 (.Q(top_p3_en_o[2]), 
	.A(\core_ports_p3en_o[2] ));
   INX4 p214748365A99 (.Q(top_p3_en_o[6]), 
	.A(\core_ports_p3en_o[6] ));
   INX1 p214748365A100 (.Q(top_p3_en_o[1]), 
	.A(\core_ports_p3en_o[1] ));
   INX1 p214748365A101 (.Q(top_p3_en_o[0]), 
	.A(\core_ports_p3en_o[0] ));
   INX4 p214748365A102 (.Q(top_p3_en_o[5]), 
	.A(\core_ports_p3en_o[5] ));
   INX4 p214748365A103 (.Q(top_p3_en_o[4]), 
	.A(\core_ports_p3en_o[4] ));
   MU2X0 p214748365A174 (.S(top_test_mode_i), 
	.Q(n_145), 
	.IN1(top_clock_i), 
	.IN0(n_144));
   AO22X0 DFT_shared_out_mux_0 (.Q(top_p2_a_o[0]), 
	.D(top_scan_enable_b_i), 
	.C(n_202), 
	.B(n_205), 
	.A(\bus_control_p2_o[0] ));
   AO22X1 DFT_shared_out_mux_1 (.Q(top_p4_a_o[2]), 
	.D(top_scan_enable_b_i), 
	.C(core_baudrate_sm2_o), 
	.B(n_205), 
	.A(\bus_control_p4_o[2] ));
   AO22X0 DFT_shared_out_mux_2 (.Q(top_p4_a_o[3]), 
	.D(top_scan_enable_b_i), 
	.C(\core_interrupt_ip_o[0] ), 
	.B(n_205), 
	.A(\bus_control_p4_o[3] ));
   AO22X0 DFT_shared_out_mux_3 (.Q(top_p4_a_o[4]), 
	.D(top_scan_enable_b_i), 
	.C(n_214), 
	.B(n_205), 
	.A(\bus_control_p4_o[4] ));
   AO22X0 DFT_shared_out_mux_4 (.Q(top_p4_a_o[5]), 
	.D(top_scan_enable_b_i), 
	.C(n_218), 
	.B(n_205), 
	.A(\bus_control_p4_o[5] ));
   AO22X4 DFT_shared_out_mux_5 (.Q(top_p4_a_o[6]), 
	.D(top_scan_enable_b_i), 
	.C(n_222), 
	.B(n_205), 
	.A(\bus_control_p4_o[6] ));
   AO22X1 DFT_shared_out_mux_6 (.Q(top_p4_a_o[7]), 
	.D(top_scan_enable_b_i), 
	.C(n_226), 
	.B(n_205), 
	.A(\bus_control_p4_o[7] ));
   AO22X0 DFT_shared_out_mux_7 (.Q(top_p2_a_o[1]), 
	.D(top_scan_enable_b_i), 
	.C(n_230), 
	.B(n_205), 
	.A(\bus_control_p2_o[1] ));
   AO22X0 DFT_shared_out_mux_8 (.Q(top_p2_a_o[2]), 
	.D(top_scan_enable_b_i), 
	.C(n_234), 
	.B(n_205), 
	.A(\bus_control_p2_o[2] ));
   AO22X0 DFT_shared_out_mux_9 (.Q(top_p2_a_o[3]), 
	.D(top_scan_enable_b_i), 
	.C(\top_timers_sfr_tm0_o[3] ), 
	.B(n_205), 
	.A(\bus_control_p2_o[3] ));
   AO22X0 DFT_shared_out_mux_10 (.Q(top_p2_a_o[4]), 
	.D(top_scan_enable_b_i), 
	.C(n_242), 
	.B(n_205), 
	.A(\bus_control_p2_o[4] ));
   AO22X0 DFT_shared_out_mux_11 (.Q(top_p2_a_o[5]), 
	.D(top_scan_enable_b_i), 
	.C(n_246), 
	.B(n_205), 
	.A(\bus_control_p2_o[5] ));
   AO22X0 DFT_shared_out_mux_12 (.Q(top_p2_a_o[6]), 
	.D(top_scan_enable_b_i), 
	.C(\top_timers_sfr_acrh_o[0] ), 
	.B(n_205), 
	.A(\bus_control_p2_o[6] ));
   AO22X0 DFT_shared_out_mux_13 (.Q(top_p2_a_o[7]), 
	.D(top_scan_enable_b_i), 
	.C(n_254), 
	.B(n_205), 
	.A(\bus_control_p2_o[7] ));
   AO22X1 DFT_shared_out_mux_14 (.Q(top_p4_a_o[0]), 
	.D(top_scan_enable_b_i), 
	.C(n_258), 
	.B(n_205), 
	.A(\bus_control_p4_o[0] ));
   AO22X1 DFT_shared_out_mux_15 (.Q(top_p4_a_o[1]), 
	.D(top_scan_enable_b_i), 
	.C(\core_timers_tl1_o[2] ), 
	.B(n_205), 
	.A(\bus_control_p4_o[1] ));
   INX2 DFT_shared_out_mux_16 (.Q(n_205), 
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
   wire top_clock_i__L2_N12;
   wire top_clock_i__L2_N11;
   wire top_clock_i__L2_N10;
   wire top_clock_i__L2_N9;
   wire top_clock_i__L2_N8;
   wire top_clock_i__L2_N7;
   wire top_clock_i__L2_N6;
   wire top_clock_i__L2_N5;
   wire top_clock_i__L2_N4;
   wire top_clock_i__L2_N3;
   wire top_clock_i__L2_N2;
   wire top_clock_i__L2_N1;
   wire top_clock_i__L2_N0;
   wire top_clock_i__L1_N0;
   wire top_clock_mem_i__L1_N9;
   wire top_clock_mem_i__L1_N8;
   wire top_clock_mem_i__L1_N7;
   wire top_clock_mem_i__L1_N6;
   wire top_clock_mem_i__L1_N5;
   wire top_clock_mem_i__L1_N4;
   wire top_clock_mem_i__L1_N3;
   wire top_clock_mem_i__L1_N2;
   wire top_clock_mem_i__L1_N1;
   wire top_clock_mem_i__L1_N0;
   wire SPCASCAN_N10;
   wire SPCASCAN_N8;
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

   INCX20 top_clock_i__L2_I12 (.Q(top_clock_i__L2_N12), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I11 (.Q(top_clock_i__L2_N11), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I10 (.Q(top_clock_i__L2_N10), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I9 (.Q(top_clock_i__L2_N9), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I8 (.Q(top_clock_i__L2_N8), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I7 (.Q(top_clock_i__L2_N7), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I6 (.Q(top_clock_i__L2_N6), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I5 (.Q(top_clock_i__L2_N5), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I4 (.Q(top_clock_i__L2_N4), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I3 (.Q(top_clock_i__L2_N3), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I2 (.Q(top_clock_i__L2_N2), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I1 (.Q(top_clock_i__L2_N1), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L2_I0 (.Q(top_clock_i__L2_N0), 
	.A(top_clock_i__L1_N0));
   INCX20 top_clock_i__L1_I0 (.Q(top_clock_i__L1_N0), 
	.A(top_clock_i));
   BUCX4 top_clock_mem_i__L1_I9 (.Q(top_clock_mem_i__L1_N9), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I8 (.Q(top_clock_mem_i__L1_N8), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I7 (.Q(top_clock_mem_i__L1_N7), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I6 (.Q(top_clock_mem_i__L1_N6), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I5 (.Q(top_clock_mem_i__L1_N5), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I4 (.Q(top_clock_mem_i__L1_N4), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I3 (.Q(top_clock_mem_i__L1_N3), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I2 (.Q(top_clock_mem_i__L1_N2), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I1 (.Q(top_clock_mem_i__L1_N1), 
	.A(top_clock_mem_i));
   BUCX4 top_clock_mem_i__L1_I0 (.Q(top_clock_mem_i__L1_N0), 
	.A(top_clock_mem_i));
   emc_top EMC_TOP_INSTANCE (.top_clock_i(top_clock_i), 
	.top_clock_mem_i(top_clock_mem_i__L1_N0), 
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
	.SPCASCAN_N8(SPCASCAN_N8), 
	.SPCASCAN_N10(SPCASCAN_N10), 
	.top_clock_mem_i__L1_N1(top_clock_mem_i__L1_N1), 
	.top_clock_mem_i__L1_N2(top_clock_mem_i__L1_N2), 
	.top_clock_mem_i__L1_N3(top_clock_mem_i__L1_N3), 
	.top_clock_mem_i__L1_N4(top_clock_mem_i__L1_N4), 
	.top_clock_mem_i__L1_N5(top_clock_mem_i__L1_N5), 
	.top_clock_mem_i__L1_N6(top_clock_mem_i__L1_N6), 
	.top_clock_mem_i__L1_N7(top_clock_mem_i__L1_N7), 
	.top_clock_mem_i__L1_N8(top_clock_mem_i__L1_N8), 
	.top_clock_mem_i__L1_N9(top_clock_mem_i__L1_N9), 
	.top_clock_i__L2_N0(top_clock_i__L2_N0), 
	.top_clock_i__L2_N1(top_clock_i__L2_N1), 
	.top_clock_i__L2_N10(top_clock_i__L2_N10), 
	.top_clock_i__L2_N11(top_clock_i__L2_N11), 
	.top_clock_i__L2_N12(top_clock_i__L2_N12), 
	.top_clock_i__L2_N2(top_clock_i__L2_N2), 
	.top_clock_i__L2_N3(top_clock_i__L2_N3), 
	.top_clock_i__L2_N4(top_clock_i__L2_N4), 
	.top_clock_i__L2_N5(top_clock_i__L2_N5), 
	.top_clock_i__L2_N6(top_clock_i__L2_N6), 
	.top_clock_i__L2_N7(top_clock_i__L2_N7), 
	.top_clock_i__L2_N8(top_clock_i__L2_N8), 
	.top_clock_i__L2_N9(top_clock_i__L2_N9));
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
	.top_p2_a_i({ SPCASCAN_N8,
		top_p2_a_o[6],
		top_p2_a_o[5],
		top_p2_a_o[4],
		top_p2_a_o[3],
		SPCASCAN_N2,
		top_p2_a_o[1],
		SPCASCAN_N1 }), 
	.top_p3_a_i({ top_p3_a_o[7],
		top_p3_a_o[6],
		top_p3_a_o[5],
		top_p3_a_o[4],
		top_p3_a_o[3],
		top_p3_a_o[2],
		top_p3_a_o[1],
		top_p3_a_o[0] }), 
	.top_p4_a_i({ top_p4_a_o[7],
		SPCASCAN_N0,
		SPCASCAN_N10,
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

