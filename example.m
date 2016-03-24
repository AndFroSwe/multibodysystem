%% Animation example
close all, clear all, clc

origin_x = [9.5 9.5 11.5 11.5 ]; %// initial coordinates of vertices
origin_y = [12.6 14.6 14.6 12.6];
destination_x = origin_x + 3; %// final coordinates of vertices
destination_y = origin_y + 2;
n_steps = 500; %// number of "frames"
t_pause = .03; %// seconds between frames

h = fill(origin_x, origin_y, 'r'); %// create object at initial position
axis([8 16 10 18]) %// adjust as needed, to cover the desired area
axis equal %// same scale in both axes
axis manual %// prevent axes from auto-scaling
for t = linspace(0,1,n_steps)
    x = (1-t)*origin_x + t*destination_x; %// update x
    y = (1-t)*origin_y + t*destination_y; %// update y
    set(h, 'Vertices', [x(:) y(:)]) %// change object's position
    %pause(t_pause) %// a pause is needed to make movement slower
    drawnow %// probably not needed after pause. Just in case
end