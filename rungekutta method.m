clc
clear all
format short
f=@(x,y) x*(y^(1/3)); %%a=1,b=1.5,t1=1,y1=1,h=0.1,ans is y(1.5)=1.686170)
a=input('Enter the value a:= ') 
b=input('Enter the value b:= ')
t1=input('Enter the value t1:= ')
y1=input('Enter the value y1:= ')
h=input('Enter the value h:= ')
n=(b-a)/h;
for i=1:n
    t2=t1+h                     %x1=x+h
    k1=h*f(t1,y1)               %k1=hf(x,y)
    k2=h*f(t1+h/2,y1+k1/2)      %k2=hf(x+h/2,y+k1/2)
    k3=h*f(t1+h/2,y1+k2/2)      %k3=hf(x+h/2,y+k2/2)
    k4=h*f(t1+h,y1+k3)          %k4=hf(x+h,y+k3)
    y2=y1+(k1+2*k2+2*k3+k4)/6   %k=1/6(k1+2k2+2k3+k4)
    t1=t2;                      %x=x+h update
    y1=y2;                      %y=y+k update
end
