<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_config.e
// Module Name : Timer 0 Module
// Author : Hugo Kakisaka, Marcelo Mamoru Ono
// E-mail : diga21@emc8.br, diga20@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords:
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
// Include Files: br_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr2_top.e;

// top of the testbench hierarchy, sbt_env_u is instanced here.
extend sys {
   env: tmr2_env_u is instance;

   keep env.hdl_path() == "timer2_tb";
    
   setup() is also {
      set_config(run, tick_max, 100000000);
      //set_config(cover, mode, on_interactive);
   };
};

'>
