%valores igualmente provaveis entre 0 e T-1
keys = 10;
T = 1000;
% probabilidade de pelo menos 2 keys
% indicarem a mesma posição no array
N = 1e6;

experiencias = randi(T, keys, N);
diferentes = zeros(1, N);
disp(experiencias)

for col = 1:N
    diferentes(col) = length(unique(experiencias(:,col))) == keys;
end

p1 = sum(diferentes) / N;
p2 = 1 - p1;
disp(p2)
%0.0446


