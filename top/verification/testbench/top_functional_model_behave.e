<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model_behave.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 26/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      26-10-2010  Initial version
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
 
   functional_model_behave() @clock_e is also {
      message (LOW, "Starting Functional Model Behave of TOP Verification");
      
      var opcode:uint(bits:8);
      
      var semi_cycle: int = 25;
      var ma_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
      wait delay (2 * ma_cycle);  
      wait @port1;
      case sys.feature {
         feature_behave:   {
            case sys.testcase {
               testcase1: {
                  while TRUE {
                     var port1_opcode: uint(bits:8) = p_top_p1_a_o$;
                     sys.opcode = port1_opcode; //to control bfm
                     
                     case port1_opcode {
                        8'h01: { message (LOW, "Checking Timer 0 and 1 functionality and Interrupt");
                           wait delay (17 * ma_cycle);
                           check_a_p1(8'hFF);
                           wait delay (3 * ma_cycle);
                           var op1: uint (bits:8) = p_top_p1_a_o$;
                           wait delay (3 * ma_cycle);
                           check_a_p1(8'hFF);
                           wait delay (3 * ma_cycle);
                           check_a_p1(8'hFE);
                           wait delay (1 * ma_cycle);
                           check_a_p1(op1);
                           wait delay (3 * ma_cycle);
                           check_a_p1(8'hFE);
                           wait delay (1 * ma_cycle);
                           check_a_p1(8'h50);
                           wait delay (4 * ma_cycle);
                        }; // end 01
                     ---------------------------------------------------------
                     8'h21: { message (LOW, "Checking Interrupt functionality TXRX");
                           wait delay (7 * ma_cycle);
                           check_a_p1(8'hFF);
                           wait delay (3 * ma_cycle);
                           check_a_p1(8'hFE);
                           wait delay (1 * ma_cycle);
                           check_a_p1(8'h00);
                           wait delay (1 * ma_cycle);
                        };//end 61
                        -------------------------------------------------------
                        8'h41: { message (LOW, "Checking External Interrupt Functionality");
                           wait delay (9 * ma_cycle);
                           check_a_p1(8'hFF);
                           wait delay (3 * ma_cycle);
                           check_a_p1(8'hFE);
                           wait delay (6 * ma_cycle);
                           check_a_p1(8'hFF);
                           wait delay (3 * ma_cycle);
                           check_a_p1(8'hFE);
                           wait delay (3 * ma_cycle);
                           
                        };//end 41
                        -------------------------------------------------------
                        8'h61: { message (LOW, "Checking Timer 2 functionality");
                           //wait delay (19 * ma_cycle);
                           //check_a_p1(8'hFF);
                           //wait delay (3 * ma_cycle);
                           //check_a_p1(8'hFE);
                           //wait delay (5 * ma_cycle);
                           //check_a_p1(8'hFF);
                           //wait delay (3 * ma_cycle);
                           //check_a_p1(8'hFE);
                           wait @serial_tx_rise; // wait serial tx
                           sys.serial_tx = 1;
                           wait delay (19 * ma_cycle);
                           
                        };//end 61
                        -------------------------------------------------------
                        8'h81: { message (LOW, "Checking Serial and Interrupt Functionality");
                           wait delay (1 * ma_cycle);
                           sys.data_tx = p_top_p1_a_o$;
                           wait delay (1 * ma_cycle);
                           sys.data_rx = p_top_p1_a_o$;
                           
                           
                           wait @serial_tx_rise; // wait serial tx
                           sys.serial_tx = 1;
                           
                           wait @baud_rate_rise; // check tx
                           wait @baud_rate_rise; // check tx
                           wait @baud_rate_rise; // check tx
                           message (LOW, "Check start bit");
                           check_a_p3_1(0); //start bit
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check bit 0");
                           check_a_p3_1(sys.data_tx[0:0]); //0 bit
                           wait @baud_rate_rise;
                           //wait delay (16 * ma_cycle); // check tx
                           message (LOW, "Check bit 1");
                           check_a_p3_1(sys.data_tx[1:1]); //1 bits
                           wait @baud_rate_rise;
                           //wait delay (16 * ma_cycle); // check tx
                           message (LOW, "Check bit 2");
                           check_a_p3_1(sys.data_tx[2:2]); //2 bits
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check bit 3");
                           check_a_p3_1(sys.data_tx[3:3]); //3 bits
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check bit 4");
                           check_a_p3_1(sys.data_tx[4:4]); //4 bits
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check bit 5");
                           check_a_p3_1(sys.data_tx[5:5]); //5 bits
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check bit 6");
                           check_a_p3_1(sys.data_tx[6:6]); //6 bits
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check bit 7");
                           check_a_p3_1(sys.data_tx[7:7]); //7 bit
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check TB8");
                           check_a_p3_1(0); // TB8
                           //wait delay (16 * ma_cycle); // check tx
                           wait @baud_rate_rise;
                           message (LOW, "Check stop bit");
                           check_a_p3_1(1); // stopbit
                           //// inside interrupt TI
                           wait @port1;
                           message (LOW, "Check FF inside TI");
                           check_a_p1(8'hFF);
                           wait @port1;
                           message (LOW, "Check FE back TI");
                           check_a_p1(8'hFE);
                           
                           wait delay (40 * ma_cycle);
                           wait @port1;
                           message (LOW, "Check FF inside RI");
                           check_a_p1(8'hFF);
                           wait delay (5 * ma_cycle);
                           wait @port1;
                           message (LOW, "Check FE back RI");
                           check_a_p1(8'hFE);
                           wait delay (1 * ma_cycle);
                           message (LOW, "Check SBUF data");
                           check_a_p1(sys.data_rx);
                           wait delay (2 * ma_cycle);
                           
                        };//end 81 - Serial
                        -------------------------------------------------------
                        8'hA1: { message (LOW, "Checking Ports functionality");
                           wait delay (1 * ma_cycle);
                           sys.op1 = p_top_p1_a_o$;
                           wait delay (1 * ma_cycle);
                           sys.op2 = p_top_p1_a_o$;
                           wait delay (1 * ma_cycle);
                           sys.op3 = p_top_p1_a_o$;
                           //PORT 0 verification
                           wait delay (2 * ma_cycle);
                           var data_check: uint (bits:8);
                           for i from 0 to 7 {
                              if (sys.op1[i:i] == 1) {
                                 data_check[i:i] = sys.op2[i:i];
                              } else {
                                 data_check[i:i] = sys.op3[i:i];
                              };
                           };
                           wait delay (50);
                           message (LOW, "checker P0 data_check = ", data_check);
                           check_a_p0(data_check);
                           //PORT 1 verification///////
                           for i from 0 to 7 {
                              if (sys.op3[i:i] == 1) {
                                 data_check[i:i] = sys.op2[i:i];
                              } else {
                                 data_check[i:i] = sys.op1[i:i];
                              };
                           };
                           wait delay (3 * ma_cycle);
                           message (LOW, "checker P1 data_check = ", data_check);
                           check_a_p1(data_check);
                           //PORT 2 verification///////
                           for i from 0 to 7 {
                              if (sys.op1[i:i] == 1) {
                                 data_check[i:i] = sys.op3[i:i];
                              } else {
                                 data_check[i:i] = sys.op2[i:i];
                              };
                           };
                           wait delay (2 * ma_cycle);
                           message (LOW, "checker P2 data_check = ", data_check);
                           check_a_p2(data_check);
                           //PORT 3 verification///////
                           for i from 0 to 7 {
                              if (sys.op2[i:i] == 1) {
                                 data_check[i:i] = sys.op1[i:i];
                              } else {
                                 data_check[i:i] = sys.op3[i:i];
                              };
                           };
                           wait delay (3 * ma_cycle);
                           message (LOW, "checker P3 data_check = ", data_check);
                           check_a_p3(data_check);
                           //PORT 4 verification///////
                           wait delay (50);
                           message (LOW, "checker P4 data_check");
                           check_a_p4(sys.op3);
                        };//end A1
                        default: {
                           message (LOW, "Reach default port1_opcode");
                        }; //end default port1_opcode
                     };// end case port1_opcode
                      wait delay(1 * ma_cycle);
                  }; //end while 
               };// end testcase1
            }; //end testcase
         
         
         }; //end feature_behave                 
                           
         default:             {
                  out ("entrou default feature")
                              };
      
      }; //case feature
      
   }; // end reference model
   
};



'>
