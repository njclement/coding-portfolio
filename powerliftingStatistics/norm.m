function renormalized = norm(v);

mu = mean(v);
sig = std(v);

renormalized = ( v - mu ) / sig;
