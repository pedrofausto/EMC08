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
         feature_interrupt:   {
            case sys.testcase {
               testcase1: {
                  while TRUE {
                     wait @port1;
                     var port1_opcode: uint(bits:8) = p_top_p1_a_o$;
                     
                     case port1_opcode {
                        8'h41: { message (LOW, "Checking External Interrupt");
                           wait delay (ma_cycle);
                           var op1: uint(bits:8) = p_top_p1_a_o$;
                           wait delay (3 * (ma_cycle));
                           //check_a_p1(op1+1);
                        };//end INC_D
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
