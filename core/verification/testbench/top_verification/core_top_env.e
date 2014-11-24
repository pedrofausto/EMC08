<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_env.e
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
// Keywords: core_top - core top module, env - environment
// -----------------------------------------------------------------------------
// Purpose: This class connect the main clock of the synchronizer with the
// environment
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
// Include Files: core_top_env_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_top_env_h;

extend core_top_env_u {
   // if there is some need of a checker implementation, the pointer to the checker
   // need to be created here.
};

extend core_top_agent_u {
   // create the main_clk event that connect the main clock to the environment clock.
   event main_clk is only @parent.sync.clk_p$;
   //event main_clk_f is only @parent.sync.clk_p_f$;
};
 
'>
