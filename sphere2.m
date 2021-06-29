clc; clear all;

radius = 200;
numRev = 20;
thetaMin = 0; thetaMax = 2*pi;              %angles in radians


pXarray = []; pYarray = []; pZarray = [];   %initializing empty arrays
Z = 0; deltaZ = 10; R = 0; deltaR = 10;
for i=1:numRev
    incR = linspace(R, deltaR, 100);
    incZ = linspace(Z, deltaZ, 100);
    thetaArray = linspace(thetaMin, thetaMax, 100);
    for j=1:100
        pXarray(end+1) = incZ(i);
        pYarray(end+1) = incR(j)*cos(thetaArray(j));
        pZarray(end+1) = incR(j)*sin(thetaArray(j));
    end
    R = R+deltaR;
    Z = Z+deltaZ;
end

pXarray = 800 + pXarray';
pYarray = pYarray';
pZarray = 1005 + pZarray';