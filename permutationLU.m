% Implement permutation LU factoriation
%
% Given the input the size n, permutation matrix P, an n by n matrix B and an n
% by 1 vector b, this function will return the solution to Ax = b by using
% LU factoriation.
%
% Input: n: the size of matrix
%        p: a n by 1 vector p of ordere integers from 1 to n representing a
%           permutation matrix P. The ith row of P is the p(i)th row of the
%           identity matrix
%        B: a n by n matrix B  upper triangular portion stores U, the upper
%           triangular of LU factoriation
%        b: a n by 1 vector b
%
% Output: x: a n by 1 vector, the solution to Ax = b
%
% Author: Xuanpei Ouyang

function [ x ] = permutationLU(n, p, B, b)
   
    newb = zeros(n,1);
    for i=1:n
        newb(i) = b(p(i));
    end
     
    L = zeros(n);
    U = zeros(n);
    for i=1:n
        for j=i:n
            U(i,j) = B(i,j);
            L(j,i) = B(j,i);
        end
        L(i,i) = 1;
    end
    
    y = b;
    for i=1:n
        for j=1:i-1
            y(i)=y(i)-L(i,j)*y(j);
        end
    if L(i,i)==0
        disp('Error'); 
        break; 
    end
    y(i)=y(i)/L(i,i);
    end
 
    x=zeros(n,1);
    for i=n:-1:1
        for j=i+1:n
            y(i)=y(i)-U(i,j)*x(j);
        end
        if U(i,i)==0 
            disp('Error'); 
            break; 
        end
        x(i)=y(i)/U(i,i);
    end    
end

