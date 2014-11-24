<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_env_h.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, env - environment
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

unit core_alu_env_u like any_env {
   // general name of the environment (defined at core_alu_types.e)
   name: core_alu_env_name_t; //_t meaning type
   keep name == CORE_ALU;

   // pointer for syncronizer wich generate the clock
   sync: core_alu_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: CORE_ALU_IN core_alu_agent_u is instance;
   keep agent_in.parent == me;

   // instance of receiver agent that pointer to the environment
   agent_out: CORE_ALU_OUT core_alu_agent_u is instance;
   keep agent_out.parent == me;

   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend core_alu_agent_u {
   // pointer of agent to the environment
   parent: core_alu_env_u;
};

'>
