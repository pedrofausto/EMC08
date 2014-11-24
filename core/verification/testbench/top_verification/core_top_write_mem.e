<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_write_mem.e
// Module Name : Core_top
// Author : Dino Casse, Harney Abrahim, Vinicius Amaral
// E-mail : diga8@emc8.core_top, diga19@emc08.core_top, correioamaral@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 03/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      03-09-2010  Initial version
// 2.0      03-10-2010  Features implemantation - vinicius
// -----------------------------------------------------------------------------
// Keywords: memories, memory, write, rom, ram, bin
// -----------------------------------------------------------------------------
// Purpose: create a bin file for ROM, with specific opcodes and operands, and 
// other bin file for RAM, with ramdom bytes
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
// Include Files: none
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------


extend core_top_bfm_i_u {
   
   !opcode:         instruction_set_t;
   !opcode_aux:     instruction_set_t;
   !operand_1:      instruction_set_t;
   !operand_2:      instruction_set_t;
   !next_opcode:    instruction_set_t;
   !next_operand_1: instruction_set_t;
   !next_operand_2: instruction_set_t;
   vect_ram[65536]  : list of byte;
   
   inst_bytes: int;
   nexti: bool;
   flag_lcall: bool;
   extrom: bool;
   op1: uint(bits:8);
   op2: uint(bits:8);
   !addr_ram: byte;
   !num_nops: int;
   
   keep addr_ram < 128;
   keep opcode  in [NOP, MOV_A_DATA, MOV_D_DATA, LJMP, MOV_R0_DATA, LCALL, 
                    MOV_R2_DATA, MOV_DPTR_DATA, MOV_R1_DATA, INC_A, MOV_R4_DATA];
   
   write_rom() is also {
   
      sys.vect_rom = {};
      sys.vect_opcodes = {};
           
      // jump for init of code
      sys.vect_opcodes.add(AJMP_1);
      sys.vect_rom.add(AJMP_1);
      sys.vect_rom.add((sys.vect_rom.size()+8).as_a(instruction_set_t)); 
      
      // interrupt IE0 program code
      sys.vect_opcodes.add(LCALL);
      sys.vect_rom.add(LCALL);
      for i from 1 to 5 {
         sys.vect_opcodes.add(NOP);
         sys.vect_rom.add(NOP);
      };
      sys.vect_opcodes.add(RETI);
      sys.vect_rom.add(RETI);
      
      // configure port p1 as output
      sys.vect_opcodes.add(MOV_D_DATA);
      sys.vect_rom.add(MOV_D_DATA);
      sys.vect_rom.add((0xC8).as_a(instruction_set_t)); //end of P1EN
      sys.vect_rom.add((0xFF).as_a(instruction_set_t)); //
      
      
      
      
      nexti = FALSE;
      flag_lcall = FALSE;
            
      while (sys.vect_rom.size() < 4096 ) {
         
         if (nexti == FALSE) {gen opcode} else  {opcode = next_opcode};
         
         
         
         // prevent movc for inexistent rom memory address
         if (sys.vect_rom.size() >= (4096-256)) {
            while (opcode == MOV_R2_DATA) { gen opcode };
         };
         
         sys.vect_rom.add(opcode);
         sys.vect_opcodes.add(opcode);
         
         // specifing number of rom bytes of each instruction
         case opcode.as_a(instruction_set_t) {
            [MOV_D_DATA, MOV_D_D, LJMP, LCALL, MOV_DPTR_DATA]:    
            { inst_bytes = 3 };         
            [MOV_A_DATA, MOV_D_A, MOV_R0_DATA, MOV_A_D, MOV_D_R0, MOV_R7_DATA, 
            MOV_D_R7, MOV_BIT_C, MOV_R2_DATA, MOV_R1_DATA, MOV_R3_DATA, MOV_R4_DATA,
            MOV_D_R4]:    
            { inst_bytes = 2 };
            default:          { inst_bytes = 1 };
         };
         
         if (inst_bytes >= 2) {
            if (nexti == FALSE) {gen operand_1} else {operand_1 = next_operand_1};
            sys.vect_rom.add(operand_1);
         };
         if (inst_bytes == 3) {
            if (nexti == FALSE) {gen operand_2} else {operand_2 = next_operand_2};
            sys.vect_rom.add(operand_2);
         };
         nexti = FALSE;
                  
         // creating next opcode for check
         case opcode.as_a(instruction_set_t) {
            MOV_A_DATA:    { next_opcode  = MOV_D_A;
                             next_operand_1 = (0x90).as_a(instruction_set_t); //send SFR_A to PORT_1
                             nexti = TRUE;
                           }; 
            
            LJMP:          { opcode_aux = NOP;
                             num_nops = 6;
                             sys.vect_rom[sys.vect_rom.size()-2] = 
                             (sys.vect_rom.size()+6 >> 8).as_a(instruction_set_t);
                             sys.vect_rom[sys.vect_rom.size()-1] = 
                             (sys.vect_rom.size()+6).as_a(instruction_set_t);
                             
                             if (flag_lcall == TRUE) {
                                flag_lcall = FALSE;
                                sys.vect_rom[sys.vect_rom.size()-2] = 
                                (sys.vect_rom.size()+10 >> 8).as_a(instruction_set_t);
                                sys.vect_rom[sys.vect_rom.size()-1] = 
                                (sys.vect_rom.size()+10).as_a(instruction_set_t);
                                num_nops = 9;
                                next_opcode = RET;
                                nexti = TRUE;
                             };
                             for i from 1 to num_nops {
                                sys.vect_rom.add(opcode_aux);
                                sys.vect_opcodes.add(opcode_aux);
                             };
                             //out(">>>>>>>>>LJMP: ", sys.vect_rom.size()-2, " | ", sys.vect_rom.size()-1, " | ", hex((sys.vect_rom.size()+6)));
                             //nexti = TRUE;
                           };
            MOV_D_DATA:    { next_opcode = MOV_D_D;
                             gen addr_ram;
                             sys.vect_rom[sys.vect_rom.size()-2] = 
                             (addr_ram).as_a(instruction_set_t);
                             next_operand_1 = (addr_ram).as_a(instruction_set_t); // source: addr of RAM or ROM 
                             next_operand_2 = (0x90).as_a(instruction_set_t); //dest: PORT_1
                             nexti = TRUE;
                           };
            
            // verifying ADD_A_ATR0
            MOV_R0_DATA:   { next_opcode  = MOV_R7_DATA;
                             gen next_operand_1;
                             sys.vect_rom[sys.vect_rom.size()-1] = (0x30).as_a(instruction_set_t);
                             nexti = TRUE; 
                           };
            MOV_R7_DATA:   { next_opcode  = MOV_D_R7;
                             next_operand_1 = (0x30).as_a(instruction_set_t);
                             nexti = TRUE; 
                           };
            MOV_D_R7:      { next_opcode  = MOV_A_D;
                              next_operand_1 = (0x07).as_a(instruction_set_t);
                             nexti = TRUE; 
                           };
            MOV_A_D:       { next_opcode  = ADD_A_ATR0;
                             nexti = TRUE; 
                           };
            ADD_A_ATR0:    { next_opcode  = MOV_BIT_C;
                             next_operand_1 = (0xE0).as_a(instruction_set_t); //bit 0 of ACC
                             nexti = TRUE; 
                           };
            MOV_BIT_C:     { next_opcode  = MOV_D_A;
                             next_operand_1 = (0x90).as_a(instruction_set_t); //send SFR_A to PORT_1
                             nexti = TRUE; 
                           };
            
            // verifying LCALL and RET
            LCALL:         { next_opcode  = LJMP;
                             //next_operand_1 = (0x90).as_a(instruction_set_t); //send SFR_A to PORT_1
                             nexti = TRUE; 
                             flag_lcall = TRUE;
                             sys.vect_rom[sys.vect_rom.size()-2] = 
                             (sys.vect_rom.size()+9 >> 8).as_a(instruction_set_t);
                             sys.vect_rom[sys.vect_rom.size()-1] = 
                             (sys.vect_rom.size()+9).as_a(instruction_set_t);
                           };               
            
            // verifying MOVC               
            MOV_R2_DATA:   { next_opcode  = MOV_A_R2;
                             nexti = TRUE; 
                           };
            MOV_A_R2:      { next_opcode  = MOVC_A_ATPC;
                             nexti = TRUE; 
                           };
            MOVC_A_ATPC:   { next_opcode  = MOV_D_A;
                             next_operand_1 = (0x90).as_a(instruction_set_t); //send SFR_A to PORT_1
                             nexti = TRUE; 
                           };         
                           
            // verifying MOVX - read external memory             
            MOV_DPTR_DATA: { next_opcode  = MOVX_A_ATDPTR;
                             nexti = TRUE; 
                           };
            MOVX_A_ATDPTR: { next_opcode  = MOV_D_A;
                             next_operand_1 = (0x90).as_a(instruction_set_t); //send SFR_A to PORT_1
                             nexti = TRUE; 
                           };
                           
            // verifying MOVX - write external memory             
            MOV_R1_DATA:   { next_opcode  = MOV_R3_DATA;
                             gen next_operand_1;
                             nexti = TRUE;
                           };
            MOV_R3_DATA:   { next_opcode  = MOV_A_R3;
                             nexti = TRUE;
                           };
            MOV_A_R3:      { next_opcode  = MOVX_ATR1_A;
                             nexti = TRUE;
                           };
            
            // verifying INTERRUPT (LCALL hardware) and RETI               
            //INC_A:        { 
            //              };
            
            //verifying External ROM access by EA_b pin
            MOV_R4_DATA:   { 
                             for i from 1 to 5 { sys.vect_opcodes.add(NOP); };
                             for i from 1 to 9 { sys.vect_rom.add(NOP);     };
                             next_opcode  = NOP;
                             nexti = TRUE;
                           };
//             MOV_D_R4:      { next_opcode  = MOV_A_R4;
//                              nexti = TRUE;
//                            };
//             MOV_A_R4:      { next_opcode  = MUL_AB;
//                              nexti = TRUE;
//                            };           
//             MUL_AB:        { next_opcode  = MOV_D_A;
//                              next_operand_1 = (0x90).as_a(instruction_set_t); //send SFR_A to PORT_1
//                              nexti = TRUE;
//                              extrom = TRUE;
//                            };
//             MOV_D_A:       { if (extrom == TRUE) { 
//                                 extrom = FALSE;
//                                 next_opcode  = MOV_D_D;
//                                 next_operand_1 = (0xF0).as_a(instruction_set_t); // source: B 
//                                 next_operand_2 = (0x90).as_a(instruction_set_t); //dest: PORT_1
//                                 nexti = TRUE;
//                              };
//                            };              
         }; //end case
         
       //ending rom with nops to enable external rom jmp for begin
         if (sys.vect_rom.size() > 4080 and nexti == FALSE) {
            for i from 1 to 16 { sys.vect_opcodes.add(NOP); };
            for i from 1 to 16 { sys.vect_rom.add(NOP);     };
         };
              
      }; //end while
      
      // Creating rom and ram .bin files
      var rom_file        : file;
      var ram_file        : file;
      var vect_rom_string : string = bin(sys.vect_rom.as_a(list of uint(bits:8))); 
      var vect_ram_string : string = bin(vect_ram); 
      
      
      vect_rom_string = str_replace(vect_rom_string, "0b", ""); 
      vect_rom_string = str_replace(vect_rom_string, " ", "\n"); 
      
      vect_ram_string = str_replace(vect_ram_string, "0b", ""); 
      vect_ram_string = str_replace(vect_ram_string, " ", "\n"); 
      
      //out ("VECT_OPCODES: ", sys.vect_opcodes);
      //out ("VECT_ROM: ", sys.vect_rom);
      
      rom_file = files.open("/home/student/EMC08/digital_A/core/verification/testbench/top_verification/ROM4096X8.bin",
      "w", "Rom Data");
      files.write (rom_file, vect_rom_string);
      files.close (rom_file);
      
      ram_file = files.open("/home/student/EMC08/digital_A/core/verification/testbench/top_verification/SPRAM128X8.bin",
      "w", "Ram Data");
      files.write (ram_file, vect_ram_string);
      files.close (ram_file);
   };
};

'>