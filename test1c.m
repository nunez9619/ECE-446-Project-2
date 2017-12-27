%Part C Window Functions
w_box_car = Window(7,1,0,0);
w_Hanning = Window(7,.5,-.5,0);
w_Hamming = Window(7,.54,-.46,0);
w_Blackman = Window(7,.42,-.5,.08);
figure
m = 7;
M = -m:m;

plot(M,w_box_car)
hold on
plot(M,w_Hanning)
plot(M,w_Hamming)
plot(M,w_Blackman)
axis([-m-1 m+1 0 1.2])
title('Window Functions')
xlabel('m')
ylabel('Magnitude')
legend('Box Car','Hanning','Hamming','Blackman')
 
%Part C Frequency Responses
ws = (pi/4 + pi/2.5)/2;
Hii = [zeros(1,128-round(128/(pi*ws))) ones(1,81) zeros(1,87)];  % Ideal H
hii = fftshift(ifft(Hii));                                       % Ideal h
 
% Zero-padding each of the windows:
z_box_car = [zeros(1,121) w_box_car zeros(1,120)];
z_Hanning = [zeros(1,121) w_Hanning zeros(1,120)];
z_Hamming = [zeros(1,121) w_Hamming zeros(1,120)];
z_Blackman = [zeros(1,121) w_Blackman zeros(1,120)];
 
% Plotting freq responses
H_box_car = hii.*z_box_car;
H_box_car = abs(fft(H_box_car));
 
H_Hanning = hii.*z_Hanning;
H_Hanning = abs(fft(H_Hanning));
 
H_Hamming = hii.*z_Hamming;
H_Hamming = abs(fft(H_Hamming));
 
H_Blackman = hii.*z_Blackman;
H_Blackman = abs(fft(H_Blackman));
 
hFIR = FIR(pi/4,pi/2.5,6,9,.098*pi);
hFIR = [zeros(1,121) hFIR' zeros(1,120)];
HFIR = fftshift(abs(fft(real(hFIR))));
 
w = -pi:(2*pi)/(256-1):pi;
 
figure
plot(w,Hii)
hold on
plot(w,H_box_car)
plot(w,H_Hanning)
plot(w,H_Hamming)
plot(w,H_Blackman)
plot(w,HFIR)
axis([-pi-.5 pi+.5 0 1.2])
 
title('Frequency Response H(w)')
xlabel('Angular Frequency w')
ylabel('Magnitude |H(w)|')
legend('Ideal','Box Car','Hanning','Hamming','Blackman','hFIR')
