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
BOC = zeros(0,6);

for i=1:N,
  weight_bucket = bucket(male,2,N,i);
  ccrop = bucket(weight_bucket,-6,10,1);
  bcrop = bucket(weight_bucket,-6,10,9);
  COC = [COC; ccrop];
  BOC = [BOC; bcrop];
end;

%scatter(COC(:,2),COC(:,6),[],'y','.');
%scatter(BOC(:,2),BOC(:,6),[],'c','.');

y = COC(:,6);
nz = (COC(:,2)/200).^(2.0/3);

X = [ones(size(nz))];% nz nz.^2 nz.^3 nz.^4 nz.^5 nz.^6];
for i=1:6,
  X = [X nz.^i];
end;

theta = zeros(6,1);

covar = X' * X;

theta1 = y' * X * inv(covar);
theta1 = theta1';

disp(rmse(X*theta1,y));

t = (20:200)';
u = (t / 200).^(2.0/3);
X = [ones(size(u))];% u u.^2 u.^3 u.^4 u.^5 u.^6];
for i=1:6,
  X = [X u.^i];
end;
f = X*theta1;
%plot(t,f,'g',"linewidth",3);

% Now fit 9th decile

y = BOC(:,6);
nz = (BOC(:,2)/200).^(2.0/3);

X = [ones(size(nz))];% nz nz.^2 nz.^3 nz.^4 nz.^5 nz.^6];
for i=1:6,
  X = [X nz.^i];
end;

theta0 = zeros(6,1);

covar = X' * X;

theta0 = y' * X * inv(covar);
theta0 = theta0';

disp(rmse(X*theta0,y));

t = (20:200)';
u = (t / 200).^(2.0/3);
X = [ones(size(u))];% u u.^2 u.^3 u.^4 u.^5 u.^6];
for i=1:6,
  X = [X u.^i];
end;
g = X*theta0;
%plot(t,g,'k',"linewidth",3);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Renormalize data
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = male(:,6);
nz = (male(:,2) / 200).^(2.0/3);

X = [ones(size(nz))];% nz nz.^2 nz.^3 nz.^4 nz.^5 nz.^6];
for i=1:6,
  X = [X nz.^i];
end;

top = X*theta1;
bottom = X*theta0;

renorm = (y - bottom) ./ (top - bottom);
male = [male renorm];

%scatter(male(:,2),male(:,7),[],'m','.');


COC = zeros(0,7);
BOC = zeros(0,7);
ccoded = zeros(0,8);

for i=1:N,
  weight_bucket = bucket(male,2,N,i);
  for j=1:10,
    perf_bucket = bucket(weight_bucket,6,10,j);
    perf_bucket = [perf_bucket j*ones(size(perf_bucket,1),1)];
    ccoded = [ccoded; perf_bucket];
  end;
  %   ccrop = bucket(weight_bucket,-6,10,1);
  %   bcrop = bucket(weight_bucket,-6,10,9);
  %   COC = [COC; ccrop];
  %   BOC = [BOC; bcrop];
end;

scatter(ccoded(:,2),ccoded(:,7),[],ccoded(:,8),'.');

%scatter(COC(:,2),COC(:,7),[],'y','.');
%scatter(BOC(:,2),BOC(:,7),[],'y','.');






