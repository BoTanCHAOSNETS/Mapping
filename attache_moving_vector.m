function [absolute_location] = attache_moving_vector(relative_location)

full_index = size(relative_location);
No_dimension = numel(full_index);

if No_dimension == 3 % cancelled jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    No_cancel = full_index(3);
    for k = 1:No_spot 
        [x_shift,y_shift] = moving_vector(k);
        for h = 1:No_angle
            for g = 1:No_cancel
                relative_location{k,h,g} = relative_location{k,h,g} + [x_shift,y_shift,0,0,0];
            end
        end
    end
elseif No_dimension ==2 % original jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    for k = 1:No_spot 
        [x_shift,y_shift] = moving_vector(k);
        for h = 1:No_angle
            relative_location{k,h} = relative_location{k,h} + [x_shift,y_shift,0,0,0];
        end
    end
end

absolute_location = relative_location;
