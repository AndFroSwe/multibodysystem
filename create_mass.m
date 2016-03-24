%% CREATE_MASS(pos_x, pos_y, mass_width, mass_heigth, color) creates a mass object 
% with center position pos_x and pos_y and color '[color]'. Returns a struct with properties
% and handle.
function mass = create_mass (pos_x, pos_y, mass_width, mass_height, color)

% Create empty mass object
mass = struct();
% Fill object with properties
mass.start_x = pos_x;
mass.start_y = pos_y;
mass.width = mass_width;
mass.height = mass_height;
% Add corner coordinates to struct
% Bottom left
bl_x = pos_x-mass.width/2;
bl_y = pos_y-mass.height/2;
% Top left
tl_x = pos_x-mass.width/2;
tl_y = pos_y+mass.height/2;
% Top right
tr_x = pos_x+mass.width/2;
tr_y = pos_y+mass.height/2;
% Bottom right
br_x = pos_x+mass.width/2;
br_y = pos_y-mass.height/2;
mass.corners_x = [bl_x, tl_x, tr_x, br_x];
mass.corners_y = [bl_y, tl_y, tr_y, br_y];

% Draw object and create handle
mass.handle = fill(mass.corners_x, mass.corners_y, color); 
