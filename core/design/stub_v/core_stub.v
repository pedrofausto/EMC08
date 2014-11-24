// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microctrller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core.v
// Module Name: core
// Author: Thiago Santos
// E-mail: tssantos@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 0.1      08/09/2010  Initial Version
// 0.2      13/09/2010  Updated ports names
// -------------------------------------------------------------------
// Description
// Core Top Module stub file
// -------------------------------------------------------------------

module core (
            core_clk_i,
            core_mem_clk_i,
            core_reset_i,

            core_interrupt_vect_i,

            core_timers_th0_i,
            core_timers_tm0_i,
            core_timers_tl0_i,
            core_timers_tf0_i,
            core_timers_th1_i,
            core_timers_tm1_i,
            core_timers_tl1_i,
            core_timers_tf1_i,
            core_timers_acrh_i,
            core_timers_acrm_i,
            core_timers_acrl_i,
            core_timers_tf2_i,

            core_bus_ctrl_p0en_i,
            core_bus_ctrl_p2en_i,
            core_bus_ctrl_p3en_6_i,
            core_bus_ctrl_p3en_7_i,
            core_bus_ctrl_p2_i,
            core_bus_ctrl_p3_6_i,
            core_bus_ctrl_p3_7_i,
            core_bus_ctrl_p4_i,

            core_interrupt_tcon_i,
            core_interrupt_tcon2_i,
            core_interrupt_clear_i,

            core_serial_p3en_0_i,
            core_serial_p3en_1_i,
            core_serial_p3_0_i,
            core_serial_p3_1_i,
            core_serial_sbuf_rx_i,
            core_serial_rb8_i,
            core_serial_ti_i,
            core_serial_ri_i,

            core_ports_p0_io,
            core_ports_p1_io,
            core_ports_p2_io,
            core_ports_p3_io,

            core_bus_ctrl_p0_io,

            core_baudrate_sm0_o,
            core_baudrate_sm1_o,
            core_baudrate_sm2_o,
            core_baudrate_cm_start_o,
            core_baudrate_smod_o,
            core_baudrate_rs232_o,

            core_timers_th0_o,
            core_timers_tm0_o,
            core_timers_tl0_o,
            core_timers_gate_t0_o,
            core_timers_m1_t0_o,
            core_timers_m0_t0_o,
            core_timers_tr0_o,
            core_timers_tf0_o,
            core_timers_th1_o,
            core_timers_tm1_o,
            core_timers_tl1_o,
            core_timers_gate_t1_o,
            core_timers_m1_t1_o,
            core_timers_m0_t1_o,
            core_timers_int0_o,
            core_timers_tr1_o,
            core_timers_tf1_o,
            core_timers_int1_o,
            core_timers_tacph_o,
            core_timers_tacpl_o,
            core_timers_tr2_o,
            core_timers_tf2_o,
            core_timers_dfsel_o,
            core_timers_edgsel_o,
            core_timers_dfp_o,

            core_interrupt_ip_o,
            core_interrupt_ie_o,
            core_interrupt_scon_o,
            core_interrupt_tcon_o,
            core_interrupt_tcon2_o,
            core_interrupt_intx_o,
            core_interrupt_na_o,
            core_interrupt_rdy_o,

            core_ports_p4_o,
            core_ports_p0en_o,
            core_ports_p1en_o,
            core_ports_p2en_o,
            core_ports_p3en_o,
            core_serial_sm0_o,
            core_serial_ren_o,
            core_serial_p3_0_o,
            core_serial_sbuf_tx_o,
            core_serial_tb8_o,
            core_serial_ti_o,
            core_serial_ri_o,
            core_serial_tx_o,

            core_bus_ctrl_ea_b_i,
            core_bus_ctrl_data_i,
            core_bus_ctrl_addr_o,
            core_bus_ctrl_data_o,
            core_bus_ctrl_ext_rom_rd_b_o,
            core_bus_ctrl_ext_ram_rd_b_o,
            core_bus_ctrl_ext_ram_wr_b_o

            );

// General External Inputs/Outputs
input          core_clk_i;
input          core_mem_clk_i;
input          core_reset_i;

