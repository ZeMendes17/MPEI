%% a)
p = 0.4;
q = 0.6;

T = [ p^2     0 0 q^2;
     (1-p)^2  0 0 q*(1-q);
      p*(1-p) 0 0 q*(1-q);
      p*(1-p) 1 1 (1-q)^2];

%% b)
vetor_estado = [1 0 0 0]'; %inicialmente em A

trans5 = T^5 * vetor_estado
trans10 = T^10 * vetor_estado
trans100 = T^100 * vetor_estado
trans200 = T^200 * vetor_estado

%% c)
% u = Tu
M = [T - eye(4);
    ones(1, 4)]; % para a soma das probabilidades dar 1

x = [zeros(4,1);
    1]; % para a soma das probabilidades dar 1
u = M\x;
disp(u);
% os resultados de u são semelhantes aos resultados da alinea anterior