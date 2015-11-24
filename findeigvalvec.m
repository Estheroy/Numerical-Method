% Given a n x n Matrix, its size and the number of iterations, this program will
% returns an approximation of its largest eigenvalue by usiing Power method for
% k iterations on an initial guess the vector of all 1's
%
% Input: A: A n x n Matrix
%        n: the size of Matrix A
%        iter: the number of iterations the loop runs
%
% Output: lambda: the approximated largest eigenvalue of A
%         q: the eigenvector corresponded to the apprximated largest eigenvalue
%
% Author: Xuanpei Ouyang

function[eigval,eigvec] = findeigvalvec(A,n,iterations)
    eigvec = zeros(n,1);
    previous = ones(n,1);
    for iter = 1:iterations    
        for i=1:n
            for j=1:n
            eigvec(i) = eigvec(i) + A(i,j)*previous(j);
            end
        end
        eigval=0;
        for j=1:n
            if abs(eigvec(j))>abs(eigval)
                eigval=eigvec(j);
            end
        end
        eigvec = eigvec/eigval;
        previous = eigvec;
    end
    eigval = eigval-1;            
end