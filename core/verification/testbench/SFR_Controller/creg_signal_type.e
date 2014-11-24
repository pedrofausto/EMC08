<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_signal_type.e
// Module Name : Core - Special Registers Controller
// Author: Lizbeth Paredes Aguilar
// E-mail: liz.paredes@gmail.com
// -----------------------------------------------------------------------------
// Review(s) : 
// -------------------------------------------------------------------
// Release History
// Version  Date        Description
// 1.0      01/09/2010  Initial Version
// 1.1      05/09/2010  
// 1.2      07/09/2010  
// -------------------------------------------------------------------
// Keywords: creg - registers controller, phy - physical
// -----------------------------------------------------------------------------
// Purpose: This class create the input signals and it constrainst to aply to
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
type creg_signal_type_kind: [ RESET,        SEQ_ACC_CORE,  SEQ_B_CORE,     SEQ_PSW_CORE, 
                              SEQ_IP_CORE,  SEQ_IE_CORE,   SEQ_RX0_CORE,   SEQ_RX1_CORE, 
                              SEQ_TX0_CORE, SEQ_TX1_CORE,  SEQ_SMAP8_CORE, SEQ_DPH_CORE,  
                              SEQ_DPL_CORE, SEQ_SP_CORE,   SEQ_TH0_CORE,   SEQ_TH1_CORE,   
                              SEQ_TM0_CORE, SEQ_TM1_CORE,  SEQ_TL0_CORE,   SEQ_TL1_CORE];
    
struct creg_signal_type like any_sequence_item {
   
   reset: 		          bit;
   
   fsm_wr_b_i:	    	    bit;
   fsm_rd_b_i:	    	    bit;
   fsm_byte_b_i:	       bit;
   fsm_addr_i:	    	    uint(bits:8);
   fsm_data_i:	    	    uint(bits:8);
  
   ext_rom_rd_i:         bit;
   ext_ram_rd_i:         bit;
   ext_ram_wr_i:         bit;
   
   alu_cy_i:	          bit;
   alu_ac_i:	          bit;
   alu_ov_i:	          bit;
   
   bus_control_p0en_i:	 uint(bits:8);
   bus_control_p0_i:     uint(bits:8);
   bus_control_p2en_i:	 uint(bits:8);
   bus_control_p2_i:     uint(bits:8);   
   bus_control_p3en_6_i: bit;  
   bus_control_p3en_7_i: bit;
   bus_control_p3_6_i:   bit;
   bus_control_p3_7_i:   bit;
   bus_control_p4_i:	    uint(bits:8);
   
   interrupt_ie0_i:      bit;
   interrupt_ie1_i:      bit;
   interrupt_tf0_i:      bit;
   interrupt_tf1_i:      bit;
   interrupt_tf2_i:      bit;
   interrupt_txrxf_i:    bit;
   interrupt_clear_i:    bit;
   
   ports_p0_i:           uint(bits:8);
   ports_p1_i:           uint(bits:8);
   ports_p2_i:           uint(bits:8);
   ports_p3_i:           uint(bits:8);
   
   serial_p3en_0:        bit;
   serial_p3en_1:        bit;
   serial_p3_0:          bit;
   serial_p3_1:          bit;
   serial_sbuf_rx:       uint(bits:8);
   serial_rb8:           bit;
   serial_ti:            bit;
   serial_ri:            bit;
 
   timers_th0_i:         uint(bits:8);
   timers_tm0_i:         uint(bits:8); 
   timers_tl0_i:         uint(bits:8);
   timers_tf0_i:         bit;
   timers_th1_i:         uint(bits:8);
   timers_tm1_i:         uint(bits:8);
   timers_tl1_i:         uint(bits:8);
   timers_tf1_i:         bit;
   timers_acrh_i:        uint(bits:8);
   timers_acrm_i:        uint(bits:8);
   timers_acrl_i:        uint(bits:8);
   timers_tacph_i:       uint(bits:2);
   timers_tacpl_i:       uint(bits:8);   
   timers_tf2_i:         bit;
   
