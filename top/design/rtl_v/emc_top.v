// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name: emc_top.v
// Module Name: top
// Author: Vinicius
// E-mail: correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 19/09/2010 Initial version
// -----------------------------------------------------------------------------
// Description
// This file intanciates all blocks of emc08 microcontroller.
// -----------------------------------------------------------------------------

`include "/home/student/EMC08/digital_A/top/design/rtl_v/time_scale.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core.v" 
`include "/home/student/EMC08/digital_A/interrupt/design/rtl_v/interrupt.v" 
`include "/home/student/EMC08/digital_A/bus_ctrl/design/rtl_v/bus_control.v" 
`include "/home/student/EMC08/digital_A/serial/design/rtl_v/serial_top.v"
`include "/home/student/EMC08/digital_A/baud_rate/design/rtl_v/baud_rate.v" 
`include "/home/student/EMC08/digital_A/timers/design/rtl_v/top_timers.v"
`include "/home/student/EMC08/digital_A/ports/design/rtl_v/Port_TOP.v"


module emc_top //###############################################################
   (
      top_clock_i,
      top_clock_mem_i,
      top_reset_i,
      top_p0_y_i,
      top_p1_y_i,
      top_p2_y_i,
      top_p3_y_i,
      top_p0_en_o,
      top_p1_en_o,
      top_p2_en_o,
      top_p3_en_o,
      top_p0_a_o,
      top_p1_a_o,
      top_p2_a_o,
      top_p3_a_o,
      top_p4_a_o,
      top_pht_i,
      top_ea_b_i,
      top_test_mode_i,
      top_psen_b_o
   );   

   // common inputs
   input         top_clock_i;
   input         top_clock_mem_i;
   input         top_reset_i;
   
   // PAD control signals - inputs and outputs  
   input   [7:0] top_p0_y_i;
   input   [7:0] top_p1_y_i;
   input   [7:0] top_p2_y_i;
   input   [7:0] top_p3_y_i;
   output  [7:0] top_p0_en_o;
   output  [7:0] top_p1_en_o;
   output  [7:0] top_p2_en_o;
   output  [7:0] top_p3_en_o;
   output  [7:0] top_p0_a_o;
   output  [7:0] top_p1_a_o;
   output  [7:0] top_p2_a_o;
   output  [7:0] top_p3_a_o;
   output  [7:0] top_p4_a_o;
    
   // bus control external signals
   input         top_ea_b_i;
   output        top_psen_b_o;
  
   // timers external signals
   input         top_pht_i;

   // test mode external signals
   input         top_test_mode_i;
   // internal signals #########################################################
   
   // reset from core
   wire          core_reset_o;
   
   // interrupt
   wire    [2:0] int_vect_o;
   wire          core_interrupt_na_o;
   wire          core_interrupt_rdy_o;
   wire          int_reg_clr_o;
   wire    [3:0] reg_tcon_o;
   wire    [1:0] reg_tcon2_o;
   wire    [6:0] core_interrupt_ip_o;
   wire    [7:0] core_interrupt_ie_o;
   wire    [1:0] core_interrupt_scon_o;
   wire    [5:0] core_interrupt_tcon_o;
   wire    [1:0] core_interrupt_tcon2_o;
   wire    [1:0] core_interrupt_intx_o;
      
   //bus control
   wire          core_bus_ctrl_ext_rom_rd_b_o;
   wire          core_bus_ctrl_ext_ram_rd_b_o;
   wire          core_bus_ctrl_ext_ram_wr_b_o;
   wire   [15:0] core_bus_ctrl_addr_o;
   wire    [7:0] core_bus_ctrl_data_o;
   wire          bus_control_ea_b_o;
   wire    [7:0] bus_control_ext_data_o;
   wire    [7:0] core_bus_ctrl_p0_o;
   wire    [7:0] bus_control_p0_o;
   wire    [7:0] bus_control_p0en_o;
   wire    [7:0] bus_control_p2en_o;
   wire    [7:0] bus_control_p2_o;
   wire          bus_control_p3_6_o;
   wire          bus_control_p3_7_o;
   wire          bus_control_p3en_6_o;
   wire          bus_control_p3en_7_o;
   wire    [7:0] bus_control_p4_o;
   
   //Serial
   wire          serial_p3en_0_o;
   wire          serial_p3en_1_o;
   wire          serial_p3_0_o;
   wire          serial_p3_1_o;
   wire          serial_scon0_ri_o;
   wire          serial_scon1_ti_o;
   wire          serial_scon2_rb8_o;
   wire    [7:0] serial_data_sbuf_o;
   wire          serial_load_sbuf_o;
   
   wire          core_serial_tx_o;
   wire          core_serial_sm0_o;
   wire          core_serial_ren_o;
   wire          core_serial_p3_0_o;
   wire    [7:0] core_serial_sbuf_tx_o;
   wire          core_serial_tb8_o;
   wire          core_serial_ti_o;
   wire          core_serial_ri_o;
   
   //Baud Rate
   wire          core_baudrate_sm0_o;
   wire          core_baudrate_sm1_o;
   wire          core_baudrate_sm2_o;
   wire          core_baudrate_smod_o;
   wire          core_baudrate_rs232_o;
   wire          top_cycle_machine;
   wire          top_baud_rate_trans;
   wire          baud_rate_br_o;
   
   //Timers
   wire    [7:0] core_timers_th0_o;
   wire    [7:0] core_timers_tm0_o;
   wire    [7:0] core_timers_tl0_o;
   wire          core_timers_gate_t0_o;   
   wire          core_timers_m1_t0_o;
   wire          core_timers_m0_t0_o;
   wire          core_timers_tr0_o;
   wire          core_timers_tf0_o;
   wire    [7:0] core_timers_th1_o;
   wire    [7:0] core_timers_tm1_o;
   wire    [7:0] core_timers_tl1_o;
   wire          core_timers_gate_t1_o;
   wire          core_timers_m1_t1_o;
   wire          core_timers_m0_t1_o;
   wire          core_timers_int0_o;
   wire          core_timers_tr1_o;
   wire          core_timers_tf1_o;
   wire          core_timers_int1_o;
   wire    [7:0] core_timers_tacph_o;  
   wire    [7:0] core_timers_tacpm_o;  
   wire    [7:0] core_timers_tacpl_o;
   wire          core_timers_tr2_o; 
   wire          core_timers_tf2_o;
   wire          core_timers_dfsel_o;
   wire          core_timers_edgsel_o;
   wire    [2:0] core_timers_dfp_o;
   wire          top_timers_sfr_tcon_tf0_o;
   wire          top_timers_sfr_tcon_tf1_o;
   wire          top_timers_sfr_tcon2_tf2_o;
   wire    [7:0] top_timers_sfr_acrh_o;
   wire    [7:0] top_timers_sfr_acrm_o;
   wire    [7:0] top_timers_sfr_acrl_o;
   wire    [7:0] top_timers_sfr_th0_o;
   wire    [7:0] top_timers_sfr_tm0_o;
   wire    [7:0] top_timers_sfr_tl0_o;
   wire    [7:0] top_timers_sfr_th1_o;
   wire    [7:0] top_timers_sfr_tm1_o;
   wire    [7:0] top_timers_sfr_tl1_o;

   
   // Ports
   wire    [7:0] core_ports_p0en_o;
   wire    [7:0] core_ports_p1en_o;
   wire    [7:0] core_ports_p2en_o;
   wire    [7:0] core_ports_p3en_o;
   wire    [7:0] core_ports_p0_o;
   wire    [7:0] core_ports_p1_o;
   wire    [7:0] core_ports_p2_o;
   wire    [7:0] core_ports_p3_o;
   wire    [7:0] core_ports_p4_o;
   wire    [7:0] ports_sfr_P0_o;
   wire    [7:0] ports_sfr_P1_o;
   wire    [7:0] ports_sfr_P2_o;
   wire    [7:0] ports_sfr_P3_o;
   wire    [7:0] ports_sfr_P4_o;   
 
   
   core CORE_INSTANCE //########################################################
   (
      .core_clk_i                   (top_clock_i                  ), //ok
      .core_mem_clk_i               (top_clock_mem_i              ), //ok
      .core_reset_i                 (top_reset_i                  ), //ok
      .core_interrupt_vect_i        (int_vect_o                   ), //ok
      .core_timers_th0_i            (top_timers_sfr_th0_o         ), //ok
      .core_timers_tm0_i            (top_timers_sfr_tm0_o         ), //ok
      .core_timers_tl0_i            (top_timers_sfr_tl0_o         ), //ok
      .core_timers_tf0_i            (top_timers_sfr_tcon_tf0_o    ), //ok
      .core_timers_th1_i            (top_timers_sfr_th1_o         ), //ok
      .core_timers_tm1_i            (top_timers_sfr_tm1_o         ), //ok
      .core_timers_tl1_i            (top_timers_sfr_tl1_o         ), //ok
      .core_timers_tf1_i            (top_timers_sfr_tcon_tf1_o    ), //ok
      .core_timers_acrh_i           (top_timers_sfr_acrh_o        ), //ok
      .core_timers_acrm_i           (top_timers_sfr_acrm_o        ), //ok
      .core_timers_acrl_i           (top_timers_sfr_acrl_o        ), //ok
      .core_timers_tf2_i            (top_timers_sfr_tcon2_tf2_o   ), //ok
      .core_bus_ctrl_p0en_i         (bus_control_p0en_o           ), //ok
      .core_bus_ctrl_p2en_i         (bus_control_p2en_o           ), //ok
      .core_bus_ctrl_p3en_6_i       (bus_control_p3en_6_o         ), //ok
      .core_bus_ctrl_p3en_7_i       (bus_control_p3en_7_o         ), //ok
      .core_bus_ctrl_p2_i           (bus_control_p2_o             ), //ok
      .core_bus_ctrl_p3_6_i         (bus_control_p3_6_o           ), //ok
      .core_bus_ctrl_p3_7_i         (bus_control_p3_7_o           ), //ok
      .core_bus_ctrl_p4_i           (bus_control_p4_o             ), //ok
      .core_interrupt_tcon_i        (reg_tcon_o                   ), //ok
      .core_interrupt_tcon2_i       (reg_tcon2_o                  ), //ok
      .core_interrupt_clear_i       (int_reg_clr_o                ), //ok
      .core_serial_p3en_0_i         (serial_p3en_0_o              ), //ok
      .core_serial_p3en_1_i         (serial_p3en_1_o              ), //ok
      .core_serial_p3_0_i           (serial_p3_0_o                ), //ok
      .core_serial_p3_1_i           (serial_p3_1_o                ), //ok
      .core_serial_sbuf_rx_i        (serial_data_sbuf_o           ), //ok
      .core_serial_rb8_i            (serial_scon2_rb8_o           ), //ok
      .core_serial_ti_i             (serial_scon1_ti_o            ), //ok
      .core_serial_ri_i             (serial_scon0_ri_o            ), //ok
      .core_serial_load_sbuf_i      (serial_load_sbuf_o           ), //ok
      .core_ports_p0_i              (ports_sfr_P0_o               ), //ok
      .core_ports_p1_i              (ports_sfr_P1_o               ), //ok
      .core_ports_p2_i              (ports_sfr_P2_o               ), //ok
      .core_ports_p3_i              (ports_sfr_P3_o               ), //ok
      .core_bus_ctrl_p0_i           (bus_control_p0_o             ), //ok
      
      .core_ports_p0_o              (core_ports_p0_o              ), //ok
      .core_ports_p1_o              (core_ports_p1_o              ), //ok
      .core_ports_p2_o              (core_ports_p2_o              ), //ok
      .core_ports_p3_o              (core_ports_p3_o              ), //ok
      .core_ports_p4_o              (core_ports_p4_o              ), //ok
      .core_bus_ctrl_p0_o           (core_bus_ctrl_p0_o           ), //ok
      .core_baudrate_sm0_o          (core_baudrate_sm0_o          ), //ok
      .core_baudrate_sm1_o          (core_baudrate_sm1_o          ), //ok
      .core_baudrate_sm2_o          (core_baudrate_sm2_o          ), //ok
      .core_reset_o                 (core_reset_o                 ), //ok
      .core_baudrate_smod_o         (core_baudrate_smod_o         ), //ok
      .core_baudrate_rs232_o        (core_baudrate_rs232_o        ), //ok
      .core_timers_th0_o            (core_timers_th0_o            ), //ok
      .core_timers_tm0_o            (core_timers_tm0_o            ), //ok
      .core_timers_tl0_o            (core_timers_tl0_o            ), //ok
      .core_timers_gate_t0_o        (core_timers_gate_t0_o        ), //ok
      .core_timers_m1_t0_o          (core_timers_m1_t0_o          ), //ok
      .core_timers_m0_t0_o          (core_timers_m0_t0_o          ), //ok
      .core_timers_tr0_o            (core_timers_tr0_o            ), //ok
      .core_timers_tf0_o            (core_timers_tf0_o            ), //ok
      .core_timers_th1_o            (core_timers_th1_o            ), //ok
      .core_timers_tm1_o            (core_timers_tm1_o            ), //ok
      .core_timers_tl1_o            (core_timers_tl1_o            ), //ok
      .core_timers_gate_t1_o        (core_timers_gate_t1_o        ), //ok
      .core_timers_m1_t1_o          (core_timers_m1_t1_o          ), //ok
      .core_timers_m0_t1_o          (core_timers_m0_t1_o          ), //ok
      .core_timers_int0_o           (core_timers_int0_o           ), //ok
      .core_timers_tr1_o            (core_timers_tr1_o            ), //ok
      .core_timers_tf1_o            (core_timers_tf1_o            ), //ok
      .core_timers_int1_o           (core_timers_int1_o           ), //ok
      .core_timers_tacph1_o         (core_timers_tacph_o          ), //ok
      .core_timers_tacph0_o         (core_timers_tacpm_o          ), //ok
      .core_timers_tacpl_o          (core_timers_tacpl_o          ), //ok
      .core_timers_tr2_o            (core_timers_tr2_o            ), //ok
      .core_timers_tf2_o            (core_timers_tf2_o            ), //ok
      .core_timers_dfsel_o          (core_timers_dfsel_o          ), //ok
      .core_timers_edgsel_o         (core_timers_edgsel_o         ), //ok
      .core_timers_dfp_o            (core_timers_dfp_o            ), //ok
      .core_interrupt_ip_o          (core_interrupt_ip_o          ), //ok
      .core_interrupt_ie_o          (core_interrupt_ie_o          ), //ok
      .core_interrupt_scon_o        (core_interrupt_scon_o        ), //ok
      .core_interrupt_tcon_o        (core_interrupt_tcon_o        ), //ok
      .core_interrupt_tcon2_o       (core_interrupt_tcon2_o       ), //ok
      .core_interrupt_intx_o        (core_interrupt_intx_o        ), //ok
      .core_interrupt_na_o          (core_interrupt_na_o          ), //ok
      .core_interrupt_rdy_o         (core_interrupt_rdy_o         ), //ok
      .core_ports_p0en_o            (core_ports_p0en_o            ), //ok
      .core_ports_p1en_o            (core_ports_p1en_o            ), //ok
      .core_ports_p2en_o            (core_ports_p2en_o            ), //ok
      .core_ports_p3en_o            (core_ports_p3en_o            ), //ok
      .core_serial_sm0_o            (core_serial_sm0_o            ), //ok
      .core_serial_ren_o            (core_serial_ren_o            ), //ok
      .core_serial_p3_0_o           (core_serial_p3_0_o           ), //ok
      .core_serial_sbuf_tx_o        (core_serial_sbuf_tx_o        ), //ok
      .core_serial_tb8_o            (core_serial_tb8_o            ), //ok
      .core_serial_ti_o             (core_serial_ti_o             ), //ok
      .core_serial_ri_o             (core_serial_ri_o             ), //ok
      .core_serial_tx_o             (core_serial_tx_o             ), //ok
      .core_bus_ctrl_ea_b_i         (bus_control_ea_b_o           ), //ok
      .core_bus_ctrl_data_i         (bus_control_ext_data_o       ), //ok
      .core_bus_ctrl_addr_o         (core_bus_ctrl_addr_o         ), //ok
      .core_bus_ctrl_data_o         (core_bus_ctrl_data_o         ), //ok
      .core_bus_ctrl_ext_rom_rd_b_o (core_bus_ctrl_ext_rom_rd_b_o ), //ok
      .core_bus_ctrl_ext_ram_rd_b_o (core_bus_ctrl_ext_ram_rd_b_o ), //ok 
      .core_bus_ctrl_ext_ram_wr_b_o (core_bus_ctrl_ext_ram_wr_b_o )  //ok
   );

   INTERRUPT INTERRUPT_INSTANCE //##############################################
   (
      .clk                          (top_clock_i                  ), //ok
      .int_rst_sync_b_i             (core_reset_o                 ), //ok
      .int_intx_b_i                 (core_interrupt_intx_o        ), //ok
      .int_rdy_i                    (core_interrupt_rdy_o         ), //ok
      .int_na_i                     (core_interrupt_na_o          ), //ok
      .int_cm_i                     (top_cycle_machine            ), //ok
      .reg_ie_i                     (core_interrupt_ie_o          ), //ok
      .reg_ip_i                     (core_interrupt_ip_o          ), //ok
      .reg_scon_i                   (core_interrupt_scon_o        ), //ok
      .reg_tcon_i                   (core_interrupt_tcon_o        ), //ok
      .reg_tcon2_i                  (core_interrupt_tcon2_o       ), //ok
      .int_vect_o                   (int_vect_o                   ), //ok
      .reg_tcon_o                   (reg_tcon_o                   ), //ok
      .reg_tcon2_o                  (reg_tcon2_o                  ), //ok
      .int_reg_clr_o                (int_reg_clr_o                )  //ok         
   );
   
   
   bus_control   BUS_CONTROL_INSTANCE //########################################
   (
      .bus_control_core_ext_data_o     (bus_control_ext_data_o       ), //ok
      .bus_control_core_ext_data_i     (core_bus_ctrl_data_o         ), //ok
      .bus_control_core_ext_addr_i     (core_bus_ctrl_addr_o         ), //ok
      .bus_control_core_ext_ram_wr_b_i (core_bus_ctrl_ext_ram_wr_b_o ), //ok
      .bus_control_core_ext_ram_rd_b_i (core_bus_ctrl_ext_ram_rd_b_o ), //ok
      .bus_control_core_ext_rom_rd_b_i (core_bus_ctrl_ext_rom_rd_b_o ), //ok
      .bus_control_core_ea_b_o         (bus_control_ea_b_o           ), //ok
      .bus_control_ea_b_i              (top_ea_b_i                   ), //ok
      .bus_control_psen_b_o            (top_psen_b_o                 ), //ok
      
      .bus_control_ports_p0_i           (ports_sfr_P0_o              ), //ok
      .bus_control_core_p0_i           (core_ports_p0_o              ), //ok
      .bus_control_core_p0en_i         (core_ports_p0en_o            ), //ok
      .bus_control_core_p2_i           (core_ports_p2_o              ), //ok
      .bus_control_core_p2en_i         (core_ports_p2en_o            ), //ok
      .bus_control_core_p3_6_i         (core_ports_p3_o[6]           ), //ok
      .bus_control_core_p3_7_i         (core_ports_p3_o[7]           ), //ok
      .bus_control_core_p3en_6_i       (core_ports_p3en_o[6]         ), //ok
      .bus_control_core_p3en_7_i       (core_ports_p3en_o[7]         ), //ok
      .bus_control_core_p4_i           (core_ports_p4_o              ), //ok
      
      .bus_control_core_p0_o           (bus_control_p0_o             ), //ok
      .bus_control_core_p0en_o         (bus_control_p0en_o           ), //ok
      .bus_control_core_p2_o           (bus_control_p2_o             ), //ok
      .bus_control_core_p2en_o         (bus_control_p2en_o           ), //ok
      .bus_control_core_p3_6_o         (bus_control_p3_6_o           ), //ok
      .bus_control_core_p3_7_o         (bus_control_p3_7_o           ), //ok
      .bus_control_core_p3en_6_o       (bus_control_p3en_6_o         ), //ok
      .bus_control_core_p3en_7_o       (bus_control_p3en_7_o         ), //ok
      .bus_control_core_p4_o           (bus_control_p4_o             )  //ok
   );

      
  
 baud_rate BAUD_RATE_INSTANCE //################################################
   (
      .system_clk_i                 (top_clock_i                  ), //ok
      .system_rst_i_b               (core_reset_o                 ), //ok
      .baud_rate_scon_sm0_i         (core_baudrate_sm0_o          ), //ok
      .baud_rate_scon_sm1_i         (core_baudrate_sm1_o          ), //ok
      .baud_rate_scon_sm2_i         (core_baudrate_sm2_o          ), //ok
      .baud_rate_pcon_smod_i        (core_baudrate_smod_o         ), //ok
      .baud_rate_pcon_rs232_i       (core_baudrate_rs232_o        ), //ok
      .baud_rate_cm_o               (top_cycle_machine            ), //ok
      .baud_rate_br_trans_o         (top_baud_rate_trans          ), //ok
      .baud_rate_br_o               (baud_rate_br_o               )  //ok
   );
   
top_timers TIMERS_INSTANCE //###################################################
   (
      .top_timers_reset_i           (core_reset_o                 ), //ok
      .top_timers_clock_i           (top_clock_i                  ), //ok
      .top_timers_machine_cycle_i   (top_cycle_machine            ), //ok
      .top_timers_pht_i             (top_pht_i                    ), //ok
      .top_timers_sfr_tcon2_dfp_i   (core_timers_dfp_o            ), //ok
      .top_timers_sfr_tcon2_dfsel_i (core_timers_dfsel_o          ), //ok
      .top_timers_sfr_tcon2_edsel_i (core_timers_edgsel_o         ), //ok
      .top_timers_sfr_tcon2_tr2_i   (core_timers_tr2_o            ), //ok
      .top_timers_sfr_tacph_i       (core_timers_tacph_o          ), //ok
      .top_timers_sfr_tacpm_i       (core_timers_tacpm_o          ), //ok
      .top_timers_sfr_tacpl_i       (core_timers_tacpl_o          ), //ok
      .top_timers_sfr_tcon_tr0_i    (core_timers_tr0_o            ), //ok
      .top_timers_sfr_tcon_tr1_i    (core_timers_tr1_o            ), //ok
      .top_timers_sfr_tmod_gate_t0_i(core_timers_gate_t0_o        ), //ok
      .top_timers_sfr_tmod_gate_t1_i(core_timers_gate_t1_o        ), //ok
      .top_timers_sfr_tmod_m0_t0_i  (core_timers_m0_t0_o          ), //ok
      .top_timers_sfr_tmod_m1_t0_i  (core_timers_m1_t0_o          ), //ok
      .top_timers_sfr_tmod_m0_t1_i  (core_timers_m0_t1_o          ), //ok
      .top_timers_sfr_tmod_m1_t1_i  (core_timers_m1_t1_o          ), //ok
      .top_timers_sfr_th0_i         (core_timers_th0_o            ), //ok
      .top_timers_sfr_tm0_i         (core_timers_tm0_o            ), //ok
      .top_timers_sfr_tl0_i         (core_timers_tl0_o            ), //ok
      .top_timers_sfr_th1_i         (core_timers_th1_o            ), //ok
      .top_timers_sfr_tm1_i         (core_timers_tm1_o            ), //ok
      .top_timers_sfr_tl1_i         (core_timers_tl1_o            ), //ok
      .top_timers_int0_i            (core_timers_int0_o           ), //ok
      .top_timers_int1_i            (core_timers_int1_o           ), //ok
      .top_timers_sfr_tcon_tf0_i    (core_timers_tf0_o            ), //ok
      .top_timers_sfr_tcon_tf1_i    (core_timers_tf1_o            ), //ok
      .top_timers_sfr_tcon2_tf2_i   (core_timers_tf2_o            ), //ok
      .top_timers_sfr_tcon_tf0_o    (top_timers_sfr_tcon_tf0_o    ), //ok
      .top_timers_sfr_tcon_tf1_o    (top_timers_sfr_tcon_tf1_o    ), //ok
      .top_timers_sfr_tcon2_tf2_o   (top_timers_sfr_tcon2_tf2_o   ), //ok
      .top_timers_sfr_acrh_o        (top_timers_sfr_acrh_o        ), //ok
      .top_timers_sfr_acrm_o        (top_timers_sfr_acrm_o        ), //ok
      .top_timers_sfr_acrl_o        (top_timers_sfr_acrl_o        ), //ok
      .top_timers_sfr_th0_o         (top_timers_sfr_th0_o         ), //ok
      .top_timers_sfr_tm0_o         (top_timers_sfr_tm0_o         ), //ok
      .top_timers_sfr_tl0_o         (top_timers_sfr_tl0_o         ), //ok
      .top_timers_sfr_th1_o         (top_timers_sfr_th1_o         ), //ok
      .top_timers_sfr_tm1_o         (top_timers_sfr_tm1_o         ), //ok
      .top_timers_sfr_tl1_o         (top_timers_sfr_tl1_o         )  //ok
   );    

   PORT_TOP PORTS_INSTANCE //###################################################
   (
      .ports_sfr_P0EN_i             (core_ports_p0en_o            ), //ok
      .ports_sfr_P1EN_i             (core_ports_p1en_o            ), //ok
      .ports_sfr_P2EN_i             (core_ports_p2en_o            ), //ok
      .ports_sfr_P3EN_i             (core_ports_p3en_o            ), //ok
      .ports_sfr_P0_i               (bus_control_p0_o             ), //ok
      .ports_sfr_P1_i               (core_ports_p1_o              ), //ok
      .ports_sfr_P2_i               (bus_control_p2_o             ), //ok
      .ports_sfr_P3_i               ( {bus_control_p3_7_o, 
                                       bus_control_p3_6_o, 
                                       core_ports_p3_o[5:0]}      ), //ok
      .ports_sfr_P4_i               (bus_control_p4_o             ), //ok
      .y_port0_i                    (top_p0_y_i                   ), //ok
      .y_port1_i                    (top_p1_y_i                   ), //ok
      .y_port2_i                    (top_p2_y_i                   ), //ok
      .y_port3_i                    (top_p3_y_i                   ), //ok
      .ports_test_mode_i            (top_test_mode_i              ), //ok
      .ports_sfr_P0_o               (ports_sfr_P0_o               ), //ok
      .ports_sfr_P1_o               (ports_sfr_P1_o               ), //ok
      .ports_sfr_P2_o               (ports_sfr_P2_o               ), //ok
      .ports_sfr_P3_o               (ports_sfr_P3_o               ), //ok
      .en_port0_o                   (top_p0_en_o                  ), //ok
      .en_port1_o                   (top_p1_en_o                  ), //ok
      .en_port2_o                   (top_p2_en_o                  ), //ok
      .en_port3_o                   (top_p3_en_o                  ), //ok
      .a_port0_o                    (top_p0_a_o                   ), //ok
      .a_port1_o                    (top_p1_a_o                   ), //ok
      .a_port2_o                    (top_p2_a_o                   ), //ok
      .a_port3_o                    (top_p3_a_o                   ), //ok
      .a_port4_o                    (top_p4_a_o                   )  //ok
   );   
   
serial_top SERIAL_INSTANCE //###################################################
   (
      .serial_clock_i               (top_clock_i                  ), //ok
      .serial_reset_i_b             (core_reset_o                 ), //ok
      .serial_br_i                  (baud_rate_br_o               ), //ok
      .serial_br_trans_i            (top_baud_rate_trans          ), //ok
      .serial_scon0_ri_i            (core_serial_ri_o             ), //ok
      .serial_scon1_ti_i            (core_serial_ti_o             ), //ok
      .serial_scon3_tb8_i           (core_serial_tb8_o            ), //ok
      .serial_scon4_ren_i           (core_serial_ren_o            ), //ok
      .serial_scon7_sm0_i           (core_serial_sm0_o            ), //ok
      .serial_serial_tx_i           (core_serial_tx_o             ), //ok
      .serial_data_sbuf_i           (core_serial_sbuf_tx_o        ), //ok
      .serial_p3_0_i                (core_serial_p3_0_o           ), //ok
      .serial_p3en_0_o              (serial_p3en_0_o              ), //ok
      .serial_p3en_1_o              (serial_p3en_1_o              ), //ok
      .serial_p3_0_o                (serial_p3_0_o                ), //ok
      .serial_p3_1_o                (serial_p3_1_o                ), //ok
      .serial_scon0_ri_o            (serial_scon0_ri_o            ), //ok
      .serial_scon1_ti_o            (serial_scon1_ti_o            ), //ok
      .serial_scon2_rb8_o           (serial_scon2_rb8_o           ), //ok
      .serial_load_sbuf_o           (serial_load_sbuf_o           ), //ok
      .serial_data_sbuf_o           (serial_data_sbuf_o           )  //ok
   );
   
endmodule 
   