// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: serial_tx_control.v
// Module Name: serial
// Author: Harney Abrahim
// E-mail: harneybelem@gmail.com 
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 27/08/2010 Initial version
// 2.0 08/09/2010 Fixed some state bugs
// 2.1 09/09/2010 Latch removed
// 2.2 10/09/2010 Standard signals names
// 2.3 25/11/2010 Added new signal to to control idle mode 
// -------------------------------------------------------------------
// Description
// Implements the TX serial control (FSM) to both modes0 and mode2. It 
// uses a FSM that controls each state of the transmitter. Added, this
// controls the ports configurations
// -------------------------------------------------------------------

module serial_tx_control    ( 
			  serial_br_i,
                          serial_clock_i,
                          serial_reset_i_b,
                          serial_scon7_sm0_i,
                          serial_scon1_ti_i,
                          serial_end_bit_i,
                          serial_serial_tx_i,
                          
                          serial_p3en_0_o,
                          serial_p3en_1_o,
                          serial_data_en_o,
                          serial_send_o,
                          serial_scon1_ti_o,
                          serial_shift_o,
                          serial_stop_bit_gen_o,
                          serial_start_shifter_reg_o,
			  serial_start_idle_o
                          ); 

/////////////////////  Inputs and Outputs /////////////////////////////////////
input  serial_br_i;                       // baud rate depending the operation mode
input  serial_clock_i;                    // main serial_clock_i
input  serial_reset_i_b;                  // main serial_reset_i_b
input  serial_scon7_sm0_i;		 // operation mode
input  serial_scon1_ti_i;		 // transmit interrupt
input  serial_end_bit_i;                  // the last bit in the serial_shift_oer reg to control
input  serial_serial_tx_i;                // write_sbuf was enable, than need to transmit 

output serial_p3en_1_o;                  // change the port mode to port P3.1
output serial_p3en_0_o;                  // change the port mode to port P3.0
output serial_data_en_o;		// enable data to be transmitted at the port
output serial_send_o;			// begins the transmission
output serial_scon1_ti_o;			// transmit interrupt after end the transmission
output serial_shift_o;				// serial_shift_o to controls the serial_shift_oer reg      
output serial_stop_bit_gen_o;			// start the generation of stop bit in serial_shift_oer reg
output serial_start_shifter_reg_o;		// starts the serial_shift_oer reg and some control in the fsm
output serial_start_idle_o;		// to put 1 in out port to idle mode

//////////////////// Inputs and Outputs data types ////////////////////////////
wire serial_br_i;
wire serial_clock_i;
wire serial_reset_i_b;
wire serial_scon7_sm0_i;				
wire serial_scon1_ti_i;
wire serial_end_bit_i;
wire serial_serial_tx_i;

reg serial_p3en_1_o;
reg serial_p3en_0_o;
reg serial_data_en_o;
reg serial_send_o;
reg serial_shift_o;
reg serial_scon1_ti_o;
reg serial_stop_bit_gen_o;
reg serial_start_shifter_reg_o;
reg serial_start_idle_o;


////////////////////  Internal variables //////////////////////////////////////
parameter STATE_BITS = 4;

reg[STATE_BITS-1:0] state_tx;     
reg[STATE_BITS-1:0] next_state_tx;

parameter START             = 4'd0;
parameter TRANSMIT_MODE0    = 4'd1;
parameter DO_SHIFT_MODE0    = 4'd2;
parameter SET_FLAGS         = 4'd3;
parameter CONFIG_MODE2      = 4'd4;
parameter SEND_START_BIT    = 4'd5; 
parameter IDLE_TX_MODE2     = 4'd6;
parameter TRANSMIT_MODE2    = 4'd7;
parameter DO_FIRST_SHIFT    = 4'd8;
parameter DO_SHIFT_MODE2    = 4'd9;
parameter DO_IDLE	    = 4'd10;
parameter DO_IDLE2	    = 4'd11;


