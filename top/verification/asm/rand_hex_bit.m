%% function hex to generate bit addr from ram or sfr and respective byte addr
function [bit byte] = rand_hex_bit()

    byte_ram = round(random('unif', 32, 47));
    bit_sfr = round(random('unif', 128, 255));
    while (bit_sfr == 191)
        bit_sfr = round(random('unif', 128, 255));
    end
	byte_sfr = bit_sfr - rem(bit_sfr,8);
	bit_ram = (byte_ram - 32)*8 +  round(random('unif', 0, 7));
    bit_sfr_addr  = ['0', dec2hex(bit_sfr), 'H'];
    bit_ram_addr  = ['0', dec2hex(bit_ram), 'H']; 
    byte_sfr_addr = ['0', dec2hex(byte_sfr), 'H'];
	byte_ram_addr = ['0', dec2hex(byte_ram), 'H'];
	
    %if rand > 0.5
	%	bit  = bit_sfr_addr;
	%	byte = byte_sfr_addr;
	%else
		bit  = bit_ram_addr;
		byte = byte_ram_addr;
	%end
		
end