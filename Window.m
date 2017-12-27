function h = Window(M,a,b,c) 
m = -M:M;
h = a - b.*cos(pi.*m./(M+1)) + c.*cos(2.*pi./(M+1));
end