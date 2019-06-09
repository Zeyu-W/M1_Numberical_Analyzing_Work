function [error,varargout] = Least_square(order)
%USAGE: 'error' is the error in each degree
%       'varargout' is the polynomial coefficient(a+bx+cx^2+dx^3+cx^4 ...)
%       'order' is the polynomial order
% Author: Zeyu Wang
% 17-Oct-2018 22:43:46 @ SUT
%% ====Prepare the normal equation====
         load('D:\Wang_Zeyu\Documents\Academic_research\Script\Numberical_Analyzing\time_temp.mat');%load data
         for i = 0:1:2*order
             S_raw(i+1) = sum(time_temp(:,1).^i);
         end
         for i = 1:1:order +1
             S(i,:)=S_raw(i:i+order);
         end
         for i = 0:1:order
             U(i+1) = sum(time_temp(:,2) .* (time_temp(:,1).^i));
         end
         U = U';
%% ====Solve equation & Plot====
         coef = S\U;
         for i = 1:length(coef)
             varargout{i} = coef(i);
         end
         syms x ;
         y = 0;
         for i = 1:1:order + 1
             y = y + coef(i)*x^(i-1);
         end
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



