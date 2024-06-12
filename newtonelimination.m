clc
clear all
format long
a=[10 3 1;3 10 2;1 2 10];
b=[19;29;35];
n=length(b);
x=zeros(n,1);
aug=[a b]
for i = 1:n
    for j = i+1:n 
        m = aug(j,i) / aug(i,i);
        aug(j,:) = aug(j,:) - m * aug(i,:);
    end
end

% Back substitution
x(n) = aug(n,n+1) / aug(n,n);
for i = n-1:-1:1
    x(i) = (aug(i,n+1) - (aug(i,i+1:n) * x(i+1:n))) / aug(i,i);
end
disp(x);
