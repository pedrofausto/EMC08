<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_env_h.e
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

unit creg_env_u like any_env {
   // general name of the environment (defined at creg_types.e)
   name: creg_env_name_t; //_t meaning type
   keep name == CREG;

   // pointer for syncronizer wich generate the clock
   sync: creg_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: CREG_IN creg_agent_u is instance;
   keep agent_in.parent == me; 
  
   // instance of receiver agent that pointer to the environment
   agent_out: CREG_OUT creg_agent_u is instance;
   keep agent_out.parent == me;
  
   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend creg_agent_u {
   // pointer of agent to the environment
   parent: creg_env_u;
};

'>
