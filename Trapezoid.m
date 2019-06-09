function int_value = Trapezoid(on,off)
%USAGE: 'int_value' is the integral value
%       'on' and 'off'are the integral interval
% Author: Zeyu Wang
% 23-Oct-2018 21:21:35 @ SUT
tic
syms x;
org_fun = ((10/x)^2)*sin(10/x);%interand function
org_fun = matlabFunction(org_fun);
block = 1;
inte_old = 0;
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
    int_value = sum(elem);
    e = abs(int_value - inte_old);
    inte_old = int_value;
end
toc
end