<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : serial_sig.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate, sig - signal map
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
// Include Files: serial_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import serial_sig_h;

extend serial_sig_u {
  
//--------------------- input ports --------------------------------------------
  
  p_reset        : inout simple_port of bit is instance          ;
  p_br_trans     : inout simple_port of bit is instance          ;
  p_br           : inout simple_port of bit is instance          ;
  p_scon0_ri_i   : inout simple_port of bit is instance          ;
  p_scon1_ti_i   : inout simple_port of bit is instance          ;
  p_scon3_tb8    : inout simple_port of bit is instance          ;
  p_scon4_ren    : inout simple_port of bit is instance          ;
  p_scon7_mode   : inout simple_port of bit is instance          ;
  p_serial_tx    : inout simple_port of bit is instance          ;
  p_p3_0_i       : inout simple_port of bit is instance          ;
  p_data_sbuf_i  : inout simple_port of uint(bits:8) is instance ;
  
//--------------------- output ports -------------------------------------------
  
  p_p3en_0       : inout simple_port of bit is instance          ;
  p_p3en_1       : inout simple_port of bit is instance          ;
  p_p3_0_o       : inout simple_port of bit is instance          ;
  p_p3_1_o       : inout simple_port of bit is instance          ;
  p_scon0_ri_o   : inout simple_port of bit is instance          ;
  p_scon1_ti_o   : inout simple_port of bit is instance          ;
  p_scon3_rb8    : inout simple_port of bit is instance          ;
  p_data_sbuf_o  : inout simple_port of uint(bits:8) is instance ;
  p_clear_count  : inout simple_port of bit is instance          ;
  
//-------------- Connect the ports to the external design ----------------------
  
  keep bind ( p_reset,external        ) ;
  keep bind ( p_br_trans,external     ) ;
  keep bind ( p_br,external           ) ;
  keep bind ( p_scon0_ri_i,external   ) ;
  keep bind ( p_scon1_ti_i,external   ) ;
  keep bind ( p_scon3_tb8,external    ) ;
  keep bind ( p_scon4_ren,external    ) ;
  keep bind ( p_scon7_mode,external   ) ;
  keep bind ( p_serial_tx, external   ) ;
  keep bind ( p_p3_0_i,external       ) ;
  keep bind ( p_data_sbuf_i,external  ) ;

  keep bind ( p_p3en_0, external      ) ;
  keep bind ( p_p3en_1, external      ) ;
  keep bind ( p_p3_0_o, external      ) ; 
  keep bind ( p_p3_1_o, external      ) ; 
  keep bind ( p_scon0_ri_o,external   ) ;
  keep bind ( p_scon1_ti_o,external   ) ;
  keep bind ( p_scon3_rb8,external    ) ;
  keep bind ( p_data_sbuf_o, external ) ;
  keep bind ( p_clear_count, external ) ;
  
  when SERIAL_IN serial_sig_u 
  {
    
//-------------- Path specification to the Serial IN signals -------------------
    
      keep p_reset.hdl_path()                 == "reset"       ;
      keep p_br.hdl_path()                    == "br"          ;
      keep p_br_trans.hdl_path()              == "br_trans"    ;
      keep p_scon0_ri_i.hdl_path()            == "scon0_ri_i"  ;
      keep p_scon1_ti_i.hdl_path()            == "scon1_ti_i"  ;
      keep p_scon3_tb8.hdl_path()             == "scon3_tb8"   ;
      keep p_scon4_ren.hdl_path()             == "scon4_ren"   ;
      keep p_scon7_mode.hdl_path()            == "scon7_mode"  ;
      keep p_serial_tx.hdl_path()             == "serial_tx"   ;
      keep p_p3_0_i.hdl_path()                == "p3_0_i"      ;
      keep p_data_sbuf_i.hdl_path()           == "data_sbuf_i" ;
      
      keep p_p3en_0.hdl_path()                == "p3en_0"      ;
      keep p_p3en_1.hdl_path()                == "p3en_1"      ;
      keep p_p3_0_o.hdl_path()                == "p3_0_o"      ;
      keep p_p3_1_o.hdl_path()                == "p3_1_o"      ;
      keep p_scon0_ri_o.hdl_path()            == "scon0_ri_o"  ;
      keep p_scon1_ti_o.hdl_path()            == "scon1_ti_o"  ;
      keep p_scon3_rb8.hdl_path()             == "scon3_rb8"   ;
      keep p_data_sbuf_o.hdl_path()           == "data_sbuf_o" ;
      keep p_clear_count.hdl_path()           == "clear_count" ;
  
  };
  
  when SERIAL_OUT serial_sig_u
  {
    
//------------- Path specification to the Serial OUT signals -------------------
    
      keep p_reset.hdl_path()                 == "reset"       ;
      keep p_br.hdl_path()                    == "br"          ;
      keep p_br_trans.hdl_path()              == "br_trans"    ;
      keep p_scon0_ri_i.hdl_path()            == "scon0_ri_i"  ;
      keep p_scon1_ti_i.hdl_path()            == "scon1_ti_i"  ;
      keep p_scon3_tb8.hdl_path()             == "scon3_tb8"   ;
      keep p_scon4_ren.hdl_path()             == "scon4_ren"   ;
      keep p_scon7_mode.hdl_path()            == "scon7_mode"  ;
      keep p_serial_tx.hdl_path()             == "serial_tx"   ;
      keep p_p3_0_i.hdl_path()                == "p3_0_i"      ;
      keep p_data_sbuf_i.hdl_path()           == "data_sbuf_i" ;
      
      keep p_p3en_0.hdl_path()                == "p3en_0"      ;
      keep p_p3en_1.hdl_path()                == "p3en_1"      ;
      keep p_p3_0_o.hdl_path()                == "p3_0_o"      ;
      keep p_p3_1_o.hdl_path()                == "p3_1_o"      ;
      keep p_scon0_ri_o.hdl_path()            == "scon0_ri_o"  ;
      keep p_scon1_ti_o.hdl_path()            == "scon1_ti_o"  ;
      keep p_scon3_rb8.hdl_path()             == "scon3_rb8"   ;
      keep p_data_sbuf_o.hdl_path()           == "data_sbuf_o" ;
      keep p_clear_count.hdl_path()           == "clear_count" ;
  
  };
};

'>
