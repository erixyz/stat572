function bootProb = bP(data)
    n = length(data);
    bootProb = sum(data >= 9)/n;
end