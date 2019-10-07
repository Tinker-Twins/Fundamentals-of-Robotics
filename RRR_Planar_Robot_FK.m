%% 3R Planar Robot

L(1) = Link([0 0 1 0]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(2) = Link([0 0 1 0]);
L(3) = Link([0 0 1 0]);

Robot = SerialLink(L, 'name', '3-R Planar Robot') % Concatenate the links as a serial robot

FK_Home_Position = Robot.fkine([0 0 0]) % Compute the forward kinematics

figure('NumberTitle', 'off', 'Name', '3-R Planar Robot');
Robot.plot([pi/4 pi/4 pi/4]); % Visuaize the robot