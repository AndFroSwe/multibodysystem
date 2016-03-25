close all, clear all, clc
addpath('../Utils')
% Dont edit: Must be set here to enable multiple objects 
figure_handle = figure;
hold on
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

%%%%%%% Input parameters %%%%%%%%%%%

%%% Create masses in system %%%

%%% Connections %%%

%%% Run simulation %%%

%%% Animation window options %%%
xmax = 0.5;     
xmin = -0.5;
ymax = 0;
ymin = -0.5;
fps = 30;   % Animation frames per second
animation_iteration = 100;          % Length of iteration

%%%%%%% End of user input %%%%%%%%%

% Animation options
% Dont edit
axis manual % Stop automatic axis size
axis equal
axis([xmin xmax ymin ymax]) % Adjust as needed, to cover the desired area

%%%%%%% Animation loop %%%%%%%
disp('Running simulation...')
for i = 1:length(animation_iteration)
    % Insert animation here %
    
    %%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Update frame
    drawnow limitrate % Update rate 20 fps
    drawnow % Update plot with new positions
    pause(fps^-1)
end
disp('Simulation done')