clc
clear all
format long
a= [1,2;2,1];
x=[1;0];
e=0.0001;
bi=0;
for i=0:30
    y=a*x;
    b=max(y);
    y=y/b;
    x=y;
    if(abs (b)-abs (bi)<e)
        disp(b)
        break
    end
    bi=b;
end