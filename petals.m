clc; clear all;

numPts = 300;
numIter = 100;

pXarray = zeros(1, 1200); pYarray = zeros(1, 1200); pZarray = zeros(1, 1200);

thetaDeg = 40; theta = thetaDeg*pi/180;
lenBud = 250;

%for creating horizontal petals
HpXarray = zeros(1,numPts);
HpYarray = zeros(1,numPts);
HpZarray = zeros(1,numPts);

HfinalYPos = lenBud*cos(theta); HfinalZPos = -lenBud*sin(theta);
HinitYPos = 0; HinitZPos = 0;

%% for creating below horizontal line
tArray = linspace(0,1,numIter);
for i=1:numIter
    HpYarray(i) = tArray(i)*HfinalYPos;
    HpZarray(i) = tArray(i)*HfinalZPos;
end

%%for creating semicircle
radius = HfinalZPos;
thetaMin = -pi/2; thetaMax = pi/2;
centerY = HfinalYPos;
thetaArray = linspace(thetaMin, thetaMax, numIter);
for i=1:numIter
    HpYarray(numIter+i) = centerY - radius*cos(thetaArray(i));
    HpZarray(numIter+i) = -radius*sin(thetaArray(i));
end

%%for creating above Horizontal line
offset = 200;
for i=1:numIter
    HpYarray(offset+i) = HpYarray(numIter-i+1);
    HpZarray(offset+i) = -HpZarray(numIter-i+1);
end


%for creting vertical petal
VpXarray = zeros(1,numPts);
VpYarray = zeros(1,numPts);
VpZarray = zeros(1,numPts);

VfinalYPos = lenBud*sin(theta);
VfinalZPos = lenBud*cos(theta);
VinitYPos = 0; VinitZPos = 0;

%%for creating right vertical line
for i=1:numIter
    VpYarray(i) = tArray(i)*VfinalYPos;
    VpZarray(i) = tArray(i)*VfinalZPos;
end

%%for creating vertical semicircle
thetaMin = 0; thetaMax = pi;
centerZ = VfinalZPos;
thetaArray = linspace(thetaMin, thetaMax, numIter);
radius = VfinalYPos;

for i=1:numIter
    VpYarray(numIter + i) = radius*cos(thetaArray(i));
    VpZarray(numIter + i) = centerZ + radius*sin(thetaArray(i));
end

%%for creating left vertical line
offset = 200;

for i =1:numIter
    VpYarray(offset+i) = -VpYarray(numIter - i + 1);
    VpZarray(offset+i) = VpZarray(numIter - i + 1);
end

%% % % final array % % 

for i=1:300
    pXarray(i) = 800 + HpXarray(i);
    pYarray(i) = HpYarray(i);
    pZarray(i) = 1005 + HpZarray(i);
end

for i=1:300
    pXarray(300 + i) = 800 + VpXarray(i);
    pYarray(300 + i) = VpYarray(i);
    pZarray(300 + i) = 1005 + VpZarray(i);
end

for i=1:300
    pXarray(600 + i) = 800 + HpXarray(i);
    pYarray(600 + i) = -HpYarray(i);
    pZarray(600 + i) = 1005 + HpZarray(i);
end

for i=1:300
    pXarray(900 + i) = 800 + VpXarray(i);
    pYarray(900 + i) = VpYarray(i);
    pZarray(900 + i) = 1005 - VpZarray(i);
end

pXarray = pXarray'; pYarray = pYarray'; pZarray = pZarray';

%% debugger
dbugVX = 800 + VpXarray';
dBugVY = VpYarray';
dBugVZ = 1005 + VpZarray';


