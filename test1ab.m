%Part A
h0=FIR(pi/4,pi/2.5,6,9,0);
h0 = real(h0');
H0 = abs(fft([zeros(1,121) h0 zeros(1,120)]));
%Part B
h1 = FIR(pi/4,pi/2.5,6,9,.025*pi);
h1 = real(h1');
H1 = abs(fft([zeros(1,121) h1 zeros(1,120)]));

h2 = FIR(pi/4,pi/2.5,6,9,.05*pi);
h2 = real(h2');
H2 = abs(fft([zeros(1,121) h2 zeros(1,120)]));

h3 = FIR(pi/4,pi/2.5,6,9,.075*pi);
h3 = real(h3');
H3 = abs(fft([zeros(1,121) h3 zeros(1,120)]));

figure
ww = -pi:((2.*pi)/(256-1)):pi;
plot(ww,fftshift(H0)) %Part A
hold on 
plot(ww,fftshift(H1)) %Part B
plot(ww,fftshift(H2))
plot(ww,fftshift(H3))
title('FIR Frequency Responses')
xlabel('w')
ylabel('Magnitude |H(w)|')


