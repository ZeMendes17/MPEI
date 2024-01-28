clear
clc
% distribuição de poisson


n = 8000; % numero de chips
p = 1/1000; % probabilidade de ser defeituoso
k = 7; % numero de defeitos que queremos
N = 1e5;
lancamentos = rand(n,N) < p; 
sucessos= sum(lancamentos)==k;
Prob = sum(sucessos)/N;
disp("Por simulação: "+Prob)

binomial = nchoosek(n, k) * (p^k) * (1-p)^(n-k);
lambda = n*p;
poisson = ((lambda^k)/factorial(k)) * exp(-lambda);

disp("Binomial: "+binomial)
disp("Poisson: "+poisson)