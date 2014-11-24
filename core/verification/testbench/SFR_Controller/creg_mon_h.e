<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_mon_h.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, phy - physical, mon - monitor
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

unit creg_mon_u like creg_phy_u {
   // create a signal packet that the monitor will observed
   !pkt: creg_signal_type;
  
   // connect the main clock to the monitor
   event clock_e;

   // event to detect a right packet or not
   event pkt_detected_e; 
  
   // function that monitoring the bus according to the posedge clock event
   watch_bus() @clock_e is {
   };
  
   // interface to the reference model method
   reference_model() @clock_e is {
   };

   // interface to the input packets in the monitor
   when CREG_IN  creg_mon_u {
   };
   
   // interface to the output packets in the monitor
   when CREG_OUT creg_mon_u {
   }; 
  
   run() is also {
      // start the watch bus function that monitoring full time the bus
      start watch_bus();  
   };
};

'>
