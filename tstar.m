function stat = tstar(d1, d2)
r = corrcoef(d1,d2);
r = r(1,2); n = length(d1);

stat = r*sqrt(n-2)/sqrt(1-r^2);
end