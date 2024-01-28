% p = 0.4 e q = 0.6
p = 0.4;
q = 0.6;
% fazer a matriz de transição
%% a)
T = [p^2 0 0 q^2;
    (1-p)^2 0 0 q*(1-q);
    p*(1-p) 0 0 q*(1-q);
    p*(1-p) 1 1 (1-q)^2];

%% b)
T5 = T^5;
resp5 = T5(:,1)

T10 = T^10;
resp10 = T10(:,1)

T100 = T^100;
resp100 = T100(:,1)

T200 = T^200;
resp200 = T200(:,1)

%% c)
% u = Tu
M = [T - eye(4);
    ones(1, 4)]; % para a soma das probabilidades dar 1

x = [zeros(4,1);
    1]; % para a soma das probabilidades dar 1
u = M\x;
disp(u);
% os resultados de u são semelhantes aos resultados da alinea anterior

