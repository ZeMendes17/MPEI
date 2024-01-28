% n dardos lançados para m alvos
% é necessario criar um vetor com o numero de alvos e depois ver em quais
% sao atingidos pelos dardos

N = 1e6;
m = 100; %alvos
n = 20; %dardos
% queremos a probabilidade de pelo menos 1 alvo ter sido atingido 2 ou mais
% vezes
% funcao randi

experiencias = randi(m, n, N);

diferentes = zeros(1, N);
for col = 1:N
    diferentes(col) = length(unique(experiencias(:,col))) == n;
end

p1 = sum(diferentes) / N;
p2 = 1 - p1;
disp(p2)