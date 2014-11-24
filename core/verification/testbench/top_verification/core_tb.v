//`timescale 1 ns/10 ps

 `include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v"
 `include "/home/student/EMC08/digital_A/core/design/rtl_v/core.v"
 `include "/home/student/EMC08/digital_A/core/verification/testbench/top_verification/SPRAM128X8.v"
 `include "/home/student/EMC08/digital_A/core/verification/testbench/top_verification/ROM4096X8.v"

module core_tb;



parameter MAIN_PERIOD=50;
parameter MEM_PERIOD=25;

reg               core_clk_i;
reg               core_mem_clk_i;
reg               core_reset_i;

reg   [7:0]      core_timers_th0_i;
reg   [7:0]      core_timers_tm0_i;
reg   [7:0]      core_timers_tl0_i;
reg              core_timers_tf0_i;
reg   [7:0]       core_timers_th1_i;
reg   [7:0]       core_timers_tm1_i;
reg   [7:0]       core_timers_tl1_i;
reg               core_timers_tf1_i;
reg   [7:0]       core_timers_acrh_i;
reg   [7:0]       core_timers_acrm_i;
reg   [7:0]       core_timers_acrl_i;
reg               core_timers_tf2_i;

reg   [3:0]       core_interrupt_tcon_i;
reg   [1:0]       core_interrupt_tcon2_i;
reg               core_interrupt_clear_i;
reg   [2:0]       core_interrupt_vect_i;

reg               core_serial_p3en_0_i;
reg               core_serial_p3en_1_i;
reg               core_serial_p3_0_i;
reg               core_serial_p3_1_i;
reg   [7:0]       core_serial_sbuf_rx_i;
reg               core_serial_rb8_i;
reg               core_serial_ti_i;
reg               core_serial_ri_i;
wire              core_serial_tx_o;

wire  [7:0]       core_ports_p0_i;
wire  [7:0]       core_ports_p1_i;
wire  [7:0]       core_ports_p2_i;
wire  [7:0]       core_ports_p3_i;

wire  [7:0]       core_bus_ctrl_p0_i;

wire              core_reset_o;

wire              core_baudrate_sm0;
wire              core_baudrate_sm1;
wire              core_baudrate_sm2;
wire              core_baudrate_smod;
wire              core_baudrate_rs232;

wire  [7:0]       core_timers_th0_o;
wire  [7:0]       core_timers_tm0_o;
wire  [7:0]       core_timers_tl0_o;
wire              core_timers_gate_t0_o;
wire              core_timers_m1_t0_o;
wire              core_timers_m0_t0_o;
wire              core_timers_tr0_o;
wire              core_timers_tf0_o;
wire  [7:0]       core_timers_th1_o;
wire  [7:0]       core_timers_tm1_o;
wire  [7:0]       core_timers_tl1_o;
wire              core_timers_gate_t1_o;
wire              core_timers_m1_t1_o;
wire              core_timers_m0_t1_o;
wire              core_timers_int0_o;
wire              core_timers_tr1_o;
wire              core_timers_tf1_o;
wire              core_timers_int1_o;
wire [1:0]        core_timers_tacph_o;
wire [7:0]        core_timers_tacpl_o;
// wire [1:0]        core_timers_tacph_i;
// wire [7:0]        core_timers_tacpl_i;
wire              core_timers_tr2_o;
wire              core_timers_tf2_o;
wire              core_timers_dfsel_o;
wire              core_timers_edgsel_o;
wire [2:0]        core_timers_dfp_o;

wire [6:0]        core_interrupt_ip_o;
wire [7:0]        core_interrupt_ie_o;
wire [1:0]        core_interrupt_scon_o;
wire [5:0]        core_interrupt_tcon_o;
wire [1:0]        core_interrupt_tcon2_o;
wire [1:0]        core_interrupt_intx_o;
wire              core_interrupt_na_o;
wire              core_interrupt_rdy_o;

wire [7:0]        core_ports_p0_o;
wire [7:0]        core_ports_p1_o;
wire [7:0]        core_ports_p2_o;
wire [7:0]        core_ports_p3_o;
wire [7:0]        core_ports_p4_o;
wire [7:0]        core_ports_p0en_o;
wire [7:0]        core_ports_p1en_o;
wire [7:0]        core_ports_p2en_o;
wire [7:0]        core_ports_p3en_o;

