`timescale 1ns/10ps

module ram_memory_top();

wire [7:0] Q;
reg [7:0] D;
reg [6:0] ADR;
reg CLK;
reg ENB;
reg WEB;
reg OEB;
reg ramvdd;
reg ramgnd;

parameter PERIOD=50;

SPRAM128X8 MEM_TOP(
  .Q(Q),
  .D(D),
  .ADR(ADR),
  .CLK(CLK),
  .ENB(ENB),
  .WEB(WEB),
  .OEB(OEB),
  .ramvdd(ramvdd),
  .ramgnd(ramgnd)
);

initial CLK=0;
always #(PERIOD/2) CLK=~CLK;

endmodule
