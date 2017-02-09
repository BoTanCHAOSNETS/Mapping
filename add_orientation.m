function [oriented_location] = add_orientation(relative_location)

full_index = size(relative_location);
No_dimension = size(full_index);

if No_dimension == 3 % cancelled jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    No_cancel = full_index(3);
    for k = 1:No_spot 
        rotation_rad = moving_orientation(k);
        for h = 1:No_angle
            for g = 1:No_cancel
                location_mid = relative_location{k,h,g}; 
                x_mid = location_mid(1);
                y_mid = location_mid(2);
                complex_mid = x_mid + j*y_mid;
                angle_mid = angle(complex_mid) + rotation_rad;
                abs_mid = abs(complex_mid);
                complex_mid = abs_mid * exp(-j*2*pi*angle_mid);
                x_mid = real(complex_mid);
                y_mid = imag(complex_mid);
                relative_location{k,h,g} = [x_mid,y_mid,k,h,g];
            end
        end
    end
elseif No_dimension ==2 % original jade surface
    No_spot = full_index(1);
    No_angle = full_index(2);
    for k = 1:No_spot 
        rotation_rad = moving_orientation(k);
        for h = 1:No_angle
            location_mid = relative_location{k,h}; 
            x_mid = location_mid(1);
            y_mid = location_mid(2);
            complex_mid = x_mid + j*y_mid;
            angle_mid = angle(complex_mid) + rotation_rad;
            abs_mid = abs(complex_mid);
            complex_mid = abs_mid * exp(-j*2*pi*angle_mid);
            x_mid = real(complex_mid);
            y_mid = imag(complex_mid);
            relative_location{k,h} = [x_mid,y_mid,k,h];
        end
    end
end

oriented_location = relative_location;







