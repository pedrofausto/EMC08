<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_env_h.e
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
// Purpose: This class implements the environment header of core fsm
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

unit core_top_env_u like any_env {
   // general name of the environment (defined at core_top_types.e)
   name: core_top_env_name_t; //_t meaning type
   keep name == CORE_TOP;

   // pointer for syncronizer wich generate the clock
   sync: core_top_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: CORE_TOP_IN core_top_agent_u is instance;
   keep agent_in.parent == me; 
  
   // instance of receiver agent that pointer to the environment
   //agent_out: CORE_TOP_OUT core_top_agent_u is instance;
   //keep agent_out.parent == me;
  
   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend core_top_agent_u {
   // pointer of agent to the environment
   parent: core_top_env_u;
};

'>
