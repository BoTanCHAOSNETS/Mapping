function [line] = plotline(angle)

x = [-10:0.1:10];

y = tan(degtorad(angle))*x;

line = plot(x,y);