NUMBER_OF_LINES = 400;
STARTING_LINE = 200;
%use raw_image to measure this values approximately
FIRST_LINE_CORRECTION = 317;
%use final_image to define this value, corrects the top left corner
[z,Fs] = audioread("signal.WAV");
z = abs(hilbert(z));
z = resample(z, 41598, Fs*10);
n = length(z);

z = uint8(round((255 / max(z)) * z));
%z = reshape(z, 2080, []);
b = uint8(zeros(NUMBER_OF_LINES + 1, 2080));
str = 1;
i = STARTING_LINE * 2080 + FIRST_LINE_CORRECTION;
while(i < n && str < NUMBER_OF_LINES)
    while(synchcheck(z,i) == 0)
        i = i + 1;
    end
    if( (i + 2079) < n)
        b(str, 1:2080) = z(i : (i + 2079));
        %i *  100 / n
    end
    str = str + 1;
    i = i + 2080;
end
imwrite(b, "final_image.png");
