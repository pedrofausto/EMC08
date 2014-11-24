// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_reg_ctrl.v
// Module Name: core_reg_ctrl
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      31/08/2010  Initial Version
// 1.1      01/09/2010  Fixed some bugs in interruption flags access
// 1.2      01/09/2010  Updated Include Files directories path
// -------------------------------------------------------------------
// Description
// Core Submodule responsible for control read and write access to 
// Special Function Registers.
// -------------------------------------------------------------------

module core_reg_ctrl(
               reg_ctrl_clk_i,                   // Memory Clock
               reg_ctrl_reset_b_i,                 // System Reset

               reg_ctrl_fsm_wr_b_i,                // SFR File Write Enable from Core/FSM
               reg_ctrl_fsm_rd_b_i,                // SFR File Read Enable from Core/FSM
               reg_ctrl_fsm_byte_b_i,              // SFR Byte/Bit Flag from Core/FSM
               reg_ctrl_fsm_addr_i,                // SFR Read/Write Address from Core/FSM
               reg_ctrl_fsm_data_i,                // SFR Data in from Core/FSM

               reg_ctrl_fsm_serial_tx_i,           // Transmission Start Flag from Core/FSM

               reg_ctrl_timers_th0_i,              // Timer 0 Counter Register High Nibble from Timers
               reg_ctrl_timers_tm0_i,              // Timer 0 Counter Register Middle Nibble from Timers
               reg_ctrl_timers_tl0_i,              // Timer 0 Counter Register Low Nibble from Timers
               reg_ctrl_timers_tf0_i,              // Timer 0 Overflow flag from Timers
               reg_ctrl_timers_th1_i,              // Timer 1 Counter Register High Nibble from Timers
               reg_ctrl_timers_tm1_i,              // Timer 1 Counter Register Middle Nibble from Timers
               reg_ctrl_timers_tl1_i,              // Timer 1 Counter Register Low Nibble from Timers
               reg_ctrl_timers_tf1_i,              // Timer 1 Overflow flag from Timers
               reg_ctrl_timers_acrh_i,             // Timer 2 Angle Counter Register High Nibble from Timers
               reg_ctrl_timers_acrm_i,             // Timer 2 Angle Counter Register Middle Nibble from Timers
               reg_ctrl_timers_acrl_i,             // Timer 2 Angle Counter Register Low Nibble from Timers
               reg_ctrl_timers_tf2_i,              // Timer 2 Overflow flag from Timers

               reg_ctrl_alu_cy_i,                  // Carry flag from Core/ALU
               reg_ctrl_alu_ac_i,                  // Auxiliary flag from Core/ALU
               reg_ctrl_alu_ov_i,                  // Overflow flag from Core/ALU

               reg_ctrl_mem_ctrl_ext_mem_en_b_i,   // Flag set by Core/MemCtrl to indicate External Memory access

               reg_ctrl_bus_control_p0en_i,        // P0EN input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p2en_i,        // P2EN input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p3en_6_i,      // P3EN[6] input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p3en_7_i,      // P3EN[7] input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p2_i,          // P2 input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p3_6_i,        // P3[6] input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p3_7_i,        // P3[7] input from Bus Control in External Memory access mode
               reg_ctrl_bus_control_p4_i,          // P4 input from Bus Control in External Memory access mode

               reg_ctrl_interrupt_ie0_i,           // External Interrupt 0 Flag from Interruption module
               reg_ctrl_interrupt_ie1_i,           // External Interrupt 1 Flag input from Interruption module
               reg_ctrl_interrupt_ri_i,            // Serial Receive Flag from Interruption module
               reg_ctrl_interrupt_ti_i,            // Serial Transmit Flag from Interruption module
               reg_ctrl_interrupt_tf0_i,           // Timer 1 Flag from Interruption module
               reg_ctrl_interrupt_tf1_i,           // Timer 0 Flag from Interruption module
               reg_ctrl_interrupt_tf2_i,           // Timer 2 Flag from Interruption module
               reg_ctrl_interrupt_txrxf_i,         // TX/RX Flag from Interruption module
               reg_ctrl_interrupt_clear_i,         // Flag set by Interruption module when interruption need to be ignored

               reg_ctrl_serial_p3en_0_i,           // P3EN[0] from Serial
               reg_ctrl_serial_p3en_1_i,           // P3EN[1] from Serial
               reg_ctrl_serial_p3_0_i,             // P3[0] Port from Serial
               reg_ctrl_serial_p3_1_i,             // P3[1] Port from Serial
               reg_ctrl_serial_sbuf_rx_i,          // Reception Buffer from Serial
               reg_ctrl_serial_rb8_i,              // 9th Reception bit in Mode 1 from Serial
               reg_ctrl_serial_ti_i,               // Transmission Interruption Flag to Serial
               reg_ctrl_serial_ri_i,               // Reception Interruption Flag to Serial


               reg_ctrl_ports_p0_io,               // P0 Bus from/to Ports in General Purpose Mode
               reg_ctrl_ports_p1_io,               // P1 Bus from/to Ports in General Purpose Mode
               reg_ctrl_ports_p2_io,               // P2 Bus from/to Ports in General Purpose Mode
               reg_ctrl_ports_p3_io,               // P3 Bus from/to Ports in General Purpose Mode

               reg_ctrl_bus_control_p0_io,         // P0 Bus from/to Bus Control when accessing external memory

               reg_ctrl_fsm_data_o,                // SFR Data out to Core/FSM

               reg_ctrl_alu_cy_o,                  // Carry flag to Core/ALU
               reg_ctrl_alu_ac_o,                  // Auxiliary Carry flag to Core/ALU
               reg_ctrl_alu_ov_o,                  // Overflow flag to Core/ALU


               reg_ctrl_timers_th0_o,              // Timer 0 Counter Register High Nibble to Timers
               reg_ctrl_timers_tm0_o,              // Timer 0 Counter Register Middle Nibble to Timers
               reg_ctrl_timers_tl0_o,              // Timer 0 Counter Register Low Nibble to Timers
               reg_ctrl_timers_gate_t0_o,          // Timer 0 Gate Config Flag to Timers
               reg_ctrl_timers_m1_t0_o,            // Timer 0 M1 Config Flag to Timers
               reg_ctrl_timers_m0_t0_o,            // Timer 0 M0 Config Flag to Timers
               reg_ctrl_timers_tr0_o,              // Timer 0 Run Control Bit to Timers
               reg_ctrl_timers_th1_o,              // Timer 1 Counter Register High Nibble to Timers
               reg_ctrl_timers_tm1_o,              // Timer 1 Counter Register Middle Nibble to Timers
               reg_ctrl_timers_tl1_o,              // Timer 1 Counter Register Low Nibble to Timers
               reg_ctrl_timers_gate_t1_o,          // Timer 1 Gate Config Flag to Timers
               reg_ctrl_timers_m1_t1_o,            // Timer 1 M1 Config Flag to Timers
               reg_ctrl_timers_m0_t1_o,            // Timer 1 M0 Config Flag to Timers
               reg_ctrl_timers_tr1_o,              // Timer 1 Run Control Bit to Timers
               reg_ctrl_timers_tacph_o,            // Timer 2 Angle Clock Period Register High Nibble to Timers
               reg_ctrl_timers_tacpl_o,            // Timer 2 Angle Clock Period Register Low Nibble to Timers
               reg_ctrl_timers_tr2_o,              // Timer 2 Run Control Bit to Timers
               reg_ctrl_timers_dfsel_o,            // Timer 2 Digital Filter Sampling Selection Bit to Timers
               reg_ctrl_timers_edgsel_o,           // Timer 2 Rise/Fall Edge Selection Bit to Timers
               reg_ctrl_timers_dfp_o,              // Timer 2 Digital Filter Clock Period to Timers

               reg_ctrl_ports_p4_o,                 // P4 Bus to Ports

               reg_ctrl_baudrate_sm0_o,             // Serial Mode Bit 0 to Baud Rate
               reg_ctrl_baudrate_sm1_o,             // Serial Mode Bit 1 to Baud Rate
               reg_ctrl_baudrate_sm2_o,             // Serial Mode Bit 2 to Baud Rate
               reg_ctrl_baudrate_smod_o,            // Double Baud Rate Flag to Baud Rate
               reg_ctrl_baudrate_bps_o,             // Predeterminated Baud Rate Flag to Baud Rate


               reg_ctrl_interrupt_ip_o,            // Interrupt Priorities Config byte to Interruption module
               reg_ctrl_interrupt_ie_o,            // Interrupt Enable Config byte to Interruption module
               reg_ctrl_interrupt_int0_o,          // External Interrupt 0 Port to Interruption module
               reg_ctrl_interrupt_int1_o,          // External Interrupt 1 Port to Interruption module
               reg_ctrl_interrupt_ie0_o,           // External Interrupt 0 Flag to Interruption module
               reg_ctrl_interrupt_ie1_o,           // External Interrupt 1 Flag input to Interruption module
               reg_ctrl_interrupt_ri_o,            // Serial Receive Flag to Interruption module
               reg_ctrl_interrupt_ti_o,            // Serial Transmit Flag to Interruption module
               reg_ctrl_interrupt_tf0_o,           // Timer 1 Flag to Interruption module
               reg_ctrl_interrupt_tf1_o,           // Timer 0 Flag to Interruption module
               reg_ctrl_interrupt_tf2_o,           // Timer 2 Flag to Interruption module
               reg_ctrl_interrupt_txrxf_o,         // TX/RX Flag to Interruption module

               reg_ctrl_serial_sm0_o,              // Serial Mode Config bit to Serial
               reg_ctrl_serial_ren_o,              // Receive Enable bit to Serial
               reg_ctrl_serial_p3_0_o,             // P3[0] Port to Serial
               reg_ctrl_serial_p3_1_o,             // P3[1] Port to Serial             
               reg_ctrl_serial_sbuf_tx_o,          // Transmission Buffer
               reg_ctrl_serial_tb8_o,              // 9th Transmission bit in Serial Mode 1 to Serial
               reg_ctrl_serial_ti_o,               // Transmission Interruption Flag to Serial
               reg_ctrl_serial_ri_o                // Receive Interruption Flag to Serial
               );