wire              core_serial_sm0_o;
wire              core_serial_ren_o;
wire              core_serial_p3_0_o;
wire [7:0]        core_serial_sbuf_tx_o;
wire              core_serial_tb8_o;
wire              core_serial_ti_o;
wire              core_serial_ri_o;

wire              core_bus_ctrl_ea_b;
wire  [7:0]       core_bus_ctrl_data_i;
wire  [15:0]      core_bus_ctrl_addr;
wire  [7:0]       core_bus_ctrl_data_o;
wire              core_bus_ctrl_ext_rom_rd_b;
wire              core_bus_ctrl_ext_ram_rd_b;
wire              core_bus_ctrl_ext_ram_wr_b;

wire  [7:0]       core_bus_ctrl_p0_o;
wire  [7:0]       core_bus_ctrl_p0en;
wire  [7:0]       core_bus_ctrl_p2en;
wire  [7:0]       core_bus_ctrl_p2;
wire              core_bus_ctrl_p3_6;
wire              core_bus_ctrl_p3_7;
wire              core_bus_ctrl_p3en_6;
wire              core_bus_ctrl_p3en_7;
wire  [7:0]       core_bus_ctrl_p4;
wire              core_bus_ctrl_psen_b_o;


core CORE(  
            .core_clk_i(core_clk_i),
            .core_mem_clk_i(core_mem_clk_i),
            .core_reset_i(core_reset_i),

            .core_interrupt_vect_i(core_interrupt_vect_i),
            
            .core_serial_tx_o(core_serial_tx_o),

            .core_timers_th0_i(core_timers_th0_i),
            .core_timers_tm0_i(core_timers_tm0_i),
            .core_timers_tl0_i(core_timers_tl0_i),
            .core_timers_tf0_i(core_timers_tf0_i),
            .core_timers_th1_i(core_timers_th1_i),
            .core_timers_tm1_i(core_timers_tm1_i),
            .core_timers_tl1_i(core_timers_tl1_i),
            .core_timers_tf1_i(core_timers_tf1_i),
            .core_timers_acrh_i(core_timers_acrh_i),
            .core_timers_acrm_i(core_timers_acrm_i),
            .core_timers_acrl_i(core_timers_acrl_i),
//             .core_timers_tacph_i(core_timers_tacph_i),
//             .core_timers_tacpl_i(core_timers_tacpl_i),
            .core_timers_tf2_i(core_timers_tf2_i),

            .core_bus_ctrl_p0en_i(core_bus_ctrl_p0en),
            .core_bus_ctrl_p2en_i(core_bus_ctrl_p2en),
            .core_bus_ctrl_p3en_6_i(core_bus_ctrl_p3en_6),
            .core_bus_ctrl_p3en_7_i(core_bus_ctrl_p3en_7),
            .core_bus_ctrl_p2_i(core_bus_ctrl_p2),
            .core_bus_ctrl_p3_6_i(core_bus_ctrl_p3_6),
            .core_bus_ctrl_p3_7_i(core_bus_ctrl_p3_7),
            .core_bus_ctrl_p4_i(core_bus_ctrl_p4),

            .core_interrupt_tcon_i(core_interrupt_tcon_i),
            .core_interrupt_tcon2_i(core_interrupt_tcon2_i),
            .core_interrupt_clear_i(core_interrupt_clear_i),

            .core_serial_p3en_0_i(core_serial_p3en_0_i),
            .core_serial_p3en_1_i(core_serial_p3en_1_i),
            .core_serial_p3_0_i(core_serial_p3_0_i),
            .core_serial_p3_1_i(core_serial_p3_1_i),
            .core_serial_sbuf_rx_i(core_serial_sbuf_rx_i),
            .core_serial_rb8_i(core_serial_rb8_i),
            .core_serial_ti_i(core_serial_ti_i),
            .core_serial_ri_i(core_serial_ri_i),

            .core_ports_p0_i(core_ports_p0_i),
            .core_ports_p1_i(core_ports_p1_i),
            .core_ports_p2_i(core_ports_p2_i),
            .core_ports_p3_i(core_ports_p3_i),

            .core_bus_ctrl_p0_i(core_bus_ctrl_p0_i),

            .core_reset_o(core_reset_o),
            
            .core_baudrate_sm0_o(core_baudrate_sm0),
            .core_baudrate_sm1_o(core_baudrate_sm1),
            .core_baudrate_sm2_o(core_baudrate_sm2),
            .core_baudrate_smod_o(core_baudrate_smod),
            .core_baudrate_rs232_o(core_baudrate_rs232),


            .core_timers_th0_o(core_timers_th0_o),
            .core_timers_tm0_o(core_timers_tm0_o),
            .core_timers_tl0_o(core_timers_tl0_o),
            .core_timers_gate_t0_o(core_timers_gate_t0_o),
            .core_timers_m1_t0_o(core_timers_m1_t0_o),
            .core_timers_m0_t0_o(core_timers_m0_t0_o),
            .core_timers_tr0_o(core_timers_tr0_o),
            .core_timers_tf0_o(core_timers_tf0_o),
            .core_timers_th1_o(core_timers_th1_o),
            .core_timers_tm1_o(core_timers_tm1_o),
            .core_timers_tl1_o(core_timers_tl1_o),
            .core_timers_gate_t1_o(core_timers_gate_t1_o),
            .core_timers_m1_t1_o(core_timers_m1_t1_o),
            .core_timers_m0_t1_o(core_timers_m0_t1_o),
            .core_timers_int0_o(core_timers_int0_o),
            .core_timers_tr1_o(core_timers_tr1_o),
            .core_timers_tf1_o(core_timers_tf1_o),
            .core_timers_int1_o(core_timers_int1_o),
            .core_timers_tacph_o(core_timers_tacph_o),
            .core_timers_tacpl_o(core_timers_tacpl_o),
            .core_timers_tr2_o(core_timers_tr2_o),
            .core_timers_tf2_o(core_timers_tf2_o),
            .core_timers_dfsel_o(core_timers_dfsel_o),
            .core_timers_edgsel_o(core_timers_edgsel_o),
            .core_timers_dfp_o(core_timers_dfp_o),

            .core_interrupt_ip_o(core_interrupt_ip_o),
            .core_interrupt_ie_o(core_interrupt_ie_o),
            .core_interrupt_scon_o(core_interrupt_scon_o),
            .core_interrupt_tcon_o(core_interrupt_tcon_o),
            .core_interrupt_tcon2_o(core_interrupt_tcon2_o),
            .core_interrupt_intx_o(core_interrupt_intx_o),

            .core_interrupt_na_o(core_interrupt_na_o),
            .core_interrupt_rdy_o(core_interrupt_rdy_o),
            
            .core_ports_p4_o(core_ports_p4_o),
            .core_ports_p0en_o(core_ports_p0en_o),
            .core_ports_p1en_o(core_ports_p1en_o),
            .core_ports_p2en_o(core_ports_p2en_o),
            .core_ports_p3en_o(core_ports_p3en_o),
            .core_ports_p0_o(core_ports_p0_o),
            .core_ports_p1_o(core_ports_p1_o),
            .core_ports_p2_o(core_ports_p2_o),
            .core_ports_p3_o(core_ports_p3_o),
            
            .core_bus_ctrl_p0_o(core_bus_ctrl_p0_o),
            
            .core_serial_sm0_o(core_serial_sm0_o),
            .core_serial_ren_o(core_serial_ren_o),
            .core_serial_p3_0_o(core_serial_p3_0_o),
            .core_serial_sbuf_tx_o(core_serial_sbuf_tx_o),
            .core_serial_tb8_o(core_serial_tb8_o),
            .core_serial_ti_o(core_serial_ti_o),
            .core_serial_ri_o(core_serial_ri_o),

            .core_bus_ctrl_ea_b_i(core_bus_ctrl_ea_b),
            .core_bus_ctrl_data_i(core_bus_ctrl_data_i),
            .core_bus_ctrl_addr_o(core_bus_ctrl_addr),
            .core_bus_ctrl_data_o(core_bus_ctrl_data_o),
            .core_bus_ctrl_ext_rom_rd_b_o(core_bus_ctrl_ext_rom_rd_b),
            .core_bus_ctrl_ext_ram_rd_b_o(core_bus_ctrl_ext_ram_rd_b),
            .core_bus_ctrl_ext_ram_wr_b_o(core_bus_ctrl_ext_ram_wr_b)
            );

  
   
initial core_clk_i=0;
always #(MAIN_PERIOD/2.0) core_clk_i=~core_clk_i;

initial core_mem_clk_i=0;
always #(MEM_PERIOD/2.0) core_mem_clk_i=~core_mem_clk_i;


endmodule
