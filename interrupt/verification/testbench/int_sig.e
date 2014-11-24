<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_sig.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt, sig - signal map
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
// Include Files: int_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import int_sig_h;

extend int_sig_u {

   RESET_i_p     : inout simple_port of bit          is instance;
   INT_EXT_p     : inout simple_port of uint(bits:2) is instance;
   INT_RDY_p     : inout simple_port of bit          is instance;
   INT_NA_i_p    : inout simple_port of bit          is instance;
   INT_CM_i_p    : inout simple_port of bit          is instance;
   REG_IE_i_p    : inout simple_port of uint(bits:8) is instance;
   REG_IP_i_p    : inout simple_port of uint(bits:7) is instance;
   REG_SCON_i_p  : inout simple_port of uint(bits:2) is instance;
   REG_TCON_i_p  : inout simple_port of uint(bits:6) is instance;
   REG_TCON2_i_p : inout simple_port of uint(bits:2) is instance;
   INT_VECT_o_p  : inout simple_port of uint(bits:3) is instance;
   REG_TCON_o_p  : inout simple_port of uint(bits:4) is instance;
   REG_TCON2_o_p : inout simple_port of uint(bits:2) is instance;
   REG_CLR_o_p   : inout simple_port of bit          is instance;
   
   FLAG_IE0_p    : inout simple_port of bit          is instance;
   FLAG_TF0_p    : inout simple_port of bit          is instance;
   FLAG_IE1_p    : inout simple_port of bit          is instance;
   FLAG_TF1_p    : inout simple_port of bit          is instance;
   FLAG_TF2_p    : inout simple_port of bit          is instance;
   FLAG_RI_TI_p  : inout simple_port of uint(bits:2) is instance;
   FLAG_TXRX_p   : inout simple_port of bit          is instance;
   
   
   
   // Connect the ports to the external design
   keep bind (RESET_i_p,     external);
   keep bind (INT_EXT_p,     external);
   keep bind (INT_RDY_p,     external);
   keep bind (INT_NA_i_p,    external);
   keep bind (INT_CM_i_p,    external);
   keep bind (REG_IE_i_p,    external);
   keep bind (REG_IP_i_p,    external);
   keep bind (REG_SCON_i_p,  external);
   keep bind (REG_TCON_i_p,  external);
   keep bind (REG_TCON2_i_p, external);
   keep bind (INT_VECT_o_p,  external);
   keep bind (REG_TCON_o_p,  external);
   keep bind (REG_TCON2_o_p, external);
   keep bind (REG_CLR_o_p,   external);
   
   keep bind (FLAG_IE0_p,   external);
   keep bind (FLAG_TF0_p,   external);
   keep bind (FLAG_IE1_p,   external);
   keep bind (FLAG_TF1_p,   external);
   keep bind (FLAG_TF2_p,   external);
   keep bind (FLAG_RI_TI_p,   external);
   keep bind (FLAG_TXRX_p,   external);

   
   when INT_IN int_sig_u {
      // Path specification to the INT IN signals
      keep RESET_i_p.hdl_path()     == "int_rst_sync_b_i";
      keep INT_EXT_p.hdl_path()     == "int_intx_b_i";
      keep INT_RDY_p.hdl_path()     == "int_rdy_i";
      keep INT_NA_i_p.hdl_path()    == "int_na_i";
      keep INT_CM_i_p.hdl_path()    == "int_cm_i";
      keep REG_IE_i_p.hdl_path()    == "reg_ie_i";
      keep REG_IP_i_p.hdl_path()    == "reg_ip_i";
      keep REG_SCON_i_p.hdl_path()  == "reg_scon_i";
      keep REG_TCON_i_p.hdl_path()  == "reg_tcon_i";
      keep REG_TCON2_i_p.hdl_path() == "reg_tcon2_i";
      keep INT_VECT_o_p.hdl_path()  == "int_vect_o";
      keep REG_TCON_o_p.hdl_path()  == "reg_tcon_o";
      keep REG_TCON2_o_p.hdl_path() == "reg_tcon2_o";
      keep REG_CLR_o_p.hdl_path()   == "int_reg_clr_o";
      
      keep FLAG_IE0_p.hdl_path()    == "reg_tcon_i(1)";
      keep FLAG_TF0_p.hdl_path()    == "reg_tcon_i(4)";
      keep FLAG_IE1_p.hdl_path()    == "reg_tcon_i(3)";
      keep FLAG_TF1_p.hdl_path()    == "reg_tcon_i(5)";
      keep FLAG_TF2_p.hdl_path()    == "reg_tcon2_i(0)";
      keep FLAG_RI_TI_p.hdl_path()  == "reg_scon_i";
      keep FLAG_TXRX_p.hdl_path()   == "reg_tcon2_i(1)";

      
  
   };
  
   when INT_OUT int_sig_u {
      // Path specification to the INT OUT signals
      keep RESET_i_p.hdl_path()     == "int_rst_sync_b_i";
      keep INT_EXT_p.hdl_path()     == "int_intx_b_i";
      keep INT_RDY_p.hdl_path()     == "int_rdy_i";
      keep INT_NA_i_p.hdl_path()    == "int_na_i";
      keep INT_CM_i_p.hdl_path()    == "int_cm_i";
      keep REG_IE_i_p.hdl_path()    == "reg_ie_i";
      keep REG_IP_i_p.hdl_path()    == "reg_ip_i";
      keep REG_SCON_i_p.hdl_path()  == "reg_scon_i";
      keep REG_TCON_i_p.hdl_path()  == "reg_tcon_i";
      keep REG_TCON2_i_p.hdl_path() == "reg_tcon2_i";
      keep INT_VECT_o_p.hdl_path()  == "int_vect_o";
      keep REG_TCON_o_p.hdl_path()  == "reg_tcon_o";
      keep REG_TCON2_o_p.hdl_path() == "reg_tcon2_o";
      keep REG_CLR_o_p.hdl_path()   == "int_reg_clr_o";
      
      keep FLAG_IE0_p.hdl_path()    == "reg_tcon_i(1)";
      keep FLAG_TF0_p.hdl_path()    == "reg_tcon_i(4)";
      keep FLAG_IE1_p.hdl_path()    == "reg_tcon_i(3)";
      keep FLAG_TF1_p.hdl_path()    == "reg_tcon_i(5)";
      keep FLAG_TF2_p.hdl_path()    == "reg_tcon2_i(0)";
      keep FLAG_RI_TI_p.hdl_path()  == "reg_scon_i";
      keep FLAG_TXRX_p.hdl_path()   == "reg_tcon2_i(1)";
   };
};
'>
