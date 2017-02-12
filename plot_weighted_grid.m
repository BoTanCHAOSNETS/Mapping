function [] = plot_weighted_grid(weighted_grid,x_vector,y_vector)

[x,y] = size(weighted_grid);

for k = 1:x
    for h = 1:y
        grid_2D(k,h) = weighted_grid{k,h}(3);
    end
end

grid_2D = flipud(grid_2D);
imagesc(x_vector,y_vector,grid_2D);