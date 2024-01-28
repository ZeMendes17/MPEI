clear all;
close all;
clc;

%brinquedo composto por duas componentes 1 e 2

p1 = 0.002; % probabilidade da parte 1 ter defeito
p2 = 0.005; % probabilidade da parte 2 ter defeito
pMontagem = 0.01; % probabilidade de a montagem dar defeito
% caso um dos componentes tenha defeito entao a peça é defeituosa
N = 1e5;

%% Ex1
% uma caixa de brinquedos tem pelo menos 1 defeituoso


n = 8;

ex_1 = rand(n, N) <= p1;
ex_2 = rand(n, N) <= p2;
ex_a = rand(n, N) <= pMontagem;

ex = ex_1 | ex_2 | ex_a;
ex = sum(sum(ex) > 0);
disp("Probabilidade de pelo menos um brinquedo ter defeito: "+(ex/N))

x = 1:8;
pX = zeros(1, 8) + pMontagem;
media = sum(x.*pX); % valor esperado
disp("Valor Esperado (E[x]): " + media);
%% Ex2)
% a)
ex_1 = rand(n, N) > p1;
ex_2 = rand(n, N) > p2;
ex_a = rand(n, N) > pMontagem;

ex = ex_1 & ex_2 & ex_a;
ex = sum(sum(ex) == 8);
disp("Probabilidade de não ter nenhum defeituoso defeituoso: "+(ex/N))
disp("Comparando com o 1 a), sao complementares")

% b)
n = 8;
k = 0;

p1 = 0.002; % probabilidade da parte 1 ter defeito
p2 = 0.005; % probabilidade da parte 2 ter defeito
pMontagem = 0.01; % probabilidade de a montagem dar defeito

binomial1 = nchoosek(n, k) * (p1^k) * (1-p1)^(n-k);
binomial2 = nchoosek(n, k) * (p2^k) * (1-p2)^(n-k);
binomial3 = nchoosek(n, k) * (pMontagem^k) * (1-pMontagem)^(n-k);

prob = binomial1 * binomial2 * binomial3;
disp("Probabilidade pela formula binomial: "+prob)
disp("Semelhante a 2 a)")

% c)
results_prob = zeros(1,19);
for n=2:20
    ex_1 = rand(n, N) > p1;
    ex_2 = rand(n, N) > p2;
    ex_a = rand(n, N) > pMontagem;
    ex = ex_1 & ex_2 & ex_a;
    ex = sum(sum(ex) == n);
    results_prob(n-1) = (ex/N);
    if(ex/N >= 0.9)
        resp_d = n;
    end
end

n_caixa = 2:20;
figure(1)
plot(n_caixa, results_prob, 'r-o');
xlabel("Numero de caixas")
ylabel("Probabilidade de 0 terem defeito")
grid on
disp("Quanto maior o numero de brinquedos na caixa, menor a probabilidade de nenhum ter defeito")

% d)
disp("A capacidade maxima que a caixa deve ter para a probabilidade de da caixa nao ter brinquedos com defeito é "+ resp_d)

%% Ex3
p1 = 0.002; % probabilidade da parte 1 ter defeito
p2 = 0.005; % probabilidade da parte 2 ter defeito
pMontagem = 0.01; % probabilidade de a montagem dar defeito
% caso um dos componentes tenha defeito entao a peça é defeituosa
N = 1e5;
num_brinq = 0:8;
prob = zeros(1, 9);
n = 8;

% a)
ex_1 = rand(n, N) <= p1;
ex_2 = rand(n, N) <= p2;
ex_a = rand(n, N) <= pMontagem;
ex = ex_1 | ex_2 | ex_a;
for temp = 0:8
    t = sum(sum(ex) == temp);
    prob(temp+1) = t/N;
end
figure(2)
stem(num_brinq, prob)