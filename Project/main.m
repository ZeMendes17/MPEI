% ler o outro ficheiro para ir bucar as infos
clc;

% intergir com o user
inp = 0;
count_case2 = 0; % para so calcular o minhash uma unica vez
while inp ~= 5
    film_id = input("Insert Film ID (1 to 1682) :");
    if isstring(film_id)
        continue;
    end
    if film_id < 1 || film_id > 1682
        continue;
    end
    fprintf("1 - Users that evaluated current movie\n");
    fprintf("2 - Suggestion of users to evaluate movie\n");
    fprintf("3 - Suggestion of users to based on common interests\n");
    fprintf("4 - Movies feedback based on popularity\n");
    fprintf("5 - Exit\n")
    inp = input("Select choice: ");

    switch inp
        case 1
            % lista dos users que avaliaram o filme
            % cada linha deve mostrar o id e o nome do user
            % vai buscar a informação pretedida
            names = rated_users{film_id,1};
            ids = rated_users{film_id,2};
            fprintf("Users that rated this movie:\n");
            for i = 1:length(names)
                fprintf("User ID: %d; Name: %s\n", ids(i), names(i));
            end
        case 2
            % como ja temos a matriz com as similaridades, temos agora de
            % ver os dois filmes mais similares
            % para obter as duas menores distancias
            min_distance_1 = 1;
            min_distance_2 = 1;
            simi_film_1_id = 0;
            simi_film_2_id = 0; % guarda os ids dos filmes

            % os filmes anteriores estao na coluna e os a seguir em linha
            % para os filmes com um id a baixo:
            for i = 1:film_id-1
                if similar_films(i, film_id) < min_distance_1
                    simi_film_2_id = simi_film_1_id; % guarda o valor anterior logo o segundo menor
                    min_distance_2 = min_distance_1;
                    min_distance_1 = similar_films(i, film_id);
                    simi_film_1_id = i;

                elseif similar_films(i, film_id) < min_distance_2
                    min_distance_2 = similar_films(i, film_id);
                    simi_film_2_id = i;
                end
            end
            
            % para os filmes com id a cima:
            for i = film_id+1:length(similar_films)
                if similar_films(film_id, i) < min_distance_1
                    simi_film_2_id = simi_film_1_id;
                    min_distance_2 = min_distance_1;
                    min_distance_1 = similar_films(film_id, i);      
                    simi_film_1_id = i;

                elseif similar_films(film_id, i) < min_distance_2
                    min_distance_2 = similar_films(film_id, i); 
                    simi_film_2_id = i;
                end
            end
        
            % com os dois filmes mais parecidos temos de fazer o que é
            % preciso
            fprintf("Similar film 1: %d\n", simi_film_1_id);
            fprintf("Similar film 2: %d\n", simi_film_2_id);

            possible_users = [];

            first_id_users = users_per_film{simi_film_1_id, 1};
            for i = 1:length(users_per_film{simi_film_1_id, 1})
                possible_users = [possible_users first_id_users(i)];
            end

            second_id_users = users_per_film{simi_film_2_id, 1};
            for i = 1:length(users_per_film{simi_film_2_id, 1})
                if ~any(possible_users == second_id_users(i)) % caso ainda nao esteja no conjunto
                    possible_users = [possible_users second_id_users(i)];
                end
            end

            fprintf("Possible users:\n");
            for j = 1:length(possible_users)
                if ~any(users_per_film{film_id,1} == possible_users(j)) % caso nao pertença ao conjunto do filme original
                    id = possible_users(j);
                    name = dic{id,2};
                    surname = dic{id,3};
                    fullname = name + " " + surname;
                    fprintf("User ID: %d; Name: %s\n", id, fullname);
                end
            end


        case 3
            % interesses
            % lista de users com distancia de Jaccard a esse user menor que
            % 0.9 e que ainda nao avaliaram o filme atual
            % estes vao ser possiveis avaliadores do atual
            % apresnta o id e o nome dos dois users com maior similaridade
            % usa o similar_interests para obter as distancias de jaccard
            common_users = zeros(1, length(similar_interests));
            users = users_per_film{film_id};
            for k = 1:length(users)
                user = users(k);
                %filmes anteriores
                for i = 1:user-1
                    similar_rate = similar_interests(i,user);
                    if similar_rate <= 0.9
                        continue;
                    end
                    % ver se ainda nao avaliou o filme
                    if ~any(users_per_film{film_id} == i) % caso nao possua o filme introduzido pode adicionar
                        common_users(i) = common_users(i) + 1;
                    end
                end
    
                % filmes seguintes
                for i = user+1:length(similar_interests)
                    similar_rate = similar_interests(user, i);
                    if similar_rate <= 0.9
                        continue;
                    end
                    if ~any(users_per_film{film_id} == i) % caso nao possua o filme introduzido pode adicionar
                        common_users(i) = common_users(i) + 1;
                    end
                end
            end

            % temos de escolher os 2 users que aparecem mais vezes
            first_user = 0;
            id_1 = 0;
            second_user = 0;
            id_2 = 0;
            for i = 1:length(common_users)
                n_times = common_users(i);
                if n_times > first_user
                    second_user = first_user;
                    id_2 = id_1;
                    first_user = n_times;
                    id_1 = i;
                elseif n_times > second_user
                    second_user = n_times;
                    id_2 = i;
                end
            end
            % imprimir os valores
            name = dic{id_1, 2};
            surname = dic{id_1, 3};
            fullname = name + " " + surname;
            fprintf("User ID: %d; Name: %s\n", id_1, fullname);
            name = dic{id_2, 2};
            surname = dic{id_2, 3};
            fullname = name + " " + surname;
            fprintf("User ID: %d; Name: %s\n", id_2, fullname);


        case 4
            % user pesquisa por um nome de um filme ou parte do nome e
            % obtem os titulos parecidos com este
            n_hash_functions = 100;
            film_name = input("Search for a film: ");
            similar_titles = calculate_similar_titles(minhash_titles, film_name, n_hash_functions, film_titles, ratings);

        case 5
            fprintf("Exixing the program...\n");
        otherwise
            fprintf("Invalid option\n");
    end
