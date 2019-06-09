function [value,times] = question_3_1(int_value,exactness)
%USAGE: 'value' is the final iteration value
%       'times' is the times of iterations
%       'int_value' is the initial value
%       'exactness' is the iteration termination accuracy
% Author: Zeyu Wang
% 04-Oct-2018 22:16:26 @ SUT
         syms x;
         %it_format = (3*x + exp(1)^x - 2)^(1/2);
         it_format = (x^2 - exp(1)^x + 2)*(1/3);
         it_fun = matlabFunction(it_format);
         it_value_l = int_value;
         it_value_c = it_fun(it_value_l);
         exa = abs(it_value_c - it_value_l);
         times = 1;
         while(~(exa<exactness))
             it_value_l = it_value_c;
             it_value_c = it_fun(it_value_l);
             exa = abs(it_value_c - it_value_l);
             times = times + 1;
         end
         value = it_value_c;
end