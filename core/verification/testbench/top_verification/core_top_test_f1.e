<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_test_f1.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core top module, testcase, test
// -----------------------------------------------------------------------------
// Purpose: Testcase to control generation of sequences
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
// Include Files: core_top_config
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------


// feature 1: verify write and read in SFR. OK
// feature 2: verify a jmp in PC. OK
// feature 3: verify write and read in RAM. 
// feature 4: verify ALU, some MOV operations, MOV BIT, and ALU carry write.
// LCALL e RET
// MOVC
// MOVX read
// MOVX write
// INTERRUPT (LCALL hardware) and RETI   


import core_top_config;

extend core_top_mon_u {
   keep feature == feature_timers; 
};

extend core_top_signal_type {
   keep soft interrupt_vect_i == 0;
   keep soft bus_ctrl_ea_b_i == 1;
};

extend MAIN core_top_seq_s {
   
   !seq_reset        : SEQ_RESET core_top_seq_s;
   !seq_default      : SEQ_INST_DEFAULT core_top_seq_s;
   opcode            : instruction_set_t;
   
   post_generate() is also {
      message(LOW, me, " >> post_generate()" );
   }; 
 
   body() @driver.clock is only {
      
   
  
   //for i from 0 to (sys.vect_opcodes.size()-1) {
    sys.ind = 0;
    sys.lcall = FALSE;
    sys.lcall_hdw = FALSE;
    sys.jmp_begin = FALSE;
   
    do seq_reset;
    
    for i from 0 to 3000 {
      
      opcode = sys.vect_opcodes[sys.ind];
      do seq_default;
      
//      case opcode.as_a(instruction_set_t) {
//         RESET:           { do seq_reset;        };         
//         default:         { do seq_default;      };
//      };
      
      
      //controling opcode index
      case opcode.as_a(instruction_set_t) {
            LJMP:          { sys.ind = sys.ind+6; 
                             if (sys.lcall == TRUE) {
                                sys.lcall = FALSE;
                                sys.ind = sys.ind+4; 
                             }; 
                           };
            LCALL:         { if (sys.lcall_hdw == FALSE) {
                                sys.ind = sys.ind+7;  sys.lcall = TRUE;
                             };
                           }; 
            RET:           { sys.ind = sys.ind-11; };
            AJMP_1:        { sys.ind = sys.ind+7; };
            INC_A:         { sys.ind_interrupt = sys.ind; sys.ind = 0; sys.lcall_hdw = TRUE};
            RETI:          { sys.ind = sys.ind_interrupt; sys.lcall_hdw = FALSE};
      };
      sys.ind = sys.ind+1;
      
      out("####### Indice: ", sys.ind);      
      //wait sys.inst_bytes[i]*cycle;
            
   };

      stop_run();
   };
};

'>
