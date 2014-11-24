<'
import pkt_sync_h;
extend pkt_sync_u {
  clk_p : in event_port is instance;
  keep bind(clk_p,external);
  keep clk_p.hdl_path() == "CLK";
  keep clk_p.edge()   == rise;
};
'>
