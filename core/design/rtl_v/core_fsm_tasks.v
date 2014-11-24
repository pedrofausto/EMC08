// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name: core_fsm_tasks.v
// Module Name: core
// Author: Pedro & Vinicius
// E-mail: pedrofausto at gmail com
// -----------------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 20/09/2010 Initial version
// 2.0 22/09/2010 No-latch version
// -----------------------------------------------------------------------------
// Description
// This file encodes the FSM responsible to control the CORE module
// and its decisions.
//
//-----------------------------------------------------------------------------

task decode_1_combinational_task; //############################################
// Active on @fsm_state_o


`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
      
   begin
      case (fsm_opcode)
         
         // ROM - put ROM addr of Operand 1
         AJMP_1, AJMP_2, AJMP_3, AJMP_4, AJMP_5, AJMP_6, AJMP_7, AJMP_8, LJMP, 
         SJMP, LJMP, JBC, JB, JNB,
         SETB_BIT, 
         MOV_A_DATA, MOV_D_DATA, MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D,
         MOV_R4_D, MOV_R5_D, MOV_R6_D, MOV_R7_D, MOV_D_D, MOV_A_D,
         INC_D,
         DEC_D,
         ORL_D_DATA,
         ANL_D_DATA,
         XRL_D_DATA,
         MOV_DPTR_DATA,
         CPL_BIT, CLR_BIT:       
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR 
            wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
            // PCAU_EN, OFFSET, PCAU_DIRECT, PC_MSB
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            // ALU_EN, OPERATION, OP1, OP2
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);            
         end
//------------------------------------------------------------------------------
         // sfr - put SFR addr of A special register
         RR_A, RRC_A, RL_A, RLC_A,
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7,
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7,
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7,
         DEC_A,
         INC_A,
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7,
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7,
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7,
         MOV_R0_A, MOV_R1_A, MOV_R2_A, MOV_R3_A, MOV_R4_A, MOV_R5_A, MOV_R6_A,
         MOV_R7_A,
         SWAP_A,
         DA_A,
         CPL_A:
         begin
            fsm_sfr_addr_o = SFR_A;
            wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DIV_AB, MUL_AB:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_A;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DJNZ_D:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
               case(fsm_opcode)
                  DJNZ_R0: reg_addr_task (REG_R0, fsm_ram_addr_o);
                  DJNZ_R1: reg_addr_task (REG_R1, fsm_ram_addr_o);
                  DJNZ_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
                  DJNZ_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
                  DJNZ_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
                  DJNZ_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
                  DJNZ_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
                  DJNZ_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
               endcase
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // sfr - put SFR addr of A special register and ROM address
         ADD_A_DATA, ADD_A_D, ADDC_A_DATA, ADDC_A_D,
         ORL_A_D, ORL_D_A, ORL_A_DATA,
         ANL_D_A, ANL_A_DATA, ANL_A_D,
         XRL_D_A, XRL_A_DATA, XRL_A_D,
         SUBB_A_DATA, SUBB_A_D,
         MOV_D_A,
         JNZ, JZ,
         XCH_A_D: 
         begin
            fsm_sfr_addr_o = SFR_A;
            wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         CJNE_A_DATA, CJNE_A_D:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_A;
               wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // sfr - put SFR addr of CY special register and ROM address
         ORL_C_BIT, ORL_C_NBIT,
         JC, JNC, ANL_C_BIT, ANL_C_NBIT,
         MOV_BIT_C, MOV_C_BIT: 
         begin
            fsm_sfr_addr_o = SFR_PSW_CY;
            wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BIT);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // sfr - put SFR addr of CY special register and ROM address
         CPL_C, CLR_C,
         SETB_C: 
         begin
            fsm_sfr_addr_o = SFR_PSW_CY;
            wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BIT);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end      
//------------------------------------------------------------------------------
         // RAM - put RAM addr of Rn
         INC_ATR0, INC_ATR1,
         DEC_ATR0, DEC_ATR1,
         MOV_ATR0_DATA, MOV_ATR1_DATA,
         MOV_A_ATR0, MOV_A_ATR1,
         MOV_A_R0, MOV_A_R1, MOV_A_R2, MOV_A_R3, MOV_A_R4, MOV_A_R5, MOV_A_R6,
         MOV_A_R7,
         MOVX_A_ATR0, MOVX_A_ATR1:
         begin
            case(fsm_opcode)
               INC_ATR0, DEC_ATR0, MOV_ATR0_DATA, MOV_A_ATR0, MOV_A_R0,
               MOVX_A_ATR0:
               reg_addr_task (REG_R0, fsm_ram_addr_o);
               INC_ATR1, DEC_ATR1, MOV_ATR1_DATA, MOV_A_ATR1, MOV_A_R1,
               MOVX_A_ATR1:
               reg_addr_task (REG_R1, fsm_ram_addr_o);
               MOV_A_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               MOV_A_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               MOV_A_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               MOV_A_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               MOV_A_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               MOV_A_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase      
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR 
            wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end //end INC_ATR0, INC_ATR1, DEC_ATR0, DEC_ATR1
//------------------------------------------------------------------------------
         // RAM - put RAM addr of Rn
         MOVX_ATR0_A, MOVX_ATR1_A:
         begin
            case(fsm_opcode)
               MOVX_ATR0_A: reg_addr_task (REG_R0, fsm_ram_addr_o);
               MOVX_ATR1_A: reg_addr_task (REG_R1, fsm_ram_addr_o);
            endcase 
            
            fsm_sfr_addr_o   = SFR_A;
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR 
            wr_rd_flags_task (OFF, ON, ON, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end //end
//------------------------------------------------------------------------------
         // RAM - put RAM addr of Rn and ROM address
         MOV_D_ATR0, MOV_D_ATR1,
         MOV_D_R0, MOV_D_R1, MOV_D_R2, MOV_D_R3, MOV_D_R4, MOV_D_R5, MOV_D_R6,
         MOV_D_R7,
         MOV_ATR0_D, MOV_ATR1_D:
         begin
            case(fsm_opcode)
               MOV_D_ATR0, MOV_D_R0, MOV_ATR0_D:
               reg_addr_task (REG_R0, fsm_ram_addr_o);
               MOV_D_ATR1, MOV_D_R1, MOV_ATR1_D:
               reg_addr_task (REG_R1, fsm_ram_addr_o);
               MOV_D_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               MOV_D_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               MOV_D_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               MOV_D_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               MOV_D_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               MOV_D_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase 
                 
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR 
            wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         

//------------------------------------------------------------------------------
         // RAM - put RAM addr of Rn and SFR addr of SFR_A
         ADD_A_ATR0, ADD_A_ATR1, ADDC_A_ATR0, ADDC_A_ATR1,
         ORL_A_ATR0, ORL_A_ATR1,
         ANL_A_ATR0, ANL_A_ATR1,
         XRL_A_ATR0, XRL_A_ATR1,
         SUBB_A_ATR0, SUBB_A_ATR1,
         MOV_ATR0_A, MOV_ATR1_A,
         XCH_A_ATR0, XCH_A_ATR1, XCHD_A_ATR0, XCHD_A_ATR1,
         XCH_A_R0, XCH_A_R1, XCH_A_R2, XCH_A_R3, XCH_A_R4, XCH_A_R5, XCH_A_R6,
         XCH_A_R7: 
         begin
            fsm_sfr_addr_o = SFR_A;
            case(fsm_opcode)
               ADD_A_ATR0, ADDC_A_ATR0, ORL_A_ATR0, ANL_A_ATR0, XRL_A_ATR0,
               SUBB_A_ATR0, MOV_ATR0_A, XCH_A_ATR0, XCH_A_R0, XCHD_A_ATR0:
               reg_addr_task (REG_R0, fsm_ram_addr_o);
               ADD_A_ATR1, ADDC_A_ATR1, ORL_A_ATR1, ANL_A_ATR1, XRL_A_ATR1,
               SUBB_A_ATR1, MOV_ATR1_A, XCH_A_ATR1, XCH_A_R1, XCHD_A_ATR1:
               reg_addr_task (REG_R1, fsm_ram_addr_o);
               XCH_A_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               XCH_A_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               XCH_A_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               XCH_A_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               XCH_A_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               XCH_A_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase 
                    
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR 
            wr_rd_flags_task (OFF, ON, ON, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end // ADD_A_ATR0, ADD_A_ATR1, ADDC_A_ATR0, ADDC_A_ATR1
//------------------------------------------------------------------------------
         // RAM - put RAM addr of Rn and ROM addr of OP2
         CJNE_ATR0_DATA, CJNE_ATR1_DATA,
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA: 
         begin
            if (cycle_continue == DIS) // 1st machine cycle
               begin
                  case(fsm_opcode)
                     CJNE_ATR0_DATA, CJNE_R0_DATA: 
                     reg_addr_task (REG_R0, fsm_ram_addr_o);
                     CJNE_ATR1_DATA, CJNE_R1_DATA:
                     reg_addr_task (REG_R1, fsm_ram_addr_o);
                     CJNE_R2_DATA: reg_addr_task (REG_R2, fsm_ram_addr_o);
                     CJNE_R3_DATA: reg_addr_task (REG_R3, fsm_ram_addr_o);
                     CJNE_R4_DATA: reg_addr_task (REG_R4, fsm_ram_addr_o);
                     CJNE_R5_DATA: reg_addr_task (REG_R5, fsm_ram_addr_o);
                     CJNE_R6_DATA: reg_addr_task (REG_R6, fsm_ram_addr_o);
                     CJNE_R7_DATA: reg_addr_task (REG_R7, fsm_ram_addr_o);
                  endcase
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR 
               wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
               end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end                    
//------------------------------------------------------------------------------
         LCALL,
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_SP;
               wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         PUSH, POP:
         begin
            fsm_sfr_addr_o = SFR_SP;
            wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_A;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         INC_DPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPL;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPH;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_ATDPTR_A:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPL;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPL;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end
            else                       // 2nd machine cycle
            begin
               fsm_ram_addr_o = fsm_op1;
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, EN, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_A;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'd0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0); 
               alu_task         (EN, ALU_ADDC, fsm_op_aux_2, 8'd0);
            end   
         end               
//------------------------------------------------------------------------------
         MOVC_A_ATPC:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_A;
               wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op_aux_2, EN, fsm_op_aux_1);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         RETI, RET:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_SP;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end
            else                       // 2nd machine cycle
            begin
               fsm_ram_addr_o    = fsm_op_aux_1;
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         default: //CLR_A
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end

      endcase
   end
endtask

task decode_1_sequential_task; //###############################################
// Active on @negedge clock 
// regs: fsm_op1 / fsm_op_aux_1  

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin   
      case (fsm_opcode)

         // ROM - receive data from ROM and put it in fsm_op1 register
         AJMP_1, AJMP_2, AJMP_3, AJMP_4, AJMP_5, AJMP_6, AJMP_7, AJMP_8, LJMP, 
         MOV_A_DATA, MOV_D_DATA, SJMP, JBC, JB, JNB,
         SETB_BIT, 
         MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D, MOV_R4_D, MOV_R5_D, MOV_R6_D,
         MOV_R7_D,
         MOV_D_D, MOV_A_D,
         INC_D,
         DEC_D,
         ORL_D_DATA,
         ANL_D_DATA,
         XRL_D_DATA,
         MOV_DPTR_DATA,
         CPL_BIT, CLR_BIT:
         begin
            fsm_op1 <= fsm_rom_data_i;
         end
//------------------------------------------------------------------------------
         // RAM - receive data from RAM and put it in fsm_op1 register
         INC_ATR0, INC_ATR1,
         DEC_ATR0, DEC_ATR1,
         MOV_ATR0_DATA, MOV_ATR1_DATA, MOV_A_ATR0, MOV_A_ATR1, 
         MOV_A_R0, MOV_A_R1, MOV_A_R2, MOV_A_R3, MOV_A_R4, MOV_A_R5, MOV_A_R6,
         MOV_A_R7,
         MOVX_A_ATR0, MOVX_A_ATR1:
         begin
            fsm_op1 <= fsm_ram_data_i;
         end
//------------------------------------------------------------------------------
         // RAM - receive data from ROM and SFR and put it in fsm_op1 
         //and fsm_op_aux_1 registers
         ADD_A_DATA, ADD_A_D, ADDC_A_DATA, ADDC_A_D,
         ORL_A_D, ORL_D_A, ORL_A_DATA,
         ANL_D_A, ANL_A_DATA, ANL_A_D,
         XRL_D_A, XRL_A_DATA, XRL_A_D,
         ORL_C_BIT, ORL_C_NBIT,
         JC, JNC, ANL_C_BIT, ANL_C_NBIT,
         MOV_BIT_C, MOV_C_BIT,
         SUBB_A_DATA, SUBB_A_D,
         MOV_D_A,
         JNZ, JZ,
         PUSH, POP,
         XCH_A_D:
         begin
            fsm_op1 <= fsm_rom_data_i;
            fsm_op_aux_1 <= fsm_sfr_data_i;
         end
//------------------------------------------------------------------------------
         CJNE_A_DATA, CJNE_A_D:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_op1        <= fsm_rom_data_i;
               fsm_op_aux_1   <= fsm_sfr_data_i;
               cycle_continue <= EN;
            end
            
            else                    // 2nd machine cycle
            begin
               fsm_op1        <= fsm_op1;
               fsm_op_aux_1   <= fsm_op_aux_1;
               cycle_continue <= DIS;
            end   
         end
//------------------------------------------------------------------------------
         DJNZ_D:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_op1        <= fsm_rom_data_i;
               cycle_continue <= EN;
            end
            
            else                    // 2nd machine cycle
            begin
               fsm_op1        <= fsm_op1;
               cycle_continue <= DIS;
            end   
         end
//------------------------------------------------------------------------------
         CJNE_ATR0_DATA, CJNE_ATR1_DATA,
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA,
         DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               fsm_op1        <= fsm_ram_data_i;
               fsm_op_aux_1   <= fsm_rom_data_i;
               cycle_continue <= EN;
            end
            
            else                    // 2nd machine cycle
            begin
               fsm_op1        <= fsm_op1;
               fsm_op_aux_1   <= fsm_op_aux_1;
               cycle_continue <= DIS;
            end   
         end                  
//------------------------------------------------------------------------------
         // RAM - receive data from ROM and RAM and put it in fsm_op1 
         //and fsm_op_aux_1 registers
         MOV_D_ATR0, MOV_D_ATR1,
         MOV_D_R0, MOV_D_R1, MOV_D_R2, MOV_D_R3, MOV_D_R4, MOV_D_R5, MOV_D_R6,
         MOV_D_R7, 
         MOV_ATR0_D, MOV_ATR1_D:
         begin
            fsm_op1          <= fsm_ram_data_i;
            fsm_op_aux_1     <= fsm_rom_data_i;
         end         
//------------------------------------------------------------------------------
         // RAM - receive data from ROM and SFR and put it in fsm_op1 
         //and fsm_op_aux_1 registers
         ADD_A_ATR0, ADD_A_ATR1, ADDC_A_ATR0, ADDC_A_ATR1,
         ORL_A_ATR0, ORL_A_ATR1,
         ANL_A_ATR0, ANL_A_ATR1,
         XRL_A_ATR0, XRL_A_ATR1,
         SUBB_A_ATR0, SUBB_A_ATR1,
         MOV_ATR0_A, MOV_ATR1_A,
         XCH_A_ATR0, XCH_A_ATR1, XCHD_A_ATR0, XCHD_A_ATR1,
         XCH_A_R0, XCH_A_R1, XCH_A_R2, XCH_A_R3, XCH_A_R4, XCH_A_R5, XCH_A_R6,
         XCH_A_R7,
         MOVX_ATR0_A, MOVX_ATR1_A:
         begin
            fsm_op1 <= fsm_ram_data_i;
            fsm_op_aux_1 <= fsm_sfr_data_i;
         end                   
//------------------------------------------------------------------------------
         // SFR - receive data from A SFR and put it in fsm_op1 register
         RR_A, RRC_A, RL_A, RLC_A,
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7,
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7,
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7,
         DEC_A,
         INC_A,
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7,
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7,
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7,
         MOV_R0_A, MOV_R1_A, MOV_R2_A, MOV_R3_A, MOV_R4_A, MOV_R5_A, MOV_R6_A,
         MOV_R7_A,
         CPL_C, CLR_C,
         SETB_C,
         SWAP_A,
         DA_A,
         CPL_A: 
         begin
            fsm_op1 <= fsm_sfr_data_i;
         end
//------------------------------------------------------------------------------
         DIV_AB, MUL_AB:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op1        <= fsm_sfr_data_i; // receiving current Acc data
            end
            
            else                    // 2nd machine cycle
            begin
               cycle_continue <= DIS;
            end   
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op1        <= fsm_sfr_data_i; // receiving current Acc data
            end
            
            else                    // 2nd machine cycle
            begin
               fsm_op1        <= fsm_ram_data_i;
               cycle_continue <= DIS;
            end   
         end
//------------------------------------------------------------------------------
         MOVX_ATDPTR_A:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op1        <= fsm_sfr_data_i; // receiving current DPL data
            end
            
            else                    // 2nd machine cycle
            begin
               fsm_op1        <= fsm_op1;
               cycle_continue <= DIS;
            end   
         end               
//------------------------------------------------------------------------------
         // SFR - receive data from A SFR and put it in fsm_op1 register
         // save PC LSB in fsm_op_aux_1
         MOVC_A_ATPC: 
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op_aux_1 <= fsm_sfr_data_i; // A data
               fsm_op1     <= fsm_pc_i [7:0];  // PC LSB
            end
            
            else                    // 2nd machine cycle
            begin
               cycle_continue <= DIS;
            end          
            
         end         
         
//------------------------------------------------------------------------------
         LCALL,
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op_aux_1   <= fsm_sfr_data_i; // receiving current SP address
            
               if (lcall_hardware_flag == DIS)
               begin
                  fsm_op1     <= fsm_rom_data_i; // receiving 1st operand
               end
               else
               begin
                  fsm_op1     <= 8'd0;
               end
            end
            
            else                    // 2nd machine cycle
            begin
               cycle_continue <= DIS;
            end   
         end
//------------------------------------------------------------------------------
         JMP_A_DPTR, INC_DPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op1        <= fsm_sfr_data_i; // receiving current Acc data
            end
            
            else                    // 2nd machine cycle
            begin
               cycle_continue <= DIS;
               fsm_op1        <= fsm_op1;
            end   
         end
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op_aux_1   <= fsm_sfr_data_i; // receiving current Acc data
            end
            
            else                    // 2nd machine cycle
            begin
               cycle_continue <= DIS;
               fsm_op_aux_1_2 <= fsm_alu_result_i [7:0]; // receiving DPH temp
            end   
         end                  
//------------------------------------------------------------------------------
         RETI, RET:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               cycle_continue <= EN;
               fsm_op_aux_1     <= fsm_sfr_data_i;
            end
            
            else                       // 2nd machine cycle
            begin
               cycle_continue <= DIS;
               fsm_op1 <= fsm_ram_data_i;
            end   
        
end
//------------------------------------------------------------------------------
         default: 
         begin

         end
      
      endcase
   end
endtask

task decode_2_combinational_task; //############################################
// Active on @fsm_state_o 

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin   
      case (fsm_opcode)
         
         MOV_A_DATA, SJMP: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         LJMP,
         MOV_D_DATA, MOV_ATR0_DATA, MOV_ATR1_DATA,
         MOV_R0_DATA, MOV_R1_DATA, MOV_R2_DATA, MOV_R3_DATA, MOV_R4_DATA,
         MOV_R5_DATA, MOV_R6_DATA, MOV_R7_DATA: 
         begin
            wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         CJNE_A_DATA,
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
            
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         CJNE_A_D,
         DJNZ_D:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               if (fsm_op1 > 8'h7F) //SFR access
               begin
                  fsm_sfr_addr_o = fsm_op1;
                  // READ/WRITE    ROM| RAM| SFR| RAM| SFR
                  wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
               end
               
               else                //RAM access
               begin
                  fsm_ram_addr_o = fsm_op1;
                  wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BYTE);
               end
               pcau_task           (EN, 8'd1, DIS, 8'd0);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end  //end cycle_continue    
//------------------------------------------------------------------------------
         DIV_AB, MUL_AB:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_B;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end    
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand 1 data) in RAM or SFR
         ORL_D_DATA,
         ANL_D_DATA,
         XRL_D_DATA,
         MOV_D_D:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o = fsm_op1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o = fsm_op1;
               wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand 1 data - BYTE) in RAM or SFR and
         // ROM      - put ROM addr of Operand 2
         JBC, JNB, JB:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o = fsm_op1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, ON, OFF, OFF, DIS, BIT);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o = fsm_op1;
               wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BIT);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand 1 data - BYTE) in RAM or SFR
         SETB_BIT, CPL_BIT, CLR_BIT,
         MOV_BIT_C, MOV_C_BIT,
         ANL_C_BIT, ANL_C_NBIT,
         ORL_C_BIT, ORL_C_NBIT:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o = fsm_op1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BIT);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o = fsm_op1;
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BIT);
            end
            pcau_task        (OFF, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr of DPH in SFR and ask for the next operand
         // ROM      - put ROM addr of Operand 2
         MOV_DPTR_DATA:
         begin
            fsm_sfr_addr_o = SFR_DPH;
            fsm_sfr_data_o = fsm_op1;
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPH;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_ATDPTR_A:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPH;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               fsm_sfr_addr_o = SFR_A;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand aux 1 data) in RAM or SFR
         MOV_ATR0_D, MOV_ATR1_D:
         begin
            if (fsm_op_aux_1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o = fsm_op_aux_1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o = fsm_op_aux_1;
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand 1 data) in RAM or SFR
         MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D, 
         MOV_R4_D, MOV_R5_D, MOV_R6_D, MOV_R7_D, MOV_A_D,
         INC_D,
         DEC_D,
         ADD_A_D, ADDC_A_D,
         ORL_A_D, ORL_D_A,
         ANL_D_A, ANL_A_D,
         XRL_D_A, XRL_A_D,
         SUBB_A_D,
         XCH_A_D,
         PUSH:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o = fsm_op1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o = fsm_op1;
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         POP:
         begin
            fsm_ram_addr_o = fsm_op_aux_1;
            wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end             
//------------------------------------------------------------------------------
         // RAM  - put addr (Operand 1 data) in RAM begin
         INC_ATR0, INC_ATR1,
         DEC_ATR0, DEC_ATR1,
         ADD_A_ATR0, ADD_A_ATR1,
         ADDC_A_ATR0, ADDC_A_ATR1,
         ORL_A_ATR0, ORL_A_ATR1,
         ANL_A_ATR0, ANL_A_ATR1,
         XRL_A_ATR0, XRL_A_ATR1,
         MOV_D_ATR0, MOV_D_ATR1, MOV_A_ATR0, MOV_A_ATR1,
         SUBB_A_ATR0, SUBB_A_ATR1,
         XCH_A_ATR0, XCH_A_ATR1, XCHD_A_ATR0, XCHD_A_ATR1:
         begin
            fsm_ram_addr_o = fsm_op1;
            wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         CJNE_ATR0_DATA, CJNE_ATR1_DATA:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_ram_addr_o = fsm_op1;
               wr_rd_flags_task (ON, ON, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         // RAM  - put addr (Operand 1 data) to external RAM
         MOVX_A_ATR0, MOVX_A_ATR1:
         begin
            fsm_ram_addr_o = fsm_op1;
            wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, EN, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // RAM - put RAM addr of Rn
         INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7,
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7,
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7,
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7,
         DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7,
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7,
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7,
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7: 
         begin
            case(fsm_opcode)
               INC_R0, ADD_A_R0, ADDC_A_R0, DEC_R0, ORL_A_R0, ANL_A_R0,
               XRL_A_R0, SUBB_A_R0:
               reg_addr_task (REG_R0,fsm_ram_addr_o); //R0
               INC_R1, ADD_A_R1, ADDC_A_R1, DEC_R1, ORL_A_R1, ANL_A_R1,
               XRL_A_R1, SUBB_A_R1:
               reg_addr_task (REG_R1,fsm_ram_addr_o); //R1
               INC_R2, ADD_A_R2, ADDC_A_R2, DEC_R2, ORL_A_R2, ANL_A_R2,
               XRL_A_R2, SUBB_A_R2:
               reg_addr_task (REG_R2,fsm_ram_addr_o); //R2
               INC_R3, ADD_A_R3, ADDC_A_R3, DEC_R3, ORL_A_R3, ANL_A_R3, 
               XRL_A_R3, SUBB_A_R3:
               reg_addr_task (REG_R3,fsm_ram_addr_o); //R3
               INC_R4, ADD_A_R4, ADDC_A_R4, DEC_R4, ORL_A_R4, ANL_A_R4, 
               XRL_A_R4, SUBB_A_R4:
               reg_addr_task (REG_R4,fsm_ram_addr_o); //R4
               INC_R5, ADD_A_R5, ADDC_A_R5, DEC_R5, ORL_A_R5, ANL_A_R5, 
               XRL_A_R5, SUBB_A_R5:
               reg_addr_task (REG_R5,fsm_ram_addr_o); //R5
               INC_R6, ADD_A_R6, ADDC_A_R6, DEC_R6, ORL_A_R6, ANL_A_R6, 
               XRL_A_R6, SUBB_A_R6:
               reg_addr_task (REG_R6,fsm_ram_addr_o); //R6
               INC_R7, ADD_A_R7, ADDC_A_R7, DEC_R7, ORL_A_R7, ANL_A_R7, 
               XRL_A_R7, SUBB_A_R7:
               reg_addr_task (REG_R7,fsm_ram_addr_o); //R7
            endcase      
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end                     
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand 1 data - BIT) in RAM and
         JC, JNC:
         begin
            fsm_ram_addr_o = fsm_op1;
            wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BIT);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);   
         end
//------------------------------------------------------------------------------
         LCALL:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end       
            else                       // 2nd machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_INC, fsm_op_aux_1, 8'd1);
            end
         end
//------------------------------------------------------------------------------
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7,
         ACALL_8:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'd0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_INC, fsm_op_aux_1, 8'd1);
            end
         end         
//------------------------------------------------------------------------------
         // RAM/SFR  - put addr (Operand 1 data - BYTE) in RAM or SFR and     
         MOVC_A_ATPC:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin            
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_ADD, fsm_pc_i [7:0], fsm_op_aux_1); 
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
            
         end         
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPL;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_ADDC, fsm_op_aux_2, 8'd0); // DPH
            end
         end
//------------------------------------------------------------------------------
         INC_DPTR:
         begin
            if (cycle_continue == DIS) // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPL;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'd0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               pcau_task        (EN, fsm_op_aux_1, EN, fsm_op_aux_1_2);
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end      
//------------------------------------------------------------------------------
         RET:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_ram_addr_o    = fsm_op_aux_1;
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            end
            
            else                       // 2nd machine cycle
            begin
               pcau_task        (EN, fsm_op1, EN, fsm_op2);
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end 
//------------------------------------------------------------------------------
         RETI:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_ram_addr_o    = fsm_op_aux_1;
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               wr_rd_flags_task (OFF, ON, OFF, OFF, OFF, DIS, BYTE);
            end
            
            else                       // 2nd machine cycle
            begin
               pcau_task        (EN, fsm_op1, EN, fsm_op2);
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // AJMPs, RR_A, RRC_A, RLC_A, INC_A, CLR_A
         default: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end

      endcase
   end
endtask //end decode 2 combinational task

task decode_2_sequential_task; //###############################################
// Active on @posedge clock
// regs: fsm_op2 / fsm_op_aux_2  

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin
      case (fsm_opcode)
         LJMP,
         MOV_D_DATA, MOV_ATR0_DATA, MOV_ATR1_DATA,
         MOV_R0_DATA, MOV_R1_DATA, MOV_R2_DATA, MOV_R3_DATA, MOV_R4_DATA,
         MOV_R5_DATA, MOV_R6_DATA, MOV_R7_DATA,
         MOV_DPTR_DATA:
         begin
            fsm_op2         <= fsm_rom_data_i;
         end
//------------------------------------------------------------------------------
         CJNE_A_DATA,
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op2     <= fsm_rom_data_i; 
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_op2     <= fsm_op2; 
            end            
         end
//------------------------------------------------------------------------------
         CJNE_A_D,
         DJNZ_D:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
              fsm_op2 <= fsm_rom_data_i;
               if (fsm_op1 > 8'h7F) //SFR access
               begin
                  fsm_op_aux_2 <= fsm_sfr_data_i;
               end 
               else                //RAM access
               begin
                  fsm_op_aux_2 <= fsm_ram_data_i;
               end
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_op2        <= fsm_op2;
               fsm_op_aux_2   <= fsm_op_aux_2;
            end            
         end
//------------------------------------------------------------------------------
         CJNE_ATR0_DATA, CJNE_ATR1_DATA:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
              fsm_op2 <= fsm_rom_data_i;
              fsm_op_aux_2 <= fsm_ram_data_i;
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_op2        <= fsm_op2;
               fsm_op_aux_2   <= fsm_op_aux_2;
            end            
         end 
//------------------------------------------------------------------------------
         DIV_AB, MUL_AB:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
                  fsm_op2  <= fsm_sfr_data_i; 
            end
            
            else                      // 2nd machine cycle
            begin
                  fsm_op2  <= fsm_op2; 
            end            
         end
//------------------------------------------------------------------------------
         JBC, JB, JNB, MOV_D_D:
         begin
            fsm_op2 <= fsm_rom_data_i;
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_op_aux_2 <= fsm_sfr_data_i;
            end 
            else                //RAM access
            begin
               fsm_op_aux_2 <= fsm_ram_data_i;
            end
         end
//------------------------------------------------------------------------------
         MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D, 
         MOV_R4_D, MOV_R5_D, MOV_R6_D, MOV_R7_D, MOV_A_D, 
         INC_D,
         DEC_D,
         ADD_A_D, ADDC_A_D,
         ORL_A_D, ORL_D_A,
         ANL_D_A, ANL_A_D,
         XRL_D_A, XRL_A_D,
         ORL_C_BIT, ORL_C_NBIT,
         ANL_C_BIT, ANL_C_NBIT,
         SUBB_A_D,
         MOV_BIT_C, MOV_C_BIT,
         CPL_BIT, CLR_BIT,
         PUSH,
         XCH_A_D,
         SETB_BIT:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_op2 <= fsm_sfr_data_i;
            end 
            else                //RAM access
            begin
               fsm_op2 <= fsm_ram_data_i;
            end
         end
//------------------------------------------------------------------------------
         XCH_A_ATR0, XCH_A_ATR1, XCHD_A_ATR0, XCHD_A_ATR1,
         POP:
         begin
            fsm_op2 <= fsm_ram_data_i;
         end         
//------------------------------------------------------------------------------
         ORL_D_DATA,
         ANL_D_DATA,
         XRL_D_DATA:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_op2 <= fsm_sfr_data_i;
            end 
            else                //RAM access
            begin
               fsm_op2 <= fsm_ram_data_i;
            end
            fsm_op_aux_2 <= fsm_rom_data_i;
         end
//------------------------------------------------------------------------------
         MOV_ATR0_D, MOV_ATR1_D:
         begin
            if (fsm_op_aux_1 > 8'h7F) //SFR access
            begin
               fsm_op2 <= fsm_sfr_data_i;
            end 
            else                //RAM access
            begin
               fsm_op2 <= fsm_ram_data_i;
            end
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR, MOVX_ATDPTR_A:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
                  fsm_op2        <= fsm_sfr_data_i;
                  fsm_op_aux_2   <= fsm_op_aux_2;
            end
            
            else                      // 2nd machine cycle
            begin
                  fsm_op2        <= fsm_op2;
                  fsm_op_aux_2   <= fsm_sfr_data_i;
            end            
         end
//------------------------------------------------------------------------------
         INC_ATR0, INC_ATR1, 
         INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7,
         DEC_ATR0, DEC_ATR1,
         DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7,
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7,
         ADD_A_ATR0, ADD_A_ATR1, ADDC_A_ATR0, ADDC_A_ATR1,
         ORL_A_ATR0, ORL_A_ATR1, 
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7,
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7,
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7,
         ANL_A_ATR0, ANL_A_ATR1,
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7,
         XRL_A_ATR0, XRL_A_ATR1,
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7,
         MOV_D_ATR0, MOV_D_ATR1, MOV_A_ATR0, MOV_A_ATR1,
         SUBB_A_ATR0, SUBB_A_ATR1,
         MOVX_A_ATR0, MOVX_A_ATR1:
         begin
            fsm_op2 <= fsm_ram_data_i;
         end         
//------------------------------------------------------------------------------
         LCALL,
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7,
         ACALL_8:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               if (lcall_hardware_flag == DIS)
               begin
                  fsm_op2        <= fsm_rom_data_i;
               end
               else
               begin
                  fsm_op2        <= fsm_op2;
               end
            end
            else
            begin
               fsm_op_aux_2      <= fsm_alu_result_i[7:0]; // ALU Result
            end
               
         end
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
                  fsm_op2        <= fsm_sfr_data_i; // DPL data
            end
            
            else                      // 2nd machine cycle
            begin
                  fsm_op_aux_2        <= fsm_alu_result_i [7:0]; // DPL data
            end            
         end
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
                  fsm_op_aux_2   <= fsm_sfr_data_i; // DPL data
                  fsm_op2        <= fsm_pc_i [7:0]; // save LSB  
            end
            
            else                      // 2nd machine cycle
            begin
                  fsm_op_aux_2   <= fsm_op_aux_2; // DPH temp
            end            
         end                 
//------------------------------------------------------------------------------
         MOVC_A_ATPC:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
                  fsm_op_aux_2   <= fsm_alu_result_i [7:0]; // store LSB + A
                  fsm_op2        <= fsm_pc_i [15:8];        // stote MSB
            end
            
            else                      // 2nd machine cycle
            begin
                  fsm_op_aux_2   <= fsm_rom_data_i; // ROM data
            end            
         end   
//------------------------------------------------------------------------------
         RETI, RET:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op2          <= fsm_ram_data_i;
            end
         end
//------------------------------------------------------------------------------
        // MOV_A_DATA, SJMP, AJMPs, RR_A, RRC_A, RLC_A, INC_A,
        // CLR_A, INC_DPTR
        default: 
         begin

         end

      endcase
   end
endtask //end decode 2 sequential task

task execution_combinational_task; //###########################################
// Active on @fsm_state_o


`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin   
      case (fsm_opcode)
         
         AJMP_1, AJMP_2, AJMP_3, AJMP_4, AJMP_5, AJMP_6, AJMP_7, AJMP_8: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task       (EN, fsm_op1, EN,{fsm_pc_i[15:11],fsm_opcode[7:5]});
            alu_task        (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7,   
         ACALL_8: 
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'd0, DIS, 8'd0);
               alu_task         (EN, ALU_INC, fsm_op_aux_1, 8'd1);          
            end
           
            else                       // 2nd machine cycle
            begin
               fsm_ram_addr_o    = fsm_op_aux_2;
               fsm_ram_data_o    = fsm_pc_i[15:8];
               fsm_sfr_addr_o    = SFR_SP;
               fsm_sfr_data_o    = fsm_op_aux_2;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, ON, ON, DIS, BYTE);
               pcau_task        (EN,fsm_op1,EN,                         
                                {fsm_pc_i[15:11],fsm_opcode[7:5]});
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end // cycle_continue            
         end
