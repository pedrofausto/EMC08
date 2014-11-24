%% function hex from #00H to #127H
function str_hex = rand_hex_ram()

addrs = [32:127];
addr = addrs(round(random('unif', 1, length(addrs))));

str_hex = ['0', dec2hex(addr), 'H'];
end