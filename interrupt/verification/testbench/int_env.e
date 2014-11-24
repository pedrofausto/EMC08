<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_env.e
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
// Keywords: int - interrupt, env - environment
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
// Include Files: int_env_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_env_h;

extend int_env_u {
   // if there is some need of a checker implementation, the pointer to the checker
   // need to be created here.
};

extend int_agent_u {
   // create the main_clk event that connect the main clock to the environment clock.
   event main_clk is only @parent.sync.clk_p$;
};
 
'>
