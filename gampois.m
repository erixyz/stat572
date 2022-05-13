% generate gamma-poisson random variables
function gp = gampois(alpha, beta, n)

% initializing
gp = zeros(1,n);
j = 1;

while j <= n
    % initializing
    bool = 1; u = rand; i = 0;

    % p when i = 0
    p = 1/(1+alpha)^beta;
    F = p;

    % recursive process
    while bool
        if u <= F
            gp(j) = i;
            bool = 0;
            j = j + 1;
        else
            p = p*alpha*(i+beta)/((alpha+1)*(i+1));
            i = i + 1;
            F = F + p;
        end
    end
end
end