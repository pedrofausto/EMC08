<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_mon_h.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Header file for methods of monitor. Call watch_bus()
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: none
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

unit mc_mon_u like mc_phy_u {
   // create a signal packet that the monitor will observed
   pkt: mc_packet_type;
  
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
   when MC_IN  mc_mon_u {
   };
   
   // interface to the output packets in the monitor
   when MC_OUT mc_mon_u {
   }; 
   load_rom() is {};
   
   load_ram() is {};
   
   run() is also {
     out("ROM MEMORY DATA START LOADING...");
     load_rom();
     out("ROM MEMORY DATA LOADED...");
     out("RAM MEMORY DATA START LOADING...");
     load_ram();
     out("RAM MEMORY DATA LOADED...");
     
     start watch_bus();  
   };
   
};

'>
