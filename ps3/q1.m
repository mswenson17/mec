A=[0 1 0;
   0 0 1; 
   1 5 7]
B=[1;0;0]
C=[0 1 3]

gamma = eig(A)

Q= [B A*B A^2*B];
latex(vpa(Q,5))
rank(Q)

Wo=[C;C*A;C*A^2]
rank(Wo)

t = linspace(0,2,101);
K = place(A,B,[-2,-1+i,-1-i])

x0=[0;1;0];

x=[];
for j = 1:numel(t)
    x(:,j)=expm(A*t(j))*x0;
end
size(C)
size(x)
figure(1)
hold off
plot(t,C*x)
title("Graph of response of function");
xlabel("Time 0 to 2 seconds");
saveas(gcf,'q1d.jpg');

K = place(A,B,[-2,-1+i,-1-i])
latex(vpa(K,5))

eig(A-B*K)

t = linspace(0,10,101);

for j = 1:numel(t)
    x2(:,j)=expm((A-B*K)*t(j))*x0;
end
i
figure(2)
plot(t,C*x2)
xlabel("Time 0 to 10 seconds");
saveas(gcf,'q1f.jpg');
