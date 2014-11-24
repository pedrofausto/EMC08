<'
import pkt_mon_h;
extend pkt_mon_u {
  !p_addr: inout simple_port of uint(bits:12); 
  !p_web: inout simple_port of bit;
  !p_enb: inout simple_port of bit;
  !p_oeb: inout simple_port of bit;
  !p_vdd: inout simple_port of bit;
  !p_gnd: inout simple_port of bit;
    
  !p_data_out: inout simple_port of byte;
      
  event rd_signal is only (fall(p_oeb$));
  event op_signal is only (@rd_signal);
    
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
   
   !rom_matrix: list of byte;
   !rom_file: file;
   !rom_line: string;
   !rom_binary[4096*8]: list of bit;
   !read_chk: bool;
   !tmp: list of byte;
   
   read_memory() is only {
//      rom_file=files.open("ROM4096X8_2.bin","r", "Rom Data");
      for each line (rom_line) in file "./testbench/ROM/ROM4096X8_2.bin" do {
        tmp=rom_line.as_a(list of byte);
        for j from 0 to 7 {
          if(tmp[j]==49) {
            rom_binary[index*8 + 7-j]=1;
          } else {
            rom_binary[index*8 + 7-j]=0;
          };
        };
      };
//      for i from 0 to 4095 {
//        read_chk=files.read(rom_file,rom_char);
//        tmp=rom_char.as_a(list of byte);
//        tmp=tmp.reverse();
//        for j from 0 to 7 {
//          if(tmp[j]==49) {
//            rom_binary[i*8 + j]=1;
//          } else {
//            rom_binary[i*8 + j]=0;
//          };
//        };
//      };
      unpack(packing.low,rom_binary,rom_matrix);
    };
    
   
};
'>