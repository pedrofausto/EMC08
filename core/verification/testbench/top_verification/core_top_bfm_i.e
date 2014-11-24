<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_bfm_i.e
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
// Include Files: core_top_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_bfm_i_h;

extend core_top_bfm_i_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   !p_core_reset_i: inout simple_port of bit ;
   !p_core_fsm_opcode: inout simple_port of uint(bits:8) ;
   !p_core_pc: inout simple_port of uint(bits:16) ;
   
   !p_core_timers_th0_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tm0_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tl0_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tf0_i: inout simple_port of bit ;
   !p_core_timers_th1_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tm1_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tl1_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tf1_i: inout simple_port of bit ;
   !p_core_timers_acrh_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_acrm_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_acrl_i: inout simple_port of uint(bits:8) ;
   
//   !core_timers_tacph_i: inout simple_port of uint(bits:2) ;
//   !core_timers_tacpl_i: inout simple_port of uint(bits:8) ;
   !p_core_timers_tf2_i: inout simple_port of bit ;
   
   !p_core_bus_ctrl_p0en_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p2en_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p3en_6_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p3en_7_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p2_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p3_6_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p3_7_i: inout simple_port of bit ;
   !p_core_bus_ctrl_p4_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_ea_b_i: inout simple_port of bit ;
   !p_core_bus_ctrl_data_i: inout simple_port of uint(bits:8) ;
   
   !p_core_interrupt_clear_i: inout simple_port of bit ;
   !p_core_interrupt_tcon2_i: inout simple_port of uint(bits:2) ;
   !p_core_interrupt_tcon_i: inout simple_port of uint(bits:4) ;
   !p_core_interrupt_vect_i: inout simple_port of uint (bits:3) ;
   
   !p_core_serial_p3en_0_i: inout simple_port of bit ;
   !p_core_serial_p3en_1_i: inout simple_port of bit ;
   !p_core_serial_p3_0_i: inout simple_port of bit ;
   !p_core_serial_p3_1_i: inout simple_port of bit ;
   !p_core_serial_sbuf_rx_i: inout simple_port of uint(bits:8) ;
   !p_core_serial_rb8_i: inout simple_port of bit ;
   !p_core_serial_ti_i: inout simple_port of bit ;
   !p_core_serial_ri_i: inout simple_port of bit ;
   
   ///////////// INOUT /////////////////////////////
   !p_core_ports_p0_i: inout simple_port of uint(bits:8) ;
   !p_core_ports_p1_i: inout simple_port of uint(bits:8) ;
   !p_core_ports_p2_i: inout simple_port of uint(bits:8) ;
   !p_core_ports_p3_i: inout simple_port of uint(bits:8) ;
   !p_core_bus_ctrl_p0_i: inout simple_port of uint(bits:8) ;
   
   count_ea: int;
   ea_flag: bool;
   keep soft ea_flag == FALSE;
   keep soft count_ea == 0;
        
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: core_top_signal_type;

      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
  
   // function to send signal packets to the DUT
   send_pkt(in_pkt: core_top_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences
      var period: int = 50;
      
      if (in_pkt.pkt_kind == RESET) {
         out("Reseting the system");
         p_core_reset_i$    = 1;
         wait [1] * cycle;
         p_core_reset_i$    = 0;
         wait [4] * cycle;
         p_core_reset_i$      = 1;
      };
      
      wait delay (1);
      //p_core_reset_i$                      = in_pkt.reset_i;
      p_core_timers_th0_i$                 = in_pkt.timers_th0_i;
      p_core_timers_tm0_i$                 = in_pkt.timers_tm0_i;
      p_core_timers_tl0_i$                 = in_pkt.timers_tl0_i;
      p_core_timers_tf0_i$                 = in_pkt.timers_tf0_i ;
      p_core_timers_th1_i$                 = in_pkt.timers_th1_i;
      p_core_timers_tm1_i$                 = in_pkt.timers_tm1_i; 
      p_core_timers_tl1_i$                 = in_pkt.timers_tl1_i; 
      p_core_timers_tf1_i$                 = in_pkt.timers_tf1_i;  
      p_core_timers_acrh_i$                = in_pkt.timers_acrh_i;
      p_core_timers_acrm_i$                = in_pkt.timers_acrm_i;  
      p_core_timers_acrl_i$                = in_pkt.timers_acrl_i;     
      
//      core_timers_tacph_i$                = in_pkt.timers_tacph_i;  
//      core_timers_tacpl_i$                = in_pkt.timers_tacpl_i;  
      
      p_core_timers_tf2_i$                 = in_pkt.timers_tf2_i;  
      
      p_core_bus_ctrl_p0en_i$              = in_pkt.bus_ctrl_p0en_i;  
      p_core_bus_ctrl_p2en_i$              = in_pkt.bus_ctrl_p2en_i;  
      p_core_bus_ctrl_p3en_6_i$            = in_pkt.bus_ctrl_p3en_6_i;  
      p_core_bus_ctrl_p3en_7_i$            = in_pkt.bus_ctrl_p3en_7_i;  
      p_core_bus_ctrl_p2_i$                = in_pkt.bus_ctrl_p2_i;  
      p_core_bus_ctrl_p3_6_i$              = in_pkt.bus_ctrl_p3_6_i;  
      p_core_bus_ctrl_p3_7_i$              = in_pkt.bus_ctrl_p3_7_i;  
      p_core_bus_ctrl_p4_i$                = in_pkt.bus_ctrl_p4_i;  
      p_core_bus_ctrl_ea_b_i$              = in_pkt.bus_ctrl_ea_b_i;  
      p_core_bus_ctrl_data_i$              = in_pkt.bus_ctrl_data_i;  
      
      p_core_interrupt_clear_i$            = in_pkt.interrupt_clear_i;  
      p_core_interrupt_tcon2_i$            = in_pkt.interrupt_tcon2_i; 
      p_core_interrupt_tcon_i$             = in_pkt.interrupt_tcon_i; 
      p_core_interrupt_vect_i$             = in_pkt.interrupt_vect_i; 
      
      p_core_serial_p3en_0_i$              = in_pkt.serial_p3en_0_i;  
      p_core_serial_p3en_1_i$              = in_pkt.serial_p3en_1_i;  
      p_core_serial_p3_0_i$                = in_pkt.serial_p3_0_i;  
      p_core_serial_p3_1_i$                = in_pkt.serial_p3_1_i;  
      p_core_serial_sbuf_rx_i$             = in_pkt.serial_sbuf_rx_i;  
      p_core_serial_rb8_i$                 = in_pkt.serial_rb8_i;  
      p_core_serial_ti_i$                  = in_pkt.serial_ti_i;  
      p_core_serial_ri_i$                  = in_pkt.serial_ri_i;  
      
      ///////////// INOUT /////////////////////////////
      p_core_ports_p0_i$                  = in_pkt.ports_p0_i;  
      p_core_ports_p1_i$                  = in_pkt.ports_p1_i;  
      p_core_ports_p2_i$                  = in_pkt.ports_p2_i;  
      p_core_ports_p3_i$                  = in_pkt.ports_p3_i;  
      p_core_bus_ctrl_p0_i$               = in_pkt.bus_ctrl_p0_i;    
      
      // creating interrupt vect condition
      if (sys.vect_opcodes[sys.ind] == INC_A) {
         p_core_interrupt_vect_i$ = 3'd1;
      };
      
      // creating ea_b set condition
      if (sys.vect_opcodes[sys.ind] == MOV_R4_DATA) {
         p_core_bus_ctrl_ea_b_i$ = 1'b0;
         ea_flag = TRUE;
         count_ea = 6;
      };
      if (ea_flag == TRUE and count_ea > 0) {
         count_ea = count_ea - 1;
         if (count_ea > 0) { p_core_bus_ctrl_ea_b_i$ = 1'b0; };
      } else if (ea_flag == TRUE and count_ea == 0) {
         ea_flag = FALSE;
         wait [1]*cycle;
      };
      if (ea_flag == TRUE) {
         message(LOW, "EA FLAG ***********");
         case count_ea {
            5: { 
                 p_core_bus_ctrl_data_i$ = 8'h8C;  //MOV_D_R4
                 wait [1]*cycle;
                 p_core_bus_ctrl_data_i$ = 8'hF0;  //SFR_B
                 wait [1]*cycle;
               }; 
            4: { 
                 p_core_bus_ctrl_data_i$ = 8'hEC;  //MOV_A_R4
                 wait [2]*cycle;
               }; 
            3: { 
                 p_core_bus_ctrl_data_i$ = 8'hA4;  //MUL_AB
                 wait [4]*cycle;  
               }; 
            2: { 
                 p_core_bus_ctrl_data_i$ = 8'hF5;  //MOV_D_A
                 wait [1]*cycle;
                 p_core_bus_ctrl_data_i$ = 8'h90;  //SFR_P1
                 wait [1]*cycle;
               }; 
            1: { 
                 p_core_bus_ctrl_data_i$ = 8'h85;  //MOV_D_D
                 wait [1]*cycle;
                 p_core_bus_ctrl_data_i$ = 8'hF0;  //SFR_B
                 wait delay (0.5*period);
                 p_core_bus_ctrl_data_i$ = 8'h90;  //SFR_P1
                 wait delay (0.5*period);
               }; 
         };
      } else {

      wait [2]*cycle;
      
      case (sys.vect_opcodes[sys.ind].as_a(instruction_set_t)) {
            [LCALL, RET, RETI, MOVC_A_ATPC, MOVX_A_ATDPTR, MUL_AB]: 
         { wait [2]*cycle; };
      }; 
      
      // when ending internal rom, setting external rom for jmp to begin
      if (p_core_pc$ == 16'h0FFF) {
         for i from 1 to 5 {
            message(LOW, "-----------> ExtROM: INC_R0 , ind: ", sys.ind);
            p_core_bus_ctrl_data_i$ = 8'h08;  //INC_R0
            wait [2]*cycle;
         };
         sys.ind = 7;
         message(LOW, "-----------> ExtROM: LJMP , ind: ", sys.ind);
         p_core_bus_ctrl_data_i$ = 8'h02;  //LJMP
         wait [1]*cycle;
         p_core_bus_ctrl_data_i$ = 8'h00;  //PC high
         wait delay (0.5*period);
         p_core_bus_ctrl_data_i$ = 8'd12;  //PC low
         wait delay (0.5*period);
         message(LOW, "-----------> ExtROM: end , ind: ", sys.ind);
         
      };
   };
      
   }; //end send_pkt
};

'>
