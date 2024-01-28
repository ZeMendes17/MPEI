 % cadeias de markov com pagerank
% primeiro fazer a mmatriz H de hiperligações ( as saidas da mesma trasição
% tem a mesma probabilidade, logo -> 1/num de saidas)
% pagerank --> somatorio do num de pag a dividir pelo num de saidas

H = [0 0   0 0 1/3 0;
     1 0   0 0 1/3 0;
     0 1/2 0 1 0   0;
     0 0   1 0 0   0;
     0 1/2 0 0 0   0;
     0 0   0 0 1/3 0];


%% a)
pagerank = ones(6, 1)/6;

for iter = 1:10
    pagerank = H*pagerank;
end
disp(pagerank)
disp("As paginas com maior pagerank são C e D, ambas com pagerank 0.33")

%% b)
disp("Deadend --> F")
disp("Spidertrap --> C e D")

%% c)
% para resolver o dead end, a coluna de zeros é substituida por 1/num de
% paginas

sub = ones(6, 1)/6;
H(:,6) = sub;

pagerank = ones(6, 1)/6;

for iter = 1:10
    pagerank = H*pagerank;
end
disp(pagerank)

%% d)
N = 6;
pagerank = ones(6, 1)/6;

beta = 0.8;

H2 = beta*H + (1-beta) * ones(N)/N;
r = ones(N, 1)/N;
for i = 1:1000
    r = H2*r;
end

disp(r)

%% e)
N = 6;
x0=ones(N,1)/N;
% -----------------------
iter=1;
x=x0;
epsilon=1e-4;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold=x;
    x=H2*x;
    if max(abs(x-xold))<epsilon 
        break; 
    end
    iter=iter+1;
end

x

disp("Valores parecidos com a alinea anterior (quase identicos)")