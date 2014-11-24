%% function hex from #00H to #255H
function str_hex = rand_hex8b()
str_hex = ['0', dec2hex(round(random('unif', 0, 255))), 'H'];
end