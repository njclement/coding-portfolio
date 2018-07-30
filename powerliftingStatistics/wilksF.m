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

scatter(bw_f,total_f,[],'m','.');
hold on;

%
a=594.31747775582;
b=-27.23842536447;
c=0.82112226871;
d=-0.00930733913;
e=4.731582E-05;
f=-9.054E-08;

theta = [a b c d e f]';
t = (20:200)';
m = length(t);
X = [ones(m,1) t t.^2 t.^3 t.^4 t.^5];
w = 0.70612*X*theta;
plot(t,w,'r',"linewidth",3);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m = size(female,1);

nz = bw_f / 200;

X = [ones(size(nz)) nz nz.^2 nz.^3 nz.^4 nz.^5];
realWilks500 = X*theta;
avgWilks = total_f' * realWilks500 / (realWilks500' * realWilks500);
disp(rmse(avgWilks*realWilks500,total_f));







