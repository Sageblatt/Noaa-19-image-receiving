NUMBER_OF_LINES = 500;
STARTING_LINE = 250;
%use raw_image to measure this values approximately
FIRST_LINE_CORRECTION = 1800;
%use final_image to define this value, corrects the top left corner
[z,Fs] = audioread("signal.WAV");
z = abs(hilbert(z));
z = resample(z, 4160, Fs);
n = length(z);

z = uint8(round((255 / max(z)) * z));
%z = reshape(z, 2080, []);
b = uint8(zeros(NUMBER_OF_LINES, 2080));
str = 1;
i = STARTING_LINE * 2080 + FIRST_LINE_CORRECTION;
[check, jump] = synch_check_first(z, i);
while(check == 0 && i < (n - 1))
    i = i + 1;
    [check, jump] = synch_check_first(z, i);
end
"First line found"
while(i < n && str < NUMBER_OF_LINES)
    jump = synch_check(z, i);
    %jump
    i = i + jump;
    if( (i + 2079) < n)
        b(str, 1:2080) = z(i : (i + 2079));
        %str *  100 / NUMBER_OF_LINES
    end
    str = str + 1;
    i = i + 2077;
end
%smoothdata(b, 2);
l1 = b(:, 1:1040);
l2 = b(:, 1041:2080);
b(:, 1041:2080) = l1;
b(:, 1:1040) = l2;
imwrite(b, "final_image.png");
