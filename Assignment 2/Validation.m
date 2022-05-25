%% 2R Planar Robot

L(1) = Link([0 0 20 0]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(2) = Link([0 0 20 0]);

Robot = SerialLink(L, 'name', '2-R Planar Robot') % Concatenate the links as a serial robot

FK_Home_Position = Robot.fkine([0 0]) % Compute the forward kinematics

% Define Joint Angle Variables
th1 = deg2rad([59.28 56.645 49.494 38.957 26.16 12.235 -1.69 -14.486 -25.024 -32.175 -34.81]);
th2 = deg2rad([159.636 159.636 159.636 159.636 159.636 159.636 159.636 159.636 159.636 159.636 159.636]);

figure('NumberTitle', 'off', 'Name', '2-R Planar Robot');
for i=1:11
    Robot.plot([th1(i) th2(i)]); % Visuaize the robot
    %pause(0.1); % delay in seconds
end