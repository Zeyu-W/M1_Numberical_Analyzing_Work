function value = Newton_down_hill(int_value,exactness)
%USAGE: 'value' is the final iteration value
%       'int_value' is the initial value
%       'exactness' is the iteration termination accuracy
% Author: Zeyu Wang
% 04-Oct-2018 18:55:57 @ SUT
         syms x;
         lam = 1;
         org_fun = x*exp(1)^x - 1;%The original_equation 
         der_fun = diff(org_fun,1);
         der_fun = matlabFunction(der_fun);
         org_fun = matlabFunction(org_fun);
         it_value_l = int_value;
         it_value_c = it_value_l - lam*org_fun(it_value_l)/der_fun(it_value_l);
         while(~(abs(org_fun(it_value_c))<abs(org_fun(it_value_l))))
              lam = lam*0.5;
              it_value_c = it_value_l - lam*org_fun(it_value_l)/der_fun(it_value_l);
         end
         exa = abs(it_value_c - it_value_l);
         while(~(exa<exactness))
              lam = 1;
              it_value_l = it_value_c;
              it_value_c = it_value_l - lam*org_fun(it_value_l)/der_fun(it_value_l);
              while(~(abs(org_fun(it_value_c))<abs(org_fun(it_value_l))))
                   lam = lam*0.5;
                   it_value_c = it_value_l - lam*org_fun(it_value_l)/der_fun(it_value_l);
              end
              exa = abs(it_value_c - it_value_l);
         end
         value = it_value_c;
end