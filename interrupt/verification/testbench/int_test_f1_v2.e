<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_test_f1_v2.e
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
  
   keep soft reg_ie_i[7:7] == select {
         10 : 1'b0; // EA enable  90%
         90 : 1'b1; // EA disable 10%
   };
  
};

extend int_mon_u {
  
   keep feature == FEATURE_F1_V2;
   
   cover cover_func_model is  also {
      item feature_f1_v2_cov:feature_f1_v2_t = feature_f1_v2 using illegal = (
                                    (feature_f1_v2_cov == INT_TXRX_ERROR) or
                                    (feature_f1_v2_cov == INT_TF2_ERROR)  or
                                    (feature_f1_v2_cov == INT_RI_TI_ERROR )  or
                                    (feature_f1_v2_cov == INT_TF1_ERROR)  or
                                    (feature_f1_v2_cov == INT_IE1_ERROR)  or
                                    (feature_f1_v2_cov == INT_TF0_ERROR)  or
                                    (feature_f1_v2_cov == INT_IE0_ERROR)     );
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
    keep num_pkt in [1..9];
    
   body() @driver.clock is only {
      do seq_reset;
      do seq_rand_IP;
      
      for i from 1 to 100000 {
         gen num_pkt;
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
         };
      
      };

      stop_run();
   };
};

'>
