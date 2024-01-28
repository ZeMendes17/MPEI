function minhash_films = makeMatrix(data, n_hash_functions)
    minhash_films = inf(length(data), n_hash_functions); % matriz que vai receber os resultados minhash
    h = waitbar(0,'Calculating...');
    for i = 1:length(data)
        waitbar(i/length(data),h);
        users = data{i}; % users que avaliaram o filme
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
    delete(h)
end