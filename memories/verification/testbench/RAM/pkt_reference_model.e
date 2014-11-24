<'
extend pkt_mon_u {    
  reference_model() @op_signal is also {
    var read_data: byte;
    wait (@rd_signal or @wr_signal);
//    if (p_enb$ == 0) {
      if(p_web$==0) {
        mem_matrix[p_addr$]=p_data_in$;
        out("WRITE at ",p_addr$," : ", p_data_in$);
      } else if(p_oeb$==0) {
        read_data=mem_matrix[p_addr$];
        out("READ at ",p_addr$," : ", read_data);
        check that read_data==p_data_out$;
      };
 //   };
  };
};
'>