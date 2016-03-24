%% CREATE_CONNECTION(pos_x, pos_y, mass_width, mass_heigth, color) creates 
% a connecting line anchored to 2 objects.
classdef create_connection < handle
    properties 
        anchor_1
        anchor_2
        handle
    end
    methods
        % Constructor
        function obj = create_connection(first, second)
            obj.anchor_1 = first;
            obj.anchor_2 = second;
            obj.handle = patch([obj.anchor_1.x obj.anchor_2.x],...
                               [obj.anchor_1.y obj.anchor_2.y],...
                               'bl');
        end
        % Draw line updates the line. Must be run after anchor objects have
        % been updated with new positions.
        function draw_line(obj)
            set(obj.handle, 'Vertices', [obj.anchor_1.x obj.anchor_1.y;...
                                         obj.anchor_2.x obj.anchor_2.y]);
        end
    end
end
