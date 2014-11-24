<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_config.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Configuration file. Set testbench file, clock number of ticks, etc.
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: mc_top
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_top.e;

// top of the testbench hierarchy, mc_env_u is instanced here.
extend sys {
   env: mc_env_u is instance;
   
   keep env.hdl_path() == "core_mem_ctrl_tb";
    
   setup() is also {
      --out("----------------------------->inside setup()... @mc_config.e");
      set_config(run, tick_max, 1000000000);
      set_config(cover, mode, on_interactive);   
      set_config(simulation,enable_ports_unification,TRUE);
      //set_config(cover, mode, on_interactive);
   };
};

'>
