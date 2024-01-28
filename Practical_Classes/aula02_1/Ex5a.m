% dado com 6  faces lançado 2 vezes, a soma dos dois ser 9, o segundo ser
% par, pelo menos um valor ser igual a 5, nenhum dos valores é 1

N = 1e5;
lados = 6;
lancamentos = 2;

sim = randi(lados, lancamentos, N);

% probabilidade de a soma ser 9
soma9 = sum(sim) == 9;
probA = sum(soma9) / N;
disp("Probabilidade de a soma dos dois ser 9: " + probA); 


segundo_par = 0;
valor5 = 0;
valor_dif1 = 0;

for col = 1:length(sim)
    prim_valor = sim(1, col);
    seg_valor = sim(2, col);
    
    % probabilidade de o segundo valor ser par
    if(seg_valor == 2 || seg_valor == 4 || seg_valor == 6)
        segundo_par = segundo_par + 1;
    end

    % probabilidade de um deles ser 5
    if(prim_valor == 5 || seg_valor == 5)
        valor5 = valor5 + 1;
    end

    % probabilidade de nenhum deles ser 1
    if(prim_valor ~= 1 && seg_valor ~= 1)
        valor_dif1 = valor_dif1 + 1;
    end

end

probB = segundo_par / N;
disp("Probabilidade de o segundo valor ser par: " + probB)

probC = valor5 / N;
disp("Probabilidade de um dos valores ser igual a 5: " + probC)

probD = valor_dif1 / N;
disp("Probabilidade de nenhum dos valores ser 1: " + probD)
