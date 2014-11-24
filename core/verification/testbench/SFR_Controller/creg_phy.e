// -------------------------------------------------------------------
<'
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: core_reg_ctrl.v
// Module Name: core_reg_ctrl
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  Fixed some bugs in interruption flags access
// 1.2      07/09/2010  Updated Include Files directories path
// -------------------------------------------------------------------
// Keywords: br - baud rate, env - environment
// -----------------------------------------------------------------------------
// Purpose: Create the physical type to the environment
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
// Description
// Core Submodule responsible for control read and write access to 
// Special Function Registers.
// -------------------------------------------------------------------

unit creg_phy_u {
   // to identify wich type of PKT were created
   name: creg_env_name_t;

   post_generate() is also {
      message(LOW, me, " created");
   };
};

'>
