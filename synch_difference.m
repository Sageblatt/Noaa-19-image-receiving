function difference = synch_difference(y, start, len)
difference = 0;
for i = 1:(len - 1)
    difference = difference + int16(abs(y(start + i) - y(start + i - 1)));
end

