`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_reg_ctrl.v"

module core_reg_ctrl_tb();



`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_reg_ctrl_defines.v"
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_reg_ctrl_functions.v"


reg             clk_i;
wire            reset_b_i;

wire            fsm_wr_b_i;
wire            fsm_rd_b_i;
wire            fsm_byte_b_i;
wire[7:0]       fsm_addr_i;
wire[7:0]       fsm_data_i;
wire            fsm_serial_tx_i;

wire            ext_rom_rd_i;
wire            ext_ram_rd_i;
wire            ext_ram_wr_i;

wire            alu_cy_i;
wire            alu_ac_i;
wire            alu_ov_i;

wire[7:0]       bus_ctrl_p0en_i;
wire[7:0]       bus_ctrl_p0_i;
wire[7:0]       bus_ctrl_p2en_i;
wire[7:0]       bus_ctrl_p2_i;
wire            bus_ctrl_p3en_6_i;
wire            bus_ctrl_p3en_7_i;
wire            bus_ctrl_p3_6_i;
wire            bus_ctrl_p3_7_i;
wire[7:0]       bus_ctrl_p4_i;

wire            interrupt_ie0_i;
wire            interrupt_ie1_i;
//wire            interrupt_ri_i;
//wire            interrupt_ti_i;
wire            interrupt_tf0_i;
wire            interrupt_tf1_i;
wire            interrupt_tf2_i;
wire            interrupt_txrxf_i;
wire            interrupt_clear_i;

wire [7:0]       ports_p0_i;
wire [7:0]       ports_p1_i;
wire [7:0]       ports_p2_i;
wire [7:0]       ports_p3_i;

wire            serial_p3en_0_i;
wire            serial_p3en_1_i;
wire            serial_p3_0_i;
wire            serial_p3_1_i;
wire[7:0]       serial_sbuf_rx_i;
wire            serial_rb8_i;
wire            serial_ti_i;
wire            serial_ri_i;

wire[7:0]       timers_th0_i;
wire[7:0]       timers_tm0_i;
wire[7:0]       timers_tl0_i;
wire            timers_tf0_i;
wire[7:0]       timers_th1_i;
wire[7:0]       timers_tm1_i;
wire[7:0]       timers_tl1_i;
wire            timers_tf1_i;
wire[7:0]       timers_acrh_i;
wire[7:0]       timers_acrm_i;
wire[7:0]       timers_acrl_i;
wire [1:0]      timers_tacph_i;
wire [7:0]      timers_tacpl_i;
wire            timers_tf2_i;

wire [7:0]      fsm_data_o;
wire [1:0]      fsm_psw_rs_o;

wire            alu_cy_o;
wire            alu_ac_o;
wire            alu_ov_o;

wire            baudrate_sm0_o;
wire            baudrate_sm1_o;
wire            baudrate_sm2_o;
wire            baudrate_smod_o;
wire            baudrate_rs232_o;

wire [7:0]       bus_ctrl_p0_o;

wire [6:0]      interrupt_ip_o;
wire [7:0]      interrupt_ie_o;
wire            interrupt_int0_o;
wire            interrupt_int1_o;
wire            interrupt_it0_o;
wire            interrupt_it1_o;
wire            interrupt_ie0_o;
wire            interrupt_ie1_o;
wire            interrupt_ri_o;
wire            interrupt_ti_o;
wire            interrupt_tf0_o;
wire            interrupt_tf1_o;
wire            interrupt_tf2_o;
wire            interrupt_txrxf_o;

wire [7:0]      ports_p0_o;
wire [7:0]      ports_p1_o;
wire [7:0]      ports_p2_o;
wire [7:0]      ports_p3_o;
wire [7:0]      ports_p4_o;
wire [7:0]      ports_p0en_o;
wire [7:0]      ports_p1en_o;
wire [7:0]      ports_p2en_o;
wire [7:0]      ports_p3en_o;

wire            serial_sm0_o;
wire            serial_ren_o;
wire            serial_p3_0_o;
wire            serial_p3_1_o;
wire [7:0]      serial_sbuf_tx_o;
wire            serial_tb8_o;
wire            serial_ti_o;
wire            serial_ri_o;
wire            serial_tx_o;

wire [7:0]      timers_th0_o;
wire [7:0]      timers_tm0_o;
wire [7:0]      timers_tl0_o;
wire            timers_gate_t0_o;
wire            timers_m1_t0_o;
wire            timers_m0_t0_o;
wire            timers_tr0_o;
wire            timers_tf0_o;
wire [7:0]      timers_th1_o;
wire [7:0]      timers_tm1_o;
wire [7:0]      timers_tl1_o;
wire            timers_gate_t1_o;
wire            timers_m1_t1_o;
wire            timers_m0_t1_o;
wire            timers_int0_o;
wire            timers_tr1_o;
wire            timers_tf1_o;
wire            timers_int1_o;
wire [1:0]      timers_tacph_o;
wire [7:0]      timers_tacpl_o;
wire            timers_tr2_o;
wire            timers_tf2_o;
wire            timers_dfsel_o;
wire            timers_edgsel_o;
wire [2:0]      timers_dfp_o;

