function [value,times] = Simplify_Newtons(int_value,exactness)
%USAGE: 'value' is the final iteration value
%       'times' is the times of iterations
%       'int_value' is the initial value
%       'exactness' is the iteration termination accuracy
% Author: Zeyu Wang
% 04-Oct-2018 18:49:57 @ SUT
         syms x;
         org_fun = x*exp(1)^x - 1;%The original_equation 
         der_fun = diff(org_fun,1);
         der_fun = matlabFunction(der_fun);
         org_fun = matlabFunction(org_fun);
         it_value_l = int_value;
         M = der_fun(int_value);
         it_value_c = it_value_l - org_fun(it_value_l)/M;
         exa = abs(it_value_c - it_value_l);
         times = 1;
         while(~(exa<exactness))
             it_value_l = it_value_c;
             it_value_c = it_value_l - org_fun(it_value_l)/M;
             exa = abs(it_value_c - it_value_l);
             times = times + 1;
         end
         value = it_value_c;
end