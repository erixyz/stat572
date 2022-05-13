function [kdeDat] = kdeDataGen(data, n)
kdeDat = zeros(1,n);
sigHat = std(data);
iqr = quantile(data, 0.75) - quantile(data, 0.25);
iqr = iqr/1.34;

val = min(sigHat, iqr);
h = 1.06*val*n^(-1/5);

for i = 1:n
    u = unidrnd(length(data), 1, 1);
    kdeDat(i) = normrnd(data(u), h);
end
end