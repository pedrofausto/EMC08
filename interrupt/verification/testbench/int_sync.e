<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_sync.e
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
// Keywords: int - interrupt, sync - synchronizer
// -----------------------------------------------------------------------------
// Purpose: Internal clock specifications, that is connected to the external
// clock signal
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: CLK
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: int_sync_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_sync_h;

extend int_sync_u {
   // connection with the external clock   
   clk_p: in event_port is instance;
   keep bind(clk_p,external);
   keep clk_p.hdl_path() == "clk";
   keep clk_p.edge()     == rise;
};

'>
