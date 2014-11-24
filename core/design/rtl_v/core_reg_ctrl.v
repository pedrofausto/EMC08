// ----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microctrller for Automotive Engine Application
// ----------------------------------------------------------------------------
// File Name: core_reg_ctrl.v
// Module Name: core_reg_ctrl
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// ----------------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      31/08/2010  Initial Version
// 1.1      01/09/2010  Fixed some bugs in interruption flags access
// 1.2      01/09/2010  Updated Include Files directories path
// 1.3      02/09/2010  Fixed some bugs in memory control write access
// 1.4      03/09/2010  Included some missing output pins to Ports
// 1.5      08/09/2010  Modified Bit Access Mode to SFR and included 
//                      aditional control pins
// 1.6      23/09/2010  Fixed wrong FSM write mask to P0, P1, P2 and P3
// 1.7      23/09/2010  Removed write masks to P0, P1, P2 and P3
// 2.0      30/09/2010  Bidirectional bus ports_p0_io, ports_p1_io, ports_p2_io,
//                      ports_p3_io and bus_ctrl_p0_io split into dedicated input
//                      and output wires.
// 2.0      30/09/2010  FSM Write operation modified to block only the current 
//                      register to be written.
// 2.0      30/09/2010  Created inputs timers_tacpl_i and timers_tacph_i
// 2.1      06/12/2010  Created new register TACPH1
// ----------------------------------------------------------------------------
// Description
// Core Submodule responsible for ctrl read and write access to 
// Special Function Registers.
// ----------------------------------------------------------------------------

