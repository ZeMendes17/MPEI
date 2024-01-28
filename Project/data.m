% este primeiro ficheiro vai ler os dados lidos pelos ficheiros fornecidos
% e guardar os dados necessários à realização de cada opção
clear;
clc;
%% read data
dic = readcell('users.txt', 'Delimiter',';');
dic2= readcell('film_info.txt', 'Delimiter','\t');
udata = load('u.data');
u = udata(1:end,1:3); clear udata; % obtem as primeiras duas colunas

%% option 1
rated_users = user_review(u, dic);

%% option 2
n_hash_functions = 100;
users_per_film = list_of_users(u);
similar_films = calculate_film_similarities(n_hash_functions, users_per_film);

%% option 3
n_hash_functions = 100;
interests_per_user = interests(dic); % obtem os interesses de cada user
similar_interests = calculate_interest_similatities(n_hash_functions, interests_per_user);

%% option 4
film_titles = [];
for i = 1:length(dic2)
    film_titles = [film_titles string(dic2{i,1})]; % guarda o nome dos filmes
end
n_hash_functions = 100;
minhash_titles = calculate_minhash_titles(film_titles, n_hash_functions);
% é ainda necessário realizar o Bloom Filter Counter
% inicializa o filtro
filter_size = 10000; % sendo o numero de filmes 1632
n_hash_functions = 6;
filter = initialize(filter_size);
h = waitbar(0,'Filling Bloom Filter...');
for i = 1:length(u)
    waitbar(i/length(u),h);
    % insere o filme se o seu rating for superior ou igual a 3
    if u(i,3) < 3 % caso o rating seja inferior a 3 passa á frente
        continue;
    end
    film_id = u(i,2); % temos o id queremos o nome
    film = film_titles(film_id);
    film = char(film);
    % insere para o filtro de bloom contando
    filter = insert_to_filter(filter, film, n_hash_functions);
end
delete(h)
% obtemos assim o filtro de bloom de contagem
% queremos agora saber o numero de vezes que o filme foi portanto avaliado
ratings = zeros(1, length(film_titles));
h = waitbar(0,'Getting Rates...');
for i = 1:length(film_titles)
    waitbar(i/length(film_titles),h);
    film = film_titles(i);
    film = char(film);
    n_rates = member(filter, film, n_hash_functions);
    ratings(i) = n_rates;
end
delete(h)

%% 1 funcs
function rated_users = user_review(u, dic)
    rated_users = cell(1682, 2); % pois existem 1682 films

        for i = 1:length(u) % vai percorrer a lista de avaliações para ver se o film esta la
            id = u(i,2);
            user_id = u(i,1);
            name = string(dic{user_id, 2}); % o nome do utilizador
            surname = string(dic{user_id, 3}); % sobrenome do utilizador
            fullname = name + " " + surname;
            rated_users{id,1} = [rated_users{id,1} fullname];
            rated_users{id,2} = [rated_users{id,2} user_id];
        end
end

%% 2 funcs
function users_per_film = list_of_users(u)
    users_per_film = cell(1682, 1); % n de filmes em que cada linha é um user
    for i = 1:length(u)
        % os indices da matriz linha representam os ids do filme
        film = u(i,2);
        user = u(i,1);
        users_per_film{film} = [users_per_film{film} user]; % para adicionar o user à lista do filme
    end

end

function similar_films = calculate_film_similarities(n_hash_functions, users_per_film)
    % como pretendemos os dois filmes mais similares, é necessário
    % guardar para cada filme os utilizadores que o avaliaram

    % ja possuimos os utilizadores que avaliaram cada filme, agora
    % temos de determinar as similaridades
    minhash_films = inf(1682, n_hash_functions); % matriz que vai receber os resultados minhash
    h = waitbar(0,'Calculating...');
    for i = 1:length(users_per_film)
        waitbar(i/length(users_per_film),h);
        users = users_per_film{i}; % users que avaliaram o filme
        for j = 1:length(users) % cada user
            user = users(j);
            indexes = zeros(1, n_hash_functions);
            for z = 1:n_hash_functions
                user = [user num2str(z)];
                indexes(z) = DJB31MA(user, 181); % numero primo alto
            end
            minhash_films(i,:) = min([minhash_films(i, :) ; indexes]);
        end
    end
    delete(h);
    
    % de seguida é necessario calcular as similaridades
    similar_films = zeros(length(users_per_film));
    h = waitbar(0,'Filtering...');
    for film_1 = 1:length(users_per_film)
        waitbar(film_1/length(users_per_film),h);
        for film_2 = film_1+1:length(users_per_film)
            similar_films(film_1, film_2) = 1 -( sum(minhash_films(film_1, :) == minhash_films(film_2, :)) / n_hash_functions);
        end
    end
    delete(h);
