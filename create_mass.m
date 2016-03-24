%% CREATE_MASS(pos_x, pos_y, mass_width, mass_heigth, color) creates a mass object 
% with center position pos_x and pos_y and color '[color]'. Returns a struct with properties
% and handle.
function mass = create_mass (pos_x, pos_y, mass_width, mass_height, color)

% Create empty mass object
mass = struct();
% Fill object with properties
mass.start_x = pos_x;
mass.start_y = pos_y;
mass.x = pos_x; % Current position
mass.y = pos_y; % Current position
mass.width = mass_width;
mass.height = mass_height;
% Add corner coordinates to struct
[mass.corners_x, mass.corners_y] = edge_to_center(mass, pos_x, pos_y);

% Draw object and create handle
mass.handle = fill(mass.corners_x, mass.corners_y, color); 
