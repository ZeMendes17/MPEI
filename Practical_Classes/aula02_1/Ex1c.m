    % Probabilidade condicional
% A = "outro filho rapaz"
% B = "um dos filhos rapaz"
% P[A|B] = P[A n B]/ P[B] --- casos favoraveis A n B/ cas fav de B
% 2M / M

N = 1e6; % numero de experiencias
p = 0.5; % prob rapaz ou rapariga
k = 1; % numero de rapazes mininmo
k2 = 2; %numero de rapazes maximo
n = 2; %numero de filhos
calc = rand(n, N) > p;
prob2M = sum(calc) == k2;
probM = sum(calc) >= k;
probSim = sum(prob2M)/ sum(probM);
disp(probSim);

% o valor teorico é 1/3 pois os casos possiveis sao {MM}, {FM}, {MF}, sendo
% {MM} o caso favoravel