 // In/out Ports signals 


   //Controle de registros especiais, tem 128 bit (16 bytes) de registros com funcoes especificas.
   
   // signal type
   pkt_kind: creg_signal_type_kind;
  //alguns bits sao ativos em zero como a escrita e leitura no FSM
 
  //para escrita na FSM se debe por ativa a escrita, negada a leitura e definir si esta escrita es por bit ou byte. Entrar o endereco e o dado a ser escrito.
 
//  keep  (
//    fsm_addr_i == 8'h80 or fsm_addr_i == 8'h81 or fsm_addr_i == 8'h82 or 
//    fsm_addr_i == 8'h83 or fsm_addr_i == 8'h84 or fsm_addr_i == 8'h85 or 
//    fsm_addr_i == 8'h86 or fsm_addr_i == 8'h87 or fsm_addr_i == 8'h88 or 
//    fsm_addr_i == 8'h89 or fsm_addr_i == 8'h8A or fsm_addr_i == 8'h8B or 
//    fsm_addr_i == 8'h8C or fsm_addr_i == 8'h8D or fsm_addr_i == 8'h8F or 
//    fsm_addr_i == 8'h90 or fsm_addr_i == 8'h98 or fsm_addr_i == 8'h99 or 
//    fsm_addr_i == 8'hA0 or fsm_addr_i == 8'hA8 or fsm_addr_i == 8'hAF or 
//    fsm_addr_i == 8'hB0 or fsm_addr_i == 8'hB8 or fsm_addr_i == 8'hB9 or 
//    fsm_addr_i == 8'hBA or fsm_addr_i == 8'hBB or fsm_addr_i == 8'hBC or 
//    fsm_addr_i == 8'hBD or fsm_addr_i == 8'hBE or fsm_addr_i == 8'hBF or 
//    fsm_addr_i == 8'hC0 or fsm_addr_i == 8'hC8 or fsm_addr_i == 8'hD0 or 
//    fsm_addr_i == 8'hD8 or fsm_addr_i == 8'hE0 or fsm_addr_i == 8'hE8 or 
//    fsm_addr_i == 8'hF0 or fsm_addr_i == 8'hF8 
//    );
  
  keep soft fsm_data_i in [8'b00000000..8'b11111111]; 
  keep soft reset == 1;
  
  keep (ext_rom_rd_i == 1) => (ext_ram_rd_i == 0);
  keep (ext_rom_rd_i == 1 || ext_ram_rd_i == 1) => (
     bus_control_p0en_i   == 8'h00 &&
     bus_control_p3en_6_i == 1 &&
     bus_control_p3en_7_i == 1 &&
     bus_control_p3_6_i   == 1 &&
     bus_control_p3_7_i   == 0
     );

