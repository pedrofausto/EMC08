// ----------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// ----------------------------------------------------------------------
// File Name: reg_ctrl_sfr_defines.v
// Module Name: -
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// ----------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      23/08/2010  Initial Version
// 1.1      02/09/2010  Return types of all functions modified
// 1.2      23/09/2010  Included new masks to P0, P1, P2 and P3
// 1.3      30/09/2010  Included SBUF logical to physical address mapping
// ----------------------------------------------------------------------
// Description
// Functions file containing Logical to Physical Addresses Mapping
// for both, Bit and Byte addresses, and write permissions masks for 
// each register.
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// NAME: byte_log_to_phy
// TYPE: Function
// ----------------------------------------------------------------------
// PURPOSE: Maps Logical Byte Addresses to Physical Addresses
// ----------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME:    RANGE:    DESCRIPTION:                  DEFAULT: UNITS:
// logical_addr   [80h,FFh] Logical Address to be Mapped  n.a.     n.a.
// physical_addr  [00h,27h] Physical Mapped Address       n.a.     n.a.
// ----------------------------------------------------------------------
function [5:0] byte_log_to_phy;
   input [7:0] logical_addr;
   reg [5:0] physical_addr;
   begin
      case(logical_addr)
         `P0:     physical_addr=`P0_PHY;
         `SP:     physical_addr=`SP_PHY;
         `DPL:    physical_addr=`DPL_PHY;
         `DPH:    physical_addr=`DPH_PHY;
         `ACRL:   physical_addr=`ACRL_PHY;
         `ACRM:   physical_addr=`ACRM_PHY;
         `ACRH:   physical_addr=`ACRH_PHY;
         `PCON:   physical_addr=`PCON_PHY;
         `TCON:   physical_addr=`TCON_PHY;
         `TMOD:   physical_addr=`TMOD_PHY;
         `TL0:    physical_addr=`TL0_PHY;
         `TL1:    physical_addr=`TL1_PHY;
         `TH0:    physical_addr=`TH0_PHY;
         `TH1:    physical_addr=`TH1_PHY;
         `TM0:    physical_addr=`TM0_PHY;
         `TM1:    physical_addr=`TM1_PHY;
         `P1:     physical_addr=`P1_PHY;
         `SCON:   physical_addr=`SCON_PHY;
         `SBUF:   physical_addr=`SBUF_TX_PHY;
         `P2:     physical_addr=`P2_PHY;
         `IE:     physical_addr=`IE_PHY;
         `P4:     physical_addr=`P4_PHY;
         `P3:     physical_addr=`P3_PHY;
         `TACPH1: physical_addr=`TACPH1_PHY;
         `IP:     physical_addr=`IP_PHY;
         `SMAP8:  physical_addr=`SMAP8_PHY;
         `TACPL:  physical_addr=`TACPL_PHY;
         `TACPH0: physical_addr=`TACPH0_PHY;
         `RX1:    physical_addr=`RX1_PHY;
         `RX0:    physical_addr=`RX0_PHY;
         `TX1:    physical_addr=`TX1_PHY;
         `TX0:    physical_addr=`TX0_PHY;
         `P0EN:   physical_addr=`P0EN_PHY;
         `P1EN:   physical_addr=`P1EN_PHY;
         `PSW:    physical_addr=`PSW_PHY;
         `TCON2:  physical_addr=`TCON2_PHY;
         `ACC:    physical_addr=`ACC_PHY;
         `P2EN:   physical_addr=`P2EN_PHY;
         `B:      physical_addr=`B_PHY;
         `P3EN:   physical_addr=`P3EN_PHY;
         default: physical_addr=8'bzzzzzzzz;
      endcase
      byte_log_to_phy=physical_addr;
   end
endfunction

