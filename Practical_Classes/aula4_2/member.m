function res = member(B, element,k)

result_list = zeros(1,k);
for i = 1:k
    key = [element num2str(i)];
    index = mod(string2hash(key), length(B))+1;
    result_list(i) = B(index);
end
res = sum(result_list) == k;
end

