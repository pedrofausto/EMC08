<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_test_f3_v1.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt, seq - sequence
// -----------------------------------------------------------------------------
// Purpose: Sequences generated and tested
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: post_generate()
// Include Files: int_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_config;

extend int_signal_type {
  
   keep reg_ie_i == 8'hFF; // All interrupts enabled
   
   keep soft reg_ip_i[6:6] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_ip_i[5:5] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_ip_i[4:4] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_ip_i[3:3] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_ip_i[2:2] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_ip_i[1:1] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_ip_i[0:0] == select { 70 : 1'b0; 30 : 1'b1; };
   
   // keep flags 
   keep soft reg_tcon_i[5:5] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_tcon_i[4:4] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_tcon_i[3:3] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_tcon_i[1:1] == select { 70 : 1'b0; 30 : 1'b1; };
   // IT0 and IT1
   keep soft reg_tcon_i[0:0] == select { 70 : 1'b1; 30 : 1'b0; };
   keep soft reg_tcon_i[2:2] == select { 70 : 1'b1; 30 : 1'b0; };
      
   keep soft reg_tcon2_i[0:0] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_tcon2_i[0:0] == select { 70 : 1'b0; 30 : 1'b1; };
   
   keep soft reg_scon_i[0:0] == select { 70 : 1'b0; 30 : 1'b1; };
   keep soft reg_scon_i[0:0] == select { 70 : 1'b0; 30 : 1'b1; };
};

extend int_mon_u {
  
  keep feature == FEATURE_F3_V1;
  
  cover cover_func_model is  also {
     item feature_f3_v1_cov:feature_f3_v1_t = feature_f3_v1 using illegal = (
                                    (feature_f3_v1_cov == IE0_LEVEL_ERROR)      or
                                    (feature_f3_v1_cov == IE1_LEVEL_ERROR)      or
                                    (feature_f3_v1_cov == IE0_TRANSITION_ERROR) or
                                    (feature_f3_v1_cov == IE1_TRANSITION_ERROR));
    }; // end cover


}; 

extend MAIN int_seq_s {
   !seq_reset       : SEQ_RESET       int_seq_s;
   !seq_nop         : SEQ_NOP         int_seq_s;
   !seq_rand_INTEXT : SEQ_RAND_INTEXT int_seq_s;
   !seq_rand_RDY    : SEQ_RAND_RDY    int_seq_s;
   !seq_rand_NA     : SEQ_RAND_NA     int_seq_s;
   !seq_rand_IE     : SEQ_RAND_IE     int_seq_s;
   !seq_rand_IP     : SEQ_RAND_IP     int_seq_s;
   !seq_rand_SCON   : SEQ_RAND_SCON   int_seq_s;
   !seq_rand_TCON   : SEQ_RAND_TCON   int_seq_s;
   !seq_rand_TCON2  : SEQ_RAND_TCON2  int_seq_s;
     
   post_generate() is also {
      message(LOW, me, " Post Generate " );
   }; 
    !num_pkt: byte;
    keep num_pkt in [1..11];
    
   body() @driver.clock is only {
   
   var num_pkt_aux:byte;
   
      do seq_reset;
      do seq_rand_IE;
      do seq_rand_IP;
      do seq_rand_TCON;
      do seq_rand_TCON2;
      do seq_rand_SCON;
      
      for i from 1 to 100000 {
         num_pkt_aux = num_pkt;   
         gen num_pkt;
         while (num_pkt == 3 and num_pkt_aux == num_pkt) {
            gen num_pkt;
         };

         case {
            num_pkt == 1 { do seq_nop };
            num_pkt == 2 { do seq_rand_INTEXT };
            num_pkt == 3 { do seq_rand_RDY };
            num_pkt == 4 { do seq_rand_NA };
            num_pkt == 5 { do seq_rand_IE };
            num_pkt == 6 { do seq_rand_IP };
            num_pkt == 7 { do seq_rand_SCON };
            num_pkt == 8 { do seq_rand_TCON };
            num_pkt == 9 { do seq_rand_TCON2 };
            num_pkt == 10 { do seq_rand_INTEXT };
            num_pkt == 11 { do seq_rand_INTEXT };
         };
      
      };

      stop_run();
   };
};

'>
