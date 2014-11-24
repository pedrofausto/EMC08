<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_test.e
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
// Include Files: serial_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_config;

extend serial_bfm_i_u {
 
 keep baud_rate == BR_64;
 
};

extend MAIN serial_seq_s 
{
   
   !seq_reset      : SEQ_RESET serial_seq_s    ;
   !seq_no_reset   : SEQ_NO_RESET serial_seq_s ;
   !seq_gen_8b     : SEQ_GEN_8B serial_seq_s   ;
   
   !num_pkt        : byte;
	
   keep num_pkt in [1..2];
  
   post_generate() is also 
   {
      message(LOW, me, " " );
   }; 
 
   drain_cycles: uint;
   keep soft drain_cycles == 100;
   
   
   body() @driver.clock is only
   {
     // for i from 1 to 100
     // {
     //    gen num_pkt  ;
         do seq_reset ;
         do seq_reset ;
         do seq_no_reset ;
         do seq_no_reset ;
         do seq_gen_8b;
         do seq_gen_8b;
         do seq_gen_8b;
         do seq_reset ;
         do seq_reset ;
            
//          case
//          {
//    
//                num_pkt == 1 { do seq_no_reset ;		};
//                num_pkt == 2 { do seq_gen_8b;     	};
//       //       num_pkt == 3 { do seq_up_count 		};
//       //       num_pkt == 3 { do seq_down_count		};
//       //       num_pkt == 4 { do seq_up_count_ext 	};
//       //       num_pkt == 5 { do seq_down_count_ext};
//    
//          };
   
         wait [ 10 ];
         stop_run();
     // };
   };

};

'>
