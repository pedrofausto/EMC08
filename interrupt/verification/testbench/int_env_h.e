<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_env_h.e
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
// Purpose: This class implements the environment header of baud rate 
// verification, with the instances of the agents and synchronizer, with the
// pointers to the objects
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: short_name()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

unit int_env_u like any_env {
   // general name of the environment (defined at int_types.e)
   name: int_env_name_t; //_t meaning type
   keep name == INT;

   // pointer for syncronizer wich generate the clock
   sync: int_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: INT_IN int_agent_u is instance;
   keep agent_in.parent == me; 
  
   // instance of receiver agent that pointer to the environment
   agent_out: INT_OUT int_agent_u is instance;
   keep agent_out.parent == me;
  
   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend int_agent_u {
   // pointer of agent to the environment
   parent: int_env_u;
};

'>
