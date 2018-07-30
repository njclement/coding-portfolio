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

m = length(bw_m);
N = 20;
COC = zeros(0,6);

for i=1:N,
  wbucket = bucket(male,2,N,i);
  ccrop = bucket(wbucket,-6,10,1);
  COC = [COC; ccrop];
end;

%scatter(COC(:,2),COC(:,6),[],'y','.');

y = COC(:,6);
nz = COC(:,2)/200;

X = [ones(size(nz)) nz nz.^2 nz.^3 nz.^4 nz.^5];

theta = zeros(6,1);

covar = X' * X;

theta = y' * X * inv(covar);
theta = theta';

disp(rmse(X*theta,y));

t = (20:200)';
u = t / 200;
X = [ones(size(u)) u u.^2 u.^3 u.^4 u.^5];
f = X*theta;
plot(t,f,'g',"linewidth",3);


