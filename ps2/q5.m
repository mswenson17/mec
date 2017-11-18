syms t
syms q_1(t) q_2(t) m_1 m_2 I_1 I_2 q_1dot q_2dot g
%syms q_1 q_2 m_1 m_2 I_1 I_2 q_1dot q_2dot 
%q_1dot = diff(q_1,t);
%q_2dot = diff(q_2,t);
L_1 = sym('a',[3 1]);
L_2 = sym('a',[3 1]);

L_1(1)=(2*cos(q_1)); L_1(2)= 2*sin(q_1); L_1(3)=q_1;
L_2(1)=4*cos(q_1)+3*cos(q_1+q_2);L_2(2)=4*sin(q_1)+3*sin(q_1+q_2);L_2(3)=q_1+q_2;

dL_1=diff(L_1)
dL_2=collect(diff(L_2),[diff(q_1), diff(q_2)])

%dL_1=[-2*sin(q_1)*q_1dot; 
       %2*cos(q_1)*q_1dot;
       %q_1dot]

%dL_2=[-4*sin(q_1)*q_1dot+3*cos(q_1+q_2)*q_2dot;
       %4*sin(q_1)*q_1dot+3*sin(q_1+q_2)*q_2dot;
       %q_1dot+q_2dot] 


K1 = .5*m_1*(dL_1(1).^2+dL_1(2).^2)+.5*I_1*dL_1(3)^2
K2 = .5*m_2*(dL_2(1).^2+dL_2(2).^2)+.5*I_2*dL_2(3)^2

K_1=simplify(K1);
K_2=simplify(K2);

K_1=subs(K_1,diff(q_1,t),q_1dot)
K_2=subs(K_2,[diff(q_1,t) diff(q_2,t)],[q_1dot q_2dot])


K=simplify(K_1+K_2);
K=collect(K, [q_1dot, q_2dot])


P_1 = g*m_1*sin(q_1)*2
P_2 = g*m_2*(sin(q_1)*4+3*sin(q_1+q_2))

P=P_1+P_2

L=simplify(K-P)

