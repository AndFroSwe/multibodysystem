% DRAW_RECTANGLE (pos_x, pos_y, width, height) draws a rectangle with center
% coordinates pos_x and pos_y.
function [] = draw_rectangle(pos_x, pos_y, width, height)
% Define parameters
curv1 = 0.3;
curv2 = 0.3;

% Calculate center position
x_center = pos_x - width/2; % Move position to be center instead of bottom left corner
y_center = pos_y - height/2; % Move position to be center instead of bottom left corner

% Set input variables
x = x_center;
y = y_center;

% Draw
rectangle('position', [x, y, width, height], 'curvature', [curv1, curv2])