//------------------------------------------------------------------------------
         LCALL:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'd0, DIS, 8'd0);
               alu_task         (EN, ALU_INC, fsm_op_aux_1, 8'd1);
            end
            
            else                       // 2nd machine cycle
            begin
               fsm_ram_addr_o    = fsm_op_aux_2;
               fsm_ram_data_o    = fsm_pc_i[15:8];
               fsm_sfr_addr_o    = SFR_SP;
               fsm_sfr_data_o    = fsm_op_aux_2;
               wr_rd_flags_task (OFF, OFF, OFF, ON, ON, DIS, BYTE);
               pcau_task        (EN, fsm_op2, EN, fsm_op1);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end         
//------------------------------------------------------------------------------
         LJMP: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, fsm_op2, EN, fsm_op1);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR, MOVX_ATDPTR_A: 
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o   = SFR_P2EN;
               fsm_sfr_data_o   = 8'b11111111;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);            
            end
           
            else                       // 2nd machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            end // cycle_continue
            pcau_task        (DIS, 8'd0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);            
         end
//------------------------------------------------------------------------------
         SWAP_A: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 8'b0, DIS, 8'b0);
            alu_task         (EN, ALU_SWAP, fsm_op1, 8'd0);
         end
//------------------------------------------------------------------------------
         CPL_A: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 8'b0, DIS, 8'b0);
            alu_task         (EN, ALU_CPL, fsm_op1, 8'd0);
         end
//------------------------------------------------------------------------------
         DA_A: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 8'b0, DIS, 8'b0);
            alu_task         (EN, ALU_DA, fsm_op1, 8'd0);
         end
//------------------------------------------------------------------------------
         XCH_A_ATR0, XCH_A_ATR1:
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 8'b0, DIS, 8'b0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         XCH_A_D:
         begin
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = fsm_op2; //Direct operand data
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (DIS, 8'b0, DIS, 8'b0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
         
//------------------------------------------------------------------------------
         XCHD_A_ATR0, XCHD_A_ATR1:
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            fsm_sfr_addr_o = SFR_A;
            fsm_sfr_data_o = {fsm_op_aux_1[7:4],fsm_op2[3:0]};
            wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (DIS, 8'b0, DIS, 8'b0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         CJNE_A_DATA:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'b0, DIS, 8'b0);
               alu_task         (EN, ALU_COMP, fsm_op_aux_1, fsm_op1);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end
//------------------------------------------------------------------------------
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'b0, DIS, 8'b0);
               alu_task         (EN, ALU_COMP, fsm_op1, fsm_op_aux_1);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end
//------------------------------------------------------------------------------
         CJNE_A_D:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'b0, DIS, 8'b0);
               alu_task         (EN, ALU_COMP, fsm_op_aux_1, fsm_op_aux_2);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end
