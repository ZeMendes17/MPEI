% 3 programadores cada um com a sua probabilidade de erro e programas
% concluidos

total_programas = 100;
andre = 20;
erroAndre = 0.01;
bruno = 30;
erroBruno = 0.05;
carlos = 50;
erroCarlos = 0.001;
N = 1e5;

A = rand(andre, N) < erroAndre; % caso o valor na matriz seja 1, tem erro
B = rand(bruno, N) < erroBruno;
C = rand(carlos, N) < erroCarlos;

% agora junta se as matrizes numa so

programas = [A;B;C]; % as linhas de 1 a 20 sao do andre; de 20 a 50 do bruno e de 50 a 100 do carlos
% cada coluna representa uma experiencia (possui 100 linhas)

prob_carlosErro = sum(sum(C));
prob_erro = sum(sum(programas));
probabilidade_c = prob_carlosErro/prob_erro;
disp("Probabilidade de o programa com erro ser do Carlos: " + probabilidade_c);

prob_andreErro = sum(sum(A));
probabilidade_a = prob_andreErro/prob_erro;
prob_brunoErro = sum(sum(B));
probabilidade_b = prob_brunoErro/prob_erro;


% de quem é mais provavel ser o programa
if(probabilidade_a > probabilidade_b && probabilidade_a > probabilidade_c)
    disp("O programa é mais provavel de ser do Andre, probabilidade = " + probabilidade_a)

elseif(probabilidade_b > probabilidade_a && probabilidade_b > probabilidade_c)
    disp("O programa é mais provavel de ser do Bruno, probabilidade = " + probabilidade_b)
else
    disp("O programa é mais provavel de ser do Carlos, probabilidade = " + probabilidade_c)
end