reg P3EN_1;			// auxiliar to register the output
reg P3EN_0;			// auxiliar to register the output
reg DATA_EN;			// auxiliar to register the output
reg SEND;			// auxiliar to register the output
reg SHIFT;			// auxiliar to register the output
reg SCON1_TI_O;			// auxiliar to register the output
reg STOP_BIT_GEN;		// auxiliar to register the output
reg START_SHIFTER_REG;	        // auxiliar to register the output
reg DO_IDLE_REG;

reg br_detect;			// a BR posedge was found
reg br_detect1;

reg      aux_tran_det;  // auxiliar to transition detector
reg      aux2_tran_det; // auxiliar 2 to transition detector

wire     tran_det;      // get the serial_br_i transition
wire     tran_det2;

reg      do_first_shift_flag; // Flag to control the firs serial_shift_o state 
reg      DO_FIRST_SHIFT_FLAG; // Flag to control the firs serial_shift_o state

///////////////////  CODE BEGINS  /////////////////////////////////////////////
// always para controlar proximo estado da fsm
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      state_tx      <= START;
   end
   else
   begin
      state_tx      <= next_state_tx;
   end
end

// always para controlar a logica da fsm
always @(serial_scon7_sm0_i or serial_serial_tx_i or serial_scon1_ti_i or state_tx or br_detect or serial_end_bit_i)
begin
   next_state_tx         = START;
   P3EN_1                = 1'b1; // port 3.1 output port 			
   P3EN_0                = 1'b0; // port 3.0 output port
   SCON1_TI_O            = 1'b0;
      
   case (state_tx)
      START:             begin
                            SCON1_TI_O            = 1'b0;
                            if (serial_scon7_sm0_i == 1'b0)
                            begin
                               if (serial_serial_tx_i == 1'b1 && serial_scon1_ti_i == 1'b0)
                               begin
                                  next_state_tx = TRANSMIT_MODE0;
                                  P3EN_1                = 1'b1; // port 3.1 output port 			
                                  P3EN_0                = 1'b1; // port 3.0 output port
                               end
                               else
                               begin
                                  P3EN_1                = 1'b1; // port 3.1 output port 			
                                  P3EN_0                = 1'b0; // port 3.0 output port
                                  next_state_tx = START;
                               end
                            end
                            else //mode 2
                            begin
                               if (serial_serial_tx_i == 1'b1 && serial_scon1_ti_i == 1'b0)
                               begin
                                  next_state_tx = DO_IDLE;
                                  P3EN_1                = 1'b1; // port 3.1 output port 			
                                  P3EN_0                = 1'b0; // port 3.0 output port 
                               end
                               else
                               begin
                                  P3EN_1                = 1'b1; // port 3.1 output port 			
                                  P3EN_0                = 1'b0; // port 3.0 output port
                                  next_state_tx = START; 
                               end 
                            end
                         end
      TRANSMIT_MODE0:    begin
                            next_state_tx = DO_SHIFT_MODE0;
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b1; // port 3.0 output port
                            SCON1_TI_O            = 1'b0;
      			 end
      
      DO_SHIFT_MODE0:    begin
                            SCON1_TI_O            = 1'b0;
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b1; // port 3.0 output port
                            if (br_detect1 == 1'b1) //serial_send_o a serial_shift_o
                            begin
                                if (serial_end_bit_i == 1'b1)
 				begin
 				  next_state_tx = SET_FLAGS; 
 				end 
 				else     
                                begin
                                  next_state_tx = TRANSMIT_MODE0; 
                                end
                            end
                            else
                            begin
                                next_state_tx = DO_SHIFT_MODE0;
                            end
      			end
      
      SET_FLAGS:         begin
			   if (serial_scon7_sm0_i == 1'b0)
                           begin
                              P3EN_1                = 1'b1; // port 3.1 output port 			
                              P3EN_0                = 1'b1; // port 3.0 output port 
                           end
                           else //mode 2
                           begin
                              P3EN_1                = 1'b1; // port 3.1 output port 			
                              P3EN_0                = 1'b0; // port 3.0 input
                           end 
          		   next_state_tx = START;
                           SCON1_TI_O            = 1'b1; //need to be en
      			 end
      				
                         
       DO_IDLE:   	begin
                           P3EN_1                = 1'b1; // port 3.1 output port 			
                           P3EN_0                = 1'b0; // port 3.0 output port
                           SCON1_TI_O            = 1'b0;
                           if (br_detect == 1'b1)
                           begin
                              next_state_tx = DO_IDLE2;
                           end
                           else
                           begin
                              next_state_tx = DO_IDLE;
                           end
                           
			end
                        
      DO_IDLE2:   	begin
                           P3EN_1                = 1'b1; // port 3.1 output port 			
                           P3EN_0                = 1'b0; // port 3.0 output port
                           SCON1_TI_O            = 1'b0;
                           if (br_detect == 1'b1)
                           begin
                              next_state_tx = CONFIG_MODE2;
                           end
                           else
                           begin
                              next_state_tx = DO_IDLE2;
                           end
                           
			end				 
                         
                         	 
      CONFIG_MODE2:      begin
                           SCON1_TI_O            = 1'b0;
                           P3EN_1                = 1'b1; // port 3.1 output port 			
                           P3EN_0                = 1'b0; // port 3.0 output port
          		   //next_state_tx = SEND_START_BIT;
                           next_state_tx = IDLE_TX_MODE2;
      			end					 
      
      SEND_START_BIT:    begin
                            SCON1_TI_O            = 1'b0;
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b0; // port 3.0 output port
                            if (br_detect == 1'b1) // wait the next BR
                            begin
                               next_state_tx = IDLE_TX_MODE2;  
                            end
                            else
                            begin
                               next_state_tx = SEND_START_BIT; 
                            end
                         end
      
      IDLE_TX_MODE2:     begin
                            SCON1_TI_O            = 1'b0;
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b0; // port 3.0 output port
          		    if (br_detect == 1'b1) // wait the next BR
                            begin
                               next_state_tx = TRANSMIT_MODE2;  
                            end
                            else
                            begin
                               next_state_tx = IDLE_TX_MODE2; 
                            end
      			 end
      
      TRANSMIT_MODE2:    begin
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b0; // port 3.0 output port
                            if (do_first_shift_flag == 1'b1)
                            begin
                               next_state_tx = DO_FIRST_SHIFT; 
                            end
                            else 
                            begin
                               if (serial_end_bit_i == 1'b1)
 			       begin
 				  next_state_tx = SET_FLAGS;
                                  SCON1_TI_O            = 1'b1;
                                  //SCON1_TI_O            = 1'b0;  //added to test
 			       end 
 			       else     
                               begin
                                  next_state_tx = DO_SHIFT_MODE2;
                                  SCON1_TI_O            = 1'b0;  
                               end
                            end
      			 end
      
      DO_FIRST_SHIFT:    begin
                            SCON1_TI_O            = 1'b0;
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b0; // port 3.0 output port
                            if (br_detect == 1'b1) // wait the next BR
                            begin
          		       next_state_tx = TRANSMIT_MODE2; 
                            end
          		    else
          		    begin
          		       next_state_tx = DO_FIRST_SHIFT; 
          		    end
      			 end
      
      DO_SHIFT_MODE2:    begin
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b0; // port 3.0 output port
                            if (serial_end_bit_i == 1'b1)
                            begin
                               //SCON1_TI_O         = 1'b1;
                               SCON1_TI_O            = 1'b0;  //added to test
                            end 
                            else     
                            begin
                               SCON1_TI_O            = 1'b0;
                            end
                            
                            
          		    if (br_detect == 1'b1) // wait the next BR
                            begin
          		       next_state_tx = TRANSMIT_MODE2; 
          		    end   
          		    else
          		    begin
          		       next_state_tx = DO_SHIFT_MODE2; 
          		    end
      			 end
                         
      default:           begin
                            next_state_tx = START;
                            SCON1_TI_O            = 1'b0;
                            P3EN_1                = 1'b1; // port 3.1 output port 			
                            P3EN_0                = 1'b0; // port 3.0 output port
                         end
   endcase
end

// Define the outputs of each state in the FSM
always @(state_tx)
begin
   // internal auxiliar registers
      DATA_EN               = 1'b0;
      SEND                  = 1'b0;
      SHIFT                 = 1'b0;
      STOP_BIT_GEN          = 1'b0;
      START_SHIFTER_REG     = 1'b0;
      DO_FIRST_SHIFT_FLAG   = 1'b0;
      DO_IDLE_REG           = 1'b0;
   case (state_tx)
      START:             begin
                            DATA_EN               = 1'b0;			
                            SEND                  = 1'b0;				
                            SHIFT                 = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;		
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            START_SHIFTER_REG     = 1'b0;
                            DO_IDLE_REG               = 1'b0;
                         end
      
      TRANSMIT_MODE0:    begin
                            SEND                  = 1'b1; // active serial_send_o
                            SHIFT                 = 1'b1; // actvate serial_shift_o
                            
                            DATA_EN               = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            START_SHIFTER_REG     = 1'b0; 
                            DO_IDLE_REG               = 1'b0;  
      			 end
      
      DO_SHIFT_MODE0:    begin
                            SEND                  = 1'b1; // active serial_send_o
                            SHIFT                 = 1'b0; // desactivate serial_shift_o
                            
                            DATA_EN               = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            START_SHIFTER_REG     = 1'b0;
                            DO_IDLE_REG               = 1'b0;
      			 end
      
      SET_FLAGS:         begin
                            SEND                  = 1'b0; // desactivate serial_send_o
                            SHIFT                 = 1'b0; // desactivate serial_send_o
                            
                            DATA_EN               = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            START_SHIFTER_REG     = 1'b0;
                            DO_IDLE_REG               = 1'b0;
      			 end
      					 
      
      DO_IDLE:          begin
                            SEND                  = 1'b1; 
                            SHIFT                 = 1'b0; 
                            
                            DO_IDLE_REG           = 1'b1;
                            DATA_EN               = 1'b1;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            START_SHIFTER_REG     = 1'b0;
                            
                        end
      
       DO_IDLE2:        begin
                            SEND                  = 1'b1; 
                            SHIFT                 = 1'b0; 
                            
                            DO_IDLE_REG           = 1'b1;
                            DATA_EN               = 1'b1;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            START_SHIFTER_REG     = 1'b0;
                            
                        end
      
      CONFIG_MODE2:      begin
          		    START_SHIFTER_REG     = 1'b1; // start serial_shift_oer reg
                            				
                            DATA_EN               = 1'b1;			
                            SEND                  = 1'b1;				
                            SHIFT                 = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            DO_IDLE_REG               = 1'b0;		
      			end					 
      
      SEND_START_BIT:    begin
                            START_SHIFTER_REG     = 1'b0; // start serial_shift_oer reg
                            SEND                  = 1'b1; // activate start bit on output
                            
                            DATA_EN               = 1'b1; 
                            SHIFT                 = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            DO_IDLE_REG               = 1'b0;	
                         end
      
      IDLE_TX_MODE2:     begin
          		    START_SHIFTER_REG     = 1'b0; // desactivated
                            SEND                  = 1'b1; // activate serial_send_o
                            DATA_EN               = 1'b1; // enable data output
                            			
                            SHIFT                 = 1'b0;			
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b1;
                            DO_IDLE_REG               = 1'b0;
      			end
      
      TRANSMIT_MODE2:    begin
			    SHIFT                 = 1'b1; // serial_send_o a serial_shift_o
 
                            START_SHIFTER_REG     = 1'b0; // desactivated
                            SEND                  = 1'b1; // activate serial_send_o
                            DATA_EN               = 1'b1; // enable data output
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = do_first_shift_flag;
                            DO_IDLE_REG               = 1'b0;
     			 end
      
      DO_FIRST_SHIFT:    begin
          		    SHIFT                 = 1'b0; // serial_send_o a serial_shift_o
                            DO_FIRST_SHIFT_FLAG   = 1'b0; // clear the flag
                            STOP_BIT_GEN          = 1'b1; // put 1 as stop bit 
                            
                            START_SHIFTER_REG     = 1'b0; // desactivated
                            SEND                  = 1'b1; // activate serial_send_o
                            DATA_EN               = 1'b1; // enable data output
                            DO_IDLE_REG               = 1'b0;
      			 end
      
      DO_SHIFT_MODE2:    begin
          		    SHIFT                 = 1'b0; // serial_send_o a serial_shift_o
 
                            START_SHIFTER_REG     = 1'b0; // desactivated
                            SEND                  = 1'b1; // activate serial_send_o
                            DATA_EN               = 1'b1; // enable data output
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            DO_IDLE_REG               = 1'b0;
      			end
                         
      default:           begin
                            
                            START_SHIFTER_REG     = 1'b0; 
                            SEND                  = 1'b0; 
                            DATA_EN               = 1'b0; 
                            STOP_BIT_GEN          = 1'b0;
                            DO_FIRST_SHIFT_FLAG   = 1'b0;
                            SHIFT                 = 1'b0;
                            DO_IDLE_REG               = 1'b0;
                         end
      endcase 
end

// always to start variables and register the outputs
always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      // outputs
      serial_start_shifter_reg_o        <= 1'b0;
      serial_shift_o                    <= 1'b0;
      serial_p3en_0_o	    		<= 1'b0;
      serial_p3en_1_o     		<= 1'b0; 
      serial_send_o	    		<= 1'b0;
      serial_data_en_o   		<= 1'b0;
      serial_scon1_ti_o			<= 1'b0;
      serial_stop_bit_gen_o             <= 1'b0;
      
      do_first_shift_flag               <= 1'b0;
      serial_start_idle_o               <= 1'b0;
   end
   else
   begin
      // register the outputs 
      serial_shift_o                <= SHIFT;
      serial_p3en_0_o		    <= P3EN_0;
      serial_p3en_1_o		    <= P3EN_1;
      serial_send_o		    <= SEND;
      serial_data_en_o		    <= DATA_EN;
      serial_start_shifter_reg_o    <= START_SHIFTER_REG;
      serial_stop_bit_gen_o         <= STOP_BIT_GEN;
      do_first_shift_flag           <= DO_FIRST_SHIFT_FLAG;
      serial_start_idle_o           <= DO_IDLE_REG;
      
      if (SCON1_TI_O == 1'b1) //added to test
      begin
         serial_scon1_ti_o <= 1'b1;
      end
      else
      begin
         serial_scon1_ti_o <= serial_scon1_ti_i;
      end
      
   end     
end

always @(posedge serial_clock_i)
begin
   if (serial_reset_i_b == 1'b0)
   begin
      br_detect           <= 1'b0;
      aux_tran_det        <= 1'b0;
      aux2_tran_det       <= 1'b0; 

   end
   else
   begin
      aux_tran_det        <= serial_br_i;
      aux2_tran_det       <= aux_tran_det; 
      
      br_detect           <= tran_det; 
      br_detect1           <= tran_det2;
   end 
end

// sinal que fica em um toda vez que ocorreu uma transicao de borda
assign tran_det = (aux_tran_det && !aux2_tran_det);
assign tran_det2 = (!aux_tran_det && aux2_tran_det);


endmodule
