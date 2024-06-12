clc
clear all

cost=[2 1 0 0 0 0];
a=[1 2 1 0 0;1 1 0 1 0;1 -1 0 0 1];
b=[10;6;2];
A1=[a b];
bv=[3 4 5];
zjcj= cost(bv)*A1-cost;
table=[zjcj;A1];
zc=zjcj(:,1:end-1);
[colmnVal,ColmnIndx]=min(zc);

while(min(zc)<0)

    sol=A1(:,end);
    column=A1(:,ColmnIndx);
    
    for i=1:size(A1,1)
        if(column(i)>0)
            ratio(i)=sol(i)/column(i);
        else
            ratio(i)=inf;
        end
    end
    [rowVal,rowIndx]=min(ratio);

    bv(rowIndx)=ColmnIndx;
    B1=A1(:,bv);
    A1=inv(B1)*A1;

    zjcj= cost(bv)*A1-cost;
    table=[zjcj;A1];
    simpTable=array2table(table)
    zc=zjcj(:,1:end-1);
    [colmnVal,ColmnIndx]=min(zc);
end