<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_mon_h.e
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
// Keywords: top - core top module, phy - physical, mon - monitor
// -----------------------------------------------------------------------------
// Purpose: This class defines the monitored events
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: watch_bus(), reference_model(), run()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

unit top_mon_u like top_phy_u {
   // create a signal packet that the monitor will observed
   !pkt: top_signal_type;
  
   // connect the main clock to the monitor
   event clock_e;

   // event to detect a right packet or not
   event pkt_detected_e; 
  
   // function that monitoring the bus according to the posedge clock event
   watch_bus() @clock_e is {
   };
  
   // interface to the reference model method
   functional_model() @clock_e is {
   };

   functional_model_ports() @clock_e is {};
   functional_model_interrupt() @clock_e is {};
   functional_model_serial() @clock_e is {};
   functional_model_timers() @clock_e is {};
   functional_model_core() @clock_e is {};
   functional_model_behave() @clock_e is {};
   
   // interface to the input packets in the monitor
   when TOP_IN  top_mon_u {
   };
   
   // interface to the output packets in the monitor
   //when TOP_OUT toph_mon_u {
   //}; 
  
   run() is also {
      // start the watch bus function that monitoring full time the bus
      start watch_bus();  
   };
};

'>
