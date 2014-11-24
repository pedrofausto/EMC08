// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_rx_control.v
// Module Name: serial
// Author: Harney Abrhaim, Gabriela Mingan
// E-mail: harneybelem@gmail.com ,gabrielamin315@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 19/08/2010 Initial version
// 2.0 08/09/2010 Bugs with sync were fixed
// 2.1 09/09/2010 some unused signals were removed
// 2.2 10/09/2010 standard names of variables
// 2.3 13/10/2010 always (*) removed
// -------------------------------------------------------------------
// Description
// Implements a FSM that controls the RX_transceiver in serial. THis is
// communicated with the detector and the input shift register to do the 
// complete assynchronous and synchronous reception.
// -------------------------------------------------------------------


module serial_rx_control (
                                      serial_br_i,
                                      serial_clock_i,
                                      serial_reset_i_b,
                                      serial_scon7_sm0_i,
                                      serial_scon4_ren_i,
                                      serial_scon0_ri_i,
                                      serial_end_bit_i,
                                      serial_data_mode2_i,
                                      serial_transition_detected_i,
                                      
                                      serial_clear_count_o,
                                      serial_p3en_0_o,
                                      serial_p3en_1_o,
                                      serial_scon0_ri_o,
                                      serial_receive_o,
                                      serial_load_sbuf_o,                                      
                                      serial_shift_input_shift_reg_o,
                                      serial_start_input_shift_reg_o
                                      ); 

/////////////////////  Inputs and Outputs /////////////////////////////////////
input  serial_br_i;                       //baud rate depending the operation mode
input  serial_clock_i;                    //main serial_clock_i
input  serial_reset_i_b;                    //main serial_reset_i_b
input  serial_scon7_sm0_i;				 // operation mode
input  serial_scon4_ren_i;				 // serial_receive_o enable
input  serial_scon0_ri_i;				 // serial_receive_o interrupt
input  serial_end_bit_i;                  // the last bit in the shifter reg to control
input  serial_transition_detected_i;      // detected result in the detector
input  serial_data_mode2_i;               // data from TDX in mode 2

output serial_clear_count_o;             //after a transition clear count of bit detecor
output serial_p3en_1_o;                  // change the port mode to port P3.1
output serial_p3en_0_o;                  // change the port mode to port P3.0
output serial_scon0_ri_o;              // serial_receive_o interrupt output
output serial_receive_o;                 // start serial_receive_o and shift serial_clock_i in mode 0
output serial_load_sbuf_o;			    // flag to write in the sbuf_rx
output serial_shift_input_shift_reg_o;   //shift to the input shift register
output serial_start_input_shift_reg_o;   //write in input shifter register 1FF or 1FE

//////////////////// Inputs and Outputs data types ////////////////////////////
wire serial_br_i;
wire serial_clock_i;
wire serial_reset_i_b;
wire serial_scon7_sm0_i;				
wire serial_scon4_ren_i;				 
wire serial_scon0_ri_i;			
wire serial_end_bit_i;               
wire serial_transition_detected_i;   
wire serial_data_mode2_i;            

reg serial_clear_count_o;             
reg serial_p3en_1_o;                 
reg serial_p3en_0_o;                 
reg serial_scon0_ri_o;              
reg serial_receive_o;                 
reg serial_load_sbuf_o;			    
reg serial_shift_input_shift_reg_o;   
reg serial_start_input_shift_reg_o;   

////////////////////  Internal variables //////////////////////////////////////
parameter START_IDLE           = 4'd0;
parameter WRITE_S_REG_MODE0    = 4'd1;
parameter RECEIVE_EN_MODE0     = 4'd2;
parameter RECEIVING_MODE0      = 4'd3;
parameter DO_SHIFT_MODE0       = 4'd4;
parameter WRITE_OUTPUTS_MODE0  = 4'd5;
parameter WRITE_SCON_RI	       = 4'd6;
parameter TRAN_DETECTOR        = 4'd7;
parameter WRITE_S_REG_MODE2    = 4'd8;
parameter VALIDATE_TRAN        = 4'd9;
parameter RECEIVE_EN           = 4'd10;
parameter RECEIVING_MODE2      = 4'd11;
parameter DO_SHIFT_MODE2       = 4'd12;
parameter DO_LAST_SHIFT	       = 4'd13;
parameter WRITE_OUTPUTS_MODE2  = 4'd14;



parameter STATE_BITS = 4;

reg[(STATE_BITS-1):0] state_rx;        // the actual state of the fsm
reg[(STATE_BITS-1):0] next_state_rx; 	// controls the next state in the fsm

