% FYI: remove the extra value if there are no other values to be passed in
% 3 instances.
function [zStab, tStab, pStab, zCov, tCov, pCov] = CILoops(reps, data, param)

% initializing coverage values
zCov = 0; tCov = 0; pCov = 0;

% empty lists for width of CI
zRange = zeros(1,reps); tRange = zeros(1,reps); pRange = zeros(1,reps);

% oh my goodness
rng("shuffle")
for i = 1:reps
    
    resamp1 = randsample(data, length(data),true);
    thetahat1 = param(resamp1);

    [zInt, tInt, pInt] = allCI(data, param);
    zRange(i) = zInt(2) - zInt(1);
    tRange(i) = tInt(2) - tInt(1);
    pRange(i) = pInt(2) - pInt(1);

    if (thetahat1 > zInt(1) && thetahat1 < zInt(2))
        zCov = zCov + 1;
    end

    if (thetahat1 > tInt(1) && thetahat1 < tInt(2))
        tCov = tCov + 1;
    end

    if (thetahat1 > pInt(1) && thetahat1 < pInt(2))
        pCov = pCov + 1;
    end
end

zStab = std(zRange);
tStab = std(tRange);
pStab = std(pRange);

zCov = zCov/reps;
tCov = tCov/reps;
pCov = pCov/reps;
end