<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_connect_seq.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 02/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, bfm - bus functional mode
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

extend ACTIVE CORE_FSM_IN core_fsm_agent_u {
   // driver isntance to generate the input packet
   driver: core_fsm_driver_u is instance;
  
   // reference the agent as the driver father
   keep driver.agent == me;

   // reference the bfm driver to this objetc
   keep bfm.driver == driver;
};

extend core_fsm_driver_u {
   // pointer to the agent
   agent: core_fsm_agent_u;
  
   // connect to the main clock event
   event clock is only @agent.main_clk;
};

extend core_fsm_bfm_i_u {	
   // bfm pointer to the driver
   driver: core_fsm_driver_u; 
  
   // method that get a packet from driver
   get_pkt(): core_fsm_signal_type @clock_e is also {
      // get the next packet comming from driver
      result = driver.get_next_item();
   };
  
   its_done() is also {
      // method to say that a new item out form driver
      emit driver.item_done;
   };
};

'>

