// -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: bus_control.v
// Module Name:bus_control
// Author: Jonatas Valentim Ferrari
// E-mail: jonatasferrari@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 20/08/2010 Initial version
// 2.0 24/08/2010 Alteracao do bloco start
// 3.0 25/08/2010 change of the all RTL code
// 4.0 01/09/2010 change of the RTL code
// 5.0 13/09/2010 change of the RTL code
// 6.0 20/09/2010 change of the RTL code
// 7.0 30/09/2010 change in the signal bus_control_core_p0_io 
// 8.0 09/11/2010 change in the siginal bus_control
// 9.0 24/11/2010 change in the siginal bus_control
// 
// 
// // -------------------------------------------------------------------
// Description
// This file describes the coding style to be used on rtl
// implementations.
// File names must be all lowercase separated by underscore if needed
// -------------------------------------------------------------------
module bus_control(
							bus_control_ea_b_i,
							bus_control_core_ext_data_i,
							bus_control_core_ext_addr_i,
							bus_control_core_ext_ram_wr_b_i,
							bus_control_core_ext_ram_rd_b_i,
							bus_control_core_ext_rom_rd_b_i,
							bus_control_psen_b_o,
							bus_control_core_ext_data_o,
							bus_control_core_ea_b_o,
							bus_control_core_p0_i,
							bus_control_ports_p0_i,
							
							//new inputs
							bus_control_core_p0en_i,
							bus_control_core_p2_i,
							bus_control_core_p2en_i,
							bus_control_core_p3_6_i,
							bus_control_core_p3_7_i,
							bus_control_core_p3en_6_i,
							bus_control_core_p3en_7_i,
							bus_control_core_p4_i,
                     
							bus_control_core_p0_o,
							bus_control_core_p0en_o,
							bus_control_core_p2_o,
							bus_control_core_p2en_o,
							bus_control_core_p3_6_o,
							bus_control_core_p3_7_o,
							bus_control_core_p3en_6_o,
							bus_control_core_p3en_7_o,
                     bus_control_core_p4_o
						);
//Declaration of the Input
input  [7:0]    bus_control_core_ext_data_i;// Input Bus Control which contains the information from the Memory Control  to external Memory
input  [15:0]   bus_control_core_ext_addr_i;// Input Bus Control which contains the address of the Memory
input           bus_control_core_ext_ram_wr_b_i;// Input Bus Control which enable the writing on the RAM
input           bus_control_core_ext_ram_rd_b_i;// Input Bus Control which enable the reading on the RAM
input           bus_control_core_ext_rom_rd_b_i;// Input Bus Control which enable the reading on the ROM
input           bus_control_ea_b_i;// Input Bus Control which enable the external Memory access
input  [7:0]    bus_control_core_p0_i;
input  [7:0]    bus_control_ports_p0_i;

input  [7:0]    bus_control_core_p0en_i;// input  Bus Control (Register for enable Port 0) 
input  [7:0]    bus_control_core_p2en_i;// input  Bus Control (Register for enable Port 2)
input  [7:0]    bus_control_core_p2_i;// Pin P2 responsible for 8-MSB
input           bus_control_core_p3_6_i;// Pin P3.6 responsible for -  Write Strobe for External Memory
input           bus_control_core_p3_7_i;//P3.7 responsible for - Read Strobe for ExternalMemory
input           bus_control_core_p3en_6_i;// Register for enable P3.6
input           bus_control_core_p3en_7_i;// register for enable P3.7
input  [7:0]    bus_control_core_p4_i;// Pin P4 responsible for 8-LSB 


wire   [7:0]    bus_control_core_ext_data_i;
wire   [15:0]   bus_control_core_ext_addr_i;
wire            bus_control_core_ext_ram_wr_b_i;
wire            bus_control_core_ext_ram_rd_b_i;
wire            bus_control_core_ext_rom_rd_b_i;
wire            bus_control_ea_b_i;
wire   [7:0]    bus_control_core_p0_i;
wire   [7:0]    bus_control_ports_p0_i;

//Declaration of the Output
output [7:0]    bus_control_core_p0_o;
output [7:0]    bus_control_core_ext_data_o;// Output Bus Control that contains the information  from external Memory to Memory Control
output [7:0]    bus_control_core_p0en_o;// Output Bus Control (Register for enable Port 0) 
output [7:0]    bus_control_core_p2en_o;// Output Bus Control (Register for enable Port 2)
output [7:0]    bus_control_core_p2_o;// Pin P2 responsible for 8-MSB
output          bus_control_core_p3_6_o;// Pin P3.6 responsible for -  Write Strobe for External Memory
output          bus_control_core_p3_7_o;//P3.7 responsible for - Read Strobe for ExternalMemory
output          bus_control_core_p3en_6_o;// Register for enable P3.6
output          bus_control_core_p3en_7_o;// register for enable P3.7
output [7:0]    bus_control_core_p4_o;// Pin P4 responsible for 8-LSB 
output          bus_control_psen_b_o;// Program Store Enable
output          bus_control_core_ea_b_o;// External Memory Access Enable

reg    [7:0]    bus_control_core_p0_o;
reg    [7:0]    bus_control_core_ext_data_o;
reg             bus_control_psen_b_o;
reg    [7:0]    bus_control_core_p0en_o;
reg    [7:0]    bus_control_core_p2en_o;
reg    [7:0]    bus_control_core_p2_o;
reg             bus_control_core_p3_6_o;
reg             bus_control_core_p3_7_o;
reg             bus_control_core_p3en_6_o;
reg             bus_control_core_p3en_7_o;
reg    [7:0]    bus_control_core_p4_o;

