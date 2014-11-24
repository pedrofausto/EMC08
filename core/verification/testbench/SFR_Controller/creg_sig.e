<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_sig.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, sig - signal map
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
// Include Files: creg_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_sig_h;

extend creg_sig_u {
   // input ports
   RESET_p    			      : inout simple_port of bit is instance; 
   
   FSM_WR_I_p      		   : inout simple_port of bit is instance; 
   FSM_RD_I_p     		   : inout simple_port of bit is instance; 
   FSM_BYTE_I_p            : inout simple_port of bit is instance;
   FSM_ADDR_I_p			   : inout simple_port of uint(bits:8) is instance;
   FSM_DATA_I_p			   : inout simple_port of uint(bits:8) is instance;

   EXT_ROM_RD_I_p          : inout simple_port of bit is instance;
   EXT_RAM_RD_I_p          : inout simple_port of bit is instance;
   EXT_RAM_WR_I_p          : inout simple_port of bit is instance;
   
   ALU_CY_I_p	        	   : inout simple_port of bit is instance;
   ALU_AC_I_p	        	   : inout simple_port of bit is instance;
   ALU_OV_I_p	        	   : inout simple_port of bit is instance;
   
   BUS_CONTROL_P0EN_I_p  	: inout simple_port of uint(bits:8) is instance;
   BUS_CONTROL_P0_I_p      : inout simple_port of uint(bits:8) is instance;
   BUS_CONTROL_P2EN_I_p  	: inout simple_port of uint(bits:8) is instance;
   BUS_CONTROL_P2_I_p      : inout simple_port of uint(bits:8) is instance;
   BUS_CONTROL_P3EN_6_I_p	: inout simple_port of bit is instance;
   BUS_CONTROL_P3EN_7_I_p	: inout simple_port of bit is instance;
   BUS_CONTROL_P3_6_I_p 	: inout simple_port of bit is instance;
   BUS_CONTROL_P3_7_I_p		: inout simple_port of bit is instance;
   BUS_CONTROL_P4_I_p		: inout simple_port of uint(bits:8) is instance;

   INTERRUPT_IE0_I_p		   : inout simple_port of bit is instance;
   INTERRUPT_IE1_I_p      	: inout simple_port of bit is instance;
   INTERRUPT_TF0_I_p      	: inout simple_port of bit is instance;
   INTERRUPT_TF1_I_p      	: inout simple_port of bit is instance;
   INTERRUPT_TF2_I_p      	: inout simple_port of bit is instance;
   INTERRUPT_TXRXF_I_p    	: inout simple_port of bit is instance;
   INTERRUPT_CLEAR_I_p    	: inout simple_port of bit is instance;
   
   PORTS_P0_I_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P1_I_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P2_I_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P3_I_p            : inout simple_port of uint(bits:8) is instance;
   
   SERIAL_P3EN_0_I_p      	: inout simple_port of bit is instance;
   SERIAL_P3EN_1_I_p      	: inout simple_port of bit is instance;
   SERIAL_P3_0_I_p        	: inout simple_port of bit is instance;
   SERIAL_P3_1_I_p        	: inout simple_port of bit is instance;
   SERIAL_SBUF_RX_I_p     	: inout simple_port of uint(bits:8) is instance;
   SERIAL_RB8_I_p        	: inout simple_port of bit is instance;
   SERIAL_TI_I_p       		: inout simple_port of bit is instance;
   SERIAL_RI_I_p          	: inout simple_port of bit is instance;

   TIMERS_TH0_I_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TM0_I_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TL0_I_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TF0_I_p          : inout simple_port of bit is instance;
   TIMERS_TH1_I_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TM1_I_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TL1_I_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TF1_I_p          : inout simple_port of bit is instance;
   TIMERS_ACRH_I_p         : inout simple_port of uint(bits:8) is instance;
   TIMERS_ACRM_I_p         : inout simple_port of uint(bits:8) is instance;
   TIMERS_ACRL_I_p         : inout simple_port of uint(bits:8) is instance;
   TIMERS_TACPH_I_p        : inout simple_port of uint(bits:2) is instance;
   TIMERS_TACPL_I_p        : inout simple_port of uint(bits:8) is instance;
   TIMERS_TF2_I_p          : inout simple_port of bit is instance;
    // output ports
   FSM_DATA_O_p    		   : inout simple_port of uint(bits:8) is instance;
   FSM_PSW_RS_O_p    	   : inout simple_port of uint(bits:2) is instance;
   
   ALU_CY_O_p	        	   : inout simple_port of bit is instance;
   ALU_AC_O_p	        	   : inout simple_port of bit is instance;
   ALU_OV_O_p	        	   : inout simple_port of bit is instance;
   
   BAUDRATE_SM0_O_p   	   : inout simple_port of bit is instance;
   BAUDRATE_SM1_O_p   	   : inout simple_port of bit is instance;
   BAUDRATE_SM2_O_p   	   : inout simple_port of bit is instance;
   BAUDRATE_SMOD_O_p   	   : inout simple_port of bit is instance;
   BAUDRATE_RS232_O_p  	   : inout simple_port of bit is instance;
   
   BUS_CONTROL_P0_O_p      : inout simple_port of uint(bits:8) is instance;

   INTERRUPT_IP_O_p		   : inout simple_port of uint(bits:7) is instance; 
   INTERRUPT_IE_O_p        : inout simple_port of uint(bits:8) is instance; 
   INTERRUPT_INT0_O_p 	   : inout simple_port of bit is instance;
   INTERRUPT_INT1_O_p      : inout simple_port of bit is instance;
   INTERRUPT_IT0_O_p 	   : inout simple_port of bit is instance;
   INTERRUPT_IT1_O_p       : inout simple_port of bit is instance;
   INTERRUPT_IE0_O_p		   : inout simple_port of bit is instance;
   INTERRUPT_IE1_O_p       : inout simple_port of bit is instance;
   INTERRUPT_RI_O_p 		   : inout simple_port of bit is instance;
   INTERRUPT_TI_O_p        : inout simple_port of bit is instance;
   INTERRUPT_TF0_O_p       : inout simple_port of bit is instance;
   INTERRUPT_TF1_O_p       : inout simple_port of bit is instance;
   INTERRUPT_TF2_O_p       : inout simple_port of bit is instance;
   INTERRUPT_TXRXF_O_p     : inout simple_port of bit is instance;

   PORTS_P0_O_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P1_O_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P2_O_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P3_O_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P4_O_p            : inout simple_port of uint(bits:8) is instance;
   PORTS_P0EN_O_p          : inout simple_port of uint(bits:8) is instance;
   PORTS_P1EN_O_p          : inout simple_port of uint(bits:8) is instance;
   PORTS_P2EN_O_p          : inout simple_port of uint(bits:8) is instance;
   PORTS_P3EN_O_p          : inout simple_port of uint(bits:8) is instance;
   
   SERIAL_SM0_O_p      		: inout simple_port of bit is instance;
   SERIAL_REN_O_p      		: inout simple_port of bit is instance;
   SERIAL_P3_0_O_p        	: inout simple_port of bit is instance;
   SERIAL_SBUF_TX_O_p     	: inout simple_port of uint(bits:8) is instance;
   SERIAL_TB8_O_p        	: inout simple_port of bit is instance;
   SERIAL_TI_O_p       		: inout simple_port of bit is instance;
   SERIAL_RI_O_p          	: inout simple_port of bit is instance;
   SERIAL_TX_O_p          	: inout simple_port of bit is instance;
   
   TIMERS_TH0_O_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TM0_O_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TL0_O_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_GATE_T0_O_p      : inout simple_port of bit is instance;
   TIMERS_M1_T0_O_p        : inout simple_port of bit is instance;
   TIMERS_M0_T0_O_p        : inout simple_port of bit is instance;
   TIMERS_TR0_O_p          : inout simple_port of bit is instance;
   TIMERS_TF0_O_p          : inout simple_port of bit is instance;
   TIMERS_TH1_O_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TM1_O_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_TL1_O_p          : inout simple_port of uint(bits:8) is instance;
   TIMERS_GATE_T1_O_p      : inout simple_port of bit is instance;
   TIMERS_M1_T1_O_p        : inout simple_port of bit is instance;
   TIMERS_M0_T1_O_p        : inout simple_port of bit is instance;
   TIMERS_INT0_O_p         : inout simple_port of bit is instance;
   TIMERS_INT1_O_p         : inout simple_port of bit is instance;
   TIMERS_TR1_O_p          : inout simple_port of bit is instance;
   TIMERS_TF1_O_p          : inout simple_port of bit is instance;
   TIMERS_TACPH_O_p        : inout simple_port of uint(bits:2) is instance; 
   TIMERS_TACPL_O_p        : inout simple_port of uint(bits:8) is instance; 
   TIMERS_TR2_O_p          : inout simple_port of bit is instance;
   TIMERS_TF2_O_p          : inout simple_port of bit is instance;
   TIMERS_DFSEL_O_p        : inout simple_port of bit is instance;
   TIMERS_EDGSEL_O_p       : inout simple_port of bit is instance;
   TIMERS_DFP_O_p          : inout simple_port of uint(bits:3) is instance; 
   
   
   // Connect the ports to the external design
   keep bind(RESET_p,external);

   keep bind(FSM_WR_I_p,external);
   keep bind(FSM_RD_I_p,external);
   keep bind(FSM_BYTE_I_p,external);
   keep bind(FSM_ADDR_I_p,external);
   keep bind(FSM_DATA_I_p,external);
 
   keep bind(EXT_ROM_RD_I_p,external);
   keep bind(EXT_RAM_RD_I_p,external);
   keep bind(EXT_RAM_WR_I_p,external);
   
   keep bind(ALU_CY_I_p,external);
   keep bind(ALU_AC_I_p,external);
   keep bind(ALU_OV_I_p,external);
   
   keep bind(BUS_CONTROL_P0EN_I_p,external);
   keep bind(BUS_CONTROL_P0_I_p,external);
   keep bind(BUS_CONTROL_P2EN_I_p,external);
   keep bind(BUS_CONTROL_P2_I_p,external);
   keep bind(BUS_CONTROL_P3EN_6_I_p,external);
   keep bind(BUS_CONTROL_P3EN_7_I_p,external);
   keep bind(BUS_CONTROL_P3_6_I_p,external);
   keep bind(BUS_CONTROL_P3_7_I_p,external);
   keep bind(BUS_CONTROL_P4_I_p,external);

   keep bind(INTERRUPT_IE0_I_p,external);
   keep bind(INTERRUPT_IE1_I_p,external);
   keep bind(INTERRUPT_TF0_I_p,external);
   keep bind(INTERRUPT_TF1_I_p,external);
   keep bind(INTERRUPT_TF2_I_p,external);
   keep bind(INTERRUPT_TXRXF_I_p,external);
   keep bind(INTERRUPT_CLEAR_I_p,external);
   
   keep bind(PORTS_P0_I_p,external);
   keep bind(PORTS_P1_I_p,external);
   keep bind(PORTS_P2_I_p,external);
   keep bind(PORTS_P3_I_p,external);
      
   keep bind(SERIAL_P3EN_0_I_p,external);
   keep bind(SERIAL_P3EN_1_I_p,external);
   keep bind(SERIAL_P3_0_I_p,external);
   keep bind(SERIAL_P3_1_I_p,external);
   keep bind(SERIAL_SBUF_RX_I_p,external);
   keep bind(SERIAL_RB8_I_p,external);
   keep bind(SERIAL_TI_I_p,external);
   keep bind(SERIAL_RI_I_p,external);
   
   keep bind(TIMERS_TH0_I_p,external);
   keep bind(TIMERS_TM0_I_p,external);
   keep bind(TIMERS_TL0_I_p,external);
   keep bind(TIMERS_TF0_I_p,external);
   keep bind(TIMERS_TH1_I_p,external);
   keep bind(TIMERS_TM1_I_p,external);
   keep bind(TIMERS_TL1_I_p,external);
   keep bind(TIMERS_TF1_I_p,external);
   keep bind(TIMERS_ACRH_I_p,external);
   keep bind(TIMERS_ACRM_I_p,external);
   keep bind(TIMERS_ACRL_I_p,external);
   keep bind(TIMERS_TACPH_I_p,external);
   keep bind(TIMERS_TACPL_I_p,external);
   keep bind(TIMERS_TF2_I_p,external);
     
   // output ports
   keep bind(FSM_DATA_O_p,external);
   keep bind(FSM_PSW_RS_O_p,external);
   
   keep bind(ALU_CY_O_p,external);
   keep bind(ALU_AC_O_p,external);
   keep bind(ALU_OV_O_p,external);
   
   keep bind(BAUDRATE_SM0_O_p,external);
   keep bind(BAUDRATE_SM1_O_p,external);
   keep bind(BAUDRATE_SM2_O_p,external);
   keep bind(BAUDRATE_SMOD_O_p,external);
   keep bind(BAUDRATE_RS232_O_p,external);
   
   keep bind(BUS_CONTROL_P0_I_p,external);
   
   keep bind(INTERRUPT_IP_O_p,external);
   keep bind(INTERRUPT_IE_O_p,external);
   keep bind(INTERRUPT_INT0_O_p,external);
   keep bind(INTERRUPT_INT1_O_p,external);
   keep bind(INTERRUPT_IT0_O_p,external);
   keep bind(INTERRUPT_IT1_O_p,external);
   keep bind(INTERRUPT_IE0_O_p,external);
   keep bind(INTERRUPT_IE1_O_p,external);
   keep bind(INTERRUPT_RI_O_p,external);
   keep bind(INTERRUPT_TI_O_p,external);
   keep bind(INTERRUPT_TF0_O_p,external);
   keep bind(INTERRUPT_TF1_O_p,external);
   keep bind(INTERRUPT_TF2_O_p,external);
   keep bind(INTERRUPT_TXRXF_O_p,external);

   keep bind(PORTS_P0_O_p,external);
   keep bind(PORTS_P1_O_p,external);
   keep bind(PORTS_P2_O_p,external);
   keep bind(PORTS_P3_O_p,external);
   keep bind(PORTS_P4_O_p,external);
   keep bind(PORTS_P0EN_O_p,external);
   keep bind(PORTS_P1EN_O_p,external);
   keep bind(PORTS_P2EN_O_p,external);
   keep bind(PORTS_P3EN_O_p,external);
   
   keep bind(SERIAL_SM0_O_p,external);
   keep bind(SERIAL_REN_O_p,external);
   keep bind(SERIAL_P3_0_O_p,external);
   keep bind(SERIAL_SBUF_TX_O_p,external);
   keep bind(SERIAL_TB8_O_p,external);
   keep bind(SERIAL_TI_O_p,external);
   keep bind(SERIAL_RI_O_p,external);
   keep bind(SERIAL_TX_O_p,external);
   
   keep bind(TIMERS_TH0_O_p,external);
   keep bind(TIMERS_TM0_O_p,external);
   keep bind(TIMERS_TL0_O_p,external);
   keep bind(TIMERS_GATE_T0_O_p,external);
   keep bind(TIMERS_M1_T0_O_p,external);
   keep bind(TIMERS_M0_T0_O_p,external);
   keep bind(TIMERS_INT0_O_p,external);
   keep bind(TIMERS_INT1_O_p,external);
   keep bind(TIMERS_TR0_O_p,external);
   keep bind(TIMERS_TF0_O_p,external);
   keep bind(TIMERS_TH1_O_p,external);
   keep bind(TIMERS_TM1_O_p,external);
   keep bind(TIMERS_TL1_O_p,external);
   keep bind(TIMERS_GATE_T1_O_p,external);
   keep bind(TIMERS_M1_T1_O_p,external);
   keep bind(TIMERS_M0_T1_O_p,external);
   keep bind(TIMERS_TR1_O_p,external);
   keep bind(TIMERS_TF1_O_p,external);
   keep bind(TIMERS_TACPH_O_p,external);
   keep bind(TIMERS_TACPL_O_p,external);
   keep bind(TIMERS_TR2_O_p,external);
   keep bind(TIMERS_TF2_O_p,external);
   keep bind(TIMERS_DFSEL_O_p,external);
   keep bind(TIMERS_EDGSEL_O_p,external);
   keep bind(TIMERS_DFP_O_p,external);
   

   when CREG_IN creg_sig_u {
      // Path specification to the CREG IN signals
      keep RESET_p.hdl_path()    			   == "reset_b_i";
      
      keep FSM_WR_I_p.hdl_path()      		   == "fsm_wr_b_i";
      keep FSM_RD_I_p.hdl_path()     			== "fsm_rd_b_i";
      keep FSM_BYTE_I_p.hdl_path() 			   == "fsm_byte_b_i";
      keep FSM_ADDR_I_p.hdl_path()    			== "fsm_addr_i";
      keep FSM_DATA_I_p.hdl_path()  			== "fsm_data_i";
  	  
      keep EXT_ROM_RD_I_p.hdl_path() 		   == "ext_rom_rd_i";
      keep EXT_RAM_RD_I_p.hdl_path() 		   == "ext_ram_rd_i";
      keep EXT_RAM_WR_I_p.hdl_path() 		   == "ext_ram_wr_i";
      
      keep ALU_CY_I_p.hdl_path()             == "alu_cy_i";
      keep ALU_AC_I_p.hdl_path()             == "alu_ac_i";
      keep ALU_OV_I_p.hdl_path()             == "alu_ov_i";
      
      keep BUS_CONTROL_P0EN_I_p.hdl_path() 	== "bus_ctrl_p0en_i";
      keep BUS_CONTROL_P0_I_p.hdl_path()     == "bus_ctrl_p0_i";
      keep BUS_CONTROL_P2EN_I_p.hdl_path() 	== "bus_ctrl_p2en_i";
      keep BUS_CONTROL_P2_I_p.hdl_path()     == "bus_ctrl_p2_i";
      keep BUS_CONTROL_P3EN_6_I_p.hdl_path()	== "bus_ctrl_p3en_6_i";
      keep BUS_CONTROL_P3EN_7_I_p.hdl_path()	== "bus_ctrl_p3en_7_i";
      keep BUS_CONTROL_P3_6_I_p.hdl_path()   == "bus_ctrl_p3_6_i";
      keep BUS_CONTROL_P3_7_I_p.hdl_path()   == "bus_ctrl_p3_7_i";
      keep BUS_CONTROL_P4_I_p.hdl_path() 		== "bus_ctrl_p4_i";
	 
      keep INTERRUPT_IE0_I_p.hdl_path()      == "interrupt_ie0_i";
      keep INTERRUPT_IE1_I_p.hdl_path() 		== "interrupt_ie1_i";
      keep INTERRUPT_TF0_I_p.hdl_path() 		== "interrupt_tf0_i";
      keep INTERRUPT_TF1_I_p.hdl_path() 		== "interrupt_tf1_i";
      keep INTERRUPT_TF2_I_p.hdl_path() 		== "interrupt_tf2_i";
      keep INTERRUPT_TXRXF_I_p.hdl_path() 	== "interrupt_txrxf_i";
      keep INTERRUPT_CLEAR_I_p.hdl_path() 	== "interrupt_clear_i";

      keep PORTS_P0_I_p.hdl_path()           == "ports_p0_i";
      keep PORTS_P1_I_p.hdl_path()           == "ports_p1_i";
      keep PORTS_P2_I_p.hdl_path()           == "ports_p2_i";
      keep PORTS_P3_I_p.hdl_path()           == "ports_p3_i";
      
      keep SERIAL_P3EN_0_I_p.hdl_path()      == "serial_p3en_0_i";
      keep SERIAL_P3EN_1_I_p.hdl_path() 		== "serial_p3en_1_i";
      keep SERIAL_P3_0_I_p.hdl_path()      	== "serial_p3_0_i";
      keep SERIAL_P3_1_I_p.hdl_path()     	== "serial_p3_1_i";
      keep SERIAL_SBUF_RX_I_p.hdl_path() 		== "serial_sbuf_rx_i";
      keep SERIAL_RB8_I_p.hdl_path()    		== "serial_rb8_i";
      keep SERIAL_TI_I_p.hdl_path()       	== "serial_ti_i";
      keep SERIAL_RI_I_p.hdl_path() 			== "serial_ri_i";

	   keep TIMERS_TH0_I_p.hdl_path()         == "timers_th0_i";
      keep TIMERS_TM0_I_p.hdl_path()         == "timers_tm0_i";
      keep TIMERS_TL0_I_p.hdl_path()         == "timers_tl0_i";
      keep TIMERS_TF0_I_p.hdl_path()         == "timers_tf0_i";
      keep TIMERS_TH1_I_p.hdl_path()         == "timers_th1_i";
      keep TIMERS_TM1_I_p.hdl_path()         == "timers_tm1_i";
      keep TIMERS_TL1_I_p.hdl_path()         == "timers_tl1_i";
      keep TIMERS_TF1_I_p.hdl_path()         == "timers_tf1_i";
      keep TIMERS_ACRH_I_p.hdl_path()        == "timers_acrh_i";
      keep TIMERS_ACRM_I_p.hdl_path()        == "timers_acrm_i";
      keep TIMERS_ACRL_I_p.hdl_path()        == "timers_acrl_i";
      keep TIMERS_TACPH_I_p.hdl_path()       == "timers_acrl_i";
      keep TIMERS_TACPL_I_p.hdl_path()       == "timers_acrl_i";
      keep TIMERS_TF2_I_p.hdl_path()         == "timers_tf2_i";
      
      // output ports
      keep FSM_DATA_O_p.hdl_path()     		== "fsm_data_o";
      keep FSM_PSW_RS_O_p.hdl_path()     		== "fsm_psw_rs_o";
      
      keep ALU_CY_O_p.hdl_path() 			   == "alu_cy_o";
      keep ALU_AC_O_p.hdl_path()    			== "alu_ac_o";
      keep ALU_OV_O_p.hdl_path()       		== "alu_ov_o";

      keep BAUDRATE_SM0_O_p.hdl_path()     	== "baudrate_sm0_o";
      keep BAUDRATE_SM1_O_p.hdl_path() 		== "baudrate_sm1_o";
      keep BAUDRATE_SM2_O_p.hdl_path()    	== "baudrate_sm2_o";
      keep BAUDRATE_SMOD_O_p.hdl_path()      == "baudrate_smod_o";
      keep BAUDRATE_RS232_O_p.hdl_path() 		== "baudrate_rs232_o";
      
      keep BUS_CONTROL_P0_O_p.hdl_path()     == "bus_ctrl_p0_o";

      keep INTERRUPT_IP_O_p.hdl_path()     	== "interrupt_ip_o";
      keep INTERRUPT_IE_O_p.hdl_path() 		== "interrupt_ie_o";
      keep INTERRUPT_INT0_O_p.hdl_path()    	== "interrupt_int0_o";
      keep INTERRUPT_INT1_O_p.hdl_path()     == "interrupt_int1_o";
      keep INTERRUPT_IT0_O_p.hdl_path()    	== "interrupt_it0_o";
      keep INTERRUPT_IT1_O_p.hdl_path()      == "interrupt_it1_o";
      keep INTERRUPT_IE0_O_p.hdl_path() 		== "interrupt_ie0_o";
      keep INTERRUPT_IE1_O_p.hdl_path()     	== "interrupt_ie1_o";
      keep INTERRUPT_RI_O_p.hdl_path() 		== "interrupt_ri_o";
      keep INTERRUPT_TI_O_p.hdl_path()     	== "interrupt_ti_o";
      keep INTERRUPT_TF0_O_p.hdl_path() 		== "interrupt_tf0_o";
      keep INTERRUPT_TF1_O_p.hdl_path()    	== "interrupt_tf1_o";
      keep INTERRUPT_TF2_O_p.hdl_path()      == "interrupt_tf2_o";
      keep INTERRUPT_TXRXF_O_p.hdl_path() 	== "interrupt_txrxf_o";
// In/out Ports signals 
      keep PORTS_P0_O_p.hdl_path()           == "ports_p0_o";
      keep PORTS_P1_O_p.hdl_path()           == "ports_p1_o";
      keep PORTS_P2_O_p.hdl_path()           == "ports_p2_o";
      keep PORTS_P3_O_p.hdl_path()           == "ports_p3_o";
      keep PORTS_P4_O_p.hdl_path()           == "ports_p4_o";
      keep PORTS_P0EN_O_p.hdl_path()         == "ports_p0en_o";
      keep PORTS_P1EN_O_p.hdl_path()         == "ports_p1en_o";
      keep PORTS_P2EN_O_p.hdl_path()         == "ports_p2en_o";
      keep PORTS_P3EN_O_p.hdl_path()         == "ports_p3en_o";
      
      keep SERIAL_SM0_O_p.hdl_path() 			== "serial_sm0_o";
      keep SERIAL_REN_O_p.hdl_path()    		== "serial_ren_o";
      keep SERIAL_P3_0_O_p.hdl_path()       	== "serial_p3_0_o";
      keep SERIAL_SBUF_TX_O_p.hdl_path() 		== "serial_sbuf_tx_o";
      keep SERIAL_TB8_O_p.hdl_path()    		== "serial_tb8_o";
      keep SERIAL_TI_O_p.hdl_path()       	== "serial_ti_o";
      keep SERIAL_RI_O_p.hdl_path() 			== "serial_ri_o";
      keep SERIAL_TX_O_p.hdl_path() 			== "serial_tx_o";
	   
	   keep TIMERS_TH0_O_p.hdl_path()         == "timers_th0_o";
      keep TIMERS_TM0_O_p.hdl_path()         == "timers_tm0_o";
      keep TIMERS_TL0_O_p.hdl_path()         == "timers_tl0_o";
      keep TIMERS_GATE_T0_O_p.hdl_path()     == "timers_gate_t0_o";
      keep TIMERS_M1_T0_O_p.hdl_path()       == "timers_m1_t0_o";
      keep TIMERS_M0_T0_O_p.hdl_path()       == "timers_m0_t0_o";
      keep TIMERS_INT0_O_p.hdl_path()        == "timers_int0_o";
      keep TIMERS_INT1_O_p.hdl_path()        == "timers_int1_o";
      keep TIMERS_TR0_O_p.hdl_path()         == "timers_tr0_o";
      keep TIMERS_TF0_O_p.hdl_path()         == "timers_tf0_o";
      keep TIMERS_TH1_O_p.hdl_path()         == "timers_th1_o";
      keep TIMERS_TM1_O_p.hdl_path()         == "timers_tm1_o";
      keep TIMERS_TL1_O_p.hdl_path()         == "timers_tl1_o";
      keep TIMERS_GATE_T1_O_p.hdl_path()     == "timers_gate_t1_o";
      keep TIMERS_M1_T1_O_p.hdl_path()       == "timers_m1_t1_o";
      keep TIMERS_M0_T1_O_p.hdl_path()       == "timers_m0_t1_o";
      keep TIMERS_TR1_O_p.hdl_path()         == "timers_tr1_o";
      keep TIMERS_TF1_O_p.hdl_path()         == "timers_tf1_o";
      keep TIMERS_TACPH_O_p.hdl_path()       == "timers_tacph_o";
      keep TIMERS_TACPL_O_p.hdl_path()       == "timers_tacpl_o";
      keep TIMERS_TR2_O_p.hdl_path()         == "timers_tr2_o";
      keep TIMERS_TF2_O_p.hdl_path()         == "timers_tf2_o";
      keep TIMERS_DFSEL_O_p.hdl_path()       == "timers_dfsel_o";
      keep TIMERS_EDGSEL_O_p.hdl_path()      == "timers_edgsel_o";
      keep TIMERS_DFP_O_p.hdl_path()         == "timers_dfp_o";
  
 };
 
   when CREG_OUT creg_sig_u {
      // Path specification to the CREG OUT signals
     keep RESET_p.hdl_path()              == "reset_b_i";
      
      keep FSM_WR_I_p.hdl_path()             == "fsm_wr_b_i";
      keep FSM_RD_I_p.hdl_path()             == "fsm_rd_b_i";
      keep FSM_BYTE_I_p.hdl_path()           == "fsm_byte_b_i";
      keep FSM_ADDR_I_p.hdl_path()           == "fsm_addr_i";
      keep FSM_DATA_I_p.hdl_path()           == "fsm_data_i";
     
      keep EXT_ROM_RD_I_p.hdl_path()         == "ext_rom_rd_i";
      keep EXT_RAM_RD_I_p.hdl_path()         == "ext_ram_rd_i";
      keep EXT_RAM_WR_I_p.hdl_path()         == "ext_ram_wr_i";
      
      keep ALU_CY_I_p.hdl_path()             == "alu_cy_i";
      keep ALU_AC_I_p.hdl_path()             == "alu_ac_i";
      keep ALU_OV_I_p.hdl_path()             == "alu_ov_i";
      
      keep BUS_CONTROL_P0EN_I_p.hdl_path()   == "bus_ctrl_p0en_i";
      keep BUS_CONTROL_P0_I_p.hdl_path()     == "bus_ctrl_p0_i";
      keep BUS_CONTROL_P2EN_I_p.hdl_path()   == "bus_ctrl_p2en_i";
      keep BUS_CONTROL_P2_I_p.hdl_path()     == "bus_ctrl_p2_i";
      keep BUS_CONTROL_P3EN_6_I_p.hdl_path() == "bus_ctrl_p3en_6_i";
      keep BUS_CONTROL_P3EN_7_I_p.hdl_path() == "bus_ctrl_p3en_7_i";
      keep BUS_CONTROL_P3_6_I_p.hdl_path()   == "bus_ctrl_p3_6_i";
      keep BUS_CONTROL_P3_7_I_p.hdl_path()   == "bus_ctrl_p3_7_i";
      keep BUS_CONTROL_P4_I_p.hdl_path()     == "bus_ctrl_p4_i";
    
      keep INTERRUPT_IE0_I_p.hdl_path()      == "interrupt_ie0_i";
      keep INTERRUPT_IE1_I_p.hdl_path()      == "interrupt_ie1_i";
      keep INTERRUPT_TF0_I_p.hdl_path()      == "interrupt_tf0_i";
      keep INTERRUPT_TF1_I_p.hdl_path()      == "interrupt_tf1_i";
      keep INTERRUPT_TF2_I_p.hdl_path()      == "interrupt_tf2_i";
      keep INTERRUPT_TXRXF_I_p.hdl_path()    == "interrupt_txrxf_i";
      keep INTERRUPT_CLEAR_I_p.hdl_path()    == "interrupt_clear_i";

      keep PORTS_P0_I_p.hdl_path()           == "ports_p0_i";
      keep PORTS_P1_I_p.hdl_path()           == "ports_p1_i";
      keep PORTS_P2_I_p.hdl_path()           == "ports_p2_i";
      keep PORTS_P3_I_p.hdl_path()           == "ports_p3_i";
      
      keep SERIAL_P3EN_0_I_p.hdl_path()      == "serial_p3en_0_i";
      keep SERIAL_P3EN_1_I_p.hdl_path()      == "serial_p3en_1_i";
      keep SERIAL_P3_0_I_p.hdl_path()        == "serial_p3_0_i";
      keep SERIAL_P3_1_I_p.hdl_path()        == "serial_p3_1_i";
      keep SERIAL_SBUF_RX_I_p.hdl_path()     == "serial_sbuf_rx_i";
      keep SERIAL_RB8_I_p.hdl_path()         == "serial_rb8_i";
      keep SERIAL_TI_I_p.hdl_path()          == "serial_ti_i";
      keep SERIAL_RI_I_p.hdl_path()          == "serial_ri_i";

      keep TIMERS_TH0_I_p.hdl_path()         == "timers_th0_i";
      keep TIMERS_TM0_I_p.hdl_path()         == "timers_tm0_i";
      keep TIMERS_TL0_I_p.hdl_path()         == "timers_tl0_i";
      keep TIMERS_TF0_I_p.hdl_path()         == "timers_tf0_i";
      keep TIMERS_TH1_I_p.hdl_path()         == "timers_th1_i";
      keep TIMERS_TM1_I_p.hdl_path()         == "timers_tm1_i";
      keep TIMERS_TL1_I_p.hdl_path()         == "timers_tl1_i";
      keep TIMERS_TF1_I_p.hdl_path()         == "timers_tf1_i";
      keep TIMERS_ACRH_I_p.hdl_path()        == "timers_acrh_i";
      keep TIMERS_ACRM_I_p.hdl_path()        == "timers_acrm_i";
      keep TIMERS_ACRL_I_p.hdl_path()        == "timers_acrl_i";
      keep TIMERS_TACPH_I_p.hdl_path()       == "timers_acrl_i";
      keep TIMERS_TACPL_I_p.hdl_path()       == "timers_acrl_i";
      keep TIMERS_TF2_I_p.hdl_path()         == "timers_tf2_i";
      
      // output ports
      keep FSM_DATA_O_p.hdl_path()           == "fsm_data_o";
      keep FSM_PSW_RS_O_p.hdl_path()         == "fsm_psw_rs_o";
      
      keep ALU_CY_O_p.hdl_path()             == "alu_cy_o";
      keep ALU_AC_O_p.hdl_path()             == "alu_ac_o";
      keep ALU_OV_O_p.hdl_path()             == "alu_ov_o";

      keep BAUDRATE_SM0_O_p.hdl_path()       == "baudrate_sm0_o";
      keep BAUDRATE_SM1_O_p.hdl_path()       == "baudrate_sm1_o";
      keep BAUDRATE_SM2_O_p.hdl_path()       == "baudrate_sm2_o";
      keep BAUDRATE_SMOD_O_p.hdl_path()      == "baudrate_smod_o";
      keep BAUDRATE_RS232_O_p.hdl_path()     == "baudrate_rs232_o";
      
      keep BUS_CONTROL_P0_O_p.hdl_path()     == "bus_ctrl_p0_o";

      keep INTERRUPT_IP_O_p.hdl_path()       == "interrupt_ip_o";
      keep INTERRUPT_IE_O_p.hdl_path()       == "interrupt_ie_o";
      keep INTERRUPT_INT0_O_p.hdl_path()     == "interrupt_int0_o";
      keep INTERRUPT_INT1_O_p.hdl_path()     == "interrupt_int1_o";
      keep INTERRUPT_IT0_O_p.hdl_path()      == "interrupt_it0_o";
      keep INTERRUPT_IT1_O_p.hdl_path()      == "interrupt_it1_o";
      keep INTERRUPT_IE0_O_p.hdl_path()      == "interrupt_ie0_o";
      keep INTERRUPT_IE1_O_p.hdl_path()      == "interrupt_ie1_o";
      keep INTERRUPT_RI_O_p.hdl_path()       == "interrupt_ri_o";
      keep INTERRUPT_TI_O_p.hdl_path()       == "interrupt_ti_o";
      keep INTERRUPT_TF0_O_p.hdl_path()      == "interrupt_tf0_o";
      keep INTERRUPT_TF1_O_p.hdl_path()      == "interrupt_tf1_o";
      keep INTERRUPT_TF2_O_p.hdl_path()      == "interrupt_tf2_o";
      keep INTERRUPT_TXRXF_O_p.hdl_path()    == "interrupt_txrxf_o";
// In/out Ports signals 
      keep PORTS_P0_O_p.hdl_path()           == "ports_p0_o";
      keep PORTS_P1_O_p.hdl_path()           == "ports_p1_o";
      keep PORTS_P2_O_p.hdl_path()           == "ports_p2_o";
      keep PORTS_P3_O_p.hdl_path()           == "ports_p3_o";
      keep PORTS_P4_O_p.hdl_path()           == "ports_p4_o";
      keep PORTS_P0EN_O_p.hdl_path()         == "ports_p0en_o";
      keep PORTS_P1EN_O_p.hdl_path()         == "ports_p1en_o";
      keep PORTS_P2EN_O_p.hdl_path()         == "ports_p2en_o";
      keep PORTS_P3EN_O_p.hdl_path()         == "ports_p3en_o";
      
      keep SERIAL_SM0_O_p.hdl_path()         == "serial_sm0_o";
      keep SERIAL_REN_O_p.hdl_path()         == "serial_ren_o";
      keep SERIAL_P3_0_O_p.hdl_path()        == "serial_p3_0_o";
      keep SERIAL_SBUF_TX_O_p.hdl_path()     == "serial_sbuf_tx_o";
      keep SERIAL_TB8_O_p.hdl_path()         == "serial_tb8_o";
      keep SERIAL_TI_O_p.hdl_path()          == "serial_ti_o";
      keep SERIAL_RI_O_p.hdl_path()          == "serial_ri_o";
      keep SERIAL_TX_O_p.hdl_path()          == "serial_tx_o";
      
      keep TIMERS_TH0_O_p.hdl_path()         == "timers_th0_o";
      keep TIMERS_TM0_O_p.hdl_path()         == "timers_tm0_o";
      keep TIMERS_TL0_O_p.hdl_path()         == "timers_tl0_o";
      keep TIMERS_GATE_T0_O_p.hdl_path()     == "timers_gate_t0_o";
      keep TIMERS_M1_T0_O_p.hdl_path()       == "timers_m1_t0_o";
      keep TIMERS_M0_T0_O_p.hdl_path()       == "timers_m0_t0_o";
      keep TIMERS_INT0_O_p.hdl_path()        == "timers_int0_o";
      keep TIMERS_INT1_O_p.hdl_path()        == "timers_int1_o";
      keep TIMERS_TR0_O_p.hdl_path()         == "timers_tr0_o";
      keep TIMERS_TF0_O_p.hdl_path()         == "timers_tf0_o";
      keep TIMERS_TH1_O_p.hdl_path()         == "timers_th1_o";
      keep TIMERS_TM1_O_p.hdl_path()         == "timers_tm1_o";
      keep TIMERS_TL1_O_p.hdl_path()         == "timers_tl1_o";
      keep TIMERS_GATE_T1_O_p.hdl_path()     == "timers_gate_t1_o";
      keep TIMERS_M1_T1_O_p.hdl_path()       == "timers_m1_t1_o";
      keep TIMERS_M0_T1_O_p.hdl_path()       == "timers_m0_t1_o";
      keep TIMERS_TR1_O_p.hdl_path()         == "timers_tr1_o";
      keep TIMERS_TF1_O_p.hdl_path()         == "timers_tf1_o";
      keep TIMERS_TACPH_O_p.hdl_path()       == "timers_tacph_o";
      keep TIMERS_TACPL_O_p.hdl_path()       == "timers_tacpl_o";
      keep TIMERS_TR2_O_p.hdl_path()         == "timers_tr2_o";
      keep TIMERS_TF2_O_p.hdl_path()         == "timers_tf2_o";
      keep TIMERS_DFSEL_O_p.hdl_path()       == "timers_dfsel_o";
      keep TIMERS_EDGSEL_O_p.hdl_path()      == "timers_edgsel_o";
      keep TIMERS_DFP_O_p.hdl_path()         == "timers_dfp_o";

 
	};
};

'>
