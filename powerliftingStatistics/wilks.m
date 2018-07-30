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

scatter(bw_m,total_m,[],'m','.');
hold on;

% Actual wilks formula

a=-216.0475144;
b=16.2606339;
c=-0.002388645;
d=-0.00113732;
e=7.01863E-06;
f=-1.291E-08;

theta = [a b c d e f]';
t = (20:200)';
m = length(t);
X = [ones(m,1) t t.^2 t.^3 t.^4 t.^5];
w = 0.70612*X*theta;
plot(t,w,'r',"linewidth",3);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m = size(male,1);

nz = bw_m / 180;

X = [ones(m,1) bw_m bw_m.^2 bw_m.^3 bw_m.^4 bw_m.^5];
realWilks500 = X*theta;
avgWilks = total_m' * realWilks500 / (realWilks500' * realWilks500);
disp(rmse(avgWilks*realWilks500,total_m));
fprintf('The average Wilks score is %f\n',(avgWilks*500));