core_reg_ctrl DUT(
               .reg_ctrl_clk_i(clk_i),
               .reg_ctrl_reset_b_i(reset_b_i), 

               .reg_ctrl_fsm_wr_b_i(fsm_wr_b_i),
               .reg_ctrl_fsm_rd_b_i(fsm_rd_b_i),
               .reg_ctrl_fsm_bit_byte_flag_i(fsm_byte_b_i),
               .reg_ctrl_fsm_addr_i(fsm_addr_i),
               .reg_ctrl_fsm_data_i(fsm_data_i),
 
               .reg_ctrl_ext_rom_rd_i(ext_rom_rd_i),
               .reg_ctrl_ext_ram_rd_i(ext_ram_rd_i),
               .reg_ctrl_ext_ram_wr_i(ext_ram_wr_i),

               .reg_ctrl_alu_cy_i(alu_cy_i), 
               .reg_ctrl_alu_ac_i(alu_ac_i), 
               .reg_ctrl_alu_ov_i(alu_ov_i), 

               .reg_ctrl_bus_ctrl_p0en_i(bus_ctrl_p0en_i),
               .reg_ctrl_bus_ctrl_p0_i(bus_ctrl_p0_i),
               .reg_ctrl_bus_ctrl_p2en_i(bus_ctrl_p2en_i),
               .reg_ctrl_bus_ctrl_p2_i(bus_ctrl_p2_i),
               .reg_ctrl_bus_ctrl_p3en_6_i(bus_ctrl_p3en_6_i),
               .reg_ctrl_bus_ctrl_p3en_7_i(bus_ctrl_p3en_7_i),
               .reg_ctrl_bus_ctrl_p3_6_i(bus_ctrl_p3_6_i),  
               .reg_ctrl_bus_ctrl_p3_7_i(bus_ctrl_p3_7_i), 
               .reg_ctrl_bus_ctrl_p4_i(bus_ctrl_p4_i), 

               .reg_ctrl_interrupt_ie0_i(interrupt_ie0_i),
               .reg_ctrl_interrupt_ie1_i(interrupt_ie1_i),
               .reg_ctrl_interrupt_tf0_i(interrupt_tf0_i),
               .reg_ctrl_interrupt_tf1_i(interrupt_tf1_i),
               .reg_ctrl_interrupt_tf2_i(interrupt_tf2_i),
               .reg_ctrl_interrupt_txrxf_i(interrupt_txrxf_i),
               .reg_ctrl_interrupt_clear_i(interrupt_clear_i),

               .reg_ctrl_ports_p0_i(ports_p0_i), 
               .reg_ctrl_ports_p1_i(ports_p1_i), 
               .reg_ctrl_ports_p2_i(ports_p2_i), 
               .reg_ctrl_ports_p3_i(ports_p3_i), 
                              
               .reg_ctrl_serial_p3en_0_i(serial_p3en_0_i), 
               .reg_ctrl_serial_p3en_1_i(serial_p3en_1_i), 
               .reg_ctrl_serial_p3_0_i(serial_p3_0_i), 
               .reg_ctrl_serial_p3_1_i(serial_p3_1_i), 
               .reg_ctrl_serial_sbuf_rx_i(serial_sbuf_rx_i), 
               .reg_ctrl_serial_rb8_i(serial_rb8_i), 
               .reg_ctrl_serial_ti_i(serial_ti_i), 
               .reg_ctrl_serial_ri_i(serial_ri_i), 
               
               .reg_ctrl_timers_th0_i(timers_th0_i), 
               .reg_ctrl_timers_tm0_i(timers_tm0_i), 
               .reg_ctrl_timers_tl0_i(timers_tl0_i), 
               .reg_ctrl_timers_tf0_i(timers_tf0_i), 
               .reg_ctrl_timers_th1_i(timers_th1_i), 
               .reg_ctrl_timers_tm1_i(timers_tm1_i), 
               .reg_ctrl_timers_tl1_i(timers_tl1_i), 
               .reg_ctrl_timers_tf1_i(timers_tf1_i), 
               .reg_ctrl_timers_acrh_i(timers_acrh_i), 
               .reg_ctrl_timers_acrm_i(timers_acrm_i), 
               .reg_ctrl_timers_acrl_i(timers_acrl_i), 
               .reg_ctrl_timers_tacph_i(timers_tacph_i),
               .reg_ctrl_timers_tacpl_i(timers_tacpl_i),
               .reg_ctrl_timers_tf2_i(timers_tf2_i), 
               
               .reg_ctrl_fsm_data_o(fsm_data_o), 
               .reg_ctrl_fsm_psw_rs_o(fsm_psw_rs_o),
               
               .reg_ctrl_alu_cy_o(alu_cy_o), 
               .reg_ctrl_alu_ac_o(alu_ac_o), 
               .reg_ctrl_alu_ov_o(alu_ov_o), 
               
               .reg_ctrl_baudrate_sm0_o(baudrate_sm0_o),
               .reg_ctrl_baudrate_sm1_o(baudrate_sm1_o),
               .reg_ctrl_baudrate_sm2_o(baudrate_sm2_o),
               .reg_ctrl_baudrate_smod_o(baudrate_smod_o),
               .reg_ctrl_baudrate_rs232_o(baudrate_rs232_o),
                              
               .reg_ctrl_bus_ctrl_p0_o(bus_ctrl_p0_o), 

               .reg_ctrl_interrupt_ip_o(interrupt_ip_o), 
               .reg_ctrl_interrupt_ie_o(interrupt_ie_o), 
               .reg_ctrl_interrupt_int0_o(interrupt_int0_o), 
               .reg_ctrl_interrupt_int1_o(interrupt_int1_o), 
               .reg_ctrl_interrupt_it0_o(interrupt_it0_o), 
               .reg_ctrl_interrupt_it1_o(interrupt_it1_o),
               .reg_ctrl_interrupt_ie0_o(interrupt_ie0_o), 
               .reg_ctrl_interrupt_ie1_o(interrupt_ie1_o), 
               .reg_ctrl_interrupt_ri_o(interrupt_ri_o), 
               .reg_ctrl_interrupt_ti_o(interrupt_ti_o), 
               .reg_ctrl_interrupt_tf0_o(interrupt_tf0_o), 
               .reg_ctrl_interrupt_tf1_o(interrupt_tf1_o), 
               .reg_ctrl_interrupt_tf2_o(interrupt_tf2_o), 
               .reg_ctrl_interrupt_txrxf_o(interrupt_txrxf_o), 

 
               .reg_ctrl_ports_p0_o(ports_p0_o), 
               .reg_ctrl_ports_p1_o(ports_p1_o), 
               .reg_ctrl_ports_p2_o(ports_p2_o), 
               .reg_ctrl_ports_p3_o(ports_p3_o), 
               .reg_ctrl_ports_p4_o(ports_p4_o), 
               .reg_ctrl_ports_p0en_o(ports_p0en_o), 
               .reg_ctrl_ports_p1en_o(ports_p1en_o),
               .reg_ctrl_ports_p2en_o(ports_p2en_o),
               .reg_ctrl_ports_p3en_o(ports_p3en_o),

               .reg_ctrl_serial_sm0_o(serial_sm0_o), 
               .reg_ctrl_serial_ren_o(serial_ren_o), 
               .reg_ctrl_serial_p3_0_o(serial_p3_0_o), 
               .reg_ctrl_serial_sbuf_tx_o(serial_sbuf_tx_o), 
               .reg_ctrl_serial_tb8_o(serial_tb8_o),
               .reg_ctrl_serial_ti_o(serial_ti_o),
               .reg_ctrl_serial_ri_o(serial_ri_o),
               .reg_ctrl_serial_tx_o(serial_tx_o),
               
               .reg_ctrl_timers_th0_o(timers_th0_o), 
               .reg_ctrl_timers_tm0_o(timers_tm0_o), 
               .reg_ctrl_timers_tl0_o(timers_tl0_o), 
               .reg_ctrl_timers_gate_t0_o(timers_gate_t0_o), 
               .reg_ctrl_timers_m1_t0_o(timers_m1_t0_o), 
               .reg_ctrl_timers_m0_t0_o(timers_m0_t0_o), 
               .reg_ctrl_timers_tr0_o(timers_tr0_o),
               .reg_ctrl_timers_tf0_o(timers_tf0_o), 
               .reg_ctrl_timers_th1_o(timers_th1_o), 
               .reg_ctrl_timers_tm1_o(timers_tm1_o), 
               .reg_ctrl_timers_tl1_o(timers_tl1_o), 
               .reg_ctrl_timers_gate_t1_o(timers_gate_t1_o), 
               .reg_ctrl_timers_m1_t1_o(timers_m1_t1_o), 
               .reg_ctrl_timers_m0_t1_o(timers_m0_t1_o),
               .reg_ctrl_timers_int0_o(timers_int0_o), 
               .reg_ctrl_timers_tr1_o(timers_tr1_o),
               .reg_ctrl_timers_tf1_o(timers_tf1_o),
               .reg_ctrl_timers_int1_o(timers_int1_o), 
               .reg_ctrl_timers_tacph_o(timers_tacph_o), 
               .reg_ctrl_timers_tacpl_o(timers_tacpl_o), 
               .reg_ctrl_timers_tr2_o(timers_tr2_o),
               .reg_ctrl_timers_tf2_o(timers_tf2_o), 
               .reg_ctrl_timers_dfsel_o(timers_dfsel_o), 
               .reg_ctrl_timers_edgsel_o(timers_edgsel_o), 
               .reg_ctrl_timers_dfp_o(timers_dfp_o) 
               );

//`include "./RTL/core_reg_ctrl_simvision_aux.v"


always

	begin

		clk_i <= 1			;
		#25			;
		clk_i <= 0			;
		#25			;

	end

endmodule
