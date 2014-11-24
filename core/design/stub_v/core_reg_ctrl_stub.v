// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_reg_ctrl_stub.v
// Module Name: core_reg_ctrl
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 2.0      27/09/2010  Completely Verified Version
// -------------------------------------------------------------------
// Description
// Reg Ctrl Submodule Stub File
// -------------------------------------------------------------------
module core_reg_ctrl(
               reg_ctrl_clk_i,                   // Memory Clock
               reg_ctrl_reset_b_i,                 // System Reset

               reg_ctrl_fsm_wr_b_i,                // SFR File Write Enable from Core/FSM
               reg_ctrl_fsm_rd_b_i,                // SFR File Read Enable from Core/FSM
               reg_ctrl_fsm_bit_byte_flag_i,                // SFR Byte/Bit Flag from Core/FSM
               reg_ctrl_fsm_addr_i,                // SFR Read/Write Address from Core/FSM
               reg_ctrl_fsm_data_i,                // SFR Data in from Core/FSM

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

               reg_ctrl_ext_ram_rd_i,              // Flag set by Core/MemCtrl to indicate external RAM Read
               reg_ctrl_ext_ram_wr_i,              // Flag set by Core/MemCtrl to indicate external RAM Write
               reg_ctrl_ext_rom_rd_i,              // Flag set by Core/MemCtrl to indicate external ROM Read

               reg_ctrl_bus_ctrl_p0en_i,           // P0EN input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p2en_i,           // P2EN input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3en_6_i,         // P3EN[6] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3en_7_i,         // P3EN[7] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p2_i,             // P2 input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3_6_i,           // P3[6] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p3_7_i,           // P3[7] input from Bus ctrl in External Memory access mode
               reg_ctrl_bus_ctrl_p4_i,             // P4 input from Bus ctrl in External Memory access mode

               reg_ctrl_interrupt_ie0_i,           // External Interrupt 0 Flag from Interruption module
               reg_ctrl_interrupt_ie1_i,           // External Interrupt 1 Flag input from Interruption module
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

               reg_ctrl_bus_ctrl_p0_io,         // P0 Bus from/to Bus ctrl when accessing external memory

               reg_ctrl_fsm_data_o,                // SFR Data out to Core/FSM
               reg_ctrl_fsm_psw_rs_o,              // SFR PSW RS0 and RS1 output to Core/FSM

               reg_ctrl_alu_cy_o,                  // Carry flag to Core/ALU
               reg_ctrl_alu_ac_o,                  // Auxiliary Carry flag to Core/ALU
               reg_ctrl_alu_ov_o,                  // Overflow flag to Core/ALU

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
               reg_ctrl_timers_tacph_o,            // Timer 2 Angle Clock Period Register High Nibble to Timers
               reg_ctrl_timers_tacpl_o,            // Timer 2 Angle Clock Period Register Low Nibble to Timers
               reg_ctrl_timers_tr2_o,              // Timer 2 Run ctrl Bit to Timers
               reg_ctrl_timers_tf2_o,              // Timer 2 Flag to Timers
               reg_ctrl_timers_dfsel_o,            // Timer 2 Digital Filter Sampling Selection Bit to Timers
               reg_ctrl_timers_edgsel_o,           // Timer 2 Rise/Fall Edge Selection Bit to Timers
               reg_ctrl_timers_dfp_o,              // Timer 2 Digital Filter Clock Period to Timers

               reg_ctrl_ports_p4_o,                // P4 Bus to Ports
               reg_ctrl_ports_p0en_o,              // P0 Config Register to Ports
               reg_ctrl_ports_p1en_o,              // P1 Config Register to Ports
               reg_ctrl_ports_p2en_o,              // P2 Config Register to Ports
               reg_ctrl_ports_p3en_o,              // P3 Config Register to Ports

               reg_ctrl_baudrate_sm0_o,             // Serial Mode Bit 0 to Baud Rate
               reg_ctrl_baudrate_sm1_o,             // Serial Mode Bit 1 to Baud Rate
               reg_ctrl_baudrate_sm2_o,             // Serial Mode Bit 2 to Baud Rate
               reg_ctrl_baudrate_smod_o,            // Double Baud Rate Flag to Baud Rate
               reg_ctrl_baudrate_rs232_o,           // RS232 Baud Rate Flag to Baud Rate


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

               reg_ctrl_serial_sm0_o,              // Serial Mode Config bit to Serial
               reg_ctrl_serial_ren_o,              // Receive Enable bit to Serial
               reg_ctrl_serial_p3_0_o,             // P3[0] Port to Serial
               reg_ctrl_serial_sbuf_tx_o,          // Transmission Buffer
               reg_ctrl_serial_tb8_o,              // 9th Transmission bit in Serial Mode 1 to Serial
               reg_ctrl_serial_ti_o,               // Transmission Interruption Flag to Serial
               reg_ctrl_serial_ri_o,               // Receive Interruption Flag to Serial
               reg_ctrl_serial_tx_o                // Transmission start signal to Serial

               );


input             reg_ctrl_clk_i;
input             reg_ctrl_reset_b_i;

input             reg_ctrl_fsm_wr_b_i;
input             reg_ctrl_fsm_rd_b_i;
input             reg_ctrl_fsm_bit_byte_flag_i;
input [7:0]       reg_ctrl_fsm_addr_i;
input [7:0]       reg_ctrl_fsm_data_i;

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

input             reg_ctrl_ext_rom_rd_i;
input             reg_ctrl_ext_ram_rd_i;
input             reg_ctrl_ext_ram_wr_i;

input [7:0]       reg_ctrl_bus_ctrl_p0en_i;
input [7:0]       reg_ctrl_bus_ctrl_p2en_i;
input             reg_ctrl_bus_ctrl_p3en_6_i;
input             reg_ctrl_bus_ctrl_p3en_7_i;
input [7:0]       reg_ctrl_bus_ctrl_p2_i;
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
inout [7:0]       reg_ctrl_bus_ctrl_p0_io;

output reg [7:0]  reg_ctrl_fsm_data_o;
output [1:0]      reg_ctrl_fsm_psw_rs_o;

output            reg_ctrl_alu_cy_o;
output            reg_ctrl_alu_ac_o;
output            reg_ctrl_alu_ov_o;

output            reg_ctrl_baudrate_sm0_o;
output            reg_ctrl_baudrate_sm1_o;
output            reg_ctrl_baudrate_sm2_o;
output            reg_ctrl_baudrate_smod_o;
output            reg_ctrl_baudrate_rs232_o;

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
output [1:0]      reg_ctrl_timers_tacph_o;
output [7:0]      reg_ctrl_timers_tacpl_o;
output            reg_ctrl_timers_tr2_o;
output            reg_ctrl_timers_tf2_o;
output            reg_ctrl_timers_dfsel_o;
output            reg_ctrl_timers_edgsel_o;
output [2:0]      reg_ctrl_timers_dfp_o;

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

endmodule
