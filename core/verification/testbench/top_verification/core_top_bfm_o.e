<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_bfm_o.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core top module, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: Receive the DUT output packet of signal
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus()
// Include Files: core_top_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_bfm_o_h;

extend core_top_bfm_o_u {
      ///////////// INOUT /////////////////////////////
   !p_reg_ctrl_ports_p0_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p1_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p2_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p3_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_bus_ctrl_p0_o: inout simple_port of uint(bits:8);
   
   
   ///////////// OUTPUTS /////////////////////////////
   !p_fsm_int_na_o: inout simple_port of bit;
   !p_fsm_int_rdy_o: inout simple_port of bit;
   
   !p_reg_ctrl_baudrate_sm0_o: inout simple_port of bit;
   !p_reg_ctrl_baudrate_sm1_o: inout simple_port of bit;
   !p_reg_ctrl_baudrate_sm2_o: inout simple_port of bit;
   !p_reg_ctrl_baudrate_smod_o: inout simple_port of bit;
   !p_reg_ctrl_baudrate_bps_o: inout simple_port of bit;
   !p_reg_ctrl_timers_th0_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_tm0_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_tl0_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_gate_t0_o: inout simple_port of bit;
   !p_reg_ctrl_timers_m1_t0_o: inout simple_port of bit;
   !p_reg_ctrl_timers_m0_t0_o: inout simple_port of bit;
   !p_reg_ctrl_timers_tr0_o: inout simple_port of bit;
   !p_reg_ctrl_timers_th1_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_tm1_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_tl1_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_gate_t1_o: inout simple_port of bit;
   !p_reg_ctrl_timers_m1_t1_o: inout simple_port of bit;
   !p_reg_ctrl_timers_m0_t1_o: inout simple_port of bit;
   !p_reg_ctrl_timers_int0_o: inout simple_port of bit;
   !p_reg_ctrl_timers_tr1_o: inout simple_port of bit;
   !p_reg_ctrl_timers_int1_o: inout simple_port of bit;
   !p_reg_ctrl_timers_tacph_o: inout simple_port of uint(bits:2);
   !p_reg_ctrl_timers_tacpl_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_timers_tr2_o: inout simple_port of bit;
   !p_reg_ctrl_timers_dfsel_o: inout simple_port of bit;
   !p_reg_ctrl_timers_edgsel_o: inout simple_port of bit;
   !p_reg_ctrl_timers_dfp_o: inout simple_port of uint(bits:3);
   !p_reg_ctrl_interrupt_ip_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_interrupt_ie_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_interrupt_int0_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_int1_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_ie0_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_ie1_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_ri_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_ti_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_tf0_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_tf1_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_tf2_o: inout simple_port of bit;
   !p_reg_ctrl_interrupt_txrxf_o: inout simple_port of bit;
   !p_reg_ctrl_ports_p4_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p0en_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p1en_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p2en_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_ports_p3en_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_serial_sm0_o: inout simple_port of bit;
   !p_reg_ctrl_serial_ren_o: inout simple_port of bit;
   !p_reg_ctrl_serial_p3_0_o: inout simple_port of bit;
   !p_reg_ctrl_serial_p3_1_o: inout simple_port of bit;
   !p_reg_ctrl_serial_sbuf_tx_o: inout simple_port of uint(bits:8);
   !p_reg_ctrl_serial_tb8_o: inout simple_port of bit;
   !p_reg_ctrl_serial_ti_o: inout simple_port of bit;
   !p_reg_ctrl_serial_ri_o: inout simple_port of bit;
   
   !p_mem_ctrl_bus_ctrl_addr_o: inout simple_port of uint(bits:16);
   !p_mem_ctrl_bus_ctrl_data_o: inout simple_port of uint(bits:8);
   !p_mem_ctrl_bus_ctrl_ext_rom_rd_b_o: inout simple_port of bit;
   !p_mem_ctrl_bus_ctrl_ext_ram_rd_b_o: inout simple_port of bit;
   !p_mem_ctrl_bus_ctrl_ext_ram_wr_b_o: inout simple_port of bit;
      
   drive_bus() @clock_e is only {
      
   };
};

'>
