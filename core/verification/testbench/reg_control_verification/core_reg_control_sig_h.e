<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_sig_h.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.core_reg_control, diga19@emc08.core_reg_control
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control, phy - physical, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Interface to the functions used in core_reg_control_sig.e
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

unit core_reg_control_sig_u like core_reg_control_phy_u {
   when CORE_REG_CONTROL_IN core_reg_control_sig_u {
      //extend in core_reg_control_sig.e
   };

   when CORE_REG_CONTROL_OUT core_reg_control_sig_u {  
      //extend in core_reg_control_sig.e
   };
};

'>
