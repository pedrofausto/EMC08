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
// Core Top Module
// -------------------------------------------------------------------


// includes for emc_top
`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_pcau.v"
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_alu.v"
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_reg_ctrl.v"
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_mem_ctrl.v"
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm.v"

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
            core_serial_load_sbuf_i,

            core_ports_p0_i,
            core_ports_p1_i,
            core_ports_p2_i,
            core_ports_p3_i,

            core_bus_ctrl_p0_i,

            core_reset_o,

            core_baudrate_sm0_o,
            core_baudrate_sm1_o,
            core_baudrate_sm2_o,
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
            core_timers_tacph1_o,
            core_timers_tacph0_o,
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
            core_ports_p0_o,
            core_ports_p1_o,
            core_ports_p2_o,
            core_ports_p3_o,

            core_bus_ctrl_p0_o,

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
input          core_serial_load_sbuf_i;

input [7:0]    core_ports_p0_i;
input [7:0]    core_ports_p1_i;
input [7:0]    core_ports_p2_i;
input [7:0]    core_ports_p3_i;
input [7:0]    core_bus_ctrl_p0_i;

output         core_reset_o;

output         core_baudrate_sm0_o;
output         core_baudrate_sm1_o;
output         core_baudrate_sm2_o;
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
output [7:0]   core_timers_tacph1_o;
output [7:0]   core_timers_tacph0_o;
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
output [7:0]   core_ports_p0_o;
output [7:0]   core_ports_p1_o;
output [7:0]   core_ports_p2_o;
output [7:0]   core_ports_p3_o;


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
output [7:0]   core_bus_ctrl_p0_o;

// Internal connections

wire [1:0]  fsm_reg_ctrl_psw_rs;
wire [7:0]  fsm_reg_ctrl_addr;
wire        fsm_reg_ctrl_rd_b;
wire        fsm_reg_ctrl_wr_b;
wire [7:0]  fsm_reg_ctrl_data;

wire [7:0]  reg_ctrl_fsm_data;

wire [15:0] fsm_mem_ctrl_rom_addr;
wire [7:0]  fsm_mem_ctrl_ram_addr;
wire        fsm_mem_ctrl_rom_rd_b;
wire        fsm_mem_ctrl_ram_rd_b;
wire        fsm_mem_ctrl_ram_wr_b;
wire [7:0]  fsm_mem_ctrl_ram_data;

wire [7:0]  mem_ctrl_fsm_rom_data;
wire [7:0]  mem_ctrl_fsm_ram_data;

wire [7:0]  fsm_pcau_offset;
wire        fsm_pcau_en;
wire [7:0]  fsm_pcau_msb;
wire        fsm_pcau_direct;
wire [2:0]  fsm_pcau_state;

wire [15:0] pcau_fsm_pc;
   
wire       fsm_alu_en;
wire [7:0] fsm_alu_operand1;
wire [7:0] fsm_alu_operand2;
wire [4:0] fsm_alu_opcode;

wire       reg_ctrl_alu_cy;
wire       reg_ctrl_alu_ac;
wire       reg_ctrl_alu_ov;

reg [15:0] alu_fsm_result;
wire        alu_reg_ctrl_cy;
wire        alu_reg_ctrl_ac;
wire        alu_reg_ctrl_ov;

wire        fsm_bit_byte_flag;
wire        fsm_mem_ctrl_ext_ram;
wire        mem_ctrl_reg_ctrl_ext_mem;

wire        core_reg_ctrl_interrupt_int0_o;
wire        core_reg_ctrl_interrupt_int1_o;
wire        core_reg_ctrl_interrupt_it0_o;
wire        core_reg_ctrl_interrupt_it1_o;
wire        core_reg_ctrl_interrupt_ie0_o;
wire        core_reg_ctrl_interrupt_ie1_o;
wire        core_reg_ctrl_interrupt_ri_o;
wire        core_reg_ctrl_interrupt_ti_o;
wire        core_reg_ctrl_interrupt_tf0_o;
wire        core_reg_ctrl_interrupt_tf1_o;
wire        core_reg_ctrl_interrupt_tf2_o;
wire        core_reg_ctrl_interrupt_txrxf_o;

assign core_interrupt_scon_o={core_reg_ctrl_interrupt_ti_o,core_reg_ctrl_interrupt_ri_o};
assign core_interrupt_tcon_o={core_reg_ctrl_interrupt_tf1_o,
core_reg_ctrl_interrupt_tf0_o,core_reg_ctrl_interrupt_ie1_o,
core_reg_ctrl_interrupt_it1_o,core_reg_ctrl_interrupt_ie0_o,
core_reg_ctrl_interrupt_it0_o};
assign
core_interrupt_tcon2_o={core_reg_ctrl_interrupt_txrxf_o,core_reg_ctrl_interrupt_tf2_o};
assign
core_interrupt_intx_o={core_reg_ctrl_interrupt_int1_o,core_reg_ctrl_interrupt_int0_o};

wire        core_reg_ctrl_interrupt_ie0_i;
wire        core_reg_ctrl_interrupt_ie1_i;
wire        core_reg_ctrl_interrupt_tf0_i;
wire        core_reg_ctrl_interrupt_tf1_i;
wire        core_reg_ctrl_interrupt_tf2_i;
wire        core_reg_ctrl_interrupt_txrxf_i;

wire        fsm_reset_core_b;

assign core_reg_ctrl_interrupt_ie0_i=core_interrupt_tcon_i[0];
assign core_reg_ctrl_interrupt_ie1_i=core_interrupt_tcon_i[1];
assign core_reg_ctrl_interrupt_tf0_i=core_interrupt_tcon_i[2];
assign core_reg_ctrl_interrupt_tf1_i=core_interrupt_tcon_i[3];
assign core_reg_ctrl_interrupt_tf2_i=core_interrupt_tcon2_i[0];
assign core_reg_ctrl_interrupt_txrxf_i=core_interrupt_tcon2_i[1];

assign core_reset_o=fsm_reset_core_b;

wire [15:0] alu_fsm_result_temp;

always @(posedge core_mem_clk_i)
begin
         alu_fsm_result <= alu_fsm_result_temp;
end

core_fsm fsm (
             .fsm_clock_i           (core_clk_i),
             .fsm_reset_i_b         (core_reset_i),
             .fsm_reset_core_o_b    (fsm_reset_core_b),
             .fsm_alu_result_i      (alu_fsm_result),
             .fsm_bit_byte_flag_o   (fsm_bit_byte_flag),
             .fsm_sfr_addr_o        (fsm_reg_ctrl_addr),
             .fsm_rom_addr_o        (fsm_mem_ctrl_rom_addr),
             .fsm_ram_addr_o        (fsm_mem_ctrl_ram_addr),
             .fsm_rom_rd_o_b        (fsm_mem_ctrl_rom_rd_b),
             .fsm_ram_rd_o_b        (fsm_mem_ctrl_ram_rd_b),
             .fsm_sfr_rd_o_b        (fsm_reg_ctrl_rd_b),
             .fsm_ram_wr_o_b        (fsm_mem_ctrl_ram_wr_b),
             .fsm_sfr_wr_o_b        (fsm_reg_ctrl_wr_b),
             .fsm_ext_ram_o         (fsm_ext_ram),
             .fsm_alu_op1_o         (fsm_alu_operand1),
             .fsm_alu_op2_o         (fsm_alu_operand2),
             .fsm_alu_opcode_o      (fsm_alu_opcode),
             .fsm_alu_en_o          (fsm_alu_en),
             .fsm_sfr_data_i        (reg_ctrl_fsm_data),
             .fsm_sfr_data_o        (fsm_reg_ctrl_data),
             .fsm_ram_data_i        (mem_ctrl_fsm_ram_data),
             .fsm_ram_data_o        (fsm_mem_ctrl_ram_data),
             .fsm_rom_data_i        (mem_ctrl_fsm_rom_data),
             .fsm_psw_rs_i          (fsm_reg_ctrl_psw_rs),
             .fsm_pcau_offset_o     (fsm_pcau_offset),
             .fsm_pcau_en_o         (fsm_pcau_en),
             .fsm_pc_i              (pcau_fsm_pc),
             .fsm_pcau_direct_o     (fsm_pcau_direct),
             .fsm_pcau_msb_o        (fsm_pcau_msb),  
             .fsm_state_o           (fsm_pcau_state),
             .fsm_int_vect_i        (core_interrupt_vect_i),
             .fsm_int_na_o          (core_interrupt_na_o),
             .fsm_int_rdy_o         (core_interrupt_rdy_o) 
             );
                 
   core_pcau pcau (
                 .pcau_clock_mem_i   (core_mem_clk_i),
                 .pcau_reset_i_b     (fsm_reset_core_b),
                 .pcau_offset_i      (fsm_pcau_offset),
                 .pcau_en_i          (fsm_pcau_en),
                 .pcau_pc_o          (pcau_fsm_pc),
                 .pcau_pc_direct_i   (fsm_pcau_direct),
                 .pcau_pc_msb_i      (fsm_pcau_msb),
                 .pcau_fsm_state_i   (fsm_pcau_state)
                  );

core_alu alu (  
                   .alu_en_i       (fsm_alu_en),
                   .alu_operand1_i (fsm_alu_operand1), 
                   .alu_operand2_i (fsm_alu_operand2), 
                   .alu_opcode_i   (fsm_alu_opcode),
                   .alu_cy_i       (reg_ctrl_alu_cy),
                   .alu_ac_i       (reg_ctrl_alu_ac),
                   .alu_ov_i       (reg_ctrl_alu_ov),
                   .alu_result_o   (alu_fsm_result_temp),
                   .alu_cy_o       (alu_reg_ctrl_cy),
                   .alu_ac_o       (alu_reg_ctrl_ac),
                   .alu_ov_o       (alu_reg_ctrl_ov)
                 );

core_reg_ctrl reg_ctrl(
               .reg_ctrl_clk_i(core_mem_clk_i),
               .reg_ctrl_reset_b_i(core_reset_i), 
               .reg_ctrl_fsm_wr_b_i(fsm_reg_ctrl_wr_b),
               .reg_ctrl_fsm_rd_b_i(fsm_reg_ctrl_rd_b),
               .reg_ctrl_fsm_bit_byte_flag_i(fsm_bit_byte_flag),
               .reg_ctrl_fsm_addr_i(fsm_reg_ctrl_addr),
               .reg_ctrl_fsm_data_i(fsm_reg_ctrl_data),

               .reg_ctrl_timers_th0_i(core_timers_th0_i), 
               .reg_ctrl_timers_tm0_i(core_timers_tm0_i), 
               .reg_ctrl_timers_tl0_i(core_timers_tl0_i), 
               .reg_ctrl_timers_tf0_i(core_timers_tf0_i), 
               .reg_ctrl_timers_th1_i(core_timers_th1_i), 
               .reg_ctrl_timers_tm1_i(core_timers_tm1_i), 
               .reg_ctrl_timers_tl1_i(core_timers_tl1_i), 
               .reg_ctrl_timers_tf1_i(core_timers_tf1_i), 
               .reg_ctrl_timers_acrh_i(core_timers_acrh_i), 
               .reg_ctrl_timers_acrm_i(core_timers_acrm_i), 
               .reg_ctrl_timers_acrl_i(core_timers_acrl_i),
               .reg_ctrl_timers_tf2_i(core_timers_tf2_i), 

               .reg_ctrl_alu_cy_i(alu_reg_ctrl_cy), 
               .reg_ctrl_alu_ac_i(alu_reg_ctrl_ac), 
               .reg_ctrl_alu_ov_i(alu_reg_ctrl_ov), 

               .reg_ctrl_ext_rom_rd_i(!core_bus_ctrl_ext_rom_rd_b_o),
               .reg_ctrl_ext_ram_rd_i(!core_bus_ctrl_ext_ram_rd_b_o),
               .reg_ctrl_ext_ram_wr_i(!core_bus_ctrl_ext_ram_wr_b_o),

               .reg_ctrl_bus_ctrl_p0en_i(core_bus_ctrl_p0en_i),
               .reg_ctrl_bus_ctrl_p2en_i(core_bus_ctrl_p2en_i),
               .reg_ctrl_bus_ctrl_p3en_6_i(core_bus_ctrl_p3en_6_i),
               .reg_ctrl_bus_ctrl_p3en_7_i(core_bus_ctrl_p3en_7_i),
               .reg_ctrl_bus_ctrl_p2_i(core_bus_ctrl_p2_i),
               .reg_ctrl_bus_ctrl_p3_6_i(core_bus_ctrl_p3_6_i),  
               .reg_ctrl_bus_ctrl_p3_7_i(core_bus_ctrl_p3_7_i), 
               .reg_ctrl_bus_ctrl_p4_i(core_bus_ctrl_p4_i), 

               .reg_ctrl_interrupt_ie0_i(core_reg_ctrl_interrupt_ie0_i),
               .reg_ctrl_interrupt_ie1_i(core_reg_ctrl_interrupt_ie1_i),
               .reg_ctrl_interrupt_tf0_i(core_reg_ctrl_interrupt_tf0_i),
               .reg_ctrl_interrupt_tf1_i(core_reg_ctrl_interrupt_tf1_i),
               .reg_ctrl_interrupt_tf2_i(core_reg_ctrl_interrupt_tf2_i),
               .reg_ctrl_interrupt_txrxf_i(core_reg_ctrl_interrupt_txrxf_i),
               .reg_ctrl_interrupt_clear_i(core_interrupt_clear_i),

               .reg_ctrl_serial_p3en_0_i(core_serial_p3en_0_i), 
               .reg_ctrl_serial_p3en_1_i(core_serial_p3en_1_i), 
               .reg_ctrl_serial_p3_0_i(core_serial_p3_0_i), 
               .reg_ctrl_serial_p3_1_i(core_serial_p3_1_i), 
               .reg_ctrl_serial_sbuf_rx_i(core_serial_sbuf_rx_i), 
               .reg_ctrl_serial_rb8_i(core_serial_rb8_i), 
               .reg_ctrl_serial_ti_i(core_serial_ti_i), 
               .reg_ctrl_serial_ri_i(core_serial_ri_i), 
               .reg_ctrl_serial_load_sbuf_i(core_serial_load_sbuf_i),

               .reg_ctrl_ports_p0_i(core_ports_p0_i), 
               .reg_ctrl_ports_p1_i(core_ports_p1_i), 
               .reg_ctrl_ports_p2_i(core_ports_p2_i), 
               .reg_ctrl_ports_p3_i(core_ports_p3_i), 

               .reg_ctrl_bus_ctrl_p0_i(core_bus_ctrl_p0_i), 

               .reg_ctrl_fsm_data_o(reg_ctrl_fsm_data), 
               .reg_ctrl_fsm_psw_rs_o(fsm_reg_ctrl_psw_rs),

               .reg_ctrl_alu_cy_o(reg_ctrl_alu_cy), 
               .reg_ctrl_alu_ac_o(reg_ctrl_alu_ac), 
               .reg_ctrl_alu_ov_o(reg_ctrl_alu_ov), 

               .reg_ctrl_bus_ctrl_p0_o(core_bus_ctrl_p0_o), 

               .reg_ctrl_timers_th0_o(core_timers_th0_o), 
               .reg_ctrl_timers_tm0_o(core_timers_tm0_o), 
               .reg_ctrl_timers_tl0_o(core_timers_tl0_o), 
               .reg_ctrl_timers_gate_t0_o(core_timers_gate_t0_o), 
               .reg_ctrl_timers_m1_t0_o(core_timers_m1_t0_o), 
               .reg_ctrl_timers_m0_t0_o(core_timers_m0_t0_o), 
               .reg_ctrl_timers_tr0_o(core_timers_tr0_o), 
               .reg_ctrl_timers_tf0_o(core_timers_tf0_o),
               .reg_ctrl_timers_th1_o(core_timers_th1_o), 
               .reg_ctrl_timers_tm1_o(core_timers_tm1_o), 
               .reg_ctrl_timers_tl1_o(core_timers_tl1_o), 
               .reg_ctrl_timers_gate_t1_o(core_timers_gate_t1_o), 
               .reg_ctrl_timers_m1_t1_o(core_timers_m1_t1_o), 
               .reg_ctrl_timers_m0_t1_o(core_timers_m0_t1_o), 
               .reg_ctrl_timers_tr1_o(core_timers_tr1_o), 
               .reg_ctrl_timers_tf1_o(core_timers_tf1_o),
               .reg_ctrl_timers_tacph1_o(core_timers_tacph1_o),
               .reg_ctrl_timers_tacph0_o(core_timers_tacph0_o), 
               .reg_ctrl_timers_tacpl_o(core_timers_tacpl_o), 
               .reg_ctrl_timers_tr2_o(core_timers_tr2_o), 
               .reg_ctrl_timers_tf2_o(core_timers_tf2_o), 
               .reg_ctrl_timers_dfsel_o(core_timers_dfsel_o), 
               .reg_ctrl_timers_edgsel_o(core_timers_edgsel_o), 
               .reg_ctrl_timers_dfp_o(core_timers_dfp_o), 
               .reg_ctrl_timers_int0_o(core_timers_int0_o), 
               .reg_ctrl_timers_int1_o(core_timers_int1_o), 

               .reg_ctrl_ports_p4_o(core_ports_p4_o), 
               .reg_ctrl_ports_p0en_o(core_ports_p0en_o), 
               .reg_ctrl_ports_p1en_o(core_ports_p1en_o),
               .reg_ctrl_ports_p2en_o(core_ports_p2en_o),
               .reg_ctrl_ports_p3en_o(core_ports_p3en_o),
               .reg_ctrl_ports_p0_o(core_ports_p0_o), 
               .reg_ctrl_ports_p1_o(core_ports_p1_o), 
               .reg_ctrl_ports_p2_o(core_ports_p2_o), 
               .reg_ctrl_ports_p3_o(core_ports_p3_o), 


               .reg_ctrl_baudrate_sm0_o(core_baudrate_sm0_o),
               .reg_ctrl_baudrate_sm1_o(core_baudrate_sm1_o),
               .reg_ctrl_baudrate_sm2_o(core_baudrate_sm2_o),
               .reg_ctrl_baudrate_smod_o(core_baudrate_smod_o),
               .reg_ctrl_baudrate_rs232_o(core_baudrate_rs232_o),

               .reg_ctrl_interrupt_ip_o(core_interrupt_ip_o), 
               .reg_ctrl_interrupt_ie_o(core_interrupt_ie_o), 
               .reg_ctrl_interrupt_int0_o(core_reg_ctrl_interrupt_int0_o), 
               .reg_ctrl_interrupt_int1_o(core_reg_ctrl_interrupt_int1_o), 
               .reg_ctrl_interrupt_it0_o(core_reg_ctrl_interrupt_it0_o), 
               .reg_ctrl_interrupt_it1_o(core_reg_ctrl_interrupt_it1_o), 
               .reg_ctrl_interrupt_ie0_o(core_reg_ctrl_interrupt_ie0_o), 
               .reg_ctrl_interrupt_ie1_o(core_reg_ctrl_interrupt_ie1_o), 
               .reg_ctrl_interrupt_ri_o(core_reg_ctrl_interrupt_ri_o), 
               .reg_ctrl_interrupt_ti_o(core_reg_ctrl_interrupt_ti_o), 
               .reg_ctrl_interrupt_tf0_o(core_reg_ctrl_interrupt_tf0_o), 
               .reg_ctrl_interrupt_tf1_o(core_reg_ctrl_interrupt_tf1_o), 
               .reg_ctrl_interrupt_tf2_o(core_reg_ctrl_interrupt_tf2_o), 
               .reg_ctrl_interrupt_txrxf_o(core_reg_ctrl_interrupt_txrxf_o), 

               .reg_ctrl_serial_sm0_o(core_serial_sm0_o), 
               .reg_ctrl_serial_ren_o(core_serial_ren_o), 
               .reg_ctrl_serial_p3_0_o(core_serial_p3_0_o), 
               .reg_ctrl_serial_sbuf_tx_o(core_serial_sbuf_tx_o), 
               .reg_ctrl_serial_tb8_o(core_serial_tb8_o),
               .reg_ctrl_serial_ti_o(core_serial_ti_o),
               .reg_ctrl_serial_ri_o(core_serial_ri_o),
               .reg_ctrl_serial_tx_o(core_serial_tx_o)
               );

core_mem_ctrl mem_ctrl(
                     .mem_ctrl_clk_i(core_mem_clk_i),
                     .mem_ctrl_rom_rd_b_i(fsm_mem_ctrl_rom_rd_b),
                     .mem_ctrl_ram_rd_b_i(fsm_mem_ctrl_ram_rd_b),
                     .mem_ctrl_ram_wr_b_i(fsm_mem_ctrl_ram_wr_b),
                     .mem_ctrl_bit_byte_flag_i(fsm_bit_byte_flag),
                     .mem_ctrl_ext_ram_i(fsm_ext_ram),
                     .mem_ctrl_rom_addr_i(fsm_mem_ctrl_rom_addr),
                     .mem_ctrl_ram_addr_i(fsm_mem_ctrl_ram_addr),
                     .mem_ctrl_ram_data_i(fsm_mem_ctrl_ram_data),
                     .mem_ctrl_bus_ctrl_ea_b_i(core_bus_ctrl_ea_b_i),
                     .mem_ctrl_bus_ctrl_data_i(core_bus_ctrl_data_i),
                     .mem_ctrl_bus_ctrl_data_o(core_bus_ctrl_data_o),
                     .mem_ctrl_bus_ctrl_addr_o(core_bus_ctrl_addr_o),
                     .mem_ctrl_bus_ctrl_ext_rom_rd_b_o(core_bus_ctrl_ext_rom_rd_b_o),
                     .mem_ctrl_bus_ctrl_ext_ram_rd_b_o(core_bus_ctrl_ext_ram_rd_b_o),
                     .mem_ctrl_bus_ctrl_ext_ram_wr_b_o(core_bus_ctrl_ext_ram_wr_b_o),
                     .mem_ctrl_rom_data_o(mem_ctrl_fsm_rom_data),
                     .mem_ctrl_ram_data_o(mem_ctrl_fsm_ram_data)
                     );

endmodule
