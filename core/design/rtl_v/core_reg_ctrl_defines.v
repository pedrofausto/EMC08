// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_reg_ctrl_defines.v
// Module Name: -
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      23/08/2010  Initial Version
// -------------------------------------------------------------------
// Description
// Define file containing Logical to Physical Addresses Mapping
// for both, Bit and Byte addresses, and write permissions masks for 
// each register.
// -------------------------------------------------------------------

// Byte Addressable Locations

`define P0                 8'h80
`define P0_PHY             6'd00

`define SP                 8'h81
`define SP_PHY             6'd01
`define SP_MASK            8'b11111111

`define DPL                8'h82
`define DPL_PHY            6'd02
`define DPL_MASK           8'b11111111

`define DPH                8'h83
`define DPH_PHY            6'd03
`define DPH_MASK           8'b11111111

`define ACRL               8'h84
`define ACRL_PHY           6'd04
`define ACRL_MASK          8'b11111111

`define ACRM               8'h85
`define ACRM_PHY           6'd05
`define ACRM_MASK          8'b11111111

`define ACRH               8'h86
`define ACRH_PHY           6'd06
`define ACRH_MASK          8'b11111111

`define PCON               8'h87
`define PCON_PHY           6'd07
`define PCON_MASK          8'b10001110

`define TCON               8'h88
`define TCON_PHY           6'd08
`define TCON_MASK          8'b01010101

`define TMOD               8'h89
`define TMOD_PHY           6'd09
`define TMOD_MASK          8'b10111011

`define TL0                8'h8A
`define TL0_PHY            6'd10
`define TL0_MASK           8'b11111111

`define TL1                8'h8B
`define TL1_PHY            6'd11
`define TL1_MASK           8'b11111111

`define TH0                8'h8C
`define TH0_PHY            6'd12
`define TH0_MASK           8'b11111111

`define TH1                8'h8D
`define TH1_PHY            6'd13
`define TH1_MASK           8'b11111111

`define TM0                8'h8E
`define TM0_PHY            6'd14
`define TM0_MASK           8'b11111111

`define TM1                8'h8F
`define TM1_PHY            6'd15
`define TM1_MASK           8'b11111111

`define P1                 8'h90
`define P1_PHY             6'd16

`define SCON               8'h98
`define SCON_PHY           6'd17
`define SCON_MASK          8'b11111111

`define SBUF               8'h99
`define SBUF_RX_PHY        6'd18
`define SBUF_TX_PHY        6'd19
`define SBUF_MASK          8'b11111111

`define P2                 8'hA0
`define P2_PHY             6'd20

`define IE                 8'hA8
`define IE_PHY             6'd21
`define IE_MASK            8'b11111111

`define P4                 8'hAF
`define P4_PHY             6'd22
`define P4_MASK            8'b11111111

`define P3                 8'hB0
`define P3_PHY             6'd23

`define TACPH1             8'hB7
`define TACPH1_PHY         6'd40
`define TACPH1_MASK        8'b11111111

`define IP                 8'hB8
`define IP_PHY             6'd24
`define IP_MASK            8'b01111111

`define SMAP8              8'hB9
`define SMAP8_PHY          6'd25
`define SMAP8_MASK         8'b11111111

`define TACPL              8'hBA
`define TACPL_PHY          6'd26
`define TACPL_MASK         8'b11111111

`define TACPH0             8'hBB
`define TACPH0_PHY         6'd27
`define TACPH0_MASK        8'b11111111

`define RX1                8'hBC
`define RX1_PHY            6'd28
`define RX1_MASK           8'b11111111

`define RX0                8'hBD
`define RX0_PHY            6'd29
`define RX0_MASK           8'b11111111

`define TX1                8'hBE
`define TX1_PHY            6'd30
`define TX1_MASK           8'b11111111

`define TX0                8'hBF
`define TX0_PHY            6'd31
`define TX0_MASK           8'b11111111

`define P0EN               8'hC0
`define P0EN_PHY           6'd32
`define P0EN_MASK          8'b11111111

