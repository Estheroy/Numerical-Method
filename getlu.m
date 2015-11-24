% Implement LU factoriation
% 
% Given a n by n matrix and the size of the matrix, this function returns
% a n by n lower triangular matrix and a n by n upper triangular matrix of LU
% factoriation.
%
% Input: A: a n x n matrix
%        n: the size of matrix A
%
% Output: L: a n by n lower triangular matrix
%         U: a n by n upper triangular matrix
%
% Author: Xuanpei Ouyang

function [L U] = getlu(A,n);
  L=eye(n);
  for k=1:n-1
      for i=k+1:n
          L(i,k)=A (i,k)/A(k,k);
          for j=k+1:n
            A(i,j)=A(i,j)-L(i,k)*A(k,j);
          end
      end
  end
  U=triu(A);
end