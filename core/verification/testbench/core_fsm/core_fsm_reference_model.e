<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_fsm_reference_model.e
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
// Keywords: core_fsm - core finite state machine
// -----------------------------------------------------------------------------
// Purpose: checker to the CORE_FSM. This model reproduce the
// behaviour in the specification. According to this reference model the DUT 
// will be verified.
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: reference_model()
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

extend core_fsm_mon_u {
   ////////////////////////  features control ///////////////
   feature: feature_kind_t;

   ///////////////////////// EVENTS /////////////////////////
   // events to control the reset state
   event core_fsm_reset_rise is rise(p_reset$)@sim;
   event core_fsm_reset_fall is fall(p_reset$)@sim;

   event interrupt_change is (rise(p_int_vect_i_0$)@sim or rise(p_int_vect_i_1$)@sim or rise(p_int_vect_i_2$)@sim);

   state: fsm_state_t;

   !aux_rand: int;
   keep aux_rand in [1..7];

   reference_model() @clock_e is also {
      out ("Starting Reference Model");

      var verbose: int = 0; //turn on prints
      
      case feature {
         feature1: {
                   out ("Feature1 verification");

                     while TRUE {
                        wait @core_fsm_reset_rise;
                        wait delay (25);
                        gen aux_rand;
                        //out ("aux rand ",aux_rand );
   
                        for i from 1 to aux_rand {
                           state = p_state$.as_a(fsm_state_t);
                           out ("p_state " , p_state$);
                           emit couver_state_change;
                           emit couverSTATE;
                           wait delay (25);
                        };
                     }; //end while

                   }; //end feature 1

         feature2: {

                       var pc:uint(bits:16) = 16'd0; 
                       var opcode: uint(bits:8);
                       var opcode_previus: instruction_set_t; //some inst. need to know the pervius opcode to check.

                       out ("Feature2 verification");

                       var delay_to_get_opcode: int = 12;
                       var delay_end: int = 13;
                       var delay_between_semi_cycles: int = 25; //one semi-cycle
                       var delay_two_semi_cycles: int = 50;
                       var delay_three_semi_cycles: int = 75;
                       opcode_previus = NOP; // consider the previous opcode as NOP

                       wait @core_fsm_reset_rise;
                       //wait delay (50); //the first event after the reset

                       wait delay (25); // new sync due changes in core

                       //first case - get a opcode. After it nedd to get the opcode in Wb state
                       wait delay (delay_to_get_opcode); 
                       opcode = p_rom_data_i$;
                       wait delay (delay_between_semi_cycles); 

                       /////////////////// INTRUCTIONS CHECKERS ///////////                                              
                       while TRUE {
                         case opcode.as_a(instruction_set_t) {
                             NOP:         {  
                                             if (verbose == 1) { out ("Verifing NOP instruction"); };
                                             pc = pc + 16'd1; //increment the pc
                                             check_sfr_addr_o (8'h00);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'd0);
                                             check_alu_en_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_rise ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };
                                             wait delay (delay_between_semi_cycles); // 2nd semi cycle
                                             wait delay (delay_between_semi_cycles); // 3rd semi cycle
                                             check_sfr_addr_o (8'h00);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'd0);
                                             check_alu_en_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_rise ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_between_semi_cycles); // 4th semi cycle
                                             check_sfr_addr_o (8'h00);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'd0);
                                             check_alu_en_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$;  // get the next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };
                                            
                             [AJMP_1, AJMP_2, AJMP_3, AJMP_4, AJMP_5, AJMP_6, AJMP_7, AJMP_8]:        {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing AJMP_Rn instruction type (op) ", opcode); };
                                             //if (verbose == 1) { out ("verifing AJMP_1 instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             wait delay (delay_three_semi_cycles); // 4th semi cycle
                                             pc = pc + 16'd2;                                             
                                             var temp: uint(bits:16) = %{pc[15:11],opcode[7:5], data_byte1};
                                             pc = temp; // jump the pc
                                             check_sfr_addr_o (8'h00);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise (); 
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                            
                             LJMP:           {
                                             if (verbose == 1) { out ("verifing LJMP instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             wait delay (delay_between_semi_cycles); //third semi-cycle
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             wait delay (delay_two_semi_cycles); //check memory with the last pc
                                             var temp1: uint(bits:8) = pc[7:0];
                                             check_sfr_addr_o (8'h00);
                                             var temp: uint(bits:16) = %{data_byte1,data_byte2};
                                             pc = temp; //upadte pc
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00); 
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             RR_A:          {
                                             if (verbose == 1) { out ("verifing RR_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_sfr_data_i$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;
                                             var aux1: bit = data_byte1[0:0];
                                             data_byte1 = data_byte1 >> 1'b1;
                                             data_byte1[7:7] = aux1;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_sfr);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h0E);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             pc = pc + 16'd1; //increment the pc
                                             check_sfr_addr_o (8'hE0);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (data_byte1);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                           };               
                                           
                               INC_A:         {
                                             if (verbose == 1) { out ("verifing INC_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var sfr_data: uint (bits:8) = p_sfr_data_i$;
                                             
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 1'b1; // jump the pc
                                             check_sfr_addr_o (8'hE0);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (sfr_data + 1'b1);
                                             check_ram_data_o (8'h0);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            }; 
                                            
                              INC_D:         {
                                             if (verbose == 1) { out ("verifing INC_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_ram_data_i$;
                                             var data_byte3: uint(bits:8) = p_sfr_data_i$; 
                                             wait delay (delay_between_semi_cycles);
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;   
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;                                          
                                             wait delay (delay_two_semi_cycles);
                                             pc = pc + 2; // jump the pc
                                             
                                             case data_byte2 {
                                                [8'h80..8'hFF]:  {
                                                                 check_sfr_data_o (data_sfr + 1);
                                                                 check_sfr_addr_o (data_byte2);
                                                                 check_sfr_wr_o_fall ();
                                                                 check_ram_data_o (8'h00);
                                                                 check_ram_addr_o (8'h00);
                                                                 check_ram_wr_o_rise (); 
                                                                 };
                                                [8'h00..8'h7F]:  {
                                                                 check_ram_data_o (data_byte1 + 1'b1);
                                                                 check_ram_addr_o (data_byte2);
                                                                 check_ram_wr_o_fall ();
                                                                 check_sfr_data_o (8'h00);
                                                                 check_sfr_addr_o (8'h00);
                                                                 check_sfr_wr_o_rise ();
                                                                 };
                                             };
                                             
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };               
                                            
                             INC_ATR0:       {
                                             if (verbose == 1) { out ("verifing INC_ATR0 instruction"); };
                                             var data_byte1: uint(bits:8) = p_ram_data_i$;
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             var data_byte3: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 1; // jump the pc
                                             check_ram_data_o (data_byte1 + 1'b1);
                                             check_ram_addr_o (data_byte1);
                                             check_ram_wr_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };               
                                            
                             INC_ATR1:       {
                                             if (verbose == 1) { out ("verifing INC_ATR1 instruction"); };
                                             var data_byte1: uint(bits:8) = p_ram_data_i$;
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 1; // jump the pc
                                             check_ram_data_o (data_byte1 + 1'b1);
                                             check_ram_addr_o (data_byte1);
                                             check_ram_wr_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };                              
                                            
                             [INC_R0, INC_R1, INC_R2, INC_R3, INC_R4, INC_R5, INC_R6, INC_R7]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing INC_Rn instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_ram_data_i$;
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             var psw: uint(bits:2) = p_psw_i$;
                                             wait delay (delay_three_semi_cycles);
                                             case opcode {
                                                 8'h08: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                                    2'b01:{check_ram_addr_o (8'd8);};
                                                                    2'b10:{check_ram_addr_o (8'd16);};
                                                                    2'b11:{check_ram_addr_o (8'd24);}; }; };
                                                8'h09: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                                    2'b01:{check_ram_addr_o (8'd9);};
                                                                    2'b10:{check_ram_addr_o (8'd17);};
                                                                    2'b11:{check_ram_addr_o (8'd25);}; }; };
                                                8'h0A: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                                    2'b01:{check_ram_addr_o (8'd10);};
                                                                    2'b10:{check_ram_addr_o (8'd18);};
                                                                    2'b11:{check_ram_addr_o (8'd26);}; }; };
                                                8'h0B: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                                    2'b01:{check_ram_addr_o (8'd11);};
                                                                    2'b10:{check_ram_addr_o (8'd19);};
                                                                    2'b11:{check_ram_addr_o (8'd27);}; }; };
                                                8'h0C: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                                    2'b01:{check_ram_addr_o (8'd12);};
                                                                    2'b10:{check_ram_addr_o (8'd20);};
                                                                    2'b11:{check_ram_addr_o (8'd28);}; }; };
                                                8'h0D: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                                    2'b01:{check_ram_addr_o (8'd13);};
                                                                    2'b10:{check_ram_addr_o (8'd21);};
                                                                    2'b11:{check_ram_addr_o (8'd29);}; }; };
                                                8'h0E: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                                    2'b01:{check_ram_addr_o (8'd14);};
                                                                    2'b10:{check_ram_addr_o (8'd22);};
                                                                    2'b11:{check_ram_addr_o (8'd30);}; }; };
                                                8'h0F: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                                    2'b01:{check_ram_addr_o (8'd15);};
                                                                    2'b10:{check_ram_addr_o (8'd23);};
                                                                    2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                                             };
                                             
                                             pc = pc + 1; // jump the pc
                                             check_ram_data_o (data_byte1 + 1'b1);
                                             check_ram_wr_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };               
                                            
                             JBC:            {
                                             if (verbose == 1) { out ("verifing JBC instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var ram_addr: uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             var sfr_addr: uint(bits:8) = p_sfr_data_i$;
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             pc = pc + 16'd3; //increment the pc
                                             check_byte_flag_o_rise (); //bit operation
                                             wait delay (delay_two_semi_cycles);
                                             var en: bit;
                                             var last: uint (bits:3);
                                             var addr_check : uint (bits:8);
                                             
                                             case data_byte1 {
                                                [8'h80..8'hFF]:  { //if (verbose == 1) { out ("sfr range");
                                                                   last = data_byte1[2:0].as_a(int);
                                                                   //if (verbose == 1) { out ("last ", last);
                                                                   en = sfr_addr[last:last];
                                                                   //if (verbose == 1) { out ("EN ", en);
                                                                   if (en == 1) { 
                                                                                  var temp:uint(bits:8)=by_two_complement(data_byte2);
                                                                                  if (data_byte2[7:7]==1'b1){pc = pc - temp;} else
                                                                                  {pc = pc + data_byte2;};
                                                                                  //if (verbose == 1) { out ("PC ", pc);
                                                                                  if (last == 7){
                                                                                     addr_check = %{1'b0,sfr_addr[6:0]};
                                                                                } else if (last == 0) {
                                                                                     addr_check = %{sfr_addr[7:1],1'b0}; 
                                                                                } else {
                                                                                     addr_check = %{sfr_addr[7:(last+1)],1'b0,sfr_addr[(last-1):0]}; 
                                                                                };
                                                                                check_sfr_data_o (addr_check);
                                                                                check_sfr_addr_o (data_byte1);
                                                                                check_sfr_wr_o_fall ();
                                                                                check_ram_wr_o_rise ();
                                                                                check_ram_addr_o (8'h00);
                                                                                check_byte_flag_o_rise ();   
                                                                                }  };
                                                [8'h00..8'h7F]:  { //if (verbose == 1) { out ("ram range");
                                                                   last = data_byte1[2:0].as_a(int);
                                                                   en = ram_addr[last:last];
                                                                   if (en == 1) { var temp:uint(bits:8)=by_two_complement(data_byte2);
                                                                                  if (data_byte2[7:7]==1'b1){pc = pc - temp;} else
                                                                                  {pc = pc + data_byte2;};
                                                                                  //if (verbose == 1) { out ("PC ", pc);
                                                                                  if (last == 7){
                                                                                     addr_check = %{1'b0,ram_addr[6:0]};
                                                                                } else if (last == 0) {
                                                                                     addr_check = %{ram_addr[7:1],1'b0}; 
                                                                                } else {
                                                                                     addr_check = %{ram_addr[7:(last+1)],1'b0,ram_addr[(last-1):0]}; 
                                                                                };
                                                                                check_ram_data_o (addr_check);
                                                                                check_ram_wr_o_fall (); 
                                                                                check_ram_addr_o (data_byte1);
                                                                                check_sfr_wr_o_rise (); 
                                                                                check_byte_flag_o_rise ();
                                                                    }; };
                                                                 };
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };
                                            
                             [ACALL_1,ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8]:      {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ACALL instruction type (op) ", opcode); };
                                             check_sfr_addr_o (8'h81); //SP sfr addr
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var sfr_data: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             pc = pc + 16'd2; //increment the pc
                                             wait delay (delay_two_semi_cycles);
                                             var temp1: uint(bits:8) = pc[7:0];
                                             check_ram_data_o (pc);
                                             check_ram_wr_o_fall (); //active
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();} //need to be en in the first CM
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_three_semi_cycles);
                                             
                                             check_sfr_addr_o (8'h81);
                                             var temp: uint(bits:16) = %{pc[15:11],opcode[7:5], data_byte1};
                                             check_rom_addr_o (temp);
                                             check_ram_addr_o (sfr_data+2'b10); //sp + 2
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (sfr_data+2'b10);
                                             check_ram_data_o (pc[15:8].as_a(uint(bits:8)));
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //nedd to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_fall (); //active
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             check_int_rdy_o_fall ();
                                             pc = temp; //upadte pc
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };               
                                            
                             LCALL:         {
                                             if (verbose == 1) { out ("verifing LCALl instruction"); };
                                             check_sfr_addr_o (8'h81); //SP sfr addr
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var sfr_data: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             pc = pc + 16'd3; //increment the pc
                                             wait delay (delay_two_semi_cycles);
                                             var temp1: uint(bits:8) = pc[7:0];
                                             check_ram_data_o (pc);
                                             check_ram_wr_o_fall (); //active
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();} //need to active in the first CM
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_three_semi_cycles);
                                             
                                             check_sfr_addr_o (8'h81);
                                             var temp: uint(bits:16) = %{data_byte1,data_byte2};
                                             check_rom_addr_o (temp);
                                             check_ram_addr_o (sfr_data+2'b10); //sp + 2
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (sfr_data+2'b10);
                                             check_ram_data_o (pc[15:8].as_a(uint(bits:8)));
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_fall (); //active
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             check_int_rdy_o_fall();
                                             pc = temp; //upadte pc
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };
                                            
                             RRC_A:          {
                                             if (verbose == 1) { out ("Verifing RRC_A instruction"); };
                                             // 1st semi cycle - decode 1
                                             var ref_core_fsm_data_byte1 : uint(bits:8);
                                             var ref_core_fsm_cy         : bit;
               
                                             ref_core_fsm_data_byte1      = p_sfr_data_i$;
                                             ref_core_fsm_cy              = ref_core_fsm_data_byte1[0:0];
                                             ref_core_fsm_data_byte1      = ref_core_fsm_data_byte1 >> 1'b1;
                                             ref_core_fsm_data_byte1[7:7] = core_alu_cy_i_p$;
                                             var sfr_data: uint(bits:8)      = p_sfr_data_i$;
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 2nd semi cycle - decode 2
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 3rd semi cycle - execute
                                             check_alu_op1_o (sfr_data);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h0F);
                                             check_alu_en_o_rise (); // need to be enable
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 4th semi cycle - writeback
                                             pc = pc + 16'd1; // increment the pc
                                             //check_psw_reg (%{ref_core_fsm_cy, p_psw_i$[6:0]});
                                             check_sfr_addr_o (8'hE0);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); // need to be en
                                             check_sfr_data_o (ref_core_fsm_data_byte1);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); // need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); // need to be en
                                             check_int_na_o_fall ();
               
                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };
               
                                             opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                             opcode         = p_rom_data_i$; //get next opcode
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles); // go to next instruction
                                             };               
                                            
                             DEC_A:          {
                                             if (verbose == 1) { out ("verifing DEC_A instruction"); };
                                             var acc_data: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 16'd1; //increment the pc
                                             check_sfr_addr_o (8'hE0); // acumulator address
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (acc_data - 1);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                           DEC_D:          {
                                             if (verbose == 1) { out ("verifing DEC_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;
                                             var data_ram: uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             var data1_sfr: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_ram - 1 );
                                                         check_ram_wr_o_fall (); 
                                                         check_ram_addr_o (data_byte1);
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data1_sfr - 1);
                                                         check_sfr_addr_o (data_byte1);
                                                         check_sfr_wr_o_fall ();
                                                   };
                                                };
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             [DEC_ATR0, DEC_ATR1]:       {
                                             if (verbose == 1) { outf ("%s %#04x:\n", "verifing DEC_ATRn instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var psw: uint(bits:8) = p_psw_i$;
                                             var data_ram: uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_data_o (8'h00);
                                             check_sfr_wr_o_rise();
                                             check_ram_addr_o(data_ram);
                                             check_ram_data_o(data_ram - 1);
                                             check_ram_wr_o_fall(); //need to be en
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             [DEC_R0, DEC_R1, DEC_R2, DEC_R3, DEC_R4, DEC_R5, DEC_R6, DEC_R7]:         {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing DEC_Rn instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_ram_data_i$;
                                             var psw: uint(bits:2) = p_psw_i$;
                                             wait delay (delay_three_semi_cycles);
                                             case opcode {
                                                 8'h18: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                                    2'b01:{check_ram_addr_o (8'd8);};
                                                                    2'b10:{check_ram_addr_o (8'd16);};
                                                                    2'b11:{check_ram_addr_o (8'd24);}; }; };
                                                8'h19: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                                    2'b01:{check_ram_addr_o (8'd9);};
                                                                    2'b10:{check_ram_addr_o (8'd17);};
                                                                    2'b11:{check_ram_addr_o (8'd25);}; }; };
                                                8'h1A: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                                    2'b01:{check_ram_addr_o (8'd10);};
                                                                    2'b10:{check_ram_addr_o (8'd18);};
                                                                    2'b11:{check_ram_addr_o (8'd26);}; }; };
                                                8'h1B: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                                    2'b01:{check_ram_addr_o (8'd11);};
                                                                    2'b10:{check_ram_addr_o (8'd19);};
                                                                    2'b11:{check_ram_addr_o (8'd27);}; }; };
                                                8'h1C: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                                    2'b01:{check_ram_addr_o (8'd12);};
                                                                    2'b10:{check_ram_addr_o (8'd20);};
                                                                    2'b11:{check_ram_addr_o (8'd28);}; }; };
                                                8'h1D: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                                    2'b01:{check_ram_addr_o (8'd13);};
                                                                    2'b10:{check_ram_addr_o (8'd21);};
                                                                    2'b11:{check_ram_addr_o (8'd29);}; }; };
                                                8'h1E: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                                    2'b01:{check_ram_addr_o (8'd14);};
                                                                    2'b10:{check_ram_addr_o (8'd22);};
                                                                    2'b11:{check_ram_addr_o (8'd30);}; }; };
                                                8'h1F: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                                    2'b01:{check_ram_addr_o (8'd15);};
                                                                    2'b10:{check_ram_addr_o (8'd23);};
                                                                    2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                                             };
                                             
                                             pc = pc + 1; // jump the pc
                                             check_ram_data_o (data_byte1 - 1'b1);
                                             check_ram_wr_o_fall (); //need to be en
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                 
                                             };
                                             
                             JB:             {
                                                if (verbose == 1) { out ("verifing JB instruction"); };
                                                var data_byte1: uint(bits:8) = p_rom_data_i$;
                                                var ram_addr: uint(bits:8) = p_ram_data_i$;
                                                wait delay (delay_between_semi_cycles);
                                                var sfr_addr: uint(bits:8) = p_sfr_data_i$;
                                                var data_byte2: uint(bits:8) = p_rom_data_i$;
                                                pc = pc + 16'd3; //increment the pc
                                                check_byte_flag_o_rise (); //bit operation
                                                wait delay (delay_two_semi_cycles);
                                                var en: bit;
                                                var last: uint (bits:3);
                                                var addr_check : uint (bits:8);
                                                case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                      last = data_byte1[2:0].as_a(int);
                                                      en   = ram_addr[last:last];
                                                      if (en == 1) {
                                                         var temp : uint (bits:8) = by_two_complement(data_byte2);
                                                         if (data_byte2[7:7] == 1'b1) { pc = pc - temp; }
                                                         else                         { pc = pc + data_byte2; };
                                                         check_ram_data_o (8'h00);
                                                         check_ram_wr_o_rise (); 
                                                         check_ram_addr_o (8'h00);
                                                         check_sfr_wr_o_rise (); 
                                                         check_byte_flag_o_fall ();
                                                      };
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                      last = data_byte1[2:0].as_a(int);
                                                      // if (verbose == 1) { out ("last ", last);
                                                      en = sfr_addr[last:last];
                                                      // if (verbose == 1) { out ("EN ", en);
                                                      if (en == 1) { 
                                                         var temp : uint (bits:8) = by_two_complement(data_byte2);
                                                         if (data_byte2[7:7]==1'b1) { pc = pc - temp; }
                                                         else                       { pc = pc + data_byte2; };
                                                         check_sfr_data_o (8'h00);
                                                         check_sfr_addr_o (8'h00);
                                                         check_sfr_wr_o_rise ();
                                                         check_ram_wr_o_rise ();
                                                         check_ram_addr_o (8'h00);
                                                         check_byte_flag_o_fall ();   
                                                      }
                                                   };
                                                };
                  
                                                check_rom_addr_o (pc);
                                                check_alu_op1_o (8'h00);
                                                check_alu_op2_o (8'h00);
                                                check_alu_opcode_o (5'h00);
                                                check_alu_en_o_fall (); 
                                                check_ext_ram_o_fall ();
                                                check_rom_rd_o_fall (); //need to be en
                                                check_ram_rd_o_rise ();
                                                check_sfr_rd_o_rise ();
                                                check_int_na_o_fall ();
                                                // --------------------------------------------
                                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                                else                        { check_int_rdy_o_fall (); };
                  
                                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                                opcode         = p_rom_data_i$; //get next opcode
                  
                                                wait delay (delay_between_semi_cycles); // go to next instruction
                                                // --------------------------------------------
                                             };
                                            
                             RET:            {
                                             if (verbose == 1) { out ("verifing RET instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sp: uint(bits:8) = p_ram_data_i$;
                                             var sfr_data: uint(bits:8) = p_sfr_data_i$;
                                             check_sfr_addr_o(8'h81); //sp addr
                                             check_sfr_rd_o_fall(); //flag to rd of fsr
                                             wait delay (delay_three_semi_cycles);
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_between_semi_cycles); 
                                             var data_sp2: uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (sfr_data-1); //after one sp-1
                                             check_alu_op2_o (8'd1);
                                             check_alu_opcode_o (5'd5);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles); 
                                             pc = pc + 16'd2; //increment the pc
                                             pc = %{data_sp, data_sp2}; //update to the new pc
                                             check_sfr_addr_o(8'h81); //sp addr
                                             check_rom_addr_o (%{data_sp, data_sp2});
                                             check_ram_addr_o (8'h00);
                                             check_sfr_data_o (sfr_data - 2);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall ();
                                             check_int_na_o_fall ();
                                             check_int_rdy_o_fall ();
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };
                             
                             RL_A:           {
                                             if (verbose == 1) { out ("verifing RL_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_sfr_data_i$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;
                                             var aux1: bit = data_byte1[7:7];
                                             data_byte1 = data_byte1 << 1'b1;
                                             data_byte1[0:0] = aux1;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_sfr);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h0C);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             pc = pc + 16'd1; //increment the pc
                                             check_sfr_addr_o (8'hE0);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (data_byte1);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst                        
                                             };                
                                             
                             ADD_A_DATA:    {
                                             if (verbose == 1) { out ("verifing ADD_A_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             check_sfr_addr_o (8'h00);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (data_byte1 );
                                             check_alu_op2_o (data_sfr);
                                             check_alu_opcode_o (5'd1);
                                             check_alu_en_o_rise (); //need to be en
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             wait delay (delay_between_semi_cycles);
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };
                                            
                             ADD_A_D:        {
                                             if (verbose == 1) { out ("verifing ADD_A_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var sfr_data: uint(bits:8) = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (sfr_data );
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'd1);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_sfr_data_o (operand + sfr_data);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                            
                             [ADD_A_ATR0,ADD_A_ATR1]:     {
                                             if (verbose == 1) { outf ("%s %#04x:\n", "verifing ADD_A_ATRn instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_ram: uint(bits:8) = p_ram_data_i$;
                                             var data_acc: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_data_o (data_ram + data_acc);
                                             check_sfr_wr_o_fall(); //need to be en
                                             check_ram_addr_o(8'h00);
                                             check_ram_data_o(8'h00);
                                             check_ram_wr_o_rise(); //need to be en
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             [ADD_A_R0, ADD_A_R1, ADD_A_R2, ADD_A_R3, ADD_A_R4, ADD_A_R5, ADD_A_R6, ADD_A_R7]  :       {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ADD_A_Rn instruction type (op) ", opcode); };
                                             var psw: uint(bits:2) = p_psw_i$;
                                             var data_acc:  uint(bits:8) = p_sfr_data_i$;
                                             var data_ram:  uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 1; // jump the pc
                                             check_ram_data_o (8'h00);
                                             check_ram_wr_o_rise (); 
                                             check_sfr_data_o (data_acc + data_ram);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_wr_o_fall(); //need to be en
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                                };                
                                             
                             JNB:            {
                                             if (verbose == 1) { out ("verifing JNB instruction"); };
                                             var data_byte1 : uint(bits:8) = p_rom_data_i$;
                                             var ram_addr   : uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             var sfr_addr   : uint(bits:8) = p_sfr_data_i$;
                                             var data_byte2 : uint(bits:8) = p_rom_data_i$;
                                             pc = pc + 16'd3; //increment the pc
                                             check_byte_flag_o_rise (); //bit operation

                                             wait delay (delay_two_semi_cycles);
                                             var en         : bit;
                                             var last       : uint (bits:3);
                                             var addr_check : uint (bits:8);
                                             
                                             case data_byte1 {
                                                [8'h80..8'hFF]: {
                                                   last = data_byte1[2:0].as_a(int);
                                                   en = sfr_addr[last:last];
                                                   if (en == 0) { 
                                                      var temp:uint(bits:8) = by_two_complement(data_byte2);
                                                      if (data_byte2[7:7]==1'b1) { pc = pc - temp; }
                                                      else                       { pc = pc + data_byte2; };
                                                   };
                                                };
                                                [8'h00..8'h7F]: {
                                                   // if (verbose == 1) { out ("ram range");
                                                   last = data_byte1[2:0].as_a(int);
                                                   en = ram_addr[last:last];
                                                   if (en == 0) {
                                                      var temp: uint(bits:8) = by_two_complement(data_byte2);
                                                      if (data_byte2[7:7]==1'b1) { pc = pc - temp; }
                                                      else                       { pc = pc + data_byte2; };
                                                   };
                                                };
                                             };
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_ram_wr_o_rise ();
                                             check_ram_addr_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_sfr_wr_o_rise (); 
                                             check_byte_flag_o_fall ();
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();

                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };

                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode         = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                          };
                             //ACALL_2: with the ACALL_1 inst                
                                          
                             RETI:           {
                                             if (verbose == 1) { out ("verifing RETI instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sp: uint(bits:8) = p_ram_data_i$;
                                             var sfr_data: uint(bits:8) = p_sfr_data_i$;
                                             check_sfr_addr_o(8'h81); //sp addr
                                             check_sfr_rd_o_fall(); //flag to rd of fsr
                                             wait delay (delay_between_semi_cycles); 
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();} //need to be en in the first Cm
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_three_semi_cycles);
                                             var data_sp2: uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (sfr_data-1); //after one sp-1
                                             check_alu_op2_o (8'd1);
                                             check_alu_opcode_o (5'd5);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles); 
                                             pc = pc + 16'd2; //increment the pc
                                             pc = %{data_sp, data_sp2}; //update to the new pc
                                             check_sfr_addr_o(8'h81); //sp addr
                                             check_rom_addr_o (%{data_sp, data_sp2});
                                             check_ram_addr_o (8'h00);
                                             check_sfr_data_o (sfr_data - 2);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();} //need to be en
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             check_int_rdy_o_rise(); // need to be en in the next inst.
                                             };               
                                             
                             RLC_A:          {
                                             if (verbose == 1) { out ("verifing RLC_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_sfr_data_i$;
                                             var core_cy: bit             = core_alu_cy_i_p$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;                                             
                                             data_byte1 = data_byte1 << 1'b1;
                                             data_byte1[0:0] = core_cy;
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_between_semi_cycles);
                                             check_alu_op1_o (data_sfr);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h0D);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             pc = pc + 16'd1; //increment the pc
                                             check_sfr_addr_o (8'hE0);
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (data_byte1);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst   
                                             };                   
                                            
                             ADDC_A_DATA:    {
                                             if (verbose == 1) { out ("verifing ADDC_A_DATA instruction"); };
                                             var data_acc:  uint(bits:8) = p_sfr_data_i$;
                                             var data_byte1:  uint(bits:8) = p_rom_data_i$;
                                             var core_cy: bit             = core_alu_cy_i_p$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 2; // jump the pc
                                             check_ram_data_o (8'h00);
                                             check_ram_wr_o_rise (); 
                                             check_sfr_data_o (data_acc + data_byte1 + core_cy);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_wr_o_fall(); //need to be en
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             ADDC_A_D:       {
                                             if (verbose == 1) { out ("verifing ADDC_A_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var sfr_data: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             var data_cy: bit             = core_alu_cy_i_p$;
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (sfr_data );
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'd3);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_sfr_data_o (operand + sfr_data + data_cy);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             [ADDC_A_ATR0,ADDC_A_ATR1]:     {
                                             if (verbose == 1) { outf ("%s %#04x:\n", "verifing ADDC_A_ATRn instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_ram: uint(bits:8) = p_ram_data_i$;
                                             var data_acc: uint(bits:8) = p_sfr_data_i$;
                                             var data_cy: bit           = core_alu_cy_i_p$;
                                             wait delay (delay_three_semi_cycles);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_data_o (data_ram + data_acc + data_cy);
                                             check_sfr_wr_o_fall(); //need to be en
                                             check_ram_addr_o(8'h00);
                                             check_ram_data_o(8'h00);
                                             check_ram_wr_o_rise(); //need to be en
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                                
                                             
                             [ADDC_A_R0, ADDC_A_R1, ADDC_A_R2, ADDC_A_R3, ADDC_A_R4, ADDC_A_R5, ADDC_A_R6, ADDC_A_R7]  :       {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ADDC_A_Rn instruction type (op) ", opcode); };
                                             var psw: uint(bits:2) = p_psw_i$;
                                             var data_acc:  uint(bits:8) = p_sfr_data_i$;
                                             var data_ram:  uint(bits:8) = p_ram_data_i$;
                                             var data_cy: bit           = core_alu_cy_i_p$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 1; // jump the pc
                                             check_ram_data_o (8'h00);
                                             check_ram_wr_o_rise (); 
                                             check_sfr_data_o (data_acc + data_ram + data_cy);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_wr_o_fall(); //need to be en
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                                
                                             
                             JC:             {
                                             if (verbose == 1) { out ("verifing JC instruction"); };
                                             var data_byte1 : uint(bits:8) = p_rom_data_i$;
                                             var en: bit                   = p_sfr_data_i$[7:7];
                                             
                                             check_byte_flag_o_rise ();   
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             if (en == 1'b1) { 
                                                      var temp:uint(bits:8) = by_two_complement(data_byte1);
                                                      if (data_byte1[7:7]==1'b1) { 
                                                            pc = pc - temp;   
                                                       }else { pc = pc + data_byte1; };
                                             }; //en if en
                                             check_sfr_wr_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_ram_addr_o (8'h00);
                                             check_byte_flag_o_fall ();   
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();

                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };

                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode         = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                   
                             //AJMP_3: with AJMP_1                   
                                                
                             ORL_D_A:        {
                                             if (verbose == 1) { out ("verifing ORL_D_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc );
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h0B);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_acc | operand);
                                                         check_ram_addr_o (data_byte1); //acc addr
                                                         check_ram_wr_o_fall ();
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data_acc | operand);
                                                         check_sfr_addr_o (data_byte1); //acc addr
                                                         check_sfr_wr_o_fall ();
                                                   };
                                             };
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };
                             
                                                
                             ORL_D_DATA:     {
                                             if (verbose == 1) { out ("verifing ORL_D_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_between_semi_cycles);
                                             var data_sfr: uint(bits:8)   = p_sfr_data_i$;
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             var data_ram1: uint(bits:8)   = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = data_ram1;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = data_sfr;
                                                   };
                                                };
                                             check_alu_op1_o (data_byte1);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h0B);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_byte1 | operand);
                                                         check_ram_addr_o (data_byte1);
                                                         check_ram_wr_o_fall ();
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data_byte1 | operand);
                                                         check_sfr_addr_o (data_byte1);
                                                         check_sfr_wr_o_fall ();
                                                   };
                                             };
                                             pc = pc + 16'd3; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                             
                             ORL_A_DATA:     {
                                             if (verbose == 1) { out ("verifing ORL_D_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00); 
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc | data_byte1);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall (); //need to be en
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                                
                                             
                             ORL_A_D:        {
                                             if (verbose == 1) { out ("verifing ORL_A_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h0B);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc | operand);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             [ORL_A_ATR0, ORL_A_ATR1]:        {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ORL_A_ATRn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h0B);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc | data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                                
                                             
                             [ORL_A_R0, ORL_A_R1, ORL_A_R2, ORL_A_R3, ORL_A_R4, ORL_A_R5, ORL_A_R6, ORL_A_R7]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ORL_A_Rn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h0B);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc | data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };
                                             
                             JNC:            {
                                             if (verbose == 1) { out ("verifing JNC instruction"); };
                                             var data_byte1 : uint(bits:8) = p_rom_data_i$;
                                             var en: bit                   = p_sfr_data_i$[7:7];
                                             
                                             check_byte_flag_o_rise ();   
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             if (en == 1'b0) { 
                                                      var temp:uint(bits:8) = by_two_complement(data_byte1);
                                                      if (data_byte1[7:7]==1'b1) { 
                                                            pc = pc - temp;   
                                                       }else { pc = pc + data_byte1; };
                                             }; //en if en
                                             check_sfr_wr_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_ram_addr_o (8'h00);
                                             check_byte_flag_o_fall ();   
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();

                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };

                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode         = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                  
                             //ACALL_3: with ACALL_1
                             ANL_D_A        {
                                             if (verbose == 1) { out ("verifing ANL_D_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc );
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h09);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_acc & operand);
                                                         check_ram_addr_o (data_byte1); //acc addr
                                                         check_ram_wr_o_fall ();
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data_acc & operand);
                                                         check_sfr_addr_o (data_byte1); //acc addr
                                                         check_sfr_wr_o_fall ();
                                                   };
                                             };
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };
                                             
                             ANL_D_DATA:     {
                                             if (verbose == 1) { out ("verifing ANL_D_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sfr: uint(bits:8)   = p_sfr_data_i$;
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_between_semi_cycles);
                                             var data_sfr1: uint(bits:8)   = p_sfr_data_i$;
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             var data_ram1: uint(bits:8)   = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = data_ram1;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = data_sfr1;
                                                   };
                                                };
                                             check_alu_op1_o (data_byte1);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h09);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_byte1 & operand);
                                                         check_ram_addr_o (data_byte1);
                                                         check_ram_wr_o_fall ();
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data_byte1 & operand);
                                                         check_sfr_addr_o (data_byte1);
                                                         check_sfr_wr_o_fall ();
                                                   };
                                             };
                                             pc = pc + 16'd3; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             ANL_A_DATA:     {
                                             if (verbose == 1) { out ("verifing ANL_A_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00); 
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc & data_byte1);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall (); //need to be en
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                            ANL_A_D:         {
                                             if (verbose == 1) { out ("verifing ANL_A_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h09);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc & operand);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                 
                                            
                             [ANL_A_ATR0, ANL_A_ATR1]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ANL_A_ATRn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h09);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc & data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                  
                                             
                            [ANL_A_R0, ANL_A_R1, ANL_A_R2, ANL_A_R3, ANL_A_R4, ANL_A_R5, ANL_A_R6, ANL_A_R7]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing ANL_A_Rn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h09);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc & data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst                 
                                             };
                                             
                             XRL_D_A:        {
                                             if (verbose == 1) { out ("verifing XRL_D_A instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc );
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h0A);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_acc ^ operand);
                                                         check_ram_addr_o (data_byte1); //acc addr
                                                         check_ram_wr_o_fall ();
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data_acc ^ operand);
                                                         check_sfr_addr_o (data_byte1); //acc addr
                                                         check_sfr_wr_o_fall ();
                                                   };
                                             };
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             XRL_D_DATA:     {
                                             if (verbose == 1) { out ("verifing XRL_D_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sfr: uint(bits:8)   = p_sfr_data_i$;
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_between_semi_cycles);
                                             var data_byte2: uint(bits:8) = p_rom_data_i$;
                                             var data_sfr1: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = data_ram;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = data_sfr1;
                                                   };
                                                };
                                             check_alu_op1_o (data_byte1);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h0A);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         check_ram_data_o (data_byte1 ^ operand);
                                                         check_ram_addr_o (data_byte1);
                                                         check_ram_wr_o_fall ();
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         check_sfr_data_o (data_byte1 ^ operand);
                                                         check_sfr_addr_o (data_byte1);
                                                         check_sfr_wr_o_fall ();
                                                   };
                                             };
                                             pc = pc + 16'd3; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };              
                                               
                             XRL_A_DATA:     {
                                             if (verbose == 1) { out ("verifing XRL_A_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00); 
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc ^ data_byte1);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall (); //need to be en
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };
                                             
                             XRL_A_D:        {
                                             if (verbose == 1) { out ("verifing XRL_A_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h0A);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc ^ operand);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             [XRL_A_ATR0,XRL_A_ATR1]:     {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing XRL_A_ATRn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h0A);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc ^ data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                             
                             [XRL_A_R0, XRL_A_R1, XRL_A_R2, XRL_A_R3, XRL_A_R4, XRL_A_R5, XRL_A_R6, XRL_A_R7]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing XRL_A_Rn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h0A);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc ^ data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst                 
                                             };                
                                             
                             MOV_A_DATA:    {
                                             if (verbose == 1) { out ("verifing MOV_A_DATA instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             check_sfr_addr_o (8'hE0); // acumulator address
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_sfr_data_o (data_byte1);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_fall (); //need to be en
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };

                             MOV_D_DATA: {
                                             if (verbose == 1) { out ("verifing MOV_D_DATA instruction"); };
                                             // --------------------------------------------
                                             // 1st CLOCK CYCLE
                                             // --------------------------------------------
                                             // 1st semi cycle - decode 1
                                             var ref_core_fsm_addr_op1 : uint(bits:8) = p_rom_data_i$; // addr op1
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 2nd semi cycle - decode 2
                                             var ref_core_fsm_addr_op2 : uint(bits:8) = p_rom_data_i$; // data immediate
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 3th semi cycle - execute
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 4th semi cycle - writeback
                                             pc = pc + 16'd3;
                                             check_rom_addr_o (pc);
               
                                             case ref_core_fsm_addr_op1 {
                                                [8'h00..8'h7F]: { // ram range
                                                   check_ram_addr_o (ref_core_fsm_addr_op1);
                                                   check_ram_data_o (ref_core_fsm_addr_op2);
                                                   check_ram_wr_o_fall ();
                                                   check_ram_rd_o_rise ();
                                                };
                                                [8'h80..8'hFF]: { // sfr range
                                                   check_sfr_addr_o (ref_core_fsm_addr_op1);
                                                   check_sfr_data_o (ref_core_fsm_addr_op2);
                                                   check_sfr_wr_o_fall ();
                                                   check_sfr_rd_o_rise ();
                                                };
                                             };
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall ();
                                             // --------------------------------------------
                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };
               
                                             opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                             opcode         = p_rom_data_i$; //get next opcode
               
                                             wait delay (delay_between_semi_cycles); // go to next instruction
                                             // --------------------------------------------
                                             };
                                             
                             [MOV_ATR0_DATA, MOV_ATR1_DATA]:    {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing MOV_ATRn_DATA instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_two_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             check_sfr_addr_o (8'h00); // acumulator address
                                             check_sfr_data_o (8'h00);                                             
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_ram_data_o (data_byte1);
                                             check_ram_addr_o (data_ram);                                             
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_fall(); //need to be en
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                            };                

                             [MOV_R0_DATA, MOV_R1_DATA, MOV_R2_DATA, MOV_R3_DATA, MOV_R4_DATA, MOV_R5_DATA, MOV_R6_DATA, MOV_R7_DATA]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing MOV_Rn_DATA instruction type (op) ", opcode); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var psw: uint(bits:2) = p_psw_i$;
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_two_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             check_sfr_addr_o (8'h00); // acumulator address
                                             check_sfr_data_o (8'h00);                                             
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); //need to be en
                                             check_ram_data_o (data_byte1);
                                             case opcode {
                                                 8'h18: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                                    2'b01:{check_ram_addr_o (8'd8);};
                                                                    2'b10:{check_ram_addr_o (8'd16);};
                                                                    2'b11:{check_ram_addr_o (8'd24);}; }; };
                                                8'h19: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                                    2'b01:{check_ram_addr_o (8'd9);};
                                                                    2'b10:{check_ram_addr_o (8'd17);};
                                                                    2'b11:{check_ram_addr_o (8'd25);}; }; };
                                                8'h1A: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                                    2'b01:{check_ram_addr_o (8'd10);};
                                                                    2'b10:{check_ram_addr_o (8'd18);};
                                                                    2'b11:{check_ram_addr_o (8'd26);}; }; };
                                                8'h1B: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                                    2'b01:{check_ram_addr_o (8'd11);};
                                                                    2'b10:{check_ram_addr_o (8'd19);};
                                                                    2'b11:{check_ram_addr_o (8'd27);}; }; };
                                                8'h1C: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                                    2'b01:{check_ram_addr_o (8'd12);};
                                                                    2'b10:{check_ram_addr_o (8'd20);};
                                                                    2'b11:{check_ram_addr_o (8'd28);}; }; };
                                                8'h1D: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                                    2'b01:{check_ram_addr_o (8'd13);};
                                                                    2'b10:{check_ram_addr_o (8'd21);};
                                                                    2'b11:{check_ram_addr_o (8'd29);}; }; };
                                                8'h1E: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                                    2'b01:{check_ram_addr_o (8'd14);};
                                                                    2'b10:{check_ram_addr_o (8'd22);};
                                                                    2'b11:{check_ram_addr_o (8'd30);}; }; };
                                                8'h1F: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                                    2'b01:{check_ram_addr_o (8'd15);};
                                                                    2'b10:{check_ram_addr_o (8'd23);};
                                                                    2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                                             };
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_fall(); //need to be en
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                            
                                            
                             SJMP:           {
                                             if (verbose == 1) { out ("verifing SJMP instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             wait delay (delay_three_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             var temp:uint(bits:8)=by_two_complement(data_byte1);
                                             if (data_byte1[7:7]==1'b1){pc = pc - temp;} else
                                             {pc = pc + data_byte1;};
                                             check_sfr_addr_o(8'h00); //sp addr
                                             check_rom_addr_o (pc);
                                             check_ram_addr_o (8'h00);
                                             check_alu_op1_o (8'h00); //after one sp-1
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (8'h00);
                                             check_alu_en_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                            
                             SUBB_A_DATA:    {
                                             if (verbose == 1) { out ("verifing SUBB_A_DATA instruction"); };
                                             // --------------------------------------------
                                             // 1st CLOCK CYCLE
                                             // --------------------------------------------
                                             // 1st semi cycle - decode 1
                                             var ref_core_fsm_addr_op1 : uint(bits:8) = p_rom_data_i$;
                                             var ref_core_fsm_ac       : uint(bits:8) = p_sfr_data_i$;
                                             check_alu_en_o_fall (); // alu disabled
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 2nd semi cycle - decode 2
                                             var ref_core_fsm_addr_op11 : uint(bits:8) = p_rom_data_i$;
                                             check_alu_en_o_fall (); // alu disabled
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 3th semi cycle - execute
                                             var ref_core_fsm_cy : bit = core_alu_cy_i_p$;
               
                                             check_ram_addr_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_alu_op1_o (ref_core_fsm_ac);
                                             check_alu_op2_o (ref_core_fsm_addr_op11);
                                             check_alu_opcode_o (5'd4);
                                             check_alu_en_o_rise (); // need to be en
                                             check_sfr_data_o (8'h00);
                                             check_ram_data_o (8'h00);
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_rise (); // need to be rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_ram_wr_o_rise ();
                                             check_sfr_wr_o_rise ();
                                             check_int_na_o_fall ();
                                             // --------------------------------------------
                                             wait delay (delay_between_semi_cycles);
                                             // 4th semi cycle - writeback
                                             pc = pc + 16'd2; // increment the pc
                                             check_alu_en_o_fall (); // alu disabled
                                             check_rom_addr_o (pc);
                                             check_sfr_data_o (ref_core_fsm_ac - ref_core_fsm_cy - ref_core_fsm_addr_op1);
                                             // --------------------------------------------
                                             if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                             else                        { check_int_rdy_o_fall (); };
               
                                             opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                             opcode         = p_rom_data_i$; //get next opcode
               
                                             wait delay (delay_between_semi_cycles); // go to next instruction
                                             // --------------------------------------------
                                            };               
                                             
                              SUBB_A_D:        {
                                             if (verbose == 1) { out ("verifing SUBB_A_D instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             var operand: uint(bits:8);
                                             wait delay (delay_two_semi_cycles);
                                             var ref_core_fsm_cy : bit = core_alu_cy_i_p$;
                                             case data_byte1 {
                                                   [8'h00..8'h7F]: { // ram range
                                                         operand = p_ram_data_i$;
                                                   };
                                                   [8'h80..8'hFF]: { // sfr range
                                                         operand = p_sfr_data_i$;
                                                   };
                                                };
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (operand);
                                             check_alu_opcode_o (5'h04);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc - ref_core_fsm_cy - operand);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                               
                                            
                                             
                             [SUBB_A_ATR0,SUBB_A_ATR1]:     {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing SUBB_A_ATRn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             var ref_core_fsm_cy : bit = core_alu_cy_i_p$;
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h04);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc - ref_core_fsm_cy - data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                               
                                            
                             [SUBB_A_R0, SUBB_A_R1, SUBB_A_R2, SUBB_A_R3, SUBB_A_R4, SUBB_A_R5, SUBB_A_R6, SUBB_A_R7]: {
                                             if (verbose == 1) { outf ( "%s %#04x:\n", "verifing SUBB_A_Rn instruction type (op) ", opcode); };
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             var ref_core_fsm_cy : bit = core_alu_cy_i_p$;
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_ram);
                                             check_alu_opcode_o (5'h04);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_acc - ref_core_fsm_cy - data_ram);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst                 
                                             };                                
                                            
                              MOV_BIT_C:      {
                                             if (verbose == 1) { out ("verifing MOV_BIT_C instruction"); };
                                             var data_rom: uint(bits:8)   = p_rom_data_i$;
                                             var data_psw: uint(bits:8)   = p_sfr_data_i$;                                             
                                             wait delay (delay_between_semi_cycles);
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_sfr: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_between_semi_cycles);
                                             var last: uint(bits:3) = data_rom[2:0].as_a(int);
                                             var resul: bit = data_psw[7:7]; // carry bit
                                             var addr_check: uint(bits:8) ;
                                             case data_rom {
                                                [8'h00..8'h7F]: { // ram range
                                                   if (last == 7){
                                                         addr_check = %{resul,data_ram[6:0]};
                                                   } else if (last == 0) {
                                                         addr_check = %{data_ram[7:1],resul}; 
                                                   } else {
                                                         addr_check = %{data_ram[7:(last+1)],resul,data_ram[(last-1):0]}; 
                                                   };
                                                
                                                   check_ram_data_o (addr_check);
                                                   check_ram_addr_o (data_rom); //acc addr
                                                   check_ram_wr_o_fall ();
                                                };
                                                [8'h80..8'hFF]: { // sfr range
                                                   if (last == 7){
                                                         addr_check = %{resul,data_sfr[6:0]};
                                                   } else if (last == 0) {
                                                         addr_check = %{data_sfr[7:1],resul}; 
                                                   } else {
                                                         addr_check = %{data_sfr[7:(last+1)],resul,data_sfr[(last-1):0]}; 
                                                   };
                                                   check_sfr_data_o (addr_check);
                                                   check_sfr_addr_o (data_rom); //acc addr
                                                   check_sfr_wr_o_fall ();
                                                };
                                             };
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_rise (); // rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                                
                                             
                             MOVC_A_ATDPTR: {
                                             if (verbose == 1) { out("verifing MOVC_A_ATDPTR instruction type (op) ", opcode); };
                                             var data_acc: uint(bits:8) = p_sfr_data_i$; // ACC
                                             check_sfr_addr_o (8'hE0); //dpl
                                             check_sfr_rd_o_fall ();
                                             wait delay (delay_between_semi_cycles);
                                             var data_dpl: uint(bits:8) = p_sfr_data_i$; // DPL
                                             check_sfr_addr_o (8'h82); //dpl
                                             check_sfr_rd_o_fall ();
                                             var data_byte2: uint(bits:8) = p_sfr_data_i$; // DPH
                                             wait delay (delay_between_semi_cycles); 
                                             check_alu_op1_o (data_acc);
                                             check_alu_op2_o (data_dpl);
                                             var acc_total: uint(bits:8) = data_acc + data_dpl ;
                                             wait delay (delay_between_semi_cycles); // Set P2
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h83);
                                             check_sfr_wr_o_rise ();
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00);
                                             check_ram_wr_o_rise ();
                                             var data_dph: uint(bits:8) = p_sfr_data_i$;
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_between_semi_cycles); 
                                             check_alu_op1_o (data_dph);
                                             var carry     : uint(bits:8) = core_alu_cy_i_p$;
                                             data_dph = data_dph + carry;
                                             var dptr: uint (bits:16) = %{data_dph, acc_total};
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00);
                                             check_ram_rd_o_rise ();
                                             check_ext_ram_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_between_semi_cycles);
                                             check_rom_addr_o (dptr);
                                             if (verbose == 1) { out ("DPH_o -> ", data_dph); };
                                             if (verbose == 1) { out ("DPL_o + acc -> ", acc_total); };
                                             if (verbose == 1) { out ("DPTR_o -> ", dptr); };
                                             check_rom_rd_o_fall (); //need to be en
                                             var data_to_acc: uint(bits: 8) = p_rom_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             pc = pc + 2; // jump the pc
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_to_acc);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_wr_o_fall ();
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             check_rom_addr_o (pc);
                                             pc = pc - 1'b1; // jump the pc
                                             };                
                                             
                                             
                             MOV_C_BIT:      {
                                             if (verbose == 1) { out ("verifing MOV_C_BIT instruction"); };
                                             var data_rom: uint(bits:8)   = p_rom_data_i$;
                                             var data_psw: uint(bits:8)   = p_sfr_data_i$;                                             
                                             wait delay (delay_between_semi_cycles);
                                             var data_ram: uint(bits:8)   = p_ram_data_i$;
                                             var data_sfr: uint(bits:8)   = p_sfr_data_i$;                                             
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_between_semi_cycles);
                                             var last: uint(bits:3) = data_rom[2:0].as_a(int);
                                             var resul: bit;
                                             case data_rom {
                                                [8'h00..8'h7F]: { // ram range
                                                   resul = data_ram[last:last];
                                                };
                                                [8'h80..8'hFF]: { // sfr range
                                                   resul = data_sfr[last:last];
                                                };
                                             };
                                             if (verbose == 1) { out("resul ", resul); };
                                             check_sfr_data_o (%{resul,data_psw[6:0]});
                                             check_sfr_addr_o (8'hD7); //acc addr
                                             check_sfr_wr_o_fall ();
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00); //acc addr
                                             check_ram_wr_o_rise ();
                                             pc = pc + 16'd2; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_rise (); // rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                                             
                             INC_DPTR: {
                                if (verbose == 1) { out ("verifing INC_DPTR instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var data_dptr : uint(bits:16);
                                var data_dpl  : uint(bits:8) ;
                                var data_dph  : uint(bits:8) ;
                                data_dpl = p_sfr_data_i$;
                                check_sfr_addr_o (8'h82);
                                check_sfr_rd_o_fall ();
                                check_sfr_data_o (8'h00);
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                // --------------------------------------------
                                check_alu_op1_o (data_dpl);
                                check_alu_op2_o (8'h01);
                                data_dpl = data_dpl + 1;
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                // --------------------------------------------
                                check_sfr_data_o (data_dpl);
                                check_sfr_addr_o (8'h82);
                                check_sfr_wr_o_fall (); //need to be en
                                wait delay (delay_between_semi_cycles);
                                // --------------------------------------------
                                // 1st CLOCK CYCLE - 2nd cycle
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                data_dph = p_sfr_data_i$;
                                check_sfr_addr_o (8'h83);
                                check_sfr_rd_o_fall ();
                                check_sfr_data_o (8'h00);
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                // --------------------------------------------
                                check_alu_op1_o (data_dph);
                                check_alu_op2_o (8'h00);
                                var carry     : uint(bits:8) = core_alu_cy_i_p$;
                                data_dph = data_dph + carry;
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                // --------------------------------------------
				check_sfr_data_o (data_dph);
                                check_sfr_addr_o (8'h83);
                                check_sfr_wr_o_fall (); //need to be en
                                pc = pc + 1; // jump the pc
                                check_ram_data_o (8'h00);
                                check_ram_addr_o (8'h00);
                                check_ram_wr_o_rise ();
                                check_rom_addr_o (pc);
                                check_alu_op1_o (8'h00);
                                check_alu_op2_o (8'h00);
                                check_alu_opcode_o (5'h00);
                                check_alu_en_o_fall (); 
                                check_ext_ram_o_fall (); //need to be en
                                check_byte_flag_o_fall ();
                                check_rom_rd_o_fall (); //need to be en 
                                check_ram_rd_o_rise (); 
                                check_sfr_rd_o_rise ();
                                check_int_na_o_fall ();
                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------
                                };                
                                             
                                             
                             MUL_AB:         {
                                             if (verbose == 1) { out ("verifing MUL_AB instruction"); };
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);                                             
                                             var data_acc1: uint(bits:8)   = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             check_alu_op1_o (data_acc1);
                                             check_alu_op2_o (data_acc);
                                             check_alu_opcode_o (5'h06);
                                             check_alu_en_o_rise (); //need to be en
                                             wait delay (delay_between_semi_cycles);
                                             check_ram_wr_o_rise ();
                                             var mul:uint (bits:16) = data_acc * data_acc1;
                                             check_sfr_data_o (mul[7:0]);
                                             check_sfr_addr_o (8'hE0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_three_semi_cycles);
                                             wait delay (delay_between_semi_cycles);
                                             check_sfr_data_o (mul[15:8]);
                                             check_sfr_addr_o (8'hF0); //acc addr
                                             check_sfr_wr_o_fall ();
                                             
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                            
                              ////////////////// DINO ///////////////////////////////////////////////       
                             JZ: {
                                if (verbose == 1) { out ("verifing JZ instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var ref_core_fsm_op1 : uint(bits:8) = p_rom_data_i$;
                                var ref_core_fsm_ac  : uint(bits:8) = p_sfr_data_i$;
                                pc = pc + 16'd2;
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                if (ref_core_fsm_ac == 0) {
                                   //pc = pc + ref_core_fsm_op1;
                                   var temp : uint(bits:8) = by_two_complement(ref_core_fsm_op1);
                                   if (ref_core_fsm_op1[7:7]==1'b1) { pc = pc - temp; }
                                   else                             { pc = pc + ref_core_fsm_op1; };
                                };
                                check_rom_addr_o (pc);
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };

                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------
                             };
                             // -----------------------------------------------
                             JNZ: {
                                if (verbose == 1) { out ("verifing JNZ instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var ref_core_fsm_op1 : uint(bits:8) = p_rom_data_i$;
                                var ref_core_fsm_ac  : uint(bits:8) = p_sfr_data_i$;
                                pc = pc + 16'd2;
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                if (ref_core_fsm_ac != 0) {
                                   //pc = pc + ref_core_fsm_op1;
                                   var temp : uint (bits:8) = by_two_complement (ref_core_fsm_op1);
                                   if (ref_core_fsm_op1[7:7]==1'b1) { pc = pc - temp; }
                                   else                             { pc = pc + ref_core_fsm_op1; };
                                };
                                check_rom_addr_o (pc);
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };

                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------
                             };
                             // -----------------------------------------------
                             ORL_C_BIT: {
                                if (verbose == 1) { out ("verifing ORL_C_BIT instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var data_byte1              : uint(bits:8) = p_rom_data_i$;
                                var sfr_op1                 : uint(bits:8) = p_sfr_data_i$;
                                //if (verbose == 1) { out ("Carry IN -> ", core_alu_cy_i_p$);
                                pc = pc + 16'd2;
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                var sfr_op2  : uint(bits:8) = p_sfr_data_i$;
                                var ram_op2  : uint(bits:8) = p_ram_data_i$;
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                check_alu_en_o_rise (); // alu enabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                var resul       : bit;
                                var addr_check  : uint(bits:8);
                                var last        : uint(bits:3) = data_byte1[2:0].as_a(int);
                                case data_byte1 {
                                   [8'h00..8'h7F]: { // ram range
                                      //if (verbose == 1) { out ("Data RAM -> ", ref_core_fsm_ram_op1[pos_bit:pos_bit]);
                                      resul = ram_op2[last:last] | sfr_op1[7:7];
                                   };
                                   [8'h80..8'hFF]: { // sfr range
                                      //if (verbose == 1) { out ("Data SFR -> ", ref_core_fsm_sfr_op1[pos_bit:pos_bit]);
                                      resul = sfr_op2[last:last] | sfr_op1[7:7];
                                   };
                                };
                                check_sfr_data_o (%{resul,sfr_op1[6:0]});
                                check_rom_addr_o (pc);
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };

                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------
                             };
                             // -----------------------------------------------
                             JMP_A_DPTR: {
                                if (verbose == 1) { out ("verifing JMP_A_DPTR instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var data_ac   : uint(bits:8) ;
                                var data_dptr : uint(bits:16);
                                var data_dpl  : uint(bits:8) ;
                                var data_dph  : uint(bits:8) ;
                                data_ac = p_sfr_data_i$;
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                // --------------------------------------------
                                data_dpl = p_sfr_data_i$;
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                data_dpl = data_dpl + data_ac; 
                                if (verbose == 1) { out ("DPL_i -> ", data_dpl); };
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // --------------------------------------------
                                // 2nd CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                // --------------------------------------------
                                data_dph = p_sfr_data_i$;
                                wait delay (delay_between_semi_cycles);
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                // --------------------------------------------
                                var carry     : uint(bits:8) = core_alu_cy_i_p$; 
                                data_dph = data_dph + carry;
                                data_dptr = %{data_dph,data_dpl};
				if (verbose == 1) { out ("DPH_o -> ", data_dph); };
                                if (verbose == 1) { out ("DPTR_o -> ", data_dptr); };
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                pc = data_dptr;
                                // --------------------------------------------

                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------
                                check_rom_addr_o (pc);
                                pc = pc - 16'd1;
                             };
                             // -----------------------------------------------
                             // -----------------------------------------------
                             ANL_C_BIT: {
                                if (verbose == 1) { out ("verifing ANL_C_BIT instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var data_byte1              : uint(bits:8) = p_rom_data_i$;
                                var sfr_op1                 : uint(bits:8) = p_sfr_data_i$;
                                //if (verbose == 1) { out ("Carry IN -> ", core_alu_cy_i_p$);
                                pc = pc + 16'd2;
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                var sfr_op2  : uint(bits:8) = p_sfr_data_i$;
                                var ram_op2  : uint(bits:8) = p_ram_data_i$;
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                check_alu_en_o_rise (); // alu enabled
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                var resul       : bit;
                                var addr_check  : uint(bits:8);
                                var last        : uint(bits:3) = data_byte1[2:0].as_a(int);
                                case data_byte1 {
                                   [8'h00..8'h7F]: { // ram range
                                      //if (verbose == 1) { out ("Data RAM -> ", ref_core_fsm_ram_op1[pos_bit:pos_bit]);
                                      resul = ram_op2[last:last] & sfr_op1[7:7];
                                   };
                                   [8'h80..8'hFF]: { // sfr range
                                      //if (verbose == 1) { out ("Data SFR -> ", ref_core_fsm_sfr_op1[pos_bit:pos_bit]);
                                      resul = sfr_op2[last:last] & sfr_op1[7:7];
                                   };
                                };
                                check_sfr_data_o (%{resul,sfr_op1[6:0]});
                                check_rom_addr_o (pc);
                                check_alu_en_o_fall (); // alu disabled
                                // --------------------------------------------
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };

                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------
                             };
                             
                             MOVC_A_ATPC: {
                                             if (verbose == 1) { out("verifing MOVC_A_ATPC instruction type (op) ", opcode); };
                                             var data_acc: uint(bits:8) = p_sfr_data_i$; // ACC
                                             check_sfr_addr_o (8'hE0); //dpl
                                             check_sfr_rd_o_fall ();
                                             wait delay (delay_between_semi_cycles);
                                             pc = pc + 1; // jump the pc
                                             var lsb: uint(bits:8) = pc[7:0]; // DPL
                                             check_alu_op1_o (lsb);
                                             check_alu_op2_o (data_acc);
                                             var acc_total: uint(bits:8) = data_acc + lsb ;                                             
                                             wait delay (delay_between_semi_cycles); 
                                             var msb: uint(bits:8) = pc[15:8];
                                             check_alu_op1_o (msb);
                                             wait delay (delay_between_semi_cycles); // Set P2
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00);
                                             check_ram_wr_o_rise ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             wait delay (delay_between_semi_cycles); 
                                             var carry     : uint(bits:8) = core_alu_cy_i_p$;
                                             msb = msb + carry;
                                             var total: uint (bits:16) = %{msb, acc_total};
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00);
                                             check_ram_rd_o_rise ();
                                             check_ext_ram_o_fall ();
                                             check_sfr_data_o (8'h00);
                                             check_sfr_addr_o (8'h00);
                                             check_sfr_wr_o_rise ();
                                             wait delay (delay_between_semi_cycles);
                                             wait delay (delay_between_semi_cycles);
                                             check_rom_addr_o (total);
                                             if (verbose == 1) { out ("lsb_o -> ", lsb); };
                                             if (verbose == 1) { out ("msb + acc -> ", msb); };
                                             if (verbose == 1) { out ("pc_total -> ", total); };
                                             var data_to_acc: uint(bits: 8) = p_rom_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             //pc = pc + 1; // jump the pc
                                             check_ram_data_o (8'h00);
                                             check_ram_addr_o (8'h00);
                                             check_ram_wr_o_rise ();
                                             check_sfr_data_o (data_to_acc);
                                             check_sfr_addr_o (8'hE0);
                                             check_sfr_wr_o_fall ();
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (5'h00);
                                             check_alu_en_o_fall (); 
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be en 
                                             check_ram_rd_o_rise (); 
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             check_rom_addr_o (pc);
                                             pc = pc - 1'b1; // jump the pc
                                             };                
                             
                             
                             // -----------------------------------------------
                             
                             ORL_C_NBIT: {
                                       if (verbose == 1) { out ("verifing ORL_C_NBIT instruction"); };
                                       // --------------------------------------------
                                       // 1st CLOCK CYCLE
                                       // --------------------------------------------
                                       // 1st semi cycle - decode 1
                                       var data_byte1              : uint(bits:8) = p_rom_data_i$;
                                       var sfr_op1                 : uint(bits:8) = p_sfr_data_i$;
                                       //if (verbose == 1) { out ("Carry IN -> ", core_alu_cy_i_p$);
                                       pc = pc + 16'd2;
                                       check_alu_en_o_fall (); // alu disabled
                                       // --------------------------------------------
                                       wait delay (delay_between_semi_cycles);
                                       // 2nd semi cycle - decode 2
                                       var sfr_op2  : uint(bits:8) = p_sfr_data_i$;
                                       var ram_op2  : uint(bits:8) = p_ram_data_i$;
                                       check_alu_en_o_fall (); // alu disabled
                                       // --------------------------------------------
                                       wait delay (delay_between_semi_cycles);
                                       // 3th semi cycle - execute
                                       check_alu_en_o_rise (); // alu enabled
                                       // --------------------------------------------
                                       wait delay (delay_between_semi_cycles);
                                       // 4th semi cycle - writeback
                                       var resul       : bit;
                                       var addr_check  : uint(bits:8);
                                       var last        : uint(bits:3) = data_byte1[2:0].as_a(int);
                                       case data_byte1 {
                                          [8'h00..8'h7F]: { // ram range
                                             //if (verbose == 1) { out ("Data RAM -> ", ref_core_fsm_ram_op1[pos_bit:pos_bit]);
                                             resul = ~ram_op2[last:last] | sfr_op1[7:7];
                                          };
                                          [8'h80..8'hFF]: { // sfr range
                                             //if (verbose == 1) { out ("Data SFR -> ", ref_core_fsm_sfr_op1[pos_bit:pos_bit]);
                                             resul = ~sfr_op2[last:last] | sfr_op1[7:7];
                                          };
                                       };
                                       check_sfr_data_o (%{resul,sfr_op1[6:0]});
                                       check_rom_addr_o (pc);
                                       check_alu_en_o_fall (); // alu disabled
                                       // --------------------------------------------
                                       if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                       else                        { check_int_rdy_o_fall (); };
         
                                       opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                       opcode         = p_rom_data_i$; //get next opcode
         
                                       wait delay (delay_between_semi_cycles); // go to next instruction
                                       // --------------------------------------------
                             };                
                                            
                             ANL_C_NBIT: {
                                       if (verbose == 1) { out ("verifing ANL_C_NBIT instruction"); };
                                       // --------------------------------------------
                                       // 1st CLOCK CYCLE
                                       // --------------------------------------------
                                       // 1st semi cycle - decode 1
                                       var data_byte1              : uint(bits:8) = p_rom_data_i$;
                                       var sfr_op1                 : uint(bits:8) = p_sfr_data_i$;
                                       //if (verbose == 1) { out ("Carry IN -> ", core_alu_cy_i_p$);
                                       pc = pc + 16'd2;
                                       check_alu_en_o_fall (); // alu disabled
                                       // --------------------------------------------
                                       wait delay (delay_between_semi_cycles);
                                       // 2nd semi cycle - decode 2
                                       var sfr_op2  : uint(bits:8) = p_sfr_data_i$;
                                       var ram_op2  : uint(bits:8) = p_ram_data_i$;
                                       check_alu_en_o_fall (); // alu disabled
                                       // --------------------------------------------
                                       wait delay (delay_between_semi_cycles);
                                       // 3th semi cycle - execute
                                       check_alu_en_o_rise (); // alu enabled
                                       // --------------------------------------------
                                       wait delay (delay_between_semi_cycles);
                                       // 4th semi cycle - writeback
                                       var resul       : bit;
                                       var addr_check  : uint(bits:8);
                                       var last        : uint(bits:3) = data_byte1[2:0].as_a(int);
                                       case data_byte1 {
                                          [8'h00..8'h7F]: { // ram range
                                             //if (verbose == 1) { out ("Data RAM -> ", ref_core_fsm_ram_op1[pos_bit:pos_bit]);
                                             resul = ~ram_op2[last:last] & sfr_op1[7:7];
                                          };
                                          [8'h80..8'hFF]: { // sfr range
                                             //if (verbose == 1) { out ("Data SFR -> ", ref_core_fsm_sfr_op1[pos_bit:pos_bit]);
                                             resul = ~sfr_op2[last:last] & sfr_op1[7:7];
                                          };
                                       };
                                       check_sfr_data_o (%{resul,sfr_op1[6:0]});
                                       check_rom_addr_o (pc);
                                       check_alu_en_o_fall (); // alu disabled
                                       // --------------------------------------------
                                       if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                       else                        { check_int_rdy_o_fall (); };
         
                                       opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                       opcode         = p_rom_data_i$; //get next opcode
         
                                       wait delay (delay_between_semi_cycles); // go to next instruction
                                       // --------------------------------------------
                             };                
                              
                             ////////////////// END DINO ////////////               
                                            
                             PUSH:          {
                                             if (verbose == 1) { out ("verifing PUSH instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_ram: uint(bits:8) = p_ram_data_i$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                            var data_sfr1: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             case data_byte1 {
                                                [8'h80..8'hFF]:  {
                                                                 check_sfr_data_o (data_sfr + 1'b1);
                                                                 check_sfr_addr_o (8'h81);
                                                                 check_sfr_wr_o_fall ();
                                                                 check_ram_data_o (data_sfr1);
                                                                 check_ram_addr_o (data_sfr + 1'b1);
                                                                 check_ram_wr_o_fall (); 
                                                                 };
                                                [8'h00..8'h7F]:  {
                                                                 check_ram_data_o (data_ram);
                                                                 check_ram_addr_o (data_sfr + 1'b1);
                                                                 check_ram_wr_o_fall ();
                                                                 check_sfr_data_o (data_sfr + 1'b1);
                                                                 check_sfr_addr_o (8'h81);
                                                                 check_sfr_wr_o_fall ();
                                                                 };
                                             };
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (8'h00);
                                             check_alu_en_o_fall ();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };               
                                             
                             POP:            {
                                             if (verbose == 1) { out ("verifing POP instruction"); };
                                             var data_byte1: uint(bits:8) = p_rom_data_i$;
                                             var data_sfr: uint(bits:8) = p_sfr_data_i$;
                                             var data_ram: uint(bits:8) = p_ram_data_i$;
                                             wait delay (delay_between_semi_cycles);
                                             var data_sfr1: uint(bits:8) = p_sfr_data_i$;
                                             wait delay (delay_two_semi_cycles);
                                             pc = pc + 16'd2; //increment the pc
                                             case data_byte1 {
                                                [8'h80..8'hFF]:  {
                                                                 check_sfr_data_o (data_sfr - 1'b1);
                                                                 check_sfr_addr_o (8'h81);
                                                                 check_sfr_wr_o_fall ();
                                                                 check_ram_data_o (data_sfr1);
                                                                 check_ram_addr_o (data_sfr - 1'b1);
                                                                 check_ram_wr_o_fall (); 
                                                                 };
                                                [8'h00..8'h7F]:  {
                                                                 check_ram_data_o (data_ram);
                                                                 check_ram_addr_o (data_sfr - 1'b1);
                                                                 check_ram_wr_o_fall ();
                                                                 check_sfr_data_o (data_sfr - 1'b1);
                                                                 check_sfr_addr_o (8'h81);
                                                                 check_sfr_wr_o_fall ();
                                                                 };
                                             };
                                             check_rom_addr_o (pc);
                                             check_alu_op1_o (8'h00);
                                             check_alu_op2_o (8'h00);
                                             check_alu_opcode_o (8'h00);
                                             check_alu_en_o_fall ();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_rom_rd_o_fall (); //need to be rise
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                             else {check_int_rdy_o_fall ();};
                                             
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                
                           
                                             
                           [MOV_ATR0_D, MOV_ATR1_D]: {
                              if (verbose == 1) { out("verifing MOV_ATRn_D instruction type (op) ", opcode); };
                              var read_data_byte: uint(bits:8) = p_ram_data_i$;
                              var read_addr: uint(bits:8) = p_rom_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              wait delay (delay_between_semi_cycles);
                              if(read_addr > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (read_addr);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                                 read_data_byte = p_sfr_data_i$; 
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (read_addr);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              wait delay (delay_two_semi_cycles);
                              pc = pc + 2; // jump the pc
                              check_ram_data_o (read_data_byte);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };                  
                                               
                                             
                           [MOV_R0_D, MOV_R1_D, MOV_R2_D, MOV_R3_D, MOV_R4_D, MOV_R5_D, MOV_R6_D, MOV_R7_D]: {
                              if (verbose == 1) { out("verifing MOV_Rn_D instruction type (op) ", opcode); };
                              var read_data_byte: uint(bits:8) = p_ram_data_i$;
                              var read_addr: uint(bits:8) = p_rom_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              wait delay (delay_between_semi_cycles);
                              if(read_addr > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (read_addr);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                                 read_data_byte = p_sfr_data_i$; 
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (read_addr);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              wait delay (delay_two_semi_cycles);
                              case opcode {
                              8'hF8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hF9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hFA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hFB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hFC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hFD: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hFE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hFF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              pc = pc + 2; // jump the pc
                              check_ram_data_o (read_data_byte);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           CJNE_A_DATA: {
                              if (verbose == 1) { out("verifing CJNE_A_DATA instruction"); };
                              var direct: uint(bits:8) = p_rom_data_i$;
                              var sfr_acc: uint(bits:8) = p_sfr_data_i$;
                              check_sfr_addr_o (8'hE0);
                              check_sfr_rd_o_fall (); //need to be en
                              wait delay (delay_between_semi_cycles);
                              var offset: uint(bits:8) = p_rom_data_i$;
                              var ram_data: uint(bits:8) = p_ram_data_i$;
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_ram_rd_o_rise ();
                              check_sfr_data_o (8'h00);
                              
                              check_sfr_wr_o_rise ();
                              
                               wait delay (delay_between_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();}; 
                              wait delay (delay_two_semi_cycles);    
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 3;
                              if(sfr_acc != direct) {
                                 if (offset[7:7] == 1) {
                                    pc = pc - by_two_complement(offset);
                                 } else {
                                    pc = pc + offset;
                                 };
                              };
                              if (sfr_acc < direct) {
                                    ram_data[7:7] = 1'b1;
                                 } else {
                                    ram_data[7:7] = 1'b0;
                              };
                              check_ram_addr_o (8'h00);
                              check_ram_data_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                           
                           CJNE_A_D: {
                              if (verbose == 1) { out("verifing CJNE_A_D instruction"); };
                              var indirect: uint(bits:8) = p_rom_data_i$;
                              var sfr_acc: uint(bits:8) = p_sfr_data_i$;
                              check_sfr_addr_o (8'hE0);
                              check_sfr_rd_o_fall (); //need to be en
                              wait delay (delay_between_semi_cycles);
                              var offset: uint(bits:8) = p_rom_data_i$;
                              var data: uint(bits:8);
                              if(indirect > 8'h7F) {
                                 data = p_sfr_data_i$;
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (indirect);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (indirect);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 data = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              wait delay (delay_between_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();}; 
                              wait delay (delay_two_semi_cycles);    
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 3;
                              if(sfr_acc != data) {
                                 if (offset[7:7] == 1) {
                                    pc = pc - by_two_complement(offset);
                                 } else {
                                    pc = pc + offset;
                                 };
                              };
                              
                              check_ram_addr_o (8'h00);
                              check_ram_data_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                           
                           [CJNE_ATR0_DATA, CJNE_ATR1_DATA]: {
                              if (verbose == 1) { out("verifing CJNE_ATRn_DATA instruction type (op) ", opcode); };
                              var direct: uint(bits:8) = p_rom_data_i$;
                              var ram_addr: uint(bits:8) = p_ram_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              check_ram_data_o (8'h00);
                              check_ram_rd_o_fall ();
                              wait delay (delay_between_semi_cycles);
                              var offset: uint(bits:8) = p_rom_data_i$;
                              var read_sfr: uint(bits:8) = p_sfr_data_i$;
                              var operand1: uint(bits:8) = p_ram_data_i$;
                              if(ram_addr > 8'h7F) {
                                 if (verbose == 1) { out ("IGNORE THIS WARNIG -> DATA GENERATED RAM > 7F"); };
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (ram_addr);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              wait delay (delay_between_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              check_alu_op1_o (operand1);
                              check_alu_op2_o (direct);
                              check_alu_opcode_o (5'd17);
                              check_alu_en_o_rise ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();}; 
                              wait delay (delay_two_semi_cycles);    
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 3;
                              if(operand1 != direct) {
                                    if (offset[7:7] == 1) {//negative offset
                                       pc = pc - by_two_complement(offset);
                                    } else {//positive
                                       pc = pc + offset;
                                    };
                              }; 
                              if (operand1 < direct) {
                                    operand1[7:7] = 1'b1;
                                 } else {
                                    operand1[7:7] = 1'b0;
                              };
                              check_ram_addr_o (8'h00);
                              check_ram_data_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                           
                           [CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA, CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA]: {
                              if (verbose == 1) { out("verifing CJNE_Rn_DATA instruction type (op) ", opcode); };
                              var operand1: uint(bits:8) = p_rom_data_i$;
                              var read_data: uint(bits:8) = p_ram_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hB8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hB9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hBA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hBB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hBC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hBD: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hBE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hBF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              check_ram_data_o (8'h00);
                              check_ram_rd_o_fall ();
                              wait delay (delay_two_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              check_alu_op1_o (data_byte1);
                              check_alu_op2_o (operand1);
                              check_alu_opcode_o (5'd17);
                              check_alu_en_o_rise ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();}; 
                              wait delay (delay_two_semi_cycles);    
                              var operand2: uint(bits:8) = p_rom_data_i$;  
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 3;
                              if(data_byte1 != operand1) {
                                 if (operand2[7:7]==1'b1) {
                                    pc = pc - by_two_complement(operand2);
                                 } else {
                                    pc = pc + operand2;
                                 };
                              };
                              check_ram_addr_o (8'h00);
                              check_ram_data_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                        [SWAP_A]: {
                              if (verbose == 1) { out("verifing SWAP_A instruction (op) ", opcode); };
                              var sfr_data_byte: uint(bits:8) = p_sfr_data_i$;
                              var new_sfr_data: uint(bits:8);
                              new_sfr_data[7:4]=sfr_data_byte[3:0];
                              new_sfr_data[3:0]=sfr_data_byte[7:4];
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (new_sfr_data);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                           [XCH_A_D]: {
                              if (verbose == 1) { out("verifing XCH_A_D instruction type (op) ", opcode); };
                              var read_addr:  uint(bits:8) = p_rom_data_i$;
                              var sfr_data:  uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_between_semi_cycles);
                              var read_data_byte: uint(bits:8) = p_ram_data_i$;
                              var sfr_data_byte: uint(bits:8) = p_sfr_data_i$;
                              if(read_addr > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (read_addr);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                                 read_data_byte = p_sfr_data_i$; 
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (read_addr);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              wait delay (delay_between_semi_cycles);
                                 check_sfr_data_o (read_data_byte);
                                 check_sfr_addr_o (8'hE0);
                                 check_sfr_wr_o_fall ();
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                              wait delay (delay_between_semi_cycles);
                              if(read_addr > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (sfr_data);
                                 check_sfr_addr_o (read_addr);
                                 check_sfr_wr_o_fall ();
                                 check_sfr_rd_o_rise ();
                                 read_data_byte = p_sfr_data_i$; 
                              } else {
                                 check_ram_data_o (sfr_data);
                                 check_ram_addr_o (read_addr);
                                 check_ram_wr_o_fall ();
                                 check_ram_rd_o_rise ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              pc = pc + 2; // jump the pc
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           [XCH_A_R0, XCH_A_R1, XCH_A_R2, XCH_A_R3, XCH_A_R4, XCH_A_R5, XCH_A_R6, XCH_A_R7]: {
                              if (verbose == 1) { out("verifing XCH_A_Rn instruction type (op) ", opcode); };
                              var ram_data_byte: uint(bits:8) = p_ram_data_i$;
                              var sfr_data_byte: uint(bits:8) = p_sfr_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;      case opcode {
                              8'hF8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hF9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hFA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hFB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hFC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hFD: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hFE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hFF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              check_ram_data_o (8'h00);
                              check_ram_rd_o_fall ();
                              wait delay (delay_three_semi_cycles);
                              case opcode {
                              8'hF8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hF9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hFA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hFB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hFC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hFD: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hFE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hFF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (sfr_data_byte);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (ram_data_byte);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                        [XCH_A_ATR0, XCH_A_ATR1]: {
                              if (verbose == 1) { out("verifing XCH_A_ATRn instruction type (op) ", opcode); };
                              var sfr_data_byte: uint(bits:8) = p_sfr_data_i$;
                              var read_addr: uint(bits:8) = p_ram_data_i$;
                              var new_ram_data: uint(bits:8) = p_sfr_data_i$;
                              check_ram_data_o (8'h00);
                              check_ram_rd_o_fall ();
                              check_sfr_addr_o (8'hE0);
                              check_sfr_data_o (8'h00);
                              check_sfr_rd_o_fall ();
                              wait delay (delay_between_semi_cycles);
                              var ram_data: uint(bits:8) = p_ram_data_i$;
                              wait delay (delay_between_semi_cycles);
                              wait delay (delay_between_semi_cycles);  
                              pc = pc + 1; // jump the pc
                              check_ram_addr_o (read_addr);
                              check_ram_data_o (new_ram_data);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (ram_data);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           [SETB_BIT, CLR_BIT, CPL_BIT]: {
                              case(opcode) {
                                 8'hD2: {if (verbose == 1) { out ("verifing SETB_BIT instruction (op) ", opcode); }; };
                                 8'hC2: {if (verbose == 1) { out ("verifing CLR_BIT instruction (op) ", opcode); };};
                                 8'hB2: {if (verbose == 1) { out ("verifing CPL_BIT instruction (op) ", opcode); };};
                              };
                              var rom_data1: uint(bits:8) = p_rom_data_i$;
                              wait delay (delay_between_semi_cycles);
                              var read_data_byte: uint(bits:8);
                              if(rom_data1 > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (rom_data1);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                                 read_data_byte = p_sfr_data_i$; 
                                 check_byte_flag_o_rise ();
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (rom_data1);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                                 check_byte_flag_o_rise ();
                              };
                              wait delay (delay_two_semi_cycles);
                              var bit_pos: uint(bits:3)=rom_data1[2:0];
                              var new_bit: bit;
                              case(opcode) {
                                 8'hD2: { new_bit=1'b1;};
                                 8'hC2: { new_bit=1'b0;};
                                 8'hB2: { new_bit=~read_data_byte[bit_pos:bit_pos];};
                              };
                              read_data_byte[bit_pos:bit_pos]=new_bit;
                              if(rom_data1 > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (read_data_byte);
                                 check_sfr_addr_o (rom_data1);
                                 check_sfr_wr_o_fall ();
                                 check_sfr_rd_o_rise ();
                                 read_data_byte = p_sfr_data_i$; 
                                 check_byte_flag_o_rise ();
                              } else {
                                 check_ram_data_o (read_data_byte);
                                 check_ram_addr_o (rom_data1);
                                 check_ram_wr_o_fall ();
                                 check_ram_rd_o_rise ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                                 check_byte_flag_o_rise ();
                              };
                              pc = pc + 2; // jump the pc
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_rise ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           [SETB_C, CLR_C, CPL_C]: {
                              case(opcode) {
                                 8'hD3: {if (verbose == 1) { out ("verifing SETB_C instruction (op) ", opcode); };};
                                 8'hC3: {if (verbose == 1) { out ("verifing CLR_C instruction (op) ", opcode); }; };
                                 8'hB3: {if (verbose == 1) { out ("verifing CPL_C instruction (op) ", opcode); };};
                              };
                              var data_byte1: uint(bits:8) = p_rom_data_i$;
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_three_semi_cycles);
                              var new_bit: bit;
                              case(opcode) {
                                 8'hD3: { new_bit=1'b1;};
                                 8'hC3: { new_bit=1'b0;};
                                 8'hB3: { new_bit=~sfr_data1[7:7];};
                              };
                              sfr_data1[7:7]=new_bit;
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (sfr_data1);
                              check_sfr_addr_o (8'hD7);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_rise ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           [DJNZ_D]: {
                              if (verbose == 1) { out("verifing DJNZ_D instruction type (op) ", opcode); };
                              var read_data_byte: uint(bits:8);
                              var rom_data1: uint(bits:8) = p_rom_data_i$;
                              wait delay (delay_between_semi_cycles);
                              var rom_data2: uint(bits:8) = p_rom_data_i$;
                              if(rom_data1 > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (rom_data1);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                                 read_data_byte = p_sfr_data_i$; 
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (rom_data1);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 read_data_byte = p_ram_data_i$; 
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              pc = pc + 3;
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              wait delay (delay_between_semi_cycles);
                              check_alu_op1_o (read_data_byte);
                              check_alu_op2_o (8'h01);
                              check_alu_opcode_o (5'h05);
                              check_alu_en_o_rise (); 
                              wait delay (delay_two_semi_cycles);
                              wait delay (delay_three_semi_cycles);
                              if((read_data_byte - 1'b1) != 0) {
                                 if (rom_data2[7:7]==1'b1) {
                                    pc = pc - by_two_complement(rom_data2);
                                 } else {
                                    pc = pc + rom_data2;
                                 };
                              };
                              if(rom_data1 > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (read_data_byte - 8'h01);
                                 check_sfr_addr_o (rom_data1);
                                 check_sfr_wr_o_fall ();
                                 check_sfr_rd_o_rise ();
                              } else {
                                 check_ram_data_o (read_data_byte - 8'h01);
                                 check_ram_addr_o (rom_data1);
                                 check_ram_wr_o_fall ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        [XCHD_A_ATR0, XCHD_A_ATR1]: {
                              if (verbose == 1) { out("verifing XCHD_A_ATRn instruction type (op) ", opcode); };
                              var sfr_data_byte: uint(bits:8) = p_sfr_data_i$;
                              var read_addr: uint(bits:8) = p_ram_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              wait delay (delay_between_semi_cycles);
                              var ram_data: uint(bits:8) = p_ram_data_i$;
                              var new_sfr_data: uint(bits:8);
                              var new_ram_data: uint(bits:8);
                              new_ram_data[7:4]=ram_data[7:4];
                              new_ram_data[3:0]=sfr_data_byte[3:0];
                              new_sfr_data[7:4]=sfr_data_byte[7:4];
                              new_sfr_data[3:0]=ram_data[3:0];
                              wait delay (delay_between_semi_cycles);    
                              check_sfr_data_o (new_sfr_data);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              wait delay (delay_between_semi_cycles);  
                              pc = pc + 1; // jump the pc
                              check_ram_addr_o (read_addr);
                              check_ram_data_o (new_ram_data);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                           [DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7]: {
                              if (verbose == 1) { out("verifing DJNZ_Rn instruction type (op) ", opcode); };
                              var ram_data1: uint(bits:8) = p_ram_data_i$;
                              var rom_data: uint(bits:8) = p_rom_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hE8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hE9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hEA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hEB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hEC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hED: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hEE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hEF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              pc = pc + 2;
                              check_ram_data_o (8'h00);
                              check_ram_rd_o_fall ();
                              wait delay (delay_two_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              check_alu_op1_o (data_byte1);
                              check_alu_op2_o (8'h01);
                              check_alu_opcode_o (5'h05);
                              check_alu_en_o_rise ();
                               if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();}; 
                              wait delay (delay_two_semi_cycles);
                              wait delay (delay_three_semi_cycles);
                              if((data_byte1 - 1) != 0) {
                                 if (rom_data[7:7]==1'b1) {
                                    pc = pc - by_two_complement(rom_data);
                                 } else {
                                    pc = pc + rom_data;
                                 };
                              };
                              case opcode {
                              8'hE8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hE9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hEA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hEB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hEC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hED: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hEE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hEF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              check_ram_data_o (data_byte1 - 1'b1);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        [MOVX_A_ATDPTR]: {
                              if (verbose == 1) { out("verifing MOVX_A_ATDPTR instruction type (op) ", opcode); };
                              check_sfr_addr_o (8'h82);
                              check_sfr_rd_o_fall ();
                              var data_byte1: uint(bits:8) = p_sfr_data_i$; // DPL                              
                              wait delay (delay_between_semi_cycles);
                              check_sfr_addr_o (8'h83);
                              check_sfr_rd_o_fall ();
                              var data_byte2: uint(bits:8) = p_sfr_data_i$; // DPH
                              wait delay (delay_between_semi_cycles); // Set P2EN
                              check_sfr_data_o (8'hFF);
                              check_sfr_addr_o (8'hE8);
                              check_sfr_wr_o_fall ();
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              wait delay (delay_between_semi_cycles); // Set P2
                              check_sfr_data_o (data_byte2);
                              check_sfr_addr_o (8'hA0);
                              check_sfr_wr_o_fall ();
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              wait delay (delay_between_semi_cycles); 
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (data_byte1);
                              check_ram_rd_o_fall ();
                              check_ext_ram_o_rise ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              wait delay (delay_between_semi_cycles);
                              var ram_data1: uint(bits:8) = p_ram_data_i$;
                              wait delay (delay_two_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (ram_data1);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        [MOVX_A_ATR0, MOVX_A_ATR1]: {
                              if (verbose == 1) { out("verifing MOVX_A_ATRn instruction type (op) ", opcode); };
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hE6: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hE7: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              };
                              check_ram_rd_o_fall ();
                              wait delay (delay_between_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              check_ram_addr_o (data_byte1);
                              check_ram_rd_o_fall ();  
                              check_ext_ram_o_rise ();    
                              wait delay (delay_two_semi_cycles);
                              var data_byte2: uint(bits:8) = p_ram_data_i$;
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (data_byte2);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        [CLR_A]: {
                              if (verbose == 1) { out("verifing CLR_A instruction (op) ", opcode); };
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };

                             DIV_AB:         {
                                             if (verbose == 1) { out ("verifing DIV_AB instruction"); };
                                             var data_byte1: uint(bits:8) = p_sfr_data_i$; //from B register                                          
                                             wait delay (delay_between_semi_cycles);
                                             var data_acc: uint(bits:8)   = p_sfr_data_i$;
                                             if (data_acc == 0) {
                                                data_acc = 1;
                                                //out ("------------IGNORE THIS WARNING--------------");
                                                wait delay (delay_between_semi_cycles);
                                                check_alu_op1_o (data_byte1);
                                                check_alu_opcode_o (5'h07);
                                                check_alu_en_o_rise (); //need to be en
                                                wait delay (delay_between_semi_cycles);
                                                check_ram_wr_o_rise ();
                                                check_sfr_addr_o (8'hE0); //acc addr
                                                check_sfr_wr_o_fall ();
                                                if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                                else {check_int_rdy_o_fall ();};
                                                wait delay (delay_three_semi_cycles);
                                                wait delay (delay_between_semi_cycles);
                                                check_sfr_wr_o_fall ();
                                             }
                                             else {
                                                wait delay (delay_between_semi_cycles);
                                                check_alu_op1_o (data_byte1);
                                                check_alu_op2_o (data_acc);
                                                check_alu_opcode_o (5'h07);
                                                check_alu_en_o_rise (); //need to be en
                                                wait delay (delay_between_semi_cycles);
                                                check_ram_wr_o_rise ();
                                                var quo:uint (bits:8) = data_byte1 / data_acc ;
                                                var resto:uint (bits:8) = data_byte1 % data_acc;
                                                check_sfr_data_o (quo);
                                                check_sfr_addr_o (8'hE0); //acc addr
                                                check_sfr_wr_o_fall ();
                                                if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                                                else {check_int_rdy_o_fall ();};
                                                wait delay (delay_three_semi_cycles);
                                                wait delay (delay_between_semi_cycles);
                                                check_sfr_data_o (resto);
                                                check_sfr_addr_o (8'hF0); //acc addr
                                                check_sfr_wr_o_fall ();
                                             };
                                             
                                             
                                             pc = pc + 16'd1; //increment the pc
                                             check_rom_addr_o (pc);
                                             check_rom_rd_o_fall();
                                             check_ext_ram_o_fall ();
                                             check_byte_flag_o_fall ();
                                             check_ram_rd_o_rise ();
                                             check_sfr_rd_o_rise ();
                                             check_int_na_o_fall ();
                                             
                                             check_rom_rd_o_fall (); //need to be en
                                             opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode 
                                             opcode = p_rom_data_i$; //get next opcode
                                             wait delay (delay_between_semi_cycles); // next_inst
                                             };                               
                                            
                        [DA_A]: {
                              if (verbose == 1) { out("verifing DA_A instruction (op) ", opcode); };
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;                              
                              wait delay (delay_two_semi_cycles);
                              check_alu_op1_o (sfr_data1);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'd8);
                              check_alu_en_o_rise ();
                              pc = pc + 1; // jump the pc
                              wait delay (delay_between_semi_cycles);
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           
                                                   
                        [MOV_A_D]: {
                              if (verbose == 1) { out("verifing MOV_A_D instruction (op) ", opcode); };
                              var operand: uint(bits:8) = p_rom_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              wait delay (delay_between_semi_cycles);
                              if(operand > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_rise ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (operand);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_fall ();
                              } else {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (operand);
                                 check_ram_wr_o_rise ();
                                 check_ram_rd_o_fall ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                                 check_sfr_rd_o_rise ();
                              };
                              wait delay (delay_between_semi_cycles);
                              var data_byte: uint(bits:8);
                              if(operand > 8'h7F) {
                                 data_byte = p_sfr_data_i$;
                              } else {
                                 data_byte = p_ram_data_i$;
                              };
                              wait delay(delay_between_semi_cycles);
                              pc = pc + 2; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (data_byte);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                        [MOV_A_ATR0, MOV_A_ATR1]: {
                              if (verbose == 1) { out("verifing MOV_A_ATRn instruction type (op) ", opcode); };
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hE6: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hE7: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              };
                              check_ram_rd_o_fall ();
                              wait delay (delay_between_semi_cycles);
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              check_ram_addr_o (data_byte1);
                              check_ram_rd_o_fall ();      
                              wait delay (delay_two_semi_cycles);
                              var data_byte2: uint(bits:8) = p_ram_data_i$;
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (data_byte2);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                           
                           MOV_D_D: {
                              if (verbose == 1) { out("verifing MOV_D_D instruction"); };
                              var ram_data1: uint(bits:8) = p_ram_data_i$;
                              var rom_data1: uint(bits:8) = p_rom_data_i$;
                              wait delay (delay_between_semi_cycles);
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              var rom_data2: uint(bits:8) = p_rom_data_i$;
                              wait delay (delay_two_semi_cycles);
                              pc = pc + 3; // jump the pc
                              var data: uint(bits:8);
                              var addr: uint(bits:8) ;
                              if(rom_data1 > 8'h7F) { //SFR
                                 data = sfr_data1;
                                 addr = rom_data2;
                              } else { //ram
                                 data = ram_data1;
                                 addr = rom_data2;
                              };
                              if(rom_data2 > 8'h7F) { //SFR
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_sfr_data_o (data);
                                 check_sfr_addr_o (addr);
                                 check_sfr_wr_o_fall ();
                              } else { //ram
                                 check_ram_data_o (data);
                                 check_ram_addr_o (addr);
                                 check_ram_wr_o_fall ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                              };
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                 
                            [MOV_D_ATR0, MOV_D_ATR1]: {
                              if (verbose == 1) { out("verifing MOV_D_ATRn instruction type (op) ", opcode); };
                              var ram_data1: uint(bits:8) = p_ram_data_i$;
                              var rom_data1: uint(bits:8) = p_rom_data_i$;
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 2; // jump the pc
                              if(rom_data1 > 8'h7F) { //SFR
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_sfr_data_o (ram_data1);
                                 check_sfr_addr_o (rom_data1);
                                 check_sfr_wr_o_fall ();
                              } else { //RAM
                                 check_ram_data_o (ram_data1);
                                 check_ram_addr_o (rom_data1);
                                 check_ram_wr_o_fall ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                              };
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                           
                           [MOV_D_R0, MOV_D_R1, MOV_D_R2, MOV_D_R3, MOV_D_R4, MOV_D_R5, MOV_D_R6, MOV_D_R7]: {
                              if (verbose == 1) { out("verifing MOV_D_Rn instruction type (op) ", opcode); };
                              var ram_data1: uint(bits:8) = p_ram_data_i$;
                              var rom_data1: uint(bits:8) = p_rom_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hE8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hE9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hEA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hEB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hEC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hED: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hEE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hEF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 2; // jump the pc
                              if(rom_data1 > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_sfr_data_o (ram_data1);
                                 check_sfr_addr_o (rom_data1);
                                 check_sfr_wr_o_fall ();
                              } else {
                                 check_ram_data_o (ram_data1);
                                 check_ram_addr_o (rom_data1);
                                 check_ram_wr_o_fall ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                              };
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                      
                           MOV_DPTR_DATA: {
                                if (verbose == 1) { out ("verifing MOV_DPTR_DATA instruction"); };
                                // --------------------------------------------
                                // 1st CLOCK CYCLE
                                // --------------------------------------------
                                // 1st semi cycle - decode 1
                                var data_dptr : uint(bits:16);
                                var data_dpl  : uint(bits:8) ;
                                var data_dph  : uint(bits:8) ;
                                var immed     : uint(bits:8) = p_rom_data_i$;
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 2nd semi cycle - decode 2
                                // --------------------------------------------
                                var immed1     : uint(bits:8) = p_rom_data_i$;
                                check_sfr_data_o (immed);
                                check_sfr_addr_o (8'h83);
                                check_sfr_wr_o_fall ();
                                wait delay (delay_between_semi_cycles);
                                // 3th semi cycle - execute
                                // --------------------------------------------
                                wait delay (delay_between_semi_cycles);
                                // 4th semi cycle - writeback
                                // --------------------------------------------
				check_sfr_data_o (immed1);
                                check_sfr_addr_o (8'h82);
                                check_sfr_wr_o_fall (); //need to be en
                                pc = pc + 3; // jump the pc
                                check_ram_data_o (8'h00);
                                check_ram_addr_o (8'h00);
                                check_ram_wr_o_rise ();
                                check_rom_addr_o (pc);
                                check_alu_op1_o (8'h00);
                                check_alu_op2_o (8'h00);
                                check_alu_opcode_o (5'h00);
                                check_alu_en_o_fall (); 
                                check_ext_ram_o_fall (); //need to be en
                                check_byte_flag_o_fall ();
                                check_rom_rd_o_fall (); //need to be en 
                                check_ram_rd_o_rise (); 
                                check_sfr_rd_o_rise ();
                                check_int_na_o_fall ();
                                // --------------------------------------------
                                if (opcode_previus == RETI) { check_int_rdy_o_rise (); }
                                else                        { check_int_rdy_o_fall (); };

                                opcode_previus = opcode.as_a (instruction_set_t); // get the previus opcode
                                opcode         = p_rom_data_i$; //get next opcode

                                wait delay (delay_between_semi_cycles); // go to next instruction
                                // --------------------------------------------

                             }; 
                           
                                 
                           [MOV_A_R0, MOV_A_R1, MOV_A_R2, MOV_A_R3, MOV_A_R4, MOV_A_R5, MOV_A_R6, MOV_A_R7]: {
                              if (verbose == 1) { out("verifing MOV_Rn_A instruction type (op) ", opcode); };
                              var ram_data1: uint(bits:8) = p_ram_data_i$;
                              var sfr_data: uint(bits:8) = p_sfr_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hE8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hE9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hEA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hEB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hEC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hED: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hEE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hEF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (ram_data1);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        [MOVX_ATDPTR_A]: {
                              if (verbose == 1) { out("verifing MOVX_ATDPTR_A instruction type (op) ", opcode); };
                              check_sfr_addr_o (8'h82);
                              check_sfr_rd_o_fall ();
                              var data_byte1: uint(bits:8) = p_sfr_data_i$; // DPL                              
                              wait delay (delay_between_semi_cycles);
                              var data_byte2: uint(bits:8) = p_sfr_data_i$; // DPH                              
                              check_sfr_addr_o (8'h83);
                              check_sfr_rd_o_fall ();
                              wait delay (delay_between_semi_cycles); // Set P2EN
                              check_sfr_data_o (8'hFF);
                              check_sfr_addr_o (8'hE8);
                              check_sfr_wr_o_fall ();
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              wait delay (delay_between_semi_cycles); // Set P2
                              check_sfr_data_o (data_byte2);
                              check_sfr_addr_o (8'hA0);
                              check_sfr_wr_o_fall ();
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              wait delay (delay_two_semi_cycles); 
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_rd_o_fall ();
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              wait delay (delay_between_semi_cycles);
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_between_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (sfr_data1);
                              check_ram_addr_o (data_byte1);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_rise ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                        [MOVX_ATR0_A, MOVX_ATR1_A]: {
                              if (verbose == 1) { out("verifing MOVX_ATRn_A instruction type (op) ", opcode); };
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              case opcode {
                              8'hF2: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hF3: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              };
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (sfr_data1);
                              check_ram_addr_o (data_byte1);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_rise ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           [CPL_A]: {
                              if (verbose == 1) { out ("verifing CPL_A instruction (op) ", opcode); };
                              var data_byte1: uint(bits:8) = p_rom_data_i$;
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (8'h00);
                              check_ram_addr_o (8'h00);
                              check_ram_wr_o_rise ();
                              check_sfr_data_o (~sfr_data1);
                              check_sfr_addr_o (8'hE0);
                              check_sfr_wr_o_fall ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                           [MOV_D_A]: {
                              if (verbose == 1) { out ("verifing MOV_D_A instruction (op) ", opcode); };
                              var data_byte1: uint(bits:8) = p_rom_data_i$;
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 2; // jump the pc
                              if(data_byte1 > 8'h7F) {
                                 check_ram_data_o (8'h00);
                                 check_ram_addr_o (8'h00);
                                 check_ram_wr_o_rise ();
                                 check_sfr_data_o (sfr_data1);
                                 check_sfr_addr_o (data_byte1);
                                 check_sfr_wr_o_fall ();
                              } else {
                                 check_ram_data_o (sfr_data1);
                                 check_ram_addr_o (data_byte1);
                                 check_ram_wr_o_fall ();
                                 check_sfr_data_o (8'h00);
                                 check_sfr_addr_o (8'h00);
                                 check_sfr_wr_o_rise ();
                              };
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                        
                           };
                        
                        
                        [MOV_ATR0_A, MOV_ATR1_A]: {
                              if (verbose == 1) { out("verifing MOV_ATRn_A instruction type (op) ", opcode); };
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              var sfr_data1: uint(bits:8) = p_sfr_data_i$;
                              wait delay (delay_three_semi_cycles);
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (sfr_data1);
                              check_ram_addr_o (data_byte1);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                        
                        
                           [MOV_R0_A, MOV_R1_A, MOV_R2_A, MOV_R3_A, MOV_R4_A, MOV_R5_A, MOV_R6_A, MOV_R7_A]: {
                              if (verbose == 1) { out("verifing MOV_Rn_A instruction type (op) ", opcode); };
                              var data_byte1: uint(bits:8) = p_ram_data_i$;
                              var data_byte2: uint(bits:8) = p_rom_data_i$;
                              var sfr_data: uint(bits:8) = p_sfr_data_i$;
                              var psw: uint(bits:2) = p_psw_i$;
                              wait delay (delay_three_semi_cycles);
                              case opcode {
                              8'hF8: {case psw { 2'b00:{check_ram_addr_o (8'd0);};
                                                2'b01:{check_ram_addr_o (8'd8);};
                                                2'b10:{check_ram_addr_o (8'd16);};
                                                2'b11:{check_ram_addr_o (8'd24);}; }; };
                              8'hF9: {case psw { 2'b00:{check_ram_addr_o (8'd1);};
                                                2'b01:{check_ram_addr_o (8'd9);};
                                                2'b10:{check_ram_addr_o (8'd17);};
                                                2'b11:{check_ram_addr_o (8'd25);}; }; };
                              8'hFA: {case psw { 2'b00:{check_ram_addr_o (8'd2);};
                                                2'b01:{check_ram_addr_o (8'd10);};
                                                2'b10:{check_ram_addr_o (8'd18);};
                                                2'b11:{check_ram_addr_o (8'd26);}; }; };
                              8'hFB: {case psw { 2'b00:{check_ram_addr_o (8'd3);};
                                                2'b01:{check_ram_addr_o (8'd11);};
                                                2'b10:{check_ram_addr_o (8'd19);};
                                                2'b11:{check_ram_addr_o (8'd27);}; }; };
                              8'hFC: {case psw { 2'b00:{check_ram_addr_o (8'd4);};
                                                2'b01:{check_ram_addr_o (8'd12);};
                                                2'b10:{check_ram_addr_o (8'd20);};
                                                2'b11:{check_ram_addr_o (8'd28);}; }; };
                              8'hFD: {case psw { 2'b00:{check_ram_addr_o (8'd5);};
                                                2'b01:{check_ram_addr_o (8'd13);};
                                                2'b10:{check_ram_addr_o (8'd21);};
                                                2'b11:{check_ram_addr_o (8'd29);}; }; };
                              8'hFE: {case psw { 2'b00:{check_ram_addr_o (8'd6);};
                                                2'b01:{check_ram_addr_o (8'd14);};
                                                2'b10:{check_ram_addr_o (8'd22);};
                                                2'b11:{check_ram_addr_o (8'd30);}; }; };
                              8'hFF: {case psw { 2'b00:{check_ram_addr_o (8'd7);};
                                                2'b01:{check_ram_addr_o (8'd15);};
                                                2'b10:{check_ram_addr_o (8'd23);};
                                                2'b11:{check_ram_addr_o (8'd31);}; }; };                                     
                              };
                              pc = pc + 1; // jump the pc
                              check_ram_data_o (sfr_data);
                              check_ram_wr_o_fall ();
                              check_sfr_data_o (8'h00);
                              check_sfr_addr_o (8'h00);
                              check_sfr_wr_o_rise ();
                              check_rom_addr_o (pc);
                              check_alu_op1_o (8'h00);
                              check_alu_op2_o (8'h00);
                              check_alu_opcode_o (5'h00);
                              check_alu_en_o_fall (); 
                              check_ext_ram_o_fall ();
                              check_byte_flag_o_fall ();
                              check_rom_rd_o_fall (); //need to be en 
                              check_ram_rd_o_rise (); 
                              check_sfr_rd_o_rise ();
                              check_int_na_o_fall ();
                              if (opcode_previus == RETI){check_int_rdy_o_rise ();}
                              else {check_int_rdy_o_fall ();};
                              opcode_previus = opcode.as_a(instruction_set_t); // get the previus opcode
                              opcode = p_rom_data_i$; //get next opcode
                              wait delay (delay_between_semi_cycles); // next_inst
                           };
                                             
                                             
                                             
                             default:       {
                                               if (verbose == 1) { out ("entrou break"); };
                                               break;
                                            };
                          }; // end case
 
                       }; //end while true
                       
                       wait delay (25);
         
                   };
         feature3: {
           var opcode: uint(bits:8);
           var opcode_previus: instruction_set_t; //some inst. need to know the pervius opcode to check.
           out ("Feature3 verification");
                   
           var delay_to_get_opcode: int = 12;
           var delay_end: int = 13;
           var delay_between_semi_cycles: int = 25; //one semi-cycle
           var delay_two_semi_cycles: int = 50;
           var delay_three_semi_cycles: int = 75;
           opcode_previus = NOP; // consider the previous opcode as NOP
                       
          wait @core_fsm_reset_rise;
          wait delay (50); //the first event after the reset
                       
          wait delay (25); // new sync due changes in core
                       
                       
          //first case - get a opcode. After it nedd to get the opcode in Wb state
          wait delay (delay_to_get_opcode);
          opcode = p_rom_data_i$;
                       
          //See of there is a LCALL by hardware
          if (p_int_vect_i$ != 3'b000) {opcode = 8'h12}; //new opcode is LCALL
                       
          wait delay (delay_between_semi_cycles); 

          /////////////////// INTRUCTIONS CHECKERS ///////////                                              
          while TRUE {
              
               wait @interrupt_change;
          
               case opcode.as_a(instruction_set_t) {
                  LCALL:      { 
                                 if (verbose == 1) { out ("verifing LCALL instruction"); };
                                 wait delay (delay_between_semi_cycles); // next_inst
                                 wait delay (delay_three_semi_cycles); // next_inst
                                 wait delay (delay_three_semi_cycles); // next_inst
                                 opcode_previus = opcode.as_a(instruction_set_t);
                                 wait delay (delay_between_semi_cycles); // next_inst
                               };
                  default:    { out ("entrou default");
                                 
                                 case opcode.as_a(instruction_set_t) {
                                     //list all opcodes with two machine cycles
                                     [ LCALL, ACALL_1, RET, RETI,  ACALL_2, ACALL_3, ACALL_4, ACALL_5, ACALL_6, ACALL_7, ACALL_8, MUL_AB, DIV_AB, JMP_A_DPTR, CJNE_ATR0_DATA, CJNE_ATR1_DATA, CJNE_R0_DATA, CJNE_R1_DATA, CJNE_R2_DATA, CJNE_R3_DATA, CJNE_R4_DATA, CJNE_R5_DATA, CJNE_R6_DATA, CJNE_R7_DATA, DJNZ_D, DJNZ_R0, DJNZ_R1, DJNZ_R2, DJNZ_R3, DJNZ_R4, DJNZ_R5, DJNZ_R6, DJNZ_R7, MOVX_A_ATDPTR, MOVX_ATDPTR_A, MOVC_A_ATDPTR, CJNE_A_DATA, CJNE_A_D, MOVC_A_ATPC, INC_DPTR]: 
                                             { wait delay (175);
                                                opcode_previus = opcode.as_a(instruction_set_t);
                                                wait delay (25);
                                             };
                                     
                                     //with one machine cycle
                                     default: { wait delay (75);
                                                opcode_previus = opcode.as_a(instruction_set_t);
                                                wait delay (25);
                                              };
                                 };
                              };
               }; //end case opcode
           }; // end while
         
         }; //end feature 3
      
      }; //end case feature
      
   }; //end reference model
   
   by_two_complement (number:uint(bits:8)) :uint(bits:8) is also {
       if (number[7:7] == 1'b1) {
          result = (~number) + 1'b1;
       } else {
       result = number;
       };
   };

//   check_psw_i (reg: uint(bits:8)) is also {
//     if (p_psw_i$ != reg) { if (verbose == 1) { out ("PSW reg ERROR - expected ---> ", reg) };
//      check that (p_psw_i$ == reg);
//   };

   check_sfr_addr_o (addr: uint(bits:8)) is also {
      if (p_sfr_addr_o$ != addr) {  out ("FSR addr ERRORRRRR - expected ---> ", addr);
                                    out ("                   - received ---> ", p_sfr_addr_o$);};
      check that (p_sfr_addr_o$ == addr);
   };
   
   check_rom_addr_o (addr: uint(bits:16)) is also {
      if (p_rom_addr_o$ != addr) {  out ("ROM addr ERRORRRRR - expected ---> ", addr );
                                    out ("                   - received ---> ", p_rom_addr_o$);};
      check that (p_rom_addr_o$ == addr);
   };
   
   check_ram_addr_o (addr: uint(bits:8)) is also {
      if (p_ram_addr_o$ != addr) {  out ("RAM addr ERRORRRRR - expected ---> ", addr);
                                    out ("                  - received ---> ", p_ram_addr_o$);};
      check that (p_ram_addr_o$ == addr);
   };
   
   check_alu_op1_o (op: uint(bits:8)) is also {
      if (p_alu_op1_o$ != op) {  out ("ALU OP1 ERRORRRRR - expected ---> ", op);
                                 out ("                  - received ---> ", p_alu_op1_o$);};
      check that (p_alu_op1_o$ == op);
   };
   
   check_alu_op2_o (op: uint(bits:8)) is also{
      if (p_alu_op2_o$ != op) {  out ("ALU OP2 ERRORRRRR - expected ---> ", op);
                                 out ("                  - received ---> ", p_alu_op2_o$);};
      check that (p_alu_op2_o$ == op);
   };
   
   check_alu_opcode_o (opcode: uint(bits:5)) is also{
      if (p_alu_opcode_o$ != opcode) {  out ("ALU OPCODE ERRORRRRR - expected ---> ", opcode); 
                                        out ("                     - received ---> ", p_alu_opcode_o$);};
      check that (p_alu_opcode_o$ == opcode); 
   };
   
   check_alu_en_o_rise () is also {
      if (p_alu_en_o$ != 1) {  out ("ALU EN ERRORRRRR")};
      check that (p_alu_en_o$ == 1);
   };
   check_alu_en_o_fall () is also{
      if (p_alu_en_o$ != 0) {  out ("ALU EN ERRORRRRR")};
      check that (p_alu_en_o$ == 0);
   };
   
   check_sfr_data_o (data: uint(bits:8)) is also {
      if (p_sfr_data_o$ != data) {
          out ("SFR data ERROR");
          out ("expected ---> ", data);
          out ("received ---> ", p_sfr_data_o$);
      };
      check that (p_sfr_data_o$ == data);
   };
   
   check_ram_data_o (data: uint(bits:8)) is also {
      if (p_ram_data_o$ != data) {  out ("RAM data ERRORRRRR - expected ---> ", data);
                                    out ("                   - received ---> ", p_ram_data_o$);};
      check that (p_ram_data_o$ == data);
   };
   
   check_ext_ram_o_rise () is also {
      if (p_fsm_ext_ram_o$ != 1) { out ("EXT RAM ERROR")};
      check that (p_fsm_ext_ram_o$ == 1);
   };
   
   check_ext_ram_o_fall () is also {
      if (p_fsm_ext_ram_o$ != 0) { out ("EXT RAM ERROR")};
      check that (p_fsm_ext_ram_o$ == 0);
   };
   
   check_byte_flag_o_rise () is also {
      if (p_bit_byte_flag_o$ != 1) { out ("BIT BYTE FLAG ERROR")};
      check that (p_bit_byte_flag_o$ == 1);
   };
   
   check_byte_flag_o_fall () is also {
      if (p_bit_byte_flag_o$ != 0) { out ("BIT BYTE FLAG ERROR")};
      check that (p_bit_byte_flag_o$ == 0);
   };
   
   check_rom_rd_o_rise () is also {
      if (p_rom_rd_o$ != 1) { out ("ROM RD FLAG ERROR")};
      check that (p_rom_rd_o$ == 1);
   };
   check_rom_rd_o_fall () is also {
      if (p_rom_rd_o$ != 0) { out ("ROM RD FLAG ERROR")};
      check that (p_rom_rd_o$ == 0);
   };
   
   check_ram_rd_o_rise () is also {
      if (p_ram_rd_o$ != 1) { out ("RAM RD FLAG ERROR");};
      check that (p_ram_rd_o$ == 1);
   };
   
   check_ram_rd_o_fall () is also {
      if (p_ram_rd_o$ != 0) { out ("RAM RD FLAG ERROR")};
      check that (p_ram_rd_o$ == 0);
   };
   
   check_sfr_rd_o_rise () is also {
      if (p_sfr_rd_o$ != 1) { out ("FSR RD FLAG ERROR")};
      check that (p_sfr_rd_o$ == 1);
   };
   
   check_sfr_rd_o_fall () is also {
      if (p_sfr_rd_o$ != 0) { out ("FSR RD FLAG ERROR")};
      check that (p_sfr_rd_o$ == 0);
   };
   
   check_ram_wr_o_rise () is also {
      if (p_ram_wr_o$ != 1) { out ("RAM WR FLAG ERROR")};
      check that (p_ram_wr_o$ == 1);
   };
   
   check_ram_wr_o_fall () is also {
      if (p_ram_wr_o$ != 0) { out ("RAM WR FLAG ERROR")};
      check that (p_ram_wr_o$ == 0);
   };
   
   check_sfr_wr_o_rise () is also {
      if (p_sfr_wr_o$ != 1) { out ("FSR WR FLAG ERROR")};
      check that (p_sfr_wr_o$ == 1);
   };
   
   check_sfr_wr_o_fall () is also {
      if (p_sfr_wr_o$ != 0) { out ("FSR WR FLAG ERROR")};
      check that (p_sfr_wr_o$ == 0);
   };
   
   check_int_na_o_rise () is also {
      if (p_int_na_o$ != 1) { out ("INT NA FLAG ERROR")};
      check that (p_int_na_o$ == 1);
   };
   
   check_int_na_o_fall () is also {
      if (p_int_na_o$ != 0) { out ("INT NA FLAG ERROR")};
      check that (p_int_na_o$ == 0);
   };
   
   check_int_rdy_o_rise () is also {
      if (p_int_rdy$ != 1) { out ("INT RDY FLAG ERROR")};
      check that (p_int_rdy$ == 1);
   };
   check_int_rdy_o_fall () is also {
      if (p_int_rdy$ != 0) { out ("INT RDY FLAG ERROR")};
      check that (p_int_rdy$ == 0);
   };
   
   ///////////////////// COVERAGE ITENS /////////////////
   event couver_state_change;
   cover couver_state_change is {
      item state;

      transition state using illegal = not (
               (prev_state == STATE_RESET      and state == STATE_DECODE_1)   or
               (prev_state == STATE_DECODE_1   and state == STATE_DECODE_2)   or
               (prev_state == STATE_DECODE_2   and state == STATE_EXECUTION)  or
               (prev_state == STATE_EXECUTION  and state == STATE_WRITE_BACK) or
               (prev_state == STATE_RESET      and state == STATE_RESET)      or
               (prev_state == STATE_WRITE_BACK and state == STATE_DECODE_1)   or
               (prev_state == STATE_WRITE_BACK and state == STATE_RESET)      or 
               (prev_state == STATE_DECODE_1   and state == STATE_RESET)      or
               (prev_state == STATE_DECODE_2   and state == STATE_RESET)      or
               (prev_state == STATE_EXECUTION  and state == STATE_RESET) 
      );
   };
   
   event couverSTATE;
   cover couverSTATE is {
      item state;
   };
};

'>
