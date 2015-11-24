% Implement iterative Gauss Seidel's method
%
% Given a n by n matrix, the size of the matrix, a n by 1 vector b and the
% number of iterations, this funciton returns the solution to Ax = b by using
% iterative Gauss Seidel's method.
%
% Input: A: a n by n matrix
%        b: a n by 1 vector
%        n: the size of matrix A
%        iter: the number of iterations of the loop
%
% Output: x: a n by 1 vector, the solution to Ax = b
%
% Author: Xuanpei Ouyang

function [x] = gaussseidelmethod(A,b,n,iter)
  x=zeros(n,1);
  for k=1:iter
      for i=1:n
        x(i)=b(i);
        for j=1:i-1
            x(i)=x(i)-A(i,j)*x(j);
        end
        for j=i+1:n
            x(i)=x(i)-A(i,j)*x(j);
        end
        x(i)=x(i)/A(i,i);
      end
   end
end