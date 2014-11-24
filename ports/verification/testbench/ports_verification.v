// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: verification_ports.v
// Module Name: tb_verification_ports
// Author: Valeria Ap. Pereira and Jonatas Valentim Ferrari
// E-mail: valeriapereira85@yahoo.com.br and jonatasferrari@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 10/09/2010 Initial version
// -------------------------------------------------------------------
// Description
// In this file was created tasks to verify the features described
// in verification guide.
// -------------------------------------------------------------------

`timescale 1ns/10ps
`include "verilog.v"
`include "VLG_xc018_IO_PRIMITIVES.v"

module tb_ports_verification;

reg [7:0] ports_sfr_P0EN_i;   
reg [7:0] ports_sfr_P1EN_i;   
reg [7:0] ports_sfr_P2EN_i;   
reg [7:0] ports_sfr_P3EN_i;     
   
reg [7:0] ports_sfr_P0_i;
reg [7:0] ports_sfr_P1_i;
reg [7:0] ports_sfr_P2_i;
reg [7:0] ports_sfr_P3_i;   
reg [7:0] ports_sfr_P4_i;
   
wire [7:0] y_port0_i;
wire [7:0] y_port1_i;
wire [7:0] y_port2_i;
wire [7:0] y_port3_i;
   
wire [7:0] ports_sfr_P0_o;
wire [7:0] ports_sfr_P1_o;
wire [7:0] ports_sfr_P2_o;
wire [7:0] ports_sfr_P3_o;
 
wire [7:0] en_port0_o;
wire [7:0] en_port1_o;
wire [7:0] en_port2_o;
wire [7:0] en_port3_o;

wire [7:0] a_port0_o;
wire [7:0] a_port1_o;
wire [7:0] a_port2_o;
wire [7:0] a_port3_o;
wire [7:0] a_port4_o;

reg vddo;
reg vddr;
reg vdd ;
reg gndo;
reg gndr;
reg puen;
reg pden;
reg en  ;
reg pi  ;
wire y  ;
wire po ;

wire [7:0] pad_port0 ;
wire [7:0] pad_port1 ;
wire [7:0] pad_port2 ;
wire [7:0] pad_port3 ;
wire [7:0] pad_port4 ;

reg  [7:0] temp_pad_port0 ;
reg  [7:0] temp_pad_port1 ;
reg  [7:0] temp_pad_port2 ;
reg  [7:0] temp_pad_port3 ;
reg  [7:0] temp_pad_port4 ;

reg       random_bit ;
reg [7:0] random_1   ;
reg [7:0] random_2   ;
reg [7:0] random_3   ;
reg [7:0] random_4   ;
reg [7:0] random_5   ;  
reg [7:0] random_6   ;
reg [7:0] random_7   ;
reg [7:0] random_8   ;
reg [7:0] random_9   ;

reg [2:0] p0_pin ;
reg [2:0] p1_pin ;
reg [2:0] p2_pin ;
reg [2:0] p3_pin ;
reg [2:0] p4_pin ;

// ------ Instanciation --------------------------------------------------

PORT_TOP DUT (
 .ports_sfr_P0EN_i (ports_sfr_P0EN_i),
 .ports_sfr_P1EN_i (ports_sfr_P1EN_i),
 .ports_sfr_P2EN_i (ports_sfr_P2EN_i),
 .ports_sfr_P3EN_i (ports_sfr_P3EN_i),
 
 .ports_sfr_P0_i   (ports_sfr_P0_i  ),
 .ports_sfr_P1_i   (ports_sfr_P1_i  ),
 .ports_sfr_P2_i   (ports_sfr_P2_i  ),
 .ports_sfr_P3_i   (ports_sfr_P3_i  ),
 .ports_sfr_P4_i   (ports_sfr_P4_i  ),

 .y_port0_i        (y_port0_i       ),
 .y_port1_i        (y_port1_i       ),
 .y_port2_i        (y_port2_i       ),
 .y_port3_i        (y_port3_i       ),
 
 .ports_sfr_P0_o   (ports_sfr_P0_o  ),
 .ports_sfr_P1_o   (ports_sfr_P1_o  ),
 .ports_sfr_P2_o   (ports_sfr_P2_o  ),
 .ports_sfr_P3_o   (ports_sfr_P3_o  ),
 
 .en_port0_o       (en_port0_o      ),
 .en_port1_o       (en_port1_o      ),
 .en_port2_o       (en_port2_o      ),
 .en_port3_o       (en_port3_o      ),
 
 .a_port0_o        (a_port0_o       ),
 .a_port1_o        (a_port1_o       ),
 .a_port2_o        (a_port2_o       ),
 .a_port3_o        (a_port3_o       ),
 .a_port4_o        (a_port4_o       )
);

// ------ Port 0 Instanciation --------------------------------------------

BBCUD8P PORT0_0 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[0] ),
 .A    (a_port0_o[0]  ),
 .PAD  (pad_port0[0]  ),
 .Y    (y_port0_i[0]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_1 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[1] ),
 .A    (a_port0_o[1]  ),
 .PAD  (pad_port0[1]  ),
 .Y    (y_port0_i[1]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_2 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[2] ),
 .A    (a_port0_o[2]  ),
 .PAD  (pad_port0[2]  ),
 .Y    (y_port0_i[2]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_3 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[3] ),
 .A    (a_port0_o[3]  ),
 .PAD  (pad_port0[3]  ),
 .Y    (y_port0_i[3]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_4 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[4] ),
 .A    (a_port0_o[4]  ),
 .PAD  (pad_port0[4]  ),
 .Y    (y_port0_i[4]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_5 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[5] ),
 .A    (a_port0_o[5]  ),
 .PAD  (pad_port0[5]  ),
 .Y    (y_port0_i[5]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_6 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[6] ),
 .A    (a_port0_o[6]  ),
 .PAD  (pad_port0[6]  ),
 .Y    (y_port0_i[6]  ),
 .PO   (po            ) 
);

BBCUD8P PORT0_7 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port0_o[7] ),
 .A    (a_port0_o[7]  ),
 .PAD  (pad_port0[7]  ),
 .Y    (y_port0_i[7]  ),
 .PO   (po            ) 
);

// ------ Port 1 Instanciation --------------------------------------------

BBCUD8P PORT1_0 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[0] ),
 .A    (a_port1_o[0]  ),
 .PAD  (pad_port1[0]  ),
 .Y    (y_port1_i[0]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_1 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[1] ),
 .A    (a_port1_o[1]  ),
 .PAD  (pad_port1[1]  ),
 .Y    (y_port1_i[1]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_2 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[2] ),
 .A    (a_port1_o[2]  ),
 .PAD  (pad_port1[2]  ),
 .Y    (y_port1_i[2]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_3 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[3] ),
 .A    (a_port1_o[3]  ),
 .PAD  (pad_port1[3]  ),
 .Y    (y_port1_i[3]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_4 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[4] ),
 .A    (a_port1_o[4]  ),
 .PAD  (pad_port1[4]  ),
 .Y    (y_port1_i[4]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_5 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[5] ),
 .A    (a_port1_o[5]  ),
 .PAD  (pad_port1[5]  ),
 .Y    (y_port1_i[5]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_6 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[6] ),
 .A    (a_port1_o[6]  ),
 .PAD  (pad_port1[6]  ),
 .Y    (y_port1_i[6]  ),
 .PO   (po            ) 
);

BBCUD8P PORT1_7 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port1_o[7] ),
 .A    (a_port1_o[7]  ),
 .PAD  (pad_port1[7]  ),
 .Y    (y_port1_i[7]  ),
 .PO   (po            ) 
);

// ------ Port 2 Instanciation --------------------------------------------

BBCUD8P PORT2_0 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[0] ),
 .A    (a_port2_o[0]  ),
 .PAD  (pad_port2[0]  ),
 .Y    (y_port2_i[0]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_1 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[1] ),
 .A    (a_port2_o[1]  ),
 .PAD  (pad_port2[1]  ),
 .Y    (y_port2_i[1]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_2 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[2] ),
 .A    (a_port2_o[2]  ),
 .PAD  (pad_port2[2]  ),
 .Y    (y_port2_i[2]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_3 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[3] ),
 .A    (a_port2_o[3]  ),
 .PAD  (pad_port2[3]  ),
 .Y    (y_port2_i[3]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_4 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[4] ),
 .A    (a_port2_o[4]  ),
 .PAD  (pad_port2[4]  ),
 .Y    (y_port2_i[4]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_5 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[5] ),
 .A    (a_port2_o[5]  ),
 .PAD  (pad_port2[5]  ),
 .Y    (y_port2_i[5]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_6 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[6] ),
 .A    (a_port2_o[6]  ),
 .PAD  (pad_port2[6]  ),
 .Y    (y_port2_i[6]  ),
 .PO   (po            ) 
);

BBCUD8P PORT2_7 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port2_o[7] ),
 .A    (a_port2_o[7]  ),
 .PAD  (pad_port2[7]  ),
 .Y    (y_port2_i[7]  ),
 .PO   (po            ) 
);

// ------ Port 3 Instanciation --------------------------------------------

BBCUD8P PORT3_0 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[0] ),
 .A    (a_port3_o[0]  ),
 .PAD  (pad_port3[0]  ),
 .Y    (y_port3_i[0]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_1 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[1] ),
 .A    (a_port3_o[1]  ),
 .PAD  (pad_port3[1]  ),
 .Y    (y_port3_i[1]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_2 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[2] ),
 .A    (a_port3_o[2]  ),
 .PAD  (pad_port3[2]  ),
 .Y    (y_port3_i[2]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_3 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[3] ),
 .A    (a_port3_o[3]  ),
 .PAD  (pad_port3[3]  ),
 .Y    (y_port3_i[3]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_4 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[4] ),
 .A    (a_port3_o[4]  ),
 .PAD  (pad_port3[4]  ),
 .Y    (y_port3_i[4]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_5 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[5] ),
 .A    (a_port3_o[5]  ),
 .PAD  (pad_port3[5]  ),
 .Y    (y_port3_i[5]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_6 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[6] ),
 .A    (a_port3_o[6]  ),
 .PAD  (pad_port3[6]  ),
 .Y    (y_port3_i[6]  ),
 .PO   (po            ) 
);

BBCUD8P PORT3_7 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .PI   (pi            ),
 .EN   (en_port3_o[7] ),
 .A    (a_port3_o[7]  ),
 .PAD  (pad_port3[7]  ),
 .Y    (y_port3_i[7]  ),
 .PO   (po            ) 
);

// ------ Port 4 Instanciation --------------------------------------------

BBCUD8P PORT4_0 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[0]  ),
 .PAD  (pad_port4[0]  ),
 .Y    (y             ),
 .PO   (po            ) 
);


BBCUD8P PORT4_1 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[1]  ),
 .PAD  (pad_port4[1]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

BBCUD8P PORT4_2 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[2]  ),
 .PAD  (pad_port4[2]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

BBCUD8P PORT4_3 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[3]  ),
 .PAD  (pad_port4[3]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

BBCUD8P PORT4_4 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[4]  ),
 .PAD  (pad_port4[4]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

BBCUD8P PORT4_5 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[5]  ),
 .PAD  (pad_port4[5]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

BBCUD8P PORT4_6 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[6]  ),
 .PAD  (pad_port4[6]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

BBCUD8P PORT4_7 (
 .VDDO (vddo          ),
 .VDDR (vddr          ),
 .VDD  (vdd           ),
 .GNDO (gndo          ),
 .GNDR (gndr          ),
 .PUEN (puen          ),
 .PDEN (pden          ),
 .EN   (en            ),
 .PI   (pi            ),
 .A    (a_port4_o[7]  ),
 .PAD  (pad_port4[7]  ),
 .Y    (y             ),
 .PO   (po            ) 
);

assign pad_port0[0] = ports_sfr_P0EN_i[0] ? 1'bz : temp_pad_port0[0];
assign pad_port0[1] = ports_sfr_P0EN_i[1] ? 1'bz : temp_pad_port0[1];
assign pad_port0[2] = ports_sfr_P0EN_i[2] ? 1'bz : temp_pad_port0[2];
assign pad_port0[3] = ports_sfr_P0EN_i[3] ? 1'bz : temp_pad_port0[3];
assign pad_port0[4] = ports_sfr_P0EN_i[4] ? 1'bz : temp_pad_port0[4];
assign pad_port0[5] = ports_sfr_P0EN_i[5] ? 1'bz : temp_pad_port0[5];
assign pad_port0[6] = ports_sfr_P0EN_i[6] ? 1'bz : temp_pad_port0[6];
assign pad_port0[7] = ports_sfr_P0EN_i[7] ? 1'bz : temp_pad_port0[7];

assign pad_port1[0] = ports_sfr_P1EN_i[0] ? 1'bz : temp_pad_port1[0];
assign pad_port1[1] = ports_sfr_P1EN_i[1] ? 1'bz : temp_pad_port1[1];
assign pad_port1[2] = ports_sfr_P1EN_i[2] ? 1'bz : temp_pad_port1[2];
assign pad_port1[3] = ports_sfr_P1EN_i[3] ? 1'bz : temp_pad_port1[3];
assign pad_port1[4] = ports_sfr_P1EN_i[4] ? 1'bz : temp_pad_port1[4];
assign pad_port1[5] = ports_sfr_P1EN_i[5] ? 1'bz : temp_pad_port1[5];
assign pad_port1[6] = ports_sfr_P1EN_i[6] ? 1'bz : temp_pad_port1[6];
assign pad_port1[7] = ports_sfr_P1EN_i[7] ? 1'bz : temp_pad_port1[7];

assign pad_port2[0] = ports_sfr_P2EN_i[0] ? 1'bz : temp_pad_port2[0];
assign pad_port2[1] = ports_sfr_P2EN_i[1] ? 1'bz : temp_pad_port2[1];
assign pad_port2[2] = ports_sfr_P2EN_i[2] ? 1'bz : temp_pad_port2[2];
assign pad_port2[3] = ports_sfr_P2EN_i[3] ? 1'bz : temp_pad_port2[3];
assign pad_port2[4] = ports_sfr_P2EN_i[4] ? 1'bz : temp_pad_port2[4];
assign pad_port2[5] = ports_sfr_P2EN_i[5] ? 1'bz : temp_pad_port2[5];
assign pad_port2[6] = ports_sfr_P2EN_i[6] ? 1'bz : temp_pad_port2[6];
assign pad_port2[7] = ports_sfr_P2EN_i[7] ? 1'bz : temp_pad_port2[7];

assign pad_port3[0] = ports_sfr_P3EN_i[0] ? 1'bz : temp_pad_port3[0];
assign pad_port3[1] = ports_sfr_P3EN_i[1] ? 1'bz : temp_pad_port3[1];
assign pad_port3[2] = ports_sfr_P3EN_i[2] ? 1'bz : temp_pad_port3[2];
assign pad_port3[3] = ports_sfr_P3EN_i[3] ? 1'bz : temp_pad_port3[3];
assign pad_port3[4] = ports_sfr_P3EN_i[4] ? 1'bz : temp_pad_port3[4];
assign pad_port3[5] = ports_sfr_P3EN_i[5] ? 1'bz : temp_pad_port3[5];
assign pad_port3[6] = ports_sfr_P3EN_i[6] ? 1'bz : temp_pad_port3[6];
assign pad_port3[7] = ports_sfr_P3EN_i[7] ? 1'bz : temp_pad_port3[7];

// ----------------------------- Task -------------------------------------- 
// --------------------------- Feature 1 -----------------------------------
// ------ The P3, P2, P1 and P0 ports are enabled as input or output -------
// -------------- regarding the P3EN, P2EN, P1EN, P0EN values. -------------

// ----------------------------- P0EN --------------------------------------
task Checker_P0EN;
   input sfr_p0en;
   input en;
   begin
      $display ("----------> P0EN is: %d" , ports_sfr_P0EN_i);
      if (sfr_p0en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin
            $display ("EN = 1: OK");
         end
         else
         begin 
            $display ("EN = 0: ERROR");
         end 
      end 
      else //Enabled as output
      begin         
         if (en == 1'b0)
         begin
            $display ("EN = 0: OK");
         end
         else
         begin 
            $display ("EN = 1: ERROR");
         end 
      end 
   end 
endtask

// ----------------------------- P1EN --------------------------------------
task Checker_P1EN;
   input sfr_p1en;
   input en;
   begin
      $display ("----------> P1EN is: %d" , ports_sfr_P1EN_i);
      if (sfr_p1en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin
            $display ("EN = 1: OK");
         end
         else
         begin 
            $display ("EN = 0: ERROR");
         end 
      end
      else //Enabled as output
      begin         
         if (en == 1'b0)
         begin
            $display ("EN = 0: OK");
         end
         else
         begin 
            $display ("EN = 1: ERROR");
         end 
      end 
   end 
endtask

// ----------------------------- P2EN --------------------------------------
task Checker_P2EN;
   input sfr_p2en;
   input en;
   begin
      $display ("----------> P2EN is: %d" , ports_sfr_P2EN_i);
      if (sfr_p2en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin
            $display ("EN = 1: OK");
         end
         else
         begin 
            $display ("EN = 0: ERROR");
         end 
      end
      else //Enabled as output
      begin         
         if (en == 1'b0)
         begin
            $display ("EN = 0: OK");
         end
         else
         begin 
            $display ("EN = 1: ERROR");
         end 
      end 
   end 
endtask

// ----------------------------- P3EN --------------------------------------
task Checker_P3EN;
   input sfr_p3en;
   input en;
   begin
      $display ("----------> P3EN is: %d" , ports_sfr_P3EN_i);
      if (sfr_p3en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin
            $display ("EN = 1: OK");
         end
         else
         begin 
            $display ("EN = 0: ERROR");
         end 
      end   
      else //Enabled as output
      begin         
         if (en == 1'b0)
         begin
            $display ("EN = 0: OK");
         end
         else
         begin 
            $display ("EN = 1: ERROR");
         end 
      end 
   end 
endtask

// ----------------------------- Task  ------------------------------------- 
// --------------------------- Feature 2 -----------------------------------
// ------------- It is possible to have any data incoming ------------------
//----------------- when the port is enabled as input. ---------------------

// ----------------------------- P0EN --------------------------------------
task Checker_SFR_P0; 
   input sfr_p0en;
   input en;
   input pad;
   input sfr_p0;
   begin
      if (sfr_p0en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin           
            if (pad == sfr_p0)
            begin
               $display ("PAD = SFR_P0: OK");
            end 
            else
            begin
               $display ("PAD != SFR_P0: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end
      else 
      begin
         $display ("P0EN isn`t enabled as input");
      end   
   end  