input [7:0]    core_timers_th0_i;
input [7:0]    core_timers_tm0_i;
input [7:0]    core_timers_tl0_i;
input          core_timers_tf0_i;
input [7:0]    core_timers_th1_i;
input [7:0]    core_timers_tm1_i;
input [7:0]    core_timers_tl1_i;
input          core_timers_tf1_i;
input [7:0]    core_timers_acrh_i;
input [7:0]    core_timers_acrm_i;
input [7:0]    core_timers_acrl_i;
input          core_timers_tf2_i;

input [7:0]    core_bus_ctrl_p0en_i;
input [7:0]    core_bus_ctrl_p2en_i;
input          core_bus_ctrl_p3en_6_i;
input          core_bus_ctrl_p3en_7_i;
input [7:0]    core_bus_ctrl_p2_i;
input          core_bus_ctrl_p3_6_i;
input          core_bus_ctrl_p3_7_i;
input [7:0]    core_bus_ctrl_p4_i;
input          core_bus_ctrl_ea_b_i;
input [7:0]    core_bus_ctrl_data_i;

input [3:0]    core_interrupt_tcon_i;
input [1:0]    core_interrupt_tcon2_i;
input          core_interrupt_clear_i;
input [2:0]    core_interrupt_vect_i;

input          core_serial_p3en_0_i;
input          core_serial_p3en_1_i;
input          core_serial_p3_0_i;
input          core_serial_p3_1_i;
input [7:0]    core_serial_sbuf_rx_i;
input          core_serial_rb8_i;
input          core_serial_ti_i;
input          core_serial_ri_i;

inout [7:0]    core_ports_p0_io;
inout [7:0]    core_ports_p1_io;
inout [7:0]    core_ports_p2_io;
inout [7:0]    core_ports_p3_io;
inout [7:0]    core_bus_ctrl_p0_io;

output         core_baudrate_sm0_o;
output         core_baudrate_sm1_o;
output         core_baudrate_sm2_o;
output         core_baudrate_cm_start_o;
output         core_baudrate_smod_o;
output         core_baudrate_rs232_o;

output [7:0]   core_timers_th0_o;
output [7:0]   core_timers_tm0_o;
output [7:0]   core_timers_tl0_o;
output         core_timers_gate_t0_o;
output         core_timers_m1_t0_o;
output         core_timers_m0_t0_o;
output         core_timers_tr0_o;
output         core_timers_tf0_o;
output [7:0]   core_timers_th1_o;
output [7:0]   core_timers_tm1_o;
output [7:0]   core_timers_tl1_o;
output         core_timers_gate_t1_o;
output         core_timers_m1_t1_o;
output         core_timers_m0_t1_o;
output         core_timers_int0_o;
output         core_timers_tr1_o;
output         core_timers_tf1_o;
output         core_timers_int1_o;
output [1:0]   core_timers_tacph_o;
output [7:0]   core_timers_tacpl_o;
output         core_timers_tr2_o;
output         core_timers_tf2_o;
output         core_timers_dfsel_o;
output         core_timers_edgsel_o;
output [2:0]   core_timers_dfp_o;

output [6:0]   core_interrupt_ip_o;
output [7:0]   core_interrupt_ie_o;
output [1:0]   core_interrupt_scon_o;
output [5:0]   core_interrupt_tcon_o;
output [1:0]   core_interrupt_tcon2_o;
output [1:0]   core_interrupt_intx_o;
output         core_interrupt_na_o;
output         core_interrupt_rdy_o;

output [7:0]   core_ports_p4_o;
output [7:0]   core_ports_p0en_o;
output [7:0]   core_ports_p1en_o;
output [7:0]   core_ports_p2en_o;
output [7:0]   core_ports_p3en_o;

output         core_serial_sm0_o;
output         core_serial_ren_o;
output         core_serial_p3_0_o;
output [7:0]   core_serial_sbuf_tx_o;
output         core_serial_tb8_o;
output         core_serial_ti_o;
output         core_serial_ri_o;
output         core_serial_tx_o;

output [15:0]  core_bus_ctrl_addr_o;
output [7:0]   core_bus_ctrl_data_o;
output         core_bus_ctrl_ext_rom_rd_b_o;
output         core_bus_ctrl_ext_ram_rd_b_o;
output         core_bus_ctrl_ext_ram_wr_b_o;

endmodule
