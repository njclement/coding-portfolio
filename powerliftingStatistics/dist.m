clear;

load data.csv;

I = data(:,1) == 1.0;

data = data(I,:);

bw = data(:,2);

sq = data(:,3);

bp = data(:,4);

dl = data(:,5);

total = sq + bp + dl;

data = [data total];

N = 20;
normed = zeros(0,1);
mus = zeros(20,1);
sigs = zeros(20,1);
ccode = (1:20)';

for i=1:N,
  bin = bucket(data,2,N,i);
  mus(i) = mean(bin(:,6));
  sigs(i) = std(bin(:,6));
  normed_i = norm(bin(:,6));
  normed = [normed;normed_i];
end;

scatter(mus,sigs,100,ccode,"filled");
pause;

normed = sort(normed);

normed = norm(normed);

y = (1:length(normed))' / length(normed);
y_shift = (0:length(normed)-1)' / length(normed);

plot(normed,y,'m',"linewidth",3);
hold on;

plot(normed,0.5 + 0.5*erf(normed / (2^0.5)),'b');

diff1 = y - (0.5 + 0.5*erf(normed / (2^0.5)));
diff0 = y_shift - (0.5 + 0.5*erf(normed / (2^0.5)));

Dn = max(max(diff1),max(diff0));
KS = sqrt(length(y)) * Dn;










