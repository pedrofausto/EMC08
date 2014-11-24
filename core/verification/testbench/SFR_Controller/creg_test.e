<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_test.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, seq - sequence
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
// Include Files: creg_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import creg_config;

extend MAIN creg_seq_s {

//Writing Verify each module
//RESET, SEQ_ACC_CORE, SEQ_B_CORE, SEQ_PSW_CORE, SEQ_IP_CORE, SEQ_IE_CORE, SEQ_RX0_CORE, SEQ_RX1_CORE, SEQ_TX0_CORE, SEQ_TX1_CORE, SEQ_SMAP8_CORE, SEQ_DPH_CORE, SEQ_DPL_CORE, SEQ_SP_CORE, SEQ_TH0_CORE, SEQ_TH1_CORE, SEQ_TM0_CORE, SEQ_TM1_CORE, SEQ_TL0_CORE, SEQ_TL1_CORE 

  !seq_reset         : SEQ_RESET creg_seq_s;       //...0
  !seq_acc_core      : SEQ_ACC_CORE creg_seq_s;    //...1
  !seq_b_core        : SEQ_B_CORE creg_seq_s;      //...2
  !seq_psw_core      : SEQ_PSW_CORE creg_seq_s;    //...3
  !seq_ip_core       : SEQ_IP_CORE creg_seq_s;     //...4
  !seq_ie_core       : SEQ_IE_CORE creg_seq_s;     //...5
  !seq_rx0_core      : SEQ_RX0_CORE creg_seq_s;    //...6
  !seq_rx1_core      : SEQ_RX1_CORE creg_seq_s;    //...7
  !seq_tx0_core      : SEQ_TX0_CORE creg_seq_s;    //...8
  !seq_tx1_core      : SEQ_TX1_CORE creg_seq_s;    //...9
  !seq_smap8_core    : SEQ_SMAP8_CORE creg_seq_s;  //...10
  !seq_dph_core      : SEQ_DPH_CORE creg_seq_s;    //...11
  !seq_dpl_core      : SEQ_DPL_CORE creg_seq_s;    //...12
  !seq_sp_core       : SEQ_SP_CORE creg_seq_s;     //...13
  !seq_th0_core      : SEQ_TH0_CORE creg_seq_s;    //...14
  !seq_th1_core      : SEQ_TH1_CORE creg_seq_s;    //...15
  !seq_tm0_core      : SEQ_TM0_CORE creg_seq_s;    //...16
  !seq_tm1_core      : SEQ_TM1_CORE creg_seq_s;    //...17
  !seq_tl0_core      : SEQ_TL0_CORE creg_seq_s;    //...18
  !seq_tl1_core      : SEQ_TL1_CORE creg_seq_s;    //...19
            
   post_generate() is also {
      message(LOW, me, " " );
   }; 
 
    !num_pkt: byte;
    keep num_pkt in [0..19];
    
    
    body() @driver.clock is only {
      out ("entrando gerar sequencia");
      
      
      var num_pkt_aux:byte;
      
      do seq_reset;
      
      for i from 1 to 1000 {
         gen num_pkt;
         case {
            num_pkt == 0  { do seq_reset      };
            num_pkt == 1  { do seq_acc_core   };
            num_pkt == 2  { do seq_b_core     };
            num_pkt == 3  { do seq_psw_core   };
            num_pkt == 4  { do seq_ip_core    };
            num_pkt == 5  { do seq_ie_core    };  
            num_pkt == 6  { do seq_rx0_core   };
            num_pkt == 7  { do seq_rx1_core   };
            num_pkt == 8  { do seq_tx0_core   };
            num_pkt == 9  { do seq_tx1_core   };
            num_pkt == 10 { do seq_smap8_core };
            num_pkt == 11 { do seq_dph_core   };
            num_pkt == 12 { do seq_dpl_core   };
            num_pkt == 13 { do seq_sp_core    };
            num_pkt == 14 { do seq_th0_core   };
            num_pkt == 15 { do seq_th1_core   };  
            num_pkt == 16 { do seq_tm0_core   };
            num_pkt == 17 { do seq_tm1_core   };
            num_pkt == 18 { do seq_tl0_core   };
            num_pkt == 19 { do seq_tl1_core   };
         };
      };
      stop_run();
   }; //body ()...
}; // extend creg_seq_s

'>
