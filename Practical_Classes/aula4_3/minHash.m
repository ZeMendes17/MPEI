function similar_films = minHash(data,k)
    similar_films = zeros(length(data));
    h = waitbar(0,'Filtering...');
    for film_1 = 1:length(data)
        waitbar(film_1/length(data),h);
        for film_2 = film_1+1:length(data)
            similar_films(film_1, film_2) = 1 -( sum(data(film_1, :) == data(film_2, :)) / k);
        end
    end
    delete(h);
end