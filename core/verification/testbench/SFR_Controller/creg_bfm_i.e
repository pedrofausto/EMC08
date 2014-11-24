<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_bfm_i.e
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
// Keywords: creg - registers controller, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: This unit will drive the interface signals of the router DUT. 
// It will get an instance of a packet it is to drive from the sequence driver
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus(), send_pkt()
// Include Files: creg_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_bfm_i_h;

extend creg_bfm_i_u {
   // instance the ports used in bfm in
     
   !RESET_p    			   : inout simple_port of bit ; 
   
   !FSM_WR_I_p      		   : inout simple_port of bit ; 
   !FSM_RD_I_p     		   : inout simple_port of bit ; 
   !FSM_BYTE_I_p		      : inout simple_port of bit ;
   !FSM_ADDR_I_p		      : inout simple_port of uint(bits:8);
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
   !FSM_PSW_RS_O_p         : inout simple_port of uint(bits:2);
   
   !ALU_CY_O_p	        	   : inout simple_port of bit ;
   !ALU_AC_O_p	        	   : inout simple_port of bit ;
   !ALU_OV_O_p	        	   : inout simple_port of bit ;
   
   !BAUDRATE_SM0_O_p   	   : inout simple_port of bit ;
   !BAUDRATE_SM1_O_p   	   : inout simple_port of bit ;
   !BAUDRATE_SM2_O_p   	   : inout simple_port of bit ;
   !BAUDRATE_SMOD_O_p  	   : inout simple_port of bit ;
   !BAUDRATE_RS232_O_p 	   : inout simple_port of bit ;
   
   !BUS_CONTROL_P0_O_p     : inout simple_port of uint(bits:8);
   
   !INTERRUPT_IP_O_p		   : inout simple_port of uint(bits:7); 
   !INTERRUPT_IE_O_p       : inout simple_port of uint(bits:8); 
   !INTERRUPT_INT0_O_p 	   : inout simple_port of bit ;
   !INTERRUPT_INT1_O_p     :   inout simple_port of bit ;
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
   
   !SERIAL_SM0_O_p         : inout simple_port of bit ;
   !SERIAL_REN_O_p         : inout simple_port of bit ;
   !SERIAL_P3_0_O_p        : inout simple_port of bit ;
   !SERIAL_SBUF_TX_O_p     : inout simple_port of uint(bits:8);
   !SERIAL_TB8_O_p         : inout simple_port of bit ;
   !SERIAL_TI_O_p          : inout simple_port of bit ;
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
   !TIMERS_TACPH_O_p       : inout simple_port of uint(bits:2); //output [1:0]
   !TIMERS_TACPL_O_p       : inout simple_port of uint(bits:8); 
   !TIMERS_TR2_O_p         : inout simple_port of bit ;
   !TIMERS_TF2_O_p         : inout simple_port of bit ;   
   !TIMERS_DFSEL_O_p       : inout simple_port of bit ;
   !TIMERS_EDGSEL_O_p      : inout simple_port of bit ;
   !TIMERS_DFP_O_p         : inout simple_port of uint(bits:3); //output [2:0]
   
   !temp_data: uint(bits:8);
   !temp_addr: uint(bits:8);
   
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: creg_signal_type;

      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each uint(bits:8)of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
  
   // function to send signal packets to the DUT
   send_pkt(in_pkt: creg_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences
   //wait [1]*cycle;
   wait delay (70);
   
     if (in_pkt.pkt_kind == SEQ_ACC_CORE || 
         in_pkt.pkt_kind == SEQ_B_CORE || 
         in_pkt.pkt_kind == SEQ_IP_CORE || 
         in_pkt.pkt_kind == SEQ_IE_CORE || 
         in_pkt.pkt_kind == SEQ_RX0_CORE || 
         in_pkt.pkt_kind == SEQ_RX1_CORE || 
         in_pkt.pkt_kind == SEQ_TX0_CORE || 
         in_pkt.pkt_kind == SEQ_TX1_CORE || 
         in_pkt.pkt_kind == SEQ_SMAP8_CORE || 
         in_pkt.pkt_kind == SEQ_DPH_CORE || 
         in_pkt.pkt_kind == SEQ_DPL_CORE || 
         in_pkt.pkt_kind == SEQ_SP_CORE || 
         in_pkt.pkt_kind == SEQ_TH0_CORE || 
         in_pkt.pkt_kind == SEQ_TH1_CORE || 
         in_pkt.pkt_kind == SEQ_TM0_CORE || 
         in_pkt.pkt_kind == SEQ_TM1_CORE || 
         in_pkt.pkt_kind == SEQ_TL0_CORE || 
         in_pkt.pkt_kind == SEQ_TL1_CORE ) {
   
   RESET_p$                =  in_pkt.reset;
   
   FSM_ADDR_I_p$           =  in_pkt.fsm_addr_i;
   temp_addr               =  in_pkt.fsm_addr_i;
   FSM_DATA_I_p$           =  in_pkt.fsm_data_i ;
   temp_data               =  in_pkt.fsm_data_i ;
   FSM_BYTE_I_p$           =  in_pkt.fsm_byte_b_i;
   FSM_WR_I_p$             =  in_pkt.fsm_wr_b_i;
   FSM_RD_I_p$     	      =  in_pkt.fsm_rd_b_i;
   
   EXT_ROM_RD_I_p$         =  in_pkt.ext_rom_rd_i;
   EXT_RAM_RD_I_p$         =  in_pkt.ext_ram_rd_i;
   EXT_RAM_WR_I_p$         =  in_pkt.ext_ram_wr_i;
   
   ALU_CY_I_p$	        	   =  in_pkt.alu_cy_i;
   ALU_AC_I_p$	        	   =  in_pkt.alu_ac_i;
   ALU_OV_I_p$	        	   =  in_pkt.alu_ov_i;
   
   BUS_CONTROL_P0EN_I_p$  	=  in_pkt.bus_control_p0en_i;
   BUS_CONTROL_P0_I_p$     =  in_pkt.bus_control_p0_i;
   BUS_CONTROL_P2EN_I_p$ 	=  in_pkt.bus_control_p2en_i;
   BUS_CONTROL_P2_I_p$     =  in_pkt.bus_control_p2_i;
   BUS_CONTROL_P3EN_6_I_p$	=  in_pkt.bus_control_p3en_6_i;
   BUS_CONTROL_P3EN_7_I_p$	=  in_pkt.bus_control_p3en_7_i;
   BUS_CONTROL_P3_6_I_p$ 	=  in_pkt.bus_control_p3_6_i;
   BUS_CONTROL_P3_7_I_p$   =  in_pkt.bus_control_p3_7_i;
   BUS_CONTROL_P4_I_p$		=  in_pkt.bus_control_p4_i;

   INTERRUPT_IE0_I_p$		=  in_pkt.interrupt_ie0_i;
   INTERRUPT_IE1_I_p$      =  in_pkt.interrupt_ie1_i;
   INTERRUPT_TF0_I_p$      =  in_pkt.interrupt_tf0_i;
   INTERRUPT_TF1_I_p$      =  in_pkt.interrupt_tf1_i;
   INTERRUPT_TF2_I_p$      =  in_pkt.interrupt_tf2_i;
   INTERRUPT_TXRXF_I_p$    =  in_pkt.interrupt_txrxf_i;
   INTERRUPT_CLEAR_I_p$    =  in_pkt.interrupt_clear_i;
   
   PORTS_P0_I_p$           =  in_pkt.ports_p0_i;
   PORTS_P1_I_p$           =  in_pkt.ports_p1_i;
   PORTS_P2_I_p$           =  in_pkt.ports_p2_i;
   PORTS_P3_I_p$           =  in_pkt.ports_p3_i;
   
   SERIAL_P3EN_0_I_p$      =  in_pkt.serial_p3en_0;
   SERIAL_P3EN_1_I_p$      =  in_pkt.serial_p3en_1;
   SERIAL_P3_0_I_p$        =  in_pkt.serial_p3_0;
   SERIAL_P3_1_I_p$        =  in_pkt.serial_p3_1;
   SERIAL_SBUF_RX_I_p$     =  in_pkt.serial_sbuf_rx;
   SERIAL_RB8_I_p$        	=  in_pkt.serial_rb8;
   SERIAL_TI_I_p$       	=  in_pkt.serial_ti;
   SERIAL_RI_I_p$          =  in_pkt.serial_ri;
   
   TIMERS_TH0_I_p$         =  in_pkt.timers_th0_i;
   TIMERS_TM0_I_p$         =  in_pkt.timers_tm0_i;
   TIMERS_TL0_I_p$         =  in_pkt.timers_tl0_i;
   TIMERS_TF0_I_p$         =  in_pkt.timers_tf0_i;
   TIMERS_TH1_I_p$         =  in_pkt.timers_th1_i;
   TIMERS_TM1_I_p$         =  in_pkt.timers_tm1_i;
   TIMERS_TL1_I_p$         =  in_pkt.timers_tl1_i;
   TIMERS_TF1_I_p$         =  in_pkt.timers_tf1_i;
   TIMERS_ACRH_I_p$        =  in_pkt.timers_acrh_i;
   TIMERS_ACRM_I_p$        =  in_pkt.timers_acrm_i;
   TIMERS_ACRL_I_p$        =  in_pkt.timers_acrl_i;
   TIMERS_TACPH_I_p$       =  in_pkt.timers_acrl_i;
   TIMERS_TACPL_I_p$       =  in_pkt.timers_acrl_i;
   TIMERS_TF2_I_p$         =  in_pkt.timers_tf2_i;
     
     wait cycle;
   
   FSM_ADDR_I_p$           =  temp_addr;
   FSM_DATA_I_p$           =  temp_data;
   FSM_WR_I_p$             =  1;
   FSM_RD_I_p$             =  0;
   
    EXT_ROM_RD_I_p$         =  in_pkt.ext_rom_rd_i;
   EXT_RAM_RD_I_p$         =  in_pkt.ext_ram_rd_i;
   EXT_RAM_WR_I_p$         =  in_pkt.ext_ram_wr_i;
   
   ALU_CY_I_p$             =  in_pkt.alu_cy_i;
   ALU_AC_I_p$             =  in_pkt.alu_ac_i;
   ALU_OV_I_p$             =  in_pkt.alu_ov_i;
   
   BUS_CONTROL_P0EN_I_p$   =  in_pkt.bus_control_p0en_i;
   BUS_CONTROL_P0_I_p$     =  in_pkt.bus_control_p0_i;
   BUS_CONTROL_P2EN_I_p$   =  in_pkt.bus_control_p2en_i;
   BUS_CONTROL_P2_I_p$     =  in_pkt.bus_control_p2_i;
   BUS_CONTROL_P3EN_6_I_p$ =  in_pkt.bus_control_p3en_6_i;
   BUS_CONTROL_P3EN_7_I_p$ =  in_pkt.bus_control_p3en_7_i;
   BUS_CONTROL_P3_6_I_p$   =  in_pkt.bus_control_p3_6_i;
   BUS_CONTROL_P3_7_I_p$   =  in_pkt.bus_control_p3_7_i;
   BUS_CONTROL_P4_I_p$     =  in_pkt.bus_control_p4_i;

   INTERRUPT_IE0_I_p$      =  in_pkt.interrupt_ie0_i;
   INTERRUPT_IE1_I_p$      =  in_pkt.interrupt_ie1_i;
   INTERRUPT_TF0_I_p$      =  in_pkt.interrupt_tf0_i;
   INTERRUPT_TF1_I_p$      =  in_pkt.interrupt_tf1_i;
   INTERRUPT_TF2_I_p$      =  in_pkt.interrupt_tf2_i;
   INTERRUPT_TXRXF_I_p$    =  in_pkt.interrupt_txrxf_i;
   INTERRUPT_CLEAR_I_p$    =  in_pkt.interrupt_clear_i;
   
   PORTS_P0_I_p$           =  in_pkt.ports_p0_i;
   PORTS_P1_I_p$           =  in_pkt.ports_p1_i;
   PORTS_P2_I_p$           =  in_pkt.ports_p2_i;
   PORTS_P3_I_p$           =  in_pkt.ports_p3_i;
   
   SERIAL_P3EN_0_I_p$      =  in_pkt.serial_p3en_0;
   SERIAL_P3EN_1_I_p$      =  in_pkt.serial_p3en_1;
   SERIAL_P3_0_I_p$        =  in_pkt.serial_p3_0;
   SERIAL_P3_1_I_p$        =  in_pkt.serial_p3_1;
   SERIAL_SBUF_RX_I_p$     =  in_pkt.serial_sbuf_rx;
   SERIAL_RB8_I_p$         =  in_pkt.serial_rb8;
   SERIAL_TI_I_p$          =  in_pkt.serial_ti;
   SERIAL_RI_I_p$          =  in_pkt.serial_ri;
   
   TIMERS_TH0_I_p$         =  in_pkt.timers_th0_i;
   TIMERS_TM0_I_p$         =  in_pkt.timers_tm0_i;
   TIMERS_TL0_I_p$         =  in_pkt.timers_tl0_i;
   TIMERS_TF0_I_p$         =  in_pkt.timers_tf0_i;
   TIMERS_TH1_I_p$         =  in_pkt.timers_th1_i;
   TIMERS_TM1_I_p$         =  in_pkt.timers_tm1_i;
   TIMERS_TL1_I_p$         =  in_pkt.timers_tl1_i;
   TIMERS_TF1_I_p$         =  in_pkt.timers_tf1_i;
   TIMERS_ACRH_I_p$        =  in_pkt.timers_acrh_i;
   TIMERS_ACRM_I_p$        =  in_pkt.timers_acrm_i;
   TIMERS_ACRL_I_p$        =  in_pkt.timers_acrl_i;
   TIMERS_TACPH_I_p$       =  in_pkt.timers_acrl_i;
   TIMERS_TACPL_I_p$       =  in_pkt.timers_acrl_i;
   TIMERS_TF2_I_p$         =  in_pkt.timers_tf2_i;
   
     wait cycle;
          
            };//EN DO IF    
         }; // end send pkt
     };
'>