module core_reg_ctrl(
               reg_ctrl_clk_i,                     // Memory Clock
               reg_ctrl_reset_b_i,                 // System Reset

               reg_ctrl_fsm_wr_b_i,                // SFR File Write Enable from Core/FSM
               reg_ctrl_fsm_rd_b_i,                // SFR File Read Enable from Core/FSM
               reg_ctrl_fsm_bit_byte_flag_i,                // SFR Byte/Bit Flag from Core/FSM
               reg_ctrl_fsm_addr_i,                // SFR Read/Write Address from Core/FSM
               reg_ctrl_fsm_data_i,                // SFR Data in from Core/FSM

               reg_ctrl_ext_ram_rd_i,              // Flag set by Core/MemCtrl to indicate external RAM Read
               reg_ctrl_ext_ram_wr_i,              // Flag set by Core/MemCtrl to indicate external RAM Write
               reg_ctrl_ext_rom_rd_i,              // Flag set by Core/MemCtrl to indicate external ROM Read

               reg_ctrl_alu_cy_i,                  // Carry flag from Core/ALU
               reg_ctrl_alu_ac_i,                  // Auxiliary flag from Core/ALU
               reg_ctrl_alu_ov_i,                  // Overflow flag from Core/ALU

               reg_ctrl_bus_ctrl_p0en_i,           // P0EN input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p0_i,             // P0 input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p2en_i,           // P2EN input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p2_i,             // P2 input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3en_6_i,         // P3EN[6] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3en_7_i,         // P3EN[7] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3_6_i,           // P3[6] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3_7_i,           // P3[7] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p4_i,             // P4 input from Bus ctrl in External Memory access mode

               reg_ctrl_interrupt_ie0_i,           // External Interrupt 0 Flag from Interruption module
               reg_ctrl_interrupt_ie1_i,           // External Interrupt 1 Flag input from Interruption module
               reg_ctrl_interrupt_tf0_i,           // Timer 1 Flag from Interruption module
               reg_ctrl_interrupt_tf1_i,           // Timer 0 Flag from Interruption module
               reg_ctrl_interrupt_tf2_i,           // Timer 2 Flag from Interruption module
               reg_ctrl_interrupt_txrxf_i,         // TX/RX Flag from Interruption module
               reg_ctrl_interrupt_clear_i,         // Flag set by Interruption when interruption need to be cleared

               reg_ctrl_ports_p0_i,                // P0 input from Ports in General Purpose Mode
               reg_ctrl_ports_p1_i,                // P1 input from Ports in General Purpose Mode
               reg_ctrl_ports_p2_i,                // P2 input from Ports in General Purpose Mode
               reg_ctrl_ports_p3_i,                // P3 input from Ports in General Purpose Mode

               reg_ctrl_serial_p3en_0_i,           // P3EN[0] from Serial
               reg_ctrl_serial_p3en_1_i,           // P3EN[1] from Serial
               reg_ctrl_serial_p3_0_i,             // P3[0] Port from Serial
               reg_ctrl_serial_p3_1_i,             // P3[1] Port from Serial
               reg_ctrl_serial_sbuf_rx_i,          // Reception Buffer from Serial
               reg_ctrl_serial_rb8_i,              // 9th Reception bit in Mode 1 from Serial
               reg_ctrl_serial_ti_i,               // Transmission Interruption Flag to Serial
               reg_ctrl_serial_ri_i,               // Reception Interruption Flag to Serial
               reg_ctrl_serial_load_sbuf_i,        // Load SBUF Flago from Serial

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

               reg_ctrl_fsm_data_o,                // SFR Data out to Core/FSM
               reg_ctrl_fsm_psw_rs_o,              // SFR PSW RS0 and RS1 output to Core/FSM

               reg_ctrl_alu_cy_o,                  // Carry flag to Core/ALU
               reg_ctrl_alu_ac_o,                  // Auxiliary Carry flag to Core/ALU
               reg_ctrl_alu_ov_o,                  // Overflow flag to Core/ALU

               reg_ctrl_baudrate_sm0_o,            // Serial Mode Bit 0 to Baud Rate
               reg_ctrl_baudrate_sm1_o,            // Serial Mode Bit 1 to Baud Rate
               reg_ctrl_baudrate_sm2_o,            // Serial Mode Bit 2 to Baud Rate
               reg_ctrl_baudrate_smod_o,           // Double Baud Rate Flag to Baud Rate
               reg_ctrl_baudrate_rs232_o,          // RS232 Baud Rate Flag to Baud Rate

               reg_ctrl_bus_ctrl_p0_o,             // P0 output to Bus ctrl in External Memory access mode

               reg_ctrl_interrupt_ip_o,            // Interrupt Priorities Config byte to Interruption module
               reg_ctrl_interrupt_ie_o,            // Interrupt Enable Config byte to Interruption module
               reg_ctrl_interrupt_int0_o,          // External Interrupt 0 Port to Interruption module
               reg_ctrl_interrupt_int1_o,          // External Interrupt 1 Port to Interruption module
               reg_ctrl_interrupt_it0_o,           // External Interrupt 0 Flag to Interruption module
               reg_ctrl_interrupt_it1_o,           // External Interrupt 1 Flag to Interruption module
               reg_ctrl_interrupt_ie0_o,           // External Interrupt 0 Flag to Interruption module
               reg_ctrl_interrupt_ie1_o,           // External Interrupt 1 Flag to Interruption module
               reg_ctrl_interrupt_ri_o,            // Serial Receive Flag to Interruption module
               reg_ctrl_interrupt_ti_o,            // Serial Transmit Flag to Interruption module
               reg_ctrl_interrupt_tf0_o,           // Timer 1 Flag to Interruption module
               reg_ctrl_interrupt_tf1_o,           // Timer 0 Flag to Interruption module
               reg_ctrl_interrupt_tf2_o,           // Timer 2 Flag to Interruption module
               reg_ctrl_interrupt_txrxf_o,         // TX/RX Flag to Interruption module

               reg_ctrl_ports_p0_o,                // P0 output to Ports
               reg_ctrl_ports_p1_o,                // P1 output to Ports
               reg_ctrl_ports_p2_o,                // P2 output to Ports
               reg_ctrl_ports_p3_o,                // P3 output to Ports
               reg_ctrl_ports_p4_o,                // P4 output to Ports
               reg_ctrl_ports_p0en_o,              // P0 Config Register to Ports
               reg_ctrl_ports_p1en_o,              // P1 Config Register to Ports
               reg_ctrl_ports_p2en_o,              // P2 Config Register to Ports
               reg_ctrl_ports_p3en_o,              // P3 Config Register to Ports

               reg_ctrl_serial_sm0_o,              // Serial Mode Config bit to Serial
               reg_ctrl_serial_ren_o,              // Receive Enable bit to Serial
               reg_ctrl_serial_p3_0_o,             // P3[0] Port to Serial
               reg_ctrl_serial_sbuf_tx_o,          // Transmission Buffer
               reg_ctrl_serial_tb8_o,              // 9th Transmission bit in Serial Mode 1 to Serial
               reg_ctrl_serial_ti_o,               // Transmission Interruption Flag to Serial
               reg_ctrl_serial_ri_o,               // Receive Interruption Flag to Serial
               reg_ctrl_serial_tx_o,               // Transmission start signal to Serial

               reg_ctrl_timers_th0_o,              // Timer 0 Counter Register High Nibble to Timers
               reg_ctrl_timers_tm0_o,              // Timer 0 Counter Register Middle Nibble to Timers
               reg_ctrl_timers_tl0_o,              // Timer 0 Counter Register Low Nibble to Timers
               reg_ctrl_timers_gate_t0_o,          // Timer 0 Gate Config Flag to Timers
               reg_ctrl_timers_m1_t0_o,            // Timer 0 M1 Config Flag to Timers
               reg_ctrl_timers_m0_t0_o,            // Timer 0 M0 Config Flag to Timers
               reg_ctrl_timers_tr0_o,              // Timer 0 Run ctrl Bit to Timers
               reg_ctrl_timers_tf0_o,              // Timer 1 Flag to Timers
               reg_ctrl_timers_int0_o,             // Timer 0 External Input to Timers
               reg_ctrl_timers_th1_o,              // Timer 1 Counter Register High Nibble to Timers
               reg_ctrl_timers_tm1_o,              // Timer 1 Counter Register Middle Nibble to Timers
               reg_ctrl_timers_tl1_o,              // Timer 1 Counter Register Low Nibble to Timers
               reg_ctrl_timers_gate_t1_o,          // Timer 1 Gate Config Flag to Timers
               reg_ctrl_timers_m1_t1_o,            // Timer 1 M1 Config Flag to Timers
               reg_ctrl_timers_m0_t1_o,            // Timer 1 M0 Config Flag to Timers
               reg_ctrl_timers_tr1_o,              // Timer 1 Run ctrl Bit to Timers
               reg_ctrl_timers_tf1_o,              // Timer 1 Flag to Timers
               reg_ctrl_timers_int1_o,             // Timer 1 External Input to Timers
               reg_ctrl_timers_tacph0_o,           // Timer 2 Angle Clock Period Register High Nibble 0 to Timers
               reg_ctrl_timers_tacph1_o,           // Timer 2 Angle Clock Period Register High Nibble 1 to Timers
               reg_ctrl_timers_tacpl_o,            // Timer 2 Angle Clock Period Register Low Nibble to Timers
               reg_ctrl_timers_tr2_o,              // Timer 2 Run ctrl Bit to Timers
               reg_ctrl_timers_tf2_o,              // Timer 2 Flag to Timers
               reg_ctrl_timers_dfsel_o,            // Timer 2 Digital Filter Sampling Selection Bit to Timers
               reg_ctrl_timers_edgsel_o,           // Timer 2 Rise/Fall Edge Selection Bit to Timers
               reg_ctrl_timers_dfp_o               // Timer 2 Digital Filter Clock Period to Timers
               );

parameter   ENABLED=1'b0,
            DISABLED=1'b1;

parameter   BYTE=1'b0,
            BIT=1'b1;

input             reg_ctrl_clk_i;
input             reg_ctrl_reset_b_i;

input             reg_ctrl_fsm_wr_b_i;
input             reg_ctrl_fsm_rd_b_i;
input             reg_ctrl_fsm_bit_byte_flag_i;
input [7:0]       reg_ctrl_fsm_addr_i;
input [7:0]       reg_ctrl_fsm_data_i;

