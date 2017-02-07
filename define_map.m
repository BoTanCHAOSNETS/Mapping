function [layout_grid] = define_map(x_range,y_range,resolution)

x_vector = [1 : resolution : x_range];
y_vector = [1 : resolution : y_range];

grid_size = numel(x_vector);
layout_grid = cell(grid_size);

initial_intensity = 0;
for k = 1:grid_size
    for h = 1:grid_size
        layout_grid{k,h} = [x_vector(k), x_vector(h), initial_intensity];
    end
end