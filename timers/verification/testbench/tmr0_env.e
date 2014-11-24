<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_env.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 04/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      04-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, env - environment
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
// Include Files: br_env_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr0_env_h;

extend tmr0_env_u {
   // if there is some need of a checker implementation, the pointer to the checker
   // need to be created here.
};

extend tmr0_agent_u {
   // create the main_clk event that connect the main clock to the environment clock.
   event main_clk is only @parent.sync.clk_p$;
};
 
'>
