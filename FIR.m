function h = FIR(wp,ws,Np,Ns,delta)
hwpassband = ones(1,Np);

hwstopband1 = zeros(1,floor(Ns/2));
hwstopband2 = zeros(1,ceil(Ns/2));

hii = [hwstopband1 hwpassband hwstopband2];
hii = hii';

n = -floor((Np+Ns)/2):floor((Np+Ns)/2);

w1 = linspace(-pi,-ws-delta,floor(Ns/2));
w2 = linspace(-wp+delta,wp-delta,Np);
w3 = linspace(ws+delta, pi, floor(Ns/2)+1);
w = [w1 w2 w3];

fun = exp(-1i*w'*n);
h = linsolve(fun,hii);
