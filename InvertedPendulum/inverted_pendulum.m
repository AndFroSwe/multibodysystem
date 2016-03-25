close all, clear all, clc
addpath('../Utils')
% Dont edit: Must be set here to enable multiple objects 
figure_handle = figure;
hold on
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

%%%%%%% Input parameters %%%%%%%%%%%
M = 0.5; % Mass of big cart [kg]
m = 0.2; % Mass of pendulum [kg]
b = 0.1; % Linear friction coefficient translation [N/m/s]
d = 0.2; % Linear friction coefficient rotation 
l = 0.3; % Length of pendulum [m]
F1 = 0;  % Force applied to cart [N]
F2 = 0; % Force applied to pendulum [N]
F1_time = 0; % Time for step
F2_time = 0; % Time for step
theta_init = 0.1; % Initial displacement from equilibrium [rad]
g = 9.82; % Gravity acceleration [m/s^2]

%%% Run simulation %%%
simtime = 10;
sim('InvertedPendulum.slx')
theta = sim_theta.Data;
x = sim_x.Data;

%%% Animation window options %%%
xmax = 1;     
xmin = -1;
ymax = 0.5;
ymin = -0.5;
fps = 30;   % Animation frames per second
animation_iteration = 1:length(theta);          % Length of iteration
% Animation options
% Dont edit
axis manual % Stop automatic axis size
axis equal
axis([xmin xmax ymin ymax]) % Adjust as needed, to cover the desired area

%%% Create masses in system %%%
cart = create_mass(0, 0, 0.1, 0.1, 'b', 'rectangle');
pendulum = create_mass(l*cos(theta_init), l*sin(theta_init),...
                        0.05, 0.05, 'y', 'ellipse')

%%% Connections %%%
shaft = create_connection(cart, pendulum);




%%%%%%% End of user input %%%%%%%%%


%%%%%%% Animation loop %%%%%%%
disp('Running simulation...')
for i = 1:length(animation_iteration)
    % Insert animation here %
    cart.absolute_position(x(i), 0);
    pendulum.absolute_position(x(i)+l*cos(theta(i)+pi/2), l*sin(theta(i)+pi/2))
    shaft.draw_line()
    %%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Update frame
    drawnow limitrate % Update rate 20 fps
    drawnow % Update plot with new positions
    pause(fps^-1)
end
disp('Simulation done')