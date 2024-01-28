 %% a)
N= 1e5; %num de repetições
p = 0.5; %probabilidade de cara
n = 4; %numero de lancamentos

lancamentos = rand(n,N) > p;

sucessos0 = sum(lancamentos) == 0; %quando sum == 0 -> sucessos = 1
prob0 = sum(sucessos0)/N;

sucessos1 = sum(lancamentos) == 1; %quando sum == 1 -> sucessos = 1
prob1 = sum(sucessos1)/N;

sucessos2 = sum(lancamentos) == 2; %quando sum == 2 -> sucessos = 1
prob2 = sum(sucessos2)/N;

sucessos3 = sum(lancamentos) == 3; %quando sum == 3 -> sucessos = 1
prob3 = sum(sucessos3)/N;

sucessos4 = sum(lancamentos) == 4; %quando sum == 4 -> sucessos = 1
prob4 = sum(sucessos4)/N;

x = [0 1 2 3 4];

probs = [prob0 prob1 prob2 prob3 prob4];

stem(x,probs); % função probabiidade


%% b)
x = [0 1 2 3 4];
px = [prob0 prob1 prob2 prob3 prob4]; %probabilidades
media = sum(x.*px); % valor esperado
variancia = sum((x.^2).*px) - media^2; %variancia
desvio = sqrt(variancia); % desvio padrao

disp("Valor Esperado (E[x]): " + media);
disp("Variancia (Var(x)): " + variancia);
disp("Desvio padrão (roh): " + desvio);


%c)
% Distribuição Binomial com p= 0.5 e n=4
% nCk * p^k * (1-p)^(n-k)

%d)
% Usando a distribuição para calcular as probabilidades e obter a função de
% probabilidade, temos que P(X=0)=P(X=3)=0.0625
%P(X=1)=P(X=3)= 0.25 e P(X=2)=0.375
% comparando com os valores da a), sao similares

%e)
% E[X] = 0*P(0) + 1*P(1) + 2*P(2) + 3*P(3) + 4*P(4) = 2
% valor bastante similar
%var(X)=E[X^2] - E[X^2] - E[X]^2 = 1, muito parecido tambem

%f)
% i. P(2) + P(3) + P(4) = 0.6875
% ii. P(0) + P(1) = 0.3125
% iii. P(1) + P(2) + P(3) = 0.875

sucessos2coroas = sum(lancamentos)>= 2;
prob2c = sum(sucessos2coroas)/N;