  keep (ext_rom_rd_i == 1) => (bus_control_p2en_i == 8'hFF);    
 
  keep (ext_ram_wr_i == 1) => (
     bus_control_p0en_i   == 8'hFF &&
     bus_control_p3en_6_i == 1 &&
     bus_control_p3en_7_i == 1 &&
     bus_control_p3_6_i   == 0 &&
     bus_control_p3_7_i   == 1);
     
  keep soft ext_rom_rd_i      == select { 10: 1; 90: 0; };
  keep soft ext_ram_rd_i      == select { 10: 1; 90: 0; };
  keep soft ext_ram_wr_i      == select { 10: 1; 90: 0; };
 
keep (pkt_kind == RESET) => 
   (
      reset                == 0 &&
      fsm_wr_b_i           == 1 &&
      fsm_rd_b_i           == 1 &&
      fsm_byte_b_i         == 1 &&
//      fsm_addr_i         == 0 &&
      fsm_data_i           == 0 &&
     
      
      ext_rom_rd_i         == 0 &&
      ext_ram_rd_i         == 0 &&
      ext_ram_wr_i         == 0 &&
      
      alu_cy_i             == 0 &&
      alu_ac_i             == 0 &&
      alu_ov_i             == 0 &&
      
      bus_control_p0en_i   == 0 &&
      bus_control_p0_i     == 0 &&
      bus_control_p2en_i   == 0 &&
      bus_control_p2_i     == 0 &&
      bus_control_p3en_6_i == 0 &&
      bus_control_p3en_7_i == 0 &&
      bus_control_p3_6_i   == 0 &&
      bus_control_p3_7_i   == 0 &&
      bus_control_p4_i     == 0 &&
      
      interrupt_ie0_i      == 0 &&
      interrupt_ie1_i      == 0 &&
      interrupt_tf0_i      == 0 &&
      interrupt_tf1_i      == 0 &&
      interrupt_tf2_i      == 0 &&
      interrupt_txrxf_i    == 0 &&
      interrupt_clear_i    == 0 &&
      
      ports_p0_i           == 0 &&
      ports_p1_i           == 0 &&
      ports_p2_i           == 0 &&
      ports_p3_i           == 0 &&
      
      serial_p3en_0        == 0 &&
      serial_p3en_1        == 0 &&
      serial_p3_0          == 0 &&
      serial_p3_1          == 0 &&
      serial_sbuf_rx       == 0 &&
      serial_rb8           == 0 &&
      serial_ti            == 0 &&
      serial_ri            == 0 &&
      
      timers_th0_i         == 0 &&
      timers_tm0_i         == 0 &&
      timers_tl0_i         == 0 &&
      timers_tf0_i         == 0 &&
      timers_th1_i         == 0 &&
      timers_tm1_i         == 0 &&
      timers_tl1_i         == 0 &&
      timers_tf1_i         == 0 &&
      timers_acrh_i        == 0 &&
      timers_acrm_i        == 0 &&
      timers_acrl_i        == 0 &&
      timers_tacph_i       == 0 &&
      timers_tacpl_i       == 0 &&
      timers_tf2_i         == 0 
   );
 

//...1
  keep (pkt_kind == SEQ_ACC_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hE0);  
//...2
  keep (pkt_kind == SEQ_B_CORE)     => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hF0);
//...3 
  keep (pkt_kind == SEQ_PSW_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hD0); 
//...4
  keep (pkt_kind == SEQ_IP_CORE)    => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hB8);
//...5
  keep (pkt_kind == SEQ_IE_CORE)    => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hA8);
//...6  
  keep (pkt_kind == SEQ_RX0_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hBD); 
//...7
  keep (pkt_kind == SEQ_RX1_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 1 &&
                                        fsm_addr_i    == 8'hBC);  
//...8
  keep (pkt_kind == SEQ_TX0_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hBF);
//...9
  keep (pkt_kind == SEQ_TX1_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 1 &&
                                        fsm_addr_i    == 8'hBE);
//...10
  keep (pkt_kind == SEQ_SMAP8_CORE) => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'hB9);
//...11
  keep (pkt_kind == SEQ_DPH_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h83);
//...12
  keep (pkt_kind == SEQ_DPL_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h82);
//...13
  keep (pkt_kind == SEQ_SP_CORE)    => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h81);
//...14 
  keep (pkt_kind == SEQ_TH0_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h8C); 
//...15
  keep (pkt_kind == SEQ_TH1_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h8D);
//...16
  keep (pkt_kind == SEQ_TM0_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h8E);
//...17
  keep (pkt_kind == SEQ_TM1_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h8F);
//...18
  keep (pkt_kind == SEQ_TL0_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h8A);
//...19
  keep (pkt_kind == SEQ_TL1_CORE)   => (fsm_wr_b_i    == 0 && 
                                        fsm_rd_b_i    == 1 && 
                                        fsm_byte_b_i  == 0 &&
                                        fsm_addr_i    == 8'h8B);
 
    
   post_generate() is also {
      //messagef(LOW, "%d %d %d %d", hit, stay, card, reset); // example
   };
};

'>