end

%% 3 funcs
% função para obter os interesses de cada user
function interests_per_user = interests(dic)
h = waitbar(0,'Interests...');
    interests_per_user = cell(length(dic), 1);
    for i = 1:length(dic)
        waitbar(i/length(dic),h);
        interests = [];
        for j = 4:width(dic)
            interest = dic{i, j};
            if ismissing(interest) % caso ja nao exista mais nenhum interesse
                break;
            end
            interests = [interests string(interest)];
        end
        interests_per_user{i,1} = interests;
    end
    delete(h);
end

function similar_interests = calculate_interest_similatities(n_hash_functions, interests_per_user)
    minhash_interests = inf(length(interests_per_user), n_hash_functions); % matriz que vai receber os resultados minhash
    h = waitbar(0,'Calculating...');
    for i = 1:length(interests_per_user)
        waitbar(i/length(interests_per_user),h);
        interests = interests_per_user{i}; % users que avaliaram o filme
        for j = 1:length(interests) % cada user
            interest = char(interests(j));
            indexes = zeros(1, n_hash_functions);
            for z = 1:n_hash_functions
                interest = [interest num2str(z)];
                indexes(z) = DJB31MA(interest, 181); % numero primo alto
            end
            minhash_interests(i,:) = min([minhash_interests(i, :) ; indexes]);
        end
    end
    delete(h);

    % calcular as distancias
    similar_interests = zeros(length(interests_per_user));
    h = waitbar(0,'Filtering...');
    for interest_1 = 1:length(interests_per_user)
        waitbar(interest_1/length(interests_per_user),h);
        for interest_2 = interest_1+1:length(interests_per_user)
            similar_interests(interest_1, interest_2) = 1 -( sum(minhash_interests(interest_1, :) == minhash_interests(interest_2, :)) / n_hash_functions);
        end
    end
    delete(h);
end

%% 4 funcs
function minhash_titles = calculate_minhash_titles(film_titles, n_hash_functions)
    % neste caso e necessario o uso de shingles para os titulos
    size_of_a_shingle = 3;
    minhash_titles = inf(length(film_titles), n_hash_functions);
    h = waitbar(0,'Calculating...');

    for i = 1:length(film_titles)
        waitbar(i/length(film_titles),h);
        film_title = film_titles(i);
        film_title = char(film_title);
        s_length = strlength(film_title) - size_of_a_shingle + 1;
 
        for j = 1: s_length
            film_shingle = lower(char(film_title(j:(j + size_of_a_shingle - 1))));
            indexes = zeros(1, n_hash_functions);

            for z = 1:n_hash_functions
                film_shingle = [film_shingle num2str(z)];
                indexes(z) = DJB31MA(film_shingle, 181); % numero primo alto
            end
            minhash_titles(i,:) = min([minhash_titles(i,:) ; indexes]);
        end
    end
    delete(h);

    % de seguida é necessario calcular as similaridades
    % no entanto não possuimos a string introduzida para tal
end

function F = initialize(n)
    F = zeros(1, n);
end

function F = insert_to_filter(F,element, n_hash_fuctions)
    for i = 1:n_hash_fuctions
        key = [element num2str(i)];
        index = mod(string2hash(key), length(F))+1;
        F(index) = F(index) + 1;
    end
end

function counter = member(F, element,n_hash_functions)
    filter_counter = zeros(1,n_hash_functions);
    for i = 1:n_hash_functions
        key = [element num2str(i)];
        index = mod(string2hash(key), length(F))+1;
        filter_counter(i) = F(index);
    end
    counter = min(filter_counter); % é usado o valor minimo (minimum selection)
end

%% hash functions
function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end

function hash=string2hash(str,type)
    % From string to double array
    str=double(str);
    if(nargin<2), type='djb2'; end
    switch(type)
        case 'djb2'
            hash = 5381*ones(size(str,1),1); 
            for i=1:size(str,2) 
                hash = mod(hash * 33 + str(:,i), 2^32-1); 
            end
        case 'sdbm'
            hash = zeros(size(str,1),1);
            for i=1:size(str,2) 
                hash = mod(hash * 65599 + str(:,i), 2^32-1);
            end
        otherwise
            error('string_hash:inputs','unknown type');
    end
end


