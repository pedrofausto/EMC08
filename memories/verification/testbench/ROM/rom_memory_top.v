`timescale 1ns/10ps

module rom_memory_top();

wire [7:0] Q;
reg [11:0] ADR;
reg CLK;
reg ENB;
reg OEB;
reg romvdd;
reg romgnd;

parameter PERIOD=50;
ROM4096X8 MEM_TOP(
  .Q(Q),
  .ADR(ADR),
  .CLK(CLK),
  .ENB(ENB),
  .OEB(OEB),
  .romvdd(romvdd),
  .romgnd(romgnd)
);

initial CLK=0;
always #(PERIOD/2) CLK=~CLK;

endmodule
