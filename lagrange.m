clc
clear all 
format short
x=[2,3,5];
y=[5,7,8];
n=length(x);
sum=0;
P=4;
for i=1:n
    p(i)=1;
    for j=1:n
        if(j~=i)
            p(i)=((P-x(j))*p(i))/(x(i)-x(j));
        end
    end
    sum=sum+(p(i)*y(i));
end
disp(sum)
            
