m = 1000;
m2 = 100000;
N = 1e5;
ns = 10:10:100;
res = zeros(1, length(ns));
i = 0;
res2 = zeros(1, length(ns));
for n = ns
    experiencias = randi(m, n, N);
    experiencias2 = randi(m2, n, N);
    diferentes = zeros(1, N);
    diferentes2 = zeros(1, N);
    for col = 1:N
        diferentes(col) = length(unique(experiencias(:,col))) == n;
        diferentes2(col) = length(unique(experiencias2(:,col))) == n;
    end
    i = i +1;
    res(i)=sum(diferentes)/N;
    res2(i)=sum(diferentes2)/N;
end

r1 = 1 - res;
r2 = 1 - res2;

subplot(1, 2, 1)
plot(ns, r1, 'ro-')

subplot(1, 2, 2)
plot(ns, r2, 'ro-')
