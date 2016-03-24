% DRAW_RECTANGLE (pos_x, pos_y, width, height) draws a rectangle with center
% coordinates pos_x and pos_y.
function [] = draw_rectangle(pos_x, pos_y, width, height)

% Shape parameters
rect_linewidth = 2;
rect_color = 'b'; 

% Calculate Corner positions
% Bottom left corner
x_b_left = pos_x - width/2; 
y_b_left = pos_y - height/2;
% Top left corner
x_t_left = pos_x - width/2;
y_t_left = pos_y + height/2;
% Top right corner
x_t_right = pos_x + width/2; 
y_t_right = pos_y + height/2;
% Bottom right corner
x_b_right = pos_x + width/2; 
y_b_right = pos_y - height/2;

% Draw rectangle
% Bottom left to top left
plot([x_b_left, x_t_left],...
    [y_b_left, y_t_left],...
    rect_color,...
    'Linewidth', rect_linewidth)
% Top left to top right
plot([x_t_left, x_t_right],...
    [y_t_left, y_t_right],...
    rect_color,...
    'Linewidth', rect_linewidth)
% Top right to bottom right
plot([x_t_right, x_b_right],...
    [y_t_right, y_b_right],...
    rect_color,...
    'Linewidth', rect_linewidth)
% Bottom right to bottom left
plot([x_b_right, x_b_left],...
    [y_b_right, y_b_left],...
    rect_color,...
    'Linewidth', rect_linewidth)

    
    