% Implement lower triangular forward subustituion
%
% Given the size of matrix, a n by n matrix and a n by 1 vector, this function
% returns the solution to Gy = b by using lower triangular forward subustituion.
%
% Input: n: the size of matrix 
%        G: a n by n matrix
%        b: a n by 1 vector
%
% Output: y: a n by 1 vector, the solution to Gy = b
%         flops: the count of floating point operations
%
% Author: Xuanpei Ouyang

function [flops, y] = lowerforwardsub(n, G, b)

flops = 0;
y = zeros(n,1);
for i = 1:n
    for j = 1:i-1 
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

