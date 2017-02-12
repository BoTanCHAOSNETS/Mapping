function [x_shift,y_shift] = moving_vector(spot_index)

slope_angle = atan(5/4);

if spot_index == 1
    x_shift = 0;
    y_shift = 0;
elseif spot_index == 2
    x_shift = 0.5;
    y_shift = 0;
elseif spot_index == 3
    x_shift = 1.0;
    y_shift = 0;
elseif spot_index == 4
    x_shift = 1.5;
    y_shift = 0;
elseif spot_index == 5
    x_shift = 2;
    y_shift = 0;
elseif spot_index == 6
    x_shift = 2.5;
    y_shift = 0;
elseif spot_index == 7
    x_shift = 2.5;
    y_shift = -0.5;
elseif spot_index == 8
    x_shift = 2.5;
    y_shift = -1.0;
elseif spot_index == 9
    x_shift = 2.5;
    y_shift = -1.5;
elseif spot_index == 10
    x_shift = 2.5;
    y_shift = -2.0;
elseif spot_index == 11
    x_shift = -0.5*cos(slope_angle);
    y_shift = -0.5*sin(slope_angle);
elseif spot_index == 12
    x_shift = -1*cos(slope_angle);
    y_shift = -1*sin(slope_angle);
elseif spot_index == 13
    x_shift = -1.5*cos(slope_angle);
    y_shift = -1.5*sin(slope_angle);
elseif spot_index == 14
    x_shift = -2*cos(slope_angle);
    y_shift = -2*sin(slope_angle);
elseif spot_index == 15
    x_shift = -2.5*cos(slope_angle);
    y_shift = -2.5*sin(slope_angle);
elseif spot_index == 16
    x_shift = -3*cos(slope_angle);
    y_shift = -3*sin(slope_angle);
end




