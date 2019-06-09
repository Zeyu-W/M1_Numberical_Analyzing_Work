function [value,times] = question_3_2(int_value,exactness)
%USAGE: 'value' is the final iteration value
%       'times' is the times of iterations
%       'int_value' is the initial value
%       'exactness' is the iteration termination accuracy
% Author: Zeyu Wang
% 05-Oct-2018 10:45:21 @ SUT
         syms x;
         %it_format = (1/10)*(20 - 2*x^2 - x^3);
         %it_format = (20 - 2*x^2 - 10*x)^(1/3);
         %it_format = ((1/2)*(20 - 10*x - x^3))^(1/2);
         it_format = 20/(x^2 + 2*x + 10);
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