// Declaration of the FSM
localparam [2:0]  ROM_RD = 3'b011;
localparam [2:0]  RAM_RD = 3'b101;
localparam [2:0]  RAM_WR = 3'b110;

assign bus_control_core_ea_b_o = bus_control_ea_b_i;//  Passing the  data pin bus_control_ea_b_i Bus Control  to the CORE pin in bus_control_core_ea_b_o to enable or disable access to external

always @ 
(
   bus_control_core_ext_ram_wr_b_i,
   bus_control_core_ext_ram_rd_b_i ,
   bus_control_core_ext_rom_rd_b_i, 
   bus_control_core_ext_addr_i, 
   bus_control_core_p0_i,
   bus_control_ports_p0_i,
   bus_control_core_ext_data_i,
   bus_control_core_p0en_i,
   bus_control_core_p3_6_i,
   bus_control_core_p2_i,
   bus_control_core_p2en_i,
   bus_control_core_p3_7_i,
   bus_control_core_p3en_6_i,
   bus_control_core_p3en_7_i,
   bus_control_core_p4_i
)
begin	
	case ({bus_control_core_ext_rom_rd_b_i, bus_control_core_ext_ram_rd_b_i, bus_control_core_ext_ram_wr_b_i })
		ROM_RD:  //Acess external ROM to read
		begin
			bus_control_core_p0en_o     = 8'b00000000;//Enabling  the Port 0  as input.
			bus_control_core_p2en_o     = 8'b11111111;//Enabling  the Port 2  as output.
			bus_control_core_p2_o       = bus_control_core_ext_addr_i[15:8];//Putting the 8 bits MSB in Port 2
			bus_control_core_p4_o       = bus_control_core_ext_addr_i[7:0];//Putting the 8 bits LSB in Port 4
			bus_control_psen_b_o        = 1'b0;
			bus_control_core_p3_6_o     = 1'b1;// Putting bit 1 - Read Strobe for ExternalMemory
			bus_control_core_p3_7_o     = 1'b0;// Putting bit 0 - Read Strobe for ExternalMemory
			bus_control_core_p3en_6_o   = 1'b1;// Enable the pin P3.6 to output
			bus_control_core_p3en_7_o   = 1'b1;// Enable the pin P3.7 to output
			bus_control_core_ext_data_o = bus_control_ports_p0_i;// putting information bus_control_core_p0_i in bus_control_core_ext_data_o 
			bus_control_core_p0_o        = 8'b00000000;
		end// End of external ROM access  
		
		RAM_RD://Acess external RAM to read
		begin
			bus_control_core_p0en_o     = 8'b00000000;//Enabling  the Port 0  as input
			bus_control_core_p4_o       = bus_control_core_ext_addr_i[7:0];//Putting the 8 bits LSB in Port 4
			bus_control_core_p3_6_o     = 1'b1;//  Putting bit 1 - Read Strobe for ExternalMemory
			bus_control_core_p3_7_o     = 1'b0;// Putting bit 0 - Read Strobe for ExternalMemory
			bus_control_core_p3en_6_o   = 1'b1;// Enable the pin P3.6 to output
			bus_control_core_p3en_7_o   = 1'b1;// Enable the pin P3.7 to output
			bus_control_psen_b_o        = 1'b0;
			bus_control_core_ext_data_o = bus_control_ports_p0_i;// putting information bus_control_core_p0_i in bus_control_core_ext_data_o 
			// Treating all outputs that are not being used
			bus_control_core_p2_o       = bus_control_core_p2_i;
			bus_control_core_p2en_o     = 8'b00000000;
			bus_control_core_p0_o       = 8'b00000000;
		end // End of external RAM access  
		
		RAM_WR://Acess external RAM to write
		begin
			bus_control_core_p0en_o     = 8'b11111111;//Enabling  the Port 0  as output.
			bus_control_core_p3_6_o     = 1'b0;//  Putting bit 0 - Write Strobe for External Memory
			bus_control_core_p3_7_o     = 1'b1;// Putting bit 1 - Write Strobe for External Memory
			bus_control_core_p3en_6_o   = 1'b1;// Enable the pin P3.6 to output
			bus_control_core_p3en_7_o   = 1'b1;// Enable the pin P3.6 to output
			bus_control_core_p4_o       = bus_control_core_ext_addr_i[7:0];//Putting the 8 bits LSB in Port 4
			bus_control_psen_b_o        = 1'b0;
			bus_control_core_p0_o       = bus_control_core_ext_data_i;// putting information bus_control_core_ext_data_i in bus_control_core_p0_o
			bus_control_core_p2_o       = bus_control_core_p2_i;
			bus_control_core_p2en_o     = bus_control_core_p2en_i;
			bus_control_core_ext_data_o = 8'b00000000;
		end // End of external RAM access  

		default: // Treating all other conditions that are not begin used
		begin
			bus_control_core_ext_data_o = bus_control_ports_p0_i;
			bus_control_core_p0_o       = bus_control_core_p0_i;
			bus_control_core_p0en_o     = bus_control_core_p0en_i;
			bus_control_core_p3_6_o     = bus_control_core_p3_6_i;
			bus_control_core_p3_7_o     = bus_control_core_p3_7_i;
			bus_control_core_p3en_6_o   = bus_control_core_p3en_6_i;
			bus_control_core_p3en_7_o   = bus_control_core_p3en_7_i;
			bus_control_core_p4_o       = bus_control_core_p4_i; 
			bus_control_core_p2_o       = bus_control_core_p2_i;
			bus_control_core_p2en_o     = bus_control_core_p2en_i;
			bus_control_psen_b_o        = 1'b1;
		end // End treatment all other conditions that are not begin used
	endcase// End Case
end// End Always
endmodule





