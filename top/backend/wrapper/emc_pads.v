module   emc_pads (
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
                  top_psen_b_i
   );

input          pads_clock_i;
input          pads_clock_mem_i;
input          pads_reset_i;
inout    [7:0] pads_p0_io;
inout    [7:0] pads_p1_io;
inout    [7:0] pads_p2_io;
inout    [7:0] pads_p3_io;
output   [7:0] pads_p4_o;
input          pads_pht_i;
input          pads_ea_b_i;
input          pads_se_b_i;
input          pads_tm_i;
output         pads_psen_b_o;

output         top_clock_o;
output         top_clock_mem_o;
output         top_reset_o;
output   [7:0] top_p0_y_o;
output   [7:0] top_p1_y_o;
output   [7:0] top_p2_y_o;
output   [7:0] top_p3_y_o;
input    [7:0] top_p0_en_i;
input    [7:0] top_p1_en_i;
input    [7:0] top_p2_en_i;
input    [7:0] top_p3_en_i;
input    [7:0] top_p0_a_i;
input    [7:0] top_p1_a_i;
input    [7:0] top_p2_a_i;
input    [7:0] top_p3_a_i;
input    [7:0] top_p4_a_i;
output         top_pht_o;
output         top_ea_b_o;
output         top_scan_enable_b_o;
output         top_test_mode_o;
input          top_psen_b_i;

