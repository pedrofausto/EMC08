<'
type erm_active_passive_t: [ACTIVE, INACTIVE];

unit pkt_agent_u like pkt_phy_u {
  active_passive: erm_active_passive_t;
  keep soft active_passive == ACTIVE;
  
  event main_clk;
      
  sig: pkt_sig_u is instance;
  keep sig.name       == read_only(name);
      
  mon: pkt_mon_u is instance;
  keep mon.name       == read_only(name); 
  keep mon.parent     == me;
        
  when ACTIVE PKT_IN  pkt_agent_u {
    bfm: pkt_bfm1_u is instance;
    keep bfm.name       == read_only(name);
    keep bfm.parent     == me;
  };
};

extend pkt_bfm1_u {
  parent: pkt_agent_u;
  event clock_e is only @parent.main_clk;
};

extend pkt_mon_u {
  parent: pkt_agent_u;
  event clock_e is only @parent.main_clk;
};
'>

