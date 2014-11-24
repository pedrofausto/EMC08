<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : core_top_reference_model.e
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
// Keywords: core_top - core finite state machine
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

extend core_top_mon_u {
   !feature: feature_kind_t;
   !opcode: instruction_set_t; 
   
   event core_top_reset_rise is rise (p_core_reset_o$)@sim;
   event core_top_reset_fall is fall(p_core_reset_o$)@sim;
   
   reference_model() @clock_e is also {
      out ("Starting Functional Model of Core TOP Verification");
      
      var period: int = 50;
      var sfr_A: byte;
      var port_p1: byte;
      var port_p2: byte;
      var op1: byte;
      var op2: byte;
      var opr: byte;
      var op16: uint(bits:16);
      var addrx: uint(bits:16);
      var datax: byte;
    
      wait delay (2*period);
      wait @core_top_reset_rise;
      message(LOW, " >> starting loop while TRUE ");
      wait delay (period+1);
      
      while TRUE {  
               
               if (p_core_pc$ < 4096) {
               
               opcode = sys.vect_opcodes[sys.ind];
               
               //check align between reference model and DUT
               message(LOW, vt.text_style(LIGHT_YELLOW, 
               append("Ind: ", sys.ind, " |opc_rfm: ", hex(opcode.as_a(byte)), 
                                        " |opc_dut: ", hex(p_core_fsm_opcode$))));
               
               check that (opcode.as_a(byte) == p_core_fsm_opcode$);
               
               
               case opcode.as_a(instruction_set_t) {
                  NOP:        {
                              message(LOW, "-----------> RefMod: NOP");
                              wait delay (2 * period);
                              };
                  // create a instruction after this that moves data from A to P1 and check         
                  MOV_A_DATA: { // ok!
                              sfr_A = sys.vect_rom[(p_core_pc$-1)].as_a(byte); 
                              message(LOW, "-----------> RefMod: MOV_A_DATA: ", hex(sfr_A));
                              
                              // wait MOV_D_A instruction, to move data from A to port P1
                              wait delay (3 * period); 
                              port_p1 = p_core_ports_p1_o$;
                              message(LOW, "-----------> RefMod: MOV_D_A: ", hex(port_p1));
                              
                              // checking if data stored in A is in port P1
                              check that (sfr_A == port_p1);
                              wait delay (1 * period);
                              };
                  // LJMP jumps to 6 positions after actual
                  LJMP:       { //ok!
                              op1 =  sys.vect_rom[(p_core_pc$-2)].as_a(byte);
                              op2 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              op16 = (op1<<8)+op2;
                              message(LOW, "-----------> RefMod: LJMP: ", hex(op16));
                              wait delay (2 * period);
                              check that (sys.vect_rom[op16].as_a(byte) == p_core_fsm_opcode$);
                              };
                  MOV_D_DATA: { //ok!
                              if (sys.time > 550) {
                                 op1 =  sys.vect_rom[(p_core_pc$-2)].as_a(byte);
                                 op2 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                                 message(LOW, "-----------> RefMod: MOV_D_DATA: ", hex({op1; op2}));
                                 wait delay (3 * period);
                                 port_p1 = p_core_ports_p1_o$;
                                 message(LOW, "-----------> RefMod: MOV_D_D: ", hex(port_p1));
                                 wait delay (1 * period);
                                 check that (op2 == port_p1);
                                 } else { wait delay (2 * period); };
                              };
                  MOV_R0_DATA:{ 
                              //op1 =  sys.vect_rom[(p_core_pc$-2)].as_a(byte);
                              op1 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_R0_DATA: ", hex(op1));
                              wait delay (2 * period);
                              op2 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_R7_DATA: ", hex(op2));
                              wait delay (2 * period);
                              op1 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_D_R7: ", hex(op1));
                              wait delay (2 * period);
                              op1 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_A_D: ", hex(op1));
                              wait delay (2 * period);
                              opr = op2 + op2;
                              message(LOW, "-----------> RefMod: ADD_A_ATR0: ", hex(opr));
                              wait delay (2 * period);
                              if (2*op2 > opr) { opr[0:0] = 1; };
                              message(LOW, "-----------> RefMod: MOV_BIT_C: ", hex(opr));
                              wait delay (3 * period);
                              port_p1 = p_core_ports_p1_o$;
                              message(LOW, "-----------> RefMod: MOV_D_A: ", hex(port_p1));
                              wait delay (1 * period);
                              check that (opr == port_p1);
                              //wait delay (1.2 * period);
                              };
                  LCALL:      {
                              op1 =  sys.vect_rom[(p_core_pc$-2)].as_a(byte);
                              op2 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              op16 = (op1<<8)+op2;
                              message(LOW, "-----------> RefMod: LCALL: ", hex(op16));
                              wait delay (4 * period);
                              check that (sys.vect_rom[op16].as_a(byte) == p_core_fsm_opcode$);
                              wait delay (12 * period);
                              };
                              
                  MOV_R2_DATA:{
                              op1 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_R2_DATA: ", hex(op1));
                              wait delay (2 * period);
                              message(LOW, "-----------> RefMod: MOV_A_R2: ", hex(op1));
                              wait delay (2 * period);
                              op16 = p_core_pc$ + op1;
                              message(LOW, "-----------> RefMod: MOVC_A_ATPC: ", hex({p_core_pc$; op16}));
                              wait delay (5 * period);
                              opr = sys.vect_rom[(op16)].as_a(byte);
                              port_p1 = p_core_ports_p1_o$;
                              message(LOW, "-----------> RefMod: MOV_D_A: ", hex({opr; port_p1}));
                              wait delay (1 * period);
                              check that (opr == port_p1);
                              };
                 MOV_DPTR_DATA: {
                              op1 =  sys.vect_rom[(p_core_pc$-2)].as_a(byte);
                              op2 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              op16 = (op1<<8)+op2;
                              message(LOW, "-----------> RefMod: MOV_DPTR_DATA: ", hex(op16));
                              wait delay (3 * period);
                              addrx = p_core_bus_ctrl_addr_o$;
                              message(LOW, "-----------> RefMod: MOVX_A_ATDPTR: addr ", hex(addrx));
                              wait delay (1 * period);
                              port_p2 = p_core_ports_p2_o$;
                              //checking address
                              check that (addrx == op2);
                              check that (port_p2 == op1);
                              wait delay (2 * period);
                              datax = p_core_bus_ctrl_data_i$;
                              message(LOW, "-----------> RefMod: MOVX_A_ATDPTR: data ", hex(datax));
                              wait delay (1 * period);
                              port_p1 = p_core_ports_p1_o$;
                              message(LOW, "-----------> RefMod: MOV_D_A: ", hex(port_p1));
                              wait delay (1 * period);
                              //checking data
                              check that (datax == port_p1);
                              };
                              
                 MOV_R1_DATA: {
                              op1 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_R1_DATA: ", hex(op1));
                              wait delay (2 * period);
                              op2 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_R3_DATA: ", hex(op2));
                              wait delay (2 * period);
                              message(LOW, "-----------> RefMod: MOV_A_R3 ");
                              wait delay (2 * period);
                              message(LOW, "-----------> RefMod: MOVX_ATR1_A: ");
                              wait delay (0.5 * period);
                              addrx = p_core_bus_ctrl_addr_o$;
                              datax = p_core_bus_ctrl_data_o$;
                              check that (addrx == op1);
                              check that (datax == op2);
                              wait delay (1.5 * period);
                              };
                  
                 INC_A:       {
                              message(LOW, "-----------> RefMod: INC_A ");
                              op16 = p_core_pc$;
                              wait delay (2 * period);
                              op1 = p_core_fsm_opcode$;
                              message(LOW, "-----------> RefMod: LCALL Hardware: ", op1);
                              check that (op1 == 8'h12); // verify if opcode is a LCALL
                              wait delay (4 * period);
                              message(LOW, "-----------> RefMod: NOPx5 ");
                              wait delay (10 * period);
                              message(LOW, "-----------> RefMod: RETI ");
                              wait delay (2.5 * period);
                              check that (op16 == p_core_pc$); //verify retorn pc
                              wait delay (1.5 * period);
                              };
                 
                 MOV_R4_DATA: {
                              op1 =  sys.vect_rom[(p_core_pc$-1)].as_a(byte);
                              message(LOW, "-----------> RefMod: MOV_R4_DATA: ", hex(op1));
                              wait delay (0.5 * period);
                              check that (p_core_bus_ctrl_addr_o$ == p_core_pc$);
                              wait delay (1.5 * period);
                              
                              message(LOW, "-----------> RefMod: MOV_D_R4 ");
                              wait delay (0.5 * period);
                              check that (p_core_bus_ctrl_addr_o$ == p_core_pc$);
                              wait delay (1.5 * period);
                              message(LOW, "-----------> RefMod: MOV_A_R4 ");
                              wait delay (0.5 * period);
                              check that (p_core_bus_ctrl_addr_o$ == p_core_pc$);
                              wait delay (1.5 * period);
                              message(LOW, "-----------> RefMod: MUL_AB ");
                              wait delay (5 * period);
                              op16 = op1 * op1;
                              op1 = op16;
                              op2 = op16 >> 8;
                              port_p1 = p_core_ports_p1_o$;
                              message(LOW, "-----------> RefMod: MOV_D_A: ", hex(port_p1));
                              wait delay (0.5 * period);
                              check that (p_core_bus_ctrl_addr_o$ == p_core_pc$);
                              wait delay (1.5 * period);
                              check that (port_p1 == op1);
                              port_p1 = p_core_ports_p1_o$;
                              message(LOW, "-----------> RefMod: MOV_D_D: ", hex(port_p1));
                              wait delay (1 * period);
                              check that (port_p1 == op2);
                              };
                              
               
                 default:     {
                              message(LOW, "-----------> RefMod: DEFAULT");
                              wait delay (2 * period);
                              
                              };
               
               }; //case opcode feature_timers
               
          // external ROM access (jump to begin)
          } else  if (p_core_pc$ < 4096+6) {
             op16 = p_core_pc$;
             wait delay (0.5 * period);
             message(LOW, "-----------> RefMod: Ext ROM");
             check that (p_core_bus_ctrl_addr_o$ == p_core_pc$);
             wait delay (1.5 * period);
          } else {
             wait delay (2 * period);
          }; //if pc < 4096     
               
      }; // while TRUE
   }; // end reference model
     
}; //end monitor

'>
