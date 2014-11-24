<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : int_functional_model.e
// Module Name : Interrupt
// Author : Vinicius Amaral
// E-mail : correioamaral at gmail.com
// -----------------------------------------------------------------------------
// Review(s) :
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 0.1      01-09-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: int - interrupt
// -----------------------------------------------------------------------------
// Purpose: Reference model to the Baud Rate block. This model reproduce the
// behaviour in the specification. According to this reference model the DUT 
// will be verified
// -----------------------------------------------------------------------------
// Parameters
// Parameter name: Range: Description: Default: Units
//
// -----------------------------------------------------------------------------
// Reuse Issues
// External Pins Required: none
// Monitors Required: none
// Drivers Required: none
// Local Functions: functional_model()
// Include Files: int_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------

   define `INT_NONE           3'd0;
   define `INT_IE0            3'd1; 
   define `INT_TF0            3'd2; 
   define `INT_IE1            3'd3; 
   define `INT_TF1            3'd4; 
   define `INT_TF2            3'd5; 
   define `INT_RI_TI          3'd6; 
   define `INT_TXRX           3'd7; 
   
                                      
extend int_mon_u {
   
   feature_f1_v1: feature_f1_v1_t;
   feature_f1_v2: feature_f1_v2_t;
   feature_f2_v1: feature_f2_v1_t;
   feature_f3_v1: feature_f3_v1_t;
   feature_f4_v1: feature_f4_v1_t;
   feature: feature_t;

   !int_prev:    interrupt_t;
   !int_current: interrupt_t;
   !int_prev_priority:    interrupt_priority_t;
   !int_current_priority: interrupt_priority_t;
   intx0: uint(bits:4);
   intx1: uint(bits:4);
   level_transition_x0: bit;
   level_transition_x1: bit;
   level_transition_prev_x0: bit;
   level_transition_prev_x1: bit;
   keep intx0 == 4'b1010;
   keep intx1 == 4'b1010;
   keep level_transition_x0 == 1;
   keep level_transition_x1 == 1;
   keep level_transition_prev_x0 == 1;
   keep level_transition_prev_x1 == 1;   
   
   //events
   event test_e;
   event cover_func_model;
   event reg_clr_e    is rise (REG_CLR_o_p$)@sim; 
   event cm_fall_e    is fall (INT_CM_i_p$)@sim;
   event reset_rise   is rise (RESET_i_p$)@sim;
   event reset_fall   is fall (RESET_i_p$)@sim;
   
   current_interrupt(interrupt: interrupt_t, priority: interrupt_priority_t) is {
      int_prev             = int_current;
      int_current          = interrupt;
      int_prev_priority    = int_current_priority;
      int_current_priority = priority;
   };

   finished_interrupt() is {
      int_current = int_prev;
      int_prev    = NONE;
      int_current_priority = int_prev_priority;
      int_prev_priority    = PRIORITY_NONE;      
   };   
   
   int_print() is {
      message(HIGH, "-------------------------------------------->>>> ", feature_f2_v1); 
      out("int_current: ", int_current, "| ", int_current_priority); 
      out("int_prev: ",int_prev, "| ", int_prev_priority); 
      out("-"); 
   };

   functional_model() @clock_e is also {
   
      message(LOW, "Starting Functional Model - feature: ", feature);
      
      
// FEATURE_F1_V1 ###############################################################      
      if (feature == FEATURE_F1_V1) {

         wait delay(10);   
         if (REG_IE_i_p$[7:7] == 1'b0) { // All interrupts disabled
         
            if (INT_VECT_o_p$     == `INT_NONE and REG_CLR_o_p$   == 1'b0 
                and REG_TCON_o_p$ == 0         and REG_TCON2_o_p$ == 0) {
               //out("FEATURE_F1_V1 <------------ OK");
               feature_f1_v1 = INT_NONE_OK;
                     
            } else {
               message(HIGH, "FEATURE_F1_V1 <----------- ERROR", 
               " |INT_VECT: ",INT_VECT_o_p$, " |CLR: "  ,REG_CLR_o_p$, 
               " |TCON: "    ,REG_TCON_o_p$, " |TCON2: ",REG_TCON2_o_p$);
               feature_f1_v1 = INT_NONE_ERROR;
            };
         } else {
            feature_f1_v1 = INT_OTHER;
         };
         emit cover_func_model;
         wait delay(40);   
      }; // end feature

// FEATURE_F1_V2 ###############################################################      
      if (feature == FEATURE_F1_V2) {
          
         wait delay(10);   
         // interrupt TXRX disabled
         if (REG_IE_i_p$[6:6] == 0) { 
            if (INT_VECT_o_p$  != `INT_TXRX and ((REG_CLR_o_p$ == 0) or 
            (REG_CLR_o_p$ == 1 and REG_TCON2_i_p$[1:1] == REG_TCON2_o_p$[1:1]))) 
            { 
               feature_f1_v2 = INT_TXRX_OK;
            } else {                          
               feature_f1_v2 = INT_TXRX_ERROR;
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2); 
            };
            emit cover_func_model;
            wait delay(1);
         };
         
         // interrupt ET2 disabled (TIMER 2)
         if (REG_IE_i_p$[5:5] == 0) { 
            if (INT_VECT_o_p$ != `INT_TF2 and ((REG_CLR_o_p$ == 0) or 
            (REG_CLR_o_p$ == 1 and REG_TCON2_i_p$[0:0] == REG_TCON2_o_p$[0:0])))
            { 
               feature_f1_v2 = INT_TF2_OK;
            } else {                         
               feature_f1_v2 = INT_TF2_ERROR;
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2); 
            };
            emit cover_func_model;
            wait delay(1);
         };
         
         // interrupt ES disabled (SERIAL)
        if (REG_IE_i_p$[4:4] == 0) { 
            if (INT_VECT_o_p$ != `INT_RI_TI) 
            { 
               feature_f1_v2 = INT_RI_TI_OK;
            } else {                           
               feature_f1_v2 = INT_RI_TI_ERROR; 
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2);
            };
            emit cover_func_model;
            wait delay(1);
        };
            
        // interrupt TF1 disabled (TIMER 1)
        if (REG_IE_i_p$[3:3] == 0) { 
            if (INT_VECT_o_p$ != `INT_TF1 and ((REG_CLR_o_p$ == 0) or 
            (REG_CLR_o_p$ == 1 and REG_TCON_i_p$[5:5] == REG_TCON_o_p$[3:3])))
            { 
               feature_f1_v2 = INT_TF1_OK;
            } else {                         
               feature_f1_v2 = INT_TF1_ERROR;
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2); 
            };
            emit cover_func_model;
            wait delay(1);
        };
            
        // interrupt EX1 disabled (EXTERNAL 1)
        if (REG_IE_i_p$[2:2] == 0) { 
            if (INT_VECT_o_p$ != `INT_IE1 and ((REG_CLR_o_p$ == 0) or 
            (REG_CLR_o_p$ == 1 and REG_TCON_i_p$[3:3] == REG_TCON_o_p$[1:1])))
            { 
               feature_f1_v2 = INT_IE1_OK;
            } else {                         
               feature_f1_v2 = INT_IE1_ERROR;
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2);
            };
            emit cover_func_model;
            wait delay(1);
        };
        
        // interrupt ET0 disabled (TIMER 0)
        if (REG_IE_i_p$[1:1] == 0) { 
            if (INT_VECT_o_p$ != `INT_TF0 and ((REG_CLR_o_p$ == 0) or 
            (REG_CLR_o_p$ == 1 and REG_TCON_i_p$[4:4] == REG_TCON_o_p$[2:2])))
            { 
               feature_f1_v2 = INT_TF0_OK;
            } else {                         
               feature_f1_v2 = INT_TF0_ERROR;
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2);
            };
            emit cover_func_model;
            wait delay(1);
        };
       
        // interrupt EX0 disabled (EXTERNAL 0)
        if (REG_IE_i_p$[0:0] == 0) { 
            if (INT_VECT_o_p$ != `INT_IE0 and ((REG_CLR_o_p$ == 0) or 
            (REG_CLR_o_p$ == 1 and REG_TCON_i_p$[1:1] == REG_TCON_o_p$[0:0])))
            { 
               feature_f1_v2 = INT_IE0_OK;
            } else {                         
               feature_f1_v2 = INT_IE0_ERROR;
               message(LOW, "--------------------- ERROR: >> ", feature_f1_v2);
            };
            emit cover_func_model;
            wait delay(1);
        };
        //wait delay(40);   
         
      }; // end feature
       
