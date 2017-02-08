clear all;


%%%% Define the Map
% x_range : in
% y_range : in
% resolution : in
% layout_grid {3D cell [x,y,intensity]} : out  % intensity is initialized to 0
x_range = 10;
y_range = 10;
resolution = 0.5;
layout_grid = define_map(x_range,y_range,resolution);


%%%% Determine the Reflection Spot
% 16 spots, 24 angles on each spot, each angle cancel 8 layers, 16*24*8 = 3072 JADEs
% This part calculates reflection location of each JADE suface 

% Here: I need to load jade surface first, also need 
% jade_surface (2D matrix) : in
% spot_index : in
% angle_index : in
% cancel_index : in
% relattive_location {1D Cell, [x,y,spot,angle,cancel]}: out % use Rx array position as origine 
No_spot = 16;
No_angle = 24;
No_cancel = 8;
measure_numbers = No_spot * No_angle * No_cancel;
relative_location = cell(No_spot,No_angle,No_cancel);
relative_location_orginal = cell(No_spot,No_angle);
code_path = 'C:\Users\ac5162\Documents\MATLAB\Mapping';
% cancelled JADEs
% for k = 1:No_spot
%     for h = 1:No_angle
%         for g = 1:No_cancel
%             jade_file_path = strcat('C:\Users\ac5162\Documents\MATLAB\auto_cancel_test_log\',num2str(k));
%             jade_file_name = strcat('Cancelled 0_0_',num2str(h),'_',num2str(g-1),'.txt');
%             cd(jade_file_path);
%             jade_surface = textread(jade_file_name);
%             jade_surface = jade_surface';
%             jade_surface = jade_surface([1:35],:);
%             cd(code_path);
%             relative_location{k,h,g} = determine_reflection_location(jade_surface,k,h,g);  
%             [k,h,g]
%         end
%     end
% end

% Original JADEs
for k = 1:No_spot
    for h = 1:No_angle
        jade_file_path = strcat('C:\Users\ac5162\Documents\MATLAB\auto_cancel_test_log\',num2str(k));
        jade_file_name = strcat('Original 0_0_',num2str(h),'.txt');
        cd(jade_file_path);
        jade_surface = textread(jade_file_name);
        jade_surface = jade_surface';
        jade_surface = jade_surface([1:35],:);
        imagesc(jade_surface);
        cd(code_path);
        relative_location_orginal{k,h} = determine_reflection_location(jade_surface,k,h,0);
        [k,h]
    end
end


%%%% Moving Shift vector
% x-y coordination shift of each measurement spot
% orientation of each measurement spot
% need to think about how to synthesis the orientation information to each JADE surface


%%%% Synthesis Information
% extend the moving shift vector to 3072 size
% synthesis the map