reg START_INPUT_SHIFT_REG;	    // auxiliar to register the output
reg SHIFT_INPUT_SHIFT_REG;	    // auxiliar to register the output
reg P3EN_1;				// auxiliar to register the output
reg P3EN_0;				// auxiliar to register the output
reg RECEIVE;				// auxiliar to register the output
reg LOAD_SBUF;				// auxiliar to register the output
reg SCON0_RI_O;				// auxiliar to register the output
reg CLEAR_COUNT;			// auxiliar to register the output

reg br_detect;				// a BR posedge was found

reg      aux_tran_det;   //auxiliar to transition detector
reg      aux2_tran_det;  //auxiliar 2 to transition detector
wire     tran_det;



///////////////////  CODE BEGINS  /////////////////////////////////////////////
// always para controlar proximo estado da fsm
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      state_rx      <= START_IDLE;
   end
   else
   begin
      state_rx      <= next_state_rx;
   end
end

// always para controlar a logica da fsm
always @(state_rx or serial_scon7_sm0_i or serial_scon4_ren_i or serial_scon0_ri_i or br_detect or
         serial_end_bit_i or serial_transition_detected_i or serial_data_mode2_i)
begin
      next_state_rx         = START_IDLE; 
   case (state_rx)

      START_IDLE:          begin
                              if (serial_scon7_sm0_i == 1'b0) //se modo 0
                              begin
                                 if (serial_scon4_ren_i == 1'b1 && serial_scon0_ri_i == 1'b0)
                                 begin
                                    next_state_rx = WRITE_S_REG_MODE0; 
                                 end
                                 else
                                 begin
                                    next_state_rx = START_IDLE; 
                                 end
                              end
                              else //se modo 2
                              begin
                                 if (serial_scon4_ren_i == 1'b1 && serial_scon0_ri_i == 1'b0)
                                 begin
                                    next_state_rx = TRAN_DETECTOR; 
                                 end
                                 else
                                 begin
                                    next_state_rx = START_IDLE; 
                                 end
                              end
                           end
      
      WRITE_S_REG_MODE0:   begin
                              next_state_rx = RECEIVE_EN_MODE0;
                           end
                         
      RECEIVE_EN_MODE0:    begin
      			      if (br_detect)
      			      begin
       			         next_state_rx = RECEIVING_MODE0; 
      			      end
      			      else
      			      begin
      			         next_state_rx = RECEIVE_EN_MODE0; 
      			      end
                           end
      
      RECEIVING_MODE0:     begin
                              next_state_rx = DO_SHIFT_MODE0; 
                           end
      
      DO_SHIFT_MODE0:	   begin
                              if (br_detect == 1'b1)
                              begin
                                 if (serial_end_bit_i == 1'b1) // end serial_receive_o
                                 begin
                                    next_state_rx = WRITE_OUTPUTS_MODE0; 
                                 end
                                 else
                                 begin
                                    next_state_rx = RECEIVING_MODE0; 
                                 end
                              end
                              else
                              begin
                                 next_state_rx = DO_SHIFT_MODE0; 
                              end
      			   end
      
      WRITE_OUTPUTS_MODE0: begin
                              next_state_rx = WRITE_SCON_RI;
                           end
                         
      WRITE_SCON_RI:       begin
                              next_state_rx = START_IDLE;
                           end                   
                         
      TRAN_DETECTOR:       begin
                              if (serial_transition_detected_i == 1'b1)
                              begin
                                 next_state_rx = WRITE_S_REG_MODE2;  
                              end
                              else
                              begin
                                 next_state_rx = TRAN_DETECTOR; 
                              end
                           end      
                         
      WRITE_S_REG_MODE2:   begin
                              next_state_rx = VALIDATE_TRAN;
                           end                   
                         
      VALIDATE_TRAN:       begin
                              if (br_detect == 1'b1)
                              begin
                                 if (serial_data_mode2_i == 1'b0) //entao chegou start-bit
                                 begin
                                    next_state_rx = RECEIVE_EN; 
                                 end
                                 else // invalid start-bit
                                 begin
                                    next_state_rx = TRAN_DETECTOR;  
                                 end
                              end
                              else
                              begin
                                 next_state_rx = VALIDATE_TRAN; 
                              end
      		           end                   
      
      RECEIVE_EN:          begin
                              if (br_detect == 1'b1)
                              begin
                                 next_state_rx = RECEIVING_MODE2;    
                              end
                              else
                              begin
                                 next_state_rx = RECEIVE_EN; 
                              end
                           end
                         
      RECEIVING_MODE2:     begin
                               if (serial_end_bit_i == 1'b1) // do last shift
                               begin
                                 next_state_rx = DO_LAST_SHIFT; // do one more shift
                              end
                              else
                              begin
                                 next_state_rx = DO_SHIFT_MODE2; 
                              end
                           end
                         
      DO_SHIFT_MODE2:      begin
                              if (br_detect == 1'b1)
                              begin
                                 next_state_rx = RECEIVING_MODE2;
                              end
                              else
                              begin
                                 next_state_rx = DO_SHIFT_MODE2;
                              end          
                           end
      					      
      DO_LAST_SHIFT:       begin
                              if (br_detect == 1'b1)
                              begin
                                 next_state_rx = WRITE_OUTPUTS_MODE2;
                              end
                              else
                              begin
                                 next_state_rx = DO_LAST_SHIFT;
                              end
                           end					   
      					   
      WRITE_OUTPUTS_MODE2: begin
                              next_state_rx = START_IDLE;
                           end   
                         
      default:             begin
                              next_state_rx = START_IDLE;
                           end
   endcase
end

// always para definir as saidas de acordo com o estados atuais
always @(state_rx)
begin
   // internal auxiliar registers
      START_INPUT_SHIFT_REG = 1'b0;
      SHIFT_INPUT_SHIFT_REG = 1'b0;
      P3EN_0		    = 1'b0;
      P3EN_1		    = 1'b1;
      RECEIVE		    = 1'b0;
      LOAD_SBUF		    = 1'b0;
      SCON0_RI_O	    = 1'b0;
      CLEAR_COUNT           = 1'b0;
   case (state_rx)
      START_IDLE:          begin
			      START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE               = 1'b0;
                              LOAD_SBUF             = 1'b0;
      			      SCON0_RI_O            = 1'b0;
      			      CLEAR_COUNT           = 1'b0;     
                           end
      
      WRITE_S_REG_MODE0:   begin
                              START_INPUT_SHIFT_REG = 1'b1;  // activate 1FE in input_s_reg  
                              P3EN_0                = 1'b0;  // port as input 
                              P3EN_1                = 1'b1;  // port as output
                              
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE		    = 1'b0;
     			      LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O	    = 1'b0;
      			      CLEAR_COUNT	    = 1'b0; 
                           end
                         
      RECEIVE_EN_MODE0:    begin
                              START_INPUT_SHIFT_REG = 1'b0;
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O  	    = 1'b0;
      			      CLEAR_COUNT	    = 1'b0;     
                              RECEIVE    	    = 1'b1;
                           end
      
      RECEIVING_MODE0:     begin
      			      START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              RECEIVE		    = 1'b1;
                              
       			      SCON0_RI_O	    = 1'b0;
       			      CLEAR_COUNT	    = 1'b0;     
      			      SHIFT_INPUT_SHIFT_REG = 1'b1;
      			      LOAD_SBUF		    = 1'b0;
                              
                           end
                           
      DO_SHIFT_MODE0:            begin
      						  START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              RECEIVE		    = 1'b1;
       	        	      SCON0_RI_O	    = 1'b0;
       			      CLEAR_COUNT	    = 1'b0;     
      			      LOAD_SBUF		    = 1'b0;
                              SHIFT_INPUT_SHIFT_REG = 1'b0; //mantain in 0
                           end                     
                           
      WRITE_OUTPUTS_MODE0: begin
         		      LOAD_SBUF		    = 1'b1;
        	      
        		      SCON0_RI_O            = 1'b0;
        		      START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE		    = 1'b0;
                              CLEAR_COUNT	    = 1'b0;
                           end  
                                
      WRITE_SCON_RI:       begin
                              SCON0_RI_O            = 1'b1;
          				      
          		      LOAD_SBUF		    = 1'b0;
          		      START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE		    = 1'b0;
                              CLEAR_COUNT	    = 1'b0;
                           end                          
                                     
      TRAN_DETECTOR:       begin
                              START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE		    = 1'b0;
      			      LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O	    = 1'b0;
      			      CLEAR_COUNT	    = 1'b0;
                           end      
                         
      WRITE_S_REG_MODE2:   begin
                              START_INPUT_SHIFT_REG = 1'b1;  // activate 1FF in input_s_reg  
                              P3EN_0                = 1'b0;  // port as input 
                              CLEAR_COUNT	    = 1'b1;  // clear the count in detector
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE		    = 1'b0;
      			      LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O	    = 1'b0;
      			   end                   
                         
      VALIDATE_TRAN:       begin
                              START_INPUT_SHIFT_REG = 1'b0;  // desactivated   
                              P3EN_0                = 1'b0;  // port as input 
                              CLEAR_COUNT	    = 1'b0;  // desactivated
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
      			      LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O	    = 1'b0;
     
                              RECEIVE = 1'b0;  
      			   end                   
                         
      RECEIVE_EN:          begin
                              START_INPUT_SHIFT_REG = 1'b0;  // desactivated   
                              P3EN_0                = 1'b0;  // port as input 
                              CLEAR_COUNT	    = 1'b0;  // desactivated
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
      			      LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O	    = 1'b0;
     
                              RECEIVE               = 1'b1; // enable serial_receive_o          
                           end          
                         
                         
      RECEIVING_MODE2:     begin
                              START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
       			      SCON0_RI_O	    = 1'b0;
       			      CLEAR_COUNT	    = 1'b0;     
                              RECEIVE		    = 1'b1; 
                              LOAD_SBUF		    = 1'b0;
                              
                              SHIFT_INPUT_SHIFT_REG = 1'b1; //Send a shift 
      					   end
      					   
      DO_SHIFT_MODE2:      begin
                              START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
       	                      SCON0_RI_O	    = 1'b0;
       			      CLEAR_COUNT	    = 1'b0;     
                              RECEIVE		    = 1'b1; 
                              LOAD_SBUF		    = 1'b0;
                              
                              SHIFT_INPUT_SHIFT_REG = 1'b0; // Down shift 
                           end					   
      					   
      DO_LAST_SHIFT:       begin
                              START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              RECEIVE		    = 1'b1;
      			      SCON0_RI_O	    = 1'b0; 
      			      CLEAR_COUNT	    = 1'b0;
                              SHIFT_INPUT_SHIFT_REG = 1'b0; //down last shift
      			      LOAD_SBUF			    = 1'b0; 
      			   end					   
      					   
      WRITE_OUTPUTS_MODE2: begin
                              START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE	    	    = 1'b0;
      			      SCON0_RI_O	    = 1'b1;
      			      CLEAR_COUNT	    = 1'b0;
      				      
      			      LOAD_SBUF		    = 1'b1; //write sbuf_rx and rb8
                           end                               
                                        
      default:             begin
          		      START_INPUT_SHIFT_REG = 1'b0;   
                              P3EN_0                = 1'b0;  
                              P3EN_1                = 1'b1;
                              SHIFT_INPUT_SHIFT_REG = 1'b0;
                              RECEIVE		    = 1'b0;
      			      LOAD_SBUF		    = 1'b0;
      			      SCON0_RI_O	    = 1'b0; 
      			      CLEAR_COUNT	    = 1'b0;
                           end
      
                       
   endcase 
end


// always to start variables and register the outputs
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      // outputs
      serial_start_input_shift_reg_o <= 1'b0;
      serial_shift_input_shift_reg_o <= 1'b0;
      serial_p3en_0_o	    	    <= 1'b0;
      serial_p3en_1_o     	    <= 1'b0; 
      serial_receive_o		    <= 1'b0;
      serial_load_sbuf_o	    <= 1'b0;
      serial_scon0_ri_o	            <= 1'b0;
      serial_clear_count_o          <= 1'b0;
   end
   else
   begin
       // register the outputs 
      serial_start_input_shift_reg_o   <= START_INPUT_SHIFT_REG;
      serial_shift_input_shift_reg_o   <= SHIFT_INPUT_SHIFT_REG;
      serial_p3en_0_o		       <= P3EN_0;
      serial_p3en_1_o		       <= P3EN_1;
      serial_receive_o		       <= RECEIVE;
      serial_load_sbuf_o	       <= LOAD_SBUF;
      serial_clear_count_o             <= CLEAR_COUNT;
      
      if (SCON0_RI_O == 1'b1) //mantain the value until it change
      begin
         serial_scon0_ri_o <= 1'b1;
      end
      else
      begin
         serial_scon0_ri_o <= serial_scon0_ri_i;
      end
      
   end     
end


// transition detector 0-to-1
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      br_detect 	  <= 1'b0;
      aux_tran_det        <= 1'b0;
      aux2_tran_det       <= 1'b0; 
   end
   else
   begin
      aux_tran_det        <= serial_br_i;
      aux2_tran_det       <= aux_tran_det; 
      
      br_detect           <= tran_det; 
   end 
end

// sinal que fica em um toda vez que ocorreu uma transicao de borda
assign tran_det = (aux_tran_det && !aux2_tran_det);

endmodule
