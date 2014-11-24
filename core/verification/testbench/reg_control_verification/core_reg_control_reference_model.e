<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_reg_control_reference_model.e
// Module Name : Core_reg_control
// Author : Dino Casse, Harney Abrahim
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_reg_control - core register control
// -----------------------------------------------------------------------------
// Purpose: checker to the core_reg_control. This model reproduce the
// behaviour in the specification. According to this reference model the DUT 
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

extend core_reg_control_mon_u {
   reference_model() @clock_e is also {
      out ("Starting Reference Model");
      
      var count:uint(bits:2);
        
      // put the reference model here
    
      wait @core_reg_control_reset_rise;
     
      wait [2] * cycle;
       
      
   };
};

'>
