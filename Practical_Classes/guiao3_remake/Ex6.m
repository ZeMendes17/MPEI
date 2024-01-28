%% a)
% 3 e 5 sao estaados absorventes
% ordem 1 2 4 3 5
T = [0.8 0   0.3 0 0;
     0.2 0.6 0.2 0 0
     0   0.1 0.4 0 0
     0   0.3 0   1 0
     0   0   0.1 0 1];

%% b)
vetor_estado = [1 0 0 0 0]'; % começa no 1
probs = zeros(1,100);

for n = 1:100
    temp = T^(n) * vetor_estado;
    probs(n) = temp(2); % pois queremos a probabilidade de estar no estado 2
end

figure(1)
plot(1:100, probs, '.')
grid on
xlabel("Numero de transiçoes")
ylabel("Probabilidade")
disp("Uma vez que exitem 2 estados absorventes, quanto maior o numero de transições, menor a probabilidade " + ...
    "de estar no estado 2, ate tender para 0")

%% c)
vetor_estado = [1 0 0 0 0]'; % começa no 1
probs3 = zeros(1,100);
probs5 = zeros(1,100);

for n = 1:100
    temp = T^(n-1) * vetor_estado;
    probs3(n) = temp(4); % pois queremos a probabilidade de estar no estado 3
    probs5(n) = temp(5); % pois queremos a probabilidade de estar no estado 5
end

figure(2)
plot(1:100, probs3, 'b.')
hold on
plot(1:100, probs5, 'r.')
grid on
xlabel("Numero de transiçoes")
ylabel("Probabilidade")
disp("Concluimos que quanto maior o numero de transições, a probabilidade de a posição ser 3 é quase 1 " + ...
    "e a probabilidade de ser 5 é o que falta á prob de 3 para ser 1")

%% d)
Q = T(1:3, 1:3); % 3 --> numero de estados nao absorventes

%% e)
F = inv(eye(size(Q)) - Q); % e uma formula

%% f)
num_passagens = sum(F); % pois a matriz F da nos a passagem em media de cada estado
disp("O numero de passos ate a absorção começando no 1: " + num_passagens(1));
disp("O numero de passos ate a absorção começando no 2: " + num_passagens(2));
disp("O numero de passos ate a absorção começando no 4: " + num_passagens(3));

%% g)

R = T(3+1:end, 1:3); % 3 -> numero de estados nao absorventes

B = R * F; % colunas --> 1 2 4
           % linhas --> 3 5

% começando no 1 e terminando no 3
B(1, 1)
% começando no 1 e terminando no 5
B(2, 1)
disp("Tal como se verifica no 6c) a probabilidade de começar no 1 e terminar no 3 é aproximadamente 0.95 " + ...
    "e a probabilidade de terminar no 5 é de 0.05, quando o numero de passos é elevado")