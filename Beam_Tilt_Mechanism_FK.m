%% Kinematic Model of 1 DOF Beam Tilt Mechanism


% Tilt Angle
input = inputdlg('Enter Tilt Angle in Degrees: '); % User input for tilt angle in degrees
theta_degrees = str2double(input); % Convert string input to numerical value
theta = deg2rad(theta_degrees); % Convert degrees to radians
fprintf('Tilt Angle: %0.4f degrees\n', theta_degrees);

if (theta_degrees >= -45 && theta_degrees <= 45) % Mechanical constraint
    
    % Define Transformations
    B0_T_P = [cos(theta) -sin(theta) 0 5; sin(theta) cos(theta) 0 11; 0 0 1 0; 0 0 0 1];
    P_T_A0 = [1 0 0 -5; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    B0_T_A0 = B0_T_P * P_T_A0;

    % Coordinates of Points A0 and B0
    x_A0 = B0_T_A0(1,4);
    y_A0 = B0_T_A0(2,4);
    z_A0 = B0_T_A0(3,4);

    x_B0 = 0;
    y_B0 = 0;
    z_B0 = 0;

    % Compute the Actuator Lenghth
    l = sqrt((x_A0 - x_B0)^2 + (y_A0 - y_B0)^2 + (z_A0 - z_B0)^2); % Euclidian distance between points
    fprintf('Actuator Length: %0.4f units\n',l);

else
    fprintf('The mechanical constraint is not satisfied!\nPlease enter tilt angle in range of [-45,45] degrees.\n');

end