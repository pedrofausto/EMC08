<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_signal_type.e
// Module Name : Baud Rate
// Author : Inacio Mendonca & Eloi Magalhaes
// E-mail : inacioms@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, phy - physical
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

// signal type 
type serial_signal_type_kind: [RESET, NO_RESET, RECEP_M0, RECEP_M2, GEN_8B];
    
struct serial_signal_type like any_sequence_item
{
   
   p_reset       : bit          ;
   p_scon0_ri_i  : bit          ;
   p_scon1_ti_i  : bit          ;
   p_scon3_tb8   : bit          ;
   p_scon4_ren   : bit          ;
   p_scon7_mode  : bit          ;
   p_br_trans    : bit          ;
   p_br          : bit          ;
   p_serial_tx   : bit          ;
   p_p3_0_i      : bit          ;
   p_data_sbuf_i : uint(bits:8) ;
   p_data_sbuf_o : uint(bits:8) ;
   
   // signal type
   pkt_kind: serial_signal_type_kind;
   buffer_8      : uint(bits:8) ;
  
   // cycle machine start signal
   serial_start:bit;
  
   keep ( pkt_kind == RESET    ) => ( p_reset == 0 && p_scon0_ri_i == 0 && p_scon1_ti_i == 0 && p_scon3_tb8 == 0 && p_scon4_ren == 0 && p_scon7_mode == 0 && p_data_sbuf_i == 8'd0 );
   
   keep ( pkt_kind == NO_RESET ) => ( p_reset == 1 && p_scon0_ri_i == 0 && p_scon1_ti_i == 0 && p_scon3_tb8 == 0);
   
   keep ( pkt_kind == GEN_8B ) => ( p_scon7_mode == 0 && p_scon4_ren == 1 ) ;
   
 
  
   post_generate() is also 
   {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
