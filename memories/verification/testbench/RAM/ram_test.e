<'
import pkt_config;

extend MAIN pkt_seq_s {
  !seq_write: WRITE_ALL pkt_seq_s;
  !seq_read:  READ_ALL pkt_seq_s;
  !mem_init: MEM_INIT pkt_seq_s;
  
  post_generate() is also {
    message(LOW, me, " " );
  }; 

     body() @driver.clock is only 
     {
      do mem_init;
      do seq_write;
      do seq_read;
      stop_run();
     };
};
'>
