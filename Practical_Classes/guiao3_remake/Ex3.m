%% a)
T = zeros(20,20); % matriz vazia com 20 colunas e 20 linhas

for k = 1 : 20
  r = rand(20, 1);
  r = r / sum(r); % ao dividir pela sum(r) depois no final a soma da coluna é 2
  
  T(:,k) = r;
end 

estoc = sum(sum(T))/20;
disp(estoc)
disp("Como a soma de cada coluna é 1, a matriz é estocastica")


%% b)

vetor = zeros(1,20)';
vetor(1) = 1;

T2 = T^2*vetor;
res2 = T2(20)

T5 = T^5*vetor;
res5 = T5(20)

T10 = T^10*vetor;
res10 = T10(20)

T100 = T^100*vetor;
res100 = T100(20)


