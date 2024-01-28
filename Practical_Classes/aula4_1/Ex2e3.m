%% ex2

hashTableSizes = [5*1e5 1e6 2*1e6];

N = 1e5;
i_min = 6;
i_max = 20;
strings = geraChavesCarac(N,i_min,i_max);

codes1 = zeros(4,N);
codes2 = zeros(4,N);
codes3 = zeros(4,N);
resultados = cell(4,3); % para o b)
n_colisoes = zeros(4,3);
tempo = zeros(4,3);

for i= 1:3
    hash_table = zeros(hashTableSizes(i),1);
    tic;
    for j= 1:N
        code = mod(string2hash(strings{j},'djb2'),hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(1,j) = code;
        elseif i == 2
            codes2(1,j) = code;
        else
            codes3(1,j) = code;
        end
    end
    resultados{1,i} = hash_table;
    n_colisoes(1, i) = sum(hash_table > 1);
    tempo(1, i) = toc;
    
    tic;
    for j= 1:N
        code = mod(string2hash(strings{j},'sdbm'),hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(2,j) = code;
        elseif i == 2
            codes2(2,j) = code;
        else
            codes3(2,j) = code;
        end
    end
    resultados{2,i} = hash_table;
    n_colisoes(2, i) = sum(hash_table > 1);
    tempo(2, i) = toc;
    
    tic;
    for j= 1:N
        code = hashstring(strings{j},hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(3,j) = code;
        elseif i == 2
            codes2(3,j) = code;
        else
            codes3(3,j) = code;
        end
    end
    resultados{3,i} = hash_table;
    n_colisoes(3, i) = sum(hash_table > 1);
    tempo(3, i) = toc;

    tic;
    for j= 1:N
        code = mod(DJB31MA(strings{j},13),hashTableSizes(i))+1;
        hash_table(code) = hash_table(code)+1;

        if i == 1
            codes1(4,j) = code;
        elseif i == 2
            codes2(4,j) = code;
        else
            codes3(4,j) = code;
        end
    end
    resultados{4,i} = hash_table;
    n_colisoes(4, i) = sum(hash_table > 1);
    tempo(4, i) = toc;
end

disp("b)")
disp(resultados)

disp("c)")
disp(n_colisoes)

disp("d)")
disp(tempo)

%% ex 3
disp("3")
titles={'string2hash(djb2)','string2hash(sdbm)','hashstring','DJB31MA'};
momentos = zeros(3,10);
for i= 1:3
    for j= 1:4
        subplot(3,4,4*(i-1)+j);
        histogram(resultados{j,i},100);
        title(sprintf("%s, %d:",titles{j},hashTableSizes(i)));
    end
    fprintf("Momentos:\n");
        valores = resultados{j,i};
        [contagem,valores] = groupcounts(valores);
        for n= [2,5,10]       
            En = 0;
            for x= 1:length(valores)
                En = En + ((valores(x)^n)*(contagem(x)/hashTableSizes(i)));
            end
            momentos(i,n)=En;
            fprintf("\tMomento de ordem %d: %d\n",n,En);
        end
        
        fprintf("\n");
        fprintf("Número de colisões: %d\n",n_colisoes(j,i));
        fprintf("Numero máximo de atribuiçoes numa posição: %d\n",max(resultados{j,i}));
        fprintf("Tempo de execução: %f",tempo(j,i));
        fprintf("\n");
        fprintf("------------------------------------------------------------------------------------------\n")
end
