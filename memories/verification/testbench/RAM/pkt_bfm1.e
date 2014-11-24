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
  keep ADR_SETUP_TIME == 62;  // 0.620ns
  keep ADR_HOLD_TIME == 11;   // 0.110ns
  keep WEB_SETUP_TIME == 74;  // 0.740ns
  keep WEB_HOLD_TIME == 20;   // 0.200ns
  keep D_SETUP_TIME == 14;    // 0.140ns
  keep D_HOLD_TIME == 41;     // 0.410ns
  keep ENB_SETUP_TIME == 82;  // 0.820ns
  keep ENB_HOLD_TIME == 18;   // 0.180ns

    !p_addr: inout simple_port of uint(bits:7); 
    !p_data_in: inout simple_port of byte;
    !p_web: inout simple_port of bit;
    !p_enb: inout simple_port of bit;
    !p_oeb: inout simple_port of bit;
    !p_vdd: inout simple_port of bit;
    !p_gnd: inout simple_port of bit;
    !p_data_out: inout simple_port of byte;

    drive_bus() @clock_e is only {
      var pkt: pkt_operation;
      initialization();
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
          p_vdd$=1;
          p_gnd$=0;
          p_enb$=0;
          emit init_done;
     };

    send_pkt(in_pkt: pkt_operation) @clock_e is only  {
     if(in_pkt.pkt_kind==WRITE) {
          p_enb$=0;
          p_oeb$=1;
          wait delay (WEB_SETUP_TIME);
          p_web$=in_pkt.web;
          wait delay (WEB_SETUP_TIME-ADR_SETUP_TIME);
          p_addr$=in_pkt.addr;
          wait delay (ADR_SETUP_TIME-D_SETUP_TIME);
          p_data_in$=in_pkt.data_in;
          wait delay (D_SETUP_TIME+ADR_HOLD_TIME);
          wait cycle;
          p_enb$=1;
          p_addr$=0;
          wait delay (WEB_HOLD_TIME-ADR_HOLD_TIME);
          p_web$=1;
          wait delay (D_HOLD_TIME-WEB_HOLD_TIME);
          p_data_in$=0;          
        } else if(in_pkt.pkt_kind==READ) {
          p_enb$=0;
          p_web$=1;
          p_addr$=in_pkt.addr;
          wait cycle;
          wait delay (ADR_SETUP_TIME);
          p_oeb$=0;
          p_enb$=1;
          wait cycle;
          wait cycle;
          p_oeb$=1;
        };
     };
};
'>