endtask

// ----------------------------- P1EN --------------------------------------
task Checker_SFR_P1; 
   input sfr_p1en;
   input en;
   input pad;
   input sfr_p1;
   begin
      if (sfr_p1en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin           
            if (pad == sfr_p1)
            begin
               $display ("PAD = SFR_P1: OK");
            end 
            else
            begin
               $display ("PAD != SFR_P1: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end
      else 
      begin
         $display ("P1EN isn`t enabled as input");
      end   
   end  
endtask

// ----------------------------- P2EN --------------------------------------
task Checker_SFR_P2; 
   input sfr_p2en;
   input en;
   input pad;
   input sfr_p2;
   begin
      if (sfr_p2en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin           
            if (pad == sfr_p2)
            begin
               $display ("PAD = SFR_P2: OK");
            end 
            else
            begin
               $display ("PAD != SFR_P2: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end
      else 
      begin
         $display ("P2EN isn`t enabled as input");
      end   
   end
endtask

// ----------------------------- P3EN --------------------------------------
task Checker_SFR_P3; 
   input sfr_p3en;
   input en;
   input pad;
   input sfr_p3;
   begin
      if (sfr_p3en == 1'b0) //Enabled as input
      begin
         if (en == 1'b1)
         begin           
            if (pad == sfr_p3)
            begin
               $display ("PAD = SFR_P3: OK");
            end 
            else
            begin
               $display ("PAD != SFR_P3: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end
      else 
      begin
         $display ("P3EN isn`t enabled as input");
      end   
   end 
endtask

// ----------------------------- Task  -------------------------------------- 
// --------------------------- Feature 3 ------------------------------------
// ------------- It is possible to have any data leaving --------------------
//----------------- when the port is enabled as output. ---------------------

// ----------------------------- P0EN --------------------------------------
task Checker_PAD_Port0; 
   input sfr_p0en;
   input en;
   input pad;
   input sfr_p0;
   begin
      if (sfr_p0en == 1'b1) //Enabled as output
      begin
         if (en == 1'b0)
         begin
            if (pad == sfr_p0)
            begin
                $display ("PAD = SFR_P0: OK");
            end 
            else
            begin
                $display ("PAD != SFR_P0: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end 
      else 
      begin
         $display ("P0EN isn`t enabled as output");
      end 
   end 
endtask

// ----------------------------- P1EN --------------------------------------
task Checker_PAD_Port1; 
   input sfr_p1en;
   input en;
   input pad;
   input sfr_p1;
   begin
      if (sfr_p1en == 1'b1) //Enabled as output
      begin
         if (en == 1'b0)
         begin   
            if (pad == sfr_p1)
            begin
                $display ("PAD = SFR_P1: OK");
            end 
            else
            begin
                $display ("PAD != SFR_P1: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end 
      else 
      begin
         $display ("P1EN isn`t enabled as output");
      end 
   end 
endtask

// ----------------------------- P2EN --------------------------------------
task Checker_PAD_Port2; 
   input sfr_p2en;
   input en;
   input pad;
   input sfr_p2;
   begin
      if (sfr_p2en == 1'b1) //Enabled as output
      begin
         if (en == 1'b0)
         begin           
            if (pad == sfr_p2)
            begin
                $display ("PAD = SFR_P2: OK");
            end 
            else
            begin
                $display ("PAD != SFR_P2: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end 
      else 
      begin
         $display ("P2EN isn`t enabled as output");
      end 
   end 
endtask

// ----------------------------- P3EN --------------------------------------
task Checker_PAD_Port3; 
   input sfr_p3en;
   input en;
   input pad;
   input sfr_p3;
   begin
      if (sfr_p3en == 1'b1) //Enabled as output
      begin
         if (en == 1'b0)
         begin   
            if (pad == sfr_p3)
            begin
                $display ("PAD = SFR_P3: OK");
            end 
            else
            begin
                $display ("PAD != SFR_P3: ERROR");
            end 
         end 
         else 
         begin
             $display ("ERROR on EN value");
         end 
      end 
      else 
      begin
         $display ("P3EN isn`t enabled as output");
      end 
   end 
endtask

// ----------------------------- Port 4 --------------------------------------
task Checker_PAD_Port4;
   input pad;
   input sfr_p4;
   begin
      if (pad == sfr_p4)
      begin
          $display ("PAD = SFR_P4: OK");
      end 
      else
      begin
          $display ("PAD != SFR_P4: ERROR");
      end 
   end 
endtask

// ----------------------------- Tests --------------------------------------
always 
begin

   #10
   vddo = 1'b1;
   vddr = 1'b1;
   vdd  = 1'b1;
   gndo = 1'b0;
   gndr = 1'b0;
   puen = 1'b1;
   pden = 1'b0;
   pi   = 1'b1;
   
   random_1  = $random;
   random_2  = $random;
   random_3  = $random;
   random_4  = $random;
   
   random_5  = $random;
   random_6  = $random;
   random_7  = $random;
   random_8  = $random;
   random_9  = $random;
   
   temp_pad_port0  = $random;
   temp_pad_port1  = $random;
   temp_pad_port2  = $random;
   temp_pad_port3  = $random;
   
   
   ports_sfr_P0EN_i = random_1 ;   
   ports_sfr_P1EN_i = random_2 ;   
   ports_sfr_P2EN_i = random_3 ;   
   ports_sfr_P3EN_i = random_4 ;     
   
   ports_sfr_P0_i   = random_5 ;
   ports_sfr_P1_i   = random_6 ;
   ports_sfr_P2_i   = random_7 ;
   ports_sfr_P3_i   = random_8 ;     
   ports_sfr_P4_i   = random_9 ;
  
   #10
   p0_pin = 3'd0;   
   p1_pin = 3'd0;     
   p2_pin = 3'd0;     
   p3_pin = 3'd0;     
   p4_pin = 3'd0;     
       
   Checker_P0EN (ports_sfr_P0EN_i[0], en_port0_o[0]);
   Checker_P1EN (ports_sfr_P1EN_i[0], en_port1_o[0]);
   Checker_P2EN (ports_sfr_P2EN_i[0], en_port2_o[0]);
   Checker_P3EN (ports_sfr_P3EN_i[0], en_port3_o[0]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[0], en_port0_o[0], temp_pad_port0, ports_sfr_P0_o[0]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[0], en_port1_o[0], temp_pad_port1, ports_sfr_P1_o[0]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[0], en_port2_o[0], temp_pad_port2, ports_sfr_P2_o[0]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[0], en_port3_o[0], temp_pad_port3, ports_sfr_P3_o[0]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[0], en_port0_o[0], pad_port0, ports_sfr_P0_i[0]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[0], en_port1_o[0], pad_port1, ports_sfr_P1_i[0]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[0], en_port2_o[0], pad_port2, ports_sfr_P2_i[0]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[0], en_port3_o[0], pad_port3, ports_sfr_P3_i[0]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[0]);
   
   #10
   p0_pin = 3'd1;   
   p1_pin = 3'd1;     
   p2_pin = 3'd1;     
   p3_pin = 3'd1;     
   p4_pin = 3'd1;     
   
   Checker_P0EN (ports_sfr_P0EN_i[1], en_port0_o[1]);
   Checker_P1EN (ports_sfr_P1EN_i[1], en_port1_o[1]);
   Checker_P2EN (ports_sfr_P2EN_i[1], en_port2_o[1]);
   Checker_P3EN (ports_sfr_P3EN_i[1], en_port3_o[1]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[1], en_port0_o[1], temp_pad_port0, ports_sfr_P0_o[1]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[1], en_port1_o[1], temp_pad_port1, ports_sfr_P1_o[1]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[1], en_port2_o[1], temp_pad_port2, ports_sfr_P2_o[1]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[1], en_port3_o[1], temp_pad_port3, ports_sfr_P3_o[1]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[1], en_port0_o[1], pad_port0, ports_sfr_P0_i[1]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[1], en_port1_o[1], pad_port1, ports_sfr_P1_i[1]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[1], en_port2_o[1], pad_port2, ports_sfr_P2_i[1]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[1], en_port3_o[1], pad_port3, ports_sfr_P3_i[1]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[1]);
      
   #10
   p0_pin = 3'd2;   
   p1_pin = 3'd2;     
   p2_pin = 3'd2;     
   p3_pin = 3'd2;     
   p4_pin = 3'd2;     
   
   Checker_P0EN (ports_sfr_P0EN_i[2], en_port0_o[2]);
   Checker_P1EN (ports_sfr_P1EN_i[2], en_port1_o[2]);
   Checker_P2EN (ports_sfr_P2EN_i[2], en_port2_o[2]);
   Checker_P3EN (ports_sfr_P3EN_i[2], en_port3_o[2]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[2], en_port0_o[2], temp_pad_port0, ports_sfr_P0_o[2]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[2], en_port1_o[2], temp_pad_port1, ports_sfr_P1_o[2]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[2], en_port2_o[2], temp_pad_port2, ports_sfr_P2_o[2]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[2], en_port3_o[2], temp_pad_port3, ports_sfr_P3_o[2]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[2], en_port0_o[2], pad_port0, ports_sfr_P0_i[2]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[2], en_port1_o[2], pad_port1, ports_sfr_P1_i[2]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[2], en_port2_o[2], pad_port2, ports_sfr_P2_i[2]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[2], en_port3_o[2], pad_port3, ports_sfr_P3_i[2]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[2]);
      
   #10
   p0_pin = 3'd3;   
   p1_pin = 3'd3;     
   p2_pin = 3'd3;     
   p3_pin = 3'd3;     
   p4_pin = 3'd3;     
   
   Checker_P0EN (ports_sfr_P0EN_i[3], en_port0_o[3]);
   Checker_P1EN (ports_sfr_P1EN_i[3], en_port1_o[3]);
   Checker_P2EN (ports_sfr_P2EN_i[3], en_port2_o[3]);
   Checker_P3EN (ports_sfr_P3EN_i[3], en_port3_o[3]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[3], en_port0_o[3], temp_pad_port0, ports_sfr_P0_o[3]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[3], en_port1_o[3], temp_pad_port1, ports_sfr_P1_o[3]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[3], en_port2_o[3], temp_pad_port2, ports_sfr_P2_o[3]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[3], en_port3_o[3], temp_pad_port3, ports_sfr_P3_o[3]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[3], en_port0_o[3], pad_port0, ports_sfr_P0_i[3]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[3], en_port1_o[3], pad_port1, ports_sfr_P1_i[3]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[3], en_port2_o[3], pad_port2, ports_sfr_P2_i[3]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[3], en_port3_o[3], pad_port3, ports_sfr_P3_i[3]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[3]);
      
   #10
   p0_pin = 3'd4;   
   p1_pin = 3'd4;     
   p2_pin = 3'd4;     
   p3_pin = 3'd4;     
   p4_pin = 3'd4;     
   
   Checker_P0EN (ports_sfr_P0EN_i[4], en_port0_o[4]);
   Checker_P1EN (ports_sfr_P1EN_i[4], en_port1_o[4]);
   Checker_P2EN (ports_sfr_P2EN_i[4], en_port2_o[4]);
   Checker_P3EN (ports_sfr_P3EN_i[4], en_port3_o[4]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[4], en_port0_o[4], temp_pad_port0, ports_sfr_P0_o[4]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[4], en_port1_o[4], temp_pad_port1, ports_sfr_P1_o[4]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[4], en_port2_o[4], temp_pad_port2, ports_sfr_P2_o[4]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[4], en_port3_o[4], temp_pad_port3, ports_sfr_P3_o[4]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[4], en_port0_o[4], pad_port0, ports_sfr_P0_i[4]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[4], en_port1_o[4], pad_port1, ports_sfr_P1_i[4]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[4], en_port2_o[4], pad_port2, ports_sfr_P2_i[4]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[4], en_port3_o[4], pad_port3, ports_sfr_P3_i[4]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[4]);
      
   #10
   p0_pin = 3'd5;   
   p1_pin = 3'd5;     
   p2_pin = 3'd5;     
   p3_pin = 3'd5;     
   p4_pin = 3'd5;    
   
   Checker_P0EN (ports_sfr_P0EN_i[5], en_port0_o[5]);
   Checker_P1EN (ports_sfr_P1EN_i[5], en_port1_o[5]);
   Checker_P2EN (ports_sfr_P2EN_i[5], en_port2_o[5]);
   Checker_P3EN (ports_sfr_P3EN_i[5], en_port3_o[5]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[5], en_port0_o[5], temp_pad_port0, ports_sfr_P0_o[5]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[5], en_port1_o[5], temp_pad_port1, ports_sfr_P1_o[5]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[5], en_port2_o[5], temp_pad_port2, ports_sfr_P2_o[5]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[5], en_port3_o[5], temp_pad_port3, ports_sfr_P3_o[5]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[5], en_port0_o[5], pad_port0, ports_sfr_P0_i[5]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[5], en_port1_o[5], pad_port1, ports_sfr_P1_i[5]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[5], en_port2_o[5], pad_port2, ports_sfr_P2_i[5]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[5], en_port3_o[5], pad_port3, ports_sfr_P3_i[5]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[5]);
     
      #10
   p0_pin = 3'd6;   
   p1_pin = 3'd6;     
   p2_pin = 3'd6;     
   p3_pin = 3'd6;     
   p4_pin = 3'd6;    
   
   Checker_P0EN (ports_sfr_P0EN_i[6], en_port0_o[6]);
   Checker_P1EN (ports_sfr_P1EN_i[6], en_port1_o[6]);
   Checker_P2EN (ports_sfr_P2EN_i[6], en_port2_o[6]);
   Checker_P3EN (ports_sfr_P3EN_i[6], en_port3_o[6]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[6], en_port0_o[6], temp_pad_port0, ports_sfr_P0_o[6]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[6], en_port1_o[6], temp_pad_port1, ports_sfr_P1_o[6]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[6], en_port2_o[6], temp_pad_port2, ports_sfr_P2_o[6]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[6], en_port3_o[6], temp_pad_port3, ports_sfr_P3_o[6]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[6], en_port0_o[6], pad_port0, ports_sfr_P0_i[6]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[6], en_port1_o[6], pad_port1, ports_sfr_P1_i[6]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[6], en_port2_o[6], pad_port2, ports_sfr_P2_i[6]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[6], en_port3_o[6], pad_port3, ports_sfr_P3_i[6]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[6]);
      
   #10
   p0_pin = 3'd7;   
   p1_pin = 3'd7;     
   p2_pin = 3'd7;     
   p3_pin = 3'd7;     
   p4_pin = 3'd7;    
   
   Checker_P0EN (ports_sfr_P0EN_i[7], en_port0_o[7]);
   Checker_P1EN (ports_sfr_P1EN_i[7], en_port1_o[7]);
   Checker_P2EN (ports_sfr_P2EN_i[7], en_port2_o[7]);
   Checker_P3EN (ports_sfr_P3EN_i[7], en_port3_o[7]);
   
   Checker_SFR_P0 (ports_sfr_P0EN_i[7], en_port0_o[7], temp_pad_port0, ports_sfr_P0_o[7]);
   Checker_SFR_P1 (ports_sfr_P1EN_i[7], en_port1_o[7], temp_pad_port1, ports_sfr_P1_o[7]);
   Checker_SFR_P2 (ports_sfr_P2EN_i[7], en_port2_o[7], temp_pad_port2, ports_sfr_P2_o[7]);
   Checker_SFR_P3 (ports_sfr_P3EN_i[7], en_port3_o[7], temp_pad_port3, ports_sfr_P3_o[7]);
   
   Checker_PAD_Port0 (ports_sfr_P0EN_i[7], en_port0_o[7], pad_port0, ports_sfr_P0_i[7]);
   Checker_PAD_Port1 (ports_sfr_P1EN_i[7], en_port1_o[7], pad_port1, ports_sfr_P1_i[7]);
   Checker_PAD_Port2 (ports_sfr_P2EN_i[7], en_port2_o[7], pad_port2, ports_sfr_P2_i[7]);
   Checker_PAD_Port3 (ports_sfr_P3EN_i[7], en_port3_o[7], pad_port3, ports_sfr_P3_i[7]);
   
   Checker_PAD_Port4 (pad_port4, ports_sfr_P4_i[7]);
      
   #10
   p0_pin = 3'bz;   
   p1_pin = 3'bz;     
   p2_pin = 3'bz;     
   p3_pin = 3'bz;     
   p4_pin = 3'bz;  

end 

endmodule