input             reg_ctrl_ext_rom_rd_i;
input             reg_ctrl_ext_ram_rd_i;
input             reg_ctrl_ext_ram_wr_i;

input             reg_ctrl_alu_cy_i;
input             reg_ctrl_alu_ac_i;
input             reg_ctrl_alu_ov_i;

input [7:0]       reg_ctrl_bus_ctrl_p0en_i;
input [7:0]       reg_ctrl_bus_ctrl_p0_i;
input [7:0]       reg_ctrl_bus_ctrl_p2en_i;
input [7:0]       reg_ctrl_bus_ctrl_p2_i;
input             reg_ctrl_bus_ctrl_p3en_6_i;
input             reg_ctrl_bus_ctrl_p3en_7_i;
input             reg_ctrl_bus_ctrl_p3_6_i;
input             reg_ctrl_bus_ctrl_p3_7_i;
input [7:0]       reg_ctrl_bus_ctrl_p4_i;

input             reg_ctrl_interrupt_ie0_i;
input             reg_ctrl_interrupt_ie1_i;
input             reg_ctrl_interrupt_tf0_i;
input             reg_ctrl_interrupt_tf1_i;
input             reg_ctrl_interrupt_tf2_i;
input             reg_ctrl_interrupt_txrxf_i;
input             reg_ctrl_interrupt_clear_i;

input [7:0]       reg_ctrl_ports_p0_i;
input [7:0]       reg_ctrl_ports_p1_i;
input [7:0]       reg_ctrl_ports_p2_i;
input [7:0]       reg_ctrl_ports_p3_i;

input             reg_ctrl_serial_p3en_0_i;
input             reg_ctrl_serial_p3en_1_i;
input             reg_ctrl_serial_p3_0_i;
input             reg_ctrl_serial_p3_1_i;
input [7:0]       reg_ctrl_serial_sbuf_rx_i;
input             reg_ctrl_serial_rb8_i;
input             reg_ctrl_serial_ti_i;
input             reg_ctrl_serial_ri_i;
input             reg_ctrl_serial_load_sbuf_i;

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

output [7:0]      reg_ctrl_fsm_data_o;
output [1:0]      reg_ctrl_fsm_psw_rs_o;

output            reg_ctrl_alu_cy_o;
output            reg_ctrl_alu_ac_o;
output            reg_ctrl_alu_ov_o;

output            reg_ctrl_baudrate_sm0_o;
output            reg_ctrl_baudrate_sm1_o;
output            reg_ctrl_baudrate_sm2_o;
output            reg_ctrl_baudrate_smod_o;
output            reg_ctrl_baudrate_rs232_o;

output [7:0]      reg_ctrl_bus_ctrl_p0_o;

output [6:0]      reg_ctrl_interrupt_ip_o;
output [7:0]      reg_ctrl_interrupt_ie_o;
output            reg_ctrl_interrupt_int0_o;
output            reg_ctrl_interrupt_int1_o;
output            reg_ctrl_interrupt_it0_o;
output            reg_ctrl_interrupt_it1_o;
output            reg_ctrl_interrupt_ie0_o;
output            reg_ctrl_interrupt_ie1_o;
output            reg_ctrl_interrupt_ri_o;
output            reg_ctrl_interrupt_ti_o;
output            reg_ctrl_interrupt_tf0_o;
output            reg_ctrl_interrupt_tf1_o;
output            reg_ctrl_interrupt_tf2_o;
output            reg_ctrl_interrupt_txrxf_o;

output [7:0]      reg_ctrl_ports_p0_o;
output [7:0]      reg_ctrl_ports_p1_o;
output [7:0]      reg_ctrl_ports_p2_o;
output [7:0]      reg_ctrl_ports_p3_o;
output [7:0]      reg_ctrl_ports_p4_o;
output [7:0]      reg_ctrl_ports_p0en_o;
output [7:0]      reg_ctrl_ports_p1en_o;
output [7:0]      reg_ctrl_ports_p2en_o;
output [7:0]      reg_ctrl_ports_p3en_o;

output            reg_ctrl_serial_sm0_o;
output            reg_ctrl_serial_ren_o;
output            reg_ctrl_serial_p3_0_o;
output [7:0]      reg_ctrl_serial_sbuf_tx_o;
output            reg_ctrl_serial_tb8_o;
output            reg_ctrl_serial_ti_o;
output            reg_ctrl_serial_ri_o;
output            reg_ctrl_serial_tx_o;

output [7:0]      reg_ctrl_timers_th0_o;
output [7:0]      reg_ctrl_timers_tm0_o;
output [7:0]      reg_ctrl_timers_tl0_o;
output            reg_ctrl_timers_gate_t0_o;
output            reg_ctrl_timers_m1_t0_o;
output            reg_ctrl_timers_m0_t0_o;
output            reg_ctrl_timers_tr0_o;
output            reg_ctrl_timers_tf0_o;
output [7:0]      reg_ctrl_timers_th1_o;
output [7:0]      reg_ctrl_timers_tm1_o;
output [7:0]      reg_ctrl_timers_tl1_o;
output            reg_ctrl_timers_gate_t1_o;
output            reg_ctrl_timers_m1_t1_o;
output            reg_ctrl_timers_m0_t1_o;
output            reg_ctrl_timers_int0_o;
output            reg_ctrl_timers_tr1_o;
output            reg_ctrl_timers_tf1_o;
output            reg_ctrl_timers_int1_o;
output [7:0]      reg_ctrl_timers_tacph1_o;
output [7:0]      reg_ctrl_timers_tacph0_o;
output [7:0]      reg_ctrl_timers_tacpl_o;
output            reg_ctrl_timers_tr2_o;
output            reg_ctrl_timers_tf2_o;
output            reg_ctrl_timers_dfsel_o;
output            reg_ctrl_timers_edgsel_o;
output [2:0]      reg_ctrl_timers_dfp_o;



