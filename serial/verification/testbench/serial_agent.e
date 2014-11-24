<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_agent.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, sig - signal map, mon - monitor
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
// Include Files: serial_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_agent_h;

extend serial_agent_u {
   connect_pointers() is also 
   {    
    
         mon.p_reset       = sig.p_reset       ;
         mon.p_br_trans    = sig.p_br_trans    ;
         mon.p_br          = sig.p_br          ;
         mon.p_scon0_ri_i  = sig.p_scon0_ri_i  ;
         mon.p_scon1_ti_i  = sig.p_scon1_ti_i  ;
         mon.p_scon3_tb8   = sig.p_scon3_tb8   ;
         mon.p_scon4_ren   = sig.p_scon4_ren   ;
         mon.p_scon7_mode  = sig.p_scon7_mode  ;
         mon.p_serial_tx   = sig.p_serial_tx   ;
         mon.p_p3_0_i      = sig.p_p3_0_i      ;
         mon.p_data_sbuf_i = sig.p_data_sbuf_i ;
         
         mon.p_p3en_0      = sig.p_p3en_0      ;
         mon.p_p3en_1      = sig.p_p3en_1      ;
         mon.p_p3_0_o      = sig.p_p3_0_o      ;
         mon.p_p3_1_o      = sig.p_p3_1_o      ;
         mon.p_scon0_ri_o  = sig.p_scon0_ri_o  ;
         mon.p_scon1_ti_o  = sig.p_scon1_ti_o  ;
         mon.p_scon3_rb8   = sig.p_scon3_rb8   ;
         mon.p_data_sbuf_o = sig.p_data_sbuf_o ;
         mon.p_clear_count = sig.p_clear_count ;
   
   };

   // when SERIAL_IN than map the signal between signal map and monitor
   when ACTIVE SERIAL_IN serial_agent_u 
   {
      connect_pointers() is also 
      {    
      
         bfm.p_reset       = sig.p_reset       ;
         bfm.p_br          = sig.p_br          ;
         bfm.p_br_trans    = sig.p_br_trans    ;
         bfm.p_scon0_ri_i  = sig.p_scon0_ri_i  ;
         bfm.p_scon1_ti_i  = sig.p_scon1_ti_i  ;
         bfm.p_scon3_tb8   = sig.p_scon3_tb8   ;
         bfm.p_scon4_ren   = sig.p_scon4_ren   ;
         bfm.p_scon7_mode  = sig.p_scon7_mode  ;
         bfm.p_serial_tx   = sig.p_serial_tx   ;
         bfm.p_p3_0_i      = sig.p_p3_0_i      ;
         bfm.p_data_sbuf_i = sig.p_data_sbuf_i ;
         
         bfm.p_p3en_0      = sig.p_p3en_0      ;
         bfm.p_p3en_1      = sig.p_p3en_1      ;
         bfm.p_p3_0_o      = sig.p_p3_0_o      ;
         bfm.p_p3_1_o      = sig.p_p3_1_o      ;
         bfm.p_scon0_ri_o  = sig.p_scon0_ri_o  ;
         bfm.p_scon1_ti_o  = sig.p_scon1_ti_o  ;
         bfm.p_scon3_rb8   = sig.p_scon3_rb8   ;
         bfm.p_data_sbuf_o = sig.p_data_sbuf_o ;
         bfm.p_clear_count = sig.p_clear_count ;
      
      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   
   when ACTIVE SERIAL_OUT serial_agent_u 
   {
      connect_pointers() is also 
      {
      
         bfm.p_reset       = sig.p_reset       ;
         bfm.p_br          = sig.p_br          ;
         bfm.p_br_trans    = sig.p_br_trans    ;
         bfm.p_scon0_ri_i  = sig.p_scon0_ri_i  ;
         bfm.p_scon1_ti_i  = sig.p_scon1_ti_i  ;
         bfm.p_scon3_tb8   = sig.p_scon3_tb8   ;
         bfm.p_scon4_ren   = sig.p_scon4_ren   ;
         bfm.p_scon7_mode  = sig.p_scon7_mode  ;
         bfm.p_serial_tx   = sig.p_serial_tx   ;
         bfm.p_p3_0_i      = sig.p_p3_0_i      ;
         bfm.p_data_sbuf_i = sig.p_data_sbuf_i ;
         
         bfm.p_p3en_0      = sig.p_p3en_0      ;
         bfm.p_p3en_1      = sig.p_p3en_1      ;
         bfm.p_p3_0_o      = sig.p_p3_0_o      ;
         bfm.p_p3_1_o      = sig.p_p3_1_o      ;
         bfm.p_scon0_ri_o  = sig.p_scon0_ri_o  ;
         bfm.p_scon1_ti_o  = sig.p_scon1_ti_o  ;
         bfm.p_scon3_rb8   = sig.p_scon3_rb8   ;
         bfm.p_data_sbuf_o = sig.p_data_sbuf_o ;
         bfm.p_clear_count = sig.p_clear_count ;
      
      };
   };
};

'>
