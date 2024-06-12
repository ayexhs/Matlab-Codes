clc
clear all
format long
f=@(x) (2^x+2)/5;
e=input("Tolerance value:");
n=input("No. of iteration:");
x0=input("Initial guess:");
for i=1:n
    x1=f(x0);
    if abs(x1-x0)<e
        disp(x1)
        break
    end
    x0=x1;
end