//------------------------------------------------------------------------------
         DJNZ_D:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'b0, DIS, 8'b0);
               alu_task         (EN, ALU_DEC, fsm_op_aux_2, 8'd1);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end
//------------------------------------------------------------------------------
         DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'b0, DIS, 8'b0);
               alu_task         (EN, ALU_DEC, fsm_op1, 8'd1);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end
//------------------------------------------------------------------------------
         CJNE_ATR0_DATA, CJNE_ATR1_DATA:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 8'b0, DIS, 8'b0);
               alu_task         (EN, ALU_COMP, fsm_op_aux_2, fsm_op_aux_1);
            end
            
            else                       // 2nd machine cycle does nothing
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end
         end                          
//------------------------------------------------------------------------------
         SJMP: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, fsm_op1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         RR_A: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_RR, fsm_op1, 8'd0);
         end
//------------------------------------------------------------------------------
         RL_A: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_RL, fsm_op1, 8'd0);
         end         
//------------------------------------------------------------------------------
         RRC_A: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_RRC, fsm_op1, 8'd0);
         end
//------------------------------------------------------------------------------
         RLC_A: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_RLC, fsm_op1, 8'd0);
         end         
//------------------------------------------------------------------------------
         DEC_A: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_DEC, fsm_op1, 8'd1);
         end
