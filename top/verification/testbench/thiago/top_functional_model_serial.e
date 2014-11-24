<'
// -----------------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -----------------------------------------------------------------------------
// File Name : top_functional_model_serial.e
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
      
   functional_model_serial() @clock_e is also {
      message (LOW, "Starting Functional Model Serial of TOP Verification");
      
      var opcode:uint(bits:8);
      
      var semi_cycle: int = 25;
      var machine_cycle : int = 100;
      
      wait @top_reset_rise;
     
      wait delay (semi_cycle);
        
      case sys.feature {
         
         feature_serial:   {
                              case sys.testcase  {
                                 testcase1: {
                                             while(TRUE) {
                                                out("Entering Testcase 1 Verification");
                                                wait @serial_tx_rise;
                                                var tx_data:uint(bits:8);
                                                tx_data=p_sfr_wr_data$;
                                                out("Starting Serial Transmission");
                                                outf("[%d] TX Data: %08b\n",sys.time,tx_data);
                                                wait cycle;
                                                wait cycle;                            
                                                wait @port3_1_rise;
                                                for i from 0 to 7 {  
                                                   if(p_port3_0$==tx_data[i:i]) {
                                                      out("[",sys.time,"] Bit ", i,": ", p_port3_0$," - OK");
                                                   } else {
                                                      check that p_port3_0$==tx_data[i:i];
                                                      out("[",sys.time,"] Bit ", i,": ", p_port3_0$," - Expected: ",tx_data[i:i]);
                                                   };                                              
                                                   wait @port3_1_rise;
                                                };
                                             };
                                    
                                             }; //end testcase1
                                 testcase2: {
                                             while(TRUE) {
                                                out("Entering Testcase 2 Verification");
                                                wait @serial_tx_rise;
                                                var tx_data:uint(bits:8);
                                                tx_data=p_sfr_wr_data$;
                                                out("Starting Serial Transmission");
                                                outf("[%d] TX Data: %08b\n",sys.time,tx_data);
                                                wait @baud_rate_rise;                                           
                                                wait @baud_rate_fall;
                                                check that p_port3_1$==0;
                                                out("[",sys.time,"] Start Bit  - OK");
                                                for i from 0 to 7 {
                                                   wait @baud_rate_fall;
                                                   check that p_port3_1$==tx_data[i:i];
                                                   out("[",sys.time,"] Bit ", i,": ", p_port3_1$," - OK");
                                                };
                                                wait @baud_rate_fall;
                                                check that p_port3_1$==0;
                                                out("[",sys.time,"] Bit 8: ", p_port3_1$," - OK");
                                                wait @baud_rate_fall;
                                                check that p_port3_1$==1;
                                                out("[",sys.time,"] Stop Bit  - OK");
                                             };
                                    
                                             }; //end testcase2
                                   testcase3: {
                                             while(TRUE) {
                                                out("Entering Testcase 3 Verification");
                                                wait @rx_event;
                                                if (p_sfr_ren$==1) {
                                                   wait @sfr_es_rise;
                                                } else {
                                                   wait @sfr_ren_rise;
                                                };
                                                for i from 0 to 7 {
                                                   wait @baud_rate_rise; 
                                                   if(p_port3_0$==sys.data[i:i]) {
                                                      out("[",sys.time,"] Bit ", i,": ", p_port3_0$," - OK");
                                                   } else {
                                                      check that p_port3_0$==sys.data[i:i];
                                                      out("[",sys.time,"] Bit ", i,": ", p_port3_0$," - Expected: ",sys.data[i:i]);
                                                   };
                                                };
                                                out("Starting Serial Reception");
                                                };
                                             }; //end testcase3
                                   testcase4: {
                                             while(TRUE) {
                                                out("Entering Testcase 3 Verification");
                                                wait @rx_event;
                                                if (p_sfr_ren$==1) {
                                                   wait @sfr_es_rise;
                                                } else {
                                                   wait @sfr_ren_rise;
                                                };
                                                wait @baud_rate_rise; 
                                                if(p_port3_1$==0) {
                                                   out("[",sys.time,"] Start Bit : ", p_port3_0$," - OK");
                                                } else {
                                                   check that p_port3_0$==0;
                                                   out("[",sys.time,"] Start Bit : ", p_port3_0$," - Expected: 0");
                                                };
                                                for i from 0 to 7 {
                                                   wait @baud_rate_rise; 
                                                   if(p_port3_0$==sys.data[i:i]) {
                                                      out("[",sys.time,"] Bit ", i,": ", p_port3_0$," - OK");
                                                   } else {
                                                      check that p_port3_1$==sys.data[i:i];
                                                      out("[",sys.time,"] Bit ", i,": ", p_port3_0$," - Expected: ",sys.data[i:i]);
                                                   };
                                                };
                                                wait @baud_rate_rise; 
                                                if(p_port3_0$==0) {
                                                   out("[",sys.time,"] Bit ", 8,": ", p_port3_0$," - OK");
                                                } else {
                                                   check that p_port3_0$==0;
                                                   out("[",sys.time,"] Bit ", 8,": ", p_port3_0$," - Expected: 0");
                                                };
                                                wait @baud_rate_rise; 
                                                if(p_port3_1$==1) {
                                                   out("[",sys.time,"] Stop Bit : ", p_port3_0$," - OK");
                                                } else {
                                                   check that p_port3_0$==1;
                                                   out("[",sys.time,"] Stop Bit : ", p_port3_0$," - Expected: 1");
                                                };
                                                out("Starting Serial Reception");
                                                };
                                             }; //end testcase4

                                                
                              }; //end case testcase        
               
         
                           }; // end feature_serial
         
         default: {
                  out ("entrou default feature")
                  };
      
      }; //case feature
      
   }; // end reference model
   
};



'>
