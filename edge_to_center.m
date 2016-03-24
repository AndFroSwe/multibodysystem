% EDGE_TO_CENTER (object, x, y) moves center coordinates of an object to
% edge coordinates. Returns coordinate vectors.

function [corners_x, corners_y] = edge_to_center (object, x, y)

% Calculate coordinates
% Bottom left
bl_x = x - object.width/2;
bl_y = y - object.height/2;
% Top left
tl_x = x - object.width/2;
tl_y = y + object.height/2;
% Top right
tr_x = x + object.width/2;
tr_y = y + object.height/2;
% Bottom right
br_x = x + object.width/2;
br_y = y - object.height/2;

% Create coordinate vectors
corners_x = [bl_x, tl_x, tr_x, br_x];
corners_y = [bl_y, tl_y, tr_y, br_y];