ICUDP       P_CLOCK  (
                     .PAD(pads_clock_i),
                     .PDEN(1'b1),
                     .PI(1'b0),
                     .PUEN(1'b0),
                     .Y(top_clock_o)
                     );

ICUDP       P_CLOCK_MEM (
                        .PAD(pads_clock_mem_i),
                        .PDEN(1'b1),
                        .PI(1'b0),
                        .PUEN(1'b0),
                        .Y(top_clock_mem_o)
                        );

ICUDP       P_RESET (
                        .PAD(pads_reset_i),
                        .PDEN(1'b1),
                        .PI(1'b0),
                        .PUEN(1'b0),
                        .Y(top_reset_o)
                        );

BBCUD8P P_PORT0_0 (
                  .A(top_p0_a_i[0]),
                  .EN(top_p0_en_i[0]),
                  .PAD(pads_p0_io[0]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[0])
                  );

BBCUD8P P_PORT0_1 (
                  .A(top_p0_a_i[1]),
                  .EN(top_p0_en_i[1]),
                  .PAD(pads_p0_io[1]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[1])
                  );

BBCUD8P P_PORT0_2 (
                  .A(top_p0_a_i[2]),
                  .EN(top_p0_en_i[2]),
                  .PAD(pads_p0_io[2]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[2])
                  );

BBCUD8P P_PORT0_3 (
                  .A(top_p0_a_i[3]),
                  .EN(top_p0_en_i[3]),
                  .PAD(pads_p0_io[3]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[3])
                  );

BBCUD8P P_PORT0_4 (
                  .A(top_p0_a_i[4]),
                  .EN(top_p0_en_i[4]),
                  .PAD(pads_p0_io[4]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[4])
                  );

BBCUD8P P_PORT0_5 (
                  .A(top_p0_a_i[5]),
                  .EN(top_p0_en_i[5]),
                  .PAD(pads_p0_io[5]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[5])
                  );

BBCUD8P P_PORT0_6 (
                  .A(top_p0_a_i[6]),
                  .EN(top_p0_en_i[6]),
                  .PAD(pads_p0_io[6]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[6])
                  );

BBCUD8P P_PORT0_7 (
                  .A(top_p0_a_i[7]),
                  .EN(top_p0_en_i[7]),
                  .PAD(pads_p0_io[7]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p0_y_o[7])
                  );


BBCUD8P P_PORT1_0 (
                  .A(top_p1_a_i[0]),
                  .EN(top_p1_en_i[0]),
                  .PAD(pads_p1_io[0]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[0])
                  );

BBCUD8P P_PORT1_1 (
                  .A(top_p1_a_i[1]),
                  .EN(top_p1_en_i[1]),
                  .PAD(pads_p1_io[1]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[1])
                  );

BBCUD8P P_PORT1_2 (
                  .A(top_p1_a_i[2]),
                  .EN(top_p1_en_i[2]),
                  .PAD(pads_p1_io[2]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[2])
                  );

BBCUD8P P_PORT1_3 (
                  .A(top_p1_a_i[3]),
                  .EN(top_p1_en_i[3]),
                  .PAD(pads_p1_io[3]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[3])
                  );

BBCUD8P P_PORT1_4 (
                  .A(top_p1_a_i[4]),
                  .EN(top_p1_en_i[4]),
                  .PAD(pads_p1_io[4]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[4])
                  );

BBCUD8P P_PORT1_5 (
                  .A(top_p1_a_i[5]),
                  .EN(top_p1_en_i[5]),
                  .PAD(pads_p1_io[5]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[5])
                  );

BBCUD8P P_PORT1_6 (
                  .A(top_p1_a_i[6]),
                  .EN(top_p1_en_i[6]),
                  .PAD(pads_p1_io[6]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[6])
                  );

BBCUD8P P_PORT1_7 (
                  .A(top_p1_a_i[7]),
                  .EN(top_p1_en_i[7]),
                  .PAD(pads_p1_io[7]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p1_y_o[7])
                  );


BBCUD8P P_PORT2_0 (
                  .A(top_p2_a_i[0]),
                  .EN(top_p2_en_i[0]),
                  .PAD(pads_p2_io[0]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[0])
                  );

BBCUD8P P_PORT2_1 (
                  .A(top_p2_a_i[1]),
                  .EN(top_p2_en_i[1]),
                  .PAD(pads_p2_io[1]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[1])
                  );

BBCUD8P P_PORT2_2 (
                  .A(top_p2_a_i[2]),
                  .EN(top_p2_en_i[2]),
                  .PAD(pads_p2_io[2]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[2])
                  );

BBCUD8P P_PORT2_3 (
                  .A(top_p2_a_i[3]),
                  .EN(top_p2_en_i[3]),
                  .PAD(pads_p2_io[3]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[3])
                  );

BBCUD8P P_PORT2_4 (
                  .A(top_p2_a_i[4]),
                  .EN(top_p2_en_i[4]),
                  .PAD(pads_p2_io[4]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[4])
                  );

BBCUD8P P_PORT2_5 (
                  .A(top_p2_a_i[5]),
                  .EN(top_p2_en_i[5]),
                  .PAD(pads_p2_io[5]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[5])
                  );

BBCUD8P P_PORT2_6 (
                  .A(top_p2_a_i[6]),
                  .EN(top_p2_en_i[6]),
                  .PAD(pads_p2_io[6]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[6])
                  );

BBCUD8P P_PORT2_7 (
                  .A(top_p2_a_i[7]),
                  .EN(top_p2_en_i[7]),
                  .PAD(pads_p2_io[7]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p2_y_o[7])
                  );


BBCUD8P P_PORT3_0 (
                  .A(top_p3_a_i[0]),
                  .EN(top_p3_en_i[0]),
                  .PAD(pads_p3_io[0]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[0])
                  );

BBCUD8P P_PORT3_1 (
                  .A(top_p3_a_i[1]),
                  .EN(top_p3_en_i[1]),
                  .PAD(pads_p3_io[1]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[1])
                  );

BBCUD8P P_PORT3_2 (
                  .A(top_p3_a_i[2]),
                  .EN(top_p3_en_i[2]),
                  .PAD(pads_p3_io[2]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[2])
                  );

BBCUD8P P_PORT3_3 (
                  .A(top_p3_a_i[3]),
                  .EN(top_p3_en_i[3]),
                  .PAD(pads_p3_io[3]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[3])
                  );

BBCUD8P P_PORT3_4 (
                  .A(top_p3_a_i[4]),
                  .EN(top_p3_en_i[4]),
                  .PAD(pads_p3_io[4]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[4])
                  );

BBCUD8P P_PORT3_5 (
                  .A(top_p3_a_i[5]),
                  .EN(top_p3_en_i[5]),
                  .PAD(pads_p3_io[5]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[5])
                  );

BBCUD8P P_PORT3_6 (
                  .A(top_p3_a_i[6]),
                  .EN(top_p3_en_i[6]),
                  .PAD(pads_p3_io[6]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[6])
                  );

BBCUD8P P_PORT3_7 (
                  .A(top_p3_a_i[7]),
                  .EN(top_p3_en_i[7]),
                  .PAD(pads_p3_io[7]),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_p3_y_o[7])
                  );

BD8P     P_PORT4_0  (
                    .A(top_p4_a_i[0]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[0])
                    );

BD8P     P_PORT4_1  (
                    .A(top_p4_a_i[1]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[1])
                    );

BD8P     P_PORT4_2  (
                    .A(top_p4_a_i[2]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[2])
                    );

BD8P     P_PORT4_3  (
                    .A(top_p4_a_i[3]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[3])
                    );

BD8P     P_PORT4_4  (
                    .A(top_p4_a_i[4]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[4])
                    );

BD8P     P_PORT4_5  (
                    .A(top_p4_a_i[5]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[5])
                    );

BD8P     P_PORT4_6  (
                    .A(top_p4_a_i[6]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[6])
                    );

BD8P     P_PORT4_7  (
                    .A(top_p4_a_i[7]),
                    .EN(1'b0),
                    .PAD(pads_p4_o[7])
                    );

ICUDP    P_PHT (
               .PAD(pads_pht_i),
               .PDEN(1'b1),
               .PI(1'b0),
               .PUEN(1'b0),
               .Y(top_pht_o)
               );

ICUDP    P_EA_B   (
                  .PAD(pads_ea_b_i),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_ea_b_o)
                  );

ICUDP       P_SE_B (
                  .PAD(pads_se_b_i),
                  .PDEN(1'b1),
                  .PI(1'b0),
                  .PUEN(1'b0),
                  .Y(top_scan_enable_b_o)
                  );

ICUDP       P_TEST_MODE (
                        .PAD(pads_tm_i),
                        .PDEN(1'b1),
                        .PI(1'b0),
                        .PUEN(1'b0),
                        .Y(top_test_mode_o)
                        );

BD8P     P_PSEN_B (
                  .A(top_psen_b_i),
                  .EN(1'b0),
                  .PAD(pads_psen_b_o)
                  );

GNDORPADP   P_GND_0();

GNDORPADP   P_GND_1();

VDDORPADP   P_VDD_3_3V();

VDDPADP     P_VDD_1_8V_0();

CORNERP     P_CORNER_NE();

CORNERP     P_CORNER_NW();

CORNERP     P_CORNER_SE();

CORNERP     P_CORNER_SW();

endmodule
