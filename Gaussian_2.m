function x = Gaussian_2(aug_mat)
%USAGE: 'x' is solution of the equations
%       'aug_mat' is augmented matrix
% Author: Zeyu Wang
% 23-Oct-2018 15:24:10 @ SUT
%% ====Elimination====
mat_size = size(aug_mat);
for i = 1:1:mat_size(1)-1
    for j = 1:1:mat_size(1) - i
        judge = aug_mat(i:end,i);
        index = max(find(judge == max(judge))+i-1);
        main = aug_mat(index,:);
        aug_mat(index,:) = aug_mat(i,:);
        aug_mat(i,:) = main;
        fac = aug_mat(i+j,i) / aug_mat(i,i);
        aug_mat(i+j,:) = aug_mat(i+j,:) - fac*aug_mat(i,:);
    end
end
%% ====Back to solve====
x = linspace(1,1,mat_size(1));
A = aug_mat(:,1:end-1);
B = aug_mat(:,end);
for i = 1:1:mat_size(1)
    tem = A(mat_size(1)+1-i,1:end);
    tem = tem.*x;
    div = tem(end-i+1);
    tem(end-i+1) = 0;
    x(end+1-i) = (B(mat_size(1)+1-i)-sum(tem))/div; 
end
end
%aug_mat(1:end,1:5)\aug_mat(:,6)  
%load('D:\Wang_Zeyu\Documents\Academic_research\Script\Numberical_Analyzing\aug_mat');