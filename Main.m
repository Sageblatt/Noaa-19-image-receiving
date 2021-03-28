[z,Fs] = audioread("signal.WAV");
%z = resample(y, 41598, Fs*10);
%z = medfilt1(z, 2);
z = abs(hilbert(z));
%z = smooth(z, 1);
%z = resample(z, 9320, Fs, 2);
%z = amdemod(z, 2400, Fs);
%z = smooth(z, 4);
%z = medfilt1(z, 5);
%z = demod(z, 2400, Fs, 'amssb');
%z = abs(hilbert(z));
%z = resample(z, 4160, Fs);
%z = abs(hilbert(z));
%z = demod(z, 2079, 4160, 'am');
%z = amdemod(z, 1500, 4160);
z = resample(z, 41598, Fs*10);
%z = abs(z);
%plot(z);

%z = abs(z);
%plot(z);
%plot(z)
%for i = 1:length(z)
   % if z(i, 1) < 0.1
  %      z(i, 1) = z(i, 1) + 0.5;
 %   end
%end
n = length(z);
z = z(((150 * 2080) + 312):(n - 2080 * 600), 1);
n = length(z);
z = z(1:(n - rem(length(z), 2080)));
z = uint8(round((255 / max(z)) *z));
z = reshape(z, 2080, []);
z = transpose(z);
%z = mat2gray(z);
%m = gray(1);
%z = abs(z);
%z = z * (255/0.72);
%z = z + 0.4;
%plot(z);
%z = uint8(z);
imwrite(z, "out.png");
%open("out.png");
%plot(z);
