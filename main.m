close all, clear all, clc
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

% Input parameters 
r = 0.3;

% Must be set here to enable multiple objects 
figure_handle = figure;
hold on

% Create masses in system
mass1 = create_mass(0, 0, 0.1, 0.1, 'bl', 'rectangle');
mass2 = create_mass(r*sin(1), -r*cos(1), 0.05, 0.05, 'y', 'ellipse');

% Connections;
connection1 = create_connection(mass1, mass2);

% Animation options
axis manual % Stop automatic axis size
axis equal
axis([-0.5 0.5 -0.5 0]) % Adjust as needed, to cover the desired area

% Run simulation
sim('pendulum')

% Animation loop
disp('Running simulation...')
for i = 1:length(sim_theta.Data)
    % Update positions
    mass2.absolute_position(r*sin(sim_theta.Data(i)), -r*cos(sim_theta.Data(i)))
    connection1.draw_line()
    % Update frame
    drawnow limitrate % Update rate 20 fps
    drawnow % Update plot with new positions
    pause(1/30)
end
disp('Simulation done')