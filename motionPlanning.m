clc; clear all; clf;

a1 = 3; a2 = 2; a3 = 1;
phi = 60*pi/180;
n = 50;    %number of steps


% containers###############################################################
% this will contain the joints coordinates
aXArray = zeros(n, 1); aYArray = zeros(n, 1);
bXArray = zeros(n, 1); bYArray = zeros(n, 1);

% this will contain end point value
pXArray = zeros(n, 1); pYArray = zeros(n, 1);

% saving theta 1, 2 and 3
theta1Arr=zeros(n,1); theta2Arr=zeros(n,1); theta3Arr=zeros(n,1);

% this will contain simulation time array
STimeArray = linspace(0,1.5,n)';     
% end of containers########################################################

% parametric equation of circle############################################

r = 4;
param_theta = linspace(0,2*pi,n);

for i=1:n
    pXArray(i) = r*cos(param_theta(i));
    pYArray(i) = r*sin(param_theta(i));
end

% #########################################################################


% intializing theta with intial angle value
theta = IKin_3R(a1,a2,a3,pXArray(1),pYArray(2),phi);
t1P = theta(1);     %theta1 previous
t2P = theta(3);     %theta2 previous
t3P = theta(5);     %theta3 previous

for i=1:n
    disp(i)
    theta = IKin_3R(a1,a2,a3,pXArray(i),pYArray(i),phi);
    if(((theta(1)-t1P)^2+(theta(3)-t2P)^2+(theta(5)-t3P)^2) < ((theta(2)-t1P)^2+(theta(4)-t2P)^2+(theta(6)-t3P)^2))
        t1P = theta(1); t2P = theta(3); t3P = theta(5);
    else
        t1P = theta(2); t2P = theta(4); t3P = theta(6);
    end
    
    % this will contain the angle theta1, theta2, theta3
    theta1Arr(i)=t1P*180/pi; theta2Arr(i)=t2P*180/pi; theta3Arr(i)=t3P*180/pi;
    
    % this will contain the joint coordinates..
    point = FKin_3R([t1P,t2P,t3P],a1,a2,a3);
    aXArray(i) = point(1); aYArray(i) = point(2);
    bXArray(i) = point(3); bYArray(i) = point(4);
end

% animation


x = 8;

for i=1:n
    p1 = zeros(2,3);
    p1(1)=aXArray(i); p1(2)=aYArray(i);
    p1(3)=bXArray(i); p1(4)=bYArray(i);
    p1(5)=pXArray(i); p1(6)=pYArray(i);
    
    plot([-x,x],[0,0],'r',[0,0],[-x,x],'b');
    hold on;
    plotGraph(p1, 'r');
    plot(p1(5),p1(6),'k');
    hold off;
    pause(0.05);
end









