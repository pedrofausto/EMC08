<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_mon.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 06/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      06-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, mon - monitor
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
// Local Functions: none
// Include Files: serial_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_mon_h;

extend serial_mon_u 
{

//----------------- instance the ports used in monitor -------------------------
   
  !p_reset       : inout simple_port of bit           ;
  !p_br          : inout simple_port of bit           ;
  !p_br_trans    : inout simple_port of bit           ;
  !p_scon0_ri_i  : inout simple_port of bit           ;
  !p_scon1_ti_i  : inout simple_port of bit           ;
  !p_scon3_tb8   : inout simple_port of bit           ;
  !p_scon4_ren   : inout simple_port of bit           ;
  !p_scon7_mode  : inout simple_port of bit           ;
  !p_serial_tx   : inout simple_port of bit           ;
  !p_p3_0_i      : inout simple_port of bit           ;
  !p_data_sbuf_i : inout simple_port of uint(bits:8)  ;
   
  !p_p3en_0      : inout simple_port of bit           ;
  !p_p3en_1      : inout simple_port of bit           ;
  !p_p3_0_o      : inout simple_port of bit           ;
  !p_p3_1_o      : inout simple_port of bit           ;
  !p_scon0_ri_o  : inout simple_port of bit           ;
  !p_scon1_ti_o  : inout simple_port of bit           ;
  !p_scon3_rb8   : inout simple_port of bit           ;
  !p_data_sbuf_o : inout simple_port of uint(bits:8)  ;
  !p_clear_count : inout simple_port of bit           ;
  

//------------------ events to control the reset state -------------------------
   
   
   event reset_rise is (rise(p_reset$)@sim)            ; // not reset
   event reset_fall is (fall(p_reset$)@sim)            ; // reset is active

   event scon_ri_o_fall is (fall(p_scon0_ri_i$)@sim)   ;
   event scon_ri_o_rise is (rise(p_scon0_ri_o$)@sim)   ;
   
   event scon_ti_o_fall is (fall(p_scon1_ti_i$)@sim)   ;
   event scon_ti_o_rise is (rise(p_scon1_ti_o$)@sim)   ;
   
   event serial_set_rise is (rise(p_scon4_ren$)@sim)   ;
   event serial_unset_fall is (fall(p_scon4_ren$)@sim) ;
   
   event bit_set_rise is (rise(p_scon3_tb8$)@sim)      ;
   event bit_unset_fall is (fall(p_scon3_tb8$)@sim)    ;

   event scon_sm0_fall is (fall(p_scon7_mode$)@sim)    ;
   event scon_sm2_rise is (rise(p_scon7_mode$)@sim)    ;
   
   
   
   
   
   
   
   
//   event scon_mode2_recep is (
//                               rise(p_SERIAL_SCON5_SM2_i)@sim and 
//                               fall(p_SERIAL_SCON2_RB8_i)@sim and 
//                               rise(scon4_ren)@sim and
//                             ) ; //
   
   // event that wait for a sm0 rise and a smod rise
//   event sm0_rise_smod_rise is (rise(SM0_p$)@sim and rise(SMOD_p$)@sim);
  
   // event that wait for a sm0 rise and a smod fall
//   event sm0_rise_smod_fall is (rise(SM0_p$)@sim and fall(SMOD_p$)@sim);
  
   // event that see the rise fall of sm0
//   event sm0_fall is (fall(SM0_p$)@sim);
  
   // event to SERIAL_START rise
//   event serial_start_rise is rise(CM_START_p$)@sim;
  
   watch_bus() @clock_e is also
   {
     while TRUE
      {

//-------------- calls the reference model to check the DUT --------------------
        
        reference_model();
          
//--------------------- the monitor detected a packet --------------------------
        
        emit pkt_detected_e;
      }; 
   };
      
   when SERIAL_IN serial_mon_u
   {

//------------------ event hit_rise is rise(reset_p$)@sim; ---------------------
   
   };
   
   when SERIAL_OUT serial_mon_u
   {
   
   };
   
// OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e 
   {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
};

'>