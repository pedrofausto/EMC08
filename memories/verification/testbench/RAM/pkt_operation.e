<'
     type pkt_operation_kind : [WRITE, READ, NOTHING];
      
struct pkt_operation like any_sequence_item {
    addr: uint (bits:7);
    data_in: byte; 
    data_out: byte;
    web: bit;
    enb: bit;
    oeb: bit;
    vdd: bit;
    gnd: bit;

    pkt_kind   :pkt_operation_kind;

    keep vdd == 1;
    keep gnd == 0;
    
    keep data_in in [0x00..0xFF];
    
    keep  (pkt_kind == WRITE) => (enb == 0 && web == 0 && oeb == 1);
    keep  (pkt_kind == READ) => (enb == 0 && web == 1 && oeb == 0);
    keep  (pkt_kind == NOTHING) => (enb == 0 && web == 1 && oeb == 1);
};
'>

