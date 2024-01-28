% todas as semanas 2 aulas TP da UC X ás 9h quartas e sextas
% se tiver estado na anterior, a probabilidade de ir é 0.7
% se faltou a probabilidade de ir é 0.8
% COMEÇAR SEMPRE POR FAZER A MATRIZ TRANSIÇÃO   

T = [0.2 0.3;
     0.8 0.7];

%% a)
% esta presente na aula de quarta -> prob de estar na quarta seguinte?
% vetor_estado = [0 1]';
vetor_estado = [0;1]; % prob de ir ou nao ir á aula de segunda
% ao multiplicar 1 vez pela matriz trans. da o do dia seguinte,
% ao multiplicar 2 vezes, 2 dias e etc.
v_aula1 = vetor_estado;
v_aula2 = T * v_aula1;
v_aula3 = T * v_aula2;

disp("a) " + v_aula3(2))

%% b)
vetor_estado = [1 0]';
v_aula1 = vetor_estado;
v_aula2 = T * v_aula1;
v_aula3 = T * v_aula2;
disp("b) " + v_aula3(2))

%% c)
% esteve presente na primeira aTula, 30 aulas
vetor_estado = [0 1]';
v_temp = vetor_estado;
for aula = 1:15*2
    v_temp = T * v_temp;
end

% ou, MAIS FACIL
T29 = T^29;
v_ultima_aula = T29 * vetor_estado;
disp("c) " + v_ultima_aula(2))


%% D)
% grafico da probabilidade de estar presente nas 30 aulas
% prob de estar presente na primeira aula 0.85

T_primeira_aula = [0.15;0.85];
probs = zeros(1,30);

for k = 1:30
    temp_t = T^(k-1);
    R = temp_t * T_primeira_aula;
    probs(k) = R(1);
end

plot(1:30, probs, 'b-*')