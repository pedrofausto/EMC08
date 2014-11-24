module core_reg_ctrl_tb();

`include "core_reg_ctrl_defines.v"
`include "core_reg_ctrl_functions.v"

reg             reg_ctrl_clk_i;
reg             reg_ctrl_reset_b_i;

reg             reg_ctrl_fsm_wr_b_i;
reg             reg_ctrl_fsm_rd_b_i;
reg             reg_ctrl_fsm_bit_byte_flag_i;
reg [7:0]       reg_ctrl_fsm_addr_i;
reg [7:0]       reg_ctrl_fsm_data_i;

reg             reg_ctrl_ext_rom_rd_i;
reg             reg_ctrl_ext_ram_rd_i;
reg             reg_ctrl_ext_ram_wr_i;

reg             reg_ctrl_alu_cy_i;
reg             reg_ctrl_alu_ac_i;
reg             reg_ctrl_alu_ov_i;

wire[7:0]       reg_ctrl_bus_ctrl_p0en_i;
wire[7:0]       reg_ctrl_bus_ctrl_p0_i;
wire[7:0]       reg_ctrl_bus_ctrl_p2en_i;
wire[7:0]       reg_ctrl_bus_ctrl_p2_i;
wire            reg_ctrl_bus_ctrl_p3en_6_i;
wire            reg_ctrl_bus_ctrl_p3en_7_i;
wire            reg_ctrl_bus_ctrl_p3_6_i;
wire            reg_ctrl_bus_ctrl_p3_7_i;
wire[7:0]       reg_ctrl_bus_ctrl_p4_i;

reg             reg_ctrl_interrupt_ie0_i;
reg             reg_ctrl_interrupt_ie1_i;
reg             reg_ctrl_interrupt_tf0_i;
reg             reg_ctrl_interrupt_tf1_i;
reg             reg_ctrl_interrupt_tf2_i;
reg             reg_ctrl_interrupt_txrxf_i;
reg             reg_ctrl_interrupt_clear_i;

reg [7:0]       reg_ctrl_ports_p0_i;
reg [7:0]       reg_ctrl_ports_p1_i;
reg [7:0]       reg_ctrl_ports_p2_i;
reg [7:0]       reg_ctrl_ports_p3_i;

reg             reg_ctrl_serial_p3en_0_i;
reg             reg_ctrl_serial_p3en_1_i;
reg             reg_ctrl_serial_p3_0_i;
reg             reg_ctrl_serial_p3_1_i;
reg [7:0]       reg_ctrl_serial_sbuf_rx_i;
reg             reg_ctrl_serial_rb8_i;
reg             reg_ctrl_serial_ti_i;
reg             reg_ctrl_serial_ri_i;

reg [7:0]       reg_ctrl_timers_th0_i;
reg [7:0]       reg_ctrl_timers_tm0_i;
reg [7:0]       reg_ctrl_timers_tl0_i;
reg             reg_ctrl_timers_tf0_i;
reg [7:0]       reg_ctrl_timers_th1_i;
reg [7:0]       reg_ctrl_timers_tm1_i;
reg [7:0]       reg_ctrl_timers_tl1_i;
reg             reg_ctrl_timers_tf1_i;
reg [7:0]       reg_ctrl_timers_acrh_i;
reg [7:0]       reg_ctrl_timers_acrm_i;
reg [7:0]       reg_ctrl_timers_acrl_i;
reg             reg_ctrl_timers_tf2_i;

wire [7:0]      reg_ctrl_fsm_data_o;
wire [1:0]      reg_ctrl_fsm_psw_rs_o;

wire            reg_ctrl_alu_cy_o;
wire            reg_ctrl_alu_ac_o;
wire            reg_ctrl_alu_ov_o;

wire            reg_ctrl_baudrate_sm0_o;
wire            reg_ctrl_baudrate_sm1_o;
wire            reg_ctrl_baudrate_sm2_o;
wire            reg_ctrl_baudrate_smod_o;
wire            reg_ctrl_baudrate_rs232_o;

wire [7:0]      reg_ctrl_bus_ctrl_p0_o;

