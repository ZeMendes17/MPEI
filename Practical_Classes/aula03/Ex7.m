% cadeias de markov com pagerank
% primeiro fazer a mmatriz H de hiperligações ( as saidas da mesma trasição
% tem a mesma probabilidade, logo -> 1/num de saidas)
% pagerank --> somatorio do num de pag a dividir pelo num de saidas
%% a
H = [0 0   0 0 1/3 0;
     1 0   0 0 1/3 0;
     0 1/2 0 1 0   0;
     0 0   1 0 0   0;
     0 1/2 0 0 0   0;
     0 0   0 0 1/3 0];

pagerank = ones(6,1)/6;

for iter = 1:10
    pagerank = H*pagerank;
end
% permite nos ver as paginas mais importantes com base na probabilidade de
% la calhar
fprintf("As paginas mais importantes sao aquelas com maior probabilidade de " + ...
    "serem escolhidas, neste caso, as paginas C e D\n");

%% b
% spider trap(pode ficar la preso)  --> C e D 
% dead end(nao tem fim)             --> F

%% c






%% d
N = 6;
pagerank = ones(6, 1)/6;

beta = 0.8;

H2 = beta*H + (1-beta) * ones(N)/N;
r = ones(N, 1)/N;
for i = 1:1000
    r = H2*r;
end

%% e

r_anterior = zeros(N, 1);
r = ones(N,1)/N;

iteration = 0;
diference = abs(r-r_anterior);
max_dif = max(diference);
fprintf(1,"max dif = %f\n", max_dif);
























