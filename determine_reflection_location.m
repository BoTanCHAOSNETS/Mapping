function [relative_location] = determine_reflection_location(jade_surface,spot_index,angle_index,cancel_index)

[delay_grid,AoA_angle] = find(jade_surface == max(jade_surface(:)));
delay_grid = max(delay_grid); % in case JADE surface have multiple max points
AoA_angle = mean(AoA_angle); % in case JADE surface have multiple max points

% convert JADE to x-y
delay_grid_offset = 5; % delay grid offset
if delay_grid >= 5
    delay_grid = delay_grid - delay_grid_offset;
else 
    delay_grid = 0;
end
delay_time = delay_grid * 2.5 * 10^(-9); % delay grid to time
delay_distance = delay_time * 3 * 10^(8); % delay time to distance

AoA_rad = deg2rad(AoA_angle); % AoA angle to rad
array_offset = deg2rad(22.5); % array angle offset
AoA_rad = AoA_rad + array_offset; % corrected array placement bias

% ellipse (using delya_distnace)
% line (using AoA_rad)
% get the cross point (x_position, y_position)
if delay_distance > 0 
    [x_position,y_position] = test_intersection(delay_distance,rad2deg(AoA_rad));
else
     x_position = 0;
     y_position = 0;
end

relative_location = [x_position,y_position,spot_index,angle_index,cancel_index];

