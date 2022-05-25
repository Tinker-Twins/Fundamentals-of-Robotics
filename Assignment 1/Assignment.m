%% MATLAB Programming & Simulation Attachment
% *Author:* Chinmay Vilas Samak (Student, B.Tech. Mechatronics Engineering, RA1711018010102)
% *Course:* Fundamentals of Robotics (15MH301)

%% 1. Homogenous Transformations

fprintf('-----------------------------------------------------------------\n');
fprintf('1. Homogenous Transformations\n');
fprintf('-----------------------------------------------------------------\n');

% Frame Definition & Transformations
A = trotx(0) % Definition of frame {A}

T1 = transl(3,2,1); % Translation along x,y,z axes by 3,2,1 units. Yields 4x4 homogeneous transformation matrix with zero rotation.
T2 = trotx(60); % Rotation along x-axis by 60 degrees. Yields 4x4 homogeneous transformation matrix with zero translation.

B1 = T1*T2 % Frame {B} case 1
B2 = T2*T1 % Frame {B} case 2

% Comparing the Transformations
if B1 == B2
    fprintf("Both Homogeneous Transformation Matrices Are Same.\n");
else
    fprintf("Both Homogeneous Transformation Matrices Are NOT Same.\n");
end

% Frame Visualization
Bounds = [-1 5 -1 3 -1 3.5]; % Axis bounds [xmin xmax ymin ymax zmin zmax]
figure('Name','Frame Visualization','NumberTitle','off','windowState','Maximized');
trplot(A, 'frame', 'A', 'axis', Bounds, 'rgb', 'arrow'); % Plot frame {A}
hold on;
tranimate(A, B1, 'frame', 'B_1', 'axis', Bounds, 'rgb', 'arrow'); % Animate frame {B} case 1
hold on;
tranimate(A, B2, 'frame', 'B_2', 'axis', Bounds, 'rgb', 'arrow'); % Animate frame {B} case 2
hold off;
%% 2. Forward Kinematic Model of KUKA KR5 Sixx R650 Manipulator

fprintf('-----------------------------------------------------------------\n');
fprintf('2. Forward Kinematic Model of KUKA KR5 Sixx R650 Manipulator\n');
fprintf('-----------------------------------------------------------------\n');

% Define DH Parameters
L(1) = Link([0 0.335 0.075 -pi/2]);
L(2) = Link([0 0 0.270 0]);
L(2).offset = -pi/2;
L(3) = Link([0 0 0.090 -pi/2]);
L(4) = Link([0 0.295 0 pi/2]);
L(5) = Link([0 0 0 -pi/2]);
L(6) = Link([0 0.080 0 0]);

% Define the Robot Objects
Robot = SerialLink(L, 'name', 'KUKA KR5 Sixx R650');
Animated_Robot = SerialLink(L, 'name', 'Animated KUKA KR5 Sixx R650'); % Define another robot object with different name because if the robot already exists then that same graphical model will be found and moved.

% Forward Kinematics
FKM = Robot.fkine([0 0 0 0 0 0]) % Forward Kinematic Model (FKM) for home position

% Robot Visualization
figure('NumberTitle', 'off', 'Name', 'Robot Visualization','windowState','Maximized');
Robot.plot([0 0 0 0 0 0]); % Home position

% Define Joint Angle Variables
th1 = 0;
th2 = 0;
th3 = 0;
th4 = 0;
th5 = 0;
th6 = 0;

% Robot Animation
figure('NumberTitle', 'off', 'Name', 'Robot Animation','windowState','Maximized');
for i = 0:0.05:pi/2
    th2 = i/2;
    th3 = i/2;
    Animated_Robot.plot([th1 th2 th3 th4 th5 th6]);
end
for i = pi/2:-0.05:0
    th2 = i/2;
    th3 = i/2;
    Animated_Robot.plot([th1 th2 th3 th4 th5 th6]);
end
for i = 0:0.05:pi
    th1 = i;
    th2 = i/4;
    th3 = i/4;
    th4 = i/2;
    th6 = -i/2;
    Animated_Robot.plot([th1 th2 th3 th4 th5 th6]);
end
%% 3. Kinematic Model of 1 DOF Beam Tilt Mechanism

fprintf('-----------------------------------------------------------------\n');
fprintf('3. Kinematic Model of 1 DOF Beam Tilt Mechanism\n');
fprintf('-----------------------------------------------------------------\n');

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