wire [6:0]      reg_ctrl_interrupt_ip_o;
wire [7:0]      reg_ctrl_interrupt_ie_o;
wire            reg_ctrl_interrupt_int0_o;
wire            reg_ctrl_interrupt_int1_o;
wire            reg_ctrl_interrupt_it0_o;
wire            reg_ctrl_interrupt_it1_o;
wire            reg_ctrl_interrupt_ie0_o;
wire            reg_ctrl_interrupt_ie1_o;
wire            reg_ctrl_interrupt_ri_o;
wire            reg_ctrl_interrupt_ti_o;
wire            reg_ctrl_interrupt_tf0_o;
wire            reg_ctrl_interrupt_tf1_o;
wire            reg_ctrl_interrupt_tf2_o;
wire            reg_ctrl_interrupt_txrxf_o;

wire [7:0]      reg_ctrl_ports_p0_o;
wire [7:0]      reg_ctrl_ports_p1_o;
wire [7:0]      reg_ctrl_ports_p2_o;
wire [7:0]      reg_ctrl_ports_p3_o;
wire [7:0]      reg_ctrl_ports_p4_o;
wire [7:0]      reg_ctrl_ports_p0en_o;
wire [7:0]      reg_ctrl_ports_p1en_o;
wire [7:0]      reg_ctrl_ports_p2en_o;
wire [7:0]      reg_ctrl_ports_p3en_o;

wire            reg_ctrl_serial_sm0_o;
wire            reg_ctrl_serial_ren_o;
wire            reg_ctrl_serial_p3_0_o;
wire [7:0]      reg_ctrl_serial_sbuf_tx_o;
wire            reg_ctrl_serial_tb8_o;
wire            reg_ctrl_serial_ti_o;
wire            reg_ctrl_serial_ri_o;
wire            reg_ctrl_serial_tx_o;

wire [7:0]      reg_ctrl_timers_th0_o;
wire [7:0]      reg_ctrl_timers_tm0_o;
wire [7:0]      reg_ctrl_timers_tl0_o;
wire            reg_ctrl_timers_gate_t0_o;
wire            reg_ctrl_timers_m1_t0_o;
wire            reg_ctrl_timers_m0_t0_o;
wire            reg_ctrl_timers_tr0_o;
wire            reg_ctrl_timers_tf0_o;
wire [7:0]      reg_ctrl_timers_th1_o;
wire [7:0]      reg_ctrl_timers_tm1_o;
wire [7:0]      reg_ctrl_timers_tl1_o;
wire            reg_ctrl_timers_gate_t1_o;
wire            reg_ctrl_timers_m1_t1_o;
wire            reg_ctrl_timers_m0_t1_o;
wire            reg_ctrl_timers_int0_o;
wire            reg_ctrl_timers_tr1_o;
wire            reg_ctrl_timers_tf1_o;
wire            reg_ctrl_timers_int1_o;
wire [1:0]      reg_ctrl_timers_tacph_o;
wire [7:0]      reg_ctrl_timers_tacpl_o;
wire            reg_ctrl_timers_tr2_o;
wire            reg_ctrl_timers_tf2_o;
wire            reg_ctrl_timers_dfsel_o;
wire            reg_ctrl_timers_edgsel_o;
wire [2:0]      reg_ctrl_timers_dfp_o;

