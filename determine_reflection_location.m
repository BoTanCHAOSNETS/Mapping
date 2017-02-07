function [relative_location] = determine_reflection_location(jade_surface,spot_index,angle_index,cancel_index)

[r,c] = find(jade_surface == max(jade_surface(:)));

% convert JADE to x-y 
%

relative_location{k} = [x_position,y_position,spot_index,angle_index,cancel_index];

