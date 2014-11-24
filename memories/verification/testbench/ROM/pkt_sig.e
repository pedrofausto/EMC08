<'

import pkt_sig_h;
extend pkt_sig_u {

    p_addr: inout simple_port of uint(bits:12) is instance; 
    p_enb: inout simple_port of bit is instance;
    p_oeb: inout simple_port of bit is instance;
    p_vdd: inout simple_port of bit is instance;
    p_gnd: inout simple_port of bit is instance;
    p_data_out: inout simple_port of byte is instance;    
   
     keep bind(p_addr,external);
     keep bind(p_enb,external);
     keep bind(p_oeb,external);
     keep bind(p_vdd,external);
     keep bind(p_gnd,external);
     keep bind(p_data_out,external);
     
  when PKT_IN pkt_sig_u 
  {
    keep p_addr.hdl_path() == "ADR";
    keep p_enb.hdl_path() == "ENB";
    keep p_oeb.hdl_path() == "OEB";
    keep p_vdd.hdl_path() == "romvdd";
    keep p_gnd.hdl_path() == "romgnd";
    keep p_data_out.hdl_path()     == "Q";
  };
  
  when PKT_OUT pkt_sig_u 
  {
    keep p_addr.hdl_path() == "ADR";
    keep p_enb.hdl_path() == "ENB";
    keep p_oeb.hdl_path() == "OEB";
    keep p_vdd.hdl_path() == "romvdd";
    keep p_gnd.hdl_path() == "romgnd";
    keep p_data_out.hdl_path()     == "Q";

   };
};
'>