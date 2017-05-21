close all;
clear;
%% a
% bigger function y=4;
n=100000;
count=0;
ptxs=zeros(n,1);
ptys=zeros(n,1);
optxs=zeros(n,1);
optys=zeros(n,1);

arr=zeros(n,1);
area=zeros(n,1);
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
for i=1:n-1
    arr(i+1)=arr(i+1)+arr(i);
end

savedv1=area;
savedv2=n;


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




%% b
% bigger function y=4;
t=100;
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
ylim([0 3.5])
hold on
plot([1 savedv2],[8/3 8/3],'lineWidth',1.5)
legend('ensemble method','in the long run','actual area')
mytitle=strcat('Area calculaitng two different methods n=',int2str(n),'  t=',int2str(t));

xlabel('runs');
ylabel('area');
title(mytitle);







