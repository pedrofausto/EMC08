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

   p_serial_tx: inout simple_port of bit is instance;
   p_sfr_wr_data: inout simple_port of uint(bits:8) is instance; 
   p_port3_0: inout simple_port of bit is instance;
   p_port3_1: inout simple_port of bit is instance;
   p_baud_rate: inout simple_port of bit is instance;


   p_sfr_ren: inout simple_port of bit is instance;
   p_sfr_es:  inout simple_port of bit is instance;
   
    ///////// Connect the ports to the external design
   keep bind (p_top_reset_i, external); 
   
   //////////// INPUTS ///////////////////////////////
   keep bind (p_top_p0_y_i, external);
   keep bind (p_top_p1_y_i, external);
   keep bind (p_top_p2_y_i, external);
   keep bind (p_top_p3_y_i, external);
    
   keep bind (p_top_ea_b_i, external);
   
   keep bind (p_top_pht_i, external);

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

   keep bind (p_serial_tx, external); 
   keep bind (p_sfr_wr_data, external); 
   keep bind (p_port3_0, external); 
   keep bind (p_port3_1, external);
   keep bind (p_baud_rate, external);

   keep bind (p_sfr_ren, external);
   keep bind (p_sfr_es, external);
      

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

   keep p_serial_tx.hdl_path()         == "EMC_TOP_INSTANCE.core_serial_tx_o";
   keep p_sfr_wr_data.hdl_path()       == "EMC_TOP_INSTANCE.CORE_INSTANCE.fsm_reg_ctrl_data"; 
   keep p_port3_0.hdl_path()           == "top_p3_a_o[0]";
   keep p_port3_1.hdl_path()           == "top_p3_a_o[1]";
   keep p_baud_rate.hdl_path()         == "EMC_TOP_INSTANCE.baud_rate_br_o";
 
   keep p_sfr_ren.hdl_path()           == "EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.sfr[17][4]";
   keep p_sfr_es.hdl_path()            == "EMC_TOP_INSTANCE.CORE_INSTANCE.reg_ctrl.sfr[21][4]";
      
   };
  
   //when TOP_OUT top_sig_u {
      // Path specification to the TOP IN signals INPUTS
      //////////////////// INPUT PORTS  ///////////////////////////////
   //};
};

'>
