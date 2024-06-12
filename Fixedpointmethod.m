clc
clear all
format long
f=@(x)x^3-7*x+2
a=input("Enter the left interval:");
b=input("Enter the right interval:");
e=input("Enter the tolerance value:");
x0=input("Enter Initial guess:");
n=input("Enter the number of iteration:")
g=@(x)3*x^2-7
x=a:abs(b-a)/10000:b
for j=1:length(x)
    if abs(g(x(j)))<1
        continue;
    else
        fprintf('The func has no roots')
        break;
    end
end
i=0;
while i<n
    if abs(g(x0))<1
        x1=f(x0);
        if(abs(x1-x0)<e)
            fprintf('fixed point is %d',x1)
            break;
        end
    x0=x1;
    i=i+1;
    end
    if(i==n)
        fprintf('Func exceeds iteration')
    end
end


