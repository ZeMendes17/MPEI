d_cell = cell(3,1);
i = 1;

udata = load("u.data");
u = udata(1:end,1:2); clear udata;
users = unique(u(:,1));
%users = users(randperm(length(users),100));

for k= [50,100,200]
    tic;
    movies = getMovies(users,u);
    fprintf("getMovies(): %7.6es\n",toc);

    tic;
    minhash_matrix = makeMatrix(movies,k);
    fprintf("makeMatrix(): %7.6es\n",toc);

    tic;
    distances = minHash(minhash_matrix,k);
    fprintf("minHash(): %7.6es\n",toc);

    tic;
    SimilarUsers = filterSimilar(users,distances,0.4);
    fprintf("filterSimimlar(): %7.6es\n",toc);
    fprintf("Similar users (%d pairs):\n\n",height(SimilarUsers));

    i = i+1;
end