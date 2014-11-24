<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_agent_h.e
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
// Keywords: alu - aritmetic and logic unit, clk - clock, phy - physical layer
// -----------------------------------------------------------------------------
// Purpose: Class that make agent`s definitions and agent`s instances of
// environment (core_alu_IN and core_alu_OUT). Each agent has a signal map, a monitor and a BFM
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

type active_passive_t: [ACTIVE, DESATIVE];

unit core_alu_agent_u like core_alu_phy_u {
   // show the name of agent
   short_name(): string is also {
      result = name.to_string();
   };
    
   // default value to the agent. By default, the agent is active
   active_passive: active_passive_t;
   keep soft active_passive == ACTIVE;

   // call the main event of clock
   event main_clk;
  
   // create the signal map instance
   sig: core_alu_sig_u is instance;
   keep sig.name == read_only(name);
  
   // create the monitor instance and connect with the parent`s agent
   mon: core_alu_mon_u is instance;
   keep mon.name   == read_only(name); 
   keep mon.parent == me;
   
   when ACTIVE CORE_ALU_IN  core_alu_agent_u {
      // intance of the bfm in that is the transmitter bfm and the pointer to the parent`s agent
      bfm: core_alu_bfm_i_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };

   when ACTIVE CORE_ALU_OUT core_alu_agent_u {
      // intance of the bfm out that is the receptor bfm and the pointer to the parent`s agent
      bfm: core_alu_bfm_o_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };
};

extend core_alu_bfm_i_u {
   // create the parent`s bfm in
   parent: core_alu_agent_u;
  
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend core_alu_bfm_o_u {
   // create the parent`s bfm out
   parent: core_alu_agent_u;
   
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend core_alu_mon_u {
   // create the parent`s monitor pointer 
   parent: core_alu_agent_u;

   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

'>
