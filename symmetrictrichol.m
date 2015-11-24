% Given the szie of a symmetric tridiagonal matrix and a symmetric tridiagonal
% matrix given as two vector: n by 1 vector v representing the main diagonal and
% (n-1) by 1 vector w representing the upper diagonal, this function returns
% the Cholesky factor of the symmetric tridiagonal matrix as a vector for the
% main diagonal, a vector for the upper diagonal, the number of flops and the
% number of square roots.
%
% Input: n: the size of a symmetric tridiagonal matrix
%        v: a n by 1 vector representing the main diagonal of matrix
%        w: a (n-1) by 1 vector representing the upper diagonal of matrix
%
% Output: vchol: a n by 1 vector representing the main diagonal
%         wchol: a (n-1) by 1 vector representing the upper diagonal
%         flops: the count of floating point operations
%         sqtr: the number of square roots
%
% Author: Xuanpei Ouyang

function [vchol,wchol,flops,sqtr] = symmetrictrichol(n,v,w)
    A = zeros(n);
    flops = 0;
    sqtr = 0;
    vchol = zeros(n,1);
    wchol = zeros(n-1,1);
    for i=1:n
        A(i,i)=v(i);
    end
    for i=1:n-1
        A(i,i+1)=w(i);
        A(i+1,i)=w(i);
    end     
    R=zeros(n,n);  
    
    for i=1:n
      for k=max(i-2,1):i-1
          A(i,i)=A(i,i)-R(k,i)^2;
          flops=flops+2;
      end
      R(i,i)=sqrt(A(i,i));
      sqtr = sqtr+1;
      for j=i+1:min(i+2,n)
          for k=max(i-2,1):i-1
              A(i,j)=A(i,j)-R(k,j)*R(k,i);
              flops=flops+2;
          end
          R(i,j)=A(i,j)/R(i,i);
          flops=flops+1;
      end
    end
    for i=1:n
        vchol(i)=R(i,i);
    end
    for i=1:n-1
        wchol(i)=R(i,i+1);
    end
end

