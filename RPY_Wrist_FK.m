%% R-P-Y Wrist

L(1) = Link([0 0.1 0 -pi/2]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(2) = Link([0 0.1 0 -pi/2]);
L(2).offset = -pi/2; % Offset for the joint variable
L(3) = Link([0 0 0 0]);

Robot = SerialLink(L, 'name', 'R-P-Y Wrist') % Concatenate the links as a serial robot

FK_Home_Position = Robot.fkine([0 0 0]) % Compute the forward kinematics

figure('NumberTitle', 'off', 'Name', 'R-P-Y Wrist');
Robot.plot([0 0 0]); % Visuaize the robot