input             reg_ctrl_clk_i;
input             reg_ctrl_reset_b_i;
input             reg_ctrl_fsm_wr_b_i;
input             reg_ctrl_fsm_rd_b_i;
input             reg_ctrl_fsm_byte_b_i;
input [15:0]      reg_ctrl_fsm_addr_i;
input [7:0]       reg_ctrl_fsm_data_i;
input             reg_ctrl_fsm_serial_tx_i;
input [7:0]       reg_ctrl_timers_th0_i;
input [7:0]       reg_ctrl_timers_tm0_i;
input [7:0]       reg_ctrl_timers_tl0_i;
input             reg_ctrl_timers_tf0_i;
input [7:0]       reg_ctrl_timers_th1_i;
input [7:0]       reg_ctrl_timers_tm1_i;
input [7:0]       reg_ctrl_timers_tl1_i;
input             reg_ctrl_timers_tf1_i;
input [7:0]       reg_ctrl_timers_acrh_i;
input [7:0]       reg_ctrl_timers_acrm_i;
input [7:0]       reg_ctrl_timers_acrl_i;
input             reg_ctrl_timers_tf2_i;
input             reg_ctrl_alu_cy_i;
input             reg_ctrl_alu_ac_i;
input             reg_ctrl_alu_ov_i;
input             reg_ctrl_mem_ctrl_ext_mem_en_b_i;

