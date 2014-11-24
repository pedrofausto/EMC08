<' 

extend pkt_seq_s {
  !pkt: pkt_operation;

};

extend pkt_seq_kind_t: [READ_ALL];
extend READ_ALL pkt_seq_s {

  mem_size : uint;
  keep mem_size==4096;

  body() @driver.clock is only {
    for i from 0 to mem_size-1 {
      do pkt keeping {
      .addr == i;
      .pkt_kind == READ;
      }; 
    };
  };
};

extend pkt_seq_kind_t: [MEM_INIT];
extend MEM_INIT pkt_seq_s {

  body() @driver.clock is only {
  
  };
};

'>

