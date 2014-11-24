<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_bfm_i.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : Pedro Fausto
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Send packets to the DUT.
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
// Include Files: mc_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_bfm_i_h;

extend mc_bfm_i_u {
   // instance the ports used in bfm in
   !rom_rd_i_b_p              : inout simple_port of bit; // read from rom
   !ram_rd_i_b_p              : inout simple_port of bit; // read from ram
   !ram_wr_i_b_p              : inout simple_port of bit; // write in ram
   !bit_byte_flag_i_p         : inout simple_port of bit; // bit or byte operation
   !ext_ram_i_p               : inout simple_port of bit; // external ram access
   !rom_addr_i_p              : inout simple_port of uint(bits:16); // rom address
   !ram_addr_i_p              : inout simple_port of uint(bits:8 ); // ram address
   !ram_data_i_p              : inout simple_port of uint(bits:8 ); // ram data
   !bus_ctrl_ea_b_i_p         : inout simple_port of bit; // bus control external 
   !bus_ctrl_data_i_p         : inout simple_port of uint(bits:8 ); // bus control data for external access
    
   // output ports
   !bus_ctrl_data_o_p         : inout simple_port of uint(bits:8 ); // data to bus control
   !bus_ctrl_addr_o_p         : inout simple_port of uint(bits:16); // address to control bus
   !bus_ctrl_ext_rom_rd_o_b_p : inout simple_port of bit; // rom external ctrl bus read 
   !bus_ctrl_ext_ram_rd_o_b_p : inout simple_port of bit; // ram external ctrl bus read
   !bus_ctrl_ext_ram_wr_o_b_p : inout simple_port of bit; // write enable external ram through cbus
   !rom_data_o_p              : inout simple_port of uint(bits:8); // rom data output
   !ram_data_o_p              : inout simple_port of uint(bits:8); // rom data output
   
   
   !int_ram_data_i_p   : inout simple_port of uint(bits:8); --Added by Pedro
   
   !dut_ram_data_i_p   : inout simple_port of uint(bits:8);
  
   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: mc_packet_type;
      --out("----------------------------->inside drive_bus()... @mc_bfm_i.e");
      while TRUE {
         // get a packet to drive into the DUT (store the return-value from get_pkt() ):
         pkt = get_pkt();
      
         // call the send_pkt() TCM that will drive "data" for each byte of the packet:
         send_pkt(pkt);
      
         // when send_pkt() is finished, call its_done():
         its_done();
      };
   };
   
   // function to send signal packets to the DUT
   send_pkt(in_pkt: mc_packet_type) @clock_e is only {
         
	      wait delay (12);
	 
         ram_data_i_p$          = in_pkt.ram_data_i     ;
         bus_ctrl_data_i_p$     = in_pkt.bus_ctrl_data_i;
         rom_addr_i_p$          = in_pkt.rom_addr_i     ;
         ram_addr_i_p$          = in_pkt.ram_addr_i     ;
         rom_rd_i_b_p$          = in_pkt.rom_rd_i_b     ;
         ram_rd_i_b_p$          = in_pkt.ram_rd_i_b     ;
         ram_wr_i_b_p$          = in_pkt.ram_wr_i_b     ;
         bit_byte_flag_i_p$     = in_pkt.bit_byte_flag_i;
         ext_ram_i_p$           = in_pkt.ext_ram_i      ;
         bus_ctrl_ea_b_i_p$     = in_pkt.bus_ctrl_ea_b_i;
	      int_ram_data_i_p$	     = in_pkt.int_ram_data_i ;	--Added by Pedro
	 
	   --   wait delay (12);
	   
      --   wait [1]*cycle;   
      --   bus_ctrl_data_o_p$         = in_pkt.bus_ctrl_data_o_p;
      --   bus_ctrl_addr_o_p$         = in_pkt.bus_ctrl_addr_o_p;
      --   bus_ctrl_ext_rom_rd_b_o_p$ = in_pkt.bus_ctrl_ext_rom_rd_b_o_p;
      --   bus_ctrl_ext_ram_rd_b_o_p$ = in_pkt.bus_ctrl_ext_ram_rd_b_o_p;
      --   bus_ctrl_ext_ram_wr_b_o_p$ = in_pkt.bus_ctrl_ext_ram_wr_b_o_p;
      --   rom_data_o_p$              = in_pkt.rom_data_o_p;
      --   ram_data_o_p$              = in_pkt.ram_data_o_p;
    
      --   wait [400] * cycle;
      --};

    };

  
};
'>
