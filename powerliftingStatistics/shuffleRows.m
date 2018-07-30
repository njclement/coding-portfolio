function shuffled = shuffleRows(mat)

N_rows = size(mat,1);

[S I] = sort(rand(N_rows,1));

shuffled = mat(I,:);
