clc; clear all;

N = 4


 xs = [0,1]; 
 ys = [0,0];
 xk = [0, 1/3,.5,(2/3),1];
 yk = [0, 0,sin(pi/3)*(1/3),0,0 ]; 
 temp = [xs',ys'];     
 kochs=zeros(4^N+1,2);  

for ii = 1:N 
    numseg = 4^(ii-1);
    length =(1/3)^(ii-1);
    b = 0;           
        for jj = 1:numseg 
             x =[temp(jj,1),temp(jj+1,1)];
             y =[temp(jj,2),temp(jj+1,2)];
             t =atan2(y(2)-y(1),x(2)-x(1));
             R = [cos(t),-sin(t);sin(t) cos(t)] ; 
				    	
						   
             for i = 1:5  
               coord(i,:) = length *R*[xk(i);yk(i)];
             end
            coord(:,1) = coord(:,1) + x(1); 
            coord(:,2) = coord(:,2) + y(1);
            r2=5;
         if jj ~=numseg
             coord(5,:) = [];  
			     
             r2 = 4;
         end  
           a = b+1;   
           b = a+r2-1; 
         kochs(a:b,:)= [coord];
        end
        temp(1:(4^ii+1),:) = kochs(1:(4^ii+1),:);
end

        
 plot(temp(:,1),temp(:,2),'k')

%KUKAKR5
 temp = temp*500;   
 temp(:,2) = 1005 + temp(:,2);
 axis equal

