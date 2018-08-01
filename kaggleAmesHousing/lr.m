clear

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Best lambda with the first set of features is 300
lambda = 300.0;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load better.csv

y = better(:,2);
m=length(y);
y_log = log(y);
X = [ones(m, 1) better(:,3:end)];


covar = X'*X;
theta = ( y_log' * X * pinv(covar) )';
pred = X*theta;

printf('Error is %f and size of theta is %f.\n',rms(pred-y_log),rms(theta));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mask = diag(ones(1,length(theta)));
covar = X'*X + lambda/m*mask;
theta = ( y_log' * X * inv(covar) )';
pred = X*theta;

printf('Error is %f and size of theta is %f.\n',rms(pred-y_log),rms(theta));


load betterTest.csv

ID_test = betterTest(:,1);
X_test = [ones(length(ID_test),1) betterTest(:,3:end)];

pred_test = exp(X_test*theta);
csvwrite("submissionBigReg.csv", [ID_test pred_test]);
