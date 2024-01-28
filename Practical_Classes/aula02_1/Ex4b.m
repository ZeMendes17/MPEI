m = 365;
prob = 0.5;
n1 = 1:1:365;
N = 1e5;


for n = 1:length(n1)
    experiencias = randi(m, n, N);
    diferentes = zeros(1, N);
    for col = 1:N
        diferentes(col) = length(unique(experiencias(:,col))) == n;
    end

    p1 = sum(diferentes) / N;
    p2 = 1 - p1;
    if p2 > 0.9
        disp("Porbabilidade: " + p2)
        disp("Numero de pessoas: " + n)
        break
    end
end

% resposta: 