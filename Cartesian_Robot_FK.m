%% Cartesian Robot

L(1) = Link([0 0 0 -pi/2 1]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(1).qlim = [0, 1];
L(2) = Link([-pi/2 0 0 -pi/2 1]);
L(2).qlim = [0, 1];
L(3) = Link([0 0 0 0 1]);
L(3).qlim = [0, 1];

Robot = SerialLink(L, 'name', 'Cartesian Robot') % Concatenate the links as a serial robot

FK_Home_Position = Robot.fkine([0 0 0]) % Compute the forward kinematics

figure('NumberTitle', 'off', 'Name', 'Cartesian Robot');
Robot.plot([0.5 0.5 0.5]); % Visuaize the robot