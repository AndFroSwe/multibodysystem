close all, clear all, clc
%% Main program
% Draws a multibody sytem and animates the trajectories of the part of the
% system

% Input parameters 
r = 0.3;

% Must be set here to enable multiple objects 
figure_handle = figure
hold on

% Create masses in system
mass1 = create_mass(0, 0, 0.1, 0.1, 'bl');
mass2 = create_mass(r*sin(1), -r*cos(1), 0.05, 0.05, 'b');

% Connections
connection1 = create_connection(mass1, mass2);

% Animation options
axis([-0.5 0.5 -0.5 0]) % Adjust as needed, to cover the desired area
axis manual % Stop automatic axis size

sim('pendulum')

for i = 1:length(sim_theta.Data)
    % Update positions
    mass2.absolute_position(r*sin(sim_theta.Data(i)), -r*cos(sim_theta.Data(i)))
    connection1.draw_line()
    % Update frame
     % gif utilities
    set(gcf,'color','w'); % set figure background to white
    drawnow limitrate % Update rate 20 fps
    drawnow % Update plot with new positions
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    outfile = 'sinewave.gif';
     % On the first loop, create the file. In subsequent loops, append.
    if i==1
        imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf);
    else
        imwrite(imind,cm,outfile,'gif','DelayTime',0,'writemode','append');
    end
    pause(1/30)
end