//------------------------------------------------------------------------------
         DEC_D: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_DEC, fsm_op2, 8'd1);
         end                           
//------------------------------------------------------------------------------
         INC_A: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_INC, fsm_op1, 8'd1);
         end                
//------------------------------------------------------------------------------
         INC_D, INC_ATR0, INC_ATR1,
         INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_INC, fsm_op2, 8'd1);
         end
//------------------------------------------------------------------------------
         DIV_AB:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_DIV, fsm_op1, fsm_op2); 
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (OFF, ALU_NONE, 8'd0, 8'd0);
            end
         end
//------------------------------------------------------------------------------
         MUL_AB:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_MUL, fsm_op2, fsm_op1); 
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (OFF, ALU_NONE, 8'd0, 8'd0);
            end
         end         
//------------------------------------------------------------------------------
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_ADD, fsm_op1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_ADDC, fsm_op1, fsm_op2);
         end
//------------------------------------------------------------------------------
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_SUB, fsm_op1, fsm_op2);
         end                 
//------------------------------------------------------------------------------
         ADD_A_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_ADD, fsm_op1, fsm_op_aux_1);
         end
//------------------------------------------------------------------------------
         ADDC_A_DATA:
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_ADDC, fsm_op1, fsm_op_aux_1);
         end
//------------------------------------------------------------------------------
         SUBB_A_DATA:
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_SUB, fsm_op_aux_1, fsm_op1);
         end    
