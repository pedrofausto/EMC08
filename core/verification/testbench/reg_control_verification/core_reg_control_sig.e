<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_sig.e
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
// Keywords: core_reg_control - core register control, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Map the external signals to the verification environment
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: core_reg_control_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_sig_h;

extend core_reg_control_sig_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   //general signals
   p_reset:          inout simple_port of bit is instance;
   
   p_fsm_wr_b_i:     inout simple_port of bit is instance;
   p_fsm_rd_b_i:     inout simple_port of bit is instance;
   p_fsm_byte_b_i:   inout simple_port of bit is instance;
   p_fsm_addr_i:     inout simple_port of uint(bits:16) is instance; 
   p_fsm_data_i:     inout simple_port of uint(bits:8) is instance; 
   p_fsm_serial_tx_i:inout simple_port of bit is instance;
   p_timers_th0_i:  inout simple_port of uint(bits:8) is instance; 
   p_timers_tm0_i:  inout simple_port of uint(bits:8) is instance;
   p_timers_tl0_i:  inout simple_port of uint(bits:8) is instance;
   p_timers_tf0_i:  inout simple_port of bit is instance;
   p_timers_th1_i:  inout simple_port of uint(bits:8) is instance;
   p_timers_tm1_i:  inout simple_port of uint(bits:8) is instance;
   p_timers_tl1_i:  inout simple_port of uint(bits:8) is instance;
   p_timers_tf1_i:  inout simple_port of bit is instance;
   p_timers_acrh_i: inout simple_port of uint(bits:8) is instance;
   p_timers_acrm_i: inout simple_port of uint(bits:8) is instance;
   p_timers_acrl_i: inout simple_port of uint(bits:8) is instance;
   p_timers_tf2_i:  inout simple_port of bit is instance;
   p_alu_cy_i: inout simple_port of bit is instance;
   p_alu_ac_i: inout simple_port of bit is instance;
   p_alu_ov_i: inout simple_port of bit is instance;
   p_mem_ctrl_ext_mem_en_b_i: inout simple_port of bit is instance;
   p_bus_control_p0en_i:   inout simple_port of uint(bits:8) is instance;
   p_bus_control_p2en_i:   inout simple_port of uint(bits:8) is instance;
   p_bus_control_p3en_6_i: inout simple_port of bit is instance;
   p_bus_control_p3en_7_i: inout simple_port of bit is instance;
   p_bus_control_p2_i:     inout simple_port of uint(bits:8) is instance;
   p_bus_control_p3_6_i:   inout simple_port of bit is instance;
   p_bus_control_p3_7_i:   inout simple_port of bit is instance;
   p_bus_control_p4_i:     inout simple_port of uint(bits:8) is instance;
   p_interrupt_ie0_i:   inout simple_port of bit is instance;  
   p_interrupt_ie1_i:   inout simple_port of bit is instance;  
   p_interrupt_ri_i:    inout simple_port of bit is instance;  
   p_interrupt_ti_i:    inout simple_port of bit is instance;  
   p_interrupt_tf0_i:   inout simple_port of bit is instance;   
   p_interrupt_tf1_i:   inout simple_port of bit is instance;   
   p_interrupt_tf2_i:   inout simple_port of bit is instance;   
   p_interrupt_txrxf_i: inout simple_port of bit is instance;
   p_interrupt_clear_i: inout simple_port of bit is instance;
   p_serial_p3en_0_i:  inout simple_port of bit is instance;
   p_serial_p3en_1_i:  inout simple_port of bit is instance;
   p_serial_p3_0_i:    inout simple_port of bit is instance;
   p_serial_p3_1_i:    inout simple_port of bit is instance;
   p_serial_sbuf_rx_i: inout simple_port of uint(bits:8) is instance;
   p_serial_rb8_i:     inout simple_port of bit is instance;
   p_serial_ti_i:      inout simple_port of bit is instance;
   p_serial_ri_i:      inout simple_port of bit is instance;
   
   ////////////////////// INOUT PORTS /////////////////////////////
   p_ports_p0_io: inout simple_port of uint(bits:8) is instance;
   p_ports_p1_io: inout simple_port of uint(bits:8) is instance;
   p_ports_p2_io: inout simple_port of uint(bits:8) is instance;
   p_ports_p3_io: inout simple_port of uint(bits:8) is instance;
   p_bus_control_p0_io: inout simple_port of uint(bits:8) is instance;   
   
   ///////////////////// OUTPUTS  //////////////////////////////
   p_fsm_data_o: inout simple_port of uint(bits:8) is instance;
   
   p_alu_cy_o: inout simple_port of bit is instance;
   p_alu_ac_o: inout simple_port of bit is instance;
   p_alu_ov_o: inout simple_port of bit is instance;
   
   p_baudrate_sm0_o:  inout simple_port of bit is instance;
   p_baudrate_sm1_o:  inout simple_port of bit is instance;
   p_baudrate_sm2_o:  inout simple_port of bit is instance;
   p_baudrate_smod_o: inout simple_port of bit is instance;
   p_baudrate_bps_o:  inout simple_port of bit is instance;
   p_timers_th0_o:     inout simple_port of uint(bits:8) is instance;
   p_timers_tm0_o:     inout simple_port of uint(bits:8) is instance;
   p_timers_tl0_o:     inout simple_port of uint(bits:8) is instance;
   p_timers_gate_t0_o: inout simple_port of bit is instance;
   p_timers_m1_t0_o:   inout simple_port of bit is instance;
   p_timers_m0_t0_o:   inout simple_port of bit is instance;
   p_timers_tr0_o:     inout simple_port of bit is instance; 
   p_timers_th1_o:     inout simple_port of uint(bits:8) is instance;
   p_timers_tm1_o:     inout simple_port of uint(bits:8) is instance;
   p_timers_tl1_o:     inout simple_port of uint(bits:8) is instance;
   p_timers_gate_t1_o: inout simple_port of bit is instance; 
   p_timers_m1_t1_o:   inout simple_port of bit is instance; 
   p_timers_m0_t1_o:   inout simple_port of bit is instance; 
   p_timers_tr1_o:     inout simple_port of bit is instance; 
   p_timers_tacph_o:   inout simple_port of uint(bits:2) is instance;
   p_timers_tacpl_o:   inout simple_port of uint(bits:8) is instance;
   p_timers_tr2_o:     inout simple_port of bit is instance; 
   p_timers_dfsel_o:   inout simple_port of bit is instance; 
   p_timers_edgsel_o:  inout simple_port of bit is instance; 
   p_timers_dfp_o:     inout simple_port of uint(bits:3) is instance;
   p_timers_int0_o:    inout simple_port of bit is instance; 
   p_timers_int1_o:    inout simple_port of bit is instance; 
   p_interrupt_ip_o:   inout simple_port of uint(bits:8) is instance;
   p_interrupt_ie_o:   inout simple_port of uint(bits:8) is instance;
   p_interrupt_int0_o: inout simple_port of bit is instance; 
   p_interrupt_int1_o: inout simple_port of bit is instance; 
   p_interrupt_ie0_o:  inout simple_port of bit is instance; 
   p_interrupt_ie1_o:  inout simple_port of bit is instance; 
   p_interrupt_ri_o:   inout simple_port of bit is instance; 
   p_interrupt_ti_o:   inout simple_port of bit is instance; 
   p_interrupt_tf0_o:  inout simple_port of bit is instance;
   p_interrupt_tf1_o:  inout simple_port of bit is instance;
   p_interrupt_tf2_o:  inout simple_port of bit is instance;
   p_interrupt_txrxf_o:inout simple_port of bit is instance;
   p_ports_p4_o:       inout simple_port of uint(bits:8) is instance;
   p_ports_p0en_o:     inout simple_port of uint(bits:8) is instance;
   p_ports_p1en_o:     inout simple_port of uint(bits:8) is instance;
   p_ports_p2en_o:     inout simple_port of uint(bits:8) is instance;
   p_ports_p3en_o:     inout simple_port of uint(bits:8) is instance;
   p_serial_sm0_o:     inout simple_port of bit is instance;
   p_serial_ren_o:     inout simple_port of bit is instance;
   p_serial_p3_0_o:    inout simple_port of bit is instance;
   p_serial_p3_1_o:    inout simple_port of bit is instance;
   p_serial_sbuf_tx_o: inout simple_port of uint(bits:8) is instance;
   p_serial_tb8_o:     inout simple_port of bit is instance;
   p_serial_ti_o:      inout simple_port of bit is instance;
   p_serial_ri_o:      inout simple_port of bit is instance;
   
    ////////// Connect the ports to the external design /////////////
   /////////////////// INPTUS ////////////////
   keep bind(p_reset,external);
   keep bind(p_fsm_wr_b_i,  external);          
   keep bind(p_fsm_rd_b_i, external);     
   keep bind(p_fsm_byte_b_i, external);   
   keep bind(p_fsm_addr_i, external);      
   keep bind(p_fsm_data_i, external);      
   keep bind(p_fsm_serial_tx_i, external);
   keep bind(p_timers_th0_i, external);   
   keep bind(p_timers_tm0_i, external);  
   keep bind(p_timers_tl0_i, external);  
   keep bind(p_timers_tf0_i, external);  
   keep bind(p_timers_th1_i, external);  
   keep bind(p_timers_tm1_i, external);  
   keep bind(p_timers_tl1_i, external);  
   keep bind(p_timers_tf1_i, external);  
   keep bind(p_timers_acrh_i, external); 
   keep bind(p_timers_acrm_i, external); 
   keep bind(p_timers_acrl_i, external); 
   keep bind(p_timers_tf2_i, external);  
   
   keep bind(p_alu_cy_i, external); 
   keep bind(p_alu_ac_i, external); 
   keep bind(p_alu_ov_i, external); 
   
   keep bind(p_mem_ctrl_ext_mem_en_b_i, external); 
   keep bind(p_bus_control_p0en_i, external);   
   keep bind(p_bus_control_p2en_i, external);   
   keep bind(p_bus_control_p3en_6_i, external); 
   keep bind(p_bus_control_p3en_7_i, external); 
   keep bind(p_bus_control_p2_i, external);     
   keep bind(p_bus_control_p3_6_i, external);   
   keep bind(p_bus_control_p3_7_i, external);   
   keep bind(p_bus_control_p4_i, external);     
   keep bind(p_interrupt_ie0_i, external);     
   keep bind(p_interrupt_ie1_i, external);     
   keep bind(p_interrupt_ri_i, external);      
   keep bind(p_interrupt_ti_i, external);      
   keep bind(p_interrupt_tf0_i, external);      
   keep bind(p_interrupt_tf1_i, external);      
   keep bind(p_interrupt_tf2_i, external);      
   keep bind(p_interrupt_txrxf_i, external); 
   keep bind(p_interrupt_clear_i, external); 
   keep bind(p_serial_p3en_0_i, external);  
   keep bind(p_serial_p3en_1_i, external);  
   keep bind(p_serial_p3_0_i, external);    
   keep bind(p_serial_p3_1_i, external);    
   keep bind(p_serial_sbuf_rx_i, external); 
   keep bind(p_serial_rb8_i, external);     
   keep bind(p_serial_ti_i, external);      
   keep bind(p_serial_ri_i, external);      
   
   ////////////////////// INOUT PORTS /////////////////////////////
   keep bind(p_ports_p0_io, external); 
   keep bind(p_ports_p1_io, external); 
   keep bind(p_ports_p2_io, external); 
   keep bind(p_ports_p3_io, external); 
   keep bind(p_bus_control_p0_io, external);    
   
   ///////////////////// OUTPUTS  //////////////////////////////
   keep bind(p_fsm_data_o, external); 
   
   keep bind(p_alu_cy_o, external); 
   keep bind(p_alu_ac_o, external); 
   keep bind(p_alu_ov_o, external); 
   
   keep bind(p_baudrate_sm0_o, external);  
   keep bind(p_baudrate_sm1_o, external);  
   keep bind(p_baudrate_sm2_o, external);  
   keep bind(p_baudrate_smod_o, external); 
   keep bind(p_baudrate_bps_o, external);  
   keep bind(p_timers_th0_o, external);     
   keep bind(p_timers_tm0_o, external);     
   keep bind(p_timers_tl0_o, external);     
   keep bind(p_timers_gate_t0_o, external); 
   keep bind(p_timers_m1_t0_o, external);   
   keep bind(p_timers_m0_t0_o, external);   
   keep bind(p_timers_tr0_o, external);      
   keep bind(p_timers_th1_o, external);     
   keep bind(p_timers_tm1_o, external);     
   keep bind(p_timers_tl1_o, external);     
   keep bind(p_timers_gate_t1_o, external);  
   keep bind(p_timers_m1_t1_o, external);    
   keep bind(p_timers_m0_t1_o, external);    
   keep bind(p_timers_tr1_o, external);      
   keep bind(p_timers_tacph_o, external);   
   keep bind(p_timers_tacpl_o, external);   
   keep bind(p_timers_tr2_o, external);      
   keep bind(p_timers_dfsel_o, external);    
   keep bind(p_timers_edgsel_o, external);   
   keep bind(p_timers_dfp_o, external);
   keep bind(p_timers_int0_o, external);
   keep bind(p_timers_int1_o, external);
   keep bind(p_interrupt_ip_o, external);   
   keep bind(p_interrupt_ie_o, external);   
   keep bind(p_interrupt_int0_o, external);  
   keep bind(p_interrupt_int1_o, external);  
   keep bind(p_interrupt_ie0_o, external);   
   keep bind(p_interrupt_ie1_o, external);   
   keep bind(p_interrupt_ri_o, external);    
   keep bind(p_interrupt_ti_o, external);    
   keep bind(p_interrupt_tf0_o, external);  
   keep bind(p_interrupt_tf1_o, external);  
   keep bind(p_interrupt_tf2_o, external);  
   keep bind(p_interrupt_txrxf_o, external);
   keep bind(p_ports_p4_o, external);
   keep bind(p_ports_p0en_o, external);
   keep bind(p_ports_p1en_o, external);
   keep bind(p_ports_p2en_o, external);
   keep bind(p_ports_p3en_o, external);       
   keep bind(p_serial_sm0_o, external);     
   keep bind(p_serial_ren_o, external);     
   keep bind(p_serial_p3_0_o, external);    
   keep bind(p_serial_p3_1_o, external);    
   keep bind(p_serial_sbuf_tx_o, external); 
   keep bind(p_serial_tb8_o, external);     
   keep bind(p_serial_ti_o, external);      
   keep bind(p_serial_ri_o, external);      

   when CORE_REG_CONTROL_IN core_reg_control_sig_u {
      // Path specification to the CORE_REG_CONTROL IN signals INPUTS
      /////////////////// INPTUS ////////////////
      keep p_reset.hdl_path()                     == "reset_b_i";
      keep p_fsm_wr_b_i.hdl_path()                == "fsm_wr_b_i";
      keep p_fsm_rd_b_i.hdl_path()                == "fsm_rd_b_i";
      keep p_fsm_byte_b_i.hdl_path()              == "fsm_byte_b_i";
      keep p_fsm_addr_i.hdl_path()                == "fsm_addr_i";                          
      keep p_fsm_data_i.hdl_path()                == "fsm_data_i";                          
      keep p_fsm_serial_tx_i.hdl_path()           == "fsm_serial_tx_i";              
      keep p_timers_th0_i.hdl_path()              == "timers_th0_i";                    
      keep p_timers_tm0_i.hdl_path()              == "timers_tm0_i";                   
      keep p_timers_tl0_i.hdl_path()              == "timers_tl0_i";                   
      keep p_timers_tf0_i.hdl_path()              == "timers_tf0_i";                   
      keep p_timers_th1_i.hdl_path()              == "timers_th1_i";                   
      keep p_timers_tm1_i.hdl_path()              == "timers_tm1_i";                   
      keep p_timers_tl1_i.hdl_path()              == "timers_tm1_i";                   
      keep p_timers_tf1_i.hdl_path()              == "timers_tf1_i";                   
      keep p_timers_acrh_i.hdl_path()             == "timers_acrh_i";               
      keep p_timers_acrm_i.hdl_path()             == "timers_acrm_i";               
      keep p_timers_acrl_i.hdl_path()             == "timers_acrl_i";               
      keep p_timers_tf2_i.hdl_path()              == "timers_tf2_i";                   
      
      keep p_alu_cy_i.hdl_path()                  == "alu_cy_i";               
      keep p_alu_ac_i.hdl_path()                  == "alu_ac_i";               
      keep p_alu_ov_i.hdl_path()                  == "alu_ov_i";               
      
      keep p_mem_ctrl_ext_mem_en_b_i.hdl_path()   == "mem_ctrl_ext_mem_en_b_i";               
      keep p_bus_control_p0en_i.hdl_path()        == "bus_ctrl_p0en_i";                    
      keep p_bus_control_p2en_i.hdl_path()        == "bus_ctrl_p2en_i";                    
      keep p_bus_control_p3en_6_i.hdl_path()      == "bus_ctrl_p3en_6_i";               
      keep p_bus_control_p3en_7_i.hdl_path()      == "bus_ctrl_p3en_7_i";               
      keep p_bus_control_p2_i.hdl_path()          == "bus_ctrl_p2_i";                         
      keep p_bus_control_p3_6_i.hdl_path()        == "bus_ctrl_p3_6_i";                    
      keep p_bus_control_p3_7_i.hdl_path()        == "bus_ctrl_p3_7_i";                    
      keep p_bus_control_p4_i.hdl_path()          == "bus_ctrl_p4_i";                         
      keep p_interrupt_ie0_i.hdl_path()           == "interrupt_ie0_i";                         
      keep p_interrupt_ie1_i.hdl_path()           == "interrupt_ie1_i";                         
      keep p_interrupt_ri_i.hdl_path()            == "interrupt_ri_i";                          
      keep p_interrupt_ti_i.hdl_path()            == "interrupt_ti_i";                          
      keep p_interrupt_tf0_i.hdl_path()           == "interrupt_tf0_i";                          
      keep p_interrupt_tf1_i.hdl_path()           == "interrupt_tf1_i";                          
      keep p_interrupt_tf2_i.hdl_path()           == "interrupt_tf2_i";                          
      keep p_interrupt_txrxf_i.hdl_path()         == "interrupt_txrxf_i";               
      keep p_interrupt_clear_i.hdl_path()         == "interrupt_clear_i";               
      keep p_serial_p3en_0_i.hdl_path()           == "serial_p3en_0_i";                   
      keep p_serial_p3en_1_i.hdl_path()           == "serial_p3en_1_i";                   
      keep p_serial_p3_0_i.hdl_path()             == "serial_p3_0_i";                     
      keep p_serial_p3_1_i.hdl_path()             == "serial_p3_1_i";                     
      keep p_serial_sbuf_rx_i.hdl_path()          == "serial_sbuf_rx_i";               
      keep p_serial_rb8_i.hdl_path()              == "serial_rb8_i";                         
      keep p_serial_ti_i.hdl_path()               == "serial_ti_i";                          
      keep p_serial_ri_i.hdl_path()               == "serial_ri_i";                          
      
      ////////////////////// INOUT PORTS /////////////////////////////
      keep p_ports_p0_io.hdl_path()               == "ports_p0_io";               
      keep p_ports_p1_io.hdl_path()               == "ports_p1_io";               
      keep p_ports_p2_io.hdl_path()               == "ports_p2_io";               
      keep p_ports_p3_io.hdl_path()               == "ports_p3_io";               
      keep p_bus_control_p0_io.hdl_path()         == "bus_ctrl_p0_io";                     
      
      ///////////////////// OUTPUTS  //////////////////////////////
      keep p_fsm_data_o.hdl_path()                == "fsm_data_o";               
      
      keep p_alu_cy_o.hdl_path()                  == "alu_cy_o";               
      keep p_alu_ac_o.hdl_path()                  == "alu_ac_o";               
      keep p_alu_ov_o.hdl_path()                  == "alu_ov_o";               
      
      keep p_baudrate_sm0_o.hdl_path()            == "baudrate_sm0_o";                   
      keep p_baudrate_sm1_o.hdl_path()            == "baudrate_sm1_o";                   
      keep p_baudrate_sm2_o.hdl_path()            == "baudrate_sm2_o";                   
      keep p_baudrate_smod_o.hdl_path()           == "baudrate_smod_o";               
      keep p_baudrate_bps_o.hdl_path()            == "baudrate_bps_o";                   
      keep p_timers_th0_o.hdl_path()              == "timers_th0_o";                         
      keep p_timers_tm0_o.hdl_path()              == "timers_tm0_o";                         
      keep p_timers_tl0_o.hdl_path()              == "timers_tl0_o";                         
      keep p_timers_gate_t0_o.hdl_path()          == "timers_gate_t0_o";               
      keep p_timers_m1_t0_o.hdl_path()            == "timers_m1_t0_o";                    
      keep p_timers_m0_t0_o.hdl_path()            == "timers_m0_t0_o";                    
      keep p_timers_tr0_o.hdl_path()              == "timers_tr0_o";                          
      keep p_timers_th1_o.hdl_path()              == "timers_th1_o";                         
      keep p_timers_tm1_o.hdl_path()              == "timers_tm1_o";                         
      keep p_timers_tl1_o.hdl_path()              == "timers_tl1_o";                         
      keep p_timers_gate_t1_o.hdl_path()          == "timers_gate_t1_o";                   
      keep p_timers_m1_t1_o.hdl_path()            == "timers_m1_t1_o";                     
      keep p_timers_m0_t1_o.hdl_path()            == "timers_m0_t1_o";                     
      keep p_timers_tr1_o.hdl_path()              == "timers_tr1_o";                          
      keep p_timers_tacph_o.hdl_path()            == "timers_tacph_o";                    
      keep p_timers_tacpl_o.hdl_path()            == "timers_tacpl_o";                    
      keep p_timers_tr2_o.hdl_path()              == "timers_tr2_o";                          
      keep p_timers_dfsel_o.hdl_path()            == "timers_dfsel_o";                     
      keep p_timers_edgsel_o.hdl_path()           == "timers_edgsel_o";                    
      keep p_timers_dfp_o.hdl_path()              == "timers_dfp_o";              
      keep p_timers_int0_o.hdl_path()             == "timers_int0_o";
      keep p_timers_int1_o.hdl_path()             == "timers_int1_o";
      keep p_interrupt_ip_o.hdl_path()            == "interrupt_ip_o";                    
      keep p_interrupt_ie_o.hdl_path()            == "interrupt_ie_o";                    
      keep p_interrupt_int0_o.hdl_path()          == "interrupt_int0_o";                   
      keep p_interrupt_int1_o.hdl_path()          == "interrupt_int1_o";                   
      keep p_interrupt_ie0_o.hdl_path()           == "interrupt_ie0_o";                    
      keep p_interrupt_ie1_o.hdl_path()           == "interrupt_ie1_o";                    
      keep p_interrupt_ri_o.hdl_path()            == "interrupt_ri_o";                     
      keep p_interrupt_ti_o.hdl_path()            == "interrupt_ti_o";                     
      keep p_interrupt_tf0_o.hdl_path()           == "interrupt_tf0_o";                   
      keep p_interrupt_tf1_o.hdl_path()           == "interrupt_tf1_o";                   
      keep p_interrupt_tf2_o.hdl_path()           == "interrupt_tf2_o";                   
      keep p_interrupt_txrxf_o.hdl_path()         == "interrupt_txrxf_o";              
      keep p_ports_p4_o.hdl_path()                == "ports_p4_o";                           
      keep p_ports_p0en_o.hdl_path()              == "ports_p0en_o";
      keep p_ports_p1en_o.hdl_path()              == "ports_p1en_o";
      keep p_ports_p2en_o.hdl_path()              == "ports_p2en_o";
      keep p_ports_p3en_o.hdl_path()              == "ports_p3en_o";
      keep p_serial_sm0_o.hdl_path()              == "serial_sm0_o";                         
      keep p_serial_ren_o.hdl_path()              == "serial_ren_o";                         
      keep p_serial_p3_0_o.hdl_path()             == "serial_p3_0_o";                     
      keep p_serial_p3_1_o.hdl_path()             == "serial_p3_1_o";                     
      keep p_serial_sbuf_tx_o.hdl_path()          == "serial_sbuf_tx_o";               
      keep p_serial_tb8_o.hdl_path()              == "serial_tb8_o";                         
      keep p_serial_ti_o.hdl_path()               == "serial_ti_o";                          
      keep p_serial_ri_o.hdl_path()               == "serial_ri_o";                          
            
      };
  
      when CORE_REG_CONTROL_OUT core_reg_control_sig_u {
            // Path specification to the CORE_REG_CONTROL IN signals INPUTS
            /////////////////// INPTUS ////////////////
      keep p_reset.hdl_path()                     == "reset_b_i";
      keep p_fsm_wr_b_i.hdl_path()                == "fsm_wr_b_i";
      keep p_fsm_rd_b_i.hdl_path()                == "fsm_rd_b_i";
      keep p_fsm_byte_b_i.hdl_path()              == "fsm_byte_b_i";
      keep p_fsm_addr_i.hdl_path()                == "fsm_addr_i";                          
      keep p_fsm_data_i.hdl_path()                == "fsm_data_i";                          
      keep p_fsm_serial_tx_i.hdl_path()           == "fsm_serial_tx_i";              
      keep p_timers_th0_i.hdl_path()              == "timers_th0_i";                    
      keep p_timers_tm0_i.hdl_path()              == "timers_tm0_i";                   
      keep p_timers_tl0_i.hdl_path()              == "timers_tl0_i";                   
      keep p_timers_tf0_i.hdl_path()              == "timers_tf0_i";                   
      keep p_timers_th1_i.hdl_path()              == "timers_th1_i";                   
      keep p_timers_tm1_i.hdl_path()              == "timers_tm1_i";                   
      keep p_timers_tl1_i.hdl_path()              == "timers_tm1_i";                   
      keep p_timers_tf1_i.hdl_path()              == "timers_tf1_i";                   
      keep p_timers_acrh_i.hdl_path()             == "timers_acrh_i";               
      keep p_timers_acrm_i.hdl_path()             == "timers_acrm_i";               
      keep p_timers_acrl_i.hdl_path()             == "timers_acrl_i";               
      keep p_timers_tf2_i.hdl_path()              == "timers_tf2_i";  
      keep p_timers_int0_o.hdl_path()             == "timers_int0_o";
      keep p_timers_int1_o.hdl_path()             == "timers_int1_o";                 
      
      keep p_alu_cy_i.hdl_path()                  == "alu_cy_i";               
      keep p_alu_ac_i.hdl_path()                  == "alu_ac_i";               
      keep p_alu_ov_i.hdl_path()                  == "alu_ov_i";               
      
      keep p_mem_ctrl_ext_mem_en_b_i.hdl_path()   == "mem_ctrl_ext_mem_en_b_i";               
      keep p_bus_control_p0en_i.hdl_path()        == "bus_ctrl_p0en_i";                    
      keep p_bus_control_p2en_i.hdl_path()        == "bus_ctrl_p2en_i";                    
      keep p_bus_control_p3en_6_i.hdl_path()      == "bus_ctrl_p3en_6_i";               
      keep p_bus_control_p3en_7_i.hdl_path()      == "bus_ctrl_p3en_7_i";               
      keep p_bus_control_p2_i.hdl_path()          == "bus_ctrl_p2_i";                         
      keep p_bus_control_p3_6_i.hdl_path()        == "bus_ctrl_p3_6_i";                    
      keep p_bus_control_p3_7_i.hdl_path()        == "bus_ctrl_p3_7_i";                    
      keep p_bus_control_p4_i.hdl_path()          == "bus_ctrl_p4_i";                         
      keep p_interrupt_ie0_i.hdl_path()           == "interrupt_ie0_i";                         
      keep p_interrupt_ie1_i.hdl_path()           == "interrupt_ie1_i";                         
      keep p_interrupt_ri_i.hdl_path()            == "interrupt_ri_i";                          
      keep p_interrupt_ti_i.hdl_path()            == "interrupt_ti_i";                          
      keep p_interrupt_tf0_i.hdl_path()           == "interrupt_tf0_i";                          
      keep p_interrupt_tf1_i.hdl_path()           == "interrupt_tf1_i";                          
      keep p_interrupt_tf2_i.hdl_path()           == "interrupt_tf2_i";                          
      keep p_interrupt_txrxf_i.hdl_path()         == "interrupt_txrxf_i";               
      keep p_interrupt_clear_i.hdl_path()         == "interrupt_clear_i";               
      keep p_serial_p3en_0_i.hdl_path()           == "serial_p3en_0_i";                   
      keep p_serial_p3en_1_i.hdl_path()           == "serial_p3en_1_i";                   
      keep p_serial_p3_0_i.hdl_path()             == "serial_p3_0_i";                     
      keep p_serial_p3_1_i.hdl_path()             == "serial_p3_1_i";                     
      keep p_serial_sbuf_rx_i.hdl_path()          == "serial_sbuf_rx_i";               
      keep p_serial_rb8_i.hdl_path()              == "serial_rb8_i";                         
      keep p_serial_ti_i.hdl_path()               == "serial_ti_i";                          
      keep p_serial_ri_i.hdl_path()               == "serial_ri_i";                          
      
      ////////////////////// INOUT PORTS /////////////////////////////
      keep p_ports_p0_io.hdl_path()               == "ports_p0_io";               
      keep p_ports_p1_io.hdl_path()               == "ports_p1_io";               
      keep p_ports_p2_io.hdl_path()               == "ports_p2_io";               
      keep p_ports_p3_io.hdl_path()               == "ports_p3_io";               
      keep p_bus_control_p0_io.hdl_path()         == "bus_ctrl_p0_io";                     
      
      ///////////////////// OUTPUTS  //////////////////////////////
      keep p_fsm_data_o.hdl_path()                == "fsm_data_o";               
      
      keep p_alu_cy_o.hdl_path()                  == "alu_cy_o";               
      keep p_alu_ac_o.hdl_path()                  == "alu_ac_o";               
      keep p_alu_ov_o.hdl_path()                  == "alu_ov_o";               
      
      keep p_baudrate_sm0_o.hdl_path()            == "baudrate_sm0_o";                   
      keep p_baudrate_sm1_o.hdl_path()            == "baudrate_sm1_o";                   
      keep p_baudrate_sm2_o.hdl_path()            == "baudrate_sm2_o";                   
      keep p_baudrate_smod_o.hdl_path()           == "baudrate_smod_o";               
      keep p_baudrate_bps_o.hdl_path()            == "baudrate_bps_o";                   
      keep p_timers_th0_o.hdl_path()              == "timers_th0_o";                         
      keep p_timers_tm0_o.hdl_path()              == "timers_tm0_o";                         
      keep p_timers_tl0_o.hdl_path()              == "timers_tl0_o";                         
      keep p_timers_gate_t0_o.hdl_path()          == "timers_gate_t0_o";               
      keep p_timers_m1_t0_o.hdl_path()            == "timers_m1_t0_o";                    
      keep p_timers_m0_t0_o.hdl_path()            == "timers_m0_t0_o";                    
      keep p_timers_tr0_o.hdl_path()              == "timers_tr0_o";                          
      keep p_timers_th1_o.hdl_path()              == "timers_th1_o";                         
      keep p_timers_tm1_o.hdl_path()              == "timers_tm1_o";                         
      keep p_timers_tl1_o.hdl_path()              == "timers_tl1_o";                         
      keep p_timers_gate_t1_o.hdl_path()          == "timers_gate_t1_o";                   
      keep p_timers_m1_t1_o.hdl_path()            == "timers_m1_t1_o";                     
      keep p_timers_m0_t1_o.hdl_path()            == "timers_m0_t1_o";                     
      keep p_timers_tr1_o.hdl_path()              == "timers_tr1_o";                          
      keep p_timers_tacph_o.hdl_path()            == "timers_tacph_o";                    
      keep p_timers_tacpl_o.hdl_path()            == "timers_tacpl_o";                    
      keep p_timers_tr2_o.hdl_path()              == "timers_tr2_o";                          
      keep p_timers_dfsel_o.hdl_path()            == "timers_dfsel_o";                     
      keep p_timers_edgsel_o.hdl_path()           == "timers_edgsel_o";                    
      keep p_timers_dfp_o.hdl_path()              == "timers_dfp_o";              
      keep p_interrupt_ip_o.hdl_path()            == "interrupt_ip_o";                    
      keep p_interrupt_ie_o.hdl_path()            == "interrupt_ie_o";                    
      keep p_interrupt_int0_o.hdl_path()          == "interrupt_int0_o";                   
      keep p_interrupt_int1_o.hdl_path()          == "interrupt_int1_o";                   
      keep p_interrupt_ie0_o.hdl_path()           == "interrupt_ie0_o";                    
      keep p_interrupt_ie1_o.hdl_path()           == "interrupt_ie1_o";                    
      keep p_interrupt_ri_o.hdl_path()            == "interrupt_ri_o";                     
      keep p_interrupt_ti_o.hdl_path()            == "interrupt_ti_o";                     
      keep p_interrupt_tf0_o.hdl_path()           == "interrupt_tf0_o";                   
      keep p_interrupt_tf1_o.hdl_path()           == "interrupt_tf1_o";                   
      keep p_interrupt_tf2_o.hdl_path()           == "interrupt_tf2_o";                   
      keep p_interrupt_txrxf_o.hdl_path()         == "interrupt_txrxf_o";              
      keep p_ports_p4_o.hdl_path()                == "ports_p4_o";  
      keep p_ports_p0en_o.hdl_path()              == "ports_p0en_o";
      keep p_ports_p1en_o.hdl_path()              == "ports_p1en_o";
      keep p_ports_p2en_o.hdl_path()              == "ports_p2en_o";
      keep p_ports_p3en_o.hdl_path()              == "ports_p3en_o";                         
      keep p_serial_sm0_o.hdl_path()              == "serial_sm0_o";                         
      keep p_serial_ren_o.hdl_path()              == "serial_ren_o";                         
      keep p_serial_p3_0_o.hdl_path()             == "serial_p3_0_o";                     
      keep p_serial_p3_1_o.hdl_path()             == "serial_p3_1_o";                     
      keep p_serial_sbuf_tx_o.hdl_path()          == "serial_sbuf_tx_o";               
      keep p_serial_tb8_o.hdl_path()              == "serial_tb8_o";                         
      keep p_serial_ti_o.hdl_path()               == "serial_ti_o";                          
      keep p_serial_ri_o.hdl_path()               == "serial_ri_o";                          
      };
};

'>
