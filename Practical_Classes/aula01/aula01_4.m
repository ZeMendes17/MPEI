Y = zeros(0, 20);
for x = 0:20
    Y(x + 1) = ProbSimulacao(0.5, 20, x, 10000);
end

stem(0:20, Y);