reg [7:0] sfr [0:40];

reg       load_sbuf_prev;

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_reg_ctrl_defines.v"
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_reg_ctrl_functions.v"


// Temporary data
reg [7:0]   read_data;
reg [7:0]   write_data;
reg [7:0]   physical_addr;
reg [7:0]   data_mask;
reg         serial_status;
reg         serial_tx_tmp;
integer i;


// Outputs to FSM Submodule
assign reg_ctrl_fsm_psw_rs_o=sfr[`PSW_PHY][`PSW_RS1_PHY:`PSW_RS0_PHY];
assign reg_ctrl_fsm_data_o=read_data;

// Outputs to ALU Submodule
assign reg_ctrl_alu_cy_o=sfr[`PSW_PHY][`PSW_CY_PHY];
assign reg_ctrl_alu_ac_o=sfr[`PSW_PHY][`PSW_AC_PHY];
assign reg_ctrl_alu_ov_o=sfr[`PSW_PHY][`PSW_OV_PHY];

// Outputs to Baud Rate Module
assign reg_ctrl_baudrate_sm0_o=sfr[`SCON_PHY][`SCON_SM0_PHY];
assign reg_ctrl_baudrate_sm1_o=sfr[`SCON_PHY][`SCON_SM1_PHY];
assign reg_ctrl_baudrate_sm2_o=sfr[`SCON_PHY][`SCON_SM2_PHY];
assign reg_ctrl_baudrate_smod_o=sfr[`PCON_PHY][`PCON_SMOD_PHY];
assign reg_ctrl_baudrate_rs232_o=sfr[`PCON_PHY][`PCON_RS232_PHY];

// Outputs to Bus Control Module
assign reg_ctrl_bus_ctrl_p0_o=sfr[`P0_PHY];

// Constant outputs to Interruptions Module
assign reg_ctrl_interrupt_ip_o=sfr[`IP_PHY][6:0];
assign reg_ctrl_interrupt_ie_o=sfr[`IE_PHY];
assign reg_ctrl_interrupt_int0_o=sfr[`P3_PHY][2];
assign reg_ctrl_interrupt_int1_o=sfr[`P3_PHY][3];
assign reg_ctrl_interrupt_ri_o=sfr[`SCON_PHY][`SCON_RI_PHY];
assign reg_ctrl_interrupt_ti_o=sfr[`SCON_PHY][`SCON_TI_PHY];
assign reg_ctrl_interrupt_it0_o=sfr[`TCON_PHY][`TCON_IT0_PHY];
assign reg_ctrl_interrupt_it1_o=sfr[`TCON_PHY][`TCON_IT1_PHY];
assign reg_ctrl_interrupt_tf0_o=sfr[`TCON_PHY][`TCON_TF0_PHY];
assign reg_ctrl_interrupt_tf1_o=sfr[`TCON_PHY][`TCON_TF1_PHY];
assign reg_ctrl_interrupt_ie0_o=sfr[`TCON_PHY][`TCON_IEO_PHY];
assign reg_ctrl_interrupt_ie1_o=sfr[`TCON_PHY][`TCON_IE1_PHY];
assign reg_ctrl_interrupt_tf2_o=sfr[`TCON2_PHY][`TCON2_TF2_PHY];
assign reg_ctrl_interrupt_txrxf_o=sfr[`TCON2_PHY][`TCON2_TXRXF_PHY];

// Outputs to Ports Module
assign reg_ctrl_ports_p0_o=sfr[`P0_PHY];
assign reg_ctrl_ports_p1_o=sfr[`P1_PHY];
assign reg_ctrl_ports_p2_o=sfr[`P2_PHY];
assign reg_ctrl_ports_p3_o=sfr[`P3_PHY];
assign reg_ctrl_ports_p4_o=sfr[`P4_PHY];
assign reg_ctrl_ports_p0en_o=sfr[`P0EN_PHY];
assign reg_ctrl_ports_p1en_o=sfr[`P1EN_PHY];
assign reg_ctrl_ports_p2en_o=sfr[`P2EN_PHY];
assign reg_ctrl_ports_p3en_o=sfr[`P3EN_PHY];

// Outputs to Serial Module
assign reg_ctrl_serial_p3_0_o=sfr[`P3_PHY][0];
assign reg_ctrl_serial_sm0_o=sfr[`SCON_PHY][`SCON_SM0_PHY];
assign reg_ctrl_serial_ren_o=sfr[`SCON_PHY][`SCON_REN_PHY];
assign reg_ctrl_serial_sbuf_tx_o=sfr[`SBUF_TX_PHY];
assign reg_ctrl_serial_tb8_o=sfr[`SCON_PHY][`SCON_TB8_PHY];
assign reg_ctrl_serial_ti_o=sfr[`SCON_PHY][`SCON_TI_PHY];
assign reg_ctrl_serial_ri_o=sfr[`SCON_PHY][`SCON_RI_PHY];

// Outputs to Timers Module
assign reg_ctrl_timers_th0_o=sfr[`TH0_PHY];
assign reg_ctrl_timers_tm0_o=sfr[`TM0_PHY];
assign reg_ctrl_timers_tl0_o=sfr[`TL0_PHY];
assign reg_ctrl_timers_gate_t0_o=sfr[`TMOD_PHY][`TMOD_GATE_T0_PHY];
assign reg_ctrl_timers_m1_t0_o=sfr[`TMOD_PHY][`TMOD_M1_T0_PHY];
assign reg_ctrl_timers_m0_t0_o=sfr[`TMOD_PHY][`TMOD_M0_T0_PHY];
assign reg_ctrl_timers_tr0_o=sfr[`TCON_PHY][`TCON_TR0_PHY];
assign reg_ctrl_timers_tf0_o=sfr[`TCON_PHY][`TCON_TF0_PHY];

