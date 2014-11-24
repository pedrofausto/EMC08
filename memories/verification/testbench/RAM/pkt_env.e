<'

import pkt_env_h;
extend pkt_env_u {
};

extend pkt_agent_u {
     event main_clk is only @parent.sync.clk_p$;
}; 
'>