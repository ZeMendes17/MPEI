% probabilidade de os motores falhares -> p
% falhas independentes entre motores
% mais de metade dos motores falhar entao o aviao despenha se
% é preferivel ter 2 motores ou 4

N = 1e5;
M2 = rand(2, N);
M4 = rand(4, N);

falhar2 = M2 < 0.3;
falhar4  = M4 < 0.3;

cair2 = sum(sum(falhar2) > 1);
cair4 = sum(sum(falhar4) > 2);

probCair2 = cair2/N;
probCair4 = cair4/N;

%% Grafico

p = logspace(-3, log10(1/2), 100);

probc2 = zeros(100);
probc4 = zeros(100);
i = 1;

for f = p
    % fazer probabilidade dos 2
end

%plot
