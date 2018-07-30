function selection = bucket(X, col_index, denom, part)

%  break X up into denom-many equal sized pieces, ordering by col_index, return
%  the part-th piece of X.
%  if column number is negative, the ordering will be decreasing



m = size(X,1);

x = (part-1) * m / denom;
y =  part * m / denom;

a = round(x) + 1;
b = round(y);


selection = sortrows(X,[col_index]);
selection = selection(a:b,:);


