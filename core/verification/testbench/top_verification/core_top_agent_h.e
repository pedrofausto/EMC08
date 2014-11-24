<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_agent_h.e
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
// Keywords: core_top - core top module, clk - clock, phy - physical layer
// -----------------------------------------------------------------------------
// Purpose: Class that make agent`s definitions and agent`s instances of
// environment (CORE_TOP_IN and CORE_TOP_OUT). Each agent has a signal map,
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

unit core_top_agent_u like core_top_phy_u {
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
   sig: core_top_sig_u is instance;
   keep sig.name == read_only(name);
  
   // create the monitor instance and connect with the parent`s agent
   mon: core_top_mon_u is instance;
   keep mon.name   == read_only(name); 
   keep mon.parent == me;
   
   when ACTIVE CORE_TOP_IN  core_top_agent_u {
      // intance of the bfm in that is the transmitter bfm and the pointer to the parent`s agent
      bfm: core_top_bfm_i_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };

   //when ACTIVE CORE_TOP_OUT core_top_agent_u {
      // intance of the bfm out that is the receptor bfm and the pointer to the parent`s agent
      //bfm: core_top_bfm_o_u is instance;
      //keep bfm.name   == read_only(name);
      //keep bfm.parent == me;
   //};
};

extend core_top_bfm_i_u {
   // create the parent`s bfm in
   parent: core_top_agent_u;
  
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend core_top_bfm_o_u {
   // create the parent`s bfm out
   parent: core_top_agent_u;
   
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend core_top_mon_u {
   // create the parent`s monitor pointer 
   parent: core_top_agent_u;

   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

'>
