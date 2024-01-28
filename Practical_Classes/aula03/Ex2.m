%% a)
T = [1/3 1/4 0
     1/3 11/20 1/2
     1/3 1/5 1/2];

soma_T = sum(T);
if(soma_T(1) == 1 && soma_T(2) == 1 && soma_T(3) == 1)
    disp("Esta matriz é estocástica")
else
    disp("A matriz não é estocástica")
end

%% b)

total = 90;
a = 60;
b = 15;
c = 15;

vetor_posInicial = [a b c]'/90;

%% c)

T30 = T^30;
format short
n = T30 * vetor_posInicial*90;

%% d)

% usamos o T30 na mesma uma vez que continua a ser uma transicao de 30 dias
% na mesma
vetor_posInicial = [30 30 30]';
n = T30 * vetor_posInicial;
% obtemos o mesmo valor uma vez que independente da posição inicial
% escolhida, o equilobrio nesta cadeia vai ser igual
