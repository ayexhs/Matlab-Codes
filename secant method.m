clc 
clear all
format long
f=@(x) 2*x-6-log(x);
e=input("Tolerance value:");
n=input("No. of iteration:");
x0=input("Initial guess 1:");
x1=input("Initial guess 2:");
if (f(x1)-f(x0))==0
    disp("wrong")
else
    for i=1:n
    x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    if abs(x2-x1)<e
        disp(x1)
        break
    end
    x0=x1;
    x1=x2;
    end
end

