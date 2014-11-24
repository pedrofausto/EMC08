<'
import pkt_top.e;

extend sys {
  env: pkt_env_u is instance;

  keep env.hdl_path() == "ram_memory_top";
    
  setup() is also {
     set_config(run, tick_max, 100000);
     set_config(cover, mode, on_interactive);   
  };
  
};
'>
