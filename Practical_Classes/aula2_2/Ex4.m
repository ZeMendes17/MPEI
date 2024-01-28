clear
clc
%% a)
p = 0.3; % probabilidade de terem defieto
n = 5; % numero de peças a ser produzidos
N = 1e5;

xi = 0:5;
pX = zeros(1, 5);
amostras = rand(n, N) <= p;

% falta a matriz de probabilidades
for k=0:5
    sucesso = sum(amostras)==k;
    pX(k+1) = sum(sucesso)/N;
end

figure(1)
stem(xi,pX); % função probabiidade

figure(2)
Fx = cumsum([0 pX 0]);
stairs(-1:6, Fx);   % função de distribuição acumulada

Prob = sum(sum(amostras)<=2)/N;
disp("Probabilidade de no maximo 2 peças serem defeituosas: " + Prob);

%% b)
media = sum(xi.*pX); % valor esperado
variancia = sum((xi.^2).*pX) - media^2; %variancia
desvio = sqrt(variancia); % desvio padrao

%i
% P(0<X<=1)=0.16807
% P(1<=X<2)=0.52822
% P(2<=X<3)=0.83692
% P(3<=X<4)=0.96922
% P(4<=X<5)=0.99757
% P(5<=X)=1

%ii
% p = 0.83692

    


