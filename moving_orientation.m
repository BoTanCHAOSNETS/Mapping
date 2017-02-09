function [rotation_rad] = moving_orientation(spot_index)

slope_angle = atan(5/4);

if spot_index == 1
    rotation_rad = 0;
elseif spot_index == 2
    rotation_rad = 0;
elseif spot_index == 3
    rotation_rad = 0;
elseif spot_index == 4
    rotation_rad = 0;
elseif spot_index == 5
    rotation_rad = 0;
elseif spot_index == 6
    rotation_rad = 0;
elseif spot_index == 7
    rotation_rad = pi/2;
elseif spot_index == 8
    rotation_rad = pi/2;
elseif spot_index == 9
    rotation_rad = pi/2;
elseif spot_index == 10
    rotation_rad = pi/2;
elseif spot_index == 11
    rotation_rad = slope_angle;
elseif spot_index == 12
    rotation_rad = slope_angle;
elseif spot_index == 13
    rotation_rad = slope_angle;
elseif spot_index == 14
    rotation_rad = slope_angle;
elseif spot_index == 15
    rotation_rad = slope_angle;
elseif spot_index == 16
    rotation_rad = slope_angle;
end