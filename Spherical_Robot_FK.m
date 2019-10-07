%% Spherical Robot

L(1) = Link([0 0.25 0 -pi/2]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(2) = Link([0 0.25 0 pi/2]);
L(3) = Link([0 0 0 0 1]);  % Second '0' doesn't mean 0. MATLAB takes it in as a a variable 'd' because 5th term is 1, which defines a prismatic joint.
L(3).qlim = [0, 1];

Robot = SerialLink(L, 'name', 'Spherical Robot')

FK_Home_Position = Robot.fkine([0 0 0])

figure('NumberTitle', 'off', 'Name', 'Spherical Robot');
Robot.plot([pi/4 pi/4 0.75]);
