%% function hex from #00H to #127H
function str_hex = rand_hex7b()
str_hex = ['0', dec2hex(round(random('unif', 0, 127))), 'H'];
end