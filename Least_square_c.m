function [error,a,b,c] = Least_square_c(order)
%USAGE: 'error' is the error in each degree
%       'varargout' is the polynomial coefficient(a+bx+cx^2+dx^3+cx^4 ...)
%       'order' is the polynomial order
% Author: Zeyu Wang
% 18-Oct-2018 14:50:36 @ SUT
%% ====Prepare the normal equation====
         load('D:\Wang_Zeyu\Documents\Academic_research\Script\Numberical_Analyzing\time_temp.mat');%load data
         time_temp_c = time_temp;
         time_temp_c(:,2) = log(time_temp(:,2));
         for i = 0:1:2*order
             S_raw(i+1) = sum(time_temp_c(:,1).^i);
         end
         for i = 1:1:order +1
             S(i,:)=S_raw(i:i+order);
         end
         for i = 0:1:order
             U(i+1) = sum(time_temp_c(:,2) .* (time_temp_c(:,1).^i));
         end
         U = U';
%% ====Solve equation & Plot====
         coef = S\U;
         b = -coef(3);
         c = coef(2)/(2*b);
         a = exp(coef(1) + b*c^2);
         syms x ;
         y = a*exp(-b*(x-c)^2);
         fun = matlabFunction(y);
         for i = 1:1:length(time_temp)
             e(i) = (fun(time_temp(i,1)) - time_temp(i,2))^2;
         end
         error = ['The error is: ',num2str(sum(e))];
         t = [time_temp(1,1):0.001:time_temp(end,1)];
         z = subs(y,x,t);
         plot(t,z)
         hold on 
         plot(time_temp(:,1),time_temp(:,2),'*')
         xlabel(error)
         hold on 
end



