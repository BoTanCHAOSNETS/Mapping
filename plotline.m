function [line] = plotline(angle)

x = [-5:0.1:5];

y = tan(degtorad(angle))*x;

line = plot(x,y);