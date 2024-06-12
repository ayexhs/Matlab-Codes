clc
clear all
format long
f=@(x) x^3-2*(x^2)-5;
a=input("Enter the left interval");
b=input("Enter the right interval");
e=input("Enter the tolerance value");
c=(a+b)/2;
if (f(a)*f(b)>0)
    disp("wrong statement")
else
    while(abs(f(c))>e)
        if(f(a)*f(c)<0)
           b=c;
        elseif(f(b)*f(c)<0)
           a=c;
        end
        c=(a+b)/2;
    end
    disp(c)
end 