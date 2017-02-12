function [flatted_cell] = flating_location_cell(location_cell)

full_index = size(location_cell);
No_dimension = numel(full_index);

if No_dimension == 3 % cancelled jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    No_cancel = full_index(3);
    counter = 0;
    for k = 1:No_spot 
        for h = 1:No_angle
            for g = 1:No_cancel
                flatted_cell{counter +1} = location_cell{k,h,g};
                counter = counter + 1;
            end
        end
    end
elseif No_dimension ==2 % original jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    counter = 0;
    for k = 1:No_spot 
        for h = 1:No_angle
            flatted_cell{counter + 1} = location_cell{k,h};
            counter = counter + 1;
        end
    end
end