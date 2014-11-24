<'
import pkt_agent_h;
extend pkt_agent_u {
  connect_pointers() is also {    
    mon.p_addr = sig.p_addr;
    mon.p_enb = sig.p_enb;
    mon.p_oeb = sig.p_oeb;
    mon.p_vdd = sig.p_vdd;
    mon.p_gnd = sig.p_gnd;
    mon.p_data_out = sig.p_data_out;
  };

  when ACTIVE PKT_IN pkt_agent_u {  
    connect_pointers() is also {    
      bfm.p_addr = sig.p_addr;
      bfm.p_enb = sig.p_enb;
      bfm.p_oeb = sig.p_oeb;
      bfm.p_vdd = sig.p_vdd;
      bfm.p_gnd = sig.p_gnd;
      bfm.p_data_out = sig.p_data_out;
    };
  }; 
};
'>