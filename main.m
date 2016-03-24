close all, clear all, clc
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

% Input parameters 
pos_x = 4;
pos_y = 4;
mass_width = 6;
mass_heigth = 6;

% Must be set here to enable multiple objects 
figure_handle = figure
hold on

% Create masses in system
mass1 = create_mass(pos_x, pos_y, mass_width, mass_heigth, 'r');
mass2 = create_mass(pos_x+10, pos_y+10, mass_width, mass_heigth, 'b');

% Connections
connect1 = fill([mass1.x mass2.x],[ mass1.y mass2.y], 'r')
% Animation options
axis([-60 60 -60 60]) % Adjust as needed, to cover the desired area
axis manual % Stop automatic axis size

for t = linspace(0,40,500)
    % Update positions
    mass1.absolute_position(t, t)
    mass2.absolute_position(-t, -t)
    set(connect1, 'Vertices', [mass1.x mass2.x; mass1.y mass2.y]);
    % Update frame
    drawnow limitrate % Update rate 20 fps
    drawnow % Update plot with new positions
end