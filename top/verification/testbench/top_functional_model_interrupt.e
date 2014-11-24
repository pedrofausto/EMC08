<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model_interrupt.e
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
 
   functional_model_interrupt() @clock_e is also {
      message (LOW, "Starting Functional Model Interrupt of TOP Verification");
      
      var opcode:uint(bits:8);
      
      var semi_cycle: int = 25;
      var ma_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
        
      case sys.feature {
         feature_behave:   {
            case sys.testcase {
               testcase1: {
                  while TRUE {
                     wait @port1;
                     var port1_opcode: uint(bits:8) = p_top_p1_a_o$;
                     sys.opcode = port1_opcode; //to control bfm
                     
                     case port1_opcode {
                     8'h21: { message (LOW, "Checking Interrupt functionality TXRX");
                           wait delay (19 * ma_cycle);
                           //check_a_p1(8'hFF);
                           //wait delay (3 * ma_cycle);
                           //check_a_p1(8'hFE);
                           //wait delay (5 * ma_cycle);
                           //check_a_p1(8'hFF);
                           //wait delay (3 * ma_cycle);
                           wait delay (50);
                           //check_a_p1(8'hFE);
                           
                        };//end 61
                        -------------------------------------------------------
                        default: {
                           message (LOW, "Reach default port1_opcode");
                        }; //end default port1_opcode
                     };// end case port1_opcode
                  }; //end while 
               
               };// end testcase1
            }; //end testcase
         
         
            }; //end feature_interrupt                 
                           
         default:             {
                  out ("entrou default feature")
                              };
      
      }; //case feature
      
   }; // end reference model
   
};



'>
