clc; clear all;


numIter = 20; numRev = 10;
thetaMin = 0; thetaMax = 2*pi;
radius = 200; deltaX = 20;

pXarray = zeros(1, numRev*numIter);
pYarray = zeros(1, numRev*numIter);
pZarray = zeros(1, numRev*numIter);

x = 0;
for i=1:numRev
    thetaArray = linspace(thetaMin, thetaMax, numIter);
    xtArray = linspace(x, x+deltaX, numIter);
    for j=1:numIter
        pXarray(numIter*(i-1) + j) = xtArray(j);
        pYarray(numIter*(i-1) + j) = radius*cos(thetaArray(j));
        pZarray(numIter*(i-1) + j) = radius*sin(thetaArray(j));
    end
    x = x+deltaX;
end

pXarray = 800 + pXarray';
pYarray = pYarray';
pZarray = 1005 + pZarray';