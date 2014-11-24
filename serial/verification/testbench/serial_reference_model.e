<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_reference_model.e
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
// Keywords: br - baud rate
// -----------------------------------------------------------------------------
// Purpose: Reference model to the Baud Rate block. This model reproduce the
// behaviour in the specification. According to this reference model the DUT 
// will be verified
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
// Include Files: serial_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend serial_mon_u {
   reference_model() @clock_e is also {
      out ("Starting Reference Model");
      
      var count:uint(bits:2);
      
      wait [40]*cycle;
        
      // put the reference model here
    
//      wait @start_recep_mode0    ;
//      out ("start transmission") ;
//      wait [8] * cycle           ;
      
      
      
      
      
      
//      wait @serial_start_rise;
//      out ("start rise");
//      wait [9] * cycle;
       
//      while (TRUE) 
//      {
//         if (BR_CM_p$ == 1)
//         {
//            out ("SERIAL_CM ERROR, need to be 0");
  //       };
         
//         check that (SERIAL_CM_p$ == 0);
  //       wait [4] * cycle;
         
    //     if (SERIAL_CM_p$ == 0) 
      //   {
//            out ("SERIAL_CM ERROR, need to be 1");
  //       };
    //     check that (SERIAL_CM_p$ == 1);
      //   wait [4] * cycle;   
//      };
   };
};

'>
