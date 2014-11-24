<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_test.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 12/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, seq - sequence
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
// Include Files: br_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import tmr2_config;


extend tmr2_mon_u {
  
  keep sel_feat == FEAT_2        ;
  
  cover cover_func_model is  also {
  
 //    item feature_f2_cov : feature_f2_t = feature_f2 using illegal = (feature_f2_cov == ACR_INC_ERROR);
  
     item feature_f2_cov : feature_f2_t = feature_f2 using ignore = (feature_f2_cov == ACR_INC_ERROR);
     
    }; 
  
};

extend MAIN tmr2_seq_s {

   !seq_reset  			: SEQ_RESET 		tmr2_seq_s;
   !seq_filter_s2			: SEQ_FILTER_S2 	tmr2_seq_s;
   !seq_filter_s3      	: SEQ_FILTER_S3 	tmr2_seq_s;
   !seq_fall_edge     	: SEQ_FALL_EDGE 	tmr2_seq_s;
	!seq_rise_edge	   	: SEQ_RISE_EDGE 	tmr2_seq_s;
	!seq_div_001		 	: SEQ_DFDIV_001 	tmr2_seq_s;
	!seq_div_002		 	: SEQ_DFDIV_002 	tmr2_seq_s;
	!seq_div_004		 	: SEQ_DFDIV_004 	tmr2_seq_s;	
	!seq_div_008		 	: SEQ_DFDIV_008 	tmr2_seq_s;	
	!seq_div_016		 	: SEQ_DFDIV_016 	tmr2_seq_s;	
	!seq_div_032		 	: SEQ_DFDIV_032 	tmr2_seq_s;	
	!seq_div_064		 	: SEQ_DFDIV_064 	tmr2_seq_s;	
	!seq_div_128		 	: SEQ_DFDIV_128 	tmr2_seq_s;	
   !seq_mts             : SEQ_SENSOR_MTS  tmr2_seq_s;
   !seq_tacp_h          : SEQ_TACPH       tmr2_seq_s;
   !seq_tacp_l          : SEQ_TACPL	      tmr2_seq_s;
	
	!num_pkt					: byte;
	
   keep num_pkt in [1..12]        ;
   
   post_generate() is also {
   
      message(LOW, me, " " );
      
   }; 
 
   drain_cycles: uint;
	
   keep soft drain_cycles == 100;
	
   body() @driver.clock is only {
	
		out ("");
		
		out ("TEST DESCRIPTION = ACR Registers Increment   FEATURE NUMBER = 02  STARTS HERE ...\n");
	      
			
//		do seq_reset;

//      do seq_stop;
		
//      do seq_start;
		
//		do seq_up_count;
		
//		do seq_down_count;
		
//		do seq_up_count_ext;
		
//		do seq_down_count_ext;
		
		
		for i from 1 to 10000 {
		
         gen num_pkt       ;
			
			do seq_reset      ;
         
         do seq_tacp_l                          ;
         do seq_tacp_l                          ;
         do seq_tacp_l                          ;    
 //        do seq_mts  ;
 //        do seq_mts  ;
 //        do seq_mts  ;
			
         case {
			
            num_pkt == 1  { do seq_filter_s2 	};
            num_pkt == 2  { do seq_filter_s3 	};
				num_pkt == 3  { do seq_fall_edge		};
            num_pkt == 4  { do seq_rise_edge 	};
            num_pkt == 5  { do seq_div_001		};
				num_pkt == 6  { do seq_div_002		};
				num_pkt == 7  { do seq_div_004		};
				num_pkt == 8  { do seq_div_008		};
				num_pkt == 9  { do seq_div_016		};
				num_pkt == 10 { do seq_div_032		};
				num_pkt == 11 { do seq_div_064		};
				num_pkt == 12 { do seq_div_128		};
			
         };
      
      };
		

//		for i from 1 to 1000 {
		
//		out ("i=",i);
		
//		do seq_reset;
//		do seq_stop;
		
//		};
		
		

      wait [ 10 ];
		
      stop_run();
   };
};

'>
