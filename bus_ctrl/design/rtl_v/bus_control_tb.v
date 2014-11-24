/ -------------------------------------------------------------------
// CI Brasil - CT2 Campinas
// Phase II Project
// EMC08 - 8 Bit Microcontroller for Automotive Engine Application
// -------------------------------------------------------------------
// File Name: bus_control_tb.v
// Module Name:bus_control_tb
// Author: Jonatas Valentim Ferrari
// E-mail: jonatasferrari@gmail.com
// -------------------------------------------------------------------
// Release History
// Version Date Description
// 1.0 20/08/2010 Initial version
// 2.0 20/09/2010 More test and change in the code
// 3.0 30/09/2010 change in the code 
// 
//
// -------------------------------------------------------------------
// Description
// This file describes the coding style to be used on rtl
// implementations.
// File names must be all lowercase separated by underscore if needed
// -------------------------------------------------------------------
module bus_control_tb;

reg	[7:0]		bus_control_core_ext_data_i;
reg	[15:0]	bus_control_core_ext_addr_i;
reg				bus_control_core_ext_ram_wr_b_i;
reg				bus_control_core_ext_ram_rd_b_i;
reg				bus_control_core_ext_rom_rd_b_i;
reg				bus_control_ea_b_i;
reg	[7:0]		bus_control_core_p0_i;

wire	[7:0]		bus_control_core_p0_o;
wire	[7:0]		bus_control_core_ext_data_o;
wire  [7:0]		bus_control_core_p0en_o;
wire	[7:0]		bus_control_core_p2en_o;
wire	[7:0]		bus_control_core_p2_o;
wire	       	bus_control_core_p3_6_o;
wire	       	bus_control_core_p3_7_o;
wire	    		bus_control_core_p3en_6_o;
wire	    		bus_control_core_p3en_7_o;
wire	[7:0]		bus_control_core_p4_o;
wire				bus_control_psen_b_o;
wire				bus_control_core_ea_b_o;


bus_control   dut(
						.bus_control_core_ext_data_o(bus_control_core_ext_data_o),
						.bus_control_core_ext_data_i(bus_control_core_ext_data_i),
						.bus_control_core_ext_addr_i(bus_control_core_ext_addr_i),
						.bus_control_core_ext_ram_wr_b_i(bus_control_core_ext_ram_wr_b_i),
						.bus_control_core_ext_ram_rd_b_i(bus_control_core_ext_ram_rd_b_i),
						.bus_control_core_ext_rom_rd_b_i(bus_control_core_ext_rom_rd_b_i),
						.bus_control_core_ea_b_o(bus_control_core_ea_b_o),
						.bus_control_ea_b_i(bus_control_ea_b_i),
						.bus_control_psen_b_o(bus_control_psen_b_o),
						//***alteracao*** .bus_control_core_p0_io(bus_control_core_p0_io),
						.bus_control_core_p0_o(bus_control_core_p0_o),
						.bus_control_core_p0_i(bus_control_core_p0_i),
						
						.bus_control_core_p0en_o(bus_control_core_p0en_o),
						.bus_control_core_p2_o(bus_control_core_p2_o),
						.bus_control_core_p2en_o(bus_control_core_p2en_o),
						.bus_control_core_p3_6_o(bus_control_core_p3_6_o),
						.bus_control_core_p3_7_o(bus_control_core_p3_7_o),
						.bus_control_core_p3en_6_o(bus_control_core_p3en_6_o),
						.bus_control_core_p3en_7_o(bus_control_core_p3en_7_o),
						.bus_control_core_p4_o(bus_control_core_p4_o)
						);





always
	begin
	//******************************Leitura na ROM vairas vezes*************************
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
	   #15
		// Verificando o acesso a ROM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_p0_i = 8'hAB;
		bus_control_core_ext_addr_i = 16'h05BA;
