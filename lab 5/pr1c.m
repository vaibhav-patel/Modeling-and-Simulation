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
ptzs=zeros(n,1);
optzs=zeros(n,1);

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
savedv1=pi_val';
savedv2=n;

a=figure;
set(gca,'fontsize',13)
hold on
plot(1:1:n,pi_val,'lineWidth',1.5);
legend('value of pi')
mytitle=strcat('volume of a sphere, r=1');
xlabel('number of samples');
ylabel('volume of the sphere. r=1');
title(mytitle);
saveas(a,'pr1c1.jpeg')
pi_val(n)

a=figure;

scatter3(ptxs,ptys,ptzs,'.b')
hold on;
scatter3(optxs,optys,optzs,'.r')
legend('All the points','X^2+Y^2+Z^2=1 ')
mytitle=strcat('Sphere in the cube');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');

title(mytitle);
saveas(a,'pr1c2.jpeg')



n=10;
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
ylim([2 5])
hold on
plot([1 savedv2],[4*pi/3 4*pi/3],'lineWidth',1.5)
legend('ensemble method','in the long run','volume of a sphere')
mytitle=strcat('volume of a sphere (r=1) calculated using two different methods n=',int2str(n),'  t=',int2str(t));

xlabel('runs');
ylabel('value of pi');
title(mytitle);





















