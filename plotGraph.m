% here p1 is a 2X3 dimensional array containing the joints
% corrdinates
% point = [[Ax Bx Cx]
%          [Ay By Cy]]
% c is the color of the graph

function plotGraph(p1, c)
    plot([0,p1(1)],[0,p1(2)],c,[p1(1),p1(3)],[p1(2),p1(4)],c,[p1(3),p1(5)],[p1(4),p1(6)],c);
end