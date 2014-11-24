<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_mon_h.e
// Module Name : Core_fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 02/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finite state machine, phy - physical, mon - monitor
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

unit core_fsm_mon_u like core_fsm_phy_u {
   // create a signal packet that the monitor will observed
   !pkt: core_fsm_signal_type;
  
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
   when CORE_FSM_IN  core_fsm_mon_u {
   };
   
   // interface to the output packets in the monitor
   when CORE_FSM_OUT core_fsm_mon_u {
   }; 
  
   by_two_complement (number:uint(bits:8)) :uint(bits:8) is {};
   
   check_sfr_addr_o (addr: uint(bits:8)) is {};
   check_rom_addr_o (addr: uint(bits:16)) is {};
   check_ram_addr_o (addr: uint(bits:8)) is {};
   
   check_alu_op1_o (op: uint(bits:8)) is {};
   check_alu_op2_o (op: uint(bits:8)) is {};
   check_alu_opcode_o (opcode: uint(bits:5)) is {};
   check_alu_en_o_rise () is {};
   check_alu_en_o_fall () is {};
   
   check_sfr_data_o (data: uint(bits:8)) is {};
   check_ram_data_o (data: uint(bits:8)) is {};
   
   check_ext_ram_o_rise () is {};
   check_ext_ram_o_fall () is {};
   
   check_serial_tx_o_rise () is {};
   check_serial_tx_o_fall () is {};
   
   check_byte_flag_o_rise () is {};
   check_byte_flag_o_fall () is {};
   
   check_rom_rd_o_rise () is {};
   check_rom_rd_o_fall () is {};
   
   check_ram_rd_o_rise () is {};
   check_ram_rd_o_fall () is {};
   
   check_sfr_rd_o_rise () is {};
   check_sfr_rd_o_fall () is {};
   
   check_ram_wr_o_rise () is {};
   check_ram_wr_o_fall () is {};
   
   check_sfr_wr_o_rise () is {};
   check_sfr_wr_o_fall () is {};
   
   check_int_na_o_rise () is {};
   check_int_na_o_fall () is {};
   
   check_int_rdy_o_rise () is {};
   check_int_rdy_o_fall () is {};

   // ---------------------------------
   // Added by Dino
   // ---------------------------------
   check_sfr_cy_o (cy: bit) is {};
   // ---------------------------------
   
   run() is also {
      // start the watch bus function that monitoring full time the bus
      start watch_bus();  
   };
};

'>
