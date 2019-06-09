function [value,times] = Newtons(int_value,exactness)
%USAGE: 'value' is the final iteration value
%       'times' is the times of iterations
%       'int_value' is the initial value
%       'exactness' is the iteration termination accuracy
% Author: Zeyu Wang
% 04-Oct-2018 15:45:21 @ SUT
         syms x;
         %org_fun = x*exp(1)^x - 1;
         %org_fun = cos(x) - x*exp(1)^x;
         %org_fun = x^2 - 3*x +2 - exp(1)^x;
         org_fun = x^3 + 2*x^2 +10*x - 20;
         der_fun = diff(org_fun,1);
         der_fun = matlabFunction(der_fun);
         org_fun = matlabFunction(org_fun);
         it_value_l = int_value;
         it_value_c = it_value_l - org_fun(it_value_l)/der_fun(it_value_l);
         exa = abs(it_value_c - it_value_l);
         times = 1;
         while(~(exa<exactness))
             it_value_l = it_value_c;
             it_value_c = it_value_l - org_fun(it_value_l)/der_fun(it_value_l);
             exa = abs(it_value_c - it_value_l);
             times = times + 1;
         end
         value = it_value_c;
end