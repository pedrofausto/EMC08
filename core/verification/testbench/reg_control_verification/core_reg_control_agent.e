<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_agent.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register cotrol module, sig - signal map, 
// mon - monitor
// -----------------------------------------------------------------------------
// Purpose: Class that connect the monitor at signal map, and BFM`s signals
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: connect_pointers()
// Include Files: core_reg_control_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_agent_h;

extend core_reg_control_agent_u {
   connect_pointers() is also {    
      /////////// INPUTS //////////
      mon.p_reset                      = sig.p_reset;
      mon.p_fsm_wr_b_i                 = sig.p_fsm_wr_b_i;
      mon.p_fsm_rd_b_i                 = sig.p_fsm_rd_b_i;
      mon.p_fsm_byte_b_i               = sig.p_fsm_byte_b_i;
      mon.p_fsm_addr_i                 = sig.p_fsm_addr_i;                          
      mon.p_fsm_data_i                 = sig.p_fsm_data_i;                          
      mon.p_fsm_serial_tx_i            = sig.p_fsm_serial_tx_i;              
      
      mon.p_timers_th0_i               = sig.p_timers_th0_i;
      mon.p_timers_tm0_i               = sig.p_timers_tm0_i;                   
      mon.p_timers_tl0_i               = sig.p_timers_tl0_i;                   
      mon.p_timers_tf0_i               = sig.p_timers_tf0_i;                   
      mon.p_timers_th1_i               = sig.p_timers_th1_i;                   
      mon.p_timers_tm1_i               = sig.p_timers_tm1_i;                   
      mon.p_timers_tl1_i               = sig.p_timers_tm1_i;                   
      mon.p_timers_tf1_i               = sig.p_timers_tf1_i;                   
      mon.p_timers_acrh_i              = sig.p_timers_acrh_i;               
      mon.p_timers_acrm_i              = sig.p_timers_acrm_i;               
      mon.p_timers_acrl_i              = sig.p_timers_acrl_i;               
      mon.p_timers_tf2_i               = sig.p_timers_tf2_i;                   
      
      mon.p_alu_cy_i                   = sig.p_alu_cy_i;               
      mon.p_alu_ac_i                   = sig.p_alu_ac_i;               
      mon.p_alu_ov_i                   = sig.p_alu_ov_i;               
      
      mon.p_mem_ctrl_ext_mem_en_b_i    = sig.p_mem_ctrl_ext_mem_en_b_i;               
      
      mon.p_bus_control_p0en_i         = sig.p_bus_control_p0en_i;
      mon.p_bus_control_p2en_i         = sig.p_bus_control_p2en_i;
      mon.p_bus_control_p3en_6_i       = sig.p_bus_control_p3en_6_i;               
      mon.p_bus_control_p3en_7_i       = sig.p_bus_control_p3en_7_i;               
      mon.p_bus_control_p2_i           = sig.p_bus_control_p2_i;     
      mon.p_bus_control_p3_6_i         = sig.p_bus_control_p3_6_i;
      mon.p_bus_control_p3_7_i         = sig.p_bus_control_p3_7_i;
      mon.p_bus_control_p4_i           = sig.p_bus_control_p4_i;     
      
      mon.p_interrupt_ie0_i            = sig.p_interrupt_ie0_i;     
      mon.p_interrupt_ie1_i            = sig.p_interrupt_ie1_i;     
      mon.p_interrupt_ri_i             = sig.p_interrupt_ri_i;      
      mon.p_interrupt_ti_i             = sig.p_interrupt_ti_i;      
      mon.p_interrupt_tf0_i            = sig.p_interrupt_tf0_i;      
      mon.p_interrupt_tf1_i            = sig.p_interrupt_tf1_i;      
      mon.p_interrupt_tf2_i            = sig.p_interrupt_tf2_i;      
      mon.p_interrupt_txrxf_i          = sig.p_interrupt_txrxf_i;               
      mon.p_interrupt_clear_i          = sig.p_interrupt_clear_i;               
      
      mon.p_serial_p3en_0_i            = sig.p_serial_p3en_0_i;                   
      mon.p_serial_p3en_1_i            = sig.p_serial_p3en_1_i;                   
      mon.p_serial_p3_0_i              = sig.p_serial_p3_0_i; 
      mon.p_serial_p3_1_i              = sig.p_serial_p3_1_i; 
      mon.p_serial_sbuf_rx_i           = sig.p_serial_sbuf_rx_i;               
      mon.p_serial_rb8_i               = sig.p_serial_rb8_i;     
      mon.p_serial_ti_i                = sig.p_serial_ti_i;      
      mon.p_serial_ri_i                = sig.p_serial_ri_i;      
      
      ////////////////////// INOUT PORTS /////////////////////////////
      mon.p_ports_p0_io                = sig.p_ports_p0_io;               
      mon.p_ports_p1_io                = sig.p_ports_p1_io;               
      mon.p_ports_p2_io                = sig.p_ports_p2_io;               
      mon.p_ports_p3_io                = sig.p_ports_p3_io;               
      mon.p_bus_control_p0_io          = sig.p_bus_control_p0_io;                     
      
      ///////////////////// OUTPUTS  //////////////////////////////
      mon.p_fsm_data_o                 = sig.p_fsm_data_o;               
      
      mon.p_alu_cy_o                   = sig.p_alu_cy_o;               
      mon.p_alu_ac_o                   = sig.p_alu_ac_o;               
      mon.p_alu_ov_o                   = sig.p_alu_ov_o;               
      
      mon.p_baudrate_sm0_o             = sig.p_baudrate_sm0_o;                   
      mon.p_baudrate_sm1_o             = sig.p_baudrate_sm1_o;                   
      mon.p_baudrate_sm2_o             = sig.p_baudrate_sm2_o;                   
      mon.p_baudrate_smod_o            = sig.p_baudrate_smod_o;               
      mon.p_baudrate_bps_o             = sig.p_baudrate_bps_o;                   
      
      mon.p_timers_th0_o               = sig.p_timers_th0_o;                         
      mon.p_timers_tm0_o               = sig.p_timers_tm0_o;                         
      mon.p_timers_tl0_o               = sig.p_timers_tl0_o;                         
      mon.p_timers_gate_t0_o           = sig.p_timers_gate_t0_o;               
      mon.p_timers_m1_t0_o             = sig.p_timers_m1_t0_o;                    
      mon.p_timers_m0_t0_o             = sig.p_timers_m0_t0_o;                    
      mon.p_timers_tr0_o               = sig.p_timers_tr0_o;                          
      mon.p_timers_th1_o               = sig.p_timers_th1_o;                         
      mon.p_timers_tm1_o               = sig.p_timers_tm1_o;                         
      mon.p_timers_tl1_o               = sig.p_timers_tl1_o;                         
      mon.p_timers_gate_t1_o           = sig.p_timers_gate_t1_o;                   
      mon.p_timers_m1_t1_o             = sig.p_timers_m1_t1_o;                     
      mon.p_timers_m0_t1_o             = sig.p_timers_m0_t1_o;                     
      mon.p_timers_tr1_o               = sig.p_timers_tr1_o;                          
      mon.p_timers_tacph_o             = sig.p_timers_tacph_o;                    
      mon.p_timers_tacpl_o             = sig.p_timers_tacpl_o;                    
      mon.p_timers_tr2_o               = sig.p_timers_tr2_o;                          
      mon.p_timers_dfsel_o             = sig.p_timers_dfsel_o;                     
      mon.p_timers_edgsel_o            = sig.p_timers_edgsel_o;                    
      mon.p_timers_dfp_o               = sig.p_timers_dfp_o;              
      mon.p_timers_int0_o              = sig.p_timers_int0_o;
      mon.p_timers_int1_o              = sig.p_timers_int1_o;
            
      mon.p_interrupt_ip_o        = sig.p_interrupt_ip_o;                    
      mon.p_interrupt_ie_o             = sig.p_interrupt_ie_o;                    
      mon.p_interrupt_int0_o           = sig.p_interrupt_int0_o;                   
      mon.p_interrupt_int1_o           = sig.p_interrupt_int1_o;                   
      mon.p_interrupt_ie0_o            = sig.p_interrupt_ie0_o;                    
      mon.p_interrupt_ie1_o            = sig.p_interrupt_ie1_o;                    
      mon.p_interrupt_ri_o             = sig.p_interrupt_ri_o;                     
      mon.p_interrupt_ti_o             = sig.p_interrupt_ti_o;                     
      mon.p_interrupt_tf0_o            = sig.p_interrupt_tf0_o;                   
      mon.p_interrupt_tf1_o            = sig.p_interrupt_tf1_o;                   
      mon.p_interrupt_tf2_o            = sig.p_interrupt_tf2_o;                   
      mon.p_interrupt_txrxf_o          = sig.p_interrupt_txrxf_o;              
      
      mon.p_ports_p4_o                 = sig.p_ports_p4_o;                           
      mon.p_ports_p0en_o               = sig.p_ports_p0en_o;
      mon.p_ports_p1en_o               = sig.p_ports_p1en_o;
      mon.p_ports_p2en_o               = sig.p_ports_p2en_o;
      mon.p_ports_p3en_o               = sig.p_ports_p3en_o;
            
      mon.p_serial_sm0_o               = sig.p_serial_sm0_o;                         
      mon.p_serial_ren_o               = sig.p_serial_ren_o;                         
      mon.p_serial_p3_0_o              = sig.p_serial_p3_0_o;                     
      mon.p_serial_p3_1_o              = sig.p_serial_p3_1_o;                     
      mon.p_serial_sbuf_tx_o           = sig.p_serial_sbuf_tx_o;               
      mon.p_serial_tb8_o               = sig.p_serial_tb8_o;                         
      mon.p_serial_ti_o                = sig.p_serial_ti_o;                          
      mon.p_serial_ri_o                = sig.p_serial_ri_o;                          
       
   };

   // when CORE_REG_CONTROL_IN than map the signal between signal map and monitor
   when ACTIVE CORE_REG_CONTROL_IN core_reg_control_agent_u {
      connect_pointers() is also {    
      /////////// INPUTS //////////
      bfm.p_reset                      = sig.p_reset;
      bfm.p_fsm_wr_b_i                 = sig.p_fsm_wr_b_i;
      bfm.p_fsm_rd_b_i                 = sig.p_fsm_rd_b_i;
      bfm.p_fsm_byte_b_i               = sig.p_fsm_byte_b_i;
      bfm.p_fsm_addr_i                 = sig.p_fsm_addr_i;      
      bfm.p_fsm_data_i                 = sig.p_fsm_data_i;      
      bfm.p_fsm_serial_tx_i            = sig.p_fsm_serial_tx_i;              
      
      bfm.p_timers_th0_i               = sig.p_timers_th0_i;
      bfm.p_timers_tm0_i               = sig.p_timers_tm0_i;                   
      bfm.p_timers_tl0_i               = sig.p_timers_tl0_i;                   
      bfm.p_timers_tf0_i               = sig.p_timers_tf0_i;                   
      bfm.p_timers_th1_i               = sig.p_timers_th1_i;                   
      bfm.p_timers_tm1_i               = sig.p_timers_tm1_i;                   
      bfm.p_timers_tl1_i               = sig.p_timers_tm1_i;                   
      bfm.p_timers_tf1_i               = sig.p_timers_tf1_i;                   
      bfm.p_timers_acrh_i              = sig.p_timers_acrh_i;               
      bfm.p_timers_acrm_i              = sig.p_timers_acrm_i;               
      bfm.p_timers_acrl_i              = sig.p_timers_acrl_i;               
      bfm.p_timers_tf2_i               = sig.p_timers_tf2_i;                   
      
      bfm.p_alu_cy_i                   = sig.p_alu_cy_i;               
      bfm.p_alu_ac_i                   = sig.p_alu_ac_i;               
      bfm.p_alu_ov_i                   = sig.p_alu_ov_i;               
      
      bfm.p_mem_ctrl_ext_mem_en_b_i    = sig.p_mem_ctrl_ext_mem_en_b_i;               
      
      bfm.p_bus_control_p0en_i         = sig.p_bus_control_p0en_i;
      bfm.p_bus_control_p2en_i         = sig.p_bus_control_p2en_i;
      bfm.p_bus_control_p3en_6_i       = sig.p_bus_control_p3en_6_i;               
      bfm.p_bus_control_p3en_7_i       = sig.p_bus_control_p3en_7_i;               
      bfm.p_bus_control_p2_i           = sig.p_bus_control_p2_i;     
      bfm.p_bus_control_p3_6_i         = sig.p_bus_control_p3_6_i;
      bfm.p_bus_control_p3_7_i         = sig.p_bus_control_p3_7_i;
      bfm.p_bus_control_p4_i           = sig.p_bus_control_p4_i;     
      
      bfm.p_interrupt_ie0_i            = sig.p_interrupt_ie0_i;     
      bfm.p_interrupt_ie1_i            = sig.p_interrupt_ie1_i;     
      bfm.p_interrupt_ri_i             = sig.p_interrupt_ri_i;      
      bfm.p_interrupt_ti_i             = sig.p_interrupt_ti_i;      
      bfm.p_interrupt_tf0_i            = sig.p_interrupt_tf0_i;      
      bfm.p_interrupt_tf1_i            = sig.p_interrupt_tf1_i;      
      bfm.p_interrupt_tf2_i            = sig.p_interrupt_tf2_i;      
      bfm.p_interrupt_txrxf_i          = sig.p_interrupt_txrxf_i;               
      bfm.p_interrupt_clear_i          = sig.p_interrupt_clear_i;               
      
      bfm.p_serial_p3en_0_i            = sig.p_serial_p3en_0_i;                   
      bfm.p_serial_p3en_1_i            = sig.p_serial_p3en_1_i;                   
      bfm.p_serial_p3_0_i              = sig.p_serial_p3_0_i; 
      bfm.p_serial_p3_1_i              = sig.p_serial_p3_1_i; 
      bfm.p_serial_sbuf_rx_i           = sig.p_serial_sbuf_rx_i;               
      bfm.p_serial_rb8_i               = sig.p_serial_rb8_i;     
      bfm.p_serial_ti_i                = sig.p_serial_ti_i;      
      bfm.p_serial_ri_i                = sig.p_serial_ri_i;      
      
      ////////////////////// INOUT PORTS /////////////////////////////
      bfm.p_ports_p0_io                = sig.p_ports_p0_io;               
      bfm.p_ports_p1_io                = sig.p_ports_p1_io;               
      bfm.p_ports_p2_io                = sig.p_ports_p2_io;               
      bfm.p_ports_p3_io                = sig.p_ports_p3_io;               
      bfm.p_bus_control_p0_io          = sig.p_bus_control_p0_io;                     
      
      ///////////////////// OUTPUTS  //////////////////////////////
      //bfm.p_fsm_data_o                 = sig.p_fsm_data_o;               
      
      //bfm.p_alu_cy_o                   = sig.p_alu_cy_o;               
      //bfm.p_alu_ac_o                   = sig.p_alu_cy_o;               
      //bfm.p_alu_ov_o                   = sig.p_alu_ov_o;               
      
      //bfm.p_baudrate_sm0_o             = sig.p_baudrate_sm0_o;                   
      //bfm.p_baudrate_sm1_o             = sig.p_baudrate_sm1_o;                   
      //bfm.p_baudrate_sm2_o             = sig.p_baudrate_sm2_o;                   
      //bfm.p_baudrate_smod_o            = sig.p_baudrate_smod_o;               
      //bfm.p_baudrate_bps_o             = sig.p_baudrate_bps_o;                   
      
      //bfm.p_timers_th0_o               = sig.p_timers_th0_o;                         
      //bfm.p_timers_tm0_o               = sig.p_timers_tm0_o;                         
      //bfm.p_timers_tl0_o               = sig.p_timers_tl0_o;                         
      //bfm.p_timers_gate_t0_o           = sig.p_timers_gate_t0_o;               
      //bfm.p_timers_m1_t0_o             = sig.p_timers_m1_t0_o;                    
      //bfm.p_timers_m0_t0_o             = sig.p_timers_m0_t0_o;                    
      //bfm.p_timers_tr0_o               = sig.p_timers_tr0_o;                          
      //bfm.p_timers_th1_o               = sig.p_timers_th1_o;                         
      //bfm.p_timers_tm1_o               = sig.p_timers_tm1_o;                         
      //bfm.p_timers_tl1_o               = sig.p_timers_tl1_o;                         
      //bfm.p_timers_gate_t1_o           = sig.p_timers_gate_t1_o;                   
      //bfm.p_timers_m1_t1_o             = sig.p_timers_m1_t1_o;                     
      //bfm.p_timers_m0_t1_o             = sig.p_timers_m0_t1_o;                     
      //bfm.p_timers_tr1_o               = sig.p_timers_tr1_o;                          
      //bfm.p_timers_tacph_o             = sig.p_timers_tacph_o;                    
      //bfm.p_timers_tacpl_o             = sig.p_timers_tacpl_o;                    
      //bfm.p_timers_tr2_o               = sig.p_timers_tr2_o;                          
      //bfm.p_timers_dfsel_o             = sig.p_timers_dfsel_o;                     
      //bfm.p_timers_edgsel_o            = sig.p_timers_edgsel_o;                    
      //bfm.p_timers_df//bfm.p_o               = sig.p_timers_df//bfm.p_o;              
      //bfm.p_timers_int0_o              = sig.p_timers_int0_o;
      //bfm.p_timers_int1_o              = sig.p_timers_int1_o;
            
      //bfm.p_interrupt_i//bfm.p_o        = sig.p_interrupt_i//bfm.p_o;                    
      //bfm.p_interrupt_ie_o             = sig.p_interrupt_ie_o;                    
      //bfm.p_interrupt_int0_o           = sig.p_interrupt_int0_o;                   
      //bfm.p_interrupt_int1_o           = sig.p_interrupt_int1_o;                   
      //bfm.p_interrupt_ie0_o            = sig.p_interrupt_ie0_o;                    
      //bfm.p_interrupt_ie1_o            = sig.p_interrupt_ie1_o;                    
      //bfm.p_interrupt_ri_o             = sig.p_interrupt_ri_o;                     
      //bfm.p_interrupt_ti_o             = sig.p_interrupt_ti_o;                     
      //bfm.p_interrupt_tf0_o            = sig.p_interrupt_tf0_o;                   
      //bfm.p_interrupt_tf1_o            = sig.p_interrupt_tf1_o;                   
      //bfm.p_interrupt_tf2_o            = sig.p_interrupt_tf2_o;                   
      //bfm.p_interrupt_txrxf_o          = sig.p_interrupt_txrxf_o;              
      
      //bfm.p_ports_p4_o                 = sig.p_ports_p4_o;                           
      //bfm.p_ports_p0en_o               = sig.p_ports_p0en_o;
      //bfm.p_ports_p1en_o               = sig.p_ports_p1en_o;
      //bfm.p_ports_p2en_o               = sig.p_ports_p2en_o;
      //bfm.p_ports_p3en_o               = sig.p_ports_p3en_o;
            
      //bfm.p_serial_sm0_o               = sig.p_serial_sm0_o;                         
      //bfm.p_serial_ren_o               = sig.p_serial_ren_o;                         
      //bfm.p_serial_p3_0_o              = sig.p_serial_p3_0_o;                     
      //bfm.p_serial_p3_1_o              = sig.p_serial_p3_1_o;                     
      //bfm.p_serial_sbuf_tx_o           = sig.p_serial_sbuf_tx_o;               
      //bfm.p_serial_tb8_o               = sig.p_serial_tb8_o;                         
      //bfm.p_serial_ti_o                = sig.p_serial_ti_o;                          
      //bfm.p_serial_ri_o                = sig.p_serial_ri_o; 
      
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE CORE_REG_CONTROL_OUT core_reg_control_agent_u {
      connect_pointers() is also {
            /////////// INPUTS //////////
      //bfm.p_reset                      = sig.p_reset_b;
      //bfm.p_fsm_wr_b_i                 = sig.p_fsm_wr_b;
      //bfm.p_fsm_rd_b_i                 = sig.p_fsm_rd_b;
      //bfm.p_fsm_byte_b_i               = sig.p_fsm_byte_b;
      //bfm.p_fsm_addr_i                 = sig.p_fsm_byte_b;                          
      //bfm.p_fsm_data_i                 = sig.p_fsm_data;                          
      //bfm.p_fsm_serial_tx_i            = sig.p_fsm_serial_tx;              
      
      //bfm.p_timers_th0_i               = sig.p_timers_th0;                    
      //bfm.p_timers_tm0_i               = sig.p_timers_tm0;                   
      //bfm.p_timers_tl0_i               = sig.p_timers_tl0;                   
      //bfm.p_timers_tf0_i               = sig.p_timers_tf0;                   
      //bfm.p_timers_th1_i               = sig.p_timers_th1;                   
      //bfm.p_timers_tm1_i               = sig.p_timers_tm1;                   
      //bfm.p_timers_tl1_i               = sig.p_timers_tm1;                   
      //bfm.p_timers_tf1_i               = sig.p_timers_tf1;                   
      //bfm.p_timers_acrh_i              = sig.p_timers_acrh;               
      //bfm.p_timers_acrm_i              = sig.p_timers_acrm;               
      //bfm.p_timers_acrl_i              = sig.p_timers_acrl;               
      //bfm.p_timers_tf2_i               = sig.p_timers_tf2;                   
      
      //bfm.p_alu_cy_i                   = sig.p_alu_cy;               
      //bfm.p_alu_ac_i                   = sig.p_alu_ac;               
      //bfm.p_alu_ov_i                   = sig.p_alu_ov;               
      
      //bfm.p_mem_ctrl_ext_mem_en_b_i    = sig.p_mem_ctrl_ext_mem_en_b;               
      
      //bfm.p_bus_control_p0en_i         = sig.p_bus_control_p0en;                    
      //bfm.p_bus_control_p2en_i         = sig.p_bus_control_p2en;                    
      //bfm.p_bus_control_p3en_6_i       = sig.p_bus_control_p3en_6;               
      //bfm.p_bus_control_p3en_7_i       = sig.p_bus_control_p3en_7;               
      //bfm.p_bus_control_p2_i           = sig.p_bus_control_p2;                         
      //bfm.p_bus_control_p3_6_i         = sig.p_bus_control_p3_6;                    
      //bfm.p_bus_control_p3_7_i         = sig.p_bus_control_p3_7;                    
      //bfm.p_bus_control_p4_i           = sig.p_bus_control_p4;                         
      
      //bfm.p_interrupt_ie0_i            = sig.p_interrupt_ie0;                         
      //bfm.p_interrupt_ie1_i            = sig.p_interrupt_ie1;                         
      //bfm.p_interrupt_ri_i             = sig.p_interrupt_ri;                          
      //bfm.p_interrupt_ti_i             = sig.p_interrupt_ti;                          
      //bfm.p_interrupt_tf0_i            = sig.p_interrupt_tf0;                          
      //bfm.p_interrupt_tf1_i            = sig.p_interrupt_tf1;                          
      //bfm.p_interrupt_tf2_i            = sig.p_interrupt_tf2;                          
      //bfm.p_interrupt_txrxf_i          = sig.p_interrupt_txrxf;               
      //bfm.p_interrupt_clear_i          = sig.p_interrupt_clear;               
      
      //bfm.p_serial_p3en_0_i            = sig.p_serial_p3en_0;                   
      //bfm.p_serial_p3en_1_i            = sig.p_serial_p3en_1;                   
      //bfm.p_serial_p3_0_i              = sig.p_serial_p3_0;                     
      //bfm.p_serial_p3_1_i              = sig.p_serial_p3_1;                     
      //bfm.p_serial_sbuf_rx_i           = sig.p_serial_sbuf_rx;               
      //bfm.p_serial_rb8_i               = sig.p_serial_rb8;                         
      //bfm.p_serial_ti_i                = sig.p_serial_ti;                          
      //bfm.p_serial_ri_i                = sig.p_serial_ri;                          
      
      ////////////////////// INOUT PORTS /////////////////////////////
      bfm.p_ports_p0_io                = sig.p_ports_p0_io;               
      bfm.p_ports_p1_io                = sig.p_ports_p1_io;               
      bfm.p_ports_p2_io                = sig.p_ports_p2_io;               
      bfm.p_ports_p3_io                = sig.p_ports_p3_io;               
      bfm.p_bus_control_p0_io          = sig.p_bus_control_p0_io;                     
      
      ///////////////////// OUTPUTS  //////////////////////////////
      bfm.p_fsm_data_o                 = sig.p_fsm_data_o;               
      
      bfm.p_alu_cy_o                   = sig.p_alu_cy_o;               
      bfm.p_alu_ac_o                   = sig.p_alu_ac_o;               
      bfm.p_alu_ov_o                   = sig.p_alu_ov_o;               
      
      bfm.p_baudrate_sm0_o             = sig.p_baudrate_sm0_o;                   
      bfm.p_baudrate_sm1_o             = sig.p_baudrate_sm1_o;                   
      bfm.p_baudrate_sm2_o             = sig.p_baudrate_sm2_o;                   
      bfm.p_baudrate_smod_o            = sig.p_baudrate_smod_o;               
      bfm.p_baudrate_bps_o             = sig.p_baudrate_bps_o;                   
      
      bfm.p_timers_th0_o               = sig.p_timers_th0_o;                         
      bfm.p_timers_tm0_o               = sig.p_timers_tm0_o;                         
      bfm.p_timers_tl0_o               = sig.p_timers_tl0_o;                         
      bfm.p_timers_gate_t0_o           = sig.p_timers_gate_t0_o;               
      bfm.p_timers_m1_t0_o             = sig.p_timers_m1_t0_o;                    
      bfm.p_timers_m0_t0_o             = sig.p_timers_m0_t0_o;                    
      bfm.p_timers_tr0_o               = sig.p_timers_tr0_o;                          
      bfm.p_timers_th1_o               = sig.p_timers_th1_o;                         
      bfm.p_timers_tm1_o               = sig.p_timers_tm1_o;                         
      bfm.p_timers_tl1_o               = sig.p_timers_tl1_o;                         
      bfm.p_timers_gate_t1_o           = sig.p_timers_gate_t1_o;                   
      bfm.p_timers_m1_t1_o             = sig.p_timers_m1_t1_o;                     
      bfm.p_timers_m0_t1_o             = sig.p_timers_m0_t1_o;                     
      bfm.p_timers_tr1_o               = sig.p_timers_tr1_o;                          
      bfm.p_timers_tacph_o             = sig.p_timers_tacph_o;                    
      bfm.p_timers_tacpl_o             = sig.p_timers_tacpl_o;                    
      bfm.p_timers_tr2_o               = sig.p_timers_tr2_o;                          
      bfm.p_timers_dfsel_o             = sig.p_timers_dfsel_o;                     
      bfm.p_timers_edgsel_o            = sig.p_timers_edgsel_o;                    
      bfm.p_timers_dfp_o               = sig.p_timers_dfp_o;              
      bfm.p_timers_int0_o              = sig.p_timers_int0_o;
      bfm.p_timers_int1_o              = sig.p_timers_int1_o;
            
      bfm.p_interrupt_ip_o             = sig.p_interrupt_ip_o;                    
      bfm.p_interrupt_ie_o             = sig.p_interrupt_ie_o;                    
      bfm.p_interrupt_int0_o           = sig.p_interrupt_int0_o;                   
      bfm.p_interrupt_int1_o           = sig.p_interrupt_int1_o;                   
      bfm.p_interrupt_ie0_o            = sig.p_interrupt_ie0_o;                    
      bfm.p_interrupt_ie1_o            = sig.p_interrupt_ie1_o;                    
      bfm.p_interrupt_ri_o             = sig.p_interrupt_ri_o;                     
      bfm.p_interrupt_ti_o             = sig.p_interrupt_ti_o;                     
      bfm.p_interrupt_tf0_o            = sig.p_interrupt_tf0_o;                   
      bfm.p_interrupt_tf1_o            = sig.p_interrupt_tf1_o;                   
      bfm.p_interrupt_tf2_o            = sig.p_interrupt_tf2_o;                   
      bfm.p_interrupt_txrxf_o          = sig.p_interrupt_txrxf_o;              
      
      bfm.p_ports_p4_o                 = sig.p_ports_p4_o;                           
      bfm.p_ports_p0en_o               = sig.p_ports_p0en_o;
      bfm.p_ports_p1en_o               = sig.p_ports_p1en_o;
      bfm.p_ports_p2en_o               = sig.p_ports_p2en_o;
      bfm.p_ports_p3en_o               = sig.p_ports_p3en_o;
            
      bfm.p_serial_sm0_o               = sig.p_serial_sm0_o;                         
      bfm.p_serial_ren_o               = sig.p_serial_ren_o;                         
      bfm.p_serial_p3_0_o              = sig.p_serial_p3_0_o;                     
      bfm.p_serial_p3_1_o              = sig.p_serial_p3_1_o;                     
      bfm.p_serial_sbuf_tx_o           = sig.p_serial_sbuf_tx_o;               
      bfm.p_serial_tb8_o               = sig.p_serial_tb8_o;                         
      bfm.p_serial_ti_o                = sig.p_serial_ti_o;                          
      bfm.p_serial_ri_o                = sig.p_serial_ri_o; 
            
      };
   };
};

'>