core_reg_ctrl_new REG_CTRL(
               .reg_ctrl_clk_i(reg_ctrl_clk_i),
               .reg_ctrl_reset_b_i(reg_ctrl_reset_b_i),

               .reg_ctrl_fsm_wr_b_i(reg_ctrl_fsm_wr_b_i),
               .reg_ctrl_fsm_rd_b_i(reg_ctrl_fsm_rd_b_i),
               .reg_ctrl_fsm_bit_byte_flag_i(reg_ctrl_fsm_bit_byte_flag_i),
               .reg_ctrl_fsm_addr_i(reg_ctrl_fsm_addr_i),
               .reg_ctrl_fsm_data_i(reg_ctrl_fsm_data_i),

               .reg_ctrl_ext_ram_rd_i(reg_ctrl_ext_ram_rd_i),
               .reg_ctrl_ext_ram_wr_i(reg_ctrl_ext_ram_wr_i),
               .reg_ctrl_ext_rom_rd_i(reg_ctrl_ext_rom_rd_i),

               .reg_ctrl_alu_cy_i(reg_ctrl_alu_cy_i),
               .reg_ctrl_alu_ac_i(reg_ctrl_alu_ac_i),
               .reg_ctrl_alu_ov_i(reg_ctrl_alu_ov_i),

               .reg_ctrl_bus_ctrl_p0en_i(reg_ctrl_bus_ctrl_p0en_i),
               .reg_ctrl_bus_ctrl_p0_i(reg_ctrl_bus_ctrl_p0_i),
               .reg_ctrl_bus_ctrl_p2en_i(reg_ctrl_bus_ctrl_p2en_i),
               .reg_ctrl_bus_ctrl_p2_i(reg_ctrl_bus_ctrl_p2_i),
               .reg_ctrl_bus_ctrl_p3en_6_i(reg_ctrl_bus_ctrl_p3en_6_i),
               .reg_ctrl_bus_ctrl_p3en_7_i(reg_ctrl_bus_ctrl_p3en_7_i),
               .reg_ctrl_bus_ctrl_p3_6_i(reg_ctrl_bus_ctrl_p3_6_i),
               .reg_ctrl_bus_ctrl_p3_7_i(reg_ctrl_bus_ctrl_p3_7_i),
               .reg_ctrl_bus_ctrl_p4_i(reg_ctrl_bus_ctrl_p4_i),

               .reg_ctrl_interrupt_ie0_i(reg_ctrl_interrupt_ie0_i),
               .reg_ctrl_interrupt_ie1_i(reg_ctrl_interrupt_ie1_i),
               .reg_ctrl_interrupt_tf0_i(reg_ctrl_interrupt_tf0_i),
               .reg_ctrl_interrupt_tf1_i(reg_ctrl_interrupt_tf1_i),
               .reg_ctrl_interrupt_tf2_i(reg_ctrl_interrupt_tf2_i),
               .reg_ctrl_interrupt_txrxf_i(reg_ctrl_interrupt_txrxf_i),
               .reg_ctrl_interrupt_clear_i(reg_ctrl_interrupt_clear_i),

               .reg_ctrl_ports_p0_i(reg_ctrl_ports_p0_i),
               .reg_ctrl_ports_p1_i(reg_ctrl_ports_p1_i),
               .reg_ctrl_ports_p2_i(reg_ctrl_ports_p2_i),
               .reg_ctrl_ports_p3_i(reg_ctrl_ports_p3_i),

               .reg_ctrl_serial_p3en_0_i(reg_ctrl_serial_p3en_0_i),
               .reg_ctrl_serial_p3en_1_i(reg_ctrl_serial_p3en_1_i),
               .reg_ctrl_serial_p3_0_i(reg_ctrl_serial_p3_0_i),
               .reg_ctrl_serial_p3_1_i(reg_ctrl_serial_p3_1_i),
               .reg_ctrl_serial_sbuf_rx_i(reg_ctrl_serial_sbuf_rx_i),
               .reg_ctrl_serial_rb8_i(reg_ctrl_serial_rb8_i),
               .reg_ctrl_serial_ti_i(reg_ctrl_serial_ti_i),
               .reg_ctrl_serial_ri_i(reg_ctrl_serial_ri_i),

               .reg_ctrl_timers_th0_i(reg_ctrl_timers_th0_i),
               .reg_ctrl_timers_tm0_i(reg_ctrl_timers_tm0_i),
               .reg_ctrl_timers_tl0_i(reg_ctrl_timers_tl0_i),
               .reg_ctrl_timers_tf0_i(reg_ctrl_timers_tf0_i),
               .reg_ctrl_timers_th1_i(reg_ctrl_timers_th1_i),
               .reg_ctrl_timers_tm1_i(reg_ctrl_timers_tm1_i),
               .reg_ctrl_timers_tl1_i(reg_ctrl_timers_tl1_i),
               .reg_ctrl_timers_tf1_i(reg_ctrl_timers_tf1_i),
               .reg_ctrl_timers_acrh_i(reg_ctrl_timers_acrh_i),
               .reg_ctrl_timers_acrm_i(reg_ctrl_timers_acrm_i),
               .reg_ctrl_timers_acrl_i(reg_ctrl_timers_acrl_i),
               .reg_ctrl_timers_tf2_i(reg_ctrl_timers_tf2_i),

               .reg_ctrl_fsm_data_o(reg_ctrl_fsm_data_o),
               .reg_ctrl_fsm_psw_rs_o(reg_ctrl_fsm_psw_rs_o),

               .reg_ctrl_alu_cy_o(reg_ctrl_alu_cy_o),
               .reg_ctrl_alu_ac_o(reg_ctrl_alu_ac_o),
               .reg_ctrl_alu_ov_o(reg_ctrl_alu_ov_o),

               .reg_ctrl_baudrate_sm0_o(reg_ctrl_baudrate_sm0_o),
               .reg_ctrl_baudrate_sm1_o(reg_ctrl_baudrate_sm1_o),
               .reg_ctrl_baudrate_sm2_o(reg_ctrl_baudrate_sm2_o),
               .reg_ctrl_baudrate_smod_o(reg_ctrl_baudrate_smod_o),
               .reg_ctrl_baudrate_rs232_o(reg_ctrl_baudrate_rs232_o),

               .reg_ctrl_bus_ctrl_p0_o(reg_ctrl_bus_ctrl_p0_o),

               .reg_ctrl_interrupt_ip_o(reg_ctrl_interrupt_ip_o),
               .reg_ctrl_interrupt_ie_o(reg_ctrl_interrupt_ie_o),
               .reg_ctrl_interrupt_int0_o(reg_ctrl_interrupt_int0_o),
               .reg_ctrl_interrupt_int1_o(reg_ctrl_interrupt_int1_o),
               .reg_ctrl_interrupt_it0_o(reg_ctrl_interrupt_it0_o),
               .reg_ctrl_interrupt_it1_o(reg_ctrl_interrupt_it1_o),
               .reg_ctrl_interrupt_ie0_o(reg_ctrl_interrupt_ie0_o),
               .reg_ctrl_interrupt_ie1_o(reg_ctrl_interrupt_ie1_o),
               .reg_ctrl_interrupt_ri_o(reg_ctrl_interrupt_ri_o),
               .reg_ctrl_interrupt_ti_o(reg_ctrl_interrupt_ti_o),
               .reg_ctrl_interrupt_tf0_o(reg_ctrl_interrupt_tf0_o),
               .reg_ctrl_interrupt_tf1_o(reg_ctrl_interrupt_tf1_o),
               .reg_ctrl_interrupt_tf2_o(reg_ctrl_interrupt_tf2_o),
               .reg_ctrl_interrupt_txrxf_o(reg_ctrl_interrupt_txrxf_o),

               .reg_ctrl_ports_p0_o(reg_ctrl_ports_p0_o),
               .reg_ctrl_ports_p1_o(reg_ctrl_ports_p1_o),
               .reg_ctrl_ports_p2_o(reg_ctrl_ports_p2_o),
               .reg_ctrl_ports_p3_o(reg_ctrl_ports_p3_o),
               .reg_ctrl_ports_p4_o(reg_ctrl_ports_p4_o),
               .reg_ctrl_ports_p0en_o(reg_ctrl_ports_p0en_o),
               .reg_ctrl_ports_p1en_o(reg_ctrl_ports_p1en_o),
               .reg_ctrl_ports_p2en_o(reg_ctrl_ports_p2en_o),
               .reg_ctrl_ports_p3en_o(reg_ctrl_ports_p3en_o),

               .reg_ctrl_serial_sm0_o(reg_ctrl_serial_sm0_o),
               .reg_ctrl_serial_ren_o(reg_ctrl_serial_ren_o),
               .reg_ctrl_serial_p3_0_o(reg_ctrl_serial_p3_0_o),
               .reg_ctrl_serial_sbuf_tx_o(reg_ctrl_serial_sbuf_tx_o),
               .reg_ctrl_serial_tb8_o(reg_ctrl_serial_tb8_o),
               .reg_ctrl_serial_ti_o(reg_ctrl_serial_ti_o),
               .reg_ctrl_serial_ri_o(reg_ctrl_serial_ri_o),
               .reg_ctrl_serial_tx_o(reg_ctrl_serial_tx_o),

               .reg_ctrl_timers_th0_o(reg_ctrl_timers_th0_o),
               .reg_ctrl_timers_tm0_o(reg_ctrl_timers_tm0_o),
               .reg_ctrl_timers_tl0_o(reg_ctrl_timers_tl0_o),
               .reg_ctrl_timers_gate_t0_o(reg_ctrl_timers_gate_t0_o),
               .reg_ctrl_timers_m1_t0_o(reg_ctrl_timers_m1_t0_o),
               .reg_ctrl_timers_m0_t0_o(reg_ctrl_timers_m0_t0_o),
               .reg_ctrl_timers_tr0_o(reg_ctrl_timers_tr0_o),
               .reg_ctrl_timers_tf0_o(reg_ctrl_timers_tf0_o),
               .reg_ctrl_timers_int0_o(reg_ctrl_timers_int0_o),
               .reg_ctrl_timers_th1_o(reg_ctrl_timers_th1_o),
               .reg_ctrl_timers_tm1_o(reg_ctrl_timers_tm1_o),
               .reg_ctrl_timers_tl1_o(reg_ctrl_timers_tl1_o),
               .reg_ctrl_timers_gate_t1_o(reg_ctrl_timers_gate_t1_o),
               .reg_ctrl_timers_m1_t1_o(reg_ctrl_timers_m1_t1_o),
               .reg_ctrl_timers_m0_t1_o(reg_ctrl_timers_m0_t1_o),
               .reg_ctrl_timers_tr1_o(reg_ctrl_timers_tr1_o),
               .reg_ctrl_timers_tf1_o(reg_ctrl_timers_tf1_o),
               .reg_ctrl_timers_int1_o(reg_ctrl_timers_int1_o),
               .reg_ctrl_timers_tacph_o(reg_ctrl_timers_tacph_o),
               .reg_ctrl_timers_tacpl_o(reg_ctrl_timers_tacpl_o),
               .reg_ctrl_timers_tr2_o(reg_ctrl_timers_tr2_o),
               .reg_ctrl_timers_tf2_o(reg_ctrl_timers_tf2_o),
               .reg_ctrl_timers_dfsel_o(reg_ctrl_timers_dfsel_o),
               .reg_ctrl_timers_edgsel_o(reg_ctrl_timers_edgsel_o),
               .reg_ctrl_timers_dfp_o(reg_ctrl_timers_dfp_o)
               );
