x=[-1 0 1 0 -1];
y=[1 1 0 -1 -1];
z=ones(1,5);

points = [x;y;z]
figure
A = [1 0 4; 0 1 0; 0 0 1];
B = [.866 .5 0; -.5 .866 0;0 0 1];                                              

a= A*points
pa = subplot(2,3,1) 
hold on
axis equal
fill(points(1,:),points(2,:),'b')
fill(a(1,:),a(2,:),'r')
title("a")

b = A*B*points
pb =subplot(2,3,2) 
hold on
fill(points(1,:),points(2,:),'b')
fill(b(1,:),b(2,:),'r')
title("b")

c = B*A*points
pc = subplot(2,3,3) 
hold on
fill(points(1,:),points(2,:),'b')
fill(c(1,:),c(2,:),'r')
title("c")

d = B*points
pd = subplot(2,3,4) 
hold on
fill(points(1,:),points(2,:),'b')
fill(d(1,:),d(2,:),'r')
title("d")

e = A*B*points
pe = subplot(2,3,5) 
hold on
fill(points(1,:),points(2,:),'b')
fill(e(1,:),e(2,:),'r')
title("e")

f = B*A*points
pf = subplot(2,3,6) 
hold on
fill(points(1,:),points(2,:),'b')
fill(f(1,:),f(2,:),'r')
title("f")

linkaxes([pa,pb,pc,pd,pe,pf],'xy')

