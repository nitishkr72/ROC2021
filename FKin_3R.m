% output will contain the coordiantes of three joints A, B and C as
% (Ax, Ay), (Bx, By), (Cx, Cy) in a (2X3) array
%   [  Ax  Bx  Cx  ]
%   [  Ay  By  Cy  ] 

function point3J = FKin_3R(theta, a1, a2, a3)
    theta1 = theta(1); theta2 = theta(2); theta3 = theta(3);
    
    point3J = zeros(2,3);
    
    point3J(1) = a1*cos(theta1);   % Ax
    point3J(2) = a1*sin(theta1);   % Ay
    
    point3J(3) = point3J(1) + a2*cos(theta1+theta2);   % Bx
    point3J(4) = point3J(2) + a2*sin(theta1+theta2);   % By
    
    point3J(5) = point3J(3) + a3*cos(theta1+theta2+theta3);   % Cx
    point3J(6) = point3J(4) + a3*sin(theta1+theta2+theta3);   % Cy
end