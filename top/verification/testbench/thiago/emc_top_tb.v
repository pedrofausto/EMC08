// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name: emc_top_tb.v
// Module Name: top
// Author: Vinicius
// E-mail: correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 19/09/2010 Initial version
// -----------------------------------------------------------------------------
// Description
// This file is a simple testbench for emc08 microcontroller.
// -----------------------------------------------------------------------------

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v" 
`include "/home/student/EMC08/digital_A/top/verification/testbench/thiago/SPRAM128X8.v" 
`include "/home/student/EMC08/digital_A/top/verification/testbench/thiago/ROM4096X8.v" 



module emc_top_tb;

   // common reg  s
   reg           top_clock_i;
   reg           top_clock_mem_i;
   reg           top_reset_i;
   
   // PAD control signals
   reg     [7:0] top_p0_y_i;
   reg     [7:0] top_p1_y_i;
   reg     [7:0] top_p2_y_i;
   reg     [7:0] top_p3_y_i;
   wire    [7:0] top_p0_en_o;
   wire    [7:0] top_p1_en_o;
   wire    [7:0] top_p2_en_o;
   wire    [7:0] top_p3_en_o;
   wire    [7:0] top_p0_a_o;
   wire    [7:0] top_p1_a_o;
   wire    [7:0] top_p2_a_o;
   wire    [7:0] top_p3_a_o;
   wire    [7:0] top_p4_a_o;
    
   // bus control external signals
   reg           top_ea_b_i;
   wire          top_psen_b_o;
  
   // timers external signals
   reg           top_pht_i;


emc_top EMC_TOP_INSTANCE //#####################################################
   (
      .top_clock_i      (top_clock_i     ),
      .top_clock_mem_i  (top_clock_mem_i ),
      .top_reset_i      (top_reset_i     ),
      .top_p0_y_i       (top_p0_y_i      ),
      .top_p1_y_i       (top_p1_y_i      ),
      .top_p2_y_i       (top_p2_y_i      ),
      .top_p3_y_i       (top_p3_y_i      ),
      .top_p0_en_o      (top_p0_en_o     ),
      .top_p1_en_o      (top_p1_en_o     ),
      .top_p2_en_o      (top_p2_en_o     ),
      .top_p3_en_o      (top_p3_en_o     ),
      .top_p0_a_o       (top_p0_a_o      ),
      .top_p1_a_o       (top_p1_a_o      ),
      .top_p2_a_o       (top_p2_a_o      ),
      .top_p3_a_o       (top_p3_a_o      ),
      .top_p4_a_o       (top_p4_a_o      ),
      .top_pht_i        (top_pht_i       ),
      .top_ea_b_i       (top_ea_b_i      ),
      .top_psen_b_o     (top_psen_b_o    )
   );
   
 localparam integer PERIOD = 50;

// Creating clock
always 
begin
  top_clock_i = 1'b0;
  #(PERIOD/2.0);
  top_clock_i = 1'b1;
  #(PERIOD/2.0);
end

// Creating clock mem
always 
begin
  top_clock_mem_i = 1'b0;
  #(PERIOD/4.0);
  top_clock_mem_i = 1'b1;
  #(PERIOD/4.0);
end


//initial 
//begin
//  #1;                // start stimulus
//  
//   top_ea_b_i = 1'b1;
//   top_pht_i  = 1'b0;
   
   
//  top_reset_i  = 1'b1;
//  #(2*PERIOD);
//  top_reset_i = 1'b0;    
//  #(5*PERIOD);      
//  top_reset_i = 1'b1; 
//  #(10*PERIOD);
  
//  $finish;
  
//end
     
endmodule