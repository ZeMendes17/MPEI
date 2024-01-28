%% 1
file = fopen("wordlist-preao-20201103.txt");
words = textscan(file, "%s", 'Delimiter','\n');
words = words{1};
fclose(file);

n = 8000;
k = 3;
keys = words(1:1000);

B = initialize(n);
for i = 1:length(keys)
    B = insert(B,keys{i}, k);
end

%% 2
% utiliza as palavras usadas e caso nao seja membro é fn
falso_negativos = 0;

for i= 1:length(keys)
    if ~member(B,keys{i},k)
        falso_negativos = falso_negativos + 1;
    end
end

if falso_negativos >= 1
    fprintf("Falso negativo (%d) \n", falso_negativos);
else
    fprintf("Nenhum falso negativo\n");
end

%% 3
% usa novas palavras para verificar se sao fp
keys = words(1001:11001);

falso_positivos = 0;

falsos_positivos=0;

for i= 1:length(keys)
    if member(B,keys{i},k)
        falsos_positivos = falsos_positivos+1;
    end
end

fprintf("Percentagem de falsos positivos %f%%\n",falsos_positivos/length(keys)*100);

%% 5

n = 8000;
falsos_positivos_lst = zeros(7,1);
ks = 4:10;

for k= ks
    keys = words(1:1000);
    B = initialize(n);

    for i= 1:length(keys)
        B = insert(B,keys{i},k);
    end

    keys = words(1001:11001);
    falsos_positivos = 0;

    for i= 1:length(keys)
        if member(B,keys{i},k)
            falsos_positivos = falsos_positivos+1;
        end
    end

    falsos_positivos_lst(k-3) = falsos_positivos/length(keys)*100;
end

plot(ks,falsos_positivos_lst);
xlabel("k");
ylabel("percentagem de falsos positivos");
fprintf("K ótimo: %d; percentagem de falsos positivos: %f%%\n",ks(falsos_positivos_lst==min(falsos_positivos_lst)),min(falsos_positivos_lst));