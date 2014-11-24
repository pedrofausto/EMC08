<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_bfm_o_h.e
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
// Keywords: br - baud rate, phy - physical, bfm - bus functional mode
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

unit serial_bfm_o_u like serial_phy_u {
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
