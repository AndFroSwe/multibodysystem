%% CREATE_MASS(pos_x, pos_y, mass_width, mass_heigth, color) creates a mass object 
% with center position pos_x and pos_y and color '[color]'. Returns a struct with properties
% and handle.
classdef create_mass < handle
    properties 
        start_x       % Starting position
        start_y       % Starting position
        width         % Width of object
        height        % Height of object
        x             % Current position
        y             % Current position
        corners_x     % Vector with all four corners
        corners_y     % Vector with all four corners
        handle        % Handle to patch object
    end
    methods
        % Constructor
        function obj = create_mass(pos_x, pos_y, mass_width, mass_height, color)
            obj.start_x = pos_x;
            obj.start_y = pos_y;
            obj.x = pos_x;
            obj.y = pos_y;
            obj.width = mass_width;
            obj.height = mass_height;
            % Add current corner coordinates to struct
            [obj.corners_x, obj.corners_y] = edge_to_center(obj, pos_x, pos_y);
            % Draw object and create handle
            obj.handle = fill(obj.corners_x, obj.corners_y, color); 
        end
        % Set absolute position of mass
        function absolute_position(mass, x, y)
            % Set coordinate vectors of object
            [mass.corners_x, mass.corners_y] = edge_to_center(mass, x, y);
            % Update object properties
            mass.x = x;
            mass.y = y;
            set(mass.handle, 'Vertices', [mass.corners_x(:),...
                                            mass.corners_y(:)]);
        end
        % Move object
        function increment_position(obj, dx, dy)
            % Set coordinate vectors of object
            obj.corners_x = obj.corners_x + dx;
            obj.corners_y = obj.corners_y + dy;
            obj.x = obj.x + dx;
            obj.y = obj.y + dy;
            % Update object properties
            set(obj.handle, 'Vertices', [obj.corners_x(:),...
                                            obj.corners_y(:)])
        end
    end
end