//------------------------------------------------------------------------------
         ADD_A_D, ADD_A_ATR0, ADD_A_ATR1: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_ADD, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ADDC_A_D, ADDC_A_ATR0, ADDC_A_ATR1: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_ADDC, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         SUBB_A_D, SUBB_A_ATR0, SUBB_A_ATR1: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_SUB, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ORL_A_ATR0, ORL_A_ATR1: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_OR, fsm_op_aux_1, fsm_op2);
         end         
//------------------------------------------------------------------------------
         ORL_A_D, ORL_D_A: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_OR, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ORL_A_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_OR, fsm_op1, fsm_op_aux_1);
         end                                
//------------------------------------------------------------------------------
         ORL_D_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_OR, fsm_op_aux_2, fsm_op2);
         end
//------------------------------------------------------------------------------
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_OR, fsm_op1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_AND, fsm_op1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ANL_D_A, ANL_A_D: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_AND, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ANL_A_ATR0, ANL_A_ATR1: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_AND, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         ANL_D_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_AND, fsm_op_aux_2, fsm_op2);
         end
//------------------------------------------------------------------------------
         ANL_A_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_AND, fsm_op1, fsm_op_aux_1);
         end
//------------------------------------------------------------------------------
         XRL_D_A, XRL_A_D: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_XOR, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         XRL_D_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_XOR, fsm_op_aux_2, fsm_op2);
         end
//------------------------------------------------------------------------------
         XRL_A_DATA: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_XOR, fsm_op1, fsm_op_aux_1);
         end 
//------------------------------------------------------------------------------
         XRL_A_ATR0, XRL_A_ATR1: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_XOR, fsm_op_aux_1, fsm_op2);
         end
//------------------------------------------------------------------------------
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_XOR, fsm_op1, fsm_op2);
         end
//------------------------------------------------------------------------------
         DEC_ATR0, DEC_ATR1,
         DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7: 
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_DEC, fsm_op2, 8'd1);
         end                          
