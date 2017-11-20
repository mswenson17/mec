G = tf([0 0 0 1 10 ],[1 71 1070 1000 0])
Gc=G/(G+1)

C = pid(1100,1000,1100)

syspoles =pole(Gc)
syszeros =zero(Gc)

T = feedback(C*Gc, 1)

pole(T)
step(T)

[y t] = step(T);

size(t)
ind =min(find(y>1))
time=t(ind)
value=y(ind)
overshoot=max(y)
final_value = y(end)


