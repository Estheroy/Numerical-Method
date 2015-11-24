% Approximate two-norm of 2 by 2 matrix
%
% Given a 2 x 2 Matrix and appriximate its two norm value by calulating
% maximum of the 100 resultant vector norms, ||A*x_k|| where for a vector
% v=[c d], ||v|| = sqrt(c^2 + d^2).
%
% Input: A: a 2 x 2 Matrix
%
% Output: max: the approximated two norm value of matrix A
%
% Author: Xuanpei Ouyang

function [max] = approxtwonorm(A)
x = zeros(2,1);
b = zeros(100,1);
for i = 1:100
    x = [cos(2*pi*i/100);sin(2*pi*i/100)];
    b(i) = norm(A*x);
end
max = 0;
for i = 1:100
    if b(i) > max
        max = b(i);
    end
end
end