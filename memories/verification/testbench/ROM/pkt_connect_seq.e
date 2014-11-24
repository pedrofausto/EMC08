<'
extend ACTIVE PKT_IN pkt_agent_u {
  driver: pkt_driver_u is instance;
  keep driver.agent   == me;
  keep bfm.driver     == driver;
};

extend pkt_driver_u {
  agent: pkt_agent_u;
  event clock is only @agent.main_clk;
};


extend pkt_bfm1_u {

  driver: pkt_driver_u; 
  
  get_pkt(): pkt_operation @clock_e is also {
    result = driver.get_next_item();
  };
  
  its_done() is also {
    emit driver.item_done;
  };
};
'>

