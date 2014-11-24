// Created by ihdl
`timescale 1ns/10ps

module BBCUD8P (A, EN, GNDO, GNDR, PAD, PDEN, PI, PO, PUEN, 
//*****************************************************************
//   technology       : 0.18um bulk CMOS 3V
//   module           : BBCUD8P
//   version          : V 1.0.2
//   cell_description : Bidirectionale tristate buffer with pull 
//                      down and pull up
//*****************************************************************
                        VDD, VDDO, VDDR, Y);
         
  input  VDDO, VDDR, VDD, GNDO, GNDR, PUEN, PDEN, A, EN, PI;
  inout  PAD;
  output Y, PO;

//
//  check vdd,gnd connection
//

  check_vdd G1(ck_VDDO, VDDO);
  check_vdd G2(ck_VDDR, VDDR);
  check_vdd G3(ck_VDD,  VDD);
  check_gnd G4(ck_GNDO, GNDO);
  check_gnd G5(ck_GNDR, GNDR);

//
// logic section
//

  and G6(ck_sup, ck_VDDO, ck_VDDR, ck_VDD, ck_GNDO, ck_GNDR);

  check_buf  G7 (ck_PAD, PAD, ck_sup);
  check_buf  G8 (ck_PI,  PI,  ck_sup);
  check_buf  G9 (ck_A,   A,   ck_sup);
  check_buf  G10(ck_EN,  EN,  ck_sup);
  check_buf  ud1(ck_PDEN,  PDEN,  ck_sup);
  check_buf  ud2(ck_PUEN,  PUEN,  ck_sup);

//
// Pull-up and pull-down connections
//
  `ifdef DISPLAY_PD_PU_EN 
  buf ud3 (PUEN_en, ck_PUEN);
  not ud4 (PDEN_enb, ck_PDEN);
  rpmos ud5(PAD, 1'b1, PUEN_en);
  rnmos ud6 (PAD, 1'b0, PDEN_enb);
  nor (pull1, strong0) ud7 (CURRENT_PU, ck_PAD, PUEN_en);
  and (pull1, strong0) ud8 (CURRENT_PD, ck_PAD, PDEN_enb);
  `endif

  not        G11(e,   ck_EN);
  bufif1     G12(PAD, ck_A,   e);
  buf        G13(Y,   ck_PAD);
  nand       G14(PO,  ck_PAD, ck_PI);

//
// parameter section
//

  specify

      specparam  Area$ = 15420.00 ;

      specparam  FanoutLoad$A = 0.0474 ;
      specparam  FanoutLoad$EN = 0.0416 ;
      specparam  FanoutLoad$PDEN = 0.0087 ;
      specparam  FanoutLoad$PI = 0.0097 ;
      specparam  FanoutLoad$PUEN = 0.0141 ;

      (PAD => Y)   = (0.1, 0.1);
      (PAD => PO)  = (0.1, 0.1);
      (PI  => PO)  = (0.1, 0.1);
      (A   => PAD) = (0.1, 0.1);
      (EN  => PAD) = (1.0, 1.0, 1.0, 1.0, 1.0, 1.0);

  endspecify
endmodule
