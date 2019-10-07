%% R-P Planar Robot

L(1) = Link([0 0 0 pi/2]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(2) = Link([0 0 0 0 1]);  % Second '0' doesn't mean 0. MATLAB takes it in as a a variable 'd' because 5th term is 1, which defines a prismatic joint.
L(2).qlim = [0, 1]; % Limits for prismatic joint.

Robot = SerialLink(L, 'name', 'R-P Planar Robot') % Concatenate the links as a serial robot

FK_Home_Position = Robot.fkine([0 0]) % Compute the forward kinematics

figure('NumberTitle', 'off', 'Name', 'R-P Planar Robot');
Robot.plot([pi/4 0.5]); % Visuaize the robot