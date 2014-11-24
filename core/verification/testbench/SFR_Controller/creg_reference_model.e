<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : creg_reference_model.e
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
// Keywords: creg - registers controller
// -----------------------------------------------------------------------------
// Purpose: Reference model to the Special Registers Controller sub-block of the core block. 
// This model reproduce the behaviour in the specification. According to this reference 
// model the DUT will be verified.
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
// Include Files: creg_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

//parameters define 
//import creg_reg_ctrl_defines;


extend creg_mon_u {
  
   feature1_1_cover:  bool; // 
   feature1_2_cover:  bool; // wr bus control (writte mem ram)
   feature1_3_cover:  bool; // wr of the ports 
   feature1_4_cover:  bool; // serial wr 
   feature1_5_cover:  bool; // serial rd
   feature1_6_cover:  bool; // interrupt wr
   feature1_7_cover:  bool; // interrupt rd
   feature1_8_cover:  bool; // timer0 wr
   feature1_9_cover:  bool; // timer0 rd
   feature1_10_cover: bool; // timer1 wr
   feature1_11_cover: bool; // timer1 rd
   feature1_12_cover: bool; // timer2 wr
   feature1_13_cover: bool; // timer2 rd
   feature1_14_cover: bool; // writte core
   feature1_15_cover: bool; // read core   
   feature1_16_cover: bool; // timer1 wr
   feature1_17_cover: bool; // timer1 rd
   feature1_18_cover: bool; // timer2 wr
   feature1_19_cover: bool; // timer2 rd
      
   keep feature1_1_cover  == FALSE;
   keep feature1_2_cover  == FALSE;
   keep feature1_3_cover  == FALSE;
   keep feature1_4_cover  == FALSE;
   keep feature1_5_cover  == FALSE;
   keep feature1_6_cover  == FALSE;
   keep feature1_7_cover  == FALSE;
   keep feature1_8_cover  == FALSE;
   keep feature1_9_cover  == FALSE;
   keep feature1_10_cover == FALSE;
   keep feature1_11_cover == FALSE;
   keep feature1_12_cover == FALSE;
   keep feature1_13_cover == FALSE;
   keep feature1_14_cover == FALSE;
   keep feature1_15_cover == FALSE;
   keep feature1_16_cover == FALSE;
   keep feature1_17_cover == FALSE;
   keep feature1_18_cover == FALSE;
   keep feature1_19_cover == FALSE;
   
!temp_data: uint(bits:8);
!temp_data_read: uint(bits:8);
!temp_addr: uint(bits:8);


data_mask (data_current: byte, data_prev:byte, mask: byte): byte is {
   for i from 0 to 7 do
   {
      if (mask[i:i] == 0) {
         result[i:i] = data_prev[i:i];
      } else {
         result[i:i] = data_current[i:i]; };
   };
};

//cheker_wr_fsm (data:uint(bits:8)) is {

            
//};

reference_model() @clock_e is also {
      
      var data_masked   : byte;
      var data          : byte;
      var data_ant      : byte;
      var fsm_no_rd_wr  : bool;
      
      //wait @reset_rise;
      if (sys.time > 200) {
       
      out ("Starting Reference Model");

      //verifynig if fsm is using SFR
      if (FSM_WR_I_p$ == 1 and FSM_RD_I_p$ == 1) {
         fsm_no_rd_wr = TRUE;
      } else {
         fsm_no_rd_wr = FALSE;
      };
//        wait cycle;
        
        
        //feature 1_1   // escrita e leitura dos registros, um a um          
       // ACC Core Write ---reg36 ########################################################
      if (FSM_ADDR_I_p$ == `ACC and FSM_WR_I_p$ == 0){
         out("--------> Check ACC core write");
         if (FSM_BYTE_I_p$ == 0) { 
               data = FSM_DATA_I_p$;
               wait cycle; 
               wait delay (1); 
               
               message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
               
               for i from 0 to 7 do {
                  if (`ACC_MASK[i:i] == 1) {
                  check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");  
                  };
               };  
               feature1_1_cover = TRUE ;
                     emit cover_feature1_1;
                     wait cycle;
            };
//           else { 
//                data = FSM_DATA_I_p$;
//                wait cycle; 
//                wait delay (1); 
//                
//                message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
//                for i from 0 to 7 do {
//                   if (`ACC_MASK[i:i] == 1) {
//                   check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");  
//                   };
//                };  
//                feature1_1_cover = TRUE ;
//                      emit cover_feature1_1;
//                      wait cycle;
//             };
          };         
      // END ACC Core Write ########################################################    
      
      //feature 1_2   
      // `B Core read ---reg 38 ##########################################################
      if (FSM_ADDR_I_p$ == `B and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check B core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);
                
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`B_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");  
               };
            };  
            feature1_2_cover = TRUE ;
                  emit cover_feature1_2;
                  wait cycle;
      };
      // END `B Core Write ########################################################
  
       

      //feature 1_3   
      // PSW Core read ---reg36  `PSW_MASK=8'b11111100; ##########################################################
      if (FSM_ADDR_I_p$ == `PSW and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check PSW core write");
            data_ant=FSM_DATA_0_p$
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);   
             
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`PSW_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
               else{
               check that (data_ant[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_3_cover = TRUE ;
                  emit cover_feature1_3;
                  wait cycle;
      };
      // END PSW Core Write ########################################################
          
      //feature 1_4
      // IP Core read ---reg 24  ##########################################################
      if (FSM_ADDR_I_p$ == `IP and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check IP core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
           
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_4_cover = TRUE ;
                  emit cover_feature1_4;
                  wait cycle;
      };
      // END IP Core Write ########################################################
      
      //feature 1_5   
      // IE Core read  ---reg 21 ##########################################################
      if (FSM_ADDR_I_p$ == `IE and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check IE core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
           for i from 0 to 7 do {
               if (`IE_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_5_cover = TRUE ;
                  emit cover_feature1_5;
                  wait cycle;
      };
      // END IE Core Write ########################################################
      
      //feature 1_6
      // RX0 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `RX0 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check RX0 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_6_cover = TRUE ;
                  emit cover_feature1_6;
                  wait cycle;
      };
      // END RX0 Core Write ########################################################
      
      //feature 1_7
      // RX1 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `RX1 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check RX1 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_7_cover = TRUE ;
                  emit cover_feature1_7;
                  wait cycle;
      };
      // END RX1 Core Write ########################################################
      
      //feature 1_8
      // TX0 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TX0 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TX0 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_8_cover = TRUE ;
                  emit cover_feature1_8;
                  wait cycle;
      };
      // END TX0 Core Write ########################################################
  
         
      //feature 1_9
      // TX1 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TX1 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TX1 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_9_cover = TRUE ;
                  emit cover_feature1_9;
                  wait cycle;
      };
      // END TX1 Core Write ########################################################
      
      //feature 1_10
      // SMAP8 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `SMAP8 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check SMAP8 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_10_cover = TRUE ;
                  emit cover_feature1_10;
                  wait cycle;
      };
      // END SMAP8 Core Write ########################################################
      
      //feature 1_11
      // DPH Core read ##########################################################
      if (FSM_ADDR_I_p$ == `DPH and FSM_WR_I_p$ == 0){
         if ( FSM_BYTE_I_p$ == 0){
            out("--------> Check DPH core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
               
            feature1_11_cover = TRUE ;
            
            emit cover_feature1_11;
            wait cycle;
         }
         else {                 
            out("--------> Check P0 core read");
            data = PORTS_P0_O_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            check that (FSM_DATA_O_p$ == data ) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
            
               
            feature1_11_cover = TRUE ;
            
            emit cover_feature1_11;
            wait cycle;
         };
      }; //end do IF prisipal
      // END DPH Core Write ########################################################
      
      //feature 1_12
      // DPL Core read ##########################################################
      if (FSM_ADDR_I_p$ == `DPL and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check DPL core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_12_cover = TRUE ;
                  emit cover_feature1_12;
                  wait cycle;
      };
      // END DPL Core Write ########################################################
      
      //feature 1_13
      // SP Core read ##########################################################
      if (FSM_ADDR_I_p$ == `SP and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check SP core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
              };
            }; 
            
            feature1_13_cover = TRUE ;
                  emit cover_feature1_13;
                  wait cycle;
      };
      // END SP Core Write ########################################################
      
      //feature 1_14
      // TH0 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TH0 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TH0 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_14_cover = TRUE ;
                  emit cover_feature1_14;
                  wait cycle;
      };
      // END TH0 Core Write ########################################################
      
      //feature 1_15
      // TH1 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TH1 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TH1 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_15_cover = TRUE ;
                  emit cover_feature1_15;
                  wait cycle;
      };
      // END TH1 Core Write ########################################################
      
      //feature 1_16
      // TM0 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TM0 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TM0 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_16_cover = TRUE ;
                  emit cover_feature1_16;
                  wait cycle;
      };
      // END TM0 Core Write ########################################################
      
      //feature 1_17
      // TM1 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TM1 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TM1 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_17_cover = TRUE ;
                  emit cover_feature1_17;
                  wait cycle;
      };
      // END TM1 Core Write ########################################################
      
      //feature 1_18
      // TL0 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TL0 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TL0 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            
            feature1_18_cover = TRUE ;
                  emit cover_feature1_18;
                  wait cycle;
      };
      // END TL0 Core Write ########################################################
      
      
      //feature 1_19
      // TL1 Core read ##########################################################
      if (FSM_ADDR_I_p$ == `TL1 and FSM_WR_I_p$ == 0) 
         {
            out("--------> Check TL1 core write");
            data = FSM_DATA_I_p$;
            wait cycle; 
            wait delay (1);    
            
            message(LOW,"FSM_DATA_O_p$: " , FSM_DATA_O_p$ , "-------- data_anterior ", data );
            for i from 0 to 7 do {
               if (`IP_MASK[i:i] == 1) {
               check that (data[i:i] == FSM_DATA_O_p$[i:i]) else dut_error("[",sys.time,"] DUT Error: diferente data in --- out");
               };
            };
            feature1_19_cover = TRUE ;
                  emit cover_feature1_19;
                  wait cycle;
      };
      // END TL1 Core Write ########################################################
             
       
       
       
      
      
      
           //wait cycle;
     }; // end if sys.time
     
     wait cycle;
  }; //end reference_model
         
     event cover_feature1_1;
     cover cover_feature1_1 is {
            //item feature1_cover;
            item feature1_1_cover_cov: bool = feature1_1_cover using illegal = (feature1_1_cover_cov == FALSE);
     };
     
     event cover_feature1_2;
     cover cover_feature1_2 is {
         item feature1_2_cover_cov: bool = feature1_2_cover using illegal = (feature1_2_cover_cov == FALSE);
     };
    
     event cover_feature1_3;
     cover cover_feature1_3 is {
         item feature1_3_cover_cov: bool = feature1_3_cover using illegal = (feature1_3_cover_cov == FALSE);
     };
     
     event cover_feature1_4;
     cover cover_feature1_4 is {
         item feature1_4_cover_cov: bool = feature1_4_cover using illegal = (feature1_4_cover_cov == FALSE);
     };
     
     event cover_feature1_5;
     cover cover_feature1_5 is {
         item feature1_5_cover_cov: bool = feature1_5_cover using illegal = (feature1_5_cover_cov == FALSE);
     };
     
      event cover_feature1_6;
     cover cover_feature1_6 is {
         item feature1_6_cover_cov: bool = feature1_6_cover using illegal = (feature1_6_cover_cov == FALSE);
     };
   
       event cover_feature1_7;
     cover cover_feature1_7 is {
         item feature1_7_cover_cov: bool = feature1_7_cover using illegal = (feature1_7_cover_cov == FALSE);
     };
     
      event cover_feature1_8;
     cover cover_feature1_8 is {
         item feature1_8_cover_cov: bool = feature1_8_cover using illegal = (feature1_8_cover_cov == FALSE);
     };
     
     event cover_feature1_9;
     cover cover_feature1_9 is {
         item feature1_9_cover_cov: bool = feature1_9_cover using illegal = (feature1_9_cover_cov == FALSE);
     };
     
       event cover_feature1_10;
     cover cover_feature1_10 is {
         item feature1_10_cover_cov: bool = feature1_10_cover using illegal = (feature1_10_cover_cov == FALSE);
     };
     
     event cover_feature1_11;
     cover cover_feature1_11 is {
         item feature1_11_cover_cov: bool = feature1_11_cover using illegal = (feature1_11_cover_cov == FALSE);
     };
     
      event cover_feature1_12;
     cover cover_feature1_12 is {
         item feature1_12_cover_cov: bool = feature1_12_cover using illegal = (feature1_12_cover_cov == FALSE);
     };
   
       event cover_feature1_13;
     cover cover_feature1_13 is {
         item feature1_13_cover_cov: bool = feature1_13_cover using illegal = (feature1_13_cover_cov == FALSE);
     };
     
      event cover_feature1_14;
     cover cover_feature1_14 is {
         item feature1_14_cover_cov: bool = feature1_14_cover using illegal = (feature1_14_cover_cov == FALSE);
     };
     
     event cover_feature1_15;
     cover cover_feature1_15 is {
         item feature1_15_cover_cov: bool = feature1_15_cover using illegal = (feature1_15_cover_cov == FALSE);
     }; 

     
           event cover_feature1_16;
     cover cover_feature1_16 is {
         item feature1_16_cover_cov: bool = feature1_16_cover using illegal = (feature1_16_cover_cov == FALSE);
     };
     
     event cover_feature1_17;
     cover cover_feature1_17 is {
         item feature1_17_cover_cov: bool = feature1_17_cover using illegal = (feature1_17_cover_cov == FALSE);
     }; 

     
           event cover_feature1_18;
     cover cover_feature1_18 is {
         item feature1_18_cover_cov: bool = feature1_18_cover using illegal = (feature1_18_cover_cov == FALSE);
     };
     
     event cover_feature1_19;
     cover cover_feature1_19 is {
         item feature1_19_cover_cov: bool = feature1_19_cover using illegal = (feature1_19_cover_cov == FALSE);
     }; 

           
    }; // end monitor
'>
