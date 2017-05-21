close all;
clear;
%% a
% bigger function y=4;
t=1000;
n=100;

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
        ptx=ptx*2;
        pty=rand();
        pty=pty*4;
        ptxs(i)=ptx;
        ptys(i)=pty;
        if(ptx*ptx>pty)
            optxs(i)=ptx;
            optys(i)=pty;  
            count=count+1;
            arr(i)=1;
        end
        area(i)=count/i;
    end
    area=area*8;
    avd1(ind)=area(n);
end
for i=2:t
    avd1(i)=(avd1(i)+avd1(i-1)*(i-1) )/(i);
end
for i=1:n-1
    arr(i+1)=arr(i+1)+arr(i);
end
plot(1:1:t,avd1,'lineWidth',1.5);
ylim([0 3.5])


%%
a=figure;
set(gca,'fontsize',13)
hold on
plot(1:1:n,area,'lineWidth',1.5);
legend('Area')
mytitle=strcat('Area vs number of samples');
xlabel('number of samples');
ylabel('Area');
title(mytitle);
saveas(a,'pr1a1.jpeg')


a=figure;
set(gca,'fontsize',13)
hold on
plot(ptxs,ptys,'.b','lineWidth',1.5)
hold on;
plot(optxs,optys,'.r','lineWidth',1.5)
legend('All the points','X^2 ')
mytitle=strcat('x^2 in the y=4 line');
xlabel('x axis');
ylabel('y axis');
title(mytitle);
saveas(a,'pr1a2.jpeg')














