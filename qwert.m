clc
clear all

C = [5 3 0 0];
cost = [5 3 0 0 0];
A = [3 5 1 0; 5 2 0 1];
B = [15; 10];
A1 = [A B];
bv = [3 4];
zjcj = cost(bv)' * A1 - cost;
table = [A1; zjcj];
run = true;

while run
    % checking the negative values in zjcj to get the optimality
    if any(zjcj(1:end-1) < 0)
        fprintf("The solution is not optimal\n")
        % avoiding the sol column in zjcj
        zc = zjcj(1:end-1);
        % storing the min column values in pivotcol
        [value, pivotcol] = min(zc);
        sol = A1(:, end);
        column = A1(:, pivotcol);

        % if all values in the pivotcol are non-positive
        if all(column <= 0)
            fprintf("The LPP is unbounded\n")
            break;
        end

        ratio = Inf(size(A1, 1), 1);
        for i = 1:size(A1, 1)
            if column(i) > 0
                ratio(i) = sol(i) / column(i);
            end
        end

        [value2, pivotrow] = min(ratio);
        pk = A1(pivotrow, pivotcol);
        A1(pivotrow, :) = A1(pivotrow, :) / pk;

        for i = 1:size(A1, 1)
            if i ~= pivotrow
                A1(i, :) = A1(i, :) - A1(i, pivotcol) * A1(pivotrow, :) / pk;
            end
        end

        bv(pivotrow) = pivotcol;
        zjcj = cost(bv)' * A1 - cost;
        table = [A1; zjcj];
    else
        run = false;
        fprintf("The solution is optimal\n")
    end
end