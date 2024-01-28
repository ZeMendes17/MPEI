%% a)
N = 10^5;
i_min = 6;
i_max = 20;
symb = ['a':'z' 'A':'Z'];
p = ones(1,length(symb))/length(symb);
geraChavesCarac(N,i_min,i_max,symb,p)

%% b)
N = 10^5;
symb = 'a':'z'; 
i_min = 6;
i_max = 20;
p = load("prob_pt.txt");
p = p';
geraChavesCarac(N,i_min,i_max,symb,p)