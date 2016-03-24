%% SET_OBJECT_POSITION (object, x, y) sets object absolute position.
function [] = set_object_position (object, x, y)

% Set coordinate vectors of object
[object.corners_x, object.corners_y] = edge_to_center(object, x, y);
% Update object properties
set(object.handle, 'Vertices', [object.corners_x(:),...
                                object.corners_y(:)]);
