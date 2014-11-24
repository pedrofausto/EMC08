module emc_top_netlist_tb();


reg          CLOCK;
reg          CLOCK_MEM;
reg          RESET_B;
wire    [7:0] P0;
wire    [7:0] P1;
wire    [7:0] P2;
wire    [7:0] P3;
wire   [7:0] P4;
reg          PHT;
reg          EA_B;
reg          SE_B;
reg          TM;
wire         PSEN_B;

 localparam integer PERIOD = 50;

EMC08 EMC08_INSTANCE(
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

// Creating clock
always 
begin
  CLOCK = 1'b0;
  #(PERIOD/2.0);
  CLOCK = 1'b1;
  #(PERIOD/2.0);
end

// Creating clock mem
always 
begin
  CLOCK_MEM = 1'b0;
  #(PERIOD/4.0);
  CLOCK_MEM = 1'b1;
  #(PERIOD/4.0);
end

always
begin
   #200
   PHT=1'b0;
   #500
   PHT=1'b1;
end

initial 
begin
   $dumpfile("emc_top_netlist.vcd");
   $dumpvars(0,EMC08_INSTANCE);
   SE_B=1'b1;
   RESET_B=1'b1;
   TM=1'b0;
   #100
   PHT=1'b0;
   EA_B=1'b1;
   RESET_B=1'b0;  
   #500
   @(negedge CLOCK)
   RESET_B = 1'b1;
   #10000000
   $finish;
end

endmodule