//**********************************************************************

wire [7:0] P0;
wire [7:0] SP;
wire [7:0] DPL;
wire [7:0] DPH;
wire [7:0] ACRL;
wire [7:0] ACRM;
wire [7:0] ACRH;
wire [7:0] PCON;
wire [7:0] TCON;
wire [7:0] TMOD;
wire [7:0] TL0;
wire [7:0] TL1;
wire [7:0] TH0;
wire [7:0] TH1;
wire [7:0] TM0;
wire [7:0] TM1;
wire [7:0] P1;
wire [7:0] SCON;
wire [7:0] SBUF_TX;
wire [7:0] P2;
wire [7:0] IE;
wire [7:0] P4;
wire [7:0] P3;
wire [7:0] IP;
wire [7:0] SMAP8;
wire [7:0] TACPL;
wire [7:0] TACPH;
wire [7:0] RX1;
wire [7:0] RX0;
wire [7:0] TX1;
wire [7:0] TX0;
wire [7:0] P0EN;
wire [7:0] P1EN;
wire [7:0] PSW;
wire [7:0] TCON2;
wire [7:0] ACC;
wire [7:0] P2EN;
wire [7:0] B;
wire [7:0] P3EN;
wire [7:0] SBUF_RX;

assign P0=REG_CTRL.sfr[0];
assign SP=REG_CTRL.sfr[1];
assign DPL=REG_CTRL.sfr[2];
assign DPH=REG_CTRL.sfr[3];
assign ACRL=REG_CTRL.sfr[4];
assign ACRM=REG_CTRL.sfr[5];
assign ACRH=REG_CTRL.sfr[6];
assign PCON=REG_CTRL.sfr[7];
assign TCON=REG_CTRL.sfr[8];
assign TMOD=REG_CTRL.sfr[9];
assign TL0=REG_CTRL.sfr[10];
assign TL1=REG_CTRL.sfr[11];
assign TH0=REG_CTRL.sfr[12];
assign TH1=REG_CTRL.sfr[13];
assign TM0=REG_CTRL.sfr[14];
assign TM1=REG_CTRL.sfr[15];
assign P1=REG_CTRL.sfr[16];
assign SCON=REG_CTRL.sfr[17];
assign SBUF_RX=REG_CTRL.sfr[18];
assign SBUF_TX=REG_CTRL.sfr[19];
assign P2=REG_CTRL.sfr[20];
assign IE=REG_CTRL.sfr[21];
assign P4=REG_CTRL.sfr[22];
assign P3=REG_CTRL.sfr[23];
assign IP=REG_CTRL.sfr[24];
assign SMAP8=REG_CTRL.sfr[25];
assign TACPL=REG_CTRL.sfr[26];
assign TACPH=REG_CTRL.sfr[27];
assign RX1=REG_CTRL.sfr[28];
assign RX0=REG_CTRL.sfr[29];
assign TX1=REG_CTRL.sfr[30];
assign TX0=REG_CTRL.sfr[31];
assign P0EN=REG_CTRL.sfr[32];
assign P1EN=REG_CTRL.sfr[33];
assign PSW=REG_CTRL.sfr[34];
assign TCON2=REG_CTRL.sfr[35];
assign ACC=REG_CTRL.sfr[36];
assign P2EN=REG_CTRL.sfr[37];
assign B=REG_CTRL.sfr[38];
assign P3EN=REG_CTRL.sfr[39];

