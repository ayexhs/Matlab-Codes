clc
clear all
f=@(x,y) x*y %% a=1;b=1.4;t1=1;y1=5;h=0.1; The output is (1.300000,7.054720)
a=input('Enter the value a:= ')
b=input('Enter the value b:= ')     
t(1)=input('Enter the value t1:= ') %at x=1
y(1)=input('Enter the value y1:= ') %y(1)=5
h=input('Enter the value h:= ')     %step size
n=(b-a)/h;
for i=1:n
    t(i+1)=t(i)+h;                  %x_{i+1}=x{i}+h
    u(i)=y(i)+h*f(t(i),y(i));       %yp_{i+1}=y_{i}+hf(x_{i},y_{i})-PREDICTED VALUES
    y(i+1)=y(i)+(h/2)*(f(t(i),y(i))+f(t(i+1),u(i))); %yc_{i+1}=yi+(h/2)(f(xi,yi)+f(xi+1,ypi))-CORRECTED VALUES
end
fprintf('The output is (%f,%f)',t(i+1),y(i+1))