// ----------------------------------------------------------------------
// NAME: bit_log_to_phy
// TYPE: Function
// ----------------------------------------------------------------------
// PURPOSE: Maps Logical Bit Addresses to Bit Position in a Byte
// ----------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME:    RANGE:    DESCRIPTION:                  DEFAULT: UNITS:
// logical_addr   [80h,FFh] Logical Address to be Mapped  n.a.     n.a.
// physical_addr  [0h,7h]   Bit Location                  n.a.     n.a.
// ----------------------------------------------------------------------
function [2:0] bit_log_to_phy;
   input [7:0] logical_addr;
   reg [2:0] physical_addr;
   begin
      case(logical_addr)
         `P0_0: physical_addr=`P0_0_PHY;
         `P0_1: physical_addr=`P0_1_PHY;
         `P0_2: physical_addr=`P0_2_PHY;
         `P0_3: physical_addr=`P0_3_PHY;
         `P0_4: physical_addr=`P0_4_PHY;
         `P0_5: physical_addr=`P0_5_PHY;
         `P0_6: physical_addr=`P0_6_PHY;
         `P0_7: physical_addr=`P0_7_PHY;

         `TCON_IT0: physical_addr=`TCON_IT0_PHY;
         `TCON_IE0: physical_addr=`TCON_IEO_PHY;
         `TCON_IT1: physical_addr=`TCON_IT1_PHY;
         `TCON_IE1: physical_addr=`TCON_IE1_PHY;
         `TCON_TR0: physical_addr=`TCON_TR0_PHY;
         `TCON_TF0: physical_addr=`TCON_TF0_PHY;
         `TCON_TR1: physical_addr=`TCON_TR1_PHY;
         `TCON_TF1: physical_addr=`TCON_TF1_PHY;

         `P1_0: physical_addr=`P1_0_PHY;
         `P1_1: physical_addr=`P1_1_PHY;
         `P1_2: physical_addr=`P1_2_PHY;
         `P1_3: physical_addr=`P1_3_PHY;
         `P1_4: physical_addr=`P1_4_PHY;
         `P1_5: physical_addr=`P1_5_PHY;
         `P1_6: physical_addr=`P1_6_PHY;
         `P1_7: physical_addr=`P1_7_PHY;

         `SCON_RI:  physical_addr=`SCON_RI_PHY;
         `SCON_TI:  physical_addr=`SCON_TI_PHY;
         `SCON_RB8: physical_addr=`SCON_RB8_PHY;
         `SCON_TB8: physical_addr=`SCON_TB8_PHY;
         `SCON_REN: physical_addr=`SCON_REN_PHY;
         `SCON_SM2: physical_addr=`SCON_SM2_PHY;
         `SCON_SM1: physical_addr=`SCON_SM1_PHY;
         `SCON_SM0: physical_addr=`SCON_SM0_PHY;

         `P2_0: physical_addr=`P2_0_PHY;
         `P2_1: physical_addr=`P2_1_PHY;
         `P2_2: physical_addr=`P2_2_PHY;
         `P2_3: physical_addr=`P2_3_PHY;
         `P2_4: physical_addr=`P2_4_PHY;
         `P2_5: physical_addr=`P2_5_PHY;
         `P2_6: physical_addr=`P2_6_PHY;
         `P2_7: physical_addr=`P2_7_PHY;

         `IE_EX0:   physical_addr=`IE_EX0_PHY;
         `IE_ET0:   physical_addr=`IE_ET0_PHY;
         `IE_EX1:   physical_addr=`IE_EX1_PHY;
         `IE_ET1:   physical_addr=`IE_ET1_PHY;
         `IE_ES:    physical_addr=`IE_ES_PHY;
         `IE_ET2:   physical_addr=`IE_ET2_PHY;
         `IE_ETXRX: physical_addr=`IE_ETXRX_PHY;
         `IE_EA:    physical_addr=`IE_EA_PHY;

         `P3_0: physical_addr=`P3_0_PHY;
         `P3_1: physical_addr=`P3_1_PHY;
         `P3_2: physical_addr=`P3_2_PHY;
         `P3_3: physical_addr=`P3_3_PHY;
         `P3_4: physical_addr=`P3_4_PHY;
         `P3_5: physical_addr=`P3_5_PHY;
         `P3_6: physical_addr=`P3_6_PHY;
         `P3_7: physical_addr=`P3_7_PHY;

         `IP_RSV:   physical_addr=`IP_RSV_PHY;
         `IP_PX0:   physical_addr=`IP_PX0_PHY;
         `IP_PT0:   physical_addr=`IP_PT0_PHY;
         `IP_PX1:   physical_addr=`IP_PX1_PHY;
         `IP_PT1:   physical_addr=`IP_PT1_PHY;
         `IP_PS:    physical_addr=`IP_PS_PHY;
         `IP_PT2:   physical_addr=`IP_PT2_PHY;
         `IP_PTXRX: physical_addr=`IP_PTXRX_PHY;

         `P0EN_0: physical_addr=`P0EN_0_PHY;
         `P0EN_1: physical_addr=`P0EN_1_PHY;
         `P0EN_2: physical_addr=`P0EN_2_PHY;
         `P0EN_3: physical_addr=`P0EN_3_PHY;
         `P0EN_4: physical_addr=`P0EN_4_PHY;
         `P0EN_5: physical_addr=`P0EN_5_PHY;
         `P0EN_6: physical_addr=`P0EN_6_PHY;
         `P0EN_7: physical_addr=`P0EN_7_PHY;

         `P1EN_0: physical_addr=`P1EN_0_PHY;
         `P1EN_1: physical_addr=`P1EN_1_PHY;
         `P1EN_2: physical_addr=`P1EN_2_PHY;
         `P1EN_3: physical_addr=`P1EN_3_PHY;
         `P1EN_4: physical_addr=`P1EN_4_PHY;
         `P1EN_5: physical_addr=`P1EN_5_PHY;
         `P1EN_6: physical_addr=`P1EN_6_PHY;
         `P1EN_7: physical_addr=`P1EN_7_PHY;

         `PSW_P:   physical_addr=`PSW_P_PHY;
         `PSW_RSV: physical_addr=`PSW_RSV_PHY;
         `PSW_OV:  physical_addr=`PSW_OV_PHY;
         `PSW_RS0: physical_addr=`PSW_RS0_PHY;
         `PSW_RS1: physical_addr=`PSW_RS1_PHY;
         `PSW_F0:  physical_addr=`PSW_F0_PHY;
         `PSW_AC:  physical_addr=`PSW_AC_PHY;
         `PSW_CY:  physical_addr=`PSW_CY_PHY;

         `TCON2_EDGSEL: physical_addr=`TCON2_EDGSEL_PHY;
         `TCON2_DFSEL:  physical_addr=`TCON2_DFSEL_PHY;
         `TCON2_DFP0:   physical_addr=`TCON2_DFP0_PHY;
         `TCON2_DFP1:   physical_addr=`TCON2_DFP1_PHY;
         `TCON2_DFP2:   physical_addr=`TCON2_DFP2_PHY;
         `TCON2_TF2:    physical_addr=`TCON2_TF2_PHY;
         `TCON2_TR2:    physical_addr=`TCON2_TR2_PHY;

         `ACC_0: physical_addr=`ACC_0_PHY;
         `ACC_1: physical_addr=`ACC_1_PHY;
         `ACC_2: physical_addr=`ACC_2_PHY;
         `ACC_3: physical_addr=`ACC_3_PHY;
         `ACC_4: physical_addr=`ACC_4_PHY;
         `ACC_5: physical_addr=`ACC_5_PHY;
         `ACC_6: physical_addr=`ACC_6_PHY;
         `ACC_7: physical_addr=`ACC_7_PHY;

         `P2EN_0: physical_addr=`P2EN_0_PHY;
         `P2EN_1: physical_addr=`P2EN_1_PHY;
         `P2EN_2: physical_addr=`P2EN_2_PHY;
         `P2EN_3: physical_addr=`P2EN_3_PHY;
         `P2EN_4: physical_addr=`P2EN_4_PHY;
         `P2EN_5: physical_addr=`P2EN_5_PHY;
         `P2EN_6: physical_addr=`P2EN_6_PHY;
         `P2EN_7: physical_addr=`P2EN_7_PHY;

         `B_0: physical_addr=`B_0_PHY;
         `B_1: physical_addr=`B_1_PHY;
         `B_2: physical_addr=`B_2_PHY;
         `B_3: physical_addr=`B_3_PHY;
         `B_4: physical_addr=`B_4_PHY;
         `B_5: physical_addr=`B_5_PHY;
         `B_6: physical_addr=`B_6_PHY;
         `B_7: physical_addr=`B_7_PHY;

         `P3EN_0: physical_addr=`P3EN_0_PHY;
         `P3EN_1: physical_addr=`P3EN_1_PHY;
         `P3EN_2: physical_addr=`P3EN_2_PHY;
         `P3EN_3: physical_addr=`P3EN_3_PHY;
         `P3EN_4: physical_addr=`P3EN_4_PHY;
         `P3EN_5: physical_addr=`P3EN_5_PHY;
         `P3EN_6: physical_addr=`P3EN_6_PHY;
         `P3EN_7: physical_addr=`P3EN_7_PHY;
      endcase
      bit_log_to_phy=physical_addr;
   end
