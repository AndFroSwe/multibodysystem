%% MOVE_OBJECT (object, dx, dy) moves object dx and dy units.
function [] = move_object (object, dx, dy)

% Set coordinate vectors of object
object.corners_x = object.corners_x + dx;
object.corners_y = object.corners_y + dy;
% Update object properties
set(object.handle, 'Vertices', [object.corners_x(:),...
                                object.corners_y(:)])
