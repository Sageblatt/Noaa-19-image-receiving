[z,Fs] = audioread("signal.WAV");
%if the image is sliding while going down, adjust the 4160, Fs values in the 
%line 4 to smth like 41598, Fs*10
z = abs(hilbert(z));
z = resample(z, 4160, Fs);
n = length(z);
z = z(1:(n - rem(length(z), 2080)));
z = uint8(round((255 / max(z)) *z));
z = reshape(z, 2080, []);
z = transpose(z);
imwrite(z, "raw_image.png");

