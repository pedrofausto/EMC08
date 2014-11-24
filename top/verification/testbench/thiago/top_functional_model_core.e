<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model_core.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module
// -----------------------------------------------------------------------------
// Purpose: checker to the TOP module. This model reproduce the
// behaviour in the specification. According to this functional model the DUT 
// will be verified.
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: reference_model()
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend top_mon_u {
   

   functional_model_core() @clock_e is also {
      message (LOW, "Starting Functional Model of Core TOP Verification");
      
      
      var sp:uint(bits:8) = 8; //initial position
      
      var semi_cycle: int = 25;
      var ma_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
      
      case sys.feature {
         feature_reset:    {
                              message (LOW, "Beggin Feature Reset");
                             
                              wait delay (25); //sync the functional //model
                              
                              wait delay (ma_cycle);
                              message (LOW, sys.time);
                              ////////// PUT HERE CHECKERS //////
                             
                           };
         
         feature_core:     {
                              message (LOW, "Begin Feature Core - Feature 1");
                              case sys.testcase {
                                 testcase1: {
                                    while TRUE {
                                    wait @port1; // wait the port 1 change
                                    var port1_opcode: uint(bits:8) = p_top_p1_a_o$;
                                    
                                    case port1_opcode {
                                       8'h00: { message (LOW, "Checking NOP inst");
                                          wait delay (ma_cycle);
                                       }; //end NOP
                                       ------------------------------------------
                                       8'h05: { message (LOW, "Checking INC_D inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (3 * (ma_cycle));
                                          check_a_p1(op1+1);
                                       };//end INC_D
                                       ------------------------------------------
                                       8'h10: { message (LOW, "Checking JBC inst");
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op3: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var bit_en: int = op2[2:0];
                                          var jmp:bit = op3[bit_en:bit_en];
                                          if (jmp == 1) {
                                             wait delay (3 * (ma_cycle));
                                             check_a_p1 (8'hFF);
                                             wait delay (ma_cycle);
                                          } else {
                                             wait delay (2 * (ma_cycle));
                                          };
                                          check_a_p1 (8'hFE);
                                       }; //end JBC
                                       ------------------------------------------
                                       8'h16: { message (LOW, "Checking DEC_ATR0 inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (4 * (ma_cycle));
                                          check_a_p1(op2 - 1);
                                       }; //end DEC_ATR0 inst
                                       ------------------------------------------
                                       8'h20: { message (LOW, "Checking JB inst");
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle); //jmp
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle);
                                          //always go to jmp
                                          wait delay (3 * (ma_cycle));
                                          check_a_p1 (8'hFF);
                                          wait delay (ma_cycle);
                                          check_a_p1 (8'hFE);
                                       }; //end JB inst
                                       ------------------------------------------
                                       8'h24: { message (LOW, "Checking ADD_A_DATA inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (3 * (ma_cycle));
                                          check_a_p1(op1 + op2);
                                       }; //end ADD_A_DATA inst
                                       ------------------------------------------
                                        8'h30: { message (LOW, "Checking JNB inst");
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle); //jmp
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle);
                                          wait delay (2 * (ma_cycle));
                                          check_a_p1 (8'hFF);
                                          wait delay (1 * (ma_cycle));
                                          check_a_p1 (8'hFE);
                                       }; //end JNB inst
                                       ------------------------------------------
                                       8'h34: { message (LOW, "Checking ADDC_A_DATA inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (3 * (ma_cycle));
                                          //check_a_p1(op1 + op2);
                                          message (LOW, "ADDC_A_DATA whithout checking");
                                       }; //end ADD_A_DATA inst
                                       ------------------------------------------
                                       8'h45: { message (LOW, "Checking ORL_A_D inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op3: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (4 * (ma_cycle));
                                          check_a_p1(op1 | op2);
                                       }; //end ORL_A_D inst
                                       ------------------------------------------
                                       8'h53: { message (LOW, "Checking ANL_D_DATA inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op3: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (3 * (ma_cycle));
                                          check_a_p1(op3 & op2);
                                       }; //end ANL_D_DATA inst
                                       ------------------------------------------
                                       8'h60: { message (LOW, "Checking JZ inst");
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle); //jmp
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          if (op1 == 0) {//jmp
                                             wait delay (4 * (ma_cycle));
                                             check_a_p1 (8'hFF);
                                          }else {//not jmp
                                             wait delay (2 * (ma_cycle));    
                                          };
                                          wait delay (ma_cycle);
                                          check_a_p1 (8'hFE);
                                       }; //end JZ inst
                                       ------------------------------------------
                                       8'h70: { message (LOW, "Checking JNZ inst");
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle); //jmp
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          if (op1 != 0) {//jmp
                                             wait delay (4 * (ma_cycle));
                                             check_a_p1 (8'hFF);
                                          }else {//not jmp
                                             wait delay (2 * (ma_cycle));    
                                          };
                                          wait delay (ma_cycle);
                                          check_a_p1 (8'hFE);
                                       }; //end JNZ inst
                                       ------------------------------------------
                                       8'h83: { message (LOW, "Checking MOVC_A_ATPC inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (2 * ma_cycle);
                                          var pc: uint(bits:16) = p_top_fsm_pc$;
                                          wait delay (ma_cycle);
                                          wait delay (ma_cycle);
                                          //check_a_p1(pc + op1); //ok just looking it
                                       }; //end MOVC_AT_ATPC inst
                                       ------------------------------------------
                                       8'h84: { message (LOW, "Checking DIV_A_B inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (5 * (ma_cycle));
                                          var quoci: uint (bits:8) = op1 / op2;
                                          var rest:uint (bits:8) = op1 % op2;
                                          check_a_p1(quoci);
                                          wait delay (ma_cycle);
                                          check_a_p1(rest);
                                          message (LOW, "DIV_A_B whithout checking");
                                       }; //end DIV_A_B inst
                                       ------------------------------------------
                                       8'h94: { message (LOW, "Checking SUBB_A_DATA inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (3 * (ma_cycle));
                                          check_a_p1(op1 - op2);
                                       }; //end SUBB_A_DATA inst
                                       ------------------------------------------
                                       8'hA4: { message (LOW, "Checking MUL_A_B inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (5 * (ma_cycle));
                                          var quoci: uint (bits:16) = op1 * op2;
                                          check_a_p1(quoci[7:0]);
                                          wait delay (ma_cycle);
                                          check_a_p1(quoci[15:8]);
                                       }; //end DIV_A_B inst
                                       ------------------------------------------
                                       8'hC0: { message (LOW, "Checking PUSH inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (3 * (ma_cycle));
                                          sp = sp + 1;
                                          check_a_p1(sp);
                                          wait delay (ma_cycle);
                                          check_a_p1(op2);
                                       }; //end PUSH inst
                                       ------------------------------------------
                                       8'hD0: { message (LOW, "Checking POP inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var sp1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (7 * (ma_cycle));
                                          check_a_p1(op2);
                                       }; //end POP inst
                                       ------------------------------------------
                                       8'hD6: { message (LOW, "Checking XCHD_A_ATR0 inst");
                                          wait delay (ma_cycle);
                                          var op1: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op2: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (ma_cycle);
                                          var op3: uint(bits:8) = p_top_p1_a_o$;
                                          wait delay (5 * (ma_cycle));
                                          check_a_p1(%{op1[7:4], op3[3:0]});
                                          wait delay (ma_cycle);
                                          check_a_p1(%{op3[7:4], op1[3:0]});
                                       }; //end XCHD_A_ATR0 inst
                                       ------------------------------------------
                                       default: { message(LOW,"Entrou default port1_opcode");
                                       }; //end fefault
                                       
                                    }; //end case port1_opcode
                                    
                                    }; //end WHILE
                                    
                                 }; //ent testcase1
                                 default:{message(LOW,"Entrou default testcase");};
                              }; //end case testcase
                           }; //end feature_core                  
         default: {
                  out ("entrou default feature")
                  };
      
      }; //case feature
   }; // end reference model
};



'>
