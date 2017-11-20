H = tf([0 0 0 200],[1 22 141 2])

cL = H/(H+1)

%[A B C D]=ss(cL)

syspoles =pole(cL)

syszeros =zero(cL)

step(cL);
saveas(gcf,'q3.jpg');

%plot(t,y)



