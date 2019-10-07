%% Forward Kinematic Model of KUKA KR5 Sixx R650 Manipulator

% Define DH Parameters
L(1) = Link([0 0.335 0.075 -pi/2]);
L(2) = Link([0 0 0.270 0]);
L(2).offset = -pi/2;
L(3) = Link([0 0 0.090 -pi/2]);
L(4) = Link([0 0.295 0 pi/2]);
L(5) = Link([0 0 0 -pi/2]);
L(6) = Link([0 0.080 0 0]);

% Define the Robot Objects
Robot = SerialLink(L, 'name', 'KUKA KR5 Sixx R650')
Animated_Robot = SerialLink(L, 'name', 'Animated KUKA KR5 Sixx R650'); % Define another robot object with different name because if the robot already exists then that same graphical model will be found and moved.

% Forward Kinematics
FK_Home_Position = Robot.fkine([0 0 0 0 0 0]) % Forward Kinematic Model (FKM) for home position

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