#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
		#15
		// Verificando o acesso a ROM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_p0_i = 8'hAC;
		bus_control_core_ext_addr_i = 16'h12AC;
		
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
	   #15
		// Verificando o acesso a ROM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_p0_i = 8'hAD;
		bus_control_core_ext_addr_i = 16'h10AB;
		
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
	   #15
		// Verificando o acesso a ROM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_p0_i = 8'hAE;
		bus_control_core_ext_addr_i = 16'h14AD;
		
		//Fim da verificacao de leitura da ROM varias vezes
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		#15
	//****************************leitura na RAM vairias vezes**************************
	// Verificando o acesso a RAM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_p0_i = 8'hAF;
		bus_control_core_ext_addr_i = 16'h15B9;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
		#15
		// Verificando o acesso a RAM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_p0_i = 8'hA2;
		bus_control_core_ext_addr_i = 16'h52A2;
		
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
	   #15
		// Verificando o acesso a RAM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_p0_i = 8'hA;
		bus_control_core_ext_addr_i = 16'h1CFB;
		
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		
	   #15
		// Verificando o acesso a RAM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_p0_i = 8'b01010101;
		bus_control_core_ext_addr_i = 16'h547D;
		
		//Fim da verificacao de leitura da RAM Leitura
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
	   #15	
		//****************************RAM escrita externa***********************************
		//Verificando o acesso a RAM externa escrita
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'hF9;
		bus_control_core_ext_addr_i = 16'hCAFE;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;			
		bus_control_core_ext_data_i = 8'h78;
		bus_control_core_ext_addr_i = 16'hF0DA;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'h65;
		bus_control_core_ext_addr_i = 16'hFADA;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_ext_data_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'hD5;
		bus_control_core_ext_addr_i = 16'hF0F5;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'h2F;
		bus_control_core_ext_addr_i = 16'h0203;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'hA5;
		bus_control_core_ext_addr_i = 16'h32AD;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'h28;
		bus_control_core_ext_addr_i = 16'hF1A2;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'h26;
		bus_control_core_ext_addr_i = 16'hF0A0;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'h25;	
		bus_control_core_ext_addr_i = 16'hFFAA;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		//**********************************Escrita RAM********************************
		//Verificando o acesso a RAM extena escrita
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_data_i = 8'b11100111;		
		bus_control_core_ext_addr_i = 16'h623C;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;

	   #15
		
		//************************Casos que nao podem acontecer****************
		//-----------------------------
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_data_i = 8'b10001111;		
		bus_control_core_ext_addr_i = 16'hFAF9;		
		//-----------------------------
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_data_i = 8'b10001010;		
		bus_control_core_ext_addr_i = 16'b0010111100111001;
		//-----------------------------
		  #15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_data_i = 8'hE5;	
		bus_control_core_p0_i = 8'b00000000;	
		bus_control_core_ext_addr_i = 16'b0000111100111000;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_data_i = 8'b10001111;		
		bus_control_core_ext_addr_i = 16'b0000111100111000;
		#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
	   #15
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_data_i = 8'b10001111;		
		bus_control_core_ext_addr_i = 16'b0000111100111000;
		//*********************************Acesso aleatorios de RAM e ROM**********************************
		 	#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		 #15
		// Verificando o acesso a RAM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_p0_i = 8'hA1;
		bus_control_core_ext_addr_i = 16'h1CFB;
			#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		 #15
		// Verificando o acesso a ROM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_p0_i = 8'hAB;
		bus_control_core_ext_addr_i = 16'h05BA;
			#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		#15
		//Verificando o acesso a RAM externa escrita
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'hBA;
		bus_control_core_ext_addr_i = 16'hC95E;
			#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		#15
		// Verificando o acesso a RAM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b0;
		bus_control_core_p0_i = 8'hA1;
		bus_control_core_ext_addr_i = 16'h1C9B;
			#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		 #15
		// Verificando o acesso a ROM Leitura
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b0;
		bus_control_core_ext_ram_wr_b_i = 1'b1;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_p0_i = 8'hAB;
		bus_control_core_ext_addr_i = 16'h058A;
			#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		#15
		//Verificando o acesso a RAM externa escrita
		bus_control_ea_b_i = 1'b0;
		bus_control_core_ext_ram_rd_b_i = 1'b1;
		bus_control_core_ext_ram_wr_b_i = 1'b0;
		bus_control_core_ext_rom_rd_b_i = 1'b1;		
		bus_control_core_ext_data_i = 8'hC5;
		bus_control_core_ext_addr_i = 16'h995E;
			#15
		//inicializacao
		bus_control_ea_b_i = 1'bz;
		bus_control_core_ext_rom_rd_b_i = 1'bz;
		bus_control_core_ext_ram_wr_b_i = 1'bz;
		bus_control_core_ext_ram_rd_b_i = 1'bz;
		bus_control_core_p0_i = 8'bz;
		bus_control_core_ext_data_i = 8'bz;		
		bus_control_core_ext_addr_i = 16'bz;
		#15
		$finish;
	end
endmodule
