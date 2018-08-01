function a = rms(v)

w=v(:);
m = length(w);
a = ( sum(w.^2)/m )^0.5;
