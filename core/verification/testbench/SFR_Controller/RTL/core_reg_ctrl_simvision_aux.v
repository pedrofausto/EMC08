// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_reg_ctrl_simvision_aux.v
// Module Name: n.a.
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// -------------------------------------------------------------------
// Description
// Auxiliary include file to ease the waveforms analysis in Simvision,
// mapping the contiguous SFR area to registers correctly named
// -------------------------------------------------------------------

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

assign P0=sfr[0];
assign SP=sfr[1];
assign DPL=sfr[2];
assign DPH=sfr[3];
assign ACRL=sfr[4];
assign ACRM=sfr[5];
assign ACRH=sfr[6];
assign PCON=sfr[7];
assign TCON=sfr[8];
assign TMOD=sfr[9];
assign TL0=sfr[10];
assign TL1=sfr[11];
assign TH0=sfr[12];
assign TH1=sfr[13];
assign TM0=sfr[14];
assign TM1=sfr[15];
assign P1=sfr[16];
assign SCON=sfr[17];
assign SBUF_RX=sfr[18];
assign SBUF_TX=sfr[19];
assign P2=sfr[20];
assign IE=sfr[21];
assign P4=sfr[22];
assign P3=sfr[23];
assign IP=sfr[24];
assign SMAP8=sfr[25];
assign TACPL=sfr[26];
assign TACPH=sfr[27];
assign RX1=sfr[28];
assign RX0=sfr[29];
assign TX1=sfr[30];
assign TX0=sfr[31];
assign P0EN=sfr[32];
assign P1EN=sfr[33];
assign PSW=sfr[34];
assign TCON2=sfr[35];
assign ACC=sfr[36];
assign P2EN=sfr[37];
assign B=sfr[38];
assign P3EN=sfr[39];
