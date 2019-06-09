function x = LU_main(aug_mat)
%USAGE: 'x' is solution of the equations
%       'aug_mat' is augmented matrix
% Author: Zeyu Wang
% 23-Oct-2018 16:17:21 @ SUT
n = length(aug_mat(:,1:end-1));
[L,U] = LU(aug_mat(:,1:end-1),n);
temp = L\aug_mat(:,end);
x = U\temp;
end