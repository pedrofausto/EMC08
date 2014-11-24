<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model_ports.e
// Module Name : top
// Author : Harney Abrahim
// E-mail : diga19@emc08.br
// -----------------------------------------------------------------------------
// Review(s) : 05/10/2010, reviwed by Harney. First Environment version
// -----------------------------------------------------------------------------
// Release History
// Version  Date        Author Description
// 1.0      05-10-2010  Initial version
// -----------------------------------------------------------------------------
// Keywords: top - top module
// -----------------------------------------------------------------------------
// Purpose: checker to the TOP module. This model reproduce the
// behaviour in the specification. According to this functional model the DUT 
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


extend top_mon_u {
   
   
   functional_model_ports() @clock_e is also {
      message (LOW, "Starting Functional Model for TOP Ports Verification");
      
      var opcode:uint(bits:8);
      
      var semi_cycle: int = 25;
      var machine_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
           
      case sys.feature {
                           
         feature_ports:   {   message (LOW, "Begin Feature Ports");
         
                              out ("testcase", sys.testcase );
                              case sys.testcase {
                              
                                 testcase1: {// Verify ports 0, 1, 2 and 3   
						message (LOW, "Beggin Feature Ports Testcase1");
					
						wait @port4; //Checking P0
						////////// PUT HERE CHECKERS //////
						check_a_p0(8'h99);
						check_en_p0(8'b00000000); //contrario do en da sfr
						check_a_p4(8'b00000001);
						
						wait @port4; //Checking P1
						check_a_p0(8'h99);
						check_en_p0(8'b00000000); //contrario do en da sfr
						check_a_p1(8'h89);
						check_en_p1(8'b00000000); //contrario do en da sfr
						check_a_p4(8'b00000010);
						
						wait @port4; //Checking P2
						check_a_p0(8'h99);
						check_en_p0(8'b00000000); //contrario do en da sfr
						check_a_p1(8'h89);
						check_en_p1(8'b00000000); //contrario do en da sfr
						check_a_p2(8'h79);
						check_en_p2(8'b00000000); //contrario do en da sfr
						check_a_p4(8'b00000100);
						
						wait @port4; //Checking P3
						check_a_p0(8'h99);
						check_en_p0(8'b00000000); //contrario do en da sfr
						check_a_p1(8'h89);
						check_en_p1(8'b00000000); //contrario do en da sfr
						check_a_p2(8'h79);
						check_en_p2(8'b00000000); //contrario do en da sfr
						check_a_p3(8'h69);
						check_en_p3(8'b00000000); //contrario do en da sfr
						check_a_p4(8'b00001000);
                                             
					           
                                             }; //end testcase1
                                 
                                 testcase2:  {
				 		message (LOW, "Beggin Feature Ports Testcase2");
                                 
						wait @port4; //Checking P0
						////////// PUT HERE CHECKERS //////
						check_a_p0(8'hD9);
						check_en_p0(8'b11110000); //contrario do en da sfr
						check_a_p4(8'b00000001);
						
						wait @port4; //Checking P1
						check_a_p0(8'hD9);
						check_en_p0(8'b11110000); //contrario do en da sfr
						check_a_p1(8'hD9);
						check_en_p1(8'b11110000); //contrario do en da sfr
						check_a_p4(8'b00000010);
						
						wait @port4; //Checking P2
						check_a_p0(8'hD9);
						check_en_p0(8'b11110000); //contrario do en da sfr
						check_a_p1(8'hD9);
						check_en_p1(8'b11110000); //contrario do en da sfr
						check_a_p2(8'hD9);
						check_en_p2(8'b11110000); //contrario do en da sfr
						check_a_p4(8'b00000100);
						
						wait @port4; //Checking P3
						check_a_p0(8'hD9);
						check_en_p0(8'b11110000); //contrario do en da sfr
						check_a_p1(8'hD9);
						check_en_p1(8'b11110000); //contrario do en da sfr
						check_a_p2(8'hD9);
						check_en_p2(8'b11110000); //contrario do en da sfr
						check_a_p3(8'hD9);
						check_en_p3(8'b11110000); //contrario do en da sfr
						check_a_p4(8'b00001000);
						};
                                             
                                 default:    {
                                             out ("entrou default testacase1");
                                             };
                              }; // end case testcase
                              
                              
                           }; //end feature_ports                  
                           
         default: {
                  out ("entrou default feature")
                  };
      
      }; //case feature
      
   }; // end reference model
   
};



'>
