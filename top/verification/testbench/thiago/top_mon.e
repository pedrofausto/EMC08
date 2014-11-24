<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_mon.e
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
// Keywords: top - top module, mon - monitor
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to aply to
// the DUT
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
// Include Files: top_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_mon_h;

extend top_mon_u {
   
   //////////////////// INPUT PORTS  ///////////////////////////////
   !p_top_reset_i: inout simple_port of bit;
   
   !p_top_p0_y_i: inout simple_port of uint(bits:8);
   !p_top_p1_y_i: inout simple_port of uint(bits:8);
   !p_top_p2_y_i: inout simple_port of uint(bits:8);
   !p_top_p3_y_i: inout simple_port of uint(bits:8);
   
   !p_top_ea_b_i: inout simple_port of bit;
   
   !p_top_pht_i: inout simple_port of bit;
   
   /////////////////// INTERNAL PORTS ///////////////////////////
   !p_top_fsm_pc: inout simple_port of uint(bits:16);
   
   ///////////////////  OUTPUT PORTS //////////////////////////////
   !p_top_p0_en_o: inout simple_port of uint(bits:8); 
   !p_top_p1_en_o: inout simple_port of uint(bits:8); 
   !p_top_p2_en_o: inout simple_port of uint(bits:8); 
   !p_top_p3_en_o: inout simple_port of uint(bits:8); 
   
   !p_top_p0_a_o: inout simple_port of uint(bits:8); 
   !p_top_p1_a_o: inout simple_port of uint(bits:8); 
   !p_top_p2_a_o: inout simple_port of uint(bits:8); 
   !p_top_p3_a_o: inout simple_port of uint(bits:8); 
   !p_top_p4_a_o: inout simple_port of uint(bits:8); 
   
   !p_top_psen_b_o: inout simple_port of bit;

   !p_serial_tx: inout simple_port of bit;
   !p_sfr_wr_data: inout simple_port of uint(bits:8);
   !p_port3_0: inout simple_port of bit;
   !p_port3_1: inout simple_port of bit;
   !p_baud_rate: inout simple_port of bit;

   !p_sfr_ren: inout simple_port of bit;
   !p_sfr_es:  inout simple_port of bit;
   
   ///////////////////////// EVENTS /////////////////////////
   // events to control the reset state
   event top_reset_rise is rise(p_top_reset_i$)@sim;
   event top_reset_fall is fall(p_top_reset_i$)@sim;
      
   event port4 is (rise(p_top_p4_a_o$)@sim or fall(p_top_p4_a_o$)@sim);
   
   event port1 is (rise(p_top_p1_a_o$)@sim or fall(p_top_p1_a_o$)@sim);

   event serial_tx_rise is (rise(p_serial_tx$)@sim);
   event baud_rate_rise is (rise(p_baud_rate$)@sim);
   event baud_rate_fall is (fall(p_baud_rate$)@sim);
   event port3_0_rise is (rise(p_port3_0$)@sim);
   event port3_0_fall is (fall(p_port3_0$)@sim);
   event port3_1_rise is (rise(p_port3_1$)@sim);
   event port3_1_fall is (fall(p_port3_1$)@sim);


   event rx_event is (rise(p_sfr_ren$)@sim or rise(p_sfr_es$)@sim);
   event sfr_ren_rise is (rise(p_sfr_ren$)@sim);
   event sfr_es_rise is (rise(p_sfr_es$)@sim);

   
   when TOP_IN top_mon_u {
      //////////////////////// TCM METHODS /////////////////////
      watch_bus() @clock_e is also {
         while TRUE {   
            // calls the reference model to check the DUT
            //functional_model();
          
            case sys.feature {
               feature_reset: {functional_model_core();};
               feature_core:  {functional_model_core();};
               feature_ports: { functional_model_ports();};
               feature_timers: {functional_model_timers();};
               feature_serial: {functional_model_serial();};
               feature_interrupt: {functional_model_interrupt();};
            };
            
            // the monitor detected a packet
            emit pkt_detected_e;
          }; 
       };
   };
   
   //when TOP_OUT top_mon_u {
   //};
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      message(LOW, me, " Packet detected on monitor: ", pkt);
   };
   
   /////////////////////////////  CHECKERS //////////////////////////
   
   check_en_p0 (data: uint(bits:8)) is {
      if (p_top_p0_en_o$ != data) { out ("Data en_p0 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p0_en_o$)};
      check that (p_top_p0_en_o$ == data);
   }; //end checker
   
   check_en_p1 (data: uint(bits:8)) is {
      if (p_top_p1_en_o$ != data) { out ("Data en_p1 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p1_en_o$)};
      check that (p_top_p1_en_o$ == data);
   }; //end checker
   
   check_en_p2 (data: uint(bits:8)) is {
      if (p_top_p2_en_o$ != data) { out ("Data en_p2 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p2_en_o$)};
      check that (p_top_p2_en_o$ == data);
   }; //end checker
   
   check_en_p3 (data: uint(bits:8)) is {
      if (p_top_p3_en_o$ != data) { out ("Data en_p3 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p3_en_o$)};
      check that (p_top_p3_en_o$ == data);
   }; //end checker
   
  
   check_a_p0 (data: uint(bits:8)) is {
      if (p_top_p0_a_o$ != data) { out ("Data a_p0 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p0_a_o$)};
      check that (p_top_p0_a_o$ == data);
   }; //end checker
   
   check_a_p1 (data: uint(bits:8)) is {
      if (p_top_p1_a_o$ != data) { out ("Data a_p1 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p1_a_o$)};
      check that (p_top_p1_a_o$ == data);
   }; //end checker
   
   check_a_p2 (data: uint(bits:8)) is {
      if (p_top_p2_a_o$ != data) { out ("Data a_p2 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p2_a_o$)};
      check that (p_top_p2_a_o$ == data);
   }; //end checker
   
   check_a_p3 (data: uint(bits:8)) is {
      if (p_top_p3_a_o$ != data) { out ("Data a_p3 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p3_a_o$)};
      check that (p_top_p3_a_o$ == data);
   }; //end checker
   
   check_a_p4 (data: uint(bits:8)) is {
      if (p_top_p4_a_o$ != data) { out ("Data a_p4 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p4_a_o$)};
      check that (p_top_p4_a_o$ == data);
   }; //end checker
   
   check_psen_b_rise () is {
      if (p_top_psen_b_o$ != 1) {  out ("PSEN_B RISE ERRORRRRR")};
      check that (p_top_psen_b_o$ == 1);
   };
   
   check_psen_b_fall () is {
      if (p_top_psen_b_o$ != 0) {  out ("PSEN_B FALL ERRORRRRR")};
      check that (p_top_psen_b_o$ == 0);
   };
   
   
   
};

'>