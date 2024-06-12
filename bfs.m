clc
clear all
C=[-0.01 0.5 0 0];
A=[2 5 1 0;1 1 0 1];
B=[80;20];
m=size(A,1)
n=size(A,2)
if n>m
    nCm=nchoosek(n,m);
    p=nchoosek(1:n,m)
    sol=[];
    for i=1:nCm
        y=zeros(n,1);
        A1=A(:,p(i,:));
        x=inv(A1)*B;
        if all(x>=0 & x~=inf & x~=-inf)
            y(p(i,:))=x;
            sol=[sol y]
        end
    end
else
    error('error')
end
z=C*sol;
[obj index]=max(z);
x1=sol(1,index);
x2=sol(2,index);
x3=sol(3,index);
x4=sol(4,index);
fprintf("the optimal is %f at (%f,%f,%f,%f)",max(z),x1,x2,x3,x4)