clc
clear all
A=[-1 3;1 1;1 -1]
B=[10;6;2];
C=[2 -3];
x=0:max(B);
z1=(B(1)-A(1,1)*x)/A(1,2);
z2=(B(2)-A(2,1)*x)/A(2,2);
z3=(B(3)-A(3,1)*x)/A(3,2);
z1=max(0,z1)
z2=max(0,z2)
z3=max(0,z3)
plot(x,z1,'g',x,z2,'r',x,z3,'b')
xlabel('x1')
ylabel('x2')
legend('-x1+3x2=10','x1+x2=6','x1-x2=2')

cx=find(x==0)
c1=find(z1==0)
c2=find(z2==0)
c3=find(z3==0)
line1=[x([cx,c1]);z1([cx,c1])]'
line2=[x([cx,c2]);z1([cx,c2])]'
line3=[x([cx,c3]);z1([cx,c3])]'
cpt=unique([line1;line2;line3],'rows')

ptt=[0;0];
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:size(A,1)
        A2=A(j,:);
        B2=B(j,:);
        A4=[A1;A2];
        B4=[B1;B2];
        x=A4\B4;
        ptt=[ptt x];
    end
end    
ict=ptt'
point=unique([cpt;ict],'rows')


for i= 1:size(point,1)
    constraint1(i)=A(1,1)*point(i,1)+A(1,2)*point(i,2)-B(1)
    constraint2(i)=A(2,1)*point(i,1)+A(2,2)*point(i,2)-B(2)
    constraint3(i)=A(3,1)*point(i,1)+A(3,2)*point(i,2)-B(3)
    s1=find(constraint1(i)>0)
    s2=find(constraint2(i)>0)
    s3=find(constraint3(i)>0)   
end
s=unique([s1;s2;s3])
point(s,:)=[]
value=point*C'
table=[point value]
obj=max(value);
[obj,index]=max(value)
x1=point(index,1);
x2=point(index,2);
fprintf("The optimal value of the function is %f at (%f,%f)",obj,x1,x2)