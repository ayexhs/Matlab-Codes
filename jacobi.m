clc
clear all
format short
a=[10 3 1;3 10 2;1 2 10];
b=[19;29;35];
p=[0;0;0];
n=20;
e=0.0001;
N=length(b);
x=zeros(N,1);

for i=1:n
    for j=1:N
        x(j)=(b(j)/a(j,j))-(a(j,[1:j-1,j+1:N])*p([1:j-1,j+1:N]))/a(j,j);  
    end
    x
    if abs(p-x)<e
        break
    end
    p=x;
end