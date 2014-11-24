<'
unit pkt_env_u like any_env {

  name: pkt_env_name_t;
  keep name == PKT;

  sync: pkt_sync_u is instance;

  agent_in: PKT_IN pkt_agent_u is instance;
  keep agent_in.parent == me; 
  
  agent_out: PKT_OUT pkt_agent_u is instance;
  keep agent_out.parent == me;
  
  short_name(): string is also {
  result = name.to_string();
  };
};

extend pkt_agent_u {
  parent: pkt_env_u;
};

'>