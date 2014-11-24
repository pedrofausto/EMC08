<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model.e
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

type feature_kind_t: [feature_reset,feature_ports,  feature_timers, feature_mem_ram, feature_serial, feature_interrupt,  feature_core];

type testcase_kind_t: [testcase1, testcase2, testcase3, testcase4, testcase5, testcase6, testcase7, testcase8];


extend top_mon_u {
   feature: feature_kind_t; 
   testcase: testcase_kind_t;
   
   functional_model() @clock_e is also {
      message (LOW, "Starting Functional Model of Core TOP Verification");
      
      var opcode:uint(bits:8);
      
      var semi_cycle: int = 25;
      var machine_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
        
      case feature {
         feature_reset:    {
                              message (LOW, "Beggin Feature Reset");
                             
                              wait delay (25); //sync the functional //model
                              
                              wait delay (machine_cycle);
                              message (LOW, sys.time);
                              ////////// PUT HERE CHECKERS //////
                             
                           };
      
         feature_timers:   {
            
                           }; //feature_timers
         
         
         feature_serial:   {
                           
                           }; // end feature_serial
         
         feature_core:     {
                              // Depending on the INST the delay can be one or two machine_cycle    
         
         
                           }; //end feature_core                  
                           
         feature_ports:   {   message (LOW, "Begin Feature Ports");
         
                              out ("testcase", testcase );
                              case testcase {
                              
                                 testcase1: {// Verify the port 0    
                                             message (LOW, "Beggin Feature Ports Testcase1");
                                 
                                             wait @port4;
                                             ////////// PUT HERE CHECKERS //////
                                             check_a_p0(8'b01010101);
                                             check_en_p0(8'b00000000); //contrario do en da sfr
                                                   
                                             }; //end testcase1
                                 
                                 testcase2:  {
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
   
   
   
   
   check_en_p0 (data: uint(bits:8)) is {
      if (p_top_p0_en_o$ != data) { out ("Data en_p0 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p0_en_o$)};
      check that (p_top_p0_en_o$ == data);
   }; //end checker
   
   check_en_p1 (data: uint(bits:8)) is {
      if (p_top_p1_en_o$ != data) { out ("Data en_p1 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p1_en_o$)};
      check that (p_top_p1_en_o$ == data);
   }; //end checker
   
   check_en_p2 (data: uint(bits:8)) is {
      if (p_top_p2_en_o$ != data) { out ("Data en_p2 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p2_en_o$)};
      check that (p_top_p2_en_o$ == data);
   }; //end checker
   
   check_en_p3 (data: uint(bits:8)) is {
      if (p_top_p3_en_o$ != data) { out ("Data en_p3 ERRORRRRR - expected ---> ", data);
                                    out ("                     - received ---> ", p_top_p3_en_o$)};
      check that (p_top_p3_en_o$ == data);
   }; //end checker
   
  
   check_a_p0 (data: uint(bits:8)) is {
      if (p_top_p0_a_o$ != data) { out ("Data a_p0 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p0_a_o$)};
      check that (p_top_p0_a_o$ == data);
   }; //end checker
   
   check_a_p1 (data: uint(bits:8)) is {
      if (p_top_p1_a_o$ != data) { out ("Data a_p1 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p1_a_o$)};
      check that (p_top_p1_a_o$ == data);
   }; //end checker
   
   check_a_p2 (data: uint(bits:8)) is {
      if (p_top_p2_a_o$ != data) { out ("Data a_p2 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p2_a_o$)};
      check that (p_top_p2_a_o$ == data);
   }; //end checker
   
   check_a_p3 (data: uint(bits:8)) is {
      if (p_top_p3_a_o$ != data) { out ("Data a_p3 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p3_a_o$)};
      check that (p_top_p3_a_o$ == data);
   }; //end checker
   
   check_a_p4 (data: uint(bits:8)) is {
      if (p_top_p4_a_o$ != data) { out ("Data a_p4 ERRORRRRR - expected ---> ", data);
                                   out ("                    - received ---> ", p_top_p4_a_o$)};
      check that (p_top_p4_a_o$ == data);
   }; //end checker
   
   check_psen_b_rise () is {
      if (p_top_psen_b_o$ != 1) {  out ("PSEN_B RISE ERRORRRRR")};
      check that (p_top_psen_b_o$ == 1);
   };
   
   check_psen_b_fall () is {
      if (p_top_psen_b_o$ != 0) {  out ("PSEN_B FALL ERRORRRRR")};
      check that (p_top_psen_b_o$ == 0);
   };
   
   
   
   
   
};



'>