end

function similar_titles = calculate_similar_titles(minhash_titles, film_name, n_hash_functions, film_titles, ratings)
    % temos o minhash titles que tem os hashcodes para cada filme
    % agora temos de achar a distancia entre estes e a string introduzida
    film_name = char(film_name);
    % primeiramente é necessario calcular a matrix minhash da string
    size_of_a_shingle = 3;
    minhash_string = inf(1, n_hash_functions); % desta vez apenas de tamanho 1 pois e so 1
    s_length = strlength(film_name) - size_of_a_shingle + 1;

    for j = 1: s_length
        string_shingle = lower(char(film_name(j:(j + size_of_a_shingle - 1))));
        indexes = zeros(1, n_hash_functions);

        for z = 1:n_hash_functions
            string_shingle = [string_shingle num2str(z)];
            indexes(z) = DJB31MA(string_shingle, 181); % numero primo alto
        end
        minhash_string(1,:) = min([minhash_string(1,:) ; indexes]);
    end

    % apos obter o minhash, necessitamos de comparar 
    similar_titles = zeros(1, length(minhash_titles));
    for title = 1:length(similar_titles)
        similar_titles(1, title) = 1 -( sum(minhash_titles(title, :) == minhash_string(1, :)) / n_hash_functions);
    end

    % agora temos de obter os 3 mais proximo
    sim_title_1 = 0; % id do filme mais proximo
    min_title_1 = 1; % menor distancia
    sim_title_2 = 0;
    min_title_2 = 1;
    sim_title_3 = 0;
    min_title_3 = 1;
    
    for i = 1:length(similar_titles)
        title_distance = similar_titles(i);
        if title_distance < min_title_1
            % tem de dar o seu valor ao segundo e o segundo ao terceiro
            sim_title_2 = sim_title_1;
            min_title_2 = min_title_1;
            sim_title_3 = sim_title_2;
            min_title_3 = min_title_2;

            sim_title_1 = i;
            min_title_1 = title_distance;

        elseif title_distance < min_title_2
            % igual ao de cima
            sim_title_3 = sim_title_2;
            min_title_3 = min_title_2;

            sim_title_2 = i;
            min_title_2 = title_distance;
        elseif title_distance < min_title_3
            sim_title_3 = i;
            min_title_3 = title_distance;
        end
    end
    % caso um deles seja 1 (ou todos) damos um filme aleatório
    if sim_title_1 == 1
        sim_title_1 = randi([1 1682]);
    end

    if sim_title_2 == 1
        sim_title_2 = randi([1 1682]);
        while sim_title_2 == sim_title_1 % nao atribuir o mesmo valor
            sim_title_2 = randi([1 1682]);
        end
    end

    if sim_title_3 == 1
        sim_title_3 = randi([1 1682]);
        while sim_title_3 == sim_title_2 || sim_title_3 == sim_title_1
            sim_title_3 = randi([1 1682]);
        end
    end
    film_1 = film_titles(sim_title_1);
    film_2 = film_titles(sim_title_2);
    film_3 = film_titles(sim_title_3);
    fprintf("Film name: %s; ID: %d; Number of ratings above or equal to 3 (1-5): %d\n", film_1,sim_title_1,ratings(sim_title_1));
    fprintf("Film name: %s; ID: %d; Number of ratings above or equal to 3 (1-5): %d\n", film_2,sim_title_2,ratings(sim_title_2));
    fprintf("Film name: %s; ID: %d; Number of ratings above or equal to 3 (1-5): %d\n", film_3,sim_title_3,ratings(sim_title_3));
end

function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end















