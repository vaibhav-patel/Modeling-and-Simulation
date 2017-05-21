close all;
clear all;
qs=[0;0.01;0.05;0.1;0.2;1];

k = 10;
b = 0.06;
p=0.2;
q=0.01;
v=0.04;
w=0.0625;
u=0.1;
m=0.0975;
N=10000000;


total = 365;
dt = 1;
iter = total / dt + 1;

t = zeros(iter, 1);
S = zeros(iter, 1);
Sq = zeros(iter, 1);
I = zeros(iter, 1);
Iq = zeros(iter, 1);
E = zeros(iter, 1);
Eq = zeros(iter, 1);
Id = zeros(iter, 1);
R = zeros(iter, 1);
D = zeros(iter, 1);

S(1) = N-1;
I(1) = 1; set(gca,'fontsize',13)
hold on
for vap=1:size(qs,1)
     a=figure;
  
    q=qs(vap);
    set(gca,'fontsize',13)
hold on
    for i = 2 : iter
        S(i)= S(i-1) + dt*(     (((-1)*k*b*I(i-1)*S(i-1))/N)  +   (((-1)*q*k*(1-b)*I(i-1)*S(i-1))/(N)) +  u*Sq(i-1) );
        Sq(i)= Sq(i-1) + dt*(     ((q*k*(1-b)*I(i-1)*S(i-1))/(N))  +  (-1)*u*Sq(i-1) );
        I(i)= I(i-1) + dt*( p*E(i-1)  - w*(I(i-1)) - m*I(i-1)  - v*I(i-1) );
        Iq(i)= Iq(i-1) + dt*( p*Eq(i-1)  - w*(Iq(i-1)) - m*Iq(i-1)  - v*Iq(i-1) );
        Id(i)= Id(i-1) + dt*(w*(I(i-1) + Iq(i-1))  -  m*(Id(i-1)) -v*(Id(i-1))  );
        D(i) = D(i-1)  +dt*(m*(Iq(i-1) + I(i-1) +Id(i-1)));
        R(i)=R(i-1)+dt*(v*( I(i-1)+Iq(i-1)+Id(i-1)));
        E(i)= E(i-1) + dt*(     (1-q)*((k*b*I(i-1)*S(i-1))/(N))   -p*E(i-1) );
        Eq(i)= Eq(i-1) + dt*(     (q)*((k*b*I(i-1)*S(i-1))/(N))   -p*Eq(i-1) );
        t(i) = t(i - 1) + dt;
    end;
    plot(t, S,'linewidth',1.5);
    hold on;
    plot(t, I,'linewidth',1.5);
    hold on;
    plot(t, E,'linewidth',1.5);
    legend('S','I','E')
    mytitle=strcat('S,I,E for q=',num2str(q));
      xlabel('time in days');
    ylabel('number of people');
    title(mytitle);
    saveas(a,strcat(int2str(vap),'.jpeg'))

end
