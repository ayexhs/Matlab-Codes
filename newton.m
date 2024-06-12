clc
clear all
format long
f=@(x) 2^x-5*x+2;
df=@(x) log(2)*2^x-5;
e=input("Tolerance value:");
n=input("No. of iteration:");
x0=input("Initial guess:");
if df(x0)==0
    disp("wrong")
else
    i=0;
    while(i<n)
        x1=x0-f(x0)/df(x0);
        if abs(x1-x0)<e
            disp(x0)
            break
        end
        x0=x1;
        i=i+1;
    end
end