`define P1EN               8'hC8
`define P1EN_PHY           6'd33
`define P1EN_MASK          8'b11111111

`define PSW                8'hD0
`define PSW_PHY            6'd34
`define PSW_MASK           8'b11111100

`define TCON2              8'hD8
`define TCON2_PHY          6'd35
`define TCON2_MASK         8'b11111111

`define ACC                8'hE0
`define ACC_PHY            6'd36
`define ACC_MASK           8'b11111111

`define P2EN               8'hE8
`define P2EN_PHY           6'd37
`define P2EN_MASK          8'b11111111

`define B                  8'hF0
`define B_PHY              6'd38
`define B_MASK             8'b11111111

`define P3EN               8'hF8
`define P3EN_PHY           6'd39
`define P3EN_MASK          8'b11111111



// Bit Addressable Locations

`define P0_0               8'h80
`define P0_0_PHY           3'h0
  
`define P0_1               8'h81
`define P0_1_PHY           3'h1

`define P0_2               8'h82
`define P0_2_PHY           3'h2
  
`define P0_3               8'h83
`define P0_3_PHY           3'h3

`define P0_4               8'h84
`define P0_4_PHY           3'h4
  
`define P0_5               8'h85
`define P0_5_PHY           3'h5

`define P0_6               8'h86
`define P0_6_PHY           3'h6
  
`define P0_7               8'h87
`define P0_7_PHY           3'h7

`define TCON_IT0           8'h88
`define TCON_IT0_PHY       3'h0
  
`define TCON_IE0           8'h89
`define TCON_IEO_PHY       3'h1

`define TCON_IT1           8'h8A
`define TCON_IT1_PHY       3'h2
  
`define TCON_IE1           8'h8B
`define TCON_IE1_PHY       3'h3
 
`define TCON_TR0           8'h8C
`define TCON_TR0_PHY       3'h4
  
`define TCON_TF0           8'h8D
`define TCON_TF0_PHY       3'h5

`define TCON_TR1           8'h8E
`define TCON_TR1_PHY       3'h6
  
`define TCON_TF1           8'h8F
`define TCON_TF1_PHY       3'h7

`define P1_0               8'h90
`define P1_0_PHY           3'h0
  
`define P1_1               8'h91
`define P1_1_PHY           3'h1

`define P1_2               8'h92
`define P1_2_PHY           3'h2
  
`define P1_3               8'h93
`define P1_3_PHY           3'h3

`define P1_4               8'h94
`define P1_4_PHY           3'h4
  
`define P1_5               8'h95
`define P1_5_PHY           3'h5

`define P1_6               8'h96
`define P1_6_PHY           3'h6
  
`define P1_7               8'h97
`define P1_7_PHY           3'h7

`define SCON_RI            8'h98
`define SCON_RI_PHY        3'h0
  
`define SCON_TI            8'h99
`define SCON_TI_PHY        3'h1

`define SCON_RB8           8'h9A
`define SCON_RB8_PHY       3'h2
  
`define SCON_TB8           8'h9B
`define SCON_TB8_PHY       3'h3
 
`define SCON_REN           8'h9C
`define SCON_REN_PHY       3'h4
  
`define SCON_SM2           8'h9D
`define SCON_SM2_PHY       3'h5

`define SCON_SM1           8'h9E
`define SCON_SM1_PHY       3'h6
  
`define SCON_SM0           8'h9F
`define SCON_SM0_PHY       3'h7

`define P2_0               8'hA0
`define P2_0_PHY           3'h0
  
`define P2_1               8'hA1
`define P2_1_PHY           3'h1

`define P2_2               8'hA2
`define P2_2_PHY           3'h2
  
`define P2_3               8'hA3
`define P2_3_PHY           3'h3

`define P2_4               8'hA4
`define P2_4_PHY           3'h4
  
`define P2_5               8'hA5
`define P2_5_PHY           3'h5

`define P2_6               8'hA6
`define P2_6_PHY           3'h6
  
`define P2_7               8'hA7
`define P2_7_PHY           3'h7

`define IE_EX0             8'hA8
`define IE_EX0_PHY         3'h0
  
`define IE_ET0             8'hA9
`define IE_ET0_PHY         3'h1

`define IE_EX1             8'hAA
`define IE_EX1_PHY         3'h2
  
`define IE_ET1             8'hAB
`define IE_ET1_PHY         3'h3
 
`define IE_ES              8'hAC
`define IE_ES_PHY          3'h4
  
`define IE_ET2             8'hAD
`define IE_ET2_PHY         3'h5

`define IE_ETXRX           8'hAE
`define IE_ETXRX_PHY       3'h6
  
`define IE_EA              8'hAF
`define IE_EA_PHY          3'h7

`define P3_0               8'hB0
`define P3_0_PHY           3'h0
  
`define P3_1               8'hB1
`define P3_1_PHY           3'h1

`define P3_2               8'hB2
`define P3_2_PHY           3'h2
  
`define P3_3               8'hB3
`define P3_3_PHY           3'h3

`define P3_4               8'hB4
`define P3_4_PHY           3'h4
  
`define P3_5               8'hB5
`define P3_5_PHY           3'h5

`define P3_6               8'hB6
`define P3_6_PHY           3'h6
  
`define P3_7               8'hB7
`define P3_7_PHY           3'h7

`define IP_PX0             8'hB8
`define IP_PX0_PHY         3'h0
  
`define IP_PT0             8'hB9
`define IP_PT0_PHY         3'h1

`define IP_PX1             8'hBA
`define IP_PX1_PHY         3'h2
  
`define IP_PT1             8'hBB
`define IP_PT1_PHY         3'h3
 
`define IP_PS              8'hBC
`define IP_PS_PHY          3'h4
  
`define IP_PT2             8'hBD
`define IP_PT2_PHY         3'h5

`define IP_PTXRX           8'hBE
`define IP_PTXRX_PHY       3'h6

`define IP_RSV             8'hBF
`define IP_RSV_PHY         3'h7

`define P0EN_0             8'hC0
`define P0EN_0_PHY         3'h0
  
`define P0EN_1             8'hC1
`define P0EN_1_PHY         3'h1

`define P0EN_2             8'hC2
`define P0EN_2_PHY         3'h2
  
`define P0EN_3             8'hC3
`define P0EN_3_PHY         3'h3

`define P0EN_4             8'hC4
`define P0EN_4_PHY         3'h4
  
`define P0EN_5             8'hC5
`define P0EN_5_PHY         3'h5

`define P0EN_6             8'hC6
`define P0EN_6_PHY         3'h6
  
`define P0EN_7             8'hC7
`define P0EN_7_PHY         3'h7

`define P1EN_0             8'hC8
`define P1EN_0_PHY         3'h0
  
`define P1EN_1             8'hC9
`define P1EN_1_PHY         3'h1

`define P1EN_2             8'hCA
`define P1EN_2_PHY         3'h2
  
`define P1EN_3             8'hCB
`define P1EN_3_PHY         3'h3

`define P1EN_4             8'hCC
`define P1EN_4_PHY         3'h4
  
`define P1EN_5             8'hCD
`define P1EN_5_PHY         3'h5

`define P1EN_6             8'hCE
`define P1EN_6_PHY         3'h6
  
`define P1EN_7             8'hCF
`define P1EN_7_PHY         3'h7

`define PSW_P              8'hD0
`define PSW_P_PHY          3'h0

`define PSW_RSV            8'hD1
`define PSW_RSV_PHY        3'h1
  
`define PSW_OV             8'hD2
`define PSW_OV_PHY         3'h2
  
`define PSW_RS0            8'hD3
`define PSW_RS0_PHY        3'h3

`define PSW_RS1            8'hD4
`define PSW_RS1_PHY        3'h4
  
`define PSW_F0             8'hD5
`define PSW_F0_PHY         3'h5

`define PSW_AC             8'hD6
`define PSW_AC_PHY         3'h6
  
`define PSW_CY             8'hD7
`define PSW_CY_PHY         3'h7

`define TCON2_EDGSEL       8'hD8
`define TCON2_EDGSEL_PHY   3'h0
  
`define TCON2_DFSEL        8'hD9
`define TCON2_DFSEL_PHY    3'h1

`define TCON2_DFP0         8'hDA
`define TCON2_DFP0_PHY     3'h2
  
`define TCON2_DFP1         8'hDB
`define TCON2_DFP1_PHY     3'h3

`define TCON2_DFP2         8'hDC
`define TCON2_DFP2_PHY     3'h4
  
`define TCON2_TF2          8'hDD
`define TCON2_TF2_PHY      3'h5

`define TCON2_TR2          8'hDE
`define TCON2_TR2_PHY      3'h6

`define TCON2_TXRXF        8'hDF
`define TCON2_TXRXF_PHY    3'h7

`define ACC_0              8'hE0
`define ACC_0_PHY          3'h0
  
`define ACC_1              8'hE1
`define ACC_1_PHY          3'h1

`define ACC_2              8'hE2
`define ACC_2_PHY          3'h2
  
`define ACC_3              8'hE3
`define ACC_3_PHY          3'h3

`define ACC_4              8'hE4
`define ACC_4_PHY          3'h4
  
`define ACC_5              8'hE5
`define ACC_5_PHY          3'h5

`define ACC_6              8'hE6
`define ACC_6_PHY          3'h6
  
`define ACC_7              8'hE7
`define ACC_7_PHY          3'h7

`define P2EN_0             8'hE8
`define P2EN_0_PHY         3'h0
  
`define P2EN_1             8'hE9
`define P2EN_1_PHY         3'h1

`define P2EN_2             8'hEA
`define P2EN_2_PHY         3'h2
  
`define P2EN_3             8'hEB
`define P2EN_3_PHY         3'h3

`define P2EN_4             8'hEC
`define P2EN_4_PHY         3'h4
  
`define P2EN_5             8'hED
`define P2EN_5_PHY         3'h5

`define P2EN_6             8'hEE
`define P2EN_6_PHY         3'h6
  
`define P2EN_7             8'hEF
`define P2EN_7_PHY         3'h7

`define B_0                8'hF0
`define B_0_PHY            3'h0
  
`define B_1                8'hF1
`define B_1_PHY            3'h1

`define B_2                8'hF2
`define B_2_PHY            3'h2
  
`define B_3                8'hF3
`define B_3_PHY            3'h3

`define B_4                8'hF4
`define B_4_PHY            3'h4
  
`define B_5                8'hF5
`define B_5_PHY            3'h5

`define B_6                8'hF6
`define B_6_PHY            3'h6
  
`define B_7                8'hF7
`define B_7_PHY            3'h7

`define P3EN_0             8'hF8
`define P3EN_0_PHY         3'h0
  
`define P3EN_1             8'hF9
`define P3EN_1_PHY         3'h1

`define P3EN_2             8'hFA
`define P3EN_2_PHY         3'h2
  
`define P3EN_3             8'hFB
`define P3EN_3_PHY         3'h3

`define P3EN_4             8'hFC
`define P3EN_4_PHY         3'h4
  
`define P3EN_5             8'hFD
`define P3EN_5_PHY         3'h5

`define P3EN_6             8'hFE
`define P3EN_6_PHY         3'h6
  
`define P3EN_7             8'hFF
`define P3EN_7_PHY         3'h7

`define PCON_SMOD_PHY      3'h7
`define PCON_RS232_PHY     3'h2

`define TMOD_M0_T0_PHY     3'h0
`define TMOD_M1_T0_PHY     3'h1
`define TMOD_GATE_T0_PHY   3'h3 
`define TMOD_M0_T1_PHY     3'h4
`define TMOD_M1_T1_PHY     3'h5
`define TMOD_GATE_T1_PHY   3'h7
