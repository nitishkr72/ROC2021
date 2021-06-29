% the returned value is theta in array is as follows
% [theta1_1, theta1_2, theta2_1, theta2_2, theta3_1, theta3_2]
% here s1_1 is sin(theta1) and c1_1 is cos(theta1)
% similarly for s1_2, s2_1, s2_2, c1_2.
% c2 is cos(theta2)
% phi = theta1 + theta2 + theta3z

function theta = IKin_3R(a1, a2, a3, px, py, phi)
    wx = px - a3*cos(phi); wy = py - a3*sin(phi);
    c2 = (wx*wx+wy*wy - a1*a1 - a2*a2)/(2*a1*a2);

    theta = zeros(1,6);
    disp(c2);
    if abs(c2)<=1 
        s2_1 = sqrt(1-c2*c2); s2_2 = -sqrt(1-c2*c2);    %this is sin(theta1) and sin(theta2)
        disp(s2_1*180/pi); disp(s2_2*180/pi);
        theta(3) = atan2(s2_1,c2);
        theta(4) = atan2(s2_2,c2);

        deno_1 = a1*a1 + a2*a2 + 2*a1*a2*cos(theta(3));
        deno_2 = a1*a1 + a2*a2 + 2*a1*a2*cos(theta(4));

        s1_1 = (wy*(a1+a2*cos(theta(3))) - a2*sin(theta(3))*wx)/deno_1;
        s1_2 = (wy*(a1+a2*cos(theta(4))) - a2*sin(theta(4))*wx)/deno_2;

        c1_1 = (wx*(a1+a2*cos(theta(3))) + a2*sin(theta(3))*wy)/deno_1;
        c1_2 = (wx*(a1+a2*cos(theta(4))) + a2*sin(theta(4))*wy)/deno_2;

        theta(1) = atan2(s1_1,c1_1);
        theta(2) = atan2(s1_2,c1_2);
        
        theta(5) = phi - (theta(1)+theta(3));
        theta(6) = phi - (theta(2)+theta(4));
    end
end