<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : br_reference_model.e
// Module Name : Baud Rate
// Author : Dino Casse, Harney Abrahin
// E-mail : diga8@emc8.br, diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 12/08/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      12-08-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: br - baud rate
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
// Local Functions: reference_model()
// Include Files: br_top.e
// Other:
// -----------------------------------------------------------------------------
// Features Tested: none
// -----------------------------------------------------------------------------
// Detailed Test Description: none
// -----------------------------------------------------------------------------


extend tmr0_mon_u {

	//	feature:				feature_t;
		feature_f1_v1:		feature_f1_v1_t;
		feature_f2_v1:		feature_f2_v1_t;
		feature_f3_v1:		feature_f3_v1_t;
		feature_f3_v2:		feature_f3_v2_t;
		feature_f4_v1:		feature_f4_v1_t;
		feature_f5_v1:		feature_f5_v1_t;
		feature_f5_v2:		feature_f5_v2_t;
		feature_f6_v1:		feature_f6_v1_t;
		feature_f6_v2:		feature_f6_v2_t;
		feature_f7_v1:		feature_f7_v1_t;
	
		!th_o			: uint(bits: 8);
		!tm_o			: uint(bits: 8);
		!tl_o			: uint(bits: 8);
		
		!th_i			: uint(bits: 8);
		!tm_i			: uint(bits: 8);
		!tl_i			: uint(bits: 8);
		!tf_i			: bit;
		
		!thml_var_n	: uint(bits: 24);
		!thml_var_p	: uint(bits: 24);
		

		event cover_func_f1_v1;
		event cover_func_f2_v1;
		event cover_func_f3_v1;
		event cover_func_f3_v2;
		event cover_func_f4_v1;
		event cover_func_f5_v1;
		event cover_func_f5_v2;
		event cover_func_f6_v1;
		event cover_func_f6_v2;
		event cover_func_f7_v1;
		
		feature_f7_v1_task() is {
			if (tcon_tf0_o_p$ == tf_i){
				feature_f7_v1 = FEAT_F7_V1_PASS;
				out("PASS- FEAT_F7_V1_PASS");
				emit cover_func_f7_v1;
			}
			else{
				feature_f7_v1 = FEAT_F7_V1_FAIL;
				out("FAIL- FEAT_F7_V1_FAIL");
				out("REGISTER  tcon_tf0_o_p = ",tcon_tf0_o_p$,"\t","EXPECTED = ",tf_i );
				emit cover_func_f7_v1;
			};
   	};

		
   reference_model() @clock_e is also {

		
 message(LOW, "Starting Functional Model ");
 wait @clk_rise;
 
 	while(TRUE){
	
	message(LOW, "Starting Functional Model2 ");
	
			 	th_o = th0_o_p$;
				tm_o = tm0_o_p$;
				tl_o = tl0_o_p$;
				
				th_i = th0_i_p$;
				tm_i = tm0_i_p$;
				tl_i = tl0_i_p$;
				tf_i =tcon_tf0_i_p$;
				
				thml_var_n = (%{th_o,tm_o,tl_o} - 1);
				
				thml_var_p = (%{th_o,tm_o,tl_o} + 1);
				
				
 			if (reset_p$ == 1){
			
//--------------------------RESERVED MODE---------------------------------------
			if ((tmod_m0t0_p$ == 0 && tmod_m1t0_p$ == 1) || (tmod_m0t0_p$ == 1 && tmod_m1t0_p$ == 0)){

				if (%{th_o,tm_o,tl_o} != 0x0 || (%{th_o,tm_o,tl_o} != 0xffffff)) {
				wait delay(1);
				feature_f7_v1_task();
				};
				
				wait @clk_rise;
				wait delay(1);
					if (reset_p$ == 1){

					if (tl0_o_p$ != tl_o || tm0_o_p$ != tm_o || th0_o_p$ != th_o){
						feature_f4_v1 = FEAT_F4_V1_FAIL;
						out("FAIL- FEAT_F4_V1_FAIL");
						out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = ",tl_o );
						out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = ",tm_o );
						out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = ",th_o );
						print sys.time;
					}
					else{
						feature_f4_v1 = FEAT_F4_V1_PASS;
						out("PASS- FEAT_F4_V1_PASS");
					};
					emit cover_func_f4_v1;
					};
			}
			else{
//-------------------------------STOP----------------------------------------
			if (tcon_tr0_p$ == 0 ) {				//Stop mode
				if ((tmod_m0t0_p$ == 1 && tmod_m1t0_p$ == 1) || (tmod_m0t0_p$ == 0 && tmod_m1t0_p$ == 0)){
					
					if (%{th_o,tm_o,tl_o} != 0x0 || (%{th_o,tm_o,tl_o} != 0xffffff)) {
					wait delay(1);
					feature_f7_v1_task();
					};
					
					wait @clk_rise;
					wait delay(1);
					if (reset_p$ == 1){
				
						if (tl0_o_p$ != tl_i  || tm0_o_p$ != tm_i  || th0_o_p$ != th_i){
							feature_f2_v1 = FEAT_F2_V1_FAIL;
							out("FAIL- FEAT_F2_V1_FAIL");
							out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = ",tl_i );    
							out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = ",tm_i );
							out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = ",th_i );
							print sys.time;
						}
						else{
							feature_f2_v1 = FEAT_F2_V1_PASS;
							out("PASS- FEAT_F2_V1_PASS");
						};
						emit cover_func_f2_v1;
					};	
				};
			}
			else{
			
			if(tmod_gate_t0_p$ == 1 && int0_p$ == 0){

				if (%{th_o,tm_o,tl_o} != 0x0 || (%{th_o,tm_o,tl_o} != 0xffffff)) {
				wait delay(1);
				feature_f7_v1_task();
				};
				
				wait @clk_rise;
				wait delay(1);
				if (reset_p$ == 1){

					if (tl0_o_p$ != tl_o || tm0_o_p$ != tm_o || th0_o_p$ != th_o){
						feature_f6_v1 = FEAT_F6_V1_FAIL;
						out("FAIL- FEAT_F6_V1_FAIL");
						out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = ",tl_o );
						out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = ",tm_o );
						out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = ",th_o );
						print sys.time;
					}
					else{
						feature_f6_v1 = FEAT_F6_V1_PASS;
						out("PASS- FEAT_F6_V1_PASS");
					};
					emit cover_func_f6_v1;
					};
			}
			else{
//-------------------------------UP MODE----------------------------------------
			if ((tmod_m0t0_p$ == 0 && tmod_m1t0_p$ == 0) && tcon_tr0_p$ == 1){


				if(%{th_o,tm_o,tl_o} == 0xffffff){
					wait @clk_rise;
					wait delay(1);
					
					if (reset_p$ == 1){
				
					if (%{th0_o_p$,tm0_o_p$,tl0_o_p$} == 0){
						feature_f3_v1 = FEAT_F3_V1_PASS;
						out("PASS- FEAT_F3_V1_PASS");
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_PASS;
							out("PASS- FEAT_F6_V2_PASS");
							emit cover_func_f6_v2;
						};
						
						if(tcon_tf0_o_p$ == 1){
							feature_f5_v1 = FEAT_F5_V1_PASS;
							out("PASS- FEAT_F5_V1_PASS");
						}
						else{
							feature_f5_v1 = FEAT_F5_V1_FAIL;
							out("FAIL- FEAT_F5_V1_FAIL");
							out("REGISTER  tcon_tf0_o_p = ",tcon_tf0_o_p$,"\t","EXPECTED = 1");
							print sys.time;
							
							if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
								feature_f6_v2 = FEAT_F6_V2_FAIL;
								out("FAIL- FEAT_F6_V2_FAIL");
								out("tmod_gate_t0_p: ",tmod_gate_t0_p$,"int0_p: ",int0_p$);
								emit cover_func_f6_v2;
								print sys.time;
							};
						};
						emit cover_func_f5_v1;
					}
					else{
						feature_f3_v1 = FEAT_F3_V1_FAIL;
						out("FAIL- FEAT_F3_V1_FAIL");
						out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = 0");
						out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = 0");
						out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = 0");
						print sys.time;
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_FAIL;
							out("FAIL- FEAT_F6_V2_FAIL");
							out("tmod_gate_t0_p: ",tmod_gate_t0_p$,"int0_p: ",int0_p$);
							emit cover_func_f6_v2;
							print sys.time;
						};
					};
					};
				}
				else{
					
					if (%{th_o,tm_o,tl_o} != 0x0){
					wait delay(1);
					feature_f7_v1_task();
					};
					
					wait @clk_rise;
					wait delay(1);
					if (reset_p$ == 1){
					
					if (%{th0_o_p$,tm0_o_p$,tl0_o_p$} == thml_var_p){
						feature_f3_v1 = FEAT_F3_V1_PASS;
						out("PASS- FEAT_F3_V1_PASS");
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_PASS;
							out("PASS- FEAT_F6_V2_PASS");
							emit cover_func_f6_v2;
						};
					}
					else{
						feature_f3_v1 = FEAT_F3_V1_FAIL;
						out("FAIL- FEAT_F3_V1_FAIL");
						out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = ",thml_var_p[7:0]  );
						out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = ",thml_var_p[15:8] );
						out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = ",thml_var_p[23:16]);
						print sys.time;
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_FAIL;
							out("FAIL- FEAT_F6_V2_FAIL");
							out("tmod_gate_t0_p: ",tmod_gate_t0_p$,"int0_p: ",int0_p$);
							emit cover_func_f6_v2;
							print sys.time;
						};
					};
				};
				};
				emit cover_func_f3_v1;

			} else{
			
//-----------------------------DOWN MODE----------------------------------------
			if ((tmod_m0t0_p$ == 1 && tmod_m1t0_p$ == 1) && tcon_tr0_p$ == 1 && ((tmod_gate_t0_p$ == 1 && int0_p$ == 1) || tmod_gate_t0_p$ == 0)){
				
				if(%{th_o,tm_o,tl_o} == 0){
					wait @clk_rise;
					wait delay(1);
					if (reset_p$ == 1){
					if (%{th0_o_p$,tm0_o_p$,tl0_o_p$} == 0xffffff){
						feature_f3_v2 = FEAT_F3_V2_PASS;
						out("PASS- FEAT_F3_V2_PASS");
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_PASS;
							out("PASS- FEAT_F6_V2_PASS");
							emit cover_func_f6_v2;
						};
						
						if(tcon_tf0_o_p$ == 1){
							feature_f5_v2 = FEAT_F5_V2_PASS;
							out("PASS- FEAT_F5_V2_PASS");
						}
						else{
							feature_f5_v2 = FEAT_F5_V2_FAIL;
							out("FAIL- FEAT_F5_V2_FAIL");
							out("REGISTER  tcon_tf0_o_p = ",tcon_tf0_o_p$,"\t","EXPECTED = 1");
							print sys.time;
							
							if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_PASS;
								out("PASS- FEAT_F6_V2_PASS");
								out("tmod_gate_t0_p: ",tmod_gate_t0_p$,"int0_p: ",int0_p$);
								emit cover_func_f6_v2;
							};	
						};
						emit cover_func_f5_v2;
					}
					else{
						feature_f3_v2 = FEAT_F3_V2_FAIL;
						out("FAIL- FEAT_F3_V2_FAIL");
						out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = 255");
						out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = 255");
						out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = 255");
						print sys.time;
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_FAIL;
							out("FAIL- FEAT_F6_V2_FAIL");
							out("tmod_gate_t0_p: ",tmod_gate_t0_p$,"int0_p: ",int0_p$);
							emit cover_func_f6_v2;
							print sys.time;
						};
					};
					};
				}
				else{
					if (%{th_o,tm_o,tl_o} != 0xffffff){
					wait delay(1);
					feature_f7_v1_task();
					};

					wait @clk_rise;
					wait delay(1);
					if (reset_p$ == 1){
					
					if (%{th0_o_p$,tm0_o_p$,tl0_o_p$} == thml_var_n){
						feature_f3_v2 = FEAT_F3_V2_PASS;
						out("PASS- FEAT_F3_V2_PASS");
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_PASS;
							out("PASS- FEAT_F6_V2_PASS");
							emit cover_func_f6_v2;
						};
					}
					else{
						feature_f3_v2 = FEAT_F3_V2_FAIL;
						out("FAIL- FEAT_F3_V2_FAIL");
						out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = ",thml_var_n[7:0]  );
						out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = ",thml_var_n[15:8] );
						out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = ",thml_var_n[23:16]);
						print sys.time;
						
						if(tmod_gate_t0_p$ == 1 && int0_p$ == 1){
							feature_f6_v2 = FEAT_F6_V2_FAIL;
							out("FAIL- FEAT_F6_V2_FAIL");
							out("tmod_gate_t0_p: ",tmod_gate_t0_p$,"int0_p: ",int0_p$);
							emit cover_func_f6_v2;
							print sys.time;
						};
					};
				};
				};
				emit cover_func_f3_v2;

			};	//---if (Mode Down)
			};
		};	//---else (Mode gate = 1 && int = 0)
		};	//--- else (Stop mode)
		};	//--- else (Reserved Mode)
		};
