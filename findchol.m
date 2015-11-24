% Implement Cholesky Decomposition
%
% Given a n x n positive-definite matrix and its size, this funciton calculates
% the Cholesky factor of the matrix and the flops it uses.
% 
% Input: A: a n by n matrix
%        n: the size of matrix A
%
% Output: R: the Cholesky factor of matrix A
%         flops: the count of floating point operations
%
% Author: Xuanpei Ouyang

function [R flops]=findchol(A,n)
  flops=0;
  R=zeros(n,n);
  for i=1:n
      for k=1:i-1
          A(i,i)=A(i,i)-R(k,i)^2;
          flops=flops+2;
      end
      if A(i,i)<0 disp('Error');
          break;
      end
      R(i,i)=sqrt(A(i,i));
      for j=i+1:n
          for k=1:i-1
              A(i,j)=A(i,j)-R(k,j)*R(k,i);
              flops=flops+2;
          end
          R(i,j)=A(i,j)/R(i,i);
          flops=flops+1;
      end
  end
end