//***************************************************
initial reg_ctrl_clk_i=0;
always #25 reg_ctrl_clk_i=~reg_ctrl_clk_i;


task reset;
   begin
      reg_ctrl_reset_b_i=0;
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_reset_b_i=1;
   end
endtask


task write_sfr_byte;
input [7:0] addr;
input [7:0] data;
   begin
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_rd_b_i=1;
      reg_ctrl_fsm_addr_i=addr;
      reg_ctrl_fsm_data_i=data;
      reg_ctrl_fsm_wr_b_i=0;
      reg_ctrl_fsm_bit_byte_flag_i=0;
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_wr_b_i=1;
   end
endtask

task write_sfr_bit;
input [7:0] addr;
input [7:0] data;
   begin
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_rd_b_i=1;
      reg_ctrl_fsm_addr_i=addr;
      reg_ctrl_fsm_data_i=data;
      reg_ctrl_fsm_wr_b_i=0;
      reg_ctrl_fsm_bit_byte_flag_i=1;
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_wr_b_i=1;
   end
endtask

task read_sfr_byte;
input [7:0] addr;
   begin
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_wr_b_i=1;
      reg_ctrl_fsm_addr_i=addr;
      reg_ctrl_fsm_rd_b_i=0;
      reg_ctrl_fsm_bit_byte_flag_i=0;
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_rd_b_i=1;
   end
