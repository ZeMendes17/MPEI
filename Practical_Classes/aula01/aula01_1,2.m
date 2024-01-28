N = 1e5; % numero de experiencias
p = 0.5; % probabilidade de ser cara
k = 2; % numero de caras
n = 3; % numero de lancamentos

lancamentos = rand(n, N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos) / N;

% a probabilidade de ambas as experiencias sera sempre proximo de 0.37...