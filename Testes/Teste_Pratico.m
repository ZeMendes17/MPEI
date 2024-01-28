% exame pratico MPEI 2022/2023

%% 1
a = [0.2 0.3 0.1 0.45];
% a)
T = [0 0 0 0 0 0;
    a(1) 0 0 0 0 0;
    0 0 0 a(4) a(2) 0;
    0 0 a(3) 0 (1-a(2)) 0;
    (1-a(1)) 1 (1-a(3)) 0 0 0;
    0 0 0 (1-a(4)) 0 1];

% b)
vetor_estado = [1 0 0 0 0 0]';
% prob para a pos 5
vetor_estado_1 = T*vetor_estado;
val1 = vetor_estado_1(5);

vetor_estado = [0 0 0 0 1 0]';
vetor_estado_2 = T*vetor_estado;
val2 = vetor_estado_2(4);


vetor_estado = [0 0 0 1 0 0]';
vetor_estado_3 = T*vetor_estado;
val3 = vetor_estado_3(6);

val_total = val1 * val2 * val3;

% c)
n_estados_naoabs = 5;
Q = T(1:n_estados_naoabs, 1:n_estados_naoabs);
F = inv(eye(size(Q)) - Q);
n_medio = sum(F);
disp(n_medio)

%% 2
% a)
for m = 1:100000
    p = (1 - exp(-100/m));
    if(p <= 0.01)
        disp(p)
        disp(m)
        break;
    end
end

% b)
B = initialize(9950);
arr = gerar(100, 6, 10);
for i = 1:length(arr)
    B = insert(B, arr{i}, 1);
end

count = 0;
arr = gerar(100, 6, 10);
for i = 1:length(arr)
    res = member(B, arr{i}, 1);
    count = count + res;
end

%% 3
f1 = "Os animais são nossos amigos";
f2 = "Os meus primos são muito amigos";
f3 = "Os animais dos meus primos são muito amigos";
f4 = "Os meus primos têm muitos animais";

f = [f1 f2 f3 f4]';
size_of_a_shingle = 3;
    minhash_titles = inf(length(f), 5);
    h = waitbar(0,'Calculating...');

    for i = 1:length(f)
        waitbar(i/length(f),h);
        film_title = f(i);
        film_title = char(film_title);
        s_length = strlength(film_title) - size_of_a_shingle + 1;
 
        for j = 1: s_length
            film_shingle = lower(char(film_title(j:(j + size_of_a_shingle - 1))));
            indexes = zeros(1, 5);

            for z = 1:5
                film_shingle = [film_shingle num2str(z)];
                indexes(z) = DJB31MA(film_shingle, 181); % numero primo alto
            end
            minhash_titles(i,:) = min([minhash_titles(i,:) ; indexes]);
        end
    end
    delete(h);
    
    similar_titles = zeros(1, length(f));
    for a1 = 2:4
            for title = 2:length(f)
                similar_titles(1, title) = 1 -( sum(minhash_titles(a1, :) == minhash_titles(1, :)) / 5);
            end
    end
%% 
function h= DJB31MA( chave, seed)
% implementação da hash function DJB31MA com base no algoritmo obtido
% no resumo 2014(PJF) que está em C
%
%  chave    array de caracteres com a chave
%  seed     semente que permite obter vários hash codes para a mesma chave
%
%  h        hashcode devolvido
len= length(chave);
chave= double(chave);
h= seed;
for i=1:len
    h = mod(31 * h + chave(i), 2^32 -1) ;
end
end

function hash=string2hash(str,type)

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

function array = gerar(N, min, max)
    symb = 'a':'z';
    array = cell(N,1);
    for i = 1:N
    comprimento = rand;
        if comprimento <= 0.4
            % usa o min
            pos = randi([1,length(symb)],1,min);
            word = symb(pos);
        else
            % usa o max
            pos = randi([1,length(symb)],1,max);
            word = symb(pos);
        end
        array{i} = word;
    end
end

function F = initialize(n)
    F = zeros(1, n);
end

function B = insert(B,element, num_hash_fuctions)

for i = 1:num_hash_fuctions
    key = [element num2str(i)];
    index = mod(string2hash(key), length(B))+1;
    B(index) = 1;
end

end

function res = member(B, element,k)

result_list = zeros(1,k);
for i = 1:k
    key = [element num2str(i)];
    index = mod(string2hash(key), length(B))+1;
    result_list(i) = B(index);
end
res = sum(result_list) == k;
end





























