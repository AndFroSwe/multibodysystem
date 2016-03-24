%% CREATE_MASS(pos_x, pos_y, mass_width, mass_heigth, color) creates a mass object 
% with center position pos_x and pos_y and color '[color]'. Returns a struct with properties
% and handle.
classdef create_mass
    properties 
        start_x
        start_y
        width
        height
        corners_x
        corners_y
        handle
    end
    methods
        function mass = create_mass(pos_x, pos_y, mass_width, mass_height, color)
            mass.start_x = pos_x;
            mass.start_y = pos_y;
            mass.width = mass_width;
            mass.height = mass_height;
            % Add current corner coordinates to struct
            [mass.corners_x, mass.corners_y] = edge_to_center(mass, pos_x, pos_y);
            % Draw object and create handle
            mass.handle = fill(mass.corners_x, mass.corners_y, color); 
        end
        function [] = absolute_position(mass, x, y)
            % Set coordinate vectors of object
            [mass.corners_x, mass.corners_y] = edge_to_center(mass, x, y);
            % Update object properties
            set(mass.handle, 'Vertices', [mass.corners_x(:),...
                                            mass.corners_y(:)]);
        end
        function [] = increment_position(mass, dx, dy)
            % Set coordinate vectors of object
            mass.corners_x = mass.corners_x + dx;
            mass.corners_y = mass.corners_y + dy;
            % Update object properties
            set(mass.handle, 'Vertices', [mass.corners_x(:),...
                                            mass.corners_y(:)])
        end

    end
end
