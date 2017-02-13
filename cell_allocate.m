function [weighted_grid]=cell_allocate(flatted_cell,layout_grid,x_vector,y_vector)

full_index = numel(flatted_cell);

for k = 1:full_index
    x_mid = flatted_cell{k}(1);
    y_mid = flatted_cell{k}(2);
    
    for h = 1:numel(x_vector)
        for g = 1:numel(y_vector)
            compare_matrix(h,g) = (x_mid - layout_grid{h,g}(3))^2 + (y_mid - layout_grid{h,g}(4))^2;
        end
    end
    
    [num,idx] = min(compare_matrix(:));
    [y_index, x_index] = ind2sub(size(compare_matrix),idx); % Please pay atttention of x y order
    
    temp_intensity = layout_grid{x_index,y_index}(5) + 1;
    layout_grid{x_index,y_index} = [x_index,y_index,layout_grid{x_index,y_index}(3),layout_grid{x_index,y_index}(4),temp_intensity];
    k
end

weighted_grid = layout_grid;