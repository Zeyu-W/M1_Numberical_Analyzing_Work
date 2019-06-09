function [L,U] = LU(coe_mat,n)
%USAGE: 'L' is L matrix
%       'U' is U matrix
%       'coe_mat' is the coefficient matrix
% Author: Zeyu Wang
% 23-Oct-2018 16:01:16 @ SUT
L = zeros(n,n);           
U = coe_mat;
for i = 1:n
    L(i,i) = 1;  
end  
for j = 1 : n-1
    if abs(U(j,j))<eps
        error('zero pivot encountered');    
    end
    for i = j+1 : n
        mult = U(i,j)/U(j,j);
        L(i,j) = mult;  
        for k = j:n
            U(i,k) = U(i,k) - mult*U(j,k);
        end
    end
end
end