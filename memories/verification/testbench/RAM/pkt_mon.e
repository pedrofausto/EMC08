<'
import pkt_mon_h;
extend pkt_mon_u {
  !p_addr: inout simple_port of uint(bits:7); 
  !p_data_in: inout simple_port of byte;
  !p_web: inout simple_port of bit;
  !p_enb: inout simple_port of bit;
  !p_oeb: inout simple_port of bit;
  !p_vdd: inout simple_port of bit;
  !p_gnd: inout simple_port of bit;
    
  !p_data_out: inout simple_port of byte;
      
  event rd_signal is only (fall(p_oeb$));
  event wr_signal is only (true(p_web$==0)@clock_e);
  event op_signal is only (@rd_signal or @wr_signal);
    
  watch_bus() @op_signal is also {
    out("entrou no watch bus");
    while TRUE {     
      reference_model();
      emit pkt_detected_e;
    }; 
  };
          
   when PKT_IN pkt_mon_u { 
   };
   
   when PKT_OUT pkt_mon_u {
   };
   
};
'>