assign reg_ctrl_timers_th1_o=sfr[`TH1_PHY];
assign reg_ctrl_timers_tm1_o=sfr[`TM1_PHY];
assign reg_ctrl_timers_tl1_o=sfr[`TL1_PHY];
assign reg_ctrl_timers_gate_t1_o=sfr[`TMOD_PHY][`TMOD_GATE_T1_PHY];
assign reg_ctrl_timers_m1_t1_o=sfr[`TMOD_PHY][`TMOD_M1_T1_PHY];
assign reg_ctrl_timers_m0_t1_o=sfr[`TMOD_PHY][`TMOD_M0_T1_PHY];
assign reg_ctrl_timers_tr1_o=sfr[`TCON_PHY][`TCON_TR1_PHY];
assign reg_ctrl_timers_tf1_o=sfr[`TCON_PHY][`TCON_TF1_PHY];

assign reg_ctrl_timers_tacph1_o=sfr[`TACPH1_PHY];
assign reg_ctrl_timers_tacph0_o=sfr[`TACPH0_PHY];
assign reg_ctrl_timers_tacpl_o=sfr[`TACPL_PHY];
assign reg_ctrl_timers_tr2_o=sfr[`TCON2_PHY][`TCON2_TR2_PHY];
assign reg_ctrl_timers_dfsel_o=sfr[`TCON2_PHY][`TCON2_DFSEL_PHY];
assign reg_ctrl_timers_edgsel_o=sfr[`TCON2_PHY][`TCON2_EDGSEL_PHY];
assign reg_ctrl_timers_dfp_o=sfr[`TCON2_PHY][`TCON2_DFP2_PHY:`TCON2_DFP0_PHY];
assign reg_ctrl_timers_int0_o=sfr[`P3_PHY][2];
assign reg_ctrl_timers_int1_o=sfr[`P3_PHY][3];
assign reg_ctrl_timers_tf2_o=sfr[`TCON2_PHY][`TCON2_TF2_PHY];

// Temporary data assignment
assign reg_ctrl_serial_tx_o=serial_tx_tmp;

///////////////////////////////////
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
      sfr[`TACPH1_PHY]<=8'h00;
      sfr[`IP_PHY]<=8'h00;
      sfr[`SMAP8_PHY]<=8'h00;
      sfr[`TACPL_PHY]<=8'h00;
      sfr[`TACPH0_PHY]<=8'h00;
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
      serial_status<=1'b0;
      read_data<=8'h00;
      load_sbuf_prev<=1'b0;
   end
   else
   begin
