close all;
clear;
%% a
% bigger function y=4;
n=10000;
count=0;
ptxs=zeros(n,1);
ptys=zeros(n,1);
optxs=zeros(n,1);
optys=zeros(n,1);

arr=zeros(n,1);
area=zeros(n,1);
for i=1:n
    ptx=rand();
    pty=rand();
    ptxs(i)=ptx;
    ptys(i)=pty;
    if(ptx*ptx+pty*pty<=1)
        optxs(i)=ptx;
        optys(i)=pty;  
        count=count+1;
        arr(i)=1;
    end
    area(i)=count/i;
end
pi_val=area*4;
savedv1=pi_val';
savedv2=n;
a=figure;
set(gca,'fontsize',13)
hold on
plot(1:1:n,pi_val,'lineWidth',1.5);
legend('value of pi')
mytitle=strcat('value of pi vs number of samples');
xlabel('number of samples');
ylabel('value of pi');
title(mytitle);
saveas(a,'pr1b3.jpeg')
pi_val(n)

a=figure;
set(gca,'fontsize',13)
hold on
plot(ptxs,ptys,'.b','lineWidth',1.5)
hold on;
plot(optxs,optys,'.r','lineWidth',1.5)
legend('All the points','X^2+Y^2=1 ')
mytitle=strcat('Circle in the square');
xlabel('x axis');
ylabel('y axis');
title(mytitle);
saveas(a,'pr1b4.jpeg')




n=100;
t=100;
count=0;
ptxs=zeros(n,1);
ptys=zeros(n,1);
optxs=zeros(n,1);
optys=zeros(n,1);

avd1=zeros(t,1);
for ind=1:t
    arr=zeros(n,1);
    area=zeros(n,1);
    count=0;
    for i=1:n
        ptx=rand();
        pty=rand();
        ptxs(i)=ptx;
        ptys(i)=pty;
        if(ptx*ptx+pty*pty<=1)
            optxs(i)=ptx;
            optys(i)=pty;  
            count=count+1;
            arr(i)=1;
        end
        area(i)=count/i;
    end
    pi_val=area*4;
    avd1(ind)=pi_val(n);
end

for i=2:t
    avd1(i)=(avd1(i)+avd1(i-1)*(i-1) )/(i);
end

figure;
plot(1:1:t,avd1,'lineWidth',1.5);
ylim([0 3.5])






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








