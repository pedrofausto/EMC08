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

import tmr0_config;

extend MAIN tmr0_seq_s {

   !seq_reset						: SEQ_RESET 					tmr0_seq_s;
   !seq_stop						: SEQ_STOP 						tmr0_seq_s;
	!seq_start						: SEQ_START						tmr0_seq_s;
	
   !seq_up_count					: SEQ_UP_COUNT 				tmr0_seq_s;
	!seq_up_over_count			: SEQ_UP_OVER_COUNT 			tmr0_seq_s;
	!seq_up_count_ext 			: SEQ_UP_COUNT_EXT 			tmr0_seq_s;
	!seq_up_count_ext_over 		: SEQ_UP_COUNT_EXT_OVER		tmr0_seq_s;
	!seq_up_low_over		 		: SEQ_UP_LOW_OVER				tmr0_seq_s;
	!seq_up_med_over 				: SEQ_UP_MED_OVER				tmr0_seq_s;
	
	!seq_down_count   			: SEQ_DOWN_COUNT 				tmr0_seq_s;
	!seq_down_over_count 		: SEQ_DOWN_OVER_COUNT		tmr0_seq_s;
	!seq_down_count_ext			: SEQ_DOWN_COUNT_EXT			tmr0_seq_s;
	!seq_down_count_ext_over	: SEQ_DOWN_COUNT_EXT_OVER 	tmr0_seq_s;
	!seq_down_med_over			: SEQ_DOWN_MED_OVER 			tmr0_seq_s;
	!seq_down_high_over			: SEQ_DOWN_HIGH_OVER 		tmr0_seq_s;
	
	
	
	
	!num_pkt					: uint[1..15];
	
   keep soft num_pkt == select {
		10: 5'd1;
		10: 5'd2;
		10: 5'd3;
		10: 5'd4;
		10: 5'd5;
		10: 5'd6;
		10: 5'd7;
		10: 5'd8;
		10: 5'd9;
		10: 5'd10;
		10: 5'd11;
		10: 5'd12;
		10: 5'd13;
		10: 5'd14;
		10: 5'd15;
	
	
	};
  
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
   drain_cycles: uint;
	
   keep soft drain_cycles == 100;
	
   body() @driver.clock is only {
	
		out ("");
		
		out ("TEST DESCRIPTION = XXXXX   FEATURE NUMBER = 00  STARTS HERE ...\n");
	
		
		do seq_reset;

		
		for i from 1 to 1000 {
		
         gen num_pkt;
			
 	       case {
			
            num_pkt == 1	{ do seq_reset						};
            num_pkt == 2	{ do seq_stop						};
				num_pkt == 3	{ do seq_start						};
            num_pkt == 4	{ do seq_up_count 				};
				num_pkt == 5	{ do seq_up_over_count		 	};
				num_pkt == 6	{ do seq_up_count_ext 			};
				num_pkt == 7	{ do seq_up_count_ext_over		};
				num_pkt == 8	{ do seq_up_low_over				};
				num_pkt == 9	{ do seq_up_med_over				};
				
				num_pkt == 10	{ do seq_down_count				};
            num_pkt == 11	{ do seq_down_over_count	 	};
				num_pkt == 12	{ do seq_down_count_ext			};
				num_pkt == 13	{ do seq_down_count_ext_over	};
				num_pkt == 14	{ do seq_down_med_over			};
				num_pkt == 15	{ do seq_down_high_over			};
				
         }; 
      };
		
      wait [ 10 ];
		
      stop_run();
   };
};

'>
