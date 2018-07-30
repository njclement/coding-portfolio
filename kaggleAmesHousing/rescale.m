function [rescaled params] = rescale(X)

feats = size(X,2);
params = zeros(2,feats);
rescaled = zeros(size(X));

for j=1:feats,
  mu = mean(X(:,j));
  sig = std(X(:,j));
  params(1,j) = mu;
  params(2,j) = sig;
  rescaled(:,j) = ( X(:,j) - mu ) / sig ;
end;