//-------------------------------RESET----------------------------------------

		if (reset_p$ == 0){
	
			wait delay(1);

			if (tl0_o_p$ != 0x00 || tm0_o_p$ != 0x00 || th0_o_p$ != 0x00 || tcon_tf0_o_p$ != 0b0 ) {
		
				feature_f1_v1 = FEAT_F1_V1_FAIL;
				
				out("FAIL- FEAT_F1_V1_FAIL");
				out("REGISTER  tl0_o_p = ",tl0_o_p$,"\t","EXPECTED = 0" );    
				out("REGISTER  tm0_o_p = ",tm0_o_p$,"\t","EXPECTED = 0" );
				out("REGISTER  th0_o_p = ",th0_o_p$,"\t","EXPECTED = 0" );
				out("FLAG tcon_tf0_o_p = ",tcon_tf0_o_p$,"\t","EXPECTED = 0" );
				print sys.time;

			}
			else{
				feature_f1_v1 = FEAT_F1_V1_PASS;
				out("PASS- FEAT_F1_V1_PASS");
			};
			emit cover_func_f1_v1;
		wait delay(5000);
			
			

		};	//--- (Reset mode)
		
	
		};
	};	//--- reference_model() @clock_e is also
	
	
	
		cover cover_func_f1_v1 using text = "Coverage using functional model" is {
   		item feat_f1_v1_cov:feature_f1_v1_t=feature_f1_v1;
		}; // end cover
	
		cover cover_func_f2_v1 using text = "Coverage using functional model" is {
			item feat_f2_v1_cov:feature_f2_v1_t=feature_f2_v1;
		}; // end cover
		
		cover cover_func_f3_v1 using text = "Coverage using functional model" is {
			item feat_f3_v1_cov:feature_f3_v1_t=feature_f3_v1;
		}; // end cover
		
		cover cover_func_f3_v2 using text = "Coverage using functional model" is {
			item feat_f3_v2_cov:feature_f3_v2_t=feature_f3_v2;
		};
	 
		cover cover_func_f4_v1 using text = "Coverage using functional model" is {
			item feat_f4_v1_cov:feature_f4_v1_t=feature_f4_v1;
   	 }; // end cover
		 
		cover cover_func_f5_v1 using text = "Coverage using functional model" is {
			item feat_f5_v1_cov:feature_f5_v1_t=feature_f5_v1;
   	 }; // end cover
		 
		cover cover_func_f5_v2 using text = "Coverage using functional model" is {
			item feat_f5_v2_cov:feature_f5_v2_t=feature_f5_v2;
   	 }; // end cover
		 
		cover cover_func_f6_v1 using text = "Coverage using functional model" is {
			item feat_f6_v1_cov:feature_f6_v1_t=feature_f6_v1;
   	 }; // end cover
		 
		cover cover_func_f6_v2 using text = "Coverage using functional model" is {
			item feat_f6_v2_cov:feature_f6_v2_t=feature_f6_v2;
   	 }; // end cover
		 
		 cover cover_func_f7_v1 using text = "Coverage using functional model" is {
			item feat_f7_v1_cov:feature_f7_v1_t=feature_f7_v1;
   	 }; // end cover
};


'>