<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_bfm_o.e
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
// Keywords: br - baud rate, bfm - bus functional mode
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
// Include Files: serial_bfm_o_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_bfm_o_h;

extend serial_bfm_o_u
{
   // create the instance of the output ports

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
     
   drive_bus() @clock_e is only 
   {
      
   };
};

'>
