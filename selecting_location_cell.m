function [selected_cell] = selecting_location_cell(location_cell,spot_range,angle_range,cancel_range)

full_index = size(location_cell);
No_dimension = numel(full_index);

if No_dimension == 3 % cancelled jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    No_cancel = full_index(3);
    counter = 0;
    for k = spot_range(1):spot_range(2) 
        for h = angle_range(1):angle_range(2)
            for g = cancel_range(1):cancel_range(2)
                selected_cell{counter+1} = location_cell{k,h,g};
                counter = counter + 1;
            end
        end
    end
elseif No_dimension ==2 % original jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    counter = 0;
    for k = 1:No_spot 
        for h = angle_range(1):angle_range(2)
            selected_cell{counter+1} = location_cell{k,h};
            counter = counter + 1;
        end
    end
end