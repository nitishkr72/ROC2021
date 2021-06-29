clc; clear all;

%% robot offset
    rXoffset = 800;
    rYoffset = 0;
    rZoffset = 1005;
%%

numLoop = 3;
yOffset = 25; zOffset = 50;
sideLen = 100;
sideY = sideLen; sideZ = sideLen;

pArr = [zeros(1, 25); zeros(1, 25); zeros(1, 25);]';

for i=1:numLoop
    j = (i-1)*8+1;
    
 %  x-axis--------------  y-axis------------------------------    z-axis------------------------------ 
    pArr(j)   = rXoffset; pArr(yOffset+j)   = rYoffset;           pArr(zOffset+j)   = rZoffset; 
    pArr(j+1) = rXoffset; pArr(yOffset+j+1) = rYoffset + sideY;   pArr(zOffset+j+1) = rZoffset;
    pArr(j+2) = rXoffset; pArr(yOffset+j+2) = rYoffset + sideY;   pArr(zOffset+j+2) = rZoffset + sideZ;
    pArr(j+3) = rXoffset; pArr(yOffset+j+3) = rYoffset;           pArr(zOffset+j+3) = rZoffset + sideZ;

    pArr(j+4) = rXoffset; pArr(yOffset+j+4) = rYoffset;           pArr(zOffset+j+4) = rZoffset;
    pArr(j+5) = rXoffset; pArr(yOffset+j+5) = rYoffset + sideY/2; pArr(zOffset+j+5) = rZoffset;
    pArr(j+6) = rXoffset; pArr(yOffset+j+6) = rYoffset + sideY/2; pArr(zOffset+j+6) = rZoffset + sideZ;
    pArr(j+7) = rXoffset; pArr(yOffset+j+7) = rYoffset;           pArr(zOffset+j+7) = rZoffset + sideZ;

    sideY = sideY/2; sideZ = sideZ/2;
end

