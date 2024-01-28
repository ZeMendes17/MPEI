T = 100:100:1000;
keys = 50;
N = 1e5;
values = zeros(1, length(T));

for t = 1:length(T)

    experiencias = randi(T(t), keys, N);
    diferentes = zeros(1, N);

    for col = 1:N
        diferentes(col) = length(unique(experiencias(:,col))) == keys;
    end

    p1 = sum(diferentes) / N;
    values(t) = p1;
end

plot(T, values, 'o-r', 'LineWidth', 3)
xlabel("Tamanho de array")
ylabel("Probabilidade de 50 keys ocuparem posições diferentes")