clc
clear all
format short
a=input('Lower limit:');
b=input('upper Limit:');
n=20;
h=(b-a)/n;
f=@(x) exp(x^2);
sum=(h/3)*f(a);
for i=1:2:n-1
    x(i)=a+i*h;
    sum=sum+(h/3)*4*f(x(i));
end
for i=2:2:n-1
    x(i)=a+i*h;
    sum=sum+(h/3)*2*f(x(i));
end
sum=sum+(h/3)*f(b);
disp(sum)
