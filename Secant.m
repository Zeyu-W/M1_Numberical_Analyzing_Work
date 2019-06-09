function [value,times] = Secant(int_value,exactness)
%USAGE: 'value' is the final iteration value
%       'times' is the times of iterations
%       'int_value' is the initial value
%       'exactness' is the iteration termination accuracy
% Author: Zeyu Wang
% 04-Oct-2018 19:02:19 @ SUT
         syms x;
         org_fun = x*exp(1)^x - 1;
         %org_fun = cos(x) - x*exp(1)^x;%The original_equation 
         %derivative = diff(original_function,1);
         %derivative = matlabFunction(derivative);
         org_fun = matlabFunction(org_fun);
         it_value_l = int_value;
         it_value_c = it_value_l(1) - (it_value_l(1)-it_value_l(2))*org_fun(it_value_l(1))/(org_fun(it_value_l(1)) - org_fun(it_value_l(2)));
         exa = abs(it_value_c - it_value_l(1));
         times = 1;
         while(~(exa<exactness))
             it_value_l(2) = it_value_l(1);
             it_value_l(1) = it_value_c;
             it_value_c = it_value_l(1) - (it_value_l(1)-it_value_l(2))*org_fun(it_value_l(1))/(org_fun(it_value_l(1)) - org_fun(it_value_l(2)));
             exa = abs(it_value_c - it_value_l(1));
             times = times + 1;
         end
         value = it_value_c;
end