endtask

task read_sfr_bit;
input [7:0] addr;
   begin
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_wr_b_i=1;
      reg_ctrl_fsm_addr_i=addr;
      reg_ctrl_fsm_rd_b_i=0;
      reg_ctrl_fsm_bit_byte_flag_i=1;
      @(negedge reg_ctrl_clk_i)
      reg_ctrl_fsm_rd_b_i=1;
   end
endtask

task check_bit;
   input in;
   input out;
   begin
      if(in==out)
         $display("Test passed. IN: ", in, " OUT: ",out);
      else
      begin
         $display("Test Failed. IN: ", in, " OUT: ",out);
         $finish;
      end
   end
endtask

task check_byte;
   input [7:0] in;
   input [7:0] out;
   begin
      if(in==out)
         $display("Test passed. IN: ", in, " OUT: ",out);
      else
      begin
         $display("Test Failed. IN: ", in, " OUT: ",out);
         $finish;
      end
   end
endtask

reg [24:0]  timer0;
reg [24:0]  timer1;
reg [24:0]  acr;

// Testing Timer 0
initial timer0=25'hFFFFF0;
always @(posedge reg_ctrl_clk_i) if(reg_ctrl_reset_b_i) timer0=timer0+1;

always @(timer0)
begin
   if(reg_ctrl_reset_b_i)
   begin
      reg_ctrl_timers_th0_i=timer0[23:16];
      reg_ctrl_timers_tm0_i=timer0[15:8];
      reg_ctrl_timers_tl0_i=timer0[7:0];
      reg_ctrl_timers_tf0_i=timer0[24];
   end
end

// Testing Timer 1
initial timer1=25'hFFFFF0;
always @(posedge reg_ctrl_clk_i) if(reg_ctrl_reset_b_i) timer1=timer1+1;

always @(timer1)
begin
   if(reg_ctrl_reset_b_i)
   begin
      reg_ctrl_timers_th1_i=timer1[23:16];
      reg_ctrl_timers_tm1_i=timer1[15:8];
      reg_ctrl_timers_tl1_i=timer1[7:0];
      reg_ctrl_timers_tf1_i=timer1[24];
   end
end

// Testing Timer 2
initial acr=25'hFFFFF0;
always @(posedge reg_ctrl_clk_i) if(reg_ctrl_reset_b_i) acr=acr+1;

