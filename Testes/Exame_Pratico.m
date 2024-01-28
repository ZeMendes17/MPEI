%% VALORES PARA CALCUAR
valor_esperado = sum(x.*px); % onde px sao as prob de cada x
variancia = sum((x.^2).*px) - (valor_esperado.^2);
desvio_padrao = sqrt(variancia);

% correlacao; E[XY] = sum(sum(p(X=x,Y=y)*X(x)*Y(y)))
corr=0;
  for m = 1 : length(X)
    for n = 1 : length(Y)
      corr=corr+X(m)*Y(n)*T(m,n);
    end
  end

  % covariancia; Corr - E[X]*E[Y]
cov = corr - Ex*Ey;

% coefCorrecao; Cov / DesvioPadrao(X)*DesvioPadrao(Y) = Cov/sqrt(Var(X)*Var(Y))
coefCorr = cov/sqrt(var(X)*var(Y));

% caso peça para calcular a esperança de por ex E[Y²root(X+1)]
% é a mesma logica da correlação como podemos ver

%% EXEMPLO BINOMIAL E POISSON
n = 8000; % numero de chips
p = 1/1000; % probabilidade de ser defeituoso
k = 7; % numero de defeitos que queremos
N = 1e5;
lancamentos = rand(n,N) < p; 
sucessos= sum(lancamentos)==k;
Prob = sum(sucessos)/N;
disp("Por simulação: "+Prob)

binomial = nchoosek(n, k) * (p^k) * (1-p)^(n-k);
lambda = n*p;
poisson = ((lambda^k)/factorial(k)) * exp(-lambda);

disp("Binomial: "+binomial)
disp("Poisson: "+poisson)

%% CADEIAS DE MARKOV
%para obter as probabilidades de estado seguinte multiplicamos a matriz T pelo
%vetor estado % pode ser usado com um loop for ou entao com a formula:
% T^(n transiçoes) * vetor estado na posição inicial

% por vezes um diferente estado inicial origina uma mesma matriz equilibrio

% matriz estocastica: soma colunas é 1

% para calcular as prob limite de cada caso:
% u = Tu
M = [T - eye(4);
    ones(1, 4)]; % para a soma das probabilidades dar 1

x = [zeros(4,1);
    1]; % para a soma das probabilidades dar 1
u = M\x;
disp(u);

% tambem é possivel calcular probabilidades conjuntas:
% prob de nao chuver: vai ser a soma das restantes prob nesse estado a
% multiplicar pelos diversos estados
v = [1 0 0]';
v2 = T*v;
v3 = T*v;
fprintf("5c) %f\n", (v2(1) + v2(2)) * (v3(1) + v3(2)));
% alterar as prob para cada dia do mes
% obtendo o numero medio de dias de sol
respSol = 1;
respNuvem = 0;
respChuva = 0;

v = [1 0 0]';

for i = 2:31
    v = T*v;
    respSol = respSol + v(1);
    respNuvem = respNuvem + v(2);
    respChuva = respChuva + v(3);
end
% mesmo usando um estado inicial diferente obtemos o mesmo estado limite

% quando temos estados absorventes colocamo los em ultimo lugar, alterando
% a ordem que aparecem na matriz

% matriz Q
%Q = T(1:3, 1:3); % 3 --> numero de estados nao absorventes

% matriz fundamental, F:
%F = inv(eye(size(Q)) - Q); % e uma formula
% esta matriz da nos o numero medio de passos antes da absorção começando
% no indice

% matriz R --> em que 3 é mais uma vez o numero de estados nao absorventes
% R = T(3+1:end, 1:3); % 3 -> numero de estados nao absorventes

% matriz B --> da nos a probabilidade de ser absorvido começando no linha
% pelo coluna
% B = R * F; % colunas --> 1 2 4
           % linhas --> 3 5

%% PAGERANK
% em vez da matriz H temos a matriz de hiperlinks
% para calcular o pagerank, este começa numa pagina com igual probabilidade
% por isso se tiver 6 sites --> pagerank = ones(6, 1)/6;

% pr tal como os estados anteriores é calculado pela mult continua com a
% matriz de hiperlinks
% deve se considerar a mesma prob de transição para todas as paginas e como
% dito a mesma prob inicial

% verificar a existencia de spider traps e dead ends

% para resolver apenas os dead ends --> substituir os 0s na matriz H por
% 1/N, N->numero de paginas (random teleport) e recalcular os pr

% para resolver ambos os problemas utilizamos a martiz do google e os
% random tps, verificar que sum(H) = 1.0

% se falar de nao mudar mais de x em 3 iterações usar formula desenvovida
% no remake aula03

%% FUNCOES DE DISPERSAO
% para gerar um determinado numero de chaves com comprimento maximo e
% minimo, conjunto de simbolos com determinadas probabilidades usar a
% função geraChavesCarac --> para as probabilidades calcula um rand e
% atraves do cumsum das probabilidades determina o simb a usar

% existem varaias hashfunctions em que umas sao melhores para determinar
% um certo simbolo
% colisoes --> 2 ou mais simb que tem o mesmo hashcode
% tambem da para ver o numero de vezes que um determinado hash code
% foi usado

%%  FILTROS DE BLOOM
% utiliza 3 funçoes criadas durante o desenvolvimento do guiao 4.2 para
% colocar o filtro em funcionamento
% uma inicializa o programa
% a segunda adiciona os elementos ao filtro atraves do uso de varias hashfu
% a ultima verifica se um item pertence ao filtro ou nao

% a obtençao de falsos negativos é impossivel nos filtros de bloom, uma vez
% que o uso das mesmas hf nao o permitem

% no entanto infelizmente é possivel ocorrer falsos positivos, dai ser
% necessario a escolha de boas hf, de um tamaho e do numero de hf correto

%% MinHash
% similaridade entre conjuntos

% o codigo do exercicio 1 sao calculadas diretamente as distancias de
% Jaccard entre o comjunto de filmes de cada user
% basicamente le o ficheiro, de seguida calcula as distancias de Jaccard
% para todos os pares de filmes dentro de um duplo for para nao haver
% repetição, usando a formula das distancias de Jaccard. Por fim utiliza as
% verifica todas as distancias e se forem menor do que o threshold
% fornecido entao pertence aos similares

% minhash utiiza a mesma logica mas com um alforitmo completamente
% diferente, usando as funcoes de dispersao para atribuir a cada conjunto
% um vetor minHash atraves do min da hash function, criando a matriz MinHash, da qual atraves de comparaçao
% entre linhas pode determinar tambem as distancias de Jaccard que
% pretendemos





