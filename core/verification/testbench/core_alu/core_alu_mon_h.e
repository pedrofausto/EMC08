<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_alu_mon_h.e
// Module Name : Core
// Author : Dino Cassel
// E-mail : diga8@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: alu - aritmetic and logic unit, phy - physical, mon - monitor
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

unit core_alu_mon_u like core_alu_phy_u {
   // create a signal packet that the monitor will observed
   !pkt: core_alu_signal_type;
  
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
   when CORE_ALU_IN core_alu_mon_u {
   };

   // interface to the output packets in the monitor
   when CORE_ALU_OUT core_alu_mon_u {
   }; 
  
   run() is also {
      // start the watch bus function that monitoring full time the bus
      start watch_bus();  
   };
};

'>
