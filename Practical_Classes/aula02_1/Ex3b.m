%valores igualmente provaveis entre 0 e T-1
keys = 10:100:1000;
T = 1000;
% probabilidade de pelo menos 2 keys
% indicarem a mesma posição no array
N = 1e5;
values = zeros(1, length(keys));

for k = 1:length(keys)

    experiencias = randi(T, keys(k), N);
    diferentes = zeros(1, N);

    for col = 1:N
        diferentes(col) = length(unique(experiencias(:,col))) == keys(k);
    end

    p1 = sum(diferentes) / N;
    p2 = 1 - p1;
    values(k) = p2;
end

disp(values)
plot(keys, values, 'o-r', 'LineWidth', 3)
xlabel("Numero de keys")
ylabel("Probabilidade de duas keys apontarem para o mesmo indice")