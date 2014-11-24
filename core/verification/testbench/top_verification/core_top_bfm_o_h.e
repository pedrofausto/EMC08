<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_bfm_o.e
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
// Keywords: core_top - core top module, phy - physical, bfm - bus functional 
// -----------------------------------------------------------------------------
// Purpose: Interface to the receive DUT output
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: run(), drive_bus()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

unit core_top_bfm_o_u like core_top_phy_u {
   // connect the main clock to the bfm
   event clock_e;                           

   // function the monitoring the bus
   drive_bus() @clock_e is {};
  
   run() is also {
      // start the drive_bus
      start drive_bus();
   };
};

'>