always @(acr)
begin
   if(reg_ctrl_reset_b_i)
   begin
      reg_ctrl_timers_acrh_i=acr[23:16];
      reg_ctrl_timers_acrm_i=acr[15:8];
      reg_ctrl_timers_acrl_i=acr[7:0];
      reg_ctrl_timers_tf2_i=acr[24];
   end
end

task mem_task;
   input [2:0] seq;
   begin
      reg_ctrl_ext_rom_rd_i=seq[0];
      reg_ctrl_ext_ram_rd_i=seq[1];
      reg_ctrl_ext_ram_wr_i=seq[2];
   end
endtask

initial
begin
   reset;
   reg_ctrl_ports_p0_i=$random%256;
   reg_ctrl_ports_p1_i=$random%256;
   reg_ctrl_ports_p2_i=$random%256;
   reg_ctrl_ports_p3_i=$random%256;
   reg_ctrl_fsm_wr_b_i=1'b0;
   reg_ctrl_fsm_rd_b_i=1'b0;
   reg_ctrl_fsm_bit_byte_flag_i=1'b0;
   reg_ctrl_fsm_addr_i=$random%256;
   reg_ctrl_fsm_data_i=$random%256;
   reg_ctrl_alu_cy_i=$random%2;
   reg_ctrl_alu_ac_i=$random%2;
   reg_ctrl_alu_ov_i=$random%2;
   reg_ctrl_interrupt_ie0_i=$random%2;
   reg_ctrl_interrupt_ie1_i=$random%2;
   reg_ctrl_interrupt_tf0_i=$random%2;
   reg_ctrl_interrupt_tf1_i=$random%2;
   reg_ctrl_interrupt_tf2_i=$random%2;
   reg_ctrl_interrupt_txrxf_i=$random%2;
   reg_ctrl_interrupt_clear_i=$random%2;
   mem_task(3'b000);
   #250
   reg_ctrl_ports_p0_i=$random%256;
   reg_ctrl_ports_p1_i=$random%256;
   reg_ctrl_ports_p2_i=$random%256;
   reg_ctrl_ports_p3_i=$random%256;
   #250
   write_sfr_byte(`P0EN, $random%256);
   write_sfr_byte(`P1EN, $random%256);
   write_sfr_byte(`P2EN, $random%256);
   write_sfr_byte(`P3EN, $random%256);
   write_sfr_byte(`P0, $random%256);
   write_sfr_byte(`P1, $random%256);
   write_sfr_byte(`P2, $random%256);
   write_sfr_byte(`P3, $random%256);
   write_sfr_byte(`P4, $random%256);
   write_sfr_byte(`IE, 8'hFF);
   reg_ctrl_interrupt_clear_i=1'b0;
   reg_ctrl_timers_tf0_i=1'b1;
   reg_ctrl_timers_tf1_i=1'b1;
   reg_ctrl_timers_tf2_i=1'b1;
   reg_ctrl_serial_ti_i=1'b1;
   reg_ctrl_serial_ri_i=1'b1;
   write_sfr_byte(`IP, $random%256);
   read_sfr_byte(`TCON);
   #1000;
   reg_ctrl_interrupt_clear_i=1'b1;
   reg_ctrl_timers_tf0_i=1'b1;
   reg_ctrl_timers_tf1_i=1'b1;
   reg_ctrl_timers_tf2_i=1'b1;
   reg_ctrl_serial_ti_i=1'b1;
   reg_ctrl_serial_ri_i=1'b1;
   reg_ctrl_interrupt_ie0_i=1'b0;
   reg_ctrl_interrupt_ie1_i=1'b0;
   reg_ctrl_interrupt_tf0_i=1'b0;
   reg_ctrl_interrupt_tf1_i=1'b0;
   reg_ctrl_interrupt_tf2_i=1'b0;
   reg_ctrl_interrupt_txrxf_i=1'b0;
   #500
   read_sfr_byte(`TCON);
   #500
   reg_ctrl_serial_p3en_0_i=1'b1;
   reg_ctrl_serial_p3en_1_i=1'b1;
   reg_ctrl_serial_p3_0_i=$random%256;
   reg_ctrl_serial_sbuf_rx_i=$random%256;
   write_sfr_byte(`SBUF, $random%256);
   #500

   $finish;
end

endmodule
