<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_signal_type.e
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
// Keywords: core_top - core top module, phy - physical
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to aply to
// the DUT
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: post_generate()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

struct core_top_signal_type like any_sequence_item {
   
   reset_i:  bit ;
   inst_len: int;
   keep inst_len in [1..3];
   
   
   timers_th0_i:  uint(bits:8) ;
   timers_tm0_i:  uint(bits:8) ;
   timers_tl0_i:  uint(bits:8) ;
   timers_tf0_i:  bit ;
   timers_th1_i:  uint(bits:8) ;
   timers_tm1_i:  uint(bits:8) ;
   timers_tl1_i:  uint(bits:8) ;
   timers_tf1_i:  bit ;
   timers_acrh_i: uint(bits:8) ;
   timers_acrm_i: uint(bits:8) ;
   timers_acrl_i: uint(bits:8) ;
   
//   timers_tacph_i: uint(bits:8) ;
//   timers_tacpl_i: uint(bits:8) ;
   timers_tf2_i:  bit ;
   
   bus_ctrl_p0en_i:  uint(bits:8) ;
   bus_ctrl_p2en_i:  uint(bits:8) ;
   bus_ctrl_p3en_6_i:  bit ;
   bus_ctrl_p3en_7_i:  bit ;
   bus_ctrl_p2_i:  uint(bits:8) ;
   bus_ctrl_p3_6_i:  bit ;
   bus_ctrl_p3_7_i:  bit ;
   bus_ctrl_p4_i:  uint(bits:8) ;
   bus_ctrl_ea_b_i:  bit ;
   bus_ctrl_data_i:  uint(bits:8) ;
   
   interrupt_clear_i:  bit ;
   interrupt_tcon2_i:  uint(bits:2) ;
   interrupt_tcon_i:  uint(bits:4) ;
   interrupt_vect_i:  uint (bits:3) ;
   
   serial_p3en_0_i:  bit ;
   serial_p3en_1_i:  bit ;
   serial_p3_0_i:  bit ;
   serial_p3_1_i:  bit ;
   serial_sbuf_rx_i:  uint(bits:8) ;
   serial_rb8_i:  bit ;
   serial_ti_i:  bit ;
   serial_ri_i:  bit ;
   
   ///////////// INOUT /////////////////////////////
   ports_p0_i:  uint(bits:8) ;
   ports_p1_i:  uint(bits:8) ;
   ports_p2_i:  uint(bits:8) ;
   ports_p3_i:  uint(bits:8) ;
   bus_ctrl_p0_i:  uint(bits:8) ;
  
   // signal type
   pkt_kind: core_top_signal_type_kind_t;
   
  
   keep (pkt_kind != RESET) => reset_i == 1;

   
  keep (pkt_kind == RESET) => 
  (
   (timers_th0_i      == 0 ) and 
   (timers_tm0_i      == 0 ) and 
   (timers_tl0_i      == 0 ) and 
   (timers_tf0_i      == 0 ) and 
   (timers_th1_i      == 0 ) and 
   (timers_tm1_i      == 0 ) and 
   (timers_tl1_i      == 0 ) and 
   (timers_tf1_i      == 0 ) and 
   (timers_acrh_i     == 0 ) and 
   (timers_acrm_i     == 0 ) and 
   (timers_acrl_i     == 0 ) and 
//   (timers_tacph_i    == 0 ) and 
//   (timers_tacpl_i    == 0 ) and 
   (timers_tf2_i      == 0 ) and 
   (bus_ctrl_p0en_i   == 0 ) and 
   (bus_ctrl_p2en_i   == 0 ) and 
   (bus_ctrl_p3en_6_i == 0 ) and 
   (bus_ctrl_p3en_7_i == 0 ) and 
   (bus_ctrl_p2_i     == 0 ) and 
   (bus_ctrl_p3_6_i   == 0 ) and 
   (bus_ctrl_p3_7_i   == 0 ) and 
   (bus_ctrl_p4_i     == 0 ) and 
   (bus_ctrl_data_i   == 0 ) and 
   (interrupt_clear_i == 0 ) and 
   (interrupt_tcon2_i == 0 ) and 
   (interrupt_tcon_i  == 0 ) and 
   (interrupt_vect_i  == 0 ) and 
   (serial_p3en_0_i   == 0 ) and 
   (serial_p3en_1_i   == 0 ) and 
   (serial_p3_0_i     == 0 ) and 
   (serial_p3_1_i     == 0 ) and 
   (serial_sbuf_rx_i  == 0 ) and 
   (serial_rb8_i      == 0 ) and 
   (serial_ti_i       == 0 ) and 
   (serial_ri_i       == 0 ) and 
   (ports_p0_i        == 0 ) and 
   (ports_p1_i        == 0 ) and 
   (ports_p2_i        == 0 ) and 
   (ports_p3_i        == 0 ) and 
   (bus_ctrl_p0_i     == 0 )
  );
   
   
   
   //////////////////////  INSTRUCTION CM LENGHT ///////////// ADD HERE
   keep  (
          (pkt_kind == NOP     ) || 
          (pkt_kind == INC_ATR0) || 
          (pkt_kind == INC_ATR1) || 
          (pkt_kind == INC_R0  ) || 
          (pkt_kind == INC_R1  ) ||
          (pkt_kind == INC_R2  ) || 
          (pkt_kind == INC_R3  ) || 
          (pkt_kind == INC_R4  ) || 
          (pkt_kind == INC_R5  ) || 
          (pkt_kind == INC_R6  ) || 
          (pkt_kind == INC_R7  ) 
         ) 
         => (inst_len == 1);
   
   keep (
         (pkt_kind == AJMP_1     ) || 
         (pkt_kind == RR_A       ) || 
         (pkt_kind == INC_A      ) || 
         (pkt_kind == INC_D      ) || 
         (pkt_kind == AJMP_2     ) || 
         (pkt_kind == RET        ) || 
         (pkt_kind == ADD_A_DATA ) || 
         (pkt_kind == RETI       ) || 
         (pkt_kind == MOV_A_DATA ) || 
         (pkt_kind == MOV_D_DATA ) || 
         (pkt_kind == SJMP       ) || 
         (pkt_kind == SUBB_A_DATA) || 
         (pkt_kind == PUSH       ) || 
         (pkt_kind == POP        ) || 
         (pkt_kind == MOV_D_A    ) 
        ) 
         => (inst_len == 2);        
           
           
   keep  (
          (pkt_kind == LJMP       ) || 
          (pkt_kind == JBC        ) || 
          (pkt_kind == ACALL_1    ) || 
          (pkt_kind == LCALL      ) || 
          (pkt_kind == JB         ) || 
          (pkt_kind == JNB        ) || 
          (pkt_kind == MOV_ATR1_D ) 
         ) => (inst_len == 3);
  
   
   
   
    
   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
