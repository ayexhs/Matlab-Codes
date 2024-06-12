clc
clear all
C=[0 0];
A = [1 2 1 0; 3 4 0 1];
B = [4; 9];
p = [0 2 0 0; 3 0 0 0; 2 1 0 0; 4 0 0 0; 6 0 0 0; 1 3 0 0; 1 1.5 0 0; 2 2 0 0];
p = p';
s = 0;
ptt = [];

for i = 1:size(p, 2)
    point = p(:, i);
    % Check constraints
    constraint1 = A(1,1)*point(1) + A(1,2)*point(2) + A(1,3)*point(3) + A(1,4)*point(4) - B(1);
    constraint2 = A(2,1)*point(1) + A(2,2)*point(2) + A(2,3)*point(3) + A(2,4)*point(4) - B(2);
    % Check if constraints are satisfied
    if constraint1 == 0 && constraint2 == 0
        ptt = [ptt; point']
    else
        s = s + 1;
    end
end
if s == size(p, 2)
    disp('No feasible solution');
end
