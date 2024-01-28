% Considere uma caixa contendo 90 notas de 5 Euros, 9 notas de 50 e 1 de 100


%% a) teorica

% Espaço de amostragem: 100 ; 5 euros: 9/10 ; 50 euros: 9/100 ; 100 euros: 1/100


%% b)

x = [5 50 100];

probs = [9/10 9/100 1/100];
figure(1);
subplot(1,2,1);
stem(x,probs) %funcao massa de probabilidade 
title('fmp de X')
xlabel('x_i'), ylabel('P(x_i)')


%% c)

probs2 = [0 0 probs 0 0];
x2 = -1:5;
probacum1 = cumsum(probs2); %soma acumulativa do vetor
subplot(1,2,2);
stairs(x2,probacum1)
axis([0 5 0.8 1.1]);
title("fda de X");
xlabel('x_i'), ylabel("P(x_i)");
