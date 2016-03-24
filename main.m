close all, clear all, clc
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

% Input parameters 
pos_x = 4;
pos_y = 4;
mass_width = 6;
mass_heigth = 6;

% Create masses in system
mass1 = create_mass(pos_x, pos_y, mass_width, mass_heigth, 'r')
mass2 = create_mass(pos_x+4, pos_y+4, mass_width, mass_heigth, 'b')

axis([-60 60 -60 60]) %// adjust as needed, to cover the desired area
axis manual %// same scale in both axes
for t = linspace(0,40,500)
    set_object_position(mass1, t, t)
    set_object_position(mass2, -t, -t)
    
    % Update frame
    drawnow limitrate % Update rate 20 fps
    drawnow % Update plot with new positions
end