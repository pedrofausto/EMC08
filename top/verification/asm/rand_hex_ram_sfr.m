%% function hex from #00H to #127H
function str_hex = rand_hex_ram_sfr()

addrs = [32:127 132:134 138:143 185:191 248];
addr = addrs(round(random('unif', 1, length(addrs))));

str_hex = ['0', dec2hex(addr), 'H'];
end