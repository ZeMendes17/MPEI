n = 100; %100 dardos
M = [200 500 1000 2000 5000 10000 20000 50000 100000];
N = 1e5;
fin_diferentes = zeros(1, length(M));

for m = 1:length(M)
    experiencias = randi(M(m), n, N);
    diferentes = zeros(1, N);
    for col = 1:N
        diferentes(col) = length(unique(experiencias(:,col))) == n;
    end

    p1 = sum(diferentes) / N;
    p2 = 1 - p1;
    fin_diferentes(m) = p2;
end

plot(M, fin_diferentes, 'o-r', 'LineWidth',3)
xlabel('Numero de alvos')
ylabel('Porbabilidade de pelo menos um alvo ser atingido mais de uma vez')
