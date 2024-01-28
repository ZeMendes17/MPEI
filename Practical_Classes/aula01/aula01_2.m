N = 1e5;
p = 0.5;
k = 6; % numero de caras
n = 15;

lancamentos = rand(n, N) > 0.5;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos) / N;


experiencias = rand(15, 1e5);
lancamentos2 = experiencias > 0.5;
resultados = sum(lancamentos2);
sucessos = resultados == 6;
probSimulacao2 = sum(sucessos) / 1e5;

% realizado das duas maneiras
% resultado preto de 0.15...


