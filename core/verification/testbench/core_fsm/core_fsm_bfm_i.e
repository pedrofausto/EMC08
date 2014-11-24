<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_bfm_i.e
// Module Name : Core fsm
// Author : Dino Casse, Harney Acore_fsmahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 02/09/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      02-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: core_fsm - core finiet state machine, bfm - bus functional mode
// -----------------------------------------------------------------------------
// Purpose: This unit will drive the interface signals of the router DUT. 
// It will get an instance of a packet it is to drive from the sequence driver
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: drive_bus(), send_pkt()
// Include Files: core_fsm_bfm_i_h
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

import core_fsm_bfm_i_h;

extend core_fsm_bfm_i_u {
   //////////////////// INPUT PORTS  ///////////////////////////////
   //general signals
   !p_reset       : inout simple_port of bit;
   !p_psw_i       : inout simple_port of uint(bits:2);  
   
   !p_sfr_data_i  : inout simple_port of uint(bits:8);
   !p_ram_data_i  : inout simple_port of uint(bits:8);
   !p_rom_data_i  : inout simple_port of uint(bits:8);
   
   // from interrupt block
   !p_int_vect_i  : inout simple_port of uint(bits:3);
   !p_int_vect_i_0  : inout simple_port of bit;
   !p_int_vect_i_1  : inout simple_port of bit;
   !p_int_vect_i_2  : inout simple_port of bit;

   // from ALU
   !core_alu_cy_i_p : inout simple_port of bit;
   
   ////////////////// OUTPUTS PORTS///////////////////////////////
   !p_sfr_addr_o  : inout simple_port of uint(bits:8);
   !p_rom_addr_o  : inout simple_port of uint(bits:16);
   !p_ram_addr_o  : inout simple_port of uint(bits:8);
   
   // to ALU
   !p_alu_op1_o   : inout simple_port of uint(bits:8);
   !p_alu_op2_o   : inout simple_port of uint(bits:8);
   !p_alu_opcode_o: inout simple_port of uint(bits:5);
   !p_alu_en_o    : inout simple_port of bit;
   
   !p_sfr_data_o  : inout simple_port of uint(bits:8);
   
   !p_ram_data_o  : inout simple_port of uint(bits:8);
   
   !p_fsm_ext_ram_o:        inout simple_port of bit;
      
   !p_bit_byte_flag_o: inout simple_port of bit;
   !p_rom_rd_o       : inout simple_port of bit;
   !p_ram_rd_o       : inout simple_port of bit;
   !p_sfr_rd_o       : inout simple_port of bit;
   !p_ram_wr_o       : inout simple_port of bit;
   !p_sfr_wr_o       : inout simple_port of bit;
   
   // interrupt block
   !p_int_na_o       : inout simple_port of bit;
   !p_int_rdy        : inout simple_port of bit;

   // function to drive the signal packet to the DUT
   drive_bus() @clock_e is only {
      // signal packet to be send to the DUT    
      var pkt: core_fsm_signal_type;

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
   send_pkt(in_pkt: core_fsm_signal_type) @clock_e is only {
      var int_vect_previous: uint(bits:3) = p_int_vect_i$;
      //out ("p_int_vect_i$ ", p_int_vect_i$);
      // ports receive the signal from bfm according to the generated sequences
      if (in_pkt.pkt_kind == RESET) {
         out("Reseting the system");
         p_reset$    = 1;
         wait [1] * cycle;
         p_reset$    = 0;
         wait [3] * cycle;
         p_reset$      = 1;
         p_psw_i$[1:0] = 2'b00;
         p_int_vect_i$ = 3'd0;
         
         //wait delay (150);
         //wait delay (50);                 
          
         //out("out reset");
      } else if (int_vect_previous == 3'b000) {
      
            case in_pkt.pkt_kind {
         
            [LCALL, ACALL_1, RET, RETI,  ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8, MUL_AB, DIV_AB, JMP_A_DPTR, CJNE_ATR0_DATA, CJNE_ATR1_DATA, CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA, CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA, DJNZ_D, DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7, MOVX_A_ATDPTR, MOVX_ATDPTR_A, MOVC_A_ATDPTR, CJNE_A_DATA, CJNE_A_D, MOVC_A_ATPC, INC_DPTR]: {
                         wait delay (25);
                         p_reset$         = in_pkt.reset;
                         p_psw_i$         = in_pkt.psw;
                         p_int_vect_i$    = in_pkt.int_vect;
                         core_alu_cy_i_p$ = in_pkt.core_alu_cy_i;
                         
                         p_rom_data_i$       = in_pkt.rom_data_opcode.as_a(uint(bits:8));
                         wait delay (25);
                         
                         p_sfr_data_i$   = in_pkt.sfr_data;
                         p_ram_data_i$   = in_pkt.ram_data;

                         // logic to instructions with more than one operand
                         if (in_pkt.inst_len >  2'd1) {
                              p_rom_data_i$   = in_pkt.rom_data_byte1;
                         };
                         wait delay (25); 
                         p_sfr_data_i$   = in_pkt.sfr_data1;
                         if (in_pkt.inst_len > 2'd2) {
                              p_rom_data_i$       = in_pkt.rom_data_byte2;
                         }; 
                         wait delay (50); 
                         wait delay (25);
                         p_sfr_data_i$   = in_pkt.sfr_data2;
                         wait delay (25);
                         p_sfr_data_i$   = in_pkt.sfr_data3;
                         wait [1] * cycle;
                         
                      };
         
            default:     {
                         wait delay (25);
                         p_reset$        = in_pkt.reset;
                         p_int_vect_i$   = in_pkt.int_vect;
                         p_rom_data_i$       = in_pkt.rom_data_opcode.as_a(uint(bits:8));
                         wait delay (5);
                         p_psw_i$         = in_pkt.psw;
                         wait delay (20);
                         
                         p_sfr_data_i$    = in_pkt.sfr_data;
                         p_ram_data_i$    = in_pkt.ram_data;
                         core_alu_cy_i_p$ = in_pkt.core_alu_cy_i;            
                         // logic to instructions with more than one operand
                         if (in_pkt.inst_len >  2'd1) {
                              p_rom_data_i$   = in_pkt.rom_data_byte1;
                         };
                         
                         wait delay (25); 
                         p_sfr_data_i$   = in_pkt.sfr_data1;
                         if (in_pkt.inst_len > 2'd2) {
                              p_rom_data_i$       = in_pkt.rom_data_byte2;
                         }; 
                         wait cycle;
         
                      }; //end default
            }; //end case
        } else { // int_vect_previous != 3'b000 - A HARDWARE LCALL OCCURS
               wait delay (25);
               p_reset$        = in_pkt.reset;
               p_psw_i$        = in_pkt.psw;
               p_int_vect_i$   = in_pkt.int_vect;
	       core_alu_cy_i_p$ = in_pkt.core_alu_cy_i;
                         
               p_rom_data_i$       = in_pkt.rom_data_opcode.as_a(uint(bits:8));
               wait delay (25);
                         
               p_sfr_data_i$   = in_pkt.sfr_data;
               p_ram_data_i$   = in_pkt.ram_data;
               //logic to instructions with more than one operand
               //if (in_pkt.inst_len >  2'd1) {
                    p_rom_data_i$   = in_pkt.rom_data_byte1;
               //};
               wait delay (25); 
                         
               //if (in_pkt.inst_len > 2'd2) {
                    p_rom_data_i$       = in_pkt.rom_data_byte2;
               //}; 
               wait [3] * cycle;
        }; // end else
   }; //end send_pkt
};

'>
