<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_config.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, seq - sequence, env- environment
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
// Include Files: top_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_top.e;

// top of the testbench hierarchy, sbt_env_u is instanced here.
extend sys {
   env: top_env_u is instance;

   keep env.hdl_path() == "emc_top_tb";
    
   setup() is also {
      set_config(run, tick_max, 100000);
      //set_config(cover, mode, on_interactive);
      set_config(simulation, back_compat_no_nbasync, FALSE);
   };
};

'>
