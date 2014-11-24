<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_sig_h.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.core_fsm, diga19@emc08.core_fsm
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, phy - physical, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Interface to the functions used in core_fsm_sig.e
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
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

unit core_fsm_sig_u like core_fsm_phy_u {
   when CORE_FSM_IN core_fsm_sig_u {
      //extend in core_fsm_sig.e
   };

   when CORE_FSM_OUT core_fsm_sig_u {  
      //extend in core_fsm_sig.e
   };
};

'>
