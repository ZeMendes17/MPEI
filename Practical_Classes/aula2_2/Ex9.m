x\% classificações de os alunos num determinado curso

media = 14;
desvio = 2;
N = 1e5;

x = randn(1, N); % somar um valor a randn -> controlar a media
x = (x * desvio) + media;
histogram(x)
%% a)

class12a16 = 0;
for val=1:N
    if(x(val) > 12 && x(val) < 16)
        class12a16 = class12a16 + 1;
    end

end
prob12a16 = class12a16/N;
disp("Probabilidade de estar entre 12 e 16: "+prob12a16)

% ouuuuuu
cf = sum(x>12 & x<16);
p=cf/N;
% mean(x) --> 14.0000
%std(x) --> 2.0048

%% b)

class10a18 = 0;
for val=1:N
    if(x(val) > 10 && x(val) < 18)
        class10a18 = class10a18 + 1;
    end

end
prob10a18 = class10a18/N;
disp("Probabilidade de estar entre 10 e 18: "+prob10a18)

%% c)

passar = 0;
for val=1:N
    if(x(val) >= 10)
        passar = passar + 1;
    end
end

probPassar = passar/N;
disp("Probabilidade de passar: "+probPassar)

%% d)

pta=normcdf(16,14,2)-normcdf(12,14,2);
ptb=normcdf(18,14,2)-normcdf(10,14,2);
ptc=1 - normcdf(10,14,2);

disp(pta)
disp(ptb)
disp(ptc)