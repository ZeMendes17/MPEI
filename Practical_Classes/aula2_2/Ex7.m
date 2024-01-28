%Distribuição de Poisson
% media de 15 mensagens por segundo

%% a)
lambda = 15;
k = 0;
% p = ?

prob0 = ((lambda^k)/factorial(k)) * exp(-lambda);
disp("Probabilidade de 0 mensagens: "+prob0)


%% b)
prob10 = 0;

for k=0:10
    prob10 = prob10 + ((lambda^k)/factorial(k)) * exp(-lambda);
end

probMaisDe10 = 1 - prob10;
disp("Probabilidade de mais de 10 mensagens: "+probMaisDe10)

