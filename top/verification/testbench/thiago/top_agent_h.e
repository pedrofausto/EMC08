<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_agent_h.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_top - top module, clk - clock, phy - physical layer
// -----------------------------------------------------------------------------
// Purpose: Class that make agent`s definitions and agent`s instances of
// environment (TOP_IN and TOP_OUT). Each agent has a signal map,
// a monitor and a BFM
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

unit top_agent_u like top_phy_u {
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
   sig: top_sig_u is instance;
   keep sig.name == read_only(name);
  
   // create the monitor instance and connect with the parent`s agent
   mon: top_mon_u is instance;
   keep mon.name   == read_only(name); 
   keep mon.parent == me;
   
   when ACTIVE TOP_IN  top_agent_u {
      // intance of the bfm in that is the transmitter bfm and the pointer to the parent`s agent
      bfm: top_bfm_i_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };

   //when ACTIVE TOP_OUT top_agent_u {
      // intance of the bfm out that is the receptor bfm and the pointer to the parent`s agent
      //bfm: top_bfm_o_u is instance;
      //keep bfm.name   == read_only(name);
      //keep bfm.parent == me;
   //};
};

extend top_bfm_i_u {
   // create the parent`s bfm in
   parent: top_agent_u;
  
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend top_bfm_o_u {
   // create the parent`s bfm out
   parent: top_agent_u;
   
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend top_mon_u {
   // create the parent`s monitor pointer 
   parent: top_agent_u;

   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

'>
