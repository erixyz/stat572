% problem 1
% part a

% apply the function to generate gamma-possion rv
alpha = 1; beta = 5;
data = gampois(alpha, beta, 1000);

% generating true density based on generated data
i = 0:1:max(data);
pmf = gamma(i+beta).*(alpha.^i)./(gamma(beta)*((1+alpha).^(i+beta)).*factorial(i));

% plotting
figure(1)
h = histogram(data, max(i+1), "Normalization","probability");
hold on

plot(i,pmf)
hold off

% part b
histHeight = h.Values;

indivMSE = zeros(1,10);
for i = 1:10
    indivMSE(i) = immse(pmf(i),histHeight(i));
end

indivMSE
wholeMSE = immse(pmf(1:10), histHeight(1:10))

% plot indiv MSE
figure(2)
x = 0:length(indivMSE)-1;
plot(x,indivMSE)