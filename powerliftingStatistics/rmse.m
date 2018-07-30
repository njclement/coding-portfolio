function E = rmse(pred, y);

m = length(y);

E = ( sum((pred - y).^2) / m )^0.5;
