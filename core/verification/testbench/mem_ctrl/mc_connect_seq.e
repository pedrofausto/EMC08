<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_connect_seq.e
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
// Purpose: Instantiates the driver and connect to main clock. Point to driver
// in mc_bfm_i_u
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: get_pkt(), its_done()
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------
extend ACTIVE MC_IN mc_agent_u {
   // driver isntance to generate the input packet
   driver: mc_driver_u is instance;
  
   // reference the agent as the driver father
   keep driver.agent == me;

   // reference the bfm driver to this object
   keep bfm.driver == driver;
};

extend mc_driver_u {
   // pointer to the agent
   agent: mc_agent_u;
  
   // connect to the main clock event
   event clock is only @agent.main_clk;
};

extend mc_bfm_i_u {	
   // bfm pointer to the driver
   driver: mc_driver_u; 
  
   // method that get a packet from driver
   get_pkt(): mc_packet_type @clock_e is also {
      // get the next packet comming from driver
      result = driver.get_next_item();
   };
  
   its_done() is also {
      // method to say that a new item out form driver
      emit driver.item_done;
   };
};

'>

