function [] = plot_flatted_cell(flatted_cell)

full_index = numel(flatted_cell);

for k = 1:full_index
    x = flatted_cell{k}(1);
    y = flatted_cell{k}(2);
    complex_location = x+j*y;
    plot(complex_location,'.','MarkerSize',8,'LineWidth',4),grid on, hold on;
end