function [zInt, tInt, pInt] = allCI(data, param)

thetahat = param(data);
alpha = 0.05;
B = 200;
C = 25;

% first bootstrap
[bootreps, bootsam] = bootstrp(B, param, data);

% Standard CI
zlo = norminv(alpha/2);
zhi = norminv(1-alpha/2);
se = std(bootreps);

zLowCI = thetahat + zlo*se;
zUpCI = thetahat + zhi*se;
zInt = [zLowCI zUpCI];

% Bootstrap-T CI
sehats = zeros(1,B);

for i = 1:B
    xstar = data(bootsam(:,i));
    sehats(i) = std(bootstrp(C, param, xstar));
end

zvals = (bootreps - thetahat)./sehats;

k = B*alpha/2;
zvals = sort(zvals);
tlo = zvals(k);
thi = zvals(B-k);

tLowCI = thetahat + tlo*se;
tUpCI = thetahat + thi*se;
tInt = [tLowCI tUpCI];

% Percentile Bootstrap CI
sbval = sort(bootreps);
pLowCI = sbval(k);
pUpCI = sbval(B-k);
pInt = [pLowCI pUpCI];

end