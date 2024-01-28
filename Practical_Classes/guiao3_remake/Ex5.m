%% a)
T = [0.7 0.2 0.3;
     0.2 0.3 0.3;
     0.1 0.5 0.4];

%% b)
% probabilidade de estar sol no segundo e terceiro dia quando o primeiro
% foi de sol

vetor_estado = [1 0 0]';

dia2 = T^1 * vetor_estado;
dia3 = T^2 * vetor_estado;

disp("Probabilidade de estar sol no segundo e no terceiro dia: " + (dia2(1)*dia3(1)))

%% c)
% o vetor estado é o mesmo
% e as probabilidades dos dias tambem

disp("A probabilidade de nao chover no segundo nem no terceiro dia, sabendo que no primeiro esteve sol e de: " + (dia2(1) + dia2(2)) * (dia3(1) + dia3(2)))

%% d)

respSol = 1; % pois ja se sabe que no primeiro dia esteve sol
respNuvem = 0;
respChuva = 0;
% o vetor estado e o mesmo

for i = 2:31 % do dia 2 ate ao 31
    temp = T^(i-1) * vetor_estado;
    respSol = respSol + temp(1);
    respNuvem = respNuvem + temp(2);
    respChuva = respChuva + temp(3);
end

fprintf("5d) sol: %d\n", round(respSol))
fprintf("5d) nuvem: %d\n", round(respNuvem))
fprintf("5d) chuva: %d\n", round(respChuva))

%% e)

respSol2 = 0; % pois ja se sabe que no primeiro dia esteve sol
respNuvem2 = 0;
respChuva2 = 1;
vetor_estado = [0 0 1]';

for i = 2:31 % do dia 2 ate ao 31
    temp = T^(i-1) * vetor_estado;
    respSol2 = respSol + temp(1);
    respNuvem2 = respNuvem + temp(2);
    respChuva2 = respChuva + temp(3);
end

fprintf("5e) sol: %d\n", round(respSol2))
fprintf("5e) nuvem: %d\n", round(respNuvem2))
fprintf("5e) chuva: %d\n", round(respChuva2))
disp("Concluimos que aumenta o numero de dias de chuva em 2 e diminui os de sol em 2, as nuvens mantém se")

%% e)

dores = [0.1 0.3 0.5]';
dor_sol = respSol * dores(1) + respNuvem * dores(2) + respChuva * dores(3);
dor_chuva = respSol2 * dores(1) + respNuvem2 * dores(2) + respChuva2 * dores(3);
disp("Dias em que vai sofrer de dores se estiver sol no primeiro: " + dor_sol)
disp("Dias em que vai sofrer de dores se estiver chuva no primeiro: " + dor_chuva)


