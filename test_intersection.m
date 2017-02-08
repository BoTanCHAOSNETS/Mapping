function [x,y] = test_intersection(travel_distance,angle)

% draw 1st circle at (0,0) radius 5 and get X and Y data

a=travel_distance/2;
b=sqrt((travel_distance/2)^2-0.35^2);
H1=plotEllipse(a,b,[0.35,0]);
X1=get(H1,'XData');
Y1=get(H1,'YData');

% draw 2nd circle at (2,5) radius 3 and get X and Y data
H2=plotline(angle);
X2=get(H2,'XData');
Y2=get(H2,'YData');

% find intersection points
[x_mid,y_mid]=intersections(X1,Y1,X2,Y2,0);
x = x_mid(2);
y = y_mid(2);
% and plot them as red o's
plot(x,y,'ro')
hold off
axis equal