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
        vertex_x      % Vector with all four corners
        vertex_y      % Vector with all four corners
        shape         % Information of object shape
        handle        % Handle to patch object
    end
    methods
        % Constructor. Shape option is switched in 
        function obj = create_mass(pos_x, pos_y, mass_width, mass_height, color, shape)
            obj.start_x = pos_x;
            obj.start_y = pos_y;
            obj.x = pos_x;
            obj.y = pos_y;
            obj.width = mass_width;
            obj.height = mass_height;
            % Switch cases for different shapes
            obj.shape = shape;
            % RECTANGLE
            if strcmp(shape, 'rectangle')
                % Add current corner coordinates to struct
                [obj.vertex_x, obj.vertex_y] = edge_to_center(obj, pos_x, pos_y);
            % CIRCLE/ELLIPSOID
            elseif strcmp(shape, 'ellipse')
                resolution = 100; % Th enumber of points in circumferance
                a = mass_width; % Width along x-axis
                b = mass_height; % Height along y-axis
                obj.vertex_x = obj.x + a*cosd(linspace(0, 359, resolution));
                obj.vertex_y = obj.y + b*sind(linspace(0, 359, resolution));
            else
                error('Shape property not correct')
            end
            % Draw object and create handle
            obj.handle = patch(obj.vertex_x, obj.vertex_y, color); 
        end
        % Set absolute position of mass
        function absolute_position(obj, x, y)
            % Update object properties
            obj.x = x;
            obj.y = y;
            % RECTANGLE
            if strcmp(obj.shape, 'rectangle')
                % Set coordinate vectors of object
                [obj.vertex_x, obj.vertex_y] = edge_to_center(obj, x, y);
                set(obj.handle, 'Vertices', [obj.vertex_x(:),...
                                                obj.vertex_y(:)]);
            % ELLIPSE
            elseif strcmp(obj.shape, 'ellipse')
                resolution = 100; % The number of points in circumferance
                a = obj.width; % Width along x-axis
                b = obj.height; % Height along y-axis
                obj.vertex_x = obj.x + a*cosd(linspace(0, 359, resolution));
                obj.vertex_y = obj.y + b*sind(linspace(0, 359, resolution));
                set(obj.handle, 'Vertices', [obj.vertex_x(:),...
                                                obj.vertex_y(:)]);
            else
                error('Wrong shape in absolute_position')
            end
        end
        % Move object
        function increment_position(obj, dx, dy)
            % Set coordinate vectors of object
            obj.corners_x = obj.corners_x + dx;
            obj.corners_y = obj.corners_y + dy;
            obj.x = obj.x + dx;
            obj.y = obj.y + dy;
            % Update object properties
            set(obj.handle, 'Vertices', [obj.vertex_x(:),...
                                            obj.vertex_y(:)])
        end
    end
end
