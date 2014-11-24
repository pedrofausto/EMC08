<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_packet_type.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010  Initial version
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainsts to apply to
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
// Local Functions: post_generate()
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

// signal type 
type mc_packet_type_kind: [ RAND ];

struct mc_packet_type like any_sequence_item {
   // input data stimulus
   ram_data_i: uint(bits:8);
   bus_ctrl_data_i: uint(bits:8);
   
   // input address stimulus
   rom_addr_i: uint(bits:16);
   ram_addr_i: uint(bits:8 );
   int_ram_data_i: uint(bits:8);
   
   // input control signals
   rom_rd_i_b: bit; //active low
   ram_rd_i_b: bit; //active low
   ram_wr_i_b: bit; //active low
   bit_byte_flag_i: bit; //0 - byte | 1 - bit
   ext_ram_i: bit; //active high
   bus_ctrl_ea_b_i: bit; //active low
   
   
   

   // output signals
   --bus_ctrl_data_o         : uint(bits:8 ); // data to bus control
   --bus_ctrl_addr_o         : uint(bits:16); // address to control bus
   --bus_ctrl_ext_rom_rd_b_o : bit; // rom external ctrl bus read 
   --bus_ctrl_ext_ram_rd_b_o : bit; // ram external ctrl bus read
   --bus_ctrl_ext_ram_wr_b_o : bit; // write enable external ram through cbus
   --rom_data_o              : uint(bits:8); // rom data output
   --ram_data_o              : uint(bits:8); // rom data output
    
   // signal type
   pkt_kind: mc_packet_type_kind;
   
   
 --  keep soft rom_rd_i        == 0; //fetching data is commonly turned on
 --  keep soft ram_rd_i        == 1; //it cannot fetch data and instruction at the same time
 --  keep soft ram_wr_i        == 1; //write on ram off
 --  keep soft bit_byte_flag_i == 0; //byte mode is commonly used
 --  keep soft ext_ram_i       == 0; //off
 --  keep soft bus_ctrl_ea_b_i == 1; //on
   
   keep rom_addr_i < 65536; //rom address space 65KB
   --keep soft ram_addr_i < 128;  //internal access 128B
   
   keep (ext_ram_i == 0) => (ram_addr_i < 128);
   
   keep (ext_ram_i == 1) => ( ram_addr_i       < 256) and
                            ( bus_ctrl_ea_b_i == 1  ) and
                            --( ram_addr_i[7] == 0 or ram_addr_i[7] == 1) and
                            ( bit_byte_flag_i == 0  );//External RAM memory has only byte operations.
   
   
   keep ( rom_rd_i_b == 0 ) => (bit_byte_flag_i == 0); //ROM has only byte operations.
   
   keep ( rom_addr_i > 0x0FFF) => ( bus_ctrl_ea_b_i == 0 ); //Above this address, external ROM is enabled.
   
   keep (bus_ctrl_ea_b_i == 0) => (ext_ram_i == 0);
   
   keep (bus_ctrl_ea_b_i == 0 ) => (bit_byte_flag_i == 0); //External ROM memory has only byte operations.
   
   

   ////////////////////////////// ext_ram_i_MODE //////////////////////////////
   --keep (pkt_kind == RAM_MODE_BYTE_RD ) => ( 
   --                                          rom_rd_i        == 1 &&
   --                                          ram_rd_i        == 0 &&
   --                                          ram_wr_i        == 1 &&
   --                                          bit_byte_flag_i == 0 &&
   --                                          ext_ram_i       == 0 &&
   --                                          bus_ctrl_ea_b_i == 1
   --                                        );
   
   -- keep (pkt_kind == RANDOM ) =>  (
   --
   --                               );
                                   
   
   
   
   pre_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
      --print me;
   };
  
   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
//      print me;
   };

};

'>
