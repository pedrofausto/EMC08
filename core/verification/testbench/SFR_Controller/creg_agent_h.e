<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_agent_h.e
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
// Keywords: creg - registers controller, clk - clock, phy - physical layer
// -----------------------------------------------------------------------------
// Purpose: Class that make agent`s definitions and agent`s instances of
// environment (BR_IN and BR_OUT). Each agent has a signal map, a monitor and a BFM
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

unit creg_agent_u like creg_phy_u {
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
   sig: creg_sig_u is instance;
   keep sig.name == read_only(name);
  
   // create the monitor instance and connect with the parent`s agent
   mon: creg_mon_u is instance;
   keep mon.name   == read_only(name); 
   keep mon.parent == me;
   
   when ACTIVE CREG_IN  creg_agent_u {
      // intance of the bfm in that is the transmitter bfm and the pointer to the parent`s agent
      bfm: creg_bfm_i_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };

   when ACTIVE CREG_OUT creg_agent_u {
      // intance of the bfm out that is the receptor bfm and the pointer to the parent`s agent
      bfm: creg_bfm_o_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };
};

extend creg_bfm_i_u {
   // create the parent`s bfm in
   parent: creg_agent_u;
  
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend creg_bfm_o_u {
   // create the parent`s bfm out
   parent: creg_agent_u;
   
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend creg_mon_u {
   // create the parent`s monitor pointer 
   parent: creg_agent_u;

   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

'>
