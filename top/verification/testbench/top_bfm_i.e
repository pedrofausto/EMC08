<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_bfm_i.e
// Module Name : TOP
// Author :  Harney Abrahim
// E-mail :  diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: This unit will drive the interface signals of the router DUT. 
// It will get an instance of a packet it is to drive from the sequence driver
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus(), send_pkt()
// Include Files: top_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_bfm_i_h;

extend top_bfm_i_u {
     //////////////////// INPUT PORTS  ///////////////////////////////
   !p_top_reset_i: inout simple_port of bit;
   
   !p_top_p0_y_i: inout simple_port of uint(bits:8);
   !p_top_p1_y_i: inout simple_port of uint(bits:8);
   !p_top_p2_y_i: inout simple_port of uint(bits:8);
   !p_top_p3_y_i: inout simple_port of uint(bits:8);
   
   !p_top_ea_b_i: inout simple_port of bit;
   
   !p_top_pht_i: inout simple_port of bit;
   
   !p_top_test_mode_i: inout simple_port of bit;
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: top_signal_type;

      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
  
   // function to send signal packets to the DUT
   send_pkt(in_pkt: top_signal_type) @clock_e is only {
      // ports receive the signal from bfm according to the generated sequences
      var period: int = 25;
      var cm: int = 100;
      
      case sys.feature {
         feature_core: {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
         
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait delay (1 * cm);
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         }; //end feature core
         -----------------------------------------------
         feature_behave {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
               wait delay (50);
            } else {
               if (sys.serial_tx == 1) {
                  
                  message(LOW, "Stimuling BFM Serial reception ");
                  p_top_test_mode_i$ = 0;
                  p_top_reset_i$   = 1;
                  p_top_ea_b_i$    = 1;
                  p_top_pht_i$     = 0;
                  p_top_p3_y_i$[3:3]    = 1;
                  p_top_p3_y_i$[1:1]    = 1;
                  p_top_p3_y_i$[2:2]    = 1;
                  p_top_p3_y_i$[0:0]    = 1;
                  wait delay (22 * cm);
                  wait delay (512 * cm);
                  wait delay (512 * cm);
                  
                  wait delay (57 * cm);
                  
                  
                  p_top_p3_y_i$[0:0]    = 0; //start bit
                  wait delay (512 * cm);
                  p_top_p3_y_i$[0:0]    = 1; 
                  wait delay (512 * cm);
                  p_top_p3_y_i$[0:0]    = 1;
                  wait delay (512 * cm);
                     p_top_p3_y_i$[0:0]    = 0;
                  wait delay (512 * cm);
                     p_top_p3_y_i$[0:0]    = 0;
                  wait delay (512 * cm);
                     p_top_p3_y_i$[0:0]    = 1;
                  wait delay (512 * cm);
                     p_top_p3_y_i$[0:0]    = 1;
                  wait delay (512 * cm);
                     p_top_p3_y_i$[0:0]    = 0;
                  wait delay (512 * cm);
                     p_top_p3_y_i$[0:0]    = 1;
                  wait delay (512 * cm);
                  p_top_p3_y_i$[0:0]    = 1; //stopbit bit
                  wait delay (512 * cm);
                  
                  wait delay (28 * cm);   
                  wait delay (512 * cm);
                  
                  sys.serial_tx = 0;
               } else {
               
               case in_pkt.pkt_kind {
                  DEFAULT: {
                             case sys.opcode {
                              //stimuli to external interrupts
                              8'h01: { //external int_0 by edge / int_1 by level
                                 message(LOW, "Begin BFM - Timer 0 and 1");
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = 1;
                                 p_top_ea_b_i$    = 1;
                                 p_top_pht_i$     = 0;
                                 p_top_p3_y_i$[3:3]    = 0;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 // external in int_1 - 2 cm
                                 wait delay (15 * cm);
                                 message(LOW, "Begin stimuli int_1");
                                 wait delay (50);
                                 wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 wait delay (50);
                                 wait delay (50);
                                 wait delay (50);
                                 wait delay (50);
                                 wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 0;
                                 
                                 //by level in int_1
                                 wait delay (16 * cm);
                                 message(LOW, "End BFM - Timer 0 and 1")
                              }; //end 8'h01
                              ---------------------------------------------------
                              8'h21: { 
                                 message(LOW, "Begin BFM TXRX");
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = 1;
                                 p_top_ea_b_i$    = 1;
                                 p_top_pht_i$     = 0;
                                 p_top_p3_y_i$[3:3]    = 1;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 wait delay (13 * cm);
                                 message(LOW, "end BFM TXRX");
                              }; //end 8'h41
                              ---------------------------------------------------
                              8'h41: { //external int_0 by edge / int_1 by level
                                 message(LOW, "Begin int_0 by edge - External interrupt");
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = 1;
                                 p_top_ea_b_i$    = 1;
                                 p_top_pht_i$     = 0;
                                 p_top_p3_y_i$[3:3]    = 1;
                                 //by edge - in int_0
                                 p_top_p3_y_i$[2:2]    = 1;
                                 wait delay (3 * cm);
                                 wait delay (50);
                                 wait delay (50);
                                 p_top_p3_y_i$[2:2]    = 0;
                                 wait delay (1 * cm);
                                 
                                 //by level in int_1
                                 message(LOW, "Begin int_1 by level");
                                 wait delay (2 * cm);
                                 //wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 wait delay (6 * cm);
                                 p_top_p3_y_i$[3:3]    = 0;
                                 wait delay ( cm);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 wait delay (11 * cm);
                                 message(LOW, "end int_1 by level");
                              }; //end 8'h41
                              ---------------------------------------------------
                              8'h61: { //external int_0 by edge / int_1 by level
                                 message(LOW, "Begin BFM Timer 2");
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = 1;
                                 p_top_ea_b_i$    = 1;
                                 p_top_pht_i$     = 0;
                                 p_top_p3_y_i$[3:3]    = 1;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 //by level in int_1
                                 //message(LOW, "Begin int_1 by level");
                                 wait delay (2 * cm);
                                 //wait delay (50);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 wait delay (6 * cm);
                                 p_top_p3_y_i$[3:3]    = 0;
                                 wait delay ( cm);
                                 p_top_p3_y_i$[3:3]    = 1;
                                 wait delay (8 * cm);
                                 message(LOW, "End BFM Timer 2");
                              }; //end 8'h61
                              ---------------------------------------------------
                              8'h81: { 
                                 message(LOW, "Stimuling BFM Serial ");
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = 1;
                                 p_top_ea_b_i$    = 1;
                                 p_top_pht_i$     = 0;
                                 p_top_p3_y_i$[3:3]    = 1;
                                 p_top_p3_y_i$[1:1]    = 1;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 p_top_p3_y_i$[0:0]    = 1;
                                 wait delay (5 * cm);
                                 wait delay (22 * cm);
                                 
                                 
                                 wait delay (57 * cm);
                                 
                                 
                                 p_top_p3_y_i$[0:0]    = 0; //start bit
                                 wait delay (16 * cm);
                                 p_top_p3_y_i$[0:0]    = sys.data_rx[7:7]; //first lsb 
                                 wait delay (16 * cm);
                                 p_top_p3_y_i$[0:0]    = sys.data_rx[6:6]; //1 bit
                                 wait delay (16 * cm);
                                  p_top_p3_y_i$[0:0]    = sys.data_rx[5:5]; //2 bit
                                 wait delay (16 * cm);
                                  p_top_p3_y_i$[0:0]    = sys.data_rx[4:4]; //3 bit
                                 wait delay (16 * cm);
                                  p_top_p3_y_i$[0:0]    = sys.data_rx[3:3]; //4 bit
                                 wait delay (16 * cm);
                                  p_top_p3_y_i$[0:0]    = sys.data_rx[2:2]; //5 bit
                                 wait delay (16 * cm);
                                  p_top_p3_y_i$[0:0]    = sys.data_rx[1:1]; //6 bit
                                 wait delay (16 * cm);
                                  p_top_p3_y_i$[0:0]    = sys.data_rx[0:0]; //7 bit
                                 wait delay (16 * cm);
                                 p_top_p3_y_i$[0:0]    = 1; //stopbit bit
                                 wait delay (16 * cm);
                                 
                                 wait delay (28 * cm);
                                 
                                 message(LOW, "End BFM Serial ");
                              }; //end 8'h81 - serial
                              ---------------------------------------------------
                              8'hA1: { 
                                 message(LOW, "Stimuling BFM Ports ");
                                 p_top_p0_y_i$    = 8'd0;
                                 p_top_p1_y_i$    = 8'd0;
                                 p_top_p2_y_i$    = 8'd0;
                                 p_top_p3_y_i$[7:4]  = 4'd0; 
                                 p_top_p3_y_i$[1:0]  = 2'd0; 
                                 
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = 1;
                                 p_top_ea_b_i$    = 1;
                                 p_top_pht_i$     = 0;
                                 p_top_p3_y_i$[3:3]    = 1;
                                 p_top_p3_y_i$[2:2]    = 1;
                                 wait delay (4 * cm);
                                 //wait delay (50);
                                 wait delay (38);
                                 p_top_p0_y_i$    = sys.op3;
                                 wait delay (2 * cm);
                                 p_top_p1_y_i$    = sys.op1;
                                 wait delay (3 * cm);
                                 p_top_p2_y_i$    = sys.op2;
                                 wait delay (3 * cm);
                                 p_top_p3_y_i$    = sys.op3;
                                 wait delay (2 * cm);
                                 wait delay (12);
                                 wait delay (50);
                                 message(LOW, "end BFM Ports ");
                              }; //end 8'h61
                              default: {
                                 p_top_test_mode_i$ = 0;
                                 p_top_reset_i$   = in_pkt.top_reset_i;
                                 p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                                 p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                                 p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                                 p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                                 p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                                 p_top_pht_i$     = in_pkt.top_pht_i;
                                 wait delay (1 * cm);
                              }; //end defaut
                           };// end case sys.opcode
                     
                  };//end DEFAULT
                  ---------------------------------------------------
                  [SEQ_INT_0_high, SEQ_INT_0_low]: {
                     p_top_test_mode_i$ = 0;
                     p_top_p3_y_i$[7:3]    = 5'd0;
                     p_top_p3_y_i$[1:0]    = 2'd0;
                     p_top_p3_y_i$[2:2]    = in_pkt.int_0;
                     
                     
                     p_top_reset_i$   = in_pkt.top_reset_i;
                     p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                     p_top_pht_i$     = in_pkt.top_pht_i;
                  wait delay (cm / 2);
                  };// end SEQ_INT_1_high
                  ---------------------------------------------------
                  SEQ_INT_0_LEVEL: {
                     p_top_p3_y_i$[7:3]    = 5'd0;
                     p_top_p3_y_i$[1:0]    = 2'd0;
                     p_top_p3_y_i$[2:2]    = in_pkt.int_0;
                     p_top_reset_i$   = in_pkt.top_reset_i;
                     p_top_test_mode_i$ = 0;
                     p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                     p_top_pht_i$     = in_pkt.top_pht_i;
                  wait delay (3*cm);
                  };// end SEQ_INT_0_LEVEL
                  default: {
                  };//end default
               }; //end case in_pkt_kind
            
               };//end if (serial_tx)
            }; //end else pkt_kind == RESET
         };// end feature_interrupt
         -----------------------------------------------
         feature_ports {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_test_mode_i$ = 0;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait [1100] * cycle;
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         };// end feature_interrupt
         -----------------------------------------------
         feature_timers: {
            if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_test_mode_i$ = 0;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$[0:0]    = 0;
                  p_top_p1_y_i$[7:2]    = 5'd0;
                  
                  p_top_p1_y_i$[1:1]    = 1;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait delay (2000 * cm);
                  p_top_p1_y_i$[1:1]    = 0;
                  wait delay (50 * cm);
                  p_top_p1_y_i$[1:1]    = 1;
                  wait delay (500 * cm);
                  
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         }; //end feature core
         default: {
          if (in_pkt.pkt_kind == RESET) {
               out("Reseting the system");
               p_top_reset_i$    = 1;
               wait [1] * cycle;
               p_top_reset_i$    = 0;
               wait delay (250);
               wait cycle;
               p_top_reset_i$      = 1;
            } else {
               if (in_pkt.pkt_kind == DEFAULT) {
                  p_top_reset_i$   = in_pkt.top_reset_i;
                  p_top_test_mode_i$ = 0;
                  p_top_p0_y_i$    = in_pkt.top_p0_y_i;
                  p_top_p1_y_i$    = in_pkt.top_p1_y_i;
                  p_top_p2_y_i$    = in_pkt.top_p2_y_i;
                  p_top_p3_y_i$    = in_pkt.top_p3_y_i; 
                  p_top_ea_b_i$    = in_pkt.top_ea_b_i;
                  p_top_pht_i$     = in_pkt.top_pht_i;
                  wait [1100] * cycle;
               }; //end if pkt_kind == Deafult
            }; //end else pkt_kind == RESET
         }; // end default
      }; //end case feature

      
   }; //end send_pkt
};

'>
