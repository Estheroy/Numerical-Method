% Implement upper triangular backwrard subustituion
% Given the size of matrix n, a n by n matrix G and a n by 1 vector b,
% this function returns the solution to Gy = b by using upper triangular
% backward subustituion.
%
% Input: n: the size of matrix
%        G: a n by n matrix
%        b: a n by 1 vector
%
% Output: flops: the count of floating point operations
%         y: a n by 1 vector, the solution to Gy = b
%
% Author: Xuanpei Ouyang

function [flops, y] = upperbackwardsub(n, G, b)

flops = 0;
y = zeros(n,1);
for i = n:-1:1
    for j = i+1:n 
        b(i) = b(i)-G(i,j)*y(j);
        flops = flops + 2;
    end
    
    if G(i,i)==0
        break;
    end
    
    y(i) = b(i)/G(i,i);
    flops = flops + 1;
end
end