//------------------------------------------------------------------------------
         JBC: 
         begin
            // if bit of op1 is set, branch to op2 addr
            if (fsm_op_aux_2[fsm_op1[2:0]] == 1'b1) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op2, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task         
            (EN, ALU_AND, fsm_op_aux_2, bit_mask_task(fsm_op1[2:0], 1'b0));
         end
//------------------------------------------------------------------------------
         JB: 
         begin
            // if bit of op1 is set, branch to op2 addr
            if (fsm_op_aux_2[fsm_op1[2:0]] == 1'b1) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op2, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task            (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         JC: 
         begin
            // if carry bit of op_aux_1 is set, branch to op1 addr
            if (fsm_op_aux_1[7] == 1'b1) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task            (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         JNC: 
         begin
            // if carry bit of op_aux_1 is cleared, branch to op1 addr
            if (fsm_op_aux_1[7] == 1'b0) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task            (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         JNZ: 
         begin
            // if accumulator not equal zero, branch to op1 addr
            if (fsm_op_aux_1 != 8'd0) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task            (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         JZ: 
         begin
            // if accumulator not equal zero, branch to op1 addr
            if (fsm_op_aux_1 == 8'd0) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task            (DIS, ALU_NONE, 8'd0, 8'd0);
         end                          
//------------------------------------------------------------------------------
         JNB: 
         begin
            // if bit of op1 is set, branch to op2 addr
            if (fsm_op_aux_2[fsm_op1[2:0]] == 1'b0) 
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op2, DIS, 8'd0);
            end
            else
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            alu_task            (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         ORL_C_BIT:
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         
            (EN, ALU_OR, {7'd0, fsm_op2[fsm_op1[2:0]]},
            {7'd0, fsm_op_aux_1[7]});
         end
//------------------------------------------------------------------------------
         ORL_C_NBIT:
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         
            (EN, ALU_OR, {7'd0, ~fsm_op2[fsm_op1[2:0]]},
            {7'd0, fsm_op_aux_1[7]});
         end
//------------------------------------------------------------------------------
         ANL_C_BIT:
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         
            (EN, ALU_AND, {7'd0, fsm_op2[fsm_op1[2:0]]},
            {7'd0, fsm_op_aux_1[7]});
         end
//------------------------------------------------------------------------------
         ANL_C_NBIT:
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         
            (EN, ALU_AND, {7'd0, ~fsm_op2[fsm_op1[2:0]]},
            {7'd0, fsm_op_aux_1[7]});
         end
//------------------------------------------------------------------------------
         PUSH:
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_INC, fsm_op_aux_1, 8'd1);
         end
//------------------------------------------------------------------------------
         POP:
         begin
            if (fsm_op1 > 8'h7F)
            begin
               fsm_sfr_addr_o    = fsm_op1;
               fsm_sfr_data_o    = fsm_op2;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
            end
            else
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op2;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (EN, ALU_DEC, fsm_op_aux_1, 8'd1);
         end
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_ADD, fsm_op1, fsm_op2); // DPL temp
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, EN, fsm_op_aux_2);
               alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
            end          
         end
//------------------------------------------------------------------------------
         INC_DPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_INC, fsm_op1, 8'd1); // DPL temp
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_ADDC, fsm_op_aux_1, 8'd0); // DPH
            end          
         end
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_ADD, fsm_op_aux_1, fsm_op_aux_2);// DPL
            end                                                           //temp

            else                       // 2nd machine cycle
            begin
               pcau_task        (EN, fsm_op2, EN, fsm_op1);
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               alu_task         (OFF, ALU_NONE, 8'd0, 8'd0);
            end          
         end         
//------------------------------------------------------------------------------
         MOVC_A_ATPC:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
               alu_task         (EN, ALU_ADDC, fsm_op2, 8'd0); // MSB + C
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, EN, fsm_op2); 
               alu_task         (OFF, ALU_NONE, 8'd0, 8'd0);
            end          
         end
//------------------------------------------------------------------------------
         MOV_BIT_C: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            if (fsm_op_aux_1 [7]) //if CY is set
            begin
               alu_task         
            (EN, ALU_OR, fsm_op2, bit_mask_task(fsm_op1[2:0], 1'b1));
            end
            
            else
            begin
               alu_task         
            (EN, ALU_AND, fsm_op2, bit_mask_task(fsm_op1[2:0], 1'b0));
            end
         end
//------------------------------------------------------------------------------
         CPL_BIT: 
         begin
            if (fsm_op2 [fsm_op1[2:0]]) //if bit is set
            begin
               alu_task         
            (EN, ALU_AND, fsm_op2, bit_mask_task(fsm_op1[2:0], 1'b0));
            end
            
            else
            begin
               alu_task         
            (EN, ALU_OR, fsm_op2, bit_mask_task(fsm_op1[2:0], 1'b1));
            end
            
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
         end
//------------------------------------------------------------------------------
         CLR_BIT: 
         begin
            alu_task (EN, ALU_AND, fsm_op2, bit_mask_task(fsm_op1[2:0], 1'b0));
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
         end
//------------------------------------------------------------------------------
         SETB_BIT: 
         begin
            alu_task (EN, ALU_OR, fsm_op2, bit_mask_task(fsm_op1[2:0], 1'b1));
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
         end
//------------------------------------------------------------------------------
         CPL_C: 
         begin
            if (fsm_op1 [7]) //if bit is set
            begin
               alu_task         
            (EN, ALU_AND, fsm_op1, bit_mask_task(7, 1'b0));
            end
            
            else
            begin
               alu_task         
            (EN, ALU_OR, fsm_op1, bit_mask_task(7, 1'b1));
            end
            
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
         end
//------------------------------------------------------------------------------
         CLR_C: 
         begin
            alu_task (EN, ALU_AND, fsm_op1, bit_mask_task(7, 1'b0));
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
         end
//------------------------------------------------------------------------------
         SETB_C: 
         begin
            alu_task (EN, ALU_OR, fsm_op1, bit_mask_task(7, 1'b1));
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_C_BIT: 
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            if (fsm_op2 [fsm_op1[2:0]]) //if bit is set
            begin
               alu_task         
            (EN, ALU_OR, fsm_op_aux_1, bit_mask_task(7, 1'b1));
            end
            
            else
            begin
               alu_task         
            (EN, ALU_AND, fsm_op_aux_1, bit_mask_task(7, 1'b0));
            end
         end                        
//------------------------------------------------------------------------------
         RET:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, fsm_op1, EN, fsm_op2);
            end
            alu_task         (EN, ALU_DEC, fsm_op_aux_1, 8'd1);
         end         
//------------------------------------------------------------------------------
         RETI:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                       // 2nd machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'hFD, DIS, 8'd0); //PC=PC-3
            end
            alu_task         (EN, ALU_DEC, fsm_op_aux_1, 8'd1);
         end  
//------------------------------------------------------------------------------
         default: // RETI, MOV_D_DATA, MOV_ATRN_DATA, MOV_Rn_DATA, 
                  // CLR_A
         begin
            wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (DIS, 1'b0, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end

      endcase
   end
endtask //end execution combinational task

task execution_sequential_task; //##############################################
// Active on @negedge clock 
// regs: fsm_op1 / fsm_op_aux_1  

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin
      
      case (fsm_opcode)
      
         RR_A, RRC_A, RL_A, RLC_A,
         DEC_A,
         INC_A,
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7,
         ADD_A_DATA, ADD_A_D, ADD_A_ATR0, ADD_A_ATR1, ADDC_A_ATR0, ADDC_A_ATR1,
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7, ADDC_A_DATA, ADDC_A_D, ADDC_A_D,
         ORL_A_D, ORL_A_DATA, ORL_A_ATR0, ORL_A_ATR1,
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7,
         ANL_A_DATA, ANL_A_D, ANL_A_ATR0, ANL_A_ATR1,
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7,
         XRL_A_DATA, XRL_A_D, XRL_A_ATR0, XRL_A_ATR1,
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7,
         ORL_C_BIT, ORL_C_NBIT,
         ANL_C_BIT, ANL_C_NBIT,
         SUBB_A_DATA, SUBB_A_D, SUBB_A_ATR0, SUBB_A_ATR1,
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7,
         SWAP_A,
         DA_A,
         CPL_A:
         begin
            fsm_op1 <= fsm_alu_result_i[7:0]; // ALU Result     
         end
//------------------------------------------------------------------------------
         LCALL, RETI, RET,
         INC_D, INC_ATR0, INC_ATR1,
         INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7,
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8,
         DEC_D, DEC_ATR0, DEC_ATR1,
         DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7,
         ORL_D_A, ORL_D_DATA,
         ANL_D_A, ANL_D_DATA,
         XRL_D_A, XRL_D_DATA,
         JBC, MOV_BIT_C, MOV_C_BIT,
         CPL_BIT, CPL_C, CLR_BIT, CLR_C,
         SETB_C,
         PUSH, POP,
         SETB_BIT:
         begin
            fsm_op_aux_1      <= fsm_alu_result_i[7:0]; // ALU Result     
         end
//------------------------------------------------------------------------------
         CJNE_A_DATA, CJNE_A_D, CJNE_ATR0_DATA, CJNE_ATR1_DATA,
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA,
         DJNZ_D:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op_aux_1   <= fsm_alu_result_i[7:0]; // ALU Result 
            end
            
            else
            begin
               fsm_op_aux_1   <= fsm_op_aux_1;
            end
         end
//------------------------------------------------------------------------------
         DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op1        <= fsm_alu_result_i[7:0]; // ALU Result 
            end
            
            else
            begin
               fsm_op1        <= fsm_op1;
            end
         end
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op_aux_1   <= fsm_alu_result_i[7:0]; // DPL temp
               fsm_op1        <= fsm_pc_i [15:8]; // save MSB
            end
            
            else
            begin
               fsm_op_aux_1   <= fsm_rom_data_i; // ROM data
            end
         end
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op1        <= fsm_alu_result_i[7:0]; // DPL temp
            end
            
            else
            begin
               fsm_op_aux_1   <= fsm_op_aux_1;
            end
         end         
//------------------------------------------------------------------------------
         INC_DPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op1        <= fsm_alu_result_i[7:0]; // DPL data
            end
            
            else
            begin
               fsm_op_aux_1   <= fsm_alu_result_i[7:0]; // DPH data
            end
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR, MOVX_ATDPTR_A:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op1        <= fsm_op1;
               fsm_op_aux_1   <= fsm_op_aux_1; 
            end
            
            else
            begin
               fsm_op1        <= fsm_op1;
               fsm_op_aux_1   <= fsm_op_aux_1;
            end
         end     
//------------------------------------------------------------------------------
         DIV_AB, MUL_AB:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op1        <= fsm_alu_result_i[15:8];
               fsm_op_aux_1   <= fsm_alu_result_i[7:0]; 
            end
            
            else
            begin
               fsm_op1        <= fsm_op1;
               fsm_op_aux_1   <= fsm_op_aux_1;
            end
         end
//------------------------------------------------------------------------------
         MOVC_A_ATPC:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op_aux_1   <= fsm_alu_result_i[7:0]; // MSB ALU result
            end
            
            else
            begin
               fsm_op_aux_1   <= fsm_alu_result_i[7:0]; // avoid latch
            end
         end         
//------------------------------------------------------------------------------
         // AJMPs, LJMP, INC_ATR0, MOV_ATRn_DATA, MOV_Rn_DATA, JNB, JC
         // JNC, CLR_A
         default: 
         begin

         end

      endcase
   end
endtask //end execution sequential task

task write_back_combinational_task; //##########################################
// Active on @fsm_state_o


`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v"  
   
   begin   
      case (fsm_opcode)
         
         MOV_A_DATA,
         RR_A, RRC_A, RL_A, RLC_A,
         DEC_A,
         INC_A,
         ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6,
         ADD_A_R7,
         ADD_A_DATA, ADD_A_D, ADD_A_ATR0, ADD_A_ATR1, ADDC_A_ATR0, ADDC_A_ATR1,
         ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5,
         ADDC_A_R6, ADDC_A_R7, ADDC_A_DATA, ADDC_A_D,
         ORL_A_D, ORL_A_DATA, ORL_A_ATR0, ORL_A_ATR1,
         ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6,
         ORL_A_R7,
         ANL_A_DATA, ANL_A_D, ANL_A_ATR0, ANL_A_ATR1,
         ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6,
         ANL_A_R7,
         XRL_A_DATA, XRL_A_D, XRL_A_ATR0, XRL_A_ATR1,
         XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6,
         XRL_A_R7,
         SUBB_A_DATA, SUBB_A_D, SUBB_A_ATR0, SUBB_A_ATR1,
         SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5,
         SUBB_A_R6, SUBB_A_R7,
         MOV_A_R0, MOV_A_R1, MOV_A_R2, MOV_A_R3, MOV_A_R4, MOV_A_R5, MOV_A_R6,
         MOV_A_R7,
         SWAP_A,
         DA_A,
         CPL_A: 
         begin
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = fsm_op1;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         CLR_A: 
         begin
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = 8'd0;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_DPTR_DATA:
         begin
            fsm_sfr_addr_o    = SFR_DPL;
            fsm_sfr_data_o    = fsm_op2;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_A_D, MOV_A_ATR0, MOV_A_ATR1:
         begin
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = fsm_op2;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_A_ATR0, MOVX_A_ATR1:
         begin
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = fsm_op2;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_ATR0_A, MOVX_ATR1_A:
         begin
            fsm_ram_addr_o    = fsm_op1;
            fsm_ram_data_o    = fsm_op_aux_1;
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, EN, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end     
//------------------------------------------------------------------------------
         CJNE_A_DATA, CJNE_A_D, CJNE_ATR0_DATA, CJNE_ATR1_DATA,
         CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA,
         CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               if (fsm_op_aux_1 [0] == 1'b0)
               begin
                  pcau_task        (EN, fsm_op2, DIS, 8'd0);
               end
               
               else
               begin
                  pcau_task        (DIS, 1'b0, DIS, 8'd0);
               end
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
            end
               
            else                       // 2nd machine cycle does nothing
            begin
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DJNZ_D:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               if (fsm_op_aux_1 != 8'd0)
               begin
                  pcau_task        (EN, fsm_op2, DIS, 8'd0);
               end
               
               else
               begin
                  pcau_task        (DIS, 1'b0, DIS, 8'd0);
               end
            end
               
            else                       // 2nd machine cycle does nothing
            begin
               if (fsm_op1 > 8'h7F) //SFR access
               begin
                  fsm_sfr_addr_o    = fsm_op1;
                  fsm_sfr_data_o    = fsm_op_aux_1;
                  wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               end 
               else                //RAM access
               begin
                  fsm_ram_addr_o    = fsm_op1;
                  fsm_ram_data_o    = fsm_op_aux_1;
                  wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
               end
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               if (fsm_op1 != 8'd0)
               begin
                  pcau_task        (EN, fsm_op_aux_1, DIS, 8'd0);
               end
               
               else
               begin
                  pcau_task        (DIS, 1'b0, DIS, 8'd0);
               end
            end
               
            else                       // 2nd machine cycle does nothing
            begin
               case(fsm_opcode)
               DJNZ_R0: reg_addr_task (REG_R0, fsm_ram_addr_o);
               DJNZ_R1: reg_addr_task (REG_R1, fsm_ram_addr_o);
               DJNZ_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               DJNZ_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               DJNZ_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               DJNZ_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               DJNZ_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               DJNZ_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase
               fsm_ram_data_o    = fsm_op1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         INC_D,
         DEC_D,
         ORL_D_A, ORL_D_DATA,
         ANL_D_A, ANL_D_DATA,
         XRL_D_A, XRL_D_DATA,
         XCH_A_D:
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op1;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         XCH_A_ATR0, XCH_A_ATR1:
         begin
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = fsm_op2; //Direct operand data
            fsm_ram_addr_o    = fsm_op1;
            fsm_ram_data_o    = fsm_op_aux_1;
            wr_rd_flags_task (ON, OFF, OFF, ON, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         XCHD_A_ATR0, XCHD_A_ATR1:
         begin
            fsm_ram_addr_o    = fsm_op1;
            fsm_ram_data_o    = {fsm_op2[7:4],fsm_op_aux_1[3:0]};
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end              
//------------------------------------------------------------------------------
         CPL_BIT, CLR_BIT, SETB_BIT: 
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op1;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BIT);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op_aux_1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BIT);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end        
//------------------------------------------------------------------------------
         MOV_D_A: 
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op1;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op_aux_1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_BIT_C: 
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op1;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BIT);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op_aux_1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BIT);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end             
//------------------------------------------------------------------------------
         MOV_D_DATA: 
         begin
            if (fsm_op1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op1;
               fsm_sfr_data_o    = fsm_op2;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op2;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_D_D: 
         begin
            if (fsm_op2 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op2;
               fsm_sfr_data_o    = fsm_op_aux_2;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op2;
               fsm_ram_data_o    = fsm_op_aux_2;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_D_ATR0, MOV_D_ATR1: 
         begin
            if (fsm_op_aux_1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op_aux_1;
               fsm_sfr_data_o    = fsm_op2;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op_aux_1;
               fsm_ram_data_o    = fsm_op2;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_D_R0, MOV_D_R1, MOV_D_R2, MOV_D_R3, MOV_D_R4, MOV_D_R5, MOV_D_R6,
         MOV_D_R7: 
         begin
            if (fsm_op_aux_1 > 8'h7F) //SFR access
            begin
               fsm_sfr_addr_o    = fsm_op_aux_1;
               fsm_sfr_data_o    = fsm_op1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end 
            else                //RAM access
            begin
               fsm_ram_addr_o    = fsm_op_aux_1;
               fsm_ram_data_o    = fsm_op1;
               // READ/WRITE    ROM| RAM| SFR| RAM| SFR
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end                 
//------------------------------------------------------------------------------
         INC_ATR0, INC_ATR1,
         DEC_ATR0, DEC_ATR1,
         MOV_ATR0_A, MOV_ATR1_A: 
         begin
            fsm_ram_addr_o    = fsm_op1;
            fsm_ram_data_o    = fsm_op_aux_1;
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_ATR0_DATA, MOV_ATR1_DATA,
         MOV_ATR0_D, MOV_ATR1_D: 
         begin
            fsm_ram_addr_o    = fsm_op1;
            fsm_ram_data_o    = fsm_op2;
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_R0_A, MOV_R1_A, MOV_R2_A, MOV_R3_A, MOV_R4_A, MOV_R5_A, MOV_R6_A,
         MOV_R7_A: 
         begin
            fsm_ram_data_o    = fsm_op1;
            case(fsm_opcode)
               MOV_R0_A: reg_addr_task (REG_R0, fsm_ram_addr_o);
               MOV_R1_A: reg_addr_task (REG_R1, fsm_ram_addr_o);
               MOV_R2_A: reg_addr_task (REG_R2, fsm_ram_addr_o);
               MOV_R3_A: reg_addr_task (REG_R3, fsm_ram_addr_o);
               MOV_R4_A: reg_addr_task (REG_R4, fsm_ram_addr_o);
               MOV_R5_A: reg_addr_task (REG_R5, fsm_ram_addr_o);
               MOV_R6_A: reg_addr_task (REG_R6, fsm_ram_addr_o);
               MOV_R7_A: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase      
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         XCH_A_R0, XCH_A_R1, XCH_A_R2, XCH_A_R3, XCH_A_R4, XCH_A_R5, XCH_A_R6,
         XCH_A_R7: 
         begin
            fsm_ram_data_o    = fsm_op_aux_1;
            fsm_sfr_addr_o    = SFR_A;
            fsm_sfr_data_o    = fsm_op1;
            case(fsm_opcode)
               XCH_A_R0: reg_addr_task (REG_R0, fsm_ram_addr_o);
               XCH_A_R1: reg_addr_task (REG_R1, fsm_ram_addr_o);
               XCH_A_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               XCH_A_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               XCH_A_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               XCH_A_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               XCH_A_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               XCH_A_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase      
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, ON, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7: 
         begin
            fsm_ram_data_o    = fsm_op_aux_1;
            case(fsm_opcode)
               INC_R0: reg_addr_task (REG_R0, fsm_ram_addr_o);
               INC_R1: reg_addr_task (REG_R1, fsm_ram_addr_o);
               INC_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               INC_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               INC_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               INC_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               INC_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               INC_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase      
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7: 
         begin
            fsm_ram_data_o    = fsm_op_aux_1;
            case(fsm_opcode)
               DEC_R0: reg_addr_task (REG_R0, fsm_ram_addr_o);
               DEC_R1: reg_addr_task (REG_R1, fsm_ram_addr_o);
               DEC_R2: reg_addr_task (REG_R2, fsm_ram_addr_o);
               DEC_R3: reg_addr_task (REG_R3, fsm_ram_addr_o);
               DEC_R4: reg_addr_task (REG_R4, fsm_ram_addr_o);
               DEC_R5: reg_addr_task (REG_R5, fsm_ram_addr_o);
               DEC_R6: reg_addr_task (REG_R6, fsm_ram_addr_o);
               DEC_R7: reg_addr_task (REG_R7, fsm_ram_addr_o);
            endcase      
            // READ/WRITE    ROM| RAM| SFR| RAM| SFR
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         JBC: 
         begin
            if (fsm_op_aux_2[fsm_op1[2:0]] == 1'b1)
             // if bit is set, it is cleared
            begin
               if (fsm_op1 > 8'h7F) //SFR access
               begin
                  fsm_sfr_addr_o             = fsm_op1;               
                  fsm_sfr_data_o             = fsm_op_aux_1;
                  wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BIT);
               end 
               else                //RAM access
               begin
                  fsm_ram_addr_o    = fsm_op1;
                  fsm_ram_data_o    = fsm_op_aux_1;
                  wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BIT);
               end
            end 
            else                    // if bit is not set
            begin
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
            end
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         ORL_C_BIT, ORL_C_NBIT,
         ANL_C_BIT, ANL_C_NBIT:
         begin
            fsm_sfr_addr_o  = SFR_PSW_CY;
            fsm_sfr_data_o  = {fsm_op1[0],fsm_op_aux_1[6:0]};
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BIT);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOV_C_BIT, CPL_C, CLR_C, SETB_C:
         begin
            fsm_sfr_addr_o  = SFR_PSW_CY;
            fsm_sfr_data_o  = fsm_op_aux_1;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BIT);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end          
//------------------------------------------------------------------------------
         MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D, 
         MOV_R4_D, MOV_R5_D, MOV_R6_D, MOV_R7_D,
         MOV_R0_DATA, MOV_R1_DATA, MOV_R2_DATA, MOV_R3_DATA, MOV_R4_DATA,
         MOV_R5_DATA, MOV_R6_DATA, MOV_R7_DATA:
         begin
            case (fsm_opcode)
               MOV_R0_D, MOV_R0_DATA: reg_addr_task (REG_R0, fsm_ram_addr_o);
               MOV_R1_D, MOV_R1_DATA: reg_addr_task (REG_R1, fsm_ram_addr_o);
               MOV_R2_D, MOV_R2_DATA: reg_addr_task (REG_R2, fsm_ram_addr_o);
               MOV_R3_D, MOV_R3_DATA: reg_addr_task (REG_R3, fsm_ram_addr_o);
               MOV_R4_D, MOV_R4_DATA: reg_addr_task (REG_R4, fsm_ram_addr_o);
               MOV_R5_D, MOV_R5_DATA: reg_addr_task (REG_R5, fsm_ram_addr_o);
               MOV_R6_D, MOV_R6_DATA: reg_addr_task (REG_R6, fsm_ram_addr_o);
               MOV_R7_D, MOV_R7_DATA: reg_addr_task (REG_R7, fsm_ram_addr_o);
               default:  reg_addr_task (REG_R0, fsm_ram_addr_o);
            endcase
            fsm_ram_data_o    = fsm_op2;
            wr_rd_flags_task (ON, OFF, OFF, ON, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         LCALL,
         ACALL_1, ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_ram_addr_o    = fsm_op_aux_1;
               fsm_ram_data_o    = fsm_pc_i[7:0];
               wr_rd_flags_task (OFF, OFF, OFF, ON, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_A_ATDPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_P2;
               fsm_sfr_data_o    = fsm_op2;
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_A;
               fsm_sfr_data_o    = fsm_op1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVX_ATDPTR_A:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_P2;
               fsm_sfr_data_o    = fsm_op2;
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_ram_addr_o    = fsm_op1;
               fsm_ram_data_o    = fsm_op_aux_2;
               wr_rd_flags_task (ON, OFF, OFF, ON, OFF, EN, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         PUSH:
         begin
            fsm_ram_addr_o    = fsm_op_aux_1;
            fsm_ram_data_o    = fsm_op2;
            fsm_sfr_addr_o    = SFR_SP;
            fsm_sfr_data_o    = fsm_op_aux_1;
            wr_rd_flags_task (ON, OFF, OFF, ON, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         POP:
         begin
            fsm_sfr_addr_o    = SFR_SP;
            fsm_sfr_data_o    = fsm_op_aux_1;
            wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o = SFR_DPH;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (EN, 8'b1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         INC_DPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_DPL;
               fsm_sfr_data_o    = fsm_op1;
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_DPH;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_DPH;
               wr_rd_flags_task (OFF, OFF, ON, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_A;
               fsm_sfr_data_o    = fsm_op_aux_1;
               pcau_task        (EN, 8'd1, DIS, 8'd0);
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end         
//------------------------------------------------------------------------------
         MUL_AB:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_A;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_B;
               fsm_sfr_data_o    = fsm_op1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         DIV_AB:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               fsm_sfr_addr_o    = SFR_A;
               fsm_sfr_data_o    = fsm_op1;
               wr_rd_flags_task (OFF, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_B;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end                
//------------------------------------------------------------------------------
         MOVC_A_ATPC:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_A;
               fsm_sfr_data_o    = fsm_op_aux_2;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         RETI, RET:
         begin
            if (cycle_continue == EN)  // 1st machine cycle
            begin
               wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
               pcau_task        (DIS, 1'b0, DIS, 8'd0);
            end
            
            else                      // 2nd machine cycle
            begin
               fsm_sfr_addr_o    = SFR_SP;
               fsm_sfr_data_o    = fsm_op_aux_1;
               wr_rd_flags_task (ON, OFF, OFF, OFF, ON, DIS, BYTE);
               pcau_task        (EN, 8'd1, DIS, 8'd0);
            end
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end
//------------------------------------------------------------------------------
         // SJMP, AJMPs, LJMP, JC, JNZ, JNC, JZ
         default: 
         begin
            wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
            pcau_task        (EN, 8'd1, DIS, 8'd0);
            alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
         end

      endcase
   end
endtask //end write back combinational task

task write_back_sequential_task; //#############################################
// Active on @posedge clock 
// regs: fsm_op2 / fsm_op_aux_2 

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin   
      interrupt_sequential_task; //verify interrupt and set fsm_opcode
        
      case (fsm_opcode)
         LCALL:
         begin
            // 2nd machine cycle and hardware interrupt
            if (cycle_continue == DIS && lcall_hardware_flag == EN &&
               fsm_int_vect_i == 3'd0)
            begin
               lcall_hardware_flag <= DIS;  // disassert hardware interrupt flag
            end
            fsm_int_rdy_o <= DIS;
         end
//------------------------------------------------------------------------------
        
         MOVC_A_ATDPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op_aux_2   <= fsm_sfr_data_i;  //DPH data
            end
            
            else // 2nd machine cycle
            begin
               fsm_op_aux_2   <= fsm_op_aux_2;
            end
            fsm_int_rdy_o <= DIS;   
         end
//------------------------------------------------------------------------------
         JMP_A_DPTR:
         begin
            if (cycle_continue == EN) // 1st machine cycle
            begin
               fsm_op_aux_2   <= fsm_sfr_data_i; // receiving current DPH data
            end
            
            else // 2nd machine cycle
            begin
               fsm_op_aux_2   <= fsm_op_aux_2;
            end
            fsm_int_rdy_o <= DIS;  
         end
//------------------------------------------------------------------------------
         RETI:
         begin
            if (cycle_continue == DIS) // 2nd machine cycle
               fsm_int_rdy_o <= EN;    // inform interrupt finished
         end
//------------------------------------------------------------------------------
         // AJMPs, LJMP, RR_A, RL_A, RLC_A, JBC, JB, INC_*, RET, ADD*, MOV*, JC
         // JNZ, JNC, JZ,
         default:
         begin
            fsm_int_rdy_o <= DIS;
         end

      endcase
   end
endtask //end write back sequential task


task reset_combinational_task; //###############################################
// Active on @fsm_state_o


`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin
      alu_task         (DIS, ALU_NONE, 8'd0, 8'd0);
      if (fsm_state_o[1:0] == 2'b00)
      begin
         pcau_task        (EN, 8'd1, DIS, 8'd0);
         wr_rd_flags_task (ON, OFF, OFF, OFF, OFF, DIS, BYTE);
      end
      
      else
      begin
         pcau_task        (DIS, 1'b0, DIS, 8'd0);
         wr_rd_flags_task (OFF, OFF, OFF, OFF, OFF, DIS, BYTE);
      end
      
   end
endtask //end reset combinational task


task reset_sequential_task; //##################################################
// Active on @posedge clock 

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin   
      fsm_opcode        <= fsm_rom_data_i;
      //fsm_op1           <= 8'h00;
      fsm_op2           <= 8'h00;
      fsm_op_aux_2      <= 8'h00;
      fsm_int_na_o      <= DIS;
      fsm_int_rdy_o     <= DIS;
      lcall_hardware_flag    <= DIS;
   end
endtask //end write back sequential task

task reg_addr_task; //##########################################################
   input  [2:0] reg_number; // select from R0 to R7;
   output [7:0] reg_addr;  
   
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin  
      case (fsm_psw_rs_i)
         BANK_0:  reg_addr = {5'b00000, reg_number} + 8'h00;
         BANK_1:  reg_addr = {5'b00000, reg_number} + 8'h08;
         BANK_2:  reg_addr = {5'b00000, reg_number} + 8'h10;
         BANK_3:  reg_addr = {5'b00000, reg_number} + 8'h18;    
      endcase
   end
endtask

task wr_rd_flags_task; //#######################################################
   input  rom_rd;
   input  ram_rd;
   input  sfr_rd;
   input  ram_wr;
   input  sfr_wr;
   input  ext_ram;
   input  bit_byte_flag;

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 

   begin   
      fsm_rom_rd_o_b      = rom_rd;
      fsm_ram_rd_o_b      = ram_rd;
      fsm_sfr_rd_o_b      = sfr_rd;
      fsm_ram_wr_o_b      = ram_wr;
      fsm_sfr_wr_o_b      = sfr_wr;
      fsm_ext_ram_o       = ext_ram;
      fsm_bit_byte_flag_o = bit_byte_flag;
       
      
      if (sfr_rd == OFF && sfr_wr == OFF)
         fsm_sfr_addr_o       = 8'h00;
      if (ram_rd == OFF && ram_wr == OFF)
         fsm_ram_addr_o       = 8'h00;
      if (sfr_wr == OFF)
         fsm_sfr_data_o       = 8'h00;
      if (ram_wr == OFF)
         fsm_ram_data_o       = 8'h00;        
         
         
   
   end
   
endtask        

task pcau_task; //##############################################################
   input  pcau_en;
   input  [7:0] pcau_offset;
   input  pcau_direct;
   input  [7:0] pcau_msb;

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v"
      
   begin 
      fsm_pcau_en_o     = pcau_en;
      fsm_pcau_offset_o = pcau_offset;
      fsm_pcau_direct_o = pcau_direct;
      fsm_pcau_msb_o    = pcau_msb;
        
   end
   
endtask          


task alu_task; //##############################################################

   input        alu_en;
   input  [4:0] alu_opcode;
   input  [7:0] alu_op1;
   input  [7:0] alu_op2;

`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v"    

   begin 
      fsm_alu_en_o        = alu_en;
      
      if (alu_en == DIS)
      begin
         fsm_alu_op1_o     = 8'd0;
         fsm_alu_op2_o     = 8'd0;
         fsm_alu_opcode_o  = ALU_NONE;
      end
      
      else
      begin
         fsm_alu_op1_o       = alu_op1;
         fsm_alu_op2_o       = alu_op2;
         fsm_alu_opcode_o    = alu_opcode;
      end
        
   end
   
endtask

function [7:0] bit_mask_task; //################################################
   input  [2:0] index;
   input  op_bit;
   
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v"

   begin
      if (op_bit)
      begin
         bit_mask_task    = 8'b00000000;
      end
      
      else
      begin 
         bit_mask_task    = 8'b11111111;
      end
      bit_mask_task [index] = op_bit;
   end

   
endfunction

task interrupt_sequential_task; //##############################################
// regs: fsm_op2 / fsm_op_aux_2
 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/core_fsm_defines.v" 
`include "/home/student/EMC08/digital_A/core/design/rtl_v/inst_set_define.v" 
   
   begin   
      // if there is no interrupt 
      
         if (fsm_int_vect_i == INT_NONE)  
         begin
            fsm_int_na_o  <= DIS;
            if (cycle_continue == DIS)  // 2nd machine cycle
            begin
               fsm_opcode <= fsm_rom_data_i;
            end
         end 
         
         // else, there is an interrupt
         else
         begin
            // IF INTERRUPT IS NOT APPLICABLE
            // if the current cycle is not the final cycle of instruction or 
            // if the instruction in progess is RETI or
            // if the instruction in progress is any write to the IE or IP regs.
            if (
                  (cycle_continue == EN)   || // 1st machine cycle
                  (fsm_opcode == RETI)     || 
                  (
                     (fsm_sfr_wr_o_b == ON)   &&
                        (
                        ( 
                           (fsm_bit_byte_flag_o == BYTE) &&
                              (
                                 (fsm_sfr_addr_o == SFR_IP) || 
                                 (fsm_sfr_addr_o == SFR_IE)
                              ) 
                           ) ||
                           (
                           (fsm_bit_byte_flag_o == BIT)  &&
                              (
                                 (   
                                    (fsm_sfr_addr_o <= SFR_IP_6) && 
                                    (fsm_sfr_addr_o >= SFR_IP_0)
                                 ) ||
                                 (   
                                    (fsm_sfr_addr_o <= SFR_IE_7) && 
                                    (fsm_sfr_addr_o >= SFR_IE_0)
                                 )
                              ) 
                           )
                        )                        
                  )
               )
            begin
               fsm_int_na_o <= EN;            // int not applicable flag enabled
               if (cycle_continue == DIS)     // 2nd machine cycle
               begin
                  fsm_opcode   <= fsm_rom_data_i;
               end
            end 
            
            // ELSE, INTERRUPT IS APPLICABLE
            else
            begin
               fsm_int_na_o   <= DIS;
               fsm_opcode     <= LCALL;
               lcall_hardware_flag <= EN;
               
               case (fsm_int_vect_i)
                  INT_IE0:   fsm_op2 <= 8'h03;
                  INT_TF0:   fsm_op2 <= 8'h0B;
                  INT_IE1:   fsm_op2 <= 8'h13;
                  INT_TF1:   fsm_op2 <= 8'h1B;
                  INT_TF2:   fsm_op2 <= 8'h23;
                  INT_RI_TI: fsm_op2 <= 8'h2B;
                  INT_TXRX:  fsm_op2 <= 8'h33;
               endcase
   
            end
         end
   end
endtask
