<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_sig.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial versions
// -----------------------------------------------------------------------------
// Keywords: top - top module, sig - signal map
// -----------------------------------------------------------------------------
// Purpose: Map the external signals to the verification environment
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
// Include Files: top_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import top_sig_h;

extend top_sig_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   p_top_reset_i: inout simple_port of bit is instance;
   
   p_top_p0_y_i: inout simple_port of uint(bits:8) is instance;
   p_top_p1_y_i: inout simple_port of uint(bits:8) is instance;
   p_top_p2_y_i: inout simple_port of uint(bits:8) is instance;
   p_top_p3_y_i: inout simple_port of uint(bits:8) is instance;
   
   p_top_ea_b_i: inout simple_port of bit is instance;
   
   p_top_pht_i: inout simple_port of bit is instance;
   
   p_top_test_mode_i: inout simple_port of bit is instance;
   ///////////////////  INTERNAL PORTS ////////////////////////////
   p_top_fsm_pc: inout simple_port of uint(bits:16) is instance;
   p_top_baud_rate: inout simple_port of bit is instance; 
   p_top_serial_tx: inout simple_port of bit is instance;   
   
   //p_top_int_0: inout simple_port of bit is instance;
   //p_top_int_0: inout simple_port of bit is instance;
   ///////////////////  OUTPUT PORTS //////////////////////////////
   p_top_p0_en_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p1_en_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p2_en_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p3_en_o: inout simple_port of uint(bits:8) is instance; 
   
   p_top_p0_a_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p1_a_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p2_a_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p3_a_o: inout simple_port of uint(bits:8) is instance; 
   p_top_p4_a_o: inout simple_port of uint(bits:8) is instance; 
   
   p_top_psen_b_o: inout simple_port of bit is instance;
   
   
    ///////// Connect the ports to the external design
   keep bind (p_top_reset_i, external); 
   
   //////////// INPUTS ///////////////////////////////
   keep bind (p_top_p0_y_i, external);
   keep bind (p_top_p1_y_i, external);
   keep bind (p_top_p2_y_i, external);
   keep bind (p_top_p3_y_i, external);
    
   keep bind (p_top_ea_b_i, external);
   
   keep bind (p_top_pht_i, external);

   keep bind (p_top_test_mode_i, external);
   
   /////////////////// INTERNAL PORTS ////////////
   keep bind (p_top_fsm_pc, external);
   keep bind (p_top_baud_rate, external);
   keep bind (p_top_serial_tx, external);
   
   /////////////////// OUTPUTS ///////////////////
   keep bind (p_top_p0_en_o, external);  
   keep bind (p_top_p1_en_o, external);  
   keep bind (p_top_p2_en_o, external);  
   keep bind (p_top_p3_en_o, external);  
   
   keep bind (p_top_p0_a_o, external);  
   keep bind (p_top_p1_a_o, external);  
   keep bind (p_top_p2_a_o, external);  
   keep bind (p_top_p3_a_o, external);  
   keep bind (p_top_p4_a_o, external);  
   
   keep bind (p_top_psen_b_o, external); 
      

   when TOP_IN top_sig_u {
   // Path specification to the TOP IN signals INPUTS
   keep p_top_reset_i.hdl_path()       == "top_reset_i"; 
   
   //////////// INPUTS ///////////////////////////////
   keep p_top_p0_y_i.hdl_path()        == "top_p0_y_i";
   keep p_top_p1_y_i.hdl_path()        == "top_p1_y_i";
   keep p_top_p2_y_i.hdl_path()        == "top_p2_y_i";
   keep p_top_p3_y_i.hdl_path()        == "top_p3_y_i";
   
   keep p_top_ea_b_i.hdl_path()        == "top_ea_b_i";
   
   keep p_top_pht_i.hdl_path()         == "top_pht_i";

   keep p_top_test_mode_i.hdl_path()   == "top_test_mode_i";
   
   /////////////////// INTERNAL PORTS /////////////
   keep p_top_fsm_pc.hdl_path()        == "EMC_TOP_INSTANCE/CORE_INSTANCE/fsm/fsm_rom_addr_o";
   keep p_top_baud_rate.hdl_path()        == "EMC_TOP_INSTANCE/BAUD_RATE_INSTANCE/baud_rate_br_o";
   keep p_top_serial_tx.hdl_path()        == "EMC_TOP_INSTANCE/CORE_INSTANCE/reg_ctrl.reg_ctrl_serial_tx_o";
   
   
   /////////////////// OUTPUTS ///////////////////
   keep p_top_p0_en_o.hdl_path()       == "top_p0_en_o";  
   keep p_top_p1_en_o.hdl_path()       == "top_p1_en_o";  
   keep p_top_p2_en_o.hdl_path()       == "top_p2_en_o";  
   keep p_top_p3_en_o.hdl_path()       == "top_p3_en_o";  
   
   keep p_top_p0_a_o.hdl_path()        == "top_p0_a_o";  
   keep p_top_p1_a_o.hdl_path()        == "top_p1_a_o";  
   keep p_top_p2_a_o.hdl_path()        == "top_p2_a_o";  
   keep p_top_p3_a_o.hdl_path()        == "top_p3_a_o";  
   keep p_top_p4_a_o.hdl_path()        == "top_p4_a_o";  
   
   keep p_top_psen_b_o.hdl_path()      == "top_psen_b_o"; 
      
   };
  
   //when TOP_OUT top_sig_u {
      // Path specification to the TOP IN signals INPUTS
      //////////////////// INPUT PORTS  ///////////////////////////////
   //};
};

'>
