<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_sync.e
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
// Keywords: creg - registers controller, sync - synchronizer
// -----------------------------------------------------------------------------
// Purpose: Internal clock specifications, that is connected to the external
// clock signal
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: clk_i
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: creg_sync_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_sync_h;

extend creg_sync_u {
   // connection with the external clock   
   clk_p: in event_port is instance;
   keep bind(clk_p,external);
   keep clk_p.hdl_path() == "clk_i";
   keep clk_p.edge()     == rise;
};

'>
