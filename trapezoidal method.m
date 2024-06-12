clc
clear all
format short
a=input('Lower limit:');
b=input('upper Limit:');
n=20;
h=(b-a)/n;
f=@(x) 1/(1+x);
sum=(h/2)*f(a);
for i=1:n-1
    x(i)=a+i*h;
    sum=sum+h*f(x(i));
end
sum=sum+(h/2)*f(b);
disp(sum)