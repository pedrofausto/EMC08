`timescale 1ns/10ps

module ext_ram_tb();

wire [7:0] Q;
reg [7:0] D;
reg [15:0] ADR;
reg CLK;
reg ENB;
reg WEB;
reg OEB;
reg ramvdd;
reg ramgnd;

parameter PERIOD=25;

SPRAM65536X8 EXT_RAM(
  .Q(Q),
  .D(D),
  .ADR(ADR),
  .CLK(CLK),
  .ENB(ENB),
  .WEB(WEB),
  .OEB(OEB),
  .ramvdd(1'b1),
  .ramgnd(1'b0)
);

initial CLK=1'b0;
always #(PERIOD/2.0) CLK=~CLK;

always
begin
   D=$random%256;
   ADR=$random%65536;
   ENB=1'b1;
   WEB=1'b1;
   OEB=1'b1;
   #250
   @(negedge CLK)
   ENB=1'b0;
   ADR=16'd0;
   repeat (65536)
   begin
      D=$random%256;
      WEB=1'b0;
      @(negedge CLK)
      ADR=ADR+16'd1;      
   end
   WEB=1'b1;
   #250
   @(negedge CLK)
   WEB=1'b1;
   ADR=16'd0;
   repeat (65536)
   begin
      D=$random%256;
      OEB=1'b0;
      @(negedge CLK)
      ADR=ADR+16'd1;      
   end
   $finish;
end

endmodule