input [7:0]       reg_ctrl_bus_control_p0en_i;
input [7:0]       reg_ctrl_bus_control_p2en_i;
input             reg_ctrl_bus_control_p3en_6_i;
input             reg_ctrl_bus_control_p3en_7_i;
input [7:0]       reg_ctrl_bus_control_p2_i;
input             reg_ctrl_bus_control_p3_6_i;
input             reg_ctrl_bus_control_p3_7_i;
input [7:0]       reg_ctrl_bus_control_p4_i;

input             reg_ctrl_interrupt_ie0_i;
input             reg_ctrl_interrupt_ie1_i;
input             reg_ctrl_interrupt_ri_i;
input             reg_ctrl_interrupt_ti_i;
input             reg_ctrl_interrupt_tf0_i;
input             reg_ctrl_interrupt_tf1_i;
input             reg_ctrl_interrupt_tf2_i;
input             reg_ctrl_interrupt_txrxf_i;
input             reg_ctrl_interrupt_clear_i;

input             reg_ctrl_serial_p3en_0_i;
input             reg_ctrl_serial_p3en_1_i;
input             reg_ctrl_serial_p3_0_i;
input             reg_ctrl_serial_p3_1_i;
input [7:0]       reg_ctrl_serial_sbuf_rx_i;
input             reg_ctrl_serial_rb8_i;
input             reg_ctrl_serial_ti_i;
input             reg_ctrl_serial_ri_i;

inout [7:0]       reg_ctrl_ports_p0_io;
inout [7:0]       reg_ctrl_ports_p1_io;
inout [7:0]       reg_ctrl_ports_p2_io;
inout [7:0]       reg_ctrl_ports_p3_io;
inout [7:0]       reg_ctrl_bus_control_p0_io;


output reg [7:0]  reg_ctrl_fsm_data_o;
output            reg_ctrl_alu_cy_o;
output            reg_ctrl_alu_ac_o;
output            reg_ctrl_alu_ov_o;
output            reg_ctrl_baudrate_sm0_o;
output            reg_ctrl_baudrate_sm1_o;
output            reg_ctrl_baudrate_sm2_o;
output            reg_ctrl_baudrate_smod_o;
output            reg_ctrl_baudrate_bps_o;
output [7:0]      reg_ctrl_timers_th0_o;
output [7:0]      reg_ctrl_timers_tm0_o;
output [7:0]      reg_ctrl_timers_tl0_o;
output            reg_ctrl_timers_gate_t0_o;
output            reg_ctrl_timers_m1_t0_o;
output            reg_ctrl_timers_m0_t0_o;
output            reg_ctrl_timers_tr0_o;
output [7:0]      reg_ctrl_timers_th1_o;
output [7:0]      reg_ctrl_timers_tm1_o;
output [7:0]      reg_ctrl_timers_tl1_o;
output            reg_ctrl_timers_gate_t1_o;
output            reg_ctrl_timers_m1_t1_o;
output            reg_ctrl_timers_m0_t1_o;
output            reg_ctrl_timers_tr1_o;
output [1:0]      reg_ctrl_timers_tacph_o;
output [7:0]      reg_ctrl_timers_tacpl_o;
output            reg_ctrl_timers_tr2_o;
output            reg_ctrl_timers_dfsel_o;
output            reg_ctrl_timers_edgsel_o;
output [2:0]      reg_ctrl_timers_dfp_o;
output [7:0]      reg_ctrl_interrupt_ip_o;
output [7:0]      reg_ctrl_interrupt_ie_o;
output            reg_ctrl_interrupt_int0_o;
output            reg_ctrl_interrupt_int1_o;
output            reg_ctrl_interrupt_ie0_o;
output            reg_ctrl_interrupt_ie1_o;
output            reg_ctrl_interrupt_ri_o;
output            reg_ctrl_interrupt_ti_o;
output            reg_ctrl_interrupt_tf0_o;
output            reg_ctrl_interrupt_tf1_o;
output            reg_ctrl_interrupt_tf2_o;
output            reg_ctrl_interrupt_txrxf_o;
output [7:0]      reg_ctrl_ports_p4_o;
output            reg_ctrl_serial_sm0_o;
output            reg_ctrl_serial_ren_o;
output            reg_ctrl_serial_p3_0_o;
output            reg_ctrl_serial_p3_1_o;
output [7:0]      reg_ctrl_serial_sbuf_tx_o;
output            reg_ctrl_serial_tb8_o;
output            reg_ctrl_serial_ti_o;
output            reg_ctrl_serial_ri_o;


