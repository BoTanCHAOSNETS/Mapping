function [layout_grid,x_vector,y_vector] = define_map(x_range,y_range,resolution)

x_vector = [x_range(1) : resolution : x_range(2)];
y_vector = [y_range(1) : resolution : y_range(2)];

x_centre = x_vector + 0.25;
y_centre = y_vector + 0.25;


grid_size_x = numel(x_vector);
grid_size_y = numel(y_vector);
layout_grid = cell(grid_size_x,grid_size_y);

initial_intensity = 0;
for k = 1:grid_size_x
    for h = 1:grid_size_y
        layout_grid{k,h} = [x_vector(k), y_vector(h), x_centre(k), y_centre(h), initial_intensity];
    end
end