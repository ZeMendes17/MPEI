function B = insert(B,element, num_hash_fuctions)

for i = 1:num_hash_fuctions
    key = [element num2str(i)];
    index = mod(string2hash(key), length(B))+1;
    B(index) = 1;
end

end

