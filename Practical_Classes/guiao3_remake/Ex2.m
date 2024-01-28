% 1/3 do A para o B e 1/3 A para o C
% 1/4 do B para o A e 1/5 do B para C
% 1/2 de C para B e 1/2 para C

%% a)
T = [1/3 1/4  0;
     1/3 11/20 1/2;
     1/3 1/5  1/2];

disp(sum(T))
disp("Como a soma de cada coluna é 1, então a matriz é estocrastica")

%% b)
total_alunos = 90;
% A = 2*(B+C)

A = 60;
B = 15;
C = 15;

vetor_pos_inicial = [A B C]'/total_alunos;

%% c)
% ao fim da aula 30, quantos elemnentos integrarão cada grupo

T30 = T^30;
aula30 = T30*vetor_pos_inicial;
alunos30 = 90.*aula30;
disp("Numero de alunos apos 30 aulas: " + round(alunos30))

%% d)

vetor_pos_inicial = [30 30 30]'/total_alunos;

T30 = T^30;
aula30 = T30*vetor_pos_inicial;
alunos30 = 90.*aula30;
disp("Numero de alunos apos 30 aulas, mas com distribuição igual: " + round(alunos30))

