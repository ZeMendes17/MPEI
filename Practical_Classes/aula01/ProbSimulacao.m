function Prob = ProbSimulacao(p, n, k, N)

lancamentos = rand(n,N) < p; 
sucessos= sum(lancamentos)==k;
Prob = sum(sucessos)/N;
end
