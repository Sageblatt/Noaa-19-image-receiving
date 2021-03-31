function delta = get_delta(array, first)
delta = 0;
len = 39;%38 for z3.txt
z1 = readmatrix("z1.txt");
for i = first : (first + len)
    delta = delta + int16(abs(z1(i - first+1)- array(i)));
end
end

