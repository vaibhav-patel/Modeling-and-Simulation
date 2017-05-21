clear all;
close all;
n=10000;
accept=zeros(n,1);
pi=3.14;
dx=0.000001;
x=0:dx:0.25;
y=2*pi*sin(4*pi*x);
c=max(y);
plot(x,y,'lineWidth',2)
title('Probability distribution needed n=10000')
xlabel('x')
ylabel('pdf')
count =0;
for i=1:n
    flag = 1;
    while flag == 1
        x1=rand()/4;
        x2=rand();
        count=count+1;
        if x2 < 2*pi*sin(4*pi*x1)/c
            accept(i)=x1;
            flag=0;
        end
    end
end
count
figure;
h=histogram(accept)
title('Histogram of random variables accepted n=10000')
xlabel('x')
ylabel('Frequency')
figure;
histogram(accept,'Normalization','probability');
title('Histogram normalized to probability values of random variables accepted n=10000')
xlabel('x')
ylabel('Frequency normalized to probability')



