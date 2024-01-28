% o facto de ter um filho M não vai alterar a probabilidade de o segundo
% tambem ser rapaz, é um acontecimento independente


N = 1e6; % numero de experiencias
p = 0.5; % prob rapaz ou rapariga
k = 1; % numero de rapazes mininmo
k2 = 2; %numero de rapazes maximo
n = 2; %numero de filhos
filhos = rand(2, N) < 0.5;
%filhos(1, :) == filhos(1, 1:end); % primeira linha todas as colunas
CB = sum(filhos(1, :) == 1);
CAB = sum(sum(filhos) == 2);
probSim = CAB/CB;
disp(probSim);