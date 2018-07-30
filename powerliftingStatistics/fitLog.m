clear;

load data.csv;

I_m = data(:,1) == 1.0;
I_f = data(:,1) == 0.0;



male = data(I_m,:);
female = data(I_f,:);


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

%scatter(bw_m,total_m,[],'m','.');
hold on;

m = size(male,1);
nz = bw_m / 200; % normalized data
nz = log(nz);

X = [ones(size(nz)) nz.^1 nz.^2 nz.^3 nz.^4 nz.^5];
y = total_m;
theta = zeros(6,1);

covar = X' * X;

theta = y' * X * inv(covar);
theta = theta';

disp(rmse(X*theta,y));

t = (20:200)';
u = t / 200;
u = log(u);
X = [ones(size(u)) u.^1 u.^2 u.^3 u.^4 u.^5];
y = X*theta;
plot(t,y,'k',"linewidth",3);



