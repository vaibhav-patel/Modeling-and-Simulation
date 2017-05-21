close all;
clear;
%% a
% bigger function y=4;
n=1000000;
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


a=figure;
set(gca,'fontsize',13)
hold on
plot(1:1:n,pi_val,'lineWidth',1.5);
legend('value of pi')
mytitle=strcat('value of pi vs number of samples');
xlabel('number of samples');
ylabel('value of pi');
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
