///////////////////////////////////////////////////////////////////////////////
//                           Setting Serial Data                             //
///////////////////////////////////////////////////////////////////////////////

      if(sfr[`SCON_PHY][`SCON_TI_PHY])
      begin
         serial_status<=1'b0;
      end
      else
      begin
         if((reg_ctrl_fsm_addr_i==`SBUF) && reg_ctrl_fsm_wr_b_i==1'b0 && !reg_ctrl_fsm_bit_byte_flag_i)
         begin
            serial_status<=1'b1;
         end
         else
         begin
            serial_status<=serial_status;
         end   
      end

      serial_tx_tmp<=((reg_ctrl_fsm_addr_i==`SBUF) && reg_ctrl_fsm_wr_b_i==1'b0 && !reg_ctrl_fsm_bit_byte_flag_i);

      load_sbuf_prev<=reg_ctrl_serial_load_sbuf_i;

///////////////////////////////////////////////////////////////////////////////
//                               Write Operations                            //
///////////////////////////////////////////////////////////////////////////////

////// Mapping Logical Address sent by FSM to Physical Adresses  //////////////

      if(reg_ctrl_fsm_bit_byte_flag_i==BYTE)
      begin
         physical_addr=byte_log_to_phy(reg_ctrl_fsm_addr_i);
      end
      else
      begin
         physical_addr=log_bit_to_phy_byte(reg_ctrl_fsm_addr_i);
      end

////// Masking Data sent by FSM to be written on SFR  /////////////////////////

      if(reg_ctrl_fsm_bit_byte_flag_i==BYTE)
      begin
         write_data=(reg_ctrl_fsm_data_i & write_mask(reg_ctrl_fsm_addr_i));
      end
      else
      begin
         write_data=(reg_ctrl_fsm_data_i & write_mask(log_bit_to_log_byte(reg_ctrl_fsm_addr_i)));
      end

//////  P0: FSM, Ports or Bus Control /////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P0_PHY)
      begin
         for(i=0;i<8;i=i+1)
         begin
            if(sfr[`P0EN_PHY][i]) sfr[`P0_PHY][i]<=write_data[i];
         end
      end
      else
      begin
         if(reg_ctrl_ext_ram_wr_i)
         begin
            sfr[`P0_PHY]<= reg_ctrl_bus_ctrl_p0_i;
         end
         else
         begin
            if(reg_ctrl_ext_rom_rd_i || reg_ctrl_ext_ram_rd_i)
            begin
               sfr[`P0_PHY]<=reg_ctrl_ports_p0_i;
            end
            else
            begin
               for(i=0;i<8;i=i+1)
               begin
                  if(!sfr[`P0EN_PHY][i]) sfr[`P0_PHY][i]<=reg_ctrl_ports_p0_i[i];
               end
            end
         end
      end

//////  SP: FSM  //////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`SP_PHY)
      begin
         sfr[`SP_PHY]<=write_data;
      end
      else
      begin
         sfr[`SP_PHY]<=sfr[`SP_PHY];
      end

//////  DPL: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`DPL_PHY)
      begin
         sfr[`DPL_PHY]<=write_data;
      end
      else
      begin
         sfr[`DPL_PHY]<=sfr[`DPL_PHY];
      end

//////  DPH: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`DPH_PHY)
      begin
         sfr[`DPH_PHY]<=write_data;
      end
      else
      begin
         sfr[`DPH_PHY]<=sfr[`DPH_PHY];
      end

//////  ACRL: FSM or Timers  //////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`ACRL_PHY && !sfr[`TCON2_PHY][`TCON2_TR2_PHY])
      begin
         sfr[`ACRL_PHY]<=write_data;
      end
      else
      begin
         sfr[`ACRL_PHY]<=reg_ctrl_timers_acrl_i;
      end

//////  ACRM: FSM or Timers  //////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`ACRM_PHY && !sfr[`TCON2_PHY][`TCON2_TR2_PHY])
      begin
         sfr[`ACRM_PHY]<=write_data;
      end
      else
      begin
         sfr[`ACRM_PHY]<=reg_ctrl_timers_acrm_i;
      end

//////  ACRH: FSM or Timers  //////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`ACRH_PHY && !sfr[`TCON2_PHY][`TCON2_TR2_PHY])
      begin
         sfr[`ACRH_PHY]<=write_data;
      end
      else
      begin
         sfr[`ACRH_PHY]<=reg_ctrl_timers_acrh_i;
      end

//////  PCON: FSM  ////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`PCON_PHY)
      begin
         sfr[`PCON_PHY]<=write_data;
      end
      else
      begin
         sfr[`PCON_PHY]<=sfr[`PCON_PHY];
      end

//////  TCON: FSM, Interrupt, Timers  /////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TCON_PHY)
      begin
         sfr[`TCON_PHY]<=write_data;
      end
      else
      begin
         sfr[`TCON_PHY]<=sfr[`TCON_PHY];
         sfr[`TCON_PHY][`TCON_IEO_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_ie0_i:sfr[`TCON_PHY][`TCON_IEO_PHY];
         sfr[`TCON_PHY][`TCON_IE1_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_ie1_i:sfr[`TCON_PHY][`TCON_IE1_PHY];
         sfr[`TCON_PHY][`TCON_TF0_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_tf0_i:reg_ctrl_timers_tf0_i;
         sfr[`TCON_PHY][`TCON_TF1_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_tf1_i:reg_ctrl_timers_tf1_i;
      end

//////  TMOD: FSM  ////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TMOD_PHY)
      begin
         sfr[`TMOD_PHY]<=write_data;
      end
      else
      begin
         sfr[`TMOD_PHY]<=sfr[`TMOD_PHY];
      end

//////  TL0: FSM or Timers  ///////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TL0_PHY && !sfr[`TCON_PHY][`TCON_TR0_PHY])
      begin
         sfr[`TL0_PHY]<=write_data;
      end
      else
      begin
         sfr[`TL0_PHY]<=reg_ctrl_timers_tl0_i;
      end

//////  TL1: FSM or Timers  ///////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TL1_PHY && !sfr[`TCON_PHY][`TCON_TR1_PHY])
      begin
         sfr[`TL1_PHY]<=write_data;
      end
      else
      begin
         sfr[`TL1_PHY]<=reg_ctrl_timers_tl1_i;
      end

//////  TH0: FSM or Timers  ///////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TH0_PHY && !sfr[`TCON_PHY][`TCON_TR0_PHY])
      begin
         sfr[`TH0_PHY]<=write_data;
      end
      else
      begin
         sfr[`TH0_PHY]<=reg_ctrl_timers_th0_i;
      end

//////  TH1: FSM or Timers  ///////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TH1_PHY && !sfr[`TCON_PHY][`TCON_TR1_PHY])
      begin
         sfr[`TH1_PHY]<=write_data;
      end
      else
      begin
         sfr[`TH1_PHY]<=reg_ctrl_timers_th1_i;
      end

//////  TM0: FSM or Timers  ///////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TM0_PHY && !sfr[`TCON_PHY][`TCON_TR0_PHY])
      begin
         sfr[`TM0_PHY]<=write_data;
      end
      else
      begin
         sfr[`TM0_PHY]<=reg_ctrl_timers_tm0_i;
      end

//////  TM1: FSM or Timers  ///////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TM1_PHY && !sfr[`TCON_PHY][`TCON_TR1_PHY])
      begin
         sfr[`TM1_PHY]<=write_data;
      end
      else
      begin
         sfr[`TM1_PHY]<=reg_ctrl_timers_tm1_i;
      end

//////  P1: FSM or Ports  /////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P1_PHY)
      begin
         for(i=0;i<8;i=i+1)
         begin
            if(sfr[`P1EN_PHY][i]) sfr[`P1_PHY][i]<=write_data[i];
         end
      end
      else
      begin
         for(i=0;i<8;i=i+1)
         begin
            if(!sfr[`P1EN_PHY][i]) sfr[`P1_PHY][i]<=reg_ctrl_ports_p1_i[i];
         end
      end

//////  SCON: FSM or Serial  //////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`SCON_PHY)
      begin
         sfr[`SCON_PHY]<=write_data;
      end
      else
      begin
         sfr[`SCON_PHY]<=sfr[`SCON_PHY];
         if(sfr[`SCON_PHY][`SCON_REN_PHY])
         begin
            sfr[`SCON_PHY][`SCON_RB8_PHY]<=reg_ctrl_serial_rb8_i;
         end
         if(sfr[`IE_PHY][`IE_EA_PHY] && sfr[`IE_PHY][`IE_ES_PHY])
         begin
            sfr[`SCON_PHY][`SCON_RI_PHY]<=reg_ctrl_serial_ri_i;
            sfr[`SCON_PHY][`SCON_TI_PHY]<=reg_ctrl_serial_ti_i;
         end
      end

//////  SBUF_TX: FSM  /////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`SBUF_TX_PHY)
      begin
         sfr[`SBUF_TX_PHY]<=write_data;
      end
      else
      begin
         sfr[`SBUF_TX_PHY]<=sfr[`SBUF_TX_PHY];
      end

//////  SBUF_RX: Serial  /////////////////////////////////////////////////////////

      if(load_sbuf_prev==1'b1 && reg_ctrl_serial_load_sbuf_i==1'b0)
      begin
         sfr[`SCON_PHY][`SCON_RB8_PHY]<=reg_ctrl_serial_rb8_i;
         sfr[`SBUF_RX_PHY]<=reg_ctrl_serial_sbuf_rx_i;
      end
      else
      begin
         sfr[`SBUF_RX_PHY]<=sfr[`SBUF_RX_PHY];
         sfr[`SCON_PHY][`SCON_RB8_PHY]<=sfr[`SCON_PHY][`SCON_RB8_PHY];
      end


//////  P2: FSM, Ports or Bus Control /////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P2_PHY)
      begin
         for(i=0;i<8;i=i+1)
         begin
            if(sfr[`P2EN_PHY][i]) sfr[`P2_PHY][i]<=write_data[i];
         end
      end
      else
      begin
         if(reg_ctrl_ext_rom_rd_i)
         begin
            sfr[`P2_PHY]<= reg_ctrl_bus_ctrl_p2_i;
         end
         else
         begin
            for(i=0;i<8;i=i+1)
            begin
               if(!sfr[`P2EN_PHY][i]) sfr[`P2_PHY][i]<=reg_ctrl_ports_p2_i[i];
            end
         end
      end

//////  IE: FSM  //////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`IE_PHY)
      begin
         sfr[`IE_PHY]<=write_data;
      end
      else
      begin
         sfr[`IE_PHY]<=sfr[`IE_PHY];
      end

//////  P4: FSM, Ports or Bus Control /////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P4_PHY)
      begin
         for(i=0;i<8;i=i+1)
         begin
            sfr[`P4_PHY][i]<=write_data[i];
         end
      end
      else
      begin
         if(reg_ctrl_ext_rom_rd_i || reg_ctrl_ext_ram_rd_i || reg_ctrl_ext_ram_wr_i)
         begin
            sfr[`P4_PHY]<= reg_ctrl_bus_ctrl_p4_i;
         end
         else
         begin
            sfr[`P4_PHY]<=sfr[`P4_PHY];
         end
      end

//////  P3: FSM, Ports, Serial or Bus Control /////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P3_PHY)
      begin
         for(i=0;i<8;i=i+1)
         begin
            if(sfr[`P3EN_PHY][i]) sfr[`P3_PHY][i]<=write_data[i];
         end
      end
      else
      begin
         for(i=0;i<8;i=i+1)
         begin
            if(!sfr[`P3EN_PHY][i]) sfr[`P3_PHY][i]<=reg_ctrl_ports_p3_i[i];
         end
         if(sfr[`SCON_PHY][`SCON_REN_PHY] || serial_status)
         begin
            if(sfr[`P3EN_PHY][0]) sfr[`P3_PHY][0]<=reg_ctrl_serial_p3_0_i;
            if(sfr[`P3EN_PHY][1]) sfr[`P3_PHY][1]<=reg_ctrl_serial_p3_1_i;
         end
         if(reg_ctrl_ext_rom_rd_i || reg_ctrl_ext_ram_rd_i || reg_ctrl_ext_ram_wr_i)
         begin
            sfr[`P3_PHY][6]<=reg_ctrl_bus_ctrl_p3_6_i;
            sfr[`P3_PHY][7]<=reg_ctrl_bus_ctrl_p3_7_i;
         end
      end

//////  TACPH1: FSM  ///////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TACPH1_PHY)
      begin
         sfr[`TACPH1_PHY]<=write_data;
      end
      else
      begin
         sfr[`TACPH1_PHY]<=sfr[`TACPH1_PHY];
      end

//////  IP: FSM  //////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`IP_PHY)
      begin
         sfr[`IP_PHY]<=write_data;
      end
      else
      begin
         sfr[`IP_PHY]<=sfr[`IP_PHY];
      end

//////  SMAP8: FSM  ///////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`SMAP8_PHY)
      begin
         sfr[`SMAP8_PHY]<=write_data;
      end
      else
      begin
         sfr[`SMAP8_PHY]<=sfr[`SMAP8_PHY];
      end

//////  TACPL: FSM  ///////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TACPL_PHY)
      begin
         sfr[`TACPL_PHY]<=write_data;
      end
      else
      begin
         sfr[`TACPL_PHY]<=sfr[`TACPL_PHY];
      end

//////  TACPH0: FSM  ///////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TACPH0_PHY)
      begin
         sfr[`TACPH0_PHY]<=write_data;
      end
      else
      begin
         sfr[`TACPH0_PHY]<=sfr[`TACPH0_PHY];
      end

//////  RX1: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`RX1_PHY)
      begin
         sfr[`RX1_PHY]<=write_data;
      end
      else
      begin
         sfr[`RX1_PHY]<=sfr[`RX1_PHY];
      end

//////  RX0: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`RX0_PHY)
      begin
         sfr[`RX0_PHY]<=write_data;
      end
      else
      begin
         sfr[`RX0_PHY]<=sfr[`RX0_PHY];
      end

//////  TX1: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TX1_PHY)
      begin
         sfr[`TX1_PHY]<=write_data;
      end
      else
      begin
         sfr[`TX1_PHY]<=sfr[`TX1_PHY];
      end

//////  TX0: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TX0_PHY)
      begin
         sfr[`TX0_PHY]<=write_data;
      end
      else
      begin
         sfr[`TX0_PHY]<=sfr[`TX0_PHY];
      end

//////  P0EN: FSM or Bus Control //////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P0EN_PHY)
      begin
         sfr[`P0EN_PHY]<=write_data;
      end
      else
      begin
         sfr[`P0EN_PHY]<=sfr[`P0EN_PHY];
         if(reg_ctrl_ext_rom_rd_i || reg_ctrl_ext_ram_rd_i || reg_ctrl_ext_ram_wr_i)
         begin
            sfr[`P0EN_PHY]<=reg_ctrl_bus_ctrl_p0en_i;
         end
      end

//////  P1EN: FSM  ////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P1EN_PHY)
      begin
         sfr[`P1EN_PHY]<=write_data;
      end
      else
      begin
         sfr[`P1EN_PHY]<=sfr[`P1EN_PHY];
      end

//////  PSW: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`PSW_PHY)
      begin
         sfr[`PSW_PHY]<=write_data;
      end
      else
      begin
         sfr[`PSW_PHY]<=sfr[`PSW_PHY];
         sfr[`PSW_PHY][`PSW_AC_PHY]<=reg_ctrl_alu_ac_i;
         sfr[`PSW_PHY][`PSW_OV_PHY]<=reg_ctrl_alu_ov_i;
         sfr[`PSW_PHY][`PSW_CY_PHY]<=reg_ctrl_alu_cy_i;
      end
      sfr[`PSW_PHY][`PSW_P_PHY]<=^sfr[`ACC_PHY];

//////  TCON2: FSM, Interrupt, Timers  ////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`TCON2_PHY)
      begin
         sfr[`TCON2_PHY]<=write_data;
      end
      else
      begin
         sfr[`TCON2_PHY]<=sfr[`TCON2_PHY];
         sfr[`TCON2_PHY][`TCON2_TXRXF_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_txrxf_i:sfr[`TCON2_PHY][`TCON2_TXRXF_PHY];
         sfr[`TCON2_PHY][`TCON2_TF2_PHY]<=(reg_ctrl_interrupt_clear_i)?reg_ctrl_interrupt_tf2_i:reg_ctrl_timers_tf2_i;
      end

//////  ACC: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`ACC_PHY)
      begin
         sfr[`ACC_PHY]<=write_data;
      end
      else
      begin
         sfr[`ACC_PHY]<=sfr[`ACC_PHY];
      end

//////  P2EN: FSM  ////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P2EN_PHY)
      begin
         sfr[`P2EN_PHY]<=write_data;
      end
      else
      begin
         sfr[`P2EN_PHY]<=sfr[`P2EN_PHY];
         if(reg_ctrl_ext_rom_rd_i)
         begin
            sfr[`P2EN_PHY]<= reg_ctrl_bus_ctrl_p2en_i;
         end
      end

//////  B: FSM  /////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`B_PHY)
      begin
         sfr[`B_PHY]<=write_data;
      end
      else
      begin
         sfr[`B_PHY]<=sfr[`B_PHY];
      end

//////  P3EN: FSM  ////////////////////////////////////////////////////////////

      if(reg_ctrl_fsm_wr_b_i==ENABLED && physical_addr==`P3EN_PHY)
      begin
         if(sfr[`SCON_PHY][`SCON_REN_PHY] || serial_status)
         begin
            sfr[`P3EN_PHY][0]<=reg_ctrl_serial_p3en_0_i;
            sfr[`P3EN_PHY][1]<=reg_ctrl_serial_p3en_1_i;
         end
         else
         begin
            sfr[`P3EN_PHY][0]<=write_data[0];
            sfr[`P3EN_PHY][1]<=write_data[1];
         end
         if(sfr[`IE_PHY][`IE_EA_PHY] && sfr[`IE_PHY][`IE_EX0_PHY]) 
         begin
            sfr[`P3EN_PHY][2]<=1'b0;
         end else
         begin
            sfr[`P3EN_PHY][2]<=write_data[2];
         end
         if(sfr[`IE_PHY][`IE_EA_PHY] && sfr[`IE_PHY][`IE_EX1_PHY])
         begin
            sfr[`P3EN_PHY][3]<=1'b0;
         end
         else
         begin
            sfr[`P3EN_PHY][3]<=write_data[3];
         end
         sfr[`P3EN_PHY][4]<=write_data[4];
         sfr[`P3EN_PHY][5]<=write_data[5];
         if(reg_ctrl_ext_rom_rd_i || reg_ctrl_ext_ram_rd_i || reg_ctrl_ext_ram_wr_i)
         begin
            sfr[`P3EN_PHY][6]<=reg_ctrl_bus_ctrl_p3en_6_i;
            sfr[`P3EN_PHY][7]<=reg_ctrl_bus_ctrl_p3en_7_i;
         end
         else
         begin
            sfr[`P3EN_PHY][6]<=write_data[6];
            sfr[`P3EN_PHY][7]<=write_data[7];
         end
      end
      else
      begin
         sfr[`P3EN_PHY]<=sfr[`P3EN_PHY];
         if(sfr[`SCON_PHY][`SCON_REN_PHY] || serial_status)
         begin
            sfr[`P3EN_PHY][0]<=reg_ctrl_serial_p3en_0_i;
            sfr[`P3EN_PHY][1]<=reg_ctrl_serial_p3en_1_i;
         end
         if(reg_ctrl_ext_rom_rd_i || reg_ctrl_ext_ram_rd_i || reg_ctrl_ext_ram_wr_i)
         begin
            sfr[`P3EN_PHY][6]<=reg_ctrl_bus_ctrl_p3en_6_i;
            sfr[`P3EN_PHY][7]<=reg_ctrl_bus_ctrl_p3en_7_i;
         end
         if(sfr[`IE_PHY][`IE_EA_PHY])
         begin
            if(sfr[`IE_PHY][`IE_EX0_PHY]) 
            begin
               sfr[`P3EN_PHY][2]<=1'b0;
            end
            if(sfr[`IE_PHY][`IE_EX1_PHY])
            begin
               sfr[`P3EN_PHY][3]<=1'b0;
            end
         end
      end
///////////////////////////////////////////////////////////////////////////////
//                            FSM Read Operation                             //
///////////////////////////////////////////////////////////////////////////////

      if(!reg_ctrl_fsm_rd_b_i)
      begin
         if(!reg_ctrl_fsm_bit_byte_flag_i)
         begin
            case(reg_ctrl_fsm_addr_i)
            `SBUF: 
                  begin
                     read_data<=sfr[`SBUF_RX_PHY];
                  end
            default:
                  begin
                     read_data<=sfr[byte_log_to_phy(reg_ctrl_fsm_addr_i)];
                  end
            endcase
         end
         else
         begin
            read_data<=sfr[log_bit_to_phy_byte(reg_ctrl_fsm_addr_i)];
         end
      end
   end
end

endmodule
