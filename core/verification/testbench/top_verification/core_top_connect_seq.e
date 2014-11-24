<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_connect_seq.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: core_top - core top module, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: Create the drivers and connect it to the bfm
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
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend ACTIVE CORE_TOP_IN core_top_agent_u {
   // driver isntance to generate the input packet
   driver: core_top_driver_u is instance;
  
   // reference the agent as the driver father
   keep driver.agent == me;

   // reference the bfm driver to this objetc
   keep bfm.driver == driver;
};

extend core_top_driver_u {
   // pointer to the agent
   agent: core_top_agent_u;
  
   // connect to the main clock event
   event clock is only @agent.main_clk;
};

extend core_top_bfm_i_u {	
   // bfm pointer to the driver
   driver: core_top_driver_u; 
  
   // method that get a packet from driver
   get_pkt(): core_top_signal_type @clock_e is also {
      // get the next packet comming from driver
      result = driver.get_next_item();
   };
  
   its_done() is also {
      // method to say that a new item out form driver
      emit driver.item_done;
   };
};

'>

