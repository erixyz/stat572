% works in generating Poisson with lambda as large as 1000.
function X = expPois(lam,n)
X = zeros(1,n); % list of poisson rvs
laminv = 1/lam;

for i = 1:n
    y = exprnd(laminv,1,1000);
    X(i) = sum(cumsum(y) < 1 & cumsum(y) >= 0);
end
end