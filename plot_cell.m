function [] = plot_cell(location_cells)

full_index = size(location_cells);
No_dimension = numel(full_index);

if No_dimension == 3 % cancelled jade surface
    for k = 1:full_index(1)
        for h = 1:full_index(2)
            for g = 1:full_index(3)
                x = location_cells{k,h,g}(1);
                y = location_cells{k,h,g}(2);
                complex_location = x+j*y;
                plot(complex_location,'.','MarkerSize',8,'LineWidth',4),grid on, hold on;
            end
        end
    end
elseif No_dimension ==2 % original jade surface
   for k = 1:full_index(1)
        for h = 1:full_index(2)
            x = location_cells{k,h}(1);
            y = location_cells{k,h}(2);
            complex_location = x+j*y;
            plot(complex_location,'.','MarkerSize',8,'LineWidth',4),grid on, hold on;
        end
    end 
end