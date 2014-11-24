<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_sync.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      08-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, sync - synchronizer
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
// Include Files: core_alu_sync_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_alu_sync_h;

extend core_alu_sync_u {
   // connection with the external clock   
   clk_p: in event_port is instance;
   keep bind(clk_p,external);
   keep clk_p.hdl_path() == "system_clk";
   keep clk_p.edge()     == rise;
};

'>
