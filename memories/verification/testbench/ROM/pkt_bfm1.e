<'
import pkt_bfm1_h;
extend pkt_bfm1_u {
  INIT_TIME: uint;
  PERIOD: uint;
  ADR_SETUP_TIME: uint;
  ADR_HOLD_TIME: uint;
  WEB_SETUP_TIME: uint;
  WEB_HOLD_TIME: uint;
  D_SETUP_TIME: uint;
  D_HOLD_TIME: uint;
  ENB_SETUP_TIME: uint;
  ENB_HOLD_TIME: uint;

  
  keep INIT_TIME == 250000;   // 250ns
  keep PERIOD == 5000;        // 50ns
  keep ADR_SETUP_TIME == 76;  // 0.620ns
  keep ADR_HOLD_TIME == 66;   // 0.110ns
  keep ENB_SETUP_TIME == 96;  // 0.820ns
  keep ENB_HOLD_TIME == 64;   // 0.180ns
  
    !p_addr: inout simple_port of uint(bits:12); 
    !p_web: inout simple_port of bit;
    !p_enb: inout simple_port of bit;
    !p_oeb: inout simple_port of bit;
    !p_vdd: inout simple_port of bit;
    !p_gnd: inout simple_port of bit;
    !p_data_out: inout simple_port of byte;

    drive_bus() @clock_e is only {
      var pkt: pkt_operation;
      initialization();
      p_vdd$=1;
      p_gnd$=0;
      p_enb$=0;
      p_oeb$=1;
      out("entrou no drive_bus");
      while TRUE {
        pkt = get_pkt();
        send_pkt(pkt);
        its_done();
      };
    };
  
     initialization() @clock_e is only
     {
          out("Initializing Memory"); 
          wait delay (INIT_TIME);
          wait cycle;
          wait delay (PERIOD-ENB_SETUP_TIME); 
          emit init_done;
     };

    send_pkt(in_pkt: pkt_operation) @clock_e is only  {
     if(in_pkt.pkt_kind==READ) {
          wait delay (PERIOD - ADR_SETUP_TIME);
          p_oeb$=1;
          p_addr$=in_pkt.addr;
          wait cycle;
          p_oeb$=0;
          wait cycle;
          
        };
     };
};
'>