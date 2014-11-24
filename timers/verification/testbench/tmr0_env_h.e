<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_env_h.e
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

unit tmr0_env_u like any_env {

   // general name of the environment (defined at br_types.e)
	
   name: tmr0_env_name_t; //_t meaning type
	
   keep name == TMR0;

   // pointer for syncronizer wich generate the clock
   sync: tmr0_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: TMR0_IN tmr0_agent_u is instance;
   keep agent_in.parent == me; 
  
   // instance of receiver agent that pointer to the environment
   agent_out: TMR0_OUT tmr0_agent_u is instance;
   keep agent_out.parent == me;
  
   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend tmr0_agent_u {
   // pointer of agent to the environment
   parent: tmr0_env_u;
};

'>
