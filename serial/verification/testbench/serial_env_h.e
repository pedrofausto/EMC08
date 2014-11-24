<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_env_h.e
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

unit serial_env_u like any_env {
   // general name of the environment (defined at serial_types.e)
   name: serial_env_name_t; //_t meaning type
   keep name == BR;

   // pointer for syncronizer wich generate the clock
   sync: serial_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: SERIAL_IN serial_agent_u is instance;
   keep agent_in.parent == me; 
  
   // instance of receiver agent that pointer to the environment
   agent_out: SERIAL_OUT serial_agent_u is instance;
   keep agent_out.parent == me;
  
   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend serial_agent_u {
   // pointer of agent to the environment
   parent: serial_env_u;
};

'>
