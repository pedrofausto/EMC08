<'
unit pkt_bfm1_u like pkt_phy_u {
     
event clock_e;     
event init_done;                      
  drive_bus() @clock_e is {};
  
  get_pkt(): pkt_operation @clock_e is {};
  
  its_done()  is {};
  
  send_pkt (pkt:pkt_operation) @clock_e is{};
  
  initialization() @clock_e is {};
    
  run() is also {
    start drive_bus();
  };
};
'>