%% a)
% matriz de transição
T = [0.7 0.2 0.3;
     0.2 0.3 0.3;
     0.1 0.5 0.4];

%% b)
% P[estar sol no segundo e terceiro \ primeiro dia é sol]
% P[dia 1 = sol] * P[dia 2 = sol\dia 1 = sol] * P[dia 3 = sol\dia 1 = sol]
v = [1 0 0]';
v2 = T*v;
v3 = T*v;
fprintf("5b) %f\n", v2(1)*v3(1))

%% c)
% probabilidade de nao chover nem no segundo nem no terceiro, sabendo que o
% primeiro dia é sol

v = [1 0 0]';
v2 = T*v;
v3 = T*v;
fprintf("5c) %f\n", (v2(1) + v2(2)) * (v3(1) + v3(2)));

%% d)
% Assumindo que o primeiro dia  ́e de sol, determine o n ́umero m ́edio de dias de sol, de nuvens e de
% chuva que se espera ter em todo o mˆes de janeiro

respSol = 1;
respNuvem = 0;
respChuva = 0;

v = [1 0 0]';

for i = 2:31
    v = T*v;
    respSol = respSol + v(1);
    respNuvem = respNuvem + v(2);
    respChuva = respChuva + v(3);
end

fprintf("5d) sol: %f\n", respSol)
fprintf("5d) nuvem: %f\n", respNuvem)
fprintf("5d) chuva: %f\n", respChuva)

%% e)


    