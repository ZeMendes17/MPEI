%% Ex1
% a)
T = [0.8 0   0.3 0 0;
     0.2 0.6 0.2 0 0
     0   0.1 0.4 0 0
     0   0.3 0   1 0
     0   0   0.1 0 1];

% estados absorventes sao o 3 e o 5, que ficam nas colunas 4 e 5
% começa no 1
% a matriz H neste caso é a matriz T

N = 1e5;
len_state = 0;
len_state2 = 0;
len_state3 = 0;
absor3 = 0;
absor5 = 0;


for inter = 1:N
    state = crawl(T, 1, [4,5]);
    len_state = len_state + length(state) - 1;

    if state(length(state)) == 4
        absor3 = absor3 + 1;
    elseif state(length(state)) == 5
        absor5 = absor5 + 1;
    end

    state = crawl(T, 2, [4,5]);
    len_state2 = len_state2 + length(state) - 1;
    state = crawl(T, 3, [4,5]);
    len_state3 = len_state3 + length(state) - 1;

end

% f)
len_state = len_state/N; % quando comça em 1
len_state2 = len_state2/N; % qunado começa em 2
len_state3 = len_state3/N; % quando começa em 4

% g)
absor3 = absor3 / N; % quando comça no 1 e acaba no 3
absor5 = absor5 / N; % quando começa no 1 e acaba no 5


% b)
seq = cell(1, 10000);
for iter = 1:10000
    inicial = randi([1,3]); % random number from 1 to 3 with equal prob
    state = crawl(T, inicial, [4,5]);
    temp_matriz = [inicial, length(state)];
    seq(iter) = {temp_matriz};

end

min1 = 10;
min2 = 10;
min3 = 10;
max1 = 0;
max2 = 0;
max3 = 0;

for iter = 1:10000
    if seq{iter}(1) == 1
        if min1 > seq{iter}(2)
            min1 = seq{iter}(2);
        end
        if max1 < seq{iter}(2)
            max1 = seq{iter}(2);
        end

    elseif seq{iter}(1) == 2
        if min2 > seq{iter}(2)
            min2 = seq{iter}(2);
        end
        if max2 < seq{iter}(2)
            max2 = seq{iter}(2);
        end

    elseif seq{iter}(1) == 3
        if min3 > seq{iter}(2)
            min3 = seq{iter}(2);
        end
        if max3 < seq{iter}(2)
            max3 = seq{iter}(2);
        end
    end
end
disp("Minimos: ")
min1
min2
min3
disp("Maximos: ")
max1
max2
max3


%% Ex2
% a)
T = [0 0 0 0 0 0 0;
     1/2 0 0 0 0 0 0;
     1/2 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.3 0;
     0 1/3 0.4 0 0.3 0.3 0;
     0 0 0 0.3 0.2 0.4 0];

%b)
% prob de uma seq de 7 digitos iniciada em 91 e terminada em 9
% como começa com 91
T = [0 0 0 0 0;
     1/3 0.2 0.1 0 0;
     1/3 0.5 0.4 0.3 0;
     1/3 0 0.3 0.3 0;
     0 0.3 0.2 0.4 0];
vetor_estado = [1 0 0 0 0]';
% como o 9 esta na sequencia de 7, usamos 6 pois este nao esta ca incluido

trans5 = T^5 * vetor_estado; % apos 5 transições --> 6 estados + o 9, 7
disp(trans5(4))
% c)
disp(sum(trans5))

%% Ex3
% a)
H = [0 1/2 1/2 0 1/4 0;
     1 0   0   0 1/4 0;
     0 0   0   1 1/4 0;
     0 0   1/2 0 1/4 1;
     0 0   0   0 0   0
     0 1/2 0   0 0   0];

N = 6;
beta = 0.85;
H2 = beta*H + (1-beta) * ones(N)/N;

x0=ones(N,1)/N;
% -----------------------
iter=1;
x=x0;
epsilon=0.01;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold=x;
    x=H2*x;
    if max(abs(x-xold))<epsilon 
        break; 
    end
    iter=iter+1;
end

disp(x)
disp("Paginas com maior pagerank sao A B C e D")
disp("Paginas com menor pagerank sao E e F")

% b)
% pagerank = ones(6, 1)/6;
% 
% for iter = 1:10
%     pagerank = H*pagerank;   % nao da para usar pois nunca vai parar ao E
% end


H2 = beta*H + (1-beta) * ones(N)/N;
r = ones(N, 1)/N;
for i = 1:1000
    r = H2*r;
end

disp(r)
disp("Obtemos valores semelhantes")