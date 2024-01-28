% função probabilidade do lancamento de um dado
clear all % limpa variaveis

% valores possiveis para a v.a X
% X = [1 2 3 4 5 6]
% respetivas probabilidades
x = 1:6;

probs = ones(1,6)/6;

figure(1);
subplot(1,2,1);
stem(x,probs) %funcao massa de probabilidade 

axis([0 7 -0.01 0.2])
title('fmp de X')
xlabel('x_i'), ylabel('P(x_i)')




probs2 = [0 0 probs 0 0];
x2 = -1:8;
probacum1 = cumsum(probs2); %soma acumulativa do vetor
subplot(1,2,2);
stairs(x2,probacum1)
axis([-2 10 -0.01 1.1]);
title("fda de X");
xlabel('x_i'), ylabel("P(x_i)");

