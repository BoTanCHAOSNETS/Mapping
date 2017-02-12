function [weighted_grid]=cell_allocate(flatted_cell,layout_grid,x_vector,y_vector)

full_index = numel(flatted_cell);

for k = 1:full_index
% for k = 2526:2528
    x_rounded = round(flatted_cell{k}(1));
    y_rounded = round(flatted_cell{k}(2));
    
    x_index = find(x_vector == x_rounded)
    y_index = find(y_vector == y_rounded)
    
    temp_intensity = layout_grid{x_index,y_index}(3) + 1;
    layout_grid{x_index,y_index} = [x_index,y_index,temp_intensity];
    
    k
end

weighted_grid = layout_grid;