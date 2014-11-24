<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_agent.e
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
// Keywords: creg - registers controller, sig - signal map, mon - monitor
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
// Include Files: creg_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_agent_h;

extend creg_agent_u {
   connect_pointers() is also {    
      mon.RESET_p    			     = sig.RESET_p;
	  
      mon.FSM_WR_I_p      		     = sig.FSM_WR_I_p;
      mon.FSM_RD_I_p     		     = sig.FSM_RD_I_p;
      mon.FSM_BYTE_I_p 			     = sig.FSM_BYTE_I_p;
      mon.FSM_ADDR_I_p    		     = sig.FSM_ADDR_I_p;
      mon.FSM_DATA_I_p      	     = sig.FSM_DATA_I_p;
      
      mon.EXT_ROM_RD_I_p           = sig.EXT_ROM_RD_I_p;
      mon.EXT_RAM_RD_I_p           = sig.EXT_RAM_RD_I_p;
      mon.EXT_RAM_WR_I_p           = sig.EXT_RAM_WR_I_p;

      mon.ALU_CY_I_p    		     = sig.ALU_CY_I_p;
      mon.ALU_AC_I_p       		  = sig.ALU_AC_I_p;
      mon.ALU_OV_I_p 			     = sig.ALU_OV_I_p;

      mon.BUS_CONTROL_P0EN_I_p 	  = sig.BUS_CONTROL_P0EN_I_p;
      mon.BUS_CONTROL_P0_I_p       = sig.BUS_CONTROL_P0_I_p;
      mon.BUS_CONTROL_P2EN_I_p 	  = sig.BUS_CONTROL_P2EN_I_p;
      mon.BUS_CONTROL_P2_I_p       = sig.BUS_CONTROL_P2_I_p;
      mon.BUS_CONTROL_P3EN_6_I_p	  = sig.BUS_CONTROL_P3EN_6_I_p;
      mon.BUS_CONTROL_P3EN_7_I_p	  = sig.BUS_CONTROL_P3EN_7_I_p;
      mon.BUS_CONTROL_P3_6_I_p     = sig.BUS_CONTROL_P3_6_I_p;
      mon.BUS_CONTROL_P3_7_I_p     = sig.BUS_CONTROL_P3_7_I_p;
      mon.BUS_CONTROL_P4_I_p 	     = sig.BUS_CONTROL_P4_I_p;

      mon.INTERRUPT_IE0_I_p        = sig.INTERRUPT_IE0_I_p;
      mon.INTERRUPT_IE1_I_p 	     = sig.INTERRUPT_IE1_I_p;
      mon.INTERRUPT_TF0_I_p 	     = sig.INTERRUPT_TF0_I_p;
      mon.INTERRUPT_TF1_I_p    	  = sig.INTERRUPT_TF1_I_p;
      mon.INTERRUPT_TF2_I_p        = sig.INTERRUPT_TF2_I_p;
      mon.INTERRUPT_TXRXF_I_p 	  = sig.INTERRUPT_TXRXF_I_p;
      mon.INTERRUPT_CLEAR_I_p 	  = sig.INTERRUPT_CLEAR_I_p;
         
      mon.PORTS_P0_I_p             = sig.PORTS_P0_I_p;
      mon.PORTS_P1_I_p             = sig.PORTS_P1_I_p;
      mon.PORTS_P2_I_p             = sig.PORTS_P2_I_p;
      mon.PORTS_P3_I_p             = sig.PORTS_P3_I_p;
      
      mon.SERIAL_P3EN_0_I_p        = sig.SERIAL_P3EN_0_I_p;
      mon.SERIAL_P3EN_1_I_p 	     = sig.SERIAL_P3EN_1_I_p;
      mon.SERIAL_P3_0_I_p      	  = sig.SERIAL_P3_0_I_p;
      mon.SERIAL_P3_1_I_p     	  = sig.SERIAL_P3_1_I_p;
      mon.SERIAL_SBUF_RX_I_p 	     = sig.SERIAL_SBUF_RX_I_p;
      mon.SERIAL_RB8_I_p    	     = sig.SERIAL_RB8_I_p;
      mon.SERIAL_TI_I_p       	  = sig.SERIAL_TI_I_p;
      mon.SERIAL_RI_I_p 	        = sig.SERIAL_RI_I_p;
      
      mon.TIMERS_TH0_I_p           = sig.TIMERS_TH0_I_p;
      mon.TIMERS_TM0_I_p           = sig.TIMERS_TM0_I_p;
      mon.TIMERS_TL0_I_p           = sig.TIMERS_TL0_I_p;
      mon.TIMERS_TF0_I_p           = sig.TIMERS_TF0_I_p;
      mon.TIMERS_TH1_I_p           = sig.TIMERS_TH1_I_p;
      mon.TIMERS_TM1_I_p           = sig.TIMERS_TM1_I_p;
      mon.TIMERS_TL1_I_p           = sig.TIMERS_TL1_I_p;
      mon.TIMERS_TF1_I_p           = sig.TIMERS_TF1_I_p;
      mon.TIMERS_ACRH_I_p          = sig.TIMERS_ACRH_I_p;
      mon.TIMERS_ACRM_I_p          = sig.TIMERS_ACRM_I_p;
      mon.TIMERS_ACRL_I_p          = sig.TIMERS_ACRL_I_p;
      mon.TIMERS_TACPH_I_p         = sig.TIMERS_TACPH_I_p;
      mon.TIMERS_TACPL_I_p         = sig.TIMERS_TACPL_I_p;
      mon.TIMERS_TF2_I_p           = sig.TIMERS_TF2_I_p;
           
      mon.FSM_DATA_O_p    		     = sig.FSM_DATA_O_p;
      mon.FSM_PSW_RS_O_p    		  = sig.FSM_PSW_RS_O_p;
       
      mon.ALU_CY_O_p       		  = sig.ALU_CY_O_p;
      mon.ALU_AC_O_p 			     = sig.ALU_AC_O_p;
      mon.ALU_OV_O_p 			     = sig.ALU_OV_O_p; 
	  
      mon.BAUDRATE_SM0_O_p         = sig.BAUDRATE_SM0_O_p;
      mon.BAUDRATE_SM1_O_p 		  = sig.BAUDRATE_SM1_O_p;
      mon.BAUDRATE_SM2_O_p         = sig.BAUDRATE_SM2_O_p;
      mon.BAUDRATE_SMOD_O_p        = sig.BAUDRATE_SMOD_O_p;
      mon.BAUDRATE_RS232_O_p 		  = sig.BAUDRATE_RS232_O_p;
      
      mon.BUS_CONTROL_P0_O_p       = sig.BUS_CONTROL_P0_O_p;

   // output ports
      mon.INTERRUPT_IP_O_p    	  = sig.INTERRUPT_IP_O_p;
      mon.INTERRUPT_IE_O_p         = sig.INTERRUPT_IE_O_p;
      mon.INTERRUPT_INT0_O_p 	     = sig.INTERRUPT_INT0_O_p;
      mon.INTERRUPT_INT1_O_p       = sig.INTERRUPT_INT1_O_p;
      mon.INTERRUPT_IT0_O_p 	     = sig.INTERRUPT_IT0_O_p;
      mon.INTERRUPT_IT1_O_p        = sig.INTERRUPT_IT1_O_p;
      mon.INTERRUPT_IE0_O_p 	     = sig.INTERRUPT_IE0_O_p;
      mon.INTERRUPT_IE1_O_p 	     = sig.INTERRUPT_IE1_O_p; 
      mon.INTERRUPT_RI_O_p         = sig.INTERRUPT_RI_O_p;
      mon.INTERRUPT_TI_O_p 		  = sig.INTERRUPT_TI_O_p;
      mon.INTERRUPT_TF0_O_p        = sig.INTERRUPT_TF0_O_p;
      mon.INTERRUPT_TF1_O_p        = sig.INTERRUPT_TF1_O_p;
      mon.INTERRUPT_TF2_O_p 	     = sig.INTERRUPT_TF2_O_p;
      mon.INTERRUPT_TXRXF_O_p      = sig.INTERRUPT_TXRXF_O_p;
 
      mon.PORTS_P0_O_p             = sig.PORTS_P0_O_p;
      mon.PORTS_P1_O_p             = sig.PORTS_P1_O_p;
      mon.PORTS_P2_O_p             = sig.PORTS_P2_O_p;
      mon.PORTS_P3_O_p             = sig.PORTS_P3_O_p;
      mon.PORTS_P4_O_p             = sig.PORTS_P4_O_p;
      mon.PORTS_P0EN_O_p           = sig.PORTS_P0EN_O_p;
      mon.PORTS_P1EN_O_p           = sig.PORTS_P1EN_O_p;
      mon.PORTS_P2EN_O_p           = sig.PORTS_P2EN_O_p;
      mon.PORTS_P3EN_O_p           = sig.PORTS_P3EN_O_p;
      
      
      mon.SERIAL_SM0_O_p       	  = sig.SERIAL_SM0_O_p;
      mon.SERIAL_REN_O_p 		     = sig.SERIAL_REN_O_p;
      mon.SERIAL_P3_0_O_p          = sig.SERIAL_P3_0_O_p;
      mon.SERIAL_SBUF_TX_O_p       = sig.SERIAL_SBUF_TX_O_p;
      mon.SERIAL_TB8_O_p     	     = sig.SERIAL_TB8_O_p;
      mon.SERIAL_TI_O_p 		     = sig.SERIAL_TI_O_p;
      mon.SERIAL_RI_O_p    		  = sig.SERIAL_RI_O_p;
      mon.SERIAL_TX_O_p    		  = sig.SERIAL_TX_O_p;
     
    // In/out Ports signals 
     
      
      mon.TIMERS_TH0_O_p           = sig.TIMERS_TH0_O_p;
      mon.TIMERS_TM0_O_p           = sig.TIMERS_TM0_O_p;
      mon.TIMERS_TL0_O_p           = sig.TIMERS_TL0_O_p;
      mon.TIMERS_GATE_T0_O_p       = sig.TIMERS_GATE_T0_O_p;
      mon.TIMERS_M1_T0_O_p         = sig.TIMERS_M1_T0_O_p;
      mon.TIMERS_M0_T0_O_p         = sig.TIMERS_M0_T0_O_p;
      mon.TIMERS_INT0_O_p          = sig.TIMERS_INT0_O_p;
      mon.TIMERS_INT1_O_p          = sig.TIMERS_INT1_O_p;
      mon.TIMERS_TR0_O_p           = sig.TIMERS_TR0_O_p;
      mon.TIMERS_TF0_O_p           = sig.TIMERS_TF0_O_p;
      mon.TIMERS_TH1_O_p           = sig.TIMERS_TH1_O_p;
      mon.TIMERS_TM1_O_p           = sig.TIMERS_TM1_O_p;
      mon.TIMERS_TL1_O_p           = sig.TIMERS_TL1_O_p;
      mon.TIMERS_GATE_T1_O_p       = sig.TIMERS_GATE_T1_O_p;
      mon.TIMERS_M1_T1_O_p         = sig.TIMERS_M1_T1_O_p;
      mon.TIMERS_M0_T1_O_p         = sig.TIMERS_M0_T1_O_p;
      mon.TIMERS_TR1_O_p           = sig.TIMERS_TR1_O_p;
      mon.TIMERS_TF1_O_p           = sig.TIMERS_TF1_O_p;
      mon.TIMERS_TACPH_O_p         = sig.TIMERS_TACPH_O_p;
      mon.TIMERS_TACPL_O_p         = sig.TIMERS_TACPL_O_p;
      mon.TIMERS_TR2_O_p           = sig.TIMERS_TR2_O_p;
      mon.TIMERS_TF2_O_p           = sig.TIMERS_TF2_O_p;
      mon.TIMERS_DFSEL_O_p         = sig.TIMERS_DFSEL_O_p;
      mon.TIMERS_EDGSEL_O_p        = sig.TIMERS_EDGSEL_O_p;
      mon.TIMERS_DFP_O_p           = sig.TIMERS_DFP_O_p;
   };

   // when CREG_IN than map the signal between signal map and monitor
   when ACTIVE CREG_IN creg_agent_u {
      connect_pointers() is also {    

         bfm.RESET_p    			   = sig.RESET_p;
         
         bfm.FSM_WR_I_p      		   = sig.FSM_WR_I_p;
         bfm.FSM_RD_I_p     		   = sig.FSM_RD_I_p;
         bfm.FSM_BYTE_I_p 			   = sig.FSM_BYTE_I_p;
         bfm.FSM_ADDR_I_p    		   = sig.FSM_ADDR_I_p;
         bfm.FSM_DATA_I_p           = sig.FSM_DATA_I_p;
         
         bfm.EXT_ROM_RD_I_p         = sig.EXT_ROM_RD_I_p;
         bfm.EXT_RAM_RD_I_p         = sig.EXT_RAM_RD_I_p;
         bfm.EXT_RAM_WR_I_p         = sig.EXT_RAM_WR_I_p;
         
         bfm.ALU_CY_I_p    		   = sig.ALU_CY_I_p;
         bfm.ALU_AC_I_p       	   = sig.ALU_AC_I_p;
         bfm.ALU_OV_I_p 		      = sig.ALU_OV_I_p;
         
         bfm.BUS_CONTROL_P0EN_I_p 	= sig.BUS_CONTROL_P0EN_I_p;
         bfm.BUS_CONTROL_P0_I_p     = sig.BUS_CONTROL_P0_I_p;
         bfm.BUS_CONTROL_P2EN_I_p 	= sig.BUS_CONTROL_P2EN_I_p;
         bfm.BUS_CONTROL_P2_I_p     = sig.BUS_CONTROL_P2_I_p;
         bfm.BUS_CONTROL_P3EN_6_I_p	= sig.BUS_CONTROL_P3EN_6_I_p;
         bfm.BUS_CONTROL_P3EN_7_I_p	= sig.BUS_CONTROL_P3EN_7_I_p;
         bfm.BUS_CONTROL_P3_6_I_p  	= sig.BUS_CONTROL_P3_6_I_p;
         bfm.BUS_CONTROL_P3_7_I_p  	= sig.BUS_CONTROL_P3_7_I_p;
         bfm.BUS_CONTROL_P4_I_p 	   = sig.BUS_CONTROL_P4_I_p;

         bfm.INTERRUPT_IE0_I_p     	= sig.INTERRUPT_IE0_I_p;
         bfm.INTERRUPT_IE1_I_p 		= sig.INTERRUPT_IE1_I_p;
         bfm.INTERRUPT_TF0_I_p 		= sig.INTERRUPT_TF0_I_p;
         bfm.INTERRUPT_TF1_I_p    	= sig.INTERRUPT_TF1_I_p;
         bfm.INTERRUPT_TF2_I_p     	= sig.INTERRUPT_TF2_I_p;
         bfm.INTERRUPT_TXRXF_I_p 	= sig.INTERRUPT_TXRXF_I_p;
         bfm.INTERRUPT_CLEAR_I_p 	= sig.INTERRUPT_CLEAR_I_p; 
               
         bfm.PORTS_P0_I_p           = sig.PORTS_P0_I_p;
         bfm.PORTS_P1_I_p           = sig.PORTS_P1_I_p;
         bfm.PORTS_P2_I_p           = sig.PORTS_P2_I_p;
         bfm.PORTS_P3_I_p           = sig.PORTS_P3_I_p;
         
         bfm.SERIAL_P3EN_0_I_p     	= sig.SERIAL_P3EN_0_I_p;
         bfm.SERIAL_P3EN_1_I_p 		= sig.SERIAL_P3EN_1_I_p;
         bfm.SERIAL_P3_0_I_p      	= sig.SERIAL_P3_0_I_p;
         bfm.SERIAL_P3_1_I_p     	= sig.SERIAL_P3_1_I_p;
         bfm.SERIAL_SBUF_RX_I_p 	   = sig.SERIAL_SBUF_RX_I_p;
         bfm.SERIAL_RB8_I_p    		= sig.SERIAL_RB8_I_p;
         bfm.SERIAL_TI_I_p       	= sig.SERIAL_TI_I_p;
         bfm.SERIAL_RI_I_p 		   = sig.SERIAL_RI_I_p;
         
   
         bfm.TIMERS_TH0_I_p         = sig.TIMERS_TH0_I_p;
         bfm.TIMERS_TM0_I_p         = sig.TIMERS_TM0_I_p;
         bfm.TIMERS_TL0_I_p         = sig.TIMERS_TL0_I_p;
         bfm.TIMERS_TF0_I_p         = sig.TIMERS_TF0_I_p;
         bfm.TIMERS_TH1_I_p         = sig.TIMERS_TH1_I_p;
         bfm.TIMERS_TM1_I_p         = sig.TIMERS_TM1_I_p;
         bfm.TIMERS_TL1_I_p         = sig.TIMERS_TL1_I_p;
         bfm.TIMERS_TF1_I_p         = sig.TIMERS_TF1_I_p;
         bfm.TIMERS_ACRH_I_p        = sig.TIMERS_ACRH_I_p;
         bfm.TIMERS_ACRM_I_p        = sig.TIMERS_ACRM_I_p;
         bfm.TIMERS_ACRL_I_p        = sig.TIMERS_ACRL_I_p;
         bfm.TIMERS_TACPH_I_p       = sig.TIMERS_TACPH_I_p;
         bfm.TIMERS_TACPL_I_p       = sig.TIMERS_TACPL_I_p;
         bfm.TIMERS_TF2_I_p         = sig.TIMERS_TF2_I_p;

   // output ports  
         bfm.FSM_DATA_O_p    		   = sig.FSM_DATA_O_p;
         bfm.FSM_PSW_RS_O_p    		= sig.FSM_PSW_RS_O_p;
         
         bfm.ALU_CY_O_p       		= sig.ALU_CY_O_p;
         bfm.ALU_AC_O_p 			   = sig.ALU_AC_O_p;
         bfm.ALU_OV_O_p 			   = sig.ALU_OV_O_p; 
         
         bfm.BAUDRATE_SM0_O_p      	= sig.BAUDRATE_SM0_O_p;
         bfm.BAUDRATE_SM1_O_p 		= sig.BAUDRATE_SM1_O_p;
         bfm.BAUDRATE_SM2_O_p     	= sig.BAUDRATE_SM2_O_p;
         bfm.BAUDRATE_SMOD_O_p     	= sig.BAUDRATE_SMOD_O_p;
         bfm.BAUDRATE_RS232_O_p 	   = sig.BAUDRATE_RS232_O_p;
         
         bfm.BUS_CONTROL_P0_O_p     = sig.BUS_CONTROL_P0_O_p;
         
         bfm.INTERRUPT_IP_O_p    	= sig.INTERRUPT_IP_O_p;
         bfm.INTERRUPT_IE_O_p      	= sig.INTERRUPT_IE_O_p;
         bfm.INTERRUPT_INT0_O_p 	   = sig.INTERRUPT_INT0_O_p;
         bfm.INTERRUPT_INT1_O_p    	= sig.INTERRUPT_INT1_O_p;
         bfm.INTERRUPT_IT0_O_p 	   = sig.INTERRUPT_IT0_O_p;
         bfm.INTERRUPT_IT1_O_p    	= sig.INTERRUPT_IT1_O_p;
         bfm.INTERRUPT_IE0_O_p 		= sig.INTERRUPT_IE0_O_p;
         bfm.INTERRUPT_IE1_O_p 		= sig.INTERRUPT_IE1_O_p; 
         bfm.INTERRUPT_RI_O_p      	= sig.INTERRUPT_RI_O_p;
         bfm.INTERRUPT_TI_O_p 		= sig.INTERRUPT_TI_O_p;
         bfm.INTERRUPT_TF0_O_p     	= sig.INTERRUPT_TF0_O_p;
         bfm.INTERRUPT_TF1_O_p     	= sig.INTERRUPT_TF1_O_p;
         bfm.INTERRUPT_TF2_O_p 		= sig.INTERRUPT_TF2_O_p;
         bfm.INTERRUPT_TXRXF_O_p   	= sig.INTERRUPT_TXRXF_O_p;

         bfm.PORTS_P0_O_p           = sig.PORTS_P0_O_p;
         bfm.PORTS_P1_O_p           = sig.PORTS_P1_O_p;
         bfm.PORTS_P2_O_p           = sig.PORTS_P2_O_p;
         bfm.PORTS_P3_O_p           = sig.PORTS_P3_O_p;
         bfm.PORTS_P4_O_p           = sig.PORTS_P4_O_p;      
         bfm.PORTS_P0EN_O_p         = sig.PORTS_P0EN_O_p;
         bfm.PORTS_P1EN_O_p         = sig.PORTS_P1EN_O_p;
         bfm.PORTS_P2EN_O_p         = sig.PORTS_P2EN_O_p;
         bfm.PORTS_P3EN_O_p         = sig.PORTS_P3EN_O_p;
         
         bfm.SERIAL_SM0_O_p       	= sig.SERIAL_SM0_O_p;
         bfm.SERIAL_REN_O_p 		   = sig.SERIAL_REN_O_p;
         bfm.SERIAL_P3_0_O_p       	= sig.SERIAL_P3_0_O_p;
         bfm.SERIAL_SBUF_TX_O_p    	= sig.SERIAL_SBUF_TX_O_p;
         bfm.SERIAL_TB8_O_p     	   = sig.SERIAL_TB8_O_p;
         bfm.SERIAL_TI_O_p 		   = sig.SERIAL_TI_O_p;
         bfm.SERIAL_RI_O_p    		= sig.SERIAL_RI_O_p;
         bfm.SERIAL_TX_O_p    		= sig.SERIAL_TX_O_p;
         
         bfm.TIMERS_TH0_O_p         = sig.TIMERS_TH0_O_p;
         bfm.TIMERS_TM0_O_p         = sig.TIMERS_TM0_O_p;
         bfm.TIMERS_TL0_O_p         = sig.TIMERS_TL0_O_p;
         bfm.TIMERS_GATE_T0_O_p     = sig.TIMERS_GATE_T0_O_p;
         bfm.TIMERS_M1_T0_O_p       = sig.TIMERS_M1_T0_O_p;
         bfm.TIMERS_M0_T0_O_p       = sig.TIMERS_M0_T0_O_p; 
         bfm.TIMERS_TR0_O_p         = sig.TIMERS_TR0_O_p;
         bfm.TIMERS_TF0_O_p         = sig.TIMERS_TF0_O_p;
         bfm.TIMERS_TH1_O_p         = sig.TIMERS_TH1_O_p;
         bfm.TIMERS_TM1_O_p         = sig.TIMERS_TM1_O_p;
         bfm.TIMERS_TL1_O_p         = sig.TIMERS_TL1_O_p;
         bfm.TIMERS_GATE_T1_O_p     = sig.TIMERS_GATE_T1_O_p;
         bfm.TIMERS_M1_T1_O_p       = sig.TIMERS_M1_T1_O_p;
         bfm.TIMERS_M0_T1_O_p       = sig.TIMERS_M0_T1_O_p;
         bfm.TIMERS_INT0_O_p        = sig.TIMERS_INT0_O_p;
         bfm.TIMERS_TR1_O_p         = sig.TIMERS_TR1_O_p;
         bfm.TIMERS_TF1_O_p         = sig.TIMERS_TF1_O_p;
         bfm.TIMERS_INT1_O_p        = sig.TIMERS_INT1_O_p;
         bfm.TIMERS_TACPH_O_p       = sig.TIMERS_TACPH_O_p;
         bfm.TIMERS_TACPL_O_p       = sig.TIMERS_TACPL_O_p;
         bfm.TIMERS_TR2_O_p         = sig.TIMERS_TR2_O_p;
         bfm.TIMERS_TF2_O_p         = sig.TIMERS_TF2_O_p;
         bfm.TIMERS_DFSEL_O_p       = sig.TIMERS_DFSEL_O_p;
         bfm.TIMERS_EDGSEL_O_p      = sig.TIMERS_EDGSEL_O_p;
         bfm.TIMERS_DFP_O_p         = sig.TIMERS_DFP_O_p;
      };
  };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE CREG_OUT creg_agent_u {
      connect_pointers() is also {
           bfm.RESET_p              = sig.RESET_p;
         
         bfm.FSM_WR_I_p             = sig.FSM_WR_I_p;
         bfm.FSM_RD_I_p             = sig.FSM_RD_I_p;
         bfm.FSM_BYTE_I_p           = sig.FSM_BYTE_I_p;
         bfm.FSM_ADDR_I_p           = sig.FSM_ADDR_I_p;
         bfm.FSM_DATA_I_p           = sig.FSM_DATA_I_p;
         
         bfm.EXT_ROM_RD_I_p         = sig.EXT_ROM_RD_I_p;
         bfm.EXT_RAM_RD_I_p         = sig.EXT_RAM_RD_I_p;
         bfm.EXT_RAM_WR_I_p         = sig.EXT_RAM_WR_I_p;
         
         bfm.ALU_CY_I_p             = sig.ALU_CY_I_p;
         bfm.ALU_AC_I_p             = sig.ALU_AC_I_p;
         bfm.ALU_OV_I_p             = sig.ALU_OV_I_p;
         
         bfm.BUS_CONTROL_P0EN_I_p   = sig.BUS_CONTROL_P0EN_I_p;
         bfm.BUS_CONTROL_P0_I_p     = sig.BUS_CONTROL_P0_I_p;
         bfm.BUS_CONTROL_P2EN_I_p   = sig.BUS_CONTROL_P2EN_I_p;
         bfm.BUS_CONTROL_P2_I_p     = sig.BUS_CONTROL_P2_I_p;
         bfm.BUS_CONTROL_P3EN_6_I_p = sig.BUS_CONTROL_P3EN_6_I_p;
         bfm.BUS_CONTROL_P3EN_7_I_p = sig.BUS_CONTROL_P3EN_7_I_p;
         bfm.BUS_CONTROL_P3_6_I_p   = sig.BUS_CONTROL_P3_6_I_p;
         bfm.BUS_CONTROL_P3_7_I_p   = sig.BUS_CONTROL_P3_7_I_p;
         bfm.BUS_CONTROL_P4_I_p     = sig.BUS_CONTROL_P4_I_p;

         bfm.INTERRUPT_IE0_I_p      = sig.INTERRUPT_IE0_I_p;
         bfm.INTERRUPT_IE1_I_p      = sig.INTERRUPT_IE1_I_p;
         bfm.INTERRUPT_TF0_I_p      = sig.INTERRUPT_TF0_I_p;
         bfm.INTERRUPT_TF1_I_p      = sig.INTERRUPT_TF1_I_p;
         bfm.INTERRUPT_TF2_I_p      = sig.INTERRUPT_TF2_I_p;
         bfm.INTERRUPT_TXRXF_I_p    = sig.INTERRUPT_TXRXF_I_p;
         bfm.INTERRUPT_CLEAR_I_p    = sig.INTERRUPT_CLEAR_I_p; 
               
         bfm.PORTS_P0_I_p           = sig.PORTS_P0_I_p;
         bfm.PORTS_P1_I_p           = sig.PORTS_P1_I_p;
         bfm.PORTS_P2_I_p           = sig.PORTS_P2_I_p;
         bfm.PORTS_P3_I_p           = sig.PORTS_P3_I_p;
         
         bfm.SERIAL_P3EN_0_I_p      = sig.SERIAL_P3EN_0_I_p;
         bfm.SERIAL_P3EN_1_I_p      = sig.SERIAL_P3EN_1_I_p;
         bfm.SERIAL_P3_0_I_p        = sig.SERIAL_P3_0_I_p;
         bfm.SERIAL_P3_1_I_p        = sig.SERIAL_P3_1_I_p;
         bfm.SERIAL_SBUF_RX_I_p     = sig.SERIAL_SBUF_RX_I_p;
         bfm.SERIAL_RB8_I_p         = sig.SERIAL_RB8_I_p;
         bfm.SERIAL_TI_I_p          = sig.SERIAL_TI_I_p;
         bfm.SERIAL_RI_I_p          = sig.SERIAL_RI_I_p;
         
   
         bfm.TIMERS_TH0_I_p         = sig.TIMERS_TH0_I_p;
         bfm.TIMERS_TM0_I_p         = sig.TIMERS_TM0_I_p;
         bfm.TIMERS_TL0_I_p         = sig.TIMERS_TL0_I_p;
         bfm.TIMERS_TF0_I_p         = sig.TIMERS_TF0_I_p;
         bfm.TIMERS_TH1_I_p         = sig.TIMERS_TH1_I_p;
         bfm.TIMERS_TM1_I_p         = sig.TIMERS_TM1_I_p;
         bfm.TIMERS_TL1_I_p         = sig.TIMERS_TL1_I_p;
         bfm.TIMERS_TF1_I_p         = sig.TIMERS_TF1_I_p;
         bfm.TIMERS_ACRH_I_p        = sig.TIMERS_ACRH_I_p;
         bfm.TIMERS_ACRM_I_p        = sig.TIMERS_ACRM_I_p;
         bfm.TIMERS_ACRL_I_p        = sig.TIMERS_ACRL_I_p;
         bfm.TIMERS_TACPH_I_p       = sig.TIMERS_TACPH_I_p;
         bfm.TIMERS_TACPL_I_p       = sig.TIMERS_TACPL_I_p;
         bfm.TIMERS_TF2_I_p         = sig.TIMERS_TF2_I_p;

   // output ports  
         bfm.FSM_DATA_O_p           = sig.FSM_DATA_O_p;
         bfm.FSM_PSW_RS_O_p         = sig.FSM_PSW_RS_O_p;
         
         bfm.ALU_CY_O_p             = sig.ALU_CY_O_p;
         bfm.ALU_AC_O_p             = sig.ALU_AC_O_p;
         bfm.ALU_OV_O_p             = sig.ALU_OV_O_p; 
         
         bfm.BAUDRATE_SM0_O_p       = sig.BAUDRATE_SM0_O_p;
         bfm.BAUDRATE_SM1_O_p       = sig.BAUDRATE_SM1_O_p;
         bfm.BAUDRATE_SM2_O_p       = sig.BAUDRATE_SM2_O_p;
         bfm.BAUDRATE_SMOD_O_p      = sig.BAUDRATE_SMOD_O_p;
         bfm.BAUDRATE_RS232_O_p     = sig.BAUDRATE_RS232_O_p;
         
         bfm.BUS_CONTROL_P0_O_p     = sig.BUS_CONTROL_P0_O_p;
         
         bfm.INTERRUPT_IP_O_p       = sig.INTERRUPT_IP_O_p;
         bfm.INTERRUPT_IE_O_p       = sig.INTERRUPT_IE_O_p;
         bfm.INTERRUPT_INT0_O_p     = sig.INTERRUPT_INT0_O_p;
         bfm.INTERRUPT_INT1_O_p     = sig.INTERRUPT_INT1_O_p;
         bfm.INTERRUPT_IT0_O_p      = sig.INTERRUPT_IT0_O_p;
         bfm.INTERRUPT_IT1_O_p      = sig.INTERRUPT_IT1_O_p;
         bfm.INTERRUPT_IE0_O_p      = sig.INTERRUPT_IE0_O_p;
         bfm.INTERRUPT_IE1_O_p      = sig.INTERRUPT_IE1_O_p; 
         bfm.INTERRUPT_RI_O_p       = sig.INTERRUPT_RI_O_p;
         bfm.INTERRUPT_TI_O_p       = sig.INTERRUPT_TI_O_p;
         bfm.INTERRUPT_TF0_O_p      = sig.INTERRUPT_TF0_O_p;
         bfm.INTERRUPT_TF1_O_p      = sig.INTERRUPT_TF1_O_p;
         bfm.INTERRUPT_TF2_O_p      = sig.INTERRUPT_TF2_O_p;
         bfm.INTERRUPT_TXRXF_O_p    = sig.INTERRUPT_TXRXF_O_p;

         bfm.PORTS_P0_O_p           = sig.PORTS_P0_O_p;
         bfm.PORTS_P1_O_p           = sig.PORTS_P1_O_p;
         bfm.PORTS_P2_O_p           = sig.PORTS_P2_O_p;
         bfm.PORTS_P3_O_p           = sig.PORTS_P3_O_p;
         bfm.PORTS_P4_O_p           = sig.PORTS_P4_O_p;      
         bfm.PORTS_P0EN_O_p         = sig.PORTS_P0EN_O_p;
         bfm.PORTS_P1EN_O_p         = sig.PORTS_P1EN_O_p;
         bfm.PORTS_P2EN_O_p         = sig.PORTS_P2EN_O_p;
         bfm.PORTS_P3EN_O_p         = sig.PORTS_P3EN_O_p;
         
         bfm.SERIAL_SM0_O_p         = sig.SERIAL_SM0_O_p;
         bfm.SERIAL_REN_O_p         = sig.SERIAL_REN_O_p;
         bfm.SERIAL_P3_0_O_p        = sig.SERIAL_P3_0_O_p;
         bfm.SERIAL_SBUF_TX_O_p     = sig.SERIAL_SBUF_TX_O_p;
         bfm.SERIAL_TB8_O_p         = sig.SERIAL_TB8_O_p;
         bfm.SERIAL_TI_O_p          = sig.SERIAL_TI_O_p;
         bfm.SERIAL_RI_O_p          = sig.SERIAL_RI_O_p;
         bfm.SERIAL_TX_O_p          = sig.SERIAL_TX_O_p;
         
         bfm.TIMERS_TH0_O_p         = sig.TIMERS_TH0_O_p;
         bfm.TIMERS_TM0_O_p         = sig.TIMERS_TM0_O_p;
         bfm.TIMERS_TL0_O_p         = sig.TIMERS_TL0_O_p;
         bfm.TIMERS_GATE_T0_O_p     = sig.TIMERS_GATE_T0_O_p;
         bfm.TIMERS_M1_T0_O_p       = sig.TIMERS_M1_T0_O_p;
         bfm.TIMERS_M0_T0_O_p       = sig.TIMERS_M0_T0_O_p; 
         bfm.TIMERS_TR0_O_p         = sig.TIMERS_TR0_O_p;
         bfm.TIMERS_TF0_O_p         = sig.TIMERS_TF0_O_p;
         bfm.TIMERS_TH1_O_p         = sig.TIMERS_TH1_O_p;
         bfm.TIMERS_TM1_O_p         = sig.TIMERS_TM1_O_p;
         bfm.TIMERS_TL1_O_p         = sig.TIMERS_TL1_O_p;
         bfm.TIMERS_GATE_T1_O_p     = sig.TIMERS_GATE_T1_O_p;
         bfm.TIMERS_M1_T1_O_p       = sig.TIMERS_M1_T1_O_p;
         bfm.TIMERS_M0_T1_O_p       = sig.TIMERS_M0_T1_O_p;
         bfm.TIMERS_INT0_O_p        = sig.TIMERS_INT0_O_p;
         bfm.TIMERS_TR1_O_p         = sig.TIMERS_TR1_O_p;
         bfm.TIMERS_TF1_O_p         = sig.TIMERS_TF1_O_p;
         bfm.TIMERS_INT1_O_p        = sig.TIMERS_INT1_O_p;
         bfm.TIMERS_TACPH_O_p       = sig.TIMERS_TACPH_O_p;
         bfm.TIMERS_TACPL_O_p       = sig.TIMERS_TACPL_O_p;
         bfm.TIMERS_TR2_O_p         = sig.TIMERS_TR2_O_p;
         bfm.TIMERS_TF2_O_p         = sig.TIMERS_TF2_O_p;
         bfm.TIMERS_DFSEL_O_p       = sig.TIMERS_DFSEL_O_p;
         bfm.TIMERS_EDGSEL_O_p      = sig.TIMERS_EDGSEL_O_p;
         bfm.TIMERS_DFP_O_p         = sig.TIMERS_DFP_O_p;
      };
   };
};

'>
