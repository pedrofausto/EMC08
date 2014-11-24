<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : mc_reference_model.e
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
// Purpose: implements the algorithm to check design consistence and coverage
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
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------
'>
<'
extend mc_mon_u {
   
   event coverage;
   
   cover coverage is {
      item ram_data_i;
      item bus_ctrl_data_i;
   
      // input address stimulus
      item rom_addr_i;
      item ram_addr_i;
      
      // input control signals
      item rom_rd_i_b; //active low
      item ram_rd_i_b; //active low
      item ram_wr_i_b; //active low
      item bit_byte_flag_i; //0 - byte | 1 - bit
      item ext_ram_i; //active high
      item bus_ctrl_ea_b_i;
   };//end cover
   
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
   bus_ctrl_ea_b_i: bit;
   
   
   
   
   reference_model() @clock_e is also {
      --out ("-----------------------------> Starting Reference Model... @mc_reference_model.e");

      
      var read_data: byte;
      var read_addr: byte;
      var tmp      : byte;
      --var ram_matrix[128]: list of byte;
      
      -- wait delay (10);
      
      // Remove comment from IF to have Internal ROM Read only-----------------------------------------------------
      if (bus_ctrl_ea_b_i_p$ == 1 and rom_addr_i_p$ <= 0x0FFF 
          and rom_rd_i_b_p$ == 0 ) //and ram_rd_i_p$ == 1 and ram_wr_i_p$ == 1) 
      {
         wait delay (1);
	 message(LOW,"[INTERNAL RD ROM MODE]");
         read_data = rom_matrix[rom_addr_i_p$[11:0]];
         
         wait delay (3);
         out("REFMODEL INTERNAL ROM RD[",rom_addr_i_p$[11:0],"] : ", read_data, 
         "\t --- INT_ROM_RD[",rom_addr_i_p$[11:0],"] : ", rom_data_o_p$);
         // wait delay (1407);
	      check that read_data == rom_data_o_p$ else
         dut_error("ERROR! at: rom_data_o_p$");
	      emit coverage;
         out();
      };
      
      // Remove comment from IF to have External ROM Read Only -----------------------------------------------------
      if ((bus_ctrl_ea_b_i_p$ == 0 or 
          (bus_ctrl_ea_b_i_p$ == 1 and rom_addr_i_p$ > 0x0FFF) ) and rom_rd_i_b_p$ == 0) // and ram_rd_i_p$ == 1 and ram_wr_i_p$ == 1) 
      {
         wait delay (1);
	 message(LOW,"[EXTERNAL RD ROM MODE]");
         read_data = bus_ctrl_data_i_p$;
         
         wait delay (3);
         out("REFMODEL[",rom_addr_i_p$,"] : ", read_data, 
         "\t --- EXT_ROM_RD[",rom_addr_i_p$,"] : ", rom_data_o_p$);
         check that read_data == rom_data_o_p$;
         emit coverage;
         out();
      };
      
      // Remove comment from IF to have External RAM Read Only -----------------------------------------------------
      if ((bus_ctrl_ea_b_i_p$ == 1 and ext_ram_i_p$ == 1) and ram_rd_i_b_p$ == 0) // and rom_rd_i_p$ == 1) 
      {
         wait delay (1);
	 message(LOW,"[EXTERNAL RD RAM MODE]");
         read_addr = ram_addr_i_p$;

         wait delay (3);
         out("REFMODEL[",read_addr,"] : ", 
         "\t --- EXT_RAM_RD_ADDRESS[",bus_ctrl_addr_o_p$,"] : ");
	 check that read_addr == bus_ctrl_addr_o_p$
	 else
         dut_error("ERROR! at: bus_ctrl_addr_o_p$");
         // Internal RAM data fetch from External memory after external read, data comes through bus_ctrl_data_i_p and bypass toram_data_o
      	 // going to FSM
         emit coverage;
         out();
     };       

      
      //Remove comment from IF to have Internal RAM Read only ----------------------------------------------------- (BIT/BYTE SUPPORT)
      if (ext_ram_i_p$ == 0 and ram_rd_i_b_p$ == 0 ) // and rom_rd_i_p$ == 1) 
      {
         wait delay (1);
	 message(LOW,"[INTERNAL RD RAM MODE]");
         read_addr = ram_addr_i_p$;
         if(bit_byte_flag_i_p$ == 1){//bit mode
           --read_addr_as_hex = read_addr.as_a(hex);
           read_addr = bit_mapping(read_addr);
           out("[BIT MODE]");
         };
         read_data = ram_matrix[read_addr];
         wait delay (3);
         
         out("REFMODEL[",read_addr,"] : ", read_data,
         "\t --- INT_RAM_RD[",ram_addr_i_p$,"] : ", ram_data_o_p$);  
    
         check that ram_data_o_p$ ==  read_data else
         dut_error("ERROR! at read: ram_data_i_p$");
         
         emit coverage;
         out();
      };
      
      //Remove comment from IF to have Internal RAM WR only ----------------------------------------------------- (BIT/BYTE SUPPORT)
      if (ext_ram_i_p$ == 0 and ram_wr_i_b_p$ == 0)// and rom_rd_i_p$ == 1) 
      {
         wait delay (1);
	      message(LOW,"[INTERNAL WR RAM MODE]");
         
         read_addr = ram_addr_i_p$;
         tmp = ram_data_i_p$;
         if(bit_byte_flag_i_p$ == 1){//bit mode
           read_addr = bit_mapping(read_addr);
           out("[BIT MODE]");
         };
         
         read_data = int_ram_data_i_p$;
         wait delay (3);
         
         out("REFERENCE MODEL[",hex(read_addr),"] : ", read_data,
         "\t --- DATA TO BE WRITTEN: MEM[",hex(ram_addr_i_p$),"] : ", tmp);

         check that ram_data_i_p$ == read_data else
         dut_error("ERROR! at write: ram_data_i_p$");
         
         out("(current\t)\t REFMODEL INTERNAL RAM WR[",hex(read_addr),"] : ", ram_matrix[ram_addr_i_p$]);
	 wait delay (1);
         ram_matrix[read_addr] = tmp;
         out("WROTING: ", tmp);
         out("(new\t)\t REFMODEL INTERNAL RAM WR[",hex(read_addr),"] : ", ram_matrix[ram_addr_i_p$]);
         
         //out(sys.time);
         emit coverage;
         out();
      };
      
      //Remove comment from IF to have EXTERNAL RAM WR -----------------------------------------------------
      if ((bus_ctrl_ea_b_i_p$ == 0 and ext_ram_i_p$ == 1) and ram_rd_i_b_p$ == 0) // and rom_rd_i_p$ == 1) 
      {
         wait delay (1);
	 message(LOW,"[EXTERNAL WR RAM MODE]");
         read_addr = ram_addr_i_p$;

         wait delay (3);
         out("REFMODEL[",read_addr,"] : ", 
         "\t --- EXT_RAM_WR_ADDRESS[",bus_ctrl_addr_o_p$,"] : ");
	 check that read_addr == bus_ctrl_addr_o_p$
	 else
         dut_error("ERROR! at: bus_ctrl_addr_o_p$");
      	 emit coverage;
         out();        
        };
      
      
      wait [1]*cycle;
   };
   
   
   
   bit_mapping(read_addr_hex:byte):byte is {
    --var decoded_addr:byte ;
    
      case read_addr_hex {
        [0x00..0x07]: {return 0x20};
        [0x08..0x0F]: {return 0x21};
        [0x10..0x17]: {return 0x22};
        [0x18..0x1F]: {return 0x23};
        [0x20..0x27]: {return 0x24};
        [0x28..0x2F]: {return 0x25};
        [0x30..0x37]: {return 0x26};
        [0x38..0x3F]: {return 0x27};
        [0x40..0x47]: {return 0x28};
        [0x48..0x4F]: {return 0x29};
        [0x50..0x57]: {return 0x2A};
        [0x58..0x5F]: {return 0x2B};
        [0x60..0x67]: {return 0x2C};
        [0x68..0x6F]: {return 0x2D};
        [0x70..0x77]: {return 0x2E};
        [0x78..0x7F]: {return 0x2F};
        default: {
          out("ERROR! VALUE OUT OF BIT MAPPING RANGE!");
          out("Returning read_addr_hex:",read_addr_hex);
          return read_addr_hex;
        };//end defaul
      };//end case

   };//end bit_mapping
   
   
};//end extend

'>
  

    