// FEATURE_F2_V1 ###############################################################      
      if (feature == FEATURE_F2_V1) {
      // all interrupts are enabled on this verification
         
         wait delay(10);   
      
         // interrupt vector not accept OR interrupt rotine finished
         if (INT_NA_i_p$ == 1 or INT_RDY_p$ == 1) { 
            finished_interrupt();
            message(HIGH, "NA/RDY FLAG! --------------------------<<<<< NA/RDY ");
            int_print();
         };
         wait delay(60);
         emit test_e;
//         out("leaving first of 2");
                   

// IE0 Priority 1 --------------------------------------------------------------            
         if (        FLAG_IE0_p$      == 1              and 
                     REG_IP_i_p$[0:0] == 1              and 
                     int_current_priority != PRIORITY_1   ) 
         {
            if (INT_VECT_o_p$ == `INT_IE0) { 
               feature_f2_v1 = INT_IE0_OK;
               current_interrupt(IE0, PRIORITY_1);
               int_print();
                             
            } else {                         
               feature_f2_v1 = INT_IE0_ERROR; 
               int_print();
            };

// TF0 Priority 1 --------------------------------------------------------------            
         } else if ( FLAG_TF0_p$      == 1              and 
                     REG_IP_i_p$[1:1] == 1              and 
                     int_current_priority != PRIORITY_1   ) 
         {
            if (INT_VECT_o_p$ == `INT_TF0) { 
               feature_f2_v1 = INT_TF0_OK;
               current_interrupt(TF0, PRIORITY_1);   
               int_print();
                                             
            } else {                         
               feature_f2_v1 = INT_TF0_ERROR;
               int_print();
            };        

// IE1 Priority 1 --------------------------------------------------------------            
         } else if ( FLAG_IE1_p$      == 1              and 
                     REG_IP_i_p$[2:2] == 1              and 
                     int_current_priority != PRIORITY_1   )
         {
            if (INT_VECT_o_p$ == `INT_IE1) { 
               feature_f2_v1 = INT_IE1_OK;
               current_interrupt(IE1, PRIORITY_1);
               int_print();
            } else {                         
               feature_f2_v1 = INT_IE1_ERROR; 
               int_print();
            };
         
// TF1 Priority 1 --------------------------------------------------------------            
         } else if ( FLAG_TF1_p$      == 1              and 
                     REG_IP_i_p$[3:3] == 1              and 
                     int_current_priority != PRIORITY_1   )
         {
            if (INT_VECT_o_p$ == `INT_TF1) { 
               feature_f2_v1 = INT_TF1_OK;
               current_interrupt(TF1, PRIORITY_1);
               int_print();
                                                
            } else {                         
               feature_f2_v1 = INT_TF1_ERROR; 
               int_print();
            };
         
// TF2 Priority 1 --------------------------------------------------------------            
         } else if ( FLAG_TF2_p$      == 1              and 
                     REG_IP_i_p$[5:5] == 1              and 
                     int_current_priority != PRIORITY_1   )
         {
            if (INT_VECT_o_p$ == `INT_TF2) { 
               feature_f2_v1 = INT_TF2_OK;
               current_interrupt(TF2, PRIORITY_1); 
               int_print();                                
            } else {                         
               feature_f2_v1 = INT_TF2_ERROR; 
               int_print(); 
            };
         
// RI_TI Priority 1 ------------------------------------------------------------            
         } else if ( FLAG_RI_TI_p$    >  0              and 
                     REG_IP_i_p$[4:4] == 1              and 
                     int_current_priority != PRIORITY_1   )
         {
            if (INT_VECT_o_p$ == `INT_RI_TI) { 
               feature_f2_v1 = INT_RI_TI_OK;
               current_interrupt(RI_TI, PRIORITY_1);
               int_print();
                                                
            } else {                         
               feature_f2_v1 = INT_RI_TI_ERROR; 
               int_print();
            };   
                     
// TXRX Priority 1 -------------------------------------------------------------           
         } else if ( FLAG_TXRX_p$     == 1              and 
                     REG_IP_i_p$[6:6] == 1              and 
                     int_current_priority != PRIORITY_1   )
         {
            if (INT_VECT_o_p$ == `INT_TXRX) { 
               feature_f2_v1 = INT_TXRX_OK;
               current_interrupt(TXRX, PRIORITY_1);
               int_print();                                 
            } else {                         
               feature_f2_v1 = INT_TXRX_ERROR; 
               int_print();
            };           
         
// IE0 Priority 0 --------------------------------------------------------------            
         } else if (FLAG_IE0_p$ == 1 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_IE0) { 
               feature_f2_v1 = INT_IE0_OK;
               current_interrupt(IE0, PRIORITY_0);
               int_print();
                                                
            } else {                         
               feature_f2_v1 = INT_IE0_ERROR; 
               int_print();
            }; 
            
// TF0 Priority 0 --------------------------------------------------------------            
         } else if (FLAG_TF0_p$ == 1 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_TF0) { 
               feature_f2_v1 = INT_TF0_OK;
               current_interrupt(TF0, PRIORITY_0); 
               int_print();
                                               
            } else {                         
               feature_f2_v1 = INT_TF0_ERROR; 
               int_print();
            }; 
            
// IE1 Priority 0 --------------------------------------------------------------            
         } else if (FLAG_IE1_p$ == 1 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_IE1) { 
               feature_f2_v1 = INT_IE1_OK;
               current_interrupt(IE1, PRIORITY_0);
               int_print();
                                                
            } else {                         
               feature_f2_v1 = INT_IE1_ERROR; 
               int_print();
            }; 

// TF1 Priority 0 --------------------------------------------------------------            
         } else if (FLAG_TF1_p$ == 1 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_TF1) { 
               feature_f2_v1 = INT_TF1_OK;
               current_interrupt(TF1, PRIORITY_0); 
               int_print();
                                               
            } else {                         
               feature_f2_v1 = INT_TF1_ERROR; 
               int_print();
            };                 

// TF2 Priority 0 --------------------------------------------------------------            
         } else if (FLAG_TF2_p$ == 1 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_TF2) { 
               feature_f2_v1 = INT_TF2_OK;
               current_interrupt(TF2, PRIORITY_0); 
               int_print();
                                               
            } else {                         
               feature_f2_v1 = INT_TF2_ERROR; 
               int_print();
            };             

// RI_TI Priority 0 -----------------------------------------------------------            
         } else if (FLAG_RI_TI_p$ > 0 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_RI_TI) { 
               feature_f2_v1 = INT_RI_TI_OK;
               current_interrupt(RI_TI, PRIORITY_0); 
               int_print();
                                               
            } else {                         
               feature_f2_v1 = INT_RI_TI_ERROR; 
               int_print();
            }; 

// TXRX Priority 0 ------------------------------------------------------------            
         } else if (FLAG_TXRX_p$ == 1 and int_current_priority == PRIORITY_NONE) {
            if (INT_VECT_o_p$ == `INT_TXRX) { 
               feature_f2_v1 = INT_TXRX_OK;
               current_interrupt(TXRX, PRIORITY_0);
               int_print();
                                                
            } else {                         
               feature_f2_v1 = INT_TXRX_ERROR; 
               int_print();
            };             

// NONE  -----------------------------------------------------------------------         
         } else {
            if (INT_VECT_o_p$ == `INT_NONE) {
               feature_f2_v1 = INT_NONE_OK;
            } else {
               feature_f2_v1 = INT_NONE_ERROR;
            };
         };

         emit cover_func_model;
         
      
      }; // end feature --
      
      
// FEATURE_F3_V1 ###############################################################      
      if (feature == FEATURE_F3_V1) {
      
         wait delay(10); emit test_e;  
         message(LOW, " -> IT0  : ", level_transition_x0, " |prev: ", level_transition_prev_x0);
         message(LOW, " -> INTX0: ", intx0[3:2], " | ", intx0[1:0]);
         message(LOW, " -> IE0  : ", REG_TCON_o_p$[0:0]);
         message(LOW, " -> CLR  : ",  REG_CLR_o_p$);
         message(LOW, " -> IT1  : ", level_transition_x1, " |prev: ", level_transition_prev_x1);
         message(LOW, " -> INTX1: ", intx1[3:2], " | ", intx1[1:0]);
         message(LOW, " -> IE1  : ", REG_TCON_o_p$[1:1]);
         message(LOW, " -> CLR  : ",  REG_CLR_o_p$);
            
            //INT0 - checking LEVEL external interrupt: 2 samples in 0
            if (intx0 == 2'b00 and level_transition_x0 == 0) {
          
               if ((REG_TCON_o_p$[0:0] == 1 and REG_CLR_o_p$ == 1) or 
                   (REG_TCON_i_p$[1:1] == 1 and REG_CLR_o_p$ == 0)) {
                  feature_f3_v1 = IE0_LEVEL_OK;
               } else {
                  feature_f3_v1 = IE0_LEVEL_ERROR;
                  message(LOW, "-------------------------> ", feature_f3_v1)
               };
               emit cover_func_model;
            };
            
            //INT0 - checking TRANSITION external interrupt: 1 1 0 0
            if (intx0[3:2] == 2'b11 and intx0[1:0] == 2'b00 
                and level_transition_x0 == 1 and level_transition_prev_x0 == 1) {
          
               if ((REG_TCON_o_p$[0:0] == 1 and REG_CLR_o_p$ == 1) or 
                   (REG_TCON_i_p$[1:1] == 1 and REG_CLR_o_p$ == 0)) {
                  feature_f3_v1 = IE0_TRANSITION_OK;
               } else {
                  feature_f3_v1 = IE0_TRANSITION_ERROR;
                  message(LOW, "-------------------------> ", feature_f3_v1)
               };
               emit cover_func_model;
            };
         
            //INT1 - checking LEVEL external interrupt: 2 samples in 0
            if (intx1 == 2'b00 and level_transition_x1 == 0) {
          
               if ((REG_TCON_o_p$[1:1] == 1 and REG_CLR_o_p$ == 1) or 
                   (REG_TCON_i_p$[3:3] == 1 and REG_CLR_o_p$ == 0)) {
                  feature_f3_v1 = IE1_LEVEL_OK;
               } else {
                  feature_f3_v1 = IE1_LEVEL_ERROR;
                  message(LOW, "-------------------------> ", feature_f3_v1)
               };
               emit cover_func_model;
            };
            
            //INT1 - checking TRANSITION external interrupt: 1 1 0 0
            if (intx1[3:2] == 2'b11 and intx1[1:0] == 2'b00 
                and level_transition_x1 == 1 and level_transition_prev_x1 == 1) {
          
               if ((REG_TCON_o_p$[1:1] == 1 and REG_CLR_o_p$ == 1) or 
                   (REG_TCON_i_p$[3:3] == 1 and REG_CLR_o_p$ == 0)) {
                  feature_f3_v1 = IE1_TRANSITION_OK;
               } else {
                  feature_f3_v1 = IE1_TRANSITION_ERROR;
                  message(LOW, "-------------------------> ", feature_f3_v1)
               };
               emit cover_func_model;
            };
         
         // sampling external interrupts   
         
         level_transition_prev_x0 = level_transition_x0;
         level_transition_prev_x1 = level_transition_x1;
         intx0[3:2] = intx0[1:0];
         intx1[3:2] = intx1[1:0];
         
         wait delay(25);    
         
         intx0[0:0] = INT_EXT_p$[0:0];
         message(LOW, " -> intx0: ", INT_EXT_p$[0:0]);
         
         intx1[0:0] = INT_EXT_p$[1:1];
         message(LOW, " -> intx1: ", INT_EXT_p$[1:1]);
         
         emit test_e;
         
         wait delay(50);
         
         level_transition_x0 = REG_TCON_i_p$[0:0];
         intx0[1:1] = INT_EXT_p$[0:0];
         message(LOW, " -> intx0: ", INT_EXT_p$[0:0]);
         
         level_transition_x1 = REG_TCON_i_p$[2:2];
         intx1[1:1] = INT_EXT_p$[1:1];
         message(LOW, " -> intx1: ", INT_EXT_p$[1:1]);
         
         emit test_e;
                     
       }; // end feature --

       
// FEATURE_F4_V1 ###############################################################   
      if (feature == FEATURE_F4_V1) {
      
         wait @reset_rise;
         
         emit test_e;
         
         if ( 
              REG_TCON_o_p$  == 0 and 
              REG_TCON2_o_p$ == 0 and 
              REG_CLR_o_p$   == 0 and
              INT_VECT_o_p$  == 0
             ) {
                  feature_f4_v1 = RESET_OK;
             } else {
                  feature_f4_v1 = RESET_ERROR;
                  message(LOW, "-------------------------> ", feature_f4_v1);
             };
             emit cover_func_model;
         
           
       }; // end feature --   

                             
   }; //end functional_model ###################################################
   
   // cover functional model header (extended in test files)
   cover cover_func_model using text = "Coverage using functional model" is {
   }; // end cover
    
}; //end int monitor

'>
