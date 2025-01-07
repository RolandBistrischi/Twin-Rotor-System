function [bestJ, bestReg] = findBestRegulators(n, H, RegFrac, numBest, method)
% Optimized function to find the best regulators based on performance indices

    % Preallocare pentru eficiență
    J = arrayfun(@(i) objectiveFunctionforMultiPID(RegFrac(i).regulator, H, method), 1:n);

    % Sortăm J-urile și păstrăm indicii
    [sortedJ, idx] = sort(J); 

    % Selectăm cele mai bune valori și regulatoare
    bestJ = sortedJ(1:numBest); 
    bestReg = RegFrac(idx(1:numBest)); 
end
