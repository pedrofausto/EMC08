<'
extend pkt_mon_u {    
  reference_model() @op_signal is also {
    out("ROM Size: ",rom_matrix.size());
    var read_data: byte;
    if (p_enb$ == 0) {
      if(p_oeb$==0) {
        read_data=rom_matrix[p_addr$];
        out("REFMODEL[",p_addr$,"] : ", read_data, " --- MEM[", p_addr$ ,"] : ", p_data_out$);
        check that read_data==p_data_out$;
      };
    };
  };
};
'>