reg [7:0] sfr [0:39];

`include "RTL/core_reg_ctrl_defines.v"
`include "RTL/core_reg_ctrl_functions.v"
//`include "core_reg_ctrl_simvision_aux.v"


// Temporary data
reg [5:0]   byte_phy_addr;
reg [3:0]   bit_phy_addr;
reg [7:0]   write_data;
reg [7:0]   data_mask;
integer     i;

// Constant outputs to ALU Submodule
assign reg_ctrl_alu_cy_o=sfr[`PSW_PHY][`PSW_CY_PHY];
assign reg_ctrl_alu_ac_o=sfr[`PSW_PHY][`PSW_AC_PHY];
assign reg_ctrl_alu_ov_o=sfr[`PSW_PHY][`PSW_OV_PHY];

// Constant outputs to Baud Rate Submodule
assign reg_ctrl_baudrate_sm0_o=sfr[`SCON_PHY][`SCON_SM0_PHY];
assign reg_ctrl_baudrate_sm1_o=sfr[`SCON_PHY][`SCON_SM1_PHY];
assign reg_ctrl_baudrate_sm2_o=sfr[`SCON_PHY][`SCON_SM2_PHY];
assign reg_ctrl_baudrate_smod_o=sfr[`PCON_PHY][`PCON_SMOD_PHY];
assign reg_ctrl_baudrate_bps_o=sfr[`PCON_PHY][`PCON_BPS_PHY];

// Constant Outputs to Ports Module
assign reg_ctrl_ports_p0_io=output_mask(sfr[`P0_PHY],sfr[`P0EN_PHY]);
assign reg_ctrl_ports_p1_io=output_mask(sfr[`P1_PHY],sfr[`P1EN_PHY]);
assign reg_ctrl_ports_p2_io=output_mask(sfr[`P2_PHY],sfr[`P2EN_PHY]);
assign reg_ctrl_ports_p3_io=output_mask(sfr[`P3_PHY],sfr[`P3EN_PHY]);
assign reg_ctrl_ports_p4_o=sfr[`P4_PHY];

// Constant outputs to Timers Module
assign reg_ctrl_timers_th0_o=sfr[`TH0_PHY];
assign reg_ctrl_timers_tm0_o=sfr[`TM0_PHY];
assign reg_ctrl_timers_tl0_o=sfr[`TL0_PHY];
assign reg_ctrl_timers_gate_t0_o=sfr[`TMOD_PHY][`TMOD_GATE_T0_PHY];
assign reg_ctrl_timers_m1_t0_o=sfr[`TMOD_PHY][`TMOD_M1_T0_PHY];
assign reg_ctrl_timers_m0_t0_o=sfr[`TMOD_PHY][`TMOD_M0_T0_PHY];
assign reg_ctrl_timers_tr0_o=sfr[`TCON_PHY][`TCON_TR0_PHY];
assign reg_ctrl_timers_th1_o=sfr[`TH1_PHY];
assign reg_ctrl_timers_tm1_o=sfr[`TM1_PHY];
assign reg_ctrl_timers_tl1_o=sfr[`TL1_PHY];
assign reg_ctrl_timers_gate_t1_o=sfr[`TMOD_PHY][`TMOD_GATE_T1_PHY];
assign reg_ctrl_timers_m1_t1_o=sfr[`TMOD_PHY][`TMOD_M1_T1_PHY];
assign reg_ctrl_timers_m0_t1_o=sfr[`TMOD_PHY][`TMOD_M0_T1_PHY];
assign reg_ctrl_timers_tr1_o=sfr[`TCON_PHY][`TCON_TR1_PHY];
assign reg_ctrl_timers_tacph_o=sfr[`TH1_PHY][1:0];
assign reg_ctrl_timers_tacpl_o=sfr[`TL1_PHY];
assign reg_ctrl_timers_tr2_o=sfr[`TCON2_PHY][`TCON2_TR2_PHY];
assign reg_ctrl_timers_dfsel_o=sfr[`TCON2_PHY][`TCON2_DFSEL_PHY];
assign reg_ctrl_timers_edgsel_o=sfr[`TCON2_PHY][`TCON2_EDGSEL_PHY];
assign reg_ctrl_timers_dfp_o=sfr[`TCON2_PHY][`TCON2_DFP2_PHY:`TCON2_DFP0_PHY];

