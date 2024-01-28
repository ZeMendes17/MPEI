%% Ex1
% oceano, floresta, deserto, urabano
T = [0.4 7/30 0.25 0.25;
     0.2 0.3  0.25 0.25;
     0.2 7/30 0.25 0.25;
     0.2 7/30 0.25 0.25];

% c)
vetor_estado = [1/4 1/4 1/4 1/4]'; % tem probabilidade igual de serem escolhidos para primeiro cenario

ambiente5 = T^4 * vetor_estado;

disp("c) " + ambiente5(4))
% d)

% u = Tu
M = [T - eye(4);
    ones(1, 4)]; % para a soma das probabilidades dar 1

x = [zeros(4,1);
    1]; % para a soma das probabilidades dar 1
u = M\x;
disp("d) " + u(1));

% e)
vetor_estado2 = [0 0 0 1]';

amb1 = vetor_estado;
% amb1(4)

amb2 = T * vetor_estado2;
% amb2(4)

amb3 = T^2 * vetor_estado2;

amb4 = T^3 * vetor_estado2;
% amb4(3)

amb5 = T^4 * vetor_estado2;
% amb5(3);

val = amb1(4) * amb2(4) * (amb3(1) + amb3(2) + amb3(3) + amb3(4)) * amb4(3) * amb5(3);
disp("e) " + val)

%% Ex2

load('/home/mendes/Desktop/MPEI/PL3_Avaliacao/L.mat'); % da a matriz L

% a)
N = length(L);

temp = sum(L);
count_de = 0;
for iter = 1:N
    if temp(iter) == 0
        count_de = count_de + 1;
    end
end

disp("Dead end: " + count_de)

% b)

H = zeros(N);

for iter = 1:N
    soma = temp(iter);
    if soma == 0
        H(:, iter) = 0;
    else
        H(:, iter) = L(:, iter) / soma;
    end
end

disp("b) ")
disp(H)

% c)
beta = 0.85;
A = beta*H + (1-beta) * ones(N)/N;

disp("c) ")
disp(A)

% d)
r = ones(N, 1)/N;
for i = 1:1e5
    r = A*r;
end
disp("d) ")
disp(r)

% e)



%% Ex3

T = [0 1/2 0 0.2 1/2 0;
     0.2 0 0.2 0 0 0;
     0 1/2 0 0.2 1/2 0;
     0.2 0 0.2 0 0 0;
     0.2 0 0.2 0.2 0 0;
     0.4 0 0.4 0.4 0 0];

% c)
state = crawl(T, randi([1,5]), 6);


% d)
c = cell(1, 10^5);

for iter = 1:10^5
    state = crawl(T, randi([1,5]), 6);
    c(iter) = {state};
end

% e)
% caro = [2 1 4 3 6]

count = 0;
for iter = 1:10^5
    if length(c{iter}) == 5
        if c{iter} == [2 1 4 3 6]
            count = count + 1;
        end
    end
end

disp(count/10^5)

v = [1/5 1/5 1/5 1/5 1/5]';

T = T(2:end, 2:end);

a1 = v;

v = [0 1 0 0 0]';

a2 = T * v;
a3 = T^2 * v;
a4 = T^3 * v;

val = a1(2) * a2(1) * a3(4) * a4(3);


T = [0 1/2 0 0.2 1/2 0;
     0.2 0 0.2 0 0 0;
     0 1/2 0 0.2 1/2 0;
     0.2 0 0.2 0 0 0;
     0.2 0 0.2 0.2 0 0;
     0.4 0 0.4 0.4 0 0];
soma = 0;
for inter = 1:10^5
    state = crawl(T, 4, 6);
    
    soma = soma + length(state);

end

disp(soma/10^5)