endfunction

// ----------------------------------------------------------------------
// NAME: log_bit_to_phy_byte
// TYPE: Function
// ----------------------------------------------------------------------
// PURPOSE: Maps Logical Bit Addresses to Physical Byte Address
// ----------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME:    RANGE:    DESCRIPTION:                  DEFAULT: UNITS:
// logical_addr   [80h,FFh] Logical Address to be Mapped  n.a.     n.a.
// physical_addr  [00h,27]  Mapped Byte Address           n.a.     n.a.
// ----------------------------------------------------------------------

function [5:0] log_bit_to_phy_byte;
   input [7:0] logical_addr;
   reg [5:0] physical_addr;
   begin
      case(logical_addr)
         `P0_0,`P0_1,`P0_2,`P0_3,`P0_4,`P0_5,`P0_6,`P0_7:                                                   physical_addr=`P0_PHY;
         `TCON_IT0,`TCON_IE0,`TCON_IT1,`TCON_IE1,`TCON_TR0,`TCON_TF0,`TCON_TR1,`TCON_TF1:                   physical_addr=`TCON_PHY;
         `P1_0,`P1_1,`P1_2,`P1_3,`P1_4,`P1_5,`P1_6,`P1_7:                                                   physical_addr=`P1_PHY;
         `SCON_RI,`SCON_TI,`SCON_RB8,`SCON_TB8,`SCON_REN,`SCON_SM2,`SCON_SM1,`SCON_SM0:                     physical_addr=`SCON_PHY;
         `P2_0,`P2_1,`P2_2,`P2_3,`P2_4,`P2_5,`P2_6,`P2_7:                                                   physical_addr=`P2_PHY;
         `IE_EX0,`IE_ET0,`IE_EX1,`IE_ET1,`IE_ES,`IE_ET2,`IE_ETXRX,`IE_EA:                                   physical_addr=`IE_PHY;
         `P3_0,`P3_1,`P3_2,`P3_3,`P3_4,`P3_5,`P3_6,`P3_7:                                                   physical_addr=`P3_PHY;
         `IP_PX0,`IP_PT0,`IP_PX1,`IP_PT1,`IP_PS,`IP_PT2,`IP_PTXRX,`IP_RSV:                                  physical_addr=`IP_PHY;
         `P0EN_0,`P0EN_1,`P0EN_2,`P0EN_3,`P0EN_4,`P0EN_5,`P0EN_6,`P0EN_7:                                   physical_addr=`P0EN_PHY;
         `P1EN_0,`P1EN_1,`P1EN_2,`P1EN_3,`P1EN_4,`P1EN_5,`P1EN_6,`P1EN_7:                                   physical_addr=`P1EN_PHY;
         `PSW_P,`PSW_RSV,`PSW_OV,`PSW_RS0,`PSW_RS1,`PSW_F0,`PSW_AC,`PSW_CY:                                 physical_addr=`PSW_PHY;
         `TCON2_TXRXF,`TCON2_EDGSEL,`TCON2_DFSEL,`TCON2_DFP0,`TCON2_DFP1,`TCON2_DFP2,`TCON2_TF2,`TCON2_TR2: physical_addr=`TCON2_PHY;
         `ACC_0,`ACC_1,`ACC_2,`ACC_3,`ACC_4,`ACC_5,`ACC_6,`ACC_7:                                           physical_addr=`ACC_PHY;
         `P2EN_0,`P2EN_1,`P2EN_2,`P2EN_3,`P2EN_4,`P2EN_5,`P2EN_6,`P2EN_7:                                   physical_addr=`P2EN_PHY;
         `B_0,`B_1,`B_2,`B_3,`B_4,`B_5,`B_6,`B_7:                                                           physical_addr=`B_PHY;
         `P3EN_0,`P3EN_1,`P3EN_2,`P3EN_3,`P3EN_4,`P3EN_5,`P3EN_6,`P3EN_7:                                   physical_addr=`P3EN_PHY;
      endcase
      log_bit_to_phy_byte=physical_addr;
   end