// Constant outputs to Interruptions Module
assign reg_ctrl_interrupt_ip_o=sfr[`IP_PHY];
assign reg_ctrl_interrupt_ie_o=sfr[`IE_PHY];
assign reg_ctrl_interrupt_int0_o=sfr[`P3_PHY][2];
assign reg_ctrl_interrupt_int1_o=sfr[`P3_PHY][3];
assign reg_ctrl_interrupt_ri_o=sfr[`SCON_PHY][`SCON_RI_PHY];
assign reg_ctrl_interrupt_ti_o=sfr[`SCON_PHY][`SCON_TI_PHY];
assign reg_ctrl_interrupt_tf0_o=sfr[`TCON_PHY][`TCON_TF0_PHY];
assign reg_ctrl_interrupt_tf1_o=sfr[`TCON_PHY][`TCON_TF1_PHY];
assign reg_ctrl_interrupt_ie0_o=sfr[`TCON_PHY][`TCON_IEO_PHY];
assign reg_ctrl_interrupt_ie1_o=sfr[`TCON_PHY][`TCON_IE1_PHY];
assign reg_ctrl_interrupt_tf2_o=sfr[`TCON2_PHY][`TCON2_TF2_PHY];
assign reg_ctrl_interrupt_txrxf_o=sfr[`TCON2_PHY][`TCON2_TXRXF_PHY];

