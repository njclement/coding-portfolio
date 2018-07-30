clear;

load data.csv;

I_m = data(:,1) == 1.0;
I_f = data(:,1) == 0.0;



male = data(I_m,:);
female = data(I_f,:);

[S I] = sort(male(:,2));
male = male(I,:);

bw_m = male(:,2);
bw_f = female(:,2);

sq_m = male(:,3);
sq_f = female(:,3);

bp_m = male(:,4);
bp_f = female(:,4);

dl_m = male(:,5);
dl_f = female(:,5);

total_m = sq_m + bp_m + dl_m;
total_f = sq_f + bp_f + dl_f;

male = [male total_m];
female = [female total_f];

%scatter(bw_m,total_m,[],'m','.');
hold on;

N = 40;
bweights = zeros(N,10);
tots = zeros(size(bweights));

for i=1:N,
  weight_bucket = bucket(male,2,N,i);
  for j=1:10,
    performance_bucket = bucket(weight_bucket,-6,10,j);
    bweights(i,j) = mean(weight_bucket(:,2));
    tots(i,j) = mean(performance_bucket(:,6));
  end;
end;

normed_tots = tots ./ tots(:,1);

color_code = ones(N,1)*(1:10);

scatter(bweights(:),normed_tots(:),100,color_code(:), "filled");

