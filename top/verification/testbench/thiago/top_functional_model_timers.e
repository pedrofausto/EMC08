<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model_timers.e
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
   
   functional_model_timers() @clock_e is also {
      message (LOW, "Starting Functional Model of Core TOP Verification");
      
      var opcode:uint(bits:8);
      
      var semi_cycle: int = 25;
      var machine_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
        
      case sys.feature {
         
         feature_timers:   {
            
                           }; //feature_timers
     
                           
         default:          {
                              out ("entrou default feature");
                           };
      
      }; //case feature
         
   }; // end reference model
   
};



'>
