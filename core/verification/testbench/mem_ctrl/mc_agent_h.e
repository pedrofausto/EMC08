<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_agent_h.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: instantiates all the units (monitor, bfm, signal...) inside an agent
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

type active_passive_t: [ACTIVE, DESATIVE];

unit mc_agent_u like mc_phy_u {
   // show the name of agent
   short_name(): string is also {
      result = name.to_string();
   };
    
   // default value to the agent. By default, the agent is active
   active_passive: active_passive_t;
   keep soft active_passive == ACTIVE;

   //call the main event of clock
   event main_clk;
  
   // create the signal map instance
   sig: mc_sig_u is instance;
   keep sig.name == read_only(name);
  
   // create the monitor instance and connect with the parent`s agent
   mon: mc_mon_u is instance;
   keep mon.name   == read_only(name);
   keep mon.parent == me;
   
   when ACTIVE MC_IN  mc_agent_u {
      // inStance of the bfm in that is the transmitter bfm and the pointer to the parent`s agent
      bfm: mc_bfm_i_u is  instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };

   when ACTIVE MC_OUT mc_agent_u {
      // intance of the bfm out that is the receptor bfm and the pointer to the parent`s agent
      bfm: mc_bfm_o_u is instance;
      keep bfm.name   == read_only(name);
      keep bfm.parent == me;
   };
};

extend mc_bfm_i_u {
   // create the parent`s bfm in
   parent: mc_agent_u;
  
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend mc_bfm_o_u {
   // create the parent`s bfm out
   parent: mc_agent_u;
   
   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

extend mc_mon_u {
   // create the parent`s monitor pointer 
   parent: mc_agent_u;

   // connect the clock_e event to the main clock
   event clock_e is only @parent.main_clk;
};

'>
