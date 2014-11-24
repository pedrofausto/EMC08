<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_agent.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt, sig - signal map, mon - monitor
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
// Include Files: int_agent_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_agent_h;

extend int_agent_u {
   connect_pointers() is also {    
      mon.RESET_i_p     = sig.RESET_i_p;
      mon.INT_EXT_p     = sig.INT_EXT_p;
      mon.INT_RDY_p     = sig.INT_RDY_p;
      mon.INT_NA_i_p    = sig.INT_NA_i_p;
      mon.INT_CM_i_p    = sig.INT_CM_i_p;
      mon.REG_IE_i_p    = sig.REG_IE_i_p;
      mon.REG_IP_i_p    = sig.REG_IP_i_p;
      mon.REG_SCON_i_p  = sig.REG_SCON_i_p;
      mon.REG_TCON_i_p  = sig.REG_TCON_i_p;
      mon.REG_TCON2_i_p = sig.REG_TCON2_i_p;
      mon.INT_VECT_o_p  = sig.INT_VECT_o_p;
      mon.REG_TCON_o_p  = sig.REG_TCON_o_p;
      mon.REG_TCON2_o_p = sig.REG_TCON2_o_p;
      mon.REG_CLR_o_p   = sig.REG_CLR_o_p;
      
      mon.FLAG_IE0_p    = sig.FLAG_IE0_p;
      mon.FLAG_TF0_p    = sig.FLAG_TF0_p;
      mon.FLAG_IE1_p    = sig.FLAG_IE1_p;
      mon.FLAG_TF1_p    = sig.FLAG_TF1_p;
      mon.FLAG_TF2_p    = sig.FLAG_TF2_p;
      mon.FLAG_RI_TI_p  = sig.FLAG_RI_TI_p;
      mon.FLAG_TXRX_p   = sig.FLAG_TXRX_p;
      
      
   };

   // when INT_IN than map the signal between signal map and monitor
   when ACTIVE INT_IN int_agent_u {
      connect_pointers() is also {    
         bfm.RESET_i_p     = sig.RESET_i_p;
         bfm.INT_EXT_p     = sig.INT_EXT_p;
         bfm.INT_RDY_p     = sig.INT_RDY_p;
         bfm.INT_NA_i_p    = sig.INT_NA_i_p;
         bfm.INT_CM_i_p    = sig.INT_CM_i_p;
         bfm.REG_IE_i_p    = sig.REG_IE_i_p;
         bfm.REG_IP_i_p    = sig.REG_IP_i_p;
         bfm.REG_SCON_i_p  = sig.REG_SCON_i_p;
         bfm.REG_TCON_i_p  = sig.REG_TCON_i_p;
         bfm.REG_TCON2_i_p = sig.REG_TCON2_i_p;

      };
   };

   // when there are OUTPUT signals to the DUT, then only these ports are used
   when ACTIVE INT_OUT int_agent_u {
      connect_pointers() is also {

      
      };
   };
};

'>
