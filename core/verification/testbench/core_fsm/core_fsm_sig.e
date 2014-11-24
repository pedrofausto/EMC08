<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_sig.e
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
// Keywords: core_fsm - core finite state machine, sig - signal map
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
// Include Files: core_fsm_sig_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_sig_h;

extend core_fsm_sig_u {
   // -------------------------------------------------------------------------
   // INPUT PORTS  INPUT PORTS  INPUT PORTS  INPUT PORTS  INPUT PORTS  INPUT PO
   // -------------------------------------------------------------------------
   //general signals
   p_reset           : inout simple_port of bit           is instance; 
   p_psw_i           : inout simple_port of uint(bits:2)  is instance;  
   
   p_sfr_data_i      : inout simple_port of uint(bits:8)  is instance;
   p_ram_data_i      : inout simple_port of uint(bits:8)  is instance;
   p_rom_data_i      : inout simple_port of uint(bits:8)  is instance;
   
   // from interrupt block
   p_int_vect_i      : inout simple_port of uint(bits:3)  is instance;
   p_int_vect_i_0    : inout simple_port of bit           is instance;
   p_int_vect_i_1    : inout simple_port of bit           is instance;
   p_int_vect_i_2    : inout simple_port of bit           is instance;
   
   // internal variable of fsm to verify the state transition
   p_state           : inout simple_port of uint(bits:3)  is instance;

   // to ALU
   core_alu_cy_i_p   : inout simple_port of bit           is instance;
   // -------------------------------------------------------------------------
   // OUTPUT PORTS  OUTPUT PORTS  OUTPUT PORTS  OUTPUT PORTS  OUTPUT PORTS  OUT
   // -------------------------------------------------------------------------
   p_sfr_addr_o      : inout simple_port of uint(bits:8)  is instance;
   p_rom_addr_o      : inout simple_port of uint(bits:16) is instance;
   p_ram_addr_o      : inout simple_port of uint(bits:8)  is instance;
   
   // to ALU
   p_alu_op1_o       : inout simple_port of uint(bits:8)  is instance;
   p_alu_op2_o       : inout simple_port of uint(bits:8)  is instance;
   p_alu_opcode_o    : inout simple_port of uint(bits:5)  is instance;
   p_alu_en_o        : inout simple_port of bit           is instance;
   core_alu_cy_o_p   : inout simple_port of bit           is instance;
   
   p_sfr_data_o      : inout simple_port of uint(bits:8)  is instance;
   p_ram_data_o      : inout simple_port of uint(bits:8)  is instance;
   p_fsm_ext_ram_o   : inout simple_port of bit           is instance;
         
   p_bit_byte_flag_o : inout simple_port of bit           is instance;
   p_rom_rd_o        : inout simple_port of bit           is instance;
   p_ram_rd_o        : inout simple_port of bit           is instance;
   p_sfr_rd_o        : inout simple_port of bit           is instance;
   p_ram_wr_o        : inout simple_port of bit           is instance;
   p_sfr_wr_o        : inout simple_port of bit           is instance;
   
   // interrupt block
   p_int_na_o        : inout simple_port of bit           is instance;
   p_int_rdy         : inout simple_port of bit           is instance;
   // -------------------------------------------------------------------------
   // Connect the ports to the external design
   // -------------------------------------------------------------------------
   keep bind(p_reset, external);
   keep bind(p_psw_i, external);
   keep bind(p_sfr_data_i, external);
   keep bind(p_ram_data_i, external);
   keep bind(p_rom_data_i, external);
   keep bind(p_int_vect_i, external);
   keep bind(p_int_vect_i_0, external); //tree bits of int vec
   keep bind(p_int_vect_i_1, external);
   keep bind(p_int_vect_i_2, external);
   keep bind(core_alu_cy_i_p, external);
   
   keep bind(p_state, external);
   
   keep bind(p_sfr_addr_o,external);
   keep bind(p_rom_addr_o,external);
   keep bind(p_ram_addr_o,external);
   keep bind(p_alu_op1_o,external);
   keep bind(p_alu_op2_o,external);
   keep bind(p_alu_opcode_o,external);
   keep bind(p_alu_en_o,external);
   keep bind(p_sfr_data_o,external);
   keep bind(p_ram_data_o,external);
   keep bind(p_bit_byte_flag_o,external);
   keep bind(p_rom_rd_o,external);
   keep bind(p_ram_rd_o,external);
   keep bind(p_sfr_rd_o,external);
   keep bind(p_ram_wr_o,external);
   keep bind(p_sfr_wr_o,external);
   keep bind(p_int_na_o,external);
   keep bind(p_int_rdy,external);
   keep bind(p_fsm_ext_ram_o, external);
   keep bind(core_alu_cy_o_p, external);   
   // -------------------------------------------------------------------------
   when CORE_FSM_IN core_fsm_sig_u {
      // Path specification to the CORE_FSM IN signals INPUTS
      keep p_reset.hdl_path()           == "fsm_reset_i_b";
      keep p_psw_i.hdl_path()           == "fsm_psw_rs_i";
      keep p_sfr_data_i.hdl_path()      == "fsm_sfr_data_i";
      keep p_ram_data_i.hdl_path()      == "fsm_ram_data_i";
      keep p_rom_data_i.hdl_path()      == "fsm_rom_data_i";
      keep p_int_vect_i.hdl_path()      == "fsm_int_vect_i";
      keep p_int_vect_i_0.hdl_path()    == "fsm_int_vect_i(0)";
      keep p_int_vect_i_1.hdl_path()    == "fsm_int_vect_i(1)";
      keep p_int_vect_i_2.hdl_path()    == "fsm_int_vect_i(2)";
      keep p_state.hdl_path()           == "/FSM/fsm_state_o";
      keep core_alu_cy_i_p.hdl_path()   == "alu_cy_i";

      // Path specification to the CORE_FSM IN signals OUTPUTS
      keep p_sfr_addr_o.hdl_path()      == "fsm_sfr_addr_o";
      keep p_rom_addr_o.hdl_path()      == "fsm_rom_addr_o";
      keep p_ram_addr_o.hdl_path()      == "fsm_ram_addr_o";
      keep p_alu_op1_o.hdl_path()       == "fsm_alu_op1_o";
      keep p_alu_op2_o.hdl_path()       == "fsm_alu_op2_o";
      keep p_alu_opcode_o.hdl_path()    == "fsm_alu_opcode_o";
      keep p_alu_en_o.hdl_path()        == "fsm_alu_en_o";
      keep p_sfr_data_o.hdl_path()      == "fsm_sfr_data_o";
      keep p_ram_data_o.hdl_path()      == "fsm_ram_data_o";
      keep p_bit_byte_flag_o.hdl_path() == "fsm_bit_byte_flag_o";
      keep p_rom_rd_o.hdl_path()        == "fsm_rom_rd_o_b";
      keep p_ram_rd_o.hdl_path()        == "fsm_ram_rd_o_b";
      keep p_sfr_rd_o.hdl_path()        == "fsm_sfr_rd_o_b";
      keep p_ram_wr_o.hdl_path()        == "fsm_ram_wr_o_b";
      keep p_sfr_wr_o.hdl_path()        == "fsm_sfr_wr_o_b";
      keep p_int_na_o.hdl_path()        == "fsm_int_na_o";
      keep p_int_rdy.hdl_path()         == "fsm_int_rdy_o";
      keep p_fsm_ext_ram_o.hdl_path()   == "fsm_ext_ram_o";
      keep core_alu_cy_o_p.hdl_path()   == "alu_cy_o";
   };
  
   when CORE_FSM_OUT core_fsm_sig_u {
      // Path specification to the CORE_FSM OUT signals INPUTS
      keep p_reset.hdl_path()           == "fsm_reset_i_b";
      keep p_psw_i.hdl_path()           == "fsm_psw_rs_i";
      keep p_sfr_data_i.hdl_path()      == "fsm_sfr_data_i";
      keep p_ram_data_i.hdl_path()      == "fsm_ram_data_i";
      keep p_rom_data_i.hdl_path()      == "fsm_rom_data_i";
      keep p_int_vect_i.hdl_path()      == "fsm_int_vect_i";
      keep p_int_vect_i_0.hdl_path()    == "fsm_int_vect_i(0)";
      keep p_int_vect_i_1.hdl_path()    == "fsm_int_vect_i(1)";
      keep p_int_vect_i_2.hdl_path()    == "fsm_int_vect_i(2)";
      keep p_state.hdl_path()           == "/FSM/fsm_state_o";
      keep core_alu_cy_i_p.hdl_path()   == "alu_cy_i";
      
      // Path specification to the CORE_FSM OUT signals OUTPUTS
      keep p_sfr_addr_o.hdl_path()      == "fsm_sfr_addr_o";
      keep p_rom_addr_o.hdl_path()      == "fsm_rom_addr_o";
      keep p_ram_addr_o.hdl_path()      == "fsm_ram_addr_o";
      keep p_alu_op1_o.hdl_path()       == "fsm_alu_op1_o";
      keep p_alu_op2_o.hdl_path()       == "fsm_alu_op2_o";
      keep p_alu_opcode_o.hdl_path()    == "fsm_alu_opcode_o";
      keep p_alu_en_o.hdl_path()        == "fsm_alu_en_o";
      keep p_sfr_data_o.hdl_path()      == "fsm_sfr_data_o";
      keep p_ram_data_o.hdl_path()      == "fsm_ram_data_o";
      keep p_bit_byte_flag_o.hdl_path() == "fsm_bit_byte_flag_o";
      keep p_rom_rd_o.hdl_path()        == "fsm_rom_rd_o_b";
      keep p_ram_rd_o.hdl_path()        == "fsm_ram_rd_o_b";
      keep p_sfr_rd_o.hdl_path()        == "fsm_sfr_rd_o_b";
      keep p_ram_wr_o.hdl_path()        == "fsm_ram_wr_o_b";
      keep p_sfr_wr_o.hdl_path()        == "fsm_sfr_wr_o_b";
      keep p_int_na_o.hdl_path()        == "fsm_int_na_o";
      keep p_int_rdy.hdl_path()         == "fsm_int_rdy_o";
      keep p_fsm_ext_ram_o.hdl_path()   == "fsm_ext_ram_o";
      keep core_alu_cy_o_p.hdl_path()   == "alu_cy_o";
   };
};

'>
