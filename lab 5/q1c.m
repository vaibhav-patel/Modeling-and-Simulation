close all;
clear;
%% a
% bigger function y=4;
n=100;
t=10000;
count=0;
ptxs=zeros(n,1);
ptys=zeros(n,1);
optxs=zeros(n,1);
optys=zeros(n,1);
ptzs=zeros(n,1);
optzs=zeros(n,1);


avd1=zeros(t,1);
for ind=1:t
    count=0;
    arr=zeros(n,1);
    vol=zeros(n,1);
    for i=1:n

        ptx=rand();
        pty=rand();
        ptz=rand();
        ptxs(i)=ptx;
        ptys(i)=pty;
        ptzs(i)=ptz;
        if(ptx*ptx+pty*pty+ptz*ptz<=1)
            optxs(i)=ptx;
            optys(i)=pty;  
            optzs(i)=ptz;  
            count=count+1;
            arr(i)=1;
        end
        vol(i)=count/i;
    end
    pi_val=vol*8;
    avd1(ind)=pi_val(n);
end

for i=2:t
    avd1(i)=(avd1(i)+avd1(i-1)*(i-1) )/(i);
end

figure;
plot(1:1:t,avd1,'lineWidth',1.5);







avd2=zeros(savedv2,1);
count=1;
for i=1:savedv2
    avd2(i)=avd1(count);
    if(mod(i,n)==0)
        count=count+1;
    end
end

figure;
set(gca,'fontsize',13)
hold on
plot(1:1:savedv2,avd2,'lineWidth',1.5);
ylim([0 3.5])
hold on
plot(1:1:savedv2,savedv1,'lineWidth',1.5);
ylim([2 3.5])
hold on
plot([1 savedv2],[pi pi],'lineWidth',1.5)
legend('ensemble method','in the long run','actual value of pi')
mytitle=strcat('pi value calculated using two different methods n=',int2str(n),'  t=',int2str(t));

xlabel('runs');
ylabel('value of pi');
title(mytitle);








