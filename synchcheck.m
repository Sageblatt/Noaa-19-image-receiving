function output = synchcheck(y, start)
delta = 0;
z1 = readmatrix("z1.txt");
for i = start : (start + 39)
    delta = delta + int64(abs(z1(i - start+1)- y(i)));
end
if(delta < 2000)
    output=1;
else
    output=0;
end

