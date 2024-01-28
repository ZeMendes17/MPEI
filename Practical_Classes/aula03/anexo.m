% a state transition matrix example
H = [0.5 0.5 0;
0.5 0.4 0;
0 0.1 1];
% how to use crawl()
soma = 0;
N = 10;
for i = 1:10
    state = crawl(H, 1, 3)
    soma = soma + length(state)- 1;
end

soma/N


