d_cell = cell(3,1);
i = 1;

udata = load("u.data");
u = udata(1:end,1:2); clear udata;
users = unique(u(:,1));
%users = users(randperm(length(users),100));

for k = [50,100,200]
    tic;
    movies = getMovies(users,u); % vai obter os filmes
    fprintf("getMovies(): %7.6es\n",toc);

    % fazer as assinaturas
    nhf = 100; % n de hash functions
    signatures = zeros(nhf,length(movies)); %Each Row -> A Set entry ; Each Col -> Hashing of That Set's Entry
    for us = 1:length(movies)
        for mov = 1:length(us)
            % o mov e o id do filme deste user
            for i = 1:nfh
                key = [movie{us}(mov) num2str(i)];
                index = hashstring(key, length()) +1;

            end

        end
    end


end