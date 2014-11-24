<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_mon.e
// Module Name : Memory Control
// Author : Felipe Yonehara
// E-mail : diga13@emc8.br
// -----------------------------------------------------------------------------
// Review(s) : 
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      10-07-2010     Initial version
// -----------------------------------------------------------------------------
// Purpose: Monitor calls the reference model after instantiate all the block ports.
// load ROM and RAM matrix reference model.
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
// Include Files: mc_mon_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import mc_mon_h;

extend mc_mon_u {
   // instance the ports used in monitor
   // input ports
   !rom_rd_i_b_p         : inout simple_port of bit           ; // read from rom
   !ram_rd_i_b_p         : inout simple_port of bit           ; // read from ram
   !ram_wr_i_b_p         : inout simple_port of bit           ; // write in ram
   !bit_byte_flag_i_p    : inout simple_port of bit           ; // bit or byte operation
   !ext_ram_i_p          : inout simple_port of bit           ; // external ram access
   !rom_addr_i_p         : inout simple_port of uint(bits:16) ; // rom address
   !ram_addr_i_p         : inout simple_port of uint(bits:8 ) ; // ram address
   !ram_data_i_p         : inout simple_port of uint(bits:8 ) ; // ram data
   !bus_ctrl_ea_b_i_p    : inout simple_port of bit           ; // bus control external 
   !bus_ctrl_data_i_p    : inout simple_port of uint(bits:8 ) ; // bus control data for external access
   
   // output ports
   !bus_ctrl_data_o_p         : inout simple_port of uint(bits:8 ) ; // data to bus control
   !bus_ctrl_addr_o_p         : inout simple_port of uint(bits:16) ; // address to control bus
   !bus_ctrl_ext_rom_rd_o_b_p : inout simple_port of bit           ; // rom external ctrl bus read 
   !bus_ctrl_ext_ram_rd_o_b_p : inout simple_port of bit           ; // ram external ctrl bus read
   !bus_ctrl_ext_ram_wr_o_b_p : inout simple_port of bit           ; // write enable external ram through cbus
   !rom_data_o_p              : inout simple_port of uint(bits:8)  ; // rom data output
   !ram_data_o_p              : inout simple_port of uint(bits:8)  ; // rom data output
   
   !int_ram_data_i_p          : inout simple_port of uint(bits:8)  ; // Added by Pedro
   
   !dut_ram_data_i_p          : inout simple_port of uint(bits:8)  ;
  
   // events to control the reset state
   --event reset_rise is rise(RESET_p$)@sim;
   --event reset_fall is fall(RESET_p$)@sim;

   // event that wait for a sm0 rise and a smod rise
   --event sm0_rise_smod_rise is (rise(SM0_p$)@sim and rise(SMOD_p$)@sim);
  
   // event that wait for a sm0 rise and a smod fall
   --event sm0_rise_smod_fall is (rise(SM0_p$)@sim and fall(SMOD_p$)@sim);
  
   // event that see the rise fall of sm0
   --event sm0_fall is (fall(SM0_p$)@sim);
  
   // event to BR_START rise
   --event br_start_rise is rise(CM_START_p$)@sim;
   
   
      
   when MC_IN mc_mon_u {
      // event hit_rise is rise(reset_p$)@sim;
      
       watch_bus() @clock_e is also {
      while TRUE {   
        --out("-----------------------------> chamando reference model... @mc_mon.e");
        // calls the reference model to check the DUT
      
        -- emit pkt.coverage;
      
        reference_model();
          
        
        // the monitor detected a packet
        emit pkt_detected_e;
        

     }; 
   };
       
   };
   
   when MC_OUT mc_mon_u {
      
        
      
   };
   
   // OPTIONAL for now: print out a message when a packet is successfully unpacked.
   on pkt_detected_e {
      --message(LOW, me, "Packet detected on monitor: ", pkt);
   };
   
   ///////////////////////////////////////////////////// load rom code
   !rom_matrix: list of byte;
  -- !rom_file: file;
   !rom_line: string;
   !rom_binary[8193*8]: list of bit;
   --!read_chk: bool;
   !tmp: list of byte;
   
   
   load_rom() is only {
      for each line (rom_line) in file "/home/student/EMC08/digital_A/core/verification/testbench/mem_ctrl/ROM8192X8.bin" do {
        tmp=rom_line.as_a(list of byte);        
        for j from 0 to 7 {          
          if(tmp[j]==49) {
            rom_binary[index*8 + 7-j]=1;        
          } else {
            rom_binary[index*8 + 7-j]=0;
          };
        };
      };
      
      message(LOW, "unpacking...");
      unpack(packing.low,rom_binary,rom_matrix);
      
      
      -- print_rom();
    };
    
    ///////////////////////////////////////////////////load ram code
    !ram_matrix[128]: list of byte;
    -- !rom_file: file;
    !ram_line: string;
    !ram_binary[128*8]: list of bit;
    
    
    
    load_ram() is only {
        for each line (ram_line) in file "/home/student/EMC08/digital_A/core/verification/testbench/mem_ctrl/RAM128X8.bin" do {
          tmp=ram_line.as_a(list of byte);        
          for j from 0 to 7 {          
            if(tmp[j]==49) {
              ram_binary[index*8 + 7-j]=1;        
            } else {
              ram_binary[index*8 + 7-j]=0;
            };
          };
        };
        
        message(LOW, "unpacking...");
        unpack(packing.low,ram_binary,ram_matrix);
        
        -- print_ram();
        
      };
    
      
      print_ram() is {
        for each index in ram_matrix do {        
          
          out("Index [", index, "] = ", ram_matrix[index]);
        };
      };
      
      print_rom() is {
        for each index in rom_matrix do {        
        
          out("Index[", index, "] = ", rom_matrix[index]);
        };
      };
      
    --ram_update() is only {
    --  for each addr in ram_matrix do {
          
    --  };
      
    --  message(LOW, "RAM UPDATED...");
      
      
    --  for each index in ram_matrix do {        
        
    --    out("Index [", index, "] = ", ram_matrix[index]);
    --  };
    --};
    --cover 
    
};

'>