// Constant outputs to Serial Module
assign reg_ctrl_serial_p3_0_o=sfr[`P3_PHY][0];
assign reg_ctrl_serial_p3_1_o=sfr[`P3_PHY][1];
assign reg_ctrl_serial_sm0_o=sfr[`SCON_PHY][`SCON_SM0_PHY];
assign reg_ctrl_serial_ren_o=sfr[`SCON_PHY][`SCON_REN_PHY];
assign reg_ctrl_serial_sbuf_tx_o=sfr[`SBUF_TX_PHY];
assign reg_ctrl_serial_tb8_o=sfr[`SCON_PHY][`SCON_TB8_PHY];
assign reg_ctrl_serial_ti_o=sfr[`SCON_PHY][`SCON_TI_PHY];
assign reg_ctrl_serial_ri_o=sfr[`SCON_PHY][`SCON_RI_PHY];

always @(posedge reg_ctrl_clk_i)
begin
   if(!reg_ctrl_reset_b_i)
   begin
      sfr[`SP_PHY]<=8'h07;
      sfr[`DPL_PHY]<=8'h00;
      sfr[`DPH_PHY]<=8'h00;
      sfr[`ACRL_PHY]<=8'h00;
      sfr[`ACRM_PHY]<=8'h00;
      sfr[`ACRH_PHY]<=8'h00;
      sfr[`PCON_PHY]<=8'h00;
      sfr[`TCON_PHY]<=8'h00;
      sfr[`TMOD_PHY]<=8'h00;
      sfr[`TL0_PHY]<=8'h00;
      sfr[`TL1_PHY]<=8'h00;
      sfr[`TH0_PHY]<=8'h00;
      sfr[`TH1_PHY]<=8'h00;
      sfr[`TM0_PHY]<=8'h00;
      sfr[`TM1_PHY]<=8'h00;
      sfr[`SCON_PHY]<=8'h00;
      sfr[`SBUF_TX_PHY]<=8'h00;
      sfr[`SBUF_RX_PHY]<=8'h00;
      sfr[`IE_PHY]<=8'h0;
      sfr[`P4_PHY]<=8'h0;
      sfr[`IP_PHY]<=8'h00;
      sfr[`SMAP8_PHY]<=8'h00;
      sfr[`TACPL_PHY]<=8'h00;
      sfr[`TACPH_PHY]<=8'h00;
      sfr[`RX1_PHY]<=8'h00;
      sfr[`RX0_PHY]<=8'h00;
      sfr[`TX1_PHY]<=8'h00;
      sfr[`TX0_PHY]<=8'h00;
      sfr[`P0EN_PHY]<=8'h00;
      sfr[`P1EN_PHY]<=8'h00;
      sfr[`PSW_PHY]<=8'h00;
      sfr[`TCON2_PHY]<=8'h00;
      sfr[`ACC_PHY]<=8'h00;
      sfr[`P2EN_PHY]<=8'h00;
      sfr[`B_PHY]<=8'h00;
      sfr[`P3EN_PHY]<=8'h00;
   end
   else
   begin
      // Signals driven exclusively from Ports
      if(!sfr[`P0EN_PHY][0]) sfr[`P0_PHY][0]<=reg_ctrl_ports_p0_io[0];
      if(!sfr[`P0EN_PHY][1]) sfr[`P0_PHY][1]<=reg_ctrl_ports_p0_io[1];
      if(!sfr[`P0EN_PHY][2]) sfr[`P0_PHY][2]<=reg_ctrl_ports_p0_io[2];
      if(!sfr[`P0EN_PHY][3]) sfr[`P0_PHY][3]<=reg_ctrl_ports_p0_io[3];
      if(!sfr[`P0EN_PHY][4]) sfr[`P0_PHY][4]<=reg_ctrl_ports_p0_io[4];
      if(!sfr[`P0EN_PHY][5]) sfr[`P0_PHY][5]<=reg_ctrl_ports_p0_io[5];
      if(!sfr[`P0EN_PHY][6]) sfr[`P0_PHY][6]<=reg_ctrl_ports_p0_io[6];
      if(!sfr[`P0EN_PHY][7]) sfr[`P0_PHY][7]<=reg_ctrl_ports_p0_io[7];

      if(!sfr[`P1EN_PHY][0]) sfr[`P1_PHY][0]<=reg_ctrl_ports_p1_io[0];
      if(!sfr[`P1EN_PHY][1]) sfr[`P1_PHY][1]<=reg_ctrl_ports_p1_io[1];
      if(!sfr[`P1EN_PHY][2]) sfr[`P1_PHY][2]<=reg_ctrl_ports_p1_io[2];
      if(!sfr[`P1EN_PHY][3]) sfr[`P1_PHY][3]<=reg_ctrl_ports_p1_io[3];
      if(!sfr[`P1EN_PHY][4]) sfr[`P1_PHY][4]<=reg_ctrl_ports_p1_io[4];
      if(!sfr[`P1EN_PHY][5]) sfr[`P1_PHY][5]<=reg_ctrl_ports_p1_io[5];
      if(!sfr[`P1EN_PHY][6]) sfr[`P1_PHY][6]<=reg_ctrl_ports_p1_io[6];
      if(!sfr[`P1EN_PHY][7]) sfr[`P1_PHY][7]<=reg_ctrl_ports_p1_io[7];

      if(!sfr[`P2EN_PHY][0]) sfr[`P2_PHY][0]<=reg_ctrl_ports_p2_io[0];
      if(!sfr[`P2EN_PHY][1]) sfr[`P2_PHY][1]<=reg_ctrl_ports_p2_io[1];
      if(!sfr[`P2EN_PHY][2]) sfr[`P2_PHY][2]<=reg_ctrl_ports_p2_io[2];
      if(!sfr[`P2EN_PHY][3]) sfr[`P2_PHY][3]<=reg_ctrl_ports_p2_io[3];
      if(!sfr[`P2EN_PHY][4]) sfr[`P2_PHY][4]<=reg_ctrl_ports_p2_io[4];
      if(!sfr[`P2EN_PHY][5]) sfr[`P2_PHY][5]<=reg_ctrl_ports_p2_io[5];
      if(!sfr[`P2EN_PHY][6]) sfr[`P2_PHY][6]<=reg_ctrl_ports_p2_io[6];
      if(!sfr[`P2EN_PHY][7]) sfr[`P2_PHY][7]<=reg_ctrl_ports_p2_io[7];

      if(!sfr[`P3EN_PHY][0]) sfr[`P3_PHY][0]<=reg_ctrl_ports_p3_io[0];
      if(!sfr[`P3EN_PHY][1]) sfr[`P3_PHY][1]<=reg_ctrl_ports_p3_io[1];
      if(!sfr[`P3EN_PHY][2]) sfr[`P3_PHY][2]<=reg_ctrl_ports_p3_io[2];
      if(!sfr[`P3EN_PHY][3]) sfr[`P3_PHY][3]<=reg_ctrl_ports_p3_io[3];
      if(!sfr[`P3EN_PHY][4]) sfr[`P3_PHY][4]<=reg_ctrl_ports_p3_io[4];
      if(!sfr[`P3EN_PHY][5]) sfr[`P3_PHY][5]<=reg_ctrl_ports_p3_io[5];
      if(!sfr[`P3EN_PHY][6]) sfr[`P3_PHY][6]<=reg_ctrl_ports_p3_io[6];
      if(!sfr[`P3EN_PHY][7]) sfr[`P3_PHY][7]<=reg_ctrl_ports_p3_io[7];

      // Signals driven exclusively from ALU
      sfr[`PSW_PHY][`PSW_CY_PHY]<=reg_ctrl_alu_cy_i;
      sfr[`PSW_PHY][`PSW_AC_PHY]<=reg_ctrl_alu_ac_i;
      sfr[`PSW_PHY][`PSW_OV_PHY]<=reg_ctrl_alu_ov_i;

      // Signals automatically updated
      sfr[`PSW_PHY][`PSW_P_PHY]<=^sfr[`ACC_PHY];

      // Signals driven exclusively from Timers
      sfr[`TH0_PHY]<=reg_ctrl_timers_th0_i;
      sfr[`TH1_PHY]<=reg_ctrl_timers_th1_i;
      sfr[`TM0_PHY]<=reg_ctrl_timers_tm0_i;
      sfr[`TM1_PHY]<=reg_ctrl_timers_tm1_i;
      sfr[`TL0_PHY]<=reg_ctrl_timers_tl0_i;
      sfr[`TL1_PHY]<=reg_ctrl_timers_tl1_i;
      sfr[`ACRL_PHY]<=reg_ctrl_timers_acrl_i;
      sfr[`ACRM_PHY]<=reg_ctrl_timers_acrm_i;
      sfr[`ACRH_PHY]<=reg_ctrl_timers_acrh_i;

      // Signals written from Serial
      if(sfr[`SCON_PHY][`SCON_REN_PHY])
      begin
         sfr[`SBUF_RX_PHY]<=reg_ctrl_serial_sbuf_rx_i;
         sfr[`SCON_PHY][`SCON_RB8_PHY]<=reg_ctrl_serial_rb8_i;
      end
      if(sfr[`SCON_PHY][`SCON_REN_PHY] || reg_ctrl_fsm_serial_tx_i)
      begin
         sfr[`P3EN_PHY][0]<=reg_ctrl_serial_p3en_0_i;
         sfr[`P3EN_PHY][1]<=reg_ctrl_serial_p3en_1_i;
         if(sfr[`P3EN_PHY][0]) sfr[`P3_PHY][0]<=reg_ctrl_serial_p3_0_i;
         if(sfr[`P3EN_PHY][1]) sfr[`P3_PHY][1]<=reg_ctrl_serial_p3_1_i;
      end

      // Signals driven by Interruption or Other Modules
      if(sfr[`IE_PHY][`IE_EA_PHY])
      begin
         if(sfr[`IE_PHY][`IE_EX0_PHY]) 
         begin
            sfr[`P3EN_PHY][`P3_2_PHY]<=1'b0;
            sfr[`TCON_PHY][`TCON_IEO_PHY]<=reg_ctrl_interrupt_ie0_i;
         end
         if(sfr[`IE_PHY][`IE_EX1_PHY])
         begin
            sfr[`P3EN_PHY][`P3_3_PHY]<=1'b0;
            sfr[`TCON_PHY][`TCON_IE1_PHY]<=reg_ctrl_interrupt_ie1_i;
         end
         if(sfr[`IE_PHY][`IE_ET0_PHY])
         begin
            sfr[`TCON_PHY][`TCON_TF0_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_tf0_i:reg_ctrl_timers_tf0_i;
         end
         if(sfr[`IE_PHY][`IE_ET1_PHY])
         begin
            sfr[`TCON_PHY][`TCON_TF1_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_tf1_i:reg_ctrl_timers_tf1_i;
         end
         if(sfr[`IE_PHY][`IE_ET2_PHY])
         begin
            sfr[`TCON2_PHY][`TCON2_TF2_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_tf2_i:reg_ctrl_timers_tf2_i;
         end
         if(sfr[`IE_PHY][`IE_ET2_PHY])
         begin
            sfr[`SCON_PHY][`SCON_RI_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_ri_i:reg_ctrl_serial_ri_i;
            sfr[`SCON_PHY][`SCON_TI_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_ti_i:reg_ctrl_serial_ti_i;
         end
      end

      // Signals written by FSM
      if(!reg_ctrl_fsm_wr_b_i)
      begin
         if(!reg_ctrl_fsm_byte_b_i)
         begin
            case(reg_ctrl_fsm_addr_i[7:0])
               `P0:
                  begin
                     if(sfr[byte_log_to_phy(`P0EN)][0]) sfr[byte_log_to_phy(`P0)][0]<=reg_ctrl_fsm_data_i[0];
                     if(sfr[byte_log_to_phy(`P0EN)][1]) sfr[byte_log_to_phy(`P0)][1]<=reg_ctrl_fsm_data_i[1];
                     if(sfr[byte_log_to_phy(`P0EN)][2]) sfr[byte_log_to_phy(`P0)][2]<=reg_ctrl_fsm_data_i[2];
                     if(sfr[byte_log_to_phy(`P0EN)][3]) sfr[byte_log_to_phy(`P0)][3]<=reg_ctrl_fsm_data_i[3];
                     if(sfr[byte_log_to_phy(`P0EN)][4]) sfr[byte_log_to_phy(`P0)][4]<=reg_ctrl_fsm_data_i[4];
                     if(sfr[byte_log_to_phy(`P0EN)][5]) sfr[byte_log_to_phy(`P0)][5]<=reg_ctrl_fsm_data_i[5];
                     if(sfr[byte_log_to_phy(`P0EN)][6]) sfr[byte_log_to_phy(`P0)][6]<=reg_ctrl_fsm_data_i[6];
                     if(sfr[byte_log_to_phy(`P0EN)][7]) sfr[byte_log_to_phy(`P0)][7]<=reg_ctrl_fsm_data_i[7];
                  end
               `P1:
                  begin
                     if(sfr[byte_log_to_phy(`P1EN)][0]) sfr[byte_log_to_phy(`P1)][0]<=reg_ctrl_fsm_data_i[0];
                     if(sfr[byte_log_to_phy(`P1EN)][1]) sfr[byte_log_to_phy(`P1)][1]<=reg_ctrl_fsm_data_i[1];
                     if(sfr[byte_log_to_phy(`P1EN)][2]) sfr[byte_log_to_phy(`P1)][2]<=reg_ctrl_fsm_data_i[2];
                     if(sfr[byte_log_to_phy(`P1EN)][3]) sfr[byte_log_to_phy(`P1)][3]<=reg_ctrl_fsm_data_i[3];
                     if(sfr[byte_log_to_phy(`P1EN)][4]) sfr[byte_log_to_phy(`P1)][4]<=reg_ctrl_fsm_data_i[4];
                     if(sfr[byte_log_to_phy(`P1EN)][5]) sfr[byte_log_to_phy(`P1)][5]<=reg_ctrl_fsm_data_i[5];
                     if(sfr[byte_log_to_phy(`P1EN)][6]) sfr[byte_log_to_phy(`P1)][6]<=reg_ctrl_fsm_data_i[6];
                     if(sfr[byte_log_to_phy(`P1EN)][7]) sfr[byte_log_to_phy(`P1)][7]<=reg_ctrl_fsm_data_i[7];
                  end
               `P2:
                  begin
                     if(sfr[byte_log_to_phy(`P2EN)][0]) sfr[byte_log_to_phy(`P2)][0]<=reg_ctrl_fsm_data_i[0];
                     if(sfr[byte_log_to_phy(`P2EN)][1]) sfr[byte_log_to_phy(`P2)][1]<=reg_ctrl_fsm_data_i[1];
                     if(sfr[byte_log_to_phy(`P2EN)][2]) sfr[byte_log_to_phy(`P2)][2]<=reg_ctrl_fsm_data_i[2];
                     if(sfr[byte_log_to_phy(`P2EN)][3]) sfr[byte_log_to_phy(`P2)][3]<=reg_ctrl_fsm_data_i[3];
                     if(sfr[byte_log_to_phy(`P2EN)][4]) sfr[byte_log_to_phy(`P2)][4]<=reg_ctrl_fsm_data_i[4];
                     if(sfr[byte_log_to_phy(`P2EN)][5]) sfr[byte_log_to_phy(`P2)][5]<=reg_ctrl_fsm_data_i[5];
                     if(sfr[byte_log_to_phy(`P2EN)][6]) sfr[byte_log_to_phy(`P2)][6]<=reg_ctrl_fsm_data_i[6];
                     if(sfr[byte_log_to_phy(`P2EN)][7]) sfr[byte_log_to_phy(`P2)][7]<=reg_ctrl_fsm_data_i[7];
                  end
               `P3:
                  begin
                     if(sfr[byte_log_to_phy(`P3EN)][0]) sfr[byte_log_to_phy(`P3)][0]<=reg_ctrl_fsm_data_i[0];
                     if(sfr[byte_log_to_phy(`P3EN)][1]) sfr[byte_log_to_phy(`P3)][1]<=reg_ctrl_fsm_data_i[1];
                     if(sfr[byte_log_to_phy(`P3EN)][2]) sfr[byte_log_to_phy(`P3)][2]<=reg_ctrl_fsm_data_i[2];
                     if(sfr[byte_log_to_phy(`P3EN)][3]) sfr[byte_log_to_phy(`P3)][3]<=reg_ctrl_fsm_data_i[3];
                     if(sfr[byte_log_to_phy(`P3EN)][4]) sfr[byte_log_to_phy(`P3)][4]<=reg_ctrl_fsm_data_i[4];
                     if(sfr[byte_log_to_phy(`P3EN)][5]) sfr[byte_log_to_phy(`P3)][5]<=reg_ctrl_fsm_data_i[5];
                     if(sfr[byte_log_to_phy(`P3EN)][6]) sfr[byte_log_to_phy(`P3)][6]<=reg_ctrl_fsm_data_i[6];
                     if(sfr[byte_log_to_phy(`P3EN)][7]) sfr[byte_log_to_phy(`P3)][7]<=reg_ctrl_fsm_data_i[7];
                  end
               `SBUF:
                  begin
                     sfr[`SBUF_TX_PHY]<=reg_ctrl_fsm_data_i;
                  end
               default:
                  begin
                     byte_phy_addr=byte_log_to_phy(reg_ctrl_fsm_addr_i);
                     data_mask=write_mask(reg_ctrl_fsm_addr_i);
                     write_data=reg_ctrl_fsm_data_i&data_mask;
                     sfr[byte_phy_addr]<=write_data[7:0];
                  end
            endcase
         end
         else
         begin
            byte_phy_addr=log_bit_to_phy_byte(reg_ctrl_fsm_addr_i);
            bit_phy_addr=bit_log_to_phy(reg_ctrl_fsm_addr_i);
            sfr[byte_phy_addr][bit_phy_addr]<=reg_ctrl_fsm_data_i[0];
         end
      end
      else
      begin
         if(!reg_ctrl_fsm_rd_b_i)
         begin
            if(!reg_ctrl_fsm_byte_b_i)
            begin
               if(reg_ctrl_fsm_addr_i==`SBUF)
               begin
                  byte_phy_addr=`SBUF_RX_PHY;
               end
               else
               begin
                  byte_phy_addr=byte_log_to_phy(reg_ctrl_fsm_addr_i);
               end
               reg_ctrl_fsm_data_o<=sfr[byte_phy_addr];
            end
            else
            begin
               byte_phy_addr=log_bit_to_phy_byte(reg_ctrl_fsm_addr_i);
               bit_phy_addr=bit_log_to_phy(reg_ctrl_fsm_addr_i);
               reg_ctrl_fsm_data_o[0]<=sfr[byte_phy_addr][bit_phy_addr];
            end
         end
      end
   end
end

endmodule
