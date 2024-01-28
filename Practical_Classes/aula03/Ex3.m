%% a)
T = zeros(20,20);

for k = 1 : 20
  r = rand(20, 1); % gera 20 valores aleatorio para cada linha ou coluna tanto faz
  r = r / sum(r); % para ser estocástica
  
  T(:,k) = r;
end 

disp(T);
disp("É estocástica pois não temos entradas negativas e a soma de cada coluna dá sempre 1");

%% b)
% uma vez que começa no estado 1:
vetor_estado = zeros(1, 20)';
vetor_estado(1) = 1; % indicando que se encontra na posição 1 inicialmente

% queremos a probabilidade de ele estar na posição 20 passado x posições
transitions = [2 5 10 100];
for i = 1:length(transitions)
    T_temp = T^transitions(i);
    v_estado_temp = T_temp * vetor_estado;
    prob_pos_20 = v_estado_temp(20) * 100;
    disp("Prob de estar no estado 20 após " + i + " é: " + prob_pos_20 + "%")
end
disp("Concluimos portanto que os valores vao estabilizando encontrando o equilibrio")