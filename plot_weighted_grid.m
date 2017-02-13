function [] = plot_weighted_grid(weighted_grid,x_vector,y_vector)

[x,y] = size(weighted_grid);

for k = 1:x
    for h = 1:y
        grid_2D(k,h) = weighted_grid{k,h}(5); % need to notice here: which element is the intensity value
    end
end

grid_2D = flipud(grid_2D);
imagesc((x_vector+2)*1.2,(y_vector+3.5)*0.8,grid_2D);