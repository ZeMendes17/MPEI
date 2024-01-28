%% ex2

HT_sizes = [5*1e5 1e6 2*1e6];

N = 10^5;
symb = 'a':'z'; 
i_min = 6;
i_max = 20;
p = load("prob_pt.txt");
p = p';
geraChavesCarac(N,i_min,i_max,symb,p)
keys = geraChavesCarac(N,i_min,i_max,symb,p);

% guarda os hash codes obtidos
hc_1 = zeros(4, N); %hashcodes para o 1 tammanho
hc_2 = zeros(4, N); % 2 tamanho
hc_3 = zeros(4, N); % 3 tamanho

n_atribuicoes = cell(4,3); % utilizado para o b)
n_colisoes = zeros(4,3);
tempo = zeros(4,3);

for i = 1:3 % diferentes tamanhos
    hashtable = zeros(HT_sizes(i), 1);
    tic;
    for j = i:N
        hashcode = mod(string2hash(keys{j}, 'djb2'), HT_sizes(i)) + 1;
        hashtable(hashcode) = hashtable(hashcode)+1;
        if i == 1
            hc_1(1,j) = hashcode;
        elseif i == 2
            hc_2(1,j) = hashcode;
        else
            hc_3(1,j) = hashcode;
        end
    end
    n_atribuicoes{1,i} = hashtable;
    n_colisoes(1,i) = sum(hashtable > 1);
    tempo(1,i) = toc;
    
    tic;
    for j = i:N
        hashcode = mod(string2hash(keys{j}, 'sdbm'), HT_sizes(i)) + 1;
        hashtable(hashcode) = hashtable(hashcode)+1;
        if i == 1
            hc_1(2,j) = hashcode;
        elseif i == 2
            hc_2(2,j) = hashcode;
        else
            hc_3(2,j) = hashcode;
        end
    end
    n_atribuicoes{2,i} = hashtable;
    n_colisoes(2,i) = sum(hashtable > 1);
    tempo(2,i) = toc;

    tic;
    for j = i:N
        hashcode = hashstring(keys{j}, HT_sizes(i)) + 1;
        hashtable(hashcode) = hashtable(hashcode)+1;
        if i == 1
            hc_1(3,j) = hashcode;
        elseif i == 2
            hc_2(3,j) = hashcode;
        else
            hc_3(3,j) = hashcode;
        end
    end
    n_atribuicoes{3,i} = hashtable;
    n_colisoes(3,i) = sum(hashtable > 1);
    tempo(3,i) = toc;

    tic;
    for j = i:N
        hashcode = mod(DJB31MA(keys{i}, 13), HT_sizes(i))+1;
        hashtable(hashcode) = hashtable(hashcode)+1;
        if i == 1
            hc_1(4,j) = hashcode;
        elseif i == 2
            hc_2(4,j) = hashcode;
        else
            hc_3(4,j) = hashcode;
        end
    end
    n_atribuicoes{4,i} = hashtable;
    n_colisoes(4,i) = sum(hashtable > 1);
    tempo(4,i) = toc;
end

disp("a)")
disp(hc_1)
disp(hc_2)
disp(hc_3)

disp("b)")
disp(n_atribuicoes);

disp("c)")
disp(n_colisoes)

disp("d)")
disp(tempo)

%% ex3
disp("3")
titles={'string2hash(djb2)','string2hash(sdbm)','hashstring','DJB31MA'};
momentos = zeros(3,10);
for i= 1:3
    for j= 1:4
        subplot(3,4,4*(i-1)+j);
        histogram(n_atribuicoes{j,i},100);
        title(sprintf("%s, %d:",titles{j},HT_sizes(i)));
    end
    fprintf("Momentos:\n");
        valores = n_atribuicoes{j,i};
        [contagem,valores] = groupcounts(valores);
        for n= [2,5,10]       
            En = 0;
            for x= 1:length(valores)
                En = En + ((valores(x)^n)*(contagem(x)/HT_sizes(i)));
            end
            momentos(i,n)=En;
            fprintf("\tMomento de ordem %d: %d\n",n,En);
        end
        
        fprintf("\n");
        fprintf("Número de colisões: %d\n",n_colisoes(j,i));
        fprintf("Numero máximo de atribuiçoes numa posição: %d\n",max(n_atribuicoes{j,i}));
        fprintf("Tempo de execução: %f",tempo(j,i));
        fprintf("\n");
end
