<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_env.e
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
// Keywords: creg - registers controller, env - environment
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
// Include Files: creg_env_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_env_h;

extend creg_env_u {
   // if there is some need of a checker implementation, the pointer to the checker
   // need to be created here.
};

extend creg_agent_u {
   // create the main_clk event that connect the main clock to the environment clock.
   event main_clk is only @parent.sync.clk_p$;
};
 
'>
