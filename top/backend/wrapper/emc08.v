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
               PSEN_B
               );

input          CLOCK;
input          CLOCK_MEM;
input          RESET_B;
inout    [7:0] P0;
inout    [7:0] P1;
inout    [7:0] P2;
inout    [7:0] P3;
output   [7:0] P4;
input          PHT;
input          EA_B;
input          SE_B;
input          TM;
output         PSEN_B;

wire        top_clock_i;
wire        top_clock_mem_i;
wire        top_reset_i;
wire  [7:0] top_p0_y_i;
wire  [7:0] top_p1_y_i;
wire  [7:0] top_p2_y_i;
wire  [7:0] top_p3_y_i;
wire  [7:0] top_p0_en_o;
wire  [7:0] top_p1_en_o;
wire  [7:0] top_p2_en_o;
wire  [7:0] top_p3_en_o;
wire  [7:0] top_p0_a_o;
wire  [7:0] top_p1_a_o;
wire  [7:0] top_p2_a_o;
wire  [7:0] top_p3_a_o;
wire  [7:0] top_p4_a_o;
wire        top_ea_b_i;
wire        top_pht_i;
wire        top_test_mode_i;
wire        top_psen_b_o;

emc_top EMC_TOP_INSTANCE (
      .top_clock_i(top_clock_i), 
      .top_clock_mem_i(top_clock_mem_i), 
      .top_reset_i(top_reset_i), 
      .top_p0_y_i(top_p0_y_i), 
      .top_p1_y_i(top_p1_y_i), 
      .top_p2_y_i(top_p2_y_i), 
      .top_p3_y_i(top_p3_y_i), 
      .top_p0_en_o(top_p0_en_o), 
      .top_p1_en_o(top_p1_en_o), 
      .top_p2_en_o(top_p2_en_o), 
      .top_p3_en_o(top_p3_en_o), 
      .top_p0_a_o(top_p0_a_o), 
      .top_p1_a_o(top_p1_a_o), 
      .top_p2_a_o(top_p2_a_o), 
      .top_p3_a_o(top_p3_a_o), 
      .top_p4_a_o(top_p4_a_o), 
      .top_pht_i(top_pht_i), 
      .top_ea_b_i(top_ea_b_i), 
      .top_psen_b_o(top_psen_b_o)
   );


emc_pads EMC_PADS_INSTANCE(
      .pads_clock_i(CLOCK),
      .pads_clock_mem_i(CLOCK_MEM),
      .pads_reset_i(RESET_B),
      .pads_p0_io(P0),
      .pads_p1_io(P1),
      .pads_p2_io(P2),
      .pads_p3_io(P3),
      .pads_p4_o(P4),
      .pads_pht_i(PHT),
      .pads_ea_b_i(EA_B),
      .pads_se_b_i(SE_B),
      .pads_tm_i(TM),
      .pads_psen_b_o(PSEN_B),

      .top_clock_o(top_clock_i),      
      .top_clock_mem_o(top_clock_mem_i),
      .top_reset_o(top_reset_i),
      .top_p0_y_o(top_p0_y_i),
      .top_p1_y_o(top_p1_y_i),
      .top_p2_y_o(top_p2_y_i),
      .top_p3_y_o(top_p3_y_i),
      .top_p0_en_i(top_p0_en_o),
      .top_p1_en_i(top_p1_en_o),
      .top_p2_en_i(top_p2_en_o),
      .top_p3_en_i(top_p3_en_o),
      .top_p0_a_i(top_p0_a_o),
      .top_p1_a_i(top_p1_a_o),
      .top_p2_a_i(top_p2_a_o),
      .top_p3_a_i(top_p3_a_o),
      .top_p4_a_i(top_p4_a_o),
      .top_pht_o(top_pht_i),
      .top_ea_b_o(top_ea_b_i),
      .top_scan_enable_b_o(top_se_b_i),
      .top_psen_b_i(top_psen_b_o),
      .top_test_mode_o(top_test_mode_i)
   );

endmodule
