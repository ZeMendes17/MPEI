prob_defeito = 0.3;
numero_pecas = 5;
numero_defeito = 3;
N = 1e5;

amostras = rand(numero_pecas, N)< prob_defeito;
sucessos = sum(amostras) == numero_defeito;
probSim = sum(sucessos) / N;

numero_defeito = 2;
sucessos2 = sum(amostras) <= numero_defeito;
probSim2 = sum(sucessos2) / N;

Y = zeros(0, 20);
for x = 0:20
    a = rand(20,N) < prob_defeito; 
    sucessos = sum(a)== x;
    Prob = sum(sucessos)/N;

    Y(x + 1) = Prob;
end

stem(0:20, Y);