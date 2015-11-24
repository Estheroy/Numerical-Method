% Given the number of nonzero elements of a sparse matrix and a n by n sparse
% lower triangular matrix whose nonzeros are given as m by 1 column vecotrs r, c
% and v, representing the r(k) row, c(k) column entry of the matrix is nonzero
% with value v(k), for k = 1,...,m. Assume c is in non-decreasing order.
% This funciton returns a n by 1 vector by using column-oriented forward
% substitutionand the number of flops.
%
% Input: n: the size of matrix
%        m: the number of nonzero elements of a sparse matrix
%        r: a n by 1 vector, the row with non-zero entry
%        c: a n by 1 vector the column with non-zero entry
%        v: the list of non-zero values
%        b: a n by 1 vector
%
% Output: y: a n by 1 vector, the solution to Ax = b
%         flops: the count of floating point operations
%
% Author: Xuanpei Ouyang

function[y,flops] = sparsecolforwardsub2(n,m,r,c,v,b)

    y = zeros(n,1);
    flops = 0;
    diagonal = 0;
    value = 1;
    for i=1:n
        for k=1:m
            if(r(k)== c(k) && v(value) ~= 0 && c(k) == i)
                diagonal = v(value);
                value = value + 1;
                break;
            end
        end
        disp(value)  
        y(i)=b(i)/diagonal;
        flops = flops + 1;
        for j = i+1:n
            b(r(i))=b(r(i))-y(r(j))*v(i);
            flops = flops + 2;
        end
    end
end