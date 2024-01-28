% o aluno tem duas aulas por semana, quartas e sextas
% se faltar á anterior, a chnace de ir é de 0.8, se tiver ido a prob é de
% 0.7
%% a)
% se tiver ido quarta qual a probabilidade de estar na seguinte
% começar sempre por definir a matriz transição e vetor de estados

T = [0.7 0.8;
     0.3 0.2];
v_estado = [1 0]'; % vetor de estados, neste caso nao falta, dai 1;0

T2 = T^2; % probabilidade de ir passado 2 dias ou seja, de qurata a quarta
res_matriz = T2*v_estado; % vai dar a probabilidade de se tiver ido qurata a de ir na proxima
 disp("A probabilidade de ir quarta sabendo que foi na quarta anterior é: " + res_matriz(1))

 %% b)

 v_estado = [0 1]'; % neste caso como nao vai na quarta anterior o v_estado inverte

 res_matriz = T2*v_estado;
 disp("A probabilidade de ir quarta sabendo que nâo foi na quarta anterior é: " + res_matriz(1))

 %% c)
% esteve presente na primeira aula dai o vetor estado ser o primeiro
v_estado = [1 0]';
% qual a probabilidade de estar na ultima sabendo que ha 15 semanas de
% aulas
% como ha 15 semanas --> 30 aulas no total, contando com a primeira, logo
% restam 29 aulas

T29 = T^29;
res_matriz = T29 * v_estado;
disp("A probabilidade de estar na ultima aula é: " + res_matriz(1))

%% d)
% probabilidade de faltar as 30 aulas sabendo que a probabilidade de ir á
% primeira é 0.85
T = [0.7 0.8;
     0.3 0.2];

T_primeira = [0.85 0.15]';
probs = zeros(1, 30);

for k = 1:30
   T_temp = T^(k-1) * T_primeira;
   probs(k) = T_temp(2); % pois e a probabilidade de faltar
end

plot(1:30, probs)
grid on
xlabel("Aulas");
ylabel("Probabilidade de faltar");  

























