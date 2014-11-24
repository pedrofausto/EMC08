<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_config.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control, seq - sequence, 
// env- environment
// -----------------------------------------------------------------------------
// Purpose: Instance the environment, specify the path of top module and setup 
// some configurations of specman
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: setup()
// Include Files: core_reg_control_reg_control.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_reg_control_top.e;

// top of the testbench hierarchy, sbt_env_u is instanced here.
extend sys {
   env: core_reg_control_env_u is instance;

   keep env.hdl_path() == "core_reg_ctrl_tb";
    
   setup() is also {
      set_config(run, tick_max, 1000);
      //set_config(cover, mode, on_interactive);
   };
};

'>
