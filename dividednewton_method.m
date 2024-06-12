clc
clear all
format long
x=[2,3,4,5,6];
y=[4,7,8,11,15];
n=length (x) ;
a=zeros (n, n) ;
a (:,1) =y';
p=4.5;
for j=2:n
    for i=j:n
    a(i,j)=(a(i,j-1)-a(i-1,j-1))/(x(i)-x(i-j+1));
    end
end
disp (a)
P(1)=1;
sum=a(1,1);
for i=2:n
    P(i)=P(i-1)*(p-x(i-1)); 
    sum=sum+(P(i)*a(i,i));
end
disp(sum)