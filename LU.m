clc
clear all
A=[1 1 1;4 3 -1;3 5 3]
B=[1 ;6 ;4]
n=size (A, 1)
l=eye (n)
k=eye (n)
for j=1:n-1
    for i=j+1:n
        k(i,j)=A(i,j)/A(j,j)
        A (i, :) =A(i, :)-k(i, j) *A(j,:)
    end
end
U=A
l=k
y=inv (l)*B
x=inv (U)*y
