% distribuição de poisson em paginas de livro e erros tipograficos

lambda = 0.02 * 100; % pois para cada pagina o lambda é 0.02, para o livro é multiplicar por 100
n = 100; % paginas do livro
% qual a probabilidade de ter no maximo 1 erro, ou seja, 0 ou 1

prob = 0;
for k=0:1
    prob = prob + ((lambda^k)/factorial(k)) * exp(-lambda);
end

disp(prob)