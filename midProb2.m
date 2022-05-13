% Midterm -- Problem 2
% part A

% initializing param.
data = [7 11 7 3 8 8 10 6 8 5 6 7 9 14 6 2 13 5 8 3 10 7 9 5];
n = length(data);
B = 1000;
C = 30;
thetahat = sum(data >= 9)/n
alpha = 0.05;
k = B*alpha/2; % CI param

% bootstrap.
[bootreps, bootsam] = bootstrp(B, @bP, data);
bootreps = bootreps'; % transpose
se = std(bootreps); % standard error

% bootstrapping for Boot-T CI
sehats = zeros(1,B);
for i = 1:B
    xstar = data(bootsam(:,i));
    sehats(i) = std(bootstrp(C,@bP,xstar));
end

% developing Boot-T CI
zvals = (bootreps - thetahat)./sehats;
zvals = sort(zvals);
tlo = zvals(k);
thi = zvals(B-k);
tLower = thetahat+tlo*se;
tUpper = thetahat+thi*se;

tCI = [tLower tUpper]

% percentile Boot CI
sbval = sort(bootreps);
pLowCI = sbval(k);
pUpCI = sbval(B-k);

pCI = [pLowCI pUpCI]

% part B
% histogram
histogram(bootreps, 15, "normalization", "probability")

% generating coverage and stability
[zStab, tStab, pStab, zCov, tCov, pCov] = CILoops(100, data, @bP)