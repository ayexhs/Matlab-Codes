%% Least Cost Method 
clc 
clear all
%%Phase 1: Input the entries
cost = [11 20 7 8;21 16 10 12;8 12 18 9];
a = [50 40 70];
b = [30 25 35 40];
%%Phase 2: Check Unbalanced/Balanced
if sum(a)==sum(b)
    fprintf('Transportation problem is Balanced\n')     
else
    fprintf('Transportation problem is Unbalanced\n')

    if sum(a) < sum(b)
        cost(end+1,:) = zeros(1,length(b));
        a(end+1) = sum(b)-sum(a);
    else %%if sum(a) > sum(b)
        cost(:, end+1) = zeros(length(a),1);
        b(end+1) = sum(a)-sum(b);
    end
end
icost=cost;
x=zeros(size(cost));
m=size(cost,1);
n=size(cost,2);
BFS=m+n-1;
%%Phase 3: Finding cells with minimum cost
for i=1:size(cost,1)
    for j=1:size(cost,2)
        hh=min(cost(:));
        [row_index,col_index]=find(hh==cost);
        x11=min(a(row_index),b(col_index));
        [value,index]=max(x11);
        ii=row_index(index);
        jj=col_index(index);
        y11=min(a(ii),b(jj));
        x(ii,jj)=y11;
        a(ii)=a(ii)-y11;
        b(jj)=b(jj)-y11;
        cost(ii,jj)=inf;
    end
end 
fprintf('Initial BFS=\n');
IBFS=array2table(x);
disp(IBFS);
%%Phase 4: Check Degenerate/Non-Degenerate
totalBFS=length(nonzeros(x));
if totalBFS==BFS
    fprintf('Non-degenerate');
else
    fprintf('Degenerate');
end
%%Phase 5: Compute the cost
initialcost=sum(sum(icost.*x));
fprintf('Initial BFS cost is = %d',initialcost);