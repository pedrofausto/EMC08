<'

import pkt_sig_h;
extend pkt_sig_u {

    p_addr: inout simple_port of uint(bits:7) is instance; 
    p_data_in: inout simple_port of byte is instance;
    p_web: inout simple_port of bit is instance;
    p_enb: inout simple_port of bit is instance;
    p_oeb: inout simple_port of bit is instance;
    p_vdd: inout simple_port of bit is instance;
    p_gnd: inout simple_port of bit is instance;
    p_data_out: inout simple_port of byte is instance;    
   
     keep bind(p_addr,external);
     keep bind(p_data_in,external);
     keep bind(p_web,external);
     keep bind(p_enb,external);
     keep bind(p_oeb,external);
     keep bind(p_vdd,external);
     keep bind(p_gnd,external);
     keep bind(p_data_out,external);
     
  when PKT_IN pkt_sig_u 
  {
    keep p_addr.hdl_path() == "ADR";
    keep p_data_in.hdl_path() == "D";
    keep p_web.hdl_path() == "WEB";
    keep p_enb.hdl_path() == "ENB";
    keep p_oeb.hdl_path() == "OEB";
    keep p_vdd.hdl_path() == "ramvdd";
    keep p_gnd.hdl_path() == "ramgnd";
    keep p_data_out.hdl_path()     == "Q";
  };
  
  when PKT_OUT pkt_sig_u 
  {
    keep p_addr.hdl_path() == "ADR";
    keep p_data_in.hdl_path() == "D";
    keep p_web.hdl_path() == "WEB";
    keep p_enb.hdl_path() == "ENB";
    keep p_oeb.hdl_path() == "OEB";
    keep p_vdd.hdl_path() == "ramvdd";
    keep p_gnd.hdl_path() == "ramgnd";
    keep p_data_out.hdl_path()     == "Q";

   };
};
'>