function [int_value,I] = Romberg(on,off)
%USAGE: 'int_value' is the integral value
%       'on' and 'off'are the integral interval
%       'I' is the Romberg table 
% Author: Zeyu Wang
% 23-Oct-2018 22:41:45 @ SUT
tic
syms x;
org_fun = ((10/x)^2)*sin(10/x);%interand function
org_fun = matlabFunction(org_fun);
block = 1;
count = 1;
e = 1;
while(~(e<=10^(-4)))
    block = 2*block;
    ser = linspace(on,off,block);
    h = (off-on)/(block-1);
    for i = 1:1:length(ser)
        fun_value(i) = org_fun(ser(i));
    end
    for i =1:1:i-1
        elem(i) = (h/2)*(fun_value(i)+fun_value(i+1));
    end
    I(count,1) = sum(elem);
    if count>1
        for i = 1:1:(count - 1)
            I(count,i+1) = 1/((4^i)-1)*((4^i)*I(count,i)-I(count-1,i));
        end
        e = abs(I(count,end)-I(count,end-1));
    end
    int_value = I(count,end);
    count = count + 1;
end
toc
end