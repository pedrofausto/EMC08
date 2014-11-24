<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_sig_h.e
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
// Keywords: creg - registers controller, phy - physical, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Interface to the functions used in creg_sig.e
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

unit creg_sig_u like creg_phy_u {
   when CREG_IN creg_sig_u {
      //extend in creg_sig.e
   };

   when CREG_OUT creg_sig_u {  
      //extend in creg_sig.e
   };
};

'>
