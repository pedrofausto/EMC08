<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_env_h.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control, env - environment
// -----------------------------------------------------------------------------
// Purpose: This class implements the environment header of environment
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

unit core_reg_control_env_u like any_env {
   // general name of the environment (defined at core_reg_control_types.e)
   name: core_reg_control_env_name_t; //_t meaning type
   keep name == CORE_REG_CONTROL;

   // pointer for syncronizer wich generate the clock
   sync: core_reg_control_sync_u is instance;

   // instance of transmiter agent that pointer to the environment
   agent_in: CORE_REG_CONTROL_IN core_reg_control_agent_u is instance;
   keep agent_in.parent == me; 
  
   // instance of receiver agent that pointer to the environment
   agent_out: CORE_REG_CONTROL_OUT core_reg_control_agent_u is instance;
   keep agent_out.parent == me;
  
   // print formated name of environment
   short_name(): string is also {
      result = name.to_string();
   };
};

extend core_reg_control_agent_u {
   // pointer of agent to the environment
   parent: core_reg_control_env_u;
};

'>
