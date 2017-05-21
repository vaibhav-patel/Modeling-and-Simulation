close all;
clear all;

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
     a=figure;
  
    set(gca,'fontsize',13)
hold on
r=zeros(iter,1);
r(1)=k*b*(1-q)/(v+m+w);
    for i = 2 : iter
        S(i)= S(i-1) + dt*(     (((-1)*k*b*I(i-1)*S(i-1))/N)  +   (((-1)*q*k*(1-b)*I(i-1)*S(i-1))/(N)) +  u*Sq(i-1) );
        Sq(i)= Sq(i-1) + dt*(     ((q*k*(1-b)*I(i-1)*S(i-1))/(N))  +  (-1)*u*Sq(i-1) );
        I(i)= I(i-1) + dt*( p*E(i-1)  - w*(I(i-1)) - m*I(i-1)  - v*I(i-1) );
        r(i)= p*E(i-1)  - w*(I(i-1)) - m*I(i-1)  - v*I(i-1) ;
        r(i)=r(i);
        Iq(i)= Iq(i-1) + dt*( p*Eq(i-1)  - w*(Iq(i-1)) - m*Iq(i-1)  - v*Iq(i-1) );
        Id(i)= Id(i-1) + dt*(w*(I(i-1) + Iq(i-1))  -  m*(Id(i-1)) -v*(Id(i-1))  );
        D(i) = D(i-1)  +dt*(m*(Iq(i-1) + I(i-1) +Id(i-1)));
        R(i)=R(i-1)+dt*(v*( I(i-1)+Iq(i-1)+Id(i-1)));
        E(i)= E(i-1) + dt*(     (1-q)*((k*b*I(i-1)*S(i-1))/(N))   -p*E(i-1) );
        Eq(i)= Eq(i-1) + dt*(     (q)*((k*b*I(i-1)*S(i-1))/(N))   -p*Eq(i-1) );
        t(i) = t(i - 1) + dt;
    end;
    plot(t, r,'linewidth',1.5);
    hold on;
    plot(t, I/100,'linewidth',1.5);
    
    legend('Rate of change of I','I/100 (scaled for visualization)')
    mytitle=strcat('Rate of change of I');
      xlabel('time in days');
    ylabel('number of people');
    title(mytitle);
    saveas(a,'rchange2.jpeg')

