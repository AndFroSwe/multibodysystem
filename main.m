close all, clear all, clc
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

% Create masses in system


% Animation
% Set these parameters
fps = 60; % Number of frames pre second in animation
% Calculated parameters
pause_time = fps^-1;

%% Draw system
figure
for x = 1:100
    hold off
    draw_rectangle(x, 1, 2, 2)
    hold off
    axis([0 110 -10 10])
    pause(pause_time)
end

