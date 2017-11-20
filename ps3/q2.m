syms gamma beta phi alpha mu F D
x = sym('x',[1 4])

M = [gamma -beta*cos(phi); -beta*cos(phi) alpha];
C = [mu beta*x(4)^2*sin(phi); 0 0]
G = [-F;-D*sin(phi)]
latex(M)
latex(C)
latex(G)

xdot34 = simplify(inv(M)*[-mu*x(3)-beta*x(4)^2*sin(phi)+F; D*sin(phi)])

xdot = [x(3);x(4);xdot34] 
latex (xdot) 


A =[0 0 1 0;
    0 0 0 1; 
    0 1 -3 0;
    0 2 -3 0]; 
B =[0;0;1;1];

R=10;
Q =[1 0 0 0;
    0 5 0 0;
    0 0 1 0;
    0 0 0 5]; 

[K,S,e] = lqr(A,B,Q,R);
K

[t,y1] = ode45(@(t,y) A*y-B*K*y, [0:.01:30], [0;.1;0;0]);
[t,y2] = ode45(@(t,y) A*y-B*K*y, [0:.01:30], [0;.5;0;0]);
[t,y3] = ode45(@(t,y) A*y-B*K*y, [0:.01:30], [0;1.0886;0;0]);
[t,y4] = ode45(@(t,y) A*y-B*K*y, [0:.01:30], [0;1.1;0;0]);

%figure(1)
%plot(t,y1)
%title("plot of system response for [0 .1 0 0]");
%legend("x1","x2","x3","x4")
%xlabel("time (s)")
%saveas(gcf,'q2c1.jpg');

%figure(2)
%plot(t,y2)
%title("plot of system response for [0 .5 0 0]");
%legend("x1","x2","x3","x4") xlabel("time (s)") saveas(gcf,'q2c2.jpg');

%figure(3)
%plot(t,y3)
%title("plot of system response for [0 1.0886 0 0]");
%legend("x1","x2","x3","x4")
%xlabel("time (s)")
%saveas(gcf,'q2c3.jpg');

%figure(4)
%plot(t,y4)
%legend("x1","x2","x3","x4")
%title("plot of system response for [0 1.1 0 0]");
%xlabel("time (s)")
%saveas(gcf,'q2c4.jpg');

xdot2 = simplify(subs(xdot, [F, mu,gamma,alpha,beta,D],[0,3,2,1,1,1]))

[t,y12] = ode45(@(t,y)odefunc(t,y,K), [0:.01:30], [0;.1;0;0]);
[t,y22] = ode45(@(t,y)odefunc(t,y,K), [0:.01:30], [0;.5;0;0]);
[t,y32] = ode45(@(t,y)odefunc(t,y,K), [0:.01:30], [0;1.0886;0;0]);
%[t,y42] = ode45(@(t,y)odefunc(t,y,K), [0:.01:30], [0;1.1;0;0]); 

%figure(1)
%plot(t,y12)
%title("plot of system response for [0 .1 0 0]");
%legend("x1","x2","x3","x4")
%xlabel("time (s)")
%saveas(gcf,'q2d1.jpg');

%figure(2)
%plot(t,y22)
%title("plot of system response for [0 .5 0 0]");
%legend("x1","x2","x3","x4") 
%xlabel("time (s)") 
%saveas(gcf,'q2d2.jpg');

figure(3)
plot(t,y32)
title("plot of system response for [0 1.0886 0 0]");
legend("x1","x2","x3","x4")
xlabel("time (s)")
saveas(gcf,'q2d3.jpg');

%figure(4)
%plot(t,y42)
%legend("x1","x2","x3","x4")
%title("plot of system response for [0 1.1 0 0]");
%xlabel("time (s)")
%saveas(gcf,'q2d4.jpg');


function dydt = odefunc(t,x,K)
dydt(1) = x(3);
dydt(2) = x(4);
mu = 3;
beta = 1;
alpha =1;
gamma = 2;
D =1;

M = [gamma -beta*cos(x(2)); -beta*cos(x(2)) alpha];
F = -K*x;
dydt(3:4) = inv(M)*[-mu*x(3)-beta*x(4)^2*sin(x(2))+F;
                        D*sin(x(2))];
dydt=dydt';

%dydt = [                                                              x3 ;
                                                                      %x4 ;
            %-(sin(phi)*x4^2 + 3*x3 - cos(phi)*sin(phi))/(cos(phi)^2 - 2) ;
 %-(cos(phi)*sin(phi)*x4^2 - 2*sin(phi) + 3*x3*cos(phi))/(cos(phi)^2 - 2)];

end