endfunction


// ----------------------------------------------------------------------
// NAME: log_bit_to_phy_byte
// TYPE: Function
// ----------------------------------------------------------------------
// PURPOSE: Maps Logical Bit Addresses to Logical Byte Address
// ----------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME:    RANGE:    DESCRIPTION:                  DEFAULT: UNITS:
// logical_addr   [80h,FFh] Logical Address to be Mapped  n.a.     n.a.
// physical_addr  [00h,27]  Mapped Byte Address           n.a.     n.a.
// ----------------------------------------------------------------------

function [7:0] log_bit_to_log_byte;
   input [7:0] logical_bit_addr;
   reg [7:0] logical_byte_addr;
   begin
      case(logical_bit_addr)
         `P0_0,`P0_1,`P0_2,`P0_3,`P0_4,`P0_5,`P0_6,`P0_7:                                                   logical_byte_addr=`P0;
         `TCON_IT0,`TCON_IE0,`TCON_IT1,`TCON_IE1,`TCON_TR0,`TCON_TF0,`TCON_TR1,`TCON_TF1:                   logical_byte_addr=`TCON;
         `P1_0,`P1_1,`P1_2,`P1_3,`P1_4,`P1_5,`P1_6,`P1_7:                                                   logical_byte_addr=`P1;
         `SCON_RI,`SCON_TI,`SCON_RB8,`SCON_TB8,`SCON_REN,`SCON_SM2,`SCON_SM1,`SCON_SM0:                     logical_byte_addr=`SCON;
         `P2_0,`P2_1,`P2_2,`P2_3,`P2_4,`P2_5,`P2_6,`P2_7:                                                   logical_byte_addr=`P2;
         `IE_EX0,`IE_ET0,`IE_EX1,`IE_ET1,`IE_ES,`IE_ET2,`IE_ETXRX,`IE_EA:                                   logical_byte_addr=`IE;
         `P3_0,`P3_1,`P3_2,`P3_3,`P3_4,`P3_5,`P3_6,`P3_7:                                                   logical_byte_addr=`P3;
         `IP_PX0,`IP_PT0,`IP_PX1,`IP_PT1,`IP_PS,`IP_PT2,`IP_PTXRX,`IP_RSV:                                  logical_byte_addr=`IP;
         `P0EN_0,`P0EN_1,`P0EN_2,`P0EN_3,`P0EN_4,`P0EN_5,`P0EN_6,`P0EN_7:                                   logical_byte_addr=`P0EN;
         `P1EN_0,`P1EN_1,`P1EN_2,`P1EN_3,`P1EN_4,`P1EN_5,`P1EN_6,`P1EN_7:                                   logical_byte_addr=`P1EN;
         `PSW_P,`PSW_RSV,`PSW_OV,`PSW_RS0,`PSW_RS1,`PSW_F0,`PSW_AC,`PSW_CY:                                 logical_byte_addr=`PSW;
         `TCON2_TXRXF,`TCON2_EDGSEL,`TCON2_DFSEL,`TCON2_DFP0,`TCON2_DFP1,`TCON2_DFP2,`TCON2_TF2,`TCON2_TR2: logical_byte_addr=`TCON2;
         `ACC_0,`ACC_1,`ACC_2,`ACC_3,`ACC_4,`ACC_5,`ACC_6,`ACC_7:                                           logical_byte_addr=`ACC;
         `P2EN_0,`P2EN_1,`P2EN_2,`P2EN_3,`P2EN_4,`P2EN_5,`P2EN_6,`P2EN_7:                                   logical_byte_addr=`P2EN;
         `B_0,`B_1,`B_2,`B_3,`B_4,`B_5,`B_6,`B_7:                                                           logical_byte_addr=`B;
         `P3EN_0,`P3EN_1,`P3EN_2,`P3EN_3,`P3EN_4,`P3EN_5,`P3EN_6,`P3EN_7:                                   logical_byte_addr=`P3EN;
      endcase
      log_bit_to_log_byte=logical_byte_addr;
   end
