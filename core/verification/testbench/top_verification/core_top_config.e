<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_config.e
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
// Keywords: core_top - core top module, seq - sequence, env- environment
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
// Include Files: core_top_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_top.e;

// top of the testbench hierarchy, sbt_env_u is instanced here.
extend sys {
   env: core_top_env_u is instance;

   keep env.hdl_path() == "core_tb";
    
   setup() is also {
      set_config(run, tick_max, 10000000);
      set_config(simulation,enable_ports_unification,TRUE);
      set_config(simulation,back_compat_no_nbasync,FALSE);
      
      //set_config(cover, mode, on_interactive);
   };
};

'>
