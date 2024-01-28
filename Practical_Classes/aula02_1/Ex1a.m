% probabilidade de a familia ter pelo menos um rapaz
% ou seja soma das probs de ter 1 filho ou dois filhos

p = 0.5; % probabilidade de ser rapaz
N = 1e5; % numero de experiencias
n = 2; % numero de filhos
k = 1; % ter um rapaz

experiencias = rand(n, N) > 0.5;
pelo_menos_1rapaz = sum(sum(experiencias) >= 1);
prob = pelo_menos_1rapaz/N;
disp(prob)