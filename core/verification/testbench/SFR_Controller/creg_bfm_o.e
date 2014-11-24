<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_bfm_o.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 06/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, bfm - bus functional mode
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
// Include Files: creg_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_bfm_o_h;

extend creg_bfm_o_u {
   // create the instance of the output ports
   !RESET_p    		      : inout simple_port of bit ; 
   
   !FSM_WR_I_p      		   : inout simple_port of bit ; 
   !FSM_RD_I_p     		   : inout simple_port of bit ; 
   !FSM_BYTE_I_p		      : inout simple_port of bit ;
   !FSM_ADDR_I_p		      : inout simple_port of uint(bits:8) ;
   !FSM_DATA_I_p		      : inout simple_port of uint(bits:8);
   
   !EXT_ROM_RD_I_p         : inout simple_port of bit ;
   !EXT_RAM_RD_I_p         : inout simple_port of bit ;
   !EXT_RAM_WR_I_p         : inout simple_port of bit ;

   !ALU_CY_I_p	        	   : inout simple_port of bit ;
   !ALU_AC_I_p	        	   : inout simple_port of bit ;
   !ALU_OV_I_p	        	   : inout simple_port of bit ;
   
   !BUS_CONTROL_P0EN_I_p  	: inout simple_port of uint(bits:8);
   !BUS_CONTROL_P0_I_p     : inout simple_port of uint(bits:8);
   !BUS_CONTROL_P2EN_I_p  	: inout simple_port of uint(bits:8);
   !BUS_CONTROL_P2_I_p     : inout simple_port of uint(bits:8);
   !BUS_CONTROL_P3EN_6_I_p	: inout simple_port of bit ;
   !BUS_CONTROL_P3EN_7_I_p	: inout simple_port of bit ;
   !BUS_CONTROL_P3_6_I_p 	: inout simple_port of bit ;
   !BUS_CONTROL_P3_7_I_p	: inout simple_port of bit ;
   !BUS_CONTROL_P4_I_p		: inout simple_port of uint(bits:8);

   !INTERRUPT_IE0_I_p		: inout simple_port of bit ;
   !INTERRUPT_IE1_I_p      : inout simple_port of bit ;
   !INTERRUPT_TF0_I_p      : inout simple_port of bit ;
   !INTERRUPT_TF1_I_p      : inout simple_port of bit ;
   !INTERRUPT_TF2_I_p      : inout simple_port of bit ;
   !INTERRUPT_TXRXF_I_p    : inout simple_port of bit ;
   !INTERRUPT_CLEAR_I_p    : inout simple_port of bit ;
   
   !PORTS_P0_I_p           : inout simple_port of uint(bits:8);
   !PORTS_P1_I_p           : inout simple_port of uint(bits:8);
   !PORTS_P2_I_p           : inout simple_port of uint(bits:8);
   !PORTS_P3_I_p           : inout simple_port of uint(bits:8);
   
   !SERIAL_P3EN_0_I_p      : inout simple_port of bit ;
   !SERIAL_P3EN_1_I_p      : inout simple_port of bit ;
   !SERIAL_P3_0_I_p        : inout simple_port of bit ;
   !SERIAL_P3_1_I_p        : inout simple_port of bit ;
   !SERIAL_SBUF_RX_I_p     : inout simple_port of uint(bits:8);
   !SERIAL_RB8_I_p        	: inout simple_port of bit ;
   !SERIAL_TI_I_p       	: inout simple_port of bit ;
   !SERIAL_RI_I_p          : inout simple_port of bit ;

   !TIMERS_TH0_I_p         : inout simple_port of uint(bits:8);
   !TIMERS_TM0_I_p         : inout simple_port of uint(bits:8);
   !TIMERS_TL0_I_p         : inout simple_port of uint(bits:8);
   !TIMERS_TF0_I_p         : inout simple_port of bit ;
   !TIMERS_TH1_I_p         : inout simple_port of uint(bits:8);
   !TIMERS_TM1_I_p         : inout simple_port of uint(bits:8);
   !TIMERS_TL1_I_p         : inout simple_port of uint(bits:8);
   !TIMERS_TF1_I_p         : inout simple_port of bit ;
   !TIMERS_ACRH_I_p        : inout simple_port of uint(bits:8);
   !TIMERS_ACRM_I_p        : inout simple_port of uint(bits:8);
   !TIMERS_ACRL_I_p        : inout simple_port of uint(bits:8);
   !TIMERS_TACPH_I_p       : inout simple_port of uint(bits:2);
   !TIMERS_TACPL_I_p       : inout simple_port of uint(bits:8);
   !TIMERS_TF2_I_p         : inout simple_port of bit ;
   
   
   // output ports
   !FSM_DATA_O_p    		   : inout simple_port of uint(bits:8);
   !FSM_PSW_RS_O_p    	   : inout simple_port of uint(bits:2);
   
   !ALU_CY_O_p	        	   : inout simple_port of bit ;
   !ALU_AC_O_p	        	   : inout simple_port of bit ;
   !ALU_OV_O_p	        	   : inout simple_port of bit ;
   
   !BAUDRATE_SM0_O_p   	   : inout simple_port of bit ;
   !BAUDRATE_SM1_O_p   	   : inout simple_port of bit ;
   !BAUDRATE_SM2_O_p   	   : inout simple_port of bit ;
   !BAUDRATE_SMOD_O_p      : inout simple_port of bit ;
   !BAUDRATE_RS232_O_p     : inout simple_port of bit ;
   
   !BUS_CONTROL_P0_O_p     : inout simple_port of uint(bits:8);

   !INTERRUPT_IP_O_p		   : inout simple_port of uint(bits:7); 
   !INTERRUPT_IE_O_p       : inout simple_port of uint(bits:8); 
   !INTERRUPT_INT0_O_p 	   : inout simple_port of bit ;
   !INTERRUPT_INT1_O_p     : inout simple_port of bit ;
   !INTERRUPT_IT0_O_p 	   : inout simple_port of bit ;
   !INTERRUPT_IT1_O_p      : inout simple_port of bit ;
   !INTERRUPT_IE0_O_p	   : inout simple_port of bit ;
   !INTERRUPT_IE1_O_p      : inout simple_port of bit ;
   !INTERRUPT_RI_O_p 	   : inout simple_port of bit ;
   !INTERRUPT_TI_O_p       : inout simple_port of bit ;
   !INTERRUPT_TF0_O_p      : inout simple_port of bit ;
   !INTERRUPT_TF1_O_p      : inout simple_port of bit ;
   !INTERRUPT_TF2_O_p      : inout simple_port of bit ;
   !INTERRUPT_TXRXF_O_p    : inout simple_port of bit ;

   !PORTS_P0_O_p           : inout simple_port of uint(bits:8);
   !PORTS_P1_O_p           : inout simple_port of uint(bits:8);
   !PORTS_P2_O_p           : inout simple_port of uint(bits:8);
   !PORTS_P3_O_p           : inout simple_port of uint(bits:8);
   !PORTS_P4_O_p           : inout simple_port of uint(bits:8);
   !PORTS_P0EN_O_p         : inout simple_port of uint(bits:8);
   !PORTS_P1EN_O_p         : inout simple_port of uint(bits:8);
   !PORTS_P2EN_O_p         : inout simple_port of uint(bits:8);
   !PORTS_P3EN_O_p         : inout simple_port of uint(bits:8);
   
   
   !SERIAL_SM0_O_p      	: inout simple_port of bit ;
   !SERIAL_REN_O_p      	: inout simple_port of bit ;
   !SERIAL_P3_0_O_p        : inout simple_port of bit ;
   !SERIAL_SBUF_TX_O_p     : inout simple_port of uint(bits:8);
   !SERIAL_TB8_O_p        	: inout simple_port of bit ;
   !SERIAL_TI_O_p       	: inout simple_port of bit ;
   !SERIAL_RI_O_p          : inout simple_port of bit ;
   !SERIAL_TX_O_p          : inout simple_port of bit ;
   
   !TIMERS_TH0_O_p         : inout simple_port of uint(bits:8);
   !TIMERS_TM0_O_p         : inout simple_port of uint(bits:8);
   !TIMERS_TL0_O_p         : inout simple_port of uint(bits:8);
   !TIMERS_GATE_T0_O_p     : inout simple_port of bit ;
   !TIMERS_M1_T0_O_p       : inout simple_port of bit ;
   !TIMERS_M0_T0_O_p       : inout simple_port of bit ;
   !TIMERS_INT0_O_p        : inout simple_port of bit ;
   !TIMERS_INT1_O_p        : inout simple_port of bit ;
   !TIMERS_TR0_O_p         : inout simple_port of bit ;
   !TIMERS_TF0_O_p         : inout simple_port of bit ;
   !TIMERS_TH1_O_p         : inout simple_port of uint(bits:8);
   !TIMERS_TM1_O_p         : inout simple_port of uint(bits:8);
   !TIMERS_TL1_O_p         : inout simple_port of uint(bits:8);
   !TIMERS_GATE_T1_O_p     : inout simple_port of bit ;
   !TIMERS_M1_T1_O_p       : inout simple_port of bit ;
   !TIMERS_M0_T1_O_p       : inout simple_port of bit ;
   !TIMERS_TR1_O_p         : inout simple_port of bit ;
   !TIMERS_TF1_O_p         : inout simple_port of bit ;
   !TIMERS_TACPH_O_p       : inout simple_port of uint(bits:2) ; 
   !TIMERS_TACPL_O_p       : inout simple_port of uint(bits:8); 
   !TIMERS_TR2_O_p         : inout simple_port of bit ;
   !TIMERS_TF2_O_p         : inout simple_port of bit ;
   !TIMERS_DFSEL_O_p       : inout simple_port of bit ;
   !TIMERS_EDGSEL_O_p      : inout simple_port of bit ;
   !TIMERS_DFP_O_p         : inout simple_port of uint(bits:3) ; 
   
   drive_bus() @clock_e is only {
      
   };
};

'>
