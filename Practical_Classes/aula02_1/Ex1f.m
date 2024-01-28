% familia com 5 filhos pelo menos 1 rapaz
% probabilidade de pelo menos mais um ser rapaz

N = 1e6; % numero de experiencias
p = 0.5; % prob rapaz ou rapariga
k = 1; % numero de rapazes mininmo
k2 = 2; %numero de rapazes maximo
n = 5; %numero de filhos

calc = rand(n, N) > p;
prob2M = sum(calc) >= k2; % probabilidade de existirem 2 ou mais rapazes
probM = sum(calc) >= k; % 1 ja é filho

probSim = sum(prob2M) / sum(probM);
disp(probSim);