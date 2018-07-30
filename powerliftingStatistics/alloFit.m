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

y = log(total_m);
X = log(bw_m);

scatter(X,y,[],'m','.');
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
%plot(log(t),log(w),'r',"linewidth",3);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m = size(male,1);

y = log(total_m);
X = log(bw_m);
nz = X;

X = [ones(size(nz)) nz];

theta = zeros(2,1);

covar = X' * X;

theta = y' * X * inv(covar);
theta = theta';

disp(rmse(X*theta,y));
disp(rmse(exp(X*theta),total_m));

t = (20:200)';
u = log(t);
X = [ones(size(u)) u];
y = X*theta;
plot(u,y,'g',"linewidth",3);

pause;
hold off;

scatter(bw_m,total_m,[],'m','.');
hold on;
plot(t,exp(y),'g',"linewidth",3);




