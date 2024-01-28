function array = geraChavesCarac(N, i_min, i_max, symb, p)
    % N --> numero de chaves a gerar
    % i_min e i_max --> valor minimo e maximo de comprimento
    % symb --> vetor com os parametros a usar nas chaves
    % p --> vetor com as probabilidades de cada caracter

    if nargin < 4
        symb = ['a':'z' 'A':'Z' '0':'9'];
    end
    size = randi([i_min, i_max],1,N);
    array = cell(N,1);
    for i = 1:N
        word = '';
        switch nargin
            case 3
                pos = randi([1,length(symb)],1,size(i));
                word = symb(pos);
            case 4
                pos = randi([1,length(symb)],1,size(i));
                word = symb(pos);
            case 5
                for j = 1:size(i)
                    x = 1 + sum(rand >= cumsum(p)); % escolhe baseado na probablidade de cada
                    word = strcat(word, symb(x));
                end
        end
        array{i} = word;
    end
end

