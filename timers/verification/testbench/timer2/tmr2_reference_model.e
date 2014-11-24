<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : tmr2_reference_model.e
// Module Name : Timer 2 Module
// Author : Hugo Kakisaka, Marcelo Mamoro Ono
// E-mail : diga21@emc8.br, diga20@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 12/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords:
// -----------------------------------------------------------------------------
// Purpose: Reference model to Timer 2 Module . This model reproduce the
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
// Local Functions: reference_model()
// Include Files: 
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------



extend tmr2_mon_u {

       sel_feat      :  feature_t            ;     // Select Feature To Test
       
       feature_f1    :  feature_f1_t         ;     // Reset Feature
       
       feature_f2    :  feature_f2_t         ;     // ACR Increment Algorithm    
       
       feature_f3    :  feature_f3_t         ;     // Digital Filter Output
       
       feature_f4    :  feature_f4_t         ;     // Edge Detector
      
      !state         :  acg_state_t          ; 
      
      
      
      !angle_clk           : uint(bits:10)    ;
  
      !angle_clk_period    : uint(bits:10)    ;
      
      !acr_inc             : bit              ;
      
      !acr_total           : uint(bits:24)    ;    // ACR Total Counter Reference Model 
      
      !acr_reg             : uint(bits:24)    ;    // ACR Total Counter DUT
      
      
      !flag_0              : bit              ;
      
      !flag_edsel_ant      : bit              ; 
      
      !flag_edsel          : bit              ;
           
      
  //    !acrm       : uint(bits:8)    ;      
      
 //     !acrh       : uint(bits:8)    ;
 
      !tacp_reg      : uint(bits:10)    ;
      
      

      
      
      event cover_func_model              ;
      
    
   reference_model() @clock_e is also {
   
   
      out ("");
   
      out ("Starting Reference Model\n");
      
      var count:uint ;
        
      // put the reference model here
		
		
		//	 wait @reset_rise;
		
		//	0b1111_0101	;
		
		// 0x00 ;
      
         if ( reset_p$ == 0) {
     
               acr_inc   = 0           ;
         
               acr_total = 0           ;
                                              
         //      state     = ACG_RESET   ;               
         
         } ;
		
	
   
   
   
//---------------------------------------------------------------------------//
//--------------------FEATURE Reset Checker----------------------------------//
//---------------------------------------------------------------------------// 
   

    if (sel_feat==FEAT_1)   {     
         
         out("Starting FEATURE 1 Check... \n");
         
         wait @reset_rise ;
                 
         if (acrh_o_p$ != 0x00 || acrm_o_p$ != 0x00 || acrl_o_p$ != 0x00 || tcon2_tf2_o_p$ != 0b0 ) {
      
            out("Initialization Error!\n");
      
            out("REGISTER  acrh_o_p = ",acrh_o_p$,"\t","EXPECTED = 0" );    
            out("REGISTER  acrm_o_p = ",acrm_o_p$,"\t","EXPECTED = 0" );
            out("REGISTER  acrl_o_p = ",acrl_o_p$,"\t","EXPECTED = 0" );
            out("FLAG tcon2_tf2_o_p = ",tcon2_tf2_o_p$,"\t","EXPECTED = 0","\n");
                        
            feature_f1 = RESET_ERROR ;
            
            emit cover_func_model   ;
                     
            stop_run();

         } else {
         
                  out("RESET TEST PASSED \n");
                  
                  feature_f1 = RESET_OK ;  
                  
                  emit cover_func_model   ;
                                             
                }; 
                
  //      emit cover_func_model   ;
                          
     };
   
   
//---------------------------------------------------------------------------//
//--------------------FEATURE ACG Checker------------------------------------//
//---------------------------------------------------------------------------// 

 
        
      
    if (sel_feat == FEAT_2)   {
         
         
         out("Starting FEATURE 2 Check... \n");
                  
	
         wait @pht_rise ;                                ; // PHT Rise Trigger Event
         
         
         tacp_reg  = %{tacph_i_p$, tacpl_i_p$}           ; // Read TACPH and TACPL Registers     
         
                
         while (TRUE) {
         
         
         for i from 1 to 400 { 
         
         out("PHT INPUT = ", pht_i_p$)                   ;  
                 
         case state {
         
            ACG_RESET: {   out("ACG RESET\n")            ;
            
                           angle_clk_period = tacp_reg   ;
                        
                           angle_clk = angle_clk_period  ;
         
                           acr_inc   = 0                 ;
         
                           acr_total = 0                 ;                                               
                           
                           state     = ACG_STATE1        ;
                                                        
                            
                            wait [`WIDTH_PHT_H]          ;  // PHT High Width
                           
                           };
            
                           
            ACG_STATE1: {  out("ACG STATE1\n")           ; 
                              
                           angle_clk = angle_clk - 1     ;
                              
                           state     = ACG_STATE2        ;
                          
                           acr_inc   = 1                 ;
                             
                                                           
                           };
            
            ACG_STATE2: {  out("ACG STATE2\n")           ;
                                       
                           if (angle_clk == 0) {
            
               
                                    if (pht_i_p$ == 1) {
                                    
                                       angle_clk = angle_clk_period  ;
                                    
                                       acr_inc   = 0                 ;
                                       
                                       state     = ACG_STATE1        ;
                                       
                                       wait [`WIDTH_PHT_H]           ;  // PHT High Width
                                      
                                            
                                     } else { 
                                     
                                     
                                             acr_inc   = 1                             ;
                                     
                                             angle_clk_period = angle_clk_period + 1   ;
                                             
                                             angle_clk = angle_clk_period              ;
                                             
                                             state = ACG_STATE3                        ;
                                           
                                             out("angle_clk_period = angle_clk_period + 1 e pht = 0 \n")  ;
                                             
                                            };
                
                
                
                              } else { 
                             
                                       if (pht_i_p$ == 1) {
                                       
                                          angle_clk = angle_clk_period - angle_clk ;
                             
                                          state     = ACG_STATE1           ;
                                             
                                          acr_inc   = 0                    ;
                                          
                                          wait [`WIDTH_PHT_H]              ;  // PHT High Width
                                    
                                       } else {
                                                                                           
                                                state = ACG_STATE2         ;
                                                
                                                angle_clk = angle_clk - 1  ;
                                                                             
                                               };
                                       
                                    };
               
               
                           };
            
            ACG_STATE3: {  out("ACG STATE3\n")                       ;       
                                                   
                           if (pht_i_p$ == 1) {
                                    
                                       angle_clk = angle_clk_period  ;
                                    
                                       acr_inc   = 0                 ;
                                       
                                       state     = ACG_STATE1        ;
                                       
                                       wait [`WIDTH_PHT_H]           ;  // PHT High Width
                                            
                                     } else { 
                                     
                                     
                                             acr_inc   = 1                             ;
                                     
                                             angle_clk_period = angle_clk_period + 1   ;
                                             
                                             angle_clk = angle_clk_period              ;
                                             
                                             state     = ACG_STATE3                    ;
                                             
                                             out("angle_clk_period = angle_clk_period + 1 e pht = 0 \n")           ;
                                     
                            };
            
                     };
            
            default: {out("ERROR : ILLEGAL STATE")};
         };
         
         
         
         if (acr_inc == 1) {
                  
            acr_total   = acr_total + 1                     ; // Increments ACR Reference Model 
                     
         };
                         
           acr_reg  = %{acrh_o_p$, acrm_o_p$,acrl_o_p$}    ; // Read ACRH, ACRM and ACRL Registers
           
                                              
            if (acr_total != acr_reg) {          // Checker 
            
               out("------------------------------------\n") ;
                    
               out("ACR REGISTERS INCREMENT ERROR : \n")  ;                 
         
               out("ACR Registers Count = ",acr_reg,"\t\t", "ACR Expected Count = ",acr_total)   ;
                 
               out("")                          ;
                                    
               out("------------------------------------\n") ;
               
               feature_f2 = ACR_INC_ERROR    ;
               
               emit cover_func_model   ;
            
          //     stop_run()                    ;     
         
            } else {
                     feature_f2 = ACR_INC_OK ;
                     
                     emit cover_func_model   ;
            
                    };
               
               
   //      print sys.time    ;

         
         out("angle_clk = ",angle_clk,"\n")                ;
         
         
         out("angle_clk_period = ",angle_clk_period,"\n")  ;
                
        
         out("acr_inc = ",acr_inc,"\n")     ;
                       
      
         out("acr_total = ",acr_total,"\n") ;
         
                         
         out("acr_reg = ",acr_reg,"\n")     ;
         
         
         out("------------------------------------\n") ;
         
         wait [`SYSTEM_CLK];     // State Machine Clock
         
         };
         
         break ;
         
         };
         
   //       emit cover_func_model   ;
         
   	}; // End -------------------- ACG Checker-----------------------------//
      
      
      
      
//---------------------------------------------------------------------------//
//--------------------FEATURE Digital Filter Output--------------------------//
//---------------------------------------------------------------------------// 
      
      
      	
	if (sel_feat==FEAT_3)	{		
			
		out("Starting FEATURE 3 Check... \n");
      
      wait @pht_rise ;                                ; // PHT Rise Trigger Event
            
      flag_edsel = 0          ;
      flag_edsel_ant = 0      ;

      flag_edsel_ant = tcon2_edsel_i_p$ ;
      
                          
         while (TRUE) {    
                       
            if (pdf_o_p$ == 1) {
            
               count = count + 1             ;
               
               out("------------------------------------\n") ;
        
               out("DFO Pulse OK \n")        ; 
               
               out("------------------------------------\n") ;                                            
               
               count = 0;
               
               feature_f3 = DFO_OK ;  
               
               emit cover_func_model   ;
               
               break ;
                          
            } else { 
                     count = count + 1 ;
                     
                     flag_edsel = tcon2_edsel_i_p$ ; 
                                         
                     if ( flag_edsel_ant ==`FALL_EDGE && flag_edsel ==`RISE_EDGE && pht_i_p$==1 ) {
                           
                                 message(LOW,"FALL to RISE mode change while PHT Input is HIGH \n") ;
                                 
                                 flag_edsel = 0          ;
                                 flag_edsel_ant = 0      ;
                           
                                 break ;
                                 
                      } ;
                     
                                               
                     if (count == (`WIDTH_PHT_H + 70) ) {
                     
                                         message(LOW, "============================> DFO Pulse ERROR \n"); 
                                         
                                                                                                                                 
                                         out("PHT INPUT  = ", pht_i_p$, "\n") ;
                        
                                         out("DFO OUTPUT PULSE = ",pdf_o_p$,"\t","EXPECTED = 1", "\n" )    ;
                           
                                         out("COUNTER = ",count, "\n")         ; 
                                         
                                         feature_f3 = DFO_ERROR ;        
                                                                                                                       
                                         wait [50] ;
                                         
                                         emit cover_func_model   ; 
                           
                                //         stop_run();            PAREI AQUI !!!! descomentar stop run
                                                                                       
                                         };                                                                                      
                     
                   } ; 
                   
              wait [`SYSTEM_CLK] ;          // State Machine Clock                                    
        };
        
    //    emit cover_func_model   ;
                                
      };  // End ---------------- Digital Filter Output Checker--------------------//
      

      
            
//---------------------------------------------------------------------------//
//--------------------FEATURE Edge Detector----------------------------------//
//---------------------------------------------------------------------------// 
      
      
         
   if (sel_feat==FEAT_4)   {     
         
      out("Starting FEATURE 4 Check... \n");
      
      wait @pht_rise ;                                ; // PHT Rise Trigger Event
            
      flag_edsel = 0          ;
      flag_edsel_ant = 0      ;
      
      count = 0               ;

      flag_edsel_ant = tcon2_edsel_i_p$ ;
      
                          
         while (TRUE) {    
                       
            if (tcon2_edsel_i_p$ ==`RISE_EDGE && pht_i_p$==1 ) {
            
               count = count + 1             ;
               
               out("------------------------------------\n") ;
        
               out("DFO Pulse OK \n")        ; 
               
               out("------------------------------------\n") ;                                            
               
               count = 0;
               
               feature_f3 = DFO_OK ;  
               
    //           emit cover_func_model   ;
               
               break ;
                          
            } else { 
                     count = count + 1 ;
                     
                     flag_edsel = tcon2_edsel_i_p$ ; 
                                         
                     if ( flag_edsel_ant ==`FALL_EDGE && flag_edsel ==`RISE_EDGE && pht_i_p$==1 ) {
                           
                                 message(LOW,"FALL to RISE mode change while PHT Input is HIGH \n") ;
                                 
                                 flag_edsel = 0          ;
                                 flag_edsel_ant = 0      ;
                           
                                 break ;
                                 
                      } ;
                     
                                               
                     if (count == (`WIDTH_PHT_H + 70) ) {
                     
                                         message(LOW, "============================> DFO Pulse ERROR \n"); 
                                         
                                                                                                                                 
                                         out("PHT INPUT  = ", pht_i_p$, "\n") ;
                        
                                         out("DFO OUTPUT PULSE = ",pdf_o_p$,"\t","EXPECTED = 1", "\n" )    ;
                           
                                         out("COUNTER = ",count, "\n")         ; 
                                         
                                         feature_f3 = DFO_ERROR ;        
                                                                                                                       
                                         wait [50] ;
                                         
                                //         emit cover_func_model   ; 
                           
                                //         stop_run();            PAREI AQUI !!!! descomentar stop run
                                                                                       
                                         };                                                                                      
                     
                   } ; 
                   
              wait [`SYSTEM_CLK] ;          // State Machine Clock                                    
        };
        
    //    emit cover_func_model   ;
                                
      };  // End ---------------- Digital Filter Output Checker--------------------//
      
      
      
      	
   }; // End -------------------- Reference Model ---------------------------------//
   
// Cover Functional Model Header (extended in test files)

    cover cover_func_model using text = "Coverage using functional model" is {
    
   }; // end cover
   
};



'>
