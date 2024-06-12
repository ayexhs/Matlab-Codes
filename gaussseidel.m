clc
clear all
format short
a=[10 3 1;3 10 2;1 2 10];
b=[19;29;35];
p=[0;0;0];
n=20;
e=0.001;
N=length(b);
x=zeros(N,1);
y=zeros(N,1);

for i=1:n
    for j=1:N
        x(j)=(b(j)-(a(j,[1:j-1,j+1:N])*p([1:j-1,j+1:N])))/a(j,j); 
        p(j)=x(j);
    end
    x
    if abs(y-x)<e
        break
    end
    y=x;
end