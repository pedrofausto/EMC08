<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_sync.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Acore_reg_controlahin
// E-mail : diga8@emc8.core_reg_control, diga19@emc08.core_reg_control
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control, sync - synchronizer
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
// Include Files: core_reg_control_sync_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_sync_h;

extend core_reg_control_sync_u {
   // connection with the external clock on posedge
   clk_p: in event_port is instance;
   keep bind(clk_p,external);
   keep clk_p.hdl_path() == "clk_i";
   keep clk_p.edge()     == rise;
   
   // connection with the external clock on posedge
   clk_p_f: in event_port is instance;
   keep bind(clk_p_f,external);
   keep clk_p_f.hdl_path() == "clk_i";
   keep clk_p_f.edge()     == fall;
   
   
};




'>
