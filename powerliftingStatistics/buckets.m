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

scatter(bw_m,total_m,[],'m','.');
hold on;

m = length(bw_m);
N = 20;
COC = zeros(0,6);

for i=1:N,
  a = 1+round( ceil(m*(i-1)/N) );
  b = round( floor(m*i/N) );
  bucket = male(a:b,:);
  bucket = sortrows(bucket,[-6]);
  ccrop = bucket(1:size(bucket,1)/10,:);
  scatter(ccrop(:,2),ccrop(:,6),[],'y','.');
  COC = [COC; ccrop];
end;


y = COC(:,6);
nz = COC(:,2);

a=-216.0475144;
b=16.2606339;
c=-0.002388645;
d=-0.00113732;
e=7.01863E-06;
f=-1.291E-08;
theta = [a b c d e f]';

X = [ones(size(nz)) nz nz.^2 nz.^3 nz.^4 nz.^5];
realWilks500 = X*theta;

avgWilks = y' * realWilks500 / (realWilks500' * realWilks500);
disp(avgWilks);

t = (20:200)';
X = [ones(size(t)) t t.^2 t.^3 t.^4 t.^5];
w = avgWilks*X*theta;
plot(t,w,'r',"linewidth",3);
disp(rmse(avgWilks*realWilks500,y));
printf('The average top decile Wilks is %f\n',500*avgWilks);
