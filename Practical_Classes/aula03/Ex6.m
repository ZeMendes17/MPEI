%% a
% ordem 1 2 4 3 5
T = [0.8 0 0.3 0 0;
     0.2 0.6 0.2 0 0
     0 0.1 0.4 0 0
     0 0.3 0 1 0
     0 0 0.1 0 1];

%% b
% probabilidade de, começando no estado 1, estar no estado dois ao fim de n
% passos, n --> 1 a 100
% fazer o vetor sempre primeiro

v = [1 0 0 0 0]';
passos = zeros(1, 100);

for n = 1:100
    Tn = T^n;
    temp = Tn*v;
    passos(n) = temp(2);
end

plot(1:100, passos, '.') % vai tender para 0 pois exitem estados absorventes

%% c
% mesma coisa



%% d
Q = T(1:3,1:3); % 3 --> pois é o numero de estados nao absorventes

%% e
F = inv(eye(size(Q)) - Q);

%% f
% quantas vezes vai ser feita em media 1->1, 1->2, ...
% dá o numero de passagens em media para cada estado
num_passos = sum(F);

%% g

R = T(3+1:end, 1:3); % 3 -> numero de estados nao absorventes

B = R * F; % colunas --> 1 2 4
           % linhas --> 3 5

% começando no 1 e terminando no 3
B(1, 1)
% começando no 1 e terminando no 5
B(2, 1)







