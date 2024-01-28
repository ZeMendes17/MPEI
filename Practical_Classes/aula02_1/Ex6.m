%linguagem com tres palavras {“um”, “dois”, “trˆes”} e que permite
%sequencias de 2 palavras
prob_total = 3^2;

probA = 1/prob_total;
disp(probA)

probB = 5/prob_total;
disp(probB)

prob1 = 3;
prob2 = 3;
probC = (prob1 + prob2) / prob_total;
disp(probC)


%usamos a condicional, P("um"\"dois")=P("um" n "dois")/P("dois")
% a probabilidade no numerador é 2 {"um", "dois"} ou {"dois", "um"}
% a probabilidade do denominador é 5 pois nos 9 casos favoraveis, 5 incluem
% a palavra "dois"
probD = 2/5;
disp(probD)