endfunction

// ----------------------------------------------------------------------
// NAME: write_mask
// TYPE: Function
// ----------------------------------------------------------------------
// PURPOSE: Creates masks to control the write permissions for each reg
// ----------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME:    RANGE:    DESCRIPTION:                  DEFAULT: UNITS:
// logical_addr   [80h,FFh] Logical Address to be Mapped  n.a.     n.a.
// data_mask      [00h,FFh] Data mask                     n.a.     n.a.
// ----------------------------------------------------------------------

function [7:0] write_mask;
   input [7:0] logical_addr;
   reg [7:0] data_mask;
   begin
      case(logical_addr)
         `SP:                 data_mask=`SP_MASK;
         `DPL:                data_mask=`DPL_MASK;
         `DPH:                data_mask=`DPH_MASK;
         `ACRL:               data_mask=`ACRL_MASK;
         `ACRM:               data_mask=`ACRM_MASK;
         `ACRH:               data_mask=`ACRH_MASK;
         `PCON:               data_mask=`PCON_MASK;
         `TCON:               data_mask=`TCON_MASK;
         `TMOD:               data_mask=`TMOD_MASK;
         `TL0:                data_mask=`TL0_MASK;
         `TL1:                data_mask=`TL1_MASK;
         `TH0:                data_mask=`TH0_MASK;
         `TH1:                data_mask=`TH1_MASK;
         `TM0:                data_mask=`TM0_MASK;
         `TM1:                data_mask=`TM1_MASK;
         `SCON:               data_mask=`SCON_MASK;
         `SBUF:               data_mask=`SBUF_MASK;
         `IE:                 data_mask=`IE_MASK;
         `P4:                 data_mask=`P4_MASK;
         `TACPH1:             data_mask=`TACPH1_MASK;
         `IP:                 data_mask=`IP_MASK;
         `SMAP8:              data_mask=`SMAP8_MASK;
         `TACPL:              data_mask=`TACPL_MASK;
         `TACPH0:             data_mask=`TACPH0_MASK;
         `RX1:                data_mask=`RX1_MASK;
         `RX0:                data_mask=`RX0_MASK;
         `TX1:                data_mask=`TX1_MASK;
         `TX0:                data_mask=`TX0_MASK;
         `P0EN:               data_mask=`P0EN_MASK;
         `P1EN:               data_mask=`P1EN_MASK;
         `PSW:                data_mask=`PSW_MASK;
         `TCON2:              data_mask=`TCON2_MASK;
         `ACC:                data_mask=`ACC_MASK;
         `P2EN:               data_mask=`P2EN_MASK;
         `B:                  data_mask=`B_MASK;
         `P3EN:               data_mask=`P3EN_MASK;
         `P0,`P1,`P2,`P3:     data_mask=8'b11111111;
         default:             data_mask=8'b00000000;
      endcase
      write_mask=data_mask;
   end
endfunction

// ----------------------------------------------------------------------
// NAME: output_mask
// TYPE: Function
// ----------------------------------------------------------------------
// PURPOSE: Creates masks for data to be written to ports
// ----------------------------------------------------------------------
// PARAMETERS
// PARAM_NAME:    RANGE:    DESCRIPTION:                  DEFAULT: UNITS:
// data           [00h,FFh] Data to be masked             n.a.     n.a.
// mask           [00h,27]  Masked data                   n.a.     n.a.
// ----------------------------------------------------------------------

function [7:0] output_mask;
   input [7:0] data;
   input [7:0] mask;
   integer i;
   begin
      output_mask=8'bzzzzzzzz;
      for(i=0;i<8;i=i+1)
      begin
         if(mask[i]) output_mask[i]=data[i]; else output_mask[i]